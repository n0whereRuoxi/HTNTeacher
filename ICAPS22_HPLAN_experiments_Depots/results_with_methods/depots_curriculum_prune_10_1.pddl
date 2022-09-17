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
      ?auto_2302 - SURFACE
      ?auto_2303 - SURFACE
    )
    :vars
    (
      ?auto_2304 - HOIST
      ?auto_2305 - PLACE
      ?auto_2307 - PLACE
      ?auto_2308 - HOIST
      ?auto_2309 - SURFACE
      ?auto_2306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2304 ?auto_2305 ) ( SURFACE-AT ?auto_2303 ?auto_2305 ) ( CLEAR ?auto_2303 ) ( IS-CRATE ?auto_2302 ) ( AVAILABLE ?auto_2304 ) ( not ( = ?auto_2307 ?auto_2305 ) ) ( HOIST-AT ?auto_2308 ?auto_2307 ) ( AVAILABLE ?auto_2308 ) ( SURFACE-AT ?auto_2302 ?auto_2307 ) ( ON ?auto_2302 ?auto_2309 ) ( CLEAR ?auto_2302 ) ( TRUCK-AT ?auto_2306 ?auto_2305 ) ( not ( = ?auto_2302 ?auto_2303 ) ) ( not ( = ?auto_2302 ?auto_2309 ) ) ( not ( = ?auto_2303 ?auto_2309 ) ) ( not ( = ?auto_2304 ?auto_2308 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2306 ?auto_2305 ?auto_2307 )
      ( !LIFT ?auto_2308 ?auto_2302 ?auto_2309 ?auto_2307 )
      ( !LOAD ?auto_2308 ?auto_2302 ?auto_2306 ?auto_2307 )
      ( !DRIVE ?auto_2306 ?auto_2307 ?auto_2305 )
      ( !UNLOAD ?auto_2304 ?auto_2302 ?auto_2306 ?auto_2305 )
      ( !DROP ?auto_2304 ?auto_2302 ?auto_2303 ?auto_2305 )
      ( MAKE-ON-VERIFY ?auto_2302 ?auto_2303 ) )
  )

)

