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
      ?auto_702 - SURFACE
      ?auto_703 - SURFACE
    )
    :vars
    (
      ?auto_704 - HOIST
      ?auto_705 - PLACE
      ?auto_707 - PLACE
      ?auto_708 - HOIST
      ?auto_709 - SURFACE
      ?auto_706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_704 ?auto_705 ) ( SURFACE-AT ?auto_703 ?auto_705 ) ( CLEAR ?auto_703 ) ( IS-CRATE ?auto_702 ) ( AVAILABLE ?auto_704 ) ( not ( = ?auto_707 ?auto_705 ) ) ( HOIST-AT ?auto_708 ?auto_707 ) ( AVAILABLE ?auto_708 ) ( SURFACE-AT ?auto_702 ?auto_707 ) ( ON ?auto_702 ?auto_709 ) ( CLEAR ?auto_702 ) ( TRUCK-AT ?auto_706 ?auto_705 ) ( not ( = ?auto_702 ?auto_703 ) ) ( not ( = ?auto_702 ?auto_709 ) ) ( not ( = ?auto_703 ?auto_709 ) ) ( not ( = ?auto_704 ?auto_708 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_706 ?auto_705 ?auto_707 )
      ( !LIFT ?auto_708 ?auto_702 ?auto_709 ?auto_707 )
      ( !LOAD ?auto_708 ?auto_702 ?auto_706 ?auto_707 )
      ( !DRIVE ?auto_706 ?auto_707 ?auto_705 )
      ( !UNLOAD ?auto_704 ?auto_702 ?auto_706 ?auto_705 )
      ( !DROP ?auto_704 ?auto_702 ?auto_703 ?auto_705 )
      ( MAKE-ON-VERIFY ?auto_702 ?auto_703 ) )
  )

)

