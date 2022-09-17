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
      ?auto_3982 - SURFACE
      ?auto_3983 - SURFACE
    )
    :vars
    (
      ?auto_3984 - HOIST
      ?auto_3985 - PLACE
      ?auto_3987 - PLACE
      ?auto_3988 - HOIST
      ?auto_3989 - SURFACE
      ?auto_3986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3984 ?auto_3985 ) ( SURFACE-AT ?auto_3983 ?auto_3985 ) ( CLEAR ?auto_3983 ) ( IS-CRATE ?auto_3982 ) ( AVAILABLE ?auto_3984 ) ( not ( = ?auto_3987 ?auto_3985 ) ) ( HOIST-AT ?auto_3988 ?auto_3987 ) ( AVAILABLE ?auto_3988 ) ( SURFACE-AT ?auto_3982 ?auto_3987 ) ( ON ?auto_3982 ?auto_3989 ) ( CLEAR ?auto_3982 ) ( TRUCK-AT ?auto_3986 ?auto_3985 ) ( not ( = ?auto_3982 ?auto_3983 ) ) ( not ( = ?auto_3982 ?auto_3989 ) ) ( not ( = ?auto_3983 ?auto_3989 ) ) ( not ( = ?auto_3984 ?auto_3988 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3986 ?auto_3985 ?auto_3987 )
      ( !LIFT ?auto_3988 ?auto_3982 ?auto_3989 ?auto_3987 )
      ( !LOAD ?auto_3988 ?auto_3982 ?auto_3986 ?auto_3987 )
      ( !DRIVE ?auto_3986 ?auto_3987 ?auto_3985 )
      ( !UNLOAD ?auto_3984 ?auto_3982 ?auto_3986 ?auto_3985 )
      ( !DROP ?auto_3984 ?auto_3982 ?auto_3983 ?auto_3985 )
      ( MAKE-ON-VERIFY ?auto_3982 ?auto_3983 ) )
  )

)

