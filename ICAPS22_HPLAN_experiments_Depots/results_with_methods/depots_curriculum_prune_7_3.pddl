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
      ?auto_1212 - SURFACE
      ?auto_1213 - SURFACE
    )
    :vars
    (
      ?auto_1214 - HOIST
      ?auto_1215 - PLACE
      ?auto_1217 - PLACE
      ?auto_1218 - HOIST
      ?auto_1219 - SURFACE
      ?auto_1216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1214 ?auto_1215 ) ( SURFACE-AT ?auto_1213 ?auto_1215 ) ( CLEAR ?auto_1213 ) ( IS-CRATE ?auto_1212 ) ( AVAILABLE ?auto_1214 ) ( not ( = ?auto_1217 ?auto_1215 ) ) ( HOIST-AT ?auto_1218 ?auto_1217 ) ( AVAILABLE ?auto_1218 ) ( SURFACE-AT ?auto_1212 ?auto_1217 ) ( ON ?auto_1212 ?auto_1219 ) ( CLEAR ?auto_1212 ) ( TRUCK-AT ?auto_1216 ?auto_1215 ) ( not ( = ?auto_1212 ?auto_1213 ) ) ( not ( = ?auto_1212 ?auto_1219 ) ) ( not ( = ?auto_1213 ?auto_1219 ) ) ( not ( = ?auto_1214 ?auto_1218 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1216 ?auto_1215 ?auto_1217 )
      ( !LIFT ?auto_1218 ?auto_1212 ?auto_1219 ?auto_1217 )
      ( !LOAD ?auto_1218 ?auto_1212 ?auto_1216 ?auto_1217 )
      ( !DRIVE ?auto_1216 ?auto_1217 ?auto_1215 )
      ( !UNLOAD ?auto_1214 ?auto_1212 ?auto_1216 ?auto_1215 )
      ( !DROP ?auto_1214 ?auto_1212 ?auto_1213 ?auto_1215 )
      ( MAKE-ON-VERIFY ?auto_1212 ?auto_1213 ) )
  )

)

