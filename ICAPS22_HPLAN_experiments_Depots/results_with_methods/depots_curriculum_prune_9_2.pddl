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
      ?auto_1932 - SURFACE
      ?auto_1933 - SURFACE
    )
    :vars
    (
      ?auto_1934 - HOIST
      ?auto_1935 - PLACE
      ?auto_1937 - PLACE
      ?auto_1938 - HOIST
      ?auto_1939 - SURFACE
      ?auto_1936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1934 ?auto_1935 ) ( SURFACE-AT ?auto_1933 ?auto_1935 ) ( CLEAR ?auto_1933 ) ( IS-CRATE ?auto_1932 ) ( AVAILABLE ?auto_1934 ) ( not ( = ?auto_1937 ?auto_1935 ) ) ( HOIST-AT ?auto_1938 ?auto_1937 ) ( AVAILABLE ?auto_1938 ) ( SURFACE-AT ?auto_1932 ?auto_1937 ) ( ON ?auto_1932 ?auto_1939 ) ( CLEAR ?auto_1932 ) ( TRUCK-AT ?auto_1936 ?auto_1935 ) ( not ( = ?auto_1932 ?auto_1933 ) ) ( not ( = ?auto_1932 ?auto_1939 ) ) ( not ( = ?auto_1933 ?auto_1939 ) ) ( not ( = ?auto_1934 ?auto_1938 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1936 ?auto_1935 ?auto_1937 )
      ( !LIFT ?auto_1938 ?auto_1932 ?auto_1939 ?auto_1937 )
      ( !LOAD ?auto_1938 ?auto_1932 ?auto_1936 ?auto_1937 )
      ( !DRIVE ?auto_1936 ?auto_1937 ?auto_1935 )
      ( !UNLOAD ?auto_1934 ?auto_1932 ?auto_1936 ?auto_1935 )
      ( !DROP ?auto_1934 ?auto_1932 ?auto_1933 ?auto_1935 )
      ( MAKE-ON-VERIFY ?auto_1932 ?auto_1933 ) )
  )

)

