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
      ?auto_4642 - SURFACE
      ?auto_4643 - SURFACE
    )
    :vars
    (
      ?auto_4644 - HOIST
      ?auto_4645 - PLACE
      ?auto_4647 - PLACE
      ?auto_4648 - HOIST
      ?auto_4649 - SURFACE
      ?auto_4646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4644 ?auto_4645 ) ( SURFACE-AT ?auto_4643 ?auto_4645 ) ( CLEAR ?auto_4643 ) ( IS-CRATE ?auto_4642 ) ( AVAILABLE ?auto_4644 ) ( not ( = ?auto_4647 ?auto_4645 ) ) ( HOIST-AT ?auto_4648 ?auto_4647 ) ( AVAILABLE ?auto_4648 ) ( SURFACE-AT ?auto_4642 ?auto_4647 ) ( ON ?auto_4642 ?auto_4649 ) ( CLEAR ?auto_4642 ) ( TRUCK-AT ?auto_4646 ?auto_4645 ) ( not ( = ?auto_4642 ?auto_4643 ) ) ( not ( = ?auto_4642 ?auto_4649 ) ) ( not ( = ?auto_4643 ?auto_4649 ) ) ( not ( = ?auto_4644 ?auto_4648 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4646 ?auto_4645 ?auto_4647 )
      ( !LIFT ?auto_4648 ?auto_4642 ?auto_4649 ?auto_4647 )
      ( !LOAD ?auto_4648 ?auto_4642 ?auto_4646 ?auto_4647 )
      ( !DRIVE ?auto_4646 ?auto_4647 ?auto_4645 )
      ( !UNLOAD ?auto_4644 ?auto_4642 ?auto_4646 ?auto_4645 )
      ( !DROP ?auto_4644 ?auto_4642 ?auto_4643 ?auto_4645 )
      ( MAKE-ON-VERIFY ?auto_4642 ?auto_4643 ) )
  )

)

