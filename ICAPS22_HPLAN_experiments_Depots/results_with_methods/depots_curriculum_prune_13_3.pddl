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
      ?auto_4242 - SURFACE
      ?auto_4243 - SURFACE
    )
    :vars
    (
      ?auto_4244 - HOIST
      ?auto_4245 - PLACE
      ?auto_4247 - PLACE
      ?auto_4248 - HOIST
      ?auto_4249 - SURFACE
      ?auto_4246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4244 ?auto_4245 ) ( SURFACE-AT ?auto_4243 ?auto_4245 ) ( CLEAR ?auto_4243 ) ( IS-CRATE ?auto_4242 ) ( AVAILABLE ?auto_4244 ) ( not ( = ?auto_4247 ?auto_4245 ) ) ( HOIST-AT ?auto_4248 ?auto_4247 ) ( AVAILABLE ?auto_4248 ) ( SURFACE-AT ?auto_4242 ?auto_4247 ) ( ON ?auto_4242 ?auto_4249 ) ( CLEAR ?auto_4242 ) ( TRUCK-AT ?auto_4246 ?auto_4245 ) ( not ( = ?auto_4242 ?auto_4243 ) ) ( not ( = ?auto_4242 ?auto_4249 ) ) ( not ( = ?auto_4243 ?auto_4249 ) ) ( not ( = ?auto_4244 ?auto_4248 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4246 ?auto_4245 ?auto_4247 )
      ( !LIFT ?auto_4248 ?auto_4242 ?auto_4249 ?auto_4247 )
      ( !LOAD ?auto_4248 ?auto_4242 ?auto_4246 ?auto_4247 )
      ( !DRIVE ?auto_4246 ?auto_4247 ?auto_4245 )
      ( !UNLOAD ?auto_4244 ?auto_4242 ?auto_4246 ?auto_4245 )
      ( !DROP ?auto_4244 ?auto_4242 ?auto_4243 ?auto_4245 )
      ( MAKE-ON-VERIFY ?auto_4242 ?auto_4243 ) )
  )

)

