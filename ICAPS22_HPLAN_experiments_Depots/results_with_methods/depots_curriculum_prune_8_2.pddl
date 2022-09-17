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
      ?auto_1512 - SURFACE
      ?auto_1513 - SURFACE
    )
    :vars
    (
      ?auto_1514 - HOIST
      ?auto_1515 - PLACE
      ?auto_1517 - PLACE
      ?auto_1518 - HOIST
      ?auto_1519 - SURFACE
      ?auto_1516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514 ?auto_1515 ) ( SURFACE-AT ?auto_1513 ?auto_1515 ) ( CLEAR ?auto_1513 ) ( IS-CRATE ?auto_1512 ) ( AVAILABLE ?auto_1514 ) ( not ( = ?auto_1517 ?auto_1515 ) ) ( HOIST-AT ?auto_1518 ?auto_1517 ) ( AVAILABLE ?auto_1518 ) ( SURFACE-AT ?auto_1512 ?auto_1517 ) ( ON ?auto_1512 ?auto_1519 ) ( CLEAR ?auto_1512 ) ( TRUCK-AT ?auto_1516 ?auto_1515 ) ( not ( = ?auto_1512 ?auto_1513 ) ) ( not ( = ?auto_1512 ?auto_1519 ) ) ( not ( = ?auto_1513 ?auto_1519 ) ) ( not ( = ?auto_1514 ?auto_1518 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1516 ?auto_1515 ?auto_1517 )
      ( !LIFT ?auto_1518 ?auto_1512 ?auto_1519 ?auto_1517 )
      ( !LOAD ?auto_1518 ?auto_1512 ?auto_1516 ?auto_1517 )
      ( !DRIVE ?auto_1516 ?auto_1517 ?auto_1515 )
      ( !UNLOAD ?auto_1514 ?auto_1512 ?auto_1516 ?auto_1515 )
      ( !DROP ?auto_1514 ?auto_1512 ?auto_1513 ?auto_1515 )
      ( MAKE-ON-VERIFY ?auto_1512 ?auto_1513 ) )
  )

)

