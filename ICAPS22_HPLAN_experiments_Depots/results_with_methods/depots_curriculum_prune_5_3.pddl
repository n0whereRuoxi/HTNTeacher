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
      ?auto_602 - SURFACE
      ?auto_603 - SURFACE
    )
    :vars
    (
      ?auto_604 - HOIST
      ?auto_605 - PLACE
      ?auto_607 - PLACE
      ?auto_608 - HOIST
      ?auto_609 - SURFACE
      ?auto_606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_604 ?auto_605 ) ( SURFACE-AT ?auto_603 ?auto_605 ) ( CLEAR ?auto_603 ) ( IS-CRATE ?auto_602 ) ( AVAILABLE ?auto_604 ) ( not ( = ?auto_607 ?auto_605 ) ) ( HOIST-AT ?auto_608 ?auto_607 ) ( AVAILABLE ?auto_608 ) ( SURFACE-AT ?auto_602 ?auto_607 ) ( ON ?auto_602 ?auto_609 ) ( CLEAR ?auto_602 ) ( TRUCK-AT ?auto_606 ?auto_605 ) ( not ( = ?auto_602 ?auto_603 ) ) ( not ( = ?auto_602 ?auto_609 ) ) ( not ( = ?auto_603 ?auto_609 ) ) ( not ( = ?auto_604 ?auto_608 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_606 ?auto_605 ?auto_607 )
      ( !LIFT ?auto_608 ?auto_602 ?auto_609 ?auto_607 )
      ( !LOAD ?auto_608 ?auto_602 ?auto_606 ?auto_607 )
      ( !DRIVE ?auto_606 ?auto_607 ?auto_605 )
      ( !UNLOAD ?auto_604 ?auto_602 ?auto_606 ?auto_605 )
      ( !DROP ?auto_604 ?auto_602 ?auto_603 ?auto_605 )
      ( MAKE-ON-VERIFY ?auto_602 ?auto_603 ) )
  )

)

