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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-16CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25326 - SURFACE
      ?auto_25327 - SURFACE
    )
    :vars
    (
      ?auto_25328 - HOIST
      ?auto_25329 - PLACE
      ?auto_25331 - PLACE
      ?auto_25332 - HOIST
      ?auto_25333 - SURFACE
      ?auto_25330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25328 ?auto_25329 ) ( SURFACE-AT ?auto_25326 ?auto_25329 ) ( CLEAR ?auto_25326 ) ( IS-CRATE ?auto_25327 ) ( AVAILABLE ?auto_25328 ) ( not ( = ?auto_25331 ?auto_25329 ) ) ( HOIST-AT ?auto_25332 ?auto_25331 ) ( AVAILABLE ?auto_25332 ) ( SURFACE-AT ?auto_25327 ?auto_25331 ) ( ON ?auto_25327 ?auto_25333 ) ( CLEAR ?auto_25327 ) ( TRUCK-AT ?auto_25330 ?auto_25329 ) ( not ( = ?auto_25326 ?auto_25327 ) ) ( not ( = ?auto_25326 ?auto_25333 ) ) ( not ( = ?auto_25327 ?auto_25333 ) ) ( not ( = ?auto_25328 ?auto_25332 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25330 ?auto_25329 ?auto_25331 )
      ( !LIFT ?auto_25332 ?auto_25327 ?auto_25333 ?auto_25331 )
      ( !LOAD ?auto_25332 ?auto_25327 ?auto_25330 ?auto_25331 )
      ( !DRIVE ?auto_25330 ?auto_25331 ?auto_25329 )
      ( !UNLOAD ?auto_25328 ?auto_25327 ?auto_25330 ?auto_25329 )
      ( !DROP ?auto_25328 ?auto_25327 ?auto_25326 ?auto_25329 )
      ( MAKE-1CRATE-VERIFY ?auto_25326 ?auto_25327 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25347 - SURFACE
      ?auto_25348 - SURFACE
      ?auto_25349 - SURFACE
    )
    :vars
    (
      ?auto_25353 - HOIST
      ?auto_25350 - PLACE
      ?auto_25352 - PLACE
      ?auto_25351 - HOIST
      ?auto_25355 - SURFACE
      ?auto_25357 - PLACE
      ?auto_25358 - HOIST
      ?auto_25356 - SURFACE
      ?auto_25354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25353 ?auto_25350 ) ( IS-CRATE ?auto_25349 ) ( not ( = ?auto_25352 ?auto_25350 ) ) ( HOIST-AT ?auto_25351 ?auto_25352 ) ( AVAILABLE ?auto_25351 ) ( SURFACE-AT ?auto_25349 ?auto_25352 ) ( ON ?auto_25349 ?auto_25355 ) ( CLEAR ?auto_25349 ) ( not ( = ?auto_25348 ?auto_25349 ) ) ( not ( = ?auto_25348 ?auto_25355 ) ) ( not ( = ?auto_25349 ?auto_25355 ) ) ( not ( = ?auto_25353 ?auto_25351 ) ) ( SURFACE-AT ?auto_25347 ?auto_25350 ) ( CLEAR ?auto_25347 ) ( IS-CRATE ?auto_25348 ) ( AVAILABLE ?auto_25353 ) ( not ( = ?auto_25357 ?auto_25350 ) ) ( HOIST-AT ?auto_25358 ?auto_25357 ) ( AVAILABLE ?auto_25358 ) ( SURFACE-AT ?auto_25348 ?auto_25357 ) ( ON ?auto_25348 ?auto_25356 ) ( CLEAR ?auto_25348 ) ( TRUCK-AT ?auto_25354 ?auto_25350 ) ( not ( = ?auto_25347 ?auto_25348 ) ) ( not ( = ?auto_25347 ?auto_25356 ) ) ( not ( = ?auto_25348 ?auto_25356 ) ) ( not ( = ?auto_25353 ?auto_25358 ) ) ( not ( = ?auto_25347 ?auto_25349 ) ) ( not ( = ?auto_25347 ?auto_25355 ) ) ( not ( = ?auto_25349 ?auto_25356 ) ) ( not ( = ?auto_25352 ?auto_25357 ) ) ( not ( = ?auto_25351 ?auto_25358 ) ) ( not ( = ?auto_25355 ?auto_25356 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25347 ?auto_25348 )
      ( MAKE-1CRATE ?auto_25348 ?auto_25349 )
      ( MAKE-2CRATE-VERIFY ?auto_25347 ?auto_25348 ?auto_25349 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25373 - SURFACE
      ?auto_25374 - SURFACE
      ?auto_25375 - SURFACE
      ?auto_25376 - SURFACE
    )
    :vars
    (
      ?auto_25378 - HOIST
      ?auto_25381 - PLACE
      ?auto_25380 - PLACE
      ?auto_25377 - HOIST
      ?auto_25382 - SURFACE
      ?auto_25386 - PLACE
      ?auto_25383 - HOIST
      ?auto_25385 - SURFACE
      ?auto_25384 - PLACE
      ?auto_25387 - HOIST
      ?auto_25388 - SURFACE
      ?auto_25379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25378 ?auto_25381 ) ( IS-CRATE ?auto_25376 ) ( not ( = ?auto_25380 ?auto_25381 ) ) ( HOIST-AT ?auto_25377 ?auto_25380 ) ( AVAILABLE ?auto_25377 ) ( SURFACE-AT ?auto_25376 ?auto_25380 ) ( ON ?auto_25376 ?auto_25382 ) ( CLEAR ?auto_25376 ) ( not ( = ?auto_25375 ?auto_25376 ) ) ( not ( = ?auto_25375 ?auto_25382 ) ) ( not ( = ?auto_25376 ?auto_25382 ) ) ( not ( = ?auto_25378 ?auto_25377 ) ) ( IS-CRATE ?auto_25375 ) ( not ( = ?auto_25386 ?auto_25381 ) ) ( HOIST-AT ?auto_25383 ?auto_25386 ) ( AVAILABLE ?auto_25383 ) ( SURFACE-AT ?auto_25375 ?auto_25386 ) ( ON ?auto_25375 ?auto_25385 ) ( CLEAR ?auto_25375 ) ( not ( = ?auto_25374 ?auto_25375 ) ) ( not ( = ?auto_25374 ?auto_25385 ) ) ( not ( = ?auto_25375 ?auto_25385 ) ) ( not ( = ?auto_25378 ?auto_25383 ) ) ( SURFACE-AT ?auto_25373 ?auto_25381 ) ( CLEAR ?auto_25373 ) ( IS-CRATE ?auto_25374 ) ( AVAILABLE ?auto_25378 ) ( not ( = ?auto_25384 ?auto_25381 ) ) ( HOIST-AT ?auto_25387 ?auto_25384 ) ( AVAILABLE ?auto_25387 ) ( SURFACE-AT ?auto_25374 ?auto_25384 ) ( ON ?auto_25374 ?auto_25388 ) ( CLEAR ?auto_25374 ) ( TRUCK-AT ?auto_25379 ?auto_25381 ) ( not ( = ?auto_25373 ?auto_25374 ) ) ( not ( = ?auto_25373 ?auto_25388 ) ) ( not ( = ?auto_25374 ?auto_25388 ) ) ( not ( = ?auto_25378 ?auto_25387 ) ) ( not ( = ?auto_25373 ?auto_25375 ) ) ( not ( = ?auto_25373 ?auto_25385 ) ) ( not ( = ?auto_25375 ?auto_25388 ) ) ( not ( = ?auto_25386 ?auto_25384 ) ) ( not ( = ?auto_25383 ?auto_25387 ) ) ( not ( = ?auto_25385 ?auto_25388 ) ) ( not ( = ?auto_25373 ?auto_25376 ) ) ( not ( = ?auto_25373 ?auto_25382 ) ) ( not ( = ?auto_25374 ?auto_25376 ) ) ( not ( = ?auto_25374 ?auto_25382 ) ) ( not ( = ?auto_25376 ?auto_25385 ) ) ( not ( = ?auto_25376 ?auto_25388 ) ) ( not ( = ?auto_25380 ?auto_25386 ) ) ( not ( = ?auto_25380 ?auto_25384 ) ) ( not ( = ?auto_25377 ?auto_25383 ) ) ( not ( = ?auto_25377 ?auto_25387 ) ) ( not ( = ?auto_25382 ?auto_25385 ) ) ( not ( = ?auto_25382 ?auto_25388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25373 ?auto_25374 ?auto_25375 )
      ( MAKE-1CRATE ?auto_25375 ?auto_25376 )
      ( MAKE-3CRATE-VERIFY ?auto_25373 ?auto_25374 ?auto_25375 ?auto_25376 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25404 - SURFACE
      ?auto_25405 - SURFACE
      ?auto_25406 - SURFACE
      ?auto_25407 - SURFACE
      ?auto_25408 - SURFACE
    )
    :vars
    (
      ?auto_25411 - HOIST
      ?auto_25413 - PLACE
      ?auto_25410 - PLACE
      ?auto_25412 - HOIST
      ?auto_25409 - SURFACE
      ?auto_25420 - PLACE
      ?auto_25415 - HOIST
      ?auto_25416 - SURFACE
      ?auto_25419 - PLACE
      ?auto_25421 - HOIST
      ?auto_25418 - SURFACE
      ?auto_25417 - SURFACE
      ?auto_25414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25411 ?auto_25413 ) ( IS-CRATE ?auto_25408 ) ( not ( = ?auto_25410 ?auto_25413 ) ) ( HOIST-AT ?auto_25412 ?auto_25410 ) ( SURFACE-AT ?auto_25408 ?auto_25410 ) ( ON ?auto_25408 ?auto_25409 ) ( CLEAR ?auto_25408 ) ( not ( = ?auto_25407 ?auto_25408 ) ) ( not ( = ?auto_25407 ?auto_25409 ) ) ( not ( = ?auto_25408 ?auto_25409 ) ) ( not ( = ?auto_25411 ?auto_25412 ) ) ( IS-CRATE ?auto_25407 ) ( not ( = ?auto_25420 ?auto_25413 ) ) ( HOIST-AT ?auto_25415 ?auto_25420 ) ( AVAILABLE ?auto_25415 ) ( SURFACE-AT ?auto_25407 ?auto_25420 ) ( ON ?auto_25407 ?auto_25416 ) ( CLEAR ?auto_25407 ) ( not ( = ?auto_25406 ?auto_25407 ) ) ( not ( = ?auto_25406 ?auto_25416 ) ) ( not ( = ?auto_25407 ?auto_25416 ) ) ( not ( = ?auto_25411 ?auto_25415 ) ) ( IS-CRATE ?auto_25406 ) ( not ( = ?auto_25419 ?auto_25413 ) ) ( HOIST-AT ?auto_25421 ?auto_25419 ) ( AVAILABLE ?auto_25421 ) ( SURFACE-AT ?auto_25406 ?auto_25419 ) ( ON ?auto_25406 ?auto_25418 ) ( CLEAR ?auto_25406 ) ( not ( = ?auto_25405 ?auto_25406 ) ) ( not ( = ?auto_25405 ?auto_25418 ) ) ( not ( = ?auto_25406 ?auto_25418 ) ) ( not ( = ?auto_25411 ?auto_25421 ) ) ( SURFACE-AT ?auto_25404 ?auto_25413 ) ( CLEAR ?auto_25404 ) ( IS-CRATE ?auto_25405 ) ( AVAILABLE ?auto_25411 ) ( AVAILABLE ?auto_25412 ) ( SURFACE-AT ?auto_25405 ?auto_25410 ) ( ON ?auto_25405 ?auto_25417 ) ( CLEAR ?auto_25405 ) ( TRUCK-AT ?auto_25414 ?auto_25413 ) ( not ( = ?auto_25404 ?auto_25405 ) ) ( not ( = ?auto_25404 ?auto_25417 ) ) ( not ( = ?auto_25405 ?auto_25417 ) ) ( not ( = ?auto_25404 ?auto_25406 ) ) ( not ( = ?auto_25404 ?auto_25418 ) ) ( not ( = ?auto_25406 ?auto_25417 ) ) ( not ( = ?auto_25419 ?auto_25410 ) ) ( not ( = ?auto_25421 ?auto_25412 ) ) ( not ( = ?auto_25418 ?auto_25417 ) ) ( not ( = ?auto_25404 ?auto_25407 ) ) ( not ( = ?auto_25404 ?auto_25416 ) ) ( not ( = ?auto_25405 ?auto_25407 ) ) ( not ( = ?auto_25405 ?auto_25416 ) ) ( not ( = ?auto_25407 ?auto_25418 ) ) ( not ( = ?auto_25407 ?auto_25417 ) ) ( not ( = ?auto_25420 ?auto_25419 ) ) ( not ( = ?auto_25420 ?auto_25410 ) ) ( not ( = ?auto_25415 ?auto_25421 ) ) ( not ( = ?auto_25415 ?auto_25412 ) ) ( not ( = ?auto_25416 ?auto_25418 ) ) ( not ( = ?auto_25416 ?auto_25417 ) ) ( not ( = ?auto_25404 ?auto_25408 ) ) ( not ( = ?auto_25404 ?auto_25409 ) ) ( not ( = ?auto_25405 ?auto_25408 ) ) ( not ( = ?auto_25405 ?auto_25409 ) ) ( not ( = ?auto_25406 ?auto_25408 ) ) ( not ( = ?auto_25406 ?auto_25409 ) ) ( not ( = ?auto_25408 ?auto_25416 ) ) ( not ( = ?auto_25408 ?auto_25418 ) ) ( not ( = ?auto_25408 ?auto_25417 ) ) ( not ( = ?auto_25409 ?auto_25416 ) ) ( not ( = ?auto_25409 ?auto_25418 ) ) ( not ( = ?auto_25409 ?auto_25417 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_25404 ?auto_25405 ?auto_25406 ?auto_25407 )
      ( MAKE-1CRATE ?auto_25407 ?auto_25408 )
      ( MAKE-4CRATE-VERIFY ?auto_25404 ?auto_25405 ?auto_25406 ?auto_25407 ?auto_25408 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_25438 - SURFACE
      ?auto_25439 - SURFACE
      ?auto_25440 - SURFACE
      ?auto_25441 - SURFACE
      ?auto_25442 - SURFACE
      ?auto_25443 - SURFACE
    )
    :vars
    (
      ?auto_25445 - HOIST
      ?auto_25448 - PLACE
      ?auto_25447 - PLACE
      ?auto_25446 - HOIST
      ?auto_25444 - SURFACE
      ?auto_25452 - PLACE
      ?auto_25451 - HOIST
      ?auto_25458 - SURFACE
      ?auto_25454 - PLACE
      ?auto_25455 - HOIST
      ?auto_25453 - SURFACE
      ?auto_25456 - PLACE
      ?auto_25457 - HOIST
      ?auto_25450 - SURFACE
      ?auto_25459 - SURFACE
      ?auto_25449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25445 ?auto_25448 ) ( IS-CRATE ?auto_25443 ) ( not ( = ?auto_25447 ?auto_25448 ) ) ( HOIST-AT ?auto_25446 ?auto_25447 ) ( AVAILABLE ?auto_25446 ) ( SURFACE-AT ?auto_25443 ?auto_25447 ) ( ON ?auto_25443 ?auto_25444 ) ( CLEAR ?auto_25443 ) ( not ( = ?auto_25442 ?auto_25443 ) ) ( not ( = ?auto_25442 ?auto_25444 ) ) ( not ( = ?auto_25443 ?auto_25444 ) ) ( not ( = ?auto_25445 ?auto_25446 ) ) ( IS-CRATE ?auto_25442 ) ( not ( = ?auto_25452 ?auto_25448 ) ) ( HOIST-AT ?auto_25451 ?auto_25452 ) ( SURFACE-AT ?auto_25442 ?auto_25452 ) ( ON ?auto_25442 ?auto_25458 ) ( CLEAR ?auto_25442 ) ( not ( = ?auto_25441 ?auto_25442 ) ) ( not ( = ?auto_25441 ?auto_25458 ) ) ( not ( = ?auto_25442 ?auto_25458 ) ) ( not ( = ?auto_25445 ?auto_25451 ) ) ( IS-CRATE ?auto_25441 ) ( not ( = ?auto_25454 ?auto_25448 ) ) ( HOIST-AT ?auto_25455 ?auto_25454 ) ( AVAILABLE ?auto_25455 ) ( SURFACE-AT ?auto_25441 ?auto_25454 ) ( ON ?auto_25441 ?auto_25453 ) ( CLEAR ?auto_25441 ) ( not ( = ?auto_25440 ?auto_25441 ) ) ( not ( = ?auto_25440 ?auto_25453 ) ) ( not ( = ?auto_25441 ?auto_25453 ) ) ( not ( = ?auto_25445 ?auto_25455 ) ) ( IS-CRATE ?auto_25440 ) ( not ( = ?auto_25456 ?auto_25448 ) ) ( HOIST-AT ?auto_25457 ?auto_25456 ) ( AVAILABLE ?auto_25457 ) ( SURFACE-AT ?auto_25440 ?auto_25456 ) ( ON ?auto_25440 ?auto_25450 ) ( CLEAR ?auto_25440 ) ( not ( = ?auto_25439 ?auto_25440 ) ) ( not ( = ?auto_25439 ?auto_25450 ) ) ( not ( = ?auto_25440 ?auto_25450 ) ) ( not ( = ?auto_25445 ?auto_25457 ) ) ( SURFACE-AT ?auto_25438 ?auto_25448 ) ( CLEAR ?auto_25438 ) ( IS-CRATE ?auto_25439 ) ( AVAILABLE ?auto_25445 ) ( AVAILABLE ?auto_25451 ) ( SURFACE-AT ?auto_25439 ?auto_25452 ) ( ON ?auto_25439 ?auto_25459 ) ( CLEAR ?auto_25439 ) ( TRUCK-AT ?auto_25449 ?auto_25448 ) ( not ( = ?auto_25438 ?auto_25439 ) ) ( not ( = ?auto_25438 ?auto_25459 ) ) ( not ( = ?auto_25439 ?auto_25459 ) ) ( not ( = ?auto_25438 ?auto_25440 ) ) ( not ( = ?auto_25438 ?auto_25450 ) ) ( not ( = ?auto_25440 ?auto_25459 ) ) ( not ( = ?auto_25456 ?auto_25452 ) ) ( not ( = ?auto_25457 ?auto_25451 ) ) ( not ( = ?auto_25450 ?auto_25459 ) ) ( not ( = ?auto_25438 ?auto_25441 ) ) ( not ( = ?auto_25438 ?auto_25453 ) ) ( not ( = ?auto_25439 ?auto_25441 ) ) ( not ( = ?auto_25439 ?auto_25453 ) ) ( not ( = ?auto_25441 ?auto_25450 ) ) ( not ( = ?auto_25441 ?auto_25459 ) ) ( not ( = ?auto_25454 ?auto_25456 ) ) ( not ( = ?auto_25454 ?auto_25452 ) ) ( not ( = ?auto_25455 ?auto_25457 ) ) ( not ( = ?auto_25455 ?auto_25451 ) ) ( not ( = ?auto_25453 ?auto_25450 ) ) ( not ( = ?auto_25453 ?auto_25459 ) ) ( not ( = ?auto_25438 ?auto_25442 ) ) ( not ( = ?auto_25438 ?auto_25458 ) ) ( not ( = ?auto_25439 ?auto_25442 ) ) ( not ( = ?auto_25439 ?auto_25458 ) ) ( not ( = ?auto_25440 ?auto_25442 ) ) ( not ( = ?auto_25440 ?auto_25458 ) ) ( not ( = ?auto_25442 ?auto_25453 ) ) ( not ( = ?auto_25442 ?auto_25450 ) ) ( not ( = ?auto_25442 ?auto_25459 ) ) ( not ( = ?auto_25458 ?auto_25453 ) ) ( not ( = ?auto_25458 ?auto_25450 ) ) ( not ( = ?auto_25458 ?auto_25459 ) ) ( not ( = ?auto_25438 ?auto_25443 ) ) ( not ( = ?auto_25438 ?auto_25444 ) ) ( not ( = ?auto_25439 ?auto_25443 ) ) ( not ( = ?auto_25439 ?auto_25444 ) ) ( not ( = ?auto_25440 ?auto_25443 ) ) ( not ( = ?auto_25440 ?auto_25444 ) ) ( not ( = ?auto_25441 ?auto_25443 ) ) ( not ( = ?auto_25441 ?auto_25444 ) ) ( not ( = ?auto_25443 ?auto_25458 ) ) ( not ( = ?auto_25443 ?auto_25453 ) ) ( not ( = ?auto_25443 ?auto_25450 ) ) ( not ( = ?auto_25443 ?auto_25459 ) ) ( not ( = ?auto_25447 ?auto_25452 ) ) ( not ( = ?auto_25447 ?auto_25454 ) ) ( not ( = ?auto_25447 ?auto_25456 ) ) ( not ( = ?auto_25446 ?auto_25451 ) ) ( not ( = ?auto_25446 ?auto_25455 ) ) ( not ( = ?auto_25446 ?auto_25457 ) ) ( not ( = ?auto_25444 ?auto_25458 ) ) ( not ( = ?auto_25444 ?auto_25453 ) ) ( not ( = ?auto_25444 ?auto_25450 ) ) ( not ( = ?auto_25444 ?auto_25459 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_25438 ?auto_25439 ?auto_25440 ?auto_25441 ?auto_25442 )
      ( MAKE-1CRATE ?auto_25442 ?auto_25443 )
      ( MAKE-5CRATE-VERIFY ?auto_25438 ?auto_25439 ?auto_25440 ?auto_25441 ?auto_25442 ?auto_25443 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_25477 - SURFACE
      ?auto_25478 - SURFACE
      ?auto_25479 - SURFACE
      ?auto_25480 - SURFACE
      ?auto_25481 - SURFACE
      ?auto_25482 - SURFACE
      ?auto_25483 - SURFACE
    )
    :vars
    (
      ?auto_25485 - HOIST
      ?auto_25488 - PLACE
      ?auto_25487 - PLACE
      ?auto_25489 - HOIST
      ?auto_25486 - SURFACE
      ?auto_25497 - PLACE
      ?auto_25496 - HOIST
      ?auto_25491 - SURFACE
      ?auto_25493 - PLACE
      ?auto_25495 - HOIST
      ?auto_25494 - SURFACE
      ?auto_25492 - PLACE
      ?auto_25501 - HOIST
      ?auto_25502 - SURFACE
      ?auto_25500 - PLACE
      ?auto_25499 - HOIST
      ?auto_25490 - SURFACE
      ?auto_25498 - SURFACE
      ?auto_25484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25485 ?auto_25488 ) ( IS-CRATE ?auto_25483 ) ( not ( = ?auto_25487 ?auto_25488 ) ) ( HOIST-AT ?auto_25489 ?auto_25487 ) ( AVAILABLE ?auto_25489 ) ( SURFACE-AT ?auto_25483 ?auto_25487 ) ( ON ?auto_25483 ?auto_25486 ) ( CLEAR ?auto_25483 ) ( not ( = ?auto_25482 ?auto_25483 ) ) ( not ( = ?auto_25482 ?auto_25486 ) ) ( not ( = ?auto_25483 ?auto_25486 ) ) ( not ( = ?auto_25485 ?auto_25489 ) ) ( IS-CRATE ?auto_25482 ) ( not ( = ?auto_25497 ?auto_25488 ) ) ( HOIST-AT ?auto_25496 ?auto_25497 ) ( AVAILABLE ?auto_25496 ) ( SURFACE-AT ?auto_25482 ?auto_25497 ) ( ON ?auto_25482 ?auto_25491 ) ( CLEAR ?auto_25482 ) ( not ( = ?auto_25481 ?auto_25482 ) ) ( not ( = ?auto_25481 ?auto_25491 ) ) ( not ( = ?auto_25482 ?auto_25491 ) ) ( not ( = ?auto_25485 ?auto_25496 ) ) ( IS-CRATE ?auto_25481 ) ( not ( = ?auto_25493 ?auto_25488 ) ) ( HOIST-AT ?auto_25495 ?auto_25493 ) ( SURFACE-AT ?auto_25481 ?auto_25493 ) ( ON ?auto_25481 ?auto_25494 ) ( CLEAR ?auto_25481 ) ( not ( = ?auto_25480 ?auto_25481 ) ) ( not ( = ?auto_25480 ?auto_25494 ) ) ( not ( = ?auto_25481 ?auto_25494 ) ) ( not ( = ?auto_25485 ?auto_25495 ) ) ( IS-CRATE ?auto_25480 ) ( not ( = ?auto_25492 ?auto_25488 ) ) ( HOIST-AT ?auto_25501 ?auto_25492 ) ( AVAILABLE ?auto_25501 ) ( SURFACE-AT ?auto_25480 ?auto_25492 ) ( ON ?auto_25480 ?auto_25502 ) ( CLEAR ?auto_25480 ) ( not ( = ?auto_25479 ?auto_25480 ) ) ( not ( = ?auto_25479 ?auto_25502 ) ) ( not ( = ?auto_25480 ?auto_25502 ) ) ( not ( = ?auto_25485 ?auto_25501 ) ) ( IS-CRATE ?auto_25479 ) ( not ( = ?auto_25500 ?auto_25488 ) ) ( HOIST-AT ?auto_25499 ?auto_25500 ) ( AVAILABLE ?auto_25499 ) ( SURFACE-AT ?auto_25479 ?auto_25500 ) ( ON ?auto_25479 ?auto_25490 ) ( CLEAR ?auto_25479 ) ( not ( = ?auto_25478 ?auto_25479 ) ) ( not ( = ?auto_25478 ?auto_25490 ) ) ( not ( = ?auto_25479 ?auto_25490 ) ) ( not ( = ?auto_25485 ?auto_25499 ) ) ( SURFACE-AT ?auto_25477 ?auto_25488 ) ( CLEAR ?auto_25477 ) ( IS-CRATE ?auto_25478 ) ( AVAILABLE ?auto_25485 ) ( AVAILABLE ?auto_25495 ) ( SURFACE-AT ?auto_25478 ?auto_25493 ) ( ON ?auto_25478 ?auto_25498 ) ( CLEAR ?auto_25478 ) ( TRUCK-AT ?auto_25484 ?auto_25488 ) ( not ( = ?auto_25477 ?auto_25478 ) ) ( not ( = ?auto_25477 ?auto_25498 ) ) ( not ( = ?auto_25478 ?auto_25498 ) ) ( not ( = ?auto_25477 ?auto_25479 ) ) ( not ( = ?auto_25477 ?auto_25490 ) ) ( not ( = ?auto_25479 ?auto_25498 ) ) ( not ( = ?auto_25500 ?auto_25493 ) ) ( not ( = ?auto_25499 ?auto_25495 ) ) ( not ( = ?auto_25490 ?auto_25498 ) ) ( not ( = ?auto_25477 ?auto_25480 ) ) ( not ( = ?auto_25477 ?auto_25502 ) ) ( not ( = ?auto_25478 ?auto_25480 ) ) ( not ( = ?auto_25478 ?auto_25502 ) ) ( not ( = ?auto_25480 ?auto_25490 ) ) ( not ( = ?auto_25480 ?auto_25498 ) ) ( not ( = ?auto_25492 ?auto_25500 ) ) ( not ( = ?auto_25492 ?auto_25493 ) ) ( not ( = ?auto_25501 ?auto_25499 ) ) ( not ( = ?auto_25501 ?auto_25495 ) ) ( not ( = ?auto_25502 ?auto_25490 ) ) ( not ( = ?auto_25502 ?auto_25498 ) ) ( not ( = ?auto_25477 ?auto_25481 ) ) ( not ( = ?auto_25477 ?auto_25494 ) ) ( not ( = ?auto_25478 ?auto_25481 ) ) ( not ( = ?auto_25478 ?auto_25494 ) ) ( not ( = ?auto_25479 ?auto_25481 ) ) ( not ( = ?auto_25479 ?auto_25494 ) ) ( not ( = ?auto_25481 ?auto_25502 ) ) ( not ( = ?auto_25481 ?auto_25490 ) ) ( not ( = ?auto_25481 ?auto_25498 ) ) ( not ( = ?auto_25494 ?auto_25502 ) ) ( not ( = ?auto_25494 ?auto_25490 ) ) ( not ( = ?auto_25494 ?auto_25498 ) ) ( not ( = ?auto_25477 ?auto_25482 ) ) ( not ( = ?auto_25477 ?auto_25491 ) ) ( not ( = ?auto_25478 ?auto_25482 ) ) ( not ( = ?auto_25478 ?auto_25491 ) ) ( not ( = ?auto_25479 ?auto_25482 ) ) ( not ( = ?auto_25479 ?auto_25491 ) ) ( not ( = ?auto_25480 ?auto_25482 ) ) ( not ( = ?auto_25480 ?auto_25491 ) ) ( not ( = ?auto_25482 ?auto_25494 ) ) ( not ( = ?auto_25482 ?auto_25502 ) ) ( not ( = ?auto_25482 ?auto_25490 ) ) ( not ( = ?auto_25482 ?auto_25498 ) ) ( not ( = ?auto_25497 ?auto_25493 ) ) ( not ( = ?auto_25497 ?auto_25492 ) ) ( not ( = ?auto_25497 ?auto_25500 ) ) ( not ( = ?auto_25496 ?auto_25495 ) ) ( not ( = ?auto_25496 ?auto_25501 ) ) ( not ( = ?auto_25496 ?auto_25499 ) ) ( not ( = ?auto_25491 ?auto_25494 ) ) ( not ( = ?auto_25491 ?auto_25502 ) ) ( not ( = ?auto_25491 ?auto_25490 ) ) ( not ( = ?auto_25491 ?auto_25498 ) ) ( not ( = ?auto_25477 ?auto_25483 ) ) ( not ( = ?auto_25477 ?auto_25486 ) ) ( not ( = ?auto_25478 ?auto_25483 ) ) ( not ( = ?auto_25478 ?auto_25486 ) ) ( not ( = ?auto_25479 ?auto_25483 ) ) ( not ( = ?auto_25479 ?auto_25486 ) ) ( not ( = ?auto_25480 ?auto_25483 ) ) ( not ( = ?auto_25480 ?auto_25486 ) ) ( not ( = ?auto_25481 ?auto_25483 ) ) ( not ( = ?auto_25481 ?auto_25486 ) ) ( not ( = ?auto_25483 ?auto_25491 ) ) ( not ( = ?auto_25483 ?auto_25494 ) ) ( not ( = ?auto_25483 ?auto_25502 ) ) ( not ( = ?auto_25483 ?auto_25490 ) ) ( not ( = ?auto_25483 ?auto_25498 ) ) ( not ( = ?auto_25487 ?auto_25497 ) ) ( not ( = ?auto_25487 ?auto_25493 ) ) ( not ( = ?auto_25487 ?auto_25492 ) ) ( not ( = ?auto_25487 ?auto_25500 ) ) ( not ( = ?auto_25489 ?auto_25496 ) ) ( not ( = ?auto_25489 ?auto_25495 ) ) ( not ( = ?auto_25489 ?auto_25501 ) ) ( not ( = ?auto_25489 ?auto_25499 ) ) ( not ( = ?auto_25486 ?auto_25491 ) ) ( not ( = ?auto_25486 ?auto_25494 ) ) ( not ( = ?auto_25486 ?auto_25502 ) ) ( not ( = ?auto_25486 ?auto_25490 ) ) ( not ( = ?auto_25486 ?auto_25498 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_25477 ?auto_25478 ?auto_25479 ?auto_25480 ?auto_25481 ?auto_25482 )
      ( MAKE-1CRATE ?auto_25482 ?auto_25483 )
      ( MAKE-6CRATE-VERIFY ?auto_25477 ?auto_25478 ?auto_25479 ?auto_25480 ?auto_25481 ?auto_25482 ?auto_25483 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_25521 - SURFACE
      ?auto_25522 - SURFACE
      ?auto_25523 - SURFACE
      ?auto_25524 - SURFACE
      ?auto_25525 - SURFACE
      ?auto_25526 - SURFACE
      ?auto_25527 - SURFACE
      ?auto_25528 - SURFACE
    )
    :vars
    (
      ?auto_25530 - HOIST
      ?auto_25533 - PLACE
      ?auto_25531 - PLACE
      ?auto_25532 - HOIST
      ?auto_25534 - SURFACE
      ?auto_25537 - PLACE
      ?auto_25549 - HOIST
      ?auto_25544 - SURFACE
      ?auto_25541 - PLACE
      ?auto_25542 - HOIST
      ?auto_25543 - SURFACE
      ?auto_25550 - PLACE
      ?auto_25535 - HOIST
      ?auto_25536 - SURFACE
      ?auto_25546 - PLACE
      ?auto_25539 - HOIST
      ?auto_25540 - SURFACE
      ?auto_25545 - PLACE
      ?auto_25538 - HOIST
      ?auto_25548 - SURFACE
      ?auto_25547 - SURFACE
      ?auto_25529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25530 ?auto_25533 ) ( IS-CRATE ?auto_25528 ) ( not ( = ?auto_25531 ?auto_25533 ) ) ( HOIST-AT ?auto_25532 ?auto_25531 ) ( AVAILABLE ?auto_25532 ) ( SURFACE-AT ?auto_25528 ?auto_25531 ) ( ON ?auto_25528 ?auto_25534 ) ( CLEAR ?auto_25528 ) ( not ( = ?auto_25527 ?auto_25528 ) ) ( not ( = ?auto_25527 ?auto_25534 ) ) ( not ( = ?auto_25528 ?auto_25534 ) ) ( not ( = ?auto_25530 ?auto_25532 ) ) ( IS-CRATE ?auto_25527 ) ( not ( = ?auto_25537 ?auto_25533 ) ) ( HOIST-AT ?auto_25549 ?auto_25537 ) ( AVAILABLE ?auto_25549 ) ( SURFACE-AT ?auto_25527 ?auto_25537 ) ( ON ?auto_25527 ?auto_25544 ) ( CLEAR ?auto_25527 ) ( not ( = ?auto_25526 ?auto_25527 ) ) ( not ( = ?auto_25526 ?auto_25544 ) ) ( not ( = ?auto_25527 ?auto_25544 ) ) ( not ( = ?auto_25530 ?auto_25549 ) ) ( IS-CRATE ?auto_25526 ) ( not ( = ?auto_25541 ?auto_25533 ) ) ( HOIST-AT ?auto_25542 ?auto_25541 ) ( AVAILABLE ?auto_25542 ) ( SURFACE-AT ?auto_25526 ?auto_25541 ) ( ON ?auto_25526 ?auto_25543 ) ( CLEAR ?auto_25526 ) ( not ( = ?auto_25525 ?auto_25526 ) ) ( not ( = ?auto_25525 ?auto_25543 ) ) ( not ( = ?auto_25526 ?auto_25543 ) ) ( not ( = ?auto_25530 ?auto_25542 ) ) ( IS-CRATE ?auto_25525 ) ( not ( = ?auto_25550 ?auto_25533 ) ) ( HOIST-AT ?auto_25535 ?auto_25550 ) ( SURFACE-AT ?auto_25525 ?auto_25550 ) ( ON ?auto_25525 ?auto_25536 ) ( CLEAR ?auto_25525 ) ( not ( = ?auto_25524 ?auto_25525 ) ) ( not ( = ?auto_25524 ?auto_25536 ) ) ( not ( = ?auto_25525 ?auto_25536 ) ) ( not ( = ?auto_25530 ?auto_25535 ) ) ( IS-CRATE ?auto_25524 ) ( not ( = ?auto_25546 ?auto_25533 ) ) ( HOIST-AT ?auto_25539 ?auto_25546 ) ( AVAILABLE ?auto_25539 ) ( SURFACE-AT ?auto_25524 ?auto_25546 ) ( ON ?auto_25524 ?auto_25540 ) ( CLEAR ?auto_25524 ) ( not ( = ?auto_25523 ?auto_25524 ) ) ( not ( = ?auto_25523 ?auto_25540 ) ) ( not ( = ?auto_25524 ?auto_25540 ) ) ( not ( = ?auto_25530 ?auto_25539 ) ) ( IS-CRATE ?auto_25523 ) ( not ( = ?auto_25545 ?auto_25533 ) ) ( HOIST-AT ?auto_25538 ?auto_25545 ) ( AVAILABLE ?auto_25538 ) ( SURFACE-AT ?auto_25523 ?auto_25545 ) ( ON ?auto_25523 ?auto_25548 ) ( CLEAR ?auto_25523 ) ( not ( = ?auto_25522 ?auto_25523 ) ) ( not ( = ?auto_25522 ?auto_25548 ) ) ( not ( = ?auto_25523 ?auto_25548 ) ) ( not ( = ?auto_25530 ?auto_25538 ) ) ( SURFACE-AT ?auto_25521 ?auto_25533 ) ( CLEAR ?auto_25521 ) ( IS-CRATE ?auto_25522 ) ( AVAILABLE ?auto_25530 ) ( AVAILABLE ?auto_25535 ) ( SURFACE-AT ?auto_25522 ?auto_25550 ) ( ON ?auto_25522 ?auto_25547 ) ( CLEAR ?auto_25522 ) ( TRUCK-AT ?auto_25529 ?auto_25533 ) ( not ( = ?auto_25521 ?auto_25522 ) ) ( not ( = ?auto_25521 ?auto_25547 ) ) ( not ( = ?auto_25522 ?auto_25547 ) ) ( not ( = ?auto_25521 ?auto_25523 ) ) ( not ( = ?auto_25521 ?auto_25548 ) ) ( not ( = ?auto_25523 ?auto_25547 ) ) ( not ( = ?auto_25545 ?auto_25550 ) ) ( not ( = ?auto_25538 ?auto_25535 ) ) ( not ( = ?auto_25548 ?auto_25547 ) ) ( not ( = ?auto_25521 ?auto_25524 ) ) ( not ( = ?auto_25521 ?auto_25540 ) ) ( not ( = ?auto_25522 ?auto_25524 ) ) ( not ( = ?auto_25522 ?auto_25540 ) ) ( not ( = ?auto_25524 ?auto_25548 ) ) ( not ( = ?auto_25524 ?auto_25547 ) ) ( not ( = ?auto_25546 ?auto_25545 ) ) ( not ( = ?auto_25546 ?auto_25550 ) ) ( not ( = ?auto_25539 ?auto_25538 ) ) ( not ( = ?auto_25539 ?auto_25535 ) ) ( not ( = ?auto_25540 ?auto_25548 ) ) ( not ( = ?auto_25540 ?auto_25547 ) ) ( not ( = ?auto_25521 ?auto_25525 ) ) ( not ( = ?auto_25521 ?auto_25536 ) ) ( not ( = ?auto_25522 ?auto_25525 ) ) ( not ( = ?auto_25522 ?auto_25536 ) ) ( not ( = ?auto_25523 ?auto_25525 ) ) ( not ( = ?auto_25523 ?auto_25536 ) ) ( not ( = ?auto_25525 ?auto_25540 ) ) ( not ( = ?auto_25525 ?auto_25548 ) ) ( not ( = ?auto_25525 ?auto_25547 ) ) ( not ( = ?auto_25536 ?auto_25540 ) ) ( not ( = ?auto_25536 ?auto_25548 ) ) ( not ( = ?auto_25536 ?auto_25547 ) ) ( not ( = ?auto_25521 ?auto_25526 ) ) ( not ( = ?auto_25521 ?auto_25543 ) ) ( not ( = ?auto_25522 ?auto_25526 ) ) ( not ( = ?auto_25522 ?auto_25543 ) ) ( not ( = ?auto_25523 ?auto_25526 ) ) ( not ( = ?auto_25523 ?auto_25543 ) ) ( not ( = ?auto_25524 ?auto_25526 ) ) ( not ( = ?auto_25524 ?auto_25543 ) ) ( not ( = ?auto_25526 ?auto_25536 ) ) ( not ( = ?auto_25526 ?auto_25540 ) ) ( not ( = ?auto_25526 ?auto_25548 ) ) ( not ( = ?auto_25526 ?auto_25547 ) ) ( not ( = ?auto_25541 ?auto_25550 ) ) ( not ( = ?auto_25541 ?auto_25546 ) ) ( not ( = ?auto_25541 ?auto_25545 ) ) ( not ( = ?auto_25542 ?auto_25535 ) ) ( not ( = ?auto_25542 ?auto_25539 ) ) ( not ( = ?auto_25542 ?auto_25538 ) ) ( not ( = ?auto_25543 ?auto_25536 ) ) ( not ( = ?auto_25543 ?auto_25540 ) ) ( not ( = ?auto_25543 ?auto_25548 ) ) ( not ( = ?auto_25543 ?auto_25547 ) ) ( not ( = ?auto_25521 ?auto_25527 ) ) ( not ( = ?auto_25521 ?auto_25544 ) ) ( not ( = ?auto_25522 ?auto_25527 ) ) ( not ( = ?auto_25522 ?auto_25544 ) ) ( not ( = ?auto_25523 ?auto_25527 ) ) ( not ( = ?auto_25523 ?auto_25544 ) ) ( not ( = ?auto_25524 ?auto_25527 ) ) ( not ( = ?auto_25524 ?auto_25544 ) ) ( not ( = ?auto_25525 ?auto_25527 ) ) ( not ( = ?auto_25525 ?auto_25544 ) ) ( not ( = ?auto_25527 ?auto_25543 ) ) ( not ( = ?auto_25527 ?auto_25536 ) ) ( not ( = ?auto_25527 ?auto_25540 ) ) ( not ( = ?auto_25527 ?auto_25548 ) ) ( not ( = ?auto_25527 ?auto_25547 ) ) ( not ( = ?auto_25537 ?auto_25541 ) ) ( not ( = ?auto_25537 ?auto_25550 ) ) ( not ( = ?auto_25537 ?auto_25546 ) ) ( not ( = ?auto_25537 ?auto_25545 ) ) ( not ( = ?auto_25549 ?auto_25542 ) ) ( not ( = ?auto_25549 ?auto_25535 ) ) ( not ( = ?auto_25549 ?auto_25539 ) ) ( not ( = ?auto_25549 ?auto_25538 ) ) ( not ( = ?auto_25544 ?auto_25543 ) ) ( not ( = ?auto_25544 ?auto_25536 ) ) ( not ( = ?auto_25544 ?auto_25540 ) ) ( not ( = ?auto_25544 ?auto_25548 ) ) ( not ( = ?auto_25544 ?auto_25547 ) ) ( not ( = ?auto_25521 ?auto_25528 ) ) ( not ( = ?auto_25521 ?auto_25534 ) ) ( not ( = ?auto_25522 ?auto_25528 ) ) ( not ( = ?auto_25522 ?auto_25534 ) ) ( not ( = ?auto_25523 ?auto_25528 ) ) ( not ( = ?auto_25523 ?auto_25534 ) ) ( not ( = ?auto_25524 ?auto_25528 ) ) ( not ( = ?auto_25524 ?auto_25534 ) ) ( not ( = ?auto_25525 ?auto_25528 ) ) ( not ( = ?auto_25525 ?auto_25534 ) ) ( not ( = ?auto_25526 ?auto_25528 ) ) ( not ( = ?auto_25526 ?auto_25534 ) ) ( not ( = ?auto_25528 ?auto_25544 ) ) ( not ( = ?auto_25528 ?auto_25543 ) ) ( not ( = ?auto_25528 ?auto_25536 ) ) ( not ( = ?auto_25528 ?auto_25540 ) ) ( not ( = ?auto_25528 ?auto_25548 ) ) ( not ( = ?auto_25528 ?auto_25547 ) ) ( not ( = ?auto_25531 ?auto_25537 ) ) ( not ( = ?auto_25531 ?auto_25541 ) ) ( not ( = ?auto_25531 ?auto_25550 ) ) ( not ( = ?auto_25531 ?auto_25546 ) ) ( not ( = ?auto_25531 ?auto_25545 ) ) ( not ( = ?auto_25532 ?auto_25549 ) ) ( not ( = ?auto_25532 ?auto_25542 ) ) ( not ( = ?auto_25532 ?auto_25535 ) ) ( not ( = ?auto_25532 ?auto_25539 ) ) ( not ( = ?auto_25532 ?auto_25538 ) ) ( not ( = ?auto_25534 ?auto_25544 ) ) ( not ( = ?auto_25534 ?auto_25543 ) ) ( not ( = ?auto_25534 ?auto_25536 ) ) ( not ( = ?auto_25534 ?auto_25540 ) ) ( not ( = ?auto_25534 ?auto_25548 ) ) ( not ( = ?auto_25534 ?auto_25547 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_25521 ?auto_25522 ?auto_25523 ?auto_25524 ?auto_25525 ?auto_25526 ?auto_25527 )
      ( MAKE-1CRATE ?auto_25527 ?auto_25528 )
      ( MAKE-7CRATE-VERIFY ?auto_25521 ?auto_25522 ?auto_25523 ?auto_25524 ?auto_25525 ?auto_25526 ?auto_25527 ?auto_25528 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_25570 - SURFACE
      ?auto_25571 - SURFACE
      ?auto_25572 - SURFACE
      ?auto_25573 - SURFACE
      ?auto_25574 - SURFACE
      ?auto_25575 - SURFACE
      ?auto_25576 - SURFACE
      ?auto_25577 - SURFACE
      ?auto_25578 - SURFACE
    )
    :vars
    (
      ?auto_25581 - HOIST
      ?auto_25583 - PLACE
      ?auto_25584 - PLACE
      ?auto_25579 - HOIST
      ?auto_25582 - SURFACE
      ?auto_25603 - PLACE
      ?auto_25586 - HOIST
      ?auto_25591 - SURFACE
      ?auto_25590 - PLACE
      ?auto_25602 - HOIST
      ?auto_25595 - SURFACE
      ?auto_25600 - PLACE
      ?auto_25599 - HOIST
      ?auto_25593 - SURFACE
      ?auto_25592 - PLACE
      ?auto_25601 - HOIST
      ?auto_25585 - SURFACE
      ?auto_25596 - PLACE
      ?auto_25588 - HOIST
      ?auto_25587 - SURFACE
      ?auto_25594 - PLACE
      ?auto_25589 - HOIST
      ?auto_25598 - SURFACE
      ?auto_25597 - SURFACE
      ?auto_25580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25581 ?auto_25583 ) ( IS-CRATE ?auto_25578 ) ( not ( = ?auto_25584 ?auto_25583 ) ) ( HOIST-AT ?auto_25579 ?auto_25584 ) ( AVAILABLE ?auto_25579 ) ( SURFACE-AT ?auto_25578 ?auto_25584 ) ( ON ?auto_25578 ?auto_25582 ) ( CLEAR ?auto_25578 ) ( not ( = ?auto_25577 ?auto_25578 ) ) ( not ( = ?auto_25577 ?auto_25582 ) ) ( not ( = ?auto_25578 ?auto_25582 ) ) ( not ( = ?auto_25581 ?auto_25579 ) ) ( IS-CRATE ?auto_25577 ) ( not ( = ?auto_25603 ?auto_25583 ) ) ( HOIST-AT ?auto_25586 ?auto_25603 ) ( AVAILABLE ?auto_25586 ) ( SURFACE-AT ?auto_25577 ?auto_25603 ) ( ON ?auto_25577 ?auto_25591 ) ( CLEAR ?auto_25577 ) ( not ( = ?auto_25576 ?auto_25577 ) ) ( not ( = ?auto_25576 ?auto_25591 ) ) ( not ( = ?auto_25577 ?auto_25591 ) ) ( not ( = ?auto_25581 ?auto_25586 ) ) ( IS-CRATE ?auto_25576 ) ( not ( = ?auto_25590 ?auto_25583 ) ) ( HOIST-AT ?auto_25602 ?auto_25590 ) ( AVAILABLE ?auto_25602 ) ( SURFACE-AT ?auto_25576 ?auto_25590 ) ( ON ?auto_25576 ?auto_25595 ) ( CLEAR ?auto_25576 ) ( not ( = ?auto_25575 ?auto_25576 ) ) ( not ( = ?auto_25575 ?auto_25595 ) ) ( not ( = ?auto_25576 ?auto_25595 ) ) ( not ( = ?auto_25581 ?auto_25602 ) ) ( IS-CRATE ?auto_25575 ) ( not ( = ?auto_25600 ?auto_25583 ) ) ( HOIST-AT ?auto_25599 ?auto_25600 ) ( AVAILABLE ?auto_25599 ) ( SURFACE-AT ?auto_25575 ?auto_25600 ) ( ON ?auto_25575 ?auto_25593 ) ( CLEAR ?auto_25575 ) ( not ( = ?auto_25574 ?auto_25575 ) ) ( not ( = ?auto_25574 ?auto_25593 ) ) ( not ( = ?auto_25575 ?auto_25593 ) ) ( not ( = ?auto_25581 ?auto_25599 ) ) ( IS-CRATE ?auto_25574 ) ( not ( = ?auto_25592 ?auto_25583 ) ) ( HOIST-AT ?auto_25601 ?auto_25592 ) ( SURFACE-AT ?auto_25574 ?auto_25592 ) ( ON ?auto_25574 ?auto_25585 ) ( CLEAR ?auto_25574 ) ( not ( = ?auto_25573 ?auto_25574 ) ) ( not ( = ?auto_25573 ?auto_25585 ) ) ( not ( = ?auto_25574 ?auto_25585 ) ) ( not ( = ?auto_25581 ?auto_25601 ) ) ( IS-CRATE ?auto_25573 ) ( not ( = ?auto_25596 ?auto_25583 ) ) ( HOIST-AT ?auto_25588 ?auto_25596 ) ( AVAILABLE ?auto_25588 ) ( SURFACE-AT ?auto_25573 ?auto_25596 ) ( ON ?auto_25573 ?auto_25587 ) ( CLEAR ?auto_25573 ) ( not ( = ?auto_25572 ?auto_25573 ) ) ( not ( = ?auto_25572 ?auto_25587 ) ) ( not ( = ?auto_25573 ?auto_25587 ) ) ( not ( = ?auto_25581 ?auto_25588 ) ) ( IS-CRATE ?auto_25572 ) ( not ( = ?auto_25594 ?auto_25583 ) ) ( HOIST-AT ?auto_25589 ?auto_25594 ) ( AVAILABLE ?auto_25589 ) ( SURFACE-AT ?auto_25572 ?auto_25594 ) ( ON ?auto_25572 ?auto_25598 ) ( CLEAR ?auto_25572 ) ( not ( = ?auto_25571 ?auto_25572 ) ) ( not ( = ?auto_25571 ?auto_25598 ) ) ( not ( = ?auto_25572 ?auto_25598 ) ) ( not ( = ?auto_25581 ?auto_25589 ) ) ( SURFACE-AT ?auto_25570 ?auto_25583 ) ( CLEAR ?auto_25570 ) ( IS-CRATE ?auto_25571 ) ( AVAILABLE ?auto_25581 ) ( AVAILABLE ?auto_25601 ) ( SURFACE-AT ?auto_25571 ?auto_25592 ) ( ON ?auto_25571 ?auto_25597 ) ( CLEAR ?auto_25571 ) ( TRUCK-AT ?auto_25580 ?auto_25583 ) ( not ( = ?auto_25570 ?auto_25571 ) ) ( not ( = ?auto_25570 ?auto_25597 ) ) ( not ( = ?auto_25571 ?auto_25597 ) ) ( not ( = ?auto_25570 ?auto_25572 ) ) ( not ( = ?auto_25570 ?auto_25598 ) ) ( not ( = ?auto_25572 ?auto_25597 ) ) ( not ( = ?auto_25594 ?auto_25592 ) ) ( not ( = ?auto_25589 ?auto_25601 ) ) ( not ( = ?auto_25598 ?auto_25597 ) ) ( not ( = ?auto_25570 ?auto_25573 ) ) ( not ( = ?auto_25570 ?auto_25587 ) ) ( not ( = ?auto_25571 ?auto_25573 ) ) ( not ( = ?auto_25571 ?auto_25587 ) ) ( not ( = ?auto_25573 ?auto_25598 ) ) ( not ( = ?auto_25573 ?auto_25597 ) ) ( not ( = ?auto_25596 ?auto_25594 ) ) ( not ( = ?auto_25596 ?auto_25592 ) ) ( not ( = ?auto_25588 ?auto_25589 ) ) ( not ( = ?auto_25588 ?auto_25601 ) ) ( not ( = ?auto_25587 ?auto_25598 ) ) ( not ( = ?auto_25587 ?auto_25597 ) ) ( not ( = ?auto_25570 ?auto_25574 ) ) ( not ( = ?auto_25570 ?auto_25585 ) ) ( not ( = ?auto_25571 ?auto_25574 ) ) ( not ( = ?auto_25571 ?auto_25585 ) ) ( not ( = ?auto_25572 ?auto_25574 ) ) ( not ( = ?auto_25572 ?auto_25585 ) ) ( not ( = ?auto_25574 ?auto_25587 ) ) ( not ( = ?auto_25574 ?auto_25598 ) ) ( not ( = ?auto_25574 ?auto_25597 ) ) ( not ( = ?auto_25585 ?auto_25587 ) ) ( not ( = ?auto_25585 ?auto_25598 ) ) ( not ( = ?auto_25585 ?auto_25597 ) ) ( not ( = ?auto_25570 ?auto_25575 ) ) ( not ( = ?auto_25570 ?auto_25593 ) ) ( not ( = ?auto_25571 ?auto_25575 ) ) ( not ( = ?auto_25571 ?auto_25593 ) ) ( not ( = ?auto_25572 ?auto_25575 ) ) ( not ( = ?auto_25572 ?auto_25593 ) ) ( not ( = ?auto_25573 ?auto_25575 ) ) ( not ( = ?auto_25573 ?auto_25593 ) ) ( not ( = ?auto_25575 ?auto_25585 ) ) ( not ( = ?auto_25575 ?auto_25587 ) ) ( not ( = ?auto_25575 ?auto_25598 ) ) ( not ( = ?auto_25575 ?auto_25597 ) ) ( not ( = ?auto_25600 ?auto_25592 ) ) ( not ( = ?auto_25600 ?auto_25596 ) ) ( not ( = ?auto_25600 ?auto_25594 ) ) ( not ( = ?auto_25599 ?auto_25601 ) ) ( not ( = ?auto_25599 ?auto_25588 ) ) ( not ( = ?auto_25599 ?auto_25589 ) ) ( not ( = ?auto_25593 ?auto_25585 ) ) ( not ( = ?auto_25593 ?auto_25587 ) ) ( not ( = ?auto_25593 ?auto_25598 ) ) ( not ( = ?auto_25593 ?auto_25597 ) ) ( not ( = ?auto_25570 ?auto_25576 ) ) ( not ( = ?auto_25570 ?auto_25595 ) ) ( not ( = ?auto_25571 ?auto_25576 ) ) ( not ( = ?auto_25571 ?auto_25595 ) ) ( not ( = ?auto_25572 ?auto_25576 ) ) ( not ( = ?auto_25572 ?auto_25595 ) ) ( not ( = ?auto_25573 ?auto_25576 ) ) ( not ( = ?auto_25573 ?auto_25595 ) ) ( not ( = ?auto_25574 ?auto_25576 ) ) ( not ( = ?auto_25574 ?auto_25595 ) ) ( not ( = ?auto_25576 ?auto_25593 ) ) ( not ( = ?auto_25576 ?auto_25585 ) ) ( not ( = ?auto_25576 ?auto_25587 ) ) ( not ( = ?auto_25576 ?auto_25598 ) ) ( not ( = ?auto_25576 ?auto_25597 ) ) ( not ( = ?auto_25590 ?auto_25600 ) ) ( not ( = ?auto_25590 ?auto_25592 ) ) ( not ( = ?auto_25590 ?auto_25596 ) ) ( not ( = ?auto_25590 ?auto_25594 ) ) ( not ( = ?auto_25602 ?auto_25599 ) ) ( not ( = ?auto_25602 ?auto_25601 ) ) ( not ( = ?auto_25602 ?auto_25588 ) ) ( not ( = ?auto_25602 ?auto_25589 ) ) ( not ( = ?auto_25595 ?auto_25593 ) ) ( not ( = ?auto_25595 ?auto_25585 ) ) ( not ( = ?auto_25595 ?auto_25587 ) ) ( not ( = ?auto_25595 ?auto_25598 ) ) ( not ( = ?auto_25595 ?auto_25597 ) ) ( not ( = ?auto_25570 ?auto_25577 ) ) ( not ( = ?auto_25570 ?auto_25591 ) ) ( not ( = ?auto_25571 ?auto_25577 ) ) ( not ( = ?auto_25571 ?auto_25591 ) ) ( not ( = ?auto_25572 ?auto_25577 ) ) ( not ( = ?auto_25572 ?auto_25591 ) ) ( not ( = ?auto_25573 ?auto_25577 ) ) ( not ( = ?auto_25573 ?auto_25591 ) ) ( not ( = ?auto_25574 ?auto_25577 ) ) ( not ( = ?auto_25574 ?auto_25591 ) ) ( not ( = ?auto_25575 ?auto_25577 ) ) ( not ( = ?auto_25575 ?auto_25591 ) ) ( not ( = ?auto_25577 ?auto_25595 ) ) ( not ( = ?auto_25577 ?auto_25593 ) ) ( not ( = ?auto_25577 ?auto_25585 ) ) ( not ( = ?auto_25577 ?auto_25587 ) ) ( not ( = ?auto_25577 ?auto_25598 ) ) ( not ( = ?auto_25577 ?auto_25597 ) ) ( not ( = ?auto_25603 ?auto_25590 ) ) ( not ( = ?auto_25603 ?auto_25600 ) ) ( not ( = ?auto_25603 ?auto_25592 ) ) ( not ( = ?auto_25603 ?auto_25596 ) ) ( not ( = ?auto_25603 ?auto_25594 ) ) ( not ( = ?auto_25586 ?auto_25602 ) ) ( not ( = ?auto_25586 ?auto_25599 ) ) ( not ( = ?auto_25586 ?auto_25601 ) ) ( not ( = ?auto_25586 ?auto_25588 ) ) ( not ( = ?auto_25586 ?auto_25589 ) ) ( not ( = ?auto_25591 ?auto_25595 ) ) ( not ( = ?auto_25591 ?auto_25593 ) ) ( not ( = ?auto_25591 ?auto_25585 ) ) ( not ( = ?auto_25591 ?auto_25587 ) ) ( not ( = ?auto_25591 ?auto_25598 ) ) ( not ( = ?auto_25591 ?auto_25597 ) ) ( not ( = ?auto_25570 ?auto_25578 ) ) ( not ( = ?auto_25570 ?auto_25582 ) ) ( not ( = ?auto_25571 ?auto_25578 ) ) ( not ( = ?auto_25571 ?auto_25582 ) ) ( not ( = ?auto_25572 ?auto_25578 ) ) ( not ( = ?auto_25572 ?auto_25582 ) ) ( not ( = ?auto_25573 ?auto_25578 ) ) ( not ( = ?auto_25573 ?auto_25582 ) ) ( not ( = ?auto_25574 ?auto_25578 ) ) ( not ( = ?auto_25574 ?auto_25582 ) ) ( not ( = ?auto_25575 ?auto_25578 ) ) ( not ( = ?auto_25575 ?auto_25582 ) ) ( not ( = ?auto_25576 ?auto_25578 ) ) ( not ( = ?auto_25576 ?auto_25582 ) ) ( not ( = ?auto_25578 ?auto_25591 ) ) ( not ( = ?auto_25578 ?auto_25595 ) ) ( not ( = ?auto_25578 ?auto_25593 ) ) ( not ( = ?auto_25578 ?auto_25585 ) ) ( not ( = ?auto_25578 ?auto_25587 ) ) ( not ( = ?auto_25578 ?auto_25598 ) ) ( not ( = ?auto_25578 ?auto_25597 ) ) ( not ( = ?auto_25584 ?auto_25603 ) ) ( not ( = ?auto_25584 ?auto_25590 ) ) ( not ( = ?auto_25584 ?auto_25600 ) ) ( not ( = ?auto_25584 ?auto_25592 ) ) ( not ( = ?auto_25584 ?auto_25596 ) ) ( not ( = ?auto_25584 ?auto_25594 ) ) ( not ( = ?auto_25579 ?auto_25586 ) ) ( not ( = ?auto_25579 ?auto_25602 ) ) ( not ( = ?auto_25579 ?auto_25599 ) ) ( not ( = ?auto_25579 ?auto_25601 ) ) ( not ( = ?auto_25579 ?auto_25588 ) ) ( not ( = ?auto_25579 ?auto_25589 ) ) ( not ( = ?auto_25582 ?auto_25591 ) ) ( not ( = ?auto_25582 ?auto_25595 ) ) ( not ( = ?auto_25582 ?auto_25593 ) ) ( not ( = ?auto_25582 ?auto_25585 ) ) ( not ( = ?auto_25582 ?auto_25587 ) ) ( not ( = ?auto_25582 ?auto_25598 ) ) ( not ( = ?auto_25582 ?auto_25597 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_25570 ?auto_25571 ?auto_25572 ?auto_25573 ?auto_25574 ?auto_25575 ?auto_25576 ?auto_25577 )
      ( MAKE-1CRATE ?auto_25577 ?auto_25578 )
      ( MAKE-8CRATE-VERIFY ?auto_25570 ?auto_25571 ?auto_25572 ?auto_25573 ?auto_25574 ?auto_25575 ?auto_25576 ?auto_25577 ?auto_25578 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_25624 - SURFACE
      ?auto_25625 - SURFACE
      ?auto_25626 - SURFACE
      ?auto_25627 - SURFACE
      ?auto_25628 - SURFACE
      ?auto_25629 - SURFACE
      ?auto_25630 - SURFACE
      ?auto_25631 - SURFACE
      ?auto_25632 - SURFACE
      ?auto_25633 - SURFACE
    )
    :vars
    (
      ?auto_25637 - HOIST
      ?auto_25634 - PLACE
      ?auto_25635 - PLACE
      ?auto_25639 - HOIST
      ?auto_25636 - SURFACE
      ?auto_25653 - PLACE
      ?auto_25649 - HOIST
      ?auto_25644 - SURFACE
      ?auto_25640 - PLACE
      ?auto_25654 - HOIST
      ?auto_25646 - SURFACE
      ?auto_25647 - PLACE
      ?auto_25657 - HOIST
      ?auto_25660 - SURFACE
      ?auto_25651 - PLACE
      ?auto_25643 - HOIST
      ?auto_25659 - SURFACE
      ?auto_25645 - PLACE
      ?auto_25652 - HOIST
      ?auto_25650 - SURFACE
      ?auto_25656 - PLACE
      ?auto_25658 - HOIST
      ?auto_25661 - SURFACE
      ?auto_25655 - PLACE
      ?auto_25648 - HOIST
      ?auto_25642 - SURFACE
      ?auto_25641 - SURFACE
      ?auto_25638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25637 ?auto_25634 ) ( IS-CRATE ?auto_25633 ) ( not ( = ?auto_25635 ?auto_25634 ) ) ( HOIST-AT ?auto_25639 ?auto_25635 ) ( AVAILABLE ?auto_25639 ) ( SURFACE-AT ?auto_25633 ?auto_25635 ) ( ON ?auto_25633 ?auto_25636 ) ( CLEAR ?auto_25633 ) ( not ( = ?auto_25632 ?auto_25633 ) ) ( not ( = ?auto_25632 ?auto_25636 ) ) ( not ( = ?auto_25633 ?auto_25636 ) ) ( not ( = ?auto_25637 ?auto_25639 ) ) ( IS-CRATE ?auto_25632 ) ( not ( = ?auto_25653 ?auto_25634 ) ) ( HOIST-AT ?auto_25649 ?auto_25653 ) ( AVAILABLE ?auto_25649 ) ( SURFACE-AT ?auto_25632 ?auto_25653 ) ( ON ?auto_25632 ?auto_25644 ) ( CLEAR ?auto_25632 ) ( not ( = ?auto_25631 ?auto_25632 ) ) ( not ( = ?auto_25631 ?auto_25644 ) ) ( not ( = ?auto_25632 ?auto_25644 ) ) ( not ( = ?auto_25637 ?auto_25649 ) ) ( IS-CRATE ?auto_25631 ) ( not ( = ?auto_25640 ?auto_25634 ) ) ( HOIST-AT ?auto_25654 ?auto_25640 ) ( AVAILABLE ?auto_25654 ) ( SURFACE-AT ?auto_25631 ?auto_25640 ) ( ON ?auto_25631 ?auto_25646 ) ( CLEAR ?auto_25631 ) ( not ( = ?auto_25630 ?auto_25631 ) ) ( not ( = ?auto_25630 ?auto_25646 ) ) ( not ( = ?auto_25631 ?auto_25646 ) ) ( not ( = ?auto_25637 ?auto_25654 ) ) ( IS-CRATE ?auto_25630 ) ( not ( = ?auto_25647 ?auto_25634 ) ) ( HOIST-AT ?auto_25657 ?auto_25647 ) ( AVAILABLE ?auto_25657 ) ( SURFACE-AT ?auto_25630 ?auto_25647 ) ( ON ?auto_25630 ?auto_25660 ) ( CLEAR ?auto_25630 ) ( not ( = ?auto_25629 ?auto_25630 ) ) ( not ( = ?auto_25629 ?auto_25660 ) ) ( not ( = ?auto_25630 ?auto_25660 ) ) ( not ( = ?auto_25637 ?auto_25657 ) ) ( IS-CRATE ?auto_25629 ) ( not ( = ?auto_25651 ?auto_25634 ) ) ( HOIST-AT ?auto_25643 ?auto_25651 ) ( AVAILABLE ?auto_25643 ) ( SURFACE-AT ?auto_25629 ?auto_25651 ) ( ON ?auto_25629 ?auto_25659 ) ( CLEAR ?auto_25629 ) ( not ( = ?auto_25628 ?auto_25629 ) ) ( not ( = ?auto_25628 ?auto_25659 ) ) ( not ( = ?auto_25629 ?auto_25659 ) ) ( not ( = ?auto_25637 ?auto_25643 ) ) ( IS-CRATE ?auto_25628 ) ( not ( = ?auto_25645 ?auto_25634 ) ) ( HOIST-AT ?auto_25652 ?auto_25645 ) ( SURFACE-AT ?auto_25628 ?auto_25645 ) ( ON ?auto_25628 ?auto_25650 ) ( CLEAR ?auto_25628 ) ( not ( = ?auto_25627 ?auto_25628 ) ) ( not ( = ?auto_25627 ?auto_25650 ) ) ( not ( = ?auto_25628 ?auto_25650 ) ) ( not ( = ?auto_25637 ?auto_25652 ) ) ( IS-CRATE ?auto_25627 ) ( not ( = ?auto_25656 ?auto_25634 ) ) ( HOIST-AT ?auto_25658 ?auto_25656 ) ( AVAILABLE ?auto_25658 ) ( SURFACE-AT ?auto_25627 ?auto_25656 ) ( ON ?auto_25627 ?auto_25661 ) ( CLEAR ?auto_25627 ) ( not ( = ?auto_25626 ?auto_25627 ) ) ( not ( = ?auto_25626 ?auto_25661 ) ) ( not ( = ?auto_25627 ?auto_25661 ) ) ( not ( = ?auto_25637 ?auto_25658 ) ) ( IS-CRATE ?auto_25626 ) ( not ( = ?auto_25655 ?auto_25634 ) ) ( HOIST-AT ?auto_25648 ?auto_25655 ) ( AVAILABLE ?auto_25648 ) ( SURFACE-AT ?auto_25626 ?auto_25655 ) ( ON ?auto_25626 ?auto_25642 ) ( CLEAR ?auto_25626 ) ( not ( = ?auto_25625 ?auto_25626 ) ) ( not ( = ?auto_25625 ?auto_25642 ) ) ( not ( = ?auto_25626 ?auto_25642 ) ) ( not ( = ?auto_25637 ?auto_25648 ) ) ( SURFACE-AT ?auto_25624 ?auto_25634 ) ( CLEAR ?auto_25624 ) ( IS-CRATE ?auto_25625 ) ( AVAILABLE ?auto_25637 ) ( AVAILABLE ?auto_25652 ) ( SURFACE-AT ?auto_25625 ?auto_25645 ) ( ON ?auto_25625 ?auto_25641 ) ( CLEAR ?auto_25625 ) ( TRUCK-AT ?auto_25638 ?auto_25634 ) ( not ( = ?auto_25624 ?auto_25625 ) ) ( not ( = ?auto_25624 ?auto_25641 ) ) ( not ( = ?auto_25625 ?auto_25641 ) ) ( not ( = ?auto_25624 ?auto_25626 ) ) ( not ( = ?auto_25624 ?auto_25642 ) ) ( not ( = ?auto_25626 ?auto_25641 ) ) ( not ( = ?auto_25655 ?auto_25645 ) ) ( not ( = ?auto_25648 ?auto_25652 ) ) ( not ( = ?auto_25642 ?auto_25641 ) ) ( not ( = ?auto_25624 ?auto_25627 ) ) ( not ( = ?auto_25624 ?auto_25661 ) ) ( not ( = ?auto_25625 ?auto_25627 ) ) ( not ( = ?auto_25625 ?auto_25661 ) ) ( not ( = ?auto_25627 ?auto_25642 ) ) ( not ( = ?auto_25627 ?auto_25641 ) ) ( not ( = ?auto_25656 ?auto_25655 ) ) ( not ( = ?auto_25656 ?auto_25645 ) ) ( not ( = ?auto_25658 ?auto_25648 ) ) ( not ( = ?auto_25658 ?auto_25652 ) ) ( not ( = ?auto_25661 ?auto_25642 ) ) ( not ( = ?auto_25661 ?auto_25641 ) ) ( not ( = ?auto_25624 ?auto_25628 ) ) ( not ( = ?auto_25624 ?auto_25650 ) ) ( not ( = ?auto_25625 ?auto_25628 ) ) ( not ( = ?auto_25625 ?auto_25650 ) ) ( not ( = ?auto_25626 ?auto_25628 ) ) ( not ( = ?auto_25626 ?auto_25650 ) ) ( not ( = ?auto_25628 ?auto_25661 ) ) ( not ( = ?auto_25628 ?auto_25642 ) ) ( not ( = ?auto_25628 ?auto_25641 ) ) ( not ( = ?auto_25650 ?auto_25661 ) ) ( not ( = ?auto_25650 ?auto_25642 ) ) ( not ( = ?auto_25650 ?auto_25641 ) ) ( not ( = ?auto_25624 ?auto_25629 ) ) ( not ( = ?auto_25624 ?auto_25659 ) ) ( not ( = ?auto_25625 ?auto_25629 ) ) ( not ( = ?auto_25625 ?auto_25659 ) ) ( not ( = ?auto_25626 ?auto_25629 ) ) ( not ( = ?auto_25626 ?auto_25659 ) ) ( not ( = ?auto_25627 ?auto_25629 ) ) ( not ( = ?auto_25627 ?auto_25659 ) ) ( not ( = ?auto_25629 ?auto_25650 ) ) ( not ( = ?auto_25629 ?auto_25661 ) ) ( not ( = ?auto_25629 ?auto_25642 ) ) ( not ( = ?auto_25629 ?auto_25641 ) ) ( not ( = ?auto_25651 ?auto_25645 ) ) ( not ( = ?auto_25651 ?auto_25656 ) ) ( not ( = ?auto_25651 ?auto_25655 ) ) ( not ( = ?auto_25643 ?auto_25652 ) ) ( not ( = ?auto_25643 ?auto_25658 ) ) ( not ( = ?auto_25643 ?auto_25648 ) ) ( not ( = ?auto_25659 ?auto_25650 ) ) ( not ( = ?auto_25659 ?auto_25661 ) ) ( not ( = ?auto_25659 ?auto_25642 ) ) ( not ( = ?auto_25659 ?auto_25641 ) ) ( not ( = ?auto_25624 ?auto_25630 ) ) ( not ( = ?auto_25624 ?auto_25660 ) ) ( not ( = ?auto_25625 ?auto_25630 ) ) ( not ( = ?auto_25625 ?auto_25660 ) ) ( not ( = ?auto_25626 ?auto_25630 ) ) ( not ( = ?auto_25626 ?auto_25660 ) ) ( not ( = ?auto_25627 ?auto_25630 ) ) ( not ( = ?auto_25627 ?auto_25660 ) ) ( not ( = ?auto_25628 ?auto_25630 ) ) ( not ( = ?auto_25628 ?auto_25660 ) ) ( not ( = ?auto_25630 ?auto_25659 ) ) ( not ( = ?auto_25630 ?auto_25650 ) ) ( not ( = ?auto_25630 ?auto_25661 ) ) ( not ( = ?auto_25630 ?auto_25642 ) ) ( not ( = ?auto_25630 ?auto_25641 ) ) ( not ( = ?auto_25647 ?auto_25651 ) ) ( not ( = ?auto_25647 ?auto_25645 ) ) ( not ( = ?auto_25647 ?auto_25656 ) ) ( not ( = ?auto_25647 ?auto_25655 ) ) ( not ( = ?auto_25657 ?auto_25643 ) ) ( not ( = ?auto_25657 ?auto_25652 ) ) ( not ( = ?auto_25657 ?auto_25658 ) ) ( not ( = ?auto_25657 ?auto_25648 ) ) ( not ( = ?auto_25660 ?auto_25659 ) ) ( not ( = ?auto_25660 ?auto_25650 ) ) ( not ( = ?auto_25660 ?auto_25661 ) ) ( not ( = ?auto_25660 ?auto_25642 ) ) ( not ( = ?auto_25660 ?auto_25641 ) ) ( not ( = ?auto_25624 ?auto_25631 ) ) ( not ( = ?auto_25624 ?auto_25646 ) ) ( not ( = ?auto_25625 ?auto_25631 ) ) ( not ( = ?auto_25625 ?auto_25646 ) ) ( not ( = ?auto_25626 ?auto_25631 ) ) ( not ( = ?auto_25626 ?auto_25646 ) ) ( not ( = ?auto_25627 ?auto_25631 ) ) ( not ( = ?auto_25627 ?auto_25646 ) ) ( not ( = ?auto_25628 ?auto_25631 ) ) ( not ( = ?auto_25628 ?auto_25646 ) ) ( not ( = ?auto_25629 ?auto_25631 ) ) ( not ( = ?auto_25629 ?auto_25646 ) ) ( not ( = ?auto_25631 ?auto_25660 ) ) ( not ( = ?auto_25631 ?auto_25659 ) ) ( not ( = ?auto_25631 ?auto_25650 ) ) ( not ( = ?auto_25631 ?auto_25661 ) ) ( not ( = ?auto_25631 ?auto_25642 ) ) ( not ( = ?auto_25631 ?auto_25641 ) ) ( not ( = ?auto_25640 ?auto_25647 ) ) ( not ( = ?auto_25640 ?auto_25651 ) ) ( not ( = ?auto_25640 ?auto_25645 ) ) ( not ( = ?auto_25640 ?auto_25656 ) ) ( not ( = ?auto_25640 ?auto_25655 ) ) ( not ( = ?auto_25654 ?auto_25657 ) ) ( not ( = ?auto_25654 ?auto_25643 ) ) ( not ( = ?auto_25654 ?auto_25652 ) ) ( not ( = ?auto_25654 ?auto_25658 ) ) ( not ( = ?auto_25654 ?auto_25648 ) ) ( not ( = ?auto_25646 ?auto_25660 ) ) ( not ( = ?auto_25646 ?auto_25659 ) ) ( not ( = ?auto_25646 ?auto_25650 ) ) ( not ( = ?auto_25646 ?auto_25661 ) ) ( not ( = ?auto_25646 ?auto_25642 ) ) ( not ( = ?auto_25646 ?auto_25641 ) ) ( not ( = ?auto_25624 ?auto_25632 ) ) ( not ( = ?auto_25624 ?auto_25644 ) ) ( not ( = ?auto_25625 ?auto_25632 ) ) ( not ( = ?auto_25625 ?auto_25644 ) ) ( not ( = ?auto_25626 ?auto_25632 ) ) ( not ( = ?auto_25626 ?auto_25644 ) ) ( not ( = ?auto_25627 ?auto_25632 ) ) ( not ( = ?auto_25627 ?auto_25644 ) ) ( not ( = ?auto_25628 ?auto_25632 ) ) ( not ( = ?auto_25628 ?auto_25644 ) ) ( not ( = ?auto_25629 ?auto_25632 ) ) ( not ( = ?auto_25629 ?auto_25644 ) ) ( not ( = ?auto_25630 ?auto_25632 ) ) ( not ( = ?auto_25630 ?auto_25644 ) ) ( not ( = ?auto_25632 ?auto_25646 ) ) ( not ( = ?auto_25632 ?auto_25660 ) ) ( not ( = ?auto_25632 ?auto_25659 ) ) ( not ( = ?auto_25632 ?auto_25650 ) ) ( not ( = ?auto_25632 ?auto_25661 ) ) ( not ( = ?auto_25632 ?auto_25642 ) ) ( not ( = ?auto_25632 ?auto_25641 ) ) ( not ( = ?auto_25653 ?auto_25640 ) ) ( not ( = ?auto_25653 ?auto_25647 ) ) ( not ( = ?auto_25653 ?auto_25651 ) ) ( not ( = ?auto_25653 ?auto_25645 ) ) ( not ( = ?auto_25653 ?auto_25656 ) ) ( not ( = ?auto_25653 ?auto_25655 ) ) ( not ( = ?auto_25649 ?auto_25654 ) ) ( not ( = ?auto_25649 ?auto_25657 ) ) ( not ( = ?auto_25649 ?auto_25643 ) ) ( not ( = ?auto_25649 ?auto_25652 ) ) ( not ( = ?auto_25649 ?auto_25658 ) ) ( not ( = ?auto_25649 ?auto_25648 ) ) ( not ( = ?auto_25644 ?auto_25646 ) ) ( not ( = ?auto_25644 ?auto_25660 ) ) ( not ( = ?auto_25644 ?auto_25659 ) ) ( not ( = ?auto_25644 ?auto_25650 ) ) ( not ( = ?auto_25644 ?auto_25661 ) ) ( not ( = ?auto_25644 ?auto_25642 ) ) ( not ( = ?auto_25644 ?auto_25641 ) ) ( not ( = ?auto_25624 ?auto_25633 ) ) ( not ( = ?auto_25624 ?auto_25636 ) ) ( not ( = ?auto_25625 ?auto_25633 ) ) ( not ( = ?auto_25625 ?auto_25636 ) ) ( not ( = ?auto_25626 ?auto_25633 ) ) ( not ( = ?auto_25626 ?auto_25636 ) ) ( not ( = ?auto_25627 ?auto_25633 ) ) ( not ( = ?auto_25627 ?auto_25636 ) ) ( not ( = ?auto_25628 ?auto_25633 ) ) ( not ( = ?auto_25628 ?auto_25636 ) ) ( not ( = ?auto_25629 ?auto_25633 ) ) ( not ( = ?auto_25629 ?auto_25636 ) ) ( not ( = ?auto_25630 ?auto_25633 ) ) ( not ( = ?auto_25630 ?auto_25636 ) ) ( not ( = ?auto_25631 ?auto_25633 ) ) ( not ( = ?auto_25631 ?auto_25636 ) ) ( not ( = ?auto_25633 ?auto_25644 ) ) ( not ( = ?auto_25633 ?auto_25646 ) ) ( not ( = ?auto_25633 ?auto_25660 ) ) ( not ( = ?auto_25633 ?auto_25659 ) ) ( not ( = ?auto_25633 ?auto_25650 ) ) ( not ( = ?auto_25633 ?auto_25661 ) ) ( not ( = ?auto_25633 ?auto_25642 ) ) ( not ( = ?auto_25633 ?auto_25641 ) ) ( not ( = ?auto_25635 ?auto_25653 ) ) ( not ( = ?auto_25635 ?auto_25640 ) ) ( not ( = ?auto_25635 ?auto_25647 ) ) ( not ( = ?auto_25635 ?auto_25651 ) ) ( not ( = ?auto_25635 ?auto_25645 ) ) ( not ( = ?auto_25635 ?auto_25656 ) ) ( not ( = ?auto_25635 ?auto_25655 ) ) ( not ( = ?auto_25639 ?auto_25649 ) ) ( not ( = ?auto_25639 ?auto_25654 ) ) ( not ( = ?auto_25639 ?auto_25657 ) ) ( not ( = ?auto_25639 ?auto_25643 ) ) ( not ( = ?auto_25639 ?auto_25652 ) ) ( not ( = ?auto_25639 ?auto_25658 ) ) ( not ( = ?auto_25639 ?auto_25648 ) ) ( not ( = ?auto_25636 ?auto_25644 ) ) ( not ( = ?auto_25636 ?auto_25646 ) ) ( not ( = ?auto_25636 ?auto_25660 ) ) ( not ( = ?auto_25636 ?auto_25659 ) ) ( not ( = ?auto_25636 ?auto_25650 ) ) ( not ( = ?auto_25636 ?auto_25661 ) ) ( not ( = ?auto_25636 ?auto_25642 ) ) ( not ( = ?auto_25636 ?auto_25641 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_25624 ?auto_25625 ?auto_25626 ?auto_25627 ?auto_25628 ?auto_25629 ?auto_25630 ?auto_25631 ?auto_25632 )
      ( MAKE-1CRATE ?auto_25632 ?auto_25633 )
      ( MAKE-9CRATE-VERIFY ?auto_25624 ?auto_25625 ?auto_25626 ?auto_25627 ?auto_25628 ?auto_25629 ?auto_25630 ?auto_25631 ?auto_25632 ?auto_25633 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_25683 - SURFACE
      ?auto_25684 - SURFACE
      ?auto_25685 - SURFACE
      ?auto_25686 - SURFACE
      ?auto_25687 - SURFACE
      ?auto_25688 - SURFACE
      ?auto_25689 - SURFACE
      ?auto_25690 - SURFACE
      ?auto_25691 - SURFACE
      ?auto_25692 - SURFACE
      ?auto_25693 - SURFACE
    )
    :vars
    (
      ?auto_25695 - HOIST
      ?auto_25698 - PLACE
      ?auto_25694 - PLACE
      ?auto_25699 - HOIST
      ?auto_25697 - SURFACE
      ?auto_25710 - PLACE
      ?auto_25707 - HOIST
      ?auto_25720 - SURFACE
      ?auto_25713 - PLACE
      ?auto_25717 - HOIST
      ?auto_25706 - SURFACE
      ?auto_25719 - PLACE
      ?auto_25722 - HOIST
      ?auto_25704 - SURFACE
      ?auto_25703 - PLACE
      ?auto_25715 - HOIST
      ?auto_25711 - SURFACE
      ?auto_25718 - PLACE
      ?auto_25723 - HOIST
      ?auto_25702 - SURFACE
      ?auto_25705 - PLACE
      ?auto_25709 - HOIST
      ?auto_25700 - SURFACE
      ?auto_25701 - PLACE
      ?auto_25712 - HOIST
      ?auto_25724 - SURFACE
      ?auto_25714 - PLACE
      ?auto_25721 - HOIST
      ?auto_25708 - SURFACE
      ?auto_25716 - SURFACE
      ?auto_25696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25695 ?auto_25698 ) ( IS-CRATE ?auto_25693 ) ( not ( = ?auto_25694 ?auto_25698 ) ) ( HOIST-AT ?auto_25699 ?auto_25694 ) ( AVAILABLE ?auto_25699 ) ( SURFACE-AT ?auto_25693 ?auto_25694 ) ( ON ?auto_25693 ?auto_25697 ) ( CLEAR ?auto_25693 ) ( not ( = ?auto_25692 ?auto_25693 ) ) ( not ( = ?auto_25692 ?auto_25697 ) ) ( not ( = ?auto_25693 ?auto_25697 ) ) ( not ( = ?auto_25695 ?auto_25699 ) ) ( IS-CRATE ?auto_25692 ) ( not ( = ?auto_25710 ?auto_25698 ) ) ( HOIST-AT ?auto_25707 ?auto_25710 ) ( AVAILABLE ?auto_25707 ) ( SURFACE-AT ?auto_25692 ?auto_25710 ) ( ON ?auto_25692 ?auto_25720 ) ( CLEAR ?auto_25692 ) ( not ( = ?auto_25691 ?auto_25692 ) ) ( not ( = ?auto_25691 ?auto_25720 ) ) ( not ( = ?auto_25692 ?auto_25720 ) ) ( not ( = ?auto_25695 ?auto_25707 ) ) ( IS-CRATE ?auto_25691 ) ( not ( = ?auto_25713 ?auto_25698 ) ) ( HOIST-AT ?auto_25717 ?auto_25713 ) ( AVAILABLE ?auto_25717 ) ( SURFACE-AT ?auto_25691 ?auto_25713 ) ( ON ?auto_25691 ?auto_25706 ) ( CLEAR ?auto_25691 ) ( not ( = ?auto_25690 ?auto_25691 ) ) ( not ( = ?auto_25690 ?auto_25706 ) ) ( not ( = ?auto_25691 ?auto_25706 ) ) ( not ( = ?auto_25695 ?auto_25717 ) ) ( IS-CRATE ?auto_25690 ) ( not ( = ?auto_25719 ?auto_25698 ) ) ( HOIST-AT ?auto_25722 ?auto_25719 ) ( AVAILABLE ?auto_25722 ) ( SURFACE-AT ?auto_25690 ?auto_25719 ) ( ON ?auto_25690 ?auto_25704 ) ( CLEAR ?auto_25690 ) ( not ( = ?auto_25689 ?auto_25690 ) ) ( not ( = ?auto_25689 ?auto_25704 ) ) ( not ( = ?auto_25690 ?auto_25704 ) ) ( not ( = ?auto_25695 ?auto_25722 ) ) ( IS-CRATE ?auto_25689 ) ( not ( = ?auto_25703 ?auto_25698 ) ) ( HOIST-AT ?auto_25715 ?auto_25703 ) ( AVAILABLE ?auto_25715 ) ( SURFACE-AT ?auto_25689 ?auto_25703 ) ( ON ?auto_25689 ?auto_25711 ) ( CLEAR ?auto_25689 ) ( not ( = ?auto_25688 ?auto_25689 ) ) ( not ( = ?auto_25688 ?auto_25711 ) ) ( not ( = ?auto_25689 ?auto_25711 ) ) ( not ( = ?auto_25695 ?auto_25715 ) ) ( IS-CRATE ?auto_25688 ) ( not ( = ?auto_25718 ?auto_25698 ) ) ( HOIST-AT ?auto_25723 ?auto_25718 ) ( AVAILABLE ?auto_25723 ) ( SURFACE-AT ?auto_25688 ?auto_25718 ) ( ON ?auto_25688 ?auto_25702 ) ( CLEAR ?auto_25688 ) ( not ( = ?auto_25687 ?auto_25688 ) ) ( not ( = ?auto_25687 ?auto_25702 ) ) ( not ( = ?auto_25688 ?auto_25702 ) ) ( not ( = ?auto_25695 ?auto_25723 ) ) ( IS-CRATE ?auto_25687 ) ( not ( = ?auto_25705 ?auto_25698 ) ) ( HOIST-AT ?auto_25709 ?auto_25705 ) ( SURFACE-AT ?auto_25687 ?auto_25705 ) ( ON ?auto_25687 ?auto_25700 ) ( CLEAR ?auto_25687 ) ( not ( = ?auto_25686 ?auto_25687 ) ) ( not ( = ?auto_25686 ?auto_25700 ) ) ( not ( = ?auto_25687 ?auto_25700 ) ) ( not ( = ?auto_25695 ?auto_25709 ) ) ( IS-CRATE ?auto_25686 ) ( not ( = ?auto_25701 ?auto_25698 ) ) ( HOIST-AT ?auto_25712 ?auto_25701 ) ( AVAILABLE ?auto_25712 ) ( SURFACE-AT ?auto_25686 ?auto_25701 ) ( ON ?auto_25686 ?auto_25724 ) ( CLEAR ?auto_25686 ) ( not ( = ?auto_25685 ?auto_25686 ) ) ( not ( = ?auto_25685 ?auto_25724 ) ) ( not ( = ?auto_25686 ?auto_25724 ) ) ( not ( = ?auto_25695 ?auto_25712 ) ) ( IS-CRATE ?auto_25685 ) ( not ( = ?auto_25714 ?auto_25698 ) ) ( HOIST-AT ?auto_25721 ?auto_25714 ) ( AVAILABLE ?auto_25721 ) ( SURFACE-AT ?auto_25685 ?auto_25714 ) ( ON ?auto_25685 ?auto_25708 ) ( CLEAR ?auto_25685 ) ( not ( = ?auto_25684 ?auto_25685 ) ) ( not ( = ?auto_25684 ?auto_25708 ) ) ( not ( = ?auto_25685 ?auto_25708 ) ) ( not ( = ?auto_25695 ?auto_25721 ) ) ( SURFACE-AT ?auto_25683 ?auto_25698 ) ( CLEAR ?auto_25683 ) ( IS-CRATE ?auto_25684 ) ( AVAILABLE ?auto_25695 ) ( AVAILABLE ?auto_25709 ) ( SURFACE-AT ?auto_25684 ?auto_25705 ) ( ON ?auto_25684 ?auto_25716 ) ( CLEAR ?auto_25684 ) ( TRUCK-AT ?auto_25696 ?auto_25698 ) ( not ( = ?auto_25683 ?auto_25684 ) ) ( not ( = ?auto_25683 ?auto_25716 ) ) ( not ( = ?auto_25684 ?auto_25716 ) ) ( not ( = ?auto_25683 ?auto_25685 ) ) ( not ( = ?auto_25683 ?auto_25708 ) ) ( not ( = ?auto_25685 ?auto_25716 ) ) ( not ( = ?auto_25714 ?auto_25705 ) ) ( not ( = ?auto_25721 ?auto_25709 ) ) ( not ( = ?auto_25708 ?auto_25716 ) ) ( not ( = ?auto_25683 ?auto_25686 ) ) ( not ( = ?auto_25683 ?auto_25724 ) ) ( not ( = ?auto_25684 ?auto_25686 ) ) ( not ( = ?auto_25684 ?auto_25724 ) ) ( not ( = ?auto_25686 ?auto_25708 ) ) ( not ( = ?auto_25686 ?auto_25716 ) ) ( not ( = ?auto_25701 ?auto_25714 ) ) ( not ( = ?auto_25701 ?auto_25705 ) ) ( not ( = ?auto_25712 ?auto_25721 ) ) ( not ( = ?auto_25712 ?auto_25709 ) ) ( not ( = ?auto_25724 ?auto_25708 ) ) ( not ( = ?auto_25724 ?auto_25716 ) ) ( not ( = ?auto_25683 ?auto_25687 ) ) ( not ( = ?auto_25683 ?auto_25700 ) ) ( not ( = ?auto_25684 ?auto_25687 ) ) ( not ( = ?auto_25684 ?auto_25700 ) ) ( not ( = ?auto_25685 ?auto_25687 ) ) ( not ( = ?auto_25685 ?auto_25700 ) ) ( not ( = ?auto_25687 ?auto_25724 ) ) ( not ( = ?auto_25687 ?auto_25708 ) ) ( not ( = ?auto_25687 ?auto_25716 ) ) ( not ( = ?auto_25700 ?auto_25724 ) ) ( not ( = ?auto_25700 ?auto_25708 ) ) ( not ( = ?auto_25700 ?auto_25716 ) ) ( not ( = ?auto_25683 ?auto_25688 ) ) ( not ( = ?auto_25683 ?auto_25702 ) ) ( not ( = ?auto_25684 ?auto_25688 ) ) ( not ( = ?auto_25684 ?auto_25702 ) ) ( not ( = ?auto_25685 ?auto_25688 ) ) ( not ( = ?auto_25685 ?auto_25702 ) ) ( not ( = ?auto_25686 ?auto_25688 ) ) ( not ( = ?auto_25686 ?auto_25702 ) ) ( not ( = ?auto_25688 ?auto_25700 ) ) ( not ( = ?auto_25688 ?auto_25724 ) ) ( not ( = ?auto_25688 ?auto_25708 ) ) ( not ( = ?auto_25688 ?auto_25716 ) ) ( not ( = ?auto_25718 ?auto_25705 ) ) ( not ( = ?auto_25718 ?auto_25701 ) ) ( not ( = ?auto_25718 ?auto_25714 ) ) ( not ( = ?auto_25723 ?auto_25709 ) ) ( not ( = ?auto_25723 ?auto_25712 ) ) ( not ( = ?auto_25723 ?auto_25721 ) ) ( not ( = ?auto_25702 ?auto_25700 ) ) ( not ( = ?auto_25702 ?auto_25724 ) ) ( not ( = ?auto_25702 ?auto_25708 ) ) ( not ( = ?auto_25702 ?auto_25716 ) ) ( not ( = ?auto_25683 ?auto_25689 ) ) ( not ( = ?auto_25683 ?auto_25711 ) ) ( not ( = ?auto_25684 ?auto_25689 ) ) ( not ( = ?auto_25684 ?auto_25711 ) ) ( not ( = ?auto_25685 ?auto_25689 ) ) ( not ( = ?auto_25685 ?auto_25711 ) ) ( not ( = ?auto_25686 ?auto_25689 ) ) ( not ( = ?auto_25686 ?auto_25711 ) ) ( not ( = ?auto_25687 ?auto_25689 ) ) ( not ( = ?auto_25687 ?auto_25711 ) ) ( not ( = ?auto_25689 ?auto_25702 ) ) ( not ( = ?auto_25689 ?auto_25700 ) ) ( not ( = ?auto_25689 ?auto_25724 ) ) ( not ( = ?auto_25689 ?auto_25708 ) ) ( not ( = ?auto_25689 ?auto_25716 ) ) ( not ( = ?auto_25703 ?auto_25718 ) ) ( not ( = ?auto_25703 ?auto_25705 ) ) ( not ( = ?auto_25703 ?auto_25701 ) ) ( not ( = ?auto_25703 ?auto_25714 ) ) ( not ( = ?auto_25715 ?auto_25723 ) ) ( not ( = ?auto_25715 ?auto_25709 ) ) ( not ( = ?auto_25715 ?auto_25712 ) ) ( not ( = ?auto_25715 ?auto_25721 ) ) ( not ( = ?auto_25711 ?auto_25702 ) ) ( not ( = ?auto_25711 ?auto_25700 ) ) ( not ( = ?auto_25711 ?auto_25724 ) ) ( not ( = ?auto_25711 ?auto_25708 ) ) ( not ( = ?auto_25711 ?auto_25716 ) ) ( not ( = ?auto_25683 ?auto_25690 ) ) ( not ( = ?auto_25683 ?auto_25704 ) ) ( not ( = ?auto_25684 ?auto_25690 ) ) ( not ( = ?auto_25684 ?auto_25704 ) ) ( not ( = ?auto_25685 ?auto_25690 ) ) ( not ( = ?auto_25685 ?auto_25704 ) ) ( not ( = ?auto_25686 ?auto_25690 ) ) ( not ( = ?auto_25686 ?auto_25704 ) ) ( not ( = ?auto_25687 ?auto_25690 ) ) ( not ( = ?auto_25687 ?auto_25704 ) ) ( not ( = ?auto_25688 ?auto_25690 ) ) ( not ( = ?auto_25688 ?auto_25704 ) ) ( not ( = ?auto_25690 ?auto_25711 ) ) ( not ( = ?auto_25690 ?auto_25702 ) ) ( not ( = ?auto_25690 ?auto_25700 ) ) ( not ( = ?auto_25690 ?auto_25724 ) ) ( not ( = ?auto_25690 ?auto_25708 ) ) ( not ( = ?auto_25690 ?auto_25716 ) ) ( not ( = ?auto_25719 ?auto_25703 ) ) ( not ( = ?auto_25719 ?auto_25718 ) ) ( not ( = ?auto_25719 ?auto_25705 ) ) ( not ( = ?auto_25719 ?auto_25701 ) ) ( not ( = ?auto_25719 ?auto_25714 ) ) ( not ( = ?auto_25722 ?auto_25715 ) ) ( not ( = ?auto_25722 ?auto_25723 ) ) ( not ( = ?auto_25722 ?auto_25709 ) ) ( not ( = ?auto_25722 ?auto_25712 ) ) ( not ( = ?auto_25722 ?auto_25721 ) ) ( not ( = ?auto_25704 ?auto_25711 ) ) ( not ( = ?auto_25704 ?auto_25702 ) ) ( not ( = ?auto_25704 ?auto_25700 ) ) ( not ( = ?auto_25704 ?auto_25724 ) ) ( not ( = ?auto_25704 ?auto_25708 ) ) ( not ( = ?auto_25704 ?auto_25716 ) ) ( not ( = ?auto_25683 ?auto_25691 ) ) ( not ( = ?auto_25683 ?auto_25706 ) ) ( not ( = ?auto_25684 ?auto_25691 ) ) ( not ( = ?auto_25684 ?auto_25706 ) ) ( not ( = ?auto_25685 ?auto_25691 ) ) ( not ( = ?auto_25685 ?auto_25706 ) ) ( not ( = ?auto_25686 ?auto_25691 ) ) ( not ( = ?auto_25686 ?auto_25706 ) ) ( not ( = ?auto_25687 ?auto_25691 ) ) ( not ( = ?auto_25687 ?auto_25706 ) ) ( not ( = ?auto_25688 ?auto_25691 ) ) ( not ( = ?auto_25688 ?auto_25706 ) ) ( not ( = ?auto_25689 ?auto_25691 ) ) ( not ( = ?auto_25689 ?auto_25706 ) ) ( not ( = ?auto_25691 ?auto_25704 ) ) ( not ( = ?auto_25691 ?auto_25711 ) ) ( not ( = ?auto_25691 ?auto_25702 ) ) ( not ( = ?auto_25691 ?auto_25700 ) ) ( not ( = ?auto_25691 ?auto_25724 ) ) ( not ( = ?auto_25691 ?auto_25708 ) ) ( not ( = ?auto_25691 ?auto_25716 ) ) ( not ( = ?auto_25713 ?auto_25719 ) ) ( not ( = ?auto_25713 ?auto_25703 ) ) ( not ( = ?auto_25713 ?auto_25718 ) ) ( not ( = ?auto_25713 ?auto_25705 ) ) ( not ( = ?auto_25713 ?auto_25701 ) ) ( not ( = ?auto_25713 ?auto_25714 ) ) ( not ( = ?auto_25717 ?auto_25722 ) ) ( not ( = ?auto_25717 ?auto_25715 ) ) ( not ( = ?auto_25717 ?auto_25723 ) ) ( not ( = ?auto_25717 ?auto_25709 ) ) ( not ( = ?auto_25717 ?auto_25712 ) ) ( not ( = ?auto_25717 ?auto_25721 ) ) ( not ( = ?auto_25706 ?auto_25704 ) ) ( not ( = ?auto_25706 ?auto_25711 ) ) ( not ( = ?auto_25706 ?auto_25702 ) ) ( not ( = ?auto_25706 ?auto_25700 ) ) ( not ( = ?auto_25706 ?auto_25724 ) ) ( not ( = ?auto_25706 ?auto_25708 ) ) ( not ( = ?auto_25706 ?auto_25716 ) ) ( not ( = ?auto_25683 ?auto_25692 ) ) ( not ( = ?auto_25683 ?auto_25720 ) ) ( not ( = ?auto_25684 ?auto_25692 ) ) ( not ( = ?auto_25684 ?auto_25720 ) ) ( not ( = ?auto_25685 ?auto_25692 ) ) ( not ( = ?auto_25685 ?auto_25720 ) ) ( not ( = ?auto_25686 ?auto_25692 ) ) ( not ( = ?auto_25686 ?auto_25720 ) ) ( not ( = ?auto_25687 ?auto_25692 ) ) ( not ( = ?auto_25687 ?auto_25720 ) ) ( not ( = ?auto_25688 ?auto_25692 ) ) ( not ( = ?auto_25688 ?auto_25720 ) ) ( not ( = ?auto_25689 ?auto_25692 ) ) ( not ( = ?auto_25689 ?auto_25720 ) ) ( not ( = ?auto_25690 ?auto_25692 ) ) ( not ( = ?auto_25690 ?auto_25720 ) ) ( not ( = ?auto_25692 ?auto_25706 ) ) ( not ( = ?auto_25692 ?auto_25704 ) ) ( not ( = ?auto_25692 ?auto_25711 ) ) ( not ( = ?auto_25692 ?auto_25702 ) ) ( not ( = ?auto_25692 ?auto_25700 ) ) ( not ( = ?auto_25692 ?auto_25724 ) ) ( not ( = ?auto_25692 ?auto_25708 ) ) ( not ( = ?auto_25692 ?auto_25716 ) ) ( not ( = ?auto_25710 ?auto_25713 ) ) ( not ( = ?auto_25710 ?auto_25719 ) ) ( not ( = ?auto_25710 ?auto_25703 ) ) ( not ( = ?auto_25710 ?auto_25718 ) ) ( not ( = ?auto_25710 ?auto_25705 ) ) ( not ( = ?auto_25710 ?auto_25701 ) ) ( not ( = ?auto_25710 ?auto_25714 ) ) ( not ( = ?auto_25707 ?auto_25717 ) ) ( not ( = ?auto_25707 ?auto_25722 ) ) ( not ( = ?auto_25707 ?auto_25715 ) ) ( not ( = ?auto_25707 ?auto_25723 ) ) ( not ( = ?auto_25707 ?auto_25709 ) ) ( not ( = ?auto_25707 ?auto_25712 ) ) ( not ( = ?auto_25707 ?auto_25721 ) ) ( not ( = ?auto_25720 ?auto_25706 ) ) ( not ( = ?auto_25720 ?auto_25704 ) ) ( not ( = ?auto_25720 ?auto_25711 ) ) ( not ( = ?auto_25720 ?auto_25702 ) ) ( not ( = ?auto_25720 ?auto_25700 ) ) ( not ( = ?auto_25720 ?auto_25724 ) ) ( not ( = ?auto_25720 ?auto_25708 ) ) ( not ( = ?auto_25720 ?auto_25716 ) ) ( not ( = ?auto_25683 ?auto_25693 ) ) ( not ( = ?auto_25683 ?auto_25697 ) ) ( not ( = ?auto_25684 ?auto_25693 ) ) ( not ( = ?auto_25684 ?auto_25697 ) ) ( not ( = ?auto_25685 ?auto_25693 ) ) ( not ( = ?auto_25685 ?auto_25697 ) ) ( not ( = ?auto_25686 ?auto_25693 ) ) ( not ( = ?auto_25686 ?auto_25697 ) ) ( not ( = ?auto_25687 ?auto_25693 ) ) ( not ( = ?auto_25687 ?auto_25697 ) ) ( not ( = ?auto_25688 ?auto_25693 ) ) ( not ( = ?auto_25688 ?auto_25697 ) ) ( not ( = ?auto_25689 ?auto_25693 ) ) ( not ( = ?auto_25689 ?auto_25697 ) ) ( not ( = ?auto_25690 ?auto_25693 ) ) ( not ( = ?auto_25690 ?auto_25697 ) ) ( not ( = ?auto_25691 ?auto_25693 ) ) ( not ( = ?auto_25691 ?auto_25697 ) ) ( not ( = ?auto_25693 ?auto_25720 ) ) ( not ( = ?auto_25693 ?auto_25706 ) ) ( not ( = ?auto_25693 ?auto_25704 ) ) ( not ( = ?auto_25693 ?auto_25711 ) ) ( not ( = ?auto_25693 ?auto_25702 ) ) ( not ( = ?auto_25693 ?auto_25700 ) ) ( not ( = ?auto_25693 ?auto_25724 ) ) ( not ( = ?auto_25693 ?auto_25708 ) ) ( not ( = ?auto_25693 ?auto_25716 ) ) ( not ( = ?auto_25694 ?auto_25710 ) ) ( not ( = ?auto_25694 ?auto_25713 ) ) ( not ( = ?auto_25694 ?auto_25719 ) ) ( not ( = ?auto_25694 ?auto_25703 ) ) ( not ( = ?auto_25694 ?auto_25718 ) ) ( not ( = ?auto_25694 ?auto_25705 ) ) ( not ( = ?auto_25694 ?auto_25701 ) ) ( not ( = ?auto_25694 ?auto_25714 ) ) ( not ( = ?auto_25699 ?auto_25707 ) ) ( not ( = ?auto_25699 ?auto_25717 ) ) ( not ( = ?auto_25699 ?auto_25722 ) ) ( not ( = ?auto_25699 ?auto_25715 ) ) ( not ( = ?auto_25699 ?auto_25723 ) ) ( not ( = ?auto_25699 ?auto_25709 ) ) ( not ( = ?auto_25699 ?auto_25712 ) ) ( not ( = ?auto_25699 ?auto_25721 ) ) ( not ( = ?auto_25697 ?auto_25720 ) ) ( not ( = ?auto_25697 ?auto_25706 ) ) ( not ( = ?auto_25697 ?auto_25704 ) ) ( not ( = ?auto_25697 ?auto_25711 ) ) ( not ( = ?auto_25697 ?auto_25702 ) ) ( not ( = ?auto_25697 ?auto_25700 ) ) ( not ( = ?auto_25697 ?auto_25724 ) ) ( not ( = ?auto_25697 ?auto_25708 ) ) ( not ( = ?auto_25697 ?auto_25716 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_25683 ?auto_25684 ?auto_25685 ?auto_25686 ?auto_25687 ?auto_25688 ?auto_25689 ?auto_25690 ?auto_25691 ?auto_25692 )
      ( MAKE-1CRATE ?auto_25692 ?auto_25693 )
      ( MAKE-10CRATE-VERIFY ?auto_25683 ?auto_25684 ?auto_25685 ?auto_25686 ?auto_25687 ?auto_25688 ?auto_25689 ?auto_25690 ?auto_25691 ?auto_25692 ?auto_25693 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_25747 - SURFACE
      ?auto_25748 - SURFACE
      ?auto_25749 - SURFACE
      ?auto_25750 - SURFACE
      ?auto_25751 - SURFACE
      ?auto_25752 - SURFACE
      ?auto_25753 - SURFACE
      ?auto_25754 - SURFACE
      ?auto_25755 - SURFACE
      ?auto_25756 - SURFACE
      ?auto_25757 - SURFACE
      ?auto_25758 - SURFACE
    )
    :vars
    (
      ?auto_25763 - HOIST
      ?auto_25760 - PLACE
      ?auto_25762 - PLACE
      ?auto_25764 - HOIST
      ?auto_25761 - SURFACE
      ?auto_25778 - PLACE
      ?auto_25772 - HOIST
      ?auto_25771 - SURFACE
      ?auto_25781 - PLACE
      ?auto_25792 - HOIST
      ?auto_25765 - SURFACE
      ?auto_25782 - PLACE
      ?auto_25775 - HOIST
      ?auto_25770 - SURFACE
      ?auto_25766 - PLACE
      ?auto_25773 - HOIST
      ?auto_25776 - SURFACE
      ?auto_25783 - PLACE
      ?auto_25788 - HOIST
      ?auto_25777 - SURFACE
      ?auto_25785 - PLACE
      ?auto_25779 - HOIST
      ?auto_25786 - SURFACE
      ?auto_25789 - PLACE
      ?auto_25768 - HOIST
      ?auto_25790 - SURFACE
      ?auto_25774 - PLACE
      ?auto_25780 - HOIST
      ?auto_25767 - SURFACE
      ?auto_25787 - PLACE
      ?auto_25791 - HOIST
      ?auto_25769 - SURFACE
      ?auto_25784 - SURFACE
      ?auto_25759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25763 ?auto_25760 ) ( IS-CRATE ?auto_25758 ) ( not ( = ?auto_25762 ?auto_25760 ) ) ( HOIST-AT ?auto_25764 ?auto_25762 ) ( AVAILABLE ?auto_25764 ) ( SURFACE-AT ?auto_25758 ?auto_25762 ) ( ON ?auto_25758 ?auto_25761 ) ( CLEAR ?auto_25758 ) ( not ( = ?auto_25757 ?auto_25758 ) ) ( not ( = ?auto_25757 ?auto_25761 ) ) ( not ( = ?auto_25758 ?auto_25761 ) ) ( not ( = ?auto_25763 ?auto_25764 ) ) ( IS-CRATE ?auto_25757 ) ( not ( = ?auto_25778 ?auto_25760 ) ) ( HOIST-AT ?auto_25772 ?auto_25778 ) ( AVAILABLE ?auto_25772 ) ( SURFACE-AT ?auto_25757 ?auto_25778 ) ( ON ?auto_25757 ?auto_25771 ) ( CLEAR ?auto_25757 ) ( not ( = ?auto_25756 ?auto_25757 ) ) ( not ( = ?auto_25756 ?auto_25771 ) ) ( not ( = ?auto_25757 ?auto_25771 ) ) ( not ( = ?auto_25763 ?auto_25772 ) ) ( IS-CRATE ?auto_25756 ) ( not ( = ?auto_25781 ?auto_25760 ) ) ( HOIST-AT ?auto_25792 ?auto_25781 ) ( AVAILABLE ?auto_25792 ) ( SURFACE-AT ?auto_25756 ?auto_25781 ) ( ON ?auto_25756 ?auto_25765 ) ( CLEAR ?auto_25756 ) ( not ( = ?auto_25755 ?auto_25756 ) ) ( not ( = ?auto_25755 ?auto_25765 ) ) ( not ( = ?auto_25756 ?auto_25765 ) ) ( not ( = ?auto_25763 ?auto_25792 ) ) ( IS-CRATE ?auto_25755 ) ( not ( = ?auto_25782 ?auto_25760 ) ) ( HOIST-AT ?auto_25775 ?auto_25782 ) ( AVAILABLE ?auto_25775 ) ( SURFACE-AT ?auto_25755 ?auto_25782 ) ( ON ?auto_25755 ?auto_25770 ) ( CLEAR ?auto_25755 ) ( not ( = ?auto_25754 ?auto_25755 ) ) ( not ( = ?auto_25754 ?auto_25770 ) ) ( not ( = ?auto_25755 ?auto_25770 ) ) ( not ( = ?auto_25763 ?auto_25775 ) ) ( IS-CRATE ?auto_25754 ) ( not ( = ?auto_25766 ?auto_25760 ) ) ( HOIST-AT ?auto_25773 ?auto_25766 ) ( AVAILABLE ?auto_25773 ) ( SURFACE-AT ?auto_25754 ?auto_25766 ) ( ON ?auto_25754 ?auto_25776 ) ( CLEAR ?auto_25754 ) ( not ( = ?auto_25753 ?auto_25754 ) ) ( not ( = ?auto_25753 ?auto_25776 ) ) ( not ( = ?auto_25754 ?auto_25776 ) ) ( not ( = ?auto_25763 ?auto_25773 ) ) ( IS-CRATE ?auto_25753 ) ( not ( = ?auto_25783 ?auto_25760 ) ) ( HOIST-AT ?auto_25788 ?auto_25783 ) ( AVAILABLE ?auto_25788 ) ( SURFACE-AT ?auto_25753 ?auto_25783 ) ( ON ?auto_25753 ?auto_25777 ) ( CLEAR ?auto_25753 ) ( not ( = ?auto_25752 ?auto_25753 ) ) ( not ( = ?auto_25752 ?auto_25777 ) ) ( not ( = ?auto_25753 ?auto_25777 ) ) ( not ( = ?auto_25763 ?auto_25788 ) ) ( IS-CRATE ?auto_25752 ) ( not ( = ?auto_25785 ?auto_25760 ) ) ( HOIST-AT ?auto_25779 ?auto_25785 ) ( AVAILABLE ?auto_25779 ) ( SURFACE-AT ?auto_25752 ?auto_25785 ) ( ON ?auto_25752 ?auto_25786 ) ( CLEAR ?auto_25752 ) ( not ( = ?auto_25751 ?auto_25752 ) ) ( not ( = ?auto_25751 ?auto_25786 ) ) ( not ( = ?auto_25752 ?auto_25786 ) ) ( not ( = ?auto_25763 ?auto_25779 ) ) ( IS-CRATE ?auto_25751 ) ( not ( = ?auto_25789 ?auto_25760 ) ) ( HOIST-AT ?auto_25768 ?auto_25789 ) ( SURFACE-AT ?auto_25751 ?auto_25789 ) ( ON ?auto_25751 ?auto_25790 ) ( CLEAR ?auto_25751 ) ( not ( = ?auto_25750 ?auto_25751 ) ) ( not ( = ?auto_25750 ?auto_25790 ) ) ( not ( = ?auto_25751 ?auto_25790 ) ) ( not ( = ?auto_25763 ?auto_25768 ) ) ( IS-CRATE ?auto_25750 ) ( not ( = ?auto_25774 ?auto_25760 ) ) ( HOIST-AT ?auto_25780 ?auto_25774 ) ( AVAILABLE ?auto_25780 ) ( SURFACE-AT ?auto_25750 ?auto_25774 ) ( ON ?auto_25750 ?auto_25767 ) ( CLEAR ?auto_25750 ) ( not ( = ?auto_25749 ?auto_25750 ) ) ( not ( = ?auto_25749 ?auto_25767 ) ) ( not ( = ?auto_25750 ?auto_25767 ) ) ( not ( = ?auto_25763 ?auto_25780 ) ) ( IS-CRATE ?auto_25749 ) ( not ( = ?auto_25787 ?auto_25760 ) ) ( HOIST-AT ?auto_25791 ?auto_25787 ) ( AVAILABLE ?auto_25791 ) ( SURFACE-AT ?auto_25749 ?auto_25787 ) ( ON ?auto_25749 ?auto_25769 ) ( CLEAR ?auto_25749 ) ( not ( = ?auto_25748 ?auto_25749 ) ) ( not ( = ?auto_25748 ?auto_25769 ) ) ( not ( = ?auto_25749 ?auto_25769 ) ) ( not ( = ?auto_25763 ?auto_25791 ) ) ( SURFACE-AT ?auto_25747 ?auto_25760 ) ( CLEAR ?auto_25747 ) ( IS-CRATE ?auto_25748 ) ( AVAILABLE ?auto_25763 ) ( AVAILABLE ?auto_25768 ) ( SURFACE-AT ?auto_25748 ?auto_25789 ) ( ON ?auto_25748 ?auto_25784 ) ( CLEAR ?auto_25748 ) ( TRUCK-AT ?auto_25759 ?auto_25760 ) ( not ( = ?auto_25747 ?auto_25748 ) ) ( not ( = ?auto_25747 ?auto_25784 ) ) ( not ( = ?auto_25748 ?auto_25784 ) ) ( not ( = ?auto_25747 ?auto_25749 ) ) ( not ( = ?auto_25747 ?auto_25769 ) ) ( not ( = ?auto_25749 ?auto_25784 ) ) ( not ( = ?auto_25787 ?auto_25789 ) ) ( not ( = ?auto_25791 ?auto_25768 ) ) ( not ( = ?auto_25769 ?auto_25784 ) ) ( not ( = ?auto_25747 ?auto_25750 ) ) ( not ( = ?auto_25747 ?auto_25767 ) ) ( not ( = ?auto_25748 ?auto_25750 ) ) ( not ( = ?auto_25748 ?auto_25767 ) ) ( not ( = ?auto_25750 ?auto_25769 ) ) ( not ( = ?auto_25750 ?auto_25784 ) ) ( not ( = ?auto_25774 ?auto_25787 ) ) ( not ( = ?auto_25774 ?auto_25789 ) ) ( not ( = ?auto_25780 ?auto_25791 ) ) ( not ( = ?auto_25780 ?auto_25768 ) ) ( not ( = ?auto_25767 ?auto_25769 ) ) ( not ( = ?auto_25767 ?auto_25784 ) ) ( not ( = ?auto_25747 ?auto_25751 ) ) ( not ( = ?auto_25747 ?auto_25790 ) ) ( not ( = ?auto_25748 ?auto_25751 ) ) ( not ( = ?auto_25748 ?auto_25790 ) ) ( not ( = ?auto_25749 ?auto_25751 ) ) ( not ( = ?auto_25749 ?auto_25790 ) ) ( not ( = ?auto_25751 ?auto_25767 ) ) ( not ( = ?auto_25751 ?auto_25769 ) ) ( not ( = ?auto_25751 ?auto_25784 ) ) ( not ( = ?auto_25790 ?auto_25767 ) ) ( not ( = ?auto_25790 ?auto_25769 ) ) ( not ( = ?auto_25790 ?auto_25784 ) ) ( not ( = ?auto_25747 ?auto_25752 ) ) ( not ( = ?auto_25747 ?auto_25786 ) ) ( not ( = ?auto_25748 ?auto_25752 ) ) ( not ( = ?auto_25748 ?auto_25786 ) ) ( not ( = ?auto_25749 ?auto_25752 ) ) ( not ( = ?auto_25749 ?auto_25786 ) ) ( not ( = ?auto_25750 ?auto_25752 ) ) ( not ( = ?auto_25750 ?auto_25786 ) ) ( not ( = ?auto_25752 ?auto_25790 ) ) ( not ( = ?auto_25752 ?auto_25767 ) ) ( not ( = ?auto_25752 ?auto_25769 ) ) ( not ( = ?auto_25752 ?auto_25784 ) ) ( not ( = ?auto_25785 ?auto_25789 ) ) ( not ( = ?auto_25785 ?auto_25774 ) ) ( not ( = ?auto_25785 ?auto_25787 ) ) ( not ( = ?auto_25779 ?auto_25768 ) ) ( not ( = ?auto_25779 ?auto_25780 ) ) ( not ( = ?auto_25779 ?auto_25791 ) ) ( not ( = ?auto_25786 ?auto_25790 ) ) ( not ( = ?auto_25786 ?auto_25767 ) ) ( not ( = ?auto_25786 ?auto_25769 ) ) ( not ( = ?auto_25786 ?auto_25784 ) ) ( not ( = ?auto_25747 ?auto_25753 ) ) ( not ( = ?auto_25747 ?auto_25777 ) ) ( not ( = ?auto_25748 ?auto_25753 ) ) ( not ( = ?auto_25748 ?auto_25777 ) ) ( not ( = ?auto_25749 ?auto_25753 ) ) ( not ( = ?auto_25749 ?auto_25777 ) ) ( not ( = ?auto_25750 ?auto_25753 ) ) ( not ( = ?auto_25750 ?auto_25777 ) ) ( not ( = ?auto_25751 ?auto_25753 ) ) ( not ( = ?auto_25751 ?auto_25777 ) ) ( not ( = ?auto_25753 ?auto_25786 ) ) ( not ( = ?auto_25753 ?auto_25790 ) ) ( not ( = ?auto_25753 ?auto_25767 ) ) ( not ( = ?auto_25753 ?auto_25769 ) ) ( not ( = ?auto_25753 ?auto_25784 ) ) ( not ( = ?auto_25783 ?auto_25785 ) ) ( not ( = ?auto_25783 ?auto_25789 ) ) ( not ( = ?auto_25783 ?auto_25774 ) ) ( not ( = ?auto_25783 ?auto_25787 ) ) ( not ( = ?auto_25788 ?auto_25779 ) ) ( not ( = ?auto_25788 ?auto_25768 ) ) ( not ( = ?auto_25788 ?auto_25780 ) ) ( not ( = ?auto_25788 ?auto_25791 ) ) ( not ( = ?auto_25777 ?auto_25786 ) ) ( not ( = ?auto_25777 ?auto_25790 ) ) ( not ( = ?auto_25777 ?auto_25767 ) ) ( not ( = ?auto_25777 ?auto_25769 ) ) ( not ( = ?auto_25777 ?auto_25784 ) ) ( not ( = ?auto_25747 ?auto_25754 ) ) ( not ( = ?auto_25747 ?auto_25776 ) ) ( not ( = ?auto_25748 ?auto_25754 ) ) ( not ( = ?auto_25748 ?auto_25776 ) ) ( not ( = ?auto_25749 ?auto_25754 ) ) ( not ( = ?auto_25749 ?auto_25776 ) ) ( not ( = ?auto_25750 ?auto_25754 ) ) ( not ( = ?auto_25750 ?auto_25776 ) ) ( not ( = ?auto_25751 ?auto_25754 ) ) ( not ( = ?auto_25751 ?auto_25776 ) ) ( not ( = ?auto_25752 ?auto_25754 ) ) ( not ( = ?auto_25752 ?auto_25776 ) ) ( not ( = ?auto_25754 ?auto_25777 ) ) ( not ( = ?auto_25754 ?auto_25786 ) ) ( not ( = ?auto_25754 ?auto_25790 ) ) ( not ( = ?auto_25754 ?auto_25767 ) ) ( not ( = ?auto_25754 ?auto_25769 ) ) ( not ( = ?auto_25754 ?auto_25784 ) ) ( not ( = ?auto_25766 ?auto_25783 ) ) ( not ( = ?auto_25766 ?auto_25785 ) ) ( not ( = ?auto_25766 ?auto_25789 ) ) ( not ( = ?auto_25766 ?auto_25774 ) ) ( not ( = ?auto_25766 ?auto_25787 ) ) ( not ( = ?auto_25773 ?auto_25788 ) ) ( not ( = ?auto_25773 ?auto_25779 ) ) ( not ( = ?auto_25773 ?auto_25768 ) ) ( not ( = ?auto_25773 ?auto_25780 ) ) ( not ( = ?auto_25773 ?auto_25791 ) ) ( not ( = ?auto_25776 ?auto_25777 ) ) ( not ( = ?auto_25776 ?auto_25786 ) ) ( not ( = ?auto_25776 ?auto_25790 ) ) ( not ( = ?auto_25776 ?auto_25767 ) ) ( not ( = ?auto_25776 ?auto_25769 ) ) ( not ( = ?auto_25776 ?auto_25784 ) ) ( not ( = ?auto_25747 ?auto_25755 ) ) ( not ( = ?auto_25747 ?auto_25770 ) ) ( not ( = ?auto_25748 ?auto_25755 ) ) ( not ( = ?auto_25748 ?auto_25770 ) ) ( not ( = ?auto_25749 ?auto_25755 ) ) ( not ( = ?auto_25749 ?auto_25770 ) ) ( not ( = ?auto_25750 ?auto_25755 ) ) ( not ( = ?auto_25750 ?auto_25770 ) ) ( not ( = ?auto_25751 ?auto_25755 ) ) ( not ( = ?auto_25751 ?auto_25770 ) ) ( not ( = ?auto_25752 ?auto_25755 ) ) ( not ( = ?auto_25752 ?auto_25770 ) ) ( not ( = ?auto_25753 ?auto_25755 ) ) ( not ( = ?auto_25753 ?auto_25770 ) ) ( not ( = ?auto_25755 ?auto_25776 ) ) ( not ( = ?auto_25755 ?auto_25777 ) ) ( not ( = ?auto_25755 ?auto_25786 ) ) ( not ( = ?auto_25755 ?auto_25790 ) ) ( not ( = ?auto_25755 ?auto_25767 ) ) ( not ( = ?auto_25755 ?auto_25769 ) ) ( not ( = ?auto_25755 ?auto_25784 ) ) ( not ( = ?auto_25782 ?auto_25766 ) ) ( not ( = ?auto_25782 ?auto_25783 ) ) ( not ( = ?auto_25782 ?auto_25785 ) ) ( not ( = ?auto_25782 ?auto_25789 ) ) ( not ( = ?auto_25782 ?auto_25774 ) ) ( not ( = ?auto_25782 ?auto_25787 ) ) ( not ( = ?auto_25775 ?auto_25773 ) ) ( not ( = ?auto_25775 ?auto_25788 ) ) ( not ( = ?auto_25775 ?auto_25779 ) ) ( not ( = ?auto_25775 ?auto_25768 ) ) ( not ( = ?auto_25775 ?auto_25780 ) ) ( not ( = ?auto_25775 ?auto_25791 ) ) ( not ( = ?auto_25770 ?auto_25776 ) ) ( not ( = ?auto_25770 ?auto_25777 ) ) ( not ( = ?auto_25770 ?auto_25786 ) ) ( not ( = ?auto_25770 ?auto_25790 ) ) ( not ( = ?auto_25770 ?auto_25767 ) ) ( not ( = ?auto_25770 ?auto_25769 ) ) ( not ( = ?auto_25770 ?auto_25784 ) ) ( not ( = ?auto_25747 ?auto_25756 ) ) ( not ( = ?auto_25747 ?auto_25765 ) ) ( not ( = ?auto_25748 ?auto_25756 ) ) ( not ( = ?auto_25748 ?auto_25765 ) ) ( not ( = ?auto_25749 ?auto_25756 ) ) ( not ( = ?auto_25749 ?auto_25765 ) ) ( not ( = ?auto_25750 ?auto_25756 ) ) ( not ( = ?auto_25750 ?auto_25765 ) ) ( not ( = ?auto_25751 ?auto_25756 ) ) ( not ( = ?auto_25751 ?auto_25765 ) ) ( not ( = ?auto_25752 ?auto_25756 ) ) ( not ( = ?auto_25752 ?auto_25765 ) ) ( not ( = ?auto_25753 ?auto_25756 ) ) ( not ( = ?auto_25753 ?auto_25765 ) ) ( not ( = ?auto_25754 ?auto_25756 ) ) ( not ( = ?auto_25754 ?auto_25765 ) ) ( not ( = ?auto_25756 ?auto_25770 ) ) ( not ( = ?auto_25756 ?auto_25776 ) ) ( not ( = ?auto_25756 ?auto_25777 ) ) ( not ( = ?auto_25756 ?auto_25786 ) ) ( not ( = ?auto_25756 ?auto_25790 ) ) ( not ( = ?auto_25756 ?auto_25767 ) ) ( not ( = ?auto_25756 ?auto_25769 ) ) ( not ( = ?auto_25756 ?auto_25784 ) ) ( not ( = ?auto_25781 ?auto_25782 ) ) ( not ( = ?auto_25781 ?auto_25766 ) ) ( not ( = ?auto_25781 ?auto_25783 ) ) ( not ( = ?auto_25781 ?auto_25785 ) ) ( not ( = ?auto_25781 ?auto_25789 ) ) ( not ( = ?auto_25781 ?auto_25774 ) ) ( not ( = ?auto_25781 ?auto_25787 ) ) ( not ( = ?auto_25792 ?auto_25775 ) ) ( not ( = ?auto_25792 ?auto_25773 ) ) ( not ( = ?auto_25792 ?auto_25788 ) ) ( not ( = ?auto_25792 ?auto_25779 ) ) ( not ( = ?auto_25792 ?auto_25768 ) ) ( not ( = ?auto_25792 ?auto_25780 ) ) ( not ( = ?auto_25792 ?auto_25791 ) ) ( not ( = ?auto_25765 ?auto_25770 ) ) ( not ( = ?auto_25765 ?auto_25776 ) ) ( not ( = ?auto_25765 ?auto_25777 ) ) ( not ( = ?auto_25765 ?auto_25786 ) ) ( not ( = ?auto_25765 ?auto_25790 ) ) ( not ( = ?auto_25765 ?auto_25767 ) ) ( not ( = ?auto_25765 ?auto_25769 ) ) ( not ( = ?auto_25765 ?auto_25784 ) ) ( not ( = ?auto_25747 ?auto_25757 ) ) ( not ( = ?auto_25747 ?auto_25771 ) ) ( not ( = ?auto_25748 ?auto_25757 ) ) ( not ( = ?auto_25748 ?auto_25771 ) ) ( not ( = ?auto_25749 ?auto_25757 ) ) ( not ( = ?auto_25749 ?auto_25771 ) ) ( not ( = ?auto_25750 ?auto_25757 ) ) ( not ( = ?auto_25750 ?auto_25771 ) ) ( not ( = ?auto_25751 ?auto_25757 ) ) ( not ( = ?auto_25751 ?auto_25771 ) ) ( not ( = ?auto_25752 ?auto_25757 ) ) ( not ( = ?auto_25752 ?auto_25771 ) ) ( not ( = ?auto_25753 ?auto_25757 ) ) ( not ( = ?auto_25753 ?auto_25771 ) ) ( not ( = ?auto_25754 ?auto_25757 ) ) ( not ( = ?auto_25754 ?auto_25771 ) ) ( not ( = ?auto_25755 ?auto_25757 ) ) ( not ( = ?auto_25755 ?auto_25771 ) ) ( not ( = ?auto_25757 ?auto_25765 ) ) ( not ( = ?auto_25757 ?auto_25770 ) ) ( not ( = ?auto_25757 ?auto_25776 ) ) ( not ( = ?auto_25757 ?auto_25777 ) ) ( not ( = ?auto_25757 ?auto_25786 ) ) ( not ( = ?auto_25757 ?auto_25790 ) ) ( not ( = ?auto_25757 ?auto_25767 ) ) ( not ( = ?auto_25757 ?auto_25769 ) ) ( not ( = ?auto_25757 ?auto_25784 ) ) ( not ( = ?auto_25778 ?auto_25781 ) ) ( not ( = ?auto_25778 ?auto_25782 ) ) ( not ( = ?auto_25778 ?auto_25766 ) ) ( not ( = ?auto_25778 ?auto_25783 ) ) ( not ( = ?auto_25778 ?auto_25785 ) ) ( not ( = ?auto_25778 ?auto_25789 ) ) ( not ( = ?auto_25778 ?auto_25774 ) ) ( not ( = ?auto_25778 ?auto_25787 ) ) ( not ( = ?auto_25772 ?auto_25792 ) ) ( not ( = ?auto_25772 ?auto_25775 ) ) ( not ( = ?auto_25772 ?auto_25773 ) ) ( not ( = ?auto_25772 ?auto_25788 ) ) ( not ( = ?auto_25772 ?auto_25779 ) ) ( not ( = ?auto_25772 ?auto_25768 ) ) ( not ( = ?auto_25772 ?auto_25780 ) ) ( not ( = ?auto_25772 ?auto_25791 ) ) ( not ( = ?auto_25771 ?auto_25765 ) ) ( not ( = ?auto_25771 ?auto_25770 ) ) ( not ( = ?auto_25771 ?auto_25776 ) ) ( not ( = ?auto_25771 ?auto_25777 ) ) ( not ( = ?auto_25771 ?auto_25786 ) ) ( not ( = ?auto_25771 ?auto_25790 ) ) ( not ( = ?auto_25771 ?auto_25767 ) ) ( not ( = ?auto_25771 ?auto_25769 ) ) ( not ( = ?auto_25771 ?auto_25784 ) ) ( not ( = ?auto_25747 ?auto_25758 ) ) ( not ( = ?auto_25747 ?auto_25761 ) ) ( not ( = ?auto_25748 ?auto_25758 ) ) ( not ( = ?auto_25748 ?auto_25761 ) ) ( not ( = ?auto_25749 ?auto_25758 ) ) ( not ( = ?auto_25749 ?auto_25761 ) ) ( not ( = ?auto_25750 ?auto_25758 ) ) ( not ( = ?auto_25750 ?auto_25761 ) ) ( not ( = ?auto_25751 ?auto_25758 ) ) ( not ( = ?auto_25751 ?auto_25761 ) ) ( not ( = ?auto_25752 ?auto_25758 ) ) ( not ( = ?auto_25752 ?auto_25761 ) ) ( not ( = ?auto_25753 ?auto_25758 ) ) ( not ( = ?auto_25753 ?auto_25761 ) ) ( not ( = ?auto_25754 ?auto_25758 ) ) ( not ( = ?auto_25754 ?auto_25761 ) ) ( not ( = ?auto_25755 ?auto_25758 ) ) ( not ( = ?auto_25755 ?auto_25761 ) ) ( not ( = ?auto_25756 ?auto_25758 ) ) ( not ( = ?auto_25756 ?auto_25761 ) ) ( not ( = ?auto_25758 ?auto_25771 ) ) ( not ( = ?auto_25758 ?auto_25765 ) ) ( not ( = ?auto_25758 ?auto_25770 ) ) ( not ( = ?auto_25758 ?auto_25776 ) ) ( not ( = ?auto_25758 ?auto_25777 ) ) ( not ( = ?auto_25758 ?auto_25786 ) ) ( not ( = ?auto_25758 ?auto_25790 ) ) ( not ( = ?auto_25758 ?auto_25767 ) ) ( not ( = ?auto_25758 ?auto_25769 ) ) ( not ( = ?auto_25758 ?auto_25784 ) ) ( not ( = ?auto_25762 ?auto_25778 ) ) ( not ( = ?auto_25762 ?auto_25781 ) ) ( not ( = ?auto_25762 ?auto_25782 ) ) ( not ( = ?auto_25762 ?auto_25766 ) ) ( not ( = ?auto_25762 ?auto_25783 ) ) ( not ( = ?auto_25762 ?auto_25785 ) ) ( not ( = ?auto_25762 ?auto_25789 ) ) ( not ( = ?auto_25762 ?auto_25774 ) ) ( not ( = ?auto_25762 ?auto_25787 ) ) ( not ( = ?auto_25764 ?auto_25772 ) ) ( not ( = ?auto_25764 ?auto_25792 ) ) ( not ( = ?auto_25764 ?auto_25775 ) ) ( not ( = ?auto_25764 ?auto_25773 ) ) ( not ( = ?auto_25764 ?auto_25788 ) ) ( not ( = ?auto_25764 ?auto_25779 ) ) ( not ( = ?auto_25764 ?auto_25768 ) ) ( not ( = ?auto_25764 ?auto_25780 ) ) ( not ( = ?auto_25764 ?auto_25791 ) ) ( not ( = ?auto_25761 ?auto_25771 ) ) ( not ( = ?auto_25761 ?auto_25765 ) ) ( not ( = ?auto_25761 ?auto_25770 ) ) ( not ( = ?auto_25761 ?auto_25776 ) ) ( not ( = ?auto_25761 ?auto_25777 ) ) ( not ( = ?auto_25761 ?auto_25786 ) ) ( not ( = ?auto_25761 ?auto_25790 ) ) ( not ( = ?auto_25761 ?auto_25767 ) ) ( not ( = ?auto_25761 ?auto_25769 ) ) ( not ( = ?auto_25761 ?auto_25784 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_25747 ?auto_25748 ?auto_25749 ?auto_25750 ?auto_25751 ?auto_25752 ?auto_25753 ?auto_25754 ?auto_25755 ?auto_25756 ?auto_25757 )
      ( MAKE-1CRATE ?auto_25757 ?auto_25758 )
      ( MAKE-11CRATE-VERIFY ?auto_25747 ?auto_25748 ?auto_25749 ?auto_25750 ?auto_25751 ?auto_25752 ?auto_25753 ?auto_25754 ?auto_25755 ?auto_25756 ?auto_25757 ?auto_25758 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_25816 - SURFACE
      ?auto_25817 - SURFACE
      ?auto_25818 - SURFACE
      ?auto_25819 - SURFACE
      ?auto_25820 - SURFACE
      ?auto_25821 - SURFACE
      ?auto_25822 - SURFACE
      ?auto_25823 - SURFACE
      ?auto_25824 - SURFACE
      ?auto_25825 - SURFACE
      ?auto_25826 - SURFACE
      ?auto_25827 - SURFACE
      ?auto_25828 - SURFACE
    )
    :vars
    (
      ?auto_25833 - HOIST
      ?auto_25834 - PLACE
      ?auto_25831 - PLACE
      ?auto_25832 - HOIST
      ?auto_25829 - SURFACE
      ?auto_25863 - PLACE
      ?auto_25856 - HOIST
      ?auto_25855 - SURFACE
      ?auto_25842 - SURFACE
      ?auto_25861 - PLACE
      ?auto_25853 - HOIST
      ?auto_25835 - SURFACE
      ?auto_25843 - PLACE
      ?auto_25847 - HOIST
      ?auto_25854 - SURFACE
      ?auto_25857 - PLACE
      ?auto_25848 - HOIST
      ?auto_25836 - SURFACE
      ?auto_25850 - PLACE
      ?auto_25840 - HOIST
      ?auto_25841 - SURFACE
      ?auto_25838 - PLACE
      ?auto_25858 - HOIST
      ?auto_25862 - SURFACE
      ?auto_25860 - PLACE
      ?auto_25851 - HOIST
      ?auto_25844 - SURFACE
      ?auto_25846 - PLACE
      ?auto_25845 - HOIST
      ?auto_25859 - SURFACE
      ?auto_25852 - PLACE
      ?auto_25849 - HOIST
      ?auto_25837 - SURFACE
      ?auto_25839 - SURFACE
      ?auto_25830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25833 ?auto_25834 ) ( IS-CRATE ?auto_25828 ) ( not ( = ?auto_25831 ?auto_25834 ) ) ( HOIST-AT ?auto_25832 ?auto_25831 ) ( SURFACE-AT ?auto_25828 ?auto_25831 ) ( ON ?auto_25828 ?auto_25829 ) ( CLEAR ?auto_25828 ) ( not ( = ?auto_25827 ?auto_25828 ) ) ( not ( = ?auto_25827 ?auto_25829 ) ) ( not ( = ?auto_25828 ?auto_25829 ) ) ( not ( = ?auto_25833 ?auto_25832 ) ) ( IS-CRATE ?auto_25827 ) ( not ( = ?auto_25863 ?auto_25834 ) ) ( HOIST-AT ?auto_25856 ?auto_25863 ) ( AVAILABLE ?auto_25856 ) ( SURFACE-AT ?auto_25827 ?auto_25863 ) ( ON ?auto_25827 ?auto_25855 ) ( CLEAR ?auto_25827 ) ( not ( = ?auto_25826 ?auto_25827 ) ) ( not ( = ?auto_25826 ?auto_25855 ) ) ( not ( = ?auto_25827 ?auto_25855 ) ) ( not ( = ?auto_25833 ?auto_25856 ) ) ( IS-CRATE ?auto_25826 ) ( AVAILABLE ?auto_25832 ) ( SURFACE-AT ?auto_25826 ?auto_25831 ) ( ON ?auto_25826 ?auto_25842 ) ( CLEAR ?auto_25826 ) ( not ( = ?auto_25825 ?auto_25826 ) ) ( not ( = ?auto_25825 ?auto_25842 ) ) ( not ( = ?auto_25826 ?auto_25842 ) ) ( IS-CRATE ?auto_25825 ) ( not ( = ?auto_25861 ?auto_25834 ) ) ( HOIST-AT ?auto_25853 ?auto_25861 ) ( AVAILABLE ?auto_25853 ) ( SURFACE-AT ?auto_25825 ?auto_25861 ) ( ON ?auto_25825 ?auto_25835 ) ( CLEAR ?auto_25825 ) ( not ( = ?auto_25824 ?auto_25825 ) ) ( not ( = ?auto_25824 ?auto_25835 ) ) ( not ( = ?auto_25825 ?auto_25835 ) ) ( not ( = ?auto_25833 ?auto_25853 ) ) ( IS-CRATE ?auto_25824 ) ( not ( = ?auto_25843 ?auto_25834 ) ) ( HOIST-AT ?auto_25847 ?auto_25843 ) ( AVAILABLE ?auto_25847 ) ( SURFACE-AT ?auto_25824 ?auto_25843 ) ( ON ?auto_25824 ?auto_25854 ) ( CLEAR ?auto_25824 ) ( not ( = ?auto_25823 ?auto_25824 ) ) ( not ( = ?auto_25823 ?auto_25854 ) ) ( not ( = ?auto_25824 ?auto_25854 ) ) ( not ( = ?auto_25833 ?auto_25847 ) ) ( IS-CRATE ?auto_25823 ) ( not ( = ?auto_25857 ?auto_25834 ) ) ( HOIST-AT ?auto_25848 ?auto_25857 ) ( AVAILABLE ?auto_25848 ) ( SURFACE-AT ?auto_25823 ?auto_25857 ) ( ON ?auto_25823 ?auto_25836 ) ( CLEAR ?auto_25823 ) ( not ( = ?auto_25822 ?auto_25823 ) ) ( not ( = ?auto_25822 ?auto_25836 ) ) ( not ( = ?auto_25823 ?auto_25836 ) ) ( not ( = ?auto_25833 ?auto_25848 ) ) ( IS-CRATE ?auto_25822 ) ( not ( = ?auto_25850 ?auto_25834 ) ) ( HOIST-AT ?auto_25840 ?auto_25850 ) ( AVAILABLE ?auto_25840 ) ( SURFACE-AT ?auto_25822 ?auto_25850 ) ( ON ?auto_25822 ?auto_25841 ) ( CLEAR ?auto_25822 ) ( not ( = ?auto_25821 ?auto_25822 ) ) ( not ( = ?auto_25821 ?auto_25841 ) ) ( not ( = ?auto_25822 ?auto_25841 ) ) ( not ( = ?auto_25833 ?auto_25840 ) ) ( IS-CRATE ?auto_25821 ) ( not ( = ?auto_25838 ?auto_25834 ) ) ( HOIST-AT ?auto_25858 ?auto_25838 ) ( AVAILABLE ?auto_25858 ) ( SURFACE-AT ?auto_25821 ?auto_25838 ) ( ON ?auto_25821 ?auto_25862 ) ( CLEAR ?auto_25821 ) ( not ( = ?auto_25820 ?auto_25821 ) ) ( not ( = ?auto_25820 ?auto_25862 ) ) ( not ( = ?auto_25821 ?auto_25862 ) ) ( not ( = ?auto_25833 ?auto_25858 ) ) ( IS-CRATE ?auto_25820 ) ( not ( = ?auto_25860 ?auto_25834 ) ) ( HOIST-AT ?auto_25851 ?auto_25860 ) ( SURFACE-AT ?auto_25820 ?auto_25860 ) ( ON ?auto_25820 ?auto_25844 ) ( CLEAR ?auto_25820 ) ( not ( = ?auto_25819 ?auto_25820 ) ) ( not ( = ?auto_25819 ?auto_25844 ) ) ( not ( = ?auto_25820 ?auto_25844 ) ) ( not ( = ?auto_25833 ?auto_25851 ) ) ( IS-CRATE ?auto_25819 ) ( not ( = ?auto_25846 ?auto_25834 ) ) ( HOIST-AT ?auto_25845 ?auto_25846 ) ( AVAILABLE ?auto_25845 ) ( SURFACE-AT ?auto_25819 ?auto_25846 ) ( ON ?auto_25819 ?auto_25859 ) ( CLEAR ?auto_25819 ) ( not ( = ?auto_25818 ?auto_25819 ) ) ( not ( = ?auto_25818 ?auto_25859 ) ) ( not ( = ?auto_25819 ?auto_25859 ) ) ( not ( = ?auto_25833 ?auto_25845 ) ) ( IS-CRATE ?auto_25818 ) ( not ( = ?auto_25852 ?auto_25834 ) ) ( HOIST-AT ?auto_25849 ?auto_25852 ) ( AVAILABLE ?auto_25849 ) ( SURFACE-AT ?auto_25818 ?auto_25852 ) ( ON ?auto_25818 ?auto_25837 ) ( CLEAR ?auto_25818 ) ( not ( = ?auto_25817 ?auto_25818 ) ) ( not ( = ?auto_25817 ?auto_25837 ) ) ( not ( = ?auto_25818 ?auto_25837 ) ) ( not ( = ?auto_25833 ?auto_25849 ) ) ( SURFACE-AT ?auto_25816 ?auto_25834 ) ( CLEAR ?auto_25816 ) ( IS-CRATE ?auto_25817 ) ( AVAILABLE ?auto_25833 ) ( AVAILABLE ?auto_25851 ) ( SURFACE-AT ?auto_25817 ?auto_25860 ) ( ON ?auto_25817 ?auto_25839 ) ( CLEAR ?auto_25817 ) ( TRUCK-AT ?auto_25830 ?auto_25834 ) ( not ( = ?auto_25816 ?auto_25817 ) ) ( not ( = ?auto_25816 ?auto_25839 ) ) ( not ( = ?auto_25817 ?auto_25839 ) ) ( not ( = ?auto_25816 ?auto_25818 ) ) ( not ( = ?auto_25816 ?auto_25837 ) ) ( not ( = ?auto_25818 ?auto_25839 ) ) ( not ( = ?auto_25852 ?auto_25860 ) ) ( not ( = ?auto_25849 ?auto_25851 ) ) ( not ( = ?auto_25837 ?auto_25839 ) ) ( not ( = ?auto_25816 ?auto_25819 ) ) ( not ( = ?auto_25816 ?auto_25859 ) ) ( not ( = ?auto_25817 ?auto_25819 ) ) ( not ( = ?auto_25817 ?auto_25859 ) ) ( not ( = ?auto_25819 ?auto_25837 ) ) ( not ( = ?auto_25819 ?auto_25839 ) ) ( not ( = ?auto_25846 ?auto_25852 ) ) ( not ( = ?auto_25846 ?auto_25860 ) ) ( not ( = ?auto_25845 ?auto_25849 ) ) ( not ( = ?auto_25845 ?auto_25851 ) ) ( not ( = ?auto_25859 ?auto_25837 ) ) ( not ( = ?auto_25859 ?auto_25839 ) ) ( not ( = ?auto_25816 ?auto_25820 ) ) ( not ( = ?auto_25816 ?auto_25844 ) ) ( not ( = ?auto_25817 ?auto_25820 ) ) ( not ( = ?auto_25817 ?auto_25844 ) ) ( not ( = ?auto_25818 ?auto_25820 ) ) ( not ( = ?auto_25818 ?auto_25844 ) ) ( not ( = ?auto_25820 ?auto_25859 ) ) ( not ( = ?auto_25820 ?auto_25837 ) ) ( not ( = ?auto_25820 ?auto_25839 ) ) ( not ( = ?auto_25844 ?auto_25859 ) ) ( not ( = ?auto_25844 ?auto_25837 ) ) ( not ( = ?auto_25844 ?auto_25839 ) ) ( not ( = ?auto_25816 ?auto_25821 ) ) ( not ( = ?auto_25816 ?auto_25862 ) ) ( not ( = ?auto_25817 ?auto_25821 ) ) ( not ( = ?auto_25817 ?auto_25862 ) ) ( not ( = ?auto_25818 ?auto_25821 ) ) ( not ( = ?auto_25818 ?auto_25862 ) ) ( not ( = ?auto_25819 ?auto_25821 ) ) ( not ( = ?auto_25819 ?auto_25862 ) ) ( not ( = ?auto_25821 ?auto_25844 ) ) ( not ( = ?auto_25821 ?auto_25859 ) ) ( not ( = ?auto_25821 ?auto_25837 ) ) ( not ( = ?auto_25821 ?auto_25839 ) ) ( not ( = ?auto_25838 ?auto_25860 ) ) ( not ( = ?auto_25838 ?auto_25846 ) ) ( not ( = ?auto_25838 ?auto_25852 ) ) ( not ( = ?auto_25858 ?auto_25851 ) ) ( not ( = ?auto_25858 ?auto_25845 ) ) ( not ( = ?auto_25858 ?auto_25849 ) ) ( not ( = ?auto_25862 ?auto_25844 ) ) ( not ( = ?auto_25862 ?auto_25859 ) ) ( not ( = ?auto_25862 ?auto_25837 ) ) ( not ( = ?auto_25862 ?auto_25839 ) ) ( not ( = ?auto_25816 ?auto_25822 ) ) ( not ( = ?auto_25816 ?auto_25841 ) ) ( not ( = ?auto_25817 ?auto_25822 ) ) ( not ( = ?auto_25817 ?auto_25841 ) ) ( not ( = ?auto_25818 ?auto_25822 ) ) ( not ( = ?auto_25818 ?auto_25841 ) ) ( not ( = ?auto_25819 ?auto_25822 ) ) ( not ( = ?auto_25819 ?auto_25841 ) ) ( not ( = ?auto_25820 ?auto_25822 ) ) ( not ( = ?auto_25820 ?auto_25841 ) ) ( not ( = ?auto_25822 ?auto_25862 ) ) ( not ( = ?auto_25822 ?auto_25844 ) ) ( not ( = ?auto_25822 ?auto_25859 ) ) ( not ( = ?auto_25822 ?auto_25837 ) ) ( not ( = ?auto_25822 ?auto_25839 ) ) ( not ( = ?auto_25850 ?auto_25838 ) ) ( not ( = ?auto_25850 ?auto_25860 ) ) ( not ( = ?auto_25850 ?auto_25846 ) ) ( not ( = ?auto_25850 ?auto_25852 ) ) ( not ( = ?auto_25840 ?auto_25858 ) ) ( not ( = ?auto_25840 ?auto_25851 ) ) ( not ( = ?auto_25840 ?auto_25845 ) ) ( not ( = ?auto_25840 ?auto_25849 ) ) ( not ( = ?auto_25841 ?auto_25862 ) ) ( not ( = ?auto_25841 ?auto_25844 ) ) ( not ( = ?auto_25841 ?auto_25859 ) ) ( not ( = ?auto_25841 ?auto_25837 ) ) ( not ( = ?auto_25841 ?auto_25839 ) ) ( not ( = ?auto_25816 ?auto_25823 ) ) ( not ( = ?auto_25816 ?auto_25836 ) ) ( not ( = ?auto_25817 ?auto_25823 ) ) ( not ( = ?auto_25817 ?auto_25836 ) ) ( not ( = ?auto_25818 ?auto_25823 ) ) ( not ( = ?auto_25818 ?auto_25836 ) ) ( not ( = ?auto_25819 ?auto_25823 ) ) ( not ( = ?auto_25819 ?auto_25836 ) ) ( not ( = ?auto_25820 ?auto_25823 ) ) ( not ( = ?auto_25820 ?auto_25836 ) ) ( not ( = ?auto_25821 ?auto_25823 ) ) ( not ( = ?auto_25821 ?auto_25836 ) ) ( not ( = ?auto_25823 ?auto_25841 ) ) ( not ( = ?auto_25823 ?auto_25862 ) ) ( not ( = ?auto_25823 ?auto_25844 ) ) ( not ( = ?auto_25823 ?auto_25859 ) ) ( not ( = ?auto_25823 ?auto_25837 ) ) ( not ( = ?auto_25823 ?auto_25839 ) ) ( not ( = ?auto_25857 ?auto_25850 ) ) ( not ( = ?auto_25857 ?auto_25838 ) ) ( not ( = ?auto_25857 ?auto_25860 ) ) ( not ( = ?auto_25857 ?auto_25846 ) ) ( not ( = ?auto_25857 ?auto_25852 ) ) ( not ( = ?auto_25848 ?auto_25840 ) ) ( not ( = ?auto_25848 ?auto_25858 ) ) ( not ( = ?auto_25848 ?auto_25851 ) ) ( not ( = ?auto_25848 ?auto_25845 ) ) ( not ( = ?auto_25848 ?auto_25849 ) ) ( not ( = ?auto_25836 ?auto_25841 ) ) ( not ( = ?auto_25836 ?auto_25862 ) ) ( not ( = ?auto_25836 ?auto_25844 ) ) ( not ( = ?auto_25836 ?auto_25859 ) ) ( not ( = ?auto_25836 ?auto_25837 ) ) ( not ( = ?auto_25836 ?auto_25839 ) ) ( not ( = ?auto_25816 ?auto_25824 ) ) ( not ( = ?auto_25816 ?auto_25854 ) ) ( not ( = ?auto_25817 ?auto_25824 ) ) ( not ( = ?auto_25817 ?auto_25854 ) ) ( not ( = ?auto_25818 ?auto_25824 ) ) ( not ( = ?auto_25818 ?auto_25854 ) ) ( not ( = ?auto_25819 ?auto_25824 ) ) ( not ( = ?auto_25819 ?auto_25854 ) ) ( not ( = ?auto_25820 ?auto_25824 ) ) ( not ( = ?auto_25820 ?auto_25854 ) ) ( not ( = ?auto_25821 ?auto_25824 ) ) ( not ( = ?auto_25821 ?auto_25854 ) ) ( not ( = ?auto_25822 ?auto_25824 ) ) ( not ( = ?auto_25822 ?auto_25854 ) ) ( not ( = ?auto_25824 ?auto_25836 ) ) ( not ( = ?auto_25824 ?auto_25841 ) ) ( not ( = ?auto_25824 ?auto_25862 ) ) ( not ( = ?auto_25824 ?auto_25844 ) ) ( not ( = ?auto_25824 ?auto_25859 ) ) ( not ( = ?auto_25824 ?auto_25837 ) ) ( not ( = ?auto_25824 ?auto_25839 ) ) ( not ( = ?auto_25843 ?auto_25857 ) ) ( not ( = ?auto_25843 ?auto_25850 ) ) ( not ( = ?auto_25843 ?auto_25838 ) ) ( not ( = ?auto_25843 ?auto_25860 ) ) ( not ( = ?auto_25843 ?auto_25846 ) ) ( not ( = ?auto_25843 ?auto_25852 ) ) ( not ( = ?auto_25847 ?auto_25848 ) ) ( not ( = ?auto_25847 ?auto_25840 ) ) ( not ( = ?auto_25847 ?auto_25858 ) ) ( not ( = ?auto_25847 ?auto_25851 ) ) ( not ( = ?auto_25847 ?auto_25845 ) ) ( not ( = ?auto_25847 ?auto_25849 ) ) ( not ( = ?auto_25854 ?auto_25836 ) ) ( not ( = ?auto_25854 ?auto_25841 ) ) ( not ( = ?auto_25854 ?auto_25862 ) ) ( not ( = ?auto_25854 ?auto_25844 ) ) ( not ( = ?auto_25854 ?auto_25859 ) ) ( not ( = ?auto_25854 ?auto_25837 ) ) ( not ( = ?auto_25854 ?auto_25839 ) ) ( not ( = ?auto_25816 ?auto_25825 ) ) ( not ( = ?auto_25816 ?auto_25835 ) ) ( not ( = ?auto_25817 ?auto_25825 ) ) ( not ( = ?auto_25817 ?auto_25835 ) ) ( not ( = ?auto_25818 ?auto_25825 ) ) ( not ( = ?auto_25818 ?auto_25835 ) ) ( not ( = ?auto_25819 ?auto_25825 ) ) ( not ( = ?auto_25819 ?auto_25835 ) ) ( not ( = ?auto_25820 ?auto_25825 ) ) ( not ( = ?auto_25820 ?auto_25835 ) ) ( not ( = ?auto_25821 ?auto_25825 ) ) ( not ( = ?auto_25821 ?auto_25835 ) ) ( not ( = ?auto_25822 ?auto_25825 ) ) ( not ( = ?auto_25822 ?auto_25835 ) ) ( not ( = ?auto_25823 ?auto_25825 ) ) ( not ( = ?auto_25823 ?auto_25835 ) ) ( not ( = ?auto_25825 ?auto_25854 ) ) ( not ( = ?auto_25825 ?auto_25836 ) ) ( not ( = ?auto_25825 ?auto_25841 ) ) ( not ( = ?auto_25825 ?auto_25862 ) ) ( not ( = ?auto_25825 ?auto_25844 ) ) ( not ( = ?auto_25825 ?auto_25859 ) ) ( not ( = ?auto_25825 ?auto_25837 ) ) ( not ( = ?auto_25825 ?auto_25839 ) ) ( not ( = ?auto_25861 ?auto_25843 ) ) ( not ( = ?auto_25861 ?auto_25857 ) ) ( not ( = ?auto_25861 ?auto_25850 ) ) ( not ( = ?auto_25861 ?auto_25838 ) ) ( not ( = ?auto_25861 ?auto_25860 ) ) ( not ( = ?auto_25861 ?auto_25846 ) ) ( not ( = ?auto_25861 ?auto_25852 ) ) ( not ( = ?auto_25853 ?auto_25847 ) ) ( not ( = ?auto_25853 ?auto_25848 ) ) ( not ( = ?auto_25853 ?auto_25840 ) ) ( not ( = ?auto_25853 ?auto_25858 ) ) ( not ( = ?auto_25853 ?auto_25851 ) ) ( not ( = ?auto_25853 ?auto_25845 ) ) ( not ( = ?auto_25853 ?auto_25849 ) ) ( not ( = ?auto_25835 ?auto_25854 ) ) ( not ( = ?auto_25835 ?auto_25836 ) ) ( not ( = ?auto_25835 ?auto_25841 ) ) ( not ( = ?auto_25835 ?auto_25862 ) ) ( not ( = ?auto_25835 ?auto_25844 ) ) ( not ( = ?auto_25835 ?auto_25859 ) ) ( not ( = ?auto_25835 ?auto_25837 ) ) ( not ( = ?auto_25835 ?auto_25839 ) ) ( not ( = ?auto_25816 ?auto_25826 ) ) ( not ( = ?auto_25816 ?auto_25842 ) ) ( not ( = ?auto_25817 ?auto_25826 ) ) ( not ( = ?auto_25817 ?auto_25842 ) ) ( not ( = ?auto_25818 ?auto_25826 ) ) ( not ( = ?auto_25818 ?auto_25842 ) ) ( not ( = ?auto_25819 ?auto_25826 ) ) ( not ( = ?auto_25819 ?auto_25842 ) ) ( not ( = ?auto_25820 ?auto_25826 ) ) ( not ( = ?auto_25820 ?auto_25842 ) ) ( not ( = ?auto_25821 ?auto_25826 ) ) ( not ( = ?auto_25821 ?auto_25842 ) ) ( not ( = ?auto_25822 ?auto_25826 ) ) ( not ( = ?auto_25822 ?auto_25842 ) ) ( not ( = ?auto_25823 ?auto_25826 ) ) ( not ( = ?auto_25823 ?auto_25842 ) ) ( not ( = ?auto_25824 ?auto_25826 ) ) ( not ( = ?auto_25824 ?auto_25842 ) ) ( not ( = ?auto_25826 ?auto_25835 ) ) ( not ( = ?auto_25826 ?auto_25854 ) ) ( not ( = ?auto_25826 ?auto_25836 ) ) ( not ( = ?auto_25826 ?auto_25841 ) ) ( not ( = ?auto_25826 ?auto_25862 ) ) ( not ( = ?auto_25826 ?auto_25844 ) ) ( not ( = ?auto_25826 ?auto_25859 ) ) ( not ( = ?auto_25826 ?auto_25837 ) ) ( not ( = ?auto_25826 ?auto_25839 ) ) ( not ( = ?auto_25831 ?auto_25861 ) ) ( not ( = ?auto_25831 ?auto_25843 ) ) ( not ( = ?auto_25831 ?auto_25857 ) ) ( not ( = ?auto_25831 ?auto_25850 ) ) ( not ( = ?auto_25831 ?auto_25838 ) ) ( not ( = ?auto_25831 ?auto_25860 ) ) ( not ( = ?auto_25831 ?auto_25846 ) ) ( not ( = ?auto_25831 ?auto_25852 ) ) ( not ( = ?auto_25832 ?auto_25853 ) ) ( not ( = ?auto_25832 ?auto_25847 ) ) ( not ( = ?auto_25832 ?auto_25848 ) ) ( not ( = ?auto_25832 ?auto_25840 ) ) ( not ( = ?auto_25832 ?auto_25858 ) ) ( not ( = ?auto_25832 ?auto_25851 ) ) ( not ( = ?auto_25832 ?auto_25845 ) ) ( not ( = ?auto_25832 ?auto_25849 ) ) ( not ( = ?auto_25842 ?auto_25835 ) ) ( not ( = ?auto_25842 ?auto_25854 ) ) ( not ( = ?auto_25842 ?auto_25836 ) ) ( not ( = ?auto_25842 ?auto_25841 ) ) ( not ( = ?auto_25842 ?auto_25862 ) ) ( not ( = ?auto_25842 ?auto_25844 ) ) ( not ( = ?auto_25842 ?auto_25859 ) ) ( not ( = ?auto_25842 ?auto_25837 ) ) ( not ( = ?auto_25842 ?auto_25839 ) ) ( not ( = ?auto_25816 ?auto_25827 ) ) ( not ( = ?auto_25816 ?auto_25855 ) ) ( not ( = ?auto_25817 ?auto_25827 ) ) ( not ( = ?auto_25817 ?auto_25855 ) ) ( not ( = ?auto_25818 ?auto_25827 ) ) ( not ( = ?auto_25818 ?auto_25855 ) ) ( not ( = ?auto_25819 ?auto_25827 ) ) ( not ( = ?auto_25819 ?auto_25855 ) ) ( not ( = ?auto_25820 ?auto_25827 ) ) ( not ( = ?auto_25820 ?auto_25855 ) ) ( not ( = ?auto_25821 ?auto_25827 ) ) ( not ( = ?auto_25821 ?auto_25855 ) ) ( not ( = ?auto_25822 ?auto_25827 ) ) ( not ( = ?auto_25822 ?auto_25855 ) ) ( not ( = ?auto_25823 ?auto_25827 ) ) ( not ( = ?auto_25823 ?auto_25855 ) ) ( not ( = ?auto_25824 ?auto_25827 ) ) ( not ( = ?auto_25824 ?auto_25855 ) ) ( not ( = ?auto_25825 ?auto_25827 ) ) ( not ( = ?auto_25825 ?auto_25855 ) ) ( not ( = ?auto_25827 ?auto_25842 ) ) ( not ( = ?auto_25827 ?auto_25835 ) ) ( not ( = ?auto_25827 ?auto_25854 ) ) ( not ( = ?auto_25827 ?auto_25836 ) ) ( not ( = ?auto_25827 ?auto_25841 ) ) ( not ( = ?auto_25827 ?auto_25862 ) ) ( not ( = ?auto_25827 ?auto_25844 ) ) ( not ( = ?auto_25827 ?auto_25859 ) ) ( not ( = ?auto_25827 ?auto_25837 ) ) ( not ( = ?auto_25827 ?auto_25839 ) ) ( not ( = ?auto_25863 ?auto_25831 ) ) ( not ( = ?auto_25863 ?auto_25861 ) ) ( not ( = ?auto_25863 ?auto_25843 ) ) ( not ( = ?auto_25863 ?auto_25857 ) ) ( not ( = ?auto_25863 ?auto_25850 ) ) ( not ( = ?auto_25863 ?auto_25838 ) ) ( not ( = ?auto_25863 ?auto_25860 ) ) ( not ( = ?auto_25863 ?auto_25846 ) ) ( not ( = ?auto_25863 ?auto_25852 ) ) ( not ( = ?auto_25856 ?auto_25832 ) ) ( not ( = ?auto_25856 ?auto_25853 ) ) ( not ( = ?auto_25856 ?auto_25847 ) ) ( not ( = ?auto_25856 ?auto_25848 ) ) ( not ( = ?auto_25856 ?auto_25840 ) ) ( not ( = ?auto_25856 ?auto_25858 ) ) ( not ( = ?auto_25856 ?auto_25851 ) ) ( not ( = ?auto_25856 ?auto_25845 ) ) ( not ( = ?auto_25856 ?auto_25849 ) ) ( not ( = ?auto_25855 ?auto_25842 ) ) ( not ( = ?auto_25855 ?auto_25835 ) ) ( not ( = ?auto_25855 ?auto_25854 ) ) ( not ( = ?auto_25855 ?auto_25836 ) ) ( not ( = ?auto_25855 ?auto_25841 ) ) ( not ( = ?auto_25855 ?auto_25862 ) ) ( not ( = ?auto_25855 ?auto_25844 ) ) ( not ( = ?auto_25855 ?auto_25859 ) ) ( not ( = ?auto_25855 ?auto_25837 ) ) ( not ( = ?auto_25855 ?auto_25839 ) ) ( not ( = ?auto_25816 ?auto_25828 ) ) ( not ( = ?auto_25816 ?auto_25829 ) ) ( not ( = ?auto_25817 ?auto_25828 ) ) ( not ( = ?auto_25817 ?auto_25829 ) ) ( not ( = ?auto_25818 ?auto_25828 ) ) ( not ( = ?auto_25818 ?auto_25829 ) ) ( not ( = ?auto_25819 ?auto_25828 ) ) ( not ( = ?auto_25819 ?auto_25829 ) ) ( not ( = ?auto_25820 ?auto_25828 ) ) ( not ( = ?auto_25820 ?auto_25829 ) ) ( not ( = ?auto_25821 ?auto_25828 ) ) ( not ( = ?auto_25821 ?auto_25829 ) ) ( not ( = ?auto_25822 ?auto_25828 ) ) ( not ( = ?auto_25822 ?auto_25829 ) ) ( not ( = ?auto_25823 ?auto_25828 ) ) ( not ( = ?auto_25823 ?auto_25829 ) ) ( not ( = ?auto_25824 ?auto_25828 ) ) ( not ( = ?auto_25824 ?auto_25829 ) ) ( not ( = ?auto_25825 ?auto_25828 ) ) ( not ( = ?auto_25825 ?auto_25829 ) ) ( not ( = ?auto_25826 ?auto_25828 ) ) ( not ( = ?auto_25826 ?auto_25829 ) ) ( not ( = ?auto_25828 ?auto_25855 ) ) ( not ( = ?auto_25828 ?auto_25842 ) ) ( not ( = ?auto_25828 ?auto_25835 ) ) ( not ( = ?auto_25828 ?auto_25854 ) ) ( not ( = ?auto_25828 ?auto_25836 ) ) ( not ( = ?auto_25828 ?auto_25841 ) ) ( not ( = ?auto_25828 ?auto_25862 ) ) ( not ( = ?auto_25828 ?auto_25844 ) ) ( not ( = ?auto_25828 ?auto_25859 ) ) ( not ( = ?auto_25828 ?auto_25837 ) ) ( not ( = ?auto_25828 ?auto_25839 ) ) ( not ( = ?auto_25829 ?auto_25855 ) ) ( not ( = ?auto_25829 ?auto_25842 ) ) ( not ( = ?auto_25829 ?auto_25835 ) ) ( not ( = ?auto_25829 ?auto_25854 ) ) ( not ( = ?auto_25829 ?auto_25836 ) ) ( not ( = ?auto_25829 ?auto_25841 ) ) ( not ( = ?auto_25829 ?auto_25862 ) ) ( not ( = ?auto_25829 ?auto_25844 ) ) ( not ( = ?auto_25829 ?auto_25859 ) ) ( not ( = ?auto_25829 ?auto_25837 ) ) ( not ( = ?auto_25829 ?auto_25839 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_25816 ?auto_25817 ?auto_25818 ?auto_25819 ?auto_25820 ?auto_25821 ?auto_25822 ?auto_25823 ?auto_25824 ?auto_25825 ?auto_25826 ?auto_25827 )
      ( MAKE-1CRATE ?auto_25827 ?auto_25828 )
      ( MAKE-12CRATE-VERIFY ?auto_25816 ?auto_25817 ?auto_25818 ?auto_25819 ?auto_25820 ?auto_25821 ?auto_25822 ?auto_25823 ?auto_25824 ?auto_25825 ?auto_25826 ?auto_25827 ?auto_25828 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_25888 - SURFACE
      ?auto_25889 - SURFACE
      ?auto_25890 - SURFACE
      ?auto_25891 - SURFACE
      ?auto_25892 - SURFACE
      ?auto_25893 - SURFACE
      ?auto_25894 - SURFACE
      ?auto_25895 - SURFACE
      ?auto_25896 - SURFACE
      ?auto_25897 - SURFACE
      ?auto_25898 - SURFACE
      ?auto_25899 - SURFACE
      ?auto_25900 - SURFACE
      ?auto_25901 - SURFACE
    )
    :vars
    (
      ?auto_25904 - HOIST
      ?auto_25907 - PLACE
      ?auto_25906 - PLACE
      ?auto_25905 - HOIST
      ?auto_25902 - SURFACE
      ?auto_25913 - PLACE
      ?auto_25908 - HOIST
      ?auto_25928 - SURFACE
      ?auto_25910 - PLACE
      ?auto_25934 - HOIST
      ?auto_25926 - SURFACE
      ?auto_25937 - SURFACE
      ?auto_25923 - PLACE
      ?auto_25918 - HOIST
      ?auto_25909 - SURFACE
      ?auto_25911 - PLACE
      ?auto_25915 - HOIST
      ?auto_25917 - SURFACE
      ?auto_25921 - PLACE
      ?auto_25914 - HOIST
      ?auto_25929 - SURFACE
      ?auto_25927 - PLACE
      ?auto_25932 - HOIST
      ?auto_25936 - SURFACE
      ?auto_25935 - SURFACE
      ?auto_25925 - PLACE
      ?auto_25930 - HOIST
      ?auto_25933 - SURFACE
      ?auto_25912 - PLACE
      ?auto_25924 - HOIST
      ?auto_25920 - SURFACE
      ?auto_25922 - PLACE
      ?auto_25916 - HOIST
      ?auto_25931 - SURFACE
      ?auto_25919 - SURFACE
      ?auto_25903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25904 ?auto_25907 ) ( IS-CRATE ?auto_25901 ) ( not ( = ?auto_25906 ?auto_25907 ) ) ( HOIST-AT ?auto_25905 ?auto_25906 ) ( SURFACE-AT ?auto_25901 ?auto_25906 ) ( ON ?auto_25901 ?auto_25902 ) ( CLEAR ?auto_25901 ) ( not ( = ?auto_25900 ?auto_25901 ) ) ( not ( = ?auto_25900 ?auto_25902 ) ) ( not ( = ?auto_25901 ?auto_25902 ) ) ( not ( = ?auto_25904 ?auto_25905 ) ) ( IS-CRATE ?auto_25900 ) ( not ( = ?auto_25913 ?auto_25907 ) ) ( HOIST-AT ?auto_25908 ?auto_25913 ) ( SURFACE-AT ?auto_25900 ?auto_25913 ) ( ON ?auto_25900 ?auto_25928 ) ( CLEAR ?auto_25900 ) ( not ( = ?auto_25899 ?auto_25900 ) ) ( not ( = ?auto_25899 ?auto_25928 ) ) ( not ( = ?auto_25900 ?auto_25928 ) ) ( not ( = ?auto_25904 ?auto_25908 ) ) ( IS-CRATE ?auto_25899 ) ( not ( = ?auto_25910 ?auto_25907 ) ) ( HOIST-AT ?auto_25934 ?auto_25910 ) ( AVAILABLE ?auto_25934 ) ( SURFACE-AT ?auto_25899 ?auto_25910 ) ( ON ?auto_25899 ?auto_25926 ) ( CLEAR ?auto_25899 ) ( not ( = ?auto_25898 ?auto_25899 ) ) ( not ( = ?auto_25898 ?auto_25926 ) ) ( not ( = ?auto_25899 ?auto_25926 ) ) ( not ( = ?auto_25904 ?auto_25934 ) ) ( IS-CRATE ?auto_25898 ) ( AVAILABLE ?auto_25908 ) ( SURFACE-AT ?auto_25898 ?auto_25913 ) ( ON ?auto_25898 ?auto_25937 ) ( CLEAR ?auto_25898 ) ( not ( = ?auto_25897 ?auto_25898 ) ) ( not ( = ?auto_25897 ?auto_25937 ) ) ( not ( = ?auto_25898 ?auto_25937 ) ) ( IS-CRATE ?auto_25897 ) ( not ( = ?auto_25923 ?auto_25907 ) ) ( HOIST-AT ?auto_25918 ?auto_25923 ) ( AVAILABLE ?auto_25918 ) ( SURFACE-AT ?auto_25897 ?auto_25923 ) ( ON ?auto_25897 ?auto_25909 ) ( CLEAR ?auto_25897 ) ( not ( = ?auto_25896 ?auto_25897 ) ) ( not ( = ?auto_25896 ?auto_25909 ) ) ( not ( = ?auto_25897 ?auto_25909 ) ) ( not ( = ?auto_25904 ?auto_25918 ) ) ( IS-CRATE ?auto_25896 ) ( not ( = ?auto_25911 ?auto_25907 ) ) ( HOIST-AT ?auto_25915 ?auto_25911 ) ( AVAILABLE ?auto_25915 ) ( SURFACE-AT ?auto_25896 ?auto_25911 ) ( ON ?auto_25896 ?auto_25917 ) ( CLEAR ?auto_25896 ) ( not ( = ?auto_25895 ?auto_25896 ) ) ( not ( = ?auto_25895 ?auto_25917 ) ) ( not ( = ?auto_25896 ?auto_25917 ) ) ( not ( = ?auto_25904 ?auto_25915 ) ) ( IS-CRATE ?auto_25895 ) ( not ( = ?auto_25921 ?auto_25907 ) ) ( HOIST-AT ?auto_25914 ?auto_25921 ) ( AVAILABLE ?auto_25914 ) ( SURFACE-AT ?auto_25895 ?auto_25921 ) ( ON ?auto_25895 ?auto_25929 ) ( CLEAR ?auto_25895 ) ( not ( = ?auto_25894 ?auto_25895 ) ) ( not ( = ?auto_25894 ?auto_25929 ) ) ( not ( = ?auto_25895 ?auto_25929 ) ) ( not ( = ?auto_25904 ?auto_25914 ) ) ( IS-CRATE ?auto_25894 ) ( not ( = ?auto_25927 ?auto_25907 ) ) ( HOIST-AT ?auto_25932 ?auto_25927 ) ( AVAILABLE ?auto_25932 ) ( SURFACE-AT ?auto_25894 ?auto_25927 ) ( ON ?auto_25894 ?auto_25936 ) ( CLEAR ?auto_25894 ) ( not ( = ?auto_25893 ?auto_25894 ) ) ( not ( = ?auto_25893 ?auto_25936 ) ) ( not ( = ?auto_25894 ?auto_25936 ) ) ( not ( = ?auto_25904 ?auto_25932 ) ) ( IS-CRATE ?auto_25893 ) ( AVAILABLE ?auto_25905 ) ( SURFACE-AT ?auto_25893 ?auto_25906 ) ( ON ?auto_25893 ?auto_25935 ) ( CLEAR ?auto_25893 ) ( not ( = ?auto_25892 ?auto_25893 ) ) ( not ( = ?auto_25892 ?auto_25935 ) ) ( not ( = ?auto_25893 ?auto_25935 ) ) ( IS-CRATE ?auto_25892 ) ( not ( = ?auto_25925 ?auto_25907 ) ) ( HOIST-AT ?auto_25930 ?auto_25925 ) ( SURFACE-AT ?auto_25892 ?auto_25925 ) ( ON ?auto_25892 ?auto_25933 ) ( CLEAR ?auto_25892 ) ( not ( = ?auto_25891 ?auto_25892 ) ) ( not ( = ?auto_25891 ?auto_25933 ) ) ( not ( = ?auto_25892 ?auto_25933 ) ) ( not ( = ?auto_25904 ?auto_25930 ) ) ( IS-CRATE ?auto_25891 ) ( not ( = ?auto_25912 ?auto_25907 ) ) ( HOIST-AT ?auto_25924 ?auto_25912 ) ( AVAILABLE ?auto_25924 ) ( SURFACE-AT ?auto_25891 ?auto_25912 ) ( ON ?auto_25891 ?auto_25920 ) ( CLEAR ?auto_25891 ) ( not ( = ?auto_25890 ?auto_25891 ) ) ( not ( = ?auto_25890 ?auto_25920 ) ) ( not ( = ?auto_25891 ?auto_25920 ) ) ( not ( = ?auto_25904 ?auto_25924 ) ) ( IS-CRATE ?auto_25890 ) ( not ( = ?auto_25922 ?auto_25907 ) ) ( HOIST-AT ?auto_25916 ?auto_25922 ) ( AVAILABLE ?auto_25916 ) ( SURFACE-AT ?auto_25890 ?auto_25922 ) ( ON ?auto_25890 ?auto_25931 ) ( CLEAR ?auto_25890 ) ( not ( = ?auto_25889 ?auto_25890 ) ) ( not ( = ?auto_25889 ?auto_25931 ) ) ( not ( = ?auto_25890 ?auto_25931 ) ) ( not ( = ?auto_25904 ?auto_25916 ) ) ( SURFACE-AT ?auto_25888 ?auto_25907 ) ( CLEAR ?auto_25888 ) ( IS-CRATE ?auto_25889 ) ( AVAILABLE ?auto_25904 ) ( AVAILABLE ?auto_25930 ) ( SURFACE-AT ?auto_25889 ?auto_25925 ) ( ON ?auto_25889 ?auto_25919 ) ( CLEAR ?auto_25889 ) ( TRUCK-AT ?auto_25903 ?auto_25907 ) ( not ( = ?auto_25888 ?auto_25889 ) ) ( not ( = ?auto_25888 ?auto_25919 ) ) ( not ( = ?auto_25889 ?auto_25919 ) ) ( not ( = ?auto_25888 ?auto_25890 ) ) ( not ( = ?auto_25888 ?auto_25931 ) ) ( not ( = ?auto_25890 ?auto_25919 ) ) ( not ( = ?auto_25922 ?auto_25925 ) ) ( not ( = ?auto_25916 ?auto_25930 ) ) ( not ( = ?auto_25931 ?auto_25919 ) ) ( not ( = ?auto_25888 ?auto_25891 ) ) ( not ( = ?auto_25888 ?auto_25920 ) ) ( not ( = ?auto_25889 ?auto_25891 ) ) ( not ( = ?auto_25889 ?auto_25920 ) ) ( not ( = ?auto_25891 ?auto_25931 ) ) ( not ( = ?auto_25891 ?auto_25919 ) ) ( not ( = ?auto_25912 ?auto_25922 ) ) ( not ( = ?auto_25912 ?auto_25925 ) ) ( not ( = ?auto_25924 ?auto_25916 ) ) ( not ( = ?auto_25924 ?auto_25930 ) ) ( not ( = ?auto_25920 ?auto_25931 ) ) ( not ( = ?auto_25920 ?auto_25919 ) ) ( not ( = ?auto_25888 ?auto_25892 ) ) ( not ( = ?auto_25888 ?auto_25933 ) ) ( not ( = ?auto_25889 ?auto_25892 ) ) ( not ( = ?auto_25889 ?auto_25933 ) ) ( not ( = ?auto_25890 ?auto_25892 ) ) ( not ( = ?auto_25890 ?auto_25933 ) ) ( not ( = ?auto_25892 ?auto_25920 ) ) ( not ( = ?auto_25892 ?auto_25931 ) ) ( not ( = ?auto_25892 ?auto_25919 ) ) ( not ( = ?auto_25933 ?auto_25920 ) ) ( not ( = ?auto_25933 ?auto_25931 ) ) ( not ( = ?auto_25933 ?auto_25919 ) ) ( not ( = ?auto_25888 ?auto_25893 ) ) ( not ( = ?auto_25888 ?auto_25935 ) ) ( not ( = ?auto_25889 ?auto_25893 ) ) ( not ( = ?auto_25889 ?auto_25935 ) ) ( not ( = ?auto_25890 ?auto_25893 ) ) ( not ( = ?auto_25890 ?auto_25935 ) ) ( not ( = ?auto_25891 ?auto_25893 ) ) ( not ( = ?auto_25891 ?auto_25935 ) ) ( not ( = ?auto_25893 ?auto_25933 ) ) ( not ( = ?auto_25893 ?auto_25920 ) ) ( not ( = ?auto_25893 ?auto_25931 ) ) ( not ( = ?auto_25893 ?auto_25919 ) ) ( not ( = ?auto_25906 ?auto_25925 ) ) ( not ( = ?auto_25906 ?auto_25912 ) ) ( not ( = ?auto_25906 ?auto_25922 ) ) ( not ( = ?auto_25905 ?auto_25930 ) ) ( not ( = ?auto_25905 ?auto_25924 ) ) ( not ( = ?auto_25905 ?auto_25916 ) ) ( not ( = ?auto_25935 ?auto_25933 ) ) ( not ( = ?auto_25935 ?auto_25920 ) ) ( not ( = ?auto_25935 ?auto_25931 ) ) ( not ( = ?auto_25935 ?auto_25919 ) ) ( not ( = ?auto_25888 ?auto_25894 ) ) ( not ( = ?auto_25888 ?auto_25936 ) ) ( not ( = ?auto_25889 ?auto_25894 ) ) ( not ( = ?auto_25889 ?auto_25936 ) ) ( not ( = ?auto_25890 ?auto_25894 ) ) ( not ( = ?auto_25890 ?auto_25936 ) ) ( not ( = ?auto_25891 ?auto_25894 ) ) ( not ( = ?auto_25891 ?auto_25936 ) ) ( not ( = ?auto_25892 ?auto_25894 ) ) ( not ( = ?auto_25892 ?auto_25936 ) ) ( not ( = ?auto_25894 ?auto_25935 ) ) ( not ( = ?auto_25894 ?auto_25933 ) ) ( not ( = ?auto_25894 ?auto_25920 ) ) ( not ( = ?auto_25894 ?auto_25931 ) ) ( not ( = ?auto_25894 ?auto_25919 ) ) ( not ( = ?auto_25927 ?auto_25906 ) ) ( not ( = ?auto_25927 ?auto_25925 ) ) ( not ( = ?auto_25927 ?auto_25912 ) ) ( not ( = ?auto_25927 ?auto_25922 ) ) ( not ( = ?auto_25932 ?auto_25905 ) ) ( not ( = ?auto_25932 ?auto_25930 ) ) ( not ( = ?auto_25932 ?auto_25924 ) ) ( not ( = ?auto_25932 ?auto_25916 ) ) ( not ( = ?auto_25936 ?auto_25935 ) ) ( not ( = ?auto_25936 ?auto_25933 ) ) ( not ( = ?auto_25936 ?auto_25920 ) ) ( not ( = ?auto_25936 ?auto_25931 ) ) ( not ( = ?auto_25936 ?auto_25919 ) ) ( not ( = ?auto_25888 ?auto_25895 ) ) ( not ( = ?auto_25888 ?auto_25929 ) ) ( not ( = ?auto_25889 ?auto_25895 ) ) ( not ( = ?auto_25889 ?auto_25929 ) ) ( not ( = ?auto_25890 ?auto_25895 ) ) ( not ( = ?auto_25890 ?auto_25929 ) ) ( not ( = ?auto_25891 ?auto_25895 ) ) ( not ( = ?auto_25891 ?auto_25929 ) ) ( not ( = ?auto_25892 ?auto_25895 ) ) ( not ( = ?auto_25892 ?auto_25929 ) ) ( not ( = ?auto_25893 ?auto_25895 ) ) ( not ( = ?auto_25893 ?auto_25929 ) ) ( not ( = ?auto_25895 ?auto_25936 ) ) ( not ( = ?auto_25895 ?auto_25935 ) ) ( not ( = ?auto_25895 ?auto_25933 ) ) ( not ( = ?auto_25895 ?auto_25920 ) ) ( not ( = ?auto_25895 ?auto_25931 ) ) ( not ( = ?auto_25895 ?auto_25919 ) ) ( not ( = ?auto_25921 ?auto_25927 ) ) ( not ( = ?auto_25921 ?auto_25906 ) ) ( not ( = ?auto_25921 ?auto_25925 ) ) ( not ( = ?auto_25921 ?auto_25912 ) ) ( not ( = ?auto_25921 ?auto_25922 ) ) ( not ( = ?auto_25914 ?auto_25932 ) ) ( not ( = ?auto_25914 ?auto_25905 ) ) ( not ( = ?auto_25914 ?auto_25930 ) ) ( not ( = ?auto_25914 ?auto_25924 ) ) ( not ( = ?auto_25914 ?auto_25916 ) ) ( not ( = ?auto_25929 ?auto_25936 ) ) ( not ( = ?auto_25929 ?auto_25935 ) ) ( not ( = ?auto_25929 ?auto_25933 ) ) ( not ( = ?auto_25929 ?auto_25920 ) ) ( not ( = ?auto_25929 ?auto_25931 ) ) ( not ( = ?auto_25929 ?auto_25919 ) ) ( not ( = ?auto_25888 ?auto_25896 ) ) ( not ( = ?auto_25888 ?auto_25917 ) ) ( not ( = ?auto_25889 ?auto_25896 ) ) ( not ( = ?auto_25889 ?auto_25917 ) ) ( not ( = ?auto_25890 ?auto_25896 ) ) ( not ( = ?auto_25890 ?auto_25917 ) ) ( not ( = ?auto_25891 ?auto_25896 ) ) ( not ( = ?auto_25891 ?auto_25917 ) ) ( not ( = ?auto_25892 ?auto_25896 ) ) ( not ( = ?auto_25892 ?auto_25917 ) ) ( not ( = ?auto_25893 ?auto_25896 ) ) ( not ( = ?auto_25893 ?auto_25917 ) ) ( not ( = ?auto_25894 ?auto_25896 ) ) ( not ( = ?auto_25894 ?auto_25917 ) ) ( not ( = ?auto_25896 ?auto_25929 ) ) ( not ( = ?auto_25896 ?auto_25936 ) ) ( not ( = ?auto_25896 ?auto_25935 ) ) ( not ( = ?auto_25896 ?auto_25933 ) ) ( not ( = ?auto_25896 ?auto_25920 ) ) ( not ( = ?auto_25896 ?auto_25931 ) ) ( not ( = ?auto_25896 ?auto_25919 ) ) ( not ( = ?auto_25911 ?auto_25921 ) ) ( not ( = ?auto_25911 ?auto_25927 ) ) ( not ( = ?auto_25911 ?auto_25906 ) ) ( not ( = ?auto_25911 ?auto_25925 ) ) ( not ( = ?auto_25911 ?auto_25912 ) ) ( not ( = ?auto_25911 ?auto_25922 ) ) ( not ( = ?auto_25915 ?auto_25914 ) ) ( not ( = ?auto_25915 ?auto_25932 ) ) ( not ( = ?auto_25915 ?auto_25905 ) ) ( not ( = ?auto_25915 ?auto_25930 ) ) ( not ( = ?auto_25915 ?auto_25924 ) ) ( not ( = ?auto_25915 ?auto_25916 ) ) ( not ( = ?auto_25917 ?auto_25929 ) ) ( not ( = ?auto_25917 ?auto_25936 ) ) ( not ( = ?auto_25917 ?auto_25935 ) ) ( not ( = ?auto_25917 ?auto_25933 ) ) ( not ( = ?auto_25917 ?auto_25920 ) ) ( not ( = ?auto_25917 ?auto_25931 ) ) ( not ( = ?auto_25917 ?auto_25919 ) ) ( not ( = ?auto_25888 ?auto_25897 ) ) ( not ( = ?auto_25888 ?auto_25909 ) ) ( not ( = ?auto_25889 ?auto_25897 ) ) ( not ( = ?auto_25889 ?auto_25909 ) ) ( not ( = ?auto_25890 ?auto_25897 ) ) ( not ( = ?auto_25890 ?auto_25909 ) ) ( not ( = ?auto_25891 ?auto_25897 ) ) ( not ( = ?auto_25891 ?auto_25909 ) ) ( not ( = ?auto_25892 ?auto_25897 ) ) ( not ( = ?auto_25892 ?auto_25909 ) ) ( not ( = ?auto_25893 ?auto_25897 ) ) ( not ( = ?auto_25893 ?auto_25909 ) ) ( not ( = ?auto_25894 ?auto_25897 ) ) ( not ( = ?auto_25894 ?auto_25909 ) ) ( not ( = ?auto_25895 ?auto_25897 ) ) ( not ( = ?auto_25895 ?auto_25909 ) ) ( not ( = ?auto_25897 ?auto_25917 ) ) ( not ( = ?auto_25897 ?auto_25929 ) ) ( not ( = ?auto_25897 ?auto_25936 ) ) ( not ( = ?auto_25897 ?auto_25935 ) ) ( not ( = ?auto_25897 ?auto_25933 ) ) ( not ( = ?auto_25897 ?auto_25920 ) ) ( not ( = ?auto_25897 ?auto_25931 ) ) ( not ( = ?auto_25897 ?auto_25919 ) ) ( not ( = ?auto_25923 ?auto_25911 ) ) ( not ( = ?auto_25923 ?auto_25921 ) ) ( not ( = ?auto_25923 ?auto_25927 ) ) ( not ( = ?auto_25923 ?auto_25906 ) ) ( not ( = ?auto_25923 ?auto_25925 ) ) ( not ( = ?auto_25923 ?auto_25912 ) ) ( not ( = ?auto_25923 ?auto_25922 ) ) ( not ( = ?auto_25918 ?auto_25915 ) ) ( not ( = ?auto_25918 ?auto_25914 ) ) ( not ( = ?auto_25918 ?auto_25932 ) ) ( not ( = ?auto_25918 ?auto_25905 ) ) ( not ( = ?auto_25918 ?auto_25930 ) ) ( not ( = ?auto_25918 ?auto_25924 ) ) ( not ( = ?auto_25918 ?auto_25916 ) ) ( not ( = ?auto_25909 ?auto_25917 ) ) ( not ( = ?auto_25909 ?auto_25929 ) ) ( not ( = ?auto_25909 ?auto_25936 ) ) ( not ( = ?auto_25909 ?auto_25935 ) ) ( not ( = ?auto_25909 ?auto_25933 ) ) ( not ( = ?auto_25909 ?auto_25920 ) ) ( not ( = ?auto_25909 ?auto_25931 ) ) ( not ( = ?auto_25909 ?auto_25919 ) ) ( not ( = ?auto_25888 ?auto_25898 ) ) ( not ( = ?auto_25888 ?auto_25937 ) ) ( not ( = ?auto_25889 ?auto_25898 ) ) ( not ( = ?auto_25889 ?auto_25937 ) ) ( not ( = ?auto_25890 ?auto_25898 ) ) ( not ( = ?auto_25890 ?auto_25937 ) ) ( not ( = ?auto_25891 ?auto_25898 ) ) ( not ( = ?auto_25891 ?auto_25937 ) ) ( not ( = ?auto_25892 ?auto_25898 ) ) ( not ( = ?auto_25892 ?auto_25937 ) ) ( not ( = ?auto_25893 ?auto_25898 ) ) ( not ( = ?auto_25893 ?auto_25937 ) ) ( not ( = ?auto_25894 ?auto_25898 ) ) ( not ( = ?auto_25894 ?auto_25937 ) ) ( not ( = ?auto_25895 ?auto_25898 ) ) ( not ( = ?auto_25895 ?auto_25937 ) ) ( not ( = ?auto_25896 ?auto_25898 ) ) ( not ( = ?auto_25896 ?auto_25937 ) ) ( not ( = ?auto_25898 ?auto_25909 ) ) ( not ( = ?auto_25898 ?auto_25917 ) ) ( not ( = ?auto_25898 ?auto_25929 ) ) ( not ( = ?auto_25898 ?auto_25936 ) ) ( not ( = ?auto_25898 ?auto_25935 ) ) ( not ( = ?auto_25898 ?auto_25933 ) ) ( not ( = ?auto_25898 ?auto_25920 ) ) ( not ( = ?auto_25898 ?auto_25931 ) ) ( not ( = ?auto_25898 ?auto_25919 ) ) ( not ( = ?auto_25913 ?auto_25923 ) ) ( not ( = ?auto_25913 ?auto_25911 ) ) ( not ( = ?auto_25913 ?auto_25921 ) ) ( not ( = ?auto_25913 ?auto_25927 ) ) ( not ( = ?auto_25913 ?auto_25906 ) ) ( not ( = ?auto_25913 ?auto_25925 ) ) ( not ( = ?auto_25913 ?auto_25912 ) ) ( not ( = ?auto_25913 ?auto_25922 ) ) ( not ( = ?auto_25908 ?auto_25918 ) ) ( not ( = ?auto_25908 ?auto_25915 ) ) ( not ( = ?auto_25908 ?auto_25914 ) ) ( not ( = ?auto_25908 ?auto_25932 ) ) ( not ( = ?auto_25908 ?auto_25905 ) ) ( not ( = ?auto_25908 ?auto_25930 ) ) ( not ( = ?auto_25908 ?auto_25924 ) ) ( not ( = ?auto_25908 ?auto_25916 ) ) ( not ( = ?auto_25937 ?auto_25909 ) ) ( not ( = ?auto_25937 ?auto_25917 ) ) ( not ( = ?auto_25937 ?auto_25929 ) ) ( not ( = ?auto_25937 ?auto_25936 ) ) ( not ( = ?auto_25937 ?auto_25935 ) ) ( not ( = ?auto_25937 ?auto_25933 ) ) ( not ( = ?auto_25937 ?auto_25920 ) ) ( not ( = ?auto_25937 ?auto_25931 ) ) ( not ( = ?auto_25937 ?auto_25919 ) ) ( not ( = ?auto_25888 ?auto_25899 ) ) ( not ( = ?auto_25888 ?auto_25926 ) ) ( not ( = ?auto_25889 ?auto_25899 ) ) ( not ( = ?auto_25889 ?auto_25926 ) ) ( not ( = ?auto_25890 ?auto_25899 ) ) ( not ( = ?auto_25890 ?auto_25926 ) ) ( not ( = ?auto_25891 ?auto_25899 ) ) ( not ( = ?auto_25891 ?auto_25926 ) ) ( not ( = ?auto_25892 ?auto_25899 ) ) ( not ( = ?auto_25892 ?auto_25926 ) ) ( not ( = ?auto_25893 ?auto_25899 ) ) ( not ( = ?auto_25893 ?auto_25926 ) ) ( not ( = ?auto_25894 ?auto_25899 ) ) ( not ( = ?auto_25894 ?auto_25926 ) ) ( not ( = ?auto_25895 ?auto_25899 ) ) ( not ( = ?auto_25895 ?auto_25926 ) ) ( not ( = ?auto_25896 ?auto_25899 ) ) ( not ( = ?auto_25896 ?auto_25926 ) ) ( not ( = ?auto_25897 ?auto_25899 ) ) ( not ( = ?auto_25897 ?auto_25926 ) ) ( not ( = ?auto_25899 ?auto_25937 ) ) ( not ( = ?auto_25899 ?auto_25909 ) ) ( not ( = ?auto_25899 ?auto_25917 ) ) ( not ( = ?auto_25899 ?auto_25929 ) ) ( not ( = ?auto_25899 ?auto_25936 ) ) ( not ( = ?auto_25899 ?auto_25935 ) ) ( not ( = ?auto_25899 ?auto_25933 ) ) ( not ( = ?auto_25899 ?auto_25920 ) ) ( not ( = ?auto_25899 ?auto_25931 ) ) ( not ( = ?auto_25899 ?auto_25919 ) ) ( not ( = ?auto_25910 ?auto_25913 ) ) ( not ( = ?auto_25910 ?auto_25923 ) ) ( not ( = ?auto_25910 ?auto_25911 ) ) ( not ( = ?auto_25910 ?auto_25921 ) ) ( not ( = ?auto_25910 ?auto_25927 ) ) ( not ( = ?auto_25910 ?auto_25906 ) ) ( not ( = ?auto_25910 ?auto_25925 ) ) ( not ( = ?auto_25910 ?auto_25912 ) ) ( not ( = ?auto_25910 ?auto_25922 ) ) ( not ( = ?auto_25934 ?auto_25908 ) ) ( not ( = ?auto_25934 ?auto_25918 ) ) ( not ( = ?auto_25934 ?auto_25915 ) ) ( not ( = ?auto_25934 ?auto_25914 ) ) ( not ( = ?auto_25934 ?auto_25932 ) ) ( not ( = ?auto_25934 ?auto_25905 ) ) ( not ( = ?auto_25934 ?auto_25930 ) ) ( not ( = ?auto_25934 ?auto_25924 ) ) ( not ( = ?auto_25934 ?auto_25916 ) ) ( not ( = ?auto_25926 ?auto_25937 ) ) ( not ( = ?auto_25926 ?auto_25909 ) ) ( not ( = ?auto_25926 ?auto_25917 ) ) ( not ( = ?auto_25926 ?auto_25929 ) ) ( not ( = ?auto_25926 ?auto_25936 ) ) ( not ( = ?auto_25926 ?auto_25935 ) ) ( not ( = ?auto_25926 ?auto_25933 ) ) ( not ( = ?auto_25926 ?auto_25920 ) ) ( not ( = ?auto_25926 ?auto_25931 ) ) ( not ( = ?auto_25926 ?auto_25919 ) ) ( not ( = ?auto_25888 ?auto_25900 ) ) ( not ( = ?auto_25888 ?auto_25928 ) ) ( not ( = ?auto_25889 ?auto_25900 ) ) ( not ( = ?auto_25889 ?auto_25928 ) ) ( not ( = ?auto_25890 ?auto_25900 ) ) ( not ( = ?auto_25890 ?auto_25928 ) ) ( not ( = ?auto_25891 ?auto_25900 ) ) ( not ( = ?auto_25891 ?auto_25928 ) ) ( not ( = ?auto_25892 ?auto_25900 ) ) ( not ( = ?auto_25892 ?auto_25928 ) ) ( not ( = ?auto_25893 ?auto_25900 ) ) ( not ( = ?auto_25893 ?auto_25928 ) ) ( not ( = ?auto_25894 ?auto_25900 ) ) ( not ( = ?auto_25894 ?auto_25928 ) ) ( not ( = ?auto_25895 ?auto_25900 ) ) ( not ( = ?auto_25895 ?auto_25928 ) ) ( not ( = ?auto_25896 ?auto_25900 ) ) ( not ( = ?auto_25896 ?auto_25928 ) ) ( not ( = ?auto_25897 ?auto_25900 ) ) ( not ( = ?auto_25897 ?auto_25928 ) ) ( not ( = ?auto_25898 ?auto_25900 ) ) ( not ( = ?auto_25898 ?auto_25928 ) ) ( not ( = ?auto_25900 ?auto_25926 ) ) ( not ( = ?auto_25900 ?auto_25937 ) ) ( not ( = ?auto_25900 ?auto_25909 ) ) ( not ( = ?auto_25900 ?auto_25917 ) ) ( not ( = ?auto_25900 ?auto_25929 ) ) ( not ( = ?auto_25900 ?auto_25936 ) ) ( not ( = ?auto_25900 ?auto_25935 ) ) ( not ( = ?auto_25900 ?auto_25933 ) ) ( not ( = ?auto_25900 ?auto_25920 ) ) ( not ( = ?auto_25900 ?auto_25931 ) ) ( not ( = ?auto_25900 ?auto_25919 ) ) ( not ( = ?auto_25928 ?auto_25926 ) ) ( not ( = ?auto_25928 ?auto_25937 ) ) ( not ( = ?auto_25928 ?auto_25909 ) ) ( not ( = ?auto_25928 ?auto_25917 ) ) ( not ( = ?auto_25928 ?auto_25929 ) ) ( not ( = ?auto_25928 ?auto_25936 ) ) ( not ( = ?auto_25928 ?auto_25935 ) ) ( not ( = ?auto_25928 ?auto_25933 ) ) ( not ( = ?auto_25928 ?auto_25920 ) ) ( not ( = ?auto_25928 ?auto_25931 ) ) ( not ( = ?auto_25928 ?auto_25919 ) ) ( not ( = ?auto_25888 ?auto_25901 ) ) ( not ( = ?auto_25888 ?auto_25902 ) ) ( not ( = ?auto_25889 ?auto_25901 ) ) ( not ( = ?auto_25889 ?auto_25902 ) ) ( not ( = ?auto_25890 ?auto_25901 ) ) ( not ( = ?auto_25890 ?auto_25902 ) ) ( not ( = ?auto_25891 ?auto_25901 ) ) ( not ( = ?auto_25891 ?auto_25902 ) ) ( not ( = ?auto_25892 ?auto_25901 ) ) ( not ( = ?auto_25892 ?auto_25902 ) ) ( not ( = ?auto_25893 ?auto_25901 ) ) ( not ( = ?auto_25893 ?auto_25902 ) ) ( not ( = ?auto_25894 ?auto_25901 ) ) ( not ( = ?auto_25894 ?auto_25902 ) ) ( not ( = ?auto_25895 ?auto_25901 ) ) ( not ( = ?auto_25895 ?auto_25902 ) ) ( not ( = ?auto_25896 ?auto_25901 ) ) ( not ( = ?auto_25896 ?auto_25902 ) ) ( not ( = ?auto_25897 ?auto_25901 ) ) ( not ( = ?auto_25897 ?auto_25902 ) ) ( not ( = ?auto_25898 ?auto_25901 ) ) ( not ( = ?auto_25898 ?auto_25902 ) ) ( not ( = ?auto_25899 ?auto_25901 ) ) ( not ( = ?auto_25899 ?auto_25902 ) ) ( not ( = ?auto_25901 ?auto_25928 ) ) ( not ( = ?auto_25901 ?auto_25926 ) ) ( not ( = ?auto_25901 ?auto_25937 ) ) ( not ( = ?auto_25901 ?auto_25909 ) ) ( not ( = ?auto_25901 ?auto_25917 ) ) ( not ( = ?auto_25901 ?auto_25929 ) ) ( not ( = ?auto_25901 ?auto_25936 ) ) ( not ( = ?auto_25901 ?auto_25935 ) ) ( not ( = ?auto_25901 ?auto_25933 ) ) ( not ( = ?auto_25901 ?auto_25920 ) ) ( not ( = ?auto_25901 ?auto_25931 ) ) ( not ( = ?auto_25901 ?auto_25919 ) ) ( not ( = ?auto_25902 ?auto_25928 ) ) ( not ( = ?auto_25902 ?auto_25926 ) ) ( not ( = ?auto_25902 ?auto_25937 ) ) ( not ( = ?auto_25902 ?auto_25909 ) ) ( not ( = ?auto_25902 ?auto_25917 ) ) ( not ( = ?auto_25902 ?auto_25929 ) ) ( not ( = ?auto_25902 ?auto_25936 ) ) ( not ( = ?auto_25902 ?auto_25935 ) ) ( not ( = ?auto_25902 ?auto_25933 ) ) ( not ( = ?auto_25902 ?auto_25920 ) ) ( not ( = ?auto_25902 ?auto_25931 ) ) ( not ( = ?auto_25902 ?auto_25919 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_25888 ?auto_25889 ?auto_25890 ?auto_25891 ?auto_25892 ?auto_25893 ?auto_25894 ?auto_25895 ?auto_25896 ?auto_25897 ?auto_25898 ?auto_25899 ?auto_25900 )
      ( MAKE-1CRATE ?auto_25900 ?auto_25901 )
      ( MAKE-13CRATE-VERIFY ?auto_25888 ?auto_25889 ?auto_25890 ?auto_25891 ?auto_25892 ?auto_25893 ?auto_25894 ?auto_25895 ?auto_25896 ?auto_25897 ?auto_25898 ?auto_25899 ?auto_25900 ?auto_25901 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_25963 - SURFACE
      ?auto_25964 - SURFACE
      ?auto_25965 - SURFACE
      ?auto_25966 - SURFACE
      ?auto_25967 - SURFACE
      ?auto_25968 - SURFACE
      ?auto_25969 - SURFACE
      ?auto_25970 - SURFACE
      ?auto_25971 - SURFACE
      ?auto_25972 - SURFACE
      ?auto_25973 - SURFACE
      ?auto_25974 - SURFACE
      ?auto_25975 - SURFACE
      ?auto_25976 - SURFACE
      ?auto_25977 - SURFACE
    )
    :vars
    (
      ?auto_25980 - HOIST
      ?auto_25979 - PLACE
      ?auto_25981 - PLACE
      ?auto_25978 - HOIST
      ?auto_25982 - SURFACE
      ?auto_25999 - PLACE
      ?auto_25995 - HOIST
      ?auto_26014 - SURFACE
      ?auto_25990 - PLACE
      ?auto_26013 - HOIST
      ?auto_25989 - SURFACE
      ?auto_25998 - PLACE
      ?auto_26005 - HOIST
      ?auto_26003 - SURFACE
      ?auto_26002 - SURFACE
      ?auto_26015 - PLACE
      ?auto_26016 - HOIST
      ?auto_25992 - SURFACE
      ?auto_25991 - PLACE
      ?auto_25985 - HOIST
      ?auto_25986 - SURFACE
      ?auto_25997 - PLACE
      ?auto_26007 - HOIST
      ?auto_26008 - SURFACE
      ?auto_26001 - PLACE
      ?auto_25988 - HOIST
      ?auto_26006 - SURFACE
      ?auto_26004 - SURFACE
      ?auto_26000 - PLACE
      ?auto_26012 - HOIST
      ?auto_25987 - SURFACE
      ?auto_25993 - PLACE
      ?auto_26009 - HOIST
      ?auto_26010 - SURFACE
      ?auto_26011 - PLACE
      ?auto_25996 - HOIST
      ?auto_25984 - SURFACE
      ?auto_25994 - SURFACE
      ?auto_25983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25980 ?auto_25979 ) ( IS-CRATE ?auto_25977 ) ( not ( = ?auto_25981 ?auto_25979 ) ) ( HOIST-AT ?auto_25978 ?auto_25981 ) ( AVAILABLE ?auto_25978 ) ( SURFACE-AT ?auto_25977 ?auto_25981 ) ( ON ?auto_25977 ?auto_25982 ) ( CLEAR ?auto_25977 ) ( not ( = ?auto_25976 ?auto_25977 ) ) ( not ( = ?auto_25976 ?auto_25982 ) ) ( not ( = ?auto_25977 ?auto_25982 ) ) ( not ( = ?auto_25980 ?auto_25978 ) ) ( IS-CRATE ?auto_25976 ) ( not ( = ?auto_25999 ?auto_25979 ) ) ( HOIST-AT ?auto_25995 ?auto_25999 ) ( SURFACE-AT ?auto_25976 ?auto_25999 ) ( ON ?auto_25976 ?auto_26014 ) ( CLEAR ?auto_25976 ) ( not ( = ?auto_25975 ?auto_25976 ) ) ( not ( = ?auto_25975 ?auto_26014 ) ) ( not ( = ?auto_25976 ?auto_26014 ) ) ( not ( = ?auto_25980 ?auto_25995 ) ) ( IS-CRATE ?auto_25975 ) ( not ( = ?auto_25990 ?auto_25979 ) ) ( HOIST-AT ?auto_26013 ?auto_25990 ) ( SURFACE-AT ?auto_25975 ?auto_25990 ) ( ON ?auto_25975 ?auto_25989 ) ( CLEAR ?auto_25975 ) ( not ( = ?auto_25974 ?auto_25975 ) ) ( not ( = ?auto_25974 ?auto_25989 ) ) ( not ( = ?auto_25975 ?auto_25989 ) ) ( not ( = ?auto_25980 ?auto_26013 ) ) ( IS-CRATE ?auto_25974 ) ( not ( = ?auto_25998 ?auto_25979 ) ) ( HOIST-AT ?auto_26005 ?auto_25998 ) ( AVAILABLE ?auto_26005 ) ( SURFACE-AT ?auto_25974 ?auto_25998 ) ( ON ?auto_25974 ?auto_26003 ) ( CLEAR ?auto_25974 ) ( not ( = ?auto_25973 ?auto_25974 ) ) ( not ( = ?auto_25973 ?auto_26003 ) ) ( not ( = ?auto_25974 ?auto_26003 ) ) ( not ( = ?auto_25980 ?auto_26005 ) ) ( IS-CRATE ?auto_25973 ) ( AVAILABLE ?auto_26013 ) ( SURFACE-AT ?auto_25973 ?auto_25990 ) ( ON ?auto_25973 ?auto_26002 ) ( CLEAR ?auto_25973 ) ( not ( = ?auto_25972 ?auto_25973 ) ) ( not ( = ?auto_25972 ?auto_26002 ) ) ( not ( = ?auto_25973 ?auto_26002 ) ) ( IS-CRATE ?auto_25972 ) ( not ( = ?auto_26015 ?auto_25979 ) ) ( HOIST-AT ?auto_26016 ?auto_26015 ) ( AVAILABLE ?auto_26016 ) ( SURFACE-AT ?auto_25972 ?auto_26015 ) ( ON ?auto_25972 ?auto_25992 ) ( CLEAR ?auto_25972 ) ( not ( = ?auto_25971 ?auto_25972 ) ) ( not ( = ?auto_25971 ?auto_25992 ) ) ( not ( = ?auto_25972 ?auto_25992 ) ) ( not ( = ?auto_25980 ?auto_26016 ) ) ( IS-CRATE ?auto_25971 ) ( not ( = ?auto_25991 ?auto_25979 ) ) ( HOIST-AT ?auto_25985 ?auto_25991 ) ( AVAILABLE ?auto_25985 ) ( SURFACE-AT ?auto_25971 ?auto_25991 ) ( ON ?auto_25971 ?auto_25986 ) ( CLEAR ?auto_25971 ) ( not ( = ?auto_25970 ?auto_25971 ) ) ( not ( = ?auto_25970 ?auto_25986 ) ) ( not ( = ?auto_25971 ?auto_25986 ) ) ( not ( = ?auto_25980 ?auto_25985 ) ) ( IS-CRATE ?auto_25970 ) ( not ( = ?auto_25997 ?auto_25979 ) ) ( HOIST-AT ?auto_26007 ?auto_25997 ) ( AVAILABLE ?auto_26007 ) ( SURFACE-AT ?auto_25970 ?auto_25997 ) ( ON ?auto_25970 ?auto_26008 ) ( CLEAR ?auto_25970 ) ( not ( = ?auto_25969 ?auto_25970 ) ) ( not ( = ?auto_25969 ?auto_26008 ) ) ( not ( = ?auto_25970 ?auto_26008 ) ) ( not ( = ?auto_25980 ?auto_26007 ) ) ( IS-CRATE ?auto_25969 ) ( not ( = ?auto_26001 ?auto_25979 ) ) ( HOIST-AT ?auto_25988 ?auto_26001 ) ( AVAILABLE ?auto_25988 ) ( SURFACE-AT ?auto_25969 ?auto_26001 ) ( ON ?auto_25969 ?auto_26006 ) ( CLEAR ?auto_25969 ) ( not ( = ?auto_25968 ?auto_25969 ) ) ( not ( = ?auto_25968 ?auto_26006 ) ) ( not ( = ?auto_25969 ?auto_26006 ) ) ( not ( = ?auto_25980 ?auto_25988 ) ) ( IS-CRATE ?auto_25968 ) ( AVAILABLE ?auto_25995 ) ( SURFACE-AT ?auto_25968 ?auto_25999 ) ( ON ?auto_25968 ?auto_26004 ) ( CLEAR ?auto_25968 ) ( not ( = ?auto_25967 ?auto_25968 ) ) ( not ( = ?auto_25967 ?auto_26004 ) ) ( not ( = ?auto_25968 ?auto_26004 ) ) ( IS-CRATE ?auto_25967 ) ( not ( = ?auto_26000 ?auto_25979 ) ) ( HOIST-AT ?auto_26012 ?auto_26000 ) ( SURFACE-AT ?auto_25967 ?auto_26000 ) ( ON ?auto_25967 ?auto_25987 ) ( CLEAR ?auto_25967 ) ( not ( = ?auto_25966 ?auto_25967 ) ) ( not ( = ?auto_25966 ?auto_25987 ) ) ( not ( = ?auto_25967 ?auto_25987 ) ) ( not ( = ?auto_25980 ?auto_26012 ) ) ( IS-CRATE ?auto_25966 ) ( not ( = ?auto_25993 ?auto_25979 ) ) ( HOIST-AT ?auto_26009 ?auto_25993 ) ( AVAILABLE ?auto_26009 ) ( SURFACE-AT ?auto_25966 ?auto_25993 ) ( ON ?auto_25966 ?auto_26010 ) ( CLEAR ?auto_25966 ) ( not ( = ?auto_25965 ?auto_25966 ) ) ( not ( = ?auto_25965 ?auto_26010 ) ) ( not ( = ?auto_25966 ?auto_26010 ) ) ( not ( = ?auto_25980 ?auto_26009 ) ) ( IS-CRATE ?auto_25965 ) ( not ( = ?auto_26011 ?auto_25979 ) ) ( HOIST-AT ?auto_25996 ?auto_26011 ) ( AVAILABLE ?auto_25996 ) ( SURFACE-AT ?auto_25965 ?auto_26011 ) ( ON ?auto_25965 ?auto_25984 ) ( CLEAR ?auto_25965 ) ( not ( = ?auto_25964 ?auto_25965 ) ) ( not ( = ?auto_25964 ?auto_25984 ) ) ( not ( = ?auto_25965 ?auto_25984 ) ) ( not ( = ?auto_25980 ?auto_25996 ) ) ( SURFACE-AT ?auto_25963 ?auto_25979 ) ( CLEAR ?auto_25963 ) ( IS-CRATE ?auto_25964 ) ( AVAILABLE ?auto_25980 ) ( AVAILABLE ?auto_26012 ) ( SURFACE-AT ?auto_25964 ?auto_26000 ) ( ON ?auto_25964 ?auto_25994 ) ( CLEAR ?auto_25964 ) ( TRUCK-AT ?auto_25983 ?auto_25979 ) ( not ( = ?auto_25963 ?auto_25964 ) ) ( not ( = ?auto_25963 ?auto_25994 ) ) ( not ( = ?auto_25964 ?auto_25994 ) ) ( not ( = ?auto_25963 ?auto_25965 ) ) ( not ( = ?auto_25963 ?auto_25984 ) ) ( not ( = ?auto_25965 ?auto_25994 ) ) ( not ( = ?auto_26011 ?auto_26000 ) ) ( not ( = ?auto_25996 ?auto_26012 ) ) ( not ( = ?auto_25984 ?auto_25994 ) ) ( not ( = ?auto_25963 ?auto_25966 ) ) ( not ( = ?auto_25963 ?auto_26010 ) ) ( not ( = ?auto_25964 ?auto_25966 ) ) ( not ( = ?auto_25964 ?auto_26010 ) ) ( not ( = ?auto_25966 ?auto_25984 ) ) ( not ( = ?auto_25966 ?auto_25994 ) ) ( not ( = ?auto_25993 ?auto_26011 ) ) ( not ( = ?auto_25993 ?auto_26000 ) ) ( not ( = ?auto_26009 ?auto_25996 ) ) ( not ( = ?auto_26009 ?auto_26012 ) ) ( not ( = ?auto_26010 ?auto_25984 ) ) ( not ( = ?auto_26010 ?auto_25994 ) ) ( not ( = ?auto_25963 ?auto_25967 ) ) ( not ( = ?auto_25963 ?auto_25987 ) ) ( not ( = ?auto_25964 ?auto_25967 ) ) ( not ( = ?auto_25964 ?auto_25987 ) ) ( not ( = ?auto_25965 ?auto_25967 ) ) ( not ( = ?auto_25965 ?auto_25987 ) ) ( not ( = ?auto_25967 ?auto_26010 ) ) ( not ( = ?auto_25967 ?auto_25984 ) ) ( not ( = ?auto_25967 ?auto_25994 ) ) ( not ( = ?auto_25987 ?auto_26010 ) ) ( not ( = ?auto_25987 ?auto_25984 ) ) ( not ( = ?auto_25987 ?auto_25994 ) ) ( not ( = ?auto_25963 ?auto_25968 ) ) ( not ( = ?auto_25963 ?auto_26004 ) ) ( not ( = ?auto_25964 ?auto_25968 ) ) ( not ( = ?auto_25964 ?auto_26004 ) ) ( not ( = ?auto_25965 ?auto_25968 ) ) ( not ( = ?auto_25965 ?auto_26004 ) ) ( not ( = ?auto_25966 ?auto_25968 ) ) ( not ( = ?auto_25966 ?auto_26004 ) ) ( not ( = ?auto_25968 ?auto_25987 ) ) ( not ( = ?auto_25968 ?auto_26010 ) ) ( not ( = ?auto_25968 ?auto_25984 ) ) ( not ( = ?auto_25968 ?auto_25994 ) ) ( not ( = ?auto_25999 ?auto_26000 ) ) ( not ( = ?auto_25999 ?auto_25993 ) ) ( not ( = ?auto_25999 ?auto_26011 ) ) ( not ( = ?auto_25995 ?auto_26012 ) ) ( not ( = ?auto_25995 ?auto_26009 ) ) ( not ( = ?auto_25995 ?auto_25996 ) ) ( not ( = ?auto_26004 ?auto_25987 ) ) ( not ( = ?auto_26004 ?auto_26010 ) ) ( not ( = ?auto_26004 ?auto_25984 ) ) ( not ( = ?auto_26004 ?auto_25994 ) ) ( not ( = ?auto_25963 ?auto_25969 ) ) ( not ( = ?auto_25963 ?auto_26006 ) ) ( not ( = ?auto_25964 ?auto_25969 ) ) ( not ( = ?auto_25964 ?auto_26006 ) ) ( not ( = ?auto_25965 ?auto_25969 ) ) ( not ( = ?auto_25965 ?auto_26006 ) ) ( not ( = ?auto_25966 ?auto_25969 ) ) ( not ( = ?auto_25966 ?auto_26006 ) ) ( not ( = ?auto_25967 ?auto_25969 ) ) ( not ( = ?auto_25967 ?auto_26006 ) ) ( not ( = ?auto_25969 ?auto_26004 ) ) ( not ( = ?auto_25969 ?auto_25987 ) ) ( not ( = ?auto_25969 ?auto_26010 ) ) ( not ( = ?auto_25969 ?auto_25984 ) ) ( not ( = ?auto_25969 ?auto_25994 ) ) ( not ( = ?auto_26001 ?auto_25999 ) ) ( not ( = ?auto_26001 ?auto_26000 ) ) ( not ( = ?auto_26001 ?auto_25993 ) ) ( not ( = ?auto_26001 ?auto_26011 ) ) ( not ( = ?auto_25988 ?auto_25995 ) ) ( not ( = ?auto_25988 ?auto_26012 ) ) ( not ( = ?auto_25988 ?auto_26009 ) ) ( not ( = ?auto_25988 ?auto_25996 ) ) ( not ( = ?auto_26006 ?auto_26004 ) ) ( not ( = ?auto_26006 ?auto_25987 ) ) ( not ( = ?auto_26006 ?auto_26010 ) ) ( not ( = ?auto_26006 ?auto_25984 ) ) ( not ( = ?auto_26006 ?auto_25994 ) ) ( not ( = ?auto_25963 ?auto_25970 ) ) ( not ( = ?auto_25963 ?auto_26008 ) ) ( not ( = ?auto_25964 ?auto_25970 ) ) ( not ( = ?auto_25964 ?auto_26008 ) ) ( not ( = ?auto_25965 ?auto_25970 ) ) ( not ( = ?auto_25965 ?auto_26008 ) ) ( not ( = ?auto_25966 ?auto_25970 ) ) ( not ( = ?auto_25966 ?auto_26008 ) ) ( not ( = ?auto_25967 ?auto_25970 ) ) ( not ( = ?auto_25967 ?auto_26008 ) ) ( not ( = ?auto_25968 ?auto_25970 ) ) ( not ( = ?auto_25968 ?auto_26008 ) ) ( not ( = ?auto_25970 ?auto_26006 ) ) ( not ( = ?auto_25970 ?auto_26004 ) ) ( not ( = ?auto_25970 ?auto_25987 ) ) ( not ( = ?auto_25970 ?auto_26010 ) ) ( not ( = ?auto_25970 ?auto_25984 ) ) ( not ( = ?auto_25970 ?auto_25994 ) ) ( not ( = ?auto_25997 ?auto_26001 ) ) ( not ( = ?auto_25997 ?auto_25999 ) ) ( not ( = ?auto_25997 ?auto_26000 ) ) ( not ( = ?auto_25997 ?auto_25993 ) ) ( not ( = ?auto_25997 ?auto_26011 ) ) ( not ( = ?auto_26007 ?auto_25988 ) ) ( not ( = ?auto_26007 ?auto_25995 ) ) ( not ( = ?auto_26007 ?auto_26012 ) ) ( not ( = ?auto_26007 ?auto_26009 ) ) ( not ( = ?auto_26007 ?auto_25996 ) ) ( not ( = ?auto_26008 ?auto_26006 ) ) ( not ( = ?auto_26008 ?auto_26004 ) ) ( not ( = ?auto_26008 ?auto_25987 ) ) ( not ( = ?auto_26008 ?auto_26010 ) ) ( not ( = ?auto_26008 ?auto_25984 ) ) ( not ( = ?auto_26008 ?auto_25994 ) ) ( not ( = ?auto_25963 ?auto_25971 ) ) ( not ( = ?auto_25963 ?auto_25986 ) ) ( not ( = ?auto_25964 ?auto_25971 ) ) ( not ( = ?auto_25964 ?auto_25986 ) ) ( not ( = ?auto_25965 ?auto_25971 ) ) ( not ( = ?auto_25965 ?auto_25986 ) ) ( not ( = ?auto_25966 ?auto_25971 ) ) ( not ( = ?auto_25966 ?auto_25986 ) ) ( not ( = ?auto_25967 ?auto_25971 ) ) ( not ( = ?auto_25967 ?auto_25986 ) ) ( not ( = ?auto_25968 ?auto_25971 ) ) ( not ( = ?auto_25968 ?auto_25986 ) ) ( not ( = ?auto_25969 ?auto_25971 ) ) ( not ( = ?auto_25969 ?auto_25986 ) ) ( not ( = ?auto_25971 ?auto_26008 ) ) ( not ( = ?auto_25971 ?auto_26006 ) ) ( not ( = ?auto_25971 ?auto_26004 ) ) ( not ( = ?auto_25971 ?auto_25987 ) ) ( not ( = ?auto_25971 ?auto_26010 ) ) ( not ( = ?auto_25971 ?auto_25984 ) ) ( not ( = ?auto_25971 ?auto_25994 ) ) ( not ( = ?auto_25991 ?auto_25997 ) ) ( not ( = ?auto_25991 ?auto_26001 ) ) ( not ( = ?auto_25991 ?auto_25999 ) ) ( not ( = ?auto_25991 ?auto_26000 ) ) ( not ( = ?auto_25991 ?auto_25993 ) ) ( not ( = ?auto_25991 ?auto_26011 ) ) ( not ( = ?auto_25985 ?auto_26007 ) ) ( not ( = ?auto_25985 ?auto_25988 ) ) ( not ( = ?auto_25985 ?auto_25995 ) ) ( not ( = ?auto_25985 ?auto_26012 ) ) ( not ( = ?auto_25985 ?auto_26009 ) ) ( not ( = ?auto_25985 ?auto_25996 ) ) ( not ( = ?auto_25986 ?auto_26008 ) ) ( not ( = ?auto_25986 ?auto_26006 ) ) ( not ( = ?auto_25986 ?auto_26004 ) ) ( not ( = ?auto_25986 ?auto_25987 ) ) ( not ( = ?auto_25986 ?auto_26010 ) ) ( not ( = ?auto_25986 ?auto_25984 ) ) ( not ( = ?auto_25986 ?auto_25994 ) ) ( not ( = ?auto_25963 ?auto_25972 ) ) ( not ( = ?auto_25963 ?auto_25992 ) ) ( not ( = ?auto_25964 ?auto_25972 ) ) ( not ( = ?auto_25964 ?auto_25992 ) ) ( not ( = ?auto_25965 ?auto_25972 ) ) ( not ( = ?auto_25965 ?auto_25992 ) ) ( not ( = ?auto_25966 ?auto_25972 ) ) ( not ( = ?auto_25966 ?auto_25992 ) ) ( not ( = ?auto_25967 ?auto_25972 ) ) ( not ( = ?auto_25967 ?auto_25992 ) ) ( not ( = ?auto_25968 ?auto_25972 ) ) ( not ( = ?auto_25968 ?auto_25992 ) ) ( not ( = ?auto_25969 ?auto_25972 ) ) ( not ( = ?auto_25969 ?auto_25992 ) ) ( not ( = ?auto_25970 ?auto_25972 ) ) ( not ( = ?auto_25970 ?auto_25992 ) ) ( not ( = ?auto_25972 ?auto_25986 ) ) ( not ( = ?auto_25972 ?auto_26008 ) ) ( not ( = ?auto_25972 ?auto_26006 ) ) ( not ( = ?auto_25972 ?auto_26004 ) ) ( not ( = ?auto_25972 ?auto_25987 ) ) ( not ( = ?auto_25972 ?auto_26010 ) ) ( not ( = ?auto_25972 ?auto_25984 ) ) ( not ( = ?auto_25972 ?auto_25994 ) ) ( not ( = ?auto_26015 ?auto_25991 ) ) ( not ( = ?auto_26015 ?auto_25997 ) ) ( not ( = ?auto_26015 ?auto_26001 ) ) ( not ( = ?auto_26015 ?auto_25999 ) ) ( not ( = ?auto_26015 ?auto_26000 ) ) ( not ( = ?auto_26015 ?auto_25993 ) ) ( not ( = ?auto_26015 ?auto_26011 ) ) ( not ( = ?auto_26016 ?auto_25985 ) ) ( not ( = ?auto_26016 ?auto_26007 ) ) ( not ( = ?auto_26016 ?auto_25988 ) ) ( not ( = ?auto_26016 ?auto_25995 ) ) ( not ( = ?auto_26016 ?auto_26012 ) ) ( not ( = ?auto_26016 ?auto_26009 ) ) ( not ( = ?auto_26016 ?auto_25996 ) ) ( not ( = ?auto_25992 ?auto_25986 ) ) ( not ( = ?auto_25992 ?auto_26008 ) ) ( not ( = ?auto_25992 ?auto_26006 ) ) ( not ( = ?auto_25992 ?auto_26004 ) ) ( not ( = ?auto_25992 ?auto_25987 ) ) ( not ( = ?auto_25992 ?auto_26010 ) ) ( not ( = ?auto_25992 ?auto_25984 ) ) ( not ( = ?auto_25992 ?auto_25994 ) ) ( not ( = ?auto_25963 ?auto_25973 ) ) ( not ( = ?auto_25963 ?auto_26002 ) ) ( not ( = ?auto_25964 ?auto_25973 ) ) ( not ( = ?auto_25964 ?auto_26002 ) ) ( not ( = ?auto_25965 ?auto_25973 ) ) ( not ( = ?auto_25965 ?auto_26002 ) ) ( not ( = ?auto_25966 ?auto_25973 ) ) ( not ( = ?auto_25966 ?auto_26002 ) ) ( not ( = ?auto_25967 ?auto_25973 ) ) ( not ( = ?auto_25967 ?auto_26002 ) ) ( not ( = ?auto_25968 ?auto_25973 ) ) ( not ( = ?auto_25968 ?auto_26002 ) ) ( not ( = ?auto_25969 ?auto_25973 ) ) ( not ( = ?auto_25969 ?auto_26002 ) ) ( not ( = ?auto_25970 ?auto_25973 ) ) ( not ( = ?auto_25970 ?auto_26002 ) ) ( not ( = ?auto_25971 ?auto_25973 ) ) ( not ( = ?auto_25971 ?auto_26002 ) ) ( not ( = ?auto_25973 ?auto_25992 ) ) ( not ( = ?auto_25973 ?auto_25986 ) ) ( not ( = ?auto_25973 ?auto_26008 ) ) ( not ( = ?auto_25973 ?auto_26006 ) ) ( not ( = ?auto_25973 ?auto_26004 ) ) ( not ( = ?auto_25973 ?auto_25987 ) ) ( not ( = ?auto_25973 ?auto_26010 ) ) ( not ( = ?auto_25973 ?auto_25984 ) ) ( not ( = ?auto_25973 ?auto_25994 ) ) ( not ( = ?auto_25990 ?auto_26015 ) ) ( not ( = ?auto_25990 ?auto_25991 ) ) ( not ( = ?auto_25990 ?auto_25997 ) ) ( not ( = ?auto_25990 ?auto_26001 ) ) ( not ( = ?auto_25990 ?auto_25999 ) ) ( not ( = ?auto_25990 ?auto_26000 ) ) ( not ( = ?auto_25990 ?auto_25993 ) ) ( not ( = ?auto_25990 ?auto_26011 ) ) ( not ( = ?auto_26013 ?auto_26016 ) ) ( not ( = ?auto_26013 ?auto_25985 ) ) ( not ( = ?auto_26013 ?auto_26007 ) ) ( not ( = ?auto_26013 ?auto_25988 ) ) ( not ( = ?auto_26013 ?auto_25995 ) ) ( not ( = ?auto_26013 ?auto_26012 ) ) ( not ( = ?auto_26013 ?auto_26009 ) ) ( not ( = ?auto_26013 ?auto_25996 ) ) ( not ( = ?auto_26002 ?auto_25992 ) ) ( not ( = ?auto_26002 ?auto_25986 ) ) ( not ( = ?auto_26002 ?auto_26008 ) ) ( not ( = ?auto_26002 ?auto_26006 ) ) ( not ( = ?auto_26002 ?auto_26004 ) ) ( not ( = ?auto_26002 ?auto_25987 ) ) ( not ( = ?auto_26002 ?auto_26010 ) ) ( not ( = ?auto_26002 ?auto_25984 ) ) ( not ( = ?auto_26002 ?auto_25994 ) ) ( not ( = ?auto_25963 ?auto_25974 ) ) ( not ( = ?auto_25963 ?auto_26003 ) ) ( not ( = ?auto_25964 ?auto_25974 ) ) ( not ( = ?auto_25964 ?auto_26003 ) ) ( not ( = ?auto_25965 ?auto_25974 ) ) ( not ( = ?auto_25965 ?auto_26003 ) ) ( not ( = ?auto_25966 ?auto_25974 ) ) ( not ( = ?auto_25966 ?auto_26003 ) ) ( not ( = ?auto_25967 ?auto_25974 ) ) ( not ( = ?auto_25967 ?auto_26003 ) ) ( not ( = ?auto_25968 ?auto_25974 ) ) ( not ( = ?auto_25968 ?auto_26003 ) ) ( not ( = ?auto_25969 ?auto_25974 ) ) ( not ( = ?auto_25969 ?auto_26003 ) ) ( not ( = ?auto_25970 ?auto_25974 ) ) ( not ( = ?auto_25970 ?auto_26003 ) ) ( not ( = ?auto_25971 ?auto_25974 ) ) ( not ( = ?auto_25971 ?auto_26003 ) ) ( not ( = ?auto_25972 ?auto_25974 ) ) ( not ( = ?auto_25972 ?auto_26003 ) ) ( not ( = ?auto_25974 ?auto_26002 ) ) ( not ( = ?auto_25974 ?auto_25992 ) ) ( not ( = ?auto_25974 ?auto_25986 ) ) ( not ( = ?auto_25974 ?auto_26008 ) ) ( not ( = ?auto_25974 ?auto_26006 ) ) ( not ( = ?auto_25974 ?auto_26004 ) ) ( not ( = ?auto_25974 ?auto_25987 ) ) ( not ( = ?auto_25974 ?auto_26010 ) ) ( not ( = ?auto_25974 ?auto_25984 ) ) ( not ( = ?auto_25974 ?auto_25994 ) ) ( not ( = ?auto_25998 ?auto_25990 ) ) ( not ( = ?auto_25998 ?auto_26015 ) ) ( not ( = ?auto_25998 ?auto_25991 ) ) ( not ( = ?auto_25998 ?auto_25997 ) ) ( not ( = ?auto_25998 ?auto_26001 ) ) ( not ( = ?auto_25998 ?auto_25999 ) ) ( not ( = ?auto_25998 ?auto_26000 ) ) ( not ( = ?auto_25998 ?auto_25993 ) ) ( not ( = ?auto_25998 ?auto_26011 ) ) ( not ( = ?auto_26005 ?auto_26013 ) ) ( not ( = ?auto_26005 ?auto_26016 ) ) ( not ( = ?auto_26005 ?auto_25985 ) ) ( not ( = ?auto_26005 ?auto_26007 ) ) ( not ( = ?auto_26005 ?auto_25988 ) ) ( not ( = ?auto_26005 ?auto_25995 ) ) ( not ( = ?auto_26005 ?auto_26012 ) ) ( not ( = ?auto_26005 ?auto_26009 ) ) ( not ( = ?auto_26005 ?auto_25996 ) ) ( not ( = ?auto_26003 ?auto_26002 ) ) ( not ( = ?auto_26003 ?auto_25992 ) ) ( not ( = ?auto_26003 ?auto_25986 ) ) ( not ( = ?auto_26003 ?auto_26008 ) ) ( not ( = ?auto_26003 ?auto_26006 ) ) ( not ( = ?auto_26003 ?auto_26004 ) ) ( not ( = ?auto_26003 ?auto_25987 ) ) ( not ( = ?auto_26003 ?auto_26010 ) ) ( not ( = ?auto_26003 ?auto_25984 ) ) ( not ( = ?auto_26003 ?auto_25994 ) ) ( not ( = ?auto_25963 ?auto_25975 ) ) ( not ( = ?auto_25963 ?auto_25989 ) ) ( not ( = ?auto_25964 ?auto_25975 ) ) ( not ( = ?auto_25964 ?auto_25989 ) ) ( not ( = ?auto_25965 ?auto_25975 ) ) ( not ( = ?auto_25965 ?auto_25989 ) ) ( not ( = ?auto_25966 ?auto_25975 ) ) ( not ( = ?auto_25966 ?auto_25989 ) ) ( not ( = ?auto_25967 ?auto_25975 ) ) ( not ( = ?auto_25967 ?auto_25989 ) ) ( not ( = ?auto_25968 ?auto_25975 ) ) ( not ( = ?auto_25968 ?auto_25989 ) ) ( not ( = ?auto_25969 ?auto_25975 ) ) ( not ( = ?auto_25969 ?auto_25989 ) ) ( not ( = ?auto_25970 ?auto_25975 ) ) ( not ( = ?auto_25970 ?auto_25989 ) ) ( not ( = ?auto_25971 ?auto_25975 ) ) ( not ( = ?auto_25971 ?auto_25989 ) ) ( not ( = ?auto_25972 ?auto_25975 ) ) ( not ( = ?auto_25972 ?auto_25989 ) ) ( not ( = ?auto_25973 ?auto_25975 ) ) ( not ( = ?auto_25973 ?auto_25989 ) ) ( not ( = ?auto_25975 ?auto_26003 ) ) ( not ( = ?auto_25975 ?auto_26002 ) ) ( not ( = ?auto_25975 ?auto_25992 ) ) ( not ( = ?auto_25975 ?auto_25986 ) ) ( not ( = ?auto_25975 ?auto_26008 ) ) ( not ( = ?auto_25975 ?auto_26006 ) ) ( not ( = ?auto_25975 ?auto_26004 ) ) ( not ( = ?auto_25975 ?auto_25987 ) ) ( not ( = ?auto_25975 ?auto_26010 ) ) ( not ( = ?auto_25975 ?auto_25984 ) ) ( not ( = ?auto_25975 ?auto_25994 ) ) ( not ( = ?auto_25989 ?auto_26003 ) ) ( not ( = ?auto_25989 ?auto_26002 ) ) ( not ( = ?auto_25989 ?auto_25992 ) ) ( not ( = ?auto_25989 ?auto_25986 ) ) ( not ( = ?auto_25989 ?auto_26008 ) ) ( not ( = ?auto_25989 ?auto_26006 ) ) ( not ( = ?auto_25989 ?auto_26004 ) ) ( not ( = ?auto_25989 ?auto_25987 ) ) ( not ( = ?auto_25989 ?auto_26010 ) ) ( not ( = ?auto_25989 ?auto_25984 ) ) ( not ( = ?auto_25989 ?auto_25994 ) ) ( not ( = ?auto_25963 ?auto_25976 ) ) ( not ( = ?auto_25963 ?auto_26014 ) ) ( not ( = ?auto_25964 ?auto_25976 ) ) ( not ( = ?auto_25964 ?auto_26014 ) ) ( not ( = ?auto_25965 ?auto_25976 ) ) ( not ( = ?auto_25965 ?auto_26014 ) ) ( not ( = ?auto_25966 ?auto_25976 ) ) ( not ( = ?auto_25966 ?auto_26014 ) ) ( not ( = ?auto_25967 ?auto_25976 ) ) ( not ( = ?auto_25967 ?auto_26014 ) ) ( not ( = ?auto_25968 ?auto_25976 ) ) ( not ( = ?auto_25968 ?auto_26014 ) ) ( not ( = ?auto_25969 ?auto_25976 ) ) ( not ( = ?auto_25969 ?auto_26014 ) ) ( not ( = ?auto_25970 ?auto_25976 ) ) ( not ( = ?auto_25970 ?auto_26014 ) ) ( not ( = ?auto_25971 ?auto_25976 ) ) ( not ( = ?auto_25971 ?auto_26014 ) ) ( not ( = ?auto_25972 ?auto_25976 ) ) ( not ( = ?auto_25972 ?auto_26014 ) ) ( not ( = ?auto_25973 ?auto_25976 ) ) ( not ( = ?auto_25973 ?auto_26014 ) ) ( not ( = ?auto_25974 ?auto_25976 ) ) ( not ( = ?auto_25974 ?auto_26014 ) ) ( not ( = ?auto_25976 ?auto_25989 ) ) ( not ( = ?auto_25976 ?auto_26003 ) ) ( not ( = ?auto_25976 ?auto_26002 ) ) ( not ( = ?auto_25976 ?auto_25992 ) ) ( not ( = ?auto_25976 ?auto_25986 ) ) ( not ( = ?auto_25976 ?auto_26008 ) ) ( not ( = ?auto_25976 ?auto_26006 ) ) ( not ( = ?auto_25976 ?auto_26004 ) ) ( not ( = ?auto_25976 ?auto_25987 ) ) ( not ( = ?auto_25976 ?auto_26010 ) ) ( not ( = ?auto_25976 ?auto_25984 ) ) ( not ( = ?auto_25976 ?auto_25994 ) ) ( not ( = ?auto_26014 ?auto_25989 ) ) ( not ( = ?auto_26014 ?auto_26003 ) ) ( not ( = ?auto_26014 ?auto_26002 ) ) ( not ( = ?auto_26014 ?auto_25992 ) ) ( not ( = ?auto_26014 ?auto_25986 ) ) ( not ( = ?auto_26014 ?auto_26008 ) ) ( not ( = ?auto_26014 ?auto_26006 ) ) ( not ( = ?auto_26014 ?auto_26004 ) ) ( not ( = ?auto_26014 ?auto_25987 ) ) ( not ( = ?auto_26014 ?auto_26010 ) ) ( not ( = ?auto_26014 ?auto_25984 ) ) ( not ( = ?auto_26014 ?auto_25994 ) ) ( not ( = ?auto_25963 ?auto_25977 ) ) ( not ( = ?auto_25963 ?auto_25982 ) ) ( not ( = ?auto_25964 ?auto_25977 ) ) ( not ( = ?auto_25964 ?auto_25982 ) ) ( not ( = ?auto_25965 ?auto_25977 ) ) ( not ( = ?auto_25965 ?auto_25982 ) ) ( not ( = ?auto_25966 ?auto_25977 ) ) ( not ( = ?auto_25966 ?auto_25982 ) ) ( not ( = ?auto_25967 ?auto_25977 ) ) ( not ( = ?auto_25967 ?auto_25982 ) ) ( not ( = ?auto_25968 ?auto_25977 ) ) ( not ( = ?auto_25968 ?auto_25982 ) ) ( not ( = ?auto_25969 ?auto_25977 ) ) ( not ( = ?auto_25969 ?auto_25982 ) ) ( not ( = ?auto_25970 ?auto_25977 ) ) ( not ( = ?auto_25970 ?auto_25982 ) ) ( not ( = ?auto_25971 ?auto_25977 ) ) ( not ( = ?auto_25971 ?auto_25982 ) ) ( not ( = ?auto_25972 ?auto_25977 ) ) ( not ( = ?auto_25972 ?auto_25982 ) ) ( not ( = ?auto_25973 ?auto_25977 ) ) ( not ( = ?auto_25973 ?auto_25982 ) ) ( not ( = ?auto_25974 ?auto_25977 ) ) ( not ( = ?auto_25974 ?auto_25982 ) ) ( not ( = ?auto_25975 ?auto_25977 ) ) ( not ( = ?auto_25975 ?auto_25982 ) ) ( not ( = ?auto_25977 ?auto_26014 ) ) ( not ( = ?auto_25977 ?auto_25989 ) ) ( not ( = ?auto_25977 ?auto_26003 ) ) ( not ( = ?auto_25977 ?auto_26002 ) ) ( not ( = ?auto_25977 ?auto_25992 ) ) ( not ( = ?auto_25977 ?auto_25986 ) ) ( not ( = ?auto_25977 ?auto_26008 ) ) ( not ( = ?auto_25977 ?auto_26006 ) ) ( not ( = ?auto_25977 ?auto_26004 ) ) ( not ( = ?auto_25977 ?auto_25987 ) ) ( not ( = ?auto_25977 ?auto_26010 ) ) ( not ( = ?auto_25977 ?auto_25984 ) ) ( not ( = ?auto_25977 ?auto_25994 ) ) ( not ( = ?auto_25981 ?auto_25999 ) ) ( not ( = ?auto_25981 ?auto_25990 ) ) ( not ( = ?auto_25981 ?auto_25998 ) ) ( not ( = ?auto_25981 ?auto_26015 ) ) ( not ( = ?auto_25981 ?auto_25991 ) ) ( not ( = ?auto_25981 ?auto_25997 ) ) ( not ( = ?auto_25981 ?auto_26001 ) ) ( not ( = ?auto_25981 ?auto_26000 ) ) ( not ( = ?auto_25981 ?auto_25993 ) ) ( not ( = ?auto_25981 ?auto_26011 ) ) ( not ( = ?auto_25978 ?auto_25995 ) ) ( not ( = ?auto_25978 ?auto_26013 ) ) ( not ( = ?auto_25978 ?auto_26005 ) ) ( not ( = ?auto_25978 ?auto_26016 ) ) ( not ( = ?auto_25978 ?auto_25985 ) ) ( not ( = ?auto_25978 ?auto_26007 ) ) ( not ( = ?auto_25978 ?auto_25988 ) ) ( not ( = ?auto_25978 ?auto_26012 ) ) ( not ( = ?auto_25978 ?auto_26009 ) ) ( not ( = ?auto_25978 ?auto_25996 ) ) ( not ( = ?auto_25982 ?auto_26014 ) ) ( not ( = ?auto_25982 ?auto_25989 ) ) ( not ( = ?auto_25982 ?auto_26003 ) ) ( not ( = ?auto_25982 ?auto_26002 ) ) ( not ( = ?auto_25982 ?auto_25992 ) ) ( not ( = ?auto_25982 ?auto_25986 ) ) ( not ( = ?auto_25982 ?auto_26008 ) ) ( not ( = ?auto_25982 ?auto_26006 ) ) ( not ( = ?auto_25982 ?auto_26004 ) ) ( not ( = ?auto_25982 ?auto_25987 ) ) ( not ( = ?auto_25982 ?auto_26010 ) ) ( not ( = ?auto_25982 ?auto_25984 ) ) ( not ( = ?auto_25982 ?auto_25994 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_25963 ?auto_25964 ?auto_25965 ?auto_25966 ?auto_25967 ?auto_25968 ?auto_25969 ?auto_25970 ?auto_25971 ?auto_25972 ?auto_25973 ?auto_25974 ?auto_25975 ?auto_25976 )
      ( MAKE-1CRATE ?auto_25976 ?auto_25977 )
      ( MAKE-14CRATE-VERIFY ?auto_25963 ?auto_25964 ?auto_25965 ?auto_25966 ?auto_25967 ?auto_25968 ?auto_25969 ?auto_25970 ?auto_25971 ?auto_25972 ?auto_25973 ?auto_25974 ?auto_25975 ?auto_25976 ?auto_25977 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_26043 - SURFACE
      ?auto_26044 - SURFACE
      ?auto_26045 - SURFACE
      ?auto_26046 - SURFACE
      ?auto_26047 - SURFACE
      ?auto_26048 - SURFACE
      ?auto_26049 - SURFACE
      ?auto_26050 - SURFACE
      ?auto_26051 - SURFACE
      ?auto_26052 - SURFACE
      ?auto_26053 - SURFACE
      ?auto_26054 - SURFACE
      ?auto_26055 - SURFACE
      ?auto_26056 - SURFACE
      ?auto_26057 - SURFACE
      ?auto_26058 - SURFACE
    )
    :vars
    (
      ?auto_26064 - HOIST
      ?auto_26061 - PLACE
      ?auto_26062 - PLACE
      ?auto_26063 - HOIST
      ?auto_26060 - SURFACE
      ?auto_26080 - PLACE
      ?auto_26083 - HOIST
      ?auto_26072 - SURFACE
      ?auto_26095 - PLACE
      ?auto_26094 - HOIST
      ?auto_26098 - SURFACE
      ?auto_26075 - PLACE
      ?auto_26097 - HOIST
      ?auto_26092 - SURFACE
      ?auto_26066 - PLACE
      ?auto_26067 - HOIST
      ?auto_26089 - SURFACE
      ?auto_26074 - SURFACE
      ?auto_26085 - PLACE
      ?auto_26099 - HOIST
      ?auto_26070 - SURFACE
      ?auto_26088 - PLACE
      ?auto_26090 - HOIST
      ?auto_26086 - SURFACE
      ?auto_26081 - PLACE
      ?auto_26069 - HOIST
      ?auto_26077 - SURFACE
      ?auto_26079 - PLACE
      ?auto_26093 - HOIST
      ?auto_26082 - SURFACE
      ?auto_26100 - SURFACE
      ?auto_26087 - PLACE
      ?auto_26084 - HOIST
      ?auto_26065 - SURFACE
      ?auto_26071 - PLACE
      ?auto_26091 - HOIST
      ?auto_26096 - SURFACE
      ?auto_26078 - PLACE
      ?auto_26076 - HOIST
      ?auto_26073 - SURFACE
      ?auto_26068 - SURFACE
      ?auto_26059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26064 ?auto_26061 ) ( IS-CRATE ?auto_26058 ) ( not ( = ?auto_26062 ?auto_26061 ) ) ( HOIST-AT ?auto_26063 ?auto_26062 ) ( AVAILABLE ?auto_26063 ) ( SURFACE-AT ?auto_26058 ?auto_26062 ) ( ON ?auto_26058 ?auto_26060 ) ( CLEAR ?auto_26058 ) ( not ( = ?auto_26057 ?auto_26058 ) ) ( not ( = ?auto_26057 ?auto_26060 ) ) ( not ( = ?auto_26058 ?auto_26060 ) ) ( not ( = ?auto_26064 ?auto_26063 ) ) ( IS-CRATE ?auto_26057 ) ( not ( = ?auto_26080 ?auto_26061 ) ) ( HOIST-AT ?auto_26083 ?auto_26080 ) ( AVAILABLE ?auto_26083 ) ( SURFACE-AT ?auto_26057 ?auto_26080 ) ( ON ?auto_26057 ?auto_26072 ) ( CLEAR ?auto_26057 ) ( not ( = ?auto_26056 ?auto_26057 ) ) ( not ( = ?auto_26056 ?auto_26072 ) ) ( not ( = ?auto_26057 ?auto_26072 ) ) ( not ( = ?auto_26064 ?auto_26083 ) ) ( IS-CRATE ?auto_26056 ) ( not ( = ?auto_26095 ?auto_26061 ) ) ( HOIST-AT ?auto_26094 ?auto_26095 ) ( SURFACE-AT ?auto_26056 ?auto_26095 ) ( ON ?auto_26056 ?auto_26098 ) ( CLEAR ?auto_26056 ) ( not ( = ?auto_26055 ?auto_26056 ) ) ( not ( = ?auto_26055 ?auto_26098 ) ) ( not ( = ?auto_26056 ?auto_26098 ) ) ( not ( = ?auto_26064 ?auto_26094 ) ) ( IS-CRATE ?auto_26055 ) ( not ( = ?auto_26075 ?auto_26061 ) ) ( HOIST-AT ?auto_26097 ?auto_26075 ) ( SURFACE-AT ?auto_26055 ?auto_26075 ) ( ON ?auto_26055 ?auto_26092 ) ( CLEAR ?auto_26055 ) ( not ( = ?auto_26054 ?auto_26055 ) ) ( not ( = ?auto_26054 ?auto_26092 ) ) ( not ( = ?auto_26055 ?auto_26092 ) ) ( not ( = ?auto_26064 ?auto_26097 ) ) ( IS-CRATE ?auto_26054 ) ( not ( = ?auto_26066 ?auto_26061 ) ) ( HOIST-AT ?auto_26067 ?auto_26066 ) ( AVAILABLE ?auto_26067 ) ( SURFACE-AT ?auto_26054 ?auto_26066 ) ( ON ?auto_26054 ?auto_26089 ) ( CLEAR ?auto_26054 ) ( not ( = ?auto_26053 ?auto_26054 ) ) ( not ( = ?auto_26053 ?auto_26089 ) ) ( not ( = ?auto_26054 ?auto_26089 ) ) ( not ( = ?auto_26064 ?auto_26067 ) ) ( IS-CRATE ?auto_26053 ) ( AVAILABLE ?auto_26097 ) ( SURFACE-AT ?auto_26053 ?auto_26075 ) ( ON ?auto_26053 ?auto_26074 ) ( CLEAR ?auto_26053 ) ( not ( = ?auto_26052 ?auto_26053 ) ) ( not ( = ?auto_26052 ?auto_26074 ) ) ( not ( = ?auto_26053 ?auto_26074 ) ) ( IS-CRATE ?auto_26052 ) ( not ( = ?auto_26085 ?auto_26061 ) ) ( HOIST-AT ?auto_26099 ?auto_26085 ) ( AVAILABLE ?auto_26099 ) ( SURFACE-AT ?auto_26052 ?auto_26085 ) ( ON ?auto_26052 ?auto_26070 ) ( CLEAR ?auto_26052 ) ( not ( = ?auto_26051 ?auto_26052 ) ) ( not ( = ?auto_26051 ?auto_26070 ) ) ( not ( = ?auto_26052 ?auto_26070 ) ) ( not ( = ?auto_26064 ?auto_26099 ) ) ( IS-CRATE ?auto_26051 ) ( not ( = ?auto_26088 ?auto_26061 ) ) ( HOIST-AT ?auto_26090 ?auto_26088 ) ( AVAILABLE ?auto_26090 ) ( SURFACE-AT ?auto_26051 ?auto_26088 ) ( ON ?auto_26051 ?auto_26086 ) ( CLEAR ?auto_26051 ) ( not ( = ?auto_26050 ?auto_26051 ) ) ( not ( = ?auto_26050 ?auto_26086 ) ) ( not ( = ?auto_26051 ?auto_26086 ) ) ( not ( = ?auto_26064 ?auto_26090 ) ) ( IS-CRATE ?auto_26050 ) ( not ( = ?auto_26081 ?auto_26061 ) ) ( HOIST-AT ?auto_26069 ?auto_26081 ) ( AVAILABLE ?auto_26069 ) ( SURFACE-AT ?auto_26050 ?auto_26081 ) ( ON ?auto_26050 ?auto_26077 ) ( CLEAR ?auto_26050 ) ( not ( = ?auto_26049 ?auto_26050 ) ) ( not ( = ?auto_26049 ?auto_26077 ) ) ( not ( = ?auto_26050 ?auto_26077 ) ) ( not ( = ?auto_26064 ?auto_26069 ) ) ( IS-CRATE ?auto_26049 ) ( not ( = ?auto_26079 ?auto_26061 ) ) ( HOIST-AT ?auto_26093 ?auto_26079 ) ( AVAILABLE ?auto_26093 ) ( SURFACE-AT ?auto_26049 ?auto_26079 ) ( ON ?auto_26049 ?auto_26082 ) ( CLEAR ?auto_26049 ) ( not ( = ?auto_26048 ?auto_26049 ) ) ( not ( = ?auto_26048 ?auto_26082 ) ) ( not ( = ?auto_26049 ?auto_26082 ) ) ( not ( = ?auto_26064 ?auto_26093 ) ) ( IS-CRATE ?auto_26048 ) ( AVAILABLE ?auto_26094 ) ( SURFACE-AT ?auto_26048 ?auto_26095 ) ( ON ?auto_26048 ?auto_26100 ) ( CLEAR ?auto_26048 ) ( not ( = ?auto_26047 ?auto_26048 ) ) ( not ( = ?auto_26047 ?auto_26100 ) ) ( not ( = ?auto_26048 ?auto_26100 ) ) ( IS-CRATE ?auto_26047 ) ( not ( = ?auto_26087 ?auto_26061 ) ) ( HOIST-AT ?auto_26084 ?auto_26087 ) ( SURFACE-AT ?auto_26047 ?auto_26087 ) ( ON ?auto_26047 ?auto_26065 ) ( CLEAR ?auto_26047 ) ( not ( = ?auto_26046 ?auto_26047 ) ) ( not ( = ?auto_26046 ?auto_26065 ) ) ( not ( = ?auto_26047 ?auto_26065 ) ) ( not ( = ?auto_26064 ?auto_26084 ) ) ( IS-CRATE ?auto_26046 ) ( not ( = ?auto_26071 ?auto_26061 ) ) ( HOIST-AT ?auto_26091 ?auto_26071 ) ( AVAILABLE ?auto_26091 ) ( SURFACE-AT ?auto_26046 ?auto_26071 ) ( ON ?auto_26046 ?auto_26096 ) ( CLEAR ?auto_26046 ) ( not ( = ?auto_26045 ?auto_26046 ) ) ( not ( = ?auto_26045 ?auto_26096 ) ) ( not ( = ?auto_26046 ?auto_26096 ) ) ( not ( = ?auto_26064 ?auto_26091 ) ) ( IS-CRATE ?auto_26045 ) ( not ( = ?auto_26078 ?auto_26061 ) ) ( HOIST-AT ?auto_26076 ?auto_26078 ) ( AVAILABLE ?auto_26076 ) ( SURFACE-AT ?auto_26045 ?auto_26078 ) ( ON ?auto_26045 ?auto_26073 ) ( CLEAR ?auto_26045 ) ( not ( = ?auto_26044 ?auto_26045 ) ) ( not ( = ?auto_26044 ?auto_26073 ) ) ( not ( = ?auto_26045 ?auto_26073 ) ) ( not ( = ?auto_26064 ?auto_26076 ) ) ( SURFACE-AT ?auto_26043 ?auto_26061 ) ( CLEAR ?auto_26043 ) ( IS-CRATE ?auto_26044 ) ( AVAILABLE ?auto_26064 ) ( AVAILABLE ?auto_26084 ) ( SURFACE-AT ?auto_26044 ?auto_26087 ) ( ON ?auto_26044 ?auto_26068 ) ( CLEAR ?auto_26044 ) ( TRUCK-AT ?auto_26059 ?auto_26061 ) ( not ( = ?auto_26043 ?auto_26044 ) ) ( not ( = ?auto_26043 ?auto_26068 ) ) ( not ( = ?auto_26044 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26045 ) ) ( not ( = ?auto_26043 ?auto_26073 ) ) ( not ( = ?auto_26045 ?auto_26068 ) ) ( not ( = ?auto_26078 ?auto_26087 ) ) ( not ( = ?auto_26076 ?auto_26084 ) ) ( not ( = ?auto_26073 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26046 ) ) ( not ( = ?auto_26043 ?auto_26096 ) ) ( not ( = ?auto_26044 ?auto_26046 ) ) ( not ( = ?auto_26044 ?auto_26096 ) ) ( not ( = ?auto_26046 ?auto_26073 ) ) ( not ( = ?auto_26046 ?auto_26068 ) ) ( not ( = ?auto_26071 ?auto_26078 ) ) ( not ( = ?auto_26071 ?auto_26087 ) ) ( not ( = ?auto_26091 ?auto_26076 ) ) ( not ( = ?auto_26091 ?auto_26084 ) ) ( not ( = ?auto_26096 ?auto_26073 ) ) ( not ( = ?auto_26096 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26047 ) ) ( not ( = ?auto_26043 ?auto_26065 ) ) ( not ( = ?auto_26044 ?auto_26047 ) ) ( not ( = ?auto_26044 ?auto_26065 ) ) ( not ( = ?auto_26045 ?auto_26047 ) ) ( not ( = ?auto_26045 ?auto_26065 ) ) ( not ( = ?auto_26047 ?auto_26096 ) ) ( not ( = ?auto_26047 ?auto_26073 ) ) ( not ( = ?auto_26047 ?auto_26068 ) ) ( not ( = ?auto_26065 ?auto_26096 ) ) ( not ( = ?auto_26065 ?auto_26073 ) ) ( not ( = ?auto_26065 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26048 ) ) ( not ( = ?auto_26043 ?auto_26100 ) ) ( not ( = ?auto_26044 ?auto_26048 ) ) ( not ( = ?auto_26044 ?auto_26100 ) ) ( not ( = ?auto_26045 ?auto_26048 ) ) ( not ( = ?auto_26045 ?auto_26100 ) ) ( not ( = ?auto_26046 ?auto_26048 ) ) ( not ( = ?auto_26046 ?auto_26100 ) ) ( not ( = ?auto_26048 ?auto_26065 ) ) ( not ( = ?auto_26048 ?auto_26096 ) ) ( not ( = ?auto_26048 ?auto_26073 ) ) ( not ( = ?auto_26048 ?auto_26068 ) ) ( not ( = ?auto_26095 ?auto_26087 ) ) ( not ( = ?auto_26095 ?auto_26071 ) ) ( not ( = ?auto_26095 ?auto_26078 ) ) ( not ( = ?auto_26094 ?auto_26084 ) ) ( not ( = ?auto_26094 ?auto_26091 ) ) ( not ( = ?auto_26094 ?auto_26076 ) ) ( not ( = ?auto_26100 ?auto_26065 ) ) ( not ( = ?auto_26100 ?auto_26096 ) ) ( not ( = ?auto_26100 ?auto_26073 ) ) ( not ( = ?auto_26100 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26049 ) ) ( not ( = ?auto_26043 ?auto_26082 ) ) ( not ( = ?auto_26044 ?auto_26049 ) ) ( not ( = ?auto_26044 ?auto_26082 ) ) ( not ( = ?auto_26045 ?auto_26049 ) ) ( not ( = ?auto_26045 ?auto_26082 ) ) ( not ( = ?auto_26046 ?auto_26049 ) ) ( not ( = ?auto_26046 ?auto_26082 ) ) ( not ( = ?auto_26047 ?auto_26049 ) ) ( not ( = ?auto_26047 ?auto_26082 ) ) ( not ( = ?auto_26049 ?auto_26100 ) ) ( not ( = ?auto_26049 ?auto_26065 ) ) ( not ( = ?auto_26049 ?auto_26096 ) ) ( not ( = ?auto_26049 ?auto_26073 ) ) ( not ( = ?auto_26049 ?auto_26068 ) ) ( not ( = ?auto_26079 ?auto_26095 ) ) ( not ( = ?auto_26079 ?auto_26087 ) ) ( not ( = ?auto_26079 ?auto_26071 ) ) ( not ( = ?auto_26079 ?auto_26078 ) ) ( not ( = ?auto_26093 ?auto_26094 ) ) ( not ( = ?auto_26093 ?auto_26084 ) ) ( not ( = ?auto_26093 ?auto_26091 ) ) ( not ( = ?auto_26093 ?auto_26076 ) ) ( not ( = ?auto_26082 ?auto_26100 ) ) ( not ( = ?auto_26082 ?auto_26065 ) ) ( not ( = ?auto_26082 ?auto_26096 ) ) ( not ( = ?auto_26082 ?auto_26073 ) ) ( not ( = ?auto_26082 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26050 ) ) ( not ( = ?auto_26043 ?auto_26077 ) ) ( not ( = ?auto_26044 ?auto_26050 ) ) ( not ( = ?auto_26044 ?auto_26077 ) ) ( not ( = ?auto_26045 ?auto_26050 ) ) ( not ( = ?auto_26045 ?auto_26077 ) ) ( not ( = ?auto_26046 ?auto_26050 ) ) ( not ( = ?auto_26046 ?auto_26077 ) ) ( not ( = ?auto_26047 ?auto_26050 ) ) ( not ( = ?auto_26047 ?auto_26077 ) ) ( not ( = ?auto_26048 ?auto_26050 ) ) ( not ( = ?auto_26048 ?auto_26077 ) ) ( not ( = ?auto_26050 ?auto_26082 ) ) ( not ( = ?auto_26050 ?auto_26100 ) ) ( not ( = ?auto_26050 ?auto_26065 ) ) ( not ( = ?auto_26050 ?auto_26096 ) ) ( not ( = ?auto_26050 ?auto_26073 ) ) ( not ( = ?auto_26050 ?auto_26068 ) ) ( not ( = ?auto_26081 ?auto_26079 ) ) ( not ( = ?auto_26081 ?auto_26095 ) ) ( not ( = ?auto_26081 ?auto_26087 ) ) ( not ( = ?auto_26081 ?auto_26071 ) ) ( not ( = ?auto_26081 ?auto_26078 ) ) ( not ( = ?auto_26069 ?auto_26093 ) ) ( not ( = ?auto_26069 ?auto_26094 ) ) ( not ( = ?auto_26069 ?auto_26084 ) ) ( not ( = ?auto_26069 ?auto_26091 ) ) ( not ( = ?auto_26069 ?auto_26076 ) ) ( not ( = ?auto_26077 ?auto_26082 ) ) ( not ( = ?auto_26077 ?auto_26100 ) ) ( not ( = ?auto_26077 ?auto_26065 ) ) ( not ( = ?auto_26077 ?auto_26096 ) ) ( not ( = ?auto_26077 ?auto_26073 ) ) ( not ( = ?auto_26077 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26051 ) ) ( not ( = ?auto_26043 ?auto_26086 ) ) ( not ( = ?auto_26044 ?auto_26051 ) ) ( not ( = ?auto_26044 ?auto_26086 ) ) ( not ( = ?auto_26045 ?auto_26051 ) ) ( not ( = ?auto_26045 ?auto_26086 ) ) ( not ( = ?auto_26046 ?auto_26051 ) ) ( not ( = ?auto_26046 ?auto_26086 ) ) ( not ( = ?auto_26047 ?auto_26051 ) ) ( not ( = ?auto_26047 ?auto_26086 ) ) ( not ( = ?auto_26048 ?auto_26051 ) ) ( not ( = ?auto_26048 ?auto_26086 ) ) ( not ( = ?auto_26049 ?auto_26051 ) ) ( not ( = ?auto_26049 ?auto_26086 ) ) ( not ( = ?auto_26051 ?auto_26077 ) ) ( not ( = ?auto_26051 ?auto_26082 ) ) ( not ( = ?auto_26051 ?auto_26100 ) ) ( not ( = ?auto_26051 ?auto_26065 ) ) ( not ( = ?auto_26051 ?auto_26096 ) ) ( not ( = ?auto_26051 ?auto_26073 ) ) ( not ( = ?auto_26051 ?auto_26068 ) ) ( not ( = ?auto_26088 ?auto_26081 ) ) ( not ( = ?auto_26088 ?auto_26079 ) ) ( not ( = ?auto_26088 ?auto_26095 ) ) ( not ( = ?auto_26088 ?auto_26087 ) ) ( not ( = ?auto_26088 ?auto_26071 ) ) ( not ( = ?auto_26088 ?auto_26078 ) ) ( not ( = ?auto_26090 ?auto_26069 ) ) ( not ( = ?auto_26090 ?auto_26093 ) ) ( not ( = ?auto_26090 ?auto_26094 ) ) ( not ( = ?auto_26090 ?auto_26084 ) ) ( not ( = ?auto_26090 ?auto_26091 ) ) ( not ( = ?auto_26090 ?auto_26076 ) ) ( not ( = ?auto_26086 ?auto_26077 ) ) ( not ( = ?auto_26086 ?auto_26082 ) ) ( not ( = ?auto_26086 ?auto_26100 ) ) ( not ( = ?auto_26086 ?auto_26065 ) ) ( not ( = ?auto_26086 ?auto_26096 ) ) ( not ( = ?auto_26086 ?auto_26073 ) ) ( not ( = ?auto_26086 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26052 ) ) ( not ( = ?auto_26043 ?auto_26070 ) ) ( not ( = ?auto_26044 ?auto_26052 ) ) ( not ( = ?auto_26044 ?auto_26070 ) ) ( not ( = ?auto_26045 ?auto_26052 ) ) ( not ( = ?auto_26045 ?auto_26070 ) ) ( not ( = ?auto_26046 ?auto_26052 ) ) ( not ( = ?auto_26046 ?auto_26070 ) ) ( not ( = ?auto_26047 ?auto_26052 ) ) ( not ( = ?auto_26047 ?auto_26070 ) ) ( not ( = ?auto_26048 ?auto_26052 ) ) ( not ( = ?auto_26048 ?auto_26070 ) ) ( not ( = ?auto_26049 ?auto_26052 ) ) ( not ( = ?auto_26049 ?auto_26070 ) ) ( not ( = ?auto_26050 ?auto_26052 ) ) ( not ( = ?auto_26050 ?auto_26070 ) ) ( not ( = ?auto_26052 ?auto_26086 ) ) ( not ( = ?auto_26052 ?auto_26077 ) ) ( not ( = ?auto_26052 ?auto_26082 ) ) ( not ( = ?auto_26052 ?auto_26100 ) ) ( not ( = ?auto_26052 ?auto_26065 ) ) ( not ( = ?auto_26052 ?auto_26096 ) ) ( not ( = ?auto_26052 ?auto_26073 ) ) ( not ( = ?auto_26052 ?auto_26068 ) ) ( not ( = ?auto_26085 ?auto_26088 ) ) ( not ( = ?auto_26085 ?auto_26081 ) ) ( not ( = ?auto_26085 ?auto_26079 ) ) ( not ( = ?auto_26085 ?auto_26095 ) ) ( not ( = ?auto_26085 ?auto_26087 ) ) ( not ( = ?auto_26085 ?auto_26071 ) ) ( not ( = ?auto_26085 ?auto_26078 ) ) ( not ( = ?auto_26099 ?auto_26090 ) ) ( not ( = ?auto_26099 ?auto_26069 ) ) ( not ( = ?auto_26099 ?auto_26093 ) ) ( not ( = ?auto_26099 ?auto_26094 ) ) ( not ( = ?auto_26099 ?auto_26084 ) ) ( not ( = ?auto_26099 ?auto_26091 ) ) ( not ( = ?auto_26099 ?auto_26076 ) ) ( not ( = ?auto_26070 ?auto_26086 ) ) ( not ( = ?auto_26070 ?auto_26077 ) ) ( not ( = ?auto_26070 ?auto_26082 ) ) ( not ( = ?auto_26070 ?auto_26100 ) ) ( not ( = ?auto_26070 ?auto_26065 ) ) ( not ( = ?auto_26070 ?auto_26096 ) ) ( not ( = ?auto_26070 ?auto_26073 ) ) ( not ( = ?auto_26070 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26053 ) ) ( not ( = ?auto_26043 ?auto_26074 ) ) ( not ( = ?auto_26044 ?auto_26053 ) ) ( not ( = ?auto_26044 ?auto_26074 ) ) ( not ( = ?auto_26045 ?auto_26053 ) ) ( not ( = ?auto_26045 ?auto_26074 ) ) ( not ( = ?auto_26046 ?auto_26053 ) ) ( not ( = ?auto_26046 ?auto_26074 ) ) ( not ( = ?auto_26047 ?auto_26053 ) ) ( not ( = ?auto_26047 ?auto_26074 ) ) ( not ( = ?auto_26048 ?auto_26053 ) ) ( not ( = ?auto_26048 ?auto_26074 ) ) ( not ( = ?auto_26049 ?auto_26053 ) ) ( not ( = ?auto_26049 ?auto_26074 ) ) ( not ( = ?auto_26050 ?auto_26053 ) ) ( not ( = ?auto_26050 ?auto_26074 ) ) ( not ( = ?auto_26051 ?auto_26053 ) ) ( not ( = ?auto_26051 ?auto_26074 ) ) ( not ( = ?auto_26053 ?auto_26070 ) ) ( not ( = ?auto_26053 ?auto_26086 ) ) ( not ( = ?auto_26053 ?auto_26077 ) ) ( not ( = ?auto_26053 ?auto_26082 ) ) ( not ( = ?auto_26053 ?auto_26100 ) ) ( not ( = ?auto_26053 ?auto_26065 ) ) ( not ( = ?auto_26053 ?auto_26096 ) ) ( not ( = ?auto_26053 ?auto_26073 ) ) ( not ( = ?auto_26053 ?auto_26068 ) ) ( not ( = ?auto_26075 ?auto_26085 ) ) ( not ( = ?auto_26075 ?auto_26088 ) ) ( not ( = ?auto_26075 ?auto_26081 ) ) ( not ( = ?auto_26075 ?auto_26079 ) ) ( not ( = ?auto_26075 ?auto_26095 ) ) ( not ( = ?auto_26075 ?auto_26087 ) ) ( not ( = ?auto_26075 ?auto_26071 ) ) ( not ( = ?auto_26075 ?auto_26078 ) ) ( not ( = ?auto_26097 ?auto_26099 ) ) ( not ( = ?auto_26097 ?auto_26090 ) ) ( not ( = ?auto_26097 ?auto_26069 ) ) ( not ( = ?auto_26097 ?auto_26093 ) ) ( not ( = ?auto_26097 ?auto_26094 ) ) ( not ( = ?auto_26097 ?auto_26084 ) ) ( not ( = ?auto_26097 ?auto_26091 ) ) ( not ( = ?auto_26097 ?auto_26076 ) ) ( not ( = ?auto_26074 ?auto_26070 ) ) ( not ( = ?auto_26074 ?auto_26086 ) ) ( not ( = ?auto_26074 ?auto_26077 ) ) ( not ( = ?auto_26074 ?auto_26082 ) ) ( not ( = ?auto_26074 ?auto_26100 ) ) ( not ( = ?auto_26074 ?auto_26065 ) ) ( not ( = ?auto_26074 ?auto_26096 ) ) ( not ( = ?auto_26074 ?auto_26073 ) ) ( not ( = ?auto_26074 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26054 ) ) ( not ( = ?auto_26043 ?auto_26089 ) ) ( not ( = ?auto_26044 ?auto_26054 ) ) ( not ( = ?auto_26044 ?auto_26089 ) ) ( not ( = ?auto_26045 ?auto_26054 ) ) ( not ( = ?auto_26045 ?auto_26089 ) ) ( not ( = ?auto_26046 ?auto_26054 ) ) ( not ( = ?auto_26046 ?auto_26089 ) ) ( not ( = ?auto_26047 ?auto_26054 ) ) ( not ( = ?auto_26047 ?auto_26089 ) ) ( not ( = ?auto_26048 ?auto_26054 ) ) ( not ( = ?auto_26048 ?auto_26089 ) ) ( not ( = ?auto_26049 ?auto_26054 ) ) ( not ( = ?auto_26049 ?auto_26089 ) ) ( not ( = ?auto_26050 ?auto_26054 ) ) ( not ( = ?auto_26050 ?auto_26089 ) ) ( not ( = ?auto_26051 ?auto_26054 ) ) ( not ( = ?auto_26051 ?auto_26089 ) ) ( not ( = ?auto_26052 ?auto_26054 ) ) ( not ( = ?auto_26052 ?auto_26089 ) ) ( not ( = ?auto_26054 ?auto_26074 ) ) ( not ( = ?auto_26054 ?auto_26070 ) ) ( not ( = ?auto_26054 ?auto_26086 ) ) ( not ( = ?auto_26054 ?auto_26077 ) ) ( not ( = ?auto_26054 ?auto_26082 ) ) ( not ( = ?auto_26054 ?auto_26100 ) ) ( not ( = ?auto_26054 ?auto_26065 ) ) ( not ( = ?auto_26054 ?auto_26096 ) ) ( not ( = ?auto_26054 ?auto_26073 ) ) ( not ( = ?auto_26054 ?auto_26068 ) ) ( not ( = ?auto_26066 ?auto_26075 ) ) ( not ( = ?auto_26066 ?auto_26085 ) ) ( not ( = ?auto_26066 ?auto_26088 ) ) ( not ( = ?auto_26066 ?auto_26081 ) ) ( not ( = ?auto_26066 ?auto_26079 ) ) ( not ( = ?auto_26066 ?auto_26095 ) ) ( not ( = ?auto_26066 ?auto_26087 ) ) ( not ( = ?auto_26066 ?auto_26071 ) ) ( not ( = ?auto_26066 ?auto_26078 ) ) ( not ( = ?auto_26067 ?auto_26097 ) ) ( not ( = ?auto_26067 ?auto_26099 ) ) ( not ( = ?auto_26067 ?auto_26090 ) ) ( not ( = ?auto_26067 ?auto_26069 ) ) ( not ( = ?auto_26067 ?auto_26093 ) ) ( not ( = ?auto_26067 ?auto_26094 ) ) ( not ( = ?auto_26067 ?auto_26084 ) ) ( not ( = ?auto_26067 ?auto_26091 ) ) ( not ( = ?auto_26067 ?auto_26076 ) ) ( not ( = ?auto_26089 ?auto_26074 ) ) ( not ( = ?auto_26089 ?auto_26070 ) ) ( not ( = ?auto_26089 ?auto_26086 ) ) ( not ( = ?auto_26089 ?auto_26077 ) ) ( not ( = ?auto_26089 ?auto_26082 ) ) ( not ( = ?auto_26089 ?auto_26100 ) ) ( not ( = ?auto_26089 ?auto_26065 ) ) ( not ( = ?auto_26089 ?auto_26096 ) ) ( not ( = ?auto_26089 ?auto_26073 ) ) ( not ( = ?auto_26089 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26055 ) ) ( not ( = ?auto_26043 ?auto_26092 ) ) ( not ( = ?auto_26044 ?auto_26055 ) ) ( not ( = ?auto_26044 ?auto_26092 ) ) ( not ( = ?auto_26045 ?auto_26055 ) ) ( not ( = ?auto_26045 ?auto_26092 ) ) ( not ( = ?auto_26046 ?auto_26055 ) ) ( not ( = ?auto_26046 ?auto_26092 ) ) ( not ( = ?auto_26047 ?auto_26055 ) ) ( not ( = ?auto_26047 ?auto_26092 ) ) ( not ( = ?auto_26048 ?auto_26055 ) ) ( not ( = ?auto_26048 ?auto_26092 ) ) ( not ( = ?auto_26049 ?auto_26055 ) ) ( not ( = ?auto_26049 ?auto_26092 ) ) ( not ( = ?auto_26050 ?auto_26055 ) ) ( not ( = ?auto_26050 ?auto_26092 ) ) ( not ( = ?auto_26051 ?auto_26055 ) ) ( not ( = ?auto_26051 ?auto_26092 ) ) ( not ( = ?auto_26052 ?auto_26055 ) ) ( not ( = ?auto_26052 ?auto_26092 ) ) ( not ( = ?auto_26053 ?auto_26055 ) ) ( not ( = ?auto_26053 ?auto_26092 ) ) ( not ( = ?auto_26055 ?auto_26089 ) ) ( not ( = ?auto_26055 ?auto_26074 ) ) ( not ( = ?auto_26055 ?auto_26070 ) ) ( not ( = ?auto_26055 ?auto_26086 ) ) ( not ( = ?auto_26055 ?auto_26077 ) ) ( not ( = ?auto_26055 ?auto_26082 ) ) ( not ( = ?auto_26055 ?auto_26100 ) ) ( not ( = ?auto_26055 ?auto_26065 ) ) ( not ( = ?auto_26055 ?auto_26096 ) ) ( not ( = ?auto_26055 ?auto_26073 ) ) ( not ( = ?auto_26055 ?auto_26068 ) ) ( not ( = ?auto_26092 ?auto_26089 ) ) ( not ( = ?auto_26092 ?auto_26074 ) ) ( not ( = ?auto_26092 ?auto_26070 ) ) ( not ( = ?auto_26092 ?auto_26086 ) ) ( not ( = ?auto_26092 ?auto_26077 ) ) ( not ( = ?auto_26092 ?auto_26082 ) ) ( not ( = ?auto_26092 ?auto_26100 ) ) ( not ( = ?auto_26092 ?auto_26065 ) ) ( not ( = ?auto_26092 ?auto_26096 ) ) ( not ( = ?auto_26092 ?auto_26073 ) ) ( not ( = ?auto_26092 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26056 ) ) ( not ( = ?auto_26043 ?auto_26098 ) ) ( not ( = ?auto_26044 ?auto_26056 ) ) ( not ( = ?auto_26044 ?auto_26098 ) ) ( not ( = ?auto_26045 ?auto_26056 ) ) ( not ( = ?auto_26045 ?auto_26098 ) ) ( not ( = ?auto_26046 ?auto_26056 ) ) ( not ( = ?auto_26046 ?auto_26098 ) ) ( not ( = ?auto_26047 ?auto_26056 ) ) ( not ( = ?auto_26047 ?auto_26098 ) ) ( not ( = ?auto_26048 ?auto_26056 ) ) ( not ( = ?auto_26048 ?auto_26098 ) ) ( not ( = ?auto_26049 ?auto_26056 ) ) ( not ( = ?auto_26049 ?auto_26098 ) ) ( not ( = ?auto_26050 ?auto_26056 ) ) ( not ( = ?auto_26050 ?auto_26098 ) ) ( not ( = ?auto_26051 ?auto_26056 ) ) ( not ( = ?auto_26051 ?auto_26098 ) ) ( not ( = ?auto_26052 ?auto_26056 ) ) ( not ( = ?auto_26052 ?auto_26098 ) ) ( not ( = ?auto_26053 ?auto_26056 ) ) ( not ( = ?auto_26053 ?auto_26098 ) ) ( not ( = ?auto_26054 ?auto_26056 ) ) ( not ( = ?auto_26054 ?auto_26098 ) ) ( not ( = ?auto_26056 ?auto_26092 ) ) ( not ( = ?auto_26056 ?auto_26089 ) ) ( not ( = ?auto_26056 ?auto_26074 ) ) ( not ( = ?auto_26056 ?auto_26070 ) ) ( not ( = ?auto_26056 ?auto_26086 ) ) ( not ( = ?auto_26056 ?auto_26077 ) ) ( not ( = ?auto_26056 ?auto_26082 ) ) ( not ( = ?auto_26056 ?auto_26100 ) ) ( not ( = ?auto_26056 ?auto_26065 ) ) ( not ( = ?auto_26056 ?auto_26096 ) ) ( not ( = ?auto_26056 ?auto_26073 ) ) ( not ( = ?auto_26056 ?auto_26068 ) ) ( not ( = ?auto_26098 ?auto_26092 ) ) ( not ( = ?auto_26098 ?auto_26089 ) ) ( not ( = ?auto_26098 ?auto_26074 ) ) ( not ( = ?auto_26098 ?auto_26070 ) ) ( not ( = ?auto_26098 ?auto_26086 ) ) ( not ( = ?auto_26098 ?auto_26077 ) ) ( not ( = ?auto_26098 ?auto_26082 ) ) ( not ( = ?auto_26098 ?auto_26100 ) ) ( not ( = ?auto_26098 ?auto_26065 ) ) ( not ( = ?auto_26098 ?auto_26096 ) ) ( not ( = ?auto_26098 ?auto_26073 ) ) ( not ( = ?auto_26098 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26057 ) ) ( not ( = ?auto_26043 ?auto_26072 ) ) ( not ( = ?auto_26044 ?auto_26057 ) ) ( not ( = ?auto_26044 ?auto_26072 ) ) ( not ( = ?auto_26045 ?auto_26057 ) ) ( not ( = ?auto_26045 ?auto_26072 ) ) ( not ( = ?auto_26046 ?auto_26057 ) ) ( not ( = ?auto_26046 ?auto_26072 ) ) ( not ( = ?auto_26047 ?auto_26057 ) ) ( not ( = ?auto_26047 ?auto_26072 ) ) ( not ( = ?auto_26048 ?auto_26057 ) ) ( not ( = ?auto_26048 ?auto_26072 ) ) ( not ( = ?auto_26049 ?auto_26057 ) ) ( not ( = ?auto_26049 ?auto_26072 ) ) ( not ( = ?auto_26050 ?auto_26057 ) ) ( not ( = ?auto_26050 ?auto_26072 ) ) ( not ( = ?auto_26051 ?auto_26057 ) ) ( not ( = ?auto_26051 ?auto_26072 ) ) ( not ( = ?auto_26052 ?auto_26057 ) ) ( not ( = ?auto_26052 ?auto_26072 ) ) ( not ( = ?auto_26053 ?auto_26057 ) ) ( not ( = ?auto_26053 ?auto_26072 ) ) ( not ( = ?auto_26054 ?auto_26057 ) ) ( not ( = ?auto_26054 ?auto_26072 ) ) ( not ( = ?auto_26055 ?auto_26057 ) ) ( not ( = ?auto_26055 ?auto_26072 ) ) ( not ( = ?auto_26057 ?auto_26098 ) ) ( not ( = ?auto_26057 ?auto_26092 ) ) ( not ( = ?auto_26057 ?auto_26089 ) ) ( not ( = ?auto_26057 ?auto_26074 ) ) ( not ( = ?auto_26057 ?auto_26070 ) ) ( not ( = ?auto_26057 ?auto_26086 ) ) ( not ( = ?auto_26057 ?auto_26077 ) ) ( not ( = ?auto_26057 ?auto_26082 ) ) ( not ( = ?auto_26057 ?auto_26100 ) ) ( not ( = ?auto_26057 ?auto_26065 ) ) ( not ( = ?auto_26057 ?auto_26096 ) ) ( not ( = ?auto_26057 ?auto_26073 ) ) ( not ( = ?auto_26057 ?auto_26068 ) ) ( not ( = ?auto_26080 ?auto_26095 ) ) ( not ( = ?auto_26080 ?auto_26075 ) ) ( not ( = ?auto_26080 ?auto_26066 ) ) ( not ( = ?auto_26080 ?auto_26085 ) ) ( not ( = ?auto_26080 ?auto_26088 ) ) ( not ( = ?auto_26080 ?auto_26081 ) ) ( not ( = ?auto_26080 ?auto_26079 ) ) ( not ( = ?auto_26080 ?auto_26087 ) ) ( not ( = ?auto_26080 ?auto_26071 ) ) ( not ( = ?auto_26080 ?auto_26078 ) ) ( not ( = ?auto_26083 ?auto_26094 ) ) ( not ( = ?auto_26083 ?auto_26097 ) ) ( not ( = ?auto_26083 ?auto_26067 ) ) ( not ( = ?auto_26083 ?auto_26099 ) ) ( not ( = ?auto_26083 ?auto_26090 ) ) ( not ( = ?auto_26083 ?auto_26069 ) ) ( not ( = ?auto_26083 ?auto_26093 ) ) ( not ( = ?auto_26083 ?auto_26084 ) ) ( not ( = ?auto_26083 ?auto_26091 ) ) ( not ( = ?auto_26083 ?auto_26076 ) ) ( not ( = ?auto_26072 ?auto_26098 ) ) ( not ( = ?auto_26072 ?auto_26092 ) ) ( not ( = ?auto_26072 ?auto_26089 ) ) ( not ( = ?auto_26072 ?auto_26074 ) ) ( not ( = ?auto_26072 ?auto_26070 ) ) ( not ( = ?auto_26072 ?auto_26086 ) ) ( not ( = ?auto_26072 ?auto_26077 ) ) ( not ( = ?auto_26072 ?auto_26082 ) ) ( not ( = ?auto_26072 ?auto_26100 ) ) ( not ( = ?auto_26072 ?auto_26065 ) ) ( not ( = ?auto_26072 ?auto_26096 ) ) ( not ( = ?auto_26072 ?auto_26073 ) ) ( not ( = ?auto_26072 ?auto_26068 ) ) ( not ( = ?auto_26043 ?auto_26058 ) ) ( not ( = ?auto_26043 ?auto_26060 ) ) ( not ( = ?auto_26044 ?auto_26058 ) ) ( not ( = ?auto_26044 ?auto_26060 ) ) ( not ( = ?auto_26045 ?auto_26058 ) ) ( not ( = ?auto_26045 ?auto_26060 ) ) ( not ( = ?auto_26046 ?auto_26058 ) ) ( not ( = ?auto_26046 ?auto_26060 ) ) ( not ( = ?auto_26047 ?auto_26058 ) ) ( not ( = ?auto_26047 ?auto_26060 ) ) ( not ( = ?auto_26048 ?auto_26058 ) ) ( not ( = ?auto_26048 ?auto_26060 ) ) ( not ( = ?auto_26049 ?auto_26058 ) ) ( not ( = ?auto_26049 ?auto_26060 ) ) ( not ( = ?auto_26050 ?auto_26058 ) ) ( not ( = ?auto_26050 ?auto_26060 ) ) ( not ( = ?auto_26051 ?auto_26058 ) ) ( not ( = ?auto_26051 ?auto_26060 ) ) ( not ( = ?auto_26052 ?auto_26058 ) ) ( not ( = ?auto_26052 ?auto_26060 ) ) ( not ( = ?auto_26053 ?auto_26058 ) ) ( not ( = ?auto_26053 ?auto_26060 ) ) ( not ( = ?auto_26054 ?auto_26058 ) ) ( not ( = ?auto_26054 ?auto_26060 ) ) ( not ( = ?auto_26055 ?auto_26058 ) ) ( not ( = ?auto_26055 ?auto_26060 ) ) ( not ( = ?auto_26056 ?auto_26058 ) ) ( not ( = ?auto_26056 ?auto_26060 ) ) ( not ( = ?auto_26058 ?auto_26072 ) ) ( not ( = ?auto_26058 ?auto_26098 ) ) ( not ( = ?auto_26058 ?auto_26092 ) ) ( not ( = ?auto_26058 ?auto_26089 ) ) ( not ( = ?auto_26058 ?auto_26074 ) ) ( not ( = ?auto_26058 ?auto_26070 ) ) ( not ( = ?auto_26058 ?auto_26086 ) ) ( not ( = ?auto_26058 ?auto_26077 ) ) ( not ( = ?auto_26058 ?auto_26082 ) ) ( not ( = ?auto_26058 ?auto_26100 ) ) ( not ( = ?auto_26058 ?auto_26065 ) ) ( not ( = ?auto_26058 ?auto_26096 ) ) ( not ( = ?auto_26058 ?auto_26073 ) ) ( not ( = ?auto_26058 ?auto_26068 ) ) ( not ( = ?auto_26062 ?auto_26080 ) ) ( not ( = ?auto_26062 ?auto_26095 ) ) ( not ( = ?auto_26062 ?auto_26075 ) ) ( not ( = ?auto_26062 ?auto_26066 ) ) ( not ( = ?auto_26062 ?auto_26085 ) ) ( not ( = ?auto_26062 ?auto_26088 ) ) ( not ( = ?auto_26062 ?auto_26081 ) ) ( not ( = ?auto_26062 ?auto_26079 ) ) ( not ( = ?auto_26062 ?auto_26087 ) ) ( not ( = ?auto_26062 ?auto_26071 ) ) ( not ( = ?auto_26062 ?auto_26078 ) ) ( not ( = ?auto_26063 ?auto_26083 ) ) ( not ( = ?auto_26063 ?auto_26094 ) ) ( not ( = ?auto_26063 ?auto_26097 ) ) ( not ( = ?auto_26063 ?auto_26067 ) ) ( not ( = ?auto_26063 ?auto_26099 ) ) ( not ( = ?auto_26063 ?auto_26090 ) ) ( not ( = ?auto_26063 ?auto_26069 ) ) ( not ( = ?auto_26063 ?auto_26093 ) ) ( not ( = ?auto_26063 ?auto_26084 ) ) ( not ( = ?auto_26063 ?auto_26091 ) ) ( not ( = ?auto_26063 ?auto_26076 ) ) ( not ( = ?auto_26060 ?auto_26072 ) ) ( not ( = ?auto_26060 ?auto_26098 ) ) ( not ( = ?auto_26060 ?auto_26092 ) ) ( not ( = ?auto_26060 ?auto_26089 ) ) ( not ( = ?auto_26060 ?auto_26074 ) ) ( not ( = ?auto_26060 ?auto_26070 ) ) ( not ( = ?auto_26060 ?auto_26086 ) ) ( not ( = ?auto_26060 ?auto_26077 ) ) ( not ( = ?auto_26060 ?auto_26082 ) ) ( not ( = ?auto_26060 ?auto_26100 ) ) ( not ( = ?auto_26060 ?auto_26065 ) ) ( not ( = ?auto_26060 ?auto_26096 ) ) ( not ( = ?auto_26060 ?auto_26073 ) ) ( not ( = ?auto_26060 ?auto_26068 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_26043 ?auto_26044 ?auto_26045 ?auto_26046 ?auto_26047 ?auto_26048 ?auto_26049 ?auto_26050 ?auto_26051 ?auto_26052 ?auto_26053 ?auto_26054 ?auto_26055 ?auto_26056 ?auto_26057 )
      ( MAKE-1CRATE ?auto_26057 ?auto_26058 )
      ( MAKE-15CRATE-VERIFY ?auto_26043 ?auto_26044 ?auto_26045 ?auto_26046 ?auto_26047 ?auto_26048 ?auto_26049 ?auto_26050 ?auto_26051 ?auto_26052 ?auto_26053 ?auto_26054 ?auto_26055 ?auto_26056 ?auto_26057 ?auto_26058 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_26128 - SURFACE
      ?auto_26129 - SURFACE
      ?auto_26130 - SURFACE
      ?auto_26131 - SURFACE
      ?auto_26132 - SURFACE
      ?auto_26133 - SURFACE
      ?auto_26134 - SURFACE
      ?auto_26135 - SURFACE
      ?auto_26136 - SURFACE
      ?auto_26137 - SURFACE
      ?auto_26138 - SURFACE
      ?auto_26139 - SURFACE
      ?auto_26140 - SURFACE
      ?auto_26141 - SURFACE
      ?auto_26142 - SURFACE
      ?auto_26143 - SURFACE
      ?auto_26144 - SURFACE
    )
    :vars
    (
      ?auto_26150 - HOIST
      ?auto_26147 - PLACE
      ?auto_26149 - PLACE
      ?auto_26148 - HOIST
      ?auto_26146 - SURFACE
      ?auto_26181 - PLACE
      ?auto_26163 - HOIST
      ?auto_26175 - SURFACE
      ?auto_26164 - PLACE
      ?auto_26168 - HOIST
      ?auto_26157 - SURFACE
      ?auto_26180 - PLACE
      ?auto_26173 - HOIST
      ?auto_26167 - SURFACE
      ?auto_26162 - PLACE
      ?auto_26176 - HOIST
      ?auto_26170 - SURFACE
      ?auto_26156 - PLACE
      ?auto_26184 - HOIST
      ?auto_26185 - SURFACE
      ?auto_26154 - SURFACE
      ?auto_26161 - SURFACE
      ?auto_26151 - PLACE
      ?auto_26182 - HOIST
      ?auto_26171 - SURFACE
      ?auto_26155 - PLACE
      ?auto_26153 - HOIST
      ?auto_26186 - SURFACE
      ?auto_26183 - PLACE
      ?auto_26174 - HOIST
      ?auto_26178 - SURFACE
      ?auto_26169 - SURFACE
      ?auto_26179 - PLACE
      ?auto_26159 - HOIST
      ?auto_26177 - SURFACE
      ?auto_26187 - PLACE
      ?auto_26166 - HOIST
      ?auto_26172 - SURFACE
      ?auto_26165 - PLACE
      ?auto_26160 - HOIST
      ?auto_26158 - SURFACE
      ?auto_26152 - SURFACE
      ?auto_26145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26150 ?auto_26147 ) ( IS-CRATE ?auto_26144 ) ( not ( = ?auto_26149 ?auto_26147 ) ) ( HOIST-AT ?auto_26148 ?auto_26149 ) ( SURFACE-AT ?auto_26144 ?auto_26149 ) ( ON ?auto_26144 ?auto_26146 ) ( CLEAR ?auto_26144 ) ( not ( = ?auto_26143 ?auto_26144 ) ) ( not ( = ?auto_26143 ?auto_26146 ) ) ( not ( = ?auto_26144 ?auto_26146 ) ) ( not ( = ?auto_26150 ?auto_26148 ) ) ( IS-CRATE ?auto_26143 ) ( not ( = ?auto_26181 ?auto_26147 ) ) ( HOIST-AT ?auto_26163 ?auto_26181 ) ( AVAILABLE ?auto_26163 ) ( SURFACE-AT ?auto_26143 ?auto_26181 ) ( ON ?auto_26143 ?auto_26175 ) ( CLEAR ?auto_26143 ) ( not ( = ?auto_26142 ?auto_26143 ) ) ( not ( = ?auto_26142 ?auto_26175 ) ) ( not ( = ?auto_26143 ?auto_26175 ) ) ( not ( = ?auto_26150 ?auto_26163 ) ) ( IS-CRATE ?auto_26142 ) ( not ( = ?auto_26164 ?auto_26147 ) ) ( HOIST-AT ?auto_26168 ?auto_26164 ) ( AVAILABLE ?auto_26168 ) ( SURFACE-AT ?auto_26142 ?auto_26164 ) ( ON ?auto_26142 ?auto_26157 ) ( CLEAR ?auto_26142 ) ( not ( = ?auto_26141 ?auto_26142 ) ) ( not ( = ?auto_26141 ?auto_26157 ) ) ( not ( = ?auto_26142 ?auto_26157 ) ) ( not ( = ?auto_26150 ?auto_26168 ) ) ( IS-CRATE ?auto_26141 ) ( not ( = ?auto_26180 ?auto_26147 ) ) ( HOIST-AT ?auto_26173 ?auto_26180 ) ( SURFACE-AT ?auto_26141 ?auto_26180 ) ( ON ?auto_26141 ?auto_26167 ) ( CLEAR ?auto_26141 ) ( not ( = ?auto_26140 ?auto_26141 ) ) ( not ( = ?auto_26140 ?auto_26167 ) ) ( not ( = ?auto_26141 ?auto_26167 ) ) ( not ( = ?auto_26150 ?auto_26173 ) ) ( IS-CRATE ?auto_26140 ) ( not ( = ?auto_26162 ?auto_26147 ) ) ( HOIST-AT ?auto_26176 ?auto_26162 ) ( SURFACE-AT ?auto_26140 ?auto_26162 ) ( ON ?auto_26140 ?auto_26170 ) ( CLEAR ?auto_26140 ) ( not ( = ?auto_26139 ?auto_26140 ) ) ( not ( = ?auto_26139 ?auto_26170 ) ) ( not ( = ?auto_26140 ?auto_26170 ) ) ( not ( = ?auto_26150 ?auto_26176 ) ) ( IS-CRATE ?auto_26139 ) ( not ( = ?auto_26156 ?auto_26147 ) ) ( HOIST-AT ?auto_26184 ?auto_26156 ) ( AVAILABLE ?auto_26184 ) ( SURFACE-AT ?auto_26139 ?auto_26156 ) ( ON ?auto_26139 ?auto_26185 ) ( CLEAR ?auto_26139 ) ( not ( = ?auto_26138 ?auto_26139 ) ) ( not ( = ?auto_26138 ?auto_26185 ) ) ( not ( = ?auto_26139 ?auto_26185 ) ) ( not ( = ?auto_26150 ?auto_26184 ) ) ( IS-CRATE ?auto_26138 ) ( AVAILABLE ?auto_26176 ) ( SURFACE-AT ?auto_26138 ?auto_26162 ) ( ON ?auto_26138 ?auto_26154 ) ( CLEAR ?auto_26138 ) ( not ( = ?auto_26137 ?auto_26138 ) ) ( not ( = ?auto_26137 ?auto_26154 ) ) ( not ( = ?auto_26138 ?auto_26154 ) ) ( IS-CRATE ?auto_26137 ) ( AVAILABLE ?auto_26148 ) ( SURFACE-AT ?auto_26137 ?auto_26149 ) ( ON ?auto_26137 ?auto_26161 ) ( CLEAR ?auto_26137 ) ( not ( = ?auto_26136 ?auto_26137 ) ) ( not ( = ?auto_26136 ?auto_26161 ) ) ( not ( = ?auto_26137 ?auto_26161 ) ) ( IS-CRATE ?auto_26136 ) ( not ( = ?auto_26151 ?auto_26147 ) ) ( HOIST-AT ?auto_26182 ?auto_26151 ) ( AVAILABLE ?auto_26182 ) ( SURFACE-AT ?auto_26136 ?auto_26151 ) ( ON ?auto_26136 ?auto_26171 ) ( CLEAR ?auto_26136 ) ( not ( = ?auto_26135 ?auto_26136 ) ) ( not ( = ?auto_26135 ?auto_26171 ) ) ( not ( = ?auto_26136 ?auto_26171 ) ) ( not ( = ?auto_26150 ?auto_26182 ) ) ( IS-CRATE ?auto_26135 ) ( not ( = ?auto_26155 ?auto_26147 ) ) ( HOIST-AT ?auto_26153 ?auto_26155 ) ( AVAILABLE ?auto_26153 ) ( SURFACE-AT ?auto_26135 ?auto_26155 ) ( ON ?auto_26135 ?auto_26186 ) ( CLEAR ?auto_26135 ) ( not ( = ?auto_26134 ?auto_26135 ) ) ( not ( = ?auto_26134 ?auto_26186 ) ) ( not ( = ?auto_26135 ?auto_26186 ) ) ( not ( = ?auto_26150 ?auto_26153 ) ) ( IS-CRATE ?auto_26134 ) ( not ( = ?auto_26183 ?auto_26147 ) ) ( HOIST-AT ?auto_26174 ?auto_26183 ) ( AVAILABLE ?auto_26174 ) ( SURFACE-AT ?auto_26134 ?auto_26183 ) ( ON ?auto_26134 ?auto_26178 ) ( CLEAR ?auto_26134 ) ( not ( = ?auto_26133 ?auto_26134 ) ) ( not ( = ?auto_26133 ?auto_26178 ) ) ( not ( = ?auto_26134 ?auto_26178 ) ) ( not ( = ?auto_26150 ?auto_26174 ) ) ( IS-CRATE ?auto_26133 ) ( AVAILABLE ?auto_26173 ) ( SURFACE-AT ?auto_26133 ?auto_26180 ) ( ON ?auto_26133 ?auto_26169 ) ( CLEAR ?auto_26133 ) ( not ( = ?auto_26132 ?auto_26133 ) ) ( not ( = ?auto_26132 ?auto_26169 ) ) ( not ( = ?auto_26133 ?auto_26169 ) ) ( IS-CRATE ?auto_26132 ) ( not ( = ?auto_26179 ?auto_26147 ) ) ( HOIST-AT ?auto_26159 ?auto_26179 ) ( SURFACE-AT ?auto_26132 ?auto_26179 ) ( ON ?auto_26132 ?auto_26177 ) ( CLEAR ?auto_26132 ) ( not ( = ?auto_26131 ?auto_26132 ) ) ( not ( = ?auto_26131 ?auto_26177 ) ) ( not ( = ?auto_26132 ?auto_26177 ) ) ( not ( = ?auto_26150 ?auto_26159 ) ) ( IS-CRATE ?auto_26131 ) ( not ( = ?auto_26187 ?auto_26147 ) ) ( HOIST-AT ?auto_26166 ?auto_26187 ) ( AVAILABLE ?auto_26166 ) ( SURFACE-AT ?auto_26131 ?auto_26187 ) ( ON ?auto_26131 ?auto_26172 ) ( CLEAR ?auto_26131 ) ( not ( = ?auto_26130 ?auto_26131 ) ) ( not ( = ?auto_26130 ?auto_26172 ) ) ( not ( = ?auto_26131 ?auto_26172 ) ) ( not ( = ?auto_26150 ?auto_26166 ) ) ( IS-CRATE ?auto_26130 ) ( not ( = ?auto_26165 ?auto_26147 ) ) ( HOIST-AT ?auto_26160 ?auto_26165 ) ( AVAILABLE ?auto_26160 ) ( SURFACE-AT ?auto_26130 ?auto_26165 ) ( ON ?auto_26130 ?auto_26158 ) ( CLEAR ?auto_26130 ) ( not ( = ?auto_26129 ?auto_26130 ) ) ( not ( = ?auto_26129 ?auto_26158 ) ) ( not ( = ?auto_26130 ?auto_26158 ) ) ( not ( = ?auto_26150 ?auto_26160 ) ) ( SURFACE-AT ?auto_26128 ?auto_26147 ) ( CLEAR ?auto_26128 ) ( IS-CRATE ?auto_26129 ) ( AVAILABLE ?auto_26150 ) ( AVAILABLE ?auto_26159 ) ( SURFACE-AT ?auto_26129 ?auto_26179 ) ( ON ?auto_26129 ?auto_26152 ) ( CLEAR ?auto_26129 ) ( TRUCK-AT ?auto_26145 ?auto_26147 ) ( not ( = ?auto_26128 ?auto_26129 ) ) ( not ( = ?auto_26128 ?auto_26152 ) ) ( not ( = ?auto_26129 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26130 ) ) ( not ( = ?auto_26128 ?auto_26158 ) ) ( not ( = ?auto_26130 ?auto_26152 ) ) ( not ( = ?auto_26165 ?auto_26179 ) ) ( not ( = ?auto_26160 ?auto_26159 ) ) ( not ( = ?auto_26158 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26131 ) ) ( not ( = ?auto_26128 ?auto_26172 ) ) ( not ( = ?auto_26129 ?auto_26131 ) ) ( not ( = ?auto_26129 ?auto_26172 ) ) ( not ( = ?auto_26131 ?auto_26158 ) ) ( not ( = ?auto_26131 ?auto_26152 ) ) ( not ( = ?auto_26187 ?auto_26165 ) ) ( not ( = ?auto_26187 ?auto_26179 ) ) ( not ( = ?auto_26166 ?auto_26160 ) ) ( not ( = ?auto_26166 ?auto_26159 ) ) ( not ( = ?auto_26172 ?auto_26158 ) ) ( not ( = ?auto_26172 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26132 ) ) ( not ( = ?auto_26128 ?auto_26177 ) ) ( not ( = ?auto_26129 ?auto_26132 ) ) ( not ( = ?auto_26129 ?auto_26177 ) ) ( not ( = ?auto_26130 ?auto_26132 ) ) ( not ( = ?auto_26130 ?auto_26177 ) ) ( not ( = ?auto_26132 ?auto_26172 ) ) ( not ( = ?auto_26132 ?auto_26158 ) ) ( not ( = ?auto_26132 ?auto_26152 ) ) ( not ( = ?auto_26177 ?auto_26172 ) ) ( not ( = ?auto_26177 ?auto_26158 ) ) ( not ( = ?auto_26177 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26133 ) ) ( not ( = ?auto_26128 ?auto_26169 ) ) ( not ( = ?auto_26129 ?auto_26133 ) ) ( not ( = ?auto_26129 ?auto_26169 ) ) ( not ( = ?auto_26130 ?auto_26133 ) ) ( not ( = ?auto_26130 ?auto_26169 ) ) ( not ( = ?auto_26131 ?auto_26133 ) ) ( not ( = ?auto_26131 ?auto_26169 ) ) ( not ( = ?auto_26133 ?auto_26177 ) ) ( not ( = ?auto_26133 ?auto_26172 ) ) ( not ( = ?auto_26133 ?auto_26158 ) ) ( not ( = ?auto_26133 ?auto_26152 ) ) ( not ( = ?auto_26180 ?auto_26179 ) ) ( not ( = ?auto_26180 ?auto_26187 ) ) ( not ( = ?auto_26180 ?auto_26165 ) ) ( not ( = ?auto_26173 ?auto_26159 ) ) ( not ( = ?auto_26173 ?auto_26166 ) ) ( not ( = ?auto_26173 ?auto_26160 ) ) ( not ( = ?auto_26169 ?auto_26177 ) ) ( not ( = ?auto_26169 ?auto_26172 ) ) ( not ( = ?auto_26169 ?auto_26158 ) ) ( not ( = ?auto_26169 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26134 ) ) ( not ( = ?auto_26128 ?auto_26178 ) ) ( not ( = ?auto_26129 ?auto_26134 ) ) ( not ( = ?auto_26129 ?auto_26178 ) ) ( not ( = ?auto_26130 ?auto_26134 ) ) ( not ( = ?auto_26130 ?auto_26178 ) ) ( not ( = ?auto_26131 ?auto_26134 ) ) ( not ( = ?auto_26131 ?auto_26178 ) ) ( not ( = ?auto_26132 ?auto_26134 ) ) ( not ( = ?auto_26132 ?auto_26178 ) ) ( not ( = ?auto_26134 ?auto_26169 ) ) ( not ( = ?auto_26134 ?auto_26177 ) ) ( not ( = ?auto_26134 ?auto_26172 ) ) ( not ( = ?auto_26134 ?auto_26158 ) ) ( not ( = ?auto_26134 ?auto_26152 ) ) ( not ( = ?auto_26183 ?auto_26180 ) ) ( not ( = ?auto_26183 ?auto_26179 ) ) ( not ( = ?auto_26183 ?auto_26187 ) ) ( not ( = ?auto_26183 ?auto_26165 ) ) ( not ( = ?auto_26174 ?auto_26173 ) ) ( not ( = ?auto_26174 ?auto_26159 ) ) ( not ( = ?auto_26174 ?auto_26166 ) ) ( not ( = ?auto_26174 ?auto_26160 ) ) ( not ( = ?auto_26178 ?auto_26169 ) ) ( not ( = ?auto_26178 ?auto_26177 ) ) ( not ( = ?auto_26178 ?auto_26172 ) ) ( not ( = ?auto_26178 ?auto_26158 ) ) ( not ( = ?auto_26178 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26135 ) ) ( not ( = ?auto_26128 ?auto_26186 ) ) ( not ( = ?auto_26129 ?auto_26135 ) ) ( not ( = ?auto_26129 ?auto_26186 ) ) ( not ( = ?auto_26130 ?auto_26135 ) ) ( not ( = ?auto_26130 ?auto_26186 ) ) ( not ( = ?auto_26131 ?auto_26135 ) ) ( not ( = ?auto_26131 ?auto_26186 ) ) ( not ( = ?auto_26132 ?auto_26135 ) ) ( not ( = ?auto_26132 ?auto_26186 ) ) ( not ( = ?auto_26133 ?auto_26135 ) ) ( not ( = ?auto_26133 ?auto_26186 ) ) ( not ( = ?auto_26135 ?auto_26178 ) ) ( not ( = ?auto_26135 ?auto_26169 ) ) ( not ( = ?auto_26135 ?auto_26177 ) ) ( not ( = ?auto_26135 ?auto_26172 ) ) ( not ( = ?auto_26135 ?auto_26158 ) ) ( not ( = ?auto_26135 ?auto_26152 ) ) ( not ( = ?auto_26155 ?auto_26183 ) ) ( not ( = ?auto_26155 ?auto_26180 ) ) ( not ( = ?auto_26155 ?auto_26179 ) ) ( not ( = ?auto_26155 ?auto_26187 ) ) ( not ( = ?auto_26155 ?auto_26165 ) ) ( not ( = ?auto_26153 ?auto_26174 ) ) ( not ( = ?auto_26153 ?auto_26173 ) ) ( not ( = ?auto_26153 ?auto_26159 ) ) ( not ( = ?auto_26153 ?auto_26166 ) ) ( not ( = ?auto_26153 ?auto_26160 ) ) ( not ( = ?auto_26186 ?auto_26178 ) ) ( not ( = ?auto_26186 ?auto_26169 ) ) ( not ( = ?auto_26186 ?auto_26177 ) ) ( not ( = ?auto_26186 ?auto_26172 ) ) ( not ( = ?auto_26186 ?auto_26158 ) ) ( not ( = ?auto_26186 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26136 ) ) ( not ( = ?auto_26128 ?auto_26171 ) ) ( not ( = ?auto_26129 ?auto_26136 ) ) ( not ( = ?auto_26129 ?auto_26171 ) ) ( not ( = ?auto_26130 ?auto_26136 ) ) ( not ( = ?auto_26130 ?auto_26171 ) ) ( not ( = ?auto_26131 ?auto_26136 ) ) ( not ( = ?auto_26131 ?auto_26171 ) ) ( not ( = ?auto_26132 ?auto_26136 ) ) ( not ( = ?auto_26132 ?auto_26171 ) ) ( not ( = ?auto_26133 ?auto_26136 ) ) ( not ( = ?auto_26133 ?auto_26171 ) ) ( not ( = ?auto_26134 ?auto_26136 ) ) ( not ( = ?auto_26134 ?auto_26171 ) ) ( not ( = ?auto_26136 ?auto_26186 ) ) ( not ( = ?auto_26136 ?auto_26178 ) ) ( not ( = ?auto_26136 ?auto_26169 ) ) ( not ( = ?auto_26136 ?auto_26177 ) ) ( not ( = ?auto_26136 ?auto_26172 ) ) ( not ( = ?auto_26136 ?auto_26158 ) ) ( not ( = ?auto_26136 ?auto_26152 ) ) ( not ( = ?auto_26151 ?auto_26155 ) ) ( not ( = ?auto_26151 ?auto_26183 ) ) ( not ( = ?auto_26151 ?auto_26180 ) ) ( not ( = ?auto_26151 ?auto_26179 ) ) ( not ( = ?auto_26151 ?auto_26187 ) ) ( not ( = ?auto_26151 ?auto_26165 ) ) ( not ( = ?auto_26182 ?auto_26153 ) ) ( not ( = ?auto_26182 ?auto_26174 ) ) ( not ( = ?auto_26182 ?auto_26173 ) ) ( not ( = ?auto_26182 ?auto_26159 ) ) ( not ( = ?auto_26182 ?auto_26166 ) ) ( not ( = ?auto_26182 ?auto_26160 ) ) ( not ( = ?auto_26171 ?auto_26186 ) ) ( not ( = ?auto_26171 ?auto_26178 ) ) ( not ( = ?auto_26171 ?auto_26169 ) ) ( not ( = ?auto_26171 ?auto_26177 ) ) ( not ( = ?auto_26171 ?auto_26172 ) ) ( not ( = ?auto_26171 ?auto_26158 ) ) ( not ( = ?auto_26171 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26137 ) ) ( not ( = ?auto_26128 ?auto_26161 ) ) ( not ( = ?auto_26129 ?auto_26137 ) ) ( not ( = ?auto_26129 ?auto_26161 ) ) ( not ( = ?auto_26130 ?auto_26137 ) ) ( not ( = ?auto_26130 ?auto_26161 ) ) ( not ( = ?auto_26131 ?auto_26137 ) ) ( not ( = ?auto_26131 ?auto_26161 ) ) ( not ( = ?auto_26132 ?auto_26137 ) ) ( not ( = ?auto_26132 ?auto_26161 ) ) ( not ( = ?auto_26133 ?auto_26137 ) ) ( not ( = ?auto_26133 ?auto_26161 ) ) ( not ( = ?auto_26134 ?auto_26137 ) ) ( not ( = ?auto_26134 ?auto_26161 ) ) ( not ( = ?auto_26135 ?auto_26137 ) ) ( not ( = ?auto_26135 ?auto_26161 ) ) ( not ( = ?auto_26137 ?auto_26171 ) ) ( not ( = ?auto_26137 ?auto_26186 ) ) ( not ( = ?auto_26137 ?auto_26178 ) ) ( not ( = ?auto_26137 ?auto_26169 ) ) ( not ( = ?auto_26137 ?auto_26177 ) ) ( not ( = ?auto_26137 ?auto_26172 ) ) ( not ( = ?auto_26137 ?auto_26158 ) ) ( not ( = ?auto_26137 ?auto_26152 ) ) ( not ( = ?auto_26149 ?auto_26151 ) ) ( not ( = ?auto_26149 ?auto_26155 ) ) ( not ( = ?auto_26149 ?auto_26183 ) ) ( not ( = ?auto_26149 ?auto_26180 ) ) ( not ( = ?auto_26149 ?auto_26179 ) ) ( not ( = ?auto_26149 ?auto_26187 ) ) ( not ( = ?auto_26149 ?auto_26165 ) ) ( not ( = ?auto_26148 ?auto_26182 ) ) ( not ( = ?auto_26148 ?auto_26153 ) ) ( not ( = ?auto_26148 ?auto_26174 ) ) ( not ( = ?auto_26148 ?auto_26173 ) ) ( not ( = ?auto_26148 ?auto_26159 ) ) ( not ( = ?auto_26148 ?auto_26166 ) ) ( not ( = ?auto_26148 ?auto_26160 ) ) ( not ( = ?auto_26161 ?auto_26171 ) ) ( not ( = ?auto_26161 ?auto_26186 ) ) ( not ( = ?auto_26161 ?auto_26178 ) ) ( not ( = ?auto_26161 ?auto_26169 ) ) ( not ( = ?auto_26161 ?auto_26177 ) ) ( not ( = ?auto_26161 ?auto_26172 ) ) ( not ( = ?auto_26161 ?auto_26158 ) ) ( not ( = ?auto_26161 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26138 ) ) ( not ( = ?auto_26128 ?auto_26154 ) ) ( not ( = ?auto_26129 ?auto_26138 ) ) ( not ( = ?auto_26129 ?auto_26154 ) ) ( not ( = ?auto_26130 ?auto_26138 ) ) ( not ( = ?auto_26130 ?auto_26154 ) ) ( not ( = ?auto_26131 ?auto_26138 ) ) ( not ( = ?auto_26131 ?auto_26154 ) ) ( not ( = ?auto_26132 ?auto_26138 ) ) ( not ( = ?auto_26132 ?auto_26154 ) ) ( not ( = ?auto_26133 ?auto_26138 ) ) ( not ( = ?auto_26133 ?auto_26154 ) ) ( not ( = ?auto_26134 ?auto_26138 ) ) ( not ( = ?auto_26134 ?auto_26154 ) ) ( not ( = ?auto_26135 ?auto_26138 ) ) ( not ( = ?auto_26135 ?auto_26154 ) ) ( not ( = ?auto_26136 ?auto_26138 ) ) ( not ( = ?auto_26136 ?auto_26154 ) ) ( not ( = ?auto_26138 ?auto_26161 ) ) ( not ( = ?auto_26138 ?auto_26171 ) ) ( not ( = ?auto_26138 ?auto_26186 ) ) ( not ( = ?auto_26138 ?auto_26178 ) ) ( not ( = ?auto_26138 ?auto_26169 ) ) ( not ( = ?auto_26138 ?auto_26177 ) ) ( not ( = ?auto_26138 ?auto_26172 ) ) ( not ( = ?auto_26138 ?auto_26158 ) ) ( not ( = ?auto_26138 ?auto_26152 ) ) ( not ( = ?auto_26162 ?auto_26149 ) ) ( not ( = ?auto_26162 ?auto_26151 ) ) ( not ( = ?auto_26162 ?auto_26155 ) ) ( not ( = ?auto_26162 ?auto_26183 ) ) ( not ( = ?auto_26162 ?auto_26180 ) ) ( not ( = ?auto_26162 ?auto_26179 ) ) ( not ( = ?auto_26162 ?auto_26187 ) ) ( not ( = ?auto_26162 ?auto_26165 ) ) ( not ( = ?auto_26176 ?auto_26148 ) ) ( not ( = ?auto_26176 ?auto_26182 ) ) ( not ( = ?auto_26176 ?auto_26153 ) ) ( not ( = ?auto_26176 ?auto_26174 ) ) ( not ( = ?auto_26176 ?auto_26173 ) ) ( not ( = ?auto_26176 ?auto_26159 ) ) ( not ( = ?auto_26176 ?auto_26166 ) ) ( not ( = ?auto_26176 ?auto_26160 ) ) ( not ( = ?auto_26154 ?auto_26161 ) ) ( not ( = ?auto_26154 ?auto_26171 ) ) ( not ( = ?auto_26154 ?auto_26186 ) ) ( not ( = ?auto_26154 ?auto_26178 ) ) ( not ( = ?auto_26154 ?auto_26169 ) ) ( not ( = ?auto_26154 ?auto_26177 ) ) ( not ( = ?auto_26154 ?auto_26172 ) ) ( not ( = ?auto_26154 ?auto_26158 ) ) ( not ( = ?auto_26154 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26139 ) ) ( not ( = ?auto_26128 ?auto_26185 ) ) ( not ( = ?auto_26129 ?auto_26139 ) ) ( not ( = ?auto_26129 ?auto_26185 ) ) ( not ( = ?auto_26130 ?auto_26139 ) ) ( not ( = ?auto_26130 ?auto_26185 ) ) ( not ( = ?auto_26131 ?auto_26139 ) ) ( not ( = ?auto_26131 ?auto_26185 ) ) ( not ( = ?auto_26132 ?auto_26139 ) ) ( not ( = ?auto_26132 ?auto_26185 ) ) ( not ( = ?auto_26133 ?auto_26139 ) ) ( not ( = ?auto_26133 ?auto_26185 ) ) ( not ( = ?auto_26134 ?auto_26139 ) ) ( not ( = ?auto_26134 ?auto_26185 ) ) ( not ( = ?auto_26135 ?auto_26139 ) ) ( not ( = ?auto_26135 ?auto_26185 ) ) ( not ( = ?auto_26136 ?auto_26139 ) ) ( not ( = ?auto_26136 ?auto_26185 ) ) ( not ( = ?auto_26137 ?auto_26139 ) ) ( not ( = ?auto_26137 ?auto_26185 ) ) ( not ( = ?auto_26139 ?auto_26154 ) ) ( not ( = ?auto_26139 ?auto_26161 ) ) ( not ( = ?auto_26139 ?auto_26171 ) ) ( not ( = ?auto_26139 ?auto_26186 ) ) ( not ( = ?auto_26139 ?auto_26178 ) ) ( not ( = ?auto_26139 ?auto_26169 ) ) ( not ( = ?auto_26139 ?auto_26177 ) ) ( not ( = ?auto_26139 ?auto_26172 ) ) ( not ( = ?auto_26139 ?auto_26158 ) ) ( not ( = ?auto_26139 ?auto_26152 ) ) ( not ( = ?auto_26156 ?auto_26162 ) ) ( not ( = ?auto_26156 ?auto_26149 ) ) ( not ( = ?auto_26156 ?auto_26151 ) ) ( not ( = ?auto_26156 ?auto_26155 ) ) ( not ( = ?auto_26156 ?auto_26183 ) ) ( not ( = ?auto_26156 ?auto_26180 ) ) ( not ( = ?auto_26156 ?auto_26179 ) ) ( not ( = ?auto_26156 ?auto_26187 ) ) ( not ( = ?auto_26156 ?auto_26165 ) ) ( not ( = ?auto_26184 ?auto_26176 ) ) ( not ( = ?auto_26184 ?auto_26148 ) ) ( not ( = ?auto_26184 ?auto_26182 ) ) ( not ( = ?auto_26184 ?auto_26153 ) ) ( not ( = ?auto_26184 ?auto_26174 ) ) ( not ( = ?auto_26184 ?auto_26173 ) ) ( not ( = ?auto_26184 ?auto_26159 ) ) ( not ( = ?auto_26184 ?auto_26166 ) ) ( not ( = ?auto_26184 ?auto_26160 ) ) ( not ( = ?auto_26185 ?auto_26154 ) ) ( not ( = ?auto_26185 ?auto_26161 ) ) ( not ( = ?auto_26185 ?auto_26171 ) ) ( not ( = ?auto_26185 ?auto_26186 ) ) ( not ( = ?auto_26185 ?auto_26178 ) ) ( not ( = ?auto_26185 ?auto_26169 ) ) ( not ( = ?auto_26185 ?auto_26177 ) ) ( not ( = ?auto_26185 ?auto_26172 ) ) ( not ( = ?auto_26185 ?auto_26158 ) ) ( not ( = ?auto_26185 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26140 ) ) ( not ( = ?auto_26128 ?auto_26170 ) ) ( not ( = ?auto_26129 ?auto_26140 ) ) ( not ( = ?auto_26129 ?auto_26170 ) ) ( not ( = ?auto_26130 ?auto_26140 ) ) ( not ( = ?auto_26130 ?auto_26170 ) ) ( not ( = ?auto_26131 ?auto_26140 ) ) ( not ( = ?auto_26131 ?auto_26170 ) ) ( not ( = ?auto_26132 ?auto_26140 ) ) ( not ( = ?auto_26132 ?auto_26170 ) ) ( not ( = ?auto_26133 ?auto_26140 ) ) ( not ( = ?auto_26133 ?auto_26170 ) ) ( not ( = ?auto_26134 ?auto_26140 ) ) ( not ( = ?auto_26134 ?auto_26170 ) ) ( not ( = ?auto_26135 ?auto_26140 ) ) ( not ( = ?auto_26135 ?auto_26170 ) ) ( not ( = ?auto_26136 ?auto_26140 ) ) ( not ( = ?auto_26136 ?auto_26170 ) ) ( not ( = ?auto_26137 ?auto_26140 ) ) ( not ( = ?auto_26137 ?auto_26170 ) ) ( not ( = ?auto_26138 ?auto_26140 ) ) ( not ( = ?auto_26138 ?auto_26170 ) ) ( not ( = ?auto_26140 ?auto_26185 ) ) ( not ( = ?auto_26140 ?auto_26154 ) ) ( not ( = ?auto_26140 ?auto_26161 ) ) ( not ( = ?auto_26140 ?auto_26171 ) ) ( not ( = ?auto_26140 ?auto_26186 ) ) ( not ( = ?auto_26140 ?auto_26178 ) ) ( not ( = ?auto_26140 ?auto_26169 ) ) ( not ( = ?auto_26140 ?auto_26177 ) ) ( not ( = ?auto_26140 ?auto_26172 ) ) ( not ( = ?auto_26140 ?auto_26158 ) ) ( not ( = ?auto_26140 ?auto_26152 ) ) ( not ( = ?auto_26170 ?auto_26185 ) ) ( not ( = ?auto_26170 ?auto_26154 ) ) ( not ( = ?auto_26170 ?auto_26161 ) ) ( not ( = ?auto_26170 ?auto_26171 ) ) ( not ( = ?auto_26170 ?auto_26186 ) ) ( not ( = ?auto_26170 ?auto_26178 ) ) ( not ( = ?auto_26170 ?auto_26169 ) ) ( not ( = ?auto_26170 ?auto_26177 ) ) ( not ( = ?auto_26170 ?auto_26172 ) ) ( not ( = ?auto_26170 ?auto_26158 ) ) ( not ( = ?auto_26170 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26141 ) ) ( not ( = ?auto_26128 ?auto_26167 ) ) ( not ( = ?auto_26129 ?auto_26141 ) ) ( not ( = ?auto_26129 ?auto_26167 ) ) ( not ( = ?auto_26130 ?auto_26141 ) ) ( not ( = ?auto_26130 ?auto_26167 ) ) ( not ( = ?auto_26131 ?auto_26141 ) ) ( not ( = ?auto_26131 ?auto_26167 ) ) ( not ( = ?auto_26132 ?auto_26141 ) ) ( not ( = ?auto_26132 ?auto_26167 ) ) ( not ( = ?auto_26133 ?auto_26141 ) ) ( not ( = ?auto_26133 ?auto_26167 ) ) ( not ( = ?auto_26134 ?auto_26141 ) ) ( not ( = ?auto_26134 ?auto_26167 ) ) ( not ( = ?auto_26135 ?auto_26141 ) ) ( not ( = ?auto_26135 ?auto_26167 ) ) ( not ( = ?auto_26136 ?auto_26141 ) ) ( not ( = ?auto_26136 ?auto_26167 ) ) ( not ( = ?auto_26137 ?auto_26141 ) ) ( not ( = ?auto_26137 ?auto_26167 ) ) ( not ( = ?auto_26138 ?auto_26141 ) ) ( not ( = ?auto_26138 ?auto_26167 ) ) ( not ( = ?auto_26139 ?auto_26141 ) ) ( not ( = ?auto_26139 ?auto_26167 ) ) ( not ( = ?auto_26141 ?auto_26170 ) ) ( not ( = ?auto_26141 ?auto_26185 ) ) ( not ( = ?auto_26141 ?auto_26154 ) ) ( not ( = ?auto_26141 ?auto_26161 ) ) ( not ( = ?auto_26141 ?auto_26171 ) ) ( not ( = ?auto_26141 ?auto_26186 ) ) ( not ( = ?auto_26141 ?auto_26178 ) ) ( not ( = ?auto_26141 ?auto_26169 ) ) ( not ( = ?auto_26141 ?auto_26177 ) ) ( not ( = ?auto_26141 ?auto_26172 ) ) ( not ( = ?auto_26141 ?auto_26158 ) ) ( not ( = ?auto_26141 ?auto_26152 ) ) ( not ( = ?auto_26167 ?auto_26170 ) ) ( not ( = ?auto_26167 ?auto_26185 ) ) ( not ( = ?auto_26167 ?auto_26154 ) ) ( not ( = ?auto_26167 ?auto_26161 ) ) ( not ( = ?auto_26167 ?auto_26171 ) ) ( not ( = ?auto_26167 ?auto_26186 ) ) ( not ( = ?auto_26167 ?auto_26178 ) ) ( not ( = ?auto_26167 ?auto_26169 ) ) ( not ( = ?auto_26167 ?auto_26177 ) ) ( not ( = ?auto_26167 ?auto_26172 ) ) ( not ( = ?auto_26167 ?auto_26158 ) ) ( not ( = ?auto_26167 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26142 ) ) ( not ( = ?auto_26128 ?auto_26157 ) ) ( not ( = ?auto_26129 ?auto_26142 ) ) ( not ( = ?auto_26129 ?auto_26157 ) ) ( not ( = ?auto_26130 ?auto_26142 ) ) ( not ( = ?auto_26130 ?auto_26157 ) ) ( not ( = ?auto_26131 ?auto_26142 ) ) ( not ( = ?auto_26131 ?auto_26157 ) ) ( not ( = ?auto_26132 ?auto_26142 ) ) ( not ( = ?auto_26132 ?auto_26157 ) ) ( not ( = ?auto_26133 ?auto_26142 ) ) ( not ( = ?auto_26133 ?auto_26157 ) ) ( not ( = ?auto_26134 ?auto_26142 ) ) ( not ( = ?auto_26134 ?auto_26157 ) ) ( not ( = ?auto_26135 ?auto_26142 ) ) ( not ( = ?auto_26135 ?auto_26157 ) ) ( not ( = ?auto_26136 ?auto_26142 ) ) ( not ( = ?auto_26136 ?auto_26157 ) ) ( not ( = ?auto_26137 ?auto_26142 ) ) ( not ( = ?auto_26137 ?auto_26157 ) ) ( not ( = ?auto_26138 ?auto_26142 ) ) ( not ( = ?auto_26138 ?auto_26157 ) ) ( not ( = ?auto_26139 ?auto_26142 ) ) ( not ( = ?auto_26139 ?auto_26157 ) ) ( not ( = ?auto_26140 ?auto_26142 ) ) ( not ( = ?auto_26140 ?auto_26157 ) ) ( not ( = ?auto_26142 ?auto_26167 ) ) ( not ( = ?auto_26142 ?auto_26170 ) ) ( not ( = ?auto_26142 ?auto_26185 ) ) ( not ( = ?auto_26142 ?auto_26154 ) ) ( not ( = ?auto_26142 ?auto_26161 ) ) ( not ( = ?auto_26142 ?auto_26171 ) ) ( not ( = ?auto_26142 ?auto_26186 ) ) ( not ( = ?auto_26142 ?auto_26178 ) ) ( not ( = ?auto_26142 ?auto_26169 ) ) ( not ( = ?auto_26142 ?auto_26177 ) ) ( not ( = ?auto_26142 ?auto_26172 ) ) ( not ( = ?auto_26142 ?auto_26158 ) ) ( not ( = ?auto_26142 ?auto_26152 ) ) ( not ( = ?auto_26164 ?auto_26180 ) ) ( not ( = ?auto_26164 ?auto_26162 ) ) ( not ( = ?auto_26164 ?auto_26156 ) ) ( not ( = ?auto_26164 ?auto_26149 ) ) ( not ( = ?auto_26164 ?auto_26151 ) ) ( not ( = ?auto_26164 ?auto_26155 ) ) ( not ( = ?auto_26164 ?auto_26183 ) ) ( not ( = ?auto_26164 ?auto_26179 ) ) ( not ( = ?auto_26164 ?auto_26187 ) ) ( not ( = ?auto_26164 ?auto_26165 ) ) ( not ( = ?auto_26168 ?auto_26173 ) ) ( not ( = ?auto_26168 ?auto_26176 ) ) ( not ( = ?auto_26168 ?auto_26184 ) ) ( not ( = ?auto_26168 ?auto_26148 ) ) ( not ( = ?auto_26168 ?auto_26182 ) ) ( not ( = ?auto_26168 ?auto_26153 ) ) ( not ( = ?auto_26168 ?auto_26174 ) ) ( not ( = ?auto_26168 ?auto_26159 ) ) ( not ( = ?auto_26168 ?auto_26166 ) ) ( not ( = ?auto_26168 ?auto_26160 ) ) ( not ( = ?auto_26157 ?auto_26167 ) ) ( not ( = ?auto_26157 ?auto_26170 ) ) ( not ( = ?auto_26157 ?auto_26185 ) ) ( not ( = ?auto_26157 ?auto_26154 ) ) ( not ( = ?auto_26157 ?auto_26161 ) ) ( not ( = ?auto_26157 ?auto_26171 ) ) ( not ( = ?auto_26157 ?auto_26186 ) ) ( not ( = ?auto_26157 ?auto_26178 ) ) ( not ( = ?auto_26157 ?auto_26169 ) ) ( not ( = ?auto_26157 ?auto_26177 ) ) ( not ( = ?auto_26157 ?auto_26172 ) ) ( not ( = ?auto_26157 ?auto_26158 ) ) ( not ( = ?auto_26157 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26143 ) ) ( not ( = ?auto_26128 ?auto_26175 ) ) ( not ( = ?auto_26129 ?auto_26143 ) ) ( not ( = ?auto_26129 ?auto_26175 ) ) ( not ( = ?auto_26130 ?auto_26143 ) ) ( not ( = ?auto_26130 ?auto_26175 ) ) ( not ( = ?auto_26131 ?auto_26143 ) ) ( not ( = ?auto_26131 ?auto_26175 ) ) ( not ( = ?auto_26132 ?auto_26143 ) ) ( not ( = ?auto_26132 ?auto_26175 ) ) ( not ( = ?auto_26133 ?auto_26143 ) ) ( not ( = ?auto_26133 ?auto_26175 ) ) ( not ( = ?auto_26134 ?auto_26143 ) ) ( not ( = ?auto_26134 ?auto_26175 ) ) ( not ( = ?auto_26135 ?auto_26143 ) ) ( not ( = ?auto_26135 ?auto_26175 ) ) ( not ( = ?auto_26136 ?auto_26143 ) ) ( not ( = ?auto_26136 ?auto_26175 ) ) ( not ( = ?auto_26137 ?auto_26143 ) ) ( not ( = ?auto_26137 ?auto_26175 ) ) ( not ( = ?auto_26138 ?auto_26143 ) ) ( not ( = ?auto_26138 ?auto_26175 ) ) ( not ( = ?auto_26139 ?auto_26143 ) ) ( not ( = ?auto_26139 ?auto_26175 ) ) ( not ( = ?auto_26140 ?auto_26143 ) ) ( not ( = ?auto_26140 ?auto_26175 ) ) ( not ( = ?auto_26141 ?auto_26143 ) ) ( not ( = ?auto_26141 ?auto_26175 ) ) ( not ( = ?auto_26143 ?auto_26157 ) ) ( not ( = ?auto_26143 ?auto_26167 ) ) ( not ( = ?auto_26143 ?auto_26170 ) ) ( not ( = ?auto_26143 ?auto_26185 ) ) ( not ( = ?auto_26143 ?auto_26154 ) ) ( not ( = ?auto_26143 ?auto_26161 ) ) ( not ( = ?auto_26143 ?auto_26171 ) ) ( not ( = ?auto_26143 ?auto_26186 ) ) ( not ( = ?auto_26143 ?auto_26178 ) ) ( not ( = ?auto_26143 ?auto_26169 ) ) ( not ( = ?auto_26143 ?auto_26177 ) ) ( not ( = ?auto_26143 ?auto_26172 ) ) ( not ( = ?auto_26143 ?auto_26158 ) ) ( not ( = ?auto_26143 ?auto_26152 ) ) ( not ( = ?auto_26181 ?auto_26164 ) ) ( not ( = ?auto_26181 ?auto_26180 ) ) ( not ( = ?auto_26181 ?auto_26162 ) ) ( not ( = ?auto_26181 ?auto_26156 ) ) ( not ( = ?auto_26181 ?auto_26149 ) ) ( not ( = ?auto_26181 ?auto_26151 ) ) ( not ( = ?auto_26181 ?auto_26155 ) ) ( not ( = ?auto_26181 ?auto_26183 ) ) ( not ( = ?auto_26181 ?auto_26179 ) ) ( not ( = ?auto_26181 ?auto_26187 ) ) ( not ( = ?auto_26181 ?auto_26165 ) ) ( not ( = ?auto_26163 ?auto_26168 ) ) ( not ( = ?auto_26163 ?auto_26173 ) ) ( not ( = ?auto_26163 ?auto_26176 ) ) ( not ( = ?auto_26163 ?auto_26184 ) ) ( not ( = ?auto_26163 ?auto_26148 ) ) ( not ( = ?auto_26163 ?auto_26182 ) ) ( not ( = ?auto_26163 ?auto_26153 ) ) ( not ( = ?auto_26163 ?auto_26174 ) ) ( not ( = ?auto_26163 ?auto_26159 ) ) ( not ( = ?auto_26163 ?auto_26166 ) ) ( not ( = ?auto_26163 ?auto_26160 ) ) ( not ( = ?auto_26175 ?auto_26157 ) ) ( not ( = ?auto_26175 ?auto_26167 ) ) ( not ( = ?auto_26175 ?auto_26170 ) ) ( not ( = ?auto_26175 ?auto_26185 ) ) ( not ( = ?auto_26175 ?auto_26154 ) ) ( not ( = ?auto_26175 ?auto_26161 ) ) ( not ( = ?auto_26175 ?auto_26171 ) ) ( not ( = ?auto_26175 ?auto_26186 ) ) ( not ( = ?auto_26175 ?auto_26178 ) ) ( not ( = ?auto_26175 ?auto_26169 ) ) ( not ( = ?auto_26175 ?auto_26177 ) ) ( not ( = ?auto_26175 ?auto_26172 ) ) ( not ( = ?auto_26175 ?auto_26158 ) ) ( not ( = ?auto_26175 ?auto_26152 ) ) ( not ( = ?auto_26128 ?auto_26144 ) ) ( not ( = ?auto_26128 ?auto_26146 ) ) ( not ( = ?auto_26129 ?auto_26144 ) ) ( not ( = ?auto_26129 ?auto_26146 ) ) ( not ( = ?auto_26130 ?auto_26144 ) ) ( not ( = ?auto_26130 ?auto_26146 ) ) ( not ( = ?auto_26131 ?auto_26144 ) ) ( not ( = ?auto_26131 ?auto_26146 ) ) ( not ( = ?auto_26132 ?auto_26144 ) ) ( not ( = ?auto_26132 ?auto_26146 ) ) ( not ( = ?auto_26133 ?auto_26144 ) ) ( not ( = ?auto_26133 ?auto_26146 ) ) ( not ( = ?auto_26134 ?auto_26144 ) ) ( not ( = ?auto_26134 ?auto_26146 ) ) ( not ( = ?auto_26135 ?auto_26144 ) ) ( not ( = ?auto_26135 ?auto_26146 ) ) ( not ( = ?auto_26136 ?auto_26144 ) ) ( not ( = ?auto_26136 ?auto_26146 ) ) ( not ( = ?auto_26137 ?auto_26144 ) ) ( not ( = ?auto_26137 ?auto_26146 ) ) ( not ( = ?auto_26138 ?auto_26144 ) ) ( not ( = ?auto_26138 ?auto_26146 ) ) ( not ( = ?auto_26139 ?auto_26144 ) ) ( not ( = ?auto_26139 ?auto_26146 ) ) ( not ( = ?auto_26140 ?auto_26144 ) ) ( not ( = ?auto_26140 ?auto_26146 ) ) ( not ( = ?auto_26141 ?auto_26144 ) ) ( not ( = ?auto_26141 ?auto_26146 ) ) ( not ( = ?auto_26142 ?auto_26144 ) ) ( not ( = ?auto_26142 ?auto_26146 ) ) ( not ( = ?auto_26144 ?auto_26175 ) ) ( not ( = ?auto_26144 ?auto_26157 ) ) ( not ( = ?auto_26144 ?auto_26167 ) ) ( not ( = ?auto_26144 ?auto_26170 ) ) ( not ( = ?auto_26144 ?auto_26185 ) ) ( not ( = ?auto_26144 ?auto_26154 ) ) ( not ( = ?auto_26144 ?auto_26161 ) ) ( not ( = ?auto_26144 ?auto_26171 ) ) ( not ( = ?auto_26144 ?auto_26186 ) ) ( not ( = ?auto_26144 ?auto_26178 ) ) ( not ( = ?auto_26144 ?auto_26169 ) ) ( not ( = ?auto_26144 ?auto_26177 ) ) ( not ( = ?auto_26144 ?auto_26172 ) ) ( not ( = ?auto_26144 ?auto_26158 ) ) ( not ( = ?auto_26144 ?auto_26152 ) ) ( not ( = ?auto_26146 ?auto_26175 ) ) ( not ( = ?auto_26146 ?auto_26157 ) ) ( not ( = ?auto_26146 ?auto_26167 ) ) ( not ( = ?auto_26146 ?auto_26170 ) ) ( not ( = ?auto_26146 ?auto_26185 ) ) ( not ( = ?auto_26146 ?auto_26154 ) ) ( not ( = ?auto_26146 ?auto_26161 ) ) ( not ( = ?auto_26146 ?auto_26171 ) ) ( not ( = ?auto_26146 ?auto_26186 ) ) ( not ( = ?auto_26146 ?auto_26178 ) ) ( not ( = ?auto_26146 ?auto_26169 ) ) ( not ( = ?auto_26146 ?auto_26177 ) ) ( not ( = ?auto_26146 ?auto_26172 ) ) ( not ( = ?auto_26146 ?auto_26158 ) ) ( not ( = ?auto_26146 ?auto_26152 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_26128 ?auto_26129 ?auto_26130 ?auto_26131 ?auto_26132 ?auto_26133 ?auto_26134 ?auto_26135 ?auto_26136 ?auto_26137 ?auto_26138 ?auto_26139 ?auto_26140 ?auto_26141 ?auto_26142 ?auto_26143 )
      ( MAKE-1CRATE ?auto_26143 ?auto_26144 )
      ( MAKE-16CRATE-VERIFY ?auto_26128 ?auto_26129 ?auto_26130 ?auto_26131 ?auto_26132 ?auto_26133 ?auto_26134 ?auto_26135 ?auto_26136 ?auto_26137 ?auto_26138 ?auto_26139 ?auto_26140 ?auto_26141 ?auto_26142 ?auto_26143 ?auto_26144 ) )
  )

)

