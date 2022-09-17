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
      ?auto_1142 - SURFACE
      ?auto_1143 - SURFACE
    )
    :vars
    (
      ?auto_1144 - HOIST
      ?auto_1145 - PLACE
      ?auto_1147 - PLACE
      ?auto_1148 - HOIST
      ?auto_1149 - SURFACE
      ?auto_1146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1144 ?auto_1145 ) ( SURFACE-AT ?auto_1143 ?auto_1145 ) ( CLEAR ?auto_1143 ) ( IS-CRATE ?auto_1142 ) ( AVAILABLE ?auto_1144 ) ( not ( = ?auto_1147 ?auto_1145 ) ) ( HOIST-AT ?auto_1148 ?auto_1147 ) ( AVAILABLE ?auto_1148 ) ( SURFACE-AT ?auto_1142 ?auto_1147 ) ( ON ?auto_1142 ?auto_1149 ) ( CLEAR ?auto_1142 ) ( TRUCK-AT ?auto_1146 ?auto_1145 ) ( not ( = ?auto_1142 ?auto_1143 ) ) ( not ( = ?auto_1142 ?auto_1149 ) ) ( not ( = ?auto_1143 ?auto_1149 ) ) ( not ( = ?auto_1144 ?auto_1148 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1146 ?auto_1145 ?auto_1147 )
      ( !LIFT ?auto_1148 ?auto_1142 ?auto_1149 ?auto_1147 )
      ( !LOAD ?auto_1148 ?auto_1142 ?auto_1146 ?auto_1147 )
      ( !DRIVE ?auto_1146 ?auto_1147 ?auto_1145 )
      ( !UNLOAD ?auto_1144 ?auto_1142 ?auto_1146 ?auto_1145 )
      ( !DROP ?auto_1144 ?auto_1142 ?auto_1143 ?auto_1145 )
      ( MAKE-ON-VERIFY ?auto_1142 ?auto_1143 ) )
  )

)

