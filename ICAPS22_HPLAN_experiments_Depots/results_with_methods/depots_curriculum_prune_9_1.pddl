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
      ?auto_1842 - SURFACE
      ?auto_1843 - SURFACE
    )
    :vars
    (
      ?auto_1844 - HOIST
      ?auto_1845 - PLACE
      ?auto_1847 - PLACE
      ?auto_1848 - HOIST
      ?auto_1849 - SURFACE
      ?auto_1846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1844 ?auto_1845 ) ( SURFACE-AT ?auto_1843 ?auto_1845 ) ( CLEAR ?auto_1843 ) ( IS-CRATE ?auto_1842 ) ( AVAILABLE ?auto_1844 ) ( not ( = ?auto_1847 ?auto_1845 ) ) ( HOIST-AT ?auto_1848 ?auto_1847 ) ( AVAILABLE ?auto_1848 ) ( SURFACE-AT ?auto_1842 ?auto_1847 ) ( ON ?auto_1842 ?auto_1849 ) ( CLEAR ?auto_1842 ) ( TRUCK-AT ?auto_1846 ?auto_1845 ) ( not ( = ?auto_1842 ?auto_1843 ) ) ( not ( = ?auto_1842 ?auto_1849 ) ) ( not ( = ?auto_1843 ?auto_1849 ) ) ( not ( = ?auto_1844 ?auto_1848 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1846 ?auto_1845 ?auto_1847 )
      ( !LIFT ?auto_1848 ?auto_1842 ?auto_1849 ?auto_1847 )
      ( !LOAD ?auto_1848 ?auto_1842 ?auto_1846 ?auto_1847 )
      ( !DRIVE ?auto_1846 ?auto_1847 ?auto_1845 )
      ( !UNLOAD ?auto_1844 ?auto_1842 ?auto_1846 ?auto_1845 )
      ( !DROP ?auto_1844 ?auto_1842 ?auto_1843 ?auto_1845 )
      ( MAKE-ON-VERIFY ?auto_1842 ?auto_1843 ) )
  )

)

