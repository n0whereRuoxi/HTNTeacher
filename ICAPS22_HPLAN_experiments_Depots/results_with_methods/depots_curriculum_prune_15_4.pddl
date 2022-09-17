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
      ?auto_5802 - SURFACE
      ?auto_5803 - SURFACE
    )
    :vars
    (
      ?auto_5804 - HOIST
      ?auto_5805 - PLACE
      ?auto_5807 - PLACE
      ?auto_5808 - HOIST
      ?auto_5809 - SURFACE
      ?auto_5806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5804 ?auto_5805 ) ( SURFACE-AT ?auto_5803 ?auto_5805 ) ( CLEAR ?auto_5803 ) ( IS-CRATE ?auto_5802 ) ( AVAILABLE ?auto_5804 ) ( not ( = ?auto_5807 ?auto_5805 ) ) ( HOIST-AT ?auto_5808 ?auto_5807 ) ( AVAILABLE ?auto_5808 ) ( SURFACE-AT ?auto_5802 ?auto_5807 ) ( ON ?auto_5802 ?auto_5809 ) ( CLEAR ?auto_5802 ) ( TRUCK-AT ?auto_5806 ?auto_5805 ) ( not ( = ?auto_5802 ?auto_5803 ) ) ( not ( = ?auto_5802 ?auto_5809 ) ) ( not ( = ?auto_5803 ?auto_5809 ) ) ( not ( = ?auto_5804 ?auto_5808 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5806 ?auto_5805 ?auto_5807 )
      ( !LIFT ?auto_5808 ?auto_5802 ?auto_5809 ?auto_5807 )
      ( !LOAD ?auto_5808 ?auto_5802 ?auto_5806 ?auto_5807 )
      ( !DRIVE ?auto_5806 ?auto_5807 ?auto_5805 )
      ( !UNLOAD ?auto_5804 ?auto_5802 ?auto_5806 ?auto_5805 )
      ( !DROP ?auto_5804 ?auto_5802 ?auto_5803 ?auto_5805 )
      ( MAKE-ON-VERIFY ?auto_5802 ?auto_5803 ) )
  )

)

