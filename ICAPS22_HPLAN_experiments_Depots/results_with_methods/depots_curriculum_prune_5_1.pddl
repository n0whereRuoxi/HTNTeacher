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
      ?auto_502 - SURFACE
      ?auto_503 - SURFACE
    )
    :vars
    (
      ?auto_504 - HOIST
      ?auto_505 - PLACE
      ?auto_507 - PLACE
      ?auto_508 - HOIST
      ?auto_509 - SURFACE
      ?auto_506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_504 ?auto_505 ) ( SURFACE-AT ?auto_503 ?auto_505 ) ( CLEAR ?auto_503 ) ( IS-CRATE ?auto_502 ) ( AVAILABLE ?auto_504 ) ( not ( = ?auto_507 ?auto_505 ) ) ( HOIST-AT ?auto_508 ?auto_507 ) ( AVAILABLE ?auto_508 ) ( SURFACE-AT ?auto_502 ?auto_507 ) ( ON ?auto_502 ?auto_509 ) ( CLEAR ?auto_502 ) ( TRUCK-AT ?auto_506 ?auto_505 ) ( not ( = ?auto_502 ?auto_503 ) ) ( not ( = ?auto_502 ?auto_509 ) ) ( not ( = ?auto_503 ?auto_509 ) ) ( not ( = ?auto_504 ?auto_508 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_506 ?auto_505 ?auto_507 )
      ( !LIFT ?auto_508 ?auto_502 ?auto_509 ?auto_507 )
      ( !LOAD ?auto_508 ?auto_502 ?auto_506 ?auto_507 )
      ( !DRIVE ?auto_506 ?auto_507 ?auto_505 )
      ( !UNLOAD ?auto_504 ?auto_502 ?auto_506 ?auto_505 )
      ( !DROP ?auto_504 ?auto_502 ?auto_503 ?auto_505 )
      ( MAKE-ON-VERIFY ?auto_502 ?auto_503 ) )
  )

)

