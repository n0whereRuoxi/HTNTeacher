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
      ?auto_372 - SURFACE
      ?auto_373 - SURFACE
    )
    :vars
    (
      ?auto_374 - HOIST
      ?auto_375 - PLACE
      ?auto_377 - PLACE
      ?auto_378 - HOIST
      ?auto_379 - SURFACE
      ?auto_376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_374 ?auto_375 ) ( SURFACE-AT ?auto_373 ?auto_375 ) ( CLEAR ?auto_373 ) ( IS-CRATE ?auto_372 ) ( AVAILABLE ?auto_374 ) ( not ( = ?auto_377 ?auto_375 ) ) ( HOIST-AT ?auto_378 ?auto_377 ) ( AVAILABLE ?auto_378 ) ( SURFACE-AT ?auto_372 ?auto_377 ) ( ON ?auto_372 ?auto_379 ) ( CLEAR ?auto_372 ) ( TRUCK-AT ?auto_376 ?auto_375 ) ( not ( = ?auto_372 ?auto_373 ) ) ( not ( = ?auto_372 ?auto_379 ) ) ( not ( = ?auto_373 ?auto_379 ) ) ( not ( = ?auto_374 ?auto_378 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_376 ?auto_375 ?auto_377 )
      ( !LIFT ?auto_378 ?auto_372 ?auto_379 ?auto_377 )
      ( !LOAD ?auto_378 ?auto_372 ?auto_376 ?auto_377 )
      ( !DRIVE ?auto_376 ?auto_377 ?auto_375 )
      ( !UNLOAD ?auto_374 ?auto_372 ?auto_376 ?auto_375 )
      ( !DROP ?auto_374 ?auto_372 ?auto_373 ?auto_375 )
      ( MAKE-ON-VERIFY ?auto_372 ?auto_373 ) )
  )

)

