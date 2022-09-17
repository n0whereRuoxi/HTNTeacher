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
      ?auto_292 - SURFACE
      ?auto_293 - SURFACE
    )
    :vars
    (
      ?auto_294 - HOIST
      ?auto_295 - PLACE
      ?auto_297 - PLACE
      ?auto_298 - HOIST
      ?auto_299 - SURFACE
      ?auto_296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_294 ?auto_295 ) ( SURFACE-AT ?auto_293 ?auto_295 ) ( CLEAR ?auto_293 ) ( IS-CRATE ?auto_292 ) ( AVAILABLE ?auto_294 ) ( not ( = ?auto_297 ?auto_295 ) ) ( HOIST-AT ?auto_298 ?auto_297 ) ( AVAILABLE ?auto_298 ) ( SURFACE-AT ?auto_292 ?auto_297 ) ( ON ?auto_292 ?auto_299 ) ( CLEAR ?auto_292 ) ( TRUCK-AT ?auto_296 ?auto_295 ) ( not ( = ?auto_292 ?auto_293 ) ) ( not ( = ?auto_292 ?auto_299 ) ) ( not ( = ?auto_293 ?auto_299 ) ) ( not ( = ?auto_294 ?auto_298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_296 ?auto_295 ?auto_297 )
      ( !LIFT ?auto_298 ?auto_292 ?auto_299 ?auto_297 )
      ( !LOAD ?auto_298 ?auto_292 ?auto_296 ?auto_297 )
      ( !DRIVE ?auto_296 ?auto_297 ?auto_295 )
      ( !UNLOAD ?auto_294 ?auto_292 ?auto_296 ?auto_295 )
      ( !DROP ?auto_294 ?auto_292 ?auto_293 ?auto_295 )
      ( MAKE-ON-VERIFY ?auto_292 ?auto_293 ) )
  )

)

