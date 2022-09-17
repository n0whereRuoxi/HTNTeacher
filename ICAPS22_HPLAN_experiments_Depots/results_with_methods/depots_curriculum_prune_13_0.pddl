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
      ?auto_3852 - SURFACE
      ?auto_3853 - SURFACE
    )
    :vars
    (
      ?auto_3854 - HOIST
      ?auto_3855 - PLACE
      ?auto_3857 - PLACE
      ?auto_3858 - HOIST
      ?auto_3859 - SURFACE
      ?auto_3856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3854 ?auto_3855 ) ( SURFACE-AT ?auto_3853 ?auto_3855 ) ( CLEAR ?auto_3853 ) ( IS-CRATE ?auto_3852 ) ( AVAILABLE ?auto_3854 ) ( not ( = ?auto_3857 ?auto_3855 ) ) ( HOIST-AT ?auto_3858 ?auto_3857 ) ( AVAILABLE ?auto_3858 ) ( SURFACE-AT ?auto_3852 ?auto_3857 ) ( ON ?auto_3852 ?auto_3859 ) ( CLEAR ?auto_3852 ) ( TRUCK-AT ?auto_3856 ?auto_3855 ) ( not ( = ?auto_3852 ?auto_3853 ) ) ( not ( = ?auto_3852 ?auto_3859 ) ) ( not ( = ?auto_3853 ?auto_3859 ) ) ( not ( = ?auto_3854 ?auto_3858 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3856 ?auto_3855 ?auto_3857 )
      ( !LIFT ?auto_3858 ?auto_3852 ?auto_3859 ?auto_3857 )
      ( !LOAD ?auto_3858 ?auto_3852 ?auto_3856 ?auto_3857 )
      ( !DRIVE ?auto_3856 ?auto_3857 ?auto_3855 )
      ( !UNLOAD ?auto_3854 ?auto_3852 ?auto_3856 ?auto_3855 )
      ( !DROP ?auto_3854 ?auto_3852 ?auto_3853 ?auto_3855 )
      ( MAKE-ON-VERIFY ?auto_3852 ?auto_3853 ) )
  )

)

