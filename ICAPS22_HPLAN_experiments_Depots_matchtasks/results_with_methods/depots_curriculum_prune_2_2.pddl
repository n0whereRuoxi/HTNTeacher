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
      ?auto_72 - SURFACE
      ?auto_73 - SURFACE
    )
    :vars
    (
      ?auto_74 - HOIST
      ?auto_75 - PLACE
      ?auto_77 - PLACE
      ?auto_78 - HOIST
      ?auto_79 - SURFACE
      ?auto_76 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74 ?auto_75 ) ( SURFACE-AT ?auto_72 ?auto_75 ) ( CLEAR ?auto_72 ) ( IS-CRATE ?auto_73 ) ( AVAILABLE ?auto_74 ) ( not ( = ?auto_77 ?auto_75 ) ) ( HOIST-AT ?auto_78 ?auto_77 ) ( AVAILABLE ?auto_78 ) ( SURFACE-AT ?auto_73 ?auto_77 ) ( ON ?auto_73 ?auto_79 ) ( CLEAR ?auto_73 ) ( TRUCK-AT ?auto_76 ?auto_75 ) ( not ( = ?auto_72 ?auto_73 ) ) ( not ( = ?auto_72 ?auto_79 ) ) ( not ( = ?auto_73 ?auto_79 ) ) ( not ( = ?auto_74 ?auto_78 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_76 ?auto_75 ?auto_77 )
      ( !LIFT ?auto_78 ?auto_73 ?auto_79 ?auto_77 )
      ( !LOAD ?auto_78 ?auto_73 ?auto_76 ?auto_77 )
      ( !DRIVE ?auto_76 ?auto_77 ?auto_75 )
      ( !UNLOAD ?auto_74 ?auto_73 ?auto_76 ?auto_75 )
      ( !DROP ?auto_74 ?auto_73 ?auto_72 ?auto_75 )
      ( MAKE-1CRATE-VERIFY ?auto_72 ?auto_73 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_93 - SURFACE
      ?auto_94 - SURFACE
      ?auto_95 - SURFACE
    )
    :vars
    (
      ?auto_98 - HOIST
      ?auto_96 - PLACE
      ?auto_99 - PLACE
      ?auto_97 - HOIST
      ?auto_101 - SURFACE
      ?auto_102 - SURFACE
      ?auto_100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98 ?auto_96 ) ( IS-CRATE ?auto_95 ) ( not ( = ?auto_99 ?auto_96 ) ) ( HOIST-AT ?auto_97 ?auto_99 ) ( SURFACE-AT ?auto_95 ?auto_99 ) ( ON ?auto_95 ?auto_101 ) ( CLEAR ?auto_95 ) ( not ( = ?auto_94 ?auto_95 ) ) ( not ( = ?auto_94 ?auto_101 ) ) ( not ( = ?auto_95 ?auto_101 ) ) ( not ( = ?auto_98 ?auto_97 ) ) ( SURFACE-AT ?auto_93 ?auto_96 ) ( CLEAR ?auto_93 ) ( IS-CRATE ?auto_94 ) ( AVAILABLE ?auto_98 ) ( AVAILABLE ?auto_97 ) ( SURFACE-AT ?auto_94 ?auto_99 ) ( ON ?auto_94 ?auto_102 ) ( CLEAR ?auto_94 ) ( TRUCK-AT ?auto_100 ?auto_96 ) ( not ( = ?auto_93 ?auto_94 ) ) ( not ( = ?auto_93 ?auto_102 ) ) ( not ( = ?auto_94 ?auto_102 ) ) ( not ( = ?auto_93 ?auto_95 ) ) ( not ( = ?auto_93 ?auto_101 ) ) ( not ( = ?auto_95 ?auto_102 ) ) ( not ( = ?auto_101 ?auto_102 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_93 ?auto_94 )
      ( MAKE-1CRATE ?auto_94 ?auto_95 )
      ( MAKE-2CRATE-VERIFY ?auto_93 ?auto_94 ?auto_95 ) )
  )

)

