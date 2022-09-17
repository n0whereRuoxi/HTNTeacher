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
      ?auto_412 - SURFACE
      ?auto_413 - SURFACE
    )
    :vars
    (
      ?auto_414 - HOIST
      ?auto_415 - PLACE
      ?auto_417 - PLACE
      ?auto_418 - HOIST
      ?auto_419 - SURFACE
      ?auto_416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_414 ?auto_415 ) ( SURFACE-AT ?auto_413 ?auto_415 ) ( CLEAR ?auto_413 ) ( IS-CRATE ?auto_412 ) ( AVAILABLE ?auto_414 ) ( not ( = ?auto_417 ?auto_415 ) ) ( HOIST-AT ?auto_418 ?auto_417 ) ( AVAILABLE ?auto_418 ) ( SURFACE-AT ?auto_412 ?auto_417 ) ( ON ?auto_412 ?auto_419 ) ( CLEAR ?auto_412 ) ( TRUCK-AT ?auto_416 ?auto_415 ) ( not ( = ?auto_412 ?auto_413 ) ) ( not ( = ?auto_412 ?auto_419 ) ) ( not ( = ?auto_413 ?auto_419 ) ) ( not ( = ?auto_414 ?auto_418 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_416 ?auto_415 ?auto_417 )
      ( !LIFT ?auto_418 ?auto_412 ?auto_419 ?auto_417 )
      ( !LOAD ?auto_418 ?auto_412 ?auto_416 ?auto_417 )
      ( !DRIVE ?auto_416 ?auto_417 ?auto_415 )
      ( !UNLOAD ?auto_414 ?auto_412 ?auto_416 ?auto_415 )
      ( !DROP ?auto_414 ?auto_412 ?auto_413 ?auto_415 )
      ( MAKE-ON-VERIFY ?auto_412 ?auto_413 ) )
  )

)

