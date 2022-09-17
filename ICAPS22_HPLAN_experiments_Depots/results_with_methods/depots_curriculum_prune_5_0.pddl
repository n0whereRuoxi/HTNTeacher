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
      ?auto_452 - SURFACE
      ?auto_453 - SURFACE
    )
    :vars
    (
      ?auto_454 - HOIST
      ?auto_455 - PLACE
      ?auto_457 - PLACE
      ?auto_458 - HOIST
      ?auto_459 - SURFACE
      ?auto_456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_454 ?auto_455 ) ( SURFACE-AT ?auto_453 ?auto_455 ) ( CLEAR ?auto_453 ) ( IS-CRATE ?auto_452 ) ( AVAILABLE ?auto_454 ) ( not ( = ?auto_457 ?auto_455 ) ) ( HOIST-AT ?auto_458 ?auto_457 ) ( AVAILABLE ?auto_458 ) ( SURFACE-AT ?auto_452 ?auto_457 ) ( ON ?auto_452 ?auto_459 ) ( CLEAR ?auto_452 ) ( TRUCK-AT ?auto_456 ?auto_455 ) ( not ( = ?auto_452 ?auto_453 ) ) ( not ( = ?auto_452 ?auto_459 ) ) ( not ( = ?auto_453 ?auto_459 ) ) ( not ( = ?auto_454 ?auto_458 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_456 ?auto_455 ?auto_457 )
      ( !LIFT ?auto_458 ?auto_452 ?auto_459 ?auto_457 )
      ( !LOAD ?auto_458 ?auto_452 ?auto_456 ?auto_457 )
      ( !DRIVE ?auto_456 ?auto_457 ?auto_455 )
      ( !UNLOAD ?auto_454 ?auto_452 ?auto_456 ?auto_455 )
      ( !DROP ?auto_454 ?auto_452 ?auto_453 ?auto_455 )
      ( MAKE-ON-VERIFY ?auto_452 ?auto_453 ) )
  )

)

