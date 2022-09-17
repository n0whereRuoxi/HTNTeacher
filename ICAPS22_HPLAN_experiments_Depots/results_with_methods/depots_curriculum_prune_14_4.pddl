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
      ?auto_5062 - SURFACE
      ?auto_5063 - SURFACE
    )
    :vars
    (
      ?auto_5064 - HOIST
      ?auto_5065 - PLACE
      ?auto_5067 - PLACE
      ?auto_5068 - HOIST
      ?auto_5069 - SURFACE
      ?auto_5066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5064 ?auto_5065 ) ( SURFACE-AT ?auto_5063 ?auto_5065 ) ( CLEAR ?auto_5063 ) ( IS-CRATE ?auto_5062 ) ( AVAILABLE ?auto_5064 ) ( not ( = ?auto_5067 ?auto_5065 ) ) ( HOIST-AT ?auto_5068 ?auto_5067 ) ( AVAILABLE ?auto_5068 ) ( SURFACE-AT ?auto_5062 ?auto_5067 ) ( ON ?auto_5062 ?auto_5069 ) ( CLEAR ?auto_5062 ) ( TRUCK-AT ?auto_5066 ?auto_5065 ) ( not ( = ?auto_5062 ?auto_5063 ) ) ( not ( = ?auto_5062 ?auto_5069 ) ) ( not ( = ?auto_5063 ?auto_5069 ) ) ( not ( = ?auto_5064 ?auto_5068 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5066 ?auto_5065 ?auto_5067 )
      ( !LIFT ?auto_5068 ?auto_5062 ?auto_5069 ?auto_5067 )
      ( !LOAD ?auto_5068 ?auto_5062 ?auto_5066 ?auto_5067 )
      ( !DRIVE ?auto_5066 ?auto_5067 ?auto_5065 )
      ( !UNLOAD ?auto_5064 ?auto_5062 ?auto_5066 ?auto_5065 )
      ( !DROP ?auto_5064 ?auto_5062 ?auto_5063 ?auto_5065 )
      ( MAKE-ON-VERIFY ?auto_5062 ?auto_5063 ) )
  )

)
