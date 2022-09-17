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
      ?auto_1672 - SURFACE
      ?auto_1673 - SURFACE
    )
    :vars
    (
      ?auto_1674 - HOIST
      ?auto_1675 - PLACE
      ?auto_1677 - PLACE
      ?auto_1678 - HOIST
      ?auto_1679 - SURFACE
      ?auto_1676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1674 ?auto_1675 ) ( SURFACE-AT ?auto_1673 ?auto_1675 ) ( CLEAR ?auto_1673 ) ( IS-CRATE ?auto_1672 ) ( AVAILABLE ?auto_1674 ) ( not ( = ?auto_1677 ?auto_1675 ) ) ( HOIST-AT ?auto_1678 ?auto_1677 ) ( AVAILABLE ?auto_1678 ) ( SURFACE-AT ?auto_1672 ?auto_1677 ) ( ON ?auto_1672 ?auto_1679 ) ( CLEAR ?auto_1672 ) ( TRUCK-AT ?auto_1676 ?auto_1675 ) ( not ( = ?auto_1672 ?auto_1673 ) ) ( not ( = ?auto_1672 ?auto_1679 ) ) ( not ( = ?auto_1673 ?auto_1679 ) ) ( not ( = ?auto_1674 ?auto_1678 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1676 ?auto_1675 ?auto_1677 )
      ( !LIFT ?auto_1678 ?auto_1672 ?auto_1679 ?auto_1677 )
      ( !LOAD ?auto_1678 ?auto_1672 ?auto_1676 ?auto_1677 )
      ( !DRIVE ?auto_1676 ?auto_1677 ?auto_1675 )
      ( !UNLOAD ?auto_1674 ?auto_1672 ?auto_1676 ?auto_1675 )
      ( !DROP ?auto_1674 ?auto_1672 ?auto_1673 ?auto_1675 )
      ( MAKE-ON-VERIFY ?auto_1672 ?auto_1673 ) )
  )

)

