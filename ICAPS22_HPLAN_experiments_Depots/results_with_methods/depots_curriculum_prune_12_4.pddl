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
      ?auto_3732 - SURFACE
      ?auto_3733 - SURFACE
    )
    :vars
    (
      ?auto_3734 - HOIST
      ?auto_3735 - PLACE
      ?auto_3737 - PLACE
      ?auto_3738 - HOIST
      ?auto_3739 - SURFACE
      ?auto_3736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3734 ?auto_3735 ) ( SURFACE-AT ?auto_3733 ?auto_3735 ) ( CLEAR ?auto_3733 ) ( IS-CRATE ?auto_3732 ) ( AVAILABLE ?auto_3734 ) ( not ( = ?auto_3737 ?auto_3735 ) ) ( HOIST-AT ?auto_3738 ?auto_3737 ) ( AVAILABLE ?auto_3738 ) ( SURFACE-AT ?auto_3732 ?auto_3737 ) ( ON ?auto_3732 ?auto_3739 ) ( CLEAR ?auto_3732 ) ( TRUCK-AT ?auto_3736 ?auto_3735 ) ( not ( = ?auto_3732 ?auto_3733 ) ) ( not ( = ?auto_3732 ?auto_3739 ) ) ( not ( = ?auto_3733 ?auto_3739 ) ) ( not ( = ?auto_3734 ?auto_3738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3736 ?auto_3735 ?auto_3737 )
      ( !LIFT ?auto_3738 ?auto_3732 ?auto_3739 ?auto_3737 )
      ( !LOAD ?auto_3738 ?auto_3732 ?auto_3736 ?auto_3737 )
      ( !DRIVE ?auto_3736 ?auto_3737 ?auto_3735 )
      ( !UNLOAD ?auto_3734 ?auto_3732 ?auto_3736 ?auto_3735 )
      ( !DROP ?auto_3734 ?auto_3732 ?auto_3733 ?auto_3735 )
      ( MAKE-ON-VERIFY ?auto_3732 ?auto_3733 ) )
  )

)

