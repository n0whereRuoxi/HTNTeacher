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
      ?auto_2202 - SURFACE
      ?auto_2203 - SURFACE
    )
    :vars
    (
      ?auto_2204 - HOIST
      ?auto_2205 - PLACE
      ?auto_2207 - PLACE
      ?auto_2208 - HOIST
      ?auto_2209 - SURFACE
      ?auto_2206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2204 ?auto_2205 ) ( SURFACE-AT ?auto_2203 ?auto_2205 ) ( CLEAR ?auto_2203 ) ( IS-CRATE ?auto_2202 ) ( AVAILABLE ?auto_2204 ) ( not ( = ?auto_2207 ?auto_2205 ) ) ( HOIST-AT ?auto_2208 ?auto_2207 ) ( AVAILABLE ?auto_2208 ) ( SURFACE-AT ?auto_2202 ?auto_2207 ) ( ON ?auto_2202 ?auto_2209 ) ( CLEAR ?auto_2202 ) ( TRUCK-AT ?auto_2206 ?auto_2205 ) ( not ( = ?auto_2202 ?auto_2203 ) ) ( not ( = ?auto_2202 ?auto_2209 ) ) ( not ( = ?auto_2203 ?auto_2209 ) ) ( not ( = ?auto_2204 ?auto_2208 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2206 ?auto_2205 ?auto_2207 )
      ( !LIFT ?auto_2208 ?auto_2202 ?auto_2209 ?auto_2207 )
      ( !LOAD ?auto_2208 ?auto_2202 ?auto_2206 ?auto_2207 )
      ( !DRIVE ?auto_2206 ?auto_2207 ?auto_2205 )
      ( !UNLOAD ?auto_2204 ?auto_2202 ?auto_2206 ?auto_2205 )
      ( !DROP ?auto_2204 ?auto_2202 ?auto_2203 ?auto_2205 )
      ( MAKE-ON-VERIFY ?auto_2202 ?auto_2203 ) )
  )

)

