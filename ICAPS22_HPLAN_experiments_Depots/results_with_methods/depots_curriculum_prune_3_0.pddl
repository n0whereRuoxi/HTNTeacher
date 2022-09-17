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
      ?auto_102 - SURFACE
      ?auto_103 - SURFACE
    )
    :vars
    (
      ?auto_104 - HOIST
      ?auto_105 - PLACE
      ?auto_107 - PLACE
      ?auto_108 - HOIST
      ?auto_109 - SURFACE
      ?auto_106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_104 ?auto_105 ) ( SURFACE-AT ?auto_103 ?auto_105 ) ( CLEAR ?auto_103 ) ( IS-CRATE ?auto_102 ) ( AVAILABLE ?auto_104 ) ( not ( = ?auto_107 ?auto_105 ) ) ( HOIST-AT ?auto_108 ?auto_107 ) ( AVAILABLE ?auto_108 ) ( SURFACE-AT ?auto_102 ?auto_107 ) ( ON ?auto_102 ?auto_109 ) ( CLEAR ?auto_102 ) ( TRUCK-AT ?auto_106 ?auto_105 ) ( not ( = ?auto_102 ?auto_103 ) ) ( not ( = ?auto_102 ?auto_109 ) ) ( not ( = ?auto_103 ?auto_109 ) ) ( not ( = ?auto_104 ?auto_108 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_106 ?auto_105 ?auto_107 )
      ( !LIFT ?auto_108 ?auto_102 ?auto_109 ?auto_107 )
      ( !LOAD ?auto_108 ?auto_102 ?auto_106 ?auto_107 )
      ( !DRIVE ?auto_106 ?auto_107 ?auto_105 )
      ( !UNLOAD ?auto_104 ?auto_102 ?auto_106 ?auto_105 )
      ( !DROP ?auto_104 ?auto_102 ?auto_103 ?auto_105 )
      ( MAKE-ON-VERIFY ?auto_102 ?auto_103 ) )
  )

)

