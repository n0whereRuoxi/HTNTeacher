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
      ?auto_3372 - SURFACE
      ?auto_3373 - SURFACE
    )
    :vars
    (
      ?auto_3374 - HOIST
      ?auto_3375 - PLACE
      ?auto_3377 - PLACE
      ?auto_3378 - HOIST
      ?auto_3379 - SURFACE
      ?auto_3376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3374 ?auto_3375 ) ( SURFACE-AT ?auto_3373 ?auto_3375 ) ( CLEAR ?auto_3373 ) ( IS-CRATE ?auto_3372 ) ( AVAILABLE ?auto_3374 ) ( not ( = ?auto_3377 ?auto_3375 ) ) ( HOIST-AT ?auto_3378 ?auto_3377 ) ( AVAILABLE ?auto_3378 ) ( SURFACE-AT ?auto_3372 ?auto_3377 ) ( ON ?auto_3372 ?auto_3379 ) ( CLEAR ?auto_3372 ) ( TRUCK-AT ?auto_3376 ?auto_3375 ) ( not ( = ?auto_3372 ?auto_3373 ) ) ( not ( = ?auto_3372 ?auto_3379 ) ) ( not ( = ?auto_3373 ?auto_3379 ) ) ( not ( = ?auto_3374 ?auto_3378 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3376 ?auto_3375 ?auto_3377 )
      ( !LIFT ?auto_3378 ?auto_3372 ?auto_3379 ?auto_3377 )
      ( !LOAD ?auto_3378 ?auto_3372 ?auto_3376 ?auto_3377 )
      ( !DRIVE ?auto_3376 ?auto_3377 ?auto_3375 )
      ( !UNLOAD ?auto_3374 ?auto_3372 ?auto_3376 ?auto_3375 )
      ( !DROP ?auto_3374 ?auto_3372 ?auto_3373 ?auto_3375 )
      ( MAKE-ON-VERIFY ?auto_3372 ?auto_3373 ) )
  )

)

