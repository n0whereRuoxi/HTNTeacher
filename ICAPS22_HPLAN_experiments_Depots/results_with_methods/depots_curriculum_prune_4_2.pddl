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
      ?auto_332 - SURFACE
      ?auto_333 - SURFACE
    )
    :vars
    (
      ?auto_334 - HOIST
      ?auto_335 - PLACE
      ?auto_337 - PLACE
      ?auto_338 - HOIST
      ?auto_339 - SURFACE
      ?auto_336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_334 ?auto_335 ) ( SURFACE-AT ?auto_333 ?auto_335 ) ( CLEAR ?auto_333 ) ( IS-CRATE ?auto_332 ) ( AVAILABLE ?auto_334 ) ( not ( = ?auto_337 ?auto_335 ) ) ( HOIST-AT ?auto_338 ?auto_337 ) ( AVAILABLE ?auto_338 ) ( SURFACE-AT ?auto_332 ?auto_337 ) ( ON ?auto_332 ?auto_339 ) ( CLEAR ?auto_332 ) ( TRUCK-AT ?auto_336 ?auto_335 ) ( not ( = ?auto_332 ?auto_333 ) ) ( not ( = ?auto_332 ?auto_339 ) ) ( not ( = ?auto_333 ?auto_339 ) ) ( not ( = ?auto_334 ?auto_338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_336 ?auto_335 ?auto_337 )
      ( !LIFT ?auto_338 ?auto_332 ?auto_339 ?auto_337 )
      ( !LOAD ?auto_338 ?auto_332 ?auto_336 ?auto_337 )
      ( !DRIVE ?auto_336 ?auto_337 ?auto_335 )
      ( !UNLOAD ?auto_334 ?auto_332 ?auto_336 ?auto_335 )
      ( !DROP ?auto_334 ?auto_332 ?auto_333 ?auto_335 )
      ( MAKE-ON-VERIFY ?auto_332 ?auto_333 ) )
  )

)

