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
      ?auto_2602 - SURFACE
      ?auto_2603 - SURFACE
    )
    :vars
    (
      ?auto_2604 - HOIST
      ?auto_2605 - PLACE
      ?auto_2607 - PLACE
      ?auto_2608 - HOIST
      ?auto_2609 - SURFACE
      ?auto_2606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2604 ?auto_2605 ) ( SURFACE-AT ?auto_2603 ?auto_2605 ) ( CLEAR ?auto_2603 ) ( IS-CRATE ?auto_2602 ) ( AVAILABLE ?auto_2604 ) ( not ( = ?auto_2607 ?auto_2605 ) ) ( HOIST-AT ?auto_2608 ?auto_2607 ) ( AVAILABLE ?auto_2608 ) ( SURFACE-AT ?auto_2602 ?auto_2607 ) ( ON ?auto_2602 ?auto_2609 ) ( CLEAR ?auto_2602 ) ( TRUCK-AT ?auto_2606 ?auto_2605 ) ( not ( = ?auto_2602 ?auto_2603 ) ) ( not ( = ?auto_2602 ?auto_2609 ) ) ( not ( = ?auto_2603 ?auto_2609 ) ) ( not ( = ?auto_2604 ?auto_2608 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2606 ?auto_2605 ?auto_2607 )
      ( !LIFT ?auto_2608 ?auto_2602 ?auto_2609 ?auto_2607 )
      ( !LOAD ?auto_2608 ?auto_2602 ?auto_2606 ?auto_2607 )
      ( !DRIVE ?auto_2606 ?auto_2607 ?auto_2605 )
      ( !UNLOAD ?auto_2604 ?auto_2602 ?auto_2606 ?auto_2605 )
      ( !DROP ?auto_2604 ?auto_2602 ?auto_2603 ?auto_2605 )
      ( MAKE-ON-VERIFY ?auto_2602 ?auto_2603 ) )
  )

)

