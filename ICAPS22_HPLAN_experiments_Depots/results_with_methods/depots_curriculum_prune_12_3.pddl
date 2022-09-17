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
      ?auto_3612 - SURFACE
      ?auto_3613 - SURFACE
    )
    :vars
    (
      ?auto_3614 - HOIST
      ?auto_3615 - PLACE
      ?auto_3617 - PLACE
      ?auto_3618 - HOIST
      ?auto_3619 - SURFACE
      ?auto_3616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3614 ?auto_3615 ) ( SURFACE-AT ?auto_3613 ?auto_3615 ) ( CLEAR ?auto_3613 ) ( IS-CRATE ?auto_3612 ) ( AVAILABLE ?auto_3614 ) ( not ( = ?auto_3617 ?auto_3615 ) ) ( HOIST-AT ?auto_3618 ?auto_3617 ) ( AVAILABLE ?auto_3618 ) ( SURFACE-AT ?auto_3612 ?auto_3617 ) ( ON ?auto_3612 ?auto_3619 ) ( CLEAR ?auto_3612 ) ( TRUCK-AT ?auto_3616 ?auto_3615 ) ( not ( = ?auto_3612 ?auto_3613 ) ) ( not ( = ?auto_3612 ?auto_3619 ) ) ( not ( = ?auto_3613 ?auto_3619 ) ) ( not ( = ?auto_3614 ?auto_3618 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3616 ?auto_3615 ?auto_3617 )
      ( !LIFT ?auto_3618 ?auto_3612 ?auto_3619 ?auto_3617 )
      ( !LOAD ?auto_3618 ?auto_3612 ?auto_3616 ?auto_3617 )
      ( !DRIVE ?auto_3616 ?auto_3617 ?auto_3615 )
      ( !UNLOAD ?auto_3614 ?auto_3612 ?auto_3616 ?auto_3615 )
      ( !DROP ?auto_3614 ?auto_3612 ?auto_3613 ?auto_3615 )
      ( MAKE-ON-VERIFY ?auto_3612 ?auto_3613 ) )
  )

)

