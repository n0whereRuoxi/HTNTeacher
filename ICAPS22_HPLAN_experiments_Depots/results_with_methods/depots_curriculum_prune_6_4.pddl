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
      ?auto_942 - SURFACE
      ?auto_943 - SURFACE
    )
    :vars
    (
      ?auto_944 - HOIST
      ?auto_945 - PLACE
      ?auto_947 - PLACE
      ?auto_948 - HOIST
      ?auto_949 - SURFACE
      ?auto_946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_944 ?auto_945 ) ( SURFACE-AT ?auto_943 ?auto_945 ) ( CLEAR ?auto_943 ) ( IS-CRATE ?auto_942 ) ( AVAILABLE ?auto_944 ) ( not ( = ?auto_947 ?auto_945 ) ) ( HOIST-AT ?auto_948 ?auto_947 ) ( AVAILABLE ?auto_948 ) ( SURFACE-AT ?auto_942 ?auto_947 ) ( ON ?auto_942 ?auto_949 ) ( CLEAR ?auto_942 ) ( TRUCK-AT ?auto_946 ?auto_945 ) ( not ( = ?auto_942 ?auto_943 ) ) ( not ( = ?auto_942 ?auto_949 ) ) ( not ( = ?auto_943 ?auto_949 ) ) ( not ( = ?auto_944 ?auto_948 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_946 ?auto_945 ?auto_947 )
      ( !LIFT ?auto_948 ?auto_942 ?auto_949 ?auto_947 )
      ( !LOAD ?auto_948 ?auto_942 ?auto_946 ?auto_947 )
      ( !DRIVE ?auto_946 ?auto_947 ?auto_945 )
      ( !UNLOAD ?auto_944 ?auto_942 ?auto_946 ?auto_945 )
      ( !DROP ?auto_944 ?auto_942 ?auto_943 ?auto_945 )
      ( MAKE-ON-VERIFY ?auto_942 ?auto_943 ) )
  )

)

