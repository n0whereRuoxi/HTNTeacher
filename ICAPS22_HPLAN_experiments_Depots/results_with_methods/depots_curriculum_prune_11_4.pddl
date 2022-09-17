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
      ?auto_3142 - SURFACE
      ?auto_3143 - SURFACE
    )
    :vars
    (
      ?auto_3144 - HOIST
      ?auto_3145 - PLACE
      ?auto_3147 - PLACE
      ?auto_3148 - HOIST
      ?auto_3149 - SURFACE
      ?auto_3146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3144 ?auto_3145 ) ( SURFACE-AT ?auto_3143 ?auto_3145 ) ( CLEAR ?auto_3143 ) ( IS-CRATE ?auto_3142 ) ( AVAILABLE ?auto_3144 ) ( not ( = ?auto_3147 ?auto_3145 ) ) ( HOIST-AT ?auto_3148 ?auto_3147 ) ( AVAILABLE ?auto_3148 ) ( SURFACE-AT ?auto_3142 ?auto_3147 ) ( ON ?auto_3142 ?auto_3149 ) ( CLEAR ?auto_3142 ) ( TRUCK-AT ?auto_3146 ?auto_3145 ) ( not ( = ?auto_3142 ?auto_3143 ) ) ( not ( = ?auto_3142 ?auto_3149 ) ) ( not ( = ?auto_3143 ?auto_3149 ) ) ( not ( = ?auto_3144 ?auto_3148 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3146 ?auto_3145 ?auto_3147 )
      ( !LIFT ?auto_3148 ?auto_3142 ?auto_3149 ?auto_3147 )
      ( !LOAD ?auto_3148 ?auto_3142 ?auto_3146 ?auto_3147 )
      ( !DRIVE ?auto_3146 ?auto_3147 ?auto_3145 )
      ( !UNLOAD ?auto_3144 ?auto_3142 ?auto_3146 ?auto_3145 )
      ( !DROP ?auto_3144 ?auto_3142 ?auto_3143 ?auto_3145 )
      ( MAKE-ON-VERIFY ?auto_3142 ?auto_3143 ) )
  )

)

