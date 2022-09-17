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
      ?auto_5352 - SURFACE
      ?auto_5353 - SURFACE
    )
    :vars
    (
      ?auto_5354 - HOIST
      ?auto_5355 - PLACE
      ?auto_5357 - PLACE
      ?auto_5358 - HOIST
      ?auto_5359 - SURFACE
      ?auto_5356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5354 ?auto_5355 ) ( SURFACE-AT ?auto_5353 ?auto_5355 ) ( CLEAR ?auto_5353 ) ( IS-CRATE ?auto_5352 ) ( AVAILABLE ?auto_5354 ) ( not ( = ?auto_5357 ?auto_5355 ) ) ( HOIST-AT ?auto_5358 ?auto_5357 ) ( AVAILABLE ?auto_5358 ) ( SURFACE-AT ?auto_5352 ?auto_5357 ) ( ON ?auto_5352 ?auto_5359 ) ( CLEAR ?auto_5352 ) ( TRUCK-AT ?auto_5356 ?auto_5355 ) ( not ( = ?auto_5352 ?auto_5353 ) ) ( not ( = ?auto_5352 ?auto_5359 ) ) ( not ( = ?auto_5353 ?auto_5359 ) ) ( not ( = ?auto_5354 ?auto_5358 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5356 ?auto_5355 ?auto_5357 )
      ( !LIFT ?auto_5358 ?auto_5352 ?auto_5359 ?auto_5357 )
      ( !LOAD ?auto_5358 ?auto_5352 ?auto_5356 ?auto_5357 )
      ( !DRIVE ?auto_5356 ?auto_5357 ?auto_5355 )
      ( !UNLOAD ?auto_5354 ?auto_5352 ?auto_5356 ?auto_5355 )
      ( !DROP ?auto_5354 ?auto_5352 ?auto_5353 ?auto_5355 )
      ( MAKE-ON-VERIFY ?auto_5352 ?auto_5353 ) )
  )

)

