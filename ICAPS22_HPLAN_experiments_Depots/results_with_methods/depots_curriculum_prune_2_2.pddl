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
      ?auto_42 - SURFACE
      ?auto_43 - SURFACE
    )
    :vars
    (
      ?auto_44 - HOIST
      ?auto_45 - PLACE
      ?auto_47 - PLACE
      ?auto_48 - HOIST
      ?auto_49 - SURFACE
      ?auto_46 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44 ?auto_45 ) ( SURFACE-AT ?auto_43 ?auto_45 ) ( CLEAR ?auto_43 ) ( IS-CRATE ?auto_42 ) ( AVAILABLE ?auto_44 ) ( not ( = ?auto_47 ?auto_45 ) ) ( HOIST-AT ?auto_48 ?auto_47 ) ( AVAILABLE ?auto_48 ) ( SURFACE-AT ?auto_42 ?auto_47 ) ( ON ?auto_42 ?auto_49 ) ( CLEAR ?auto_42 ) ( TRUCK-AT ?auto_46 ?auto_45 ) ( not ( = ?auto_42 ?auto_43 ) ) ( not ( = ?auto_42 ?auto_49 ) ) ( not ( = ?auto_43 ?auto_49 ) ) ( not ( = ?auto_44 ?auto_48 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46 ?auto_45 ?auto_47 )
      ( !LIFT ?auto_48 ?auto_42 ?auto_49 ?auto_47 )
      ( !LOAD ?auto_48 ?auto_42 ?auto_46 ?auto_47 )
      ( !DRIVE ?auto_46 ?auto_47 ?auto_45 )
      ( !UNLOAD ?auto_44 ?auto_42 ?auto_46 ?auto_45 )
      ( !DROP ?auto_44 ?auto_42 ?auto_43 ?auto_45 )
      ( MAKE-ON-VERIFY ?auto_42 ?auto_43 ) )
  )

)

