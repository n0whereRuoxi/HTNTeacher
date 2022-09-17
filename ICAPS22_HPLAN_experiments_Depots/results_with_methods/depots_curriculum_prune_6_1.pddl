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

)

