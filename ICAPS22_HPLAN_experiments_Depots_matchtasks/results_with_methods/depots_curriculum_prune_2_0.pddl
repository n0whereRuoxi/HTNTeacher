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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2 - SURFACE
      ?auto_3 - SURFACE
    )
    :vars
    (
      ?auto_4 - HOIST
      ?auto_5 - PLACE
      ?auto_7 - PLACE
      ?auto_8 - HOIST
      ?auto_9 - SURFACE
      ?auto_6 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4 ?auto_5 ) ( SURFACE-AT ?auto_2 ?auto_5 ) ( CLEAR ?auto_2 ) ( IS-CRATE ?auto_3 ) ( AVAILABLE ?auto_4 ) ( not ( = ?auto_7 ?auto_5 ) ) ( HOIST-AT ?auto_8 ?auto_7 ) ( AVAILABLE ?auto_8 ) ( SURFACE-AT ?auto_3 ?auto_7 ) ( ON ?auto_3 ?auto_9 ) ( CLEAR ?auto_3 ) ( TRUCK-AT ?auto_6 ?auto_5 ) ( not ( = ?auto_2 ?auto_3 ) ) ( not ( = ?auto_2 ?auto_9 ) ) ( not ( = ?auto_3 ?auto_9 ) ) ( not ( = ?auto_4 ?auto_8 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6 ?auto_5 ?auto_7 )
      ( !LIFT ?auto_8 ?auto_3 ?auto_9 ?auto_7 )
      ( !LOAD ?auto_8 ?auto_3 ?auto_6 ?auto_7 )
      ( !DRIVE ?auto_6 ?auto_7 ?auto_5 )
      ( !UNLOAD ?auto_4 ?auto_3 ?auto_6 ?auto_5 )
      ( !DROP ?auto_4 ?auto_3 ?auto_2 ?auto_5 )
      ( MAKE-1CRATE-VERIFY ?auto_2 ?auto_3 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23 - SURFACE
      ?auto_24 - SURFACE
      ?auto_25 - SURFACE
    )
    :vars
    (
      ?auto_27 - HOIST
      ?auto_31 - PLACE
      ?auto_26 - PLACE
      ?auto_28 - HOIST
      ?auto_30 - SURFACE
      ?auto_32 - PLACE
      ?auto_34 - HOIST
      ?auto_33 - SURFACE
      ?auto_29 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27 ?auto_31 ) ( IS-CRATE ?auto_25 ) ( not ( = ?auto_26 ?auto_31 ) ) ( HOIST-AT ?auto_28 ?auto_26 ) ( AVAILABLE ?auto_28 ) ( SURFACE-AT ?auto_25 ?auto_26 ) ( ON ?auto_25 ?auto_30 ) ( CLEAR ?auto_25 ) ( not ( = ?auto_24 ?auto_25 ) ) ( not ( = ?auto_24 ?auto_30 ) ) ( not ( = ?auto_25 ?auto_30 ) ) ( not ( = ?auto_27 ?auto_28 ) ) ( SURFACE-AT ?auto_23 ?auto_31 ) ( CLEAR ?auto_23 ) ( IS-CRATE ?auto_24 ) ( AVAILABLE ?auto_27 ) ( not ( = ?auto_32 ?auto_31 ) ) ( HOIST-AT ?auto_34 ?auto_32 ) ( AVAILABLE ?auto_34 ) ( SURFACE-AT ?auto_24 ?auto_32 ) ( ON ?auto_24 ?auto_33 ) ( CLEAR ?auto_24 ) ( TRUCK-AT ?auto_29 ?auto_31 ) ( not ( = ?auto_23 ?auto_24 ) ) ( not ( = ?auto_23 ?auto_33 ) ) ( not ( = ?auto_24 ?auto_33 ) ) ( not ( = ?auto_27 ?auto_34 ) ) ( not ( = ?auto_23 ?auto_25 ) ) ( not ( = ?auto_23 ?auto_30 ) ) ( not ( = ?auto_25 ?auto_33 ) ) ( not ( = ?auto_26 ?auto_32 ) ) ( not ( = ?auto_28 ?auto_34 ) ) ( not ( = ?auto_30 ?auto_33 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23 ?auto_24 )
      ( MAKE-1CRATE ?auto_24 ?auto_25 )
      ( MAKE-2CRATE-VERIFY ?auto_23 ?auto_24 ?auto_25 ) )
  )

)

