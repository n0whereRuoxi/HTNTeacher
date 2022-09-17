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
      ?auto_1592 - SURFACE
      ?auto_1593 - SURFACE
    )
    :vars
    (
      ?auto_1594 - HOIST
      ?auto_1595 - PLACE
      ?auto_1597 - PLACE
      ?auto_1598 - HOIST
      ?auto_1599 - SURFACE
      ?auto_1596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1594 ?auto_1595 ) ( SURFACE-AT ?auto_1593 ?auto_1595 ) ( CLEAR ?auto_1593 ) ( IS-CRATE ?auto_1592 ) ( AVAILABLE ?auto_1594 ) ( not ( = ?auto_1597 ?auto_1595 ) ) ( HOIST-AT ?auto_1598 ?auto_1597 ) ( AVAILABLE ?auto_1598 ) ( SURFACE-AT ?auto_1592 ?auto_1597 ) ( ON ?auto_1592 ?auto_1599 ) ( CLEAR ?auto_1592 ) ( TRUCK-AT ?auto_1596 ?auto_1595 ) ( not ( = ?auto_1592 ?auto_1593 ) ) ( not ( = ?auto_1592 ?auto_1599 ) ) ( not ( = ?auto_1593 ?auto_1599 ) ) ( not ( = ?auto_1594 ?auto_1598 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1596 ?auto_1595 ?auto_1597 )
      ( !LIFT ?auto_1598 ?auto_1592 ?auto_1599 ?auto_1597 )
      ( !LOAD ?auto_1598 ?auto_1592 ?auto_1596 ?auto_1597 )
      ( !DRIVE ?auto_1596 ?auto_1597 ?auto_1595 )
      ( !UNLOAD ?auto_1594 ?auto_1592 ?auto_1596 ?auto_1595 )
      ( !DROP ?auto_1594 ?auto_1592 ?auto_1593 ?auto_1595 )
      ( MAKE-ON-VERIFY ?auto_1592 ?auto_1593 ) )
  )

)

