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
      ?auto_5652 - SURFACE
      ?auto_5653 - SURFACE
    )
    :vars
    (
      ?auto_5654 - HOIST
      ?auto_5655 - PLACE
      ?auto_5657 - PLACE
      ?auto_5658 - HOIST
      ?auto_5659 - SURFACE
      ?auto_5656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5654 ?auto_5655 ) ( SURFACE-AT ?auto_5653 ?auto_5655 ) ( CLEAR ?auto_5653 ) ( IS-CRATE ?auto_5652 ) ( AVAILABLE ?auto_5654 ) ( not ( = ?auto_5657 ?auto_5655 ) ) ( HOIST-AT ?auto_5658 ?auto_5657 ) ( AVAILABLE ?auto_5658 ) ( SURFACE-AT ?auto_5652 ?auto_5657 ) ( ON ?auto_5652 ?auto_5659 ) ( CLEAR ?auto_5652 ) ( TRUCK-AT ?auto_5656 ?auto_5655 ) ( not ( = ?auto_5652 ?auto_5653 ) ) ( not ( = ?auto_5652 ?auto_5659 ) ) ( not ( = ?auto_5653 ?auto_5659 ) ) ( not ( = ?auto_5654 ?auto_5658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5656 ?auto_5655 ?auto_5657 )
      ( !LIFT ?auto_5658 ?auto_5652 ?auto_5659 ?auto_5657 )
      ( !LOAD ?auto_5658 ?auto_5652 ?auto_5656 ?auto_5657 )
      ( !DRIVE ?auto_5656 ?auto_5657 ?auto_5655 )
      ( !UNLOAD ?auto_5654 ?auto_5652 ?auto_5656 ?auto_5655 )
      ( !DROP ?auto_5654 ?auto_5652 ?auto_5653 ?auto_5655 )
      ( MAKE-ON-VERIFY ?auto_5652 ?auto_5653 ) )
  )

)

