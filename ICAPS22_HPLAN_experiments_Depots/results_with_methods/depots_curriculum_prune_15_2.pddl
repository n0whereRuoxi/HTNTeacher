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
      ?auto_5502 - SURFACE
      ?auto_5503 - SURFACE
    )
    :vars
    (
      ?auto_5504 - HOIST
      ?auto_5505 - PLACE
      ?auto_5507 - PLACE
      ?auto_5508 - HOIST
      ?auto_5509 - SURFACE
      ?auto_5506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5504 ?auto_5505 ) ( SURFACE-AT ?auto_5503 ?auto_5505 ) ( CLEAR ?auto_5503 ) ( IS-CRATE ?auto_5502 ) ( AVAILABLE ?auto_5504 ) ( not ( = ?auto_5507 ?auto_5505 ) ) ( HOIST-AT ?auto_5508 ?auto_5507 ) ( AVAILABLE ?auto_5508 ) ( SURFACE-AT ?auto_5502 ?auto_5507 ) ( ON ?auto_5502 ?auto_5509 ) ( CLEAR ?auto_5502 ) ( TRUCK-AT ?auto_5506 ?auto_5505 ) ( not ( = ?auto_5502 ?auto_5503 ) ) ( not ( = ?auto_5502 ?auto_5509 ) ) ( not ( = ?auto_5503 ?auto_5509 ) ) ( not ( = ?auto_5504 ?auto_5508 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5506 ?auto_5505 ?auto_5507 )
      ( !LIFT ?auto_5508 ?auto_5502 ?auto_5509 ?auto_5507 )
      ( !LOAD ?auto_5508 ?auto_5502 ?auto_5506 ?auto_5507 )
      ( !DRIVE ?auto_5506 ?auto_5507 ?auto_5505 )
      ( !UNLOAD ?auto_5504 ?auto_5502 ?auto_5506 ?auto_5505 )
      ( !DROP ?auto_5504 ?auto_5502 ?auto_5503 ?auto_5505 )
      ( MAKE-ON-VERIFY ?auto_5502 ?auto_5503 ) )
  )

)

