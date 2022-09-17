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
      ?auto_192 - SURFACE
      ?auto_193 - SURFACE
    )
    :vars
    (
      ?auto_194 - HOIST
      ?auto_195 - PLACE
      ?auto_197 - PLACE
      ?auto_198 - HOIST
      ?auto_199 - SURFACE
      ?auto_196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_194 ?auto_195 ) ( SURFACE-AT ?auto_193 ?auto_195 ) ( CLEAR ?auto_193 ) ( IS-CRATE ?auto_192 ) ( AVAILABLE ?auto_194 ) ( not ( = ?auto_197 ?auto_195 ) ) ( HOIST-AT ?auto_198 ?auto_197 ) ( AVAILABLE ?auto_198 ) ( SURFACE-AT ?auto_192 ?auto_197 ) ( ON ?auto_192 ?auto_199 ) ( CLEAR ?auto_192 ) ( TRUCK-AT ?auto_196 ?auto_195 ) ( not ( = ?auto_192 ?auto_193 ) ) ( not ( = ?auto_192 ?auto_199 ) ) ( not ( = ?auto_193 ?auto_199 ) ) ( not ( = ?auto_194 ?auto_198 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_196 ?auto_195 ?auto_197 )
      ( !LIFT ?auto_198 ?auto_192 ?auto_199 ?auto_197 )
      ( !LOAD ?auto_198 ?auto_192 ?auto_196 ?auto_197 )
      ( !DRIVE ?auto_196 ?auto_197 ?auto_195 )
      ( !UNLOAD ?auto_194 ?auto_192 ?auto_196 ?auto_195 )
      ( !DROP ?auto_194 ?auto_192 ?auto_193 ?auto_195 )
      ( MAKE-ON-VERIFY ?auto_192 ?auto_193 ) )
  )

)

