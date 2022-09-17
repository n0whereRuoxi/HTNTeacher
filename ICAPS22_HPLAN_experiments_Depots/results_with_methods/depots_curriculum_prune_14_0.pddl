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
      ?auto_4502 - SURFACE
      ?auto_4503 - SURFACE
    )
    :vars
    (
      ?auto_4504 - HOIST
      ?auto_4505 - PLACE
      ?auto_4507 - PLACE
      ?auto_4508 - HOIST
      ?auto_4509 - SURFACE
      ?auto_4506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4504 ?auto_4505 ) ( SURFACE-AT ?auto_4503 ?auto_4505 ) ( CLEAR ?auto_4503 ) ( IS-CRATE ?auto_4502 ) ( AVAILABLE ?auto_4504 ) ( not ( = ?auto_4507 ?auto_4505 ) ) ( HOIST-AT ?auto_4508 ?auto_4507 ) ( AVAILABLE ?auto_4508 ) ( SURFACE-AT ?auto_4502 ?auto_4507 ) ( ON ?auto_4502 ?auto_4509 ) ( CLEAR ?auto_4502 ) ( TRUCK-AT ?auto_4506 ?auto_4505 ) ( not ( = ?auto_4502 ?auto_4503 ) ) ( not ( = ?auto_4502 ?auto_4509 ) ) ( not ( = ?auto_4503 ?auto_4509 ) ) ( not ( = ?auto_4504 ?auto_4508 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4506 ?auto_4505 ?auto_4507 )
      ( !LIFT ?auto_4508 ?auto_4502 ?auto_4509 ?auto_4507 )
      ( !LOAD ?auto_4508 ?auto_4502 ?auto_4506 ?auto_4507 )
      ( !DRIVE ?auto_4506 ?auto_4507 ?auto_4505 )
      ( !UNLOAD ?auto_4504 ?auto_4502 ?auto_4506 ?auto_4505 )
      ( !DROP ?auto_4504 ?auto_4502 ?auto_4503 ?auto_4505 )
      ( MAKE-ON-VERIFY ?auto_4502 ?auto_4503 ) )
  )

)

