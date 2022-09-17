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

  ( :method MAKE-15CRATE-VERIFY
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
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-16CRATE-VERIFY
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
      ?c15 - SURFACE
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392777 - SURFACE
      ?auto_2392778 - SURFACE
    )
    :vars
    (
      ?auto_2392779 - HOIST
      ?auto_2392780 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392779 ?auto_2392780 ) ( SURFACE-AT ?auto_2392777 ?auto_2392780 ) ( CLEAR ?auto_2392777 ) ( LIFTING ?auto_2392779 ?auto_2392778 ) ( IS-CRATE ?auto_2392778 ) ( not ( = ?auto_2392777 ?auto_2392778 ) ) )
    :subtasks
    ( ( !DROP ?auto_2392779 ?auto_2392778 ?auto_2392777 ?auto_2392780 )
      ( MAKE-1CRATE-VERIFY ?auto_2392777 ?auto_2392778 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392781 - SURFACE
      ?auto_2392782 - SURFACE
    )
    :vars
    (
      ?auto_2392783 - HOIST
      ?auto_2392784 - PLACE
      ?auto_2392785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392783 ?auto_2392784 ) ( SURFACE-AT ?auto_2392781 ?auto_2392784 ) ( CLEAR ?auto_2392781 ) ( IS-CRATE ?auto_2392782 ) ( not ( = ?auto_2392781 ?auto_2392782 ) ) ( TRUCK-AT ?auto_2392785 ?auto_2392784 ) ( AVAILABLE ?auto_2392783 ) ( IN ?auto_2392782 ?auto_2392785 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2392783 ?auto_2392782 ?auto_2392785 ?auto_2392784 )
      ( MAKE-1CRATE ?auto_2392781 ?auto_2392782 )
      ( MAKE-1CRATE-VERIFY ?auto_2392781 ?auto_2392782 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392786 - SURFACE
      ?auto_2392787 - SURFACE
    )
    :vars
    (
      ?auto_2392789 - HOIST
      ?auto_2392788 - PLACE
      ?auto_2392790 - TRUCK
      ?auto_2392791 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392789 ?auto_2392788 ) ( SURFACE-AT ?auto_2392786 ?auto_2392788 ) ( CLEAR ?auto_2392786 ) ( IS-CRATE ?auto_2392787 ) ( not ( = ?auto_2392786 ?auto_2392787 ) ) ( AVAILABLE ?auto_2392789 ) ( IN ?auto_2392787 ?auto_2392790 ) ( TRUCK-AT ?auto_2392790 ?auto_2392791 ) ( not ( = ?auto_2392791 ?auto_2392788 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2392790 ?auto_2392791 ?auto_2392788 )
      ( MAKE-1CRATE ?auto_2392786 ?auto_2392787 )
      ( MAKE-1CRATE-VERIFY ?auto_2392786 ?auto_2392787 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392792 - SURFACE
      ?auto_2392793 - SURFACE
    )
    :vars
    (
      ?auto_2392795 - HOIST
      ?auto_2392794 - PLACE
      ?auto_2392796 - TRUCK
      ?auto_2392797 - PLACE
      ?auto_2392798 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392795 ?auto_2392794 ) ( SURFACE-AT ?auto_2392792 ?auto_2392794 ) ( CLEAR ?auto_2392792 ) ( IS-CRATE ?auto_2392793 ) ( not ( = ?auto_2392792 ?auto_2392793 ) ) ( AVAILABLE ?auto_2392795 ) ( TRUCK-AT ?auto_2392796 ?auto_2392797 ) ( not ( = ?auto_2392797 ?auto_2392794 ) ) ( HOIST-AT ?auto_2392798 ?auto_2392797 ) ( LIFTING ?auto_2392798 ?auto_2392793 ) ( not ( = ?auto_2392795 ?auto_2392798 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2392798 ?auto_2392793 ?auto_2392796 ?auto_2392797 )
      ( MAKE-1CRATE ?auto_2392792 ?auto_2392793 )
      ( MAKE-1CRATE-VERIFY ?auto_2392792 ?auto_2392793 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392799 - SURFACE
      ?auto_2392800 - SURFACE
    )
    :vars
    (
      ?auto_2392804 - HOIST
      ?auto_2392802 - PLACE
      ?auto_2392805 - TRUCK
      ?auto_2392801 - PLACE
      ?auto_2392803 - HOIST
      ?auto_2392806 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392804 ?auto_2392802 ) ( SURFACE-AT ?auto_2392799 ?auto_2392802 ) ( CLEAR ?auto_2392799 ) ( IS-CRATE ?auto_2392800 ) ( not ( = ?auto_2392799 ?auto_2392800 ) ) ( AVAILABLE ?auto_2392804 ) ( TRUCK-AT ?auto_2392805 ?auto_2392801 ) ( not ( = ?auto_2392801 ?auto_2392802 ) ) ( HOIST-AT ?auto_2392803 ?auto_2392801 ) ( not ( = ?auto_2392804 ?auto_2392803 ) ) ( AVAILABLE ?auto_2392803 ) ( SURFACE-AT ?auto_2392800 ?auto_2392801 ) ( ON ?auto_2392800 ?auto_2392806 ) ( CLEAR ?auto_2392800 ) ( not ( = ?auto_2392799 ?auto_2392806 ) ) ( not ( = ?auto_2392800 ?auto_2392806 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2392803 ?auto_2392800 ?auto_2392806 ?auto_2392801 )
      ( MAKE-1CRATE ?auto_2392799 ?auto_2392800 )
      ( MAKE-1CRATE-VERIFY ?auto_2392799 ?auto_2392800 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392807 - SURFACE
      ?auto_2392808 - SURFACE
    )
    :vars
    (
      ?auto_2392810 - HOIST
      ?auto_2392813 - PLACE
      ?auto_2392812 - PLACE
      ?auto_2392814 - HOIST
      ?auto_2392809 - SURFACE
      ?auto_2392811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392810 ?auto_2392813 ) ( SURFACE-AT ?auto_2392807 ?auto_2392813 ) ( CLEAR ?auto_2392807 ) ( IS-CRATE ?auto_2392808 ) ( not ( = ?auto_2392807 ?auto_2392808 ) ) ( AVAILABLE ?auto_2392810 ) ( not ( = ?auto_2392812 ?auto_2392813 ) ) ( HOIST-AT ?auto_2392814 ?auto_2392812 ) ( not ( = ?auto_2392810 ?auto_2392814 ) ) ( AVAILABLE ?auto_2392814 ) ( SURFACE-AT ?auto_2392808 ?auto_2392812 ) ( ON ?auto_2392808 ?auto_2392809 ) ( CLEAR ?auto_2392808 ) ( not ( = ?auto_2392807 ?auto_2392809 ) ) ( not ( = ?auto_2392808 ?auto_2392809 ) ) ( TRUCK-AT ?auto_2392811 ?auto_2392813 ) )
    :subtasks
    ( ( !DRIVE ?auto_2392811 ?auto_2392813 ?auto_2392812 )
      ( MAKE-1CRATE ?auto_2392807 ?auto_2392808 )
      ( MAKE-1CRATE-VERIFY ?auto_2392807 ?auto_2392808 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392824 - SURFACE
      ?auto_2392825 - SURFACE
      ?auto_2392826 - SURFACE
    )
    :vars
    (
      ?auto_2392827 - HOIST
      ?auto_2392828 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392827 ?auto_2392828 ) ( SURFACE-AT ?auto_2392825 ?auto_2392828 ) ( CLEAR ?auto_2392825 ) ( LIFTING ?auto_2392827 ?auto_2392826 ) ( IS-CRATE ?auto_2392826 ) ( not ( = ?auto_2392825 ?auto_2392826 ) ) ( ON ?auto_2392825 ?auto_2392824 ) ( not ( = ?auto_2392824 ?auto_2392825 ) ) ( not ( = ?auto_2392824 ?auto_2392826 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392825 ?auto_2392826 )
      ( MAKE-2CRATE-VERIFY ?auto_2392824 ?auto_2392825 ?auto_2392826 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392834 - SURFACE
      ?auto_2392835 - SURFACE
      ?auto_2392836 - SURFACE
    )
    :vars
    (
      ?auto_2392838 - HOIST
      ?auto_2392837 - PLACE
      ?auto_2392839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392838 ?auto_2392837 ) ( SURFACE-AT ?auto_2392835 ?auto_2392837 ) ( CLEAR ?auto_2392835 ) ( IS-CRATE ?auto_2392836 ) ( not ( = ?auto_2392835 ?auto_2392836 ) ) ( TRUCK-AT ?auto_2392839 ?auto_2392837 ) ( AVAILABLE ?auto_2392838 ) ( IN ?auto_2392836 ?auto_2392839 ) ( ON ?auto_2392835 ?auto_2392834 ) ( not ( = ?auto_2392834 ?auto_2392835 ) ) ( not ( = ?auto_2392834 ?auto_2392836 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392835 ?auto_2392836 )
      ( MAKE-2CRATE-VERIFY ?auto_2392834 ?auto_2392835 ?auto_2392836 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392840 - SURFACE
      ?auto_2392841 - SURFACE
    )
    :vars
    (
      ?auto_2392845 - HOIST
      ?auto_2392844 - PLACE
      ?auto_2392843 - TRUCK
      ?auto_2392842 - SURFACE
      ?auto_2392846 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392845 ?auto_2392844 ) ( SURFACE-AT ?auto_2392840 ?auto_2392844 ) ( CLEAR ?auto_2392840 ) ( IS-CRATE ?auto_2392841 ) ( not ( = ?auto_2392840 ?auto_2392841 ) ) ( AVAILABLE ?auto_2392845 ) ( IN ?auto_2392841 ?auto_2392843 ) ( ON ?auto_2392840 ?auto_2392842 ) ( not ( = ?auto_2392842 ?auto_2392840 ) ) ( not ( = ?auto_2392842 ?auto_2392841 ) ) ( TRUCK-AT ?auto_2392843 ?auto_2392846 ) ( not ( = ?auto_2392846 ?auto_2392844 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2392843 ?auto_2392846 ?auto_2392844 )
      ( MAKE-2CRATE ?auto_2392842 ?auto_2392840 ?auto_2392841 )
      ( MAKE-1CRATE-VERIFY ?auto_2392840 ?auto_2392841 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392847 - SURFACE
      ?auto_2392848 - SURFACE
      ?auto_2392849 - SURFACE
    )
    :vars
    (
      ?auto_2392852 - HOIST
      ?auto_2392853 - PLACE
      ?auto_2392850 - TRUCK
      ?auto_2392851 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392852 ?auto_2392853 ) ( SURFACE-AT ?auto_2392848 ?auto_2392853 ) ( CLEAR ?auto_2392848 ) ( IS-CRATE ?auto_2392849 ) ( not ( = ?auto_2392848 ?auto_2392849 ) ) ( AVAILABLE ?auto_2392852 ) ( IN ?auto_2392849 ?auto_2392850 ) ( ON ?auto_2392848 ?auto_2392847 ) ( not ( = ?auto_2392847 ?auto_2392848 ) ) ( not ( = ?auto_2392847 ?auto_2392849 ) ) ( TRUCK-AT ?auto_2392850 ?auto_2392851 ) ( not ( = ?auto_2392851 ?auto_2392853 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392848 ?auto_2392849 )
      ( MAKE-2CRATE-VERIFY ?auto_2392847 ?auto_2392848 ?auto_2392849 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392854 - SURFACE
      ?auto_2392855 - SURFACE
    )
    :vars
    (
      ?auto_2392858 - HOIST
      ?auto_2392859 - PLACE
      ?auto_2392860 - SURFACE
      ?auto_2392856 - TRUCK
      ?auto_2392857 - PLACE
      ?auto_2392861 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392858 ?auto_2392859 ) ( SURFACE-AT ?auto_2392854 ?auto_2392859 ) ( CLEAR ?auto_2392854 ) ( IS-CRATE ?auto_2392855 ) ( not ( = ?auto_2392854 ?auto_2392855 ) ) ( AVAILABLE ?auto_2392858 ) ( ON ?auto_2392854 ?auto_2392860 ) ( not ( = ?auto_2392860 ?auto_2392854 ) ) ( not ( = ?auto_2392860 ?auto_2392855 ) ) ( TRUCK-AT ?auto_2392856 ?auto_2392857 ) ( not ( = ?auto_2392857 ?auto_2392859 ) ) ( HOIST-AT ?auto_2392861 ?auto_2392857 ) ( LIFTING ?auto_2392861 ?auto_2392855 ) ( not ( = ?auto_2392858 ?auto_2392861 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2392861 ?auto_2392855 ?auto_2392856 ?auto_2392857 )
      ( MAKE-2CRATE ?auto_2392860 ?auto_2392854 ?auto_2392855 )
      ( MAKE-1CRATE-VERIFY ?auto_2392854 ?auto_2392855 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392862 - SURFACE
      ?auto_2392863 - SURFACE
      ?auto_2392864 - SURFACE
    )
    :vars
    (
      ?auto_2392869 - HOIST
      ?auto_2392867 - PLACE
      ?auto_2392868 - TRUCK
      ?auto_2392865 - PLACE
      ?auto_2392866 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392869 ?auto_2392867 ) ( SURFACE-AT ?auto_2392863 ?auto_2392867 ) ( CLEAR ?auto_2392863 ) ( IS-CRATE ?auto_2392864 ) ( not ( = ?auto_2392863 ?auto_2392864 ) ) ( AVAILABLE ?auto_2392869 ) ( ON ?auto_2392863 ?auto_2392862 ) ( not ( = ?auto_2392862 ?auto_2392863 ) ) ( not ( = ?auto_2392862 ?auto_2392864 ) ) ( TRUCK-AT ?auto_2392868 ?auto_2392865 ) ( not ( = ?auto_2392865 ?auto_2392867 ) ) ( HOIST-AT ?auto_2392866 ?auto_2392865 ) ( LIFTING ?auto_2392866 ?auto_2392864 ) ( not ( = ?auto_2392869 ?auto_2392866 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392863 ?auto_2392864 )
      ( MAKE-2CRATE-VERIFY ?auto_2392862 ?auto_2392863 ?auto_2392864 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392870 - SURFACE
      ?auto_2392871 - SURFACE
    )
    :vars
    (
      ?auto_2392877 - HOIST
      ?auto_2392874 - PLACE
      ?auto_2392875 - SURFACE
      ?auto_2392876 - TRUCK
      ?auto_2392872 - PLACE
      ?auto_2392873 - HOIST
      ?auto_2392878 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392877 ?auto_2392874 ) ( SURFACE-AT ?auto_2392870 ?auto_2392874 ) ( CLEAR ?auto_2392870 ) ( IS-CRATE ?auto_2392871 ) ( not ( = ?auto_2392870 ?auto_2392871 ) ) ( AVAILABLE ?auto_2392877 ) ( ON ?auto_2392870 ?auto_2392875 ) ( not ( = ?auto_2392875 ?auto_2392870 ) ) ( not ( = ?auto_2392875 ?auto_2392871 ) ) ( TRUCK-AT ?auto_2392876 ?auto_2392872 ) ( not ( = ?auto_2392872 ?auto_2392874 ) ) ( HOIST-AT ?auto_2392873 ?auto_2392872 ) ( not ( = ?auto_2392877 ?auto_2392873 ) ) ( AVAILABLE ?auto_2392873 ) ( SURFACE-AT ?auto_2392871 ?auto_2392872 ) ( ON ?auto_2392871 ?auto_2392878 ) ( CLEAR ?auto_2392871 ) ( not ( = ?auto_2392870 ?auto_2392878 ) ) ( not ( = ?auto_2392871 ?auto_2392878 ) ) ( not ( = ?auto_2392875 ?auto_2392878 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2392873 ?auto_2392871 ?auto_2392878 ?auto_2392872 )
      ( MAKE-2CRATE ?auto_2392875 ?auto_2392870 ?auto_2392871 )
      ( MAKE-1CRATE-VERIFY ?auto_2392870 ?auto_2392871 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392879 - SURFACE
      ?auto_2392880 - SURFACE
      ?auto_2392881 - SURFACE
    )
    :vars
    (
      ?auto_2392882 - HOIST
      ?auto_2392883 - PLACE
      ?auto_2392887 - TRUCK
      ?auto_2392884 - PLACE
      ?auto_2392885 - HOIST
      ?auto_2392886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392882 ?auto_2392883 ) ( SURFACE-AT ?auto_2392880 ?auto_2392883 ) ( CLEAR ?auto_2392880 ) ( IS-CRATE ?auto_2392881 ) ( not ( = ?auto_2392880 ?auto_2392881 ) ) ( AVAILABLE ?auto_2392882 ) ( ON ?auto_2392880 ?auto_2392879 ) ( not ( = ?auto_2392879 ?auto_2392880 ) ) ( not ( = ?auto_2392879 ?auto_2392881 ) ) ( TRUCK-AT ?auto_2392887 ?auto_2392884 ) ( not ( = ?auto_2392884 ?auto_2392883 ) ) ( HOIST-AT ?auto_2392885 ?auto_2392884 ) ( not ( = ?auto_2392882 ?auto_2392885 ) ) ( AVAILABLE ?auto_2392885 ) ( SURFACE-AT ?auto_2392881 ?auto_2392884 ) ( ON ?auto_2392881 ?auto_2392886 ) ( CLEAR ?auto_2392881 ) ( not ( = ?auto_2392880 ?auto_2392886 ) ) ( not ( = ?auto_2392881 ?auto_2392886 ) ) ( not ( = ?auto_2392879 ?auto_2392886 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392880 ?auto_2392881 )
      ( MAKE-2CRATE-VERIFY ?auto_2392879 ?auto_2392880 ?auto_2392881 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392888 - SURFACE
      ?auto_2392889 - SURFACE
    )
    :vars
    (
      ?auto_2392896 - HOIST
      ?auto_2392892 - PLACE
      ?auto_2392890 - SURFACE
      ?auto_2392895 - PLACE
      ?auto_2392891 - HOIST
      ?auto_2392893 - SURFACE
      ?auto_2392894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392896 ?auto_2392892 ) ( SURFACE-AT ?auto_2392888 ?auto_2392892 ) ( CLEAR ?auto_2392888 ) ( IS-CRATE ?auto_2392889 ) ( not ( = ?auto_2392888 ?auto_2392889 ) ) ( AVAILABLE ?auto_2392896 ) ( ON ?auto_2392888 ?auto_2392890 ) ( not ( = ?auto_2392890 ?auto_2392888 ) ) ( not ( = ?auto_2392890 ?auto_2392889 ) ) ( not ( = ?auto_2392895 ?auto_2392892 ) ) ( HOIST-AT ?auto_2392891 ?auto_2392895 ) ( not ( = ?auto_2392896 ?auto_2392891 ) ) ( AVAILABLE ?auto_2392891 ) ( SURFACE-AT ?auto_2392889 ?auto_2392895 ) ( ON ?auto_2392889 ?auto_2392893 ) ( CLEAR ?auto_2392889 ) ( not ( = ?auto_2392888 ?auto_2392893 ) ) ( not ( = ?auto_2392889 ?auto_2392893 ) ) ( not ( = ?auto_2392890 ?auto_2392893 ) ) ( TRUCK-AT ?auto_2392894 ?auto_2392892 ) )
    :subtasks
    ( ( !DRIVE ?auto_2392894 ?auto_2392892 ?auto_2392895 )
      ( MAKE-2CRATE ?auto_2392890 ?auto_2392888 ?auto_2392889 )
      ( MAKE-1CRATE-VERIFY ?auto_2392888 ?auto_2392889 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392897 - SURFACE
      ?auto_2392898 - SURFACE
      ?auto_2392899 - SURFACE
    )
    :vars
    (
      ?auto_2392904 - HOIST
      ?auto_2392905 - PLACE
      ?auto_2392900 - PLACE
      ?auto_2392902 - HOIST
      ?auto_2392903 - SURFACE
      ?auto_2392901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392904 ?auto_2392905 ) ( SURFACE-AT ?auto_2392898 ?auto_2392905 ) ( CLEAR ?auto_2392898 ) ( IS-CRATE ?auto_2392899 ) ( not ( = ?auto_2392898 ?auto_2392899 ) ) ( AVAILABLE ?auto_2392904 ) ( ON ?auto_2392898 ?auto_2392897 ) ( not ( = ?auto_2392897 ?auto_2392898 ) ) ( not ( = ?auto_2392897 ?auto_2392899 ) ) ( not ( = ?auto_2392900 ?auto_2392905 ) ) ( HOIST-AT ?auto_2392902 ?auto_2392900 ) ( not ( = ?auto_2392904 ?auto_2392902 ) ) ( AVAILABLE ?auto_2392902 ) ( SURFACE-AT ?auto_2392899 ?auto_2392900 ) ( ON ?auto_2392899 ?auto_2392903 ) ( CLEAR ?auto_2392899 ) ( not ( = ?auto_2392898 ?auto_2392903 ) ) ( not ( = ?auto_2392899 ?auto_2392903 ) ) ( not ( = ?auto_2392897 ?auto_2392903 ) ) ( TRUCK-AT ?auto_2392901 ?auto_2392905 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392898 ?auto_2392899 )
      ( MAKE-2CRATE-VERIFY ?auto_2392897 ?auto_2392898 ?auto_2392899 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392906 - SURFACE
      ?auto_2392907 - SURFACE
    )
    :vars
    (
      ?auto_2392914 - HOIST
      ?auto_2392909 - PLACE
      ?auto_2392908 - SURFACE
      ?auto_2392910 - PLACE
      ?auto_2392913 - HOIST
      ?auto_2392912 - SURFACE
      ?auto_2392911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392914 ?auto_2392909 ) ( IS-CRATE ?auto_2392907 ) ( not ( = ?auto_2392906 ?auto_2392907 ) ) ( not ( = ?auto_2392908 ?auto_2392906 ) ) ( not ( = ?auto_2392908 ?auto_2392907 ) ) ( not ( = ?auto_2392910 ?auto_2392909 ) ) ( HOIST-AT ?auto_2392913 ?auto_2392910 ) ( not ( = ?auto_2392914 ?auto_2392913 ) ) ( AVAILABLE ?auto_2392913 ) ( SURFACE-AT ?auto_2392907 ?auto_2392910 ) ( ON ?auto_2392907 ?auto_2392912 ) ( CLEAR ?auto_2392907 ) ( not ( = ?auto_2392906 ?auto_2392912 ) ) ( not ( = ?auto_2392907 ?auto_2392912 ) ) ( not ( = ?auto_2392908 ?auto_2392912 ) ) ( TRUCK-AT ?auto_2392911 ?auto_2392909 ) ( SURFACE-AT ?auto_2392908 ?auto_2392909 ) ( CLEAR ?auto_2392908 ) ( LIFTING ?auto_2392914 ?auto_2392906 ) ( IS-CRATE ?auto_2392906 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392908 ?auto_2392906 )
      ( MAKE-2CRATE ?auto_2392908 ?auto_2392906 ?auto_2392907 )
      ( MAKE-1CRATE-VERIFY ?auto_2392906 ?auto_2392907 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392915 - SURFACE
      ?auto_2392916 - SURFACE
      ?auto_2392917 - SURFACE
    )
    :vars
    (
      ?auto_2392923 - HOIST
      ?auto_2392922 - PLACE
      ?auto_2392921 - PLACE
      ?auto_2392918 - HOIST
      ?auto_2392920 - SURFACE
      ?auto_2392919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392923 ?auto_2392922 ) ( IS-CRATE ?auto_2392917 ) ( not ( = ?auto_2392916 ?auto_2392917 ) ) ( not ( = ?auto_2392915 ?auto_2392916 ) ) ( not ( = ?auto_2392915 ?auto_2392917 ) ) ( not ( = ?auto_2392921 ?auto_2392922 ) ) ( HOIST-AT ?auto_2392918 ?auto_2392921 ) ( not ( = ?auto_2392923 ?auto_2392918 ) ) ( AVAILABLE ?auto_2392918 ) ( SURFACE-AT ?auto_2392917 ?auto_2392921 ) ( ON ?auto_2392917 ?auto_2392920 ) ( CLEAR ?auto_2392917 ) ( not ( = ?auto_2392916 ?auto_2392920 ) ) ( not ( = ?auto_2392917 ?auto_2392920 ) ) ( not ( = ?auto_2392915 ?auto_2392920 ) ) ( TRUCK-AT ?auto_2392919 ?auto_2392922 ) ( SURFACE-AT ?auto_2392915 ?auto_2392922 ) ( CLEAR ?auto_2392915 ) ( LIFTING ?auto_2392923 ?auto_2392916 ) ( IS-CRATE ?auto_2392916 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392916 ?auto_2392917 )
      ( MAKE-2CRATE-VERIFY ?auto_2392915 ?auto_2392916 ?auto_2392917 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392924 - SURFACE
      ?auto_2392925 - SURFACE
    )
    :vars
    (
      ?auto_2392930 - HOIST
      ?auto_2392932 - PLACE
      ?auto_2392927 - SURFACE
      ?auto_2392929 - PLACE
      ?auto_2392926 - HOIST
      ?auto_2392928 - SURFACE
      ?auto_2392931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392930 ?auto_2392932 ) ( IS-CRATE ?auto_2392925 ) ( not ( = ?auto_2392924 ?auto_2392925 ) ) ( not ( = ?auto_2392927 ?auto_2392924 ) ) ( not ( = ?auto_2392927 ?auto_2392925 ) ) ( not ( = ?auto_2392929 ?auto_2392932 ) ) ( HOIST-AT ?auto_2392926 ?auto_2392929 ) ( not ( = ?auto_2392930 ?auto_2392926 ) ) ( AVAILABLE ?auto_2392926 ) ( SURFACE-AT ?auto_2392925 ?auto_2392929 ) ( ON ?auto_2392925 ?auto_2392928 ) ( CLEAR ?auto_2392925 ) ( not ( = ?auto_2392924 ?auto_2392928 ) ) ( not ( = ?auto_2392925 ?auto_2392928 ) ) ( not ( = ?auto_2392927 ?auto_2392928 ) ) ( TRUCK-AT ?auto_2392931 ?auto_2392932 ) ( SURFACE-AT ?auto_2392927 ?auto_2392932 ) ( CLEAR ?auto_2392927 ) ( IS-CRATE ?auto_2392924 ) ( AVAILABLE ?auto_2392930 ) ( IN ?auto_2392924 ?auto_2392931 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2392930 ?auto_2392924 ?auto_2392931 ?auto_2392932 )
      ( MAKE-2CRATE ?auto_2392927 ?auto_2392924 ?auto_2392925 )
      ( MAKE-1CRATE-VERIFY ?auto_2392924 ?auto_2392925 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2392933 - SURFACE
      ?auto_2392934 - SURFACE
      ?auto_2392935 - SURFACE
    )
    :vars
    (
      ?auto_2392937 - HOIST
      ?auto_2392941 - PLACE
      ?auto_2392939 - PLACE
      ?auto_2392938 - HOIST
      ?auto_2392940 - SURFACE
      ?auto_2392936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392937 ?auto_2392941 ) ( IS-CRATE ?auto_2392935 ) ( not ( = ?auto_2392934 ?auto_2392935 ) ) ( not ( = ?auto_2392933 ?auto_2392934 ) ) ( not ( = ?auto_2392933 ?auto_2392935 ) ) ( not ( = ?auto_2392939 ?auto_2392941 ) ) ( HOIST-AT ?auto_2392938 ?auto_2392939 ) ( not ( = ?auto_2392937 ?auto_2392938 ) ) ( AVAILABLE ?auto_2392938 ) ( SURFACE-AT ?auto_2392935 ?auto_2392939 ) ( ON ?auto_2392935 ?auto_2392940 ) ( CLEAR ?auto_2392935 ) ( not ( = ?auto_2392934 ?auto_2392940 ) ) ( not ( = ?auto_2392935 ?auto_2392940 ) ) ( not ( = ?auto_2392933 ?auto_2392940 ) ) ( TRUCK-AT ?auto_2392936 ?auto_2392941 ) ( SURFACE-AT ?auto_2392933 ?auto_2392941 ) ( CLEAR ?auto_2392933 ) ( IS-CRATE ?auto_2392934 ) ( AVAILABLE ?auto_2392937 ) ( IN ?auto_2392934 ?auto_2392936 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392934 ?auto_2392935 )
      ( MAKE-2CRATE-VERIFY ?auto_2392933 ?auto_2392934 ?auto_2392935 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392978 - SURFACE
      ?auto_2392979 - SURFACE
    )
    :vars
    (
      ?auto_2392986 - HOIST
      ?auto_2392985 - PLACE
      ?auto_2392980 - SURFACE
      ?auto_2392981 - PLACE
      ?auto_2392984 - HOIST
      ?auto_2392983 - SURFACE
      ?auto_2392982 - TRUCK
      ?auto_2392987 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392986 ?auto_2392985 ) ( SURFACE-AT ?auto_2392978 ?auto_2392985 ) ( CLEAR ?auto_2392978 ) ( IS-CRATE ?auto_2392979 ) ( not ( = ?auto_2392978 ?auto_2392979 ) ) ( AVAILABLE ?auto_2392986 ) ( ON ?auto_2392978 ?auto_2392980 ) ( not ( = ?auto_2392980 ?auto_2392978 ) ) ( not ( = ?auto_2392980 ?auto_2392979 ) ) ( not ( = ?auto_2392981 ?auto_2392985 ) ) ( HOIST-AT ?auto_2392984 ?auto_2392981 ) ( not ( = ?auto_2392986 ?auto_2392984 ) ) ( AVAILABLE ?auto_2392984 ) ( SURFACE-AT ?auto_2392979 ?auto_2392981 ) ( ON ?auto_2392979 ?auto_2392983 ) ( CLEAR ?auto_2392979 ) ( not ( = ?auto_2392978 ?auto_2392983 ) ) ( not ( = ?auto_2392979 ?auto_2392983 ) ) ( not ( = ?auto_2392980 ?auto_2392983 ) ) ( TRUCK-AT ?auto_2392982 ?auto_2392987 ) ( not ( = ?auto_2392987 ?auto_2392985 ) ) ( not ( = ?auto_2392981 ?auto_2392987 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2392982 ?auto_2392987 ?auto_2392985 )
      ( MAKE-1CRATE ?auto_2392978 ?auto_2392979 )
      ( MAKE-1CRATE-VERIFY ?auto_2392978 ?auto_2392979 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2393018 - SURFACE
      ?auto_2393019 - SURFACE
      ?auto_2393020 - SURFACE
      ?auto_2393017 - SURFACE
    )
    :vars
    (
      ?auto_2393021 - HOIST
      ?auto_2393022 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393021 ?auto_2393022 ) ( SURFACE-AT ?auto_2393020 ?auto_2393022 ) ( CLEAR ?auto_2393020 ) ( LIFTING ?auto_2393021 ?auto_2393017 ) ( IS-CRATE ?auto_2393017 ) ( not ( = ?auto_2393020 ?auto_2393017 ) ) ( ON ?auto_2393019 ?auto_2393018 ) ( ON ?auto_2393020 ?auto_2393019 ) ( not ( = ?auto_2393018 ?auto_2393019 ) ) ( not ( = ?auto_2393018 ?auto_2393020 ) ) ( not ( = ?auto_2393018 ?auto_2393017 ) ) ( not ( = ?auto_2393019 ?auto_2393020 ) ) ( not ( = ?auto_2393019 ?auto_2393017 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2393020 ?auto_2393017 )
      ( MAKE-3CRATE-VERIFY ?auto_2393018 ?auto_2393019 ?auto_2393020 ?auto_2393017 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2393035 - SURFACE
      ?auto_2393036 - SURFACE
      ?auto_2393037 - SURFACE
      ?auto_2393034 - SURFACE
    )
    :vars
    (
      ?auto_2393038 - HOIST
      ?auto_2393040 - PLACE
      ?auto_2393039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393038 ?auto_2393040 ) ( SURFACE-AT ?auto_2393037 ?auto_2393040 ) ( CLEAR ?auto_2393037 ) ( IS-CRATE ?auto_2393034 ) ( not ( = ?auto_2393037 ?auto_2393034 ) ) ( TRUCK-AT ?auto_2393039 ?auto_2393040 ) ( AVAILABLE ?auto_2393038 ) ( IN ?auto_2393034 ?auto_2393039 ) ( ON ?auto_2393037 ?auto_2393036 ) ( not ( = ?auto_2393036 ?auto_2393037 ) ) ( not ( = ?auto_2393036 ?auto_2393034 ) ) ( ON ?auto_2393036 ?auto_2393035 ) ( not ( = ?auto_2393035 ?auto_2393036 ) ) ( not ( = ?auto_2393035 ?auto_2393037 ) ) ( not ( = ?auto_2393035 ?auto_2393034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393036 ?auto_2393037 ?auto_2393034 )
      ( MAKE-3CRATE-VERIFY ?auto_2393035 ?auto_2393036 ?auto_2393037 ?auto_2393034 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2393056 - SURFACE
      ?auto_2393057 - SURFACE
      ?auto_2393058 - SURFACE
      ?auto_2393055 - SURFACE
    )
    :vars
    (
      ?auto_2393060 - HOIST
      ?auto_2393062 - PLACE
      ?auto_2393059 - TRUCK
      ?auto_2393061 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393060 ?auto_2393062 ) ( SURFACE-AT ?auto_2393058 ?auto_2393062 ) ( CLEAR ?auto_2393058 ) ( IS-CRATE ?auto_2393055 ) ( not ( = ?auto_2393058 ?auto_2393055 ) ) ( AVAILABLE ?auto_2393060 ) ( IN ?auto_2393055 ?auto_2393059 ) ( ON ?auto_2393058 ?auto_2393057 ) ( not ( = ?auto_2393057 ?auto_2393058 ) ) ( not ( = ?auto_2393057 ?auto_2393055 ) ) ( TRUCK-AT ?auto_2393059 ?auto_2393061 ) ( not ( = ?auto_2393061 ?auto_2393062 ) ) ( ON ?auto_2393057 ?auto_2393056 ) ( not ( = ?auto_2393056 ?auto_2393057 ) ) ( not ( = ?auto_2393056 ?auto_2393058 ) ) ( not ( = ?auto_2393056 ?auto_2393055 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393057 ?auto_2393058 ?auto_2393055 )
      ( MAKE-3CRATE-VERIFY ?auto_2393056 ?auto_2393057 ?auto_2393058 ?auto_2393055 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2393080 - SURFACE
      ?auto_2393081 - SURFACE
      ?auto_2393082 - SURFACE
      ?auto_2393079 - SURFACE
    )
    :vars
    (
      ?auto_2393085 - HOIST
      ?auto_2393084 - PLACE
      ?auto_2393086 - TRUCK
      ?auto_2393087 - PLACE
      ?auto_2393083 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393085 ?auto_2393084 ) ( SURFACE-AT ?auto_2393082 ?auto_2393084 ) ( CLEAR ?auto_2393082 ) ( IS-CRATE ?auto_2393079 ) ( not ( = ?auto_2393082 ?auto_2393079 ) ) ( AVAILABLE ?auto_2393085 ) ( ON ?auto_2393082 ?auto_2393081 ) ( not ( = ?auto_2393081 ?auto_2393082 ) ) ( not ( = ?auto_2393081 ?auto_2393079 ) ) ( TRUCK-AT ?auto_2393086 ?auto_2393087 ) ( not ( = ?auto_2393087 ?auto_2393084 ) ) ( HOIST-AT ?auto_2393083 ?auto_2393087 ) ( LIFTING ?auto_2393083 ?auto_2393079 ) ( not ( = ?auto_2393085 ?auto_2393083 ) ) ( ON ?auto_2393081 ?auto_2393080 ) ( not ( = ?auto_2393080 ?auto_2393081 ) ) ( not ( = ?auto_2393080 ?auto_2393082 ) ) ( not ( = ?auto_2393080 ?auto_2393079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393081 ?auto_2393082 ?auto_2393079 )
      ( MAKE-3CRATE-VERIFY ?auto_2393080 ?auto_2393081 ?auto_2393082 ?auto_2393079 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2393107 - SURFACE
      ?auto_2393108 - SURFACE
      ?auto_2393109 - SURFACE
      ?auto_2393106 - SURFACE
    )
    :vars
    (
      ?auto_2393115 - HOIST
      ?auto_2393112 - PLACE
      ?auto_2393111 - TRUCK
      ?auto_2393114 - PLACE
      ?auto_2393110 - HOIST
      ?auto_2393113 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393115 ?auto_2393112 ) ( SURFACE-AT ?auto_2393109 ?auto_2393112 ) ( CLEAR ?auto_2393109 ) ( IS-CRATE ?auto_2393106 ) ( not ( = ?auto_2393109 ?auto_2393106 ) ) ( AVAILABLE ?auto_2393115 ) ( ON ?auto_2393109 ?auto_2393108 ) ( not ( = ?auto_2393108 ?auto_2393109 ) ) ( not ( = ?auto_2393108 ?auto_2393106 ) ) ( TRUCK-AT ?auto_2393111 ?auto_2393114 ) ( not ( = ?auto_2393114 ?auto_2393112 ) ) ( HOIST-AT ?auto_2393110 ?auto_2393114 ) ( not ( = ?auto_2393115 ?auto_2393110 ) ) ( AVAILABLE ?auto_2393110 ) ( SURFACE-AT ?auto_2393106 ?auto_2393114 ) ( ON ?auto_2393106 ?auto_2393113 ) ( CLEAR ?auto_2393106 ) ( not ( = ?auto_2393109 ?auto_2393113 ) ) ( not ( = ?auto_2393106 ?auto_2393113 ) ) ( not ( = ?auto_2393108 ?auto_2393113 ) ) ( ON ?auto_2393108 ?auto_2393107 ) ( not ( = ?auto_2393107 ?auto_2393108 ) ) ( not ( = ?auto_2393107 ?auto_2393109 ) ) ( not ( = ?auto_2393107 ?auto_2393106 ) ) ( not ( = ?auto_2393107 ?auto_2393113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393108 ?auto_2393109 ?auto_2393106 )
      ( MAKE-3CRATE-VERIFY ?auto_2393107 ?auto_2393108 ?auto_2393109 ?auto_2393106 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2393135 - SURFACE
      ?auto_2393136 - SURFACE
      ?auto_2393137 - SURFACE
      ?auto_2393134 - SURFACE
    )
    :vars
    (
      ?auto_2393143 - HOIST
      ?auto_2393138 - PLACE
      ?auto_2393139 - PLACE
      ?auto_2393141 - HOIST
      ?auto_2393140 - SURFACE
      ?auto_2393142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393143 ?auto_2393138 ) ( SURFACE-AT ?auto_2393137 ?auto_2393138 ) ( CLEAR ?auto_2393137 ) ( IS-CRATE ?auto_2393134 ) ( not ( = ?auto_2393137 ?auto_2393134 ) ) ( AVAILABLE ?auto_2393143 ) ( ON ?auto_2393137 ?auto_2393136 ) ( not ( = ?auto_2393136 ?auto_2393137 ) ) ( not ( = ?auto_2393136 ?auto_2393134 ) ) ( not ( = ?auto_2393139 ?auto_2393138 ) ) ( HOIST-AT ?auto_2393141 ?auto_2393139 ) ( not ( = ?auto_2393143 ?auto_2393141 ) ) ( AVAILABLE ?auto_2393141 ) ( SURFACE-AT ?auto_2393134 ?auto_2393139 ) ( ON ?auto_2393134 ?auto_2393140 ) ( CLEAR ?auto_2393134 ) ( not ( = ?auto_2393137 ?auto_2393140 ) ) ( not ( = ?auto_2393134 ?auto_2393140 ) ) ( not ( = ?auto_2393136 ?auto_2393140 ) ) ( TRUCK-AT ?auto_2393142 ?auto_2393138 ) ( ON ?auto_2393136 ?auto_2393135 ) ( not ( = ?auto_2393135 ?auto_2393136 ) ) ( not ( = ?auto_2393135 ?auto_2393137 ) ) ( not ( = ?auto_2393135 ?auto_2393134 ) ) ( not ( = ?auto_2393135 ?auto_2393140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393136 ?auto_2393137 ?auto_2393134 )
      ( MAKE-3CRATE-VERIFY ?auto_2393135 ?auto_2393136 ?auto_2393137 ?auto_2393134 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2393163 - SURFACE
      ?auto_2393164 - SURFACE
      ?auto_2393165 - SURFACE
      ?auto_2393162 - SURFACE
    )
    :vars
    (
      ?auto_2393169 - HOIST
      ?auto_2393171 - PLACE
      ?auto_2393167 - PLACE
      ?auto_2393168 - HOIST
      ?auto_2393166 - SURFACE
      ?auto_2393170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393169 ?auto_2393171 ) ( IS-CRATE ?auto_2393162 ) ( not ( = ?auto_2393165 ?auto_2393162 ) ) ( not ( = ?auto_2393164 ?auto_2393165 ) ) ( not ( = ?auto_2393164 ?auto_2393162 ) ) ( not ( = ?auto_2393167 ?auto_2393171 ) ) ( HOIST-AT ?auto_2393168 ?auto_2393167 ) ( not ( = ?auto_2393169 ?auto_2393168 ) ) ( AVAILABLE ?auto_2393168 ) ( SURFACE-AT ?auto_2393162 ?auto_2393167 ) ( ON ?auto_2393162 ?auto_2393166 ) ( CLEAR ?auto_2393162 ) ( not ( = ?auto_2393165 ?auto_2393166 ) ) ( not ( = ?auto_2393162 ?auto_2393166 ) ) ( not ( = ?auto_2393164 ?auto_2393166 ) ) ( TRUCK-AT ?auto_2393170 ?auto_2393171 ) ( SURFACE-AT ?auto_2393164 ?auto_2393171 ) ( CLEAR ?auto_2393164 ) ( LIFTING ?auto_2393169 ?auto_2393165 ) ( IS-CRATE ?auto_2393165 ) ( ON ?auto_2393164 ?auto_2393163 ) ( not ( = ?auto_2393163 ?auto_2393164 ) ) ( not ( = ?auto_2393163 ?auto_2393165 ) ) ( not ( = ?auto_2393163 ?auto_2393162 ) ) ( not ( = ?auto_2393163 ?auto_2393166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393164 ?auto_2393165 ?auto_2393162 )
      ( MAKE-3CRATE-VERIFY ?auto_2393163 ?auto_2393164 ?auto_2393165 ?auto_2393162 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2393191 - SURFACE
      ?auto_2393192 - SURFACE
      ?auto_2393193 - SURFACE
      ?auto_2393190 - SURFACE
    )
    :vars
    (
      ?auto_2393196 - HOIST
      ?auto_2393197 - PLACE
      ?auto_2393195 - PLACE
      ?auto_2393199 - HOIST
      ?auto_2393198 - SURFACE
      ?auto_2393194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393196 ?auto_2393197 ) ( IS-CRATE ?auto_2393190 ) ( not ( = ?auto_2393193 ?auto_2393190 ) ) ( not ( = ?auto_2393192 ?auto_2393193 ) ) ( not ( = ?auto_2393192 ?auto_2393190 ) ) ( not ( = ?auto_2393195 ?auto_2393197 ) ) ( HOIST-AT ?auto_2393199 ?auto_2393195 ) ( not ( = ?auto_2393196 ?auto_2393199 ) ) ( AVAILABLE ?auto_2393199 ) ( SURFACE-AT ?auto_2393190 ?auto_2393195 ) ( ON ?auto_2393190 ?auto_2393198 ) ( CLEAR ?auto_2393190 ) ( not ( = ?auto_2393193 ?auto_2393198 ) ) ( not ( = ?auto_2393190 ?auto_2393198 ) ) ( not ( = ?auto_2393192 ?auto_2393198 ) ) ( TRUCK-AT ?auto_2393194 ?auto_2393197 ) ( SURFACE-AT ?auto_2393192 ?auto_2393197 ) ( CLEAR ?auto_2393192 ) ( IS-CRATE ?auto_2393193 ) ( AVAILABLE ?auto_2393196 ) ( IN ?auto_2393193 ?auto_2393194 ) ( ON ?auto_2393192 ?auto_2393191 ) ( not ( = ?auto_2393191 ?auto_2393192 ) ) ( not ( = ?auto_2393191 ?auto_2393193 ) ) ( not ( = ?auto_2393191 ?auto_2393190 ) ) ( not ( = ?auto_2393191 ?auto_2393198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393192 ?auto_2393193 ?auto_2393190 )
      ( MAKE-3CRATE-VERIFY ?auto_2393191 ?auto_2393192 ?auto_2393193 ?auto_2393190 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2393482 - SURFACE
      ?auto_2393483 - SURFACE
      ?auto_2393484 - SURFACE
      ?auto_2393481 - SURFACE
      ?auto_2393485 - SURFACE
    )
    :vars
    (
      ?auto_2393486 - HOIST
      ?auto_2393487 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393486 ?auto_2393487 ) ( SURFACE-AT ?auto_2393481 ?auto_2393487 ) ( CLEAR ?auto_2393481 ) ( LIFTING ?auto_2393486 ?auto_2393485 ) ( IS-CRATE ?auto_2393485 ) ( not ( = ?auto_2393481 ?auto_2393485 ) ) ( ON ?auto_2393483 ?auto_2393482 ) ( ON ?auto_2393484 ?auto_2393483 ) ( ON ?auto_2393481 ?auto_2393484 ) ( not ( = ?auto_2393482 ?auto_2393483 ) ) ( not ( = ?auto_2393482 ?auto_2393484 ) ) ( not ( = ?auto_2393482 ?auto_2393481 ) ) ( not ( = ?auto_2393482 ?auto_2393485 ) ) ( not ( = ?auto_2393483 ?auto_2393484 ) ) ( not ( = ?auto_2393483 ?auto_2393481 ) ) ( not ( = ?auto_2393483 ?auto_2393485 ) ) ( not ( = ?auto_2393484 ?auto_2393481 ) ) ( not ( = ?auto_2393484 ?auto_2393485 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2393481 ?auto_2393485 )
      ( MAKE-4CRATE-VERIFY ?auto_2393482 ?auto_2393483 ?auto_2393484 ?auto_2393481 ?auto_2393485 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2393507 - SURFACE
      ?auto_2393508 - SURFACE
      ?auto_2393509 - SURFACE
      ?auto_2393506 - SURFACE
      ?auto_2393510 - SURFACE
    )
    :vars
    (
      ?auto_2393513 - HOIST
      ?auto_2393511 - PLACE
      ?auto_2393512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393513 ?auto_2393511 ) ( SURFACE-AT ?auto_2393506 ?auto_2393511 ) ( CLEAR ?auto_2393506 ) ( IS-CRATE ?auto_2393510 ) ( not ( = ?auto_2393506 ?auto_2393510 ) ) ( TRUCK-AT ?auto_2393512 ?auto_2393511 ) ( AVAILABLE ?auto_2393513 ) ( IN ?auto_2393510 ?auto_2393512 ) ( ON ?auto_2393506 ?auto_2393509 ) ( not ( = ?auto_2393509 ?auto_2393506 ) ) ( not ( = ?auto_2393509 ?auto_2393510 ) ) ( ON ?auto_2393508 ?auto_2393507 ) ( ON ?auto_2393509 ?auto_2393508 ) ( not ( = ?auto_2393507 ?auto_2393508 ) ) ( not ( = ?auto_2393507 ?auto_2393509 ) ) ( not ( = ?auto_2393507 ?auto_2393506 ) ) ( not ( = ?auto_2393507 ?auto_2393510 ) ) ( not ( = ?auto_2393508 ?auto_2393509 ) ) ( not ( = ?auto_2393508 ?auto_2393506 ) ) ( not ( = ?auto_2393508 ?auto_2393510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393509 ?auto_2393506 ?auto_2393510 )
      ( MAKE-4CRATE-VERIFY ?auto_2393507 ?auto_2393508 ?auto_2393509 ?auto_2393506 ?auto_2393510 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2393537 - SURFACE
      ?auto_2393538 - SURFACE
      ?auto_2393539 - SURFACE
      ?auto_2393536 - SURFACE
      ?auto_2393540 - SURFACE
    )
    :vars
    (
      ?auto_2393543 - HOIST
      ?auto_2393544 - PLACE
      ?auto_2393542 - TRUCK
      ?auto_2393541 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393543 ?auto_2393544 ) ( SURFACE-AT ?auto_2393536 ?auto_2393544 ) ( CLEAR ?auto_2393536 ) ( IS-CRATE ?auto_2393540 ) ( not ( = ?auto_2393536 ?auto_2393540 ) ) ( AVAILABLE ?auto_2393543 ) ( IN ?auto_2393540 ?auto_2393542 ) ( ON ?auto_2393536 ?auto_2393539 ) ( not ( = ?auto_2393539 ?auto_2393536 ) ) ( not ( = ?auto_2393539 ?auto_2393540 ) ) ( TRUCK-AT ?auto_2393542 ?auto_2393541 ) ( not ( = ?auto_2393541 ?auto_2393544 ) ) ( ON ?auto_2393538 ?auto_2393537 ) ( ON ?auto_2393539 ?auto_2393538 ) ( not ( = ?auto_2393537 ?auto_2393538 ) ) ( not ( = ?auto_2393537 ?auto_2393539 ) ) ( not ( = ?auto_2393537 ?auto_2393536 ) ) ( not ( = ?auto_2393537 ?auto_2393540 ) ) ( not ( = ?auto_2393538 ?auto_2393539 ) ) ( not ( = ?auto_2393538 ?auto_2393536 ) ) ( not ( = ?auto_2393538 ?auto_2393540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393539 ?auto_2393536 ?auto_2393540 )
      ( MAKE-4CRATE-VERIFY ?auto_2393537 ?auto_2393538 ?auto_2393539 ?auto_2393536 ?auto_2393540 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2393571 - SURFACE
      ?auto_2393572 - SURFACE
      ?auto_2393573 - SURFACE
      ?auto_2393570 - SURFACE
      ?auto_2393574 - SURFACE
    )
    :vars
    (
      ?auto_2393576 - HOIST
      ?auto_2393577 - PLACE
      ?auto_2393579 - TRUCK
      ?auto_2393575 - PLACE
      ?auto_2393578 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393576 ?auto_2393577 ) ( SURFACE-AT ?auto_2393570 ?auto_2393577 ) ( CLEAR ?auto_2393570 ) ( IS-CRATE ?auto_2393574 ) ( not ( = ?auto_2393570 ?auto_2393574 ) ) ( AVAILABLE ?auto_2393576 ) ( ON ?auto_2393570 ?auto_2393573 ) ( not ( = ?auto_2393573 ?auto_2393570 ) ) ( not ( = ?auto_2393573 ?auto_2393574 ) ) ( TRUCK-AT ?auto_2393579 ?auto_2393575 ) ( not ( = ?auto_2393575 ?auto_2393577 ) ) ( HOIST-AT ?auto_2393578 ?auto_2393575 ) ( LIFTING ?auto_2393578 ?auto_2393574 ) ( not ( = ?auto_2393576 ?auto_2393578 ) ) ( ON ?auto_2393572 ?auto_2393571 ) ( ON ?auto_2393573 ?auto_2393572 ) ( not ( = ?auto_2393571 ?auto_2393572 ) ) ( not ( = ?auto_2393571 ?auto_2393573 ) ) ( not ( = ?auto_2393571 ?auto_2393570 ) ) ( not ( = ?auto_2393571 ?auto_2393574 ) ) ( not ( = ?auto_2393572 ?auto_2393573 ) ) ( not ( = ?auto_2393572 ?auto_2393570 ) ) ( not ( = ?auto_2393572 ?auto_2393574 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393573 ?auto_2393570 ?auto_2393574 )
      ( MAKE-4CRATE-VERIFY ?auto_2393571 ?auto_2393572 ?auto_2393573 ?auto_2393570 ?auto_2393574 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2393609 - SURFACE
      ?auto_2393610 - SURFACE
      ?auto_2393611 - SURFACE
      ?auto_2393608 - SURFACE
      ?auto_2393612 - SURFACE
    )
    :vars
    (
      ?auto_2393615 - HOIST
      ?auto_2393613 - PLACE
      ?auto_2393618 - TRUCK
      ?auto_2393617 - PLACE
      ?auto_2393616 - HOIST
      ?auto_2393614 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393615 ?auto_2393613 ) ( SURFACE-AT ?auto_2393608 ?auto_2393613 ) ( CLEAR ?auto_2393608 ) ( IS-CRATE ?auto_2393612 ) ( not ( = ?auto_2393608 ?auto_2393612 ) ) ( AVAILABLE ?auto_2393615 ) ( ON ?auto_2393608 ?auto_2393611 ) ( not ( = ?auto_2393611 ?auto_2393608 ) ) ( not ( = ?auto_2393611 ?auto_2393612 ) ) ( TRUCK-AT ?auto_2393618 ?auto_2393617 ) ( not ( = ?auto_2393617 ?auto_2393613 ) ) ( HOIST-AT ?auto_2393616 ?auto_2393617 ) ( not ( = ?auto_2393615 ?auto_2393616 ) ) ( AVAILABLE ?auto_2393616 ) ( SURFACE-AT ?auto_2393612 ?auto_2393617 ) ( ON ?auto_2393612 ?auto_2393614 ) ( CLEAR ?auto_2393612 ) ( not ( = ?auto_2393608 ?auto_2393614 ) ) ( not ( = ?auto_2393612 ?auto_2393614 ) ) ( not ( = ?auto_2393611 ?auto_2393614 ) ) ( ON ?auto_2393610 ?auto_2393609 ) ( ON ?auto_2393611 ?auto_2393610 ) ( not ( = ?auto_2393609 ?auto_2393610 ) ) ( not ( = ?auto_2393609 ?auto_2393611 ) ) ( not ( = ?auto_2393609 ?auto_2393608 ) ) ( not ( = ?auto_2393609 ?auto_2393612 ) ) ( not ( = ?auto_2393609 ?auto_2393614 ) ) ( not ( = ?auto_2393610 ?auto_2393611 ) ) ( not ( = ?auto_2393610 ?auto_2393608 ) ) ( not ( = ?auto_2393610 ?auto_2393612 ) ) ( not ( = ?auto_2393610 ?auto_2393614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393611 ?auto_2393608 ?auto_2393612 )
      ( MAKE-4CRATE-VERIFY ?auto_2393609 ?auto_2393610 ?auto_2393611 ?auto_2393608 ?auto_2393612 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2393648 - SURFACE
      ?auto_2393649 - SURFACE
      ?auto_2393650 - SURFACE
      ?auto_2393647 - SURFACE
      ?auto_2393651 - SURFACE
    )
    :vars
    (
      ?auto_2393654 - HOIST
      ?auto_2393655 - PLACE
      ?auto_2393657 - PLACE
      ?auto_2393652 - HOIST
      ?auto_2393653 - SURFACE
      ?auto_2393656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393654 ?auto_2393655 ) ( SURFACE-AT ?auto_2393647 ?auto_2393655 ) ( CLEAR ?auto_2393647 ) ( IS-CRATE ?auto_2393651 ) ( not ( = ?auto_2393647 ?auto_2393651 ) ) ( AVAILABLE ?auto_2393654 ) ( ON ?auto_2393647 ?auto_2393650 ) ( not ( = ?auto_2393650 ?auto_2393647 ) ) ( not ( = ?auto_2393650 ?auto_2393651 ) ) ( not ( = ?auto_2393657 ?auto_2393655 ) ) ( HOIST-AT ?auto_2393652 ?auto_2393657 ) ( not ( = ?auto_2393654 ?auto_2393652 ) ) ( AVAILABLE ?auto_2393652 ) ( SURFACE-AT ?auto_2393651 ?auto_2393657 ) ( ON ?auto_2393651 ?auto_2393653 ) ( CLEAR ?auto_2393651 ) ( not ( = ?auto_2393647 ?auto_2393653 ) ) ( not ( = ?auto_2393651 ?auto_2393653 ) ) ( not ( = ?auto_2393650 ?auto_2393653 ) ) ( TRUCK-AT ?auto_2393656 ?auto_2393655 ) ( ON ?auto_2393649 ?auto_2393648 ) ( ON ?auto_2393650 ?auto_2393649 ) ( not ( = ?auto_2393648 ?auto_2393649 ) ) ( not ( = ?auto_2393648 ?auto_2393650 ) ) ( not ( = ?auto_2393648 ?auto_2393647 ) ) ( not ( = ?auto_2393648 ?auto_2393651 ) ) ( not ( = ?auto_2393648 ?auto_2393653 ) ) ( not ( = ?auto_2393649 ?auto_2393650 ) ) ( not ( = ?auto_2393649 ?auto_2393647 ) ) ( not ( = ?auto_2393649 ?auto_2393651 ) ) ( not ( = ?auto_2393649 ?auto_2393653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393650 ?auto_2393647 ?auto_2393651 )
      ( MAKE-4CRATE-VERIFY ?auto_2393648 ?auto_2393649 ?auto_2393650 ?auto_2393647 ?auto_2393651 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2393687 - SURFACE
      ?auto_2393688 - SURFACE
      ?auto_2393689 - SURFACE
      ?auto_2393686 - SURFACE
      ?auto_2393690 - SURFACE
    )
    :vars
    (
      ?auto_2393693 - HOIST
      ?auto_2393691 - PLACE
      ?auto_2393696 - PLACE
      ?auto_2393694 - HOIST
      ?auto_2393695 - SURFACE
      ?auto_2393692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393693 ?auto_2393691 ) ( IS-CRATE ?auto_2393690 ) ( not ( = ?auto_2393686 ?auto_2393690 ) ) ( not ( = ?auto_2393689 ?auto_2393686 ) ) ( not ( = ?auto_2393689 ?auto_2393690 ) ) ( not ( = ?auto_2393696 ?auto_2393691 ) ) ( HOIST-AT ?auto_2393694 ?auto_2393696 ) ( not ( = ?auto_2393693 ?auto_2393694 ) ) ( AVAILABLE ?auto_2393694 ) ( SURFACE-AT ?auto_2393690 ?auto_2393696 ) ( ON ?auto_2393690 ?auto_2393695 ) ( CLEAR ?auto_2393690 ) ( not ( = ?auto_2393686 ?auto_2393695 ) ) ( not ( = ?auto_2393690 ?auto_2393695 ) ) ( not ( = ?auto_2393689 ?auto_2393695 ) ) ( TRUCK-AT ?auto_2393692 ?auto_2393691 ) ( SURFACE-AT ?auto_2393689 ?auto_2393691 ) ( CLEAR ?auto_2393689 ) ( LIFTING ?auto_2393693 ?auto_2393686 ) ( IS-CRATE ?auto_2393686 ) ( ON ?auto_2393688 ?auto_2393687 ) ( ON ?auto_2393689 ?auto_2393688 ) ( not ( = ?auto_2393687 ?auto_2393688 ) ) ( not ( = ?auto_2393687 ?auto_2393689 ) ) ( not ( = ?auto_2393687 ?auto_2393686 ) ) ( not ( = ?auto_2393687 ?auto_2393690 ) ) ( not ( = ?auto_2393687 ?auto_2393695 ) ) ( not ( = ?auto_2393688 ?auto_2393689 ) ) ( not ( = ?auto_2393688 ?auto_2393686 ) ) ( not ( = ?auto_2393688 ?auto_2393690 ) ) ( not ( = ?auto_2393688 ?auto_2393695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393689 ?auto_2393686 ?auto_2393690 )
      ( MAKE-4CRATE-VERIFY ?auto_2393687 ?auto_2393688 ?auto_2393689 ?auto_2393686 ?auto_2393690 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2393726 - SURFACE
      ?auto_2393727 - SURFACE
      ?auto_2393728 - SURFACE
      ?auto_2393725 - SURFACE
      ?auto_2393729 - SURFACE
    )
    :vars
    (
      ?auto_2393731 - HOIST
      ?auto_2393733 - PLACE
      ?auto_2393734 - PLACE
      ?auto_2393730 - HOIST
      ?auto_2393735 - SURFACE
      ?auto_2393732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393731 ?auto_2393733 ) ( IS-CRATE ?auto_2393729 ) ( not ( = ?auto_2393725 ?auto_2393729 ) ) ( not ( = ?auto_2393728 ?auto_2393725 ) ) ( not ( = ?auto_2393728 ?auto_2393729 ) ) ( not ( = ?auto_2393734 ?auto_2393733 ) ) ( HOIST-AT ?auto_2393730 ?auto_2393734 ) ( not ( = ?auto_2393731 ?auto_2393730 ) ) ( AVAILABLE ?auto_2393730 ) ( SURFACE-AT ?auto_2393729 ?auto_2393734 ) ( ON ?auto_2393729 ?auto_2393735 ) ( CLEAR ?auto_2393729 ) ( not ( = ?auto_2393725 ?auto_2393735 ) ) ( not ( = ?auto_2393729 ?auto_2393735 ) ) ( not ( = ?auto_2393728 ?auto_2393735 ) ) ( TRUCK-AT ?auto_2393732 ?auto_2393733 ) ( SURFACE-AT ?auto_2393728 ?auto_2393733 ) ( CLEAR ?auto_2393728 ) ( IS-CRATE ?auto_2393725 ) ( AVAILABLE ?auto_2393731 ) ( IN ?auto_2393725 ?auto_2393732 ) ( ON ?auto_2393727 ?auto_2393726 ) ( ON ?auto_2393728 ?auto_2393727 ) ( not ( = ?auto_2393726 ?auto_2393727 ) ) ( not ( = ?auto_2393726 ?auto_2393728 ) ) ( not ( = ?auto_2393726 ?auto_2393725 ) ) ( not ( = ?auto_2393726 ?auto_2393729 ) ) ( not ( = ?auto_2393726 ?auto_2393735 ) ) ( not ( = ?auto_2393727 ?auto_2393728 ) ) ( not ( = ?auto_2393727 ?auto_2393725 ) ) ( not ( = ?auto_2393727 ?auto_2393729 ) ) ( not ( = ?auto_2393727 ?auto_2393735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393728 ?auto_2393725 ?auto_2393729 )
      ( MAKE-4CRATE-VERIFY ?auto_2393726 ?auto_2393727 ?auto_2393728 ?auto_2393725 ?auto_2393729 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2394226 - SURFACE
      ?auto_2394227 - SURFACE
    )
    :vars
    (
      ?auto_2394232 - HOIST
      ?auto_2394228 - PLACE
      ?auto_2394234 - SURFACE
      ?auto_2394233 - TRUCK
      ?auto_2394229 - PLACE
      ?auto_2394231 - HOIST
      ?auto_2394230 - SURFACE
      ?auto_2394235 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394232 ?auto_2394228 ) ( SURFACE-AT ?auto_2394226 ?auto_2394228 ) ( CLEAR ?auto_2394226 ) ( IS-CRATE ?auto_2394227 ) ( not ( = ?auto_2394226 ?auto_2394227 ) ) ( AVAILABLE ?auto_2394232 ) ( ON ?auto_2394226 ?auto_2394234 ) ( not ( = ?auto_2394234 ?auto_2394226 ) ) ( not ( = ?auto_2394234 ?auto_2394227 ) ) ( TRUCK-AT ?auto_2394233 ?auto_2394229 ) ( not ( = ?auto_2394229 ?auto_2394228 ) ) ( HOIST-AT ?auto_2394231 ?auto_2394229 ) ( not ( = ?auto_2394232 ?auto_2394231 ) ) ( SURFACE-AT ?auto_2394227 ?auto_2394229 ) ( ON ?auto_2394227 ?auto_2394230 ) ( CLEAR ?auto_2394227 ) ( not ( = ?auto_2394226 ?auto_2394230 ) ) ( not ( = ?auto_2394227 ?auto_2394230 ) ) ( not ( = ?auto_2394234 ?auto_2394230 ) ) ( LIFTING ?auto_2394231 ?auto_2394235 ) ( IS-CRATE ?auto_2394235 ) ( not ( = ?auto_2394226 ?auto_2394235 ) ) ( not ( = ?auto_2394227 ?auto_2394235 ) ) ( not ( = ?auto_2394234 ?auto_2394235 ) ) ( not ( = ?auto_2394230 ?auto_2394235 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2394231 ?auto_2394235 ?auto_2394233 ?auto_2394229 )
      ( MAKE-1CRATE ?auto_2394226 ?auto_2394227 )
      ( MAKE-1CRATE-VERIFY ?auto_2394226 ?auto_2394227 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2394386 - SURFACE
      ?auto_2394387 - SURFACE
      ?auto_2394388 - SURFACE
      ?auto_2394385 - SURFACE
      ?auto_2394389 - SURFACE
      ?auto_2394390 - SURFACE
    )
    :vars
    (
      ?auto_2394391 - HOIST
      ?auto_2394392 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394391 ?auto_2394392 ) ( SURFACE-AT ?auto_2394389 ?auto_2394392 ) ( CLEAR ?auto_2394389 ) ( LIFTING ?auto_2394391 ?auto_2394390 ) ( IS-CRATE ?auto_2394390 ) ( not ( = ?auto_2394389 ?auto_2394390 ) ) ( ON ?auto_2394387 ?auto_2394386 ) ( ON ?auto_2394388 ?auto_2394387 ) ( ON ?auto_2394385 ?auto_2394388 ) ( ON ?auto_2394389 ?auto_2394385 ) ( not ( = ?auto_2394386 ?auto_2394387 ) ) ( not ( = ?auto_2394386 ?auto_2394388 ) ) ( not ( = ?auto_2394386 ?auto_2394385 ) ) ( not ( = ?auto_2394386 ?auto_2394389 ) ) ( not ( = ?auto_2394386 ?auto_2394390 ) ) ( not ( = ?auto_2394387 ?auto_2394388 ) ) ( not ( = ?auto_2394387 ?auto_2394385 ) ) ( not ( = ?auto_2394387 ?auto_2394389 ) ) ( not ( = ?auto_2394387 ?auto_2394390 ) ) ( not ( = ?auto_2394388 ?auto_2394385 ) ) ( not ( = ?auto_2394388 ?auto_2394389 ) ) ( not ( = ?auto_2394388 ?auto_2394390 ) ) ( not ( = ?auto_2394385 ?auto_2394389 ) ) ( not ( = ?auto_2394385 ?auto_2394390 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2394389 ?auto_2394390 )
      ( MAKE-5CRATE-VERIFY ?auto_2394386 ?auto_2394387 ?auto_2394388 ?auto_2394385 ?auto_2394389 ?auto_2394390 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2394420 - SURFACE
      ?auto_2394421 - SURFACE
      ?auto_2394422 - SURFACE
      ?auto_2394419 - SURFACE
      ?auto_2394423 - SURFACE
      ?auto_2394424 - SURFACE
    )
    :vars
    (
      ?auto_2394426 - HOIST
      ?auto_2394427 - PLACE
      ?auto_2394425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394426 ?auto_2394427 ) ( SURFACE-AT ?auto_2394423 ?auto_2394427 ) ( CLEAR ?auto_2394423 ) ( IS-CRATE ?auto_2394424 ) ( not ( = ?auto_2394423 ?auto_2394424 ) ) ( TRUCK-AT ?auto_2394425 ?auto_2394427 ) ( AVAILABLE ?auto_2394426 ) ( IN ?auto_2394424 ?auto_2394425 ) ( ON ?auto_2394423 ?auto_2394419 ) ( not ( = ?auto_2394419 ?auto_2394423 ) ) ( not ( = ?auto_2394419 ?auto_2394424 ) ) ( ON ?auto_2394421 ?auto_2394420 ) ( ON ?auto_2394422 ?auto_2394421 ) ( ON ?auto_2394419 ?auto_2394422 ) ( not ( = ?auto_2394420 ?auto_2394421 ) ) ( not ( = ?auto_2394420 ?auto_2394422 ) ) ( not ( = ?auto_2394420 ?auto_2394419 ) ) ( not ( = ?auto_2394420 ?auto_2394423 ) ) ( not ( = ?auto_2394420 ?auto_2394424 ) ) ( not ( = ?auto_2394421 ?auto_2394422 ) ) ( not ( = ?auto_2394421 ?auto_2394419 ) ) ( not ( = ?auto_2394421 ?auto_2394423 ) ) ( not ( = ?auto_2394421 ?auto_2394424 ) ) ( not ( = ?auto_2394422 ?auto_2394419 ) ) ( not ( = ?auto_2394422 ?auto_2394423 ) ) ( not ( = ?auto_2394422 ?auto_2394424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2394419 ?auto_2394423 ?auto_2394424 )
      ( MAKE-5CRATE-VERIFY ?auto_2394420 ?auto_2394421 ?auto_2394422 ?auto_2394419 ?auto_2394423 ?auto_2394424 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2394460 - SURFACE
      ?auto_2394461 - SURFACE
      ?auto_2394462 - SURFACE
      ?auto_2394459 - SURFACE
      ?auto_2394463 - SURFACE
      ?auto_2394464 - SURFACE
    )
    :vars
    (
      ?auto_2394468 - HOIST
      ?auto_2394465 - PLACE
      ?auto_2394467 - TRUCK
      ?auto_2394466 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394468 ?auto_2394465 ) ( SURFACE-AT ?auto_2394463 ?auto_2394465 ) ( CLEAR ?auto_2394463 ) ( IS-CRATE ?auto_2394464 ) ( not ( = ?auto_2394463 ?auto_2394464 ) ) ( AVAILABLE ?auto_2394468 ) ( IN ?auto_2394464 ?auto_2394467 ) ( ON ?auto_2394463 ?auto_2394459 ) ( not ( = ?auto_2394459 ?auto_2394463 ) ) ( not ( = ?auto_2394459 ?auto_2394464 ) ) ( TRUCK-AT ?auto_2394467 ?auto_2394466 ) ( not ( = ?auto_2394466 ?auto_2394465 ) ) ( ON ?auto_2394461 ?auto_2394460 ) ( ON ?auto_2394462 ?auto_2394461 ) ( ON ?auto_2394459 ?auto_2394462 ) ( not ( = ?auto_2394460 ?auto_2394461 ) ) ( not ( = ?auto_2394460 ?auto_2394462 ) ) ( not ( = ?auto_2394460 ?auto_2394459 ) ) ( not ( = ?auto_2394460 ?auto_2394463 ) ) ( not ( = ?auto_2394460 ?auto_2394464 ) ) ( not ( = ?auto_2394461 ?auto_2394462 ) ) ( not ( = ?auto_2394461 ?auto_2394459 ) ) ( not ( = ?auto_2394461 ?auto_2394463 ) ) ( not ( = ?auto_2394461 ?auto_2394464 ) ) ( not ( = ?auto_2394462 ?auto_2394459 ) ) ( not ( = ?auto_2394462 ?auto_2394463 ) ) ( not ( = ?auto_2394462 ?auto_2394464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2394459 ?auto_2394463 ?auto_2394464 )
      ( MAKE-5CRATE-VERIFY ?auto_2394460 ?auto_2394461 ?auto_2394462 ?auto_2394459 ?auto_2394463 ?auto_2394464 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2394505 - SURFACE
      ?auto_2394506 - SURFACE
      ?auto_2394507 - SURFACE
      ?auto_2394504 - SURFACE
      ?auto_2394508 - SURFACE
      ?auto_2394509 - SURFACE
    )
    :vars
    (
      ?auto_2394512 - HOIST
      ?auto_2394513 - PLACE
      ?auto_2394510 - TRUCK
      ?auto_2394511 - PLACE
      ?auto_2394514 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394512 ?auto_2394513 ) ( SURFACE-AT ?auto_2394508 ?auto_2394513 ) ( CLEAR ?auto_2394508 ) ( IS-CRATE ?auto_2394509 ) ( not ( = ?auto_2394508 ?auto_2394509 ) ) ( AVAILABLE ?auto_2394512 ) ( ON ?auto_2394508 ?auto_2394504 ) ( not ( = ?auto_2394504 ?auto_2394508 ) ) ( not ( = ?auto_2394504 ?auto_2394509 ) ) ( TRUCK-AT ?auto_2394510 ?auto_2394511 ) ( not ( = ?auto_2394511 ?auto_2394513 ) ) ( HOIST-AT ?auto_2394514 ?auto_2394511 ) ( LIFTING ?auto_2394514 ?auto_2394509 ) ( not ( = ?auto_2394512 ?auto_2394514 ) ) ( ON ?auto_2394506 ?auto_2394505 ) ( ON ?auto_2394507 ?auto_2394506 ) ( ON ?auto_2394504 ?auto_2394507 ) ( not ( = ?auto_2394505 ?auto_2394506 ) ) ( not ( = ?auto_2394505 ?auto_2394507 ) ) ( not ( = ?auto_2394505 ?auto_2394504 ) ) ( not ( = ?auto_2394505 ?auto_2394508 ) ) ( not ( = ?auto_2394505 ?auto_2394509 ) ) ( not ( = ?auto_2394506 ?auto_2394507 ) ) ( not ( = ?auto_2394506 ?auto_2394504 ) ) ( not ( = ?auto_2394506 ?auto_2394508 ) ) ( not ( = ?auto_2394506 ?auto_2394509 ) ) ( not ( = ?auto_2394507 ?auto_2394504 ) ) ( not ( = ?auto_2394507 ?auto_2394508 ) ) ( not ( = ?auto_2394507 ?auto_2394509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2394504 ?auto_2394508 ?auto_2394509 )
      ( MAKE-5CRATE-VERIFY ?auto_2394505 ?auto_2394506 ?auto_2394507 ?auto_2394504 ?auto_2394508 ?auto_2394509 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2394555 - SURFACE
      ?auto_2394556 - SURFACE
      ?auto_2394557 - SURFACE
      ?auto_2394554 - SURFACE
      ?auto_2394558 - SURFACE
      ?auto_2394559 - SURFACE
    )
    :vars
    (
      ?auto_2394565 - HOIST
      ?auto_2394563 - PLACE
      ?auto_2394561 - TRUCK
      ?auto_2394560 - PLACE
      ?auto_2394564 - HOIST
      ?auto_2394562 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394565 ?auto_2394563 ) ( SURFACE-AT ?auto_2394558 ?auto_2394563 ) ( CLEAR ?auto_2394558 ) ( IS-CRATE ?auto_2394559 ) ( not ( = ?auto_2394558 ?auto_2394559 ) ) ( AVAILABLE ?auto_2394565 ) ( ON ?auto_2394558 ?auto_2394554 ) ( not ( = ?auto_2394554 ?auto_2394558 ) ) ( not ( = ?auto_2394554 ?auto_2394559 ) ) ( TRUCK-AT ?auto_2394561 ?auto_2394560 ) ( not ( = ?auto_2394560 ?auto_2394563 ) ) ( HOIST-AT ?auto_2394564 ?auto_2394560 ) ( not ( = ?auto_2394565 ?auto_2394564 ) ) ( AVAILABLE ?auto_2394564 ) ( SURFACE-AT ?auto_2394559 ?auto_2394560 ) ( ON ?auto_2394559 ?auto_2394562 ) ( CLEAR ?auto_2394559 ) ( not ( = ?auto_2394558 ?auto_2394562 ) ) ( not ( = ?auto_2394559 ?auto_2394562 ) ) ( not ( = ?auto_2394554 ?auto_2394562 ) ) ( ON ?auto_2394556 ?auto_2394555 ) ( ON ?auto_2394557 ?auto_2394556 ) ( ON ?auto_2394554 ?auto_2394557 ) ( not ( = ?auto_2394555 ?auto_2394556 ) ) ( not ( = ?auto_2394555 ?auto_2394557 ) ) ( not ( = ?auto_2394555 ?auto_2394554 ) ) ( not ( = ?auto_2394555 ?auto_2394558 ) ) ( not ( = ?auto_2394555 ?auto_2394559 ) ) ( not ( = ?auto_2394555 ?auto_2394562 ) ) ( not ( = ?auto_2394556 ?auto_2394557 ) ) ( not ( = ?auto_2394556 ?auto_2394554 ) ) ( not ( = ?auto_2394556 ?auto_2394558 ) ) ( not ( = ?auto_2394556 ?auto_2394559 ) ) ( not ( = ?auto_2394556 ?auto_2394562 ) ) ( not ( = ?auto_2394557 ?auto_2394554 ) ) ( not ( = ?auto_2394557 ?auto_2394558 ) ) ( not ( = ?auto_2394557 ?auto_2394559 ) ) ( not ( = ?auto_2394557 ?auto_2394562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2394554 ?auto_2394558 ?auto_2394559 )
      ( MAKE-5CRATE-VERIFY ?auto_2394555 ?auto_2394556 ?auto_2394557 ?auto_2394554 ?auto_2394558 ?auto_2394559 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2394606 - SURFACE
      ?auto_2394607 - SURFACE
      ?auto_2394608 - SURFACE
      ?auto_2394605 - SURFACE
      ?auto_2394609 - SURFACE
      ?auto_2394610 - SURFACE
    )
    :vars
    (
      ?auto_2394614 - HOIST
      ?auto_2394613 - PLACE
      ?auto_2394611 - PLACE
      ?auto_2394616 - HOIST
      ?auto_2394615 - SURFACE
      ?auto_2394612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394614 ?auto_2394613 ) ( SURFACE-AT ?auto_2394609 ?auto_2394613 ) ( CLEAR ?auto_2394609 ) ( IS-CRATE ?auto_2394610 ) ( not ( = ?auto_2394609 ?auto_2394610 ) ) ( AVAILABLE ?auto_2394614 ) ( ON ?auto_2394609 ?auto_2394605 ) ( not ( = ?auto_2394605 ?auto_2394609 ) ) ( not ( = ?auto_2394605 ?auto_2394610 ) ) ( not ( = ?auto_2394611 ?auto_2394613 ) ) ( HOIST-AT ?auto_2394616 ?auto_2394611 ) ( not ( = ?auto_2394614 ?auto_2394616 ) ) ( AVAILABLE ?auto_2394616 ) ( SURFACE-AT ?auto_2394610 ?auto_2394611 ) ( ON ?auto_2394610 ?auto_2394615 ) ( CLEAR ?auto_2394610 ) ( not ( = ?auto_2394609 ?auto_2394615 ) ) ( not ( = ?auto_2394610 ?auto_2394615 ) ) ( not ( = ?auto_2394605 ?auto_2394615 ) ) ( TRUCK-AT ?auto_2394612 ?auto_2394613 ) ( ON ?auto_2394607 ?auto_2394606 ) ( ON ?auto_2394608 ?auto_2394607 ) ( ON ?auto_2394605 ?auto_2394608 ) ( not ( = ?auto_2394606 ?auto_2394607 ) ) ( not ( = ?auto_2394606 ?auto_2394608 ) ) ( not ( = ?auto_2394606 ?auto_2394605 ) ) ( not ( = ?auto_2394606 ?auto_2394609 ) ) ( not ( = ?auto_2394606 ?auto_2394610 ) ) ( not ( = ?auto_2394606 ?auto_2394615 ) ) ( not ( = ?auto_2394607 ?auto_2394608 ) ) ( not ( = ?auto_2394607 ?auto_2394605 ) ) ( not ( = ?auto_2394607 ?auto_2394609 ) ) ( not ( = ?auto_2394607 ?auto_2394610 ) ) ( not ( = ?auto_2394607 ?auto_2394615 ) ) ( not ( = ?auto_2394608 ?auto_2394605 ) ) ( not ( = ?auto_2394608 ?auto_2394609 ) ) ( not ( = ?auto_2394608 ?auto_2394610 ) ) ( not ( = ?auto_2394608 ?auto_2394615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2394605 ?auto_2394609 ?auto_2394610 )
      ( MAKE-5CRATE-VERIFY ?auto_2394606 ?auto_2394607 ?auto_2394608 ?auto_2394605 ?auto_2394609 ?auto_2394610 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2394657 - SURFACE
      ?auto_2394658 - SURFACE
      ?auto_2394659 - SURFACE
      ?auto_2394656 - SURFACE
      ?auto_2394660 - SURFACE
      ?auto_2394661 - SURFACE
    )
    :vars
    (
      ?auto_2394665 - HOIST
      ?auto_2394666 - PLACE
      ?auto_2394667 - PLACE
      ?auto_2394663 - HOIST
      ?auto_2394664 - SURFACE
      ?auto_2394662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394665 ?auto_2394666 ) ( IS-CRATE ?auto_2394661 ) ( not ( = ?auto_2394660 ?auto_2394661 ) ) ( not ( = ?auto_2394656 ?auto_2394660 ) ) ( not ( = ?auto_2394656 ?auto_2394661 ) ) ( not ( = ?auto_2394667 ?auto_2394666 ) ) ( HOIST-AT ?auto_2394663 ?auto_2394667 ) ( not ( = ?auto_2394665 ?auto_2394663 ) ) ( AVAILABLE ?auto_2394663 ) ( SURFACE-AT ?auto_2394661 ?auto_2394667 ) ( ON ?auto_2394661 ?auto_2394664 ) ( CLEAR ?auto_2394661 ) ( not ( = ?auto_2394660 ?auto_2394664 ) ) ( not ( = ?auto_2394661 ?auto_2394664 ) ) ( not ( = ?auto_2394656 ?auto_2394664 ) ) ( TRUCK-AT ?auto_2394662 ?auto_2394666 ) ( SURFACE-AT ?auto_2394656 ?auto_2394666 ) ( CLEAR ?auto_2394656 ) ( LIFTING ?auto_2394665 ?auto_2394660 ) ( IS-CRATE ?auto_2394660 ) ( ON ?auto_2394658 ?auto_2394657 ) ( ON ?auto_2394659 ?auto_2394658 ) ( ON ?auto_2394656 ?auto_2394659 ) ( not ( = ?auto_2394657 ?auto_2394658 ) ) ( not ( = ?auto_2394657 ?auto_2394659 ) ) ( not ( = ?auto_2394657 ?auto_2394656 ) ) ( not ( = ?auto_2394657 ?auto_2394660 ) ) ( not ( = ?auto_2394657 ?auto_2394661 ) ) ( not ( = ?auto_2394657 ?auto_2394664 ) ) ( not ( = ?auto_2394658 ?auto_2394659 ) ) ( not ( = ?auto_2394658 ?auto_2394656 ) ) ( not ( = ?auto_2394658 ?auto_2394660 ) ) ( not ( = ?auto_2394658 ?auto_2394661 ) ) ( not ( = ?auto_2394658 ?auto_2394664 ) ) ( not ( = ?auto_2394659 ?auto_2394656 ) ) ( not ( = ?auto_2394659 ?auto_2394660 ) ) ( not ( = ?auto_2394659 ?auto_2394661 ) ) ( not ( = ?auto_2394659 ?auto_2394664 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2394656 ?auto_2394660 ?auto_2394661 )
      ( MAKE-5CRATE-VERIFY ?auto_2394657 ?auto_2394658 ?auto_2394659 ?auto_2394656 ?auto_2394660 ?auto_2394661 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2394708 - SURFACE
      ?auto_2394709 - SURFACE
      ?auto_2394710 - SURFACE
      ?auto_2394707 - SURFACE
      ?auto_2394711 - SURFACE
      ?auto_2394712 - SURFACE
    )
    :vars
    (
      ?auto_2394718 - HOIST
      ?auto_2394714 - PLACE
      ?auto_2394717 - PLACE
      ?auto_2394713 - HOIST
      ?auto_2394716 - SURFACE
      ?auto_2394715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394718 ?auto_2394714 ) ( IS-CRATE ?auto_2394712 ) ( not ( = ?auto_2394711 ?auto_2394712 ) ) ( not ( = ?auto_2394707 ?auto_2394711 ) ) ( not ( = ?auto_2394707 ?auto_2394712 ) ) ( not ( = ?auto_2394717 ?auto_2394714 ) ) ( HOIST-AT ?auto_2394713 ?auto_2394717 ) ( not ( = ?auto_2394718 ?auto_2394713 ) ) ( AVAILABLE ?auto_2394713 ) ( SURFACE-AT ?auto_2394712 ?auto_2394717 ) ( ON ?auto_2394712 ?auto_2394716 ) ( CLEAR ?auto_2394712 ) ( not ( = ?auto_2394711 ?auto_2394716 ) ) ( not ( = ?auto_2394712 ?auto_2394716 ) ) ( not ( = ?auto_2394707 ?auto_2394716 ) ) ( TRUCK-AT ?auto_2394715 ?auto_2394714 ) ( SURFACE-AT ?auto_2394707 ?auto_2394714 ) ( CLEAR ?auto_2394707 ) ( IS-CRATE ?auto_2394711 ) ( AVAILABLE ?auto_2394718 ) ( IN ?auto_2394711 ?auto_2394715 ) ( ON ?auto_2394709 ?auto_2394708 ) ( ON ?auto_2394710 ?auto_2394709 ) ( ON ?auto_2394707 ?auto_2394710 ) ( not ( = ?auto_2394708 ?auto_2394709 ) ) ( not ( = ?auto_2394708 ?auto_2394710 ) ) ( not ( = ?auto_2394708 ?auto_2394707 ) ) ( not ( = ?auto_2394708 ?auto_2394711 ) ) ( not ( = ?auto_2394708 ?auto_2394712 ) ) ( not ( = ?auto_2394708 ?auto_2394716 ) ) ( not ( = ?auto_2394709 ?auto_2394710 ) ) ( not ( = ?auto_2394709 ?auto_2394707 ) ) ( not ( = ?auto_2394709 ?auto_2394711 ) ) ( not ( = ?auto_2394709 ?auto_2394712 ) ) ( not ( = ?auto_2394709 ?auto_2394716 ) ) ( not ( = ?auto_2394710 ?auto_2394707 ) ) ( not ( = ?auto_2394710 ?auto_2394711 ) ) ( not ( = ?auto_2394710 ?auto_2394712 ) ) ( not ( = ?auto_2394710 ?auto_2394716 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2394707 ?auto_2394711 ?auto_2394712 )
      ( MAKE-5CRATE-VERIFY ?auto_2394708 ?auto_2394709 ?auto_2394710 ?auto_2394707 ?auto_2394711 ?auto_2394712 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2395699 - SURFACE
      ?auto_2395700 - SURFACE
    )
    :vars
    (
      ?auto_2395705 - HOIST
      ?auto_2395704 - PLACE
      ?auto_2395703 - SURFACE
      ?auto_2395707 - PLACE
      ?auto_2395702 - HOIST
      ?auto_2395701 - SURFACE
      ?auto_2395706 - TRUCK
      ?auto_2395708 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2395705 ?auto_2395704 ) ( SURFACE-AT ?auto_2395699 ?auto_2395704 ) ( CLEAR ?auto_2395699 ) ( IS-CRATE ?auto_2395700 ) ( not ( = ?auto_2395699 ?auto_2395700 ) ) ( ON ?auto_2395699 ?auto_2395703 ) ( not ( = ?auto_2395703 ?auto_2395699 ) ) ( not ( = ?auto_2395703 ?auto_2395700 ) ) ( not ( = ?auto_2395707 ?auto_2395704 ) ) ( HOIST-AT ?auto_2395702 ?auto_2395707 ) ( not ( = ?auto_2395705 ?auto_2395702 ) ) ( AVAILABLE ?auto_2395702 ) ( SURFACE-AT ?auto_2395700 ?auto_2395707 ) ( ON ?auto_2395700 ?auto_2395701 ) ( CLEAR ?auto_2395700 ) ( not ( = ?auto_2395699 ?auto_2395701 ) ) ( not ( = ?auto_2395700 ?auto_2395701 ) ) ( not ( = ?auto_2395703 ?auto_2395701 ) ) ( TRUCK-AT ?auto_2395706 ?auto_2395704 ) ( LIFTING ?auto_2395705 ?auto_2395708 ) ( IS-CRATE ?auto_2395708 ) ( not ( = ?auto_2395699 ?auto_2395708 ) ) ( not ( = ?auto_2395700 ?auto_2395708 ) ) ( not ( = ?auto_2395703 ?auto_2395708 ) ) ( not ( = ?auto_2395701 ?auto_2395708 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2395705 ?auto_2395708 ?auto_2395706 ?auto_2395704 )
      ( MAKE-1CRATE ?auto_2395699 ?auto_2395700 )
      ( MAKE-1CRATE-VERIFY ?auto_2395699 ?auto_2395700 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2395915 - SURFACE
      ?auto_2395916 - SURFACE
      ?auto_2395917 - SURFACE
      ?auto_2395914 - SURFACE
      ?auto_2395918 - SURFACE
      ?auto_2395920 - SURFACE
      ?auto_2395919 - SURFACE
    )
    :vars
    (
      ?auto_2395921 - HOIST
      ?auto_2395922 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2395921 ?auto_2395922 ) ( SURFACE-AT ?auto_2395920 ?auto_2395922 ) ( CLEAR ?auto_2395920 ) ( LIFTING ?auto_2395921 ?auto_2395919 ) ( IS-CRATE ?auto_2395919 ) ( not ( = ?auto_2395920 ?auto_2395919 ) ) ( ON ?auto_2395916 ?auto_2395915 ) ( ON ?auto_2395917 ?auto_2395916 ) ( ON ?auto_2395914 ?auto_2395917 ) ( ON ?auto_2395918 ?auto_2395914 ) ( ON ?auto_2395920 ?auto_2395918 ) ( not ( = ?auto_2395915 ?auto_2395916 ) ) ( not ( = ?auto_2395915 ?auto_2395917 ) ) ( not ( = ?auto_2395915 ?auto_2395914 ) ) ( not ( = ?auto_2395915 ?auto_2395918 ) ) ( not ( = ?auto_2395915 ?auto_2395920 ) ) ( not ( = ?auto_2395915 ?auto_2395919 ) ) ( not ( = ?auto_2395916 ?auto_2395917 ) ) ( not ( = ?auto_2395916 ?auto_2395914 ) ) ( not ( = ?auto_2395916 ?auto_2395918 ) ) ( not ( = ?auto_2395916 ?auto_2395920 ) ) ( not ( = ?auto_2395916 ?auto_2395919 ) ) ( not ( = ?auto_2395917 ?auto_2395914 ) ) ( not ( = ?auto_2395917 ?auto_2395918 ) ) ( not ( = ?auto_2395917 ?auto_2395920 ) ) ( not ( = ?auto_2395917 ?auto_2395919 ) ) ( not ( = ?auto_2395914 ?auto_2395918 ) ) ( not ( = ?auto_2395914 ?auto_2395920 ) ) ( not ( = ?auto_2395914 ?auto_2395919 ) ) ( not ( = ?auto_2395918 ?auto_2395920 ) ) ( not ( = ?auto_2395918 ?auto_2395919 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2395920 ?auto_2395919 )
      ( MAKE-6CRATE-VERIFY ?auto_2395915 ?auto_2395916 ?auto_2395917 ?auto_2395914 ?auto_2395918 ?auto_2395920 ?auto_2395919 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2395959 - SURFACE
      ?auto_2395960 - SURFACE
      ?auto_2395961 - SURFACE
      ?auto_2395958 - SURFACE
      ?auto_2395962 - SURFACE
      ?auto_2395964 - SURFACE
      ?auto_2395963 - SURFACE
    )
    :vars
    (
      ?auto_2395966 - HOIST
      ?auto_2395967 - PLACE
      ?auto_2395965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2395966 ?auto_2395967 ) ( SURFACE-AT ?auto_2395964 ?auto_2395967 ) ( CLEAR ?auto_2395964 ) ( IS-CRATE ?auto_2395963 ) ( not ( = ?auto_2395964 ?auto_2395963 ) ) ( TRUCK-AT ?auto_2395965 ?auto_2395967 ) ( AVAILABLE ?auto_2395966 ) ( IN ?auto_2395963 ?auto_2395965 ) ( ON ?auto_2395964 ?auto_2395962 ) ( not ( = ?auto_2395962 ?auto_2395964 ) ) ( not ( = ?auto_2395962 ?auto_2395963 ) ) ( ON ?auto_2395960 ?auto_2395959 ) ( ON ?auto_2395961 ?auto_2395960 ) ( ON ?auto_2395958 ?auto_2395961 ) ( ON ?auto_2395962 ?auto_2395958 ) ( not ( = ?auto_2395959 ?auto_2395960 ) ) ( not ( = ?auto_2395959 ?auto_2395961 ) ) ( not ( = ?auto_2395959 ?auto_2395958 ) ) ( not ( = ?auto_2395959 ?auto_2395962 ) ) ( not ( = ?auto_2395959 ?auto_2395964 ) ) ( not ( = ?auto_2395959 ?auto_2395963 ) ) ( not ( = ?auto_2395960 ?auto_2395961 ) ) ( not ( = ?auto_2395960 ?auto_2395958 ) ) ( not ( = ?auto_2395960 ?auto_2395962 ) ) ( not ( = ?auto_2395960 ?auto_2395964 ) ) ( not ( = ?auto_2395960 ?auto_2395963 ) ) ( not ( = ?auto_2395961 ?auto_2395958 ) ) ( not ( = ?auto_2395961 ?auto_2395962 ) ) ( not ( = ?auto_2395961 ?auto_2395964 ) ) ( not ( = ?auto_2395961 ?auto_2395963 ) ) ( not ( = ?auto_2395958 ?auto_2395962 ) ) ( not ( = ?auto_2395958 ?auto_2395964 ) ) ( not ( = ?auto_2395958 ?auto_2395963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2395962 ?auto_2395964 ?auto_2395963 )
      ( MAKE-6CRATE-VERIFY ?auto_2395959 ?auto_2395960 ?auto_2395961 ?auto_2395958 ?auto_2395962 ?auto_2395964 ?auto_2395963 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2396010 - SURFACE
      ?auto_2396011 - SURFACE
      ?auto_2396012 - SURFACE
      ?auto_2396009 - SURFACE
      ?auto_2396013 - SURFACE
      ?auto_2396015 - SURFACE
      ?auto_2396014 - SURFACE
    )
    :vars
    (
      ?auto_2396017 - HOIST
      ?auto_2396016 - PLACE
      ?auto_2396018 - TRUCK
      ?auto_2396019 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396017 ?auto_2396016 ) ( SURFACE-AT ?auto_2396015 ?auto_2396016 ) ( CLEAR ?auto_2396015 ) ( IS-CRATE ?auto_2396014 ) ( not ( = ?auto_2396015 ?auto_2396014 ) ) ( AVAILABLE ?auto_2396017 ) ( IN ?auto_2396014 ?auto_2396018 ) ( ON ?auto_2396015 ?auto_2396013 ) ( not ( = ?auto_2396013 ?auto_2396015 ) ) ( not ( = ?auto_2396013 ?auto_2396014 ) ) ( TRUCK-AT ?auto_2396018 ?auto_2396019 ) ( not ( = ?auto_2396019 ?auto_2396016 ) ) ( ON ?auto_2396011 ?auto_2396010 ) ( ON ?auto_2396012 ?auto_2396011 ) ( ON ?auto_2396009 ?auto_2396012 ) ( ON ?auto_2396013 ?auto_2396009 ) ( not ( = ?auto_2396010 ?auto_2396011 ) ) ( not ( = ?auto_2396010 ?auto_2396012 ) ) ( not ( = ?auto_2396010 ?auto_2396009 ) ) ( not ( = ?auto_2396010 ?auto_2396013 ) ) ( not ( = ?auto_2396010 ?auto_2396015 ) ) ( not ( = ?auto_2396010 ?auto_2396014 ) ) ( not ( = ?auto_2396011 ?auto_2396012 ) ) ( not ( = ?auto_2396011 ?auto_2396009 ) ) ( not ( = ?auto_2396011 ?auto_2396013 ) ) ( not ( = ?auto_2396011 ?auto_2396015 ) ) ( not ( = ?auto_2396011 ?auto_2396014 ) ) ( not ( = ?auto_2396012 ?auto_2396009 ) ) ( not ( = ?auto_2396012 ?auto_2396013 ) ) ( not ( = ?auto_2396012 ?auto_2396015 ) ) ( not ( = ?auto_2396012 ?auto_2396014 ) ) ( not ( = ?auto_2396009 ?auto_2396013 ) ) ( not ( = ?auto_2396009 ?auto_2396015 ) ) ( not ( = ?auto_2396009 ?auto_2396014 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396013 ?auto_2396015 ?auto_2396014 )
      ( MAKE-6CRATE-VERIFY ?auto_2396010 ?auto_2396011 ?auto_2396012 ?auto_2396009 ?auto_2396013 ?auto_2396015 ?auto_2396014 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2396067 - SURFACE
      ?auto_2396068 - SURFACE
      ?auto_2396069 - SURFACE
      ?auto_2396066 - SURFACE
      ?auto_2396070 - SURFACE
      ?auto_2396072 - SURFACE
      ?auto_2396071 - SURFACE
    )
    :vars
    (
      ?auto_2396076 - HOIST
      ?auto_2396073 - PLACE
      ?auto_2396074 - TRUCK
      ?auto_2396077 - PLACE
      ?auto_2396075 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396076 ?auto_2396073 ) ( SURFACE-AT ?auto_2396072 ?auto_2396073 ) ( CLEAR ?auto_2396072 ) ( IS-CRATE ?auto_2396071 ) ( not ( = ?auto_2396072 ?auto_2396071 ) ) ( AVAILABLE ?auto_2396076 ) ( ON ?auto_2396072 ?auto_2396070 ) ( not ( = ?auto_2396070 ?auto_2396072 ) ) ( not ( = ?auto_2396070 ?auto_2396071 ) ) ( TRUCK-AT ?auto_2396074 ?auto_2396077 ) ( not ( = ?auto_2396077 ?auto_2396073 ) ) ( HOIST-AT ?auto_2396075 ?auto_2396077 ) ( LIFTING ?auto_2396075 ?auto_2396071 ) ( not ( = ?auto_2396076 ?auto_2396075 ) ) ( ON ?auto_2396068 ?auto_2396067 ) ( ON ?auto_2396069 ?auto_2396068 ) ( ON ?auto_2396066 ?auto_2396069 ) ( ON ?auto_2396070 ?auto_2396066 ) ( not ( = ?auto_2396067 ?auto_2396068 ) ) ( not ( = ?auto_2396067 ?auto_2396069 ) ) ( not ( = ?auto_2396067 ?auto_2396066 ) ) ( not ( = ?auto_2396067 ?auto_2396070 ) ) ( not ( = ?auto_2396067 ?auto_2396072 ) ) ( not ( = ?auto_2396067 ?auto_2396071 ) ) ( not ( = ?auto_2396068 ?auto_2396069 ) ) ( not ( = ?auto_2396068 ?auto_2396066 ) ) ( not ( = ?auto_2396068 ?auto_2396070 ) ) ( not ( = ?auto_2396068 ?auto_2396072 ) ) ( not ( = ?auto_2396068 ?auto_2396071 ) ) ( not ( = ?auto_2396069 ?auto_2396066 ) ) ( not ( = ?auto_2396069 ?auto_2396070 ) ) ( not ( = ?auto_2396069 ?auto_2396072 ) ) ( not ( = ?auto_2396069 ?auto_2396071 ) ) ( not ( = ?auto_2396066 ?auto_2396070 ) ) ( not ( = ?auto_2396066 ?auto_2396072 ) ) ( not ( = ?auto_2396066 ?auto_2396071 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396070 ?auto_2396072 ?auto_2396071 )
      ( MAKE-6CRATE-VERIFY ?auto_2396067 ?auto_2396068 ?auto_2396069 ?auto_2396066 ?auto_2396070 ?auto_2396072 ?auto_2396071 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2396130 - SURFACE
      ?auto_2396131 - SURFACE
      ?auto_2396132 - SURFACE
      ?auto_2396129 - SURFACE
      ?auto_2396133 - SURFACE
      ?auto_2396135 - SURFACE
      ?auto_2396134 - SURFACE
    )
    :vars
    (
      ?auto_2396140 - HOIST
      ?auto_2396139 - PLACE
      ?auto_2396136 - TRUCK
      ?auto_2396137 - PLACE
      ?auto_2396138 - HOIST
      ?auto_2396141 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396140 ?auto_2396139 ) ( SURFACE-AT ?auto_2396135 ?auto_2396139 ) ( CLEAR ?auto_2396135 ) ( IS-CRATE ?auto_2396134 ) ( not ( = ?auto_2396135 ?auto_2396134 ) ) ( AVAILABLE ?auto_2396140 ) ( ON ?auto_2396135 ?auto_2396133 ) ( not ( = ?auto_2396133 ?auto_2396135 ) ) ( not ( = ?auto_2396133 ?auto_2396134 ) ) ( TRUCK-AT ?auto_2396136 ?auto_2396137 ) ( not ( = ?auto_2396137 ?auto_2396139 ) ) ( HOIST-AT ?auto_2396138 ?auto_2396137 ) ( not ( = ?auto_2396140 ?auto_2396138 ) ) ( AVAILABLE ?auto_2396138 ) ( SURFACE-AT ?auto_2396134 ?auto_2396137 ) ( ON ?auto_2396134 ?auto_2396141 ) ( CLEAR ?auto_2396134 ) ( not ( = ?auto_2396135 ?auto_2396141 ) ) ( not ( = ?auto_2396134 ?auto_2396141 ) ) ( not ( = ?auto_2396133 ?auto_2396141 ) ) ( ON ?auto_2396131 ?auto_2396130 ) ( ON ?auto_2396132 ?auto_2396131 ) ( ON ?auto_2396129 ?auto_2396132 ) ( ON ?auto_2396133 ?auto_2396129 ) ( not ( = ?auto_2396130 ?auto_2396131 ) ) ( not ( = ?auto_2396130 ?auto_2396132 ) ) ( not ( = ?auto_2396130 ?auto_2396129 ) ) ( not ( = ?auto_2396130 ?auto_2396133 ) ) ( not ( = ?auto_2396130 ?auto_2396135 ) ) ( not ( = ?auto_2396130 ?auto_2396134 ) ) ( not ( = ?auto_2396130 ?auto_2396141 ) ) ( not ( = ?auto_2396131 ?auto_2396132 ) ) ( not ( = ?auto_2396131 ?auto_2396129 ) ) ( not ( = ?auto_2396131 ?auto_2396133 ) ) ( not ( = ?auto_2396131 ?auto_2396135 ) ) ( not ( = ?auto_2396131 ?auto_2396134 ) ) ( not ( = ?auto_2396131 ?auto_2396141 ) ) ( not ( = ?auto_2396132 ?auto_2396129 ) ) ( not ( = ?auto_2396132 ?auto_2396133 ) ) ( not ( = ?auto_2396132 ?auto_2396135 ) ) ( not ( = ?auto_2396132 ?auto_2396134 ) ) ( not ( = ?auto_2396132 ?auto_2396141 ) ) ( not ( = ?auto_2396129 ?auto_2396133 ) ) ( not ( = ?auto_2396129 ?auto_2396135 ) ) ( not ( = ?auto_2396129 ?auto_2396134 ) ) ( not ( = ?auto_2396129 ?auto_2396141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396133 ?auto_2396135 ?auto_2396134 )
      ( MAKE-6CRATE-VERIFY ?auto_2396130 ?auto_2396131 ?auto_2396132 ?auto_2396129 ?auto_2396133 ?auto_2396135 ?auto_2396134 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2396194 - SURFACE
      ?auto_2396195 - SURFACE
      ?auto_2396196 - SURFACE
      ?auto_2396193 - SURFACE
      ?auto_2396197 - SURFACE
      ?auto_2396199 - SURFACE
      ?auto_2396198 - SURFACE
    )
    :vars
    (
      ?auto_2396200 - HOIST
      ?auto_2396202 - PLACE
      ?auto_2396205 - PLACE
      ?auto_2396204 - HOIST
      ?auto_2396201 - SURFACE
      ?auto_2396203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396200 ?auto_2396202 ) ( SURFACE-AT ?auto_2396199 ?auto_2396202 ) ( CLEAR ?auto_2396199 ) ( IS-CRATE ?auto_2396198 ) ( not ( = ?auto_2396199 ?auto_2396198 ) ) ( AVAILABLE ?auto_2396200 ) ( ON ?auto_2396199 ?auto_2396197 ) ( not ( = ?auto_2396197 ?auto_2396199 ) ) ( not ( = ?auto_2396197 ?auto_2396198 ) ) ( not ( = ?auto_2396205 ?auto_2396202 ) ) ( HOIST-AT ?auto_2396204 ?auto_2396205 ) ( not ( = ?auto_2396200 ?auto_2396204 ) ) ( AVAILABLE ?auto_2396204 ) ( SURFACE-AT ?auto_2396198 ?auto_2396205 ) ( ON ?auto_2396198 ?auto_2396201 ) ( CLEAR ?auto_2396198 ) ( not ( = ?auto_2396199 ?auto_2396201 ) ) ( not ( = ?auto_2396198 ?auto_2396201 ) ) ( not ( = ?auto_2396197 ?auto_2396201 ) ) ( TRUCK-AT ?auto_2396203 ?auto_2396202 ) ( ON ?auto_2396195 ?auto_2396194 ) ( ON ?auto_2396196 ?auto_2396195 ) ( ON ?auto_2396193 ?auto_2396196 ) ( ON ?auto_2396197 ?auto_2396193 ) ( not ( = ?auto_2396194 ?auto_2396195 ) ) ( not ( = ?auto_2396194 ?auto_2396196 ) ) ( not ( = ?auto_2396194 ?auto_2396193 ) ) ( not ( = ?auto_2396194 ?auto_2396197 ) ) ( not ( = ?auto_2396194 ?auto_2396199 ) ) ( not ( = ?auto_2396194 ?auto_2396198 ) ) ( not ( = ?auto_2396194 ?auto_2396201 ) ) ( not ( = ?auto_2396195 ?auto_2396196 ) ) ( not ( = ?auto_2396195 ?auto_2396193 ) ) ( not ( = ?auto_2396195 ?auto_2396197 ) ) ( not ( = ?auto_2396195 ?auto_2396199 ) ) ( not ( = ?auto_2396195 ?auto_2396198 ) ) ( not ( = ?auto_2396195 ?auto_2396201 ) ) ( not ( = ?auto_2396196 ?auto_2396193 ) ) ( not ( = ?auto_2396196 ?auto_2396197 ) ) ( not ( = ?auto_2396196 ?auto_2396199 ) ) ( not ( = ?auto_2396196 ?auto_2396198 ) ) ( not ( = ?auto_2396196 ?auto_2396201 ) ) ( not ( = ?auto_2396193 ?auto_2396197 ) ) ( not ( = ?auto_2396193 ?auto_2396199 ) ) ( not ( = ?auto_2396193 ?auto_2396198 ) ) ( not ( = ?auto_2396193 ?auto_2396201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396197 ?auto_2396199 ?auto_2396198 )
      ( MAKE-6CRATE-VERIFY ?auto_2396194 ?auto_2396195 ?auto_2396196 ?auto_2396193 ?auto_2396197 ?auto_2396199 ?auto_2396198 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2396258 - SURFACE
      ?auto_2396259 - SURFACE
      ?auto_2396260 - SURFACE
      ?auto_2396257 - SURFACE
      ?auto_2396261 - SURFACE
      ?auto_2396263 - SURFACE
      ?auto_2396262 - SURFACE
    )
    :vars
    (
      ?auto_2396269 - HOIST
      ?auto_2396264 - PLACE
      ?auto_2396265 - PLACE
      ?auto_2396268 - HOIST
      ?auto_2396266 - SURFACE
      ?auto_2396267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396269 ?auto_2396264 ) ( IS-CRATE ?auto_2396262 ) ( not ( = ?auto_2396263 ?auto_2396262 ) ) ( not ( = ?auto_2396261 ?auto_2396263 ) ) ( not ( = ?auto_2396261 ?auto_2396262 ) ) ( not ( = ?auto_2396265 ?auto_2396264 ) ) ( HOIST-AT ?auto_2396268 ?auto_2396265 ) ( not ( = ?auto_2396269 ?auto_2396268 ) ) ( AVAILABLE ?auto_2396268 ) ( SURFACE-AT ?auto_2396262 ?auto_2396265 ) ( ON ?auto_2396262 ?auto_2396266 ) ( CLEAR ?auto_2396262 ) ( not ( = ?auto_2396263 ?auto_2396266 ) ) ( not ( = ?auto_2396262 ?auto_2396266 ) ) ( not ( = ?auto_2396261 ?auto_2396266 ) ) ( TRUCK-AT ?auto_2396267 ?auto_2396264 ) ( SURFACE-AT ?auto_2396261 ?auto_2396264 ) ( CLEAR ?auto_2396261 ) ( LIFTING ?auto_2396269 ?auto_2396263 ) ( IS-CRATE ?auto_2396263 ) ( ON ?auto_2396259 ?auto_2396258 ) ( ON ?auto_2396260 ?auto_2396259 ) ( ON ?auto_2396257 ?auto_2396260 ) ( ON ?auto_2396261 ?auto_2396257 ) ( not ( = ?auto_2396258 ?auto_2396259 ) ) ( not ( = ?auto_2396258 ?auto_2396260 ) ) ( not ( = ?auto_2396258 ?auto_2396257 ) ) ( not ( = ?auto_2396258 ?auto_2396261 ) ) ( not ( = ?auto_2396258 ?auto_2396263 ) ) ( not ( = ?auto_2396258 ?auto_2396262 ) ) ( not ( = ?auto_2396258 ?auto_2396266 ) ) ( not ( = ?auto_2396259 ?auto_2396260 ) ) ( not ( = ?auto_2396259 ?auto_2396257 ) ) ( not ( = ?auto_2396259 ?auto_2396261 ) ) ( not ( = ?auto_2396259 ?auto_2396263 ) ) ( not ( = ?auto_2396259 ?auto_2396262 ) ) ( not ( = ?auto_2396259 ?auto_2396266 ) ) ( not ( = ?auto_2396260 ?auto_2396257 ) ) ( not ( = ?auto_2396260 ?auto_2396261 ) ) ( not ( = ?auto_2396260 ?auto_2396263 ) ) ( not ( = ?auto_2396260 ?auto_2396262 ) ) ( not ( = ?auto_2396260 ?auto_2396266 ) ) ( not ( = ?auto_2396257 ?auto_2396261 ) ) ( not ( = ?auto_2396257 ?auto_2396263 ) ) ( not ( = ?auto_2396257 ?auto_2396262 ) ) ( not ( = ?auto_2396257 ?auto_2396266 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396261 ?auto_2396263 ?auto_2396262 )
      ( MAKE-6CRATE-VERIFY ?auto_2396258 ?auto_2396259 ?auto_2396260 ?auto_2396257 ?auto_2396261 ?auto_2396263 ?auto_2396262 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2396322 - SURFACE
      ?auto_2396323 - SURFACE
      ?auto_2396324 - SURFACE
      ?auto_2396321 - SURFACE
      ?auto_2396325 - SURFACE
      ?auto_2396327 - SURFACE
      ?auto_2396326 - SURFACE
    )
    :vars
    (
      ?auto_2396330 - HOIST
      ?auto_2396333 - PLACE
      ?auto_2396332 - PLACE
      ?auto_2396331 - HOIST
      ?auto_2396329 - SURFACE
      ?auto_2396328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396330 ?auto_2396333 ) ( IS-CRATE ?auto_2396326 ) ( not ( = ?auto_2396327 ?auto_2396326 ) ) ( not ( = ?auto_2396325 ?auto_2396327 ) ) ( not ( = ?auto_2396325 ?auto_2396326 ) ) ( not ( = ?auto_2396332 ?auto_2396333 ) ) ( HOIST-AT ?auto_2396331 ?auto_2396332 ) ( not ( = ?auto_2396330 ?auto_2396331 ) ) ( AVAILABLE ?auto_2396331 ) ( SURFACE-AT ?auto_2396326 ?auto_2396332 ) ( ON ?auto_2396326 ?auto_2396329 ) ( CLEAR ?auto_2396326 ) ( not ( = ?auto_2396327 ?auto_2396329 ) ) ( not ( = ?auto_2396326 ?auto_2396329 ) ) ( not ( = ?auto_2396325 ?auto_2396329 ) ) ( TRUCK-AT ?auto_2396328 ?auto_2396333 ) ( SURFACE-AT ?auto_2396325 ?auto_2396333 ) ( CLEAR ?auto_2396325 ) ( IS-CRATE ?auto_2396327 ) ( AVAILABLE ?auto_2396330 ) ( IN ?auto_2396327 ?auto_2396328 ) ( ON ?auto_2396323 ?auto_2396322 ) ( ON ?auto_2396324 ?auto_2396323 ) ( ON ?auto_2396321 ?auto_2396324 ) ( ON ?auto_2396325 ?auto_2396321 ) ( not ( = ?auto_2396322 ?auto_2396323 ) ) ( not ( = ?auto_2396322 ?auto_2396324 ) ) ( not ( = ?auto_2396322 ?auto_2396321 ) ) ( not ( = ?auto_2396322 ?auto_2396325 ) ) ( not ( = ?auto_2396322 ?auto_2396327 ) ) ( not ( = ?auto_2396322 ?auto_2396326 ) ) ( not ( = ?auto_2396322 ?auto_2396329 ) ) ( not ( = ?auto_2396323 ?auto_2396324 ) ) ( not ( = ?auto_2396323 ?auto_2396321 ) ) ( not ( = ?auto_2396323 ?auto_2396325 ) ) ( not ( = ?auto_2396323 ?auto_2396327 ) ) ( not ( = ?auto_2396323 ?auto_2396326 ) ) ( not ( = ?auto_2396323 ?auto_2396329 ) ) ( not ( = ?auto_2396324 ?auto_2396321 ) ) ( not ( = ?auto_2396324 ?auto_2396325 ) ) ( not ( = ?auto_2396324 ?auto_2396327 ) ) ( not ( = ?auto_2396324 ?auto_2396326 ) ) ( not ( = ?auto_2396324 ?auto_2396329 ) ) ( not ( = ?auto_2396321 ?auto_2396325 ) ) ( not ( = ?auto_2396321 ?auto_2396327 ) ) ( not ( = ?auto_2396321 ?auto_2396326 ) ) ( not ( = ?auto_2396321 ?auto_2396329 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396325 ?auto_2396327 ?auto_2396326 )
      ( MAKE-6CRATE-VERIFY ?auto_2396322 ?auto_2396323 ?auto_2396324 ?auto_2396321 ?auto_2396325 ?auto_2396327 ?auto_2396326 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2398278 - SURFACE
      ?auto_2398279 - SURFACE
      ?auto_2398280 - SURFACE
      ?auto_2398277 - SURFACE
      ?auto_2398281 - SURFACE
      ?auto_2398283 - SURFACE
      ?auto_2398282 - SURFACE
      ?auto_2398284 - SURFACE
    )
    :vars
    (
      ?auto_2398285 - HOIST
      ?auto_2398286 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2398285 ?auto_2398286 ) ( SURFACE-AT ?auto_2398282 ?auto_2398286 ) ( CLEAR ?auto_2398282 ) ( LIFTING ?auto_2398285 ?auto_2398284 ) ( IS-CRATE ?auto_2398284 ) ( not ( = ?auto_2398282 ?auto_2398284 ) ) ( ON ?auto_2398279 ?auto_2398278 ) ( ON ?auto_2398280 ?auto_2398279 ) ( ON ?auto_2398277 ?auto_2398280 ) ( ON ?auto_2398281 ?auto_2398277 ) ( ON ?auto_2398283 ?auto_2398281 ) ( ON ?auto_2398282 ?auto_2398283 ) ( not ( = ?auto_2398278 ?auto_2398279 ) ) ( not ( = ?auto_2398278 ?auto_2398280 ) ) ( not ( = ?auto_2398278 ?auto_2398277 ) ) ( not ( = ?auto_2398278 ?auto_2398281 ) ) ( not ( = ?auto_2398278 ?auto_2398283 ) ) ( not ( = ?auto_2398278 ?auto_2398282 ) ) ( not ( = ?auto_2398278 ?auto_2398284 ) ) ( not ( = ?auto_2398279 ?auto_2398280 ) ) ( not ( = ?auto_2398279 ?auto_2398277 ) ) ( not ( = ?auto_2398279 ?auto_2398281 ) ) ( not ( = ?auto_2398279 ?auto_2398283 ) ) ( not ( = ?auto_2398279 ?auto_2398282 ) ) ( not ( = ?auto_2398279 ?auto_2398284 ) ) ( not ( = ?auto_2398280 ?auto_2398277 ) ) ( not ( = ?auto_2398280 ?auto_2398281 ) ) ( not ( = ?auto_2398280 ?auto_2398283 ) ) ( not ( = ?auto_2398280 ?auto_2398282 ) ) ( not ( = ?auto_2398280 ?auto_2398284 ) ) ( not ( = ?auto_2398277 ?auto_2398281 ) ) ( not ( = ?auto_2398277 ?auto_2398283 ) ) ( not ( = ?auto_2398277 ?auto_2398282 ) ) ( not ( = ?auto_2398277 ?auto_2398284 ) ) ( not ( = ?auto_2398281 ?auto_2398283 ) ) ( not ( = ?auto_2398281 ?auto_2398282 ) ) ( not ( = ?auto_2398281 ?auto_2398284 ) ) ( not ( = ?auto_2398283 ?auto_2398282 ) ) ( not ( = ?auto_2398283 ?auto_2398284 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2398282 ?auto_2398284 )
      ( MAKE-7CRATE-VERIFY ?auto_2398278 ?auto_2398279 ?auto_2398280 ?auto_2398277 ?auto_2398281 ?auto_2398283 ?auto_2398282 ?auto_2398284 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2398333 - SURFACE
      ?auto_2398334 - SURFACE
      ?auto_2398335 - SURFACE
      ?auto_2398332 - SURFACE
      ?auto_2398336 - SURFACE
      ?auto_2398338 - SURFACE
      ?auto_2398337 - SURFACE
      ?auto_2398339 - SURFACE
    )
    :vars
    (
      ?auto_2398341 - HOIST
      ?auto_2398342 - PLACE
      ?auto_2398340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2398341 ?auto_2398342 ) ( SURFACE-AT ?auto_2398337 ?auto_2398342 ) ( CLEAR ?auto_2398337 ) ( IS-CRATE ?auto_2398339 ) ( not ( = ?auto_2398337 ?auto_2398339 ) ) ( TRUCK-AT ?auto_2398340 ?auto_2398342 ) ( AVAILABLE ?auto_2398341 ) ( IN ?auto_2398339 ?auto_2398340 ) ( ON ?auto_2398337 ?auto_2398338 ) ( not ( = ?auto_2398338 ?auto_2398337 ) ) ( not ( = ?auto_2398338 ?auto_2398339 ) ) ( ON ?auto_2398334 ?auto_2398333 ) ( ON ?auto_2398335 ?auto_2398334 ) ( ON ?auto_2398332 ?auto_2398335 ) ( ON ?auto_2398336 ?auto_2398332 ) ( ON ?auto_2398338 ?auto_2398336 ) ( not ( = ?auto_2398333 ?auto_2398334 ) ) ( not ( = ?auto_2398333 ?auto_2398335 ) ) ( not ( = ?auto_2398333 ?auto_2398332 ) ) ( not ( = ?auto_2398333 ?auto_2398336 ) ) ( not ( = ?auto_2398333 ?auto_2398338 ) ) ( not ( = ?auto_2398333 ?auto_2398337 ) ) ( not ( = ?auto_2398333 ?auto_2398339 ) ) ( not ( = ?auto_2398334 ?auto_2398335 ) ) ( not ( = ?auto_2398334 ?auto_2398332 ) ) ( not ( = ?auto_2398334 ?auto_2398336 ) ) ( not ( = ?auto_2398334 ?auto_2398338 ) ) ( not ( = ?auto_2398334 ?auto_2398337 ) ) ( not ( = ?auto_2398334 ?auto_2398339 ) ) ( not ( = ?auto_2398335 ?auto_2398332 ) ) ( not ( = ?auto_2398335 ?auto_2398336 ) ) ( not ( = ?auto_2398335 ?auto_2398338 ) ) ( not ( = ?auto_2398335 ?auto_2398337 ) ) ( not ( = ?auto_2398335 ?auto_2398339 ) ) ( not ( = ?auto_2398332 ?auto_2398336 ) ) ( not ( = ?auto_2398332 ?auto_2398338 ) ) ( not ( = ?auto_2398332 ?auto_2398337 ) ) ( not ( = ?auto_2398332 ?auto_2398339 ) ) ( not ( = ?auto_2398336 ?auto_2398338 ) ) ( not ( = ?auto_2398336 ?auto_2398337 ) ) ( not ( = ?auto_2398336 ?auto_2398339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2398338 ?auto_2398337 ?auto_2398339 )
      ( MAKE-7CRATE-VERIFY ?auto_2398333 ?auto_2398334 ?auto_2398335 ?auto_2398332 ?auto_2398336 ?auto_2398338 ?auto_2398337 ?auto_2398339 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2398396 - SURFACE
      ?auto_2398397 - SURFACE
      ?auto_2398398 - SURFACE
      ?auto_2398395 - SURFACE
      ?auto_2398399 - SURFACE
      ?auto_2398401 - SURFACE
      ?auto_2398400 - SURFACE
      ?auto_2398402 - SURFACE
    )
    :vars
    (
      ?auto_2398404 - HOIST
      ?auto_2398405 - PLACE
      ?auto_2398406 - TRUCK
      ?auto_2398403 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2398404 ?auto_2398405 ) ( SURFACE-AT ?auto_2398400 ?auto_2398405 ) ( CLEAR ?auto_2398400 ) ( IS-CRATE ?auto_2398402 ) ( not ( = ?auto_2398400 ?auto_2398402 ) ) ( AVAILABLE ?auto_2398404 ) ( IN ?auto_2398402 ?auto_2398406 ) ( ON ?auto_2398400 ?auto_2398401 ) ( not ( = ?auto_2398401 ?auto_2398400 ) ) ( not ( = ?auto_2398401 ?auto_2398402 ) ) ( TRUCK-AT ?auto_2398406 ?auto_2398403 ) ( not ( = ?auto_2398403 ?auto_2398405 ) ) ( ON ?auto_2398397 ?auto_2398396 ) ( ON ?auto_2398398 ?auto_2398397 ) ( ON ?auto_2398395 ?auto_2398398 ) ( ON ?auto_2398399 ?auto_2398395 ) ( ON ?auto_2398401 ?auto_2398399 ) ( not ( = ?auto_2398396 ?auto_2398397 ) ) ( not ( = ?auto_2398396 ?auto_2398398 ) ) ( not ( = ?auto_2398396 ?auto_2398395 ) ) ( not ( = ?auto_2398396 ?auto_2398399 ) ) ( not ( = ?auto_2398396 ?auto_2398401 ) ) ( not ( = ?auto_2398396 ?auto_2398400 ) ) ( not ( = ?auto_2398396 ?auto_2398402 ) ) ( not ( = ?auto_2398397 ?auto_2398398 ) ) ( not ( = ?auto_2398397 ?auto_2398395 ) ) ( not ( = ?auto_2398397 ?auto_2398399 ) ) ( not ( = ?auto_2398397 ?auto_2398401 ) ) ( not ( = ?auto_2398397 ?auto_2398400 ) ) ( not ( = ?auto_2398397 ?auto_2398402 ) ) ( not ( = ?auto_2398398 ?auto_2398395 ) ) ( not ( = ?auto_2398398 ?auto_2398399 ) ) ( not ( = ?auto_2398398 ?auto_2398401 ) ) ( not ( = ?auto_2398398 ?auto_2398400 ) ) ( not ( = ?auto_2398398 ?auto_2398402 ) ) ( not ( = ?auto_2398395 ?auto_2398399 ) ) ( not ( = ?auto_2398395 ?auto_2398401 ) ) ( not ( = ?auto_2398395 ?auto_2398400 ) ) ( not ( = ?auto_2398395 ?auto_2398402 ) ) ( not ( = ?auto_2398399 ?auto_2398401 ) ) ( not ( = ?auto_2398399 ?auto_2398400 ) ) ( not ( = ?auto_2398399 ?auto_2398402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2398401 ?auto_2398400 ?auto_2398402 )
      ( MAKE-7CRATE-VERIFY ?auto_2398396 ?auto_2398397 ?auto_2398398 ?auto_2398395 ?auto_2398399 ?auto_2398401 ?auto_2398400 ?auto_2398402 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2398466 - SURFACE
      ?auto_2398467 - SURFACE
      ?auto_2398468 - SURFACE
      ?auto_2398465 - SURFACE
      ?auto_2398469 - SURFACE
      ?auto_2398471 - SURFACE
      ?auto_2398470 - SURFACE
      ?auto_2398472 - SURFACE
    )
    :vars
    (
      ?auto_2398473 - HOIST
      ?auto_2398476 - PLACE
      ?auto_2398475 - TRUCK
      ?auto_2398477 - PLACE
      ?auto_2398474 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2398473 ?auto_2398476 ) ( SURFACE-AT ?auto_2398470 ?auto_2398476 ) ( CLEAR ?auto_2398470 ) ( IS-CRATE ?auto_2398472 ) ( not ( = ?auto_2398470 ?auto_2398472 ) ) ( AVAILABLE ?auto_2398473 ) ( ON ?auto_2398470 ?auto_2398471 ) ( not ( = ?auto_2398471 ?auto_2398470 ) ) ( not ( = ?auto_2398471 ?auto_2398472 ) ) ( TRUCK-AT ?auto_2398475 ?auto_2398477 ) ( not ( = ?auto_2398477 ?auto_2398476 ) ) ( HOIST-AT ?auto_2398474 ?auto_2398477 ) ( LIFTING ?auto_2398474 ?auto_2398472 ) ( not ( = ?auto_2398473 ?auto_2398474 ) ) ( ON ?auto_2398467 ?auto_2398466 ) ( ON ?auto_2398468 ?auto_2398467 ) ( ON ?auto_2398465 ?auto_2398468 ) ( ON ?auto_2398469 ?auto_2398465 ) ( ON ?auto_2398471 ?auto_2398469 ) ( not ( = ?auto_2398466 ?auto_2398467 ) ) ( not ( = ?auto_2398466 ?auto_2398468 ) ) ( not ( = ?auto_2398466 ?auto_2398465 ) ) ( not ( = ?auto_2398466 ?auto_2398469 ) ) ( not ( = ?auto_2398466 ?auto_2398471 ) ) ( not ( = ?auto_2398466 ?auto_2398470 ) ) ( not ( = ?auto_2398466 ?auto_2398472 ) ) ( not ( = ?auto_2398467 ?auto_2398468 ) ) ( not ( = ?auto_2398467 ?auto_2398465 ) ) ( not ( = ?auto_2398467 ?auto_2398469 ) ) ( not ( = ?auto_2398467 ?auto_2398471 ) ) ( not ( = ?auto_2398467 ?auto_2398470 ) ) ( not ( = ?auto_2398467 ?auto_2398472 ) ) ( not ( = ?auto_2398468 ?auto_2398465 ) ) ( not ( = ?auto_2398468 ?auto_2398469 ) ) ( not ( = ?auto_2398468 ?auto_2398471 ) ) ( not ( = ?auto_2398468 ?auto_2398470 ) ) ( not ( = ?auto_2398468 ?auto_2398472 ) ) ( not ( = ?auto_2398465 ?auto_2398469 ) ) ( not ( = ?auto_2398465 ?auto_2398471 ) ) ( not ( = ?auto_2398465 ?auto_2398470 ) ) ( not ( = ?auto_2398465 ?auto_2398472 ) ) ( not ( = ?auto_2398469 ?auto_2398471 ) ) ( not ( = ?auto_2398469 ?auto_2398470 ) ) ( not ( = ?auto_2398469 ?auto_2398472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2398471 ?auto_2398470 ?auto_2398472 )
      ( MAKE-7CRATE-VERIFY ?auto_2398466 ?auto_2398467 ?auto_2398468 ?auto_2398465 ?auto_2398469 ?auto_2398471 ?auto_2398470 ?auto_2398472 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2398543 - SURFACE
      ?auto_2398544 - SURFACE
      ?auto_2398545 - SURFACE
      ?auto_2398542 - SURFACE
      ?auto_2398546 - SURFACE
      ?auto_2398548 - SURFACE
      ?auto_2398547 - SURFACE
      ?auto_2398549 - SURFACE
    )
    :vars
    (
      ?auto_2398554 - HOIST
      ?auto_2398550 - PLACE
      ?auto_2398552 - TRUCK
      ?auto_2398553 - PLACE
      ?auto_2398551 - HOIST
      ?auto_2398555 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2398554 ?auto_2398550 ) ( SURFACE-AT ?auto_2398547 ?auto_2398550 ) ( CLEAR ?auto_2398547 ) ( IS-CRATE ?auto_2398549 ) ( not ( = ?auto_2398547 ?auto_2398549 ) ) ( AVAILABLE ?auto_2398554 ) ( ON ?auto_2398547 ?auto_2398548 ) ( not ( = ?auto_2398548 ?auto_2398547 ) ) ( not ( = ?auto_2398548 ?auto_2398549 ) ) ( TRUCK-AT ?auto_2398552 ?auto_2398553 ) ( not ( = ?auto_2398553 ?auto_2398550 ) ) ( HOIST-AT ?auto_2398551 ?auto_2398553 ) ( not ( = ?auto_2398554 ?auto_2398551 ) ) ( AVAILABLE ?auto_2398551 ) ( SURFACE-AT ?auto_2398549 ?auto_2398553 ) ( ON ?auto_2398549 ?auto_2398555 ) ( CLEAR ?auto_2398549 ) ( not ( = ?auto_2398547 ?auto_2398555 ) ) ( not ( = ?auto_2398549 ?auto_2398555 ) ) ( not ( = ?auto_2398548 ?auto_2398555 ) ) ( ON ?auto_2398544 ?auto_2398543 ) ( ON ?auto_2398545 ?auto_2398544 ) ( ON ?auto_2398542 ?auto_2398545 ) ( ON ?auto_2398546 ?auto_2398542 ) ( ON ?auto_2398548 ?auto_2398546 ) ( not ( = ?auto_2398543 ?auto_2398544 ) ) ( not ( = ?auto_2398543 ?auto_2398545 ) ) ( not ( = ?auto_2398543 ?auto_2398542 ) ) ( not ( = ?auto_2398543 ?auto_2398546 ) ) ( not ( = ?auto_2398543 ?auto_2398548 ) ) ( not ( = ?auto_2398543 ?auto_2398547 ) ) ( not ( = ?auto_2398543 ?auto_2398549 ) ) ( not ( = ?auto_2398543 ?auto_2398555 ) ) ( not ( = ?auto_2398544 ?auto_2398545 ) ) ( not ( = ?auto_2398544 ?auto_2398542 ) ) ( not ( = ?auto_2398544 ?auto_2398546 ) ) ( not ( = ?auto_2398544 ?auto_2398548 ) ) ( not ( = ?auto_2398544 ?auto_2398547 ) ) ( not ( = ?auto_2398544 ?auto_2398549 ) ) ( not ( = ?auto_2398544 ?auto_2398555 ) ) ( not ( = ?auto_2398545 ?auto_2398542 ) ) ( not ( = ?auto_2398545 ?auto_2398546 ) ) ( not ( = ?auto_2398545 ?auto_2398548 ) ) ( not ( = ?auto_2398545 ?auto_2398547 ) ) ( not ( = ?auto_2398545 ?auto_2398549 ) ) ( not ( = ?auto_2398545 ?auto_2398555 ) ) ( not ( = ?auto_2398542 ?auto_2398546 ) ) ( not ( = ?auto_2398542 ?auto_2398548 ) ) ( not ( = ?auto_2398542 ?auto_2398547 ) ) ( not ( = ?auto_2398542 ?auto_2398549 ) ) ( not ( = ?auto_2398542 ?auto_2398555 ) ) ( not ( = ?auto_2398546 ?auto_2398548 ) ) ( not ( = ?auto_2398546 ?auto_2398547 ) ) ( not ( = ?auto_2398546 ?auto_2398549 ) ) ( not ( = ?auto_2398546 ?auto_2398555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2398548 ?auto_2398547 ?auto_2398549 )
      ( MAKE-7CRATE-VERIFY ?auto_2398543 ?auto_2398544 ?auto_2398545 ?auto_2398542 ?auto_2398546 ?auto_2398548 ?auto_2398547 ?auto_2398549 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2398621 - SURFACE
      ?auto_2398622 - SURFACE
      ?auto_2398623 - SURFACE
      ?auto_2398620 - SURFACE
      ?auto_2398624 - SURFACE
      ?auto_2398626 - SURFACE
      ?auto_2398625 - SURFACE
      ?auto_2398627 - SURFACE
    )
    :vars
    (
      ?auto_2398632 - HOIST
      ?auto_2398630 - PLACE
      ?auto_2398629 - PLACE
      ?auto_2398628 - HOIST
      ?auto_2398633 - SURFACE
      ?auto_2398631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2398632 ?auto_2398630 ) ( SURFACE-AT ?auto_2398625 ?auto_2398630 ) ( CLEAR ?auto_2398625 ) ( IS-CRATE ?auto_2398627 ) ( not ( = ?auto_2398625 ?auto_2398627 ) ) ( AVAILABLE ?auto_2398632 ) ( ON ?auto_2398625 ?auto_2398626 ) ( not ( = ?auto_2398626 ?auto_2398625 ) ) ( not ( = ?auto_2398626 ?auto_2398627 ) ) ( not ( = ?auto_2398629 ?auto_2398630 ) ) ( HOIST-AT ?auto_2398628 ?auto_2398629 ) ( not ( = ?auto_2398632 ?auto_2398628 ) ) ( AVAILABLE ?auto_2398628 ) ( SURFACE-AT ?auto_2398627 ?auto_2398629 ) ( ON ?auto_2398627 ?auto_2398633 ) ( CLEAR ?auto_2398627 ) ( not ( = ?auto_2398625 ?auto_2398633 ) ) ( not ( = ?auto_2398627 ?auto_2398633 ) ) ( not ( = ?auto_2398626 ?auto_2398633 ) ) ( TRUCK-AT ?auto_2398631 ?auto_2398630 ) ( ON ?auto_2398622 ?auto_2398621 ) ( ON ?auto_2398623 ?auto_2398622 ) ( ON ?auto_2398620 ?auto_2398623 ) ( ON ?auto_2398624 ?auto_2398620 ) ( ON ?auto_2398626 ?auto_2398624 ) ( not ( = ?auto_2398621 ?auto_2398622 ) ) ( not ( = ?auto_2398621 ?auto_2398623 ) ) ( not ( = ?auto_2398621 ?auto_2398620 ) ) ( not ( = ?auto_2398621 ?auto_2398624 ) ) ( not ( = ?auto_2398621 ?auto_2398626 ) ) ( not ( = ?auto_2398621 ?auto_2398625 ) ) ( not ( = ?auto_2398621 ?auto_2398627 ) ) ( not ( = ?auto_2398621 ?auto_2398633 ) ) ( not ( = ?auto_2398622 ?auto_2398623 ) ) ( not ( = ?auto_2398622 ?auto_2398620 ) ) ( not ( = ?auto_2398622 ?auto_2398624 ) ) ( not ( = ?auto_2398622 ?auto_2398626 ) ) ( not ( = ?auto_2398622 ?auto_2398625 ) ) ( not ( = ?auto_2398622 ?auto_2398627 ) ) ( not ( = ?auto_2398622 ?auto_2398633 ) ) ( not ( = ?auto_2398623 ?auto_2398620 ) ) ( not ( = ?auto_2398623 ?auto_2398624 ) ) ( not ( = ?auto_2398623 ?auto_2398626 ) ) ( not ( = ?auto_2398623 ?auto_2398625 ) ) ( not ( = ?auto_2398623 ?auto_2398627 ) ) ( not ( = ?auto_2398623 ?auto_2398633 ) ) ( not ( = ?auto_2398620 ?auto_2398624 ) ) ( not ( = ?auto_2398620 ?auto_2398626 ) ) ( not ( = ?auto_2398620 ?auto_2398625 ) ) ( not ( = ?auto_2398620 ?auto_2398627 ) ) ( not ( = ?auto_2398620 ?auto_2398633 ) ) ( not ( = ?auto_2398624 ?auto_2398626 ) ) ( not ( = ?auto_2398624 ?auto_2398625 ) ) ( not ( = ?auto_2398624 ?auto_2398627 ) ) ( not ( = ?auto_2398624 ?auto_2398633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2398626 ?auto_2398625 ?auto_2398627 )
      ( MAKE-7CRATE-VERIFY ?auto_2398621 ?auto_2398622 ?auto_2398623 ?auto_2398620 ?auto_2398624 ?auto_2398626 ?auto_2398625 ?auto_2398627 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2398699 - SURFACE
      ?auto_2398700 - SURFACE
      ?auto_2398701 - SURFACE
      ?auto_2398698 - SURFACE
      ?auto_2398702 - SURFACE
      ?auto_2398704 - SURFACE
      ?auto_2398703 - SURFACE
      ?auto_2398705 - SURFACE
    )
    :vars
    (
      ?auto_2398706 - HOIST
      ?auto_2398710 - PLACE
      ?auto_2398711 - PLACE
      ?auto_2398709 - HOIST
      ?auto_2398708 - SURFACE
      ?auto_2398707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2398706 ?auto_2398710 ) ( IS-CRATE ?auto_2398705 ) ( not ( = ?auto_2398703 ?auto_2398705 ) ) ( not ( = ?auto_2398704 ?auto_2398703 ) ) ( not ( = ?auto_2398704 ?auto_2398705 ) ) ( not ( = ?auto_2398711 ?auto_2398710 ) ) ( HOIST-AT ?auto_2398709 ?auto_2398711 ) ( not ( = ?auto_2398706 ?auto_2398709 ) ) ( AVAILABLE ?auto_2398709 ) ( SURFACE-AT ?auto_2398705 ?auto_2398711 ) ( ON ?auto_2398705 ?auto_2398708 ) ( CLEAR ?auto_2398705 ) ( not ( = ?auto_2398703 ?auto_2398708 ) ) ( not ( = ?auto_2398705 ?auto_2398708 ) ) ( not ( = ?auto_2398704 ?auto_2398708 ) ) ( TRUCK-AT ?auto_2398707 ?auto_2398710 ) ( SURFACE-AT ?auto_2398704 ?auto_2398710 ) ( CLEAR ?auto_2398704 ) ( LIFTING ?auto_2398706 ?auto_2398703 ) ( IS-CRATE ?auto_2398703 ) ( ON ?auto_2398700 ?auto_2398699 ) ( ON ?auto_2398701 ?auto_2398700 ) ( ON ?auto_2398698 ?auto_2398701 ) ( ON ?auto_2398702 ?auto_2398698 ) ( ON ?auto_2398704 ?auto_2398702 ) ( not ( = ?auto_2398699 ?auto_2398700 ) ) ( not ( = ?auto_2398699 ?auto_2398701 ) ) ( not ( = ?auto_2398699 ?auto_2398698 ) ) ( not ( = ?auto_2398699 ?auto_2398702 ) ) ( not ( = ?auto_2398699 ?auto_2398704 ) ) ( not ( = ?auto_2398699 ?auto_2398703 ) ) ( not ( = ?auto_2398699 ?auto_2398705 ) ) ( not ( = ?auto_2398699 ?auto_2398708 ) ) ( not ( = ?auto_2398700 ?auto_2398701 ) ) ( not ( = ?auto_2398700 ?auto_2398698 ) ) ( not ( = ?auto_2398700 ?auto_2398702 ) ) ( not ( = ?auto_2398700 ?auto_2398704 ) ) ( not ( = ?auto_2398700 ?auto_2398703 ) ) ( not ( = ?auto_2398700 ?auto_2398705 ) ) ( not ( = ?auto_2398700 ?auto_2398708 ) ) ( not ( = ?auto_2398701 ?auto_2398698 ) ) ( not ( = ?auto_2398701 ?auto_2398702 ) ) ( not ( = ?auto_2398701 ?auto_2398704 ) ) ( not ( = ?auto_2398701 ?auto_2398703 ) ) ( not ( = ?auto_2398701 ?auto_2398705 ) ) ( not ( = ?auto_2398701 ?auto_2398708 ) ) ( not ( = ?auto_2398698 ?auto_2398702 ) ) ( not ( = ?auto_2398698 ?auto_2398704 ) ) ( not ( = ?auto_2398698 ?auto_2398703 ) ) ( not ( = ?auto_2398698 ?auto_2398705 ) ) ( not ( = ?auto_2398698 ?auto_2398708 ) ) ( not ( = ?auto_2398702 ?auto_2398704 ) ) ( not ( = ?auto_2398702 ?auto_2398703 ) ) ( not ( = ?auto_2398702 ?auto_2398705 ) ) ( not ( = ?auto_2398702 ?auto_2398708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2398704 ?auto_2398703 ?auto_2398705 )
      ( MAKE-7CRATE-VERIFY ?auto_2398699 ?auto_2398700 ?auto_2398701 ?auto_2398698 ?auto_2398702 ?auto_2398704 ?auto_2398703 ?auto_2398705 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2398777 - SURFACE
      ?auto_2398778 - SURFACE
      ?auto_2398779 - SURFACE
      ?auto_2398776 - SURFACE
      ?auto_2398780 - SURFACE
      ?auto_2398782 - SURFACE
      ?auto_2398781 - SURFACE
      ?auto_2398783 - SURFACE
    )
    :vars
    (
      ?auto_2398784 - HOIST
      ?auto_2398787 - PLACE
      ?auto_2398788 - PLACE
      ?auto_2398785 - HOIST
      ?auto_2398789 - SURFACE
      ?auto_2398786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2398784 ?auto_2398787 ) ( IS-CRATE ?auto_2398783 ) ( not ( = ?auto_2398781 ?auto_2398783 ) ) ( not ( = ?auto_2398782 ?auto_2398781 ) ) ( not ( = ?auto_2398782 ?auto_2398783 ) ) ( not ( = ?auto_2398788 ?auto_2398787 ) ) ( HOIST-AT ?auto_2398785 ?auto_2398788 ) ( not ( = ?auto_2398784 ?auto_2398785 ) ) ( AVAILABLE ?auto_2398785 ) ( SURFACE-AT ?auto_2398783 ?auto_2398788 ) ( ON ?auto_2398783 ?auto_2398789 ) ( CLEAR ?auto_2398783 ) ( not ( = ?auto_2398781 ?auto_2398789 ) ) ( not ( = ?auto_2398783 ?auto_2398789 ) ) ( not ( = ?auto_2398782 ?auto_2398789 ) ) ( TRUCK-AT ?auto_2398786 ?auto_2398787 ) ( SURFACE-AT ?auto_2398782 ?auto_2398787 ) ( CLEAR ?auto_2398782 ) ( IS-CRATE ?auto_2398781 ) ( AVAILABLE ?auto_2398784 ) ( IN ?auto_2398781 ?auto_2398786 ) ( ON ?auto_2398778 ?auto_2398777 ) ( ON ?auto_2398779 ?auto_2398778 ) ( ON ?auto_2398776 ?auto_2398779 ) ( ON ?auto_2398780 ?auto_2398776 ) ( ON ?auto_2398782 ?auto_2398780 ) ( not ( = ?auto_2398777 ?auto_2398778 ) ) ( not ( = ?auto_2398777 ?auto_2398779 ) ) ( not ( = ?auto_2398777 ?auto_2398776 ) ) ( not ( = ?auto_2398777 ?auto_2398780 ) ) ( not ( = ?auto_2398777 ?auto_2398782 ) ) ( not ( = ?auto_2398777 ?auto_2398781 ) ) ( not ( = ?auto_2398777 ?auto_2398783 ) ) ( not ( = ?auto_2398777 ?auto_2398789 ) ) ( not ( = ?auto_2398778 ?auto_2398779 ) ) ( not ( = ?auto_2398778 ?auto_2398776 ) ) ( not ( = ?auto_2398778 ?auto_2398780 ) ) ( not ( = ?auto_2398778 ?auto_2398782 ) ) ( not ( = ?auto_2398778 ?auto_2398781 ) ) ( not ( = ?auto_2398778 ?auto_2398783 ) ) ( not ( = ?auto_2398778 ?auto_2398789 ) ) ( not ( = ?auto_2398779 ?auto_2398776 ) ) ( not ( = ?auto_2398779 ?auto_2398780 ) ) ( not ( = ?auto_2398779 ?auto_2398782 ) ) ( not ( = ?auto_2398779 ?auto_2398781 ) ) ( not ( = ?auto_2398779 ?auto_2398783 ) ) ( not ( = ?auto_2398779 ?auto_2398789 ) ) ( not ( = ?auto_2398776 ?auto_2398780 ) ) ( not ( = ?auto_2398776 ?auto_2398782 ) ) ( not ( = ?auto_2398776 ?auto_2398781 ) ) ( not ( = ?auto_2398776 ?auto_2398783 ) ) ( not ( = ?auto_2398776 ?auto_2398789 ) ) ( not ( = ?auto_2398780 ?auto_2398782 ) ) ( not ( = ?auto_2398780 ?auto_2398781 ) ) ( not ( = ?auto_2398780 ?auto_2398783 ) ) ( not ( = ?auto_2398780 ?auto_2398789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2398782 ?auto_2398781 ?auto_2398783 )
      ( MAKE-7CRATE-VERIFY ?auto_2398777 ?auto_2398778 ?auto_2398779 ?auto_2398776 ?auto_2398780 ?auto_2398782 ?auto_2398781 ?auto_2398783 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2401696 - SURFACE
      ?auto_2401697 - SURFACE
      ?auto_2401698 - SURFACE
      ?auto_2401695 - SURFACE
      ?auto_2401699 - SURFACE
      ?auto_2401701 - SURFACE
      ?auto_2401700 - SURFACE
      ?auto_2401702 - SURFACE
      ?auto_2401703 - SURFACE
    )
    :vars
    (
      ?auto_2401705 - HOIST
      ?auto_2401704 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401705 ?auto_2401704 ) ( SURFACE-AT ?auto_2401702 ?auto_2401704 ) ( CLEAR ?auto_2401702 ) ( LIFTING ?auto_2401705 ?auto_2401703 ) ( IS-CRATE ?auto_2401703 ) ( not ( = ?auto_2401702 ?auto_2401703 ) ) ( ON ?auto_2401697 ?auto_2401696 ) ( ON ?auto_2401698 ?auto_2401697 ) ( ON ?auto_2401695 ?auto_2401698 ) ( ON ?auto_2401699 ?auto_2401695 ) ( ON ?auto_2401701 ?auto_2401699 ) ( ON ?auto_2401700 ?auto_2401701 ) ( ON ?auto_2401702 ?auto_2401700 ) ( not ( = ?auto_2401696 ?auto_2401697 ) ) ( not ( = ?auto_2401696 ?auto_2401698 ) ) ( not ( = ?auto_2401696 ?auto_2401695 ) ) ( not ( = ?auto_2401696 ?auto_2401699 ) ) ( not ( = ?auto_2401696 ?auto_2401701 ) ) ( not ( = ?auto_2401696 ?auto_2401700 ) ) ( not ( = ?auto_2401696 ?auto_2401702 ) ) ( not ( = ?auto_2401696 ?auto_2401703 ) ) ( not ( = ?auto_2401697 ?auto_2401698 ) ) ( not ( = ?auto_2401697 ?auto_2401695 ) ) ( not ( = ?auto_2401697 ?auto_2401699 ) ) ( not ( = ?auto_2401697 ?auto_2401701 ) ) ( not ( = ?auto_2401697 ?auto_2401700 ) ) ( not ( = ?auto_2401697 ?auto_2401702 ) ) ( not ( = ?auto_2401697 ?auto_2401703 ) ) ( not ( = ?auto_2401698 ?auto_2401695 ) ) ( not ( = ?auto_2401698 ?auto_2401699 ) ) ( not ( = ?auto_2401698 ?auto_2401701 ) ) ( not ( = ?auto_2401698 ?auto_2401700 ) ) ( not ( = ?auto_2401698 ?auto_2401702 ) ) ( not ( = ?auto_2401698 ?auto_2401703 ) ) ( not ( = ?auto_2401695 ?auto_2401699 ) ) ( not ( = ?auto_2401695 ?auto_2401701 ) ) ( not ( = ?auto_2401695 ?auto_2401700 ) ) ( not ( = ?auto_2401695 ?auto_2401702 ) ) ( not ( = ?auto_2401695 ?auto_2401703 ) ) ( not ( = ?auto_2401699 ?auto_2401701 ) ) ( not ( = ?auto_2401699 ?auto_2401700 ) ) ( not ( = ?auto_2401699 ?auto_2401702 ) ) ( not ( = ?auto_2401699 ?auto_2401703 ) ) ( not ( = ?auto_2401701 ?auto_2401700 ) ) ( not ( = ?auto_2401701 ?auto_2401702 ) ) ( not ( = ?auto_2401701 ?auto_2401703 ) ) ( not ( = ?auto_2401700 ?auto_2401702 ) ) ( not ( = ?auto_2401700 ?auto_2401703 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2401702 ?auto_2401703 )
      ( MAKE-8CRATE-VERIFY ?auto_2401696 ?auto_2401697 ?auto_2401698 ?auto_2401695 ?auto_2401699 ?auto_2401701 ?auto_2401700 ?auto_2401702 ?auto_2401703 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2401763 - SURFACE
      ?auto_2401764 - SURFACE
      ?auto_2401765 - SURFACE
      ?auto_2401762 - SURFACE
      ?auto_2401766 - SURFACE
      ?auto_2401768 - SURFACE
      ?auto_2401767 - SURFACE
      ?auto_2401769 - SURFACE
      ?auto_2401770 - SURFACE
    )
    :vars
    (
      ?auto_2401771 - HOIST
      ?auto_2401773 - PLACE
      ?auto_2401772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401771 ?auto_2401773 ) ( SURFACE-AT ?auto_2401769 ?auto_2401773 ) ( CLEAR ?auto_2401769 ) ( IS-CRATE ?auto_2401770 ) ( not ( = ?auto_2401769 ?auto_2401770 ) ) ( TRUCK-AT ?auto_2401772 ?auto_2401773 ) ( AVAILABLE ?auto_2401771 ) ( IN ?auto_2401770 ?auto_2401772 ) ( ON ?auto_2401769 ?auto_2401767 ) ( not ( = ?auto_2401767 ?auto_2401769 ) ) ( not ( = ?auto_2401767 ?auto_2401770 ) ) ( ON ?auto_2401764 ?auto_2401763 ) ( ON ?auto_2401765 ?auto_2401764 ) ( ON ?auto_2401762 ?auto_2401765 ) ( ON ?auto_2401766 ?auto_2401762 ) ( ON ?auto_2401768 ?auto_2401766 ) ( ON ?auto_2401767 ?auto_2401768 ) ( not ( = ?auto_2401763 ?auto_2401764 ) ) ( not ( = ?auto_2401763 ?auto_2401765 ) ) ( not ( = ?auto_2401763 ?auto_2401762 ) ) ( not ( = ?auto_2401763 ?auto_2401766 ) ) ( not ( = ?auto_2401763 ?auto_2401768 ) ) ( not ( = ?auto_2401763 ?auto_2401767 ) ) ( not ( = ?auto_2401763 ?auto_2401769 ) ) ( not ( = ?auto_2401763 ?auto_2401770 ) ) ( not ( = ?auto_2401764 ?auto_2401765 ) ) ( not ( = ?auto_2401764 ?auto_2401762 ) ) ( not ( = ?auto_2401764 ?auto_2401766 ) ) ( not ( = ?auto_2401764 ?auto_2401768 ) ) ( not ( = ?auto_2401764 ?auto_2401767 ) ) ( not ( = ?auto_2401764 ?auto_2401769 ) ) ( not ( = ?auto_2401764 ?auto_2401770 ) ) ( not ( = ?auto_2401765 ?auto_2401762 ) ) ( not ( = ?auto_2401765 ?auto_2401766 ) ) ( not ( = ?auto_2401765 ?auto_2401768 ) ) ( not ( = ?auto_2401765 ?auto_2401767 ) ) ( not ( = ?auto_2401765 ?auto_2401769 ) ) ( not ( = ?auto_2401765 ?auto_2401770 ) ) ( not ( = ?auto_2401762 ?auto_2401766 ) ) ( not ( = ?auto_2401762 ?auto_2401768 ) ) ( not ( = ?auto_2401762 ?auto_2401767 ) ) ( not ( = ?auto_2401762 ?auto_2401769 ) ) ( not ( = ?auto_2401762 ?auto_2401770 ) ) ( not ( = ?auto_2401766 ?auto_2401768 ) ) ( not ( = ?auto_2401766 ?auto_2401767 ) ) ( not ( = ?auto_2401766 ?auto_2401769 ) ) ( not ( = ?auto_2401766 ?auto_2401770 ) ) ( not ( = ?auto_2401768 ?auto_2401767 ) ) ( not ( = ?auto_2401768 ?auto_2401769 ) ) ( not ( = ?auto_2401768 ?auto_2401770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2401767 ?auto_2401769 ?auto_2401770 )
      ( MAKE-8CRATE-VERIFY ?auto_2401763 ?auto_2401764 ?auto_2401765 ?auto_2401762 ?auto_2401766 ?auto_2401768 ?auto_2401767 ?auto_2401769 ?auto_2401770 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2401839 - SURFACE
      ?auto_2401840 - SURFACE
      ?auto_2401841 - SURFACE
      ?auto_2401838 - SURFACE
      ?auto_2401842 - SURFACE
      ?auto_2401844 - SURFACE
      ?auto_2401843 - SURFACE
      ?auto_2401845 - SURFACE
      ?auto_2401846 - SURFACE
    )
    :vars
    (
      ?auto_2401848 - HOIST
      ?auto_2401847 - PLACE
      ?auto_2401850 - TRUCK
      ?auto_2401849 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401848 ?auto_2401847 ) ( SURFACE-AT ?auto_2401845 ?auto_2401847 ) ( CLEAR ?auto_2401845 ) ( IS-CRATE ?auto_2401846 ) ( not ( = ?auto_2401845 ?auto_2401846 ) ) ( AVAILABLE ?auto_2401848 ) ( IN ?auto_2401846 ?auto_2401850 ) ( ON ?auto_2401845 ?auto_2401843 ) ( not ( = ?auto_2401843 ?auto_2401845 ) ) ( not ( = ?auto_2401843 ?auto_2401846 ) ) ( TRUCK-AT ?auto_2401850 ?auto_2401849 ) ( not ( = ?auto_2401849 ?auto_2401847 ) ) ( ON ?auto_2401840 ?auto_2401839 ) ( ON ?auto_2401841 ?auto_2401840 ) ( ON ?auto_2401838 ?auto_2401841 ) ( ON ?auto_2401842 ?auto_2401838 ) ( ON ?auto_2401844 ?auto_2401842 ) ( ON ?auto_2401843 ?auto_2401844 ) ( not ( = ?auto_2401839 ?auto_2401840 ) ) ( not ( = ?auto_2401839 ?auto_2401841 ) ) ( not ( = ?auto_2401839 ?auto_2401838 ) ) ( not ( = ?auto_2401839 ?auto_2401842 ) ) ( not ( = ?auto_2401839 ?auto_2401844 ) ) ( not ( = ?auto_2401839 ?auto_2401843 ) ) ( not ( = ?auto_2401839 ?auto_2401845 ) ) ( not ( = ?auto_2401839 ?auto_2401846 ) ) ( not ( = ?auto_2401840 ?auto_2401841 ) ) ( not ( = ?auto_2401840 ?auto_2401838 ) ) ( not ( = ?auto_2401840 ?auto_2401842 ) ) ( not ( = ?auto_2401840 ?auto_2401844 ) ) ( not ( = ?auto_2401840 ?auto_2401843 ) ) ( not ( = ?auto_2401840 ?auto_2401845 ) ) ( not ( = ?auto_2401840 ?auto_2401846 ) ) ( not ( = ?auto_2401841 ?auto_2401838 ) ) ( not ( = ?auto_2401841 ?auto_2401842 ) ) ( not ( = ?auto_2401841 ?auto_2401844 ) ) ( not ( = ?auto_2401841 ?auto_2401843 ) ) ( not ( = ?auto_2401841 ?auto_2401845 ) ) ( not ( = ?auto_2401841 ?auto_2401846 ) ) ( not ( = ?auto_2401838 ?auto_2401842 ) ) ( not ( = ?auto_2401838 ?auto_2401844 ) ) ( not ( = ?auto_2401838 ?auto_2401843 ) ) ( not ( = ?auto_2401838 ?auto_2401845 ) ) ( not ( = ?auto_2401838 ?auto_2401846 ) ) ( not ( = ?auto_2401842 ?auto_2401844 ) ) ( not ( = ?auto_2401842 ?auto_2401843 ) ) ( not ( = ?auto_2401842 ?auto_2401845 ) ) ( not ( = ?auto_2401842 ?auto_2401846 ) ) ( not ( = ?auto_2401844 ?auto_2401843 ) ) ( not ( = ?auto_2401844 ?auto_2401845 ) ) ( not ( = ?auto_2401844 ?auto_2401846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2401843 ?auto_2401845 ?auto_2401846 )
      ( MAKE-8CRATE-VERIFY ?auto_2401839 ?auto_2401840 ?auto_2401841 ?auto_2401838 ?auto_2401842 ?auto_2401844 ?auto_2401843 ?auto_2401845 ?auto_2401846 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2401923 - SURFACE
      ?auto_2401924 - SURFACE
      ?auto_2401925 - SURFACE
      ?auto_2401922 - SURFACE
      ?auto_2401926 - SURFACE
      ?auto_2401928 - SURFACE
      ?auto_2401927 - SURFACE
      ?auto_2401929 - SURFACE
      ?auto_2401930 - SURFACE
    )
    :vars
    (
      ?auto_2401931 - HOIST
      ?auto_2401932 - PLACE
      ?auto_2401933 - TRUCK
      ?auto_2401935 - PLACE
      ?auto_2401934 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401931 ?auto_2401932 ) ( SURFACE-AT ?auto_2401929 ?auto_2401932 ) ( CLEAR ?auto_2401929 ) ( IS-CRATE ?auto_2401930 ) ( not ( = ?auto_2401929 ?auto_2401930 ) ) ( AVAILABLE ?auto_2401931 ) ( ON ?auto_2401929 ?auto_2401927 ) ( not ( = ?auto_2401927 ?auto_2401929 ) ) ( not ( = ?auto_2401927 ?auto_2401930 ) ) ( TRUCK-AT ?auto_2401933 ?auto_2401935 ) ( not ( = ?auto_2401935 ?auto_2401932 ) ) ( HOIST-AT ?auto_2401934 ?auto_2401935 ) ( LIFTING ?auto_2401934 ?auto_2401930 ) ( not ( = ?auto_2401931 ?auto_2401934 ) ) ( ON ?auto_2401924 ?auto_2401923 ) ( ON ?auto_2401925 ?auto_2401924 ) ( ON ?auto_2401922 ?auto_2401925 ) ( ON ?auto_2401926 ?auto_2401922 ) ( ON ?auto_2401928 ?auto_2401926 ) ( ON ?auto_2401927 ?auto_2401928 ) ( not ( = ?auto_2401923 ?auto_2401924 ) ) ( not ( = ?auto_2401923 ?auto_2401925 ) ) ( not ( = ?auto_2401923 ?auto_2401922 ) ) ( not ( = ?auto_2401923 ?auto_2401926 ) ) ( not ( = ?auto_2401923 ?auto_2401928 ) ) ( not ( = ?auto_2401923 ?auto_2401927 ) ) ( not ( = ?auto_2401923 ?auto_2401929 ) ) ( not ( = ?auto_2401923 ?auto_2401930 ) ) ( not ( = ?auto_2401924 ?auto_2401925 ) ) ( not ( = ?auto_2401924 ?auto_2401922 ) ) ( not ( = ?auto_2401924 ?auto_2401926 ) ) ( not ( = ?auto_2401924 ?auto_2401928 ) ) ( not ( = ?auto_2401924 ?auto_2401927 ) ) ( not ( = ?auto_2401924 ?auto_2401929 ) ) ( not ( = ?auto_2401924 ?auto_2401930 ) ) ( not ( = ?auto_2401925 ?auto_2401922 ) ) ( not ( = ?auto_2401925 ?auto_2401926 ) ) ( not ( = ?auto_2401925 ?auto_2401928 ) ) ( not ( = ?auto_2401925 ?auto_2401927 ) ) ( not ( = ?auto_2401925 ?auto_2401929 ) ) ( not ( = ?auto_2401925 ?auto_2401930 ) ) ( not ( = ?auto_2401922 ?auto_2401926 ) ) ( not ( = ?auto_2401922 ?auto_2401928 ) ) ( not ( = ?auto_2401922 ?auto_2401927 ) ) ( not ( = ?auto_2401922 ?auto_2401929 ) ) ( not ( = ?auto_2401922 ?auto_2401930 ) ) ( not ( = ?auto_2401926 ?auto_2401928 ) ) ( not ( = ?auto_2401926 ?auto_2401927 ) ) ( not ( = ?auto_2401926 ?auto_2401929 ) ) ( not ( = ?auto_2401926 ?auto_2401930 ) ) ( not ( = ?auto_2401928 ?auto_2401927 ) ) ( not ( = ?auto_2401928 ?auto_2401929 ) ) ( not ( = ?auto_2401928 ?auto_2401930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2401927 ?auto_2401929 ?auto_2401930 )
      ( MAKE-8CRATE-VERIFY ?auto_2401923 ?auto_2401924 ?auto_2401925 ?auto_2401922 ?auto_2401926 ?auto_2401928 ?auto_2401927 ?auto_2401929 ?auto_2401930 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2402015 - SURFACE
      ?auto_2402016 - SURFACE
      ?auto_2402017 - SURFACE
      ?auto_2402014 - SURFACE
      ?auto_2402018 - SURFACE
      ?auto_2402020 - SURFACE
      ?auto_2402019 - SURFACE
      ?auto_2402021 - SURFACE
      ?auto_2402022 - SURFACE
    )
    :vars
    (
      ?auto_2402027 - HOIST
      ?auto_2402024 - PLACE
      ?auto_2402026 - TRUCK
      ?auto_2402028 - PLACE
      ?auto_2402023 - HOIST
      ?auto_2402025 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2402027 ?auto_2402024 ) ( SURFACE-AT ?auto_2402021 ?auto_2402024 ) ( CLEAR ?auto_2402021 ) ( IS-CRATE ?auto_2402022 ) ( not ( = ?auto_2402021 ?auto_2402022 ) ) ( AVAILABLE ?auto_2402027 ) ( ON ?auto_2402021 ?auto_2402019 ) ( not ( = ?auto_2402019 ?auto_2402021 ) ) ( not ( = ?auto_2402019 ?auto_2402022 ) ) ( TRUCK-AT ?auto_2402026 ?auto_2402028 ) ( not ( = ?auto_2402028 ?auto_2402024 ) ) ( HOIST-AT ?auto_2402023 ?auto_2402028 ) ( not ( = ?auto_2402027 ?auto_2402023 ) ) ( AVAILABLE ?auto_2402023 ) ( SURFACE-AT ?auto_2402022 ?auto_2402028 ) ( ON ?auto_2402022 ?auto_2402025 ) ( CLEAR ?auto_2402022 ) ( not ( = ?auto_2402021 ?auto_2402025 ) ) ( not ( = ?auto_2402022 ?auto_2402025 ) ) ( not ( = ?auto_2402019 ?auto_2402025 ) ) ( ON ?auto_2402016 ?auto_2402015 ) ( ON ?auto_2402017 ?auto_2402016 ) ( ON ?auto_2402014 ?auto_2402017 ) ( ON ?auto_2402018 ?auto_2402014 ) ( ON ?auto_2402020 ?auto_2402018 ) ( ON ?auto_2402019 ?auto_2402020 ) ( not ( = ?auto_2402015 ?auto_2402016 ) ) ( not ( = ?auto_2402015 ?auto_2402017 ) ) ( not ( = ?auto_2402015 ?auto_2402014 ) ) ( not ( = ?auto_2402015 ?auto_2402018 ) ) ( not ( = ?auto_2402015 ?auto_2402020 ) ) ( not ( = ?auto_2402015 ?auto_2402019 ) ) ( not ( = ?auto_2402015 ?auto_2402021 ) ) ( not ( = ?auto_2402015 ?auto_2402022 ) ) ( not ( = ?auto_2402015 ?auto_2402025 ) ) ( not ( = ?auto_2402016 ?auto_2402017 ) ) ( not ( = ?auto_2402016 ?auto_2402014 ) ) ( not ( = ?auto_2402016 ?auto_2402018 ) ) ( not ( = ?auto_2402016 ?auto_2402020 ) ) ( not ( = ?auto_2402016 ?auto_2402019 ) ) ( not ( = ?auto_2402016 ?auto_2402021 ) ) ( not ( = ?auto_2402016 ?auto_2402022 ) ) ( not ( = ?auto_2402016 ?auto_2402025 ) ) ( not ( = ?auto_2402017 ?auto_2402014 ) ) ( not ( = ?auto_2402017 ?auto_2402018 ) ) ( not ( = ?auto_2402017 ?auto_2402020 ) ) ( not ( = ?auto_2402017 ?auto_2402019 ) ) ( not ( = ?auto_2402017 ?auto_2402021 ) ) ( not ( = ?auto_2402017 ?auto_2402022 ) ) ( not ( = ?auto_2402017 ?auto_2402025 ) ) ( not ( = ?auto_2402014 ?auto_2402018 ) ) ( not ( = ?auto_2402014 ?auto_2402020 ) ) ( not ( = ?auto_2402014 ?auto_2402019 ) ) ( not ( = ?auto_2402014 ?auto_2402021 ) ) ( not ( = ?auto_2402014 ?auto_2402022 ) ) ( not ( = ?auto_2402014 ?auto_2402025 ) ) ( not ( = ?auto_2402018 ?auto_2402020 ) ) ( not ( = ?auto_2402018 ?auto_2402019 ) ) ( not ( = ?auto_2402018 ?auto_2402021 ) ) ( not ( = ?auto_2402018 ?auto_2402022 ) ) ( not ( = ?auto_2402018 ?auto_2402025 ) ) ( not ( = ?auto_2402020 ?auto_2402019 ) ) ( not ( = ?auto_2402020 ?auto_2402021 ) ) ( not ( = ?auto_2402020 ?auto_2402022 ) ) ( not ( = ?auto_2402020 ?auto_2402025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2402019 ?auto_2402021 ?auto_2402022 )
      ( MAKE-8CRATE-VERIFY ?auto_2402015 ?auto_2402016 ?auto_2402017 ?auto_2402014 ?auto_2402018 ?auto_2402020 ?auto_2402019 ?auto_2402021 ?auto_2402022 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2402108 - SURFACE
      ?auto_2402109 - SURFACE
      ?auto_2402110 - SURFACE
      ?auto_2402107 - SURFACE
      ?auto_2402111 - SURFACE
      ?auto_2402113 - SURFACE
      ?auto_2402112 - SURFACE
      ?auto_2402114 - SURFACE
      ?auto_2402115 - SURFACE
    )
    :vars
    (
      ?auto_2402117 - HOIST
      ?auto_2402120 - PLACE
      ?auto_2402116 - PLACE
      ?auto_2402118 - HOIST
      ?auto_2402121 - SURFACE
      ?auto_2402119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2402117 ?auto_2402120 ) ( SURFACE-AT ?auto_2402114 ?auto_2402120 ) ( CLEAR ?auto_2402114 ) ( IS-CRATE ?auto_2402115 ) ( not ( = ?auto_2402114 ?auto_2402115 ) ) ( AVAILABLE ?auto_2402117 ) ( ON ?auto_2402114 ?auto_2402112 ) ( not ( = ?auto_2402112 ?auto_2402114 ) ) ( not ( = ?auto_2402112 ?auto_2402115 ) ) ( not ( = ?auto_2402116 ?auto_2402120 ) ) ( HOIST-AT ?auto_2402118 ?auto_2402116 ) ( not ( = ?auto_2402117 ?auto_2402118 ) ) ( AVAILABLE ?auto_2402118 ) ( SURFACE-AT ?auto_2402115 ?auto_2402116 ) ( ON ?auto_2402115 ?auto_2402121 ) ( CLEAR ?auto_2402115 ) ( not ( = ?auto_2402114 ?auto_2402121 ) ) ( not ( = ?auto_2402115 ?auto_2402121 ) ) ( not ( = ?auto_2402112 ?auto_2402121 ) ) ( TRUCK-AT ?auto_2402119 ?auto_2402120 ) ( ON ?auto_2402109 ?auto_2402108 ) ( ON ?auto_2402110 ?auto_2402109 ) ( ON ?auto_2402107 ?auto_2402110 ) ( ON ?auto_2402111 ?auto_2402107 ) ( ON ?auto_2402113 ?auto_2402111 ) ( ON ?auto_2402112 ?auto_2402113 ) ( not ( = ?auto_2402108 ?auto_2402109 ) ) ( not ( = ?auto_2402108 ?auto_2402110 ) ) ( not ( = ?auto_2402108 ?auto_2402107 ) ) ( not ( = ?auto_2402108 ?auto_2402111 ) ) ( not ( = ?auto_2402108 ?auto_2402113 ) ) ( not ( = ?auto_2402108 ?auto_2402112 ) ) ( not ( = ?auto_2402108 ?auto_2402114 ) ) ( not ( = ?auto_2402108 ?auto_2402115 ) ) ( not ( = ?auto_2402108 ?auto_2402121 ) ) ( not ( = ?auto_2402109 ?auto_2402110 ) ) ( not ( = ?auto_2402109 ?auto_2402107 ) ) ( not ( = ?auto_2402109 ?auto_2402111 ) ) ( not ( = ?auto_2402109 ?auto_2402113 ) ) ( not ( = ?auto_2402109 ?auto_2402112 ) ) ( not ( = ?auto_2402109 ?auto_2402114 ) ) ( not ( = ?auto_2402109 ?auto_2402115 ) ) ( not ( = ?auto_2402109 ?auto_2402121 ) ) ( not ( = ?auto_2402110 ?auto_2402107 ) ) ( not ( = ?auto_2402110 ?auto_2402111 ) ) ( not ( = ?auto_2402110 ?auto_2402113 ) ) ( not ( = ?auto_2402110 ?auto_2402112 ) ) ( not ( = ?auto_2402110 ?auto_2402114 ) ) ( not ( = ?auto_2402110 ?auto_2402115 ) ) ( not ( = ?auto_2402110 ?auto_2402121 ) ) ( not ( = ?auto_2402107 ?auto_2402111 ) ) ( not ( = ?auto_2402107 ?auto_2402113 ) ) ( not ( = ?auto_2402107 ?auto_2402112 ) ) ( not ( = ?auto_2402107 ?auto_2402114 ) ) ( not ( = ?auto_2402107 ?auto_2402115 ) ) ( not ( = ?auto_2402107 ?auto_2402121 ) ) ( not ( = ?auto_2402111 ?auto_2402113 ) ) ( not ( = ?auto_2402111 ?auto_2402112 ) ) ( not ( = ?auto_2402111 ?auto_2402114 ) ) ( not ( = ?auto_2402111 ?auto_2402115 ) ) ( not ( = ?auto_2402111 ?auto_2402121 ) ) ( not ( = ?auto_2402113 ?auto_2402112 ) ) ( not ( = ?auto_2402113 ?auto_2402114 ) ) ( not ( = ?auto_2402113 ?auto_2402115 ) ) ( not ( = ?auto_2402113 ?auto_2402121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2402112 ?auto_2402114 ?auto_2402115 )
      ( MAKE-8CRATE-VERIFY ?auto_2402108 ?auto_2402109 ?auto_2402110 ?auto_2402107 ?auto_2402111 ?auto_2402113 ?auto_2402112 ?auto_2402114 ?auto_2402115 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2402201 - SURFACE
      ?auto_2402202 - SURFACE
      ?auto_2402203 - SURFACE
      ?auto_2402200 - SURFACE
      ?auto_2402204 - SURFACE
      ?auto_2402206 - SURFACE
      ?auto_2402205 - SURFACE
      ?auto_2402207 - SURFACE
      ?auto_2402208 - SURFACE
    )
    :vars
    (
      ?auto_2402213 - HOIST
      ?auto_2402209 - PLACE
      ?auto_2402210 - PLACE
      ?auto_2402214 - HOIST
      ?auto_2402212 - SURFACE
      ?auto_2402211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2402213 ?auto_2402209 ) ( IS-CRATE ?auto_2402208 ) ( not ( = ?auto_2402207 ?auto_2402208 ) ) ( not ( = ?auto_2402205 ?auto_2402207 ) ) ( not ( = ?auto_2402205 ?auto_2402208 ) ) ( not ( = ?auto_2402210 ?auto_2402209 ) ) ( HOIST-AT ?auto_2402214 ?auto_2402210 ) ( not ( = ?auto_2402213 ?auto_2402214 ) ) ( AVAILABLE ?auto_2402214 ) ( SURFACE-AT ?auto_2402208 ?auto_2402210 ) ( ON ?auto_2402208 ?auto_2402212 ) ( CLEAR ?auto_2402208 ) ( not ( = ?auto_2402207 ?auto_2402212 ) ) ( not ( = ?auto_2402208 ?auto_2402212 ) ) ( not ( = ?auto_2402205 ?auto_2402212 ) ) ( TRUCK-AT ?auto_2402211 ?auto_2402209 ) ( SURFACE-AT ?auto_2402205 ?auto_2402209 ) ( CLEAR ?auto_2402205 ) ( LIFTING ?auto_2402213 ?auto_2402207 ) ( IS-CRATE ?auto_2402207 ) ( ON ?auto_2402202 ?auto_2402201 ) ( ON ?auto_2402203 ?auto_2402202 ) ( ON ?auto_2402200 ?auto_2402203 ) ( ON ?auto_2402204 ?auto_2402200 ) ( ON ?auto_2402206 ?auto_2402204 ) ( ON ?auto_2402205 ?auto_2402206 ) ( not ( = ?auto_2402201 ?auto_2402202 ) ) ( not ( = ?auto_2402201 ?auto_2402203 ) ) ( not ( = ?auto_2402201 ?auto_2402200 ) ) ( not ( = ?auto_2402201 ?auto_2402204 ) ) ( not ( = ?auto_2402201 ?auto_2402206 ) ) ( not ( = ?auto_2402201 ?auto_2402205 ) ) ( not ( = ?auto_2402201 ?auto_2402207 ) ) ( not ( = ?auto_2402201 ?auto_2402208 ) ) ( not ( = ?auto_2402201 ?auto_2402212 ) ) ( not ( = ?auto_2402202 ?auto_2402203 ) ) ( not ( = ?auto_2402202 ?auto_2402200 ) ) ( not ( = ?auto_2402202 ?auto_2402204 ) ) ( not ( = ?auto_2402202 ?auto_2402206 ) ) ( not ( = ?auto_2402202 ?auto_2402205 ) ) ( not ( = ?auto_2402202 ?auto_2402207 ) ) ( not ( = ?auto_2402202 ?auto_2402208 ) ) ( not ( = ?auto_2402202 ?auto_2402212 ) ) ( not ( = ?auto_2402203 ?auto_2402200 ) ) ( not ( = ?auto_2402203 ?auto_2402204 ) ) ( not ( = ?auto_2402203 ?auto_2402206 ) ) ( not ( = ?auto_2402203 ?auto_2402205 ) ) ( not ( = ?auto_2402203 ?auto_2402207 ) ) ( not ( = ?auto_2402203 ?auto_2402208 ) ) ( not ( = ?auto_2402203 ?auto_2402212 ) ) ( not ( = ?auto_2402200 ?auto_2402204 ) ) ( not ( = ?auto_2402200 ?auto_2402206 ) ) ( not ( = ?auto_2402200 ?auto_2402205 ) ) ( not ( = ?auto_2402200 ?auto_2402207 ) ) ( not ( = ?auto_2402200 ?auto_2402208 ) ) ( not ( = ?auto_2402200 ?auto_2402212 ) ) ( not ( = ?auto_2402204 ?auto_2402206 ) ) ( not ( = ?auto_2402204 ?auto_2402205 ) ) ( not ( = ?auto_2402204 ?auto_2402207 ) ) ( not ( = ?auto_2402204 ?auto_2402208 ) ) ( not ( = ?auto_2402204 ?auto_2402212 ) ) ( not ( = ?auto_2402206 ?auto_2402205 ) ) ( not ( = ?auto_2402206 ?auto_2402207 ) ) ( not ( = ?auto_2402206 ?auto_2402208 ) ) ( not ( = ?auto_2402206 ?auto_2402212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2402205 ?auto_2402207 ?auto_2402208 )
      ( MAKE-8CRATE-VERIFY ?auto_2402201 ?auto_2402202 ?auto_2402203 ?auto_2402200 ?auto_2402204 ?auto_2402206 ?auto_2402205 ?auto_2402207 ?auto_2402208 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2402294 - SURFACE
      ?auto_2402295 - SURFACE
      ?auto_2402296 - SURFACE
      ?auto_2402293 - SURFACE
      ?auto_2402297 - SURFACE
      ?auto_2402299 - SURFACE
      ?auto_2402298 - SURFACE
      ?auto_2402300 - SURFACE
      ?auto_2402301 - SURFACE
    )
    :vars
    (
      ?auto_2402307 - HOIST
      ?auto_2402302 - PLACE
      ?auto_2402303 - PLACE
      ?auto_2402305 - HOIST
      ?auto_2402304 - SURFACE
      ?auto_2402306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2402307 ?auto_2402302 ) ( IS-CRATE ?auto_2402301 ) ( not ( = ?auto_2402300 ?auto_2402301 ) ) ( not ( = ?auto_2402298 ?auto_2402300 ) ) ( not ( = ?auto_2402298 ?auto_2402301 ) ) ( not ( = ?auto_2402303 ?auto_2402302 ) ) ( HOIST-AT ?auto_2402305 ?auto_2402303 ) ( not ( = ?auto_2402307 ?auto_2402305 ) ) ( AVAILABLE ?auto_2402305 ) ( SURFACE-AT ?auto_2402301 ?auto_2402303 ) ( ON ?auto_2402301 ?auto_2402304 ) ( CLEAR ?auto_2402301 ) ( not ( = ?auto_2402300 ?auto_2402304 ) ) ( not ( = ?auto_2402301 ?auto_2402304 ) ) ( not ( = ?auto_2402298 ?auto_2402304 ) ) ( TRUCK-AT ?auto_2402306 ?auto_2402302 ) ( SURFACE-AT ?auto_2402298 ?auto_2402302 ) ( CLEAR ?auto_2402298 ) ( IS-CRATE ?auto_2402300 ) ( AVAILABLE ?auto_2402307 ) ( IN ?auto_2402300 ?auto_2402306 ) ( ON ?auto_2402295 ?auto_2402294 ) ( ON ?auto_2402296 ?auto_2402295 ) ( ON ?auto_2402293 ?auto_2402296 ) ( ON ?auto_2402297 ?auto_2402293 ) ( ON ?auto_2402299 ?auto_2402297 ) ( ON ?auto_2402298 ?auto_2402299 ) ( not ( = ?auto_2402294 ?auto_2402295 ) ) ( not ( = ?auto_2402294 ?auto_2402296 ) ) ( not ( = ?auto_2402294 ?auto_2402293 ) ) ( not ( = ?auto_2402294 ?auto_2402297 ) ) ( not ( = ?auto_2402294 ?auto_2402299 ) ) ( not ( = ?auto_2402294 ?auto_2402298 ) ) ( not ( = ?auto_2402294 ?auto_2402300 ) ) ( not ( = ?auto_2402294 ?auto_2402301 ) ) ( not ( = ?auto_2402294 ?auto_2402304 ) ) ( not ( = ?auto_2402295 ?auto_2402296 ) ) ( not ( = ?auto_2402295 ?auto_2402293 ) ) ( not ( = ?auto_2402295 ?auto_2402297 ) ) ( not ( = ?auto_2402295 ?auto_2402299 ) ) ( not ( = ?auto_2402295 ?auto_2402298 ) ) ( not ( = ?auto_2402295 ?auto_2402300 ) ) ( not ( = ?auto_2402295 ?auto_2402301 ) ) ( not ( = ?auto_2402295 ?auto_2402304 ) ) ( not ( = ?auto_2402296 ?auto_2402293 ) ) ( not ( = ?auto_2402296 ?auto_2402297 ) ) ( not ( = ?auto_2402296 ?auto_2402299 ) ) ( not ( = ?auto_2402296 ?auto_2402298 ) ) ( not ( = ?auto_2402296 ?auto_2402300 ) ) ( not ( = ?auto_2402296 ?auto_2402301 ) ) ( not ( = ?auto_2402296 ?auto_2402304 ) ) ( not ( = ?auto_2402293 ?auto_2402297 ) ) ( not ( = ?auto_2402293 ?auto_2402299 ) ) ( not ( = ?auto_2402293 ?auto_2402298 ) ) ( not ( = ?auto_2402293 ?auto_2402300 ) ) ( not ( = ?auto_2402293 ?auto_2402301 ) ) ( not ( = ?auto_2402293 ?auto_2402304 ) ) ( not ( = ?auto_2402297 ?auto_2402299 ) ) ( not ( = ?auto_2402297 ?auto_2402298 ) ) ( not ( = ?auto_2402297 ?auto_2402300 ) ) ( not ( = ?auto_2402297 ?auto_2402301 ) ) ( not ( = ?auto_2402297 ?auto_2402304 ) ) ( not ( = ?auto_2402299 ?auto_2402298 ) ) ( not ( = ?auto_2402299 ?auto_2402300 ) ) ( not ( = ?auto_2402299 ?auto_2402301 ) ) ( not ( = ?auto_2402299 ?auto_2402304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2402298 ?auto_2402300 ?auto_2402301 )
      ( MAKE-8CRATE-VERIFY ?auto_2402294 ?auto_2402295 ?auto_2402296 ?auto_2402293 ?auto_2402297 ?auto_2402299 ?auto_2402298 ?auto_2402300 ?auto_2402301 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2406410 - SURFACE
      ?auto_2406411 - SURFACE
      ?auto_2406412 - SURFACE
      ?auto_2406409 - SURFACE
      ?auto_2406413 - SURFACE
      ?auto_2406415 - SURFACE
      ?auto_2406414 - SURFACE
      ?auto_2406416 - SURFACE
      ?auto_2406417 - SURFACE
      ?auto_2406418 - SURFACE
    )
    :vars
    (
      ?auto_2406419 - HOIST
      ?auto_2406420 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2406419 ?auto_2406420 ) ( SURFACE-AT ?auto_2406417 ?auto_2406420 ) ( CLEAR ?auto_2406417 ) ( LIFTING ?auto_2406419 ?auto_2406418 ) ( IS-CRATE ?auto_2406418 ) ( not ( = ?auto_2406417 ?auto_2406418 ) ) ( ON ?auto_2406411 ?auto_2406410 ) ( ON ?auto_2406412 ?auto_2406411 ) ( ON ?auto_2406409 ?auto_2406412 ) ( ON ?auto_2406413 ?auto_2406409 ) ( ON ?auto_2406415 ?auto_2406413 ) ( ON ?auto_2406414 ?auto_2406415 ) ( ON ?auto_2406416 ?auto_2406414 ) ( ON ?auto_2406417 ?auto_2406416 ) ( not ( = ?auto_2406410 ?auto_2406411 ) ) ( not ( = ?auto_2406410 ?auto_2406412 ) ) ( not ( = ?auto_2406410 ?auto_2406409 ) ) ( not ( = ?auto_2406410 ?auto_2406413 ) ) ( not ( = ?auto_2406410 ?auto_2406415 ) ) ( not ( = ?auto_2406410 ?auto_2406414 ) ) ( not ( = ?auto_2406410 ?auto_2406416 ) ) ( not ( = ?auto_2406410 ?auto_2406417 ) ) ( not ( = ?auto_2406410 ?auto_2406418 ) ) ( not ( = ?auto_2406411 ?auto_2406412 ) ) ( not ( = ?auto_2406411 ?auto_2406409 ) ) ( not ( = ?auto_2406411 ?auto_2406413 ) ) ( not ( = ?auto_2406411 ?auto_2406415 ) ) ( not ( = ?auto_2406411 ?auto_2406414 ) ) ( not ( = ?auto_2406411 ?auto_2406416 ) ) ( not ( = ?auto_2406411 ?auto_2406417 ) ) ( not ( = ?auto_2406411 ?auto_2406418 ) ) ( not ( = ?auto_2406412 ?auto_2406409 ) ) ( not ( = ?auto_2406412 ?auto_2406413 ) ) ( not ( = ?auto_2406412 ?auto_2406415 ) ) ( not ( = ?auto_2406412 ?auto_2406414 ) ) ( not ( = ?auto_2406412 ?auto_2406416 ) ) ( not ( = ?auto_2406412 ?auto_2406417 ) ) ( not ( = ?auto_2406412 ?auto_2406418 ) ) ( not ( = ?auto_2406409 ?auto_2406413 ) ) ( not ( = ?auto_2406409 ?auto_2406415 ) ) ( not ( = ?auto_2406409 ?auto_2406414 ) ) ( not ( = ?auto_2406409 ?auto_2406416 ) ) ( not ( = ?auto_2406409 ?auto_2406417 ) ) ( not ( = ?auto_2406409 ?auto_2406418 ) ) ( not ( = ?auto_2406413 ?auto_2406415 ) ) ( not ( = ?auto_2406413 ?auto_2406414 ) ) ( not ( = ?auto_2406413 ?auto_2406416 ) ) ( not ( = ?auto_2406413 ?auto_2406417 ) ) ( not ( = ?auto_2406413 ?auto_2406418 ) ) ( not ( = ?auto_2406415 ?auto_2406414 ) ) ( not ( = ?auto_2406415 ?auto_2406416 ) ) ( not ( = ?auto_2406415 ?auto_2406417 ) ) ( not ( = ?auto_2406415 ?auto_2406418 ) ) ( not ( = ?auto_2406414 ?auto_2406416 ) ) ( not ( = ?auto_2406414 ?auto_2406417 ) ) ( not ( = ?auto_2406414 ?auto_2406418 ) ) ( not ( = ?auto_2406416 ?auto_2406417 ) ) ( not ( = ?auto_2406416 ?auto_2406418 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2406417 ?auto_2406418 )
      ( MAKE-9CRATE-VERIFY ?auto_2406410 ?auto_2406411 ?auto_2406412 ?auto_2406409 ?auto_2406413 ?auto_2406415 ?auto_2406414 ?auto_2406416 ?auto_2406417 ?auto_2406418 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2406490 - SURFACE
      ?auto_2406491 - SURFACE
      ?auto_2406492 - SURFACE
      ?auto_2406489 - SURFACE
      ?auto_2406493 - SURFACE
      ?auto_2406495 - SURFACE
      ?auto_2406494 - SURFACE
      ?auto_2406496 - SURFACE
      ?auto_2406497 - SURFACE
      ?auto_2406498 - SURFACE
    )
    :vars
    (
      ?auto_2406500 - HOIST
      ?auto_2406499 - PLACE
      ?auto_2406501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2406500 ?auto_2406499 ) ( SURFACE-AT ?auto_2406497 ?auto_2406499 ) ( CLEAR ?auto_2406497 ) ( IS-CRATE ?auto_2406498 ) ( not ( = ?auto_2406497 ?auto_2406498 ) ) ( TRUCK-AT ?auto_2406501 ?auto_2406499 ) ( AVAILABLE ?auto_2406500 ) ( IN ?auto_2406498 ?auto_2406501 ) ( ON ?auto_2406497 ?auto_2406496 ) ( not ( = ?auto_2406496 ?auto_2406497 ) ) ( not ( = ?auto_2406496 ?auto_2406498 ) ) ( ON ?auto_2406491 ?auto_2406490 ) ( ON ?auto_2406492 ?auto_2406491 ) ( ON ?auto_2406489 ?auto_2406492 ) ( ON ?auto_2406493 ?auto_2406489 ) ( ON ?auto_2406495 ?auto_2406493 ) ( ON ?auto_2406494 ?auto_2406495 ) ( ON ?auto_2406496 ?auto_2406494 ) ( not ( = ?auto_2406490 ?auto_2406491 ) ) ( not ( = ?auto_2406490 ?auto_2406492 ) ) ( not ( = ?auto_2406490 ?auto_2406489 ) ) ( not ( = ?auto_2406490 ?auto_2406493 ) ) ( not ( = ?auto_2406490 ?auto_2406495 ) ) ( not ( = ?auto_2406490 ?auto_2406494 ) ) ( not ( = ?auto_2406490 ?auto_2406496 ) ) ( not ( = ?auto_2406490 ?auto_2406497 ) ) ( not ( = ?auto_2406490 ?auto_2406498 ) ) ( not ( = ?auto_2406491 ?auto_2406492 ) ) ( not ( = ?auto_2406491 ?auto_2406489 ) ) ( not ( = ?auto_2406491 ?auto_2406493 ) ) ( not ( = ?auto_2406491 ?auto_2406495 ) ) ( not ( = ?auto_2406491 ?auto_2406494 ) ) ( not ( = ?auto_2406491 ?auto_2406496 ) ) ( not ( = ?auto_2406491 ?auto_2406497 ) ) ( not ( = ?auto_2406491 ?auto_2406498 ) ) ( not ( = ?auto_2406492 ?auto_2406489 ) ) ( not ( = ?auto_2406492 ?auto_2406493 ) ) ( not ( = ?auto_2406492 ?auto_2406495 ) ) ( not ( = ?auto_2406492 ?auto_2406494 ) ) ( not ( = ?auto_2406492 ?auto_2406496 ) ) ( not ( = ?auto_2406492 ?auto_2406497 ) ) ( not ( = ?auto_2406492 ?auto_2406498 ) ) ( not ( = ?auto_2406489 ?auto_2406493 ) ) ( not ( = ?auto_2406489 ?auto_2406495 ) ) ( not ( = ?auto_2406489 ?auto_2406494 ) ) ( not ( = ?auto_2406489 ?auto_2406496 ) ) ( not ( = ?auto_2406489 ?auto_2406497 ) ) ( not ( = ?auto_2406489 ?auto_2406498 ) ) ( not ( = ?auto_2406493 ?auto_2406495 ) ) ( not ( = ?auto_2406493 ?auto_2406494 ) ) ( not ( = ?auto_2406493 ?auto_2406496 ) ) ( not ( = ?auto_2406493 ?auto_2406497 ) ) ( not ( = ?auto_2406493 ?auto_2406498 ) ) ( not ( = ?auto_2406495 ?auto_2406494 ) ) ( not ( = ?auto_2406495 ?auto_2406496 ) ) ( not ( = ?auto_2406495 ?auto_2406497 ) ) ( not ( = ?auto_2406495 ?auto_2406498 ) ) ( not ( = ?auto_2406494 ?auto_2406496 ) ) ( not ( = ?auto_2406494 ?auto_2406497 ) ) ( not ( = ?auto_2406494 ?auto_2406498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2406496 ?auto_2406497 ?auto_2406498 )
      ( MAKE-9CRATE-VERIFY ?auto_2406490 ?auto_2406491 ?auto_2406492 ?auto_2406489 ?auto_2406493 ?auto_2406495 ?auto_2406494 ?auto_2406496 ?auto_2406497 ?auto_2406498 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2406580 - SURFACE
      ?auto_2406581 - SURFACE
      ?auto_2406582 - SURFACE
      ?auto_2406579 - SURFACE
      ?auto_2406583 - SURFACE
      ?auto_2406585 - SURFACE
      ?auto_2406584 - SURFACE
      ?auto_2406586 - SURFACE
      ?auto_2406587 - SURFACE
      ?auto_2406588 - SURFACE
    )
    :vars
    (
      ?auto_2406591 - HOIST
      ?auto_2406590 - PLACE
      ?auto_2406592 - TRUCK
      ?auto_2406589 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2406591 ?auto_2406590 ) ( SURFACE-AT ?auto_2406587 ?auto_2406590 ) ( CLEAR ?auto_2406587 ) ( IS-CRATE ?auto_2406588 ) ( not ( = ?auto_2406587 ?auto_2406588 ) ) ( AVAILABLE ?auto_2406591 ) ( IN ?auto_2406588 ?auto_2406592 ) ( ON ?auto_2406587 ?auto_2406586 ) ( not ( = ?auto_2406586 ?auto_2406587 ) ) ( not ( = ?auto_2406586 ?auto_2406588 ) ) ( TRUCK-AT ?auto_2406592 ?auto_2406589 ) ( not ( = ?auto_2406589 ?auto_2406590 ) ) ( ON ?auto_2406581 ?auto_2406580 ) ( ON ?auto_2406582 ?auto_2406581 ) ( ON ?auto_2406579 ?auto_2406582 ) ( ON ?auto_2406583 ?auto_2406579 ) ( ON ?auto_2406585 ?auto_2406583 ) ( ON ?auto_2406584 ?auto_2406585 ) ( ON ?auto_2406586 ?auto_2406584 ) ( not ( = ?auto_2406580 ?auto_2406581 ) ) ( not ( = ?auto_2406580 ?auto_2406582 ) ) ( not ( = ?auto_2406580 ?auto_2406579 ) ) ( not ( = ?auto_2406580 ?auto_2406583 ) ) ( not ( = ?auto_2406580 ?auto_2406585 ) ) ( not ( = ?auto_2406580 ?auto_2406584 ) ) ( not ( = ?auto_2406580 ?auto_2406586 ) ) ( not ( = ?auto_2406580 ?auto_2406587 ) ) ( not ( = ?auto_2406580 ?auto_2406588 ) ) ( not ( = ?auto_2406581 ?auto_2406582 ) ) ( not ( = ?auto_2406581 ?auto_2406579 ) ) ( not ( = ?auto_2406581 ?auto_2406583 ) ) ( not ( = ?auto_2406581 ?auto_2406585 ) ) ( not ( = ?auto_2406581 ?auto_2406584 ) ) ( not ( = ?auto_2406581 ?auto_2406586 ) ) ( not ( = ?auto_2406581 ?auto_2406587 ) ) ( not ( = ?auto_2406581 ?auto_2406588 ) ) ( not ( = ?auto_2406582 ?auto_2406579 ) ) ( not ( = ?auto_2406582 ?auto_2406583 ) ) ( not ( = ?auto_2406582 ?auto_2406585 ) ) ( not ( = ?auto_2406582 ?auto_2406584 ) ) ( not ( = ?auto_2406582 ?auto_2406586 ) ) ( not ( = ?auto_2406582 ?auto_2406587 ) ) ( not ( = ?auto_2406582 ?auto_2406588 ) ) ( not ( = ?auto_2406579 ?auto_2406583 ) ) ( not ( = ?auto_2406579 ?auto_2406585 ) ) ( not ( = ?auto_2406579 ?auto_2406584 ) ) ( not ( = ?auto_2406579 ?auto_2406586 ) ) ( not ( = ?auto_2406579 ?auto_2406587 ) ) ( not ( = ?auto_2406579 ?auto_2406588 ) ) ( not ( = ?auto_2406583 ?auto_2406585 ) ) ( not ( = ?auto_2406583 ?auto_2406584 ) ) ( not ( = ?auto_2406583 ?auto_2406586 ) ) ( not ( = ?auto_2406583 ?auto_2406587 ) ) ( not ( = ?auto_2406583 ?auto_2406588 ) ) ( not ( = ?auto_2406585 ?auto_2406584 ) ) ( not ( = ?auto_2406585 ?auto_2406586 ) ) ( not ( = ?auto_2406585 ?auto_2406587 ) ) ( not ( = ?auto_2406585 ?auto_2406588 ) ) ( not ( = ?auto_2406584 ?auto_2406586 ) ) ( not ( = ?auto_2406584 ?auto_2406587 ) ) ( not ( = ?auto_2406584 ?auto_2406588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2406586 ?auto_2406587 ?auto_2406588 )
      ( MAKE-9CRATE-VERIFY ?auto_2406580 ?auto_2406581 ?auto_2406582 ?auto_2406579 ?auto_2406583 ?auto_2406585 ?auto_2406584 ?auto_2406586 ?auto_2406587 ?auto_2406588 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2406679 - SURFACE
      ?auto_2406680 - SURFACE
      ?auto_2406681 - SURFACE
      ?auto_2406678 - SURFACE
      ?auto_2406682 - SURFACE
      ?auto_2406684 - SURFACE
      ?auto_2406683 - SURFACE
      ?auto_2406685 - SURFACE
      ?auto_2406686 - SURFACE
      ?auto_2406687 - SURFACE
    )
    :vars
    (
      ?auto_2406692 - HOIST
      ?auto_2406690 - PLACE
      ?auto_2406689 - TRUCK
      ?auto_2406691 - PLACE
      ?auto_2406688 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2406692 ?auto_2406690 ) ( SURFACE-AT ?auto_2406686 ?auto_2406690 ) ( CLEAR ?auto_2406686 ) ( IS-CRATE ?auto_2406687 ) ( not ( = ?auto_2406686 ?auto_2406687 ) ) ( AVAILABLE ?auto_2406692 ) ( ON ?auto_2406686 ?auto_2406685 ) ( not ( = ?auto_2406685 ?auto_2406686 ) ) ( not ( = ?auto_2406685 ?auto_2406687 ) ) ( TRUCK-AT ?auto_2406689 ?auto_2406691 ) ( not ( = ?auto_2406691 ?auto_2406690 ) ) ( HOIST-AT ?auto_2406688 ?auto_2406691 ) ( LIFTING ?auto_2406688 ?auto_2406687 ) ( not ( = ?auto_2406692 ?auto_2406688 ) ) ( ON ?auto_2406680 ?auto_2406679 ) ( ON ?auto_2406681 ?auto_2406680 ) ( ON ?auto_2406678 ?auto_2406681 ) ( ON ?auto_2406682 ?auto_2406678 ) ( ON ?auto_2406684 ?auto_2406682 ) ( ON ?auto_2406683 ?auto_2406684 ) ( ON ?auto_2406685 ?auto_2406683 ) ( not ( = ?auto_2406679 ?auto_2406680 ) ) ( not ( = ?auto_2406679 ?auto_2406681 ) ) ( not ( = ?auto_2406679 ?auto_2406678 ) ) ( not ( = ?auto_2406679 ?auto_2406682 ) ) ( not ( = ?auto_2406679 ?auto_2406684 ) ) ( not ( = ?auto_2406679 ?auto_2406683 ) ) ( not ( = ?auto_2406679 ?auto_2406685 ) ) ( not ( = ?auto_2406679 ?auto_2406686 ) ) ( not ( = ?auto_2406679 ?auto_2406687 ) ) ( not ( = ?auto_2406680 ?auto_2406681 ) ) ( not ( = ?auto_2406680 ?auto_2406678 ) ) ( not ( = ?auto_2406680 ?auto_2406682 ) ) ( not ( = ?auto_2406680 ?auto_2406684 ) ) ( not ( = ?auto_2406680 ?auto_2406683 ) ) ( not ( = ?auto_2406680 ?auto_2406685 ) ) ( not ( = ?auto_2406680 ?auto_2406686 ) ) ( not ( = ?auto_2406680 ?auto_2406687 ) ) ( not ( = ?auto_2406681 ?auto_2406678 ) ) ( not ( = ?auto_2406681 ?auto_2406682 ) ) ( not ( = ?auto_2406681 ?auto_2406684 ) ) ( not ( = ?auto_2406681 ?auto_2406683 ) ) ( not ( = ?auto_2406681 ?auto_2406685 ) ) ( not ( = ?auto_2406681 ?auto_2406686 ) ) ( not ( = ?auto_2406681 ?auto_2406687 ) ) ( not ( = ?auto_2406678 ?auto_2406682 ) ) ( not ( = ?auto_2406678 ?auto_2406684 ) ) ( not ( = ?auto_2406678 ?auto_2406683 ) ) ( not ( = ?auto_2406678 ?auto_2406685 ) ) ( not ( = ?auto_2406678 ?auto_2406686 ) ) ( not ( = ?auto_2406678 ?auto_2406687 ) ) ( not ( = ?auto_2406682 ?auto_2406684 ) ) ( not ( = ?auto_2406682 ?auto_2406683 ) ) ( not ( = ?auto_2406682 ?auto_2406685 ) ) ( not ( = ?auto_2406682 ?auto_2406686 ) ) ( not ( = ?auto_2406682 ?auto_2406687 ) ) ( not ( = ?auto_2406684 ?auto_2406683 ) ) ( not ( = ?auto_2406684 ?auto_2406685 ) ) ( not ( = ?auto_2406684 ?auto_2406686 ) ) ( not ( = ?auto_2406684 ?auto_2406687 ) ) ( not ( = ?auto_2406683 ?auto_2406685 ) ) ( not ( = ?auto_2406683 ?auto_2406686 ) ) ( not ( = ?auto_2406683 ?auto_2406687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2406685 ?auto_2406686 ?auto_2406687 )
      ( MAKE-9CRATE-VERIFY ?auto_2406679 ?auto_2406680 ?auto_2406681 ?auto_2406678 ?auto_2406682 ?auto_2406684 ?auto_2406683 ?auto_2406685 ?auto_2406686 ?auto_2406687 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2406787 - SURFACE
      ?auto_2406788 - SURFACE
      ?auto_2406789 - SURFACE
      ?auto_2406786 - SURFACE
      ?auto_2406790 - SURFACE
      ?auto_2406792 - SURFACE
      ?auto_2406791 - SURFACE
      ?auto_2406793 - SURFACE
      ?auto_2406794 - SURFACE
      ?auto_2406795 - SURFACE
    )
    :vars
    (
      ?auto_2406797 - HOIST
      ?auto_2406799 - PLACE
      ?auto_2406800 - TRUCK
      ?auto_2406796 - PLACE
      ?auto_2406798 - HOIST
      ?auto_2406801 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2406797 ?auto_2406799 ) ( SURFACE-AT ?auto_2406794 ?auto_2406799 ) ( CLEAR ?auto_2406794 ) ( IS-CRATE ?auto_2406795 ) ( not ( = ?auto_2406794 ?auto_2406795 ) ) ( AVAILABLE ?auto_2406797 ) ( ON ?auto_2406794 ?auto_2406793 ) ( not ( = ?auto_2406793 ?auto_2406794 ) ) ( not ( = ?auto_2406793 ?auto_2406795 ) ) ( TRUCK-AT ?auto_2406800 ?auto_2406796 ) ( not ( = ?auto_2406796 ?auto_2406799 ) ) ( HOIST-AT ?auto_2406798 ?auto_2406796 ) ( not ( = ?auto_2406797 ?auto_2406798 ) ) ( AVAILABLE ?auto_2406798 ) ( SURFACE-AT ?auto_2406795 ?auto_2406796 ) ( ON ?auto_2406795 ?auto_2406801 ) ( CLEAR ?auto_2406795 ) ( not ( = ?auto_2406794 ?auto_2406801 ) ) ( not ( = ?auto_2406795 ?auto_2406801 ) ) ( not ( = ?auto_2406793 ?auto_2406801 ) ) ( ON ?auto_2406788 ?auto_2406787 ) ( ON ?auto_2406789 ?auto_2406788 ) ( ON ?auto_2406786 ?auto_2406789 ) ( ON ?auto_2406790 ?auto_2406786 ) ( ON ?auto_2406792 ?auto_2406790 ) ( ON ?auto_2406791 ?auto_2406792 ) ( ON ?auto_2406793 ?auto_2406791 ) ( not ( = ?auto_2406787 ?auto_2406788 ) ) ( not ( = ?auto_2406787 ?auto_2406789 ) ) ( not ( = ?auto_2406787 ?auto_2406786 ) ) ( not ( = ?auto_2406787 ?auto_2406790 ) ) ( not ( = ?auto_2406787 ?auto_2406792 ) ) ( not ( = ?auto_2406787 ?auto_2406791 ) ) ( not ( = ?auto_2406787 ?auto_2406793 ) ) ( not ( = ?auto_2406787 ?auto_2406794 ) ) ( not ( = ?auto_2406787 ?auto_2406795 ) ) ( not ( = ?auto_2406787 ?auto_2406801 ) ) ( not ( = ?auto_2406788 ?auto_2406789 ) ) ( not ( = ?auto_2406788 ?auto_2406786 ) ) ( not ( = ?auto_2406788 ?auto_2406790 ) ) ( not ( = ?auto_2406788 ?auto_2406792 ) ) ( not ( = ?auto_2406788 ?auto_2406791 ) ) ( not ( = ?auto_2406788 ?auto_2406793 ) ) ( not ( = ?auto_2406788 ?auto_2406794 ) ) ( not ( = ?auto_2406788 ?auto_2406795 ) ) ( not ( = ?auto_2406788 ?auto_2406801 ) ) ( not ( = ?auto_2406789 ?auto_2406786 ) ) ( not ( = ?auto_2406789 ?auto_2406790 ) ) ( not ( = ?auto_2406789 ?auto_2406792 ) ) ( not ( = ?auto_2406789 ?auto_2406791 ) ) ( not ( = ?auto_2406789 ?auto_2406793 ) ) ( not ( = ?auto_2406789 ?auto_2406794 ) ) ( not ( = ?auto_2406789 ?auto_2406795 ) ) ( not ( = ?auto_2406789 ?auto_2406801 ) ) ( not ( = ?auto_2406786 ?auto_2406790 ) ) ( not ( = ?auto_2406786 ?auto_2406792 ) ) ( not ( = ?auto_2406786 ?auto_2406791 ) ) ( not ( = ?auto_2406786 ?auto_2406793 ) ) ( not ( = ?auto_2406786 ?auto_2406794 ) ) ( not ( = ?auto_2406786 ?auto_2406795 ) ) ( not ( = ?auto_2406786 ?auto_2406801 ) ) ( not ( = ?auto_2406790 ?auto_2406792 ) ) ( not ( = ?auto_2406790 ?auto_2406791 ) ) ( not ( = ?auto_2406790 ?auto_2406793 ) ) ( not ( = ?auto_2406790 ?auto_2406794 ) ) ( not ( = ?auto_2406790 ?auto_2406795 ) ) ( not ( = ?auto_2406790 ?auto_2406801 ) ) ( not ( = ?auto_2406792 ?auto_2406791 ) ) ( not ( = ?auto_2406792 ?auto_2406793 ) ) ( not ( = ?auto_2406792 ?auto_2406794 ) ) ( not ( = ?auto_2406792 ?auto_2406795 ) ) ( not ( = ?auto_2406792 ?auto_2406801 ) ) ( not ( = ?auto_2406791 ?auto_2406793 ) ) ( not ( = ?auto_2406791 ?auto_2406794 ) ) ( not ( = ?auto_2406791 ?auto_2406795 ) ) ( not ( = ?auto_2406791 ?auto_2406801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2406793 ?auto_2406794 ?auto_2406795 )
      ( MAKE-9CRATE-VERIFY ?auto_2406787 ?auto_2406788 ?auto_2406789 ?auto_2406786 ?auto_2406790 ?auto_2406792 ?auto_2406791 ?auto_2406793 ?auto_2406794 ?auto_2406795 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2406896 - SURFACE
      ?auto_2406897 - SURFACE
      ?auto_2406898 - SURFACE
      ?auto_2406895 - SURFACE
      ?auto_2406899 - SURFACE
      ?auto_2406901 - SURFACE
      ?auto_2406900 - SURFACE
      ?auto_2406902 - SURFACE
      ?auto_2406903 - SURFACE
      ?auto_2406904 - SURFACE
    )
    :vars
    (
      ?auto_2406909 - HOIST
      ?auto_2406906 - PLACE
      ?auto_2406910 - PLACE
      ?auto_2406905 - HOIST
      ?auto_2406907 - SURFACE
      ?auto_2406908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2406909 ?auto_2406906 ) ( SURFACE-AT ?auto_2406903 ?auto_2406906 ) ( CLEAR ?auto_2406903 ) ( IS-CRATE ?auto_2406904 ) ( not ( = ?auto_2406903 ?auto_2406904 ) ) ( AVAILABLE ?auto_2406909 ) ( ON ?auto_2406903 ?auto_2406902 ) ( not ( = ?auto_2406902 ?auto_2406903 ) ) ( not ( = ?auto_2406902 ?auto_2406904 ) ) ( not ( = ?auto_2406910 ?auto_2406906 ) ) ( HOIST-AT ?auto_2406905 ?auto_2406910 ) ( not ( = ?auto_2406909 ?auto_2406905 ) ) ( AVAILABLE ?auto_2406905 ) ( SURFACE-AT ?auto_2406904 ?auto_2406910 ) ( ON ?auto_2406904 ?auto_2406907 ) ( CLEAR ?auto_2406904 ) ( not ( = ?auto_2406903 ?auto_2406907 ) ) ( not ( = ?auto_2406904 ?auto_2406907 ) ) ( not ( = ?auto_2406902 ?auto_2406907 ) ) ( TRUCK-AT ?auto_2406908 ?auto_2406906 ) ( ON ?auto_2406897 ?auto_2406896 ) ( ON ?auto_2406898 ?auto_2406897 ) ( ON ?auto_2406895 ?auto_2406898 ) ( ON ?auto_2406899 ?auto_2406895 ) ( ON ?auto_2406901 ?auto_2406899 ) ( ON ?auto_2406900 ?auto_2406901 ) ( ON ?auto_2406902 ?auto_2406900 ) ( not ( = ?auto_2406896 ?auto_2406897 ) ) ( not ( = ?auto_2406896 ?auto_2406898 ) ) ( not ( = ?auto_2406896 ?auto_2406895 ) ) ( not ( = ?auto_2406896 ?auto_2406899 ) ) ( not ( = ?auto_2406896 ?auto_2406901 ) ) ( not ( = ?auto_2406896 ?auto_2406900 ) ) ( not ( = ?auto_2406896 ?auto_2406902 ) ) ( not ( = ?auto_2406896 ?auto_2406903 ) ) ( not ( = ?auto_2406896 ?auto_2406904 ) ) ( not ( = ?auto_2406896 ?auto_2406907 ) ) ( not ( = ?auto_2406897 ?auto_2406898 ) ) ( not ( = ?auto_2406897 ?auto_2406895 ) ) ( not ( = ?auto_2406897 ?auto_2406899 ) ) ( not ( = ?auto_2406897 ?auto_2406901 ) ) ( not ( = ?auto_2406897 ?auto_2406900 ) ) ( not ( = ?auto_2406897 ?auto_2406902 ) ) ( not ( = ?auto_2406897 ?auto_2406903 ) ) ( not ( = ?auto_2406897 ?auto_2406904 ) ) ( not ( = ?auto_2406897 ?auto_2406907 ) ) ( not ( = ?auto_2406898 ?auto_2406895 ) ) ( not ( = ?auto_2406898 ?auto_2406899 ) ) ( not ( = ?auto_2406898 ?auto_2406901 ) ) ( not ( = ?auto_2406898 ?auto_2406900 ) ) ( not ( = ?auto_2406898 ?auto_2406902 ) ) ( not ( = ?auto_2406898 ?auto_2406903 ) ) ( not ( = ?auto_2406898 ?auto_2406904 ) ) ( not ( = ?auto_2406898 ?auto_2406907 ) ) ( not ( = ?auto_2406895 ?auto_2406899 ) ) ( not ( = ?auto_2406895 ?auto_2406901 ) ) ( not ( = ?auto_2406895 ?auto_2406900 ) ) ( not ( = ?auto_2406895 ?auto_2406902 ) ) ( not ( = ?auto_2406895 ?auto_2406903 ) ) ( not ( = ?auto_2406895 ?auto_2406904 ) ) ( not ( = ?auto_2406895 ?auto_2406907 ) ) ( not ( = ?auto_2406899 ?auto_2406901 ) ) ( not ( = ?auto_2406899 ?auto_2406900 ) ) ( not ( = ?auto_2406899 ?auto_2406902 ) ) ( not ( = ?auto_2406899 ?auto_2406903 ) ) ( not ( = ?auto_2406899 ?auto_2406904 ) ) ( not ( = ?auto_2406899 ?auto_2406907 ) ) ( not ( = ?auto_2406901 ?auto_2406900 ) ) ( not ( = ?auto_2406901 ?auto_2406902 ) ) ( not ( = ?auto_2406901 ?auto_2406903 ) ) ( not ( = ?auto_2406901 ?auto_2406904 ) ) ( not ( = ?auto_2406901 ?auto_2406907 ) ) ( not ( = ?auto_2406900 ?auto_2406902 ) ) ( not ( = ?auto_2406900 ?auto_2406903 ) ) ( not ( = ?auto_2406900 ?auto_2406904 ) ) ( not ( = ?auto_2406900 ?auto_2406907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2406902 ?auto_2406903 ?auto_2406904 )
      ( MAKE-9CRATE-VERIFY ?auto_2406896 ?auto_2406897 ?auto_2406898 ?auto_2406895 ?auto_2406899 ?auto_2406901 ?auto_2406900 ?auto_2406902 ?auto_2406903 ?auto_2406904 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2407005 - SURFACE
      ?auto_2407006 - SURFACE
      ?auto_2407007 - SURFACE
      ?auto_2407004 - SURFACE
      ?auto_2407008 - SURFACE
      ?auto_2407010 - SURFACE
      ?auto_2407009 - SURFACE
      ?auto_2407011 - SURFACE
      ?auto_2407012 - SURFACE
      ?auto_2407013 - SURFACE
    )
    :vars
    (
      ?auto_2407015 - HOIST
      ?auto_2407016 - PLACE
      ?auto_2407014 - PLACE
      ?auto_2407018 - HOIST
      ?auto_2407017 - SURFACE
      ?auto_2407019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2407015 ?auto_2407016 ) ( IS-CRATE ?auto_2407013 ) ( not ( = ?auto_2407012 ?auto_2407013 ) ) ( not ( = ?auto_2407011 ?auto_2407012 ) ) ( not ( = ?auto_2407011 ?auto_2407013 ) ) ( not ( = ?auto_2407014 ?auto_2407016 ) ) ( HOIST-AT ?auto_2407018 ?auto_2407014 ) ( not ( = ?auto_2407015 ?auto_2407018 ) ) ( AVAILABLE ?auto_2407018 ) ( SURFACE-AT ?auto_2407013 ?auto_2407014 ) ( ON ?auto_2407013 ?auto_2407017 ) ( CLEAR ?auto_2407013 ) ( not ( = ?auto_2407012 ?auto_2407017 ) ) ( not ( = ?auto_2407013 ?auto_2407017 ) ) ( not ( = ?auto_2407011 ?auto_2407017 ) ) ( TRUCK-AT ?auto_2407019 ?auto_2407016 ) ( SURFACE-AT ?auto_2407011 ?auto_2407016 ) ( CLEAR ?auto_2407011 ) ( LIFTING ?auto_2407015 ?auto_2407012 ) ( IS-CRATE ?auto_2407012 ) ( ON ?auto_2407006 ?auto_2407005 ) ( ON ?auto_2407007 ?auto_2407006 ) ( ON ?auto_2407004 ?auto_2407007 ) ( ON ?auto_2407008 ?auto_2407004 ) ( ON ?auto_2407010 ?auto_2407008 ) ( ON ?auto_2407009 ?auto_2407010 ) ( ON ?auto_2407011 ?auto_2407009 ) ( not ( = ?auto_2407005 ?auto_2407006 ) ) ( not ( = ?auto_2407005 ?auto_2407007 ) ) ( not ( = ?auto_2407005 ?auto_2407004 ) ) ( not ( = ?auto_2407005 ?auto_2407008 ) ) ( not ( = ?auto_2407005 ?auto_2407010 ) ) ( not ( = ?auto_2407005 ?auto_2407009 ) ) ( not ( = ?auto_2407005 ?auto_2407011 ) ) ( not ( = ?auto_2407005 ?auto_2407012 ) ) ( not ( = ?auto_2407005 ?auto_2407013 ) ) ( not ( = ?auto_2407005 ?auto_2407017 ) ) ( not ( = ?auto_2407006 ?auto_2407007 ) ) ( not ( = ?auto_2407006 ?auto_2407004 ) ) ( not ( = ?auto_2407006 ?auto_2407008 ) ) ( not ( = ?auto_2407006 ?auto_2407010 ) ) ( not ( = ?auto_2407006 ?auto_2407009 ) ) ( not ( = ?auto_2407006 ?auto_2407011 ) ) ( not ( = ?auto_2407006 ?auto_2407012 ) ) ( not ( = ?auto_2407006 ?auto_2407013 ) ) ( not ( = ?auto_2407006 ?auto_2407017 ) ) ( not ( = ?auto_2407007 ?auto_2407004 ) ) ( not ( = ?auto_2407007 ?auto_2407008 ) ) ( not ( = ?auto_2407007 ?auto_2407010 ) ) ( not ( = ?auto_2407007 ?auto_2407009 ) ) ( not ( = ?auto_2407007 ?auto_2407011 ) ) ( not ( = ?auto_2407007 ?auto_2407012 ) ) ( not ( = ?auto_2407007 ?auto_2407013 ) ) ( not ( = ?auto_2407007 ?auto_2407017 ) ) ( not ( = ?auto_2407004 ?auto_2407008 ) ) ( not ( = ?auto_2407004 ?auto_2407010 ) ) ( not ( = ?auto_2407004 ?auto_2407009 ) ) ( not ( = ?auto_2407004 ?auto_2407011 ) ) ( not ( = ?auto_2407004 ?auto_2407012 ) ) ( not ( = ?auto_2407004 ?auto_2407013 ) ) ( not ( = ?auto_2407004 ?auto_2407017 ) ) ( not ( = ?auto_2407008 ?auto_2407010 ) ) ( not ( = ?auto_2407008 ?auto_2407009 ) ) ( not ( = ?auto_2407008 ?auto_2407011 ) ) ( not ( = ?auto_2407008 ?auto_2407012 ) ) ( not ( = ?auto_2407008 ?auto_2407013 ) ) ( not ( = ?auto_2407008 ?auto_2407017 ) ) ( not ( = ?auto_2407010 ?auto_2407009 ) ) ( not ( = ?auto_2407010 ?auto_2407011 ) ) ( not ( = ?auto_2407010 ?auto_2407012 ) ) ( not ( = ?auto_2407010 ?auto_2407013 ) ) ( not ( = ?auto_2407010 ?auto_2407017 ) ) ( not ( = ?auto_2407009 ?auto_2407011 ) ) ( not ( = ?auto_2407009 ?auto_2407012 ) ) ( not ( = ?auto_2407009 ?auto_2407013 ) ) ( not ( = ?auto_2407009 ?auto_2407017 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2407011 ?auto_2407012 ?auto_2407013 )
      ( MAKE-9CRATE-VERIFY ?auto_2407005 ?auto_2407006 ?auto_2407007 ?auto_2407004 ?auto_2407008 ?auto_2407010 ?auto_2407009 ?auto_2407011 ?auto_2407012 ?auto_2407013 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2407114 - SURFACE
      ?auto_2407115 - SURFACE
      ?auto_2407116 - SURFACE
      ?auto_2407113 - SURFACE
      ?auto_2407117 - SURFACE
      ?auto_2407119 - SURFACE
      ?auto_2407118 - SURFACE
      ?auto_2407120 - SURFACE
      ?auto_2407121 - SURFACE
      ?auto_2407122 - SURFACE
    )
    :vars
    (
      ?auto_2407123 - HOIST
      ?auto_2407125 - PLACE
      ?auto_2407124 - PLACE
      ?auto_2407127 - HOIST
      ?auto_2407128 - SURFACE
      ?auto_2407126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2407123 ?auto_2407125 ) ( IS-CRATE ?auto_2407122 ) ( not ( = ?auto_2407121 ?auto_2407122 ) ) ( not ( = ?auto_2407120 ?auto_2407121 ) ) ( not ( = ?auto_2407120 ?auto_2407122 ) ) ( not ( = ?auto_2407124 ?auto_2407125 ) ) ( HOIST-AT ?auto_2407127 ?auto_2407124 ) ( not ( = ?auto_2407123 ?auto_2407127 ) ) ( AVAILABLE ?auto_2407127 ) ( SURFACE-AT ?auto_2407122 ?auto_2407124 ) ( ON ?auto_2407122 ?auto_2407128 ) ( CLEAR ?auto_2407122 ) ( not ( = ?auto_2407121 ?auto_2407128 ) ) ( not ( = ?auto_2407122 ?auto_2407128 ) ) ( not ( = ?auto_2407120 ?auto_2407128 ) ) ( TRUCK-AT ?auto_2407126 ?auto_2407125 ) ( SURFACE-AT ?auto_2407120 ?auto_2407125 ) ( CLEAR ?auto_2407120 ) ( IS-CRATE ?auto_2407121 ) ( AVAILABLE ?auto_2407123 ) ( IN ?auto_2407121 ?auto_2407126 ) ( ON ?auto_2407115 ?auto_2407114 ) ( ON ?auto_2407116 ?auto_2407115 ) ( ON ?auto_2407113 ?auto_2407116 ) ( ON ?auto_2407117 ?auto_2407113 ) ( ON ?auto_2407119 ?auto_2407117 ) ( ON ?auto_2407118 ?auto_2407119 ) ( ON ?auto_2407120 ?auto_2407118 ) ( not ( = ?auto_2407114 ?auto_2407115 ) ) ( not ( = ?auto_2407114 ?auto_2407116 ) ) ( not ( = ?auto_2407114 ?auto_2407113 ) ) ( not ( = ?auto_2407114 ?auto_2407117 ) ) ( not ( = ?auto_2407114 ?auto_2407119 ) ) ( not ( = ?auto_2407114 ?auto_2407118 ) ) ( not ( = ?auto_2407114 ?auto_2407120 ) ) ( not ( = ?auto_2407114 ?auto_2407121 ) ) ( not ( = ?auto_2407114 ?auto_2407122 ) ) ( not ( = ?auto_2407114 ?auto_2407128 ) ) ( not ( = ?auto_2407115 ?auto_2407116 ) ) ( not ( = ?auto_2407115 ?auto_2407113 ) ) ( not ( = ?auto_2407115 ?auto_2407117 ) ) ( not ( = ?auto_2407115 ?auto_2407119 ) ) ( not ( = ?auto_2407115 ?auto_2407118 ) ) ( not ( = ?auto_2407115 ?auto_2407120 ) ) ( not ( = ?auto_2407115 ?auto_2407121 ) ) ( not ( = ?auto_2407115 ?auto_2407122 ) ) ( not ( = ?auto_2407115 ?auto_2407128 ) ) ( not ( = ?auto_2407116 ?auto_2407113 ) ) ( not ( = ?auto_2407116 ?auto_2407117 ) ) ( not ( = ?auto_2407116 ?auto_2407119 ) ) ( not ( = ?auto_2407116 ?auto_2407118 ) ) ( not ( = ?auto_2407116 ?auto_2407120 ) ) ( not ( = ?auto_2407116 ?auto_2407121 ) ) ( not ( = ?auto_2407116 ?auto_2407122 ) ) ( not ( = ?auto_2407116 ?auto_2407128 ) ) ( not ( = ?auto_2407113 ?auto_2407117 ) ) ( not ( = ?auto_2407113 ?auto_2407119 ) ) ( not ( = ?auto_2407113 ?auto_2407118 ) ) ( not ( = ?auto_2407113 ?auto_2407120 ) ) ( not ( = ?auto_2407113 ?auto_2407121 ) ) ( not ( = ?auto_2407113 ?auto_2407122 ) ) ( not ( = ?auto_2407113 ?auto_2407128 ) ) ( not ( = ?auto_2407117 ?auto_2407119 ) ) ( not ( = ?auto_2407117 ?auto_2407118 ) ) ( not ( = ?auto_2407117 ?auto_2407120 ) ) ( not ( = ?auto_2407117 ?auto_2407121 ) ) ( not ( = ?auto_2407117 ?auto_2407122 ) ) ( not ( = ?auto_2407117 ?auto_2407128 ) ) ( not ( = ?auto_2407119 ?auto_2407118 ) ) ( not ( = ?auto_2407119 ?auto_2407120 ) ) ( not ( = ?auto_2407119 ?auto_2407121 ) ) ( not ( = ?auto_2407119 ?auto_2407122 ) ) ( not ( = ?auto_2407119 ?auto_2407128 ) ) ( not ( = ?auto_2407118 ?auto_2407120 ) ) ( not ( = ?auto_2407118 ?auto_2407121 ) ) ( not ( = ?auto_2407118 ?auto_2407122 ) ) ( not ( = ?auto_2407118 ?auto_2407128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2407120 ?auto_2407121 ?auto_2407122 )
      ( MAKE-9CRATE-VERIFY ?auto_2407114 ?auto_2407115 ?auto_2407116 ?auto_2407113 ?auto_2407117 ?auto_2407119 ?auto_2407118 ?auto_2407120 ?auto_2407121 ?auto_2407122 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2412679 - SURFACE
      ?auto_2412680 - SURFACE
      ?auto_2412681 - SURFACE
      ?auto_2412678 - SURFACE
      ?auto_2412682 - SURFACE
      ?auto_2412684 - SURFACE
      ?auto_2412683 - SURFACE
      ?auto_2412685 - SURFACE
      ?auto_2412686 - SURFACE
      ?auto_2412687 - SURFACE
      ?auto_2412688 - SURFACE
    )
    :vars
    (
      ?auto_2412689 - HOIST
      ?auto_2412690 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2412689 ?auto_2412690 ) ( SURFACE-AT ?auto_2412687 ?auto_2412690 ) ( CLEAR ?auto_2412687 ) ( LIFTING ?auto_2412689 ?auto_2412688 ) ( IS-CRATE ?auto_2412688 ) ( not ( = ?auto_2412687 ?auto_2412688 ) ) ( ON ?auto_2412680 ?auto_2412679 ) ( ON ?auto_2412681 ?auto_2412680 ) ( ON ?auto_2412678 ?auto_2412681 ) ( ON ?auto_2412682 ?auto_2412678 ) ( ON ?auto_2412684 ?auto_2412682 ) ( ON ?auto_2412683 ?auto_2412684 ) ( ON ?auto_2412685 ?auto_2412683 ) ( ON ?auto_2412686 ?auto_2412685 ) ( ON ?auto_2412687 ?auto_2412686 ) ( not ( = ?auto_2412679 ?auto_2412680 ) ) ( not ( = ?auto_2412679 ?auto_2412681 ) ) ( not ( = ?auto_2412679 ?auto_2412678 ) ) ( not ( = ?auto_2412679 ?auto_2412682 ) ) ( not ( = ?auto_2412679 ?auto_2412684 ) ) ( not ( = ?auto_2412679 ?auto_2412683 ) ) ( not ( = ?auto_2412679 ?auto_2412685 ) ) ( not ( = ?auto_2412679 ?auto_2412686 ) ) ( not ( = ?auto_2412679 ?auto_2412687 ) ) ( not ( = ?auto_2412679 ?auto_2412688 ) ) ( not ( = ?auto_2412680 ?auto_2412681 ) ) ( not ( = ?auto_2412680 ?auto_2412678 ) ) ( not ( = ?auto_2412680 ?auto_2412682 ) ) ( not ( = ?auto_2412680 ?auto_2412684 ) ) ( not ( = ?auto_2412680 ?auto_2412683 ) ) ( not ( = ?auto_2412680 ?auto_2412685 ) ) ( not ( = ?auto_2412680 ?auto_2412686 ) ) ( not ( = ?auto_2412680 ?auto_2412687 ) ) ( not ( = ?auto_2412680 ?auto_2412688 ) ) ( not ( = ?auto_2412681 ?auto_2412678 ) ) ( not ( = ?auto_2412681 ?auto_2412682 ) ) ( not ( = ?auto_2412681 ?auto_2412684 ) ) ( not ( = ?auto_2412681 ?auto_2412683 ) ) ( not ( = ?auto_2412681 ?auto_2412685 ) ) ( not ( = ?auto_2412681 ?auto_2412686 ) ) ( not ( = ?auto_2412681 ?auto_2412687 ) ) ( not ( = ?auto_2412681 ?auto_2412688 ) ) ( not ( = ?auto_2412678 ?auto_2412682 ) ) ( not ( = ?auto_2412678 ?auto_2412684 ) ) ( not ( = ?auto_2412678 ?auto_2412683 ) ) ( not ( = ?auto_2412678 ?auto_2412685 ) ) ( not ( = ?auto_2412678 ?auto_2412686 ) ) ( not ( = ?auto_2412678 ?auto_2412687 ) ) ( not ( = ?auto_2412678 ?auto_2412688 ) ) ( not ( = ?auto_2412682 ?auto_2412684 ) ) ( not ( = ?auto_2412682 ?auto_2412683 ) ) ( not ( = ?auto_2412682 ?auto_2412685 ) ) ( not ( = ?auto_2412682 ?auto_2412686 ) ) ( not ( = ?auto_2412682 ?auto_2412687 ) ) ( not ( = ?auto_2412682 ?auto_2412688 ) ) ( not ( = ?auto_2412684 ?auto_2412683 ) ) ( not ( = ?auto_2412684 ?auto_2412685 ) ) ( not ( = ?auto_2412684 ?auto_2412686 ) ) ( not ( = ?auto_2412684 ?auto_2412687 ) ) ( not ( = ?auto_2412684 ?auto_2412688 ) ) ( not ( = ?auto_2412683 ?auto_2412685 ) ) ( not ( = ?auto_2412683 ?auto_2412686 ) ) ( not ( = ?auto_2412683 ?auto_2412687 ) ) ( not ( = ?auto_2412683 ?auto_2412688 ) ) ( not ( = ?auto_2412685 ?auto_2412686 ) ) ( not ( = ?auto_2412685 ?auto_2412687 ) ) ( not ( = ?auto_2412685 ?auto_2412688 ) ) ( not ( = ?auto_2412686 ?auto_2412687 ) ) ( not ( = ?auto_2412686 ?auto_2412688 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2412687 ?auto_2412688 )
      ( MAKE-10CRATE-VERIFY ?auto_2412679 ?auto_2412680 ?auto_2412681 ?auto_2412678 ?auto_2412682 ?auto_2412684 ?auto_2412683 ?auto_2412685 ?auto_2412686 ?auto_2412687 ?auto_2412688 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2412773 - SURFACE
      ?auto_2412774 - SURFACE
      ?auto_2412775 - SURFACE
      ?auto_2412772 - SURFACE
      ?auto_2412776 - SURFACE
      ?auto_2412778 - SURFACE
      ?auto_2412777 - SURFACE
      ?auto_2412779 - SURFACE
      ?auto_2412780 - SURFACE
      ?auto_2412781 - SURFACE
      ?auto_2412782 - SURFACE
    )
    :vars
    (
      ?auto_2412784 - HOIST
      ?auto_2412785 - PLACE
      ?auto_2412783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2412784 ?auto_2412785 ) ( SURFACE-AT ?auto_2412781 ?auto_2412785 ) ( CLEAR ?auto_2412781 ) ( IS-CRATE ?auto_2412782 ) ( not ( = ?auto_2412781 ?auto_2412782 ) ) ( TRUCK-AT ?auto_2412783 ?auto_2412785 ) ( AVAILABLE ?auto_2412784 ) ( IN ?auto_2412782 ?auto_2412783 ) ( ON ?auto_2412781 ?auto_2412780 ) ( not ( = ?auto_2412780 ?auto_2412781 ) ) ( not ( = ?auto_2412780 ?auto_2412782 ) ) ( ON ?auto_2412774 ?auto_2412773 ) ( ON ?auto_2412775 ?auto_2412774 ) ( ON ?auto_2412772 ?auto_2412775 ) ( ON ?auto_2412776 ?auto_2412772 ) ( ON ?auto_2412778 ?auto_2412776 ) ( ON ?auto_2412777 ?auto_2412778 ) ( ON ?auto_2412779 ?auto_2412777 ) ( ON ?auto_2412780 ?auto_2412779 ) ( not ( = ?auto_2412773 ?auto_2412774 ) ) ( not ( = ?auto_2412773 ?auto_2412775 ) ) ( not ( = ?auto_2412773 ?auto_2412772 ) ) ( not ( = ?auto_2412773 ?auto_2412776 ) ) ( not ( = ?auto_2412773 ?auto_2412778 ) ) ( not ( = ?auto_2412773 ?auto_2412777 ) ) ( not ( = ?auto_2412773 ?auto_2412779 ) ) ( not ( = ?auto_2412773 ?auto_2412780 ) ) ( not ( = ?auto_2412773 ?auto_2412781 ) ) ( not ( = ?auto_2412773 ?auto_2412782 ) ) ( not ( = ?auto_2412774 ?auto_2412775 ) ) ( not ( = ?auto_2412774 ?auto_2412772 ) ) ( not ( = ?auto_2412774 ?auto_2412776 ) ) ( not ( = ?auto_2412774 ?auto_2412778 ) ) ( not ( = ?auto_2412774 ?auto_2412777 ) ) ( not ( = ?auto_2412774 ?auto_2412779 ) ) ( not ( = ?auto_2412774 ?auto_2412780 ) ) ( not ( = ?auto_2412774 ?auto_2412781 ) ) ( not ( = ?auto_2412774 ?auto_2412782 ) ) ( not ( = ?auto_2412775 ?auto_2412772 ) ) ( not ( = ?auto_2412775 ?auto_2412776 ) ) ( not ( = ?auto_2412775 ?auto_2412778 ) ) ( not ( = ?auto_2412775 ?auto_2412777 ) ) ( not ( = ?auto_2412775 ?auto_2412779 ) ) ( not ( = ?auto_2412775 ?auto_2412780 ) ) ( not ( = ?auto_2412775 ?auto_2412781 ) ) ( not ( = ?auto_2412775 ?auto_2412782 ) ) ( not ( = ?auto_2412772 ?auto_2412776 ) ) ( not ( = ?auto_2412772 ?auto_2412778 ) ) ( not ( = ?auto_2412772 ?auto_2412777 ) ) ( not ( = ?auto_2412772 ?auto_2412779 ) ) ( not ( = ?auto_2412772 ?auto_2412780 ) ) ( not ( = ?auto_2412772 ?auto_2412781 ) ) ( not ( = ?auto_2412772 ?auto_2412782 ) ) ( not ( = ?auto_2412776 ?auto_2412778 ) ) ( not ( = ?auto_2412776 ?auto_2412777 ) ) ( not ( = ?auto_2412776 ?auto_2412779 ) ) ( not ( = ?auto_2412776 ?auto_2412780 ) ) ( not ( = ?auto_2412776 ?auto_2412781 ) ) ( not ( = ?auto_2412776 ?auto_2412782 ) ) ( not ( = ?auto_2412778 ?auto_2412777 ) ) ( not ( = ?auto_2412778 ?auto_2412779 ) ) ( not ( = ?auto_2412778 ?auto_2412780 ) ) ( not ( = ?auto_2412778 ?auto_2412781 ) ) ( not ( = ?auto_2412778 ?auto_2412782 ) ) ( not ( = ?auto_2412777 ?auto_2412779 ) ) ( not ( = ?auto_2412777 ?auto_2412780 ) ) ( not ( = ?auto_2412777 ?auto_2412781 ) ) ( not ( = ?auto_2412777 ?auto_2412782 ) ) ( not ( = ?auto_2412779 ?auto_2412780 ) ) ( not ( = ?auto_2412779 ?auto_2412781 ) ) ( not ( = ?auto_2412779 ?auto_2412782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2412780 ?auto_2412781 ?auto_2412782 )
      ( MAKE-10CRATE-VERIFY ?auto_2412773 ?auto_2412774 ?auto_2412775 ?auto_2412772 ?auto_2412776 ?auto_2412778 ?auto_2412777 ?auto_2412779 ?auto_2412780 ?auto_2412781 ?auto_2412782 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2412878 - SURFACE
      ?auto_2412879 - SURFACE
      ?auto_2412880 - SURFACE
      ?auto_2412877 - SURFACE
      ?auto_2412881 - SURFACE
      ?auto_2412883 - SURFACE
      ?auto_2412882 - SURFACE
      ?auto_2412884 - SURFACE
      ?auto_2412885 - SURFACE
      ?auto_2412886 - SURFACE
      ?auto_2412887 - SURFACE
    )
    :vars
    (
      ?auto_2412890 - HOIST
      ?auto_2412888 - PLACE
      ?auto_2412889 - TRUCK
      ?auto_2412891 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2412890 ?auto_2412888 ) ( SURFACE-AT ?auto_2412886 ?auto_2412888 ) ( CLEAR ?auto_2412886 ) ( IS-CRATE ?auto_2412887 ) ( not ( = ?auto_2412886 ?auto_2412887 ) ) ( AVAILABLE ?auto_2412890 ) ( IN ?auto_2412887 ?auto_2412889 ) ( ON ?auto_2412886 ?auto_2412885 ) ( not ( = ?auto_2412885 ?auto_2412886 ) ) ( not ( = ?auto_2412885 ?auto_2412887 ) ) ( TRUCK-AT ?auto_2412889 ?auto_2412891 ) ( not ( = ?auto_2412891 ?auto_2412888 ) ) ( ON ?auto_2412879 ?auto_2412878 ) ( ON ?auto_2412880 ?auto_2412879 ) ( ON ?auto_2412877 ?auto_2412880 ) ( ON ?auto_2412881 ?auto_2412877 ) ( ON ?auto_2412883 ?auto_2412881 ) ( ON ?auto_2412882 ?auto_2412883 ) ( ON ?auto_2412884 ?auto_2412882 ) ( ON ?auto_2412885 ?auto_2412884 ) ( not ( = ?auto_2412878 ?auto_2412879 ) ) ( not ( = ?auto_2412878 ?auto_2412880 ) ) ( not ( = ?auto_2412878 ?auto_2412877 ) ) ( not ( = ?auto_2412878 ?auto_2412881 ) ) ( not ( = ?auto_2412878 ?auto_2412883 ) ) ( not ( = ?auto_2412878 ?auto_2412882 ) ) ( not ( = ?auto_2412878 ?auto_2412884 ) ) ( not ( = ?auto_2412878 ?auto_2412885 ) ) ( not ( = ?auto_2412878 ?auto_2412886 ) ) ( not ( = ?auto_2412878 ?auto_2412887 ) ) ( not ( = ?auto_2412879 ?auto_2412880 ) ) ( not ( = ?auto_2412879 ?auto_2412877 ) ) ( not ( = ?auto_2412879 ?auto_2412881 ) ) ( not ( = ?auto_2412879 ?auto_2412883 ) ) ( not ( = ?auto_2412879 ?auto_2412882 ) ) ( not ( = ?auto_2412879 ?auto_2412884 ) ) ( not ( = ?auto_2412879 ?auto_2412885 ) ) ( not ( = ?auto_2412879 ?auto_2412886 ) ) ( not ( = ?auto_2412879 ?auto_2412887 ) ) ( not ( = ?auto_2412880 ?auto_2412877 ) ) ( not ( = ?auto_2412880 ?auto_2412881 ) ) ( not ( = ?auto_2412880 ?auto_2412883 ) ) ( not ( = ?auto_2412880 ?auto_2412882 ) ) ( not ( = ?auto_2412880 ?auto_2412884 ) ) ( not ( = ?auto_2412880 ?auto_2412885 ) ) ( not ( = ?auto_2412880 ?auto_2412886 ) ) ( not ( = ?auto_2412880 ?auto_2412887 ) ) ( not ( = ?auto_2412877 ?auto_2412881 ) ) ( not ( = ?auto_2412877 ?auto_2412883 ) ) ( not ( = ?auto_2412877 ?auto_2412882 ) ) ( not ( = ?auto_2412877 ?auto_2412884 ) ) ( not ( = ?auto_2412877 ?auto_2412885 ) ) ( not ( = ?auto_2412877 ?auto_2412886 ) ) ( not ( = ?auto_2412877 ?auto_2412887 ) ) ( not ( = ?auto_2412881 ?auto_2412883 ) ) ( not ( = ?auto_2412881 ?auto_2412882 ) ) ( not ( = ?auto_2412881 ?auto_2412884 ) ) ( not ( = ?auto_2412881 ?auto_2412885 ) ) ( not ( = ?auto_2412881 ?auto_2412886 ) ) ( not ( = ?auto_2412881 ?auto_2412887 ) ) ( not ( = ?auto_2412883 ?auto_2412882 ) ) ( not ( = ?auto_2412883 ?auto_2412884 ) ) ( not ( = ?auto_2412883 ?auto_2412885 ) ) ( not ( = ?auto_2412883 ?auto_2412886 ) ) ( not ( = ?auto_2412883 ?auto_2412887 ) ) ( not ( = ?auto_2412882 ?auto_2412884 ) ) ( not ( = ?auto_2412882 ?auto_2412885 ) ) ( not ( = ?auto_2412882 ?auto_2412886 ) ) ( not ( = ?auto_2412882 ?auto_2412887 ) ) ( not ( = ?auto_2412884 ?auto_2412885 ) ) ( not ( = ?auto_2412884 ?auto_2412886 ) ) ( not ( = ?auto_2412884 ?auto_2412887 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2412885 ?auto_2412886 ?auto_2412887 )
      ( MAKE-10CRATE-VERIFY ?auto_2412878 ?auto_2412879 ?auto_2412880 ?auto_2412877 ?auto_2412881 ?auto_2412883 ?auto_2412882 ?auto_2412884 ?auto_2412885 ?auto_2412886 ?auto_2412887 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2412993 - SURFACE
      ?auto_2412994 - SURFACE
      ?auto_2412995 - SURFACE
      ?auto_2412992 - SURFACE
      ?auto_2412996 - SURFACE
      ?auto_2412998 - SURFACE
      ?auto_2412997 - SURFACE
      ?auto_2412999 - SURFACE
      ?auto_2413000 - SURFACE
      ?auto_2413001 - SURFACE
      ?auto_2413002 - SURFACE
    )
    :vars
    (
      ?auto_2413006 - HOIST
      ?auto_2413007 - PLACE
      ?auto_2413003 - TRUCK
      ?auto_2413005 - PLACE
      ?auto_2413004 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2413006 ?auto_2413007 ) ( SURFACE-AT ?auto_2413001 ?auto_2413007 ) ( CLEAR ?auto_2413001 ) ( IS-CRATE ?auto_2413002 ) ( not ( = ?auto_2413001 ?auto_2413002 ) ) ( AVAILABLE ?auto_2413006 ) ( ON ?auto_2413001 ?auto_2413000 ) ( not ( = ?auto_2413000 ?auto_2413001 ) ) ( not ( = ?auto_2413000 ?auto_2413002 ) ) ( TRUCK-AT ?auto_2413003 ?auto_2413005 ) ( not ( = ?auto_2413005 ?auto_2413007 ) ) ( HOIST-AT ?auto_2413004 ?auto_2413005 ) ( LIFTING ?auto_2413004 ?auto_2413002 ) ( not ( = ?auto_2413006 ?auto_2413004 ) ) ( ON ?auto_2412994 ?auto_2412993 ) ( ON ?auto_2412995 ?auto_2412994 ) ( ON ?auto_2412992 ?auto_2412995 ) ( ON ?auto_2412996 ?auto_2412992 ) ( ON ?auto_2412998 ?auto_2412996 ) ( ON ?auto_2412997 ?auto_2412998 ) ( ON ?auto_2412999 ?auto_2412997 ) ( ON ?auto_2413000 ?auto_2412999 ) ( not ( = ?auto_2412993 ?auto_2412994 ) ) ( not ( = ?auto_2412993 ?auto_2412995 ) ) ( not ( = ?auto_2412993 ?auto_2412992 ) ) ( not ( = ?auto_2412993 ?auto_2412996 ) ) ( not ( = ?auto_2412993 ?auto_2412998 ) ) ( not ( = ?auto_2412993 ?auto_2412997 ) ) ( not ( = ?auto_2412993 ?auto_2412999 ) ) ( not ( = ?auto_2412993 ?auto_2413000 ) ) ( not ( = ?auto_2412993 ?auto_2413001 ) ) ( not ( = ?auto_2412993 ?auto_2413002 ) ) ( not ( = ?auto_2412994 ?auto_2412995 ) ) ( not ( = ?auto_2412994 ?auto_2412992 ) ) ( not ( = ?auto_2412994 ?auto_2412996 ) ) ( not ( = ?auto_2412994 ?auto_2412998 ) ) ( not ( = ?auto_2412994 ?auto_2412997 ) ) ( not ( = ?auto_2412994 ?auto_2412999 ) ) ( not ( = ?auto_2412994 ?auto_2413000 ) ) ( not ( = ?auto_2412994 ?auto_2413001 ) ) ( not ( = ?auto_2412994 ?auto_2413002 ) ) ( not ( = ?auto_2412995 ?auto_2412992 ) ) ( not ( = ?auto_2412995 ?auto_2412996 ) ) ( not ( = ?auto_2412995 ?auto_2412998 ) ) ( not ( = ?auto_2412995 ?auto_2412997 ) ) ( not ( = ?auto_2412995 ?auto_2412999 ) ) ( not ( = ?auto_2412995 ?auto_2413000 ) ) ( not ( = ?auto_2412995 ?auto_2413001 ) ) ( not ( = ?auto_2412995 ?auto_2413002 ) ) ( not ( = ?auto_2412992 ?auto_2412996 ) ) ( not ( = ?auto_2412992 ?auto_2412998 ) ) ( not ( = ?auto_2412992 ?auto_2412997 ) ) ( not ( = ?auto_2412992 ?auto_2412999 ) ) ( not ( = ?auto_2412992 ?auto_2413000 ) ) ( not ( = ?auto_2412992 ?auto_2413001 ) ) ( not ( = ?auto_2412992 ?auto_2413002 ) ) ( not ( = ?auto_2412996 ?auto_2412998 ) ) ( not ( = ?auto_2412996 ?auto_2412997 ) ) ( not ( = ?auto_2412996 ?auto_2412999 ) ) ( not ( = ?auto_2412996 ?auto_2413000 ) ) ( not ( = ?auto_2412996 ?auto_2413001 ) ) ( not ( = ?auto_2412996 ?auto_2413002 ) ) ( not ( = ?auto_2412998 ?auto_2412997 ) ) ( not ( = ?auto_2412998 ?auto_2412999 ) ) ( not ( = ?auto_2412998 ?auto_2413000 ) ) ( not ( = ?auto_2412998 ?auto_2413001 ) ) ( not ( = ?auto_2412998 ?auto_2413002 ) ) ( not ( = ?auto_2412997 ?auto_2412999 ) ) ( not ( = ?auto_2412997 ?auto_2413000 ) ) ( not ( = ?auto_2412997 ?auto_2413001 ) ) ( not ( = ?auto_2412997 ?auto_2413002 ) ) ( not ( = ?auto_2412999 ?auto_2413000 ) ) ( not ( = ?auto_2412999 ?auto_2413001 ) ) ( not ( = ?auto_2412999 ?auto_2413002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2413000 ?auto_2413001 ?auto_2413002 )
      ( MAKE-10CRATE-VERIFY ?auto_2412993 ?auto_2412994 ?auto_2412995 ?auto_2412992 ?auto_2412996 ?auto_2412998 ?auto_2412997 ?auto_2412999 ?auto_2413000 ?auto_2413001 ?auto_2413002 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2413118 - SURFACE
      ?auto_2413119 - SURFACE
      ?auto_2413120 - SURFACE
      ?auto_2413117 - SURFACE
      ?auto_2413121 - SURFACE
      ?auto_2413123 - SURFACE
      ?auto_2413122 - SURFACE
      ?auto_2413124 - SURFACE
      ?auto_2413125 - SURFACE
      ?auto_2413126 - SURFACE
      ?auto_2413127 - SURFACE
    )
    :vars
    (
      ?auto_2413133 - HOIST
      ?auto_2413132 - PLACE
      ?auto_2413128 - TRUCK
      ?auto_2413130 - PLACE
      ?auto_2413131 - HOIST
      ?auto_2413129 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2413133 ?auto_2413132 ) ( SURFACE-AT ?auto_2413126 ?auto_2413132 ) ( CLEAR ?auto_2413126 ) ( IS-CRATE ?auto_2413127 ) ( not ( = ?auto_2413126 ?auto_2413127 ) ) ( AVAILABLE ?auto_2413133 ) ( ON ?auto_2413126 ?auto_2413125 ) ( not ( = ?auto_2413125 ?auto_2413126 ) ) ( not ( = ?auto_2413125 ?auto_2413127 ) ) ( TRUCK-AT ?auto_2413128 ?auto_2413130 ) ( not ( = ?auto_2413130 ?auto_2413132 ) ) ( HOIST-AT ?auto_2413131 ?auto_2413130 ) ( not ( = ?auto_2413133 ?auto_2413131 ) ) ( AVAILABLE ?auto_2413131 ) ( SURFACE-AT ?auto_2413127 ?auto_2413130 ) ( ON ?auto_2413127 ?auto_2413129 ) ( CLEAR ?auto_2413127 ) ( not ( = ?auto_2413126 ?auto_2413129 ) ) ( not ( = ?auto_2413127 ?auto_2413129 ) ) ( not ( = ?auto_2413125 ?auto_2413129 ) ) ( ON ?auto_2413119 ?auto_2413118 ) ( ON ?auto_2413120 ?auto_2413119 ) ( ON ?auto_2413117 ?auto_2413120 ) ( ON ?auto_2413121 ?auto_2413117 ) ( ON ?auto_2413123 ?auto_2413121 ) ( ON ?auto_2413122 ?auto_2413123 ) ( ON ?auto_2413124 ?auto_2413122 ) ( ON ?auto_2413125 ?auto_2413124 ) ( not ( = ?auto_2413118 ?auto_2413119 ) ) ( not ( = ?auto_2413118 ?auto_2413120 ) ) ( not ( = ?auto_2413118 ?auto_2413117 ) ) ( not ( = ?auto_2413118 ?auto_2413121 ) ) ( not ( = ?auto_2413118 ?auto_2413123 ) ) ( not ( = ?auto_2413118 ?auto_2413122 ) ) ( not ( = ?auto_2413118 ?auto_2413124 ) ) ( not ( = ?auto_2413118 ?auto_2413125 ) ) ( not ( = ?auto_2413118 ?auto_2413126 ) ) ( not ( = ?auto_2413118 ?auto_2413127 ) ) ( not ( = ?auto_2413118 ?auto_2413129 ) ) ( not ( = ?auto_2413119 ?auto_2413120 ) ) ( not ( = ?auto_2413119 ?auto_2413117 ) ) ( not ( = ?auto_2413119 ?auto_2413121 ) ) ( not ( = ?auto_2413119 ?auto_2413123 ) ) ( not ( = ?auto_2413119 ?auto_2413122 ) ) ( not ( = ?auto_2413119 ?auto_2413124 ) ) ( not ( = ?auto_2413119 ?auto_2413125 ) ) ( not ( = ?auto_2413119 ?auto_2413126 ) ) ( not ( = ?auto_2413119 ?auto_2413127 ) ) ( not ( = ?auto_2413119 ?auto_2413129 ) ) ( not ( = ?auto_2413120 ?auto_2413117 ) ) ( not ( = ?auto_2413120 ?auto_2413121 ) ) ( not ( = ?auto_2413120 ?auto_2413123 ) ) ( not ( = ?auto_2413120 ?auto_2413122 ) ) ( not ( = ?auto_2413120 ?auto_2413124 ) ) ( not ( = ?auto_2413120 ?auto_2413125 ) ) ( not ( = ?auto_2413120 ?auto_2413126 ) ) ( not ( = ?auto_2413120 ?auto_2413127 ) ) ( not ( = ?auto_2413120 ?auto_2413129 ) ) ( not ( = ?auto_2413117 ?auto_2413121 ) ) ( not ( = ?auto_2413117 ?auto_2413123 ) ) ( not ( = ?auto_2413117 ?auto_2413122 ) ) ( not ( = ?auto_2413117 ?auto_2413124 ) ) ( not ( = ?auto_2413117 ?auto_2413125 ) ) ( not ( = ?auto_2413117 ?auto_2413126 ) ) ( not ( = ?auto_2413117 ?auto_2413127 ) ) ( not ( = ?auto_2413117 ?auto_2413129 ) ) ( not ( = ?auto_2413121 ?auto_2413123 ) ) ( not ( = ?auto_2413121 ?auto_2413122 ) ) ( not ( = ?auto_2413121 ?auto_2413124 ) ) ( not ( = ?auto_2413121 ?auto_2413125 ) ) ( not ( = ?auto_2413121 ?auto_2413126 ) ) ( not ( = ?auto_2413121 ?auto_2413127 ) ) ( not ( = ?auto_2413121 ?auto_2413129 ) ) ( not ( = ?auto_2413123 ?auto_2413122 ) ) ( not ( = ?auto_2413123 ?auto_2413124 ) ) ( not ( = ?auto_2413123 ?auto_2413125 ) ) ( not ( = ?auto_2413123 ?auto_2413126 ) ) ( not ( = ?auto_2413123 ?auto_2413127 ) ) ( not ( = ?auto_2413123 ?auto_2413129 ) ) ( not ( = ?auto_2413122 ?auto_2413124 ) ) ( not ( = ?auto_2413122 ?auto_2413125 ) ) ( not ( = ?auto_2413122 ?auto_2413126 ) ) ( not ( = ?auto_2413122 ?auto_2413127 ) ) ( not ( = ?auto_2413122 ?auto_2413129 ) ) ( not ( = ?auto_2413124 ?auto_2413125 ) ) ( not ( = ?auto_2413124 ?auto_2413126 ) ) ( not ( = ?auto_2413124 ?auto_2413127 ) ) ( not ( = ?auto_2413124 ?auto_2413129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2413125 ?auto_2413126 ?auto_2413127 )
      ( MAKE-10CRATE-VERIFY ?auto_2413118 ?auto_2413119 ?auto_2413120 ?auto_2413117 ?auto_2413121 ?auto_2413123 ?auto_2413122 ?auto_2413124 ?auto_2413125 ?auto_2413126 ?auto_2413127 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2413244 - SURFACE
      ?auto_2413245 - SURFACE
      ?auto_2413246 - SURFACE
      ?auto_2413243 - SURFACE
      ?auto_2413247 - SURFACE
      ?auto_2413249 - SURFACE
      ?auto_2413248 - SURFACE
      ?auto_2413250 - SURFACE
      ?auto_2413251 - SURFACE
      ?auto_2413252 - SURFACE
      ?auto_2413253 - SURFACE
    )
    :vars
    (
      ?auto_2413254 - HOIST
      ?auto_2413256 - PLACE
      ?auto_2413259 - PLACE
      ?auto_2413255 - HOIST
      ?auto_2413257 - SURFACE
      ?auto_2413258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2413254 ?auto_2413256 ) ( SURFACE-AT ?auto_2413252 ?auto_2413256 ) ( CLEAR ?auto_2413252 ) ( IS-CRATE ?auto_2413253 ) ( not ( = ?auto_2413252 ?auto_2413253 ) ) ( AVAILABLE ?auto_2413254 ) ( ON ?auto_2413252 ?auto_2413251 ) ( not ( = ?auto_2413251 ?auto_2413252 ) ) ( not ( = ?auto_2413251 ?auto_2413253 ) ) ( not ( = ?auto_2413259 ?auto_2413256 ) ) ( HOIST-AT ?auto_2413255 ?auto_2413259 ) ( not ( = ?auto_2413254 ?auto_2413255 ) ) ( AVAILABLE ?auto_2413255 ) ( SURFACE-AT ?auto_2413253 ?auto_2413259 ) ( ON ?auto_2413253 ?auto_2413257 ) ( CLEAR ?auto_2413253 ) ( not ( = ?auto_2413252 ?auto_2413257 ) ) ( not ( = ?auto_2413253 ?auto_2413257 ) ) ( not ( = ?auto_2413251 ?auto_2413257 ) ) ( TRUCK-AT ?auto_2413258 ?auto_2413256 ) ( ON ?auto_2413245 ?auto_2413244 ) ( ON ?auto_2413246 ?auto_2413245 ) ( ON ?auto_2413243 ?auto_2413246 ) ( ON ?auto_2413247 ?auto_2413243 ) ( ON ?auto_2413249 ?auto_2413247 ) ( ON ?auto_2413248 ?auto_2413249 ) ( ON ?auto_2413250 ?auto_2413248 ) ( ON ?auto_2413251 ?auto_2413250 ) ( not ( = ?auto_2413244 ?auto_2413245 ) ) ( not ( = ?auto_2413244 ?auto_2413246 ) ) ( not ( = ?auto_2413244 ?auto_2413243 ) ) ( not ( = ?auto_2413244 ?auto_2413247 ) ) ( not ( = ?auto_2413244 ?auto_2413249 ) ) ( not ( = ?auto_2413244 ?auto_2413248 ) ) ( not ( = ?auto_2413244 ?auto_2413250 ) ) ( not ( = ?auto_2413244 ?auto_2413251 ) ) ( not ( = ?auto_2413244 ?auto_2413252 ) ) ( not ( = ?auto_2413244 ?auto_2413253 ) ) ( not ( = ?auto_2413244 ?auto_2413257 ) ) ( not ( = ?auto_2413245 ?auto_2413246 ) ) ( not ( = ?auto_2413245 ?auto_2413243 ) ) ( not ( = ?auto_2413245 ?auto_2413247 ) ) ( not ( = ?auto_2413245 ?auto_2413249 ) ) ( not ( = ?auto_2413245 ?auto_2413248 ) ) ( not ( = ?auto_2413245 ?auto_2413250 ) ) ( not ( = ?auto_2413245 ?auto_2413251 ) ) ( not ( = ?auto_2413245 ?auto_2413252 ) ) ( not ( = ?auto_2413245 ?auto_2413253 ) ) ( not ( = ?auto_2413245 ?auto_2413257 ) ) ( not ( = ?auto_2413246 ?auto_2413243 ) ) ( not ( = ?auto_2413246 ?auto_2413247 ) ) ( not ( = ?auto_2413246 ?auto_2413249 ) ) ( not ( = ?auto_2413246 ?auto_2413248 ) ) ( not ( = ?auto_2413246 ?auto_2413250 ) ) ( not ( = ?auto_2413246 ?auto_2413251 ) ) ( not ( = ?auto_2413246 ?auto_2413252 ) ) ( not ( = ?auto_2413246 ?auto_2413253 ) ) ( not ( = ?auto_2413246 ?auto_2413257 ) ) ( not ( = ?auto_2413243 ?auto_2413247 ) ) ( not ( = ?auto_2413243 ?auto_2413249 ) ) ( not ( = ?auto_2413243 ?auto_2413248 ) ) ( not ( = ?auto_2413243 ?auto_2413250 ) ) ( not ( = ?auto_2413243 ?auto_2413251 ) ) ( not ( = ?auto_2413243 ?auto_2413252 ) ) ( not ( = ?auto_2413243 ?auto_2413253 ) ) ( not ( = ?auto_2413243 ?auto_2413257 ) ) ( not ( = ?auto_2413247 ?auto_2413249 ) ) ( not ( = ?auto_2413247 ?auto_2413248 ) ) ( not ( = ?auto_2413247 ?auto_2413250 ) ) ( not ( = ?auto_2413247 ?auto_2413251 ) ) ( not ( = ?auto_2413247 ?auto_2413252 ) ) ( not ( = ?auto_2413247 ?auto_2413253 ) ) ( not ( = ?auto_2413247 ?auto_2413257 ) ) ( not ( = ?auto_2413249 ?auto_2413248 ) ) ( not ( = ?auto_2413249 ?auto_2413250 ) ) ( not ( = ?auto_2413249 ?auto_2413251 ) ) ( not ( = ?auto_2413249 ?auto_2413252 ) ) ( not ( = ?auto_2413249 ?auto_2413253 ) ) ( not ( = ?auto_2413249 ?auto_2413257 ) ) ( not ( = ?auto_2413248 ?auto_2413250 ) ) ( not ( = ?auto_2413248 ?auto_2413251 ) ) ( not ( = ?auto_2413248 ?auto_2413252 ) ) ( not ( = ?auto_2413248 ?auto_2413253 ) ) ( not ( = ?auto_2413248 ?auto_2413257 ) ) ( not ( = ?auto_2413250 ?auto_2413251 ) ) ( not ( = ?auto_2413250 ?auto_2413252 ) ) ( not ( = ?auto_2413250 ?auto_2413253 ) ) ( not ( = ?auto_2413250 ?auto_2413257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2413251 ?auto_2413252 ?auto_2413253 )
      ( MAKE-10CRATE-VERIFY ?auto_2413244 ?auto_2413245 ?auto_2413246 ?auto_2413243 ?auto_2413247 ?auto_2413249 ?auto_2413248 ?auto_2413250 ?auto_2413251 ?auto_2413252 ?auto_2413253 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2413370 - SURFACE
      ?auto_2413371 - SURFACE
      ?auto_2413372 - SURFACE
      ?auto_2413369 - SURFACE
      ?auto_2413373 - SURFACE
      ?auto_2413375 - SURFACE
      ?auto_2413374 - SURFACE
      ?auto_2413376 - SURFACE
      ?auto_2413377 - SURFACE
      ?auto_2413378 - SURFACE
      ?auto_2413379 - SURFACE
    )
    :vars
    (
      ?auto_2413380 - HOIST
      ?auto_2413385 - PLACE
      ?auto_2413384 - PLACE
      ?auto_2413381 - HOIST
      ?auto_2413383 - SURFACE
      ?auto_2413382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2413380 ?auto_2413385 ) ( IS-CRATE ?auto_2413379 ) ( not ( = ?auto_2413378 ?auto_2413379 ) ) ( not ( = ?auto_2413377 ?auto_2413378 ) ) ( not ( = ?auto_2413377 ?auto_2413379 ) ) ( not ( = ?auto_2413384 ?auto_2413385 ) ) ( HOIST-AT ?auto_2413381 ?auto_2413384 ) ( not ( = ?auto_2413380 ?auto_2413381 ) ) ( AVAILABLE ?auto_2413381 ) ( SURFACE-AT ?auto_2413379 ?auto_2413384 ) ( ON ?auto_2413379 ?auto_2413383 ) ( CLEAR ?auto_2413379 ) ( not ( = ?auto_2413378 ?auto_2413383 ) ) ( not ( = ?auto_2413379 ?auto_2413383 ) ) ( not ( = ?auto_2413377 ?auto_2413383 ) ) ( TRUCK-AT ?auto_2413382 ?auto_2413385 ) ( SURFACE-AT ?auto_2413377 ?auto_2413385 ) ( CLEAR ?auto_2413377 ) ( LIFTING ?auto_2413380 ?auto_2413378 ) ( IS-CRATE ?auto_2413378 ) ( ON ?auto_2413371 ?auto_2413370 ) ( ON ?auto_2413372 ?auto_2413371 ) ( ON ?auto_2413369 ?auto_2413372 ) ( ON ?auto_2413373 ?auto_2413369 ) ( ON ?auto_2413375 ?auto_2413373 ) ( ON ?auto_2413374 ?auto_2413375 ) ( ON ?auto_2413376 ?auto_2413374 ) ( ON ?auto_2413377 ?auto_2413376 ) ( not ( = ?auto_2413370 ?auto_2413371 ) ) ( not ( = ?auto_2413370 ?auto_2413372 ) ) ( not ( = ?auto_2413370 ?auto_2413369 ) ) ( not ( = ?auto_2413370 ?auto_2413373 ) ) ( not ( = ?auto_2413370 ?auto_2413375 ) ) ( not ( = ?auto_2413370 ?auto_2413374 ) ) ( not ( = ?auto_2413370 ?auto_2413376 ) ) ( not ( = ?auto_2413370 ?auto_2413377 ) ) ( not ( = ?auto_2413370 ?auto_2413378 ) ) ( not ( = ?auto_2413370 ?auto_2413379 ) ) ( not ( = ?auto_2413370 ?auto_2413383 ) ) ( not ( = ?auto_2413371 ?auto_2413372 ) ) ( not ( = ?auto_2413371 ?auto_2413369 ) ) ( not ( = ?auto_2413371 ?auto_2413373 ) ) ( not ( = ?auto_2413371 ?auto_2413375 ) ) ( not ( = ?auto_2413371 ?auto_2413374 ) ) ( not ( = ?auto_2413371 ?auto_2413376 ) ) ( not ( = ?auto_2413371 ?auto_2413377 ) ) ( not ( = ?auto_2413371 ?auto_2413378 ) ) ( not ( = ?auto_2413371 ?auto_2413379 ) ) ( not ( = ?auto_2413371 ?auto_2413383 ) ) ( not ( = ?auto_2413372 ?auto_2413369 ) ) ( not ( = ?auto_2413372 ?auto_2413373 ) ) ( not ( = ?auto_2413372 ?auto_2413375 ) ) ( not ( = ?auto_2413372 ?auto_2413374 ) ) ( not ( = ?auto_2413372 ?auto_2413376 ) ) ( not ( = ?auto_2413372 ?auto_2413377 ) ) ( not ( = ?auto_2413372 ?auto_2413378 ) ) ( not ( = ?auto_2413372 ?auto_2413379 ) ) ( not ( = ?auto_2413372 ?auto_2413383 ) ) ( not ( = ?auto_2413369 ?auto_2413373 ) ) ( not ( = ?auto_2413369 ?auto_2413375 ) ) ( not ( = ?auto_2413369 ?auto_2413374 ) ) ( not ( = ?auto_2413369 ?auto_2413376 ) ) ( not ( = ?auto_2413369 ?auto_2413377 ) ) ( not ( = ?auto_2413369 ?auto_2413378 ) ) ( not ( = ?auto_2413369 ?auto_2413379 ) ) ( not ( = ?auto_2413369 ?auto_2413383 ) ) ( not ( = ?auto_2413373 ?auto_2413375 ) ) ( not ( = ?auto_2413373 ?auto_2413374 ) ) ( not ( = ?auto_2413373 ?auto_2413376 ) ) ( not ( = ?auto_2413373 ?auto_2413377 ) ) ( not ( = ?auto_2413373 ?auto_2413378 ) ) ( not ( = ?auto_2413373 ?auto_2413379 ) ) ( not ( = ?auto_2413373 ?auto_2413383 ) ) ( not ( = ?auto_2413375 ?auto_2413374 ) ) ( not ( = ?auto_2413375 ?auto_2413376 ) ) ( not ( = ?auto_2413375 ?auto_2413377 ) ) ( not ( = ?auto_2413375 ?auto_2413378 ) ) ( not ( = ?auto_2413375 ?auto_2413379 ) ) ( not ( = ?auto_2413375 ?auto_2413383 ) ) ( not ( = ?auto_2413374 ?auto_2413376 ) ) ( not ( = ?auto_2413374 ?auto_2413377 ) ) ( not ( = ?auto_2413374 ?auto_2413378 ) ) ( not ( = ?auto_2413374 ?auto_2413379 ) ) ( not ( = ?auto_2413374 ?auto_2413383 ) ) ( not ( = ?auto_2413376 ?auto_2413377 ) ) ( not ( = ?auto_2413376 ?auto_2413378 ) ) ( not ( = ?auto_2413376 ?auto_2413379 ) ) ( not ( = ?auto_2413376 ?auto_2413383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2413377 ?auto_2413378 ?auto_2413379 )
      ( MAKE-10CRATE-VERIFY ?auto_2413370 ?auto_2413371 ?auto_2413372 ?auto_2413369 ?auto_2413373 ?auto_2413375 ?auto_2413374 ?auto_2413376 ?auto_2413377 ?auto_2413378 ?auto_2413379 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2413496 - SURFACE
      ?auto_2413497 - SURFACE
      ?auto_2413498 - SURFACE
      ?auto_2413495 - SURFACE
      ?auto_2413499 - SURFACE
      ?auto_2413501 - SURFACE
      ?auto_2413500 - SURFACE
      ?auto_2413502 - SURFACE
      ?auto_2413503 - SURFACE
      ?auto_2413504 - SURFACE
      ?auto_2413505 - SURFACE
    )
    :vars
    (
      ?auto_2413508 - HOIST
      ?auto_2413511 - PLACE
      ?auto_2413510 - PLACE
      ?auto_2413509 - HOIST
      ?auto_2413506 - SURFACE
      ?auto_2413507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2413508 ?auto_2413511 ) ( IS-CRATE ?auto_2413505 ) ( not ( = ?auto_2413504 ?auto_2413505 ) ) ( not ( = ?auto_2413503 ?auto_2413504 ) ) ( not ( = ?auto_2413503 ?auto_2413505 ) ) ( not ( = ?auto_2413510 ?auto_2413511 ) ) ( HOIST-AT ?auto_2413509 ?auto_2413510 ) ( not ( = ?auto_2413508 ?auto_2413509 ) ) ( AVAILABLE ?auto_2413509 ) ( SURFACE-AT ?auto_2413505 ?auto_2413510 ) ( ON ?auto_2413505 ?auto_2413506 ) ( CLEAR ?auto_2413505 ) ( not ( = ?auto_2413504 ?auto_2413506 ) ) ( not ( = ?auto_2413505 ?auto_2413506 ) ) ( not ( = ?auto_2413503 ?auto_2413506 ) ) ( TRUCK-AT ?auto_2413507 ?auto_2413511 ) ( SURFACE-AT ?auto_2413503 ?auto_2413511 ) ( CLEAR ?auto_2413503 ) ( IS-CRATE ?auto_2413504 ) ( AVAILABLE ?auto_2413508 ) ( IN ?auto_2413504 ?auto_2413507 ) ( ON ?auto_2413497 ?auto_2413496 ) ( ON ?auto_2413498 ?auto_2413497 ) ( ON ?auto_2413495 ?auto_2413498 ) ( ON ?auto_2413499 ?auto_2413495 ) ( ON ?auto_2413501 ?auto_2413499 ) ( ON ?auto_2413500 ?auto_2413501 ) ( ON ?auto_2413502 ?auto_2413500 ) ( ON ?auto_2413503 ?auto_2413502 ) ( not ( = ?auto_2413496 ?auto_2413497 ) ) ( not ( = ?auto_2413496 ?auto_2413498 ) ) ( not ( = ?auto_2413496 ?auto_2413495 ) ) ( not ( = ?auto_2413496 ?auto_2413499 ) ) ( not ( = ?auto_2413496 ?auto_2413501 ) ) ( not ( = ?auto_2413496 ?auto_2413500 ) ) ( not ( = ?auto_2413496 ?auto_2413502 ) ) ( not ( = ?auto_2413496 ?auto_2413503 ) ) ( not ( = ?auto_2413496 ?auto_2413504 ) ) ( not ( = ?auto_2413496 ?auto_2413505 ) ) ( not ( = ?auto_2413496 ?auto_2413506 ) ) ( not ( = ?auto_2413497 ?auto_2413498 ) ) ( not ( = ?auto_2413497 ?auto_2413495 ) ) ( not ( = ?auto_2413497 ?auto_2413499 ) ) ( not ( = ?auto_2413497 ?auto_2413501 ) ) ( not ( = ?auto_2413497 ?auto_2413500 ) ) ( not ( = ?auto_2413497 ?auto_2413502 ) ) ( not ( = ?auto_2413497 ?auto_2413503 ) ) ( not ( = ?auto_2413497 ?auto_2413504 ) ) ( not ( = ?auto_2413497 ?auto_2413505 ) ) ( not ( = ?auto_2413497 ?auto_2413506 ) ) ( not ( = ?auto_2413498 ?auto_2413495 ) ) ( not ( = ?auto_2413498 ?auto_2413499 ) ) ( not ( = ?auto_2413498 ?auto_2413501 ) ) ( not ( = ?auto_2413498 ?auto_2413500 ) ) ( not ( = ?auto_2413498 ?auto_2413502 ) ) ( not ( = ?auto_2413498 ?auto_2413503 ) ) ( not ( = ?auto_2413498 ?auto_2413504 ) ) ( not ( = ?auto_2413498 ?auto_2413505 ) ) ( not ( = ?auto_2413498 ?auto_2413506 ) ) ( not ( = ?auto_2413495 ?auto_2413499 ) ) ( not ( = ?auto_2413495 ?auto_2413501 ) ) ( not ( = ?auto_2413495 ?auto_2413500 ) ) ( not ( = ?auto_2413495 ?auto_2413502 ) ) ( not ( = ?auto_2413495 ?auto_2413503 ) ) ( not ( = ?auto_2413495 ?auto_2413504 ) ) ( not ( = ?auto_2413495 ?auto_2413505 ) ) ( not ( = ?auto_2413495 ?auto_2413506 ) ) ( not ( = ?auto_2413499 ?auto_2413501 ) ) ( not ( = ?auto_2413499 ?auto_2413500 ) ) ( not ( = ?auto_2413499 ?auto_2413502 ) ) ( not ( = ?auto_2413499 ?auto_2413503 ) ) ( not ( = ?auto_2413499 ?auto_2413504 ) ) ( not ( = ?auto_2413499 ?auto_2413505 ) ) ( not ( = ?auto_2413499 ?auto_2413506 ) ) ( not ( = ?auto_2413501 ?auto_2413500 ) ) ( not ( = ?auto_2413501 ?auto_2413502 ) ) ( not ( = ?auto_2413501 ?auto_2413503 ) ) ( not ( = ?auto_2413501 ?auto_2413504 ) ) ( not ( = ?auto_2413501 ?auto_2413505 ) ) ( not ( = ?auto_2413501 ?auto_2413506 ) ) ( not ( = ?auto_2413500 ?auto_2413502 ) ) ( not ( = ?auto_2413500 ?auto_2413503 ) ) ( not ( = ?auto_2413500 ?auto_2413504 ) ) ( not ( = ?auto_2413500 ?auto_2413505 ) ) ( not ( = ?auto_2413500 ?auto_2413506 ) ) ( not ( = ?auto_2413502 ?auto_2413503 ) ) ( not ( = ?auto_2413502 ?auto_2413504 ) ) ( not ( = ?auto_2413502 ?auto_2413505 ) ) ( not ( = ?auto_2413502 ?auto_2413506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2413503 ?auto_2413504 ?auto_2413505 )
      ( MAKE-10CRATE-VERIFY ?auto_2413496 ?auto_2413497 ?auto_2413498 ?auto_2413495 ?auto_2413499 ?auto_2413501 ?auto_2413500 ?auto_2413502 ?auto_2413503 ?auto_2413504 ?auto_2413505 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2420780 - SURFACE
      ?auto_2420781 - SURFACE
      ?auto_2420782 - SURFACE
      ?auto_2420779 - SURFACE
      ?auto_2420783 - SURFACE
      ?auto_2420785 - SURFACE
      ?auto_2420784 - SURFACE
      ?auto_2420786 - SURFACE
      ?auto_2420787 - SURFACE
      ?auto_2420788 - SURFACE
      ?auto_2420789 - SURFACE
      ?auto_2420790 - SURFACE
    )
    :vars
    (
      ?auto_2420792 - HOIST
      ?auto_2420791 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2420792 ?auto_2420791 ) ( SURFACE-AT ?auto_2420789 ?auto_2420791 ) ( CLEAR ?auto_2420789 ) ( LIFTING ?auto_2420792 ?auto_2420790 ) ( IS-CRATE ?auto_2420790 ) ( not ( = ?auto_2420789 ?auto_2420790 ) ) ( ON ?auto_2420781 ?auto_2420780 ) ( ON ?auto_2420782 ?auto_2420781 ) ( ON ?auto_2420779 ?auto_2420782 ) ( ON ?auto_2420783 ?auto_2420779 ) ( ON ?auto_2420785 ?auto_2420783 ) ( ON ?auto_2420784 ?auto_2420785 ) ( ON ?auto_2420786 ?auto_2420784 ) ( ON ?auto_2420787 ?auto_2420786 ) ( ON ?auto_2420788 ?auto_2420787 ) ( ON ?auto_2420789 ?auto_2420788 ) ( not ( = ?auto_2420780 ?auto_2420781 ) ) ( not ( = ?auto_2420780 ?auto_2420782 ) ) ( not ( = ?auto_2420780 ?auto_2420779 ) ) ( not ( = ?auto_2420780 ?auto_2420783 ) ) ( not ( = ?auto_2420780 ?auto_2420785 ) ) ( not ( = ?auto_2420780 ?auto_2420784 ) ) ( not ( = ?auto_2420780 ?auto_2420786 ) ) ( not ( = ?auto_2420780 ?auto_2420787 ) ) ( not ( = ?auto_2420780 ?auto_2420788 ) ) ( not ( = ?auto_2420780 ?auto_2420789 ) ) ( not ( = ?auto_2420780 ?auto_2420790 ) ) ( not ( = ?auto_2420781 ?auto_2420782 ) ) ( not ( = ?auto_2420781 ?auto_2420779 ) ) ( not ( = ?auto_2420781 ?auto_2420783 ) ) ( not ( = ?auto_2420781 ?auto_2420785 ) ) ( not ( = ?auto_2420781 ?auto_2420784 ) ) ( not ( = ?auto_2420781 ?auto_2420786 ) ) ( not ( = ?auto_2420781 ?auto_2420787 ) ) ( not ( = ?auto_2420781 ?auto_2420788 ) ) ( not ( = ?auto_2420781 ?auto_2420789 ) ) ( not ( = ?auto_2420781 ?auto_2420790 ) ) ( not ( = ?auto_2420782 ?auto_2420779 ) ) ( not ( = ?auto_2420782 ?auto_2420783 ) ) ( not ( = ?auto_2420782 ?auto_2420785 ) ) ( not ( = ?auto_2420782 ?auto_2420784 ) ) ( not ( = ?auto_2420782 ?auto_2420786 ) ) ( not ( = ?auto_2420782 ?auto_2420787 ) ) ( not ( = ?auto_2420782 ?auto_2420788 ) ) ( not ( = ?auto_2420782 ?auto_2420789 ) ) ( not ( = ?auto_2420782 ?auto_2420790 ) ) ( not ( = ?auto_2420779 ?auto_2420783 ) ) ( not ( = ?auto_2420779 ?auto_2420785 ) ) ( not ( = ?auto_2420779 ?auto_2420784 ) ) ( not ( = ?auto_2420779 ?auto_2420786 ) ) ( not ( = ?auto_2420779 ?auto_2420787 ) ) ( not ( = ?auto_2420779 ?auto_2420788 ) ) ( not ( = ?auto_2420779 ?auto_2420789 ) ) ( not ( = ?auto_2420779 ?auto_2420790 ) ) ( not ( = ?auto_2420783 ?auto_2420785 ) ) ( not ( = ?auto_2420783 ?auto_2420784 ) ) ( not ( = ?auto_2420783 ?auto_2420786 ) ) ( not ( = ?auto_2420783 ?auto_2420787 ) ) ( not ( = ?auto_2420783 ?auto_2420788 ) ) ( not ( = ?auto_2420783 ?auto_2420789 ) ) ( not ( = ?auto_2420783 ?auto_2420790 ) ) ( not ( = ?auto_2420785 ?auto_2420784 ) ) ( not ( = ?auto_2420785 ?auto_2420786 ) ) ( not ( = ?auto_2420785 ?auto_2420787 ) ) ( not ( = ?auto_2420785 ?auto_2420788 ) ) ( not ( = ?auto_2420785 ?auto_2420789 ) ) ( not ( = ?auto_2420785 ?auto_2420790 ) ) ( not ( = ?auto_2420784 ?auto_2420786 ) ) ( not ( = ?auto_2420784 ?auto_2420787 ) ) ( not ( = ?auto_2420784 ?auto_2420788 ) ) ( not ( = ?auto_2420784 ?auto_2420789 ) ) ( not ( = ?auto_2420784 ?auto_2420790 ) ) ( not ( = ?auto_2420786 ?auto_2420787 ) ) ( not ( = ?auto_2420786 ?auto_2420788 ) ) ( not ( = ?auto_2420786 ?auto_2420789 ) ) ( not ( = ?auto_2420786 ?auto_2420790 ) ) ( not ( = ?auto_2420787 ?auto_2420788 ) ) ( not ( = ?auto_2420787 ?auto_2420789 ) ) ( not ( = ?auto_2420787 ?auto_2420790 ) ) ( not ( = ?auto_2420788 ?auto_2420789 ) ) ( not ( = ?auto_2420788 ?auto_2420790 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2420789 ?auto_2420790 )
      ( MAKE-11CRATE-VERIFY ?auto_2420780 ?auto_2420781 ?auto_2420782 ?auto_2420779 ?auto_2420783 ?auto_2420785 ?auto_2420784 ?auto_2420786 ?auto_2420787 ?auto_2420788 ?auto_2420789 ?auto_2420790 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2420889 - SURFACE
      ?auto_2420890 - SURFACE
      ?auto_2420891 - SURFACE
      ?auto_2420888 - SURFACE
      ?auto_2420892 - SURFACE
      ?auto_2420894 - SURFACE
      ?auto_2420893 - SURFACE
      ?auto_2420895 - SURFACE
      ?auto_2420896 - SURFACE
      ?auto_2420897 - SURFACE
      ?auto_2420898 - SURFACE
      ?auto_2420899 - SURFACE
    )
    :vars
    (
      ?auto_2420901 - HOIST
      ?auto_2420902 - PLACE
      ?auto_2420900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2420901 ?auto_2420902 ) ( SURFACE-AT ?auto_2420898 ?auto_2420902 ) ( CLEAR ?auto_2420898 ) ( IS-CRATE ?auto_2420899 ) ( not ( = ?auto_2420898 ?auto_2420899 ) ) ( TRUCK-AT ?auto_2420900 ?auto_2420902 ) ( AVAILABLE ?auto_2420901 ) ( IN ?auto_2420899 ?auto_2420900 ) ( ON ?auto_2420898 ?auto_2420897 ) ( not ( = ?auto_2420897 ?auto_2420898 ) ) ( not ( = ?auto_2420897 ?auto_2420899 ) ) ( ON ?auto_2420890 ?auto_2420889 ) ( ON ?auto_2420891 ?auto_2420890 ) ( ON ?auto_2420888 ?auto_2420891 ) ( ON ?auto_2420892 ?auto_2420888 ) ( ON ?auto_2420894 ?auto_2420892 ) ( ON ?auto_2420893 ?auto_2420894 ) ( ON ?auto_2420895 ?auto_2420893 ) ( ON ?auto_2420896 ?auto_2420895 ) ( ON ?auto_2420897 ?auto_2420896 ) ( not ( = ?auto_2420889 ?auto_2420890 ) ) ( not ( = ?auto_2420889 ?auto_2420891 ) ) ( not ( = ?auto_2420889 ?auto_2420888 ) ) ( not ( = ?auto_2420889 ?auto_2420892 ) ) ( not ( = ?auto_2420889 ?auto_2420894 ) ) ( not ( = ?auto_2420889 ?auto_2420893 ) ) ( not ( = ?auto_2420889 ?auto_2420895 ) ) ( not ( = ?auto_2420889 ?auto_2420896 ) ) ( not ( = ?auto_2420889 ?auto_2420897 ) ) ( not ( = ?auto_2420889 ?auto_2420898 ) ) ( not ( = ?auto_2420889 ?auto_2420899 ) ) ( not ( = ?auto_2420890 ?auto_2420891 ) ) ( not ( = ?auto_2420890 ?auto_2420888 ) ) ( not ( = ?auto_2420890 ?auto_2420892 ) ) ( not ( = ?auto_2420890 ?auto_2420894 ) ) ( not ( = ?auto_2420890 ?auto_2420893 ) ) ( not ( = ?auto_2420890 ?auto_2420895 ) ) ( not ( = ?auto_2420890 ?auto_2420896 ) ) ( not ( = ?auto_2420890 ?auto_2420897 ) ) ( not ( = ?auto_2420890 ?auto_2420898 ) ) ( not ( = ?auto_2420890 ?auto_2420899 ) ) ( not ( = ?auto_2420891 ?auto_2420888 ) ) ( not ( = ?auto_2420891 ?auto_2420892 ) ) ( not ( = ?auto_2420891 ?auto_2420894 ) ) ( not ( = ?auto_2420891 ?auto_2420893 ) ) ( not ( = ?auto_2420891 ?auto_2420895 ) ) ( not ( = ?auto_2420891 ?auto_2420896 ) ) ( not ( = ?auto_2420891 ?auto_2420897 ) ) ( not ( = ?auto_2420891 ?auto_2420898 ) ) ( not ( = ?auto_2420891 ?auto_2420899 ) ) ( not ( = ?auto_2420888 ?auto_2420892 ) ) ( not ( = ?auto_2420888 ?auto_2420894 ) ) ( not ( = ?auto_2420888 ?auto_2420893 ) ) ( not ( = ?auto_2420888 ?auto_2420895 ) ) ( not ( = ?auto_2420888 ?auto_2420896 ) ) ( not ( = ?auto_2420888 ?auto_2420897 ) ) ( not ( = ?auto_2420888 ?auto_2420898 ) ) ( not ( = ?auto_2420888 ?auto_2420899 ) ) ( not ( = ?auto_2420892 ?auto_2420894 ) ) ( not ( = ?auto_2420892 ?auto_2420893 ) ) ( not ( = ?auto_2420892 ?auto_2420895 ) ) ( not ( = ?auto_2420892 ?auto_2420896 ) ) ( not ( = ?auto_2420892 ?auto_2420897 ) ) ( not ( = ?auto_2420892 ?auto_2420898 ) ) ( not ( = ?auto_2420892 ?auto_2420899 ) ) ( not ( = ?auto_2420894 ?auto_2420893 ) ) ( not ( = ?auto_2420894 ?auto_2420895 ) ) ( not ( = ?auto_2420894 ?auto_2420896 ) ) ( not ( = ?auto_2420894 ?auto_2420897 ) ) ( not ( = ?auto_2420894 ?auto_2420898 ) ) ( not ( = ?auto_2420894 ?auto_2420899 ) ) ( not ( = ?auto_2420893 ?auto_2420895 ) ) ( not ( = ?auto_2420893 ?auto_2420896 ) ) ( not ( = ?auto_2420893 ?auto_2420897 ) ) ( not ( = ?auto_2420893 ?auto_2420898 ) ) ( not ( = ?auto_2420893 ?auto_2420899 ) ) ( not ( = ?auto_2420895 ?auto_2420896 ) ) ( not ( = ?auto_2420895 ?auto_2420897 ) ) ( not ( = ?auto_2420895 ?auto_2420898 ) ) ( not ( = ?auto_2420895 ?auto_2420899 ) ) ( not ( = ?auto_2420896 ?auto_2420897 ) ) ( not ( = ?auto_2420896 ?auto_2420898 ) ) ( not ( = ?auto_2420896 ?auto_2420899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2420897 ?auto_2420898 ?auto_2420899 )
      ( MAKE-11CRATE-VERIFY ?auto_2420889 ?auto_2420890 ?auto_2420891 ?auto_2420888 ?auto_2420892 ?auto_2420894 ?auto_2420893 ?auto_2420895 ?auto_2420896 ?auto_2420897 ?auto_2420898 ?auto_2420899 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2421010 - SURFACE
      ?auto_2421011 - SURFACE
      ?auto_2421012 - SURFACE
      ?auto_2421009 - SURFACE
      ?auto_2421013 - SURFACE
      ?auto_2421015 - SURFACE
      ?auto_2421014 - SURFACE
      ?auto_2421016 - SURFACE
      ?auto_2421017 - SURFACE
      ?auto_2421018 - SURFACE
      ?auto_2421019 - SURFACE
      ?auto_2421020 - SURFACE
    )
    :vars
    (
      ?auto_2421021 - HOIST
      ?auto_2421023 - PLACE
      ?auto_2421022 - TRUCK
      ?auto_2421024 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421021 ?auto_2421023 ) ( SURFACE-AT ?auto_2421019 ?auto_2421023 ) ( CLEAR ?auto_2421019 ) ( IS-CRATE ?auto_2421020 ) ( not ( = ?auto_2421019 ?auto_2421020 ) ) ( AVAILABLE ?auto_2421021 ) ( IN ?auto_2421020 ?auto_2421022 ) ( ON ?auto_2421019 ?auto_2421018 ) ( not ( = ?auto_2421018 ?auto_2421019 ) ) ( not ( = ?auto_2421018 ?auto_2421020 ) ) ( TRUCK-AT ?auto_2421022 ?auto_2421024 ) ( not ( = ?auto_2421024 ?auto_2421023 ) ) ( ON ?auto_2421011 ?auto_2421010 ) ( ON ?auto_2421012 ?auto_2421011 ) ( ON ?auto_2421009 ?auto_2421012 ) ( ON ?auto_2421013 ?auto_2421009 ) ( ON ?auto_2421015 ?auto_2421013 ) ( ON ?auto_2421014 ?auto_2421015 ) ( ON ?auto_2421016 ?auto_2421014 ) ( ON ?auto_2421017 ?auto_2421016 ) ( ON ?auto_2421018 ?auto_2421017 ) ( not ( = ?auto_2421010 ?auto_2421011 ) ) ( not ( = ?auto_2421010 ?auto_2421012 ) ) ( not ( = ?auto_2421010 ?auto_2421009 ) ) ( not ( = ?auto_2421010 ?auto_2421013 ) ) ( not ( = ?auto_2421010 ?auto_2421015 ) ) ( not ( = ?auto_2421010 ?auto_2421014 ) ) ( not ( = ?auto_2421010 ?auto_2421016 ) ) ( not ( = ?auto_2421010 ?auto_2421017 ) ) ( not ( = ?auto_2421010 ?auto_2421018 ) ) ( not ( = ?auto_2421010 ?auto_2421019 ) ) ( not ( = ?auto_2421010 ?auto_2421020 ) ) ( not ( = ?auto_2421011 ?auto_2421012 ) ) ( not ( = ?auto_2421011 ?auto_2421009 ) ) ( not ( = ?auto_2421011 ?auto_2421013 ) ) ( not ( = ?auto_2421011 ?auto_2421015 ) ) ( not ( = ?auto_2421011 ?auto_2421014 ) ) ( not ( = ?auto_2421011 ?auto_2421016 ) ) ( not ( = ?auto_2421011 ?auto_2421017 ) ) ( not ( = ?auto_2421011 ?auto_2421018 ) ) ( not ( = ?auto_2421011 ?auto_2421019 ) ) ( not ( = ?auto_2421011 ?auto_2421020 ) ) ( not ( = ?auto_2421012 ?auto_2421009 ) ) ( not ( = ?auto_2421012 ?auto_2421013 ) ) ( not ( = ?auto_2421012 ?auto_2421015 ) ) ( not ( = ?auto_2421012 ?auto_2421014 ) ) ( not ( = ?auto_2421012 ?auto_2421016 ) ) ( not ( = ?auto_2421012 ?auto_2421017 ) ) ( not ( = ?auto_2421012 ?auto_2421018 ) ) ( not ( = ?auto_2421012 ?auto_2421019 ) ) ( not ( = ?auto_2421012 ?auto_2421020 ) ) ( not ( = ?auto_2421009 ?auto_2421013 ) ) ( not ( = ?auto_2421009 ?auto_2421015 ) ) ( not ( = ?auto_2421009 ?auto_2421014 ) ) ( not ( = ?auto_2421009 ?auto_2421016 ) ) ( not ( = ?auto_2421009 ?auto_2421017 ) ) ( not ( = ?auto_2421009 ?auto_2421018 ) ) ( not ( = ?auto_2421009 ?auto_2421019 ) ) ( not ( = ?auto_2421009 ?auto_2421020 ) ) ( not ( = ?auto_2421013 ?auto_2421015 ) ) ( not ( = ?auto_2421013 ?auto_2421014 ) ) ( not ( = ?auto_2421013 ?auto_2421016 ) ) ( not ( = ?auto_2421013 ?auto_2421017 ) ) ( not ( = ?auto_2421013 ?auto_2421018 ) ) ( not ( = ?auto_2421013 ?auto_2421019 ) ) ( not ( = ?auto_2421013 ?auto_2421020 ) ) ( not ( = ?auto_2421015 ?auto_2421014 ) ) ( not ( = ?auto_2421015 ?auto_2421016 ) ) ( not ( = ?auto_2421015 ?auto_2421017 ) ) ( not ( = ?auto_2421015 ?auto_2421018 ) ) ( not ( = ?auto_2421015 ?auto_2421019 ) ) ( not ( = ?auto_2421015 ?auto_2421020 ) ) ( not ( = ?auto_2421014 ?auto_2421016 ) ) ( not ( = ?auto_2421014 ?auto_2421017 ) ) ( not ( = ?auto_2421014 ?auto_2421018 ) ) ( not ( = ?auto_2421014 ?auto_2421019 ) ) ( not ( = ?auto_2421014 ?auto_2421020 ) ) ( not ( = ?auto_2421016 ?auto_2421017 ) ) ( not ( = ?auto_2421016 ?auto_2421018 ) ) ( not ( = ?auto_2421016 ?auto_2421019 ) ) ( not ( = ?auto_2421016 ?auto_2421020 ) ) ( not ( = ?auto_2421017 ?auto_2421018 ) ) ( not ( = ?auto_2421017 ?auto_2421019 ) ) ( not ( = ?auto_2421017 ?auto_2421020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421018 ?auto_2421019 ?auto_2421020 )
      ( MAKE-11CRATE-VERIFY ?auto_2421010 ?auto_2421011 ?auto_2421012 ?auto_2421009 ?auto_2421013 ?auto_2421015 ?auto_2421014 ?auto_2421016 ?auto_2421017 ?auto_2421018 ?auto_2421019 ?auto_2421020 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2421142 - SURFACE
      ?auto_2421143 - SURFACE
      ?auto_2421144 - SURFACE
      ?auto_2421141 - SURFACE
      ?auto_2421145 - SURFACE
      ?auto_2421147 - SURFACE
      ?auto_2421146 - SURFACE
      ?auto_2421148 - SURFACE
      ?auto_2421149 - SURFACE
      ?auto_2421150 - SURFACE
      ?auto_2421151 - SURFACE
      ?auto_2421152 - SURFACE
    )
    :vars
    (
      ?auto_2421153 - HOIST
      ?auto_2421156 - PLACE
      ?auto_2421155 - TRUCK
      ?auto_2421157 - PLACE
      ?auto_2421154 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421153 ?auto_2421156 ) ( SURFACE-AT ?auto_2421151 ?auto_2421156 ) ( CLEAR ?auto_2421151 ) ( IS-CRATE ?auto_2421152 ) ( not ( = ?auto_2421151 ?auto_2421152 ) ) ( AVAILABLE ?auto_2421153 ) ( ON ?auto_2421151 ?auto_2421150 ) ( not ( = ?auto_2421150 ?auto_2421151 ) ) ( not ( = ?auto_2421150 ?auto_2421152 ) ) ( TRUCK-AT ?auto_2421155 ?auto_2421157 ) ( not ( = ?auto_2421157 ?auto_2421156 ) ) ( HOIST-AT ?auto_2421154 ?auto_2421157 ) ( LIFTING ?auto_2421154 ?auto_2421152 ) ( not ( = ?auto_2421153 ?auto_2421154 ) ) ( ON ?auto_2421143 ?auto_2421142 ) ( ON ?auto_2421144 ?auto_2421143 ) ( ON ?auto_2421141 ?auto_2421144 ) ( ON ?auto_2421145 ?auto_2421141 ) ( ON ?auto_2421147 ?auto_2421145 ) ( ON ?auto_2421146 ?auto_2421147 ) ( ON ?auto_2421148 ?auto_2421146 ) ( ON ?auto_2421149 ?auto_2421148 ) ( ON ?auto_2421150 ?auto_2421149 ) ( not ( = ?auto_2421142 ?auto_2421143 ) ) ( not ( = ?auto_2421142 ?auto_2421144 ) ) ( not ( = ?auto_2421142 ?auto_2421141 ) ) ( not ( = ?auto_2421142 ?auto_2421145 ) ) ( not ( = ?auto_2421142 ?auto_2421147 ) ) ( not ( = ?auto_2421142 ?auto_2421146 ) ) ( not ( = ?auto_2421142 ?auto_2421148 ) ) ( not ( = ?auto_2421142 ?auto_2421149 ) ) ( not ( = ?auto_2421142 ?auto_2421150 ) ) ( not ( = ?auto_2421142 ?auto_2421151 ) ) ( not ( = ?auto_2421142 ?auto_2421152 ) ) ( not ( = ?auto_2421143 ?auto_2421144 ) ) ( not ( = ?auto_2421143 ?auto_2421141 ) ) ( not ( = ?auto_2421143 ?auto_2421145 ) ) ( not ( = ?auto_2421143 ?auto_2421147 ) ) ( not ( = ?auto_2421143 ?auto_2421146 ) ) ( not ( = ?auto_2421143 ?auto_2421148 ) ) ( not ( = ?auto_2421143 ?auto_2421149 ) ) ( not ( = ?auto_2421143 ?auto_2421150 ) ) ( not ( = ?auto_2421143 ?auto_2421151 ) ) ( not ( = ?auto_2421143 ?auto_2421152 ) ) ( not ( = ?auto_2421144 ?auto_2421141 ) ) ( not ( = ?auto_2421144 ?auto_2421145 ) ) ( not ( = ?auto_2421144 ?auto_2421147 ) ) ( not ( = ?auto_2421144 ?auto_2421146 ) ) ( not ( = ?auto_2421144 ?auto_2421148 ) ) ( not ( = ?auto_2421144 ?auto_2421149 ) ) ( not ( = ?auto_2421144 ?auto_2421150 ) ) ( not ( = ?auto_2421144 ?auto_2421151 ) ) ( not ( = ?auto_2421144 ?auto_2421152 ) ) ( not ( = ?auto_2421141 ?auto_2421145 ) ) ( not ( = ?auto_2421141 ?auto_2421147 ) ) ( not ( = ?auto_2421141 ?auto_2421146 ) ) ( not ( = ?auto_2421141 ?auto_2421148 ) ) ( not ( = ?auto_2421141 ?auto_2421149 ) ) ( not ( = ?auto_2421141 ?auto_2421150 ) ) ( not ( = ?auto_2421141 ?auto_2421151 ) ) ( not ( = ?auto_2421141 ?auto_2421152 ) ) ( not ( = ?auto_2421145 ?auto_2421147 ) ) ( not ( = ?auto_2421145 ?auto_2421146 ) ) ( not ( = ?auto_2421145 ?auto_2421148 ) ) ( not ( = ?auto_2421145 ?auto_2421149 ) ) ( not ( = ?auto_2421145 ?auto_2421150 ) ) ( not ( = ?auto_2421145 ?auto_2421151 ) ) ( not ( = ?auto_2421145 ?auto_2421152 ) ) ( not ( = ?auto_2421147 ?auto_2421146 ) ) ( not ( = ?auto_2421147 ?auto_2421148 ) ) ( not ( = ?auto_2421147 ?auto_2421149 ) ) ( not ( = ?auto_2421147 ?auto_2421150 ) ) ( not ( = ?auto_2421147 ?auto_2421151 ) ) ( not ( = ?auto_2421147 ?auto_2421152 ) ) ( not ( = ?auto_2421146 ?auto_2421148 ) ) ( not ( = ?auto_2421146 ?auto_2421149 ) ) ( not ( = ?auto_2421146 ?auto_2421150 ) ) ( not ( = ?auto_2421146 ?auto_2421151 ) ) ( not ( = ?auto_2421146 ?auto_2421152 ) ) ( not ( = ?auto_2421148 ?auto_2421149 ) ) ( not ( = ?auto_2421148 ?auto_2421150 ) ) ( not ( = ?auto_2421148 ?auto_2421151 ) ) ( not ( = ?auto_2421148 ?auto_2421152 ) ) ( not ( = ?auto_2421149 ?auto_2421150 ) ) ( not ( = ?auto_2421149 ?auto_2421151 ) ) ( not ( = ?auto_2421149 ?auto_2421152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421150 ?auto_2421151 ?auto_2421152 )
      ( MAKE-11CRATE-VERIFY ?auto_2421142 ?auto_2421143 ?auto_2421144 ?auto_2421141 ?auto_2421145 ?auto_2421147 ?auto_2421146 ?auto_2421148 ?auto_2421149 ?auto_2421150 ?auto_2421151 ?auto_2421152 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2421285 - SURFACE
      ?auto_2421286 - SURFACE
      ?auto_2421287 - SURFACE
      ?auto_2421284 - SURFACE
      ?auto_2421288 - SURFACE
      ?auto_2421290 - SURFACE
      ?auto_2421289 - SURFACE
      ?auto_2421291 - SURFACE
      ?auto_2421292 - SURFACE
      ?auto_2421293 - SURFACE
      ?auto_2421294 - SURFACE
      ?auto_2421295 - SURFACE
    )
    :vars
    (
      ?auto_2421300 - HOIST
      ?auto_2421296 - PLACE
      ?auto_2421298 - TRUCK
      ?auto_2421301 - PLACE
      ?auto_2421297 - HOIST
      ?auto_2421299 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421300 ?auto_2421296 ) ( SURFACE-AT ?auto_2421294 ?auto_2421296 ) ( CLEAR ?auto_2421294 ) ( IS-CRATE ?auto_2421295 ) ( not ( = ?auto_2421294 ?auto_2421295 ) ) ( AVAILABLE ?auto_2421300 ) ( ON ?auto_2421294 ?auto_2421293 ) ( not ( = ?auto_2421293 ?auto_2421294 ) ) ( not ( = ?auto_2421293 ?auto_2421295 ) ) ( TRUCK-AT ?auto_2421298 ?auto_2421301 ) ( not ( = ?auto_2421301 ?auto_2421296 ) ) ( HOIST-AT ?auto_2421297 ?auto_2421301 ) ( not ( = ?auto_2421300 ?auto_2421297 ) ) ( AVAILABLE ?auto_2421297 ) ( SURFACE-AT ?auto_2421295 ?auto_2421301 ) ( ON ?auto_2421295 ?auto_2421299 ) ( CLEAR ?auto_2421295 ) ( not ( = ?auto_2421294 ?auto_2421299 ) ) ( not ( = ?auto_2421295 ?auto_2421299 ) ) ( not ( = ?auto_2421293 ?auto_2421299 ) ) ( ON ?auto_2421286 ?auto_2421285 ) ( ON ?auto_2421287 ?auto_2421286 ) ( ON ?auto_2421284 ?auto_2421287 ) ( ON ?auto_2421288 ?auto_2421284 ) ( ON ?auto_2421290 ?auto_2421288 ) ( ON ?auto_2421289 ?auto_2421290 ) ( ON ?auto_2421291 ?auto_2421289 ) ( ON ?auto_2421292 ?auto_2421291 ) ( ON ?auto_2421293 ?auto_2421292 ) ( not ( = ?auto_2421285 ?auto_2421286 ) ) ( not ( = ?auto_2421285 ?auto_2421287 ) ) ( not ( = ?auto_2421285 ?auto_2421284 ) ) ( not ( = ?auto_2421285 ?auto_2421288 ) ) ( not ( = ?auto_2421285 ?auto_2421290 ) ) ( not ( = ?auto_2421285 ?auto_2421289 ) ) ( not ( = ?auto_2421285 ?auto_2421291 ) ) ( not ( = ?auto_2421285 ?auto_2421292 ) ) ( not ( = ?auto_2421285 ?auto_2421293 ) ) ( not ( = ?auto_2421285 ?auto_2421294 ) ) ( not ( = ?auto_2421285 ?auto_2421295 ) ) ( not ( = ?auto_2421285 ?auto_2421299 ) ) ( not ( = ?auto_2421286 ?auto_2421287 ) ) ( not ( = ?auto_2421286 ?auto_2421284 ) ) ( not ( = ?auto_2421286 ?auto_2421288 ) ) ( not ( = ?auto_2421286 ?auto_2421290 ) ) ( not ( = ?auto_2421286 ?auto_2421289 ) ) ( not ( = ?auto_2421286 ?auto_2421291 ) ) ( not ( = ?auto_2421286 ?auto_2421292 ) ) ( not ( = ?auto_2421286 ?auto_2421293 ) ) ( not ( = ?auto_2421286 ?auto_2421294 ) ) ( not ( = ?auto_2421286 ?auto_2421295 ) ) ( not ( = ?auto_2421286 ?auto_2421299 ) ) ( not ( = ?auto_2421287 ?auto_2421284 ) ) ( not ( = ?auto_2421287 ?auto_2421288 ) ) ( not ( = ?auto_2421287 ?auto_2421290 ) ) ( not ( = ?auto_2421287 ?auto_2421289 ) ) ( not ( = ?auto_2421287 ?auto_2421291 ) ) ( not ( = ?auto_2421287 ?auto_2421292 ) ) ( not ( = ?auto_2421287 ?auto_2421293 ) ) ( not ( = ?auto_2421287 ?auto_2421294 ) ) ( not ( = ?auto_2421287 ?auto_2421295 ) ) ( not ( = ?auto_2421287 ?auto_2421299 ) ) ( not ( = ?auto_2421284 ?auto_2421288 ) ) ( not ( = ?auto_2421284 ?auto_2421290 ) ) ( not ( = ?auto_2421284 ?auto_2421289 ) ) ( not ( = ?auto_2421284 ?auto_2421291 ) ) ( not ( = ?auto_2421284 ?auto_2421292 ) ) ( not ( = ?auto_2421284 ?auto_2421293 ) ) ( not ( = ?auto_2421284 ?auto_2421294 ) ) ( not ( = ?auto_2421284 ?auto_2421295 ) ) ( not ( = ?auto_2421284 ?auto_2421299 ) ) ( not ( = ?auto_2421288 ?auto_2421290 ) ) ( not ( = ?auto_2421288 ?auto_2421289 ) ) ( not ( = ?auto_2421288 ?auto_2421291 ) ) ( not ( = ?auto_2421288 ?auto_2421292 ) ) ( not ( = ?auto_2421288 ?auto_2421293 ) ) ( not ( = ?auto_2421288 ?auto_2421294 ) ) ( not ( = ?auto_2421288 ?auto_2421295 ) ) ( not ( = ?auto_2421288 ?auto_2421299 ) ) ( not ( = ?auto_2421290 ?auto_2421289 ) ) ( not ( = ?auto_2421290 ?auto_2421291 ) ) ( not ( = ?auto_2421290 ?auto_2421292 ) ) ( not ( = ?auto_2421290 ?auto_2421293 ) ) ( not ( = ?auto_2421290 ?auto_2421294 ) ) ( not ( = ?auto_2421290 ?auto_2421295 ) ) ( not ( = ?auto_2421290 ?auto_2421299 ) ) ( not ( = ?auto_2421289 ?auto_2421291 ) ) ( not ( = ?auto_2421289 ?auto_2421292 ) ) ( not ( = ?auto_2421289 ?auto_2421293 ) ) ( not ( = ?auto_2421289 ?auto_2421294 ) ) ( not ( = ?auto_2421289 ?auto_2421295 ) ) ( not ( = ?auto_2421289 ?auto_2421299 ) ) ( not ( = ?auto_2421291 ?auto_2421292 ) ) ( not ( = ?auto_2421291 ?auto_2421293 ) ) ( not ( = ?auto_2421291 ?auto_2421294 ) ) ( not ( = ?auto_2421291 ?auto_2421295 ) ) ( not ( = ?auto_2421291 ?auto_2421299 ) ) ( not ( = ?auto_2421292 ?auto_2421293 ) ) ( not ( = ?auto_2421292 ?auto_2421294 ) ) ( not ( = ?auto_2421292 ?auto_2421295 ) ) ( not ( = ?auto_2421292 ?auto_2421299 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421293 ?auto_2421294 ?auto_2421295 )
      ( MAKE-11CRATE-VERIFY ?auto_2421285 ?auto_2421286 ?auto_2421287 ?auto_2421284 ?auto_2421288 ?auto_2421290 ?auto_2421289 ?auto_2421291 ?auto_2421292 ?auto_2421293 ?auto_2421294 ?auto_2421295 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2421429 - SURFACE
      ?auto_2421430 - SURFACE
      ?auto_2421431 - SURFACE
      ?auto_2421428 - SURFACE
      ?auto_2421432 - SURFACE
      ?auto_2421434 - SURFACE
      ?auto_2421433 - SURFACE
      ?auto_2421435 - SURFACE
      ?auto_2421436 - SURFACE
      ?auto_2421437 - SURFACE
      ?auto_2421438 - SURFACE
      ?auto_2421439 - SURFACE
    )
    :vars
    (
      ?auto_2421443 - HOIST
      ?auto_2421442 - PLACE
      ?auto_2421440 - PLACE
      ?auto_2421441 - HOIST
      ?auto_2421445 - SURFACE
      ?auto_2421444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421443 ?auto_2421442 ) ( SURFACE-AT ?auto_2421438 ?auto_2421442 ) ( CLEAR ?auto_2421438 ) ( IS-CRATE ?auto_2421439 ) ( not ( = ?auto_2421438 ?auto_2421439 ) ) ( AVAILABLE ?auto_2421443 ) ( ON ?auto_2421438 ?auto_2421437 ) ( not ( = ?auto_2421437 ?auto_2421438 ) ) ( not ( = ?auto_2421437 ?auto_2421439 ) ) ( not ( = ?auto_2421440 ?auto_2421442 ) ) ( HOIST-AT ?auto_2421441 ?auto_2421440 ) ( not ( = ?auto_2421443 ?auto_2421441 ) ) ( AVAILABLE ?auto_2421441 ) ( SURFACE-AT ?auto_2421439 ?auto_2421440 ) ( ON ?auto_2421439 ?auto_2421445 ) ( CLEAR ?auto_2421439 ) ( not ( = ?auto_2421438 ?auto_2421445 ) ) ( not ( = ?auto_2421439 ?auto_2421445 ) ) ( not ( = ?auto_2421437 ?auto_2421445 ) ) ( TRUCK-AT ?auto_2421444 ?auto_2421442 ) ( ON ?auto_2421430 ?auto_2421429 ) ( ON ?auto_2421431 ?auto_2421430 ) ( ON ?auto_2421428 ?auto_2421431 ) ( ON ?auto_2421432 ?auto_2421428 ) ( ON ?auto_2421434 ?auto_2421432 ) ( ON ?auto_2421433 ?auto_2421434 ) ( ON ?auto_2421435 ?auto_2421433 ) ( ON ?auto_2421436 ?auto_2421435 ) ( ON ?auto_2421437 ?auto_2421436 ) ( not ( = ?auto_2421429 ?auto_2421430 ) ) ( not ( = ?auto_2421429 ?auto_2421431 ) ) ( not ( = ?auto_2421429 ?auto_2421428 ) ) ( not ( = ?auto_2421429 ?auto_2421432 ) ) ( not ( = ?auto_2421429 ?auto_2421434 ) ) ( not ( = ?auto_2421429 ?auto_2421433 ) ) ( not ( = ?auto_2421429 ?auto_2421435 ) ) ( not ( = ?auto_2421429 ?auto_2421436 ) ) ( not ( = ?auto_2421429 ?auto_2421437 ) ) ( not ( = ?auto_2421429 ?auto_2421438 ) ) ( not ( = ?auto_2421429 ?auto_2421439 ) ) ( not ( = ?auto_2421429 ?auto_2421445 ) ) ( not ( = ?auto_2421430 ?auto_2421431 ) ) ( not ( = ?auto_2421430 ?auto_2421428 ) ) ( not ( = ?auto_2421430 ?auto_2421432 ) ) ( not ( = ?auto_2421430 ?auto_2421434 ) ) ( not ( = ?auto_2421430 ?auto_2421433 ) ) ( not ( = ?auto_2421430 ?auto_2421435 ) ) ( not ( = ?auto_2421430 ?auto_2421436 ) ) ( not ( = ?auto_2421430 ?auto_2421437 ) ) ( not ( = ?auto_2421430 ?auto_2421438 ) ) ( not ( = ?auto_2421430 ?auto_2421439 ) ) ( not ( = ?auto_2421430 ?auto_2421445 ) ) ( not ( = ?auto_2421431 ?auto_2421428 ) ) ( not ( = ?auto_2421431 ?auto_2421432 ) ) ( not ( = ?auto_2421431 ?auto_2421434 ) ) ( not ( = ?auto_2421431 ?auto_2421433 ) ) ( not ( = ?auto_2421431 ?auto_2421435 ) ) ( not ( = ?auto_2421431 ?auto_2421436 ) ) ( not ( = ?auto_2421431 ?auto_2421437 ) ) ( not ( = ?auto_2421431 ?auto_2421438 ) ) ( not ( = ?auto_2421431 ?auto_2421439 ) ) ( not ( = ?auto_2421431 ?auto_2421445 ) ) ( not ( = ?auto_2421428 ?auto_2421432 ) ) ( not ( = ?auto_2421428 ?auto_2421434 ) ) ( not ( = ?auto_2421428 ?auto_2421433 ) ) ( not ( = ?auto_2421428 ?auto_2421435 ) ) ( not ( = ?auto_2421428 ?auto_2421436 ) ) ( not ( = ?auto_2421428 ?auto_2421437 ) ) ( not ( = ?auto_2421428 ?auto_2421438 ) ) ( not ( = ?auto_2421428 ?auto_2421439 ) ) ( not ( = ?auto_2421428 ?auto_2421445 ) ) ( not ( = ?auto_2421432 ?auto_2421434 ) ) ( not ( = ?auto_2421432 ?auto_2421433 ) ) ( not ( = ?auto_2421432 ?auto_2421435 ) ) ( not ( = ?auto_2421432 ?auto_2421436 ) ) ( not ( = ?auto_2421432 ?auto_2421437 ) ) ( not ( = ?auto_2421432 ?auto_2421438 ) ) ( not ( = ?auto_2421432 ?auto_2421439 ) ) ( not ( = ?auto_2421432 ?auto_2421445 ) ) ( not ( = ?auto_2421434 ?auto_2421433 ) ) ( not ( = ?auto_2421434 ?auto_2421435 ) ) ( not ( = ?auto_2421434 ?auto_2421436 ) ) ( not ( = ?auto_2421434 ?auto_2421437 ) ) ( not ( = ?auto_2421434 ?auto_2421438 ) ) ( not ( = ?auto_2421434 ?auto_2421439 ) ) ( not ( = ?auto_2421434 ?auto_2421445 ) ) ( not ( = ?auto_2421433 ?auto_2421435 ) ) ( not ( = ?auto_2421433 ?auto_2421436 ) ) ( not ( = ?auto_2421433 ?auto_2421437 ) ) ( not ( = ?auto_2421433 ?auto_2421438 ) ) ( not ( = ?auto_2421433 ?auto_2421439 ) ) ( not ( = ?auto_2421433 ?auto_2421445 ) ) ( not ( = ?auto_2421435 ?auto_2421436 ) ) ( not ( = ?auto_2421435 ?auto_2421437 ) ) ( not ( = ?auto_2421435 ?auto_2421438 ) ) ( not ( = ?auto_2421435 ?auto_2421439 ) ) ( not ( = ?auto_2421435 ?auto_2421445 ) ) ( not ( = ?auto_2421436 ?auto_2421437 ) ) ( not ( = ?auto_2421436 ?auto_2421438 ) ) ( not ( = ?auto_2421436 ?auto_2421439 ) ) ( not ( = ?auto_2421436 ?auto_2421445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421437 ?auto_2421438 ?auto_2421439 )
      ( MAKE-11CRATE-VERIFY ?auto_2421429 ?auto_2421430 ?auto_2421431 ?auto_2421428 ?auto_2421432 ?auto_2421434 ?auto_2421433 ?auto_2421435 ?auto_2421436 ?auto_2421437 ?auto_2421438 ?auto_2421439 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2421573 - SURFACE
      ?auto_2421574 - SURFACE
      ?auto_2421575 - SURFACE
      ?auto_2421572 - SURFACE
      ?auto_2421576 - SURFACE
      ?auto_2421578 - SURFACE
      ?auto_2421577 - SURFACE
      ?auto_2421579 - SURFACE
      ?auto_2421580 - SURFACE
      ?auto_2421581 - SURFACE
      ?auto_2421582 - SURFACE
      ?auto_2421583 - SURFACE
    )
    :vars
    (
      ?auto_2421588 - HOIST
      ?auto_2421589 - PLACE
      ?auto_2421585 - PLACE
      ?auto_2421584 - HOIST
      ?auto_2421587 - SURFACE
      ?auto_2421586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421588 ?auto_2421589 ) ( IS-CRATE ?auto_2421583 ) ( not ( = ?auto_2421582 ?auto_2421583 ) ) ( not ( = ?auto_2421581 ?auto_2421582 ) ) ( not ( = ?auto_2421581 ?auto_2421583 ) ) ( not ( = ?auto_2421585 ?auto_2421589 ) ) ( HOIST-AT ?auto_2421584 ?auto_2421585 ) ( not ( = ?auto_2421588 ?auto_2421584 ) ) ( AVAILABLE ?auto_2421584 ) ( SURFACE-AT ?auto_2421583 ?auto_2421585 ) ( ON ?auto_2421583 ?auto_2421587 ) ( CLEAR ?auto_2421583 ) ( not ( = ?auto_2421582 ?auto_2421587 ) ) ( not ( = ?auto_2421583 ?auto_2421587 ) ) ( not ( = ?auto_2421581 ?auto_2421587 ) ) ( TRUCK-AT ?auto_2421586 ?auto_2421589 ) ( SURFACE-AT ?auto_2421581 ?auto_2421589 ) ( CLEAR ?auto_2421581 ) ( LIFTING ?auto_2421588 ?auto_2421582 ) ( IS-CRATE ?auto_2421582 ) ( ON ?auto_2421574 ?auto_2421573 ) ( ON ?auto_2421575 ?auto_2421574 ) ( ON ?auto_2421572 ?auto_2421575 ) ( ON ?auto_2421576 ?auto_2421572 ) ( ON ?auto_2421578 ?auto_2421576 ) ( ON ?auto_2421577 ?auto_2421578 ) ( ON ?auto_2421579 ?auto_2421577 ) ( ON ?auto_2421580 ?auto_2421579 ) ( ON ?auto_2421581 ?auto_2421580 ) ( not ( = ?auto_2421573 ?auto_2421574 ) ) ( not ( = ?auto_2421573 ?auto_2421575 ) ) ( not ( = ?auto_2421573 ?auto_2421572 ) ) ( not ( = ?auto_2421573 ?auto_2421576 ) ) ( not ( = ?auto_2421573 ?auto_2421578 ) ) ( not ( = ?auto_2421573 ?auto_2421577 ) ) ( not ( = ?auto_2421573 ?auto_2421579 ) ) ( not ( = ?auto_2421573 ?auto_2421580 ) ) ( not ( = ?auto_2421573 ?auto_2421581 ) ) ( not ( = ?auto_2421573 ?auto_2421582 ) ) ( not ( = ?auto_2421573 ?auto_2421583 ) ) ( not ( = ?auto_2421573 ?auto_2421587 ) ) ( not ( = ?auto_2421574 ?auto_2421575 ) ) ( not ( = ?auto_2421574 ?auto_2421572 ) ) ( not ( = ?auto_2421574 ?auto_2421576 ) ) ( not ( = ?auto_2421574 ?auto_2421578 ) ) ( not ( = ?auto_2421574 ?auto_2421577 ) ) ( not ( = ?auto_2421574 ?auto_2421579 ) ) ( not ( = ?auto_2421574 ?auto_2421580 ) ) ( not ( = ?auto_2421574 ?auto_2421581 ) ) ( not ( = ?auto_2421574 ?auto_2421582 ) ) ( not ( = ?auto_2421574 ?auto_2421583 ) ) ( not ( = ?auto_2421574 ?auto_2421587 ) ) ( not ( = ?auto_2421575 ?auto_2421572 ) ) ( not ( = ?auto_2421575 ?auto_2421576 ) ) ( not ( = ?auto_2421575 ?auto_2421578 ) ) ( not ( = ?auto_2421575 ?auto_2421577 ) ) ( not ( = ?auto_2421575 ?auto_2421579 ) ) ( not ( = ?auto_2421575 ?auto_2421580 ) ) ( not ( = ?auto_2421575 ?auto_2421581 ) ) ( not ( = ?auto_2421575 ?auto_2421582 ) ) ( not ( = ?auto_2421575 ?auto_2421583 ) ) ( not ( = ?auto_2421575 ?auto_2421587 ) ) ( not ( = ?auto_2421572 ?auto_2421576 ) ) ( not ( = ?auto_2421572 ?auto_2421578 ) ) ( not ( = ?auto_2421572 ?auto_2421577 ) ) ( not ( = ?auto_2421572 ?auto_2421579 ) ) ( not ( = ?auto_2421572 ?auto_2421580 ) ) ( not ( = ?auto_2421572 ?auto_2421581 ) ) ( not ( = ?auto_2421572 ?auto_2421582 ) ) ( not ( = ?auto_2421572 ?auto_2421583 ) ) ( not ( = ?auto_2421572 ?auto_2421587 ) ) ( not ( = ?auto_2421576 ?auto_2421578 ) ) ( not ( = ?auto_2421576 ?auto_2421577 ) ) ( not ( = ?auto_2421576 ?auto_2421579 ) ) ( not ( = ?auto_2421576 ?auto_2421580 ) ) ( not ( = ?auto_2421576 ?auto_2421581 ) ) ( not ( = ?auto_2421576 ?auto_2421582 ) ) ( not ( = ?auto_2421576 ?auto_2421583 ) ) ( not ( = ?auto_2421576 ?auto_2421587 ) ) ( not ( = ?auto_2421578 ?auto_2421577 ) ) ( not ( = ?auto_2421578 ?auto_2421579 ) ) ( not ( = ?auto_2421578 ?auto_2421580 ) ) ( not ( = ?auto_2421578 ?auto_2421581 ) ) ( not ( = ?auto_2421578 ?auto_2421582 ) ) ( not ( = ?auto_2421578 ?auto_2421583 ) ) ( not ( = ?auto_2421578 ?auto_2421587 ) ) ( not ( = ?auto_2421577 ?auto_2421579 ) ) ( not ( = ?auto_2421577 ?auto_2421580 ) ) ( not ( = ?auto_2421577 ?auto_2421581 ) ) ( not ( = ?auto_2421577 ?auto_2421582 ) ) ( not ( = ?auto_2421577 ?auto_2421583 ) ) ( not ( = ?auto_2421577 ?auto_2421587 ) ) ( not ( = ?auto_2421579 ?auto_2421580 ) ) ( not ( = ?auto_2421579 ?auto_2421581 ) ) ( not ( = ?auto_2421579 ?auto_2421582 ) ) ( not ( = ?auto_2421579 ?auto_2421583 ) ) ( not ( = ?auto_2421579 ?auto_2421587 ) ) ( not ( = ?auto_2421580 ?auto_2421581 ) ) ( not ( = ?auto_2421580 ?auto_2421582 ) ) ( not ( = ?auto_2421580 ?auto_2421583 ) ) ( not ( = ?auto_2421580 ?auto_2421587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421581 ?auto_2421582 ?auto_2421583 )
      ( MAKE-11CRATE-VERIFY ?auto_2421573 ?auto_2421574 ?auto_2421575 ?auto_2421572 ?auto_2421576 ?auto_2421578 ?auto_2421577 ?auto_2421579 ?auto_2421580 ?auto_2421581 ?auto_2421582 ?auto_2421583 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2421717 - SURFACE
      ?auto_2421718 - SURFACE
      ?auto_2421719 - SURFACE
      ?auto_2421716 - SURFACE
      ?auto_2421720 - SURFACE
      ?auto_2421722 - SURFACE
      ?auto_2421721 - SURFACE
      ?auto_2421723 - SURFACE
      ?auto_2421724 - SURFACE
      ?auto_2421725 - SURFACE
      ?auto_2421726 - SURFACE
      ?auto_2421727 - SURFACE
    )
    :vars
    (
      ?auto_2421731 - HOIST
      ?auto_2421729 - PLACE
      ?auto_2421728 - PLACE
      ?auto_2421732 - HOIST
      ?auto_2421730 - SURFACE
      ?auto_2421733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2421731 ?auto_2421729 ) ( IS-CRATE ?auto_2421727 ) ( not ( = ?auto_2421726 ?auto_2421727 ) ) ( not ( = ?auto_2421725 ?auto_2421726 ) ) ( not ( = ?auto_2421725 ?auto_2421727 ) ) ( not ( = ?auto_2421728 ?auto_2421729 ) ) ( HOIST-AT ?auto_2421732 ?auto_2421728 ) ( not ( = ?auto_2421731 ?auto_2421732 ) ) ( AVAILABLE ?auto_2421732 ) ( SURFACE-AT ?auto_2421727 ?auto_2421728 ) ( ON ?auto_2421727 ?auto_2421730 ) ( CLEAR ?auto_2421727 ) ( not ( = ?auto_2421726 ?auto_2421730 ) ) ( not ( = ?auto_2421727 ?auto_2421730 ) ) ( not ( = ?auto_2421725 ?auto_2421730 ) ) ( TRUCK-AT ?auto_2421733 ?auto_2421729 ) ( SURFACE-AT ?auto_2421725 ?auto_2421729 ) ( CLEAR ?auto_2421725 ) ( IS-CRATE ?auto_2421726 ) ( AVAILABLE ?auto_2421731 ) ( IN ?auto_2421726 ?auto_2421733 ) ( ON ?auto_2421718 ?auto_2421717 ) ( ON ?auto_2421719 ?auto_2421718 ) ( ON ?auto_2421716 ?auto_2421719 ) ( ON ?auto_2421720 ?auto_2421716 ) ( ON ?auto_2421722 ?auto_2421720 ) ( ON ?auto_2421721 ?auto_2421722 ) ( ON ?auto_2421723 ?auto_2421721 ) ( ON ?auto_2421724 ?auto_2421723 ) ( ON ?auto_2421725 ?auto_2421724 ) ( not ( = ?auto_2421717 ?auto_2421718 ) ) ( not ( = ?auto_2421717 ?auto_2421719 ) ) ( not ( = ?auto_2421717 ?auto_2421716 ) ) ( not ( = ?auto_2421717 ?auto_2421720 ) ) ( not ( = ?auto_2421717 ?auto_2421722 ) ) ( not ( = ?auto_2421717 ?auto_2421721 ) ) ( not ( = ?auto_2421717 ?auto_2421723 ) ) ( not ( = ?auto_2421717 ?auto_2421724 ) ) ( not ( = ?auto_2421717 ?auto_2421725 ) ) ( not ( = ?auto_2421717 ?auto_2421726 ) ) ( not ( = ?auto_2421717 ?auto_2421727 ) ) ( not ( = ?auto_2421717 ?auto_2421730 ) ) ( not ( = ?auto_2421718 ?auto_2421719 ) ) ( not ( = ?auto_2421718 ?auto_2421716 ) ) ( not ( = ?auto_2421718 ?auto_2421720 ) ) ( not ( = ?auto_2421718 ?auto_2421722 ) ) ( not ( = ?auto_2421718 ?auto_2421721 ) ) ( not ( = ?auto_2421718 ?auto_2421723 ) ) ( not ( = ?auto_2421718 ?auto_2421724 ) ) ( not ( = ?auto_2421718 ?auto_2421725 ) ) ( not ( = ?auto_2421718 ?auto_2421726 ) ) ( not ( = ?auto_2421718 ?auto_2421727 ) ) ( not ( = ?auto_2421718 ?auto_2421730 ) ) ( not ( = ?auto_2421719 ?auto_2421716 ) ) ( not ( = ?auto_2421719 ?auto_2421720 ) ) ( not ( = ?auto_2421719 ?auto_2421722 ) ) ( not ( = ?auto_2421719 ?auto_2421721 ) ) ( not ( = ?auto_2421719 ?auto_2421723 ) ) ( not ( = ?auto_2421719 ?auto_2421724 ) ) ( not ( = ?auto_2421719 ?auto_2421725 ) ) ( not ( = ?auto_2421719 ?auto_2421726 ) ) ( not ( = ?auto_2421719 ?auto_2421727 ) ) ( not ( = ?auto_2421719 ?auto_2421730 ) ) ( not ( = ?auto_2421716 ?auto_2421720 ) ) ( not ( = ?auto_2421716 ?auto_2421722 ) ) ( not ( = ?auto_2421716 ?auto_2421721 ) ) ( not ( = ?auto_2421716 ?auto_2421723 ) ) ( not ( = ?auto_2421716 ?auto_2421724 ) ) ( not ( = ?auto_2421716 ?auto_2421725 ) ) ( not ( = ?auto_2421716 ?auto_2421726 ) ) ( not ( = ?auto_2421716 ?auto_2421727 ) ) ( not ( = ?auto_2421716 ?auto_2421730 ) ) ( not ( = ?auto_2421720 ?auto_2421722 ) ) ( not ( = ?auto_2421720 ?auto_2421721 ) ) ( not ( = ?auto_2421720 ?auto_2421723 ) ) ( not ( = ?auto_2421720 ?auto_2421724 ) ) ( not ( = ?auto_2421720 ?auto_2421725 ) ) ( not ( = ?auto_2421720 ?auto_2421726 ) ) ( not ( = ?auto_2421720 ?auto_2421727 ) ) ( not ( = ?auto_2421720 ?auto_2421730 ) ) ( not ( = ?auto_2421722 ?auto_2421721 ) ) ( not ( = ?auto_2421722 ?auto_2421723 ) ) ( not ( = ?auto_2421722 ?auto_2421724 ) ) ( not ( = ?auto_2421722 ?auto_2421725 ) ) ( not ( = ?auto_2421722 ?auto_2421726 ) ) ( not ( = ?auto_2421722 ?auto_2421727 ) ) ( not ( = ?auto_2421722 ?auto_2421730 ) ) ( not ( = ?auto_2421721 ?auto_2421723 ) ) ( not ( = ?auto_2421721 ?auto_2421724 ) ) ( not ( = ?auto_2421721 ?auto_2421725 ) ) ( not ( = ?auto_2421721 ?auto_2421726 ) ) ( not ( = ?auto_2421721 ?auto_2421727 ) ) ( not ( = ?auto_2421721 ?auto_2421730 ) ) ( not ( = ?auto_2421723 ?auto_2421724 ) ) ( not ( = ?auto_2421723 ?auto_2421725 ) ) ( not ( = ?auto_2421723 ?auto_2421726 ) ) ( not ( = ?auto_2421723 ?auto_2421727 ) ) ( not ( = ?auto_2421723 ?auto_2421730 ) ) ( not ( = ?auto_2421724 ?auto_2421725 ) ) ( not ( = ?auto_2421724 ?auto_2421726 ) ) ( not ( = ?auto_2421724 ?auto_2421727 ) ) ( not ( = ?auto_2421724 ?auto_2421730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2421725 ?auto_2421726 ?auto_2421727 )
      ( MAKE-11CRATE-VERIFY ?auto_2421717 ?auto_2421718 ?auto_2421719 ?auto_2421716 ?auto_2421720 ?auto_2421722 ?auto_2421721 ?auto_2421723 ?auto_2421724 ?auto_2421725 ?auto_2421726 ?auto_2421727 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2431008 - SURFACE
      ?auto_2431009 - SURFACE
      ?auto_2431010 - SURFACE
      ?auto_2431007 - SURFACE
      ?auto_2431011 - SURFACE
      ?auto_2431013 - SURFACE
      ?auto_2431012 - SURFACE
      ?auto_2431014 - SURFACE
      ?auto_2431015 - SURFACE
      ?auto_2431016 - SURFACE
      ?auto_2431017 - SURFACE
      ?auto_2431018 - SURFACE
      ?auto_2431019 - SURFACE
    )
    :vars
    (
      ?auto_2431021 - HOIST
      ?auto_2431020 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2431021 ?auto_2431020 ) ( SURFACE-AT ?auto_2431018 ?auto_2431020 ) ( CLEAR ?auto_2431018 ) ( LIFTING ?auto_2431021 ?auto_2431019 ) ( IS-CRATE ?auto_2431019 ) ( not ( = ?auto_2431018 ?auto_2431019 ) ) ( ON ?auto_2431009 ?auto_2431008 ) ( ON ?auto_2431010 ?auto_2431009 ) ( ON ?auto_2431007 ?auto_2431010 ) ( ON ?auto_2431011 ?auto_2431007 ) ( ON ?auto_2431013 ?auto_2431011 ) ( ON ?auto_2431012 ?auto_2431013 ) ( ON ?auto_2431014 ?auto_2431012 ) ( ON ?auto_2431015 ?auto_2431014 ) ( ON ?auto_2431016 ?auto_2431015 ) ( ON ?auto_2431017 ?auto_2431016 ) ( ON ?auto_2431018 ?auto_2431017 ) ( not ( = ?auto_2431008 ?auto_2431009 ) ) ( not ( = ?auto_2431008 ?auto_2431010 ) ) ( not ( = ?auto_2431008 ?auto_2431007 ) ) ( not ( = ?auto_2431008 ?auto_2431011 ) ) ( not ( = ?auto_2431008 ?auto_2431013 ) ) ( not ( = ?auto_2431008 ?auto_2431012 ) ) ( not ( = ?auto_2431008 ?auto_2431014 ) ) ( not ( = ?auto_2431008 ?auto_2431015 ) ) ( not ( = ?auto_2431008 ?auto_2431016 ) ) ( not ( = ?auto_2431008 ?auto_2431017 ) ) ( not ( = ?auto_2431008 ?auto_2431018 ) ) ( not ( = ?auto_2431008 ?auto_2431019 ) ) ( not ( = ?auto_2431009 ?auto_2431010 ) ) ( not ( = ?auto_2431009 ?auto_2431007 ) ) ( not ( = ?auto_2431009 ?auto_2431011 ) ) ( not ( = ?auto_2431009 ?auto_2431013 ) ) ( not ( = ?auto_2431009 ?auto_2431012 ) ) ( not ( = ?auto_2431009 ?auto_2431014 ) ) ( not ( = ?auto_2431009 ?auto_2431015 ) ) ( not ( = ?auto_2431009 ?auto_2431016 ) ) ( not ( = ?auto_2431009 ?auto_2431017 ) ) ( not ( = ?auto_2431009 ?auto_2431018 ) ) ( not ( = ?auto_2431009 ?auto_2431019 ) ) ( not ( = ?auto_2431010 ?auto_2431007 ) ) ( not ( = ?auto_2431010 ?auto_2431011 ) ) ( not ( = ?auto_2431010 ?auto_2431013 ) ) ( not ( = ?auto_2431010 ?auto_2431012 ) ) ( not ( = ?auto_2431010 ?auto_2431014 ) ) ( not ( = ?auto_2431010 ?auto_2431015 ) ) ( not ( = ?auto_2431010 ?auto_2431016 ) ) ( not ( = ?auto_2431010 ?auto_2431017 ) ) ( not ( = ?auto_2431010 ?auto_2431018 ) ) ( not ( = ?auto_2431010 ?auto_2431019 ) ) ( not ( = ?auto_2431007 ?auto_2431011 ) ) ( not ( = ?auto_2431007 ?auto_2431013 ) ) ( not ( = ?auto_2431007 ?auto_2431012 ) ) ( not ( = ?auto_2431007 ?auto_2431014 ) ) ( not ( = ?auto_2431007 ?auto_2431015 ) ) ( not ( = ?auto_2431007 ?auto_2431016 ) ) ( not ( = ?auto_2431007 ?auto_2431017 ) ) ( not ( = ?auto_2431007 ?auto_2431018 ) ) ( not ( = ?auto_2431007 ?auto_2431019 ) ) ( not ( = ?auto_2431011 ?auto_2431013 ) ) ( not ( = ?auto_2431011 ?auto_2431012 ) ) ( not ( = ?auto_2431011 ?auto_2431014 ) ) ( not ( = ?auto_2431011 ?auto_2431015 ) ) ( not ( = ?auto_2431011 ?auto_2431016 ) ) ( not ( = ?auto_2431011 ?auto_2431017 ) ) ( not ( = ?auto_2431011 ?auto_2431018 ) ) ( not ( = ?auto_2431011 ?auto_2431019 ) ) ( not ( = ?auto_2431013 ?auto_2431012 ) ) ( not ( = ?auto_2431013 ?auto_2431014 ) ) ( not ( = ?auto_2431013 ?auto_2431015 ) ) ( not ( = ?auto_2431013 ?auto_2431016 ) ) ( not ( = ?auto_2431013 ?auto_2431017 ) ) ( not ( = ?auto_2431013 ?auto_2431018 ) ) ( not ( = ?auto_2431013 ?auto_2431019 ) ) ( not ( = ?auto_2431012 ?auto_2431014 ) ) ( not ( = ?auto_2431012 ?auto_2431015 ) ) ( not ( = ?auto_2431012 ?auto_2431016 ) ) ( not ( = ?auto_2431012 ?auto_2431017 ) ) ( not ( = ?auto_2431012 ?auto_2431018 ) ) ( not ( = ?auto_2431012 ?auto_2431019 ) ) ( not ( = ?auto_2431014 ?auto_2431015 ) ) ( not ( = ?auto_2431014 ?auto_2431016 ) ) ( not ( = ?auto_2431014 ?auto_2431017 ) ) ( not ( = ?auto_2431014 ?auto_2431018 ) ) ( not ( = ?auto_2431014 ?auto_2431019 ) ) ( not ( = ?auto_2431015 ?auto_2431016 ) ) ( not ( = ?auto_2431015 ?auto_2431017 ) ) ( not ( = ?auto_2431015 ?auto_2431018 ) ) ( not ( = ?auto_2431015 ?auto_2431019 ) ) ( not ( = ?auto_2431016 ?auto_2431017 ) ) ( not ( = ?auto_2431016 ?auto_2431018 ) ) ( not ( = ?auto_2431016 ?auto_2431019 ) ) ( not ( = ?auto_2431017 ?auto_2431018 ) ) ( not ( = ?auto_2431017 ?auto_2431019 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2431018 ?auto_2431019 )
      ( MAKE-12CRATE-VERIFY ?auto_2431008 ?auto_2431009 ?auto_2431010 ?auto_2431007 ?auto_2431011 ?auto_2431013 ?auto_2431012 ?auto_2431014 ?auto_2431015 ?auto_2431016 ?auto_2431017 ?auto_2431018 ?auto_2431019 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2431133 - SURFACE
      ?auto_2431134 - SURFACE
      ?auto_2431135 - SURFACE
      ?auto_2431132 - SURFACE
      ?auto_2431136 - SURFACE
      ?auto_2431138 - SURFACE
      ?auto_2431137 - SURFACE
      ?auto_2431139 - SURFACE
      ?auto_2431140 - SURFACE
      ?auto_2431141 - SURFACE
      ?auto_2431142 - SURFACE
      ?auto_2431143 - SURFACE
      ?auto_2431144 - SURFACE
    )
    :vars
    (
      ?auto_2431145 - HOIST
      ?auto_2431147 - PLACE
      ?auto_2431146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2431145 ?auto_2431147 ) ( SURFACE-AT ?auto_2431143 ?auto_2431147 ) ( CLEAR ?auto_2431143 ) ( IS-CRATE ?auto_2431144 ) ( not ( = ?auto_2431143 ?auto_2431144 ) ) ( TRUCK-AT ?auto_2431146 ?auto_2431147 ) ( AVAILABLE ?auto_2431145 ) ( IN ?auto_2431144 ?auto_2431146 ) ( ON ?auto_2431143 ?auto_2431142 ) ( not ( = ?auto_2431142 ?auto_2431143 ) ) ( not ( = ?auto_2431142 ?auto_2431144 ) ) ( ON ?auto_2431134 ?auto_2431133 ) ( ON ?auto_2431135 ?auto_2431134 ) ( ON ?auto_2431132 ?auto_2431135 ) ( ON ?auto_2431136 ?auto_2431132 ) ( ON ?auto_2431138 ?auto_2431136 ) ( ON ?auto_2431137 ?auto_2431138 ) ( ON ?auto_2431139 ?auto_2431137 ) ( ON ?auto_2431140 ?auto_2431139 ) ( ON ?auto_2431141 ?auto_2431140 ) ( ON ?auto_2431142 ?auto_2431141 ) ( not ( = ?auto_2431133 ?auto_2431134 ) ) ( not ( = ?auto_2431133 ?auto_2431135 ) ) ( not ( = ?auto_2431133 ?auto_2431132 ) ) ( not ( = ?auto_2431133 ?auto_2431136 ) ) ( not ( = ?auto_2431133 ?auto_2431138 ) ) ( not ( = ?auto_2431133 ?auto_2431137 ) ) ( not ( = ?auto_2431133 ?auto_2431139 ) ) ( not ( = ?auto_2431133 ?auto_2431140 ) ) ( not ( = ?auto_2431133 ?auto_2431141 ) ) ( not ( = ?auto_2431133 ?auto_2431142 ) ) ( not ( = ?auto_2431133 ?auto_2431143 ) ) ( not ( = ?auto_2431133 ?auto_2431144 ) ) ( not ( = ?auto_2431134 ?auto_2431135 ) ) ( not ( = ?auto_2431134 ?auto_2431132 ) ) ( not ( = ?auto_2431134 ?auto_2431136 ) ) ( not ( = ?auto_2431134 ?auto_2431138 ) ) ( not ( = ?auto_2431134 ?auto_2431137 ) ) ( not ( = ?auto_2431134 ?auto_2431139 ) ) ( not ( = ?auto_2431134 ?auto_2431140 ) ) ( not ( = ?auto_2431134 ?auto_2431141 ) ) ( not ( = ?auto_2431134 ?auto_2431142 ) ) ( not ( = ?auto_2431134 ?auto_2431143 ) ) ( not ( = ?auto_2431134 ?auto_2431144 ) ) ( not ( = ?auto_2431135 ?auto_2431132 ) ) ( not ( = ?auto_2431135 ?auto_2431136 ) ) ( not ( = ?auto_2431135 ?auto_2431138 ) ) ( not ( = ?auto_2431135 ?auto_2431137 ) ) ( not ( = ?auto_2431135 ?auto_2431139 ) ) ( not ( = ?auto_2431135 ?auto_2431140 ) ) ( not ( = ?auto_2431135 ?auto_2431141 ) ) ( not ( = ?auto_2431135 ?auto_2431142 ) ) ( not ( = ?auto_2431135 ?auto_2431143 ) ) ( not ( = ?auto_2431135 ?auto_2431144 ) ) ( not ( = ?auto_2431132 ?auto_2431136 ) ) ( not ( = ?auto_2431132 ?auto_2431138 ) ) ( not ( = ?auto_2431132 ?auto_2431137 ) ) ( not ( = ?auto_2431132 ?auto_2431139 ) ) ( not ( = ?auto_2431132 ?auto_2431140 ) ) ( not ( = ?auto_2431132 ?auto_2431141 ) ) ( not ( = ?auto_2431132 ?auto_2431142 ) ) ( not ( = ?auto_2431132 ?auto_2431143 ) ) ( not ( = ?auto_2431132 ?auto_2431144 ) ) ( not ( = ?auto_2431136 ?auto_2431138 ) ) ( not ( = ?auto_2431136 ?auto_2431137 ) ) ( not ( = ?auto_2431136 ?auto_2431139 ) ) ( not ( = ?auto_2431136 ?auto_2431140 ) ) ( not ( = ?auto_2431136 ?auto_2431141 ) ) ( not ( = ?auto_2431136 ?auto_2431142 ) ) ( not ( = ?auto_2431136 ?auto_2431143 ) ) ( not ( = ?auto_2431136 ?auto_2431144 ) ) ( not ( = ?auto_2431138 ?auto_2431137 ) ) ( not ( = ?auto_2431138 ?auto_2431139 ) ) ( not ( = ?auto_2431138 ?auto_2431140 ) ) ( not ( = ?auto_2431138 ?auto_2431141 ) ) ( not ( = ?auto_2431138 ?auto_2431142 ) ) ( not ( = ?auto_2431138 ?auto_2431143 ) ) ( not ( = ?auto_2431138 ?auto_2431144 ) ) ( not ( = ?auto_2431137 ?auto_2431139 ) ) ( not ( = ?auto_2431137 ?auto_2431140 ) ) ( not ( = ?auto_2431137 ?auto_2431141 ) ) ( not ( = ?auto_2431137 ?auto_2431142 ) ) ( not ( = ?auto_2431137 ?auto_2431143 ) ) ( not ( = ?auto_2431137 ?auto_2431144 ) ) ( not ( = ?auto_2431139 ?auto_2431140 ) ) ( not ( = ?auto_2431139 ?auto_2431141 ) ) ( not ( = ?auto_2431139 ?auto_2431142 ) ) ( not ( = ?auto_2431139 ?auto_2431143 ) ) ( not ( = ?auto_2431139 ?auto_2431144 ) ) ( not ( = ?auto_2431140 ?auto_2431141 ) ) ( not ( = ?auto_2431140 ?auto_2431142 ) ) ( not ( = ?auto_2431140 ?auto_2431143 ) ) ( not ( = ?auto_2431140 ?auto_2431144 ) ) ( not ( = ?auto_2431141 ?auto_2431142 ) ) ( not ( = ?auto_2431141 ?auto_2431143 ) ) ( not ( = ?auto_2431141 ?auto_2431144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2431142 ?auto_2431143 ?auto_2431144 )
      ( MAKE-12CRATE-VERIFY ?auto_2431133 ?auto_2431134 ?auto_2431135 ?auto_2431132 ?auto_2431136 ?auto_2431138 ?auto_2431137 ?auto_2431139 ?auto_2431140 ?auto_2431141 ?auto_2431142 ?auto_2431143 ?auto_2431144 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2431271 - SURFACE
      ?auto_2431272 - SURFACE
      ?auto_2431273 - SURFACE
      ?auto_2431270 - SURFACE
      ?auto_2431274 - SURFACE
      ?auto_2431276 - SURFACE
      ?auto_2431275 - SURFACE
      ?auto_2431277 - SURFACE
      ?auto_2431278 - SURFACE
      ?auto_2431279 - SURFACE
      ?auto_2431280 - SURFACE
      ?auto_2431281 - SURFACE
      ?auto_2431282 - SURFACE
    )
    :vars
    (
      ?auto_2431286 - HOIST
      ?auto_2431284 - PLACE
      ?auto_2431283 - TRUCK
      ?auto_2431285 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2431286 ?auto_2431284 ) ( SURFACE-AT ?auto_2431281 ?auto_2431284 ) ( CLEAR ?auto_2431281 ) ( IS-CRATE ?auto_2431282 ) ( not ( = ?auto_2431281 ?auto_2431282 ) ) ( AVAILABLE ?auto_2431286 ) ( IN ?auto_2431282 ?auto_2431283 ) ( ON ?auto_2431281 ?auto_2431280 ) ( not ( = ?auto_2431280 ?auto_2431281 ) ) ( not ( = ?auto_2431280 ?auto_2431282 ) ) ( TRUCK-AT ?auto_2431283 ?auto_2431285 ) ( not ( = ?auto_2431285 ?auto_2431284 ) ) ( ON ?auto_2431272 ?auto_2431271 ) ( ON ?auto_2431273 ?auto_2431272 ) ( ON ?auto_2431270 ?auto_2431273 ) ( ON ?auto_2431274 ?auto_2431270 ) ( ON ?auto_2431276 ?auto_2431274 ) ( ON ?auto_2431275 ?auto_2431276 ) ( ON ?auto_2431277 ?auto_2431275 ) ( ON ?auto_2431278 ?auto_2431277 ) ( ON ?auto_2431279 ?auto_2431278 ) ( ON ?auto_2431280 ?auto_2431279 ) ( not ( = ?auto_2431271 ?auto_2431272 ) ) ( not ( = ?auto_2431271 ?auto_2431273 ) ) ( not ( = ?auto_2431271 ?auto_2431270 ) ) ( not ( = ?auto_2431271 ?auto_2431274 ) ) ( not ( = ?auto_2431271 ?auto_2431276 ) ) ( not ( = ?auto_2431271 ?auto_2431275 ) ) ( not ( = ?auto_2431271 ?auto_2431277 ) ) ( not ( = ?auto_2431271 ?auto_2431278 ) ) ( not ( = ?auto_2431271 ?auto_2431279 ) ) ( not ( = ?auto_2431271 ?auto_2431280 ) ) ( not ( = ?auto_2431271 ?auto_2431281 ) ) ( not ( = ?auto_2431271 ?auto_2431282 ) ) ( not ( = ?auto_2431272 ?auto_2431273 ) ) ( not ( = ?auto_2431272 ?auto_2431270 ) ) ( not ( = ?auto_2431272 ?auto_2431274 ) ) ( not ( = ?auto_2431272 ?auto_2431276 ) ) ( not ( = ?auto_2431272 ?auto_2431275 ) ) ( not ( = ?auto_2431272 ?auto_2431277 ) ) ( not ( = ?auto_2431272 ?auto_2431278 ) ) ( not ( = ?auto_2431272 ?auto_2431279 ) ) ( not ( = ?auto_2431272 ?auto_2431280 ) ) ( not ( = ?auto_2431272 ?auto_2431281 ) ) ( not ( = ?auto_2431272 ?auto_2431282 ) ) ( not ( = ?auto_2431273 ?auto_2431270 ) ) ( not ( = ?auto_2431273 ?auto_2431274 ) ) ( not ( = ?auto_2431273 ?auto_2431276 ) ) ( not ( = ?auto_2431273 ?auto_2431275 ) ) ( not ( = ?auto_2431273 ?auto_2431277 ) ) ( not ( = ?auto_2431273 ?auto_2431278 ) ) ( not ( = ?auto_2431273 ?auto_2431279 ) ) ( not ( = ?auto_2431273 ?auto_2431280 ) ) ( not ( = ?auto_2431273 ?auto_2431281 ) ) ( not ( = ?auto_2431273 ?auto_2431282 ) ) ( not ( = ?auto_2431270 ?auto_2431274 ) ) ( not ( = ?auto_2431270 ?auto_2431276 ) ) ( not ( = ?auto_2431270 ?auto_2431275 ) ) ( not ( = ?auto_2431270 ?auto_2431277 ) ) ( not ( = ?auto_2431270 ?auto_2431278 ) ) ( not ( = ?auto_2431270 ?auto_2431279 ) ) ( not ( = ?auto_2431270 ?auto_2431280 ) ) ( not ( = ?auto_2431270 ?auto_2431281 ) ) ( not ( = ?auto_2431270 ?auto_2431282 ) ) ( not ( = ?auto_2431274 ?auto_2431276 ) ) ( not ( = ?auto_2431274 ?auto_2431275 ) ) ( not ( = ?auto_2431274 ?auto_2431277 ) ) ( not ( = ?auto_2431274 ?auto_2431278 ) ) ( not ( = ?auto_2431274 ?auto_2431279 ) ) ( not ( = ?auto_2431274 ?auto_2431280 ) ) ( not ( = ?auto_2431274 ?auto_2431281 ) ) ( not ( = ?auto_2431274 ?auto_2431282 ) ) ( not ( = ?auto_2431276 ?auto_2431275 ) ) ( not ( = ?auto_2431276 ?auto_2431277 ) ) ( not ( = ?auto_2431276 ?auto_2431278 ) ) ( not ( = ?auto_2431276 ?auto_2431279 ) ) ( not ( = ?auto_2431276 ?auto_2431280 ) ) ( not ( = ?auto_2431276 ?auto_2431281 ) ) ( not ( = ?auto_2431276 ?auto_2431282 ) ) ( not ( = ?auto_2431275 ?auto_2431277 ) ) ( not ( = ?auto_2431275 ?auto_2431278 ) ) ( not ( = ?auto_2431275 ?auto_2431279 ) ) ( not ( = ?auto_2431275 ?auto_2431280 ) ) ( not ( = ?auto_2431275 ?auto_2431281 ) ) ( not ( = ?auto_2431275 ?auto_2431282 ) ) ( not ( = ?auto_2431277 ?auto_2431278 ) ) ( not ( = ?auto_2431277 ?auto_2431279 ) ) ( not ( = ?auto_2431277 ?auto_2431280 ) ) ( not ( = ?auto_2431277 ?auto_2431281 ) ) ( not ( = ?auto_2431277 ?auto_2431282 ) ) ( not ( = ?auto_2431278 ?auto_2431279 ) ) ( not ( = ?auto_2431278 ?auto_2431280 ) ) ( not ( = ?auto_2431278 ?auto_2431281 ) ) ( not ( = ?auto_2431278 ?auto_2431282 ) ) ( not ( = ?auto_2431279 ?auto_2431280 ) ) ( not ( = ?auto_2431279 ?auto_2431281 ) ) ( not ( = ?auto_2431279 ?auto_2431282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2431280 ?auto_2431281 ?auto_2431282 )
      ( MAKE-12CRATE-VERIFY ?auto_2431271 ?auto_2431272 ?auto_2431273 ?auto_2431270 ?auto_2431274 ?auto_2431276 ?auto_2431275 ?auto_2431277 ?auto_2431278 ?auto_2431279 ?auto_2431280 ?auto_2431281 ?auto_2431282 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2431421 - SURFACE
      ?auto_2431422 - SURFACE
      ?auto_2431423 - SURFACE
      ?auto_2431420 - SURFACE
      ?auto_2431424 - SURFACE
      ?auto_2431426 - SURFACE
      ?auto_2431425 - SURFACE
      ?auto_2431427 - SURFACE
      ?auto_2431428 - SURFACE
      ?auto_2431429 - SURFACE
      ?auto_2431430 - SURFACE
      ?auto_2431431 - SURFACE
      ?auto_2431432 - SURFACE
    )
    :vars
    (
      ?auto_2431433 - HOIST
      ?auto_2431434 - PLACE
      ?auto_2431437 - TRUCK
      ?auto_2431436 - PLACE
      ?auto_2431435 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2431433 ?auto_2431434 ) ( SURFACE-AT ?auto_2431431 ?auto_2431434 ) ( CLEAR ?auto_2431431 ) ( IS-CRATE ?auto_2431432 ) ( not ( = ?auto_2431431 ?auto_2431432 ) ) ( AVAILABLE ?auto_2431433 ) ( ON ?auto_2431431 ?auto_2431430 ) ( not ( = ?auto_2431430 ?auto_2431431 ) ) ( not ( = ?auto_2431430 ?auto_2431432 ) ) ( TRUCK-AT ?auto_2431437 ?auto_2431436 ) ( not ( = ?auto_2431436 ?auto_2431434 ) ) ( HOIST-AT ?auto_2431435 ?auto_2431436 ) ( LIFTING ?auto_2431435 ?auto_2431432 ) ( not ( = ?auto_2431433 ?auto_2431435 ) ) ( ON ?auto_2431422 ?auto_2431421 ) ( ON ?auto_2431423 ?auto_2431422 ) ( ON ?auto_2431420 ?auto_2431423 ) ( ON ?auto_2431424 ?auto_2431420 ) ( ON ?auto_2431426 ?auto_2431424 ) ( ON ?auto_2431425 ?auto_2431426 ) ( ON ?auto_2431427 ?auto_2431425 ) ( ON ?auto_2431428 ?auto_2431427 ) ( ON ?auto_2431429 ?auto_2431428 ) ( ON ?auto_2431430 ?auto_2431429 ) ( not ( = ?auto_2431421 ?auto_2431422 ) ) ( not ( = ?auto_2431421 ?auto_2431423 ) ) ( not ( = ?auto_2431421 ?auto_2431420 ) ) ( not ( = ?auto_2431421 ?auto_2431424 ) ) ( not ( = ?auto_2431421 ?auto_2431426 ) ) ( not ( = ?auto_2431421 ?auto_2431425 ) ) ( not ( = ?auto_2431421 ?auto_2431427 ) ) ( not ( = ?auto_2431421 ?auto_2431428 ) ) ( not ( = ?auto_2431421 ?auto_2431429 ) ) ( not ( = ?auto_2431421 ?auto_2431430 ) ) ( not ( = ?auto_2431421 ?auto_2431431 ) ) ( not ( = ?auto_2431421 ?auto_2431432 ) ) ( not ( = ?auto_2431422 ?auto_2431423 ) ) ( not ( = ?auto_2431422 ?auto_2431420 ) ) ( not ( = ?auto_2431422 ?auto_2431424 ) ) ( not ( = ?auto_2431422 ?auto_2431426 ) ) ( not ( = ?auto_2431422 ?auto_2431425 ) ) ( not ( = ?auto_2431422 ?auto_2431427 ) ) ( not ( = ?auto_2431422 ?auto_2431428 ) ) ( not ( = ?auto_2431422 ?auto_2431429 ) ) ( not ( = ?auto_2431422 ?auto_2431430 ) ) ( not ( = ?auto_2431422 ?auto_2431431 ) ) ( not ( = ?auto_2431422 ?auto_2431432 ) ) ( not ( = ?auto_2431423 ?auto_2431420 ) ) ( not ( = ?auto_2431423 ?auto_2431424 ) ) ( not ( = ?auto_2431423 ?auto_2431426 ) ) ( not ( = ?auto_2431423 ?auto_2431425 ) ) ( not ( = ?auto_2431423 ?auto_2431427 ) ) ( not ( = ?auto_2431423 ?auto_2431428 ) ) ( not ( = ?auto_2431423 ?auto_2431429 ) ) ( not ( = ?auto_2431423 ?auto_2431430 ) ) ( not ( = ?auto_2431423 ?auto_2431431 ) ) ( not ( = ?auto_2431423 ?auto_2431432 ) ) ( not ( = ?auto_2431420 ?auto_2431424 ) ) ( not ( = ?auto_2431420 ?auto_2431426 ) ) ( not ( = ?auto_2431420 ?auto_2431425 ) ) ( not ( = ?auto_2431420 ?auto_2431427 ) ) ( not ( = ?auto_2431420 ?auto_2431428 ) ) ( not ( = ?auto_2431420 ?auto_2431429 ) ) ( not ( = ?auto_2431420 ?auto_2431430 ) ) ( not ( = ?auto_2431420 ?auto_2431431 ) ) ( not ( = ?auto_2431420 ?auto_2431432 ) ) ( not ( = ?auto_2431424 ?auto_2431426 ) ) ( not ( = ?auto_2431424 ?auto_2431425 ) ) ( not ( = ?auto_2431424 ?auto_2431427 ) ) ( not ( = ?auto_2431424 ?auto_2431428 ) ) ( not ( = ?auto_2431424 ?auto_2431429 ) ) ( not ( = ?auto_2431424 ?auto_2431430 ) ) ( not ( = ?auto_2431424 ?auto_2431431 ) ) ( not ( = ?auto_2431424 ?auto_2431432 ) ) ( not ( = ?auto_2431426 ?auto_2431425 ) ) ( not ( = ?auto_2431426 ?auto_2431427 ) ) ( not ( = ?auto_2431426 ?auto_2431428 ) ) ( not ( = ?auto_2431426 ?auto_2431429 ) ) ( not ( = ?auto_2431426 ?auto_2431430 ) ) ( not ( = ?auto_2431426 ?auto_2431431 ) ) ( not ( = ?auto_2431426 ?auto_2431432 ) ) ( not ( = ?auto_2431425 ?auto_2431427 ) ) ( not ( = ?auto_2431425 ?auto_2431428 ) ) ( not ( = ?auto_2431425 ?auto_2431429 ) ) ( not ( = ?auto_2431425 ?auto_2431430 ) ) ( not ( = ?auto_2431425 ?auto_2431431 ) ) ( not ( = ?auto_2431425 ?auto_2431432 ) ) ( not ( = ?auto_2431427 ?auto_2431428 ) ) ( not ( = ?auto_2431427 ?auto_2431429 ) ) ( not ( = ?auto_2431427 ?auto_2431430 ) ) ( not ( = ?auto_2431427 ?auto_2431431 ) ) ( not ( = ?auto_2431427 ?auto_2431432 ) ) ( not ( = ?auto_2431428 ?auto_2431429 ) ) ( not ( = ?auto_2431428 ?auto_2431430 ) ) ( not ( = ?auto_2431428 ?auto_2431431 ) ) ( not ( = ?auto_2431428 ?auto_2431432 ) ) ( not ( = ?auto_2431429 ?auto_2431430 ) ) ( not ( = ?auto_2431429 ?auto_2431431 ) ) ( not ( = ?auto_2431429 ?auto_2431432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2431430 ?auto_2431431 ?auto_2431432 )
      ( MAKE-12CRATE-VERIFY ?auto_2431421 ?auto_2431422 ?auto_2431423 ?auto_2431420 ?auto_2431424 ?auto_2431426 ?auto_2431425 ?auto_2431427 ?auto_2431428 ?auto_2431429 ?auto_2431430 ?auto_2431431 ?auto_2431432 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2431583 - SURFACE
      ?auto_2431584 - SURFACE
      ?auto_2431585 - SURFACE
      ?auto_2431582 - SURFACE
      ?auto_2431586 - SURFACE
      ?auto_2431588 - SURFACE
      ?auto_2431587 - SURFACE
      ?auto_2431589 - SURFACE
      ?auto_2431590 - SURFACE
      ?auto_2431591 - SURFACE
      ?auto_2431592 - SURFACE
      ?auto_2431593 - SURFACE
      ?auto_2431594 - SURFACE
    )
    :vars
    (
      ?auto_2431595 - HOIST
      ?auto_2431599 - PLACE
      ?auto_2431596 - TRUCK
      ?auto_2431600 - PLACE
      ?auto_2431598 - HOIST
      ?auto_2431597 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2431595 ?auto_2431599 ) ( SURFACE-AT ?auto_2431593 ?auto_2431599 ) ( CLEAR ?auto_2431593 ) ( IS-CRATE ?auto_2431594 ) ( not ( = ?auto_2431593 ?auto_2431594 ) ) ( AVAILABLE ?auto_2431595 ) ( ON ?auto_2431593 ?auto_2431592 ) ( not ( = ?auto_2431592 ?auto_2431593 ) ) ( not ( = ?auto_2431592 ?auto_2431594 ) ) ( TRUCK-AT ?auto_2431596 ?auto_2431600 ) ( not ( = ?auto_2431600 ?auto_2431599 ) ) ( HOIST-AT ?auto_2431598 ?auto_2431600 ) ( not ( = ?auto_2431595 ?auto_2431598 ) ) ( AVAILABLE ?auto_2431598 ) ( SURFACE-AT ?auto_2431594 ?auto_2431600 ) ( ON ?auto_2431594 ?auto_2431597 ) ( CLEAR ?auto_2431594 ) ( not ( = ?auto_2431593 ?auto_2431597 ) ) ( not ( = ?auto_2431594 ?auto_2431597 ) ) ( not ( = ?auto_2431592 ?auto_2431597 ) ) ( ON ?auto_2431584 ?auto_2431583 ) ( ON ?auto_2431585 ?auto_2431584 ) ( ON ?auto_2431582 ?auto_2431585 ) ( ON ?auto_2431586 ?auto_2431582 ) ( ON ?auto_2431588 ?auto_2431586 ) ( ON ?auto_2431587 ?auto_2431588 ) ( ON ?auto_2431589 ?auto_2431587 ) ( ON ?auto_2431590 ?auto_2431589 ) ( ON ?auto_2431591 ?auto_2431590 ) ( ON ?auto_2431592 ?auto_2431591 ) ( not ( = ?auto_2431583 ?auto_2431584 ) ) ( not ( = ?auto_2431583 ?auto_2431585 ) ) ( not ( = ?auto_2431583 ?auto_2431582 ) ) ( not ( = ?auto_2431583 ?auto_2431586 ) ) ( not ( = ?auto_2431583 ?auto_2431588 ) ) ( not ( = ?auto_2431583 ?auto_2431587 ) ) ( not ( = ?auto_2431583 ?auto_2431589 ) ) ( not ( = ?auto_2431583 ?auto_2431590 ) ) ( not ( = ?auto_2431583 ?auto_2431591 ) ) ( not ( = ?auto_2431583 ?auto_2431592 ) ) ( not ( = ?auto_2431583 ?auto_2431593 ) ) ( not ( = ?auto_2431583 ?auto_2431594 ) ) ( not ( = ?auto_2431583 ?auto_2431597 ) ) ( not ( = ?auto_2431584 ?auto_2431585 ) ) ( not ( = ?auto_2431584 ?auto_2431582 ) ) ( not ( = ?auto_2431584 ?auto_2431586 ) ) ( not ( = ?auto_2431584 ?auto_2431588 ) ) ( not ( = ?auto_2431584 ?auto_2431587 ) ) ( not ( = ?auto_2431584 ?auto_2431589 ) ) ( not ( = ?auto_2431584 ?auto_2431590 ) ) ( not ( = ?auto_2431584 ?auto_2431591 ) ) ( not ( = ?auto_2431584 ?auto_2431592 ) ) ( not ( = ?auto_2431584 ?auto_2431593 ) ) ( not ( = ?auto_2431584 ?auto_2431594 ) ) ( not ( = ?auto_2431584 ?auto_2431597 ) ) ( not ( = ?auto_2431585 ?auto_2431582 ) ) ( not ( = ?auto_2431585 ?auto_2431586 ) ) ( not ( = ?auto_2431585 ?auto_2431588 ) ) ( not ( = ?auto_2431585 ?auto_2431587 ) ) ( not ( = ?auto_2431585 ?auto_2431589 ) ) ( not ( = ?auto_2431585 ?auto_2431590 ) ) ( not ( = ?auto_2431585 ?auto_2431591 ) ) ( not ( = ?auto_2431585 ?auto_2431592 ) ) ( not ( = ?auto_2431585 ?auto_2431593 ) ) ( not ( = ?auto_2431585 ?auto_2431594 ) ) ( not ( = ?auto_2431585 ?auto_2431597 ) ) ( not ( = ?auto_2431582 ?auto_2431586 ) ) ( not ( = ?auto_2431582 ?auto_2431588 ) ) ( not ( = ?auto_2431582 ?auto_2431587 ) ) ( not ( = ?auto_2431582 ?auto_2431589 ) ) ( not ( = ?auto_2431582 ?auto_2431590 ) ) ( not ( = ?auto_2431582 ?auto_2431591 ) ) ( not ( = ?auto_2431582 ?auto_2431592 ) ) ( not ( = ?auto_2431582 ?auto_2431593 ) ) ( not ( = ?auto_2431582 ?auto_2431594 ) ) ( not ( = ?auto_2431582 ?auto_2431597 ) ) ( not ( = ?auto_2431586 ?auto_2431588 ) ) ( not ( = ?auto_2431586 ?auto_2431587 ) ) ( not ( = ?auto_2431586 ?auto_2431589 ) ) ( not ( = ?auto_2431586 ?auto_2431590 ) ) ( not ( = ?auto_2431586 ?auto_2431591 ) ) ( not ( = ?auto_2431586 ?auto_2431592 ) ) ( not ( = ?auto_2431586 ?auto_2431593 ) ) ( not ( = ?auto_2431586 ?auto_2431594 ) ) ( not ( = ?auto_2431586 ?auto_2431597 ) ) ( not ( = ?auto_2431588 ?auto_2431587 ) ) ( not ( = ?auto_2431588 ?auto_2431589 ) ) ( not ( = ?auto_2431588 ?auto_2431590 ) ) ( not ( = ?auto_2431588 ?auto_2431591 ) ) ( not ( = ?auto_2431588 ?auto_2431592 ) ) ( not ( = ?auto_2431588 ?auto_2431593 ) ) ( not ( = ?auto_2431588 ?auto_2431594 ) ) ( not ( = ?auto_2431588 ?auto_2431597 ) ) ( not ( = ?auto_2431587 ?auto_2431589 ) ) ( not ( = ?auto_2431587 ?auto_2431590 ) ) ( not ( = ?auto_2431587 ?auto_2431591 ) ) ( not ( = ?auto_2431587 ?auto_2431592 ) ) ( not ( = ?auto_2431587 ?auto_2431593 ) ) ( not ( = ?auto_2431587 ?auto_2431594 ) ) ( not ( = ?auto_2431587 ?auto_2431597 ) ) ( not ( = ?auto_2431589 ?auto_2431590 ) ) ( not ( = ?auto_2431589 ?auto_2431591 ) ) ( not ( = ?auto_2431589 ?auto_2431592 ) ) ( not ( = ?auto_2431589 ?auto_2431593 ) ) ( not ( = ?auto_2431589 ?auto_2431594 ) ) ( not ( = ?auto_2431589 ?auto_2431597 ) ) ( not ( = ?auto_2431590 ?auto_2431591 ) ) ( not ( = ?auto_2431590 ?auto_2431592 ) ) ( not ( = ?auto_2431590 ?auto_2431593 ) ) ( not ( = ?auto_2431590 ?auto_2431594 ) ) ( not ( = ?auto_2431590 ?auto_2431597 ) ) ( not ( = ?auto_2431591 ?auto_2431592 ) ) ( not ( = ?auto_2431591 ?auto_2431593 ) ) ( not ( = ?auto_2431591 ?auto_2431594 ) ) ( not ( = ?auto_2431591 ?auto_2431597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2431592 ?auto_2431593 ?auto_2431594 )
      ( MAKE-12CRATE-VERIFY ?auto_2431583 ?auto_2431584 ?auto_2431585 ?auto_2431582 ?auto_2431586 ?auto_2431588 ?auto_2431587 ?auto_2431589 ?auto_2431590 ?auto_2431591 ?auto_2431592 ?auto_2431593 ?auto_2431594 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2431746 - SURFACE
      ?auto_2431747 - SURFACE
      ?auto_2431748 - SURFACE
      ?auto_2431745 - SURFACE
      ?auto_2431749 - SURFACE
      ?auto_2431751 - SURFACE
      ?auto_2431750 - SURFACE
      ?auto_2431752 - SURFACE
      ?auto_2431753 - SURFACE
      ?auto_2431754 - SURFACE
      ?auto_2431755 - SURFACE
      ?auto_2431756 - SURFACE
      ?auto_2431757 - SURFACE
    )
    :vars
    (
      ?auto_2431762 - HOIST
      ?auto_2431761 - PLACE
      ?auto_2431760 - PLACE
      ?auto_2431763 - HOIST
      ?auto_2431759 - SURFACE
      ?auto_2431758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2431762 ?auto_2431761 ) ( SURFACE-AT ?auto_2431756 ?auto_2431761 ) ( CLEAR ?auto_2431756 ) ( IS-CRATE ?auto_2431757 ) ( not ( = ?auto_2431756 ?auto_2431757 ) ) ( AVAILABLE ?auto_2431762 ) ( ON ?auto_2431756 ?auto_2431755 ) ( not ( = ?auto_2431755 ?auto_2431756 ) ) ( not ( = ?auto_2431755 ?auto_2431757 ) ) ( not ( = ?auto_2431760 ?auto_2431761 ) ) ( HOIST-AT ?auto_2431763 ?auto_2431760 ) ( not ( = ?auto_2431762 ?auto_2431763 ) ) ( AVAILABLE ?auto_2431763 ) ( SURFACE-AT ?auto_2431757 ?auto_2431760 ) ( ON ?auto_2431757 ?auto_2431759 ) ( CLEAR ?auto_2431757 ) ( not ( = ?auto_2431756 ?auto_2431759 ) ) ( not ( = ?auto_2431757 ?auto_2431759 ) ) ( not ( = ?auto_2431755 ?auto_2431759 ) ) ( TRUCK-AT ?auto_2431758 ?auto_2431761 ) ( ON ?auto_2431747 ?auto_2431746 ) ( ON ?auto_2431748 ?auto_2431747 ) ( ON ?auto_2431745 ?auto_2431748 ) ( ON ?auto_2431749 ?auto_2431745 ) ( ON ?auto_2431751 ?auto_2431749 ) ( ON ?auto_2431750 ?auto_2431751 ) ( ON ?auto_2431752 ?auto_2431750 ) ( ON ?auto_2431753 ?auto_2431752 ) ( ON ?auto_2431754 ?auto_2431753 ) ( ON ?auto_2431755 ?auto_2431754 ) ( not ( = ?auto_2431746 ?auto_2431747 ) ) ( not ( = ?auto_2431746 ?auto_2431748 ) ) ( not ( = ?auto_2431746 ?auto_2431745 ) ) ( not ( = ?auto_2431746 ?auto_2431749 ) ) ( not ( = ?auto_2431746 ?auto_2431751 ) ) ( not ( = ?auto_2431746 ?auto_2431750 ) ) ( not ( = ?auto_2431746 ?auto_2431752 ) ) ( not ( = ?auto_2431746 ?auto_2431753 ) ) ( not ( = ?auto_2431746 ?auto_2431754 ) ) ( not ( = ?auto_2431746 ?auto_2431755 ) ) ( not ( = ?auto_2431746 ?auto_2431756 ) ) ( not ( = ?auto_2431746 ?auto_2431757 ) ) ( not ( = ?auto_2431746 ?auto_2431759 ) ) ( not ( = ?auto_2431747 ?auto_2431748 ) ) ( not ( = ?auto_2431747 ?auto_2431745 ) ) ( not ( = ?auto_2431747 ?auto_2431749 ) ) ( not ( = ?auto_2431747 ?auto_2431751 ) ) ( not ( = ?auto_2431747 ?auto_2431750 ) ) ( not ( = ?auto_2431747 ?auto_2431752 ) ) ( not ( = ?auto_2431747 ?auto_2431753 ) ) ( not ( = ?auto_2431747 ?auto_2431754 ) ) ( not ( = ?auto_2431747 ?auto_2431755 ) ) ( not ( = ?auto_2431747 ?auto_2431756 ) ) ( not ( = ?auto_2431747 ?auto_2431757 ) ) ( not ( = ?auto_2431747 ?auto_2431759 ) ) ( not ( = ?auto_2431748 ?auto_2431745 ) ) ( not ( = ?auto_2431748 ?auto_2431749 ) ) ( not ( = ?auto_2431748 ?auto_2431751 ) ) ( not ( = ?auto_2431748 ?auto_2431750 ) ) ( not ( = ?auto_2431748 ?auto_2431752 ) ) ( not ( = ?auto_2431748 ?auto_2431753 ) ) ( not ( = ?auto_2431748 ?auto_2431754 ) ) ( not ( = ?auto_2431748 ?auto_2431755 ) ) ( not ( = ?auto_2431748 ?auto_2431756 ) ) ( not ( = ?auto_2431748 ?auto_2431757 ) ) ( not ( = ?auto_2431748 ?auto_2431759 ) ) ( not ( = ?auto_2431745 ?auto_2431749 ) ) ( not ( = ?auto_2431745 ?auto_2431751 ) ) ( not ( = ?auto_2431745 ?auto_2431750 ) ) ( not ( = ?auto_2431745 ?auto_2431752 ) ) ( not ( = ?auto_2431745 ?auto_2431753 ) ) ( not ( = ?auto_2431745 ?auto_2431754 ) ) ( not ( = ?auto_2431745 ?auto_2431755 ) ) ( not ( = ?auto_2431745 ?auto_2431756 ) ) ( not ( = ?auto_2431745 ?auto_2431757 ) ) ( not ( = ?auto_2431745 ?auto_2431759 ) ) ( not ( = ?auto_2431749 ?auto_2431751 ) ) ( not ( = ?auto_2431749 ?auto_2431750 ) ) ( not ( = ?auto_2431749 ?auto_2431752 ) ) ( not ( = ?auto_2431749 ?auto_2431753 ) ) ( not ( = ?auto_2431749 ?auto_2431754 ) ) ( not ( = ?auto_2431749 ?auto_2431755 ) ) ( not ( = ?auto_2431749 ?auto_2431756 ) ) ( not ( = ?auto_2431749 ?auto_2431757 ) ) ( not ( = ?auto_2431749 ?auto_2431759 ) ) ( not ( = ?auto_2431751 ?auto_2431750 ) ) ( not ( = ?auto_2431751 ?auto_2431752 ) ) ( not ( = ?auto_2431751 ?auto_2431753 ) ) ( not ( = ?auto_2431751 ?auto_2431754 ) ) ( not ( = ?auto_2431751 ?auto_2431755 ) ) ( not ( = ?auto_2431751 ?auto_2431756 ) ) ( not ( = ?auto_2431751 ?auto_2431757 ) ) ( not ( = ?auto_2431751 ?auto_2431759 ) ) ( not ( = ?auto_2431750 ?auto_2431752 ) ) ( not ( = ?auto_2431750 ?auto_2431753 ) ) ( not ( = ?auto_2431750 ?auto_2431754 ) ) ( not ( = ?auto_2431750 ?auto_2431755 ) ) ( not ( = ?auto_2431750 ?auto_2431756 ) ) ( not ( = ?auto_2431750 ?auto_2431757 ) ) ( not ( = ?auto_2431750 ?auto_2431759 ) ) ( not ( = ?auto_2431752 ?auto_2431753 ) ) ( not ( = ?auto_2431752 ?auto_2431754 ) ) ( not ( = ?auto_2431752 ?auto_2431755 ) ) ( not ( = ?auto_2431752 ?auto_2431756 ) ) ( not ( = ?auto_2431752 ?auto_2431757 ) ) ( not ( = ?auto_2431752 ?auto_2431759 ) ) ( not ( = ?auto_2431753 ?auto_2431754 ) ) ( not ( = ?auto_2431753 ?auto_2431755 ) ) ( not ( = ?auto_2431753 ?auto_2431756 ) ) ( not ( = ?auto_2431753 ?auto_2431757 ) ) ( not ( = ?auto_2431753 ?auto_2431759 ) ) ( not ( = ?auto_2431754 ?auto_2431755 ) ) ( not ( = ?auto_2431754 ?auto_2431756 ) ) ( not ( = ?auto_2431754 ?auto_2431757 ) ) ( not ( = ?auto_2431754 ?auto_2431759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2431755 ?auto_2431756 ?auto_2431757 )
      ( MAKE-12CRATE-VERIFY ?auto_2431746 ?auto_2431747 ?auto_2431748 ?auto_2431745 ?auto_2431749 ?auto_2431751 ?auto_2431750 ?auto_2431752 ?auto_2431753 ?auto_2431754 ?auto_2431755 ?auto_2431756 ?auto_2431757 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2431909 - SURFACE
      ?auto_2431910 - SURFACE
      ?auto_2431911 - SURFACE
      ?auto_2431908 - SURFACE
      ?auto_2431912 - SURFACE
      ?auto_2431914 - SURFACE
      ?auto_2431913 - SURFACE
      ?auto_2431915 - SURFACE
      ?auto_2431916 - SURFACE
      ?auto_2431917 - SURFACE
      ?auto_2431918 - SURFACE
      ?auto_2431919 - SURFACE
      ?auto_2431920 - SURFACE
    )
    :vars
    (
      ?auto_2431924 - HOIST
      ?auto_2431921 - PLACE
      ?auto_2431925 - PLACE
      ?auto_2431922 - HOIST
      ?auto_2431926 - SURFACE
      ?auto_2431923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2431924 ?auto_2431921 ) ( IS-CRATE ?auto_2431920 ) ( not ( = ?auto_2431919 ?auto_2431920 ) ) ( not ( = ?auto_2431918 ?auto_2431919 ) ) ( not ( = ?auto_2431918 ?auto_2431920 ) ) ( not ( = ?auto_2431925 ?auto_2431921 ) ) ( HOIST-AT ?auto_2431922 ?auto_2431925 ) ( not ( = ?auto_2431924 ?auto_2431922 ) ) ( AVAILABLE ?auto_2431922 ) ( SURFACE-AT ?auto_2431920 ?auto_2431925 ) ( ON ?auto_2431920 ?auto_2431926 ) ( CLEAR ?auto_2431920 ) ( not ( = ?auto_2431919 ?auto_2431926 ) ) ( not ( = ?auto_2431920 ?auto_2431926 ) ) ( not ( = ?auto_2431918 ?auto_2431926 ) ) ( TRUCK-AT ?auto_2431923 ?auto_2431921 ) ( SURFACE-AT ?auto_2431918 ?auto_2431921 ) ( CLEAR ?auto_2431918 ) ( LIFTING ?auto_2431924 ?auto_2431919 ) ( IS-CRATE ?auto_2431919 ) ( ON ?auto_2431910 ?auto_2431909 ) ( ON ?auto_2431911 ?auto_2431910 ) ( ON ?auto_2431908 ?auto_2431911 ) ( ON ?auto_2431912 ?auto_2431908 ) ( ON ?auto_2431914 ?auto_2431912 ) ( ON ?auto_2431913 ?auto_2431914 ) ( ON ?auto_2431915 ?auto_2431913 ) ( ON ?auto_2431916 ?auto_2431915 ) ( ON ?auto_2431917 ?auto_2431916 ) ( ON ?auto_2431918 ?auto_2431917 ) ( not ( = ?auto_2431909 ?auto_2431910 ) ) ( not ( = ?auto_2431909 ?auto_2431911 ) ) ( not ( = ?auto_2431909 ?auto_2431908 ) ) ( not ( = ?auto_2431909 ?auto_2431912 ) ) ( not ( = ?auto_2431909 ?auto_2431914 ) ) ( not ( = ?auto_2431909 ?auto_2431913 ) ) ( not ( = ?auto_2431909 ?auto_2431915 ) ) ( not ( = ?auto_2431909 ?auto_2431916 ) ) ( not ( = ?auto_2431909 ?auto_2431917 ) ) ( not ( = ?auto_2431909 ?auto_2431918 ) ) ( not ( = ?auto_2431909 ?auto_2431919 ) ) ( not ( = ?auto_2431909 ?auto_2431920 ) ) ( not ( = ?auto_2431909 ?auto_2431926 ) ) ( not ( = ?auto_2431910 ?auto_2431911 ) ) ( not ( = ?auto_2431910 ?auto_2431908 ) ) ( not ( = ?auto_2431910 ?auto_2431912 ) ) ( not ( = ?auto_2431910 ?auto_2431914 ) ) ( not ( = ?auto_2431910 ?auto_2431913 ) ) ( not ( = ?auto_2431910 ?auto_2431915 ) ) ( not ( = ?auto_2431910 ?auto_2431916 ) ) ( not ( = ?auto_2431910 ?auto_2431917 ) ) ( not ( = ?auto_2431910 ?auto_2431918 ) ) ( not ( = ?auto_2431910 ?auto_2431919 ) ) ( not ( = ?auto_2431910 ?auto_2431920 ) ) ( not ( = ?auto_2431910 ?auto_2431926 ) ) ( not ( = ?auto_2431911 ?auto_2431908 ) ) ( not ( = ?auto_2431911 ?auto_2431912 ) ) ( not ( = ?auto_2431911 ?auto_2431914 ) ) ( not ( = ?auto_2431911 ?auto_2431913 ) ) ( not ( = ?auto_2431911 ?auto_2431915 ) ) ( not ( = ?auto_2431911 ?auto_2431916 ) ) ( not ( = ?auto_2431911 ?auto_2431917 ) ) ( not ( = ?auto_2431911 ?auto_2431918 ) ) ( not ( = ?auto_2431911 ?auto_2431919 ) ) ( not ( = ?auto_2431911 ?auto_2431920 ) ) ( not ( = ?auto_2431911 ?auto_2431926 ) ) ( not ( = ?auto_2431908 ?auto_2431912 ) ) ( not ( = ?auto_2431908 ?auto_2431914 ) ) ( not ( = ?auto_2431908 ?auto_2431913 ) ) ( not ( = ?auto_2431908 ?auto_2431915 ) ) ( not ( = ?auto_2431908 ?auto_2431916 ) ) ( not ( = ?auto_2431908 ?auto_2431917 ) ) ( not ( = ?auto_2431908 ?auto_2431918 ) ) ( not ( = ?auto_2431908 ?auto_2431919 ) ) ( not ( = ?auto_2431908 ?auto_2431920 ) ) ( not ( = ?auto_2431908 ?auto_2431926 ) ) ( not ( = ?auto_2431912 ?auto_2431914 ) ) ( not ( = ?auto_2431912 ?auto_2431913 ) ) ( not ( = ?auto_2431912 ?auto_2431915 ) ) ( not ( = ?auto_2431912 ?auto_2431916 ) ) ( not ( = ?auto_2431912 ?auto_2431917 ) ) ( not ( = ?auto_2431912 ?auto_2431918 ) ) ( not ( = ?auto_2431912 ?auto_2431919 ) ) ( not ( = ?auto_2431912 ?auto_2431920 ) ) ( not ( = ?auto_2431912 ?auto_2431926 ) ) ( not ( = ?auto_2431914 ?auto_2431913 ) ) ( not ( = ?auto_2431914 ?auto_2431915 ) ) ( not ( = ?auto_2431914 ?auto_2431916 ) ) ( not ( = ?auto_2431914 ?auto_2431917 ) ) ( not ( = ?auto_2431914 ?auto_2431918 ) ) ( not ( = ?auto_2431914 ?auto_2431919 ) ) ( not ( = ?auto_2431914 ?auto_2431920 ) ) ( not ( = ?auto_2431914 ?auto_2431926 ) ) ( not ( = ?auto_2431913 ?auto_2431915 ) ) ( not ( = ?auto_2431913 ?auto_2431916 ) ) ( not ( = ?auto_2431913 ?auto_2431917 ) ) ( not ( = ?auto_2431913 ?auto_2431918 ) ) ( not ( = ?auto_2431913 ?auto_2431919 ) ) ( not ( = ?auto_2431913 ?auto_2431920 ) ) ( not ( = ?auto_2431913 ?auto_2431926 ) ) ( not ( = ?auto_2431915 ?auto_2431916 ) ) ( not ( = ?auto_2431915 ?auto_2431917 ) ) ( not ( = ?auto_2431915 ?auto_2431918 ) ) ( not ( = ?auto_2431915 ?auto_2431919 ) ) ( not ( = ?auto_2431915 ?auto_2431920 ) ) ( not ( = ?auto_2431915 ?auto_2431926 ) ) ( not ( = ?auto_2431916 ?auto_2431917 ) ) ( not ( = ?auto_2431916 ?auto_2431918 ) ) ( not ( = ?auto_2431916 ?auto_2431919 ) ) ( not ( = ?auto_2431916 ?auto_2431920 ) ) ( not ( = ?auto_2431916 ?auto_2431926 ) ) ( not ( = ?auto_2431917 ?auto_2431918 ) ) ( not ( = ?auto_2431917 ?auto_2431919 ) ) ( not ( = ?auto_2431917 ?auto_2431920 ) ) ( not ( = ?auto_2431917 ?auto_2431926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2431918 ?auto_2431919 ?auto_2431920 )
      ( MAKE-12CRATE-VERIFY ?auto_2431909 ?auto_2431910 ?auto_2431911 ?auto_2431908 ?auto_2431912 ?auto_2431914 ?auto_2431913 ?auto_2431915 ?auto_2431916 ?auto_2431917 ?auto_2431918 ?auto_2431919 ?auto_2431920 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2432072 - SURFACE
      ?auto_2432073 - SURFACE
      ?auto_2432074 - SURFACE
      ?auto_2432071 - SURFACE
      ?auto_2432075 - SURFACE
      ?auto_2432077 - SURFACE
      ?auto_2432076 - SURFACE
      ?auto_2432078 - SURFACE
      ?auto_2432079 - SURFACE
      ?auto_2432080 - SURFACE
      ?auto_2432081 - SURFACE
      ?auto_2432082 - SURFACE
      ?auto_2432083 - SURFACE
    )
    :vars
    (
      ?auto_2432084 - HOIST
      ?auto_2432089 - PLACE
      ?auto_2432086 - PLACE
      ?auto_2432085 - HOIST
      ?auto_2432088 - SURFACE
      ?auto_2432087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2432084 ?auto_2432089 ) ( IS-CRATE ?auto_2432083 ) ( not ( = ?auto_2432082 ?auto_2432083 ) ) ( not ( = ?auto_2432081 ?auto_2432082 ) ) ( not ( = ?auto_2432081 ?auto_2432083 ) ) ( not ( = ?auto_2432086 ?auto_2432089 ) ) ( HOIST-AT ?auto_2432085 ?auto_2432086 ) ( not ( = ?auto_2432084 ?auto_2432085 ) ) ( AVAILABLE ?auto_2432085 ) ( SURFACE-AT ?auto_2432083 ?auto_2432086 ) ( ON ?auto_2432083 ?auto_2432088 ) ( CLEAR ?auto_2432083 ) ( not ( = ?auto_2432082 ?auto_2432088 ) ) ( not ( = ?auto_2432083 ?auto_2432088 ) ) ( not ( = ?auto_2432081 ?auto_2432088 ) ) ( TRUCK-AT ?auto_2432087 ?auto_2432089 ) ( SURFACE-AT ?auto_2432081 ?auto_2432089 ) ( CLEAR ?auto_2432081 ) ( IS-CRATE ?auto_2432082 ) ( AVAILABLE ?auto_2432084 ) ( IN ?auto_2432082 ?auto_2432087 ) ( ON ?auto_2432073 ?auto_2432072 ) ( ON ?auto_2432074 ?auto_2432073 ) ( ON ?auto_2432071 ?auto_2432074 ) ( ON ?auto_2432075 ?auto_2432071 ) ( ON ?auto_2432077 ?auto_2432075 ) ( ON ?auto_2432076 ?auto_2432077 ) ( ON ?auto_2432078 ?auto_2432076 ) ( ON ?auto_2432079 ?auto_2432078 ) ( ON ?auto_2432080 ?auto_2432079 ) ( ON ?auto_2432081 ?auto_2432080 ) ( not ( = ?auto_2432072 ?auto_2432073 ) ) ( not ( = ?auto_2432072 ?auto_2432074 ) ) ( not ( = ?auto_2432072 ?auto_2432071 ) ) ( not ( = ?auto_2432072 ?auto_2432075 ) ) ( not ( = ?auto_2432072 ?auto_2432077 ) ) ( not ( = ?auto_2432072 ?auto_2432076 ) ) ( not ( = ?auto_2432072 ?auto_2432078 ) ) ( not ( = ?auto_2432072 ?auto_2432079 ) ) ( not ( = ?auto_2432072 ?auto_2432080 ) ) ( not ( = ?auto_2432072 ?auto_2432081 ) ) ( not ( = ?auto_2432072 ?auto_2432082 ) ) ( not ( = ?auto_2432072 ?auto_2432083 ) ) ( not ( = ?auto_2432072 ?auto_2432088 ) ) ( not ( = ?auto_2432073 ?auto_2432074 ) ) ( not ( = ?auto_2432073 ?auto_2432071 ) ) ( not ( = ?auto_2432073 ?auto_2432075 ) ) ( not ( = ?auto_2432073 ?auto_2432077 ) ) ( not ( = ?auto_2432073 ?auto_2432076 ) ) ( not ( = ?auto_2432073 ?auto_2432078 ) ) ( not ( = ?auto_2432073 ?auto_2432079 ) ) ( not ( = ?auto_2432073 ?auto_2432080 ) ) ( not ( = ?auto_2432073 ?auto_2432081 ) ) ( not ( = ?auto_2432073 ?auto_2432082 ) ) ( not ( = ?auto_2432073 ?auto_2432083 ) ) ( not ( = ?auto_2432073 ?auto_2432088 ) ) ( not ( = ?auto_2432074 ?auto_2432071 ) ) ( not ( = ?auto_2432074 ?auto_2432075 ) ) ( not ( = ?auto_2432074 ?auto_2432077 ) ) ( not ( = ?auto_2432074 ?auto_2432076 ) ) ( not ( = ?auto_2432074 ?auto_2432078 ) ) ( not ( = ?auto_2432074 ?auto_2432079 ) ) ( not ( = ?auto_2432074 ?auto_2432080 ) ) ( not ( = ?auto_2432074 ?auto_2432081 ) ) ( not ( = ?auto_2432074 ?auto_2432082 ) ) ( not ( = ?auto_2432074 ?auto_2432083 ) ) ( not ( = ?auto_2432074 ?auto_2432088 ) ) ( not ( = ?auto_2432071 ?auto_2432075 ) ) ( not ( = ?auto_2432071 ?auto_2432077 ) ) ( not ( = ?auto_2432071 ?auto_2432076 ) ) ( not ( = ?auto_2432071 ?auto_2432078 ) ) ( not ( = ?auto_2432071 ?auto_2432079 ) ) ( not ( = ?auto_2432071 ?auto_2432080 ) ) ( not ( = ?auto_2432071 ?auto_2432081 ) ) ( not ( = ?auto_2432071 ?auto_2432082 ) ) ( not ( = ?auto_2432071 ?auto_2432083 ) ) ( not ( = ?auto_2432071 ?auto_2432088 ) ) ( not ( = ?auto_2432075 ?auto_2432077 ) ) ( not ( = ?auto_2432075 ?auto_2432076 ) ) ( not ( = ?auto_2432075 ?auto_2432078 ) ) ( not ( = ?auto_2432075 ?auto_2432079 ) ) ( not ( = ?auto_2432075 ?auto_2432080 ) ) ( not ( = ?auto_2432075 ?auto_2432081 ) ) ( not ( = ?auto_2432075 ?auto_2432082 ) ) ( not ( = ?auto_2432075 ?auto_2432083 ) ) ( not ( = ?auto_2432075 ?auto_2432088 ) ) ( not ( = ?auto_2432077 ?auto_2432076 ) ) ( not ( = ?auto_2432077 ?auto_2432078 ) ) ( not ( = ?auto_2432077 ?auto_2432079 ) ) ( not ( = ?auto_2432077 ?auto_2432080 ) ) ( not ( = ?auto_2432077 ?auto_2432081 ) ) ( not ( = ?auto_2432077 ?auto_2432082 ) ) ( not ( = ?auto_2432077 ?auto_2432083 ) ) ( not ( = ?auto_2432077 ?auto_2432088 ) ) ( not ( = ?auto_2432076 ?auto_2432078 ) ) ( not ( = ?auto_2432076 ?auto_2432079 ) ) ( not ( = ?auto_2432076 ?auto_2432080 ) ) ( not ( = ?auto_2432076 ?auto_2432081 ) ) ( not ( = ?auto_2432076 ?auto_2432082 ) ) ( not ( = ?auto_2432076 ?auto_2432083 ) ) ( not ( = ?auto_2432076 ?auto_2432088 ) ) ( not ( = ?auto_2432078 ?auto_2432079 ) ) ( not ( = ?auto_2432078 ?auto_2432080 ) ) ( not ( = ?auto_2432078 ?auto_2432081 ) ) ( not ( = ?auto_2432078 ?auto_2432082 ) ) ( not ( = ?auto_2432078 ?auto_2432083 ) ) ( not ( = ?auto_2432078 ?auto_2432088 ) ) ( not ( = ?auto_2432079 ?auto_2432080 ) ) ( not ( = ?auto_2432079 ?auto_2432081 ) ) ( not ( = ?auto_2432079 ?auto_2432082 ) ) ( not ( = ?auto_2432079 ?auto_2432083 ) ) ( not ( = ?auto_2432079 ?auto_2432088 ) ) ( not ( = ?auto_2432080 ?auto_2432081 ) ) ( not ( = ?auto_2432080 ?auto_2432082 ) ) ( not ( = ?auto_2432080 ?auto_2432083 ) ) ( not ( = ?auto_2432080 ?auto_2432088 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2432081 ?auto_2432082 ?auto_2432083 )
      ( MAKE-12CRATE-VERIFY ?auto_2432072 ?auto_2432073 ?auto_2432074 ?auto_2432071 ?auto_2432075 ?auto_2432077 ?auto_2432076 ?auto_2432078 ?auto_2432079 ?auto_2432080 ?auto_2432081 ?auto_2432082 ?auto_2432083 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2443651 - SURFACE
      ?auto_2443652 - SURFACE
      ?auto_2443653 - SURFACE
      ?auto_2443650 - SURFACE
      ?auto_2443654 - SURFACE
      ?auto_2443656 - SURFACE
      ?auto_2443655 - SURFACE
      ?auto_2443657 - SURFACE
      ?auto_2443658 - SURFACE
      ?auto_2443659 - SURFACE
      ?auto_2443660 - SURFACE
      ?auto_2443661 - SURFACE
      ?auto_2443662 - SURFACE
      ?auto_2443663 - SURFACE
    )
    :vars
    (
      ?auto_2443664 - HOIST
      ?auto_2443665 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2443664 ?auto_2443665 ) ( SURFACE-AT ?auto_2443662 ?auto_2443665 ) ( CLEAR ?auto_2443662 ) ( LIFTING ?auto_2443664 ?auto_2443663 ) ( IS-CRATE ?auto_2443663 ) ( not ( = ?auto_2443662 ?auto_2443663 ) ) ( ON ?auto_2443652 ?auto_2443651 ) ( ON ?auto_2443653 ?auto_2443652 ) ( ON ?auto_2443650 ?auto_2443653 ) ( ON ?auto_2443654 ?auto_2443650 ) ( ON ?auto_2443656 ?auto_2443654 ) ( ON ?auto_2443655 ?auto_2443656 ) ( ON ?auto_2443657 ?auto_2443655 ) ( ON ?auto_2443658 ?auto_2443657 ) ( ON ?auto_2443659 ?auto_2443658 ) ( ON ?auto_2443660 ?auto_2443659 ) ( ON ?auto_2443661 ?auto_2443660 ) ( ON ?auto_2443662 ?auto_2443661 ) ( not ( = ?auto_2443651 ?auto_2443652 ) ) ( not ( = ?auto_2443651 ?auto_2443653 ) ) ( not ( = ?auto_2443651 ?auto_2443650 ) ) ( not ( = ?auto_2443651 ?auto_2443654 ) ) ( not ( = ?auto_2443651 ?auto_2443656 ) ) ( not ( = ?auto_2443651 ?auto_2443655 ) ) ( not ( = ?auto_2443651 ?auto_2443657 ) ) ( not ( = ?auto_2443651 ?auto_2443658 ) ) ( not ( = ?auto_2443651 ?auto_2443659 ) ) ( not ( = ?auto_2443651 ?auto_2443660 ) ) ( not ( = ?auto_2443651 ?auto_2443661 ) ) ( not ( = ?auto_2443651 ?auto_2443662 ) ) ( not ( = ?auto_2443651 ?auto_2443663 ) ) ( not ( = ?auto_2443652 ?auto_2443653 ) ) ( not ( = ?auto_2443652 ?auto_2443650 ) ) ( not ( = ?auto_2443652 ?auto_2443654 ) ) ( not ( = ?auto_2443652 ?auto_2443656 ) ) ( not ( = ?auto_2443652 ?auto_2443655 ) ) ( not ( = ?auto_2443652 ?auto_2443657 ) ) ( not ( = ?auto_2443652 ?auto_2443658 ) ) ( not ( = ?auto_2443652 ?auto_2443659 ) ) ( not ( = ?auto_2443652 ?auto_2443660 ) ) ( not ( = ?auto_2443652 ?auto_2443661 ) ) ( not ( = ?auto_2443652 ?auto_2443662 ) ) ( not ( = ?auto_2443652 ?auto_2443663 ) ) ( not ( = ?auto_2443653 ?auto_2443650 ) ) ( not ( = ?auto_2443653 ?auto_2443654 ) ) ( not ( = ?auto_2443653 ?auto_2443656 ) ) ( not ( = ?auto_2443653 ?auto_2443655 ) ) ( not ( = ?auto_2443653 ?auto_2443657 ) ) ( not ( = ?auto_2443653 ?auto_2443658 ) ) ( not ( = ?auto_2443653 ?auto_2443659 ) ) ( not ( = ?auto_2443653 ?auto_2443660 ) ) ( not ( = ?auto_2443653 ?auto_2443661 ) ) ( not ( = ?auto_2443653 ?auto_2443662 ) ) ( not ( = ?auto_2443653 ?auto_2443663 ) ) ( not ( = ?auto_2443650 ?auto_2443654 ) ) ( not ( = ?auto_2443650 ?auto_2443656 ) ) ( not ( = ?auto_2443650 ?auto_2443655 ) ) ( not ( = ?auto_2443650 ?auto_2443657 ) ) ( not ( = ?auto_2443650 ?auto_2443658 ) ) ( not ( = ?auto_2443650 ?auto_2443659 ) ) ( not ( = ?auto_2443650 ?auto_2443660 ) ) ( not ( = ?auto_2443650 ?auto_2443661 ) ) ( not ( = ?auto_2443650 ?auto_2443662 ) ) ( not ( = ?auto_2443650 ?auto_2443663 ) ) ( not ( = ?auto_2443654 ?auto_2443656 ) ) ( not ( = ?auto_2443654 ?auto_2443655 ) ) ( not ( = ?auto_2443654 ?auto_2443657 ) ) ( not ( = ?auto_2443654 ?auto_2443658 ) ) ( not ( = ?auto_2443654 ?auto_2443659 ) ) ( not ( = ?auto_2443654 ?auto_2443660 ) ) ( not ( = ?auto_2443654 ?auto_2443661 ) ) ( not ( = ?auto_2443654 ?auto_2443662 ) ) ( not ( = ?auto_2443654 ?auto_2443663 ) ) ( not ( = ?auto_2443656 ?auto_2443655 ) ) ( not ( = ?auto_2443656 ?auto_2443657 ) ) ( not ( = ?auto_2443656 ?auto_2443658 ) ) ( not ( = ?auto_2443656 ?auto_2443659 ) ) ( not ( = ?auto_2443656 ?auto_2443660 ) ) ( not ( = ?auto_2443656 ?auto_2443661 ) ) ( not ( = ?auto_2443656 ?auto_2443662 ) ) ( not ( = ?auto_2443656 ?auto_2443663 ) ) ( not ( = ?auto_2443655 ?auto_2443657 ) ) ( not ( = ?auto_2443655 ?auto_2443658 ) ) ( not ( = ?auto_2443655 ?auto_2443659 ) ) ( not ( = ?auto_2443655 ?auto_2443660 ) ) ( not ( = ?auto_2443655 ?auto_2443661 ) ) ( not ( = ?auto_2443655 ?auto_2443662 ) ) ( not ( = ?auto_2443655 ?auto_2443663 ) ) ( not ( = ?auto_2443657 ?auto_2443658 ) ) ( not ( = ?auto_2443657 ?auto_2443659 ) ) ( not ( = ?auto_2443657 ?auto_2443660 ) ) ( not ( = ?auto_2443657 ?auto_2443661 ) ) ( not ( = ?auto_2443657 ?auto_2443662 ) ) ( not ( = ?auto_2443657 ?auto_2443663 ) ) ( not ( = ?auto_2443658 ?auto_2443659 ) ) ( not ( = ?auto_2443658 ?auto_2443660 ) ) ( not ( = ?auto_2443658 ?auto_2443661 ) ) ( not ( = ?auto_2443658 ?auto_2443662 ) ) ( not ( = ?auto_2443658 ?auto_2443663 ) ) ( not ( = ?auto_2443659 ?auto_2443660 ) ) ( not ( = ?auto_2443659 ?auto_2443661 ) ) ( not ( = ?auto_2443659 ?auto_2443662 ) ) ( not ( = ?auto_2443659 ?auto_2443663 ) ) ( not ( = ?auto_2443660 ?auto_2443661 ) ) ( not ( = ?auto_2443660 ?auto_2443662 ) ) ( not ( = ?auto_2443660 ?auto_2443663 ) ) ( not ( = ?auto_2443661 ?auto_2443662 ) ) ( not ( = ?auto_2443661 ?auto_2443663 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2443662 ?auto_2443663 )
      ( MAKE-13CRATE-VERIFY ?auto_2443651 ?auto_2443652 ?auto_2443653 ?auto_2443650 ?auto_2443654 ?auto_2443656 ?auto_2443655 ?auto_2443657 ?auto_2443658 ?auto_2443659 ?auto_2443660 ?auto_2443661 ?auto_2443662 ?auto_2443663 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2443793 - SURFACE
      ?auto_2443794 - SURFACE
      ?auto_2443795 - SURFACE
      ?auto_2443792 - SURFACE
      ?auto_2443796 - SURFACE
      ?auto_2443798 - SURFACE
      ?auto_2443797 - SURFACE
      ?auto_2443799 - SURFACE
      ?auto_2443800 - SURFACE
      ?auto_2443801 - SURFACE
      ?auto_2443802 - SURFACE
      ?auto_2443803 - SURFACE
      ?auto_2443804 - SURFACE
      ?auto_2443805 - SURFACE
    )
    :vars
    (
      ?auto_2443806 - HOIST
      ?auto_2443808 - PLACE
      ?auto_2443807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2443806 ?auto_2443808 ) ( SURFACE-AT ?auto_2443804 ?auto_2443808 ) ( CLEAR ?auto_2443804 ) ( IS-CRATE ?auto_2443805 ) ( not ( = ?auto_2443804 ?auto_2443805 ) ) ( TRUCK-AT ?auto_2443807 ?auto_2443808 ) ( AVAILABLE ?auto_2443806 ) ( IN ?auto_2443805 ?auto_2443807 ) ( ON ?auto_2443804 ?auto_2443803 ) ( not ( = ?auto_2443803 ?auto_2443804 ) ) ( not ( = ?auto_2443803 ?auto_2443805 ) ) ( ON ?auto_2443794 ?auto_2443793 ) ( ON ?auto_2443795 ?auto_2443794 ) ( ON ?auto_2443792 ?auto_2443795 ) ( ON ?auto_2443796 ?auto_2443792 ) ( ON ?auto_2443798 ?auto_2443796 ) ( ON ?auto_2443797 ?auto_2443798 ) ( ON ?auto_2443799 ?auto_2443797 ) ( ON ?auto_2443800 ?auto_2443799 ) ( ON ?auto_2443801 ?auto_2443800 ) ( ON ?auto_2443802 ?auto_2443801 ) ( ON ?auto_2443803 ?auto_2443802 ) ( not ( = ?auto_2443793 ?auto_2443794 ) ) ( not ( = ?auto_2443793 ?auto_2443795 ) ) ( not ( = ?auto_2443793 ?auto_2443792 ) ) ( not ( = ?auto_2443793 ?auto_2443796 ) ) ( not ( = ?auto_2443793 ?auto_2443798 ) ) ( not ( = ?auto_2443793 ?auto_2443797 ) ) ( not ( = ?auto_2443793 ?auto_2443799 ) ) ( not ( = ?auto_2443793 ?auto_2443800 ) ) ( not ( = ?auto_2443793 ?auto_2443801 ) ) ( not ( = ?auto_2443793 ?auto_2443802 ) ) ( not ( = ?auto_2443793 ?auto_2443803 ) ) ( not ( = ?auto_2443793 ?auto_2443804 ) ) ( not ( = ?auto_2443793 ?auto_2443805 ) ) ( not ( = ?auto_2443794 ?auto_2443795 ) ) ( not ( = ?auto_2443794 ?auto_2443792 ) ) ( not ( = ?auto_2443794 ?auto_2443796 ) ) ( not ( = ?auto_2443794 ?auto_2443798 ) ) ( not ( = ?auto_2443794 ?auto_2443797 ) ) ( not ( = ?auto_2443794 ?auto_2443799 ) ) ( not ( = ?auto_2443794 ?auto_2443800 ) ) ( not ( = ?auto_2443794 ?auto_2443801 ) ) ( not ( = ?auto_2443794 ?auto_2443802 ) ) ( not ( = ?auto_2443794 ?auto_2443803 ) ) ( not ( = ?auto_2443794 ?auto_2443804 ) ) ( not ( = ?auto_2443794 ?auto_2443805 ) ) ( not ( = ?auto_2443795 ?auto_2443792 ) ) ( not ( = ?auto_2443795 ?auto_2443796 ) ) ( not ( = ?auto_2443795 ?auto_2443798 ) ) ( not ( = ?auto_2443795 ?auto_2443797 ) ) ( not ( = ?auto_2443795 ?auto_2443799 ) ) ( not ( = ?auto_2443795 ?auto_2443800 ) ) ( not ( = ?auto_2443795 ?auto_2443801 ) ) ( not ( = ?auto_2443795 ?auto_2443802 ) ) ( not ( = ?auto_2443795 ?auto_2443803 ) ) ( not ( = ?auto_2443795 ?auto_2443804 ) ) ( not ( = ?auto_2443795 ?auto_2443805 ) ) ( not ( = ?auto_2443792 ?auto_2443796 ) ) ( not ( = ?auto_2443792 ?auto_2443798 ) ) ( not ( = ?auto_2443792 ?auto_2443797 ) ) ( not ( = ?auto_2443792 ?auto_2443799 ) ) ( not ( = ?auto_2443792 ?auto_2443800 ) ) ( not ( = ?auto_2443792 ?auto_2443801 ) ) ( not ( = ?auto_2443792 ?auto_2443802 ) ) ( not ( = ?auto_2443792 ?auto_2443803 ) ) ( not ( = ?auto_2443792 ?auto_2443804 ) ) ( not ( = ?auto_2443792 ?auto_2443805 ) ) ( not ( = ?auto_2443796 ?auto_2443798 ) ) ( not ( = ?auto_2443796 ?auto_2443797 ) ) ( not ( = ?auto_2443796 ?auto_2443799 ) ) ( not ( = ?auto_2443796 ?auto_2443800 ) ) ( not ( = ?auto_2443796 ?auto_2443801 ) ) ( not ( = ?auto_2443796 ?auto_2443802 ) ) ( not ( = ?auto_2443796 ?auto_2443803 ) ) ( not ( = ?auto_2443796 ?auto_2443804 ) ) ( not ( = ?auto_2443796 ?auto_2443805 ) ) ( not ( = ?auto_2443798 ?auto_2443797 ) ) ( not ( = ?auto_2443798 ?auto_2443799 ) ) ( not ( = ?auto_2443798 ?auto_2443800 ) ) ( not ( = ?auto_2443798 ?auto_2443801 ) ) ( not ( = ?auto_2443798 ?auto_2443802 ) ) ( not ( = ?auto_2443798 ?auto_2443803 ) ) ( not ( = ?auto_2443798 ?auto_2443804 ) ) ( not ( = ?auto_2443798 ?auto_2443805 ) ) ( not ( = ?auto_2443797 ?auto_2443799 ) ) ( not ( = ?auto_2443797 ?auto_2443800 ) ) ( not ( = ?auto_2443797 ?auto_2443801 ) ) ( not ( = ?auto_2443797 ?auto_2443802 ) ) ( not ( = ?auto_2443797 ?auto_2443803 ) ) ( not ( = ?auto_2443797 ?auto_2443804 ) ) ( not ( = ?auto_2443797 ?auto_2443805 ) ) ( not ( = ?auto_2443799 ?auto_2443800 ) ) ( not ( = ?auto_2443799 ?auto_2443801 ) ) ( not ( = ?auto_2443799 ?auto_2443802 ) ) ( not ( = ?auto_2443799 ?auto_2443803 ) ) ( not ( = ?auto_2443799 ?auto_2443804 ) ) ( not ( = ?auto_2443799 ?auto_2443805 ) ) ( not ( = ?auto_2443800 ?auto_2443801 ) ) ( not ( = ?auto_2443800 ?auto_2443802 ) ) ( not ( = ?auto_2443800 ?auto_2443803 ) ) ( not ( = ?auto_2443800 ?auto_2443804 ) ) ( not ( = ?auto_2443800 ?auto_2443805 ) ) ( not ( = ?auto_2443801 ?auto_2443802 ) ) ( not ( = ?auto_2443801 ?auto_2443803 ) ) ( not ( = ?auto_2443801 ?auto_2443804 ) ) ( not ( = ?auto_2443801 ?auto_2443805 ) ) ( not ( = ?auto_2443802 ?auto_2443803 ) ) ( not ( = ?auto_2443802 ?auto_2443804 ) ) ( not ( = ?auto_2443802 ?auto_2443805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2443803 ?auto_2443804 ?auto_2443805 )
      ( MAKE-13CRATE-VERIFY ?auto_2443793 ?auto_2443794 ?auto_2443795 ?auto_2443792 ?auto_2443796 ?auto_2443798 ?auto_2443797 ?auto_2443799 ?auto_2443800 ?auto_2443801 ?auto_2443802 ?auto_2443803 ?auto_2443804 ?auto_2443805 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2443949 - SURFACE
      ?auto_2443950 - SURFACE
      ?auto_2443951 - SURFACE
      ?auto_2443948 - SURFACE
      ?auto_2443952 - SURFACE
      ?auto_2443954 - SURFACE
      ?auto_2443953 - SURFACE
      ?auto_2443955 - SURFACE
      ?auto_2443956 - SURFACE
      ?auto_2443957 - SURFACE
      ?auto_2443958 - SURFACE
      ?auto_2443959 - SURFACE
      ?auto_2443960 - SURFACE
      ?auto_2443961 - SURFACE
    )
    :vars
    (
      ?auto_2443962 - HOIST
      ?auto_2443964 - PLACE
      ?auto_2443963 - TRUCK
      ?auto_2443965 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2443962 ?auto_2443964 ) ( SURFACE-AT ?auto_2443960 ?auto_2443964 ) ( CLEAR ?auto_2443960 ) ( IS-CRATE ?auto_2443961 ) ( not ( = ?auto_2443960 ?auto_2443961 ) ) ( AVAILABLE ?auto_2443962 ) ( IN ?auto_2443961 ?auto_2443963 ) ( ON ?auto_2443960 ?auto_2443959 ) ( not ( = ?auto_2443959 ?auto_2443960 ) ) ( not ( = ?auto_2443959 ?auto_2443961 ) ) ( TRUCK-AT ?auto_2443963 ?auto_2443965 ) ( not ( = ?auto_2443965 ?auto_2443964 ) ) ( ON ?auto_2443950 ?auto_2443949 ) ( ON ?auto_2443951 ?auto_2443950 ) ( ON ?auto_2443948 ?auto_2443951 ) ( ON ?auto_2443952 ?auto_2443948 ) ( ON ?auto_2443954 ?auto_2443952 ) ( ON ?auto_2443953 ?auto_2443954 ) ( ON ?auto_2443955 ?auto_2443953 ) ( ON ?auto_2443956 ?auto_2443955 ) ( ON ?auto_2443957 ?auto_2443956 ) ( ON ?auto_2443958 ?auto_2443957 ) ( ON ?auto_2443959 ?auto_2443958 ) ( not ( = ?auto_2443949 ?auto_2443950 ) ) ( not ( = ?auto_2443949 ?auto_2443951 ) ) ( not ( = ?auto_2443949 ?auto_2443948 ) ) ( not ( = ?auto_2443949 ?auto_2443952 ) ) ( not ( = ?auto_2443949 ?auto_2443954 ) ) ( not ( = ?auto_2443949 ?auto_2443953 ) ) ( not ( = ?auto_2443949 ?auto_2443955 ) ) ( not ( = ?auto_2443949 ?auto_2443956 ) ) ( not ( = ?auto_2443949 ?auto_2443957 ) ) ( not ( = ?auto_2443949 ?auto_2443958 ) ) ( not ( = ?auto_2443949 ?auto_2443959 ) ) ( not ( = ?auto_2443949 ?auto_2443960 ) ) ( not ( = ?auto_2443949 ?auto_2443961 ) ) ( not ( = ?auto_2443950 ?auto_2443951 ) ) ( not ( = ?auto_2443950 ?auto_2443948 ) ) ( not ( = ?auto_2443950 ?auto_2443952 ) ) ( not ( = ?auto_2443950 ?auto_2443954 ) ) ( not ( = ?auto_2443950 ?auto_2443953 ) ) ( not ( = ?auto_2443950 ?auto_2443955 ) ) ( not ( = ?auto_2443950 ?auto_2443956 ) ) ( not ( = ?auto_2443950 ?auto_2443957 ) ) ( not ( = ?auto_2443950 ?auto_2443958 ) ) ( not ( = ?auto_2443950 ?auto_2443959 ) ) ( not ( = ?auto_2443950 ?auto_2443960 ) ) ( not ( = ?auto_2443950 ?auto_2443961 ) ) ( not ( = ?auto_2443951 ?auto_2443948 ) ) ( not ( = ?auto_2443951 ?auto_2443952 ) ) ( not ( = ?auto_2443951 ?auto_2443954 ) ) ( not ( = ?auto_2443951 ?auto_2443953 ) ) ( not ( = ?auto_2443951 ?auto_2443955 ) ) ( not ( = ?auto_2443951 ?auto_2443956 ) ) ( not ( = ?auto_2443951 ?auto_2443957 ) ) ( not ( = ?auto_2443951 ?auto_2443958 ) ) ( not ( = ?auto_2443951 ?auto_2443959 ) ) ( not ( = ?auto_2443951 ?auto_2443960 ) ) ( not ( = ?auto_2443951 ?auto_2443961 ) ) ( not ( = ?auto_2443948 ?auto_2443952 ) ) ( not ( = ?auto_2443948 ?auto_2443954 ) ) ( not ( = ?auto_2443948 ?auto_2443953 ) ) ( not ( = ?auto_2443948 ?auto_2443955 ) ) ( not ( = ?auto_2443948 ?auto_2443956 ) ) ( not ( = ?auto_2443948 ?auto_2443957 ) ) ( not ( = ?auto_2443948 ?auto_2443958 ) ) ( not ( = ?auto_2443948 ?auto_2443959 ) ) ( not ( = ?auto_2443948 ?auto_2443960 ) ) ( not ( = ?auto_2443948 ?auto_2443961 ) ) ( not ( = ?auto_2443952 ?auto_2443954 ) ) ( not ( = ?auto_2443952 ?auto_2443953 ) ) ( not ( = ?auto_2443952 ?auto_2443955 ) ) ( not ( = ?auto_2443952 ?auto_2443956 ) ) ( not ( = ?auto_2443952 ?auto_2443957 ) ) ( not ( = ?auto_2443952 ?auto_2443958 ) ) ( not ( = ?auto_2443952 ?auto_2443959 ) ) ( not ( = ?auto_2443952 ?auto_2443960 ) ) ( not ( = ?auto_2443952 ?auto_2443961 ) ) ( not ( = ?auto_2443954 ?auto_2443953 ) ) ( not ( = ?auto_2443954 ?auto_2443955 ) ) ( not ( = ?auto_2443954 ?auto_2443956 ) ) ( not ( = ?auto_2443954 ?auto_2443957 ) ) ( not ( = ?auto_2443954 ?auto_2443958 ) ) ( not ( = ?auto_2443954 ?auto_2443959 ) ) ( not ( = ?auto_2443954 ?auto_2443960 ) ) ( not ( = ?auto_2443954 ?auto_2443961 ) ) ( not ( = ?auto_2443953 ?auto_2443955 ) ) ( not ( = ?auto_2443953 ?auto_2443956 ) ) ( not ( = ?auto_2443953 ?auto_2443957 ) ) ( not ( = ?auto_2443953 ?auto_2443958 ) ) ( not ( = ?auto_2443953 ?auto_2443959 ) ) ( not ( = ?auto_2443953 ?auto_2443960 ) ) ( not ( = ?auto_2443953 ?auto_2443961 ) ) ( not ( = ?auto_2443955 ?auto_2443956 ) ) ( not ( = ?auto_2443955 ?auto_2443957 ) ) ( not ( = ?auto_2443955 ?auto_2443958 ) ) ( not ( = ?auto_2443955 ?auto_2443959 ) ) ( not ( = ?auto_2443955 ?auto_2443960 ) ) ( not ( = ?auto_2443955 ?auto_2443961 ) ) ( not ( = ?auto_2443956 ?auto_2443957 ) ) ( not ( = ?auto_2443956 ?auto_2443958 ) ) ( not ( = ?auto_2443956 ?auto_2443959 ) ) ( not ( = ?auto_2443956 ?auto_2443960 ) ) ( not ( = ?auto_2443956 ?auto_2443961 ) ) ( not ( = ?auto_2443957 ?auto_2443958 ) ) ( not ( = ?auto_2443957 ?auto_2443959 ) ) ( not ( = ?auto_2443957 ?auto_2443960 ) ) ( not ( = ?auto_2443957 ?auto_2443961 ) ) ( not ( = ?auto_2443958 ?auto_2443959 ) ) ( not ( = ?auto_2443958 ?auto_2443960 ) ) ( not ( = ?auto_2443958 ?auto_2443961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2443959 ?auto_2443960 ?auto_2443961 )
      ( MAKE-13CRATE-VERIFY ?auto_2443949 ?auto_2443950 ?auto_2443951 ?auto_2443948 ?auto_2443952 ?auto_2443954 ?auto_2443953 ?auto_2443955 ?auto_2443956 ?auto_2443957 ?auto_2443958 ?auto_2443959 ?auto_2443960 ?auto_2443961 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2444118 - SURFACE
      ?auto_2444119 - SURFACE
      ?auto_2444120 - SURFACE
      ?auto_2444117 - SURFACE
      ?auto_2444121 - SURFACE
      ?auto_2444123 - SURFACE
      ?auto_2444122 - SURFACE
      ?auto_2444124 - SURFACE
      ?auto_2444125 - SURFACE
      ?auto_2444126 - SURFACE
      ?auto_2444127 - SURFACE
      ?auto_2444128 - SURFACE
      ?auto_2444129 - SURFACE
      ?auto_2444130 - SURFACE
    )
    :vars
    (
      ?auto_2444135 - HOIST
      ?auto_2444133 - PLACE
      ?auto_2444131 - TRUCK
      ?auto_2444134 - PLACE
      ?auto_2444132 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2444135 ?auto_2444133 ) ( SURFACE-AT ?auto_2444129 ?auto_2444133 ) ( CLEAR ?auto_2444129 ) ( IS-CRATE ?auto_2444130 ) ( not ( = ?auto_2444129 ?auto_2444130 ) ) ( AVAILABLE ?auto_2444135 ) ( ON ?auto_2444129 ?auto_2444128 ) ( not ( = ?auto_2444128 ?auto_2444129 ) ) ( not ( = ?auto_2444128 ?auto_2444130 ) ) ( TRUCK-AT ?auto_2444131 ?auto_2444134 ) ( not ( = ?auto_2444134 ?auto_2444133 ) ) ( HOIST-AT ?auto_2444132 ?auto_2444134 ) ( LIFTING ?auto_2444132 ?auto_2444130 ) ( not ( = ?auto_2444135 ?auto_2444132 ) ) ( ON ?auto_2444119 ?auto_2444118 ) ( ON ?auto_2444120 ?auto_2444119 ) ( ON ?auto_2444117 ?auto_2444120 ) ( ON ?auto_2444121 ?auto_2444117 ) ( ON ?auto_2444123 ?auto_2444121 ) ( ON ?auto_2444122 ?auto_2444123 ) ( ON ?auto_2444124 ?auto_2444122 ) ( ON ?auto_2444125 ?auto_2444124 ) ( ON ?auto_2444126 ?auto_2444125 ) ( ON ?auto_2444127 ?auto_2444126 ) ( ON ?auto_2444128 ?auto_2444127 ) ( not ( = ?auto_2444118 ?auto_2444119 ) ) ( not ( = ?auto_2444118 ?auto_2444120 ) ) ( not ( = ?auto_2444118 ?auto_2444117 ) ) ( not ( = ?auto_2444118 ?auto_2444121 ) ) ( not ( = ?auto_2444118 ?auto_2444123 ) ) ( not ( = ?auto_2444118 ?auto_2444122 ) ) ( not ( = ?auto_2444118 ?auto_2444124 ) ) ( not ( = ?auto_2444118 ?auto_2444125 ) ) ( not ( = ?auto_2444118 ?auto_2444126 ) ) ( not ( = ?auto_2444118 ?auto_2444127 ) ) ( not ( = ?auto_2444118 ?auto_2444128 ) ) ( not ( = ?auto_2444118 ?auto_2444129 ) ) ( not ( = ?auto_2444118 ?auto_2444130 ) ) ( not ( = ?auto_2444119 ?auto_2444120 ) ) ( not ( = ?auto_2444119 ?auto_2444117 ) ) ( not ( = ?auto_2444119 ?auto_2444121 ) ) ( not ( = ?auto_2444119 ?auto_2444123 ) ) ( not ( = ?auto_2444119 ?auto_2444122 ) ) ( not ( = ?auto_2444119 ?auto_2444124 ) ) ( not ( = ?auto_2444119 ?auto_2444125 ) ) ( not ( = ?auto_2444119 ?auto_2444126 ) ) ( not ( = ?auto_2444119 ?auto_2444127 ) ) ( not ( = ?auto_2444119 ?auto_2444128 ) ) ( not ( = ?auto_2444119 ?auto_2444129 ) ) ( not ( = ?auto_2444119 ?auto_2444130 ) ) ( not ( = ?auto_2444120 ?auto_2444117 ) ) ( not ( = ?auto_2444120 ?auto_2444121 ) ) ( not ( = ?auto_2444120 ?auto_2444123 ) ) ( not ( = ?auto_2444120 ?auto_2444122 ) ) ( not ( = ?auto_2444120 ?auto_2444124 ) ) ( not ( = ?auto_2444120 ?auto_2444125 ) ) ( not ( = ?auto_2444120 ?auto_2444126 ) ) ( not ( = ?auto_2444120 ?auto_2444127 ) ) ( not ( = ?auto_2444120 ?auto_2444128 ) ) ( not ( = ?auto_2444120 ?auto_2444129 ) ) ( not ( = ?auto_2444120 ?auto_2444130 ) ) ( not ( = ?auto_2444117 ?auto_2444121 ) ) ( not ( = ?auto_2444117 ?auto_2444123 ) ) ( not ( = ?auto_2444117 ?auto_2444122 ) ) ( not ( = ?auto_2444117 ?auto_2444124 ) ) ( not ( = ?auto_2444117 ?auto_2444125 ) ) ( not ( = ?auto_2444117 ?auto_2444126 ) ) ( not ( = ?auto_2444117 ?auto_2444127 ) ) ( not ( = ?auto_2444117 ?auto_2444128 ) ) ( not ( = ?auto_2444117 ?auto_2444129 ) ) ( not ( = ?auto_2444117 ?auto_2444130 ) ) ( not ( = ?auto_2444121 ?auto_2444123 ) ) ( not ( = ?auto_2444121 ?auto_2444122 ) ) ( not ( = ?auto_2444121 ?auto_2444124 ) ) ( not ( = ?auto_2444121 ?auto_2444125 ) ) ( not ( = ?auto_2444121 ?auto_2444126 ) ) ( not ( = ?auto_2444121 ?auto_2444127 ) ) ( not ( = ?auto_2444121 ?auto_2444128 ) ) ( not ( = ?auto_2444121 ?auto_2444129 ) ) ( not ( = ?auto_2444121 ?auto_2444130 ) ) ( not ( = ?auto_2444123 ?auto_2444122 ) ) ( not ( = ?auto_2444123 ?auto_2444124 ) ) ( not ( = ?auto_2444123 ?auto_2444125 ) ) ( not ( = ?auto_2444123 ?auto_2444126 ) ) ( not ( = ?auto_2444123 ?auto_2444127 ) ) ( not ( = ?auto_2444123 ?auto_2444128 ) ) ( not ( = ?auto_2444123 ?auto_2444129 ) ) ( not ( = ?auto_2444123 ?auto_2444130 ) ) ( not ( = ?auto_2444122 ?auto_2444124 ) ) ( not ( = ?auto_2444122 ?auto_2444125 ) ) ( not ( = ?auto_2444122 ?auto_2444126 ) ) ( not ( = ?auto_2444122 ?auto_2444127 ) ) ( not ( = ?auto_2444122 ?auto_2444128 ) ) ( not ( = ?auto_2444122 ?auto_2444129 ) ) ( not ( = ?auto_2444122 ?auto_2444130 ) ) ( not ( = ?auto_2444124 ?auto_2444125 ) ) ( not ( = ?auto_2444124 ?auto_2444126 ) ) ( not ( = ?auto_2444124 ?auto_2444127 ) ) ( not ( = ?auto_2444124 ?auto_2444128 ) ) ( not ( = ?auto_2444124 ?auto_2444129 ) ) ( not ( = ?auto_2444124 ?auto_2444130 ) ) ( not ( = ?auto_2444125 ?auto_2444126 ) ) ( not ( = ?auto_2444125 ?auto_2444127 ) ) ( not ( = ?auto_2444125 ?auto_2444128 ) ) ( not ( = ?auto_2444125 ?auto_2444129 ) ) ( not ( = ?auto_2444125 ?auto_2444130 ) ) ( not ( = ?auto_2444126 ?auto_2444127 ) ) ( not ( = ?auto_2444126 ?auto_2444128 ) ) ( not ( = ?auto_2444126 ?auto_2444129 ) ) ( not ( = ?auto_2444126 ?auto_2444130 ) ) ( not ( = ?auto_2444127 ?auto_2444128 ) ) ( not ( = ?auto_2444127 ?auto_2444129 ) ) ( not ( = ?auto_2444127 ?auto_2444130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2444128 ?auto_2444129 ?auto_2444130 )
      ( MAKE-13CRATE-VERIFY ?auto_2444118 ?auto_2444119 ?auto_2444120 ?auto_2444117 ?auto_2444121 ?auto_2444123 ?auto_2444122 ?auto_2444124 ?auto_2444125 ?auto_2444126 ?auto_2444127 ?auto_2444128 ?auto_2444129 ?auto_2444130 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2444300 - SURFACE
      ?auto_2444301 - SURFACE
      ?auto_2444302 - SURFACE
      ?auto_2444299 - SURFACE
      ?auto_2444303 - SURFACE
      ?auto_2444305 - SURFACE
      ?auto_2444304 - SURFACE
      ?auto_2444306 - SURFACE
      ?auto_2444307 - SURFACE
      ?auto_2444308 - SURFACE
      ?auto_2444309 - SURFACE
      ?auto_2444310 - SURFACE
      ?auto_2444311 - SURFACE
      ?auto_2444312 - SURFACE
    )
    :vars
    (
      ?auto_2444318 - HOIST
      ?auto_2444313 - PLACE
      ?auto_2444317 - TRUCK
      ?auto_2444315 - PLACE
      ?auto_2444314 - HOIST
      ?auto_2444316 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2444318 ?auto_2444313 ) ( SURFACE-AT ?auto_2444311 ?auto_2444313 ) ( CLEAR ?auto_2444311 ) ( IS-CRATE ?auto_2444312 ) ( not ( = ?auto_2444311 ?auto_2444312 ) ) ( AVAILABLE ?auto_2444318 ) ( ON ?auto_2444311 ?auto_2444310 ) ( not ( = ?auto_2444310 ?auto_2444311 ) ) ( not ( = ?auto_2444310 ?auto_2444312 ) ) ( TRUCK-AT ?auto_2444317 ?auto_2444315 ) ( not ( = ?auto_2444315 ?auto_2444313 ) ) ( HOIST-AT ?auto_2444314 ?auto_2444315 ) ( not ( = ?auto_2444318 ?auto_2444314 ) ) ( AVAILABLE ?auto_2444314 ) ( SURFACE-AT ?auto_2444312 ?auto_2444315 ) ( ON ?auto_2444312 ?auto_2444316 ) ( CLEAR ?auto_2444312 ) ( not ( = ?auto_2444311 ?auto_2444316 ) ) ( not ( = ?auto_2444312 ?auto_2444316 ) ) ( not ( = ?auto_2444310 ?auto_2444316 ) ) ( ON ?auto_2444301 ?auto_2444300 ) ( ON ?auto_2444302 ?auto_2444301 ) ( ON ?auto_2444299 ?auto_2444302 ) ( ON ?auto_2444303 ?auto_2444299 ) ( ON ?auto_2444305 ?auto_2444303 ) ( ON ?auto_2444304 ?auto_2444305 ) ( ON ?auto_2444306 ?auto_2444304 ) ( ON ?auto_2444307 ?auto_2444306 ) ( ON ?auto_2444308 ?auto_2444307 ) ( ON ?auto_2444309 ?auto_2444308 ) ( ON ?auto_2444310 ?auto_2444309 ) ( not ( = ?auto_2444300 ?auto_2444301 ) ) ( not ( = ?auto_2444300 ?auto_2444302 ) ) ( not ( = ?auto_2444300 ?auto_2444299 ) ) ( not ( = ?auto_2444300 ?auto_2444303 ) ) ( not ( = ?auto_2444300 ?auto_2444305 ) ) ( not ( = ?auto_2444300 ?auto_2444304 ) ) ( not ( = ?auto_2444300 ?auto_2444306 ) ) ( not ( = ?auto_2444300 ?auto_2444307 ) ) ( not ( = ?auto_2444300 ?auto_2444308 ) ) ( not ( = ?auto_2444300 ?auto_2444309 ) ) ( not ( = ?auto_2444300 ?auto_2444310 ) ) ( not ( = ?auto_2444300 ?auto_2444311 ) ) ( not ( = ?auto_2444300 ?auto_2444312 ) ) ( not ( = ?auto_2444300 ?auto_2444316 ) ) ( not ( = ?auto_2444301 ?auto_2444302 ) ) ( not ( = ?auto_2444301 ?auto_2444299 ) ) ( not ( = ?auto_2444301 ?auto_2444303 ) ) ( not ( = ?auto_2444301 ?auto_2444305 ) ) ( not ( = ?auto_2444301 ?auto_2444304 ) ) ( not ( = ?auto_2444301 ?auto_2444306 ) ) ( not ( = ?auto_2444301 ?auto_2444307 ) ) ( not ( = ?auto_2444301 ?auto_2444308 ) ) ( not ( = ?auto_2444301 ?auto_2444309 ) ) ( not ( = ?auto_2444301 ?auto_2444310 ) ) ( not ( = ?auto_2444301 ?auto_2444311 ) ) ( not ( = ?auto_2444301 ?auto_2444312 ) ) ( not ( = ?auto_2444301 ?auto_2444316 ) ) ( not ( = ?auto_2444302 ?auto_2444299 ) ) ( not ( = ?auto_2444302 ?auto_2444303 ) ) ( not ( = ?auto_2444302 ?auto_2444305 ) ) ( not ( = ?auto_2444302 ?auto_2444304 ) ) ( not ( = ?auto_2444302 ?auto_2444306 ) ) ( not ( = ?auto_2444302 ?auto_2444307 ) ) ( not ( = ?auto_2444302 ?auto_2444308 ) ) ( not ( = ?auto_2444302 ?auto_2444309 ) ) ( not ( = ?auto_2444302 ?auto_2444310 ) ) ( not ( = ?auto_2444302 ?auto_2444311 ) ) ( not ( = ?auto_2444302 ?auto_2444312 ) ) ( not ( = ?auto_2444302 ?auto_2444316 ) ) ( not ( = ?auto_2444299 ?auto_2444303 ) ) ( not ( = ?auto_2444299 ?auto_2444305 ) ) ( not ( = ?auto_2444299 ?auto_2444304 ) ) ( not ( = ?auto_2444299 ?auto_2444306 ) ) ( not ( = ?auto_2444299 ?auto_2444307 ) ) ( not ( = ?auto_2444299 ?auto_2444308 ) ) ( not ( = ?auto_2444299 ?auto_2444309 ) ) ( not ( = ?auto_2444299 ?auto_2444310 ) ) ( not ( = ?auto_2444299 ?auto_2444311 ) ) ( not ( = ?auto_2444299 ?auto_2444312 ) ) ( not ( = ?auto_2444299 ?auto_2444316 ) ) ( not ( = ?auto_2444303 ?auto_2444305 ) ) ( not ( = ?auto_2444303 ?auto_2444304 ) ) ( not ( = ?auto_2444303 ?auto_2444306 ) ) ( not ( = ?auto_2444303 ?auto_2444307 ) ) ( not ( = ?auto_2444303 ?auto_2444308 ) ) ( not ( = ?auto_2444303 ?auto_2444309 ) ) ( not ( = ?auto_2444303 ?auto_2444310 ) ) ( not ( = ?auto_2444303 ?auto_2444311 ) ) ( not ( = ?auto_2444303 ?auto_2444312 ) ) ( not ( = ?auto_2444303 ?auto_2444316 ) ) ( not ( = ?auto_2444305 ?auto_2444304 ) ) ( not ( = ?auto_2444305 ?auto_2444306 ) ) ( not ( = ?auto_2444305 ?auto_2444307 ) ) ( not ( = ?auto_2444305 ?auto_2444308 ) ) ( not ( = ?auto_2444305 ?auto_2444309 ) ) ( not ( = ?auto_2444305 ?auto_2444310 ) ) ( not ( = ?auto_2444305 ?auto_2444311 ) ) ( not ( = ?auto_2444305 ?auto_2444312 ) ) ( not ( = ?auto_2444305 ?auto_2444316 ) ) ( not ( = ?auto_2444304 ?auto_2444306 ) ) ( not ( = ?auto_2444304 ?auto_2444307 ) ) ( not ( = ?auto_2444304 ?auto_2444308 ) ) ( not ( = ?auto_2444304 ?auto_2444309 ) ) ( not ( = ?auto_2444304 ?auto_2444310 ) ) ( not ( = ?auto_2444304 ?auto_2444311 ) ) ( not ( = ?auto_2444304 ?auto_2444312 ) ) ( not ( = ?auto_2444304 ?auto_2444316 ) ) ( not ( = ?auto_2444306 ?auto_2444307 ) ) ( not ( = ?auto_2444306 ?auto_2444308 ) ) ( not ( = ?auto_2444306 ?auto_2444309 ) ) ( not ( = ?auto_2444306 ?auto_2444310 ) ) ( not ( = ?auto_2444306 ?auto_2444311 ) ) ( not ( = ?auto_2444306 ?auto_2444312 ) ) ( not ( = ?auto_2444306 ?auto_2444316 ) ) ( not ( = ?auto_2444307 ?auto_2444308 ) ) ( not ( = ?auto_2444307 ?auto_2444309 ) ) ( not ( = ?auto_2444307 ?auto_2444310 ) ) ( not ( = ?auto_2444307 ?auto_2444311 ) ) ( not ( = ?auto_2444307 ?auto_2444312 ) ) ( not ( = ?auto_2444307 ?auto_2444316 ) ) ( not ( = ?auto_2444308 ?auto_2444309 ) ) ( not ( = ?auto_2444308 ?auto_2444310 ) ) ( not ( = ?auto_2444308 ?auto_2444311 ) ) ( not ( = ?auto_2444308 ?auto_2444312 ) ) ( not ( = ?auto_2444308 ?auto_2444316 ) ) ( not ( = ?auto_2444309 ?auto_2444310 ) ) ( not ( = ?auto_2444309 ?auto_2444311 ) ) ( not ( = ?auto_2444309 ?auto_2444312 ) ) ( not ( = ?auto_2444309 ?auto_2444316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2444310 ?auto_2444311 ?auto_2444312 )
      ( MAKE-13CRATE-VERIFY ?auto_2444300 ?auto_2444301 ?auto_2444302 ?auto_2444299 ?auto_2444303 ?auto_2444305 ?auto_2444304 ?auto_2444306 ?auto_2444307 ?auto_2444308 ?auto_2444309 ?auto_2444310 ?auto_2444311 ?auto_2444312 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2444483 - SURFACE
      ?auto_2444484 - SURFACE
      ?auto_2444485 - SURFACE
      ?auto_2444482 - SURFACE
      ?auto_2444486 - SURFACE
      ?auto_2444488 - SURFACE
      ?auto_2444487 - SURFACE
      ?auto_2444489 - SURFACE
      ?auto_2444490 - SURFACE
      ?auto_2444491 - SURFACE
      ?auto_2444492 - SURFACE
      ?auto_2444493 - SURFACE
      ?auto_2444494 - SURFACE
      ?auto_2444495 - SURFACE
    )
    :vars
    (
      ?auto_2444499 - HOIST
      ?auto_2444500 - PLACE
      ?auto_2444498 - PLACE
      ?auto_2444496 - HOIST
      ?auto_2444501 - SURFACE
      ?auto_2444497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2444499 ?auto_2444500 ) ( SURFACE-AT ?auto_2444494 ?auto_2444500 ) ( CLEAR ?auto_2444494 ) ( IS-CRATE ?auto_2444495 ) ( not ( = ?auto_2444494 ?auto_2444495 ) ) ( AVAILABLE ?auto_2444499 ) ( ON ?auto_2444494 ?auto_2444493 ) ( not ( = ?auto_2444493 ?auto_2444494 ) ) ( not ( = ?auto_2444493 ?auto_2444495 ) ) ( not ( = ?auto_2444498 ?auto_2444500 ) ) ( HOIST-AT ?auto_2444496 ?auto_2444498 ) ( not ( = ?auto_2444499 ?auto_2444496 ) ) ( AVAILABLE ?auto_2444496 ) ( SURFACE-AT ?auto_2444495 ?auto_2444498 ) ( ON ?auto_2444495 ?auto_2444501 ) ( CLEAR ?auto_2444495 ) ( not ( = ?auto_2444494 ?auto_2444501 ) ) ( not ( = ?auto_2444495 ?auto_2444501 ) ) ( not ( = ?auto_2444493 ?auto_2444501 ) ) ( TRUCK-AT ?auto_2444497 ?auto_2444500 ) ( ON ?auto_2444484 ?auto_2444483 ) ( ON ?auto_2444485 ?auto_2444484 ) ( ON ?auto_2444482 ?auto_2444485 ) ( ON ?auto_2444486 ?auto_2444482 ) ( ON ?auto_2444488 ?auto_2444486 ) ( ON ?auto_2444487 ?auto_2444488 ) ( ON ?auto_2444489 ?auto_2444487 ) ( ON ?auto_2444490 ?auto_2444489 ) ( ON ?auto_2444491 ?auto_2444490 ) ( ON ?auto_2444492 ?auto_2444491 ) ( ON ?auto_2444493 ?auto_2444492 ) ( not ( = ?auto_2444483 ?auto_2444484 ) ) ( not ( = ?auto_2444483 ?auto_2444485 ) ) ( not ( = ?auto_2444483 ?auto_2444482 ) ) ( not ( = ?auto_2444483 ?auto_2444486 ) ) ( not ( = ?auto_2444483 ?auto_2444488 ) ) ( not ( = ?auto_2444483 ?auto_2444487 ) ) ( not ( = ?auto_2444483 ?auto_2444489 ) ) ( not ( = ?auto_2444483 ?auto_2444490 ) ) ( not ( = ?auto_2444483 ?auto_2444491 ) ) ( not ( = ?auto_2444483 ?auto_2444492 ) ) ( not ( = ?auto_2444483 ?auto_2444493 ) ) ( not ( = ?auto_2444483 ?auto_2444494 ) ) ( not ( = ?auto_2444483 ?auto_2444495 ) ) ( not ( = ?auto_2444483 ?auto_2444501 ) ) ( not ( = ?auto_2444484 ?auto_2444485 ) ) ( not ( = ?auto_2444484 ?auto_2444482 ) ) ( not ( = ?auto_2444484 ?auto_2444486 ) ) ( not ( = ?auto_2444484 ?auto_2444488 ) ) ( not ( = ?auto_2444484 ?auto_2444487 ) ) ( not ( = ?auto_2444484 ?auto_2444489 ) ) ( not ( = ?auto_2444484 ?auto_2444490 ) ) ( not ( = ?auto_2444484 ?auto_2444491 ) ) ( not ( = ?auto_2444484 ?auto_2444492 ) ) ( not ( = ?auto_2444484 ?auto_2444493 ) ) ( not ( = ?auto_2444484 ?auto_2444494 ) ) ( not ( = ?auto_2444484 ?auto_2444495 ) ) ( not ( = ?auto_2444484 ?auto_2444501 ) ) ( not ( = ?auto_2444485 ?auto_2444482 ) ) ( not ( = ?auto_2444485 ?auto_2444486 ) ) ( not ( = ?auto_2444485 ?auto_2444488 ) ) ( not ( = ?auto_2444485 ?auto_2444487 ) ) ( not ( = ?auto_2444485 ?auto_2444489 ) ) ( not ( = ?auto_2444485 ?auto_2444490 ) ) ( not ( = ?auto_2444485 ?auto_2444491 ) ) ( not ( = ?auto_2444485 ?auto_2444492 ) ) ( not ( = ?auto_2444485 ?auto_2444493 ) ) ( not ( = ?auto_2444485 ?auto_2444494 ) ) ( not ( = ?auto_2444485 ?auto_2444495 ) ) ( not ( = ?auto_2444485 ?auto_2444501 ) ) ( not ( = ?auto_2444482 ?auto_2444486 ) ) ( not ( = ?auto_2444482 ?auto_2444488 ) ) ( not ( = ?auto_2444482 ?auto_2444487 ) ) ( not ( = ?auto_2444482 ?auto_2444489 ) ) ( not ( = ?auto_2444482 ?auto_2444490 ) ) ( not ( = ?auto_2444482 ?auto_2444491 ) ) ( not ( = ?auto_2444482 ?auto_2444492 ) ) ( not ( = ?auto_2444482 ?auto_2444493 ) ) ( not ( = ?auto_2444482 ?auto_2444494 ) ) ( not ( = ?auto_2444482 ?auto_2444495 ) ) ( not ( = ?auto_2444482 ?auto_2444501 ) ) ( not ( = ?auto_2444486 ?auto_2444488 ) ) ( not ( = ?auto_2444486 ?auto_2444487 ) ) ( not ( = ?auto_2444486 ?auto_2444489 ) ) ( not ( = ?auto_2444486 ?auto_2444490 ) ) ( not ( = ?auto_2444486 ?auto_2444491 ) ) ( not ( = ?auto_2444486 ?auto_2444492 ) ) ( not ( = ?auto_2444486 ?auto_2444493 ) ) ( not ( = ?auto_2444486 ?auto_2444494 ) ) ( not ( = ?auto_2444486 ?auto_2444495 ) ) ( not ( = ?auto_2444486 ?auto_2444501 ) ) ( not ( = ?auto_2444488 ?auto_2444487 ) ) ( not ( = ?auto_2444488 ?auto_2444489 ) ) ( not ( = ?auto_2444488 ?auto_2444490 ) ) ( not ( = ?auto_2444488 ?auto_2444491 ) ) ( not ( = ?auto_2444488 ?auto_2444492 ) ) ( not ( = ?auto_2444488 ?auto_2444493 ) ) ( not ( = ?auto_2444488 ?auto_2444494 ) ) ( not ( = ?auto_2444488 ?auto_2444495 ) ) ( not ( = ?auto_2444488 ?auto_2444501 ) ) ( not ( = ?auto_2444487 ?auto_2444489 ) ) ( not ( = ?auto_2444487 ?auto_2444490 ) ) ( not ( = ?auto_2444487 ?auto_2444491 ) ) ( not ( = ?auto_2444487 ?auto_2444492 ) ) ( not ( = ?auto_2444487 ?auto_2444493 ) ) ( not ( = ?auto_2444487 ?auto_2444494 ) ) ( not ( = ?auto_2444487 ?auto_2444495 ) ) ( not ( = ?auto_2444487 ?auto_2444501 ) ) ( not ( = ?auto_2444489 ?auto_2444490 ) ) ( not ( = ?auto_2444489 ?auto_2444491 ) ) ( not ( = ?auto_2444489 ?auto_2444492 ) ) ( not ( = ?auto_2444489 ?auto_2444493 ) ) ( not ( = ?auto_2444489 ?auto_2444494 ) ) ( not ( = ?auto_2444489 ?auto_2444495 ) ) ( not ( = ?auto_2444489 ?auto_2444501 ) ) ( not ( = ?auto_2444490 ?auto_2444491 ) ) ( not ( = ?auto_2444490 ?auto_2444492 ) ) ( not ( = ?auto_2444490 ?auto_2444493 ) ) ( not ( = ?auto_2444490 ?auto_2444494 ) ) ( not ( = ?auto_2444490 ?auto_2444495 ) ) ( not ( = ?auto_2444490 ?auto_2444501 ) ) ( not ( = ?auto_2444491 ?auto_2444492 ) ) ( not ( = ?auto_2444491 ?auto_2444493 ) ) ( not ( = ?auto_2444491 ?auto_2444494 ) ) ( not ( = ?auto_2444491 ?auto_2444495 ) ) ( not ( = ?auto_2444491 ?auto_2444501 ) ) ( not ( = ?auto_2444492 ?auto_2444493 ) ) ( not ( = ?auto_2444492 ?auto_2444494 ) ) ( not ( = ?auto_2444492 ?auto_2444495 ) ) ( not ( = ?auto_2444492 ?auto_2444501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2444493 ?auto_2444494 ?auto_2444495 )
      ( MAKE-13CRATE-VERIFY ?auto_2444483 ?auto_2444484 ?auto_2444485 ?auto_2444482 ?auto_2444486 ?auto_2444488 ?auto_2444487 ?auto_2444489 ?auto_2444490 ?auto_2444491 ?auto_2444492 ?auto_2444493 ?auto_2444494 ?auto_2444495 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2444666 - SURFACE
      ?auto_2444667 - SURFACE
      ?auto_2444668 - SURFACE
      ?auto_2444665 - SURFACE
      ?auto_2444669 - SURFACE
      ?auto_2444671 - SURFACE
      ?auto_2444670 - SURFACE
      ?auto_2444672 - SURFACE
      ?auto_2444673 - SURFACE
      ?auto_2444674 - SURFACE
      ?auto_2444675 - SURFACE
      ?auto_2444676 - SURFACE
      ?auto_2444677 - SURFACE
      ?auto_2444678 - SURFACE
    )
    :vars
    (
      ?auto_2444681 - HOIST
      ?auto_2444684 - PLACE
      ?auto_2444682 - PLACE
      ?auto_2444680 - HOIST
      ?auto_2444683 - SURFACE
      ?auto_2444679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2444681 ?auto_2444684 ) ( IS-CRATE ?auto_2444678 ) ( not ( = ?auto_2444677 ?auto_2444678 ) ) ( not ( = ?auto_2444676 ?auto_2444677 ) ) ( not ( = ?auto_2444676 ?auto_2444678 ) ) ( not ( = ?auto_2444682 ?auto_2444684 ) ) ( HOIST-AT ?auto_2444680 ?auto_2444682 ) ( not ( = ?auto_2444681 ?auto_2444680 ) ) ( AVAILABLE ?auto_2444680 ) ( SURFACE-AT ?auto_2444678 ?auto_2444682 ) ( ON ?auto_2444678 ?auto_2444683 ) ( CLEAR ?auto_2444678 ) ( not ( = ?auto_2444677 ?auto_2444683 ) ) ( not ( = ?auto_2444678 ?auto_2444683 ) ) ( not ( = ?auto_2444676 ?auto_2444683 ) ) ( TRUCK-AT ?auto_2444679 ?auto_2444684 ) ( SURFACE-AT ?auto_2444676 ?auto_2444684 ) ( CLEAR ?auto_2444676 ) ( LIFTING ?auto_2444681 ?auto_2444677 ) ( IS-CRATE ?auto_2444677 ) ( ON ?auto_2444667 ?auto_2444666 ) ( ON ?auto_2444668 ?auto_2444667 ) ( ON ?auto_2444665 ?auto_2444668 ) ( ON ?auto_2444669 ?auto_2444665 ) ( ON ?auto_2444671 ?auto_2444669 ) ( ON ?auto_2444670 ?auto_2444671 ) ( ON ?auto_2444672 ?auto_2444670 ) ( ON ?auto_2444673 ?auto_2444672 ) ( ON ?auto_2444674 ?auto_2444673 ) ( ON ?auto_2444675 ?auto_2444674 ) ( ON ?auto_2444676 ?auto_2444675 ) ( not ( = ?auto_2444666 ?auto_2444667 ) ) ( not ( = ?auto_2444666 ?auto_2444668 ) ) ( not ( = ?auto_2444666 ?auto_2444665 ) ) ( not ( = ?auto_2444666 ?auto_2444669 ) ) ( not ( = ?auto_2444666 ?auto_2444671 ) ) ( not ( = ?auto_2444666 ?auto_2444670 ) ) ( not ( = ?auto_2444666 ?auto_2444672 ) ) ( not ( = ?auto_2444666 ?auto_2444673 ) ) ( not ( = ?auto_2444666 ?auto_2444674 ) ) ( not ( = ?auto_2444666 ?auto_2444675 ) ) ( not ( = ?auto_2444666 ?auto_2444676 ) ) ( not ( = ?auto_2444666 ?auto_2444677 ) ) ( not ( = ?auto_2444666 ?auto_2444678 ) ) ( not ( = ?auto_2444666 ?auto_2444683 ) ) ( not ( = ?auto_2444667 ?auto_2444668 ) ) ( not ( = ?auto_2444667 ?auto_2444665 ) ) ( not ( = ?auto_2444667 ?auto_2444669 ) ) ( not ( = ?auto_2444667 ?auto_2444671 ) ) ( not ( = ?auto_2444667 ?auto_2444670 ) ) ( not ( = ?auto_2444667 ?auto_2444672 ) ) ( not ( = ?auto_2444667 ?auto_2444673 ) ) ( not ( = ?auto_2444667 ?auto_2444674 ) ) ( not ( = ?auto_2444667 ?auto_2444675 ) ) ( not ( = ?auto_2444667 ?auto_2444676 ) ) ( not ( = ?auto_2444667 ?auto_2444677 ) ) ( not ( = ?auto_2444667 ?auto_2444678 ) ) ( not ( = ?auto_2444667 ?auto_2444683 ) ) ( not ( = ?auto_2444668 ?auto_2444665 ) ) ( not ( = ?auto_2444668 ?auto_2444669 ) ) ( not ( = ?auto_2444668 ?auto_2444671 ) ) ( not ( = ?auto_2444668 ?auto_2444670 ) ) ( not ( = ?auto_2444668 ?auto_2444672 ) ) ( not ( = ?auto_2444668 ?auto_2444673 ) ) ( not ( = ?auto_2444668 ?auto_2444674 ) ) ( not ( = ?auto_2444668 ?auto_2444675 ) ) ( not ( = ?auto_2444668 ?auto_2444676 ) ) ( not ( = ?auto_2444668 ?auto_2444677 ) ) ( not ( = ?auto_2444668 ?auto_2444678 ) ) ( not ( = ?auto_2444668 ?auto_2444683 ) ) ( not ( = ?auto_2444665 ?auto_2444669 ) ) ( not ( = ?auto_2444665 ?auto_2444671 ) ) ( not ( = ?auto_2444665 ?auto_2444670 ) ) ( not ( = ?auto_2444665 ?auto_2444672 ) ) ( not ( = ?auto_2444665 ?auto_2444673 ) ) ( not ( = ?auto_2444665 ?auto_2444674 ) ) ( not ( = ?auto_2444665 ?auto_2444675 ) ) ( not ( = ?auto_2444665 ?auto_2444676 ) ) ( not ( = ?auto_2444665 ?auto_2444677 ) ) ( not ( = ?auto_2444665 ?auto_2444678 ) ) ( not ( = ?auto_2444665 ?auto_2444683 ) ) ( not ( = ?auto_2444669 ?auto_2444671 ) ) ( not ( = ?auto_2444669 ?auto_2444670 ) ) ( not ( = ?auto_2444669 ?auto_2444672 ) ) ( not ( = ?auto_2444669 ?auto_2444673 ) ) ( not ( = ?auto_2444669 ?auto_2444674 ) ) ( not ( = ?auto_2444669 ?auto_2444675 ) ) ( not ( = ?auto_2444669 ?auto_2444676 ) ) ( not ( = ?auto_2444669 ?auto_2444677 ) ) ( not ( = ?auto_2444669 ?auto_2444678 ) ) ( not ( = ?auto_2444669 ?auto_2444683 ) ) ( not ( = ?auto_2444671 ?auto_2444670 ) ) ( not ( = ?auto_2444671 ?auto_2444672 ) ) ( not ( = ?auto_2444671 ?auto_2444673 ) ) ( not ( = ?auto_2444671 ?auto_2444674 ) ) ( not ( = ?auto_2444671 ?auto_2444675 ) ) ( not ( = ?auto_2444671 ?auto_2444676 ) ) ( not ( = ?auto_2444671 ?auto_2444677 ) ) ( not ( = ?auto_2444671 ?auto_2444678 ) ) ( not ( = ?auto_2444671 ?auto_2444683 ) ) ( not ( = ?auto_2444670 ?auto_2444672 ) ) ( not ( = ?auto_2444670 ?auto_2444673 ) ) ( not ( = ?auto_2444670 ?auto_2444674 ) ) ( not ( = ?auto_2444670 ?auto_2444675 ) ) ( not ( = ?auto_2444670 ?auto_2444676 ) ) ( not ( = ?auto_2444670 ?auto_2444677 ) ) ( not ( = ?auto_2444670 ?auto_2444678 ) ) ( not ( = ?auto_2444670 ?auto_2444683 ) ) ( not ( = ?auto_2444672 ?auto_2444673 ) ) ( not ( = ?auto_2444672 ?auto_2444674 ) ) ( not ( = ?auto_2444672 ?auto_2444675 ) ) ( not ( = ?auto_2444672 ?auto_2444676 ) ) ( not ( = ?auto_2444672 ?auto_2444677 ) ) ( not ( = ?auto_2444672 ?auto_2444678 ) ) ( not ( = ?auto_2444672 ?auto_2444683 ) ) ( not ( = ?auto_2444673 ?auto_2444674 ) ) ( not ( = ?auto_2444673 ?auto_2444675 ) ) ( not ( = ?auto_2444673 ?auto_2444676 ) ) ( not ( = ?auto_2444673 ?auto_2444677 ) ) ( not ( = ?auto_2444673 ?auto_2444678 ) ) ( not ( = ?auto_2444673 ?auto_2444683 ) ) ( not ( = ?auto_2444674 ?auto_2444675 ) ) ( not ( = ?auto_2444674 ?auto_2444676 ) ) ( not ( = ?auto_2444674 ?auto_2444677 ) ) ( not ( = ?auto_2444674 ?auto_2444678 ) ) ( not ( = ?auto_2444674 ?auto_2444683 ) ) ( not ( = ?auto_2444675 ?auto_2444676 ) ) ( not ( = ?auto_2444675 ?auto_2444677 ) ) ( not ( = ?auto_2444675 ?auto_2444678 ) ) ( not ( = ?auto_2444675 ?auto_2444683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2444676 ?auto_2444677 ?auto_2444678 )
      ( MAKE-13CRATE-VERIFY ?auto_2444666 ?auto_2444667 ?auto_2444668 ?auto_2444665 ?auto_2444669 ?auto_2444671 ?auto_2444670 ?auto_2444672 ?auto_2444673 ?auto_2444674 ?auto_2444675 ?auto_2444676 ?auto_2444677 ?auto_2444678 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2444849 - SURFACE
      ?auto_2444850 - SURFACE
      ?auto_2444851 - SURFACE
      ?auto_2444848 - SURFACE
      ?auto_2444852 - SURFACE
      ?auto_2444854 - SURFACE
      ?auto_2444853 - SURFACE
      ?auto_2444855 - SURFACE
      ?auto_2444856 - SURFACE
      ?auto_2444857 - SURFACE
      ?auto_2444858 - SURFACE
      ?auto_2444859 - SURFACE
      ?auto_2444860 - SURFACE
      ?auto_2444861 - SURFACE
    )
    :vars
    (
      ?auto_2444862 - HOIST
      ?auto_2444864 - PLACE
      ?auto_2444867 - PLACE
      ?auto_2444863 - HOIST
      ?auto_2444865 - SURFACE
      ?auto_2444866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2444862 ?auto_2444864 ) ( IS-CRATE ?auto_2444861 ) ( not ( = ?auto_2444860 ?auto_2444861 ) ) ( not ( = ?auto_2444859 ?auto_2444860 ) ) ( not ( = ?auto_2444859 ?auto_2444861 ) ) ( not ( = ?auto_2444867 ?auto_2444864 ) ) ( HOIST-AT ?auto_2444863 ?auto_2444867 ) ( not ( = ?auto_2444862 ?auto_2444863 ) ) ( AVAILABLE ?auto_2444863 ) ( SURFACE-AT ?auto_2444861 ?auto_2444867 ) ( ON ?auto_2444861 ?auto_2444865 ) ( CLEAR ?auto_2444861 ) ( not ( = ?auto_2444860 ?auto_2444865 ) ) ( not ( = ?auto_2444861 ?auto_2444865 ) ) ( not ( = ?auto_2444859 ?auto_2444865 ) ) ( TRUCK-AT ?auto_2444866 ?auto_2444864 ) ( SURFACE-AT ?auto_2444859 ?auto_2444864 ) ( CLEAR ?auto_2444859 ) ( IS-CRATE ?auto_2444860 ) ( AVAILABLE ?auto_2444862 ) ( IN ?auto_2444860 ?auto_2444866 ) ( ON ?auto_2444850 ?auto_2444849 ) ( ON ?auto_2444851 ?auto_2444850 ) ( ON ?auto_2444848 ?auto_2444851 ) ( ON ?auto_2444852 ?auto_2444848 ) ( ON ?auto_2444854 ?auto_2444852 ) ( ON ?auto_2444853 ?auto_2444854 ) ( ON ?auto_2444855 ?auto_2444853 ) ( ON ?auto_2444856 ?auto_2444855 ) ( ON ?auto_2444857 ?auto_2444856 ) ( ON ?auto_2444858 ?auto_2444857 ) ( ON ?auto_2444859 ?auto_2444858 ) ( not ( = ?auto_2444849 ?auto_2444850 ) ) ( not ( = ?auto_2444849 ?auto_2444851 ) ) ( not ( = ?auto_2444849 ?auto_2444848 ) ) ( not ( = ?auto_2444849 ?auto_2444852 ) ) ( not ( = ?auto_2444849 ?auto_2444854 ) ) ( not ( = ?auto_2444849 ?auto_2444853 ) ) ( not ( = ?auto_2444849 ?auto_2444855 ) ) ( not ( = ?auto_2444849 ?auto_2444856 ) ) ( not ( = ?auto_2444849 ?auto_2444857 ) ) ( not ( = ?auto_2444849 ?auto_2444858 ) ) ( not ( = ?auto_2444849 ?auto_2444859 ) ) ( not ( = ?auto_2444849 ?auto_2444860 ) ) ( not ( = ?auto_2444849 ?auto_2444861 ) ) ( not ( = ?auto_2444849 ?auto_2444865 ) ) ( not ( = ?auto_2444850 ?auto_2444851 ) ) ( not ( = ?auto_2444850 ?auto_2444848 ) ) ( not ( = ?auto_2444850 ?auto_2444852 ) ) ( not ( = ?auto_2444850 ?auto_2444854 ) ) ( not ( = ?auto_2444850 ?auto_2444853 ) ) ( not ( = ?auto_2444850 ?auto_2444855 ) ) ( not ( = ?auto_2444850 ?auto_2444856 ) ) ( not ( = ?auto_2444850 ?auto_2444857 ) ) ( not ( = ?auto_2444850 ?auto_2444858 ) ) ( not ( = ?auto_2444850 ?auto_2444859 ) ) ( not ( = ?auto_2444850 ?auto_2444860 ) ) ( not ( = ?auto_2444850 ?auto_2444861 ) ) ( not ( = ?auto_2444850 ?auto_2444865 ) ) ( not ( = ?auto_2444851 ?auto_2444848 ) ) ( not ( = ?auto_2444851 ?auto_2444852 ) ) ( not ( = ?auto_2444851 ?auto_2444854 ) ) ( not ( = ?auto_2444851 ?auto_2444853 ) ) ( not ( = ?auto_2444851 ?auto_2444855 ) ) ( not ( = ?auto_2444851 ?auto_2444856 ) ) ( not ( = ?auto_2444851 ?auto_2444857 ) ) ( not ( = ?auto_2444851 ?auto_2444858 ) ) ( not ( = ?auto_2444851 ?auto_2444859 ) ) ( not ( = ?auto_2444851 ?auto_2444860 ) ) ( not ( = ?auto_2444851 ?auto_2444861 ) ) ( not ( = ?auto_2444851 ?auto_2444865 ) ) ( not ( = ?auto_2444848 ?auto_2444852 ) ) ( not ( = ?auto_2444848 ?auto_2444854 ) ) ( not ( = ?auto_2444848 ?auto_2444853 ) ) ( not ( = ?auto_2444848 ?auto_2444855 ) ) ( not ( = ?auto_2444848 ?auto_2444856 ) ) ( not ( = ?auto_2444848 ?auto_2444857 ) ) ( not ( = ?auto_2444848 ?auto_2444858 ) ) ( not ( = ?auto_2444848 ?auto_2444859 ) ) ( not ( = ?auto_2444848 ?auto_2444860 ) ) ( not ( = ?auto_2444848 ?auto_2444861 ) ) ( not ( = ?auto_2444848 ?auto_2444865 ) ) ( not ( = ?auto_2444852 ?auto_2444854 ) ) ( not ( = ?auto_2444852 ?auto_2444853 ) ) ( not ( = ?auto_2444852 ?auto_2444855 ) ) ( not ( = ?auto_2444852 ?auto_2444856 ) ) ( not ( = ?auto_2444852 ?auto_2444857 ) ) ( not ( = ?auto_2444852 ?auto_2444858 ) ) ( not ( = ?auto_2444852 ?auto_2444859 ) ) ( not ( = ?auto_2444852 ?auto_2444860 ) ) ( not ( = ?auto_2444852 ?auto_2444861 ) ) ( not ( = ?auto_2444852 ?auto_2444865 ) ) ( not ( = ?auto_2444854 ?auto_2444853 ) ) ( not ( = ?auto_2444854 ?auto_2444855 ) ) ( not ( = ?auto_2444854 ?auto_2444856 ) ) ( not ( = ?auto_2444854 ?auto_2444857 ) ) ( not ( = ?auto_2444854 ?auto_2444858 ) ) ( not ( = ?auto_2444854 ?auto_2444859 ) ) ( not ( = ?auto_2444854 ?auto_2444860 ) ) ( not ( = ?auto_2444854 ?auto_2444861 ) ) ( not ( = ?auto_2444854 ?auto_2444865 ) ) ( not ( = ?auto_2444853 ?auto_2444855 ) ) ( not ( = ?auto_2444853 ?auto_2444856 ) ) ( not ( = ?auto_2444853 ?auto_2444857 ) ) ( not ( = ?auto_2444853 ?auto_2444858 ) ) ( not ( = ?auto_2444853 ?auto_2444859 ) ) ( not ( = ?auto_2444853 ?auto_2444860 ) ) ( not ( = ?auto_2444853 ?auto_2444861 ) ) ( not ( = ?auto_2444853 ?auto_2444865 ) ) ( not ( = ?auto_2444855 ?auto_2444856 ) ) ( not ( = ?auto_2444855 ?auto_2444857 ) ) ( not ( = ?auto_2444855 ?auto_2444858 ) ) ( not ( = ?auto_2444855 ?auto_2444859 ) ) ( not ( = ?auto_2444855 ?auto_2444860 ) ) ( not ( = ?auto_2444855 ?auto_2444861 ) ) ( not ( = ?auto_2444855 ?auto_2444865 ) ) ( not ( = ?auto_2444856 ?auto_2444857 ) ) ( not ( = ?auto_2444856 ?auto_2444858 ) ) ( not ( = ?auto_2444856 ?auto_2444859 ) ) ( not ( = ?auto_2444856 ?auto_2444860 ) ) ( not ( = ?auto_2444856 ?auto_2444861 ) ) ( not ( = ?auto_2444856 ?auto_2444865 ) ) ( not ( = ?auto_2444857 ?auto_2444858 ) ) ( not ( = ?auto_2444857 ?auto_2444859 ) ) ( not ( = ?auto_2444857 ?auto_2444860 ) ) ( not ( = ?auto_2444857 ?auto_2444861 ) ) ( not ( = ?auto_2444857 ?auto_2444865 ) ) ( not ( = ?auto_2444858 ?auto_2444859 ) ) ( not ( = ?auto_2444858 ?auto_2444860 ) ) ( not ( = ?auto_2444858 ?auto_2444861 ) ) ( not ( = ?auto_2444858 ?auto_2444865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2444859 ?auto_2444860 ?auto_2444861 )
      ( MAKE-13CRATE-VERIFY ?auto_2444849 ?auto_2444850 ?auto_2444851 ?auto_2444848 ?auto_2444852 ?auto_2444854 ?auto_2444853 ?auto_2444855 ?auto_2444856 ?auto_2444857 ?auto_2444858 ?auto_2444859 ?auto_2444860 ?auto_2444861 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2459033 - SURFACE
      ?auto_2459034 - SURFACE
      ?auto_2459035 - SURFACE
      ?auto_2459032 - SURFACE
      ?auto_2459036 - SURFACE
      ?auto_2459038 - SURFACE
      ?auto_2459037 - SURFACE
      ?auto_2459039 - SURFACE
      ?auto_2459040 - SURFACE
      ?auto_2459041 - SURFACE
      ?auto_2459042 - SURFACE
      ?auto_2459043 - SURFACE
      ?auto_2459044 - SURFACE
      ?auto_2459045 - SURFACE
      ?auto_2459046 - SURFACE
    )
    :vars
    (
      ?auto_2459047 - HOIST
      ?auto_2459048 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2459047 ?auto_2459048 ) ( SURFACE-AT ?auto_2459045 ?auto_2459048 ) ( CLEAR ?auto_2459045 ) ( LIFTING ?auto_2459047 ?auto_2459046 ) ( IS-CRATE ?auto_2459046 ) ( not ( = ?auto_2459045 ?auto_2459046 ) ) ( ON ?auto_2459034 ?auto_2459033 ) ( ON ?auto_2459035 ?auto_2459034 ) ( ON ?auto_2459032 ?auto_2459035 ) ( ON ?auto_2459036 ?auto_2459032 ) ( ON ?auto_2459038 ?auto_2459036 ) ( ON ?auto_2459037 ?auto_2459038 ) ( ON ?auto_2459039 ?auto_2459037 ) ( ON ?auto_2459040 ?auto_2459039 ) ( ON ?auto_2459041 ?auto_2459040 ) ( ON ?auto_2459042 ?auto_2459041 ) ( ON ?auto_2459043 ?auto_2459042 ) ( ON ?auto_2459044 ?auto_2459043 ) ( ON ?auto_2459045 ?auto_2459044 ) ( not ( = ?auto_2459033 ?auto_2459034 ) ) ( not ( = ?auto_2459033 ?auto_2459035 ) ) ( not ( = ?auto_2459033 ?auto_2459032 ) ) ( not ( = ?auto_2459033 ?auto_2459036 ) ) ( not ( = ?auto_2459033 ?auto_2459038 ) ) ( not ( = ?auto_2459033 ?auto_2459037 ) ) ( not ( = ?auto_2459033 ?auto_2459039 ) ) ( not ( = ?auto_2459033 ?auto_2459040 ) ) ( not ( = ?auto_2459033 ?auto_2459041 ) ) ( not ( = ?auto_2459033 ?auto_2459042 ) ) ( not ( = ?auto_2459033 ?auto_2459043 ) ) ( not ( = ?auto_2459033 ?auto_2459044 ) ) ( not ( = ?auto_2459033 ?auto_2459045 ) ) ( not ( = ?auto_2459033 ?auto_2459046 ) ) ( not ( = ?auto_2459034 ?auto_2459035 ) ) ( not ( = ?auto_2459034 ?auto_2459032 ) ) ( not ( = ?auto_2459034 ?auto_2459036 ) ) ( not ( = ?auto_2459034 ?auto_2459038 ) ) ( not ( = ?auto_2459034 ?auto_2459037 ) ) ( not ( = ?auto_2459034 ?auto_2459039 ) ) ( not ( = ?auto_2459034 ?auto_2459040 ) ) ( not ( = ?auto_2459034 ?auto_2459041 ) ) ( not ( = ?auto_2459034 ?auto_2459042 ) ) ( not ( = ?auto_2459034 ?auto_2459043 ) ) ( not ( = ?auto_2459034 ?auto_2459044 ) ) ( not ( = ?auto_2459034 ?auto_2459045 ) ) ( not ( = ?auto_2459034 ?auto_2459046 ) ) ( not ( = ?auto_2459035 ?auto_2459032 ) ) ( not ( = ?auto_2459035 ?auto_2459036 ) ) ( not ( = ?auto_2459035 ?auto_2459038 ) ) ( not ( = ?auto_2459035 ?auto_2459037 ) ) ( not ( = ?auto_2459035 ?auto_2459039 ) ) ( not ( = ?auto_2459035 ?auto_2459040 ) ) ( not ( = ?auto_2459035 ?auto_2459041 ) ) ( not ( = ?auto_2459035 ?auto_2459042 ) ) ( not ( = ?auto_2459035 ?auto_2459043 ) ) ( not ( = ?auto_2459035 ?auto_2459044 ) ) ( not ( = ?auto_2459035 ?auto_2459045 ) ) ( not ( = ?auto_2459035 ?auto_2459046 ) ) ( not ( = ?auto_2459032 ?auto_2459036 ) ) ( not ( = ?auto_2459032 ?auto_2459038 ) ) ( not ( = ?auto_2459032 ?auto_2459037 ) ) ( not ( = ?auto_2459032 ?auto_2459039 ) ) ( not ( = ?auto_2459032 ?auto_2459040 ) ) ( not ( = ?auto_2459032 ?auto_2459041 ) ) ( not ( = ?auto_2459032 ?auto_2459042 ) ) ( not ( = ?auto_2459032 ?auto_2459043 ) ) ( not ( = ?auto_2459032 ?auto_2459044 ) ) ( not ( = ?auto_2459032 ?auto_2459045 ) ) ( not ( = ?auto_2459032 ?auto_2459046 ) ) ( not ( = ?auto_2459036 ?auto_2459038 ) ) ( not ( = ?auto_2459036 ?auto_2459037 ) ) ( not ( = ?auto_2459036 ?auto_2459039 ) ) ( not ( = ?auto_2459036 ?auto_2459040 ) ) ( not ( = ?auto_2459036 ?auto_2459041 ) ) ( not ( = ?auto_2459036 ?auto_2459042 ) ) ( not ( = ?auto_2459036 ?auto_2459043 ) ) ( not ( = ?auto_2459036 ?auto_2459044 ) ) ( not ( = ?auto_2459036 ?auto_2459045 ) ) ( not ( = ?auto_2459036 ?auto_2459046 ) ) ( not ( = ?auto_2459038 ?auto_2459037 ) ) ( not ( = ?auto_2459038 ?auto_2459039 ) ) ( not ( = ?auto_2459038 ?auto_2459040 ) ) ( not ( = ?auto_2459038 ?auto_2459041 ) ) ( not ( = ?auto_2459038 ?auto_2459042 ) ) ( not ( = ?auto_2459038 ?auto_2459043 ) ) ( not ( = ?auto_2459038 ?auto_2459044 ) ) ( not ( = ?auto_2459038 ?auto_2459045 ) ) ( not ( = ?auto_2459038 ?auto_2459046 ) ) ( not ( = ?auto_2459037 ?auto_2459039 ) ) ( not ( = ?auto_2459037 ?auto_2459040 ) ) ( not ( = ?auto_2459037 ?auto_2459041 ) ) ( not ( = ?auto_2459037 ?auto_2459042 ) ) ( not ( = ?auto_2459037 ?auto_2459043 ) ) ( not ( = ?auto_2459037 ?auto_2459044 ) ) ( not ( = ?auto_2459037 ?auto_2459045 ) ) ( not ( = ?auto_2459037 ?auto_2459046 ) ) ( not ( = ?auto_2459039 ?auto_2459040 ) ) ( not ( = ?auto_2459039 ?auto_2459041 ) ) ( not ( = ?auto_2459039 ?auto_2459042 ) ) ( not ( = ?auto_2459039 ?auto_2459043 ) ) ( not ( = ?auto_2459039 ?auto_2459044 ) ) ( not ( = ?auto_2459039 ?auto_2459045 ) ) ( not ( = ?auto_2459039 ?auto_2459046 ) ) ( not ( = ?auto_2459040 ?auto_2459041 ) ) ( not ( = ?auto_2459040 ?auto_2459042 ) ) ( not ( = ?auto_2459040 ?auto_2459043 ) ) ( not ( = ?auto_2459040 ?auto_2459044 ) ) ( not ( = ?auto_2459040 ?auto_2459045 ) ) ( not ( = ?auto_2459040 ?auto_2459046 ) ) ( not ( = ?auto_2459041 ?auto_2459042 ) ) ( not ( = ?auto_2459041 ?auto_2459043 ) ) ( not ( = ?auto_2459041 ?auto_2459044 ) ) ( not ( = ?auto_2459041 ?auto_2459045 ) ) ( not ( = ?auto_2459041 ?auto_2459046 ) ) ( not ( = ?auto_2459042 ?auto_2459043 ) ) ( not ( = ?auto_2459042 ?auto_2459044 ) ) ( not ( = ?auto_2459042 ?auto_2459045 ) ) ( not ( = ?auto_2459042 ?auto_2459046 ) ) ( not ( = ?auto_2459043 ?auto_2459044 ) ) ( not ( = ?auto_2459043 ?auto_2459045 ) ) ( not ( = ?auto_2459043 ?auto_2459046 ) ) ( not ( = ?auto_2459044 ?auto_2459045 ) ) ( not ( = ?auto_2459044 ?auto_2459046 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2459045 ?auto_2459046 )
      ( MAKE-14CRATE-VERIFY ?auto_2459033 ?auto_2459034 ?auto_2459035 ?auto_2459032 ?auto_2459036 ?auto_2459038 ?auto_2459037 ?auto_2459039 ?auto_2459040 ?auto_2459041 ?auto_2459042 ?auto_2459043 ?auto_2459044 ?auto_2459045 ?auto_2459046 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2459193 - SURFACE
      ?auto_2459194 - SURFACE
      ?auto_2459195 - SURFACE
      ?auto_2459192 - SURFACE
      ?auto_2459196 - SURFACE
      ?auto_2459198 - SURFACE
      ?auto_2459197 - SURFACE
      ?auto_2459199 - SURFACE
      ?auto_2459200 - SURFACE
      ?auto_2459201 - SURFACE
      ?auto_2459202 - SURFACE
      ?auto_2459203 - SURFACE
      ?auto_2459204 - SURFACE
      ?auto_2459205 - SURFACE
      ?auto_2459206 - SURFACE
    )
    :vars
    (
      ?auto_2459208 - HOIST
      ?auto_2459209 - PLACE
      ?auto_2459207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2459208 ?auto_2459209 ) ( SURFACE-AT ?auto_2459205 ?auto_2459209 ) ( CLEAR ?auto_2459205 ) ( IS-CRATE ?auto_2459206 ) ( not ( = ?auto_2459205 ?auto_2459206 ) ) ( TRUCK-AT ?auto_2459207 ?auto_2459209 ) ( AVAILABLE ?auto_2459208 ) ( IN ?auto_2459206 ?auto_2459207 ) ( ON ?auto_2459205 ?auto_2459204 ) ( not ( = ?auto_2459204 ?auto_2459205 ) ) ( not ( = ?auto_2459204 ?auto_2459206 ) ) ( ON ?auto_2459194 ?auto_2459193 ) ( ON ?auto_2459195 ?auto_2459194 ) ( ON ?auto_2459192 ?auto_2459195 ) ( ON ?auto_2459196 ?auto_2459192 ) ( ON ?auto_2459198 ?auto_2459196 ) ( ON ?auto_2459197 ?auto_2459198 ) ( ON ?auto_2459199 ?auto_2459197 ) ( ON ?auto_2459200 ?auto_2459199 ) ( ON ?auto_2459201 ?auto_2459200 ) ( ON ?auto_2459202 ?auto_2459201 ) ( ON ?auto_2459203 ?auto_2459202 ) ( ON ?auto_2459204 ?auto_2459203 ) ( not ( = ?auto_2459193 ?auto_2459194 ) ) ( not ( = ?auto_2459193 ?auto_2459195 ) ) ( not ( = ?auto_2459193 ?auto_2459192 ) ) ( not ( = ?auto_2459193 ?auto_2459196 ) ) ( not ( = ?auto_2459193 ?auto_2459198 ) ) ( not ( = ?auto_2459193 ?auto_2459197 ) ) ( not ( = ?auto_2459193 ?auto_2459199 ) ) ( not ( = ?auto_2459193 ?auto_2459200 ) ) ( not ( = ?auto_2459193 ?auto_2459201 ) ) ( not ( = ?auto_2459193 ?auto_2459202 ) ) ( not ( = ?auto_2459193 ?auto_2459203 ) ) ( not ( = ?auto_2459193 ?auto_2459204 ) ) ( not ( = ?auto_2459193 ?auto_2459205 ) ) ( not ( = ?auto_2459193 ?auto_2459206 ) ) ( not ( = ?auto_2459194 ?auto_2459195 ) ) ( not ( = ?auto_2459194 ?auto_2459192 ) ) ( not ( = ?auto_2459194 ?auto_2459196 ) ) ( not ( = ?auto_2459194 ?auto_2459198 ) ) ( not ( = ?auto_2459194 ?auto_2459197 ) ) ( not ( = ?auto_2459194 ?auto_2459199 ) ) ( not ( = ?auto_2459194 ?auto_2459200 ) ) ( not ( = ?auto_2459194 ?auto_2459201 ) ) ( not ( = ?auto_2459194 ?auto_2459202 ) ) ( not ( = ?auto_2459194 ?auto_2459203 ) ) ( not ( = ?auto_2459194 ?auto_2459204 ) ) ( not ( = ?auto_2459194 ?auto_2459205 ) ) ( not ( = ?auto_2459194 ?auto_2459206 ) ) ( not ( = ?auto_2459195 ?auto_2459192 ) ) ( not ( = ?auto_2459195 ?auto_2459196 ) ) ( not ( = ?auto_2459195 ?auto_2459198 ) ) ( not ( = ?auto_2459195 ?auto_2459197 ) ) ( not ( = ?auto_2459195 ?auto_2459199 ) ) ( not ( = ?auto_2459195 ?auto_2459200 ) ) ( not ( = ?auto_2459195 ?auto_2459201 ) ) ( not ( = ?auto_2459195 ?auto_2459202 ) ) ( not ( = ?auto_2459195 ?auto_2459203 ) ) ( not ( = ?auto_2459195 ?auto_2459204 ) ) ( not ( = ?auto_2459195 ?auto_2459205 ) ) ( not ( = ?auto_2459195 ?auto_2459206 ) ) ( not ( = ?auto_2459192 ?auto_2459196 ) ) ( not ( = ?auto_2459192 ?auto_2459198 ) ) ( not ( = ?auto_2459192 ?auto_2459197 ) ) ( not ( = ?auto_2459192 ?auto_2459199 ) ) ( not ( = ?auto_2459192 ?auto_2459200 ) ) ( not ( = ?auto_2459192 ?auto_2459201 ) ) ( not ( = ?auto_2459192 ?auto_2459202 ) ) ( not ( = ?auto_2459192 ?auto_2459203 ) ) ( not ( = ?auto_2459192 ?auto_2459204 ) ) ( not ( = ?auto_2459192 ?auto_2459205 ) ) ( not ( = ?auto_2459192 ?auto_2459206 ) ) ( not ( = ?auto_2459196 ?auto_2459198 ) ) ( not ( = ?auto_2459196 ?auto_2459197 ) ) ( not ( = ?auto_2459196 ?auto_2459199 ) ) ( not ( = ?auto_2459196 ?auto_2459200 ) ) ( not ( = ?auto_2459196 ?auto_2459201 ) ) ( not ( = ?auto_2459196 ?auto_2459202 ) ) ( not ( = ?auto_2459196 ?auto_2459203 ) ) ( not ( = ?auto_2459196 ?auto_2459204 ) ) ( not ( = ?auto_2459196 ?auto_2459205 ) ) ( not ( = ?auto_2459196 ?auto_2459206 ) ) ( not ( = ?auto_2459198 ?auto_2459197 ) ) ( not ( = ?auto_2459198 ?auto_2459199 ) ) ( not ( = ?auto_2459198 ?auto_2459200 ) ) ( not ( = ?auto_2459198 ?auto_2459201 ) ) ( not ( = ?auto_2459198 ?auto_2459202 ) ) ( not ( = ?auto_2459198 ?auto_2459203 ) ) ( not ( = ?auto_2459198 ?auto_2459204 ) ) ( not ( = ?auto_2459198 ?auto_2459205 ) ) ( not ( = ?auto_2459198 ?auto_2459206 ) ) ( not ( = ?auto_2459197 ?auto_2459199 ) ) ( not ( = ?auto_2459197 ?auto_2459200 ) ) ( not ( = ?auto_2459197 ?auto_2459201 ) ) ( not ( = ?auto_2459197 ?auto_2459202 ) ) ( not ( = ?auto_2459197 ?auto_2459203 ) ) ( not ( = ?auto_2459197 ?auto_2459204 ) ) ( not ( = ?auto_2459197 ?auto_2459205 ) ) ( not ( = ?auto_2459197 ?auto_2459206 ) ) ( not ( = ?auto_2459199 ?auto_2459200 ) ) ( not ( = ?auto_2459199 ?auto_2459201 ) ) ( not ( = ?auto_2459199 ?auto_2459202 ) ) ( not ( = ?auto_2459199 ?auto_2459203 ) ) ( not ( = ?auto_2459199 ?auto_2459204 ) ) ( not ( = ?auto_2459199 ?auto_2459205 ) ) ( not ( = ?auto_2459199 ?auto_2459206 ) ) ( not ( = ?auto_2459200 ?auto_2459201 ) ) ( not ( = ?auto_2459200 ?auto_2459202 ) ) ( not ( = ?auto_2459200 ?auto_2459203 ) ) ( not ( = ?auto_2459200 ?auto_2459204 ) ) ( not ( = ?auto_2459200 ?auto_2459205 ) ) ( not ( = ?auto_2459200 ?auto_2459206 ) ) ( not ( = ?auto_2459201 ?auto_2459202 ) ) ( not ( = ?auto_2459201 ?auto_2459203 ) ) ( not ( = ?auto_2459201 ?auto_2459204 ) ) ( not ( = ?auto_2459201 ?auto_2459205 ) ) ( not ( = ?auto_2459201 ?auto_2459206 ) ) ( not ( = ?auto_2459202 ?auto_2459203 ) ) ( not ( = ?auto_2459202 ?auto_2459204 ) ) ( not ( = ?auto_2459202 ?auto_2459205 ) ) ( not ( = ?auto_2459202 ?auto_2459206 ) ) ( not ( = ?auto_2459203 ?auto_2459204 ) ) ( not ( = ?auto_2459203 ?auto_2459205 ) ) ( not ( = ?auto_2459203 ?auto_2459206 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2459204 ?auto_2459205 ?auto_2459206 )
      ( MAKE-14CRATE-VERIFY ?auto_2459193 ?auto_2459194 ?auto_2459195 ?auto_2459192 ?auto_2459196 ?auto_2459198 ?auto_2459197 ?auto_2459199 ?auto_2459200 ?auto_2459201 ?auto_2459202 ?auto_2459203 ?auto_2459204 ?auto_2459205 ?auto_2459206 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2459368 - SURFACE
      ?auto_2459369 - SURFACE
      ?auto_2459370 - SURFACE
      ?auto_2459367 - SURFACE
      ?auto_2459371 - SURFACE
      ?auto_2459373 - SURFACE
      ?auto_2459372 - SURFACE
      ?auto_2459374 - SURFACE
      ?auto_2459375 - SURFACE
      ?auto_2459376 - SURFACE
      ?auto_2459377 - SURFACE
      ?auto_2459378 - SURFACE
      ?auto_2459379 - SURFACE
      ?auto_2459380 - SURFACE
      ?auto_2459381 - SURFACE
    )
    :vars
    (
      ?auto_2459384 - HOIST
      ?auto_2459383 - PLACE
      ?auto_2459385 - TRUCK
      ?auto_2459382 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2459384 ?auto_2459383 ) ( SURFACE-AT ?auto_2459380 ?auto_2459383 ) ( CLEAR ?auto_2459380 ) ( IS-CRATE ?auto_2459381 ) ( not ( = ?auto_2459380 ?auto_2459381 ) ) ( AVAILABLE ?auto_2459384 ) ( IN ?auto_2459381 ?auto_2459385 ) ( ON ?auto_2459380 ?auto_2459379 ) ( not ( = ?auto_2459379 ?auto_2459380 ) ) ( not ( = ?auto_2459379 ?auto_2459381 ) ) ( TRUCK-AT ?auto_2459385 ?auto_2459382 ) ( not ( = ?auto_2459382 ?auto_2459383 ) ) ( ON ?auto_2459369 ?auto_2459368 ) ( ON ?auto_2459370 ?auto_2459369 ) ( ON ?auto_2459367 ?auto_2459370 ) ( ON ?auto_2459371 ?auto_2459367 ) ( ON ?auto_2459373 ?auto_2459371 ) ( ON ?auto_2459372 ?auto_2459373 ) ( ON ?auto_2459374 ?auto_2459372 ) ( ON ?auto_2459375 ?auto_2459374 ) ( ON ?auto_2459376 ?auto_2459375 ) ( ON ?auto_2459377 ?auto_2459376 ) ( ON ?auto_2459378 ?auto_2459377 ) ( ON ?auto_2459379 ?auto_2459378 ) ( not ( = ?auto_2459368 ?auto_2459369 ) ) ( not ( = ?auto_2459368 ?auto_2459370 ) ) ( not ( = ?auto_2459368 ?auto_2459367 ) ) ( not ( = ?auto_2459368 ?auto_2459371 ) ) ( not ( = ?auto_2459368 ?auto_2459373 ) ) ( not ( = ?auto_2459368 ?auto_2459372 ) ) ( not ( = ?auto_2459368 ?auto_2459374 ) ) ( not ( = ?auto_2459368 ?auto_2459375 ) ) ( not ( = ?auto_2459368 ?auto_2459376 ) ) ( not ( = ?auto_2459368 ?auto_2459377 ) ) ( not ( = ?auto_2459368 ?auto_2459378 ) ) ( not ( = ?auto_2459368 ?auto_2459379 ) ) ( not ( = ?auto_2459368 ?auto_2459380 ) ) ( not ( = ?auto_2459368 ?auto_2459381 ) ) ( not ( = ?auto_2459369 ?auto_2459370 ) ) ( not ( = ?auto_2459369 ?auto_2459367 ) ) ( not ( = ?auto_2459369 ?auto_2459371 ) ) ( not ( = ?auto_2459369 ?auto_2459373 ) ) ( not ( = ?auto_2459369 ?auto_2459372 ) ) ( not ( = ?auto_2459369 ?auto_2459374 ) ) ( not ( = ?auto_2459369 ?auto_2459375 ) ) ( not ( = ?auto_2459369 ?auto_2459376 ) ) ( not ( = ?auto_2459369 ?auto_2459377 ) ) ( not ( = ?auto_2459369 ?auto_2459378 ) ) ( not ( = ?auto_2459369 ?auto_2459379 ) ) ( not ( = ?auto_2459369 ?auto_2459380 ) ) ( not ( = ?auto_2459369 ?auto_2459381 ) ) ( not ( = ?auto_2459370 ?auto_2459367 ) ) ( not ( = ?auto_2459370 ?auto_2459371 ) ) ( not ( = ?auto_2459370 ?auto_2459373 ) ) ( not ( = ?auto_2459370 ?auto_2459372 ) ) ( not ( = ?auto_2459370 ?auto_2459374 ) ) ( not ( = ?auto_2459370 ?auto_2459375 ) ) ( not ( = ?auto_2459370 ?auto_2459376 ) ) ( not ( = ?auto_2459370 ?auto_2459377 ) ) ( not ( = ?auto_2459370 ?auto_2459378 ) ) ( not ( = ?auto_2459370 ?auto_2459379 ) ) ( not ( = ?auto_2459370 ?auto_2459380 ) ) ( not ( = ?auto_2459370 ?auto_2459381 ) ) ( not ( = ?auto_2459367 ?auto_2459371 ) ) ( not ( = ?auto_2459367 ?auto_2459373 ) ) ( not ( = ?auto_2459367 ?auto_2459372 ) ) ( not ( = ?auto_2459367 ?auto_2459374 ) ) ( not ( = ?auto_2459367 ?auto_2459375 ) ) ( not ( = ?auto_2459367 ?auto_2459376 ) ) ( not ( = ?auto_2459367 ?auto_2459377 ) ) ( not ( = ?auto_2459367 ?auto_2459378 ) ) ( not ( = ?auto_2459367 ?auto_2459379 ) ) ( not ( = ?auto_2459367 ?auto_2459380 ) ) ( not ( = ?auto_2459367 ?auto_2459381 ) ) ( not ( = ?auto_2459371 ?auto_2459373 ) ) ( not ( = ?auto_2459371 ?auto_2459372 ) ) ( not ( = ?auto_2459371 ?auto_2459374 ) ) ( not ( = ?auto_2459371 ?auto_2459375 ) ) ( not ( = ?auto_2459371 ?auto_2459376 ) ) ( not ( = ?auto_2459371 ?auto_2459377 ) ) ( not ( = ?auto_2459371 ?auto_2459378 ) ) ( not ( = ?auto_2459371 ?auto_2459379 ) ) ( not ( = ?auto_2459371 ?auto_2459380 ) ) ( not ( = ?auto_2459371 ?auto_2459381 ) ) ( not ( = ?auto_2459373 ?auto_2459372 ) ) ( not ( = ?auto_2459373 ?auto_2459374 ) ) ( not ( = ?auto_2459373 ?auto_2459375 ) ) ( not ( = ?auto_2459373 ?auto_2459376 ) ) ( not ( = ?auto_2459373 ?auto_2459377 ) ) ( not ( = ?auto_2459373 ?auto_2459378 ) ) ( not ( = ?auto_2459373 ?auto_2459379 ) ) ( not ( = ?auto_2459373 ?auto_2459380 ) ) ( not ( = ?auto_2459373 ?auto_2459381 ) ) ( not ( = ?auto_2459372 ?auto_2459374 ) ) ( not ( = ?auto_2459372 ?auto_2459375 ) ) ( not ( = ?auto_2459372 ?auto_2459376 ) ) ( not ( = ?auto_2459372 ?auto_2459377 ) ) ( not ( = ?auto_2459372 ?auto_2459378 ) ) ( not ( = ?auto_2459372 ?auto_2459379 ) ) ( not ( = ?auto_2459372 ?auto_2459380 ) ) ( not ( = ?auto_2459372 ?auto_2459381 ) ) ( not ( = ?auto_2459374 ?auto_2459375 ) ) ( not ( = ?auto_2459374 ?auto_2459376 ) ) ( not ( = ?auto_2459374 ?auto_2459377 ) ) ( not ( = ?auto_2459374 ?auto_2459378 ) ) ( not ( = ?auto_2459374 ?auto_2459379 ) ) ( not ( = ?auto_2459374 ?auto_2459380 ) ) ( not ( = ?auto_2459374 ?auto_2459381 ) ) ( not ( = ?auto_2459375 ?auto_2459376 ) ) ( not ( = ?auto_2459375 ?auto_2459377 ) ) ( not ( = ?auto_2459375 ?auto_2459378 ) ) ( not ( = ?auto_2459375 ?auto_2459379 ) ) ( not ( = ?auto_2459375 ?auto_2459380 ) ) ( not ( = ?auto_2459375 ?auto_2459381 ) ) ( not ( = ?auto_2459376 ?auto_2459377 ) ) ( not ( = ?auto_2459376 ?auto_2459378 ) ) ( not ( = ?auto_2459376 ?auto_2459379 ) ) ( not ( = ?auto_2459376 ?auto_2459380 ) ) ( not ( = ?auto_2459376 ?auto_2459381 ) ) ( not ( = ?auto_2459377 ?auto_2459378 ) ) ( not ( = ?auto_2459377 ?auto_2459379 ) ) ( not ( = ?auto_2459377 ?auto_2459380 ) ) ( not ( = ?auto_2459377 ?auto_2459381 ) ) ( not ( = ?auto_2459378 ?auto_2459379 ) ) ( not ( = ?auto_2459378 ?auto_2459380 ) ) ( not ( = ?auto_2459378 ?auto_2459381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2459379 ?auto_2459380 ?auto_2459381 )
      ( MAKE-14CRATE-VERIFY ?auto_2459368 ?auto_2459369 ?auto_2459370 ?auto_2459367 ?auto_2459371 ?auto_2459373 ?auto_2459372 ?auto_2459374 ?auto_2459375 ?auto_2459376 ?auto_2459377 ?auto_2459378 ?auto_2459379 ?auto_2459380 ?auto_2459381 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2459557 - SURFACE
      ?auto_2459558 - SURFACE
      ?auto_2459559 - SURFACE
      ?auto_2459556 - SURFACE
      ?auto_2459560 - SURFACE
      ?auto_2459562 - SURFACE
      ?auto_2459561 - SURFACE
      ?auto_2459563 - SURFACE
      ?auto_2459564 - SURFACE
      ?auto_2459565 - SURFACE
      ?auto_2459566 - SURFACE
      ?auto_2459567 - SURFACE
      ?auto_2459568 - SURFACE
      ?auto_2459569 - SURFACE
      ?auto_2459570 - SURFACE
    )
    :vars
    (
      ?auto_2459573 - HOIST
      ?auto_2459575 - PLACE
      ?auto_2459572 - TRUCK
      ?auto_2459571 - PLACE
      ?auto_2459574 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2459573 ?auto_2459575 ) ( SURFACE-AT ?auto_2459569 ?auto_2459575 ) ( CLEAR ?auto_2459569 ) ( IS-CRATE ?auto_2459570 ) ( not ( = ?auto_2459569 ?auto_2459570 ) ) ( AVAILABLE ?auto_2459573 ) ( ON ?auto_2459569 ?auto_2459568 ) ( not ( = ?auto_2459568 ?auto_2459569 ) ) ( not ( = ?auto_2459568 ?auto_2459570 ) ) ( TRUCK-AT ?auto_2459572 ?auto_2459571 ) ( not ( = ?auto_2459571 ?auto_2459575 ) ) ( HOIST-AT ?auto_2459574 ?auto_2459571 ) ( LIFTING ?auto_2459574 ?auto_2459570 ) ( not ( = ?auto_2459573 ?auto_2459574 ) ) ( ON ?auto_2459558 ?auto_2459557 ) ( ON ?auto_2459559 ?auto_2459558 ) ( ON ?auto_2459556 ?auto_2459559 ) ( ON ?auto_2459560 ?auto_2459556 ) ( ON ?auto_2459562 ?auto_2459560 ) ( ON ?auto_2459561 ?auto_2459562 ) ( ON ?auto_2459563 ?auto_2459561 ) ( ON ?auto_2459564 ?auto_2459563 ) ( ON ?auto_2459565 ?auto_2459564 ) ( ON ?auto_2459566 ?auto_2459565 ) ( ON ?auto_2459567 ?auto_2459566 ) ( ON ?auto_2459568 ?auto_2459567 ) ( not ( = ?auto_2459557 ?auto_2459558 ) ) ( not ( = ?auto_2459557 ?auto_2459559 ) ) ( not ( = ?auto_2459557 ?auto_2459556 ) ) ( not ( = ?auto_2459557 ?auto_2459560 ) ) ( not ( = ?auto_2459557 ?auto_2459562 ) ) ( not ( = ?auto_2459557 ?auto_2459561 ) ) ( not ( = ?auto_2459557 ?auto_2459563 ) ) ( not ( = ?auto_2459557 ?auto_2459564 ) ) ( not ( = ?auto_2459557 ?auto_2459565 ) ) ( not ( = ?auto_2459557 ?auto_2459566 ) ) ( not ( = ?auto_2459557 ?auto_2459567 ) ) ( not ( = ?auto_2459557 ?auto_2459568 ) ) ( not ( = ?auto_2459557 ?auto_2459569 ) ) ( not ( = ?auto_2459557 ?auto_2459570 ) ) ( not ( = ?auto_2459558 ?auto_2459559 ) ) ( not ( = ?auto_2459558 ?auto_2459556 ) ) ( not ( = ?auto_2459558 ?auto_2459560 ) ) ( not ( = ?auto_2459558 ?auto_2459562 ) ) ( not ( = ?auto_2459558 ?auto_2459561 ) ) ( not ( = ?auto_2459558 ?auto_2459563 ) ) ( not ( = ?auto_2459558 ?auto_2459564 ) ) ( not ( = ?auto_2459558 ?auto_2459565 ) ) ( not ( = ?auto_2459558 ?auto_2459566 ) ) ( not ( = ?auto_2459558 ?auto_2459567 ) ) ( not ( = ?auto_2459558 ?auto_2459568 ) ) ( not ( = ?auto_2459558 ?auto_2459569 ) ) ( not ( = ?auto_2459558 ?auto_2459570 ) ) ( not ( = ?auto_2459559 ?auto_2459556 ) ) ( not ( = ?auto_2459559 ?auto_2459560 ) ) ( not ( = ?auto_2459559 ?auto_2459562 ) ) ( not ( = ?auto_2459559 ?auto_2459561 ) ) ( not ( = ?auto_2459559 ?auto_2459563 ) ) ( not ( = ?auto_2459559 ?auto_2459564 ) ) ( not ( = ?auto_2459559 ?auto_2459565 ) ) ( not ( = ?auto_2459559 ?auto_2459566 ) ) ( not ( = ?auto_2459559 ?auto_2459567 ) ) ( not ( = ?auto_2459559 ?auto_2459568 ) ) ( not ( = ?auto_2459559 ?auto_2459569 ) ) ( not ( = ?auto_2459559 ?auto_2459570 ) ) ( not ( = ?auto_2459556 ?auto_2459560 ) ) ( not ( = ?auto_2459556 ?auto_2459562 ) ) ( not ( = ?auto_2459556 ?auto_2459561 ) ) ( not ( = ?auto_2459556 ?auto_2459563 ) ) ( not ( = ?auto_2459556 ?auto_2459564 ) ) ( not ( = ?auto_2459556 ?auto_2459565 ) ) ( not ( = ?auto_2459556 ?auto_2459566 ) ) ( not ( = ?auto_2459556 ?auto_2459567 ) ) ( not ( = ?auto_2459556 ?auto_2459568 ) ) ( not ( = ?auto_2459556 ?auto_2459569 ) ) ( not ( = ?auto_2459556 ?auto_2459570 ) ) ( not ( = ?auto_2459560 ?auto_2459562 ) ) ( not ( = ?auto_2459560 ?auto_2459561 ) ) ( not ( = ?auto_2459560 ?auto_2459563 ) ) ( not ( = ?auto_2459560 ?auto_2459564 ) ) ( not ( = ?auto_2459560 ?auto_2459565 ) ) ( not ( = ?auto_2459560 ?auto_2459566 ) ) ( not ( = ?auto_2459560 ?auto_2459567 ) ) ( not ( = ?auto_2459560 ?auto_2459568 ) ) ( not ( = ?auto_2459560 ?auto_2459569 ) ) ( not ( = ?auto_2459560 ?auto_2459570 ) ) ( not ( = ?auto_2459562 ?auto_2459561 ) ) ( not ( = ?auto_2459562 ?auto_2459563 ) ) ( not ( = ?auto_2459562 ?auto_2459564 ) ) ( not ( = ?auto_2459562 ?auto_2459565 ) ) ( not ( = ?auto_2459562 ?auto_2459566 ) ) ( not ( = ?auto_2459562 ?auto_2459567 ) ) ( not ( = ?auto_2459562 ?auto_2459568 ) ) ( not ( = ?auto_2459562 ?auto_2459569 ) ) ( not ( = ?auto_2459562 ?auto_2459570 ) ) ( not ( = ?auto_2459561 ?auto_2459563 ) ) ( not ( = ?auto_2459561 ?auto_2459564 ) ) ( not ( = ?auto_2459561 ?auto_2459565 ) ) ( not ( = ?auto_2459561 ?auto_2459566 ) ) ( not ( = ?auto_2459561 ?auto_2459567 ) ) ( not ( = ?auto_2459561 ?auto_2459568 ) ) ( not ( = ?auto_2459561 ?auto_2459569 ) ) ( not ( = ?auto_2459561 ?auto_2459570 ) ) ( not ( = ?auto_2459563 ?auto_2459564 ) ) ( not ( = ?auto_2459563 ?auto_2459565 ) ) ( not ( = ?auto_2459563 ?auto_2459566 ) ) ( not ( = ?auto_2459563 ?auto_2459567 ) ) ( not ( = ?auto_2459563 ?auto_2459568 ) ) ( not ( = ?auto_2459563 ?auto_2459569 ) ) ( not ( = ?auto_2459563 ?auto_2459570 ) ) ( not ( = ?auto_2459564 ?auto_2459565 ) ) ( not ( = ?auto_2459564 ?auto_2459566 ) ) ( not ( = ?auto_2459564 ?auto_2459567 ) ) ( not ( = ?auto_2459564 ?auto_2459568 ) ) ( not ( = ?auto_2459564 ?auto_2459569 ) ) ( not ( = ?auto_2459564 ?auto_2459570 ) ) ( not ( = ?auto_2459565 ?auto_2459566 ) ) ( not ( = ?auto_2459565 ?auto_2459567 ) ) ( not ( = ?auto_2459565 ?auto_2459568 ) ) ( not ( = ?auto_2459565 ?auto_2459569 ) ) ( not ( = ?auto_2459565 ?auto_2459570 ) ) ( not ( = ?auto_2459566 ?auto_2459567 ) ) ( not ( = ?auto_2459566 ?auto_2459568 ) ) ( not ( = ?auto_2459566 ?auto_2459569 ) ) ( not ( = ?auto_2459566 ?auto_2459570 ) ) ( not ( = ?auto_2459567 ?auto_2459568 ) ) ( not ( = ?auto_2459567 ?auto_2459569 ) ) ( not ( = ?auto_2459567 ?auto_2459570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2459568 ?auto_2459569 ?auto_2459570 )
      ( MAKE-14CRATE-VERIFY ?auto_2459557 ?auto_2459558 ?auto_2459559 ?auto_2459556 ?auto_2459560 ?auto_2459562 ?auto_2459561 ?auto_2459563 ?auto_2459564 ?auto_2459565 ?auto_2459566 ?auto_2459567 ?auto_2459568 ?auto_2459569 ?auto_2459570 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2459760 - SURFACE
      ?auto_2459761 - SURFACE
      ?auto_2459762 - SURFACE
      ?auto_2459759 - SURFACE
      ?auto_2459763 - SURFACE
      ?auto_2459765 - SURFACE
      ?auto_2459764 - SURFACE
      ?auto_2459766 - SURFACE
      ?auto_2459767 - SURFACE
      ?auto_2459768 - SURFACE
      ?auto_2459769 - SURFACE
      ?auto_2459770 - SURFACE
      ?auto_2459771 - SURFACE
      ?auto_2459772 - SURFACE
      ?auto_2459773 - SURFACE
    )
    :vars
    (
      ?auto_2459775 - HOIST
      ?auto_2459774 - PLACE
      ?auto_2459777 - TRUCK
      ?auto_2459776 - PLACE
      ?auto_2459778 - HOIST
      ?auto_2459779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2459775 ?auto_2459774 ) ( SURFACE-AT ?auto_2459772 ?auto_2459774 ) ( CLEAR ?auto_2459772 ) ( IS-CRATE ?auto_2459773 ) ( not ( = ?auto_2459772 ?auto_2459773 ) ) ( AVAILABLE ?auto_2459775 ) ( ON ?auto_2459772 ?auto_2459771 ) ( not ( = ?auto_2459771 ?auto_2459772 ) ) ( not ( = ?auto_2459771 ?auto_2459773 ) ) ( TRUCK-AT ?auto_2459777 ?auto_2459776 ) ( not ( = ?auto_2459776 ?auto_2459774 ) ) ( HOIST-AT ?auto_2459778 ?auto_2459776 ) ( not ( = ?auto_2459775 ?auto_2459778 ) ) ( AVAILABLE ?auto_2459778 ) ( SURFACE-AT ?auto_2459773 ?auto_2459776 ) ( ON ?auto_2459773 ?auto_2459779 ) ( CLEAR ?auto_2459773 ) ( not ( = ?auto_2459772 ?auto_2459779 ) ) ( not ( = ?auto_2459773 ?auto_2459779 ) ) ( not ( = ?auto_2459771 ?auto_2459779 ) ) ( ON ?auto_2459761 ?auto_2459760 ) ( ON ?auto_2459762 ?auto_2459761 ) ( ON ?auto_2459759 ?auto_2459762 ) ( ON ?auto_2459763 ?auto_2459759 ) ( ON ?auto_2459765 ?auto_2459763 ) ( ON ?auto_2459764 ?auto_2459765 ) ( ON ?auto_2459766 ?auto_2459764 ) ( ON ?auto_2459767 ?auto_2459766 ) ( ON ?auto_2459768 ?auto_2459767 ) ( ON ?auto_2459769 ?auto_2459768 ) ( ON ?auto_2459770 ?auto_2459769 ) ( ON ?auto_2459771 ?auto_2459770 ) ( not ( = ?auto_2459760 ?auto_2459761 ) ) ( not ( = ?auto_2459760 ?auto_2459762 ) ) ( not ( = ?auto_2459760 ?auto_2459759 ) ) ( not ( = ?auto_2459760 ?auto_2459763 ) ) ( not ( = ?auto_2459760 ?auto_2459765 ) ) ( not ( = ?auto_2459760 ?auto_2459764 ) ) ( not ( = ?auto_2459760 ?auto_2459766 ) ) ( not ( = ?auto_2459760 ?auto_2459767 ) ) ( not ( = ?auto_2459760 ?auto_2459768 ) ) ( not ( = ?auto_2459760 ?auto_2459769 ) ) ( not ( = ?auto_2459760 ?auto_2459770 ) ) ( not ( = ?auto_2459760 ?auto_2459771 ) ) ( not ( = ?auto_2459760 ?auto_2459772 ) ) ( not ( = ?auto_2459760 ?auto_2459773 ) ) ( not ( = ?auto_2459760 ?auto_2459779 ) ) ( not ( = ?auto_2459761 ?auto_2459762 ) ) ( not ( = ?auto_2459761 ?auto_2459759 ) ) ( not ( = ?auto_2459761 ?auto_2459763 ) ) ( not ( = ?auto_2459761 ?auto_2459765 ) ) ( not ( = ?auto_2459761 ?auto_2459764 ) ) ( not ( = ?auto_2459761 ?auto_2459766 ) ) ( not ( = ?auto_2459761 ?auto_2459767 ) ) ( not ( = ?auto_2459761 ?auto_2459768 ) ) ( not ( = ?auto_2459761 ?auto_2459769 ) ) ( not ( = ?auto_2459761 ?auto_2459770 ) ) ( not ( = ?auto_2459761 ?auto_2459771 ) ) ( not ( = ?auto_2459761 ?auto_2459772 ) ) ( not ( = ?auto_2459761 ?auto_2459773 ) ) ( not ( = ?auto_2459761 ?auto_2459779 ) ) ( not ( = ?auto_2459762 ?auto_2459759 ) ) ( not ( = ?auto_2459762 ?auto_2459763 ) ) ( not ( = ?auto_2459762 ?auto_2459765 ) ) ( not ( = ?auto_2459762 ?auto_2459764 ) ) ( not ( = ?auto_2459762 ?auto_2459766 ) ) ( not ( = ?auto_2459762 ?auto_2459767 ) ) ( not ( = ?auto_2459762 ?auto_2459768 ) ) ( not ( = ?auto_2459762 ?auto_2459769 ) ) ( not ( = ?auto_2459762 ?auto_2459770 ) ) ( not ( = ?auto_2459762 ?auto_2459771 ) ) ( not ( = ?auto_2459762 ?auto_2459772 ) ) ( not ( = ?auto_2459762 ?auto_2459773 ) ) ( not ( = ?auto_2459762 ?auto_2459779 ) ) ( not ( = ?auto_2459759 ?auto_2459763 ) ) ( not ( = ?auto_2459759 ?auto_2459765 ) ) ( not ( = ?auto_2459759 ?auto_2459764 ) ) ( not ( = ?auto_2459759 ?auto_2459766 ) ) ( not ( = ?auto_2459759 ?auto_2459767 ) ) ( not ( = ?auto_2459759 ?auto_2459768 ) ) ( not ( = ?auto_2459759 ?auto_2459769 ) ) ( not ( = ?auto_2459759 ?auto_2459770 ) ) ( not ( = ?auto_2459759 ?auto_2459771 ) ) ( not ( = ?auto_2459759 ?auto_2459772 ) ) ( not ( = ?auto_2459759 ?auto_2459773 ) ) ( not ( = ?auto_2459759 ?auto_2459779 ) ) ( not ( = ?auto_2459763 ?auto_2459765 ) ) ( not ( = ?auto_2459763 ?auto_2459764 ) ) ( not ( = ?auto_2459763 ?auto_2459766 ) ) ( not ( = ?auto_2459763 ?auto_2459767 ) ) ( not ( = ?auto_2459763 ?auto_2459768 ) ) ( not ( = ?auto_2459763 ?auto_2459769 ) ) ( not ( = ?auto_2459763 ?auto_2459770 ) ) ( not ( = ?auto_2459763 ?auto_2459771 ) ) ( not ( = ?auto_2459763 ?auto_2459772 ) ) ( not ( = ?auto_2459763 ?auto_2459773 ) ) ( not ( = ?auto_2459763 ?auto_2459779 ) ) ( not ( = ?auto_2459765 ?auto_2459764 ) ) ( not ( = ?auto_2459765 ?auto_2459766 ) ) ( not ( = ?auto_2459765 ?auto_2459767 ) ) ( not ( = ?auto_2459765 ?auto_2459768 ) ) ( not ( = ?auto_2459765 ?auto_2459769 ) ) ( not ( = ?auto_2459765 ?auto_2459770 ) ) ( not ( = ?auto_2459765 ?auto_2459771 ) ) ( not ( = ?auto_2459765 ?auto_2459772 ) ) ( not ( = ?auto_2459765 ?auto_2459773 ) ) ( not ( = ?auto_2459765 ?auto_2459779 ) ) ( not ( = ?auto_2459764 ?auto_2459766 ) ) ( not ( = ?auto_2459764 ?auto_2459767 ) ) ( not ( = ?auto_2459764 ?auto_2459768 ) ) ( not ( = ?auto_2459764 ?auto_2459769 ) ) ( not ( = ?auto_2459764 ?auto_2459770 ) ) ( not ( = ?auto_2459764 ?auto_2459771 ) ) ( not ( = ?auto_2459764 ?auto_2459772 ) ) ( not ( = ?auto_2459764 ?auto_2459773 ) ) ( not ( = ?auto_2459764 ?auto_2459779 ) ) ( not ( = ?auto_2459766 ?auto_2459767 ) ) ( not ( = ?auto_2459766 ?auto_2459768 ) ) ( not ( = ?auto_2459766 ?auto_2459769 ) ) ( not ( = ?auto_2459766 ?auto_2459770 ) ) ( not ( = ?auto_2459766 ?auto_2459771 ) ) ( not ( = ?auto_2459766 ?auto_2459772 ) ) ( not ( = ?auto_2459766 ?auto_2459773 ) ) ( not ( = ?auto_2459766 ?auto_2459779 ) ) ( not ( = ?auto_2459767 ?auto_2459768 ) ) ( not ( = ?auto_2459767 ?auto_2459769 ) ) ( not ( = ?auto_2459767 ?auto_2459770 ) ) ( not ( = ?auto_2459767 ?auto_2459771 ) ) ( not ( = ?auto_2459767 ?auto_2459772 ) ) ( not ( = ?auto_2459767 ?auto_2459773 ) ) ( not ( = ?auto_2459767 ?auto_2459779 ) ) ( not ( = ?auto_2459768 ?auto_2459769 ) ) ( not ( = ?auto_2459768 ?auto_2459770 ) ) ( not ( = ?auto_2459768 ?auto_2459771 ) ) ( not ( = ?auto_2459768 ?auto_2459772 ) ) ( not ( = ?auto_2459768 ?auto_2459773 ) ) ( not ( = ?auto_2459768 ?auto_2459779 ) ) ( not ( = ?auto_2459769 ?auto_2459770 ) ) ( not ( = ?auto_2459769 ?auto_2459771 ) ) ( not ( = ?auto_2459769 ?auto_2459772 ) ) ( not ( = ?auto_2459769 ?auto_2459773 ) ) ( not ( = ?auto_2459769 ?auto_2459779 ) ) ( not ( = ?auto_2459770 ?auto_2459771 ) ) ( not ( = ?auto_2459770 ?auto_2459772 ) ) ( not ( = ?auto_2459770 ?auto_2459773 ) ) ( not ( = ?auto_2459770 ?auto_2459779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2459771 ?auto_2459772 ?auto_2459773 )
      ( MAKE-14CRATE-VERIFY ?auto_2459760 ?auto_2459761 ?auto_2459762 ?auto_2459759 ?auto_2459763 ?auto_2459765 ?auto_2459764 ?auto_2459766 ?auto_2459767 ?auto_2459768 ?auto_2459769 ?auto_2459770 ?auto_2459771 ?auto_2459772 ?auto_2459773 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2459964 - SURFACE
      ?auto_2459965 - SURFACE
      ?auto_2459966 - SURFACE
      ?auto_2459963 - SURFACE
      ?auto_2459967 - SURFACE
      ?auto_2459969 - SURFACE
      ?auto_2459968 - SURFACE
      ?auto_2459970 - SURFACE
      ?auto_2459971 - SURFACE
      ?auto_2459972 - SURFACE
      ?auto_2459973 - SURFACE
      ?auto_2459974 - SURFACE
      ?auto_2459975 - SURFACE
      ?auto_2459976 - SURFACE
      ?auto_2459977 - SURFACE
    )
    :vars
    (
      ?auto_2459982 - HOIST
      ?auto_2459979 - PLACE
      ?auto_2459983 - PLACE
      ?auto_2459980 - HOIST
      ?auto_2459981 - SURFACE
      ?auto_2459978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2459982 ?auto_2459979 ) ( SURFACE-AT ?auto_2459976 ?auto_2459979 ) ( CLEAR ?auto_2459976 ) ( IS-CRATE ?auto_2459977 ) ( not ( = ?auto_2459976 ?auto_2459977 ) ) ( AVAILABLE ?auto_2459982 ) ( ON ?auto_2459976 ?auto_2459975 ) ( not ( = ?auto_2459975 ?auto_2459976 ) ) ( not ( = ?auto_2459975 ?auto_2459977 ) ) ( not ( = ?auto_2459983 ?auto_2459979 ) ) ( HOIST-AT ?auto_2459980 ?auto_2459983 ) ( not ( = ?auto_2459982 ?auto_2459980 ) ) ( AVAILABLE ?auto_2459980 ) ( SURFACE-AT ?auto_2459977 ?auto_2459983 ) ( ON ?auto_2459977 ?auto_2459981 ) ( CLEAR ?auto_2459977 ) ( not ( = ?auto_2459976 ?auto_2459981 ) ) ( not ( = ?auto_2459977 ?auto_2459981 ) ) ( not ( = ?auto_2459975 ?auto_2459981 ) ) ( TRUCK-AT ?auto_2459978 ?auto_2459979 ) ( ON ?auto_2459965 ?auto_2459964 ) ( ON ?auto_2459966 ?auto_2459965 ) ( ON ?auto_2459963 ?auto_2459966 ) ( ON ?auto_2459967 ?auto_2459963 ) ( ON ?auto_2459969 ?auto_2459967 ) ( ON ?auto_2459968 ?auto_2459969 ) ( ON ?auto_2459970 ?auto_2459968 ) ( ON ?auto_2459971 ?auto_2459970 ) ( ON ?auto_2459972 ?auto_2459971 ) ( ON ?auto_2459973 ?auto_2459972 ) ( ON ?auto_2459974 ?auto_2459973 ) ( ON ?auto_2459975 ?auto_2459974 ) ( not ( = ?auto_2459964 ?auto_2459965 ) ) ( not ( = ?auto_2459964 ?auto_2459966 ) ) ( not ( = ?auto_2459964 ?auto_2459963 ) ) ( not ( = ?auto_2459964 ?auto_2459967 ) ) ( not ( = ?auto_2459964 ?auto_2459969 ) ) ( not ( = ?auto_2459964 ?auto_2459968 ) ) ( not ( = ?auto_2459964 ?auto_2459970 ) ) ( not ( = ?auto_2459964 ?auto_2459971 ) ) ( not ( = ?auto_2459964 ?auto_2459972 ) ) ( not ( = ?auto_2459964 ?auto_2459973 ) ) ( not ( = ?auto_2459964 ?auto_2459974 ) ) ( not ( = ?auto_2459964 ?auto_2459975 ) ) ( not ( = ?auto_2459964 ?auto_2459976 ) ) ( not ( = ?auto_2459964 ?auto_2459977 ) ) ( not ( = ?auto_2459964 ?auto_2459981 ) ) ( not ( = ?auto_2459965 ?auto_2459966 ) ) ( not ( = ?auto_2459965 ?auto_2459963 ) ) ( not ( = ?auto_2459965 ?auto_2459967 ) ) ( not ( = ?auto_2459965 ?auto_2459969 ) ) ( not ( = ?auto_2459965 ?auto_2459968 ) ) ( not ( = ?auto_2459965 ?auto_2459970 ) ) ( not ( = ?auto_2459965 ?auto_2459971 ) ) ( not ( = ?auto_2459965 ?auto_2459972 ) ) ( not ( = ?auto_2459965 ?auto_2459973 ) ) ( not ( = ?auto_2459965 ?auto_2459974 ) ) ( not ( = ?auto_2459965 ?auto_2459975 ) ) ( not ( = ?auto_2459965 ?auto_2459976 ) ) ( not ( = ?auto_2459965 ?auto_2459977 ) ) ( not ( = ?auto_2459965 ?auto_2459981 ) ) ( not ( = ?auto_2459966 ?auto_2459963 ) ) ( not ( = ?auto_2459966 ?auto_2459967 ) ) ( not ( = ?auto_2459966 ?auto_2459969 ) ) ( not ( = ?auto_2459966 ?auto_2459968 ) ) ( not ( = ?auto_2459966 ?auto_2459970 ) ) ( not ( = ?auto_2459966 ?auto_2459971 ) ) ( not ( = ?auto_2459966 ?auto_2459972 ) ) ( not ( = ?auto_2459966 ?auto_2459973 ) ) ( not ( = ?auto_2459966 ?auto_2459974 ) ) ( not ( = ?auto_2459966 ?auto_2459975 ) ) ( not ( = ?auto_2459966 ?auto_2459976 ) ) ( not ( = ?auto_2459966 ?auto_2459977 ) ) ( not ( = ?auto_2459966 ?auto_2459981 ) ) ( not ( = ?auto_2459963 ?auto_2459967 ) ) ( not ( = ?auto_2459963 ?auto_2459969 ) ) ( not ( = ?auto_2459963 ?auto_2459968 ) ) ( not ( = ?auto_2459963 ?auto_2459970 ) ) ( not ( = ?auto_2459963 ?auto_2459971 ) ) ( not ( = ?auto_2459963 ?auto_2459972 ) ) ( not ( = ?auto_2459963 ?auto_2459973 ) ) ( not ( = ?auto_2459963 ?auto_2459974 ) ) ( not ( = ?auto_2459963 ?auto_2459975 ) ) ( not ( = ?auto_2459963 ?auto_2459976 ) ) ( not ( = ?auto_2459963 ?auto_2459977 ) ) ( not ( = ?auto_2459963 ?auto_2459981 ) ) ( not ( = ?auto_2459967 ?auto_2459969 ) ) ( not ( = ?auto_2459967 ?auto_2459968 ) ) ( not ( = ?auto_2459967 ?auto_2459970 ) ) ( not ( = ?auto_2459967 ?auto_2459971 ) ) ( not ( = ?auto_2459967 ?auto_2459972 ) ) ( not ( = ?auto_2459967 ?auto_2459973 ) ) ( not ( = ?auto_2459967 ?auto_2459974 ) ) ( not ( = ?auto_2459967 ?auto_2459975 ) ) ( not ( = ?auto_2459967 ?auto_2459976 ) ) ( not ( = ?auto_2459967 ?auto_2459977 ) ) ( not ( = ?auto_2459967 ?auto_2459981 ) ) ( not ( = ?auto_2459969 ?auto_2459968 ) ) ( not ( = ?auto_2459969 ?auto_2459970 ) ) ( not ( = ?auto_2459969 ?auto_2459971 ) ) ( not ( = ?auto_2459969 ?auto_2459972 ) ) ( not ( = ?auto_2459969 ?auto_2459973 ) ) ( not ( = ?auto_2459969 ?auto_2459974 ) ) ( not ( = ?auto_2459969 ?auto_2459975 ) ) ( not ( = ?auto_2459969 ?auto_2459976 ) ) ( not ( = ?auto_2459969 ?auto_2459977 ) ) ( not ( = ?auto_2459969 ?auto_2459981 ) ) ( not ( = ?auto_2459968 ?auto_2459970 ) ) ( not ( = ?auto_2459968 ?auto_2459971 ) ) ( not ( = ?auto_2459968 ?auto_2459972 ) ) ( not ( = ?auto_2459968 ?auto_2459973 ) ) ( not ( = ?auto_2459968 ?auto_2459974 ) ) ( not ( = ?auto_2459968 ?auto_2459975 ) ) ( not ( = ?auto_2459968 ?auto_2459976 ) ) ( not ( = ?auto_2459968 ?auto_2459977 ) ) ( not ( = ?auto_2459968 ?auto_2459981 ) ) ( not ( = ?auto_2459970 ?auto_2459971 ) ) ( not ( = ?auto_2459970 ?auto_2459972 ) ) ( not ( = ?auto_2459970 ?auto_2459973 ) ) ( not ( = ?auto_2459970 ?auto_2459974 ) ) ( not ( = ?auto_2459970 ?auto_2459975 ) ) ( not ( = ?auto_2459970 ?auto_2459976 ) ) ( not ( = ?auto_2459970 ?auto_2459977 ) ) ( not ( = ?auto_2459970 ?auto_2459981 ) ) ( not ( = ?auto_2459971 ?auto_2459972 ) ) ( not ( = ?auto_2459971 ?auto_2459973 ) ) ( not ( = ?auto_2459971 ?auto_2459974 ) ) ( not ( = ?auto_2459971 ?auto_2459975 ) ) ( not ( = ?auto_2459971 ?auto_2459976 ) ) ( not ( = ?auto_2459971 ?auto_2459977 ) ) ( not ( = ?auto_2459971 ?auto_2459981 ) ) ( not ( = ?auto_2459972 ?auto_2459973 ) ) ( not ( = ?auto_2459972 ?auto_2459974 ) ) ( not ( = ?auto_2459972 ?auto_2459975 ) ) ( not ( = ?auto_2459972 ?auto_2459976 ) ) ( not ( = ?auto_2459972 ?auto_2459977 ) ) ( not ( = ?auto_2459972 ?auto_2459981 ) ) ( not ( = ?auto_2459973 ?auto_2459974 ) ) ( not ( = ?auto_2459973 ?auto_2459975 ) ) ( not ( = ?auto_2459973 ?auto_2459976 ) ) ( not ( = ?auto_2459973 ?auto_2459977 ) ) ( not ( = ?auto_2459973 ?auto_2459981 ) ) ( not ( = ?auto_2459974 ?auto_2459975 ) ) ( not ( = ?auto_2459974 ?auto_2459976 ) ) ( not ( = ?auto_2459974 ?auto_2459977 ) ) ( not ( = ?auto_2459974 ?auto_2459981 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2459975 ?auto_2459976 ?auto_2459977 )
      ( MAKE-14CRATE-VERIFY ?auto_2459964 ?auto_2459965 ?auto_2459966 ?auto_2459963 ?auto_2459967 ?auto_2459969 ?auto_2459968 ?auto_2459970 ?auto_2459971 ?auto_2459972 ?auto_2459973 ?auto_2459974 ?auto_2459975 ?auto_2459976 ?auto_2459977 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2460168 - SURFACE
      ?auto_2460169 - SURFACE
      ?auto_2460170 - SURFACE
      ?auto_2460167 - SURFACE
      ?auto_2460171 - SURFACE
      ?auto_2460173 - SURFACE
      ?auto_2460172 - SURFACE
      ?auto_2460174 - SURFACE
      ?auto_2460175 - SURFACE
      ?auto_2460176 - SURFACE
      ?auto_2460177 - SURFACE
      ?auto_2460178 - SURFACE
      ?auto_2460179 - SURFACE
      ?auto_2460180 - SURFACE
      ?auto_2460181 - SURFACE
    )
    :vars
    (
      ?auto_2460182 - HOIST
      ?auto_2460184 - PLACE
      ?auto_2460186 - PLACE
      ?auto_2460185 - HOIST
      ?auto_2460183 - SURFACE
      ?auto_2460187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2460182 ?auto_2460184 ) ( IS-CRATE ?auto_2460181 ) ( not ( = ?auto_2460180 ?auto_2460181 ) ) ( not ( = ?auto_2460179 ?auto_2460180 ) ) ( not ( = ?auto_2460179 ?auto_2460181 ) ) ( not ( = ?auto_2460186 ?auto_2460184 ) ) ( HOIST-AT ?auto_2460185 ?auto_2460186 ) ( not ( = ?auto_2460182 ?auto_2460185 ) ) ( AVAILABLE ?auto_2460185 ) ( SURFACE-AT ?auto_2460181 ?auto_2460186 ) ( ON ?auto_2460181 ?auto_2460183 ) ( CLEAR ?auto_2460181 ) ( not ( = ?auto_2460180 ?auto_2460183 ) ) ( not ( = ?auto_2460181 ?auto_2460183 ) ) ( not ( = ?auto_2460179 ?auto_2460183 ) ) ( TRUCK-AT ?auto_2460187 ?auto_2460184 ) ( SURFACE-AT ?auto_2460179 ?auto_2460184 ) ( CLEAR ?auto_2460179 ) ( LIFTING ?auto_2460182 ?auto_2460180 ) ( IS-CRATE ?auto_2460180 ) ( ON ?auto_2460169 ?auto_2460168 ) ( ON ?auto_2460170 ?auto_2460169 ) ( ON ?auto_2460167 ?auto_2460170 ) ( ON ?auto_2460171 ?auto_2460167 ) ( ON ?auto_2460173 ?auto_2460171 ) ( ON ?auto_2460172 ?auto_2460173 ) ( ON ?auto_2460174 ?auto_2460172 ) ( ON ?auto_2460175 ?auto_2460174 ) ( ON ?auto_2460176 ?auto_2460175 ) ( ON ?auto_2460177 ?auto_2460176 ) ( ON ?auto_2460178 ?auto_2460177 ) ( ON ?auto_2460179 ?auto_2460178 ) ( not ( = ?auto_2460168 ?auto_2460169 ) ) ( not ( = ?auto_2460168 ?auto_2460170 ) ) ( not ( = ?auto_2460168 ?auto_2460167 ) ) ( not ( = ?auto_2460168 ?auto_2460171 ) ) ( not ( = ?auto_2460168 ?auto_2460173 ) ) ( not ( = ?auto_2460168 ?auto_2460172 ) ) ( not ( = ?auto_2460168 ?auto_2460174 ) ) ( not ( = ?auto_2460168 ?auto_2460175 ) ) ( not ( = ?auto_2460168 ?auto_2460176 ) ) ( not ( = ?auto_2460168 ?auto_2460177 ) ) ( not ( = ?auto_2460168 ?auto_2460178 ) ) ( not ( = ?auto_2460168 ?auto_2460179 ) ) ( not ( = ?auto_2460168 ?auto_2460180 ) ) ( not ( = ?auto_2460168 ?auto_2460181 ) ) ( not ( = ?auto_2460168 ?auto_2460183 ) ) ( not ( = ?auto_2460169 ?auto_2460170 ) ) ( not ( = ?auto_2460169 ?auto_2460167 ) ) ( not ( = ?auto_2460169 ?auto_2460171 ) ) ( not ( = ?auto_2460169 ?auto_2460173 ) ) ( not ( = ?auto_2460169 ?auto_2460172 ) ) ( not ( = ?auto_2460169 ?auto_2460174 ) ) ( not ( = ?auto_2460169 ?auto_2460175 ) ) ( not ( = ?auto_2460169 ?auto_2460176 ) ) ( not ( = ?auto_2460169 ?auto_2460177 ) ) ( not ( = ?auto_2460169 ?auto_2460178 ) ) ( not ( = ?auto_2460169 ?auto_2460179 ) ) ( not ( = ?auto_2460169 ?auto_2460180 ) ) ( not ( = ?auto_2460169 ?auto_2460181 ) ) ( not ( = ?auto_2460169 ?auto_2460183 ) ) ( not ( = ?auto_2460170 ?auto_2460167 ) ) ( not ( = ?auto_2460170 ?auto_2460171 ) ) ( not ( = ?auto_2460170 ?auto_2460173 ) ) ( not ( = ?auto_2460170 ?auto_2460172 ) ) ( not ( = ?auto_2460170 ?auto_2460174 ) ) ( not ( = ?auto_2460170 ?auto_2460175 ) ) ( not ( = ?auto_2460170 ?auto_2460176 ) ) ( not ( = ?auto_2460170 ?auto_2460177 ) ) ( not ( = ?auto_2460170 ?auto_2460178 ) ) ( not ( = ?auto_2460170 ?auto_2460179 ) ) ( not ( = ?auto_2460170 ?auto_2460180 ) ) ( not ( = ?auto_2460170 ?auto_2460181 ) ) ( not ( = ?auto_2460170 ?auto_2460183 ) ) ( not ( = ?auto_2460167 ?auto_2460171 ) ) ( not ( = ?auto_2460167 ?auto_2460173 ) ) ( not ( = ?auto_2460167 ?auto_2460172 ) ) ( not ( = ?auto_2460167 ?auto_2460174 ) ) ( not ( = ?auto_2460167 ?auto_2460175 ) ) ( not ( = ?auto_2460167 ?auto_2460176 ) ) ( not ( = ?auto_2460167 ?auto_2460177 ) ) ( not ( = ?auto_2460167 ?auto_2460178 ) ) ( not ( = ?auto_2460167 ?auto_2460179 ) ) ( not ( = ?auto_2460167 ?auto_2460180 ) ) ( not ( = ?auto_2460167 ?auto_2460181 ) ) ( not ( = ?auto_2460167 ?auto_2460183 ) ) ( not ( = ?auto_2460171 ?auto_2460173 ) ) ( not ( = ?auto_2460171 ?auto_2460172 ) ) ( not ( = ?auto_2460171 ?auto_2460174 ) ) ( not ( = ?auto_2460171 ?auto_2460175 ) ) ( not ( = ?auto_2460171 ?auto_2460176 ) ) ( not ( = ?auto_2460171 ?auto_2460177 ) ) ( not ( = ?auto_2460171 ?auto_2460178 ) ) ( not ( = ?auto_2460171 ?auto_2460179 ) ) ( not ( = ?auto_2460171 ?auto_2460180 ) ) ( not ( = ?auto_2460171 ?auto_2460181 ) ) ( not ( = ?auto_2460171 ?auto_2460183 ) ) ( not ( = ?auto_2460173 ?auto_2460172 ) ) ( not ( = ?auto_2460173 ?auto_2460174 ) ) ( not ( = ?auto_2460173 ?auto_2460175 ) ) ( not ( = ?auto_2460173 ?auto_2460176 ) ) ( not ( = ?auto_2460173 ?auto_2460177 ) ) ( not ( = ?auto_2460173 ?auto_2460178 ) ) ( not ( = ?auto_2460173 ?auto_2460179 ) ) ( not ( = ?auto_2460173 ?auto_2460180 ) ) ( not ( = ?auto_2460173 ?auto_2460181 ) ) ( not ( = ?auto_2460173 ?auto_2460183 ) ) ( not ( = ?auto_2460172 ?auto_2460174 ) ) ( not ( = ?auto_2460172 ?auto_2460175 ) ) ( not ( = ?auto_2460172 ?auto_2460176 ) ) ( not ( = ?auto_2460172 ?auto_2460177 ) ) ( not ( = ?auto_2460172 ?auto_2460178 ) ) ( not ( = ?auto_2460172 ?auto_2460179 ) ) ( not ( = ?auto_2460172 ?auto_2460180 ) ) ( not ( = ?auto_2460172 ?auto_2460181 ) ) ( not ( = ?auto_2460172 ?auto_2460183 ) ) ( not ( = ?auto_2460174 ?auto_2460175 ) ) ( not ( = ?auto_2460174 ?auto_2460176 ) ) ( not ( = ?auto_2460174 ?auto_2460177 ) ) ( not ( = ?auto_2460174 ?auto_2460178 ) ) ( not ( = ?auto_2460174 ?auto_2460179 ) ) ( not ( = ?auto_2460174 ?auto_2460180 ) ) ( not ( = ?auto_2460174 ?auto_2460181 ) ) ( not ( = ?auto_2460174 ?auto_2460183 ) ) ( not ( = ?auto_2460175 ?auto_2460176 ) ) ( not ( = ?auto_2460175 ?auto_2460177 ) ) ( not ( = ?auto_2460175 ?auto_2460178 ) ) ( not ( = ?auto_2460175 ?auto_2460179 ) ) ( not ( = ?auto_2460175 ?auto_2460180 ) ) ( not ( = ?auto_2460175 ?auto_2460181 ) ) ( not ( = ?auto_2460175 ?auto_2460183 ) ) ( not ( = ?auto_2460176 ?auto_2460177 ) ) ( not ( = ?auto_2460176 ?auto_2460178 ) ) ( not ( = ?auto_2460176 ?auto_2460179 ) ) ( not ( = ?auto_2460176 ?auto_2460180 ) ) ( not ( = ?auto_2460176 ?auto_2460181 ) ) ( not ( = ?auto_2460176 ?auto_2460183 ) ) ( not ( = ?auto_2460177 ?auto_2460178 ) ) ( not ( = ?auto_2460177 ?auto_2460179 ) ) ( not ( = ?auto_2460177 ?auto_2460180 ) ) ( not ( = ?auto_2460177 ?auto_2460181 ) ) ( not ( = ?auto_2460177 ?auto_2460183 ) ) ( not ( = ?auto_2460178 ?auto_2460179 ) ) ( not ( = ?auto_2460178 ?auto_2460180 ) ) ( not ( = ?auto_2460178 ?auto_2460181 ) ) ( not ( = ?auto_2460178 ?auto_2460183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2460179 ?auto_2460180 ?auto_2460181 )
      ( MAKE-14CRATE-VERIFY ?auto_2460168 ?auto_2460169 ?auto_2460170 ?auto_2460167 ?auto_2460171 ?auto_2460173 ?auto_2460172 ?auto_2460174 ?auto_2460175 ?auto_2460176 ?auto_2460177 ?auto_2460178 ?auto_2460179 ?auto_2460180 ?auto_2460181 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2460372 - SURFACE
      ?auto_2460373 - SURFACE
      ?auto_2460374 - SURFACE
      ?auto_2460371 - SURFACE
      ?auto_2460375 - SURFACE
      ?auto_2460377 - SURFACE
      ?auto_2460376 - SURFACE
      ?auto_2460378 - SURFACE
      ?auto_2460379 - SURFACE
      ?auto_2460380 - SURFACE
      ?auto_2460381 - SURFACE
      ?auto_2460382 - SURFACE
      ?auto_2460383 - SURFACE
      ?auto_2460384 - SURFACE
      ?auto_2460385 - SURFACE
    )
    :vars
    (
      ?auto_2460391 - HOIST
      ?auto_2460389 - PLACE
      ?auto_2460390 - PLACE
      ?auto_2460388 - HOIST
      ?auto_2460387 - SURFACE
      ?auto_2460386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2460391 ?auto_2460389 ) ( IS-CRATE ?auto_2460385 ) ( not ( = ?auto_2460384 ?auto_2460385 ) ) ( not ( = ?auto_2460383 ?auto_2460384 ) ) ( not ( = ?auto_2460383 ?auto_2460385 ) ) ( not ( = ?auto_2460390 ?auto_2460389 ) ) ( HOIST-AT ?auto_2460388 ?auto_2460390 ) ( not ( = ?auto_2460391 ?auto_2460388 ) ) ( AVAILABLE ?auto_2460388 ) ( SURFACE-AT ?auto_2460385 ?auto_2460390 ) ( ON ?auto_2460385 ?auto_2460387 ) ( CLEAR ?auto_2460385 ) ( not ( = ?auto_2460384 ?auto_2460387 ) ) ( not ( = ?auto_2460385 ?auto_2460387 ) ) ( not ( = ?auto_2460383 ?auto_2460387 ) ) ( TRUCK-AT ?auto_2460386 ?auto_2460389 ) ( SURFACE-AT ?auto_2460383 ?auto_2460389 ) ( CLEAR ?auto_2460383 ) ( IS-CRATE ?auto_2460384 ) ( AVAILABLE ?auto_2460391 ) ( IN ?auto_2460384 ?auto_2460386 ) ( ON ?auto_2460373 ?auto_2460372 ) ( ON ?auto_2460374 ?auto_2460373 ) ( ON ?auto_2460371 ?auto_2460374 ) ( ON ?auto_2460375 ?auto_2460371 ) ( ON ?auto_2460377 ?auto_2460375 ) ( ON ?auto_2460376 ?auto_2460377 ) ( ON ?auto_2460378 ?auto_2460376 ) ( ON ?auto_2460379 ?auto_2460378 ) ( ON ?auto_2460380 ?auto_2460379 ) ( ON ?auto_2460381 ?auto_2460380 ) ( ON ?auto_2460382 ?auto_2460381 ) ( ON ?auto_2460383 ?auto_2460382 ) ( not ( = ?auto_2460372 ?auto_2460373 ) ) ( not ( = ?auto_2460372 ?auto_2460374 ) ) ( not ( = ?auto_2460372 ?auto_2460371 ) ) ( not ( = ?auto_2460372 ?auto_2460375 ) ) ( not ( = ?auto_2460372 ?auto_2460377 ) ) ( not ( = ?auto_2460372 ?auto_2460376 ) ) ( not ( = ?auto_2460372 ?auto_2460378 ) ) ( not ( = ?auto_2460372 ?auto_2460379 ) ) ( not ( = ?auto_2460372 ?auto_2460380 ) ) ( not ( = ?auto_2460372 ?auto_2460381 ) ) ( not ( = ?auto_2460372 ?auto_2460382 ) ) ( not ( = ?auto_2460372 ?auto_2460383 ) ) ( not ( = ?auto_2460372 ?auto_2460384 ) ) ( not ( = ?auto_2460372 ?auto_2460385 ) ) ( not ( = ?auto_2460372 ?auto_2460387 ) ) ( not ( = ?auto_2460373 ?auto_2460374 ) ) ( not ( = ?auto_2460373 ?auto_2460371 ) ) ( not ( = ?auto_2460373 ?auto_2460375 ) ) ( not ( = ?auto_2460373 ?auto_2460377 ) ) ( not ( = ?auto_2460373 ?auto_2460376 ) ) ( not ( = ?auto_2460373 ?auto_2460378 ) ) ( not ( = ?auto_2460373 ?auto_2460379 ) ) ( not ( = ?auto_2460373 ?auto_2460380 ) ) ( not ( = ?auto_2460373 ?auto_2460381 ) ) ( not ( = ?auto_2460373 ?auto_2460382 ) ) ( not ( = ?auto_2460373 ?auto_2460383 ) ) ( not ( = ?auto_2460373 ?auto_2460384 ) ) ( not ( = ?auto_2460373 ?auto_2460385 ) ) ( not ( = ?auto_2460373 ?auto_2460387 ) ) ( not ( = ?auto_2460374 ?auto_2460371 ) ) ( not ( = ?auto_2460374 ?auto_2460375 ) ) ( not ( = ?auto_2460374 ?auto_2460377 ) ) ( not ( = ?auto_2460374 ?auto_2460376 ) ) ( not ( = ?auto_2460374 ?auto_2460378 ) ) ( not ( = ?auto_2460374 ?auto_2460379 ) ) ( not ( = ?auto_2460374 ?auto_2460380 ) ) ( not ( = ?auto_2460374 ?auto_2460381 ) ) ( not ( = ?auto_2460374 ?auto_2460382 ) ) ( not ( = ?auto_2460374 ?auto_2460383 ) ) ( not ( = ?auto_2460374 ?auto_2460384 ) ) ( not ( = ?auto_2460374 ?auto_2460385 ) ) ( not ( = ?auto_2460374 ?auto_2460387 ) ) ( not ( = ?auto_2460371 ?auto_2460375 ) ) ( not ( = ?auto_2460371 ?auto_2460377 ) ) ( not ( = ?auto_2460371 ?auto_2460376 ) ) ( not ( = ?auto_2460371 ?auto_2460378 ) ) ( not ( = ?auto_2460371 ?auto_2460379 ) ) ( not ( = ?auto_2460371 ?auto_2460380 ) ) ( not ( = ?auto_2460371 ?auto_2460381 ) ) ( not ( = ?auto_2460371 ?auto_2460382 ) ) ( not ( = ?auto_2460371 ?auto_2460383 ) ) ( not ( = ?auto_2460371 ?auto_2460384 ) ) ( not ( = ?auto_2460371 ?auto_2460385 ) ) ( not ( = ?auto_2460371 ?auto_2460387 ) ) ( not ( = ?auto_2460375 ?auto_2460377 ) ) ( not ( = ?auto_2460375 ?auto_2460376 ) ) ( not ( = ?auto_2460375 ?auto_2460378 ) ) ( not ( = ?auto_2460375 ?auto_2460379 ) ) ( not ( = ?auto_2460375 ?auto_2460380 ) ) ( not ( = ?auto_2460375 ?auto_2460381 ) ) ( not ( = ?auto_2460375 ?auto_2460382 ) ) ( not ( = ?auto_2460375 ?auto_2460383 ) ) ( not ( = ?auto_2460375 ?auto_2460384 ) ) ( not ( = ?auto_2460375 ?auto_2460385 ) ) ( not ( = ?auto_2460375 ?auto_2460387 ) ) ( not ( = ?auto_2460377 ?auto_2460376 ) ) ( not ( = ?auto_2460377 ?auto_2460378 ) ) ( not ( = ?auto_2460377 ?auto_2460379 ) ) ( not ( = ?auto_2460377 ?auto_2460380 ) ) ( not ( = ?auto_2460377 ?auto_2460381 ) ) ( not ( = ?auto_2460377 ?auto_2460382 ) ) ( not ( = ?auto_2460377 ?auto_2460383 ) ) ( not ( = ?auto_2460377 ?auto_2460384 ) ) ( not ( = ?auto_2460377 ?auto_2460385 ) ) ( not ( = ?auto_2460377 ?auto_2460387 ) ) ( not ( = ?auto_2460376 ?auto_2460378 ) ) ( not ( = ?auto_2460376 ?auto_2460379 ) ) ( not ( = ?auto_2460376 ?auto_2460380 ) ) ( not ( = ?auto_2460376 ?auto_2460381 ) ) ( not ( = ?auto_2460376 ?auto_2460382 ) ) ( not ( = ?auto_2460376 ?auto_2460383 ) ) ( not ( = ?auto_2460376 ?auto_2460384 ) ) ( not ( = ?auto_2460376 ?auto_2460385 ) ) ( not ( = ?auto_2460376 ?auto_2460387 ) ) ( not ( = ?auto_2460378 ?auto_2460379 ) ) ( not ( = ?auto_2460378 ?auto_2460380 ) ) ( not ( = ?auto_2460378 ?auto_2460381 ) ) ( not ( = ?auto_2460378 ?auto_2460382 ) ) ( not ( = ?auto_2460378 ?auto_2460383 ) ) ( not ( = ?auto_2460378 ?auto_2460384 ) ) ( not ( = ?auto_2460378 ?auto_2460385 ) ) ( not ( = ?auto_2460378 ?auto_2460387 ) ) ( not ( = ?auto_2460379 ?auto_2460380 ) ) ( not ( = ?auto_2460379 ?auto_2460381 ) ) ( not ( = ?auto_2460379 ?auto_2460382 ) ) ( not ( = ?auto_2460379 ?auto_2460383 ) ) ( not ( = ?auto_2460379 ?auto_2460384 ) ) ( not ( = ?auto_2460379 ?auto_2460385 ) ) ( not ( = ?auto_2460379 ?auto_2460387 ) ) ( not ( = ?auto_2460380 ?auto_2460381 ) ) ( not ( = ?auto_2460380 ?auto_2460382 ) ) ( not ( = ?auto_2460380 ?auto_2460383 ) ) ( not ( = ?auto_2460380 ?auto_2460384 ) ) ( not ( = ?auto_2460380 ?auto_2460385 ) ) ( not ( = ?auto_2460380 ?auto_2460387 ) ) ( not ( = ?auto_2460381 ?auto_2460382 ) ) ( not ( = ?auto_2460381 ?auto_2460383 ) ) ( not ( = ?auto_2460381 ?auto_2460384 ) ) ( not ( = ?auto_2460381 ?auto_2460385 ) ) ( not ( = ?auto_2460381 ?auto_2460387 ) ) ( not ( = ?auto_2460382 ?auto_2460383 ) ) ( not ( = ?auto_2460382 ?auto_2460384 ) ) ( not ( = ?auto_2460382 ?auto_2460385 ) ) ( not ( = ?auto_2460382 ?auto_2460387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2460383 ?auto_2460384 ?auto_2460385 )
      ( MAKE-14CRATE-VERIFY ?auto_2460372 ?auto_2460373 ?auto_2460374 ?auto_2460371 ?auto_2460375 ?auto_2460377 ?auto_2460376 ?auto_2460378 ?auto_2460379 ?auto_2460380 ?auto_2460381 ?auto_2460382 ?auto_2460383 ?auto_2460384 ?auto_2460385 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2477560 - SURFACE
      ?auto_2477561 - SURFACE
      ?auto_2477562 - SURFACE
      ?auto_2477559 - SURFACE
      ?auto_2477563 - SURFACE
      ?auto_2477565 - SURFACE
      ?auto_2477564 - SURFACE
      ?auto_2477566 - SURFACE
      ?auto_2477567 - SURFACE
      ?auto_2477568 - SURFACE
      ?auto_2477569 - SURFACE
      ?auto_2477570 - SURFACE
      ?auto_2477571 - SURFACE
      ?auto_2477572 - SURFACE
      ?auto_2477573 - SURFACE
      ?auto_2477574 - SURFACE
    )
    :vars
    (
      ?auto_2477576 - HOIST
      ?auto_2477575 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2477576 ?auto_2477575 ) ( SURFACE-AT ?auto_2477573 ?auto_2477575 ) ( CLEAR ?auto_2477573 ) ( LIFTING ?auto_2477576 ?auto_2477574 ) ( IS-CRATE ?auto_2477574 ) ( not ( = ?auto_2477573 ?auto_2477574 ) ) ( ON ?auto_2477561 ?auto_2477560 ) ( ON ?auto_2477562 ?auto_2477561 ) ( ON ?auto_2477559 ?auto_2477562 ) ( ON ?auto_2477563 ?auto_2477559 ) ( ON ?auto_2477565 ?auto_2477563 ) ( ON ?auto_2477564 ?auto_2477565 ) ( ON ?auto_2477566 ?auto_2477564 ) ( ON ?auto_2477567 ?auto_2477566 ) ( ON ?auto_2477568 ?auto_2477567 ) ( ON ?auto_2477569 ?auto_2477568 ) ( ON ?auto_2477570 ?auto_2477569 ) ( ON ?auto_2477571 ?auto_2477570 ) ( ON ?auto_2477572 ?auto_2477571 ) ( ON ?auto_2477573 ?auto_2477572 ) ( not ( = ?auto_2477560 ?auto_2477561 ) ) ( not ( = ?auto_2477560 ?auto_2477562 ) ) ( not ( = ?auto_2477560 ?auto_2477559 ) ) ( not ( = ?auto_2477560 ?auto_2477563 ) ) ( not ( = ?auto_2477560 ?auto_2477565 ) ) ( not ( = ?auto_2477560 ?auto_2477564 ) ) ( not ( = ?auto_2477560 ?auto_2477566 ) ) ( not ( = ?auto_2477560 ?auto_2477567 ) ) ( not ( = ?auto_2477560 ?auto_2477568 ) ) ( not ( = ?auto_2477560 ?auto_2477569 ) ) ( not ( = ?auto_2477560 ?auto_2477570 ) ) ( not ( = ?auto_2477560 ?auto_2477571 ) ) ( not ( = ?auto_2477560 ?auto_2477572 ) ) ( not ( = ?auto_2477560 ?auto_2477573 ) ) ( not ( = ?auto_2477560 ?auto_2477574 ) ) ( not ( = ?auto_2477561 ?auto_2477562 ) ) ( not ( = ?auto_2477561 ?auto_2477559 ) ) ( not ( = ?auto_2477561 ?auto_2477563 ) ) ( not ( = ?auto_2477561 ?auto_2477565 ) ) ( not ( = ?auto_2477561 ?auto_2477564 ) ) ( not ( = ?auto_2477561 ?auto_2477566 ) ) ( not ( = ?auto_2477561 ?auto_2477567 ) ) ( not ( = ?auto_2477561 ?auto_2477568 ) ) ( not ( = ?auto_2477561 ?auto_2477569 ) ) ( not ( = ?auto_2477561 ?auto_2477570 ) ) ( not ( = ?auto_2477561 ?auto_2477571 ) ) ( not ( = ?auto_2477561 ?auto_2477572 ) ) ( not ( = ?auto_2477561 ?auto_2477573 ) ) ( not ( = ?auto_2477561 ?auto_2477574 ) ) ( not ( = ?auto_2477562 ?auto_2477559 ) ) ( not ( = ?auto_2477562 ?auto_2477563 ) ) ( not ( = ?auto_2477562 ?auto_2477565 ) ) ( not ( = ?auto_2477562 ?auto_2477564 ) ) ( not ( = ?auto_2477562 ?auto_2477566 ) ) ( not ( = ?auto_2477562 ?auto_2477567 ) ) ( not ( = ?auto_2477562 ?auto_2477568 ) ) ( not ( = ?auto_2477562 ?auto_2477569 ) ) ( not ( = ?auto_2477562 ?auto_2477570 ) ) ( not ( = ?auto_2477562 ?auto_2477571 ) ) ( not ( = ?auto_2477562 ?auto_2477572 ) ) ( not ( = ?auto_2477562 ?auto_2477573 ) ) ( not ( = ?auto_2477562 ?auto_2477574 ) ) ( not ( = ?auto_2477559 ?auto_2477563 ) ) ( not ( = ?auto_2477559 ?auto_2477565 ) ) ( not ( = ?auto_2477559 ?auto_2477564 ) ) ( not ( = ?auto_2477559 ?auto_2477566 ) ) ( not ( = ?auto_2477559 ?auto_2477567 ) ) ( not ( = ?auto_2477559 ?auto_2477568 ) ) ( not ( = ?auto_2477559 ?auto_2477569 ) ) ( not ( = ?auto_2477559 ?auto_2477570 ) ) ( not ( = ?auto_2477559 ?auto_2477571 ) ) ( not ( = ?auto_2477559 ?auto_2477572 ) ) ( not ( = ?auto_2477559 ?auto_2477573 ) ) ( not ( = ?auto_2477559 ?auto_2477574 ) ) ( not ( = ?auto_2477563 ?auto_2477565 ) ) ( not ( = ?auto_2477563 ?auto_2477564 ) ) ( not ( = ?auto_2477563 ?auto_2477566 ) ) ( not ( = ?auto_2477563 ?auto_2477567 ) ) ( not ( = ?auto_2477563 ?auto_2477568 ) ) ( not ( = ?auto_2477563 ?auto_2477569 ) ) ( not ( = ?auto_2477563 ?auto_2477570 ) ) ( not ( = ?auto_2477563 ?auto_2477571 ) ) ( not ( = ?auto_2477563 ?auto_2477572 ) ) ( not ( = ?auto_2477563 ?auto_2477573 ) ) ( not ( = ?auto_2477563 ?auto_2477574 ) ) ( not ( = ?auto_2477565 ?auto_2477564 ) ) ( not ( = ?auto_2477565 ?auto_2477566 ) ) ( not ( = ?auto_2477565 ?auto_2477567 ) ) ( not ( = ?auto_2477565 ?auto_2477568 ) ) ( not ( = ?auto_2477565 ?auto_2477569 ) ) ( not ( = ?auto_2477565 ?auto_2477570 ) ) ( not ( = ?auto_2477565 ?auto_2477571 ) ) ( not ( = ?auto_2477565 ?auto_2477572 ) ) ( not ( = ?auto_2477565 ?auto_2477573 ) ) ( not ( = ?auto_2477565 ?auto_2477574 ) ) ( not ( = ?auto_2477564 ?auto_2477566 ) ) ( not ( = ?auto_2477564 ?auto_2477567 ) ) ( not ( = ?auto_2477564 ?auto_2477568 ) ) ( not ( = ?auto_2477564 ?auto_2477569 ) ) ( not ( = ?auto_2477564 ?auto_2477570 ) ) ( not ( = ?auto_2477564 ?auto_2477571 ) ) ( not ( = ?auto_2477564 ?auto_2477572 ) ) ( not ( = ?auto_2477564 ?auto_2477573 ) ) ( not ( = ?auto_2477564 ?auto_2477574 ) ) ( not ( = ?auto_2477566 ?auto_2477567 ) ) ( not ( = ?auto_2477566 ?auto_2477568 ) ) ( not ( = ?auto_2477566 ?auto_2477569 ) ) ( not ( = ?auto_2477566 ?auto_2477570 ) ) ( not ( = ?auto_2477566 ?auto_2477571 ) ) ( not ( = ?auto_2477566 ?auto_2477572 ) ) ( not ( = ?auto_2477566 ?auto_2477573 ) ) ( not ( = ?auto_2477566 ?auto_2477574 ) ) ( not ( = ?auto_2477567 ?auto_2477568 ) ) ( not ( = ?auto_2477567 ?auto_2477569 ) ) ( not ( = ?auto_2477567 ?auto_2477570 ) ) ( not ( = ?auto_2477567 ?auto_2477571 ) ) ( not ( = ?auto_2477567 ?auto_2477572 ) ) ( not ( = ?auto_2477567 ?auto_2477573 ) ) ( not ( = ?auto_2477567 ?auto_2477574 ) ) ( not ( = ?auto_2477568 ?auto_2477569 ) ) ( not ( = ?auto_2477568 ?auto_2477570 ) ) ( not ( = ?auto_2477568 ?auto_2477571 ) ) ( not ( = ?auto_2477568 ?auto_2477572 ) ) ( not ( = ?auto_2477568 ?auto_2477573 ) ) ( not ( = ?auto_2477568 ?auto_2477574 ) ) ( not ( = ?auto_2477569 ?auto_2477570 ) ) ( not ( = ?auto_2477569 ?auto_2477571 ) ) ( not ( = ?auto_2477569 ?auto_2477572 ) ) ( not ( = ?auto_2477569 ?auto_2477573 ) ) ( not ( = ?auto_2477569 ?auto_2477574 ) ) ( not ( = ?auto_2477570 ?auto_2477571 ) ) ( not ( = ?auto_2477570 ?auto_2477572 ) ) ( not ( = ?auto_2477570 ?auto_2477573 ) ) ( not ( = ?auto_2477570 ?auto_2477574 ) ) ( not ( = ?auto_2477571 ?auto_2477572 ) ) ( not ( = ?auto_2477571 ?auto_2477573 ) ) ( not ( = ?auto_2477571 ?auto_2477574 ) ) ( not ( = ?auto_2477572 ?auto_2477573 ) ) ( not ( = ?auto_2477572 ?auto_2477574 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2477573 ?auto_2477574 )
      ( MAKE-15CRATE-VERIFY ?auto_2477560 ?auto_2477561 ?auto_2477562 ?auto_2477559 ?auto_2477563 ?auto_2477565 ?auto_2477564 ?auto_2477566 ?auto_2477567 ?auto_2477568 ?auto_2477569 ?auto_2477570 ?auto_2477571 ?auto_2477572 ?auto_2477573 ?auto_2477574 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2477739 - SURFACE
      ?auto_2477740 - SURFACE
      ?auto_2477741 - SURFACE
      ?auto_2477738 - SURFACE
      ?auto_2477742 - SURFACE
      ?auto_2477744 - SURFACE
      ?auto_2477743 - SURFACE
      ?auto_2477745 - SURFACE
      ?auto_2477746 - SURFACE
      ?auto_2477747 - SURFACE
      ?auto_2477748 - SURFACE
      ?auto_2477749 - SURFACE
      ?auto_2477750 - SURFACE
      ?auto_2477751 - SURFACE
      ?auto_2477752 - SURFACE
      ?auto_2477753 - SURFACE
    )
    :vars
    (
      ?auto_2477754 - HOIST
      ?auto_2477756 - PLACE
      ?auto_2477755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2477754 ?auto_2477756 ) ( SURFACE-AT ?auto_2477752 ?auto_2477756 ) ( CLEAR ?auto_2477752 ) ( IS-CRATE ?auto_2477753 ) ( not ( = ?auto_2477752 ?auto_2477753 ) ) ( TRUCK-AT ?auto_2477755 ?auto_2477756 ) ( AVAILABLE ?auto_2477754 ) ( IN ?auto_2477753 ?auto_2477755 ) ( ON ?auto_2477752 ?auto_2477751 ) ( not ( = ?auto_2477751 ?auto_2477752 ) ) ( not ( = ?auto_2477751 ?auto_2477753 ) ) ( ON ?auto_2477740 ?auto_2477739 ) ( ON ?auto_2477741 ?auto_2477740 ) ( ON ?auto_2477738 ?auto_2477741 ) ( ON ?auto_2477742 ?auto_2477738 ) ( ON ?auto_2477744 ?auto_2477742 ) ( ON ?auto_2477743 ?auto_2477744 ) ( ON ?auto_2477745 ?auto_2477743 ) ( ON ?auto_2477746 ?auto_2477745 ) ( ON ?auto_2477747 ?auto_2477746 ) ( ON ?auto_2477748 ?auto_2477747 ) ( ON ?auto_2477749 ?auto_2477748 ) ( ON ?auto_2477750 ?auto_2477749 ) ( ON ?auto_2477751 ?auto_2477750 ) ( not ( = ?auto_2477739 ?auto_2477740 ) ) ( not ( = ?auto_2477739 ?auto_2477741 ) ) ( not ( = ?auto_2477739 ?auto_2477738 ) ) ( not ( = ?auto_2477739 ?auto_2477742 ) ) ( not ( = ?auto_2477739 ?auto_2477744 ) ) ( not ( = ?auto_2477739 ?auto_2477743 ) ) ( not ( = ?auto_2477739 ?auto_2477745 ) ) ( not ( = ?auto_2477739 ?auto_2477746 ) ) ( not ( = ?auto_2477739 ?auto_2477747 ) ) ( not ( = ?auto_2477739 ?auto_2477748 ) ) ( not ( = ?auto_2477739 ?auto_2477749 ) ) ( not ( = ?auto_2477739 ?auto_2477750 ) ) ( not ( = ?auto_2477739 ?auto_2477751 ) ) ( not ( = ?auto_2477739 ?auto_2477752 ) ) ( not ( = ?auto_2477739 ?auto_2477753 ) ) ( not ( = ?auto_2477740 ?auto_2477741 ) ) ( not ( = ?auto_2477740 ?auto_2477738 ) ) ( not ( = ?auto_2477740 ?auto_2477742 ) ) ( not ( = ?auto_2477740 ?auto_2477744 ) ) ( not ( = ?auto_2477740 ?auto_2477743 ) ) ( not ( = ?auto_2477740 ?auto_2477745 ) ) ( not ( = ?auto_2477740 ?auto_2477746 ) ) ( not ( = ?auto_2477740 ?auto_2477747 ) ) ( not ( = ?auto_2477740 ?auto_2477748 ) ) ( not ( = ?auto_2477740 ?auto_2477749 ) ) ( not ( = ?auto_2477740 ?auto_2477750 ) ) ( not ( = ?auto_2477740 ?auto_2477751 ) ) ( not ( = ?auto_2477740 ?auto_2477752 ) ) ( not ( = ?auto_2477740 ?auto_2477753 ) ) ( not ( = ?auto_2477741 ?auto_2477738 ) ) ( not ( = ?auto_2477741 ?auto_2477742 ) ) ( not ( = ?auto_2477741 ?auto_2477744 ) ) ( not ( = ?auto_2477741 ?auto_2477743 ) ) ( not ( = ?auto_2477741 ?auto_2477745 ) ) ( not ( = ?auto_2477741 ?auto_2477746 ) ) ( not ( = ?auto_2477741 ?auto_2477747 ) ) ( not ( = ?auto_2477741 ?auto_2477748 ) ) ( not ( = ?auto_2477741 ?auto_2477749 ) ) ( not ( = ?auto_2477741 ?auto_2477750 ) ) ( not ( = ?auto_2477741 ?auto_2477751 ) ) ( not ( = ?auto_2477741 ?auto_2477752 ) ) ( not ( = ?auto_2477741 ?auto_2477753 ) ) ( not ( = ?auto_2477738 ?auto_2477742 ) ) ( not ( = ?auto_2477738 ?auto_2477744 ) ) ( not ( = ?auto_2477738 ?auto_2477743 ) ) ( not ( = ?auto_2477738 ?auto_2477745 ) ) ( not ( = ?auto_2477738 ?auto_2477746 ) ) ( not ( = ?auto_2477738 ?auto_2477747 ) ) ( not ( = ?auto_2477738 ?auto_2477748 ) ) ( not ( = ?auto_2477738 ?auto_2477749 ) ) ( not ( = ?auto_2477738 ?auto_2477750 ) ) ( not ( = ?auto_2477738 ?auto_2477751 ) ) ( not ( = ?auto_2477738 ?auto_2477752 ) ) ( not ( = ?auto_2477738 ?auto_2477753 ) ) ( not ( = ?auto_2477742 ?auto_2477744 ) ) ( not ( = ?auto_2477742 ?auto_2477743 ) ) ( not ( = ?auto_2477742 ?auto_2477745 ) ) ( not ( = ?auto_2477742 ?auto_2477746 ) ) ( not ( = ?auto_2477742 ?auto_2477747 ) ) ( not ( = ?auto_2477742 ?auto_2477748 ) ) ( not ( = ?auto_2477742 ?auto_2477749 ) ) ( not ( = ?auto_2477742 ?auto_2477750 ) ) ( not ( = ?auto_2477742 ?auto_2477751 ) ) ( not ( = ?auto_2477742 ?auto_2477752 ) ) ( not ( = ?auto_2477742 ?auto_2477753 ) ) ( not ( = ?auto_2477744 ?auto_2477743 ) ) ( not ( = ?auto_2477744 ?auto_2477745 ) ) ( not ( = ?auto_2477744 ?auto_2477746 ) ) ( not ( = ?auto_2477744 ?auto_2477747 ) ) ( not ( = ?auto_2477744 ?auto_2477748 ) ) ( not ( = ?auto_2477744 ?auto_2477749 ) ) ( not ( = ?auto_2477744 ?auto_2477750 ) ) ( not ( = ?auto_2477744 ?auto_2477751 ) ) ( not ( = ?auto_2477744 ?auto_2477752 ) ) ( not ( = ?auto_2477744 ?auto_2477753 ) ) ( not ( = ?auto_2477743 ?auto_2477745 ) ) ( not ( = ?auto_2477743 ?auto_2477746 ) ) ( not ( = ?auto_2477743 ?auto_2477747 ) ) ( not ( = ?auto_2477743 ?auto_2477748 ) ) ( not ( = ?auto_2477743 ?auto_2477749 ) ) ( not ( = ?auto_2477743 ?auto_2477750 ) ) ( not ( = ?auto_2477743 ?auto_2477751 ) ) ( not ( = ?auto_2477743 ?auto_2477752 ) ) ( not ( = ?auto_2477743 ?auto_2477753 ) ) ( not ( = ?auto_2477745 ?auto_2477746 ) ) ( not ( = ?auto_2477745 ?auto_2477747 ) ) ( not ( = ?auto_2477745 ?auto_2477748 ) ) ( not ( = ?auto_2477745 ?auto_2477749 ) ) ( not ( = ?auto_2477745 ?auto_2477750 ) ) ( not ( = ?auto_2477745 ?auto_2477751 ) ) ( not ( = ?auto_2477745 ?auto_2477752 ) ) ( not ( = ?auto_2477745 ?auto_2477753 ) ) ( not ( = ?auto_2477746 ?auto_2477747 ) ) ( not ( = ?auto_2477746 ?auto_2477748 ) ) ( not ( = ?auto_2477746 ?auto_2477749 ) ) ( not ( = ?auto_2477746 ?auto_2477750 ) ) ( not ( = ?auto_2477746 ?auto_2477751 ) ) ( not ( = ?auto_2477746 ?auto_2477752 ) ) ( not ( = ?auto_2477746 ?auto_2477753 ) ) ( not ( = ?auto_2477747 ?auto_2477748 ) ) ( not ( = ?auto_2477747 ?auto_2477749 ) ) ( not ( = ?auto_2477747 ?auto_2477750 ) ) ( not ( = ?auto_2477747 ?auto_2477751 ) ) ( not ( = ?auto_2477747 ?auto_2477752 ) ) ( not ( = ?auto_2477747 ?auto_2477753 ) ) ( not ( = ?auto_2477748 ?auto_2477749 ) ) ( not ( = ?auto_2477748 ?auto_2477750 ) ) ( not ( = ?auto_2477748 ?auto_2477751 ) ) ( not ( = ?auto_2477748 ?auto_2477752 ) ) ( not ( = ?auto_2477748 ?auto_2477753 ) ) ( not ( = ?auto_2477749 ?auto_2477750 ) ) ( not ( = ?auto_2477749 ?auto_2477751 ) ) ( not ( = ?auto_2477749 ?auto_2477752 ) ) ( not ( = ?auto_2477749 ?auto_2477753 ) ) ( not ( = ?auto_2477750 ?auto_2477751 ) ) ( not ( = ?auto_2477750 ?auto_2477752 ) ) ( not ( = ?auto_2477750 ?auto_2477753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2477751 ?auto_2477752 ?auto_2477753 )
      ( MAKE-15CRATE-VERIFY ?auto_2477739 ?auto_2477740 ?auto_2477741 ?auto_2477738 ?auto_2477742 ?auto_2477744 ?auto_2477743 ?auto_2477745 ?auto_2477746 ?auto_2477747 ?auto_2477748 ?auto_2477749 ?auto_2477750 ?auto_2477751 ?auto_2477752 ?auto_2477753 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2477934 - SURFACE
      ?auto_2477935 - SURFACE
      ?auto_2477936 - SURFACE
      ?auto_2477933 - SURFACE
      ?auto_2477937 - SURFACE
      ?auto_2477939 - SURFACE
      ?auto_2477938 - SURFACE
      ?auto_2477940 - SURFACE
      ?auto_2477941 - SURFACE
      ?auto_2477942 - SURFACE
      ?auto_2477943 - SURFACE
      ?auto_2477944 - SURFACE
      ?auto_2477945 - SURFACE
      ?auto_2477946 - SURFACE
      ?auto_2477947 - SURFACE
      ?auto_2477948 - SURFACE
    )
    :vars
    (
      ?auto_2477952 - HOIST
      ?auto_2477949 - PLACE
      ?auto_2477950 - TRUCK
      ?auto_2477951 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2477952 ?auto_2477949 ) ( SURFACE-AT ?auto_2477947 ?auto_2477949 ) ( CLEAR ?auto_2477947 ) ( IS-CRATE ?auto_2477948 ) ( not ( = ?auto_2477947 ?auto_2477948 ) ) ( AVAILABLE ?auto_2477952 ) ( IN ?auto_2477948 ?auto_2477950 ) ( ON ?auto_2477947 ?auto_2477946 ) ( not ( = ?auto_2477946 ?auto_2477947 ) ) ( not ( = ?auto_2477946 ?auto_2477948 ) ) ( TRUCK-AT ?auto_2477950 ?auto_2477951 ) ( not ( = ?auto_2477951 ?auto_2477949 ) ) ( ON ?auto_2477935 ?auto_2477934 ) ( ON ?auto_2477936 ?auto_2477935 ) ( ON ?auto_2477933 ?auto_2477936 ) ( ON ?auto_2477937 ?auto_2477933 ) ( ON ?auto_2477939 ?auto_2477937 ) ( ON ?auto_2477938 ?auto_2477939 ) ( ON ?auto_2477940 ?auto_2477938 ) ( ON ?auto_2477941 ?auto_2477940 ) ( ON ?auto_2477942 ?auto_2477941 ) ( ON ?auto_2477943 ?auto_2477942 ) ( ON ?auto_2477944 ?auto_2477943 ) ( ON ?auto_2477945 ?auto_2477944 ) ( ON ?auto_2477946 ?auto_2477945 ) ( not ( = ?auto_2477934 ?auto_2477935 ) ) ( not ( = ?auto_2477934 ?auto_2477936 ) ) ( not ( = ?auto_2477934 ?auto_2477933 ) ) ( not ( = ?auto_2477934 ?auto_2477937 ) ) ( not ( = ?auto_2477934 ?auto_2477939 ) ) ( not ( = ?auto_2477934 ?auto_2477938 ) ) ( not ( = ?auto_2477934 ?auto_2477940 ) ) ( not ( = ?auto_2477934 ?auto_2477941 ) ) ( not ( = ?auto_2477934 ?auto_2477942 ) ) ( not ( = ?auto_2477934 ?auto_2477943 ) ) ( not ( = ?auto_2477934 ?auto_2477944 ) ) ( not ( = ?auto_2477934 ?auto_2477945 ) ) ( not ( = ?auto_2477934 ?auto_2477946 ) ) ( not ( = ?auto_2477934 ?auto_2477947 ) ) ( not ( = ?auto_2477934 ?auto_2477948 ) ) ( not ( = ?auto_2477935 ?auto_2477936 ) ) ( not ( = ?auto_2477935 ?auto_2477933 ) ) ( not ( = ?auto_2477935 ?auto_2477937 ) ) ( not ( = ?auto_2477935 ?auto_2477939 ) ) ( not ( = ?auto_2477935 ?auto_2477938 ) ) ( not ( = ?auto_2477935 ?auto_2477940 ) ) ( not ( = ?auto_2477935 ?auto_2477941 ) ) ( not ( = ?auto_2477935 ?auto_2477942 ) ) ( not ( = ?auto_2477935 ?auto_2477943 ) ) ( not ( = ?auto_2477935 ?auto_2477944 ) ) ( not ( = ?auto_2477935 ?auto_2477945 ) ) ( not ( = ?auto_2477935 ?auto_2477946 ) ) ( not ( = ?auto_2477935 ?auto_2477947 ) ) ( not ( = ?auto_2477935 ?auto_2477948 ) ) ( not ( = ?auto_2477936 ?auto_2477933 ) ) ( not ( = ?auto_2477936 ?auto_2477937 ) ) ( not ( = ?auto_2477936 ?auto_2477939 ) ) ( not ( = ?auto_2477936 ?auto_2477938 ) ) ( not ( = ?auto_2477936 ?auto_2477940 ) ) ( not ( = ?auto_2477936 ?auto_2477941 ) ) ( not ( = ?auto_2477936 ?auto_2477942 ) ) ( not ( = ?auto_2477936 ?auto_2477943 ) ) ( not ( = ?auto_2477936 ?auto_2477944 ) ) ( not ( = ?auto_2477936 ?auto_2477945 ) ) ( not ( = ?auto_2477936 ?auto_2477946 ) ) ( not ( = ?auto_2477936 ?auto_2477947 ) ) ( not ( = ?auto_2477936 ?auto_2477948 ) ) ( not ( = ?auto_2477933 ?auto_2477937 ) ) ( not ( = ?auto_2477933 ?auto_2477939 ) ) ( not ( = ?auto_2477933 ?auto_2477938 ) ) ( not ( = ?auto_2477933 ?auto_2477940 ) ) ( not ( = ?auto_2477933 ?auto_2477941 ) ) ( not ( = ?auto_2477933 ?auto_2477942 ) ) ( not ( = ?auto_2477933 ?auto_2477943 ) ) ( not ( = ?auto_2477933 ?auto_2477944 ) ) ( not ( = ?auto_2477933 ?auto_2477945 ) ) ( not ( = ?auto_2477933 ?auto_2477946 ) ) ( not ( = ?auto_2477933 ?auto_2477947 ) ) ( not ( = ?auto_2477933 ?auto_2477948 ) ) ( not ( = ?auto_2477937 ?auto_2477939 ) ) ( not ( = ?auto_2477937 ?auto_2477938 ) ) ( not ( = ?auto_2477937 ?auto_2477940 ) ) ( not ( = ?auto_2477937 ?auto_2477941 ) ) ( not ( = ?auto_2477937 ?auto_2477942 ) ) ( not ( = ?auto_2477937 ?auto_2477943 ) ) ( not ( = ?auto_2477937 ?auto_2477944 ) ) ( not ( = ?auto_2477937 ?auto_2477945 ) ) ( not ( = ?auto_2477937 ?auto_2477946 ) ) ( not ( = ?auto_2477937 ?auto_2477947 ) ) ( not ( = ?auto_2477937 ?auto_2477948 ) ) ( not ( = ?auto_2477939 ?auto_2477938 ) ) ( not ( = ?auto_2477939 ?auto_2477940 ) ) ( not ( = ?auto_2477939 ?auto_2477941 ) ) ( not ( = ?auto_2477939 ?auto_2477942 ) ) ( not ( = ?auto_2477939 ?auto_2477943 ) ) ( not ( = ?auto_2477939 ?auto_2477944 ) ) ( not ( = ?auto_2477939 ?auto_2477945 ) ) ( not ( = ?auto_2477939 ?auto_2477946 ) ) ( not ( = ?auto_2477939 ?auto_2477947 ) ) ( not ( = ?auto_2477939 ?auto_2477948 ) ) ( not ( = ?auto_2477938 ?auto_2477940 ) ) ( not ( = ?auto_2477938 ?auto_2477941 ) ) ( not ( = ?auto_2477938 ?auto_2477942 ) ) ( not ( = ?auto_2477938 ?auto_2477943 ) ) ( not ( = ?auto_2477938 ?auto_2477944 ) ) ( not ( = ?auto_2477938 ?auto_2477945 ) ) ( not ( = ?auto_2477938 ?auto_2477946 ) ) ( not ( = ?auto_2477938 ?auto_2477947 ) ) ( not ( = ?auto_2477938 ?auto_2477948 ) ) ( not ( = ?auto_2477940 ?auto_2477941 ) ) ( not ( = ?auto_2477940 ?auto_2477942 ) ) ( not ( = ?auto_2477940 ?auto_2477943 ) ) ( not ( = ?auto_2477940 ?auto_2477944 ) ) ( not ( = ?auto_2477940 ?auto_2477945 ) ) ( not ( = ?auto_2477940 ?auto_2477946 ) ) ( not ( = ?auto_2477940 ?auto_2477947 ) ) ( not ( = ?auto_2477940 ?auto_2477948 ) ) ( not ( = ?auto_2477941 ?auto_2477942 ) ) ( not ( = ?auto_2477941 ?auto_2477943 ) ) ( not ( = ?auto_2477941 ?auto_2477944 ) ) ( not ( = ?auto_2477941 ?auto_2477945 ) ) ( not ( = ?auto_2477941 ?auto_2477946 ) ) ( not ( = ?auto_2477941 ?auto_2477947 ) ) ( not ( = ?auto_2477941 ?auto_2477948 ) ) ( not ( = ?auto_2477942 ?auto_2477943 ) ) ( not ( = ?auto_2477942 ?auto_2477944 ) ) ( not ( = ?auto_2477942 ?auto_2477945 ) ) ( not ( = ?auto_2477942 ?auto_2477946 ) ) ( not ( = ?auto_2477942 ?auto_2477947 ) ) ( not ( = ?auto_2477942 ?auto_2477948 ) ) ( not ( = ?auto_2477943 ?auto_2477944 ) ) ( not ( = ?auto_2477943 ?auto_2477945 ) ) ( not ( = ?auto_2477943 ?auto_2477946 ) ) ( not ( = ?auto_2477943 ?auto_2477947 ) ) ( not ( = ?auto_2477943 ?auto_2477948 ) ) ( not ( = ?auto_2477944 ?auto_2477945 ) ) ( not ( = ?auto_2477944 ?auto_2477946 ) ) ( not ( = ?auto_2477944 ?auto_2477947 ) ) ( not ( = ?auto_2477944 ?auto_2477948 ) ) ( not ( = ?auto_2477945 ?auto_2477946 ) ) ( not ( = ?auto_2477945 ?auto_2477947 ) ) ( not ( = ?auto_2477945 ?auto_2477948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2477946 ?auto_2477947 ?auto_2477948 )
      ( MAKE-15CRATE-VERIFY ?auto_2477934 ?auto_2477935 ?auto_2477936 ?auto_2477933 ?auto_2477937 ?auto_2477939 ?auto_2477938 ?auto_2477940 ?auto_2477941 ?auto_2477942 ?auto_2477943 ?auto_2477944 ?auto_2477945 ?auto_2477946 ?auto_2477947 ?auto_2477948 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2478144 - SURFACE
      ?auto_2478145 - SURFACE
      ?auto_2478146 - SURFACE
      ?auto_2478143 - SURFACE
      ?auto_2478147 - SURFACE
      ?auto_2478149 - SURFACE
      ?auto_2478148 - SURFACE
      ?auto_2478150 - SURFACE
      ?auto_2478151 - SURFACE
      ?auto_2478152 - SURFACE
      ?auto_2478153 - SURFACE
      ?auto_2478154 - SURFACE
      ?auto_2478155 - SURFACE
      ?auto_2478156 - SURFACE
      ?auto_2478157 - SURFACE
      ?auto_2478158 - SURFACE
    )
    :vars
    (
      ?auto_2478162 - HOIST
      ?auto_2478161 - PLACE
      ?auto_2478163 - TRUCK
      ?auto_2478160 - PLACE
      ?auto_2478159 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2478162 ?auto_2478161 ) ( SURFACE-AT ?auto_2478157 ?auto_2478161 ) ( CLEAR ?auto_2478157 ) ( IS-CRATE ?auto_2478158 ) ( not ( = ?auto_2478157 ?auto_2478158 ) ) ( AVAILABLE ?auto_2478162 ) ( ON ?auto_2478157 ?auto_2478156 ) ( not ( = ?auto_2478156 ?auto_2478157 ) ) ( not ( = ?auto_2478156 ?auto_2478158 ) ) ( TRUCK-AT ?auto_2478163 ?auto_2478160 ) ( not ( = ?auto_2478160 ?auto_2478161 ) ) ( HOIST-AT ?auto_2478159 ?auto_2478160 ) ( LIFTING ?auto_2478159 ?auto_2478158 ) ( not ( = ?auto_2478162 ?auto_2478159 ) ) ( ON ?auto_2478145 ?auto_2478144 ) ( ON ?auto_2478146 ?auto_2478145 ) ( ON ?auto_2478143 ?auto_2478146 ) ( ON ?auto_2478147 ?auto_2478143 ) ( ON ?auto_2478149 ?auto_2478147 ) ( ON ?auto_2478148 ?auto_2478149 ) ( ON ?auto_2478150 ?auto_2478148 ) ( ON ?auto_2478151 ?auto_2478150 ) ( ON ?auto_2478152 ?auto_2478151 ) ( ON ?auto_2478153 ?auto_2478152 ) ( ON ?auto_2478154 ?auto_2478153 ) ( ON ?auto_2478155 ?auto_2478154 ) ( ON ?auto_2478156 ?auto_2478155 ) ( not ( = ?auto_2478144 ?auto_2478145 ) ) ( not ( = ?auto_2478144 ?auto_2478146 ) ) ( not ( = ?auto_2478144 ?auto_2478143 ) ) ( not ( = ?auto_2478144 ?auto_2478147 ) ) ( not ( = ?auto_2478144 ?auto_2478149 ) ) ( not ( = ?auto_2478144 ?auto_2478148 ) ) ( not ( = ?auto_2478144 ?auto_2478150 ) ) ( not ( = ?auto_2478144 ?auto_2478151 ) ) ( not ( = ?auto_2478144 ?auto_2478152 ) ) ( not ( = ?auto_2478144 ?auto_2478153 ) ) ( not ( = ?auto_2478144 ?auto_2478154 ) ) ( not ( = ?auto_2478144 ?auto_2478155 ) ) ( not ( = ?auto_2478144 ?auto_2478156 ) ) ( not ( = ?auto_2478144 ?auto_2478157 ) ) ( not ( = ?auto_2478144 ?auto_2478158 ) ) ( not ( = ?auto_2478145 ?auto_2478146 ) ) ( not ( = ?auto_2478145 ?auto_2478143 ) ) ( not ( = ?auto_2478145 ?auto_2478147 ) ) ( not ( = ?auto_2478145 ?auto_2478149 ) ) ( not ( = ?auto_2478145 ?auto_2478148 ) ) ( not ( = ?auto_2478145 ?auto_2478150 ) ) ( not ( = ?auto_2478145 ?auto_2478151 ) ) ( not ( = ?auto_2478145 ?auto_2478152 ) ) ( not ( = ?auto_2478145 ?auto_2478153 ) ) ( not ( = ?auto_2478145 ?auto_2478154 ) ) ( not ( = ?auto_2478145 ?auto_2478155 ) ) ( not ( = ?auto_2478145 ?auto_2478156 ) ) ( not ( = ?auto_2478145 ?auto_2478157 ) ) ( not ( = ?auto_2478145 ?auto_2478158 ) ) ( not ( = ?auto_2478146 ?auto_2478143 ) ) ( not ( = ?auto_2478146 ?auto_2478147 ) ) ( not ( = ?auto_2478146 ?auto_2478149 ) ) ( not ( = ?auto_2478146 ?auto_2478148 ) ) ( not ( = ?auto_2478146 ?auto_2478150 ) ) ( not ( = ?auto_2478146 ?auto_2478151 ) ) ( not ( = ?auto_2478146 ?auto_2478152 ) ) ( not ( = ?auto_2478146 ?auto_2478153 ) ) ( not ( = ?auto_2478146 ?auto_2478154 ) ) ( not ( = ?auto_2478146 ?auto_2478155 ) ) ( not ( = ?auto_2478146 ?auto_2478156 ) ) ( not ( = ?auto_2478146 ?auto_2478157 ) ) ( not ( = ?auto_2478146 ?auto_2478158 ) ) ( not ( = ?auto_2478143 ?auto_2478147 ) ) ( not ( = ?auto_2478143 ?auto_2478149 ) ) ( not ( = ?auto_2478143 ?auto_2478148 ) ) ( not ( = ?auto_2478143 ?auto_2478150 ) ) ( not ( = ?auto_2478143 ?auto_2478151 ) ) ( not ( = ?auto_2478143 ?auto_2478152 ) ) ( not ( = ?auto_2478143 ?auto_2478153 ) ) ( not ( = ?auto_2478143 ?auto_2478154 ) ) ( not ( = ?auto_2478143 ?auto_2478155 ) ) ( not ( = ?auto_2478143 ?auto_2478156 ) ) ( not ( = ?auto_2478143 ?auto_2478157 ) ) ( not ( = ?auto_2478143 ?auto_2478158 ) ) ( not ( = ?auto_2478147 ?auto_2478149 ) ) ( not ( = ?auto_2478147 ?auto_2478148 ) ) ( not ( = ?auto_2478147 ?auto_2478150 ) ) ( not ( = ?auto_2478147 ?auto_2478151 ) ) ( not ( = ?auto_2478147 ?auto_2478152 ) ) ( not ( = ?auto_2478147 ?auto_2478153 ) ) ( not ( = ?auto_2478147 ?auto_2478154 ) ) ( not ( = ?auto_2478147 ?auto_2478155 ) ) ( not ( = ?auto_2478147 ?auto_2478156 ) ) ( not ( = ?auto_2478147 ?auto_2478157 ) ) ( not ( = ?auto_2478147 ?auto_2478158 ) ) ( not ( = ?auto_2478149 ?auto_2478148 ) ) ( not ( = ?auto_2478149 ?auto_2478150 ) ) ( not ( = ?auto_2478149 ?auto_2478151 ) ) ( not ( = ?auto_2478149 ?auto_2478152 ) ) ( not ( = ?auto_2478149 ?auto_2478153 ) ) ( not ( = ?auto_2478149 ?auto_2478154 ) ) ( not ( = ?auto_2478149 ?auto_2478155 ) ) ( not ( = ?auto_2478149 ?auto_2478156 ) ) ( not ( = ?auto_2478149 ?auto_2478157 ) ) ( not ( = ?auto_2478149 ?auto_2478158 ) ) ( not ( = ?auto_2478148 ?auto_2478150 ) ) ( not ( = ?auto_2478148 ?auto_2478151 ) ) ( not ( = ?auto_2478148 ?auto_2478152 ) ) ( not ( = ?auto_2478148 ?auto_2478153 ) ) ( not ( = ?auto_2478148 ?auto_2478154 ) ) ( not ( = ?auto_2478148 ?auto_2478155 ) ) ( not ( = ?auto_2478148 ?auto_2478156 ) ) ( not ( = ?auto_2478148 ?auto_2478157 ) ) ( not ( = ?auto_2478148 ?auto_2478158 ) ) ( not ( = ?auto_2478150 ?auto_2478151 ) ) ( not ( = ?auto_2478150 ?auto_2478152 ) ) ( not ( = ?auto_2478150 ?auto_2478153 ) ) ( not ( = ?auto_2478150 ?auto_2478154 ) ) ( not ( = ?auto_2478150 ?auto_2478155 ) ) ( not ( = ?auto_2478150 ?auto_2478156 ) ) ( not ( = ?auto_2478150 ?auto_2478157 ) ) ( not ( = ?auto_2478150 ?auto_2478158 ) ) ( not ( = ?auto_2478151 ?auto_2478152 ) ) ( not ( = ?auto_2478151 ?auto_2478153 ) ) ( not ( = ?auto_2478151 ?auto_2478154 ) ) ( not ( = ?auto_2478151 ?auto_2478155 ) ) ( not ( = ?auto_2478151 ?auto_2478156 ) ) ( not ( = ?auto_2478151 ?auto_2478157 ) ) ( not ( = ?auto_2478151 ?auto_2478158 ) ) ( not ( = ?auto_2478152 ?auto_2478153 ) ) ( not ( = ?auto_2478152 ?auto_2478154 ) ) ( not ( = ?auto_2478152 ?auto_2478155 ) ) ( not ( = ?auto_2478152 ?auto_2478156 ) ) ( not ( = ?auto_2478152 ?auto_2478157 ) ) ( not ( = ?auto_2478152 ?auto_2478158 ) ) ( not ( = ?auto_2478153 ?auto_2478154 ) ) ( not ( = ?auto_2478153 ?auto_2478155 ) ) ( not ( = ?auto_2478153 ?auto_2478156 ) ) ( not ( = ?auto_2478153 ?auto_2478157 ) ) ( not ( = ?auto_2478153 ?auto_2478158 ) ) ( not ( = ?auto_2478154 ?auto_2478155 ) ) ( not ( = ?auto_2478154 ?auto_2478156 ) ) ( not ( = ?auto_2478154 ?auto_2478157 ) ) ( not ( = ?auto_2478154 ?auto_2478158 ) ) ( not ( = ?auto_2478155 ?auto_2478156 ) ) ( not ( = ?auto_2478155 ?auto_2478157 ) ) ( not ( = ?auto_2478155 ?auto_2478158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2478156 ?auto_2478157 ?auto_2478158 )
      ( MAKE-15CRATE-VERIFY ?auto_2478144 ?auto_2478145 ?auto_2478146 ?auto_2478143 ?auto_2478147 ?auto_2478149 ?auto_2478148 ?auto_2478150 ?auto_2478151 ?auto_2478152 ?auto_2478153 ?auto_2478154 ?auto_2478155 ?auto_2478156 ?auto_2478157 ?auto_2478158 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2478369 - SURFACE
      ?auto_2478370 - SURFACE
      ?auto_2478371 - SURFACE
      ?auto_2478368 - SURFACE
      ?auto_2478372 - SURFACE
      ?auto_2478374 - SURFACE
      ?auto_2478373 - SURFACE
      ?auto_2478375 - SURFACE
      ?auto_2478376 - SURFACE
      ?auto_2478377 - SURFACE
      ?auto_2478378 - SURFACE
      ?auto_2478379 - SURFACE
      ?auto_2478380 - SURFACE
      ?auto_2478381 - SURFACE
      ?auto_2478382 - SURFACE
      ?auto_2478383 - SURFACE
    )
    :vars
    (
      ?auto_2478389 - HOIST
      ?auto_2478384 - PLACE
      ?auto_2478385 - TRUCK
      ?auto_2478387 - PLACE
      ?auto_2478386 - HOIST
      ?auto_2478388 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2478389 ?auto_2478384 ) ( SURFACE-AT ?auto_2478382 ?auto_2478384 ) ( CLEAR ?auto_2478382 ) ( IS-CRATE ?auto_2478383 ) ( not ( = ?auto_2478382 ?auto_2478383 ) ) ( AVAILABLE ?auto_2478389 ) ( ON ?auto_2478382 ?auto_2478381 ) ( not ( = ?auto_2478381 ?auto_2478382 ) ) ( not ( = ?auto_2478381 ?auto_2478383 ) ) ( TRUCK-AT ?auto_2478385 ?auto_2478387 ) ( not ( = ?auto_2478387 ?auto_2478384 ) ) ( HOIST-AT ?auto_2478386 ?auto_2478387 ) ( not ( = ?auto_2478389 ?auto_2478386 ) ) ( AVAILABLE ?auto_2478386 ) ( SURFACE-AT ?auto_2478383 ?auto_2478387 ) ( ON ?auto_2478383 ?auto_2478388 ) ( CLEAR ?auto_2478383 ) ( not ( = ?auto_2478382 ?auto_2478388 ) ) ( not ( = ?auto_2478383 ?auto_2478388 ) ) ( not ( = ?auto_2478381 ?auto_2478388 ) ) ( ON ?auto_2478370 ?auto_2478369 ) ( ON ?auto_2478371 ?auto_2478370 ) ( ON ?auto_2478368 ?auto_2478371 ) ( ON ?auto_2478372 ?auto_2478368 ) ( ON ?auto_2478374 ?auto_2478372 ) ( ON ?auto_2478373 ?auto_2478374 ) ( ON ?auto_2478375 ?auto_2478373 ) ( ON ?auto_2478376 ?auto_2478375 ) ( ON ?auto_2478377 ?auto_2478376 ) ( ON ?auto_2478378 ?auto_2478377 ) ( ON ?auto_2478379 ?auto_2478378 ) ( ON ?auto_2478380 ?auto_2478379 ) ( ON ?auto_2478381 ?auto_2478380 ) ( not ( = ?auto_2478369 ?auto_2478370 ) ) ( not ( = ?auto_2478369 ?auto_2478371 ) ) ( not ( = ?auto_2478369 ?auto_2478368 ) ) ( not ( = ?auto_2478369 ?auto_2478372 ) ) ( not ( = ?auto_2478369 ?auto_2478374 ) ) ( not ( = ?auto_2478369 ?auto_2478373 ) ) ( not ( = ?auto_2478369 ?auto_2478375 ) ) ( not ( = ?auto_2478369 ?auto_2478376 ) ) ( not ( = ?auto_2478369 ?auto_2478377 ) ) ( not ( = ?auto_2478369 ?auto_2478378 ) ) ( not ( = ?auto_2478369 ?auto_2478379 ) ) ( not ( = ?auto_2478369 ?auto_2478380 ) ) ( not ( = ?auto_2478369 ?auto_2478381 ) ) ( not ( = ?auto_2478369 ?auto_2478382 ) ) ( not ( = ?auto_2478369 ?auto_2478383 ) ) ( not ( = ?auto_2478369 ?auto_2478388 ) ) ( not ( = ?auto_2478370 ?auto_2478371 ) ) ( not ( = ?auto_2478370 ?auto_2478368 ) ) ( not ( = ?auto_2478370 ?auto_2478372 ) ) ( not ( = ?auto_2478370 ?auto_2478374 ) ) ( not ( = ?auto_2478370 ?auto_2478373 ) ) ( not ( = ?auto_2478370 ?auto_2478375 ) ) ( not ( = ?auto_2478370 ?auto_2478376 ) ) ( not ( = ?auto_2478370 ?auto_2478377 ) ) ( not ( = ?auto_2478370 ?auto_2478378 ) ) ( not ( = ?auto_2478370 ?auto_2478379 ) ) ( not ( = ?auto_2478370 ?auto_2478380 ) ) ( not ( = ?auto_2478370 ?auto_2478381 ) ) ( not ( = ?auto_2478370 ?auto_2478382 ) ) ( not ( = ?auto_2478370 ?auto_2478383 ) ) ( not ( = ?auto_2478370 ?auto_2478388 ) ) ( not ( = ?auto_2478371 ?auto_2478368 ) ) ( not ( = ?auto_2478371 ?auto_2478372 ) ) ( not ( = ?auto_2478371 ?auto_2478374 ) ) ( not ( = ?auto_2478371 ?auto_2478373 ) ) ( not ( = ?auto_2478371 ?auto_2478375 ) ) ( not ( = ?auto_2478371 ?auto_2478376 ) ) ( not ( = ?auto_2478371 ?auto_2478377 ) ) ( not ( = ?auto_2478371 ?auto_2478378 ) ) ( not ( = ?auto_2478371 ?auto_2478379 ) ) ( not ( = ?auto_2478371 ?auto_2478380 ) ) ( not ( = ?auto_2478371 ?auto_2478381 ) ) ( not ( = ?auto_2478371 ?auto_2478382 ) ) ( not ( = ?auto_2478371 ?auto_2478383 ) ) ( not ( = ?auto_2478371 ?auto_2478388 ) ) ( not ( = ?auto_2478368 ?auto_2478372 ) ) ( not ( = ?auto_2478368 ?auto_2478374 ) ) ( not ( = ?auto_2478368 ?auto_2478373 ) ) ( not ( = ?auto_2478368 ?auto_2478375 ) ) ( not ( = ?auto_2478368 ?auto_2478376 ) ) ( not ( = ?auto_2478368 ?auto_2478377 ) ) ( not ( = ?auto_2478368 ?auto_2478378 ) ) ( not ( = ?auto_2478368 ?auto_2478379 ) ) ( not ( = ?auto_2478368 ?auto_2478380 ) ) ( not ( = ?auto_2478368 ?auto_2478381 ) ) ( not ( = ?auto_2478368 ?auto_2478382 ) ) ( not ( = ?auto_2478368 ?auto_2478383 ) ) ( not ( = ?auto_2478368 ?auto_2478388 ) ) ( not ( = ?auto_2478372 ?auto_2478374 ) ) ( not ( = ?auto_2478372 ?auto_2478373 ) ) ( not ( = ?auto_2478372 ?auto_2478375 ) ) ( not ( = ?auto_2478372 ?auto_2478376 ) ) ( not ( = ?auto_2478372 ?auto_2478377 ) ) ( not ( = ?auto_2478372 ?auto_2478378 ) ) ( not ( = ?auto_2478372 ?auto_2478379 ) ) ( not ( = ?auto_2478372 ?auto_2478380 ) ) ( not ( = ?auto_2478372 ?auto_2478381 ) ) ( not ( = ?auto_2478372 ?auto_2478382 ) ) ( not ( = ?auto_2478372 ?auto_2478383 ) ) ( not ( = ?auto_2478372 ?auto_2478388 ) ) ( not ( = ?auto_2478374 ?auto_2478373 ) ) ( not ( = ?auto_2478374 ?auto_2478375 ) ) ( not ( = ?auto_2478374 ?auto_2478376 ) ) ( not ( = ?auto_2478374 ?auto_2478377 ) ) ( not ( = ?auto_2478374 ?auto_2478378 ) ) ( not ( = ?auto_2478374 ?auto_2478379 ) ) ( not ( = ?auto_2478374 ?auto_2478380 ) ) ( not ( = ?auto_2478374 ?auto_2478381 ) ) ( not ( = ?auto_2478374 ?auto_2478382 ) ) ( not ( = ?auto_2478374 ?auto_2478383 ) ) ( not ( = ?auto_2478374 ?auto_2478388 ) ) ( not ( = ?auto_2478373 ?auto_2478375 ) ) ( not ( = ?auto_2478373 ?auto_2478376 ) ) ( not ( = ?auto_2478373 ?auto_2478377 ) ) ( not ( = ?auto_2478373 ?auto_2478378 ) ) ( not ( = ?auto_2478373 ?auto_2478379 ) ) ( not ( = ?auto_2478373 ?auto_2478380 ) ) ( not ( = ?auto_2478373 ?auto_2478381 ) ) ( not ( = ?auto_2478373 ?auto_2478382 ) ) ( not ( = ?auto_2478373 ?auto_2478383 ) ) ( not ( = ?auto_2478373 ?auto_2478388 ) ) ( not ( = ?auto_2478375 ?auto_2478376 ) ) ( not ( = ?auto_2478375 ?auto_2478377 ) ) ( not ( = ?auto_2478375 ?auto_2478378 ) ) ( not ( = ?auto_2478375 ?auto_2478379 ) ) ( not ( = ?auto_2478375 ?auto_2478380 ) ) ( not ( = ?auto_2478375 ?auto_2478381 ) ) ( not ( = ?auto_2478375 ?auto_2478382 ) ) ( not ( = ?auto_2478375 ?auto_2478383 ) ) ( not ( = ?auto_2478375 ?auto_2478388 ) ) ( not ( = ?auto_2478376 ?auto_2478377 ) ) ( not ( = ?auto_2478376 ?auto_2478378 ) ) ( not ( = ?auto_2478376 ?auto_2478379 ) ) ( not ( = ?auto_2478376 ?auto_2478380 ) ) ( not ( = ?auto_2478376 ?auto_2478381 ) ) ( not ( = ?auto_2478376 ?auto_2478382 ) ) ( not ( = ?auto_2478376 ?auto_2478383 ) ) ( not ( = ?auto_2478376 ?auto_2478388 ) ) ( not ( = ?auto_2478377 ?auto_2478378 ) ) ( not ( = ?auto_2478377 ?auto_2478379 ) ) ( not ( = ?auto_2478377 ?auto_2478380 ) ) ( not ( = ?auto_2478377 ?auto_2478381 ) ) ( not ( = ?auto_2478377 ?auto_2478382 ) ) ( not ( = ?auto_2478377 ?auto_2478383 ) ) ( not ( = ?auto_2478377 ?auto_2478388 ) ) ( not ( = ?auto_2478378 ?auto_2478379 ) ) ( not ( = ?auto_2478378 ?auto_2478380 ) ) ( not ( = ?auto_2478378 ?auto_2478381 ) ) ( not ( = ?auto_2478378 ?auto_2478382 ) ) ( not ( = ?auto_2478378 ?auto_2478383 ) ) ( not ( = ?auto_2478378 ?auto_2478388 ) ) ( not ( = ?auto_2478379 ?auto_2478380 ) ) ( not ( = ?auto_2478379 ?auto_2478381 ) ) ( not ( = ?auto_2478379 ?auto_2478382 ) ) ( not ( = ?auto_2478379 ?auto_2478383 ) ) ( not ( = ?auto_2478379 ?auto_2478388 ) ) ( not ( = ?auto_2478380 ?auto_2478381 ) ) ( not ( = ?auto_2478380 ?auto_2478382 ) ) ( not ( = ?auto_2478380 ?auto_2478383 ) ) ( not ( = ?auto_2478380 ?auto_2478388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2478381 ?auto_2478382 ?auto_2478383 )
      ( MAKE-15CRATE-VERIFY ?auto_2478369 ?auto_2478370 ?auto_2478371 ?auto_2478368 ?auto_2478372 ?auto_2478374 ?auto_2478373 ?auto_2478375 ?auto_2478376 ?auto_2478377 ?auto_2478378 ?auto_2478379 ?auto_2478380 ?auto_2478381 ?auto_2478382 ?auto_2478383 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2478595 - SURFACE
      ?auto_2478596 - SURFACE
      ?auto_2478597 - SURFACE
      ?auto_2478594 - SURFACE
      ?auto_2478598 - SURFACE
      ?auto_2478600 - SURFACE
      ?auto_2478599 - SURFACE
      ?auto_2478601 - SURFACE
      ?auto_2478602 - SURFACE
      ?auto_2478603 - SURFACE
      ?auto_2478604 - SURFACE
      ?auto_2478605 - SURFACE
      ?auto_2478606 - SURFACE
      ?auto_2478607 - SURFACE
      ?auto_2478608 - SURFACE
      ?auto_2478609 - SURFACE
    )
    :vars
    (
      ?auto_2478612 - HOIST
      ?auto_2478610 - PLACE
      ?auto_2478613 - PLACE
      ?auto_2478611 - HOIST
      ?auto_2478615 - SURFACE
      ?auto_2478614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2478612 ?auto_2478610 ) ( SURFACE-AT ?auto_2478608 ?auto_2478610 ) ( CLEAR ?auto_2478608 ) ( IS-CRATE ?auto_2478609 ) ( not ( = ?auto_2478608 ?auto_2478609 ) ) ( AVAILABLE ?auto_2478612 ) ( ON ?auto_2478608 ?auto_2478607 ) ( not ( = ?auto_2478607 ?auto_2478608 ) ) ( not ( = ?auto_2478607 ?auto_2478609 ) ) ( not ( = ?auto_2478613 ?auto_2478610 ) ) ( HOIST-AT ?auto_2478611 ?auto_2478613 ) ( not ( = ?auto_2478612 ?auto_2478611 ) ) ( AVAILABLE ?auto_2478611 ) ( SURFACE-AT ?auto_2478609 ?auto_2478613 ) ( ON ?auto_2478609 ?auto_2478615 ) ( CLEAR ?auto_2478609 ) ( not ( = ?auto_2478608 ?auto_2478615 ) ) ( not ( = ?auto_2478609 ?auto_2478615 ) ) ( not ( = ?auto_2478607 ?auto_2478615 ) ) ( TRUCK-AT ?auto_2478614 ?auto_2478610 ) ( ON ?auto_2478596 ?auto_2478595 ) ( ON ?auto_2478597 ?auto_2478596 ) ( ON ?auto_2478594 ?auto_2478597 ) ( ON ?auto_2478598 ?auto_2478594 ) ( ON ?auto_2478600 ?auto_2478598 ) ( ON ?auto_2478599 ?auto_2478600 ) ( ON ?auto_2478601 ?auto_2478599 ) ( ON ?auto_2478602 ?auto_2478601 ) ( ON ?auto_2478603 ?auto_2478602 ) ( ON ?auto_2478604 ?auto_2478603 ) ( ON ?auto_2478605 ?auto_2478604 ) ( ON ?auto_2478606 ?auto_2478605 ) ( ON ?auto_2478607 ?auto_2478606 ) ( not ( = ?auto_2478595 ?auto_2478596 ) ) ( not ( = ?auto_2478595 ?auto_2478597 ) ) ( not ( = ?auto_2478595 ?auto_2478594 ) ) ( not ( = ?auto_2478595 ?auto_2478598 ) ) ( not ( = ?auto_2478595 ?auto_2478600 ) ) ( not ( = ?auto_2478595 ?auto_2478599 ) ) ( not ( = ?auto_2478595 ?auto_2478601 ) ) ( not ( = ?auto_2478595 ?auto_2478602 ) ) ( not ( = ?auto_2478595 ?auto_2478603 ) ) ( not ( = ?auto_2478595 ?auto_2478604 ) ) ( not ( = ?auto_2478595 ?auto_2478605 ) ) ( not ( = ?auto_2478595 ?auto_2478606 ) ) ( not ( = ?auto_2478595 ?auto_2478607 ) ) ( not ( = ?auto_2478595 ?auto_2478608 ) ) ( not ( = ?auto_2478595 ?auto_2478609 ) ) ( not ( = ?auto_2478595 ?auto_2478615 ) ) ( not ( = ?auto_2478596 ?auto_2478597 ) ) ( not ( = ?auto_2478596 ?auto_2478594 ) ) ( not ( = ?auto_2478596 ?auto_2478598 ) ) ( not ( = ?auto_2478596 ?auto_2478600 ) ) ( not ( = ?auto_2478596 ?auto_2478599 ) ) ( not ( = ?auto_2478596 ?auto_2478601 ) ) ( not ( = ?auto_2478596 ?auto_2478602 ) ) ( not ( = ?auto_2478596 ?auto_2478603 ) ) ( not ( = ?auto_2478596 ?auto_2478604 ) ) ( not ( = ?auto_2478596 ?auto_2478605 ) ) ( not ( = ?auto_2478596 ?auto_2478606 ) ) ( not ( = ?auto_2478596 ?auto_2478607 ) ) ( not ( = ?auto_2478596 ?auto_2478608 ) ) ( not ( = ?auto_2478596 ?auto_2478609 ) ) ( not ( = ?auto_2478596 ?auto_2478615 ) ) ( not ( = ?auto_2478597 ?auto_2478594 ) ) ( not ( = ?auto_2478597 ?auto_2478598 ) ) ( not ( = ?auto_2478597 ?auto_2478600 ) ) ( not ( = ?auto_2478597 ?auto_2478599 ) ) ( not ( = ?auto_2478597 ?auto_2478601 ) ) ( not ( = ?auto_2478597 ?auto_2478602 ) ) ( not ( = ?auto_2478597 ?auto_2478603 ) ) ( not ( = ?auto_2478597 ?auto_2478604 ) ) ( not ( = ?auto_2478597 ?auto_2478605 ) ) ( not ( = ?auto_2478597 ?auto_2478606 ) ) ( not ( = ?auto_2478597 ?auto_2478607 ) ) ( not ( = ?auto_2478597 ?auto_2478608 ) ) ( not ( = ?auto_2478597 ?auto_2478609 ) ) ( not ( = ?auto_2478597 ?auto_2478615 ) ) ( not ( = ?auto_2478594 ?auto_2478598 ) ) ( not ( = ?auto_2478594 ?auto_2478600 ) ) ( not ( = ?auto_2478594 ?auto_2478599 ) ) ( not ( = ?auto_2478594 ?auto_2478601 ) ) ( not ( = ?auto_2478594 ?auto_2478602 ) ) ( not ( = ?auto_2478594 ?auto_2478603 ) ) ( not ( = ?auto_2478594 ?auto_2478604 ) ) ( not ( = ?auto_2478594 ?auto_2478605 ) ) ( not ( = ?auto_2478594 ?auto_2478606 ) ) ( not ( = ?auto_2478594 ?auto_2478607 ) ) ( not ( = ?auto_2478594 ?auto_2478608 ) ) ( not ( = ?auto_2478594 ?auto_2478609 ) ) ( not ( = ?auto_2478594 ?auto_2478615 ) ) ( not ( = ?auto_2478598 ?auto_2478600 ) ) ( not ( = ?auto_2478598 ?auto_2478599 ) ) ( not ( = ?auto_2478598 ?auto_2478601 ) ) ( not ( = ?auto_2478598 ?auto_2478602 ) ) ( not ( = ?auto_2478598 ?auto_2478603 ) ) ( not ( = ?auto_2478598 ?auto_2478604 ) ) ( not ( = ?auto_2478598 ?auto_2478605 ) ) ( not ( = ?auto_2478598 ?auto_2478606 ) ) ( not ( = ?auto_2478598 ?auto_2478607 ) ) ( not ( = ?auto_2478598 ?auto_2478608 ) ) ( not ( = ?auto_2478598 ?auto_2478609 ) ) ( not ( = ?auto_2478598 ?auto_2478615 ) ) ( not ( = ?auto_2478600 ?auto_2478599 ) ) ( not ( = ?auto_2478600 ?auto_2478601 ) ) ( not ( = ?auto_2478600 ?auto_2478602 ) ) ( not ( = ?auto_2478600 ?auto_2478603 ) ) ( not ( = ?auto_2478600 ?auto_2478604 ) ) ( not ( = ?auto_2478600 ?auto_2478605 ) ) ( not ( = ?auto_2478600 ?auto_2478606 ) ) ( not ( = ?auto_2478600 ?auto_2478607 ) ) ( not ( = ?auto_2478600 ?auto_2478608 ) ) ( not ( = ?auto_2478600 ?auto_2478609 ) ) ( not ( = ?auto_2478600 ?auto_2478615 ) ) ( not ( = ?auto_2478599 ?auto_2478601 ) ) ( not ( = ?auto_2478599 ?auto_2478602 ) ) ( not ( = ?auto_2478599 ?auto_2478603 ) ) ( not ( = ?auto_2478599 ?auto_2478604 ) ) ( not ( = ?auto_2478599 ?auto_2478605 ) ) ( not ( = ?auto_2478599 ?auto_2478606 ) ) ( not ( = ?auto_2478599 ?auto_2478607 ) ) ( not ( = ?auto_2478599 ?auto_2478608 ) ) ( not ( = ?auto_2478599 ?auto_2478609 ) ) ( not ( = ?auto_2478599 ?auto_2478615 ) ) ( not ( = ?auto_2478601 ?auto_2478602 ) ) ( not ( = ?auto_2478601 ?auto_2478603 ) ) ( not ( = ?auto_2478601 ?auto_2478604 ) ) ( not ( = ?auto_2478601 ?auto_2478605 ) ) ( not ( = ?auto_2478601 ?auto_2478606 ) ) ( not ( = ?auto_2478601 ?auto_2478607 ) ) ( not ( = ?auto_2478601 ?auto_2478608 ) ) ( not ( = ?auto_2478601 ?auto_2478609 ) ) ( not ( = ?auto_2478601 ?auto_2478615 ) ) ( not ( = ?auto_2478602 ?auto_2478603 ) ) ( not ( = ?auto_2478602 ?auto_2478604 ) ) ( not ( = ?auto_2478602 ?auto_2478605 ) ) ( not ( = ?auto_2478602 ?auto_2478606 ) ) ( not ( = ?auto_2478602 ?auto_2478607 ) ) ( not ( = ?auto_2478602 ?auto_2478608 ) ) ( not ( = ?auto_2478602 ?auto_2478609 ) ) ( not ( = ?auto_2478602 ?auto_2478615 ) ) ( not ( = ?auto_2478603 ?auto_2478604 ) ) ( not ( = ?auto_2478603 ?auto_2478605 ) ) ( not ( = ?auto_2478603 ?auto_2478606 ) ) ( not ( = ?auto_2478603 ?auto_2478607 ) ) ( not ( = ?auto_2478603 ?auto_2478608 ) ) ( not ( = ?auto_2478603 ?auto_2478609 ) ) ( not ( = ?auto_2478603 ?auto_2478615 ) ) ( not ( = ?auto_2478604 ?auto_2478605 ) ) ( not ( = ?auto_2478604 ?auto_2478606 ) ) ( not ( = ?auto_2478604 ?auto_2478607 ) ) ( not ( = ?auto_2478604 ?auto_2478608 ) ) ( not ( = ?auto_2478604 ?auto_2478609 ) ) ( not ( = ?auto_2478604 ?auto_2478615 ) ) ( not ( = ?auto_2478605 ?auto_2478606 ) ) ( not ( = ?auto_2478605 ?auto_2478607 ) ) ( not ( = ?auto_2478605 ?auto_2478608 ) ) ( not ( = ?auto_2478605 ?auto_2478609 ) ) ( not ( = ?auto_2478605 ?auto_2478615 ) ) ( not ( = ?auto_2478606 ?auto_2478607 ) ) ( not ( = ?auto_2478606 ?auto_2478608 ) ) ( not ( = ?auto_2478606 ?auto_2478609 ) ) ( not ( = ?auto_2478606 ?auto_2478615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2478607 ?auto_2478608 ?auto_2478609 )
      ( MAKE-15CRATE-VERIFY ?auto_2478595 ?auto_2478596 ?auto_2478597 ?auto_2478594 ?auto_2478598 ?auto_2478600 ?auto_2478599 ?auto_2478601 ?auto_2478602 ?auto_2478603 ?auto_2478604 ?auto_2478605 ?auto_2478606 ?auto_2478607 ?auto_2478608 ?auto_2478609 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2478821 - SURFACE
      ?auto_2478822 - SURFACE
      ?auto_2478823 - SURFACE
      ?auto_2478820 - SURFACE
      ?auto_2478824 - SURFACE
      ?auto_2478826 - SURFACE
      ?auto_2478825 - SURFACE
      ?auto_2478827 - SURFACE
      ?auto_2478828 - SURFACE
      ?auto_2478829 - SURFACE
      ?auto_2478830 - SURFACE
      ?auto_2478831 - SURFACE
      ?auto_2478832 - SURFACE
      ?auto_2478833 - SURFACE
      ?auto_2478834 - SURFACE
      ?auto_2478835 - SURFACE
    )
    :vars
    (
      ?auto_2478837 - HOIST
      ?auto_2478836 - PLACE
      ?auto_2478839 - PLACE
      ?auto_2478841 - HOIST
      ?auto_2478838 - SURFACE
      ?auto_2478840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2478837 ?auto_2478836 ) ( IS-CRATE ?auto_2478835 ) ( not ( = ?auto_2478834 ?auto_2478835 ) ) ( not ( = ?auto_2478833 ?auto_2478834 ) ) ( not ( = ?auto_2478833 ?auto_2478835 ) ) ( not ( = ?auto_2478839 ?auto_2478836 ) ) ( HOIST-AT ?auto_2478841 ?auto_2478839 ) ( not ( = ?auto_2478837 ?auto_2478841 ) ) ( AVAILABLE ?auto_2478841 ) ( SURFACE-AT ?auto_2478835 ?auto_2478839 ) ( ON ?auto_2478835 ?auto_2478838 ) ( CLEAR ?auto_2478835 ) ( not ( = ?auto_2478834 ?auto_2478838 ) ) ( not ( = ?auto_2478835 ?auto_2478838 ) ) ( not ( = ?auto_2478833 ?auto_2478838 ) ) ( TRUCK-AT ?auto_2478840 ?auto_2478836 ) ( SURFACE-AT ?auto_2478833 ?auto_2478836 ) ( CLEAR ?auto_2478833 ) ( LIFTING ?auto_2478837 ?auto_2478834 ) ( IS-CRATE ?auto_2478834 ) ( ON ?auto_2478822 ?auto_2478821 ) ( ON ?auto_2478823 ?auto_2478822 ) ( ON ?auto_2478820 ?auto_2478823 ) ( ON ?auto_2478824 ?auto_2478820 ) ( ON ?auto_2478826 ?auto_2478824 ) ( ON ?auto_2478825 ?auto_2478826 ) ( ON ?auto_2478827 ?auto_2478825 ) ( ON ?auto_2478828 ?auto_2478827 ) ( ON ?auto_2478829 ?auto_2478828 ) ( ON ?auto_2478830 ?auto_2478829 ) ( ON ?auto_2478831 ?auto_2478830 ) ( ON ?auto_2478832 ?auto_2478831 ) ( ON ?auto_2478833 ?auto_2478832 ) ( not ( = ?auto_2478821 ?auto_2478822 ) ) ( not ( = ?auto_2478821 ?auto_2478823 ) ) ( not ( = ?auto_2478821 ?auto_2478820 ) ) ( not ( = ?auto_2478821 ?auto_2478824 ) ) ( not ( = ?auto_2478821 ?auto_2478826 ) ) ( not ( = ?auto_2478821 ?auto_2478825 ) ) ( not ( = ?auto_2478821 ?auto_2478827 ) ) ( not ( = ?auto_2478821 ?auto_2478828 ) ) ( not ( = ?auto_2478821 ?auto_2478829 ) ) ( not ( = ?auto_2478821 ?auto_2478830 ) ) ( not ( = ?auto_2478821 ?auto_2478831 ) ) ( not ( = ?auto_2478821 ?auto_2478832 ) ) ( not ( = ?auto_2478821 ?auto_2478833 ) ) ( not ( = ?auto_2478821 ?auto_2478834 ) ) ( not ( = ?auto_2478821 ?auto_2478835 ) ) ( not ( = ?auto_2478821 ?auto_2478838 ) ) ( not ( = ?auto_2478822 ?auto_2478823 ) ) ( not ( = ?auto_2478822 ?auto_2478820 ) ) ( not ( = ?auto_2478822 ?auto_2478824 ) ) ( not ( = ?auto_2478822 ?auto_2478826 ) ) ( not ( = ?auto_2478822 ?auto_2478825 ) ) ( not ( = ?auto_2478822 ?auto_2478827 ) ) ( not ( = ?auto_2478822 ?auto_2478828 ) ) ( not ( = ?auto_2478822 ?auto_2478829 ) ) ( not ( = ?auto_2478822 ?auto_2478830 ) ) ( not ( = ?auto_2478822 ?auto_2478831 ) ) ( not ( = ?auto_2478822 ?auto_2478832 ) ) ( not ( = ?auto_2478822 ?auto_2478833 ) ) ( not ( = ?auto_2478822 ?auto_2478834 ) ) ( not ( = ?auto_2478822 ?auto_2478835 ) ) ( not ( = ?auto_2478822 ?auto_2478838 ) ) ( not ( = ?auto_2478823 ?auto_2478820 ) ) ( not ( = ?auto_2478823 ?auto_2478824 ) ) ( not ( = ?auto_2478823 ?auto_2478826 ) ) ( not ( = ?auto_2478823 ?auto_2478825 ) ) ( not ( = ?auto_2478823 ?auto_2478827 ) ) ( not ( = ?auto_2478823 ?auto_2478828 ) ) ( not ( = ?auto_2478823 ?auto_2478829 ) ) ( not ( = ?auto_2478823 ?auto_2478830 ) ) ( not ( = ?auto_2478823 ?auto_2478831 ) ) ( not ( = ?auto_2478823 ?auto_2478832 ) ) ( not ( = ?auto_2478823 ?auto_2478833 ) ) ( not ( = ?auto_2478823 ?auto_2478834 ) ) ( not ( = ?auto_2478823 ?auto_2478835 ) ) ( not ( = ?auto_2478823 ?auto_2478838 ) ) ( not ( = ?auto_2478820 ?auto_2478824 ) ) ( not ( = ?auto_2478820 ?auto_2478826 ) ) ( not ( = ?auto_2478820 ?auto_2478825 ) ) ( not ( = ?auto_2478820 ?auto_2478827 ) ) ( not ( = ?auto_2478820 ?auto_2478828 ) ) ( not ( = ?auto_2478820 ?auto_2478829 ) ) ( not ( = ?auto_2478820 ?auto_2478830 ) ) ( not ( = ?auto_2478820 ?auto_2478831 ) ) ( not ( = ?auto_2478820 ?auto_2478832 ) ) ( not ( = ?auto_2478820 ?auto_2478833 ) ) ( not ( = ?auto_2478820 ?auto_2478834 ) ) ( not ( = ?auto_2478820 ?auto_2478835 ) ) ( not ( = ?auto_2478820 ?auto_2478838 ) ) ( not ( = ?auto_2478824 ?auto_2478826 ) ) ( not ( = ?auto_2478824 ?auto_2478825 ) ) ( not ( = ?auto_2478824 ?auto_2478827 ) ) ( not ( = ?auto_2478824 ?auto_2478828 ) ) ( not ( = ?auto_2478824 ?auto_2478829 ) ) ( not ( = ?auto_2478824 ?auto_2478830 ) ) ( not ( = ?auto_2478824 ?auto_2478831 ) ) ( not ( = ?auto_2478824 ?auto_2478832 ) ) ( not ( = ?auto_2478824 ?auto_2478833 ) ) ( not ( = ?auto_2478824 ?auto_2478834 ) ) ( not ( = ?auto_2478824 ?auto_2478835 ) ) ( not ( = ?auto_2478824 ?auto_2478838 ) ) ( not ( = ?auto_2478826 ?auto_2478825 ) ) ( not ( = ?auto_2478826 ?auto_2478827 ) ) ( not ( = ?auto_2478826 ?auto_2478828 ) ) ( not ( = ?auto_2478826 ?auto_2478829 ) ) ( not ( = ?auto_2478826 ?auto_2478830 ) ) ( not ( = ?auto_2478826 ?auto_2478831 ) ) ( not ( = ?auto_2478826 ?auto_2478832 ) ) ( not ( = ?auto_2478826 ?auto_2478833 ) ) ( not ( = ?auto_2478826 ?auto_2478834 ) ) ( not ( = ?auto_2478826 ?auto_2478835 ) ) ( not ( = ?auto_2478826 ?auto_2478838 ) ) ( not ( = ?auto_2478825 ?auto_2478827 ) ) ( not ( = ?auto_2478825 ?auto_2478828 ) ) ( not ( = ?auto_2478825 ?auto_2478829 ) ) ( not ( = ?auto_2478825 ?auto_2478830 ) ) ( not ( = ?auto_2478825 ?auto_2478831 ) ) ( not ( = ?auto_2478825 ?auto_2478832 ) ) ( not ( = ?auto_2478825 ?auto_2478833 ) ) ( not ( = ?auto_2478825 ?auto_2478834 ) ) ( not ( = ?auto_2478825 ?auto_2478835 ) ) ( not ( = ?auto_2478825 ?auto_2478838 ) ) ( not ( = ?auto_2478827 ?auto_2478828 ) ) ( not ( = ?auto_2478827 ?auto_2478829 ) ) ( not ( = ?auto_2478827 ?auto_2478830 ) ) ( not ( = ?auto_2478827 ?auto_2478831 ) ) ( not ( = ?auto_2478827 ?auto_2478832 ) ) ( not ( = ?auto_2478827 ?auto_2478833 ) ) ( not ( = ?auto_2478827 ?auto_2478834 ) ) ( not ( = ?auto_2478827 ?auto_2478835 ) ) ( not ( = ?auto_2478827 ?auto_2478838 ) ) ( not ( = ?auto_2478828 ?auto_2478829 ) ) ( not ( = ?auto_2478828 ?auto_2478830 ) ) ( not ( = ?auto_2478828 ?auto_2478831 ) ) ( not ( = ?auto_2478828 ?auto_2478832 ) ) ( not ( = ?auto_2478828 ?auto_2478833 ) ) ( not ( = ?auto_2478828 ?auto_2478834 ) ) ( not ( = ?auto_2478828 ?auto_2478835 ) ) ( not ( = ?auto_2478828 ?auto_2478838 ) ) ( not ( = ?auto_2478829 ?auto_2478830 ) ) ( not ( = ?auto_2478829 ?auto_2478831 ) ) ( not ( = ?auto_2478829 ?auto_2478832 ) ) ( not ( = ?auto_2478829 ?auto_2478833 ) ) ( not ( = ?auto_2478829 ?auto_2478834 ) ) ( not ( = ?auto_2478829 ?auto_2478835 ) ) ( not ( = ?auto_2478829 ?auto_2478838 ) ) ( not ( = ?auto_2478830 ?auto_2478831 ) ) ( not ( = ?auto_2478830 ?auto_2478832 ) ) ( not ( = ?auto_2478830 ?auto_2478833 ) ) ( not ( = ?auto_2478830 ?auto_2478834 ) ) ( not ( = ?auto_2478830 ?auto_2478835 ) ) ( not ( = ?auto_2478830 ?auto_2478838 ) ) ( not ( = ?auto_2478831 ?auto_2478832 ) ) ( not ( = ?auto_2478831 ?auto_2478833 ) ) ( not ( = ?auto_2478831 ?auto_2478834 ) ) ( not ( = ?auto_2478831 ?auto_2478835 ) ) ( not ( = ?auto_2478831 ?auto_2478838 ) ) ( not ( = ?auto_2478832 ?auto_2478833 ) ) ( not ( = ?auto_2478832 ?auto_2478834 ) ) ( not ( = ?auto_2478832 ?auto_2478835 ) ) ( not ( = ?auto_2478832 ?auto_2478838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2478833 ?auto_2478834 ?auto_2478835 )
      ( MAKE-15CRATE-VERIFY ?auto_2478821 ?auto_2478822 ?auto_2478823 ?auto_2478820 ?auto_2478824 ?auto_2478826 ?auto_2478825 ?auto_2478827 ?auto_2478828 ?auto_2478829 ?auto_2478830 ?auto_2478831 ?auto_2478832 ?auto_2478833 ?auto_2478834 ?auto_2478835 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2479047 - SURFACE
      ?auto_2479048 - SURFACE
      ?auto_2479049 - SURFACE
      ?auto_2479046 - SURFACE
      ?auto_2479050 - SURFACE
      ?auto_2479052 - SURFACE
      ?auto_2479051 - SURFACE
      ?auto_2479053 - SURFACE
      ?auto_2479054 - SURFACE
      ?auto_2479055 - SURFACE
      ?auto_2479056 - SURFACE
      ?auto_2479057 - SURFACE
      ?auto_2479058 - SURFACE
      ?auto_2479059 - SURFACE
      ?auto_2479060 - SURFACE
      ?auto_2479061 - SURFACE
    )
    :vars
    (
      ?auto_2479062 - HOIST
      ?auto_2479064 - PLACE
      ?auto_2479066 - PLACE
      ?auto_2479063 - HOIST
      ?auto_2479067 - SURFACE
      ?auto_2479065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2479062 ?auto_2479064 ) ( IS-CRATE ?auto_2479061 ) ( not ( = ?auto_2479060 ?auto_2479061 ) ) ( not ( = ?auto_2479059 ?auto_2479060 ) ) ( not ( = ?auto_2479059 ?auto_2479061 ) ) ( not ( = ?auto_2479066 ?auto_2479064 ) ) ( HOIST-AT ?auto_2479063 ?auto_2479066 ) ( not ( = ?auto_2479062 ?auto_2479063 ) ) ( AVAILABLE ?auto_2479063 ) ( SURFACE-AT ?auto_2479061 ?auto_2479066 ) ( ON ?auto_2479061 ?auto_2479067 ) ( CLEAR ?auto_2479061 ) ( not ( = ?auto_2479060 ?auto_2479067 ) ) ( not ( = ?auto_2479061 ?auto_2479067 ) ) ( not ( = ?auto_2479059 ?auto_2479067 ) ) ( TRUCK-AT ?auto_2479065 ?auto_2479064 ) ( SURFACE-AT ?auto_2479059 ?auto_2479064 ) ( CLEAR ?auto_2479059 ) ( IS-CRATE ?auto_2479060 ) ( AVAILABLE ?auto_2479062 ) ( IN ?auto_2479060 ?auto_2479065 ) ( ON ?auto_2479048 ?auto_2479047 ) ( ON ?auto_2479049 ?auto_2479048 ) ( ON ?auto_2479046 ?auto_2479049 ) ( ON ?auto_2479050 ?auto_2479046 ) ( ON ?auto_2479052 ?auto_2479050 ) ( ON ?auto_2479051 ?auto_2479052 ) ( ON ?auto_2479053 ?auto_2479051 ) ( ON ?auto_2479054 ?auto_2479053 ) ( ON ?auto_2479055 ?auto_2479054 ) ( ON ?auto_2479056 ?auto_2479055 ) ( ON ?auto_2479057 ?auto_2479056 ) ( ON ?auto_2479058 ?auto_2479057 ) ( ON ?auto_2479059 ?auto_2479058 ) ( not ( = ?auto_2479047 ?auto_2479048 ) ) ( not ( = ?auto_2479047 ?auto_2479049 ) ) ( not ( = ?auto_2479047 ?auto_2479046 ) ) ( not ( = ?auto_2479047 ?auto_2479050 ) ) ( not ( = ?auto_2479047 ?auto_2479052 ) ) ( not ( = ?auto_2479047 ?auto_2479051 ) ) ( not ( = ?auto_2479047 ?auto_2479053 ) ) ( not ( = ?auto_2479047 ?auto_2479054 ) ) ( not ( = ?auto_2479047 ?auto_2479055 ) ) ( not ( = ?auto_2479047 ?auto_2479056 ) ) ( not ( = ?auto_2479047 ?auto_2479057 ) ) ( not ( = ?auto_2479047 ?auto_2479058 ) ) ( not ( = ?auto_2479047 ?auto_2479059 ) ) ( not ( = ?auto_2479047 ?auto_2479060 ) ) ( not ( = ?auto_2479047 ?auto_2479061 ) ) ( not ( = ?auto_2479047 ?auto_2479067 ) ) ( not ( = ?auto_2479048 ?auto_2479049 ) ) ( not ( = ?auto_2479048 ?auto_2479046 ) ) ( not ( = ?auto_2479048 ?auto_2479050 ) ) ( not ( = ?auto_2479048 ?auto_2479052 ) ) ( not ( = ?auto_2479048 ?auto_2479051 ) ) ( not ( = ?auto_2479048 ?auto_2479053 ) ) ( not ( = ?auto_2479048 ?auto_2479054 ) ) ( not ( = ?auto_2479048 ?auto_2479055 ) ) ( not ( = ?auto_2479048 ?auto_2479056 ) ) ( not ( = ?auto_2479048 ?auto_2479057 ) ) ( not ( = ?auto_2479048 ?auto_2479058 ) ) ( not ( = ?auto_2479048 ?auto_2479059 ) ) ( not ( = ?auto_2479048 ?auto_2479060 ) ) ( not ( = ?auto_2479048 ?auto_2479061 ) ) ( not ( = ?auto_2479048 ?auto_2479067 ) ) ( not ( = ?auto_2479049 ?auto_2479046 ) ) ( not ( = ?auto_2479049 ?auto_2479050 ) ) ( not ( = ?auto_2479049 ?auto_2479052 ) ) ( not ( = ?auto_2479049 ?auto_2479051 ) ) ( not ( = ?auto_2479049 ?auto_2479053 ) ) ( not ( = ?auto_2479049 ?auto_2479054 ) ) ( not ( = ?auto_2479049 ?auto_2479055 ) ) ( not ( = ?auto_2479049 ?auto_2479056 ) ) ( not ( = ?auto_2479049 ?auto_2479057 ) ) ( not ( = ?auto_2479049 ?auto_2479058 ) ) ( not ( = ?auto_2479049 ?auto_2479059 ) ) ( not ( = ?auto_2479049 ?auto_2479060 ) ) ( not ( = ?auto_2479049 ?auto_2479061 ) ) ( not ( = ?auto_2479049 ?auto_2479067 ) ) ( not ( = ?auto_2479046 ?auto_2479050 ) ) ( not ( = ?auto_2479046 ?auto_2479052 ) ) ( not ( = ?auto_2479046 ?auto_2479051 ) ) ( not ( = ?auto_2479046 ?auto_2479053 ) ) ( not ( = ?auto_2479046 ?auto_2479054 ) ) ( not ( = ?auto_2479046 ?auto_2479055 ) ) ( not ( = ?auto_2479046 ?auto_2479056 ) ) ( not ( = ?auto_2479046 ?auto_2479057 ) ) ( not ( = ?auto_2479046 ?auto_2479058 ) ) ( not ( = ?auto_2479046 ?auto_2479059 ) ) ( not ( = ?auto_2479046 ?auto_2479060 ) ) ( not ( = ?auto_2479046 ?auto_2479061 ) ) ( not ( = ?auto_2479046 ?auto_2479067 ) ) ( not ( = ?auto_2479050 ?auto_2479052 ) ) ( not ( = ?auto_2479050 ?auto_2479051 ) ) ( not ( = ?auto_2479050 ?auto_2479053 ) ) ( not ( = ?auto_2479050 ?auto_2479054 ) ) ( not ( = ?auto_2479050 ?auto_2479055 ) ) ( not ( = ?auto_2479050 ?auto_2479056 ) ) ( not ( = ?auto_2479050 ?auto_2479057 ) ) ( not ( = ?auto_2479050 ?auto_2479058 ) ) ( not ( = ?auto_2479050 ?auto_2479059 ) ) ( not ( = ?auto_2479050 ?auto_2479060 ) ) ( not ( = ?auto_2479050 ?auto_2479061 ) ) ( not ( = ?auto_2479050 ?auto_2479067 ) ) ( not ( = ?auto_2479052 ?auto_2479051 ) ) ( not ( = ?auto_2479052 ?auto_2479053 ) ) ( not ( = ?auto_2479052 ?auto_2479054 ) ) ( not ( = ?auto_2479052 ?auto_2479055 ) ) ( not ( = ?auto_2479052 ?auto_2479056 ) ) ( not ( = ?auto_2479052 ?auto_2479057 ) ) ( not ( = ?auto_2479052 ?auto_2479058 ) ) ( not ( = ?auto_2479052 ?auto_2479059 ) ) ( not ( = ?auto_2479052 ?auto_2479060 ) ) ( not ( = ?auto_2479052 ?auto_2479061 ) ) ( not ( = ?auto_2479052 ?auto_2479067 ) ) ( not ( = ?auto_2479051 ?auto_2479053 ) ) ( not ( = ?auto_2479051 ?auto_2479054 ) ) ( not ( = ?auto_2479051 ?auto_2479055 ) ) ( not ( = ?auto_2479051 ?auto_2479056 ) ) ( not ( = ?auto_2479051 ?auto_2479057 ) ) ( not ( = ?auto_2479051 ?auto_2479058 ) ) ( not ( = ?auto_2479051 ?auto_2479059 ) ) ( not ( = ?auto_2479051 ?auto_2479060 ) ) ( not ( = ?auto_2479051 ?auto_2479061 ) ) ( not ( = ?auto_2479051 ?auto_2479067 ) ) ( not ( = ?auto_2479053 ?auto_2479054 ) ) ( not ( = ?auto_2479053 ?auto_2479055 ) ) ( not ( = ?auto_2479053 ?auto_2479056 ) ) ( not ( = ?auto_2479053 ?auto_2479057 ) ) ( not ( = ?auto_2479053 ?auto_2479058 ) ) ( not ( = ?auto_2479053 ?auto_2479059 ) ) ( not ( = ?auto_2479053 ?auto_2479060 ) ) ( not ( = ?auto_2479053 ?auto_2479061 ) ) ( not ( = ?auto_2479053 ?auto_2479067 ) ) ( not ( = ?auto_2479054 ?auto_2479055 ) ) ( not ( = ?auto_2479054 ?auto_2479056 ) ) ( not ( = ?auto_2479054 ?auto_2479057 ) ) ( not ( = ?auto_2479054 ?auto_2479058 ) ) ( not ( = ?auto_2479054 ?auto_2479059 ) ) ( not ( = ?auto_2479054 ?auto_2479060 ) ) ( not ( = ?auto_2479054 ?auto_2479061 ) ) ( not ( = ?auto_2479054 ?auto_2479067 ) ) ( not ( = ?auto_2479055 ?auto_2479056 ) ) ( not ( = ?auto_2479055 ?auto_2479057 ) ) ( not ( = ?auto_2479055 ?auto_2479058 ) ) ( not ( = ?auto_2479055 ?auto_2479059 ) ) ( not ( = ?auto_2479055 ?auto_2479060 ) ) ( not ( = ?auto_2479055 ?auto_2479061 ) ) ( not ( = ?auto_2479055 ?auto_2479067 ) ) ( not ( = ?auto_2479056 ?auto_2479057 ) ) ( not ( = ?auto_2479056 ?auto_2479058 ) ) ( not ( = ?auto_2479056 ?auto_2479059 ) ) ( not ( = ?auto_2479056 ?auto_2479060 ) ) ( not ( = ?auto_2479056 ?auto_2479061 ) ) ( not ( = ?auto_2479056 ?auto_2479067 ) ) ( not ( = ?auto_2479057 ?auto_2479058 ) ) ( not ( = ?auto_2479057 ?auto_2479059 ) ) ( not ( = ?auto_2479057 ?auto_2479060 ) ) ( not ( = ?auto_2479057 ?auto_2479061 ) ) ( not ( = ?auto_2479057 ?auto_2479067 ) ) ( not ( = ?auto_2479058 ?auto_2479059 ) ) ( not ( = ?auto_2479058 ?auto_2479060 ) ) ( not ( = ?auto_2479058 ?auto_2479061 ) ) ( not ( = ?auto_2479058 ?auto_2479067 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2479059 ?auto_2479060 ?auto_2479061 )
      ( MAKE-15CRATE-VERIFY ?auto_2479047 ?auto_2479048 ?auto_2479049 ?auto_2479046 ?auto_2479050 ?auto_2479052 ?auto_2479051 ?auto_2479053 ?auto_2479054 ?auto_2479055 ?auto_2479056 ?auto_2479057 ?auto_2479058 ?auto_2479059 ?auto_2479060 ?auto_2479061 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2499606 - SURFACE
      ?auto_2499607 - SURFACE
      ?auto_2499608 - SURFACE
      ?auto_2499605 - SURFACE
      ?auto_2499609 - SURFACE
      ?auto_2499611 - SURFACE
      ?auto_2499610 - SURFACE
      ?auto_2499612 - SURFACE
      ?auto_2499613 - SURFACE
      ?auto_2499614 - SURFACE
      ?auto_2499615 - SURFACE
      ?auto_2499616 - SURFACE
      ?auto_2499617 - SURFACE
      ?auto_2499618 - SURFACE
      ?auto_2499619 - SURFACE
      ?auto_2499620 - SURFACE
      ?auto_2499621 - SURFACE
    )
    :vars
    (
      ?auto_2499622 - HOIST
      ?auto_2499623 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2499622 ?auto_2499623 ) ( SURFACE-AT ?auto_2499620 ?auto_2499623 ) ( CLEAR ?auto_2499620 ) ( LIFTING ?auto_2499622 ?auto_2499621 ) ( IS-CRATE ?auto_2499621 ) ( not ( = ?auto_2499620 ?auto_2499621 ) ) ( ON ?auto_2499607 ?auto_2499606 ) ( ON ?auto_2499608 ?auto_2499607 ) ( ON ?auto_2499605 ?auto_2499608 ) ( ON ?auto_2499609 ?auto_2499605 ) ( ON ?auto_2499611 ?auto_2499609 ) ( ON ?auto_2499610 ?auto_2499611 ) ( ON ?auto_2499612 ?auto_2499610 ) ( ON ?auto_2499613 ?auto_2499612 ) ( ON ?auto_2499614 ?auto_2499613 ) ( ON ?auto_2499615 ?auto_2499614 ) ( ON ?auto_2499616 ?auto_2499615 ) ( ON ?auto_2499617 ?auto_2499616 ) ( ON ?auto_2499618 ?auto_2499617 ) ( ON ?auto_2499619 ?auto_2499618 ) ( ON ?auto_2499620 ?auto_2499619 ) ( not ( = ?auto_2499606 ?auto_2499607 ) ) ( not ( = ?auto_2499606 ?auto_2499608 ) ) ( not ( = ?auto_2499606 ?auto_2499605 ) ) ( not ( = ?auto_2499606 ?auto_2499609 ) ) ( not ( = ?auto_2499606 ?auto_2499611 ) ) ( not ( = ?auto_2499606 ?auto_2499610 ) ) ( not ( = ?auto_2499606 ?auto_2499612 ) ) ( not ( = ?auto_2499606 ?auto_2499613 ) ) ( not ( = ?auto_2499606 ?auto_2499614 ) ) ( not ( = ?auto_2499606 ?auto_2499615 ) ) ( not ( = ?auto_2499606 ?auto_2499616 ) ) ( not ( = ?auto_2499606 ?auto_2499617 ) ) ( not ( = ?auto_2499606 ?auto_2499618 ) ) ( not ( = ?auto_2499606 ?auto_2499619 ) ) ( not ( = ?auto_2499606 ?auto_2499620 ) ) ( not ( = ?auto_2499606 ?auto_2499621 ) ) ( not ( = ?auto_2499607 ?auto_2499608 ) ) ( not ( = ?auto_2499607 ?auto_2499605 ) ) ( not ( = ?auto_2499607 ?auto_2499609 ) ) ( not ( = ?auto_2499607 ?auto_2499611 ) ) ( not ( = ?auto_2499607 ?auto_2499610 ) ) ( not ( = ?auto_2499607 ?auto_2499612 ) ) ( not ( = ?auto_2499607 ?auto_2499613 ) ) ( not ( = ?auto_2499607 ?auto_2499614 ) ) ( not ( = ?auto_2499607 ?auto_2499615 ) ) ( not ( = ?auto_2499607 ?auto_2499616 ) ) ( not ( = ?auto_2499607 ?auto_2499617 ) ) ( not ( = ?auto_2499607 ?auto_2499618 ) ) ( not ( = ?auto_2499607 ?auto_2499619 ) ) ( not ( = ?auto_2499607 ?auto_2499620 ) ) ( not ( = ?auto_2499607 ?auto_2499621 ) ) ( not ( = ?auto_2499608 ?auto_2499605 ) ) ( not ( = ?auto_2499608 ?auto_2499609 ) ) ( not ( = ?auto_2499608 ?auto_2499611 ) ) ( not ( = ?auto_2499608 ?auto_2499610 ) ) ( not ( = ?auto_2499608 ?auto_2499612 ) ) ( not ( = ?auto_2499608 ?auto_2499613 ) ) ( not ( = ?auto_2499608 ?auto_2499614 ) ) ( not ( = ?auto_2499608 ?auto_2499615 ) ) ( not ( = ?auto_2499608 ?auto_2499616 ) ) ( not ( = ?auto_2499608 ?auto_2499617 ) ) ( not ( = ?auto_2499608 ?auto_2499618 ) ) ( not ( = ?auto_2499608 ?auto_2499619 ) ) ( not ( = ?auto_2499608 ?auto_2499620 ) ) ( not ( = ?auto_2499608 ?auto_2499621 ) ) ( not ( = ?auto_2499605 ?auto_2499609 ) ) ( not ( = ?auto_2499605 ?auto_2499611 ) ) ( not ( = ?auto_2499605 ?auto_2499610 ) ) ( not ( = ?auto_2499605 ?auto_2499612 ) ) ( not ( = ?auto_2499605 ?auto_2499613 ) ) ( not ( = ?auto_2499605 ?auto_2499614 ) ) ( not ( = ?auto_2499605 ?auto_2499615 ) ) ( not ( = ?auto_2499605 ?auto_2499616 ) ) ( not ( = ?auto_2499605 ?auto_2499617 ) ) ( not ( = ?auto_2499605 ?auto_2499618 ) ) ( not ( = ?auto_2499605 ?auto_2499619 ) ) ( not ( = ?auto_2499605 ?auto_2499620 ) ) ( not ( = ?auto_2499605 ?auto_2499621 ) ) ( not ( = ?auto_2499609 ?auto_2499611 ) ) ( not ( = ?auto_2499609 ?auto_2499610 ) ) ( not ( = ?auto_2499609 ?auto_2499612 ) ) ( not ( = ?auto_2499609 ?auto_2499613 ) ) ( not ( = ?auto_2499609 ?auto_2499614 ) ) ( not ( = ?auto_2499609 ?auto_2499615 ) ) ( not ( = ?auto_2499609 ?auto_2499616 ) ) ( not ( = ?auto_2499609 ?auto_2499617 ) ) ( not ( = ?auto_2499609 ?auto_2499618 ) ) ( not ( = ?auto_2499609 ?auto_2499619 ) ) ( not ( = ?auto_2499609 ?auto_2499620 ) ) ( not ( = ?auto_2499609 ?auto_2499621 ) ) ( not ( = ?auto_2499611 ?auto_2499610 ) ) ( not ( = ?auto_2499611 ?auto_2499612 ) ) ( not ( = ?auto_2499611 ?auto_2499613 ) ) ( not ( = ?auto_2499611 ?auto_2499614 ) ) ( not ( = ?auto_2499611 ?auto_2499615 ) ) ( not ( = ?auto_2499611 ?auto_2499616 ) ) ( not ( = ?auto_2499611 ?auto_2499617 ) ) ( not ( = ?auto_2499611 ?auto_2499618 ) ) ( not ( = ?auto_2499611 ?auto_2499619 ) ) ( not ( = ?auto_2499611 ?auto_2499620 ) ) ( not ( = ?auto_2499611 ?auto_2499621 ) ) ( not ( = ?auto_2499610 ?auto_2499612 ) ) ( not ( = ?auto_2499610 ?auto_2499613 ) ) ( not ( = ?auto_2499610 ?auto_2499614 ) ) ( not ( = ?auto_2499610 ?auto_2499615 ) ) ( not ( = ?auto_2499610 ?auto_2499616 ) ) ( not ( = ?auto_2499610 ?auto_2499617 ) ) ( not ( = ?auto_2499610 ?auto_2499618 ) ) ( not ( = ?auto_2499610 ?auto_2499619 ) ) ( not ( = ?auto_2499610 ?auto_2499620 ) ) ( not ( = ?auto_2499610 ?auto_2499621 ) ) ( not ( = ?auto_2499612 ?auto_2499613 ) ) ( not ( = ?auto_2499612 ?auto_2499614 ) ) ( not ( = ?auto_2499612 ?auto_2499615 ) ) ( not ( = ?auto_2499612 ?auto_2499616 ) ) ( not ( = ?auto_2499612 ?auto_2499617 ) ) ( not ( = ?auto_2499612 ?auto_2499618 ) ) ( not ( = ?auto_2499612 ?auto_2499619 ) ) ( not ( = ?auto_2499612 ?auto_2499620 ) ) ( not ( = ?auto_2499612 ?auto_2499621 ) ) ( not ( = ?auto_2499613 ?auto_2499614 ) ) ( not ( = ?auto_2499613 ?auto_2499615 ) ) ( not ( = ?auto_2499613 ?auto_2499616 ) ) ( not ( = ?auto_2499613 ?auto_2499617 ) ) ( not ( = ?auto_2499613 ?auto_2499618 ) ) ( not ( = ?auto_2499613 ?auto_2499619 ) ) ( not ( = ?auto_2499613 ?auto_2499620 ) ) ( not ( = ?auto_2499613 ?auto_2499621 ) ) ( not ( = ?auto_2499614 ?auto_2499615 ) ) ( not ( = ?auto_2499614 ?auto_2499616 ) ) ( not ( = ?auto_2499614 ?auto_2499617 ) ) ( not ( = ?auto_2499614 ?auto_2499618 ) ) ( not ( = ?auto_2499614 ?auto_2499619 ) ) ( not ( = ?auto_2499614 ?auto_2499620 ) ) ( not ( = ?auto_2499614 ?auto_2499621 ) ) ( not ( = ?auto_2499615 ?auto_2499616 ) ) ( not ( = ?auto_2499615 ?auto_2499617 ) ) ( not ( = ?auto_2499615 ?auto_2499618 ) ) ( not ( = ?auto_2499615 ?auto_2499619 ) ) ( not ( = ?auto_2499615 ?auto_2499620 ) ) ( not ( = ?auto_2499615 ?auto_2499621 ) ) ( not ( = ?auto_2499616 ?auto_2499617 ) ) ( not ( = ?auto_2499616 ?auto_2499618 ) ) ( not ( = ?auto_2499616 ?auto_2499619 ) ) ( not ( = ?auto_2499616 ?auto_2499620 ) ) ( not ( = ?auto_2499616 ?auto_2499621 ) ) ( not ( = ?auto_2499617 ?auto_2499618 ) ) ( not ( = ?auto_2499617 ?auto_2499619 ) ) ( not ( = ?auto_2499617 ?auto_2499620 ) ) ( not ( = ?auto_2499617 ?auto_2499621 ) ) ( not ( = ?auto_2499618 ?auto_2499619 ) ) ( not ( = ?auto_2499618 ?auto_2499620 ) ) ( not ( = ?auto_2499618 ?auto_2499621 ) ) ( not ( = ?auto_2499619 ?auto_2499620 ) ) ( not ( = ?auto_2499619 ?auto_2499621 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2499620 ?auto_2499621 )
      ( MAKE-16CRATE-VERIFY ?auto_2499606 ?auto_2499607 ?auto_2499608 ?auto_2499605 ?auto_2499609 ?auto_2499611 ?auto_2499610 ?auto_2499612 ?auto_2499613 ?auto_2499614 ?auto_2499615 ?auto_2499616 ?auto_2499617 ?auto_2499618 ?auto_2499619 ?auto_2499620 ?auto_2499621 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2499805 - SURFACE
      ?auto_2499806 - SURFACE
      ?auto_2499807 - SURFACE
      ?auto_2499804 - SURFACE
      ?auto_2499808 - SURFACE
      ?auto_2499810 - SURFACE
      ?auto_2499809 - SURFACE
      ?auto_2499811 - SURFACE
      ?auto_2499812 - SURFACE
      ?auto_2499813 - SURFACE
      ?auto_2499814 - SURFACE
      ?auto_2499815 - SURFACE
      ?auto_2499816 - SURFACE
      ?auto_2499817 - SURFACE
      ?auto_2499818 - SURFACE
      ?auto_2499819 - SURFACE
      ?auto_2499820 - SURFACE
    )
    :vars
    (
      ?auto_2499822 - HOIST
      ?auto_2499821 - PLACE
      ?auto_2499823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2499822 ?auto_2499821 ) ( SURFACE-AT ?auto_2499819 ?auto_2499821 ) ( CLEAR ?auto_2499819 ) ( IS-CRATE ?auto_2499820 ) ( not ( = ?auto_2499819 ?auto_2499820 ) ) ( TRUCK-AT ?auto_2499823 ?auto_2499821 ) ( AVAILABLE ?auto_2499822 ) ( IN ?auto_2499820 ?auto_2499823 ) ( ON ?auto_2499819 ?auto_2499818 ) ( not ( = ?auto_2499818 ?auto_2499819 ) ) ( not ( = ?auto_2499818 ?auto_2499820 ) ) ( ON ?auto_2499806 ?auto_2499805 ) ( ON ?auto_2499807 ?auto_2499806 ) ( ON ?auto_2499804 ?auto_2499807 ) ( ON ?auto_2499808 ?auto_2499804 ) ( ON ?auto_2499810 ?auto_2499808 ) ( ON ?auto_2499809 ?auto_2499810 ) ( ON ?auto_2499811 ?auto_2499809 ) ( ON ?auto_2499812 ?auto_2499811 ) ( ON ?auto_2499813 ?auto_2499812 ) ( ON ?auto_2499814 ?auto_2499813 ) ( ON ?auto_2499815 ?auto_2499814 ) ( ON ?auto_2499816 ?auto_2499815 ) ( ON ?auto_2499817 ?auto_2499816 ) ( ON ?auto_2499818 ?auto_2499817 ) ( not ( = ?auto_2499805 ?auto_2499806 ) ) ( not ( = ?auto_2499805 ?auto_2499807 ) ) ( not ( = ?auto_2499805 ?auto_2499804 ) ) ( not ( = ?auto_2499805 ?auto_2499808 ) ) ( not ( = ?auto_2499805 ?auto_2499810 ) ) ( not ( = ?auto_2499805 ?auto_2499809 ) ) ( not ( = ?auto_2499805 ?auto_2499811 ) ) ( not ( = ?auto_2499805 ?auto_2499812 ) ) ( not ( = ?auto_2499805 ?auto_2499813 ) ) ( not ( = ?auto_2499805 ?auto_2499814 ) ) ( not ( = ?auto_2499805 ?auto_2499815 ) ) ( not ( = ?auto_2499805 ?auto_2499816 ) ) ( not ( = ?auto_2499805 ?auto_2499817 ) ) ( not ( = ?auto_2499805 ?auto_2499818 ) ) ( not ( = ?auto_2499805 ?auto_2499819 ) ) ( not ( = ?auto_2499805 ?auto_2499820 ) ) ( not ( = ?auto_2499806 ?auto_2499807 ) ) ( not ( = ?auto_2499806 ?auto_2499804 ) ) ( not ( = ?auto_2499806 ?auto_2499808 ) ) ( not ( = ?auto_2499806 ?auto_2499810 ) ) ( not ( = ?auto_2499806 ?auto_2499809 ) ) ( not ( = ?auto_2499806 ?auto_2499811 ) ) ( not ( = ?auto_2499806 ?auto_2499812 ) ) ( not ( = ?auto_2499806 ?auto_2499813 ) ) ( not ( = ?auto_2499806 ?auto_2499814 ) ) ( not ( = ?auto_2499806 ?auto_2499815 ) ) ( not ( = ?auto_2499806 ?auto_2499816 ) ) ( not ( = ?auto_2499806 ?auto_2499817 ) ) ( not ( = ?auto_2499806 ?auto_2499818 ) ) ( not ( = ?auto_2499806 ?auto_2499819 ) ) ( not ( = ?auto_2499806 ?auto_2499820 ) ) ( not ( = ?auto_2499807 ?auto_2499804 ) ) ( not ( = ?auto_2499807 ?auto_2499808 ) ) ( not ( = ?auto_2499807 ?auto_2499810 ) ) ( not ( = ?auto_2499807 ?auto_2499809 ) ) ( not ( = ?auto_2499807 ?auto_2499811 ) ) ( not ( = ?auto_2499807 ?auto_2499812 ) ) ( not ( = ?auto_2499807 ?auto_2499813 ) ) ( not ( = ?auto_2499807 ?auto_2499814 ) ) ( not ( = ?auto_2499807 ?auto_2499815 ) ) ( not ( = ?auto_2499807 ?auto_2499816 ) ) ( not ( = ?auto_2499807 ?auto_2499817 ) ) ( not ( = ?auto_2499807 ?auto_2499818 ) ) ( not ( = ?auto_2499807 ?auto_2499819 ) ) ( not ( = ?auto_2499807 ?auto_2499820 ) ) ( not ( = ?auto_2499804 ?auto_2499808 ) ) ( not ( = ?auto_2499804 ?auto_2499810 ) ) ( not ( = ?auto_2499804 ?auto_2499809 ) ) ( not ( = ?auto_2499804 ?auto_2499811 ) ) ( not ( = ?auto_2499804 ?auto_2499812 ) ) ( not ( = ?auto_2499804 ?auto_2499813 ) ) ( not ( = ?auto_2499804 ?auto_2499814 ) ) ( not ( = ?auto_2499804 ?auto_2499815 ) ) ( not ( = ?auto_2499804 ?auto_2499816 ) ) ( not ( = ?auto_2499804 ?auto_2499817 ) ) ( not ( = ?auto_2499804 ?auto_2499818 ) ) ( not ( = ?auto_2499804 ?auto_2499819 ) ) ( not ( = ?auto_2499804 ?auto_2499820 ) ) ( not ( = ?auto_2499808 ?auto_2499810 ) ) ( not ( = ?auto_2499808 ?auto_2499809 ) ) ( not ( = ?auto_2499808 ?auto_2499811 ) ) ( not ( = ?auto_2499808 ?auto_2499812 ) ) ( not ( = ?auto_2499808 ?auto_2499813 ) ) ( not ( = ?auto_2499808 ?auto_2499814 ) ) ( not ( = ?auto_2499808 ?auto_2499815 ) ) ( not ( = ?auto_2499808 ?auto_2499816 ) ) ( not ( = ?auto_2499808 ?auto_2499817 ) ) ( not ( = ?auto_2499808 ?auto_2499818 ) ) ( not ( = ?auto_2499808 ?auto_2499819 ) ) ( not ( = ?auto_2499808 ?auto_2499820 ) ) ( not ( = ?auto_2499810 ?auto_2499809 ) ) ( not ( = ?auto_2499810 ?auto_2499811 ) ) ( not ( = ?auto_2499810 ?auto_2499812 ) ) ( not ( = ?auto_2499810 ?auto_2499813 ) ) ( not ( = ?auto_2499810 ?auto_2499814 ) ) ( not ( = ?auto_2499810 ?auto_2499815 ) ) ( not ( = ?auto_2499810 ?auto_2499816 ) ) ( not ( = ?auto_2499810 ?auto_2499817 ) ) ( not ( = ?auto_2499810 ?auto_2499818 ) ) ( not ( = ?auto_2499810 ?auto_2499819 ) ) ( not ( = ?auto_2499810 ?auto_2499820 ) ) ( not ( = ?auto_2499809 ?auto_2499811 ) ) ( not ( = ?auto_2499809 ?auto_2499812 ) ) ( not ( = ?auto_2499809 ?auto_2499813 ) ) ( not ( = ?auto_2499809 ?auto_2499814 ) ) ( not ( = ?auto_2499809 ?auto_2499815 ) ) ( not ( = ?auto_2499809 ?auto_2499816 ) ) ( not ( = ?auto_2499809 ?auto_2499817 ) ) ( not ( = ?auto_2499809 ?auto_2499818 ) ) ( not ( = ?auto_2499809 ?auto_2499819 ) ) ( not ( = ?auto_2499809 ?auto_2499820 ) ) ( not ( = ?auto_2499811 ?auto_2499812 ) ) ( not ( = ?auto_2499811 ?auto_2499813 ) ) ( not ( = ?auto_2499811 ?auto_2499814 ) ) ( not ( = ?auto_2499811 ?auto_2499815 ) ) ( not ( = ?auto_2499811 ?auto_2499816 ) ) ( not ( = ?auto_2499811 ?auto_2499817 ) ) ( not ( = ?auto_2499811 ?auto_2499818 ) ) ( not ( = ?auto_2499811 ?auto_2499819 ) ) ( not ( = ?auto_2499811 ?auto_2499820 ) ) ( not ( = ?auto_2499812 ?auto_2499813 ) ) ( not ( = ?auto_2499812 ?auto_2499814 ) ) ( not ( = ?auto_2499812 ?auto_2499815 ) ) ( not ( = ?auto_2499812 ?auto_2499816 ) ) ( not ( = ?auto_2499812 ?auto_2499817 ) ) ( not ( = ?auto_2499812 ?auto_2499818 ) ) ( not ( = ?auto_2499812 ?auto_2499819 ) ) ( not ( = ?auto_2499812 ?auto_2499820 ) ) ( not ( = ?auto_2499813 ?auto_2499814 ) ) ( not ( = ?auto_2499813 ?auto_2499815 ) ) ( not ( = ?auto_2499813 ?auto_2499816 ) ) ( not ( = ?auto_2499813 ?auto_2499817 ) ) ( not ( = ?auto_2499813 ?auto_2499818 ) ) ( not ( = ?auto_2499813 ?auto_2499819 ) ) ( not ( = ?auto_2499813 ?auto_2499820 ) ) ( not ( = ?auto_2499814 ?auto_2499815 ) ) ( not ( = ?auto_2499814 ?auto_2499816 ) ) ( not ( = ?auto_2499814 ?auto_2499817 ) ) ( not ( = ?auto_2499814 ?auto_2499818 ) ) ( not ( = ?auto_2499814 ?auto_2499819 ) ) ( not ( = ?auto_2499814 ?auto_2499820 ) ) ( not ( = ?auto_2499815 ?auto_2499816 ) ) ( not ( = ?auto_2499815 ?auto_2499817 ) ) ( not ( = ?auto_2499815 ?auto_2499818 ) ) ( not ( = ?auto_2499815 ?auto_2499819 ) ) ( not ( = ?auto_2499815 ?auto_2499820 ) ) ( not ( = ?auto_2499816 ?auto_2499817 ) ) ( not ( = ?auto_2499816 ?auto_2499818 ) ) ( not ( = ?auto_2499816 ?auto_2499819 ) ) ( not ( = ?auto_2499816 ?auto_2499820 ) ) ( not ( = ?auto_2499817 ?auto_2499818 ) ) ( not ( = ?auto_2499817 ?auto_2499819 ) ) ( not ( = ?auto_2499817 ?auto_2499820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2499818 ?auto_2499819 ?auto_2499820 )
      ( MAKE-16CRATE-VERIFY ?auto_2499805 ?auto_2499806 ?auto_2499807 ?auto_2499804 ?auto_2499808 ?auto_2499810 ?auto_2499809 ?auto_2499811 ?auto_2499812 ?auto_2499813 ?auto_2499814 ?auto_2499815 ?auto_2499816 ?auto_2499817 ?auto_2499818 ?auto_2499819 ?auto_2499820 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2500021 - SURFACE
      ?auto_2500022 - SURFACE
      ?auto_2500023 - SURFACE
      ?auto_2500020 - SURFACE
      ?auto_2500024 - SURFACE
      ?auto_2500026 - SURFACE
      ?auto_2500025 - SURFACE
      ?auto_2500027 - SURFACE
      ?auto_2500028 - SURFACE
      ?auto_2500029 - SURFACE
      ?auto_2500030 - SURFACE
      ?auto_2500031 - SURFACE
      ?auto_2500032 - SURFACE
      ?auto_2500033 - SURFACE
      ?auto_2500034 - SURFACE
      ?auto_2500035 - SURFACE
      ?auto_2500036 - SURFACE
    )
    :vars
    (
      ?auto_2500037 - HOIST
      ?auto_2500039 - PLACE
      ?auto_2500038 - TRUCK
      ?auto_2500040 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2500037 ?auto_2500039 ) ( SURFACE-AT ?auto_2500035 ?auto_2500039 ) ( CLEAR ?auto_2500035 ) ( IS-CRATE ?auto_2500036 ) ( not ( = ?auto_2500035 ?auto_2500036 ) ) ( AVAILABLE ?auto_2500037 ) ( IN ?auto_2500036 ?auto_2500038 ) ( ON ?auto_2500035 ?auto_2500034 ) ( not ( = ?auto_2500034 ?auto_2500035 ) ) ( not ( = ?auto_2500034 ?auto_2500036 ) ) ( TRUCK-AT ?auto_2500038 ?auto_2500040 ) ( not ( = ?auto_2500040 ?auto_2500039 ) ) ( ON ?auto_2500022 ?auto_2500021 ) ( ON ?auto_2500023 ?auto_2500022 ) ( ON ?auto_2500020 ?auto_2500023 ) ( ON ?auto_2500024 ?auto_2500020 ) ( ON ?auto_2500026 ?auto_2500024 ) ( ON ?auto_2500025 ?auto_2500026 ) ( ON ?auto_2500027 ?auto_2500025 ) ( ON ?auto_2500028 ?auto_2500027 ) ( ON ?auto_2500029 ?auto_2500028 ) ( ON ?auto_2500030 ?auto_2500029 ) ( ON ?auto_2500031 ?auto_2500030 ) ( ON ?auto_2500032 ?auto_2500031 ) ( ON ?auto_2500033 ?auto_2500032 ) ( ON ?auto_2500034 ?auto_2500033 ) ( not ( = ?auto_2500021 ?auto_2500022 ) ) ( not ( = ?auto_2500021 ?auto_2500023 ) ) ( not ( = ?auto_2500021 ?auto_2500020 ) ) ( not ( = ?auto_2500021 ?auto_2500024 ) ) ( not ( = ?auto_2500021 ?auto_2500026 ) ) ( not ( = ?auto_2500021 ?auto_2500025 ) ) ( not ( = ?auto_2500021 ?auto_2500027 ) ) ( not ( = ?auto_2500021 ?auto_2500028 ) ) ( not ( = ?auto_2500021 ?auto_2500029 ) ) ( not ( = ?auto_2500021 ?auto_2500030 ) ) ( not ( = ?auto_2500021 ?auto_2500031 ) ) ( not ( = ?auto_2500021 ?auto_2500032 ) ) ( not ( = ?auto_2500021 ?auto_2500033 ) ) ( not ( = ?auto_2500021 ?auto_2500034 ) ) ( not ( = ?auto_2500021 ?auto_2500035 ) ) ( not ( = ?auto_2500021 ?auto_2500036 ) ) ( not ( = ?auto_2500022 ?auto_2500023 ) ) ( not ( = ?auto_2500022 ?auto_2500020 ) ) ( not ( = ?auto_2500022 ?auto_2500024 ) ) ( not ( = ?auto_2500022 ?auto_2500026 ) ) ( not ( = ?auto_2500022 ?auto_2500025 ) ) ( not ( = ?auto_2500022 ?auto_2500027 ) ) ( not ( = ?auto_2500022 ?auto_2500028 ) ) ( not ( = ?auto_2500022 ?auto_2500029 ) ) ( not ( = ?auto_2500022 ?auto_2500030 ) ) ( not ( = ?auto_2500022 ?auto_2500031 ) ) ( not ( = ?auto_2500022 ?auto_2500032 ) ) ( not ( = ?auto_2500022 ?auto_2500033 ) ) ( not ( = ?auto_2500022 ?auto_2500034 ) ) ( not ( = ?auto_2500022 ?auto_2500035 ) ) ( not ( = ?auto_2500022 ?auto_2500036 ) ) ( not ( = ?auto_2500023 ?auto_2500020 ) ) ( not ( = ?auto_2500023 ?auto_2500024 ) ) ( not ( = ?auto_2500023 ?auto_2500026 ) ) ( not ( = ?auto_2500023 ?auto_2500025 ) ) ( not ( = ?auto_2500023 ?auto_2500027 ) ) ( not ( = ?auto_2500023 ?auto_2500028 ) ) ( not ( = ?auto_2500023 ?auto_2500029 ) ) ( not ( = ?auto_2500023 ?auto_2500030 ) ) ( not ( = ?auto_2500023 ?auto_2500031 ) ) ( not ( = ?auto_2500023 ?auto_2500032 ) ) ( not ( = ?auto_2500023 ?auto_2500033 ) ) ( not ( = ?auto_2500023 ?auto_2500034 ) ) ( not ( = ?auto_2500023 ?auto_2500035 ) ) ( not ( = ?auto_2500023 ?auto_2500036 ) ) ( not ( = ?auto_2500020 ?auto_2500024 ) ) ( not ( = ?auto_2500020 ?auto_2500026 ) ) ( not ( = ?auto_2500020 ?auto_2500025 ) ) ( not ( = ?auto_2500020 ?auto_2500027 ) ) ( not ( = ?auto_2500020 ?auto_2500028 ) ) ( not ( = ?auto_2500020 ?auto_2500029 ) ) ( not ( = ?auto_2500020 ?auto_2500030 ) ) ( not ( = ?auto_2500020 ?auto_2500031 ) ) ( not ( = ?auto_2500020 ?auto_2500032 ) ) ( not ( = ?auto_2500020 ?auto_2500033 ) ) ( not ( = ?auto_2500020 ?auto_2500034 ) ) ( not ( = ?auto_2500020 ?auto_2500035 ) ) ( not ( = ?auto_2500020 ?auto_2500036 ) ) ( not ( = ?auto_2500024 ?auto_2500026 ) ) ( not ( = ?auto_2500024 ?auto_2500025 ) ) ( not ( = ?auto_2500024 ?auto_2500027 ) ) ( not ( = ?auto_2500024 ?auto_2500028 ) ) ( not ( = ?auto_2500024 ?auto_2500029 ) ) ( not ( = ?auto_2500024 ?auto_2500030 ) ) ( not ( = ?auto_2500024 ?auto_2500031 ) ) ( not ( = ?auto_2500024 ?auto_2500032 ) ) ( not ( = ?auto_2500024 ?auto_2500033 ) ) ( not ( = ?auto_2500024 ?auto_2500034 ) ) ( not ( = ?auto_2500024 ?auto_2500035 ) ) ( not ( = ?auto_2500024 ?auto_2500036 ) ) ( not ( = ?auto_2500026 ?auto_2500025 ) ) ( not ( = ?auto_2500026 ?auto_2500027 ) ) ( not ( = ?auto_2500026 ?auto_2500028 ) ) ( not ( = ?auto_2500026 ?auto_2500029 ) ) ( not ( = ?auto_2500026 ?auto_2500030 ) ) ( not ( = ?auto_2500026 ?auto_2500031 ) ) ( not ( = ?auto_2500026 ?auto_2500032 ) ) ( not ( = ?auto_2500026 ?auto_2500033 ) ) ( not ( = ?auto_2500026 ?auto_2500034 ) ) ( not ( = ?auto_2500026 ?auto_2500035 ) ) ( not ( = ?auto_2500026 ?auto_2500036 ) ) ( not ( = ?auto_2500025 ?auto_2500027 ) ) ( not ( = ?auto_2500025 ?auto_2500028 ) ) ( not ( = ?auto_2500025 ?auto_2500029 ) ) ( not ( = ?auto_2500025 ?auto_2500030 ) ) ( not ( = ?auto_2500025 ?auto_2500031 ) ) ( not ( = ?auto_2500025 ?auto_2500032 ) ) ( not ( = ?auto_2500025 ?auto_2500033 ) ) ( not ( = ?auto_2500025 ?auto_2500034 ) ) ( not ( = ?auto_2500025 ?auto_2500035 ) ) ( not ( = ?auto_2500025 ?auto_2500036 ) ) ( not ( = ?auto_2500027 ?auto_2500028 ) ) ( not ( = ?auto_2500027 ?auto_2500029 ) ) ( not ( = ?auto_2500027 ?auto_2500030 ) ) ( not ( = ?auto_2500027 ?auto_2500031 ) ) ( not ( = ?auto_2500027 ?auto_2500032 ) ) ( not ( = ?auto_2500027 ?auto_2500033 ) ) ( not ( = ?auto_2500027 ?auto_2500034 ) ) ( not ( = ?auto_2500027 ?auto_2500035 ) ) ( not ( = ?auto_2500027 ?auto_2500036 ) ) ( not ( = ?auto_2500028 ?auto_2500029 ) ) ( not ( = ?auto_2500028 ?auto_2500030 ) ) ( not ( = ?auto_2500028 ?auto_2500031 ) ) ( not ( = ?auto_2500028 ?auto_2500032 ) ) ( not ( = ?auto_2500028 ?auto_2500033 ) ) ( not ( = ?auto_2500028 ?auto_2500034 ) ) ( not ( = ?auto_2500028 ?auto_2500035 ) ) ( not ( = ?auto_2500028 ?auto_2500036 ) ) ( not ( = ?auto_2500029 ?auto_2500030 ) ) ( not ( = ?auto_2500029 ?auto_2500031 ) ) ( not ( = ?auto_2500029 ?auto_2500032 ) ) ( not ( = ?auto_2500029 ?auto_2500033 ) ) ( not ( = ?auto_2500029 ?auto_2500034 ) ) ( not ( = ?auto_2500029 ?auto_2500035 ) ) ( not ( = ?auto_2500029 ?auto_2500036 ) ) ( not ( = ?auto_2500030 ?auto_2500031 ) ) ( not ( = ?auto_2500030 ?auto_2500032 ) ) ( not ( = ?auto_2500030 ?auto_2500033 ) ) ( not ( = ?auto_2500030 ?auto_2500034 ) ) ( not ( = ?auto_2500030 ?auto_2500035 ) ) ( not ( = ?auto_2500030 ?auto_2500036 ) ) ( not ( = ?auto_2500031 ?auto_2500032 ) ) ( not ( = ?auto_2500031 ?auto_2500033 ) ) ( not ( = ?auto_2500031 ?auto_2500034 ) ) ( not ( = ?auto_2500031 ?auto_2500035 ) ) ( not ( = ?auto_2500031 ?auto_2500036 ) ) ( not ( = ?auto_2500032 ?auto_2500033 ) ) ( not ( = ?auto_2500032 ?auto_2500034 ) ) ( not ( = ?auto_2500032 ?auto_2500035 ) ) ( not ( = ?auto_2500032 ?auto_2500036 ) ) ( not ( = ?auto_2500033 ?auto_2500034 ) ) ( not ( = ?auto_2500033 ?auto_2500035 ) ) ( not ( = ?auto_2500033 ?auto_2500036 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2500034 ?auto_2500035 ?auto_2500036 )
      ( MAKE-16CRATE-VERIFY ?auto_2500021 ?auto_2500022 ?auto_2500023 ?auto_2500020 ?auto_2500024 ?auto_2500026 ?auto_2500025 ?auto_2500027 ?auto_2500028 ?auto_2500029 ?auto_2500030 ?auto_2500031 ?auto_2500032 ?auto_2500033 ?auto_2500034 ?auto_2500035 ?auto_2500036 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2500253 - SURFACE
      ?auto_2500254 - SURFACE
      ?auto_2500255 - SURFACE
      ?auto_2500252 - SURFACE
      ?auto_2500256 - SURFACE
      ?auto_2500258 - SURFACE
      ?auto_2500257 - SURFACE
      ?auto_2500259 - SURFACE
      ?auto_2500260 - SURFACE
      ?auto_2500261 - SURFACE
      ?auto_2500262 - SURFACE
      ?auto_2500263 - SURFACE
      ?auto_2500264 - SURFACE
      ?auto_2500265 - SURFACE
      ?auto_2500266 - SURFACE
      ?auto_2500267 - SURFACE
      ?auto_2500268 - SURFACE
    )
    :vars
    (
      ?auto_2500270 - HOIST
      ?auto_2500273 - PLACE
      ?auto_2500272 - TRUCK
      ?auto_2500271 - PLACE
      ?auto_2500269 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2500270 ?auto_2500273 ) ( SURFACE-AT ?auto_2500267 ?auto_2500273 ) ( CLEAR ?auto_2500267 ) ( IS-CRATE ?auto_2500268 ) ( not ( = ?auto_2500267 ?auto_2500268 ) ) ( AVAILABLE ?auto_2500270 ) ( ON ?auto_2500267 ?auto_2500266 ) ( not ( = ?auto_2500266 ?auto_2500267 ) ) ( not ( = ?auto_2500266 ?auto_2500268 ) ) ( TRUCK-AT ?auto_2500272 ?auto_2500271 ) ( not ( = ?auto_2500271 ?auto_2500273 ) ) ( HOIST-AT ?auto_2500269 ?auto_2500271 ) ( LIFTING ?auto_2500269 ?auto_2500268 ) ( not ( = ?auto_2500270 ?auto_2500269 ) ) ( ON ?auto_2500254 ?auto_2500253 ) ( ON ?auto_2500255 ?auto_2500254 ) ( ON ?auto_2500252 ?auto_2500255 ) ( ON ?auto_2500256 ?auto_2500252 ) ( ON ?auto_2500258 ?auto_2500256 ) ( ON ?auto_2500257 ?auto_2500258 ) ( ON ?auto_2500259 ?auto_2500257 ) ( ON ?auto_2500260 ?auto_2500259 ) ( ON ?auto_2500261 ?auto_2500260 ) ( ON ?auto_2500262 ?auto_2500261 ) ( ON ?auto_2500263 ?auto_2500262 ) ( ON ?auto_2500264 ?auto_2500263 ) ( ON ?auto_2500265 ?auto_2500264 ) ( ON ?auto_2500266 ?auto_2500265 ) ( not ( = ?auto_2500253 ?auto_2500254 ) ) ( not ( = ?auto_2500253 ?auto_2500255 ) ) ( not ( = ?auto_2500253 ?auto_2500252 ) ) ( not ( = ?auto_2500253 ?auto_2500256 ) ) ( not ( = ?auto_2500253 ?auto_2500258 ) ) ( not ( = ?auto_2500253 ?auto_2500257 ) ) ( not ( = ?auto_2500253 ?auto_2500259 ) ) ( not ( = ?auto_2500253 ?auto_2500260 ) ) ( not ( = ?auto_2500253 ?auto_2500261 ) ) ( not ( = ?auto_2500253 ?auto_2500262 ) ) ( not ( = ?auto_2500253 ?auto_2500263 ) ) ( not ( = ?auto_2500253 ?auto_2500264 ) ) ( not ( = ?auto_2500253 ?auto_2500265 ) ) ( not ( = ?auto_2500253 ?auto_2500266 ) ) ( not ( = ?auto_2500253 ?auto_2500267 ) ) ( not ( = ?auto_2500253 ?auto_2500268 ) ) ( not ( = ?auto_2500254 ?auto_2500255 ) ) ( not ( = ?auto_2500254 ?auto_2500252 ) ) ( not ( = ?auto_2500254 ?auto_2500256 ) ) ( not ( = ?auto_2500254 ?auto_2500258 ) ) ( not ( = ?auto_2500254 ?auto_2500257 ) ) ( not ( = ?auto_2500254 ?auto_2500259 ) ) ( not ( = ?auto_2500254 ?auto_2500260 ) ) ( not ( = ?auto_2500254 ?auto_2500261 ) ) ( not ( = ?auto_2500254 ?auto_2500262 ) ) ( not ( = ?auto_2500254 ?auto_2500263 ) ) ( not ( = ?auto_2500254 ?auto_2500264 ) ) ( not ( = ?auto_2500254 ?auto_2500265 ) ) ( not ( = ?auto_2500254 ?auto_2500266 ) ) ( not ( = ?auto_2500254 ?auto_2500267 ) ) ( not ( = ?auto_2500254 ?auto_2500268 ) ) ( not ( = ?auto_2500255 ?auto_2500252 ) ) ( not ( = ?auto_2500255 ?auto_2500256 ) ) ( not ( = ?auto_2500255 ?auto_2500258 ) ) ( not ( = ?auto_2500255 ?auto_2500257 ) ) ( not ( = ?auto_2500255 ?auto_2500259 ) ) ( not ( = ?auto_2500255 ?auto_2500260 ) ) ( not ( = ?auto_2500255 ?auto_2500261 ) ) ( not ( = ?auto_2500255 ?auto_2500262 ) ) ( not ( = ?auto_2500255 ?auto_2500263 ) ) ( not ( = ?auto_2500255 ?auto_2500264 ) ) ( not ( = ?auto_2500255 ?auto_2500265 ) ) ( not ( = ?auto_2500255 ?auto_2500266 ) ) ( not ( = ?auto_2500255 ?auto_2500267 ) ) ( not ( = ?auto_2500255 ?auto_2500268 ) ) ( not ( = ?auto_2500252 ?auto_2500256 ) ) ( not ( = ?auto_2500252 ?auto_2500258 ) ) ( not ( = ?auto_2500252 ?auto_2500257 ) ) ( not ( = ?auto_2500252 ?auto_2500259 ) ) ( not ( = ?auto_2500252 ?auto_2500260 ) ) ( not ( = ?auto_2500252 ?auto_2500261 ) ) ( not ( = ?auto_2500252 ?auto_2500262 ) ) ( not ( = ?auto_2500252 ?auto_2500263 ) ) ( not ( = ?auto_2500252 ?auto_2500264 ) ) ( not ( = ?auto_2500252 ?auto_2500265 ) ) ( not ( = ?auto_2500252 ?auto_2500266 ) ) ( not ( = ?auto_2500252 ?auto_2500267 ) ) ( not ( = ?auto_2500252 ?auto_2500268 ) ) ( not ( = ?auto_2500256 ?auto_2500258 ) ) ( not ( = ?auto_2500256 ?auto_2500257 ) ) ( not ( = ?auto_2500256 ?auto_2500259 ) ) ( not ( = ?auto_2500256 ?auto_2500260 ) ) ( not ( = ?auto_2500256 ?auto_2500261 ) ) ( not ( = ?auto_2500256 ?auto_2500262 ) ) ( not ( = ?auto_2500256 ?auto_2500263 ) ) ( not ( = ?auto_2500256 ?auto_2500264 ) ) ( not ( = ?auto_2500256 ?auto_2500265 ) ) ( not ( = ?auto_2500256 ?auto_2500266 ) ) ( not ( = ?auto_2500256 ?auto_2500267 ) ) ( not ( = ?auto_2500256 ?auto_2500268 ) ) ( not ( = ?auto_2500258 ?auto_2500257 ) ) ( not ( = ?auto_2500258 ?auto_2500259 ) ) ( not ( = ?auto_2500258 ?auto_2500260 ) ) ( not ( = ?auto_2500258 ?auto_2500261 ) ) ( not ( = ?auto_2500258 ?auto_2500262 ) ) ( not ( = ?auto_2500258 ?auto_2500263 ) ) ( not ( = ?auto_2500258 ?auto_2500264 ) ) ( not ( = ?auto_2500258 ?auto_2500265 ) ) ( not ( = ?auto_2500258 ?auto_2500266 ) ) ( not ( = ?auto_2500258 ?auto_2500267 ) ) ( not ( = ?auto_2500258 ?auto_2500268 ) ) ( not ( = ?auto_2500257 ?auto_2500259 ) ) ( not ( = ?auto_2500257 ?auto_2500260 ) ) ( not ( = ?auto_2500257 ?auto_2500261 ) ) ( not ( = ?auto_2500257 ?auto_2500262 ) ) ( not ( = ?auto_2500257 ?auto_2500263 ) ) ( not ( = ?auto_2500257 ?auto_2500264 ) ) ( not ( = ?auto_2500257 ?auto_2500265 ) ) ( not ( = ?auto_2500257 ?auto_2500266 ) ) ( not ( = ?auto_2500257 ?auto_2500267 ) ) ( not ( = ?auto_2500257 ?auto_2500268 ) ) ( not ( = ?auto_2500259 ?auto_2500260 ) ) ( not ( = ?auto_2500259 ?auto_2500261 ) ) ( not ( = ?auto_2500259 ?auto_2500262 ) ) ( not ( = ?auto_2500259 ?auto_2500263 ) ) ( not ( = ?auto_2500259 ?auto_2500264 ) ) ( not ( = ?auto_2500259 ?auto_2500265 ) ) ( not ( = ?auto_2500259 ?auto_2500266 ) ) ( not ( = ?auto_2500259 ?auto_2500267 ) ) ( not ( = ?auto_2500259 ?auto_2500268 ) ) ( not ( = ?auto_2500260 ?auto_2500261 ) ) ( not ( = ?auto_2500260 ?auto_2500262 ) ) ( not ( = ?auto_2500260 ?auto_2500263 ) ) ( not ( = ?auto_2500260 ?auto_2500264 ) ) ( not ( = ?auto_2500260 ?auto_2500265 ) ) ( not ( = ?auto_2500260 ?auto_2500266 ) ) ( not ( = ?auto_2500260 ?auto_2500267 ) ) ( not ( = ?auto_2500260 ?auto_2500268 ) ) ( not ( = ?auto_2500261 ?auto_2500262 ) ) ( not ( = ?auto_2500261 ?auto_2500263 ) ) ( not ( = ?auto_2500261 ?auto_2500264 ) ) ( not ( = ?auto_2500261 ?auto_2500265 ) ) ( not ( = ?auto_2500261 ?auto_2500266 ) ) ( not ( = ?auto_2500261 ?auto_2500267 ) ) ( not ( = ?auto_2500261 ?auto_2500268 ) ) ( not ( = ?auto_2500262 ?auto_2500263 ) ) ( not ( = ?auto_2500262 ?auto_2500264 ) ) ( not ( = ?auto_2500262 ?auto_2500265 ) ) ( not ( = ?auto_2500262 ?auto_2500266 ) ) ( not ( = ?auto_2500262 ?auto_2500267 ) ) ( not ( = ?auto_2500262 ?auto_2500268 ) ) ( not ( = ?auto_2500263 ?auto_2500264 ) ) ( not ( = ?auto_2500263 ?auto_2500265 ) ) ( not ( = ?auto_2500263 ?auto_2500266 ) ) ( not ( = ?auto_2500263 ?auto_2500267 ) ) ( not ( = ?auto_2500263 ?auto_2500268 ) ) ( not ( = ?auto_2500264 ?auto_2500265 ) ) ( not ( = ?auto_2500264 ?auto_2500266 ) ) ( not ( = ?auto_2500264 ?auto_2500267 ) ) ( not ( = ?auto_2500264 ?auto_2500268 ) ) ( not ( = ?auto_2500265 ?auto_2500266 ) ) ( not ( = ?auto_2500265 ?auto_2500267 ) ) ( not ( = ?auto_2500265 ?auto_2500268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2500266 ?auto_2500267 ?auto_2500268 )
      ( MAKE-16CRATE-VERIFY ?auto_2500253 ?auto_2500254 ?auto_2500255 ?auto_2500252 ?auto_2500256 ?auto_2500258 ?auto_2500257 ?auto_2500259 ?auto_2500260 ?auto_2500261 ?auto_2500262 ?auto_2500263 ?auto_2500264 ?auto_2500265 ?auto_2500266 ?auto_2500267 ?auto_2500268 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2500501 - SURFACE
      ?auto_2500502 - SURFACE
      ?auto_2500503 - SURFACE
      ?auto_2500500 - SURFACE
      ?auto_2500504 - SURFACE
      ?auto_2500506 - SURFACE
      ?auto_2500505 - SURFACE
      ?auto_2500507 - SURFACE
      ?auto_2500508 - SURFACE
      ?auto_2500509 - SURFACE
      ?auto_2500510 - SURFACE
      ?auto_2500511 - SURFACE
      ?auto_2500512 - SURFACE
      ?auto_2500513 - SURFACE
      ?auto_2500514 - SURFACE
      ?auto_2500515 - SURFACE
      ?auto_2500516 - SURFACE
    )
    :vars
    (
      ?auto_2500517 - HOIST
      ?auto_2500519 - PLACE
      ?auto_2500518 - TRUCK
      ?auto_2500520 - PLACE
      ?auto_2500522 - HOIST
      ?auto_2500521 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2500517 ?auto_2500519 ) ( SURFACE-AT ?auto_2500515 ?auto_2500519 ) ( CLEAR ?auto_2500515 ) ( IS-CRATE ?auto_2500516 ) ( not ( = ?auto_2500515 ?auto_2500516 ) ) ( AVAILABLE ?auto_2500517 ) ( ON ?auto_2500515 ?auto_2500514 ) ( not ( = ?auto_2500514 ?auto_2500515 ) ) ( not ( = ?auto_2500514 ?auto_2500516 ) ) ( TRUCK-AT ?auto_2500518 ?auto_2500520 ) ( not ( = ?auto_2500520 ?auto_2500519 ) ) ( HOIST-AT ?auto_2500522 ?auto_2500520 ) ( not ( = ?auto_2500517 ?auto_2500522 ) ) ( AVAILABLE ?auto_2500522 ) ( SURFACE-AT ?auto_2500516 ?auto_2500520 ) ( ON ?auto_2500516 ?auto_2500521 ) ( CLEAR ?auto_2500516 ) ( not ( = ?auto_2500515 ?auto_2500521 ) ) ( not ( = ?auto_2500516 ?auto_2500521 ) ) ( not ( = ?auto_2500514 ?auto_2500521 ) ) ( ON ?auto_2500502 ?auto_2500501 ) ( ON ?auto_2500503 ?auto_2500502 ) ( ON ?auto_2500500 ?auto_2500503 ) ( ON ?auto_2500504 ?auto_2500500 ) ( ON ?auto_2500506 ?auto_2500504 ) ( ON ?auto_2500505 ?auto_2500506 ) ( ON ?auto_2500507 ?auto_2500505 ) ( ON ?auto_2500508 ?auto_2500507 ) ( ON ?auto_2500509 ?auto_2500508 ) ( ON ?auto_2500510 ?auto_2500509 ) ( ON ?auto_2500511 ?auto_2500510 ) ( ON ?auto_2500512 ?auto_2500511 ) ( ON ?auto_2500513 ?auto_2500512 ) ( ON ?auto_2500514 ?auto_2500513 ) ( not ( = ?auto_2500501 ?auto_2500502 ) ) ( not ( = ?auto_2500501 ?auto_2500503 ) ) ( not ( = ?auto_2500501 ?auto_2500500 ) ) ( not ( = ?auto_2500501 ?auto_2500504 ) ) ( not ( = ?auto_2500501 ?auto_2500506 ) ) ( not ( = ?auto_2500501 ?auto_2500505 ) ) ( not ( = ?auto_2500501 ?auto_2500507 ) ) ( not ( = ?auto_2500501 ?auto_2500508 ) ) ( not ( = ?auto_2500501 ?auto_2500509 ) ) ( not ( = ?auto_2500501 ?auto_2500510 ) ) ( not ( = ?auto_2500501 ?auto_2500511 ) ) ( not ( = ?auto_2500501 ?auto_2500512 ) ) ( not ( = ?auto_2500501 ?auto_2500513 ) ) ( not ( = ?auto_2500501 ?auto_2500514 ) ) ( not ( = ?auto_2500501 ?auto_2500515 ) ) ( not ( = ?auto_2500501 ?auto_2500516 ) ) ( not ( = ?auto_2500501 ?auto_2500521 ) ) ( not ( = ?auto_2500502 ?auto_2500503 ) ) ( not ( = ?auto_2500502 ?auto_2500500 ) ) ( not ( = ?auto_2500502 ?auto_2500504 ) ) ( not ( = ?auto_2500502 ?auto_2500506 ) ) ( not ( = ?auto_2500502 ?auto_2500505 ) ) ( not ( = ?auto_2500502 ?auto_2500507 ) ) ( not ( = ?auto_2500502 ?auto_2500508 ) ) ( not ( = ?auto_2500502 ?auto_2500509 ) ) ( not ( = ?auto_2500502 ?auto_2500510 ) ) ( not ( = ?auto_2500502 ?auto_2500511 ) ) ( not ( = ?auto_2500502 ?auto_2500512 ) ) ( not ( = ?auto_2500502 ?auto_2500513 ) ) ( not ( = ?auto_2500502 ?auto_2500514 ) ) ( not ( = ?auto_2500502 ?auto_2500515 ) ) ( not ( = ?auto_2500502 ?auto_2500516 ) ) ( not ( = ?auto_2500502 ?auto_2500521 ) ) ( not ( = ?auto_2500503 ?auto_2500500 ) ) ( not ( = ?auto_2500503 ?auto_2500504 ) ) ( not ( = ?auto_2500503 ?auto_2500506 ) ) ( not ( = ?auto_2500503 ?auto_2500505 ) ) ( not ( = ?auto_2500503 ?auto_2500507 ) ) ( not ( = ?auto_2500503 ?auto_2500508 ) ) ( not ( = ?auto_2500503 ?auto_2500509 ) ) ( not ( = ?auto_2500503 ?auto_2500510 ) ) ( not ( = ?auto_2500503 ?auto_2500511 ) ) ( not ( = ?auto_2500503 ?auto_2500512 ) ) ( not ( = ?auto_2500503 ?auto_2500513 ) ) ( not ( = ?auto_2500503 ?auto_2500514 ) ) ( not ( = ?auto_2500503 ?auto_2500515 ) ) ( not ( = ?auto_2500503 ?auto_2500516 ) ) ( not ( = ?auto_2500503 ?auto_2500521 ) ) ( not ( = ?auto_2500500 ?auto_2500504 ) ) ( not ( = ?auto_2500500 ?auto_2500506 ) ) ( not ( = ?auto_2500500 ?auto_2500505 ) ) ( not ( = ?auto_2500500 ?auto_2500507 ) ) ( not ( = ?auto_2500500 ?auto_2500508 ) ) ( not ( = ?auto_2500500 ?auto_2500509 ) ) ( not ( = ?auto_2500500 ?auto_2500510 ) ) ( not ( = ?auto_2500500 ?auto_2500511 ) ) ( not ( = ?auto_2500500 ?auto_2500512 ) ) ( not ( = ?auto_2500500 ?auto_2500513 ) ) ( not ( = ?auto_2500500 ?auto_2500514 ) ) ( not ( = ?auto_2500500 ?auto_2500515 ) ) ( not ( = ?auto_2500500 ?auto_2500516 ) ) ( not ( = ?auto_2500500 ?auto_2500521 ) ) ( not ( = ?auto_2500504 ?auto_2500506 ) ) ( not ( = ?auto_2500504 ?auto_2500505 ) ) ( not ( = ?auto_2500504 ?auto_2500507 ) ) ( not ( = ?auto_2500504 ?auto_2500508 ) ) ( not ( = ?auto_2500504 ?auto_2500509 ) ) ( not ( = ?auto_2500504 ?auto_2500510 ) ) ( not ( = ?auto_2500504 ?auto_2500511 ) ) ( not ( = ?auto_2500504 ?auto_2500512 ) ) ( not ( = ?auto_2500504 ?auto_2500513 ) ) ( not ( = ?auto_2500504 ?auto_2500514 ) ) ( not ( = ?auto_2500504 ?auto_2500515 ) ) ( not ( = ?auto_2500504 ?auto_2500516 ) ) ( not ( = ?auto_2500504 ?auto_2500521 ) ) ( not ( = ?auto_2500506 ?auto_2500505 ) ) ( not ( = ?auto_2500506 ?auto_2500507 ) ) ( not ( = ?auto_2500506 ?auto_2500508 ) ) ( not ( = ?auto_2500506 ?auto_2500509 ) ) ( not ( = ?auto_2500506 ?auto_2500510 ) ) ( not ( = ?auto_2500506 ?auto_2500511 ) ) ( not ( = ?auto_2500506 ?auto_2500512 ) ) ( not ( = ?auto_2500506 ?auto_2500513 ) ) ( not ( = ?auto_2500506 ?auto_2500514 ) ) ( not ( = ?auto_2500506 ?auto_2500515 ) ) ( not ( = ?auto_2500506 ?auto_2500516 ) ) ( not ( = ?auto_2500506 ?auto_2500521 ) ) ( not ( = ?auto_2500505 ?auto_2500507 ) ) ( not ( = ?auto_2500505 ?auto_2500508 ) ) ( not ( = ?auto_2500505 ?auto_2500509 ) ) ( not ( = ?auto_2500505 ?auto_2500510 ) ) ( not ( = ?auto_2500505 ?auto_2500511 ) ) ( not ( = ?auto_2500505 ?auto_2500512 ) ) ( not ( = ?auto_2500505 ?auto_2500513 ) ) ( not ( = ?auto_2500505 ?auto_2500514 ) ) ( not ( = ?auto_2500505 ?auto_2500515 ) ) ( not ( = ?auto_2500505 ?auto_2500516 ) ) ( not ( = ?auto_2500505 ?auto_2500521 ) ) ( not ( = ?auto_2500507 ?auto_2500508 ) ) ( not ( = ?auto_2500507 ?auto_2500509 ) ) ( not ( = ?auto_2500507 ?auto_2500510 ) ) ( not ( = ?auto_2500507 ?auto_2500511 ) ) ( not ( = ?auto_2500507 ?auto_2500512 ) ) ( not ( = ?auto_2500507 ?auto_2500513 ) ) ( not ( = ?auto_2500507 ?auto_2500514 ) ) ( not ( = ?auto_2500507 ?auto_2500515 ) ) ( not ( = ?auto_2500507 ?auto_2500516 ) ) ( not ( = ?auto_2500507 ?auto_2500521 ) ) ( not ( = ?auto_2500508 ?auto_2500509 ) ) ( not ( = ?auto_2500508 ?auto_2500510 ) ) ( not ( = ?auto_2500508 ?auto_2500511 ) ) ( not ( = ?auto_2500508 ?auto_2500512 ) ) ( not ( = ?auto_2500508 ?auto_2500513 ) ) ( not ( = ?auto_2500508 ?auto_2500514 ) ) ( not ( = ?auto_2500508 ?auto_2500515 ) ) ( not ( = ?auto_2500508 ?auto_2500516 ) ) ( not ( = ?auto_2500508 ?auto_2500521 ) ) ( not ( = ?auto_2500509 ?auto_2500510 ) ) ( not ( = ?auto_2500509 ?auto_2500511 ) ) ( not ( = ?auto_2500509 ?auto_2500512 ) ) ( not ( = ?auto_2500509 ?auto_2500513 ) ) ( not ( = ?auto_2500509 ?auto_2500514 ) ) ( not ( = ?auto_2500509 ?auto_2500515 ) ) ( not ( = ?auto_2500509 ?auto_2500516 ) ) ( not ( = ?auto_2500509 ?auto_2500521 ) ) ( not ( = ?auto_2500510 ?auto_2500511 ) ) ( not ( = ?auto_2500510 ?auto_2500512 ) ) ( not ( = ?auto_2500510 ?auto_2500513 ) ) ( not ( = ?auto_2500510 ?auto_2500514 ) ) ( not ( = ?auto_2500510 ?auto_2500515 ) ) ( not ( = ?auto_2500510 ?auto_2500516 ) ) ( not ( = ?auto_2500510 ?auto_2500521 ) ) ( not ( = ?auto_2500511 ?auto_2500512 ) ) ( not ( = ?auto_2500511 ?auto_2500513 ) ) ( not ( = ?auto_2500511 ?auto_2500514 ) ) ( not ( = ?auto_2500511 ?auto_2500515 ) ) ( not ( = ?auto_2500511 ?auto_2500516 ) ) ( not ( = ?auto_2500511 ?auto_2500521 ) ) ( not ( = ?auto_2500512 ?auto_2500513 ) ) ( not ( = ?auto_2500512 ?auto_2500514 ) ) ( not ( = ?auto_2500512 ?auto_2500515 ) ) ( not ( = ?auto_2500512 ?auto_2500516 ) ) ( not ( = ?auto_2500512 ?auto_2500521 ) ) ( not ( = ?auto_2500513 ?auto_2500514 ) ) ( not ( = ?auto_2500513 ?auto_2500515 ) ) ( not ( = ?auto_2500513 ?auto_2500516 ) ) ( not ( = ?auto_2500513 ?auto_2500521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2500514 ?auto_2500515 ?auto_2500516 )
      ( MAKE-16CRATE-VERIFY ?auto_2500501 ?auto_2500502 ?auto_2500503 ?auto_2500500 ?auto_2500504 ?auto_2500506 ?auto_2500505 ?auto_2500507 ?auto_2500508 ?auto_2500509 ?auto_2500510 ?auto_2500511 ?auto_2500512 ?auto_2500513 ?auto_2500514 ?auto_2500515 ?auto_2500516 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2500750 - SURFACE
      ?auto_2500751 - SURFACE
      ?auto_2500752 - SURFACE
      ?auto_2500749 - SURFACE
      ?auto_2500753 - SURFACE
      ?auto_2500755 - SURFACE
      ?auto_2500754 - SURFACE
      ?auto_2500756 - SURFACE
      ?auto_2500757 - SURFACE
      ?auto_2500758 - SURFACE
      ?auto_2500759 - SURFACE
      ?auto_2500760 - SURFACE
      ?auto_2500761 - SURFACE
      ?auto_2500762 - SURFACE
      ?auto_2500763 - SURFACE
      ?auto_2500764 - SURFACE
      ?auto_2500765 - SURFACE
    )
    :vars
    (
      ?auto_2500771 - HOIST
      ?auto_2500767 - PLACE
      ?auto_2500769 - PLACE
      ?auto_2500768 - HOIST
      ?auto_2500766 - SURFACE
      ?auto_2500770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2500771 ?auto_2500767 ) ( SURFACE-AT ?auto_2500764 ?auto_2500767 ) ( CLEAR ?auto_2500764 ) ( IS-CRATE ?auto_2500765 ) ( not ( = ?auto_2500764 ?auto_2500765 ) ) ( AVAILABLE ?auto_2500771 ) ( ON ?auto_2500764 ?auto_2500763 ) ( not ( = ?auto_2500763 ?auto_2500764 ) ) ( not ( = ?auto_2500763 ?auto_2500765 ) ) ( not ( = ?auto_2500769 ?auto_2500767 ) ) ( HOIST-AT ?auto_2500768 ?auto_2500769 ) ( not ( = ?auto_2500771 ?auto_2500768 ) ) ( AVAILABLE ?auto_2500768 ) ( SURFACE-AT ?auto_2500765 ?auto_2500769 ) ( ON ?auto_2500765 ?auto_2500766 ) ( CLEAR ?auto_2500765 ) ( not ( = ?auto_2500764 ?auto_2500766 ) ) ( not ( = ?auto_2500765 ?auto_2500766 ) ) ( not ( = ?auto_2500763 ?auto_2500766 ) ) ( TRUCK-AT ?auto_2500770 ?auto_2500767 ) ( ON ?auto_2500751 ?auto_2500750 ) ( ON ?auto_2500752 ?auto_2500751 ) ( ON ?auto_2500749 ?auto_2500752 ) ( ON ?auto_2500753 ?auto_2500749 ) ( ON ?auto_2500755 ?auto_2500753 ) ( ON ?auto_2500754 ?auto_2500755 ) ( ON ?auto_2500756 ?auto_2500754 ) ( ON ?auto_2500757 ?auto_2500756 ) ( ON ?auto_2500758 ?auto_2500757 ) ( ON ?auto_2500759 ?auto_2500758 ) ( ON ?auto_2500760 ?auto_2500759 ) ( ON ?auto_2500761 ?auto_2500760 ) ( ON ?auto_2500762 ?auto_2500761 ) ( ON ?auto_2500763 ?auto_2500762 ) ( not ( = ?auto_2500750 ?auto_2500751 ) ) ( not ( = ?auto_2500750 ?auto_2500752 ) ) ( not ( = ?auto_2500750 ?auto_2500749 ) ) ( not ( = ?auto_2500750 ?auto_2500753 ) ) ( not ( = ?auto_2500750 ?auto_2500755 ) ) ( not ( = ?auto_2500750 ?auto_2500754 ) ) ( not ( = ?auto_2500750 ?auto_2500756 ) ) ( not ( = ?auto_2500750 ?auto_2500757 ) ) ( not ( = ?auto_2500750 ?auto_2500758 ) ) ( not ( = ?auto_2500750 ?auto_2500759 ) ) ( not ( = ?auto_2500750 ?auto_2500760 ) ) ( not ( = ?auto_2500750 ?auto_2500761 ) ) ( not ( = ?auto_2500750 ?auto_2500762 ) ) ( not ( = ?auto_2500750 ?auto_2500763 ) ) ( not ( = ?auto_2500750 ?auto_2500764 ) ) ( not ( = ?auto_2500750 ?auto_2500765 ) ) ( not ( = ?auto_2500750 ?auto_2500766 ) ) ( not ( = ?auto_2500751 ?auto_2500752 ) ) ( not ( = ?auto_2500751 ?auto_2500749 ) ) ( not ( = ?auto_2500751 ?auto_2500753 ) ) ( not ( = ?auto_2500751 ?auto_2500755 ) ) ( not ( = ?auto_2500751 ?auto_2500754 ) ) ( not ( = ?auto_2500751 ?auto_2500756 ) ) ( not ( = ?auto_2500751 ?auto_2500757 ) ) ( not ( = ?auto_2500751 ?auto_2500758 ) ) ( not ( = ?auto_2500751 ?auto_2500759 ) ) ( not ( = ?auto_2500751 ?auto_2500760 ) ) ( not ( = ?auto_2500751 ?auto_2500761 ) ) ( not ( = ?auto_2500751 ?auto_2500762 ) ) ( not ( = ?auto_2500751 ?auto_2500763 ) ) ( not ( = ?auto_2500751 ?auto_2500764 ) ) ( not ( = ?auto_2500751 ?auto_2500765 ) ) ( not ( = ?auto_2500751 ?auto_2500766 ) ) ( not ( = ?auto_2500752 ?auto_2500749 ) ) ( not ( = ?auto_2500752 ?auto_2500753 ) ) ( not ( = ?auto_2500752 ?auto_2500755 ) ) ( not ( = ?auto_2500752 ?auto_2500754 ) ) ( not ( = ?auto_2500752 ?auto_2500756 ) ) ( not ( = ?auto_2500752 ?auto_2500757 ) ) ( not ( = ?auto_2500752 ?auto_2500758 ) ) ( not ( = ?auto_2500752 ?auto_2500759 ) ) ( not ( = ?auto_2500752 ?auto_2500760 ) ) ( not ( = ?auto_2500752 ?auto_2500761 ) ) ( not ( = ?auto_2500752 ?auto_2500762 ) ) ( not ( = ?auto_2500752 ?auto_2500763 ) ) ( not ( = ?auto_2500752 ?auto_2500764 ) ) ( not ( = ?auto_2500752 ?auto_2500765 ) ) ( not ( = ?auto_2500752 ?auto_2500766 ) ) ( not ( = ?auto_2500749 ?auto_2500753 ) ) ( not ( = ?auto_2500749 ?auto_2500755 ) ) ( not ( = ?auto_2500749 ?auto_2500754 ) ) ( not ( = ?auto_2500749 ?auto_2500756 ) ) ( not ( = ?auto_2500749 ?auto_2500757 ) ) ( not ( = ?auto_2500749 ?auto_2500758 ) ) ( not ( = ?auto_2500749 ?auto_2500759 ) ) ( not ( = ?auto_2500749 ?auto_2500760 ) ) ( not ( = ?auto_2500749 ?auto_2500761 ) ) ( not ( = ?auto_2500749 ?auto_2500762 ) ) ( not ( = ?auto_2500749 ?auto_2500763 ) ) ( not ( = ?auto_2500749 ?auto_2500764 ) ) ( not ( = ?auto_2500749 ?auto_2500765 ) ) ( not ( = ?auto_2500749 ?auto_2500766 ) ) ( not ( = ?auto_2500753 ?auto_2500755 ) ) ( not ( = ?auto_2500753 ?auto_2500754 ) ) ( not ( = ?auto_2500753 ?auto_2500756 ) ) ( not ( = ?auto_2500753 ?auto_2500757 ) ) ( not ( = ?auto_2500753 ?auto_2500758 ) ) ( not ( = ?auto_2500753 ?auto_2500759 ) ) ( not ( = ?auto_2500753 ?auto_2500760 ) ) ( not ( = ?auto_2500753 ?auto_2500761 ) ) ( not ( = ?auto_2500753 ?auto_2500762 ) ) ( not ( = ?auto_2500753 ?auto_2500763 ) ) ( not ( = ?auto_2500753 ?auto_2500764 ) ) ( not ( = ?auto_2500753 ?auto_2500765 ) ) ( not ( = ?auto_2500753 ?auto_2500766 ) ) ( not ( = ?auto_2500755 ?auto_2500754 ) ) ( not ( = ?auto_2500755 ?auto_2500756 ) ) ( not ( = ?auto_2500755 ?auto_2500757 ) ) ( not ( = ?auto_2500755 ?auto_2500758 ) ) ( not ( = ?auto_2500755 ?auto_2500759 ) ) ( not ( = ?auto_2500755 ?auto_2500760 ) ) ( not ( = ?auto_2500755 ?auto_2500761 ) ) ( not ( = ?auto_2500755 ?auto_2500762 ) ) ( not ( = ?auto_2500755 ?auto_2500763 ) ) ( not ( = ?auto_2500755 ?auto_2500764 ) ) ( not ( = ?auto_2500755 ?auto_2500765 ) ) ( not ( = ?auto_2500755 ?auto_2500766 ) ) ( not ( = ?auto_2500754 ?auto_2500756 ) ) ( not ( = ?auto_2500754 ?auto_2500757 ) ) ( not ( = ?auto_2500754 ?auto_2500758 ) ) ( not ( = ?auto_2500754 ?auto_2500759 ) ) ( not ( = ?auto_2500754 ?auto_2500760 ) ) ( not ( = ?auto_2500754 ?auto_2500761 ) ) ( not ( = ?auto_2500754 ?auto_2500762 ) ) ( not ( = ?auto_2500754 ?auto_2500763 ) ) ( not ( = ?auto_2500754 ?auto_2500764 ) ) ( not ( = ?auto_2500754 ?auto_2500765 ) ) ( not ( = ?auto_2500754 ?auto_2500766 ) ) ( not ( = ?auto_2500756 ?auto_2500757 ) ) ( not ( = ?auto_2500756 ?auto_2500758 ) ) ( not ( = ?auto_2500756 ?auto_2500759 ) ) ( not ( = ?auto_2500756 ?auto_2500760 ) ) ( not ( = ?auto_2500756 ?auto_2500761 ) ) ( not ( = ?auto_2500756 ?auto_2500762 ) ) ( not ( = ?auto_2500756 ?auto_2500763 ) ) ( not ( = ?auto_2500756 ?auto_2500764 ) ) ( not ( = ?auto_2500756 ?auto_2500765 ) ) ( not ( = ?auto_2500756 ?auto_2500766 ) ) ( not ( = ?auto_2500757 ?auto_2500758 ) ) ( not ( = ?auto_2500757 ?auto_2500759 ) ) ( not ( = ?auto_2500757 ?auto_2500760 ) ) ( not ( = ?auto_2500757 ?auto_2500761 ) ) ( not ( = ?auto_2500757 ?auto_2500762 ) ) ( not ( = ?auto_2500757 ?auto_2500763 ) ) ( not ( = ?auto_2500757 ?auto_2500764 ) ) ( not ( = ?auto_2500757 ?auto_2500765 ) ) ( not ( = ?auto_2500757 ?auto_2500766 ) ) ( not ( = ?auto_2500758 ?auto_2500759 ) ) ( not ( = ?auto_2500758 ?auto_2500760 ) ) ( not ( = ?auto_2500758 ?auto_2500761 ) ) ( not ( = ?auto_2500758 ?auto_2500762 ) ) ( not ( = ?auto_2500758 ?auto_2500763 ) ) ( not ( = ?auto_2500758 ?auto_2500764 ) ) ( not ( = ?auto_2500758 ?auto_2500765 ) ) ( not ( = ?auto_2500758 ?auto_2500766 ) ) ( not ( = ?auto_2500759 ?auto_2500760 ) ) ( not ( = ?auto_2500759 ?auto_2500761 ) ) ( not ( = ?auto_2500759 ?auto_2500762 ) ) ( not ( = ?auto_2500759 ?auto_2500763 ) ) ( not ( = ?auto_2500759 ?auto_2500764 ) ) ( not ( = ?auto_2500759 ?auto_2500765 ) ) ( not ( = ?auto_2500759 ?auto_2500766 ) ) ( not ( = ?auto_2500760 ?auto_2500761 ) ) ( not ( = ?auto_2500760 ?auto_2500762 ) ) ( not ( = ?auto_2500760 ?auto_2500763 ) ) ( not ( = ?auto_2500760 ?auto_2500764 ) ) ( not ( = ?auto_2500760 ?auto_2500765 ) ) ( not ( = ?auto_2500760 ?auto_2500766 ) ) ( not ( = ?auto_2500761 ?auto_2500762 ) ) ( not ( = ?auto_2500761 ?auto_2500763 ) ) ( not ( = ?auto_2500761 ?auto_2500764 ) ) ( not ( = ?auto_2500761 ?auto_2500765 ) ) ( not ( = ?auto_2500761 ?auto_2500766 ) ) ( not ( = ?auto_2500762 ?auto_2500763 ) ) ( not ( = ?auto_2500762 ?auto_2500764 ) ) ( not ( = ?auto_2500762 ?auto_2500765 ) ) ( not ( = ?auto_2500762 ?auto_2500766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2500763 ?auto_2500764 ?auto_2500765 )
      ( MAKE-16CRATE-VERIFY ?auto_2500750 ?auto_2500751 ?auto_2500752 ?auto_2500749 ?auto_2500753 ?auto_2500755 ?auto_2500754 ?auto_2500756 ?auto_2500757 ?auto_2500758 ?auto_2500759 ?auto_2500760 ?auto_2500761 ?auto_2500762 ?auto_2500763 ?auto_2500764 ?auto_2500765 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2500999 - SURFACE
      ?auto_2501000 - SURFACE
      ?auto_2501001 - SURFACE
      ?auto_2500998 - SURFACE
      ?auto_2501002 - SURFACE
      ?auto_2501004 - SURFACE
      ?auto_2501003 - SURFACE
      ?auto_2501005 - SURFACE
      ?auto_2501006 - SURFACE
      ?auto_2501007 - SURFACE
      ?auto_2501008 - SURFACE
      ?auto_2501009 - SURFACE
      ?auto_2501010 - SURFACE
      ?auto_2501011 - SURFACE
      ?auto_2501012 - SURFACE
      ?auto_2501013 - SURFACE
      ?auto_2501014 - SURFACE
    )
    :vars
    (
      ?auto_2501017 - HOIST
      ?auto_2501020 - PLACE
      ?auto_2501019 - PLACE
      ?auto_2501018 - HOIST
      ?auto_2501015 - SURFACE
      ?auto_2501016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2501017 ?auto_2501020 ) ( IS-CRATE ?auto_2501014 ) ( not ( = ?auto_2501013 ?auto_2501014 ) ) ( not ( = ?auto_2501012 ?auto_2501013 ) ) ( not ( = ?auto_2501012 ?auto_2501014 ) ) ( not ( = ?auto_2501019 ?auto_2501020 ) ) ( HOIST-AT ?auto_2501018 ?auto_2501019 ) ( not ( = ?auto_2501017 ?auto_2501018 ) ) ( AVAILABLE ?auto_2501018 ) ( SURFACE-AT ?auto_2501014 ?auto_2501019 ) ( ON ?auto_2501014 ?auto_2501015 ) ( CLEAR ?auto_2501014 ) ( not ( = ?auto_2501013 ?auto_2501015 ) ) ( not ( = ?auto_2501014 ?auto_2501015 ) ) ( not ( = ?auto_2501012 ?auto_2501015 ) ) ( TRUCK-AT ?auto_2501016 ?auto_2501020 ) ( SURFACE-AT ?auto_2501012 ?auto_2501020 ) ( CLEAR ?auto_2501012 ) ( LIFTING ?auto_2501017 ?auto_2501013 ) ( IS-CRATE ?auto_2501013 ) ( ON ?auto_2501000 ?auto_2500999 ) ( ON ?auto_2501001 ?auto_2501000 ) ( ON ?auto_2500998 ?auto_2501001 ) ( ON ?auto_2501002 ?auto_2500998 ) ( ON ?auto_2501004 ?auto_2501002 ) ( ON ?auto_2501003 ?auto_2501004 ) ( ON ?auto_2501005 ?auto_2501003 ) ( ON ?auto_2501006 ?auto_2501005 ) ( ON ?auto_2501007 ?auto_2501006 ) ( ON ?auto_2501008 ?auto_2501007 ) ( ON ?auto_2501009 ?auto_2501008 ) ( ON ?auto_2501010 ?auto_2501009 ) ( ON ?auto_2501011 ?auto_2501010 ) ( ON ?auto_2501012 ?auto_2501011 ) ( not ( = ?auto_2500999 ?auto_2501000 ) ) ( not ( = ?auto_2500999 ?auto_2501001 ) ) ( not ( = ?auto_2500999 ?auto_2500998 ) ) ( not ( = ?auto_2500999 ?auto_2501002 ) ) ( not ( = ?auto_2500999 ?auto_2501004 ) ) ( not ( = ?auto_2500999 ?auto_2501003 ) ) ( not ( = ?auto_2500999 ?auto_2501005 ) ) ( not ( = ?auto_2500999 ?auto_2501006 ) ) ( not ( = ?auto_2500999 ?auto_2501007 ) ) ( not ( = ?auto_2500999 ?auto_2501008 ) ) ( not ( = ?auto_2500999 ?auto_2501009 ) ) ( not ( = ?auto_2500999 ?auto_2501010 ) ) ( not ( = ?auto_2500999 ?auto_2501011 ) ) ( not ( = ?auto_2500999 ?auto_2501012 ) ) ( not ( = ?auto_2500999 ?auto_2501013 ) ) ( not ( = ?auto_2500999 ?auto_2501014 ) ) ( not ( = ?auto_2500999 ?auto_2501015 ) ) ( not ( = ?auto_2501000 ?auto_2501001 ) ) ( not ( = ?auto_2501000 ?auto_2500998 ) ) ( not ( = ?auto_2501000 ?auto_2501002 ) ) ( not ( = ?auto_2501000 ?auto_2501004 ) ) ( not ( = ?auto_2501000 ?auto_2501003 ) ) ( not ( = ?auto_2501000 ?auto_2501005 ) ) ( not ( = ?auto_2501000 ?auto_2501006 ) ) ( not ( = ?auto_2501000 ?auto_2501007 ) ) ( not ( = ?auto_2501000 ?auto_2501008 ) ) ( not ( = ?auto_2501000 ?auto_2501009 ) ) ( not ( = ?auto_2501000 ?auto_2501010 ) ) ( not ( = ?auto_2501000 ?auto_2501011 ) ) ( not ( = ?auto_2501000 ?auto_2501012 ) ) ( not ( = ?auto_2501000 ?auto_2501013 ) ) ( not ( = ?auto_2501000 ?auto_2501014 ) ) ( not ( = ?auto_2501000 ?auto_2501015 ) ) ( not ( = ?auto_2501001 ?auto_2500998 ) ) ( not ( = ?auto_2501001 ?auto_2501002 ) ) ( not ( = ?auto_2501001 ?auto_2501004 ) ) ( not ( = ?auto_2501001 ?auto_2501003 ) ) ( not ( = ?auto_2501001 ?auto_2501005 ) ) ( not ( = ?auto_2501001 ?auto_2501006 ) ) ( not ( = ?auto_2501001 ?auto_2501007 ) ) ( not ( = ?auto_2501001 ?auto_2501008 ) ) ( not ( = ?auto_2501001 ?auto_2501009 ) ) ( not ( = ?auto_2501001 ?auto_2501010 ) ) ( not ( = ?auto_2501001 ?auto_2501011 ) ) ( not ( = ?auto_2501001 ?auto_2501012 ) ) ( not ( = ?auto_2501001 ?auto_2501013 ) ) ( not ( = ?auto_2501001 ?auto_2501014 ) ) ( not ( = ?auto_2501001 ?auto_2501015 ) ) ( not ( = ?auto_2500998 ?auto_2501002 ) ) ( not ( = ?auto_2500998 ?auto_2501004 ) ) ( not ( = ?auto_2500998 ?auto_2501003 ) ) ( not ( = ?auto_2500998 ?auto_2501005 ) ) ( not ( = ?auto_2500998 ?auto_2501006 ) ) ( not ( = ?auto_2500998 ?auto_2501007 ) ) ( not ( = ?auto_2500998 ?auto_2501008 ) ) ( not ( = ?auto_2500998 ?auto_2501009 ) ) ( not ( = ?auto_2500998 ?auto_2501010 ) ) ( not ( = ?auto_2500998 ?auto_2501011 ) ) ( not ( = ?auto_2500998 ?auto_2501012 ) ) ( not ( = ?auto_2500998 ?auto_2501013 ) ) ( not ( = ?auto_2500998 ?auto_2501014 ) ) ( not ( = ?auto_2500998 ?auto_2501015 ) ) ( not ( = ?auto_2501002 ?auto_2501004 ) ) ( not ( = ?auto_2501002 ?auto_2501003 ) ) ( not ( = ?auto_2501002 ?auto_2501005 ) ) ( not ( = ?auto_2501002 ?auto_2501006 ) ) ( not ( = ?auto_2501002 ?auto_2501007 ) ) ( not ( = ?auto_2501002 ?auto_2501008 ) ) ( not ( = ?auto_2501002 ?auto_2501009 ) ) ( not ( = ?auto_2501002 ?auto_2501010 ) ) ( not ( = ?auto_2501002 ?auto_2501011 ) ) ( not ( = ?auto_2501002 ?auto_2501012 ) ) ( not ( = ?auto_2501002 ?auto_2501013 ) ) ( not ( = ?auto_2501002 ?auto_2501014 ) ) ( not ( = ?auto_2501002 ?auto_2501015 ) ) ( not ( = ?auto_2501004 ?auto_2501003 ) ) ( not ( = ?auto_2501004 ?auto_2501005 ) ) ( not ( = ?auto_2501004 ?auto_2501006 ) ) ( not ( = ?auto_2501004 ?auto_2501007 ) ) ( not ( = ?auto_2501004 ?auto_2501008 ) ) ( not ( = ?auto_2501004 ?auto_2501009 ) ) ( not ( = ?auto_2501004 ?auto_2501010 ) ) ( not ( = ?auto_2501004 ?auto_2501011 ) ) ( not ( = ?auto_2501004 ?auto_2501012 ) ) ( not ( = ?auto_2501004 ?auto_2501013 ) ) ( not ( = ?auto_2501004 ?auto_2501014 ) ) ( not ( = ?auto_2501004 ?auto_2501015 ) ) ( not ( = ?auto_2501003 ?auto_2501005 ) ) ( not ( = ?auto_2501003 ?auto_2501006 ) ) ( not ( = ?auto_2501003 ?auto_2501007 ) ) ( not ( = ?auto_2501003 ?auto_2501008 ) ) ( not ( = ?auto_2501003 ?auto_2501009 ) ) ( not ( = ?auto_2501003 ?auto_2501010 ) ) ( not ( = ?auto_2501003 ?auto_2501011 ) ) ( not ( = ?auto_2501003 ?auto_2501012 ) ) ( not ( = ?auto_2501003 ?auto_2501013 ) ) ( not ( = ?auto_2501003 ?auto_2501014 ) ) ( not ( = ?auto_2501003 ?auto_2501015 ) ) ( not ( = ?auto_2501005 ?auto_2501006 ) ) ( not ( = ?auto_2501005 ?auto_2501007 ) ) ( not ( = ?auto_2501005 ?auto_2501008 ) ) ( not ( = ?auto_2501005 ?auto_2501009 ) ) ( not ( = ?auto_2501005 ?auto_2501010 ) ) ( not ( = ?auto_2501005 ?auto_2501011 ) ) ( not ( = ?auto_2501005 ?auto_2501012 ) ) ( not ( = ?auto_2501005 ?auto_2501013 ) ) ( not ( = ?auto_2501005 ?auto_2501014 ) ) ( not ( = ?auto_2501005 ?auto_2501015 ) ) ( not ( = ?auto_2501006 ?auto_2501007 ) ) ( not ( = ?auto_2501006 ?auto_2501008 ) ) ( not ( = ?auto_2501006 ?auto_2501009 ) ) ( not ( = ?auto_2501006 ?auto_2501010 ) ) ( not ( = ?auto_2501006 ?auto_2501011 ) ) ( not ( = ?auto_2501006 ?auto_2501012 ) ) ( not ( = ?auto_2501006 ?auto_2501013 ) ) ( not ( = ?auto_2501006 ?auto_2501014 ) ) ( not ( = ?auto_2501006 ?auto_2501015 ) ) ( not ( = ?auto_2501007 ?auto_2501008 ) ) ( not ( = ?auto_2501007 ?auto_2501009 ) ) ( not ( = ?auto_2501007 ?auto_2501010 ) ) ( not ( = ?auto_2501007 ?auto_2501011 ) ) ( not ( = ?auto_2501007 ?auto_2501012 ) ) ( not ( = ?auto_2501007 ?auto_2501013 ) ) ( not ( = ?auto_2501007 ?auto_2501014 ) ) ( not ( = ?auto_2501007 ?auto_2501015 ) ) ( not ( = ?auto_2501008 ?auto_2501009 ) ) ( not ( = ?auto_2501008 ?auto_2501010 ) ) ( not ( = ?auto_2501008 ?auto_2501011 ) ) ( not ( = ?auto_2501008 ?auto_2501012 ) ) ( not ( = ?auto_2501008 ?auto_2501013 ) ) ( not ( = ?auto_2501008 ?auto_2501014 ) ) ( not ( = ?auto_2501008 ?auto_2501015 ) ) ( not ( = ?auto_2501009 ?auto_2501010 ) ) ( not ( = ?auto_2501009 ?auto_2501011 ) ) ( not ( = ?auto_2501009 ?auto_2501012 ) ) ( not ( = ?auto_2501009 ?auto_2501013 ) ) ( not ( = ?auto_2501009 ?auto_2501014 ) ) ( not ( = ?auto_2501009 ?auto_2501015 ) ) ( not ( = ?auto_2501010 ?auto_2501011 ) ) ( not ( = ?auto_2501010 ?auto_2501012 ) ) ( not ( = ?auto_2501010 ?auto_2501013 ) ) ( not ( = ?auto_2501010 ?auto_2501014 ) ) ( not ( = ?auto_2501010 ?auto_2501015 ) ) ( not ( = ?auto_2501011 ?auto_2501012 ) ) ( not ( = ?auto_2501011 ?auto_2501013 ) ) ( not ( = ?auto_2501011 ?auto_2501014 ) ) ( not ( = ?auto_2501011 ?auto_2501015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2501012 ?auto_2501013 ?auto_2501014 )
      ( MAKE-16CRATE-VERIFY ?auto_2500999 ?auto_2501000 ?auto_2501001 ?auto_2500998 ?auto_2501002 ?auto_2501004 ?auto_2501003 ?auto_2501005 ?auto_2501006 ?auto_2501007 ?auto_2501008 ?auto_2501009 ?auto_2501010 ?auto_2501011 ?auto_2501012 ?auto_2501013 ?auto_2501014 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2501248 - SURFACE
      ?auto_2501249 - SURFACE
      ?auto_2501250 - SURFACE
      ?auto_2501247 - SURFACE
      ?auto_2501251 - SURFACE
      ?auto_2501253 - SURFACE
      ?auto_2501252 - SURFACE
      ?auto_2501254 - SURFACE
      ?auto_2501255 - SURFACE
      ?auto_2501256 - SURFACE
      ?auto_2501257 - SURFACE
      ?auto_2501258 - SURFACE
      ?auto_2501259 - SURFACE
      ?auto_2501260 - SURFACE
      ?auto_2501261 - SURFACE
      ?auto_2501262 - SURFACE
      ?auto_2501263 - SURFACE
    )
    :vars
    (
      ?auto_2501269 - HOIST
      ?auto_2501265 - PLACE
      ?auto_2501267 - PLACE
      ?auto_2501268 - HOIST
      ?auto_2501264 - SURFACE
      ?auto_2501266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2501269 ?auto_2501265 ) ( IS-CRATE ?auto_2501263 ) ( not ( = ?auto_2501262 ?auto_2501263 ) ) ( not ( = ?auto_2501261 ?auto_2501262 ) ) ( not ( = ?auto_2501261 ?auto_2501263 ) ) ( not ( = ?auto_2501267 ?auto_2501265 ) ) ( HOIST-AT ?auto_2501268 ?auto_2501267 ) ( not ( = ?auto_2501269 ?auto_2501268 ) ) ( AVAILABLE ?auto_2501268 ) ( SURFACE-AT ?auto_2501263 ?auto_2501267 ) ( ON ?auto_2501263 ?auto_2501264 ) ( CLEAR ?auto_2501263 ) ( not ( = ?auto_2501262 ?auto_2501264 ) ) ( not ( = ?auto_2501263 ?auto_2501264 ) ) ( not ( = ?auto_2501261 ?auto_2501264 ) ) ( TRUCK-AT ?auto_2501266 ?auto_2501265 ) ( SURFACE-AT ?auto_2501261 ?auto_2501265 ) ( CLEAR ?auto_2501261 ) ( IS-CRATE ?auto_2501262 ) ( AVAILABLE ?auto_2501269 ) ( IN ?auto_2501262 ?auto_2501266 ) ( ON ?auto_2501249 ?auto_2501248 ) ( ON ?auto_2501250 ?auto_2501249 ) ( ON ?auto_2501247 ?auto_2501250 ) ( ON ?auto_2501251 ?auto_2501247 ) ( ON ?auto_2501253 ?auto_2501251 ) ( ON ?auto_2501252 ?auto_2501253 ) ( ON ?auto_2501254 ?auto_2501252 ) ( ON ?auto_2501255 ?auto_2501254 ) ( ON ?auto_2501256 ?auto_2501255 ) ( ON ?auto_2501257 ?auto_2501256 ) ( ON ?auto_2501258 ?auto_2501257 ) ( ON ?auto_2501259 ?auto_2501258 ) ( ON ?auto_2501260 ?auto_2501259 ) ( ON ?auto_2501261 ?auto_2501260 ) ( not ( = ?auto_2501248 ?auto_2501249 ) ) ( not ( = ?auto_2501248 ?auto_2501250 ) ) ( not ( = ?auto_2501248 ?auto_2501247 ) ) ( not ( = ?auto_2501248 ?auto_2501251 ) ) ( not ( = ?auto_2501248 ?auto_2501253 ) ) ( not ( = ?auto_2501248 ?auto_2501252 ) ) ( not ( = ?auto_2501248 ?auto_2501254 ) ) ( not ( = ?auto_2501248 ?auto_2501255 ) ) ( not ( = ?auto_2501248 ?auto_2501256 ) ) ( not ( = ?auto_2501248 ?auto_2501257 ) ) ( not ( = ?auto_2501248 ?auto_2501258 ) ) ( not ( = ?auto_2501248 ?auto_2501259 ) ) ( not ( = ?auto_2501248 ?auto_2501260 ) ) ( not ( = ?auto_2501248 ?auto_2501261 ) ) ( not ( = ?auto_2501248 ?auto_2501262 ) ) ( not ( = ?auto_2501248 ?auto_2501263 ) ) ( not ( = ?auto_2501248 ?auto_2501264 ) ) ( not ( = ?auto_2501249 ?auto_2501250 ) ) ( not ( = ?auto_2501249 ?auto_2501247 ) ) ( not ( = ?auto_2501249 ?auto_2501251 ) ) ( not ( = ?auto_2501249 ?auto_2501253 ) ) ( not ( = ?auto_2501249 ?auto_2501252 ) ) ( not ( = ?auto_2501249 ?auto_2501254 ) ) ( not ( = ?auto_2501249 ?auto_2501255 ) ) ( not ( = ?auto_2501249 ?auto_2501256 ) ) ( not ( = ?auto_2501249 ?auto_2501257 ) ) ( not ( = ?auto_2501249 ?auto_2501258 ) ) ( not ( = ?auto_2501249 ?auto_2501259 ) ) ( not ( = ?auto_2501249 ?auto_2501260 ) ) ( not ( = ?auto_2501249 ?auto_2501261 ) ) ( not ( = ?auto_2501249 ?auto_2501262 ) ) ( not ( = ?auto_2501249 ?auto_2501263 ) ) ( not ( = ?auto_2501249 ?auto_2501264 ) ) ( not ( = ?auto_2501250 ?auto_2501247 ) ) ( not ( = ?auto_2501250 ?auto_2501251 ) ) ( not ( = ?auto_2501250 ?auto_2501253 ) ) ( not ( = ?auto_2501250 ?auto_2501252 ) ) ( not ( = ?auto_2501250 ?auto_2501254 ) ) ( not ( = ?auto_2501250 ?auto_2501255 ) ) ( not ( = ?auto_2501250 ?auto_2501256 ) ) ( not ( = ?auto_2501250 ?auto_2501257 ) ) ( not ( = ?auto_2501250 ?auto_2501258 ) ) ( not ( = ?auto_2501250 ?auto_2501259 ) ) ( not ( = ?auto_2501250 ?auto_2501260 ) ) ( not ( = ?auto_2501250 ?auto_2501261 ) ) ( not ( = ?auto_2501250 ?auto_2501262 ) ) ( not ( = ?auto_2501250 ?auto_2501263 ) ) ( not ( = ?auto_2501250 ?auto_2501264 ) ) ( not ( = ?auto_2501247 ?auto_2501251 ) ) ( not ( = ?auto_2501247 ?auto_2501253 ) ) ( not ( = ?auto_2501247 ?auto_2501252 ) ) ( not ( = ?auto_2501247 ?auto_2501254 ) ) ( not ( = ?auto_2501247 ?auto_2501255 ) ) ( not ( = ?auto_2501247 ?auto_2501256 ) ) ( not ( = ?auto_2501247 ?auto_2501257 ) ) ( not ( = ?auto_2501247 ?auto_2501258 ) ) ( not ( = ?auto_2501247 ?auto_2501259 ) ) ( not ( = ?auto_2501247 ?auto_2501260 ) ) ( not ( = ?auto_2501247 ?auto_2501261 ) ) ( not ( = ?auto_2501247 ?auto_2501262 ) ) ( not ( = ?auto_2501247 ?auto_2501263 ) ) ( not ( = ?auto_2501247 ?auto_2501264 ) ) ( not ( = ?auto_2501251 ?auto_2501253 ) ) ( not ( = ?auto_2501251 ?auto_2501252 ) ) ( not ( = ?auto_2501251 ?auto_2501254 ) ) ( not ( = ?auto_2501251 ?auto_2501255 ) ) ( not ( = ?auto_2501251 ?auto_2501256 ) ) ( not ( = ?auto_2501251 ?auto_2501257 ) ) ( not ( = ?auto_2501251 ?auto_2501258 ) ) ( not ( = ?auto_2501251 ?auto_2501259 ) ) ( not ( = ?auto_2501251 ?auto_2501260 ) ) ( not ( = ?auto_2501251 ?auto_2501261 ) ) ( not ( = ?auto_2501251 ?auto_2501262 ) ) ( not ( = ?auto_2501251 ?auto_2501263 ) ) ( not ( = ?auto_2501251 ?auto_2501264 ) ) ( not ( = ?auto_2501253 ?auto_2501252 ) ) ( not ( = ?auto_2501253 ?auto_2501254 ) ) ( not ( = ?auto_2501253 ?auto_2501255 ) ) ( not ( = ?auto_2501253 ?auto_2501256 ) ) ( not ( = ?auto_2501253 ?auto_2501257 ) ) ( not ( = ?auto_2501253 ?auto_2501258 ) ) ( not ( = ?auto_2501253 ?auto_2501259 ) ) ( not ( = ?auto_2501253 ?auto_2501260 ) ) ( not ( = ?auto_2501253 ?auto_2501261 ) ) ( not ( = ?auto_2501253 ?auto_2501262 ) ) ( not ( = ?auto_2501253 ?auto_2501263 ) ) ( not ( = ?auto_2501253 ?auto_2501264 ) ) ( not ( = ?auto_2501252 ?auto_2501254 ) ) ( not ( = ?auto_2501252 ?auto_2501255 ) ) ( not ( = ?auto_2501252 ?auto_2501256 ) ) ( not ( = ?auto_2501252 ?auto_2501257 ) ) ( not ( = ?auto_2501252 ?auto_2501258 ) ) ( not ( = ?auto_2501252 ?auto_2501259 ) ) ( not ( = ?auto_2501252 ?auto_2501260 ) ) ( not ( = ?auto_2501252 ?auto_2501261 ) ) ( not ( = ?auto_2501252 ?auto_2501262 ) ) ( not ( = ?auto_2501252 ?auto_2501263 ) ) ( not ( = ?auto_2501252 ?auto_2501264 ) ) ( not ( = ?auto_2501254 ?auto_2501255 ) ) ( not ( = ?auto_2501254 ?auto_2501256 ) ) ( not ( = ?auto_2501254 ?auto_2501257 ) ) ( not ( = ?auto_2501254 ?auto_2501258 ) ) ( not ( = ?auto_2501254 ?auto_2501259 ) ) ( not ( = ?auto_2501254 ?auto_2501260 ) ) ( not ( = ?auto_2501254 ?auto_2501261 ) ) ( not ( = ?auto_2501254 ?auto_2501262 ) ) ( not ( = ?auto_2501254 ?auto_2501263 ) ) ( not ( = ?auto_2501254 ?auto_2501264 ) ) ( not ( = ?auto_2501255 ?auto_2501256 ) ) ( not ( = ?auto_2501255 ?auto_2501257 ) ) ( not ( = ?auto_2501255 ?auto_2501258 ) ) ( not ( = ?auto_2501255 ?auto_2501259 ) ) ( not ( = ?auto_2501255 ?auto_2501260 ) ) ( not ( = ?auto_2501255 ?auto_2501261 ) ) ( not ( = ?auto_2501255 ?auto_2501262 ) ) ( not ( = ?auto_2501255 ?auto_2501263 ) ) ( not ( = ?auto_2501255 ?auto_2501264 ) ) ( not ( = ?auto_2501256 ?auto_2501257 ) ) ( not ( = ?auto_2501256 ?auto_2501258 ) ) ( not ( = ?auto_2501256 ?auto_2501259 ) ) ( not ( = ?auto_2501256 ?auto_2501260 ) ) ( not ( = ?auto_2501256 ?auto_2501261 ) ) ( not ( = ?auto_2501256 ?auto_2501262 ) ) ( not ( = ?auto_2501256 ?auto_2501263 ) ) ( not ( = ?auto_2501256 ?auto_2501264 ) ) ( not ( = ?auto_2501257 ?auto_2501258 ) ) ( not ( = ?auto_2501257 ?auto_2501259 ) ) ( not ( = ?auto_2501257 ?auto_2501260 ) ) ( not ( = ?auto_2501257 ?auto_2501261 ) ) ( not ( = ?auto_2501257 ?auto_2501262 ) ) ( not ( = ?auto_2501257 ?auto_2501263 ) ) ( not ( = ?auto_2501257 ?auto_2501264 ) ) ( not ( = ?auto_2501258 ?auto_2501259 ) ) ( not ( = ?auto_2501258 ?auto_2501260 ) ) ( not ( = ?auto_2501258 ?auto_2501261 ) ) ( not ( = ?auto_2501258 ?auto_2501262 ) ) ( not ( = ?auto_2501258 ?auto_2501263 ) ) ( not ( = ?auto_2501258 ?auto_2501264 ) ) ( not ( = ?auto_2501259 ?auto_2501260 ) ) ( not ( = ?auto_2501259 ?auto_2501261 ) ) ( not ( = ?auto_2501259 ?auto_2501262 ) ) ( not ( = ?auto_2501259 ?auto_2501263 ) ) ( not ( = ?auto_2501259 ?auto_2501264 ) ) ( not ( = ?auto_2501260 ?auto_2501261 ) ) ( not ( = ?auto_2501260 ?auto_2501262 ) ) ( not ( = ?auto_2501260 ?auto_2501263 ) ) ( not ( = ?auto_2501260 ?auto_2501264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2501261 ?auto_2501262 ?auto_2501263 )
      ( MAKE-16CRATE-VERIFY ?auto_2501248 ?auto_2501249 ?auto_2501250 ?auto_2501247 ?auto_2501251 ?auto_2501253 ?auto_2501252 ?auto_2501254 ?auto_2501255 ?auto_2501256 ?auto_2501257 ?auto_2501258 ?auto_2501259 ?auto_2501260 ?auto_2501261 ?auto_2501262 ?auto_2501263 ) )
  )

)

