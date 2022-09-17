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
      ?auto_3032 - SURFACE
      ?auto_3033 - SURFACE
    )
    :vars
    (
      ?auto_3034 - HOIST
      ?auto_3035 - PLACE
      ?auto_3037 - PLACE
      ?auto_3038 - HOIST
      ?auto_3039 - SURFACE
      ?auto_3036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3034 ?auto_3035 ) ( SURFACE-AT ?auto_3033 ?auto_3035 ) ( CLEAR ?auto_3033 ) ( IS-CRATE ?auto_3032 ) ( AVAILABLE ?auto_3034 ) ( not ( = ?auto_3037 ?auto_3035 ) ) ( HOIST-AT ?auto_3038 ?auto_3037 ) ( AVAILABLE ?auto_3038 ) ( SURFACE-AT ?auto_3032 ?auto_3037 ) ( ON ?auto_3032 ?auto_3039 ) ( CLEAR ?auto_3032 ) ( TRUCK-AT ?auto_3036 ?auto_3035 ) ( not ( = ?auto_3032 ?auto_3033 ) ) ( not ( = ?auto_3032 ?auto_3039 ) ) ( not ( = ?auto_3033 ?auto_3039 ) ) ( not ( = ?auto_3034 ?auto_3038 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3036 ?auto_3035 ?auto_3037 )
      ( !LIFT ?auto_3038 ?auto_3032 ?auto_3039 ?auto_3037 )
      ( !LOAD ?auto_3038 ?auto_3032 ?auto_3036 ?auto_3037 )
      ( !DRIVE ?auto_3036 ?auto_3037 ?auto_3035 )
      ( !UNLOAD ?auto_3034 ?auto_3032 ?auto_3036 ?auto_3035 )
      ( !DROP ?auto_3034 ?auto_3032 ?auto_3033 ?auto_3035 )
      ( MAKE-ON-VERIFY ?auto_3032 ?auto_3033 ) )
  )

)

