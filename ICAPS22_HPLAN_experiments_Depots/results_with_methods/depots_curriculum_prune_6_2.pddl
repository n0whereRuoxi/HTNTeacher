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
      ?auto_822 - SURFACE
      ?auto_823 - SURFACE
    )
    :vars
    (
      ?auto_824 - HOIST
      ?auto_825 - PLACE
      ?auto_827 - PLACE
      ?auto_828 - HOIST
      ?auto_829 - SURFACE
      ?auto_826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_824 ?auto_825 ) ( SURFACE-AT ?auto_823 ?auto_825 ) ( CLEAR ?auto_823 ) ( IS-CRATE ?auto_822 ) ( AVAILABLE ?auto_824 ) ( not ( = ?auto_827 ?auto_825 ) ) ( HOIST-AT ?auto_828 ?auto_827 ) ( AVAILABLE ?auto_828 ) ( SURFACE-AT ?auto_822 ?auto_827 ) ( ON ?auto_822 ?auto_829 ) ( CLEAR ?auto_822 ) ( TRUCK-AT ?auto_826 ?auto_825 ) ( not ( = ?auto_822 ?auto_823 ) ) ( not ( = ?auto_822 ?auto_829 ) ) ( not ( = ?auto_823 ?auto_829 ) ) ( not ( = ?auto_824 ?auto_828 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_826 ?auto_825 ?auto_827 )
      ( !LIFT ?auto_828 ?auto_822 ?auto_829 ?auto_827 )
      ( !LOAD ?auto_828 ?auto_822 ?auto_826 ?auto_827 )
      ( !DRIVE ?auto_826 ?auto_827 ?auto_825 )
      ( !UNLOAD ?auto_824 ?auto_822 ?auto_826 ?auto_825 )
      ( !DROP ?auto_824 ?auto_822 ?auto_823 ?auto_825 )
      ( MAKE-ON-VERIFY ?auto_822 ?auto_823 ) )
  )

)

