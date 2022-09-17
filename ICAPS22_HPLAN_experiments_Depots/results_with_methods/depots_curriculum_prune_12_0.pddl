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
      ?auto_3252 - SURFACE
      ?auto_3253 - SURFACE
    )
    :vars
    (
      ?auto_3254 - HOIST
      ?auto_3255 - PLACE
      ?auto_3257 - PLACE
      ?auto_3258 - HOIST
      ?auto_3259 - SURFACE
      ?auto_3256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3254 ?auto_3255 ) ( SURFACE-AT ?auto_3253 ?auto_3255 ) ( CLEAR ?auto_3253 ) ( IS-CRATE ?auto_3252 ) ( AVAILABLE ?auto_3254 ) ( not ( = ?auto_3257 ?auto_3255 ) ) ( HOIST-AT ?auto_3258 ?auto_3257 ) ( AVAILABLE ?auto_3258 ) ( SURFACE-AT ?auto_3252 ?auto_3257 ) ( ON ?auto_3252 ?auto_3259 ) ( CLEAR ?auto_3252 ) ( TRUCK-AT ?auto_3256 ?auto_3255 ) ( not ( = ?auto_3252 ?auto_3253 ) ) ( not ( = ?auto_3252 ?auto_3259 ) ) ( not ( = ?auto_3253 ?auto_3259 ) ) ( not ( = ?auto_3254 ?auto_3258 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3256 ?auto_3255 ?auto_3257 )
      ( !LIFT ?auto_3258 ?auto_3252 ?auto_3259 ?auto_3257 )
      ( !LOAD ?auto_3258 ?auto_3252 ?auto_3256 ?auto_3257 )
      ( !DRIVE ?auto_3256 ?auto_3257 ?auto_3255 )
      ( !UNLOAD ?auto_3254 ?auto_3252 ?auto_3256 ?auto_3255 )
      ( !DROP ?auto_3254 ?auto_3252 ?auto_3253 ?auto_3255 )
      ( MAKE-ON-VERIFY ?auto_3252 ?auto_3253 ) )
  )

)

