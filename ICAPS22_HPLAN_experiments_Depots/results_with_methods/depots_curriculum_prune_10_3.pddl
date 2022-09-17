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
      ?auto_2502 - SURFACE
      ?auto_2503 - SURFACE
    )
    :vars
    (
      ?auto_2504 - HOIST
      ?auto_2505 - PLACE
      ?auto_2507 - PLACE
      ?auto_2508 - HOIST
      ?auto_2509 - SURFACE
      ?auto_2506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2504 ?auto_2505 ) ( SURFACE-AT ?auto_2503 ?auto_2505 ) ( CLEAR ?auto_2503 ) ( IS-CRATE ?auto_2502 ) ( AVAILABLE ?auto_2504 ) ( not ( = ?auto_2507 ?auto_2505 ) ) ( HOIST-AT ?auto_2508 ?auto_2507 ) ( AVAILABLE ?auto_2508 ) ( SURFACE-AT ?auto_2502 ?auto_2507 ) ( ON ?auto_2502 ?auto_2509 ) ( CLEAR ?auto_2502 ) ( TRUCK-AT ?auto_2506 ?auto_2505 ) ( not ( = ?auto_2502 ?auto_2503 ) ) ( not ( = ?auto_2502 ?auto_2509 ) ) ( not ( = ?auto_2503 ?auto_2509 ) ) ( not ( = ?auto_2504 ?auto_2508 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2506 ?auto_2505 ?auto_2507 )
      ( !LIFT ?auto_2508 ?auto_2502 ?auto_2509 ?auto_2507 )
      ( !LOAD ?auto_2508 ?auto_2502 ?auto_2506 ?auto_2507 )
      ( !DRIVE ?auto_2506 ?auto_2507 ?auto_2505 )
      ( !UNLOAD ?auto_2504 ?auto_2502 ?auto_2506 ?auto_2505 )
      ( !DROP ?auto_2504 ?auto_2502 ?auto_2503 ?auto_2505 )
      ( MAKE-ON-VERIFY ?auto_2502 ?auto_2503 ) )
  )

)

