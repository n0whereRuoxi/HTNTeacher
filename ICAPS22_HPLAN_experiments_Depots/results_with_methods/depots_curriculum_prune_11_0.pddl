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
      ?auto_2702 - SURFACE
      ?auto_2703 - SURFACE
    )
    :vars
    (
      ?auto_2704 - HOIST
      ?auto_2705 - PLACE
      ?auto_2707 - PLACE
      ?auto_2708 - HOIST
      ?auto_2709 - SURFACE
      ?auto_2706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2704 ?auto_2705 ) ( SURFACE-AT ?auto_2703 ?auto_2705 ) ( CLEAR ?auto_2703 ) ( IS-CRATE ?auto_2702 ) ( AVAILABLE ?auto_2704 ) ( not ( = ?auto_2707 ?auto_2705 ) ) ( HOIST-AT ?auto_2708 ?auto_2707 ) ( AVAILABLE ?auto_2708 ) ( SURFACE-AT ?auto_2702 ?auto_2707 ) ( ON ?auto_2702 ?auto_2709 ) ( CLEAR ?auto_2702 ) ( TRUCK-AT ?auto_2706 ?auto_2705 ) ( not ( = ?auto_2702 ?auto_2703 ) ) ( not ( = ?auto_2702 ?auto_2709 ) ) ( not ( = ?auto_2703 ?auto_2709 ) ) ( not ( = ?auto_2704 ?auto_2708 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2706 ?auto_2705 ?auto_2707 )
      ( !LIFT ?auto_2708 ?auto_2702 ?auto_2709 ?auto_2707 )
      ( !LOAD ?auto_2708 ?auto_2702 ?auto_2706 ?auto_2707 )
      ( !DRIVE ?auto_2706 ?auto_2707 ?auto_2705 )
      ( !UNLOAD ?auto_2704 ?auto_2702 ?auto_2706 ?auto_2705 )
      ( !DROP ?auto_2704 ?auto_2702 ?auto_2703 ?auto_2705 )
      ( MAKE-ON-VERIFY ?auto_2702 ?auto_2703 ) )
  )

)

