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
      ?auto_82 - SURFACE
      ?auto_83 - SURFACE
    )
    :vars
    (
      ?auto_84 - HOIST
      ?auto_85 - PLACE
      ?auto_87 - PLACE
      ?auto_88 - HOIST
      ?auto_89 - SURFACE
      ?auto_86 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_84 ?auto_85 ) ( SURFACE-AT ?auto_83 ?auto_85 ) ( CLEAR ?auto_83 ) ( IS-CRATE ?auto_82 ) ( AVAILABLE ?auto_84 ) ( not ( = ?auto_87 ?auto_85 ) ) ( HOIST-AT ?auto_88 ?auto_87 ) ( AVAILABLE ?auto_88 ) ( SURFACE-AT ?auto_82 ?auto_87 ) ( ON ?auto_82 ?auto_89 ) ( CLEAR ?auto_82 ) ( TRUCK-AT ?auto_86 ?auto_85 ) ( not ( = ?auto_82 ?auto_83 ) ) ( not ( = ?auto_82 ?auto_89 ) ) ( not ( = ?auto_83 ?auto_89 ) ) ( not ( = ?auto_84 ?auto_88 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_86 ?auto_85 ?auto_87 )
      ( !LIFT ?auto_88 ?auto_82 ?auto_89 ?auto_87 )
      ( !LOAD ?auto_88 ?auto_82 ?auto_86 ?auto_87 )
      ( !DRIVE ?auto_86 ?auto_87 ?auto_85 )
      ( !UNLOAD ?auto_84 ?auto_82 ?auto_86 ?auto_85 )
      ( !DROP ?auto_84 ?auto_82 ?auto_83 ?auto_85 )
      ( MAKE-ON-VERIFY ?auto_82 ?auto_83 ) )
  )

)

