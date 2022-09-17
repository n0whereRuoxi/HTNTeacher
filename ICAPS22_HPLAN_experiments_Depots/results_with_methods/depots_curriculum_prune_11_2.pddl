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
      ?auto_2922 - SURFACE
      ?auto_2923 - SURFACE
    )
    :vars
    (
      ?auto_2924 - HOIST
      ?auto_2925 - PLACE
      ?auto_2927 - PLACE
      ?auto_2928 - HOIST
      ?auto_2929 - SURFACE
      ?auto_2926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2924 ?auto_2925 ) ( SURFACE-AT ?auto_2923 ?auto_2925 ) ( CLEAR ?auto_2923 ) ( IS-CRATE ?auto_2922 ) ( AVAILABLE ?auto_2924 ) ( not ( = ?auto_2927 ?auto_2925 ) ) ( HOIST-AT ?auto_2928 ?auto_2927 ) ( AVAILABLE ?auto_2928 ) ( SURFACE-AT ?auto_2922 ?auto_2927 ) ( ON ?auto_2922 ?auto_2929 ) ( CLEAR ?auto_2922 ) ( TRUCK-AT ?auto_2926 ?auto_2925 ) ( not ( = ?auto_2922 ?auto_2923 ) ) ( not ( = ?auto_2922 ?auto_2929 ) ) ( not ( = ?auto_2923 ?auto_2929 ) ) ( not ( = ?auto_2924 ?auto_2928 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2926 ?auto_2925 ?auto_2927 )
      ( !LIFT ?auto_2928 ?auto_2922 ?auto_2929 ?auto_2927 )
      ( !LOAD ?auto_2928 ?auto_2922 ?auto_2926 ?auto_2927 )
      ( !DRIVE ?auto_2926 ?auto_2927 ?auto_2925 )
      ( !UNLOAD ?auto_2924 ?auto_2922 ?auto_2926 ?auto_2925 )
      ( !DROP ?auto_2924 ?auto_2922 ?auto_2923 ?auto_2925 )
      ( MAKE-ON-VERIFY ?auto_2922 ?auto_2923 ) )
  )

)

