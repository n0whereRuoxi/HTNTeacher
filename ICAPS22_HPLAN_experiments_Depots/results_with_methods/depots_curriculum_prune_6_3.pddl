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
      ?auto_882 - SURFACE
      ?auto_883 - SURFACE
    )
    :vars
    (
      ?auto_884 - HOIST
      ?auto_885 - PLACE
      ?auto_887 - PLACE
      ?auto_888 - HOIST
      ?auto_889 - SURFACE
      ?auto_886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_884 ?auto_885 ) ( SURFACE-AT ?auto_883 ?auto_885 ) ( CLEAR ?auto_883 ) ( IS-CRATE ?auto_882 ) ( AVAILABLE ?auto_884 ) ( not ( = ?auto_887 ?auto_885 ) ) ( HOIST-AT ?auto_888 ?auto_887 ) ( AVAILABLE ?auto_888 ) ( SURFACE-AT ?auto_882 ?auto_887 ) ( ON ?auto_882 ?auto_889 ) ( CLEAR ?auto_882 ) ( TRUCK-AT ?auto_886 ?auto_885 ) ( not ( = ?auto_882 ?auto_883 ) ) ( not ( = ?auto_882 ?auto_889 ) ) ( not ( = ?auto_883 ?auto_889 ) ) ( not ( = ?auto_884 ?auto_888 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_886 ?auto_885 ?auto_887 )
      ( !LIFT ?auto_888 ?auto_882 ?auto_889 ?auto_887 )
      ( !LOAD ?auto_888 ?auto_882 ?auto_886 ?auto_887 )
      ( !DRIVE ?auto_886 ?auto_887 ?auto_885 )
      ( !UNLOAD ?auto_884 ?auto_882 ?auto_886 ?auto_885 )
      ( !DROP ?auto_884 ?auto_882 ?auto_883 ?auto_885 )
      ( MAKE-ON-VERIFY ?auto_882 ?auto_883 ) )
  )

)

