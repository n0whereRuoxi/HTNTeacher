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
      ?auto_1432 - SURFACE
      ?auto_1433 - SURFACE
    )
    :vars
    (
      ?auto_1434 - HOIST
      ?auto_1435 - PLACE
      ?auto_1437 - PLACE
      ?auto_1438 - HOIST
      ?auto_1439 - SURFACE
      ?auto_1436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1434 ?auto_1435 ) ( SURFACE-AT ?auto_1433 ?auto_1435 ) ( CLEAR ?auto_1433 ) ( IS-CRATE ?auto_1432 ) ( AVAILABLE ?auto_1434 ) ( not ( = ?auto_1437 ?auto_1435 ) ) ( HOIST-AT ?auto_1438 ?auto_1437 ) ( AVAILABLE ?auto_1438 ) ( SURFACE-AT ?auto_1432 ?auto_1437 ) ( ON ?auto_1432 ?auto_1439 ) ( CLEAR ?auto_1432 ) ( TRUCK-AT ?auto_1436 ?auto_1435 ) ( not ( = ?auto_1432 ?auto_1433 ) ) ( not ( = ?auto_1432 ?auto_1439 ) ) ( not ( = ?auto_1433 ?auto_1439 ) ) ( not ( = ?auto_1434 ?auto_1438 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1436 ?auto_1435 ?auto_1437 )
      ( !LIFT ?auto_1438 ?auto_1432 ?auto_1439 ?auto_1437 )
      ( !LOAD ?auto_1438 ?auto_1432 ?auto_1436 ?auto_1437 )
      ( !DRIVE ?auto_1436 ?auto_1437 ?auto_1435 )
      ( !UNLOAD ?auto_1434 ?auto_1432 ?auto_1436 ?auto_1435 )
      ( !DROP ?auto_1434 ?auto_1432 ?auto_1433 ?auto_1435 )
      ( MAKE-ON-VERIFY ?auto_1432 ?auto_1433 ) )
  )

)

