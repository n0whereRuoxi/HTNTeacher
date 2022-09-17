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
      ?auto_2402 - SURFACE
      ?auto_2403 - SURFACE
    )
    :vars
    (
      ?auto_2404 - HOIST
      ?auto_2405 - PLACE
      ?auto_2407 - PLACE
      ?auto_2408 - HOIST
      ?auto_2409 - SURFACE
      ?auto_2406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2404 ?auto_2405 ) ( SURFACE-AT ?auto_2403 ?auto_2405 ) ( CLEAR ?auto_2403 ) ( IS-CRATE ?auto_2402 ) ( AVAILABLE ?auto_2404 ) ( not ( = ?auto_2407 ?auto_2405 ) ) ( HOIST-AT ?auto_2408 ?auto_2407 ) ( AVAILABLE ?auto_2408 ) ( SURFACE-AT ?auto_2402 ?auto_2407 ) ( ON ?auto_2402 ?auto_2409 ) ( CLEAR ?auto_2402 ) ( TRUCK-AT ?auto_2406 ?auto_2405 ) ( not ( = ?auto_2402 ?auto_2403 ) ) ( not ( = ?auto_2402 ?auto_2409 ) ) ( not ( = ?auto_2403 ?auto_2409 ) ) ( not ( = ?auto_2404 ?auto_2408 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2406 ?auto_2405 ?auto_2407 )
      ( !LIFT ?auto_2408 ?auto_2402 ?auto_2409 ?auto_2407 )
      ( !LOAD ?auto_2408 ?auto_2402 ?auto_2406 ?auto_2407 )
      ( !DRIVE ?auto_2406 ?auto_2407 ?auto_2405 )
      ( !UNLOAD ?auto_2404 ?auto_2402 ?auto_2406 ?auto_2405 )
      ( !DROP ?auto_2404 ?auto_2402 ?auto_2403 ?auto_2405 )
      ( MAKE-ON-VERIFY ?auto_2402 ?auto_2403 ) )
  )

)

