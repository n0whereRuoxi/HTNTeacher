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
      ?auto_4782 - SURFACE
      ?auto_4783 - SURFACE
    )
    :vars
    (
      ?auto_4784 - HOIST
      ?auto_4785 - PLACE
      ?auto_4787 - PLACE
      ?auto_4788 - HOIST
      ?auto_4789 - SURFACE
      ?auto_4786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4784 ?auto_4785 ) ( SURFACE-AT ?auto_4783 ?auto_4785 ) ( CLEAR ?auto_4783 ) ( IS-CRATE ?auto_4782 ) ( AVAILABLE ?auto_4784 ) ( not ( = ?auto_4787 ?auto_4785 ) ) ( HOIST-AT ?auto_4788 ?auto_4787 ) ( AVAILABLE ?auto_4788 ) ( SURFACE-AT ?auto_4782 ?auto_4787 ) ( ON ?auto_4782 ?auto_4789 ) ( CLEAR ?auto_4782 ) ( TRUCK-AT ?auto_4786 ?auto_4785 ) ( not ( = ?auto_4782 ?auto_4783 ) ) ( not ( = ?auto_4782 ?auto_4789 ) ) ( not ( = ?auto_4783 ?auto_4789 ) ) ( not ( = ?auto_4784 ?auto_4788 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4786 ?auto_4785 ?auto_4787 )
      ( !LIFT ?auto_4788 ?auto_4782 ?auto_4789 ?auto_4787 )
      ( !LOAD ?auto_4788 ?auto_4782 ?auto_4786 ?auto_4787 )
      ( !DRIVE ?auto_4786 ?auto_4787 ?auto_4785 )
      ( !UNLOAD ?auto_4784 ?auto_4782 ?auto_4786 ?auto_4785 )
      ( !DROP ?auto_4784 ?auto_4782 ?auto_4783 ?auto_4785 )
      ( MAKE-ON-VERIFY ?auto_4782 ?auto_4783 ) )
  )

)

