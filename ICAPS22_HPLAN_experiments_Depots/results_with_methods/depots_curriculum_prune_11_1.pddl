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
      ?auto_2812 - SURFACE
      ?auto_2813 - SURFACE
    )
    :vars
    (
      ?auto_2814 - HOIST
      ?auto_2815 - PLACE
      ?auto_2817 - PLACE
      ?auto_2818 - HOIST
      ?auto_2819 - SURFACE
      ?auto_2816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2814 ?auto_2815 ) ( SURFACE-AT ?auto_2813 ?auto_2815 ) ( CLEAR ?auto_2813 ) ( IS-CRATE ?auto_2812 ) ( AVAILABLE ?auto_2814 ) ( not ( = ?auto_2817 ?auto_2815 ) ) ( HOIST-AT ?auto_2818 ?auto_2817 ) ( AVAILABLE ?auto_2818 ) ( SURFACE-AT ?auto_2812 ?auto_2817 ) ( ON ?auto_2812 ?auto_2819 ) ( CLEAR ?auto_2812 ) ( TRUCK-AT ?auto_2816 ?auto_2815 ) ( not ( = ?auto_2812 ?auto_2813 ) ) ( not ( = ?auto_2812 ?auto_2819 ) ) ( not ( = ?auto_2813 ?auto_2819 ) ) ( not ( = ?auto_2814 ?auto_2818 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2816 ?auto_2815 ?auto_2817 )
      ( !LIFT ?auto_2818 ?auto_2812 ?auto_2819 ?auto_2817 )
      ( !LOAD ?auto_2818 ?auto_2812 ?auto_2816 ?auto_2817 )
      ( !DRIVE ?auto_2816 ?auto_2817 ?auto_2815 )
      ( !UNLOAD ?auto_2814 ?auto_2812 ?auto_2816 ?auto_2815 )
      ( !DROP ?auto_2814 ?auto_2812 ?auto_2813 ?auto_2815 )
      ( MAKE-ON-VERIFY ?auto_2812 ?auto_2813 ) )
  )

)

