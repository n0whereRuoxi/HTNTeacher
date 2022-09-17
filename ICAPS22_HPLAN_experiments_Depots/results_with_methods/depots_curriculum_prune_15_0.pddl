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
      ?auto_5202 - SURFACE
      ?auto_5203 - SURFACE
    )
    :vars
    (
      ?auto_5204 - HOIST
      ?auto_5205 - PLACE
      ?auto_5207 - PLACE
      ?auto_5208 - HOIST
      ?auto_5209 - SURFACE
      ?auto_5206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5204 ?auto_5205 ) ( SURFACE-AT ?auto_5203 ?auto_5205 ) ( CLEAR ?auto_5203 ) ( IS-CRATE ?auto_5202 ) ( AVAILABLE ?auto_5204 ) ( not ( = ?auto_5207 ?auto_5205 ) ) ( HOIST-AT ?auto_5208 ?auto_5207 ) ( AVAILABLE ?auto_5208 ) ( SURFACE-AT ?auto_5202 ?auto_5207 ) ( ON ?auto_5202 ?auto_5209 ) ( CLEAR ?auto_5202 ) ( TRUCK-AT ?auto_5206 ?auto_5205 ) ( not ( = ?auto_5202 ?auto_5203 ) ) ( not ( = ?auto_5202 ?auto_5209 ) ) ( not ( = ?auto_5203 ?auto_5209 ) ) ( not ( = ?auto_5204 ?auto_5208 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5206 ?auto_5205 ?auto_5207 )
      ( !LIFT ?auto_5208 ?auto_5202 ?auto_5209 ?auto_5207 )
      ( !LOAD ?auto_5208 ?auto_5202 ?auto_5206 ?auto_5207 )
      ( !DRIVE ?auto_5206 ?auto_5207 ?auto_5205 )
      ( !UNLOAD ?auto_5204 ?auto_5202 ?auto_5206 ?auto_5205 )
      ( !DROP ?auto_5204 ?auto_5202 ?auto_5203 ?auto_5205 )
      ( MAKE-ON-VERIFY ?auto_5202 ?auto_5203 ) )
  )

)

