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
      ?auto_4922 - SURFACE
      ?auto_4923 - SURFACE
    )
    :vars
    (
      ?auto_4924 - HOIST
      ?auto_4925 - PLACE
      ?auto_4927 - PLACE
      ?auto_4928 - HOIST
      ?auto_4929 - SURFACE
      ?auto_4926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4924 ?auto_4925 ) ( SURFACE-AT ?auto_4923 ?auto_4925 ) ( CLEAR ?auto_4923 ) ( IS-CRATE ?auto_4922 ) ( AVAILABLE ?auto_4924 ) ( not ( = ?auto_4927 ?auto_4925 ) ) ( HOIST-AT ?auto_4928 ?auto_4927 ) ( AVAILABLE ?auto_4928 ) ( SURFACE-AT ?auto_4922 ?auto_4927 ) ( ON ?auto_4922 ?auto_4929 ) ( CLEAR ?auto_4922 ) ( TRUCK-AT ?auto_4926 ?auto_4925 ) ( not ( = ?auto_4922 ?auto_4923 ) ) ( not ( = ?auto_4922 ?auto_4929 ) ) ( not ( = ?auto_4923 ?auto_4929 ) ) ( not ( = ?auto_4924 ?auto_4928 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4926 ?auto_4925 ?auto_4927 )
      ( !LIFT ?auto_4928 ?auto_4922 ?auto_4929 ?auto_4927 )
      ( !LOAD ?auto_4928 ?auto_4922 ?auto_4926 ?auto_4927 )
      ( !DRIVE ?auto_4926 ?auto_4927 ?auto_4925 )
      ( !UNLOAD ?auto_4924 ?auto_4922 ?auto_4926 ?auto_4925 )
      ( !DROP ?auto_4924 ?auto_4922 ?auto_4923 ?auto_4925 )
      ( MAKE-ON-VERIFY ?auto_4922 ?auto_4923 ) )
  )

)

