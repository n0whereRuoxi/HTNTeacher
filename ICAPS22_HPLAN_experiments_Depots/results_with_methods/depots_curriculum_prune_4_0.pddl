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
      ?auto_252 - SURFACE
      ?auto_253 - SURFACE
    )
    :vars
    (
      ?auto_254 - HOIST
      ?auto_255 - PLACE
      ?auto_257 - PLACE
      ?auto_258 - HOIST
      ?auto_259 - SURFACE
      ?auto_256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_254 ?auto_255 ) ( SURFACE-AT ?auto_253 ?auto_255 ) ( CLEAR ?auto_253 ) ( IS-CRATE ?auto_252 ) ( AVAILABLE ?auto_254 ) ( not ( = ?auto_257 ?auto_255 ) ) ( HOIST-AT ?auto_258 ?auto_257 ) ( AVAILABLE ?auto_258 ) ( SURFACE-AT ?auto_252 ?auto_257 ) ( ON ?auto_252 ?auto_259 ) ( CLEAR ?auto_252 ) ( TRUCK-AT ?auto_256 ?auto_255 ) ( not ( = ?auto_252 ?auto_253 ) ) ( not ( = ?auto_252 ?auto_259 ) ) ( not ( = ?auto_253 ?auto_259 ) ) ( not ( = ?auto_254 ?auto_258 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_256 ?auto_255 ?auto_257 )
      ( !LIFT ?auto_258 ?auto_252 ?auto_259 ?auto_257 )
      ( !LOAD ?auto_258 ?auto_252 ?auto_256 ?auto_257 )
      ( !DRIVE ?auto_256 ?auto_257 ?auto_255 )
      ( !UNLOAD ?auto_254 ?auto_252 ?auto_256 ?auto_255 )
      ( !DROP ?auto_254 ?auto_252 ?auto_253 ?auto_255 )
      ( MAKE-ON-VERIFY ?auto_252 ?auto_253 ) )
  )

)

