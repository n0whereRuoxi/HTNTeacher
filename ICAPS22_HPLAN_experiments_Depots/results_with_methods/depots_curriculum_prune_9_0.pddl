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
      ?auto_1752 - SURFACE
      ?auto_1753 - SURFACE
    )
    :vars
    (
      ?auto_1754 - HOIST
      ?auto_1755 - PLACE
      ?auto_1757 - PLACE
      ?auto_1758 - HOIST
      ?auto_1759 - SURFACE
      ?auto_1756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1754 ?auto_1755 ) ( SURFACE-AT ?auto_1753 ?auto_1755 ) ( CLEAR ?auto_1753 ) ( IS-CRATE ?auto_1752 ) ( AVAILABLE ?auto_1754 ) ( not ( = ?auto_1757 ?auto_1755 ) ) ( HOIST-AT ?auto_1758 ?auto_1757 ) ( AVAILABLE ?auto_1758 ) ( SURFACE-AT ?auto_1752 ?auto_1757 ) ( ON ?auto_1752 ?auto_1759 ) ( CLEAR ?auto_1752 ) ( TRUCK-AT ?auto_1756 ?auto_1755 ) ( not ( = ?auto_1752 ?auto_1753 ) ) ( not ( = ?auto_1752 ?auto_1759 ) ) ( not ( = ?auto_1753 ?auto_1759 ) ) ( not ( = ?auto_1754 ?auto_1758 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1756 ?auto_1755 ?auto_1757 )
      ( !LIFT ?auto_1758 ?auto_1752 ?auto_1759 ?auto_1757 )
      ( !LOAD ?auto_1758 ?auto_1752 ?auto_1756 ?auto_1757 )
      ( !DRIVE ?auto_1756 ?auto_1757 ?auto_1755 )
      ( !UNLOAD ?auto_1754 ?auto_1752 ?auto_1756 ?auto_1755 )
      ( !DROP ?auto_1754 ?auto_1752 ?auto_1753 ?auto_1755 )
      ( MAKE-ON-VERIFY ?auto_1752 ?auto_1753 ) )
  )

)
