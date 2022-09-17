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
      ?auto_1002 - SURFACE
      ?auto_1003 - SURFACE
    )
    :vars
    (
      ?auto_1004 - HOIST
      ?auto_1005 - PLACE
      ?auto_1007 - PLACE
      ?auto_1008 - HOIST
      ?auto_1009 - SURFACE
      ?auto_1006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1004 ?auto_1005 ) ( SURFACE-AT ?auto_1003 ?auto_1005 ) ( CLEAR ?auto_1003 ) ( IS-CRATE ?auto_1002 ) ( AVAILABLE ?auto_1004 ) ( not ( = ?auto_1007 ?auto_1005 ) ) ( HOIST-AT ?auto_1008 ?auto_1007 ) ( AVAILABLE ?auto_1008 ) ( SURFACE-AT ?auto_1002 ?auto_1007 ) ( ON ?auto_1002 ?auto_1009 ) ( CLEAR ?auto_1002 ) ( TRUCK-AT ?auto_1006 ?auto_1005 ) ( not ( = ?auto_1002 ?auto_1003 ) ) ( not ( = ?auto_1002 ?auto_1009 ) ) ( not ( = ?auto_1003 ?auto_1009 ) ) ( not ( = ?auto_1004 ?auto_1008 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1006 ?auto_1005 ?auto_1007 )
      ( !LIFT ?auto_1008 ?auto_1002 ?auto_1009 ?auto_1007 )
      ( !LOAD ?auto_1008 ?auto_1002 ?auto_1006 ?auto_1007 )
      ( !DRIVE ?auto_1006 ?auto_1007 ?auto_1005 )
      ( !UNLOAD ?auto_1004 ?auto_1002 ?auto_1006 ?auto_1005 )
      ( !DROP ?auto_1004 ?auto_1002 ?auto_1003 ?auto_1005 )
      ( MAKE-ON-VERIFY ?auto_1002 ?auto_1003 ) )
  )

)

