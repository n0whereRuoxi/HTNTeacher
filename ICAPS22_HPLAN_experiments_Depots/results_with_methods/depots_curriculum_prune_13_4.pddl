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
      ?auto_4372 - SURFACE
      ?auto_4373 - SURFACE
    )
    :vars
    (
      ?auto_4374 - HOIST
      ?auto_4375 - PLACE
      ?auto_4377 - PLACE
      ?auto_4378 - HOIST
      ?auto_4379 - SURFACE
      ?auto_4376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4374 ?auto_4375 ) ( SURFACE-AT ?auto_4373 ?auto_4375 ) ( CLEAR ?auto_4373 ) ( IS-CRATE ?auto_4372 ) ( AVAILABLE ?auto_4374 ) ( not ( = ?auto_4377 ?auto_4375 ) ) ( HOIST-AT ?auto_4378 ?auto_4377 ) ( AVAILABLE ?auto_4378 ) ( SURFACE-AT ?auto_4372 ?auto_4377 ) ( ON ?auto_4372 ?auto_4379 ) ( CLEAR ?auto_4372 ) ( TRUCK-AT ?auto_4376 ?auto_4375 ) ( not ( = ?auto_4372 ?auto_4373 ) ) ( not ( = ?auto_4372 ?auto_4379 ) ) ( not ( = ?auto_4373 ?auto_4379 ) ) ( not ( = ?auto_4374 ?auto_4378 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4376 ?auto_4375 ?auto_4377 )
      ( !LIFT ?auto_4378 ?auto_4372 ?auto_4379 ?auto_4377 )
      ( !LOAD ?auto_4378 ?auto_4372 ?auto_4376 ?auto_4377 )
      ( !DRIVE ?auto_4376 ?auto_4377 ?auto_4375 )
      ( !UNLOAD ?auto_4374 ?auto_4372 ?auto_4376 ?auto_4375 )
      ( !DROP ?auto_4374 ?auto_4372 ?auto_4373 ?auto_4375 )
      ( MAKE-ON-VERIFY ?auto_4372 ?auto_4373 ) )
  )

)

