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
      ?auto_1352 - SURFACE
      ?auto_1353 - SURFACE
    )
    :vars
    (
      ?auto_1354 - HOIST
      ?auto_1355 - PLACE
      ?auto_1357 - PLACE
      ?auto_1358 - HOIST
      ?auto_1359 - SURFACE
      ?auto_1356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1354 ?auto_1355 ) ( SURFACE-AT ?auto_1353 ?auto_1355 ) ( CLEAR ?auto_1353 ) ( IS-CRATE ?auto_1352 ) ( AVAILABLE ?auto_1354 ) ( not ( = ?auto_1357 ?auto_1355 ) ) ( HOIST-AT ?auto_1358 ?auto_1357 ) ( AVAILABLE ?auto_1358 ) ( SURFACE-AT ?auto_1352 ?auto_1357 ) ( ON ?auto_1352 ?auto_1359 ) ( CLEAR ?auto_1352 ) ( TRUCK-AT ?auto_1356 ?auto_1355 ) ( not ( = ?auto_1352 ?auto_1353 ) ) ( not ( = ?auto_1352 ?auto_1359 ) ) ( not ( = ?auto_1353 ?auto_1359 ) ) ( not ( = ?auto_1354 ?auto_1358 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1356 ?auto_1355 ?auto_1357 )
      ( !LIFT ?auto_1358 ?auto_1352 ?auto_1359 ?auto_1357 )
      ( !LOAD ?auto_1358 ?auto_1352 ?auto_1356 ?auto_1357 )
      ( !DRIVE ?auto_1356 ?auto_1357 ?auto_1355 )
      ( !UNLOAD ?auto_1354 ?auto_1352 ?auto_1356 ?auto_1355 )
      ( !DROP ?auto_1354 ?auto_1352 ?auto_1353 ?auto_1355 )
      ( MAKE-ON-VERIFY ?auto_1352 ?auto_1353 ) )
  )

)

