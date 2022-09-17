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
      ?auto_1072 - SURFACE
      ?auto_1073 - SURFACE
    )
    :vars
    (
      ?auto_1074 - HOIST
      ?auto_1075 - PLACE
      ?auto_1077 - PLACE
      ?auto_1078 - HOIST
      ?auto_1079 - SURFACE
      ?auto_1076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1074 ?auto_1075 ) ( SURFACE-AT ?auto_1073 ?auto_1075 ) ( CLEAR ?auto_1073 ) ( IS-CRATE ?auto_1072 ) ( AVAILABLE ?auto_1074 ) ( not ( = ?auto_1077 ?auto_1075 ) ) ( HOIST-AT ?auto_1078 ?auto_1077 ) ( AVAILABLE ?auto_1078 ) ( SURFACE-AT ?auto_1072 ?auto_1077 ) ( ON ?auto_1072 ?auto_1079 ) ( CLEAR ?auto_1072 ) ( TRUCK-AT ?auto_1076 ?auto_1075 ) ( not ( = ?auto_1072 ?auto_1073 ) ) ( not ( = ?auto_1072 ?auto_1079 ) ) ( not ( = ?auto_1073 ?auto_1079 ) ) ( not ( = ?auto_1074 ?auto_1078 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1076 ?auto_1075 ?auto_1077 )
      ( !LIFT ?auto_1078 ?auto_1072 ?auto_1079 ?auto_1077 )
      ( !LOAD ?auto_1078 ?auto_1072 ?auto_1076 ?auto_1077 )
      ( !DRIVE ?auto_1076 ?auto_1077 ?auto_1075 )
      ( !UNLOAD ?auto_1074 ?auto_1072 ?auto_1076 ?auto_1075 )
      ( !DROP ?auto_1074 ?auto_1072 ?auto_1073 ?auto_1075 )
      ( MAKE-ON-VERIFY ?auto_1072 ?auto_1073 ) )
  )

)

