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
      ?auto_652 - SURFACE
      ?auto_653 - SURFACE
    )
    :vars
    (
      ?auto_654 - HOIST
      ?auto_655 - PLACE
      ?auto_657 - PLACE
      ?auto_658 - HOIST
      ?auto_659 - SURFACE
      ?auto_656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_654 ?auto_655 ) ( SURFACE-AT ?auto_653 ?auto_655 ) ( CLEAR ?auto_653 ) ( IS-CRATE ?auto_652 ) ( AVAILABLE ?auto_654 ) ( not ( = ?auto_657 ?auto_655 ) ) ( HOIST-AT ?auto_658 ?auto_657 ) ( AVAILABLE ?auto_658 ) ( SURFACE-AT ?auto_652 ?auto_657 ) ( ON ?auto_652 ?auto_659 ) ( CLEAR ?auto_652 ) ( TRUCK-AT ?auto_656 ?auto_655 ) ( not ( = ?auto_652 ?auto_653 ) ) ( not ( = ?auto_652 ?auto_659 ) ) ( not ( = ?auto_653 ?auto_659 ) ) ( not ( = ?auto_654 ?auto_658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_656 ?auto_655 ?auto_657 )
      ( !LIFT ?auto_658 ?auto_652 ?auto_659 ?auto_657 )
      ( !LOAD ?auto_658 ?auto_652 ?auto_656 ?auto_657 )
      ( !DRIVE ?auto_656 ?auto_657 ?auto_655 )
      ( !UNLOAD ?auto_654 ?auto_652 ?auto_656 ?auto_655 )
      ( !DROP ?auto_654 ?auto_652 ?auto_653 ?auto_655 )
      ( MAKE-ON-VERIFY ?auto_652 ?auto_653 ) )
  )

)

