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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25336 - SURFACE
      ?auto_25337 - SURFACE
    )
    :vars
    (
      ?auto_25338 - HOIST
      ?auto_25339 - PLACE
      ?auto_25341 - PLACE
      ?auto_25342 - HOIST
      ?auto_25343 - SURFACE
      ?auto_25340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25338 ?auto_25339 ) ( SURFACE-AT ?auto_25336 ?auto_25339 ) ( CLEAR ?auto_25336 ) ( IS-CRATE ?auto_25337 ) ( AVAILABLE ?auto_25338 ) ( not ( = ?auto_25341 ?auto_25339 ) ) ( HOIST-AT ?auto_25342 ?auto_25341 ) ( AVAILABLE ?auto_25342 ) ( SURFACE-AT ?auto_25337 ?auto_25341 ) ( ON ?auto_25337 ?auto_25343 ) ( CLEAR ?auto_25337 ) ( TRUCK-AT ?auto_25340 ?auto_25339 ) ( not ( = ?auto_25336 ?auto_25337 ) ) ( not ( = ?auto_25336 ?auto_25343 ) ) ( not ( = ?auto_25337 ?auto_25343 ) ) ( not ( = ?auto_25338 ?auto_25342 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25340 ?auto_25339 ?auto_25341 )
      ( !LIFT ?auto_25342 ?auto_25337 ?auto_25343 ?auto_25341 )
      ( !LOAD ?auto_25342 ?auto_25337 ?auto_25340 ?auto_25341 )
      ( !DRIVE ?auto_25340 ?auto_25341 ?auto_25339 )
      ( !UNLOAD ?auto_25338 ?auto_25337 ?auto_25340 ?auto_25339 )
      ( !DROP ?auto_25338 ?auto_25337 ?auto_25336 ?auto_25339 )
      ( MAKE-1CRATE-VERIFY ?auto_25336 ?auto_25337 ) )
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
      ?auto_25355 - HOIST
      ?auto_25354 - PLACE
      ?auto_25353 - PLACE
      ?auto_25351 - HOIST
      ?auto_25352 - SURFACE
      ?auto_25357 - PLACE
      ?auto_25356 - HOIST
      ?auto_25358 - SURFACE
      ?auto_25350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25355 ?auto_25354 ) ( IS-CRATE ?auto_25349 ) ( not ( = ?auto_25353 ?auto_25354 ) ) ( HOIST-AT ?auto_25351 ?auto_25353 ) ( AVAILABLE ?auto_25351 ) ( SURFACE-AT ?auto_25349 ?auto_25353 ) ( ON ?auto_25349 ?auto_25352 ) ( CLEAR ?auto_25349 ) ( not ( = ?auto_25348 ?auto_25349 ) ) ( not ( = ?auto_25348 ?auto_25352 ) ) ( not ( = ?auto_25349 ?auto_25352 ) ) ( not ( = ?auto_25355 ?auto_25351 ) ) ( SURFACE-AT ?auto_25347 ?auto_25354 ) ( CLEAR ?auto_25347 ) ( IS-CRATE ?auto_25348 ) ( AVAILABLE ?auto_25355 ) ( not ( = ?auto_25357 ?auto_25354 ) ) ( HOIST-AT ?auto_25356 ?auto_25357 ) ( AVAILABLE ?auto_25356 ) ( SURFACE-AT ?auto_25348 ?auto_25357 ) ( ON ?auto_25348 ?auto_25358 ) ( CLEAR ?auto_25348 ) ( TRUCK-AT ?auto_25350 ?auto_25354 ) ( not ( = ?auto_25347 ?auto_25348 ) ) ( not ( = ?auto_25347 ?auto_25358 ) ) ( not ( = ?auto_25348 ?auto_25358 ) ) ( not ( = ?auto_25355 ?auto_25356 ) ) ( not ( = ?auto_25347 ?auto_25349 ) ) ( not ( = ?auto_25347 ?auto_25352 ) ) ( not ( = ?auto_25349 ?auto_25358 ) ) ( not ( = ?auto_25353 ?auto_25357 ) ) ( not ( = ?auto_25351 ?auto_25356 ) ) ( not ( = ?auto_25352 ?auto_25358 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25347 ?auto_25348 )
      ( MAKE-1CRATE ?auto_25348 ?auto_25349 )
      ( MAKE-2CRATE-VERIFY ?auto_25347 ?auto_25348 ?auto_25349 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25361 - SURFACE
      ?auto_25362 - SURFACE
    )
    :vars
    (
      ?auto_25363 - HOIST
      ?auto_25364 - PLACE
      ?auto_25366 - PLACE
      ?auto_25367 - HOIST
      ?auto_25368 - SURFACE
      ?auto_25365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25363 ?auto_25364 ) ( SURFACE-AT ?auto_25361 ?auto_25364 ) ( CLEAR ?auto_25361 ) ( IS-CRATE ?auto_25362 ) ( AVAILABLE ?auto_25363 ) ( not ( = ?auto_25366 ?auto_25364 ) ) ( HOIST-AT ?auto_25367 ?auto_25366 ) ( AVAILABLE ?auto_25367 ) ( SURFACE-AT ?auto_25362 ?auto_25366 ) ( ON ?auto_25362 ?auto_25368 ) ( CLEAR ?auto_25362 ) ( TRUCK-AT ?auto_25365 ?auto_25364 ) ( not ( = ?auto_25361 ?auto_25362 ) ) ( not ( = ?auto_25361 ?auto_25368 ) ) ( not ( = ?auto_25362 ?auto_25368 ) ) ( not ( = ?auto_25363 ?auto_25367 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25365 ?auto_25364 ?auto_25366 )
      ( !LIFT ?auto_25367 ?auto_25362 ?auto_25368 ?auto_25366 )
      ( !LOAD ?auto_25367 ?auto_25362 ?auto_25365 ?auto_25366 )
      ( !DRIVE ?auto_25365 ?auto_25366 ?auto_25364 )
      ( !UNLOAD ?auto_25363 ?auto_25362 ?auto_25365 ?auto_25364 )
      ( !DROP ?auto_25363 ?auto_25362 ?auto_25361 ?auto_25364 )
      ( MAKE-1CRATE-VERIFY ?auto_25361 ?auto_25362 ) )
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
      ?auto_25380 - HOIST
      ?auto_25378 - PLACE
      ?auto_25379 - PLACE
      ?auto_25381 - HOIST
      ?auto_25382 - SURFACE
      ?auto_25383 - PLACE
      ?auto_25388 - HOIST
      ?auto_25387 - SURFACE
      ?auto_25385 - PLACE
      ?auto_25384 - HOIST
      ?auto_25386 - SURFACE
      ?auto_25377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25380 ?auto_25378 ) ( IS-CRATE ?auto_25376 ) ( not ( = ?auto_25379 ?auto_25378 ) ) ( HOIST-AT ?auto_25381 ?auto_25379 ) ( AVAILABLE ?auto_25381 ) ( SURFACE-AT ?auto_25376 ?auto_25379 ) ( ON ?auto_25376 ?auto_25382 ) ( CLEAR ?auto_25376 ) ( not ( = ?auto_25375 ?auto_25376 ) ) ( not ( = ?auto_25375 ?auto_25382 ) ) ( not ( = ?auto_25376 ?auto_25382 ) ) ( not ( = ?auto_25380 ?auto_25381 ) ) ( IS-CRATE ?auto_25375 ) ( not ( = ?auto_25383 ?auto_25378 ) ) ( HOIST-AT ?auto_25388 ?auto_25383 ) ( AVAILABLE ?auto_25388 ) ( SURFACE-AT ?auto_25375 ?auto_25383 ) ( ON ?auto_25375 ?auto_25387 ) ( CLEAR ?auto_25375 ) ( not ( = ?auto_25374 ?auto_25375 ) ) ( not ( = ?auto_25374 ?auto_25387 ) ) ( not ( = ?auto_25375 ?auto_25387 ) ) ( not ( = ?auto_25380 ?auto_25388 ) ) ( SURFACE-AT ?auto_25373 ?auto_25378 ) ( CLEAR ?auto_25373 ) ( IS-CRATE ?auto_25374 ) ( AVAILABLE ?auto_25380 ) ( not ( = ?auto_25385 ?auto_25378 ) ) ( HOIST-AT ?auto_25384 ?auto_25385 ) ( AVAILABLE ?auto_25384 ) ( SURFACE-AT ?auto_25374 ?auto_25385 ) ( ON ?auto_25374 ?auto_25386 ) ( CLEAR ?auto_25374 ) ( TRUCK-AT ?auto_25377 ?auto_25378 ) ( not ( = ?auto_25373 ?auto_25374 ) ) ( not ( = ?auto_25373 ?auto_25386 ) ) ( not ( = ?auto_25374 ?auto_25386 ) ) ( not ( = ?auto_25380 ?auto_25384 ) ) ( not ( = ?auto_25373 ?auto_25375 ) ) ( not ( = ?auto_25373 ?auto_25387 ) ) ( not ( = ?auto_25375 ?auto_25386 ) ) ( not ( = ?auto_25383 ?auto_25385 ) ) ( not ( = ?auto_25388 ?auto_25384 ) ) ( not ( = ?auto_25387 ?auto_25386 ) ) ( not ( = ?auto_25373 ?auto_25376 ) ) ( not ( = ?auto_25373 ?auto_25382 ) ) ( not ( = ?auto_25374 ?auto_25376 ) ) ( not ( = ?auto_25374 ?auto_25382 ) ) ( not ( = ?auto_25376 ?auto_25387 ) ) ( not ( = ?auto_25376 ?auto_25386 ) ) ( not ( = ?auto_25379 ?auto_25383 ) ) ( not ( = ?auto_25379 ?auto_25385 ) ) ( not ( = ?auto_25381 ?auto_25388 ) ) ( not ( = ?auto_25381 ?auto_25384 ) ) ( not ( = ?auto_25382 ?auto_25387 ) ) ( not ( = ?auto_25382 ?auto_25386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25373 ?auto_25374 ?auto_25375 )
      ( MAKE-1CRATE ?auto_25375 ?auto_25376 )
      ( MAKE-3CRATE-VERIFY ?auto_25373 ?auto_25374 ?auto_25375 ?auto_25376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25391 - SURFACE
      ?auto_25392 - SURFACE
    )
    :vars
    (
      ?auto_25393 - HOIST
      ?auto_25394 - PLACE
      ?auto_25396 - PLACE
      ?auto_25397 - HOIST
      ?auto_25398 - SURFACE
      ?auto_25395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25393 ?auto_25394 ) ( SURFACE-AT ?auto_25391 ?auto_25394 ) ( CLEAR ?auto_25391 ) ( IS-CRATE ?auto_25392 ) ( AVAILABLE ?auto_25393 ) ( not ( = ?auto_25396 ?auto_25394 ) ) ( HOIST-AT ?auto_25397 ?auto_25396 ) ( AVAILABLE ?auto_25397 ) ( SURFACE-AT ?auto_25392 ?auto_25396 ) ( ON ?auto_25392 ?auto_25398 ) ( CLEAR ?auto_25392 ) ( TRUCK-AT ?auto_25395 ?auto_25394 ) ( not ( = ?auto_25391 ?auto_25392 ) ) ( not ( = ?auto_25391 ?auto_25398 ) ) ( not ( = ?auto_25392 ?auto_25398 ) ) ( not ( = ?auto_25393 ?auto_25397 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25395 ?auto_25394 ?auto_25396 )
      ( !LIFT ?auto_25397 ?auto_25392 ?auto_25398 ?auto_25396 )
      ( !LOAD ?auto_25397 ?auto_25392 ?auto_25395 ?auto_25396 )
      ( !DRIVE ?auto_25395 ?auto_25396 ?auto_25394 )
      ( !UNLOAD ?auto_25393 ?auto_25392 ?auto_25395 ?auto_25394 )
      ( !DROP ?auto_25393 ?auto_25392 ?auto_25391 ?auto_25394 )
      ( MAKE-1CRATE-VERIFY ?auto_25391 ?auto_25392 ) )
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
      ?auto_25414 - HOIST
      ?auto_25413 - PLACE
      ?auto_25412 - PLACE
      ?auto_25410 - HOIST
      ?auto_25411 - SURFACE
      ?auto_25416 - PLACE
      ?auto_25418 - HOIST
      ?auto_25417 - SURFACE
      ?auto_25415 - PLACE
      ?auto_25421 - HOIST
      ?auto_25420 - SURFACE
      ?auto_25419 - SURFACE
      ?auto_25409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25414 ?auto_25413 ) ( IS-CRATE ?auto_25408 ) ( not ( = ?auto_25412 ?auto_25413 ) ) ( HOIST-AT ?auto_25410 ?auto_25412 ) ( SURFACE-AT ?auto_25408 ?auto_25412 ) ( ON ?auto_25408 ?auto_25411 ) ( CLEAR ?auto_25408 ) ( not ( = ?auto_25407 ?auto_25408 ) ) ( not ( = ?auto_25407 ?auto_25411 ) ) ( not ( = ?auto_25408 ?auto_25411 ) ) ( not ( = ?auto_25414 ?auto_25410 ) ) ( IS-CRATE ?auto_25407 ) ( not ( = ?auto_25416 ?auto_25413 ) ) ( HOIST-AT ?auto_25418 ?auto_25416 ) ( AVAILABLE ?auto_25418 ) ( SURFACE-AT ?auto_25407 ?auto_25416 ) ( ON ?auto_25407 ?auto_25417 ) ( CLEAR ?auto_25407 ) ( not ( = ?auto_25406 ?auto_25407 ) ) ( not ( = ?auto_25406 ?auto_25417 ) ) ( not ( = ?auto_25407 ?auto_25417 ) ) ( not ( = ?auto_25414 ?auto_25418 ) ) ( IS-CRATE ?auto_25406 ) ( not ( = ?auto_25415 ?auto_25413 ) ) ( HOIST-AT ?auto_25421 ?auto_25415 ) ( AVAILABLE ?auto_25421 ) ( SURFACE-AT ?auto_25406 ?auto_25415 ) ( ON ?auto_25406 ?auto_25420 ) ( CLEAR ?auto_25406 ) ( not ( = ?auto_25405 ?auto_25406 ) ) ( not ( = ?auto_25405 ?auto_25420 ) ) ( not ( = ?auto_25406 ?auto_25420 ) ) ( not ( = ?auto_25414 ?auto_25421 ) ) ( SURFACE-AT ?auto_25404 ?auto_25413 ) ( CLEAR ?auto_25404 ) ( IS-CRATE ?auto_25405 ) ( AVAILABLE ?auto_25414 ) ( AVAILABLE ?auto_25410 ) ( SURFACE-AT ?auto_25405 ?auto_25412 ) ( ON ?auto_25405 ?auto_25419 ) ( CLEAR ?auto_25405 ) ( TRUCK-AT ?auto_25409 ?auto_25413 ) ( not ( = ?auto_25404 ?auto_25405 ) ) ( not ( = ?auto_25404 ?auto_25419 ) ) ( not ( = ?auto_25405 ?auto_25419 ) ) ( not ( = ?auto_25404 ?auto_25406 ) ) ( not ( = ?auto_25404 ?auto_25420 ) ) ( not ( = ?auto_25406 ?auto_25419 ) ) ( not ( = ?auto_25415 ?auto_25412 ) ) ( not ( = ?auto_25421 ?auto_25410 ) ) ( not ( = ?auto_25420 ?auto_25419 ) ) ( not ( = ?auto_25404 ?auto_25407 ) ) ( not ( = ?auto_25404 ?auto_25417 ) ) ( not ( = ?auto_25405 ?auto_25407 ) ) ( not ( = ?auto_25405 ?auto_25417 ) ) ( not ( = ?auto_25407 ?auto_25420 ) ) ( not ( = ?auto_25407 ?auto_25419 ) ) ( not ( = ?auto_25416 ?auto_25415 ) ) ( not ( = ?auto_25416 ?auto_25412 ) ) ( not ( = ?auto_25418 ?auto_25421 ) ) ( not ( = ?auto_25418 ?auto_25410 ) ) ( not ( = ?auto_25417 ?auto_25420 ) ) ( not ( = ?auto_25417 ?auto_25419 ) ) ( not ( = ?auto_25404 ?auto_25408 ) ) ( not ( = ?auto_25404 ?auto_25411 ) ) ( not ( = ?auto_25405 ?auto_25408 ) ) ( not ( = ?auto_25405 ?auto_25411 ) ) ( not ( = ?auto_25406 ?auto_25408 ) ) ( not ( = ?auto_25406 ?auto_25411 ) ) ( not ( = ?auto_25408 ?auto_25417 ) ) ( not ( = ?auto_25408 ?auto_25420 ) ) ( not ( = ?auto_25408 ?auto_25419 ) ) ( not ( = ?auto_25411 ?auto_25417 ) ) ( not ( = ?auto_25411 ?auto_25420 ) ) ( not ( = ?auto_25411 ?auto_25419 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_25404 ?auto_25405 ?auto_25406 ?auto_25407 )
      ( MAKE-1CRATE ?auto_25407 ?auto_25408 )
      ( MAKE-4CRATE-VERIFY ?auto_25404 ?auto_25405 ?auto_25406 ?auto_25407 ?auto_25408 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25424 - SURFACE
      ?auto_25425 - SURFACE
    )
    :vars
    (
      ?auto_25426 - HOIST
      ?auto_25427 - PLACE
      ?auto_25429 - PLACE
      ?auto_25430 - HOIST
      ?auto_25431 - SURFACE
      ?auto_25428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25426 ?auto_25427 ) ( SURFACE-AT ?auto_25424 ?auto_25427 ) ( CLEAR ?auto_25424 ) ( IS-CRATE ?auto_25425 ) ( AVAILABLE ?auto_25426 ) ( not ( = ?auto_25429 ?auto_25427 ) ) ( HOIST-AT ?auto_25430 ?auto_25429 ) ( AVAILABLE ?auto_25430 ) ( SURFACE-AT ?auto_25425 ?auto_25429 ) ( ON ?auto_25425 ?auto_25431 ) ( CLEAR ?auto_25425 ) ( TRUCK-AT ?auto_25428 ?auto_25427 ) ( not ( = ?auto_25424 ?auto_25425 ) ) ( not ( = ?auto_25424 ?auto_25431 ) ) ( not ( = ?auto_25425 ?auto_25431 ) ) ( not ( = ?auto_25426 ?auto_25430 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25428 ?auto_25427 ?auto_25429 )
      ( !LIFT ?auto_25430 ?auto_25425 ?auto_25431 ?auto_25429 )
      ( !LOAD ?auto_25430 ?auto_25425 ?auto_25428 ?auto_25429 )
      ( !DRIVE ?auto_25428 ?auto_25429 ?auto_25427 )
      ( !UNLOAD ?auto_25426 ?auto_25425 ?auto_25428 ?auto_25427 )
      ( !DROP ?auto_25426 ?auto_25425 ?auto_25424 ?auto_25427 )
      ( MAKE-1CRATE-VERIFY ?auto_25424 ?auto_25425 ) )
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
      ?auto_25446 - HOIST
      ?auto_25448 - PLACE
      ?auto_25444 - PLACE
      ?auto_25449 - HOIST
      ?auto_25445 - SURFACE
      ?auto_25453 - PLACE
      ?auto_25452 - HOIST
      ?auto_25457 - SURFACE
      ?auto_25454 - PLACE
      ?auto_25450 - HOIST
      ?auto_25456 - SURFACE
      ?auto_25458 - PLACE
      ?auto_25455 - HOIST
      ?auto_25451 - SURFACE
      ?auto_25459 - SURFACE
      ?auto_25447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25446 ?auto_25448 ) ( IS-CRATE ?auto_25443 ) ( not ( = ?auto_25444 ?auto_25448 ) ) ( HOIST-AT ?auto_25449 ?auto_25444 ) ( AVAILABLE ?auto_25449 ) ( SURFACE-AT ?auto_25443 ?auto_25444 ) ( ON ?auto_25443 ?auto_25445 ) ( CLEAR ?auto_25443 ) ( not ( = ?auto_25442 ?auto_25443 ) ) ( not ( = ?auto_25442 ?auto_25445 ) ) ( not ( = ?auto_25443 ?auto_25445 ) ) ( not ( = ?auto_25446 ?auto_25449 ) ) ( IS-CRATE ?auto_25442 ) ( not ( = ?auto_25453 ?auto_25448 ) ) ( HOIST-AT ?auto_25452 ?auto_25453 ) ( SURFACE-AT ?auto_25442 ?auto_25453 ) ( ON ?auto_25442 ?auto_25457 ) ( CLEAR ?auto_25442 ) ( not ( = ?auto_25441 ?auto_25442 ) ) ( not ( = ?auto_25441 ?auto_25457 ) ) ( not ( = ?auto_25442 ?auto_25457 ) ) ( not ( = ?auto_25446 ?auto_25452 ) ) ( IS-CRATE ?auto_25441 ) ( not ( = ?auto_25454 ?auto_25448 ) ) ( HOIST-AT ?auto_25450 ?auto_25454 ) ( AVAILABLE ?auto_25450 ) ( SURFACE-AT ?auto_25441 ?auto_25454 ) ( ON ?auto_25441 ?auto_25456 ) ( CLEAR ?auto_25441 ) ( not ( = ?auto_25440 ?auto_25441 ) ) ( not ( = ?auto_25440 ?auto_25456 ) ) ( not ( = ?auto_25441 ?auto_25456 ) ) ( not ( = ?auto_25446 ?auto_25450 ) ) ( IS-CRATE ?auto_25440 ) ( not ( = ?auto_25458 ?auto_25448 ) ) ( HOIST-AT ?auto_25455 ?auto_25458 ) ( AVAILABLE ?auto_25455 ) ( SURFACE-AT ?auto_25440 ?auto_25458 ) ( ON ?auto_25440 ?auto_25451 ) ( CLEAR ?auto_25440 ) ( not ( = ?auto_25439 ?auto_25440 ) ) ( not ( = ?auto_25439 ?auto_25451 ) ) ( not ( = ?auto_25440 ?auto_25451 ) ) ( not ( = ?auto_25446 ?auto_25455 ) ) ( SURFACE-AT ?auto_25438 ?auto_25448 ) ( CLEAR ?auto_25438 ) ( IS-CRATE ?auto_25439 ) ( AVAILABLE ?auto_25446 ) ( AVAILABLE ?auto_25452 ) ( SURFACE-AT ?auto_25439 ?auto_25453 ) ( ON ?auto_25439 ?auto_25459 ) ( CLEAR ?auto_25439 ) ( TRUCK-AT ?auto_25447 ?auto_25448 ) ( not ( = ?auto_25438 ?auto_25439 ) ) ( not ( = ?auto_25438 ?auto_25459 ) ) ( not ( = ?auto_25439 ?auto_25459 ) ) ( not ( = ?auto_25438 ?auto_25440 ) ) ( not ( = ?auto_25438 ?auto_25451 ) ) ( not ( = ?auto_25440 ?auto_25459 ) ) ( not ( = ?auto_25458 ?auto_25453 ) ) ( not ( = ?auto_25455 ?auto_25452 ) ) ( not ( = ?auto_25451 ?auto_25459 ) ) ( not ( = ?auto_25438 ?auto_25441 ) ) ( not ( = ?auto_25438 ?auto_25456 ) ) ( not ( = ?auto_25439 ?auto_25441 ) ) ( not ( = ?auto_25439 ?auto_25456 ) ) ( not ( = ?auto_25441 ?auto_25451 ) ) ( not ( = ?auto_25441 ?auto_25459 ) ) ( not ( = ?auto_25454 ?auto_25458 ) ) ( not ( = ?auto_25454 ?auto_25453 ) ) ( not ( = ?auto_25450 ?auto_25455 ) ) ( not ( = ?auto_25450 ?auto_25452 ) ) ( not ( = ?auto_25456 ?auto_25451 ) ) ( not ( = ?auto_25456 ?auto_25459 ) ) ( not ( = ?auto_25438 ?auto_25442 ) ) ( not ( = ?auto_25438 ?auto_25457 ) ) ( not ( = ?auto_25439 ?auto_25442 ) ) ( not ( = ?auto_25439 ?auto_25457 ) ) ( not ( = ?auto_25440 ?auto_25442 ) ) ( not ( = ?auto_25440 ?auto_25457 ) ) ( not ( = ?auto_25442 ?auto_25456 ) ) ( not ( = ?auto_25442 ?auto_25451 ) ) ( not ( = ?auto_25442 ?auto_25459 ) ) ( not ( = ?auto_25457 ?auto_25456 ) ) ( not ( = ?auto_25457 ?auto_25451 ) ) ( not ( = ?auto_25457 ?auto_25459 ) ) ( not ( = ?auto_25438 ?auto_25443 ) ) ( not ( = ?auto_25438 ?auto_25445 ) ) ( not ( = ?auto_25439 ?auto_25443 ) ) ( not ( = ?auto_25439 ?auto_25445 ) ) ( not ( = ?auto_25440 ?auto_25443 ) ) ( not ( = ?auto_25440 ?auto_25445 ) ) ( not ( = ?auto_25441 ?auto_25443 ) ) ( not ( = ?auto_25441 ?auto_25445 ) ) ( not ( = ?auto_25443 ?auto_25457 ) ) ( not ( = ?auto_25443 ?auto_25456 ) ) ( not ( = ?auto_25443 ?auto_25451 ) ) ( not ( = ?auto_25443 ?auto_25459 ) ) ( not ( = ?auto_25444 ?auto_25453 ) ) ( not ( = ?auto_25444 ?auto_25454 ) ) ( not ( = ?auto_25444 ?auto_25458 ) ) ( not ( = ?auto_25449 ?auto_25452 ) ) ( not ( = ?auto_25449 ?auto_25450 ) ) ( not ( = ?auto_25449 ?auto_25455 ) ) ( not ( = ?auto_25445 ?auto_25457 ) ) ( not ( = ?auto_25445 ?auto_25456 ) ) ( not ( = ?auto_25445 ?auto_25451 ) ) ( not ( = ?auto_25445 ?auto_25459 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_25438 ?auto_25439 ?auto_25440 ?auto_25441 ?auto_25442 )
      ( MAKE-1CRATE ?auto_25442 ?auto_25443 )
      ( MAKE-5CRATE-VERIFY ?auto_25438 ?auto_25439 ?auto_25440 ?auto_25441 ?auto_25442 ?auto_25443 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25462 - SURFACE
      ?auto_25463 - SURFACE
    )
    :vars
    (
      ?auto_25464 - HOIST
      ?auto_25465 - PLACE
      ?auto_25467 - PLACE
      ?auto_25468 - HOIST
      ?auto_25469 - SURFACE
      ?auto_25466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25464 ?auto_25465 ) ( SURFACE-AT ?auto_25462 ?auto_25465 ) ( CLEAR ?auto_25462 ) ( IS-CRATE ?auto_25463 ) ( AVAILABLE ?auto_25464 ) ( not ( = ?auto_25467 ?auto_25465 ) ) ( HOIST-AT ?auto_25468 ?auto_25467 ) ( AVAILABLE ?auto_25468 ) ( SURFACE-AT ?auto_25463 ?auto_25467 ) ( ON ?auto_25463 ?auto_25469 ) ( CLEAR ?auto_25463 ) ( TRUCK-AT ?auto_25466 ?auto_25465 ) ( not ( = ?auto_25462 ?auto_25463 ) ) ( not ( = ?auto_25462 ?auto_25469 ) ) ( not ( = ?auto_25463 ?auto_25469 ) ) ( not ( = ?auto_25464 ?auto_25468 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25466 ?auto_25465 ?auto_25467 )
      ( !LIFT ?auto_25468 ?auto_25463 ?auto_25469 ?auto_25467 )
      ( !LOAD ?auto_25468 ?auto_25463 ?auto_25466 ?auto_25467 )
      ( !DRIVE ?auto_25466 ?auto_25467 ?auto_25465 )
      ( !UNLOAD ?auto_25464 ?auto_25463 ?auto_25466 ?auto_25465 )
      ( !DROP ?auto_25464 ?auto_25463 ?auto_25462 ?auto_25465 )
      ( MAKE-1CRATE-VERIFY ?auto_25462 ?auto_25463 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_25477 - SURFACE
      ?auto_25478 - SURFACE
      ?auto_25479 - SURFACE
      ?auto_25480 - SURFACE
      ?auto_25481 - SURFACE
      ?auto_25483 - SURFACE
      ?auto_25482 - SURFACE
    )
    :vars
    (
      ?auto_25489 - HOIST
      ?auto_25487 - PLACE
      ?auto_25484 - PLACE
      ?auto_25485 - HOIST
      ?auto_25486 - SURFACE
      ?auto_25491 - PLACE
      ?auto_25498 - HOIST
      ?auto_25500 - SURFACE
      ?auto_25493 - PLACE
      ?auto_25490 - HOIST
      ?auto_25502 - SURFACE
      ?auto_25496 - PLACE
      ?auto_25495 - HOIST
      ?auto_25497 - SURFACE
      ?auto_25492 - PLACE
      ?auto_25494 - HOIST
      ?auto_25499 - SURFACE
      ?auto_25501 - SURFACE
      ?auto_25488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25489 ?auto_25487 ) ( IS-CRATE ?auto_25482 ) ( not ( = ?auto_25484 ?auto_25487 ) ) ( HOIST-AT ?auto_25485 ?auto_25484 ) ( AVAILABLE ?auto_25485 ) ( SURFACE-AT ?auto_25482 ?auto_25484 ) ( ON ?auto_25482 ?auto_25486 ) ( CLEAR ?auto_25482 ) ( not ( = ?auto_25483 ?auto_25482 ) ) ( not ( = ?auto_25483 ?auto_25486 ) ) ( not ( = ?auto_25482 ?auto_25486 ) ) ( not ( = ?auto_25489 ?auto_25485 ) ) ( IS-CRATE ?auto_25483 ) ( not ( = ?auto_25491 ?auto_25487 ) ) ( HOIST-AT ?auto_25498 ?auto_25491 ) ( AVAILABLE ?auto_25498 ) ( SURFACE-AT ?auto_25483 ?auto_25491 ) ( ON ?auto_25483 ?auto_25500 ) ( CLEAR ?auto_25483 ) ( not ( = ?auto_25481 ?auto_25483 ) ) ( not ( = ?auto_25481 ?auto_25500 ) ) ( not ( = ?auto_25483 ?auto_25500 ) ) ( not ( = ?auto_25489 ?auto_25498 ) ) ( IS-CRATE ?auto_25481 ) ( not ( = ?auto_25493 ?auto_25487 ) ) ( HOIST-AT ?auto_25490 ?auto_25493 ) ( SURFACE-AT ?auto_25481 ?auto_25493 ) ( ON ?auto_25481 ?auto_25502 ) ( CLEAR ?auto_25481 ) ( not ( = ?auto_25480 ?auto_25481 ) ) ( not ( = ?auto_25480 ?auto_25502 ) ) ( not ( = ?auto_25481 ?auto_25502 ) ) ( not ( = ?auto_25489 ?auto_25490 ) ) ( IS-CRATE ?auto_25480 ) ( not ( = ?auto_25496 ?auto_25487 ) ) ( HOIST-AT ?auto_25495 ?auto_25496 ) ( AVAILABLE ?auto_25495 ) ( SURFACE-AT ?auto_25480 ?auto_25496 ) ( ON ?auto_25480 ?auto_25497 ) ( CLEAR ?auto_25480 ) ( not ( = ?auto_25479 ?auto_25480 ) ) ( not ( = ?auto_25479 ?auto_25497 ) ) ( not ( = ?auto_25480 ?auto_25497 ) ) ( not ( = ?auto_25489 ?auto_25495 ) ) ( IS-CRATE ?auto_25479 ) ( not ( = ?auto_25492 ?auto_25487 ) ) ( HOIST-AT ?auto_25494 ?auto_25492 ) ( AVAILABLE ?auto_25494 ) ( SURFACE-AT ?auto_25479 ?auto_25492 ) ( ON ?auto_25479 ?auto_25499 ) ( CLEAR ?auto_25479 ) ( not ( = ?auto_25478 ?auto_25479 ) ) ( not ( = ?auto_25478 ?auto_25499 ) ) ( not ( = ?auto_25479 ?auto_25499 ) ) ( not ( = ?auto_25489 ?auto_25494 ) ) ( SURFACE-AT ?auto_25477 ?auto_25487 ) ( CLEAR ?auto_25477 ) ( IS-CRATE ?auto_25478 ) ( AVAILABLE ?auto_25489 ) ( AVAILABLE ?auto_25490 ) ( SURFACE-AT ?auto_25478 ?auto_25493 ) ( ON ?auto_25478 ?auto_25501 ) ( CLEAR ?auto_25478 ) ( TRUCK-AT ?auto_25488 ?auto_25487 ) ( not ( = ?auto_25477 ?auto_25478 ) ) ( not ( = ?auto_25477 ?auto_25501 ) ) ( not ( = ?auto_25478 ?auto_25501 ) ) ( not ( = ?auto_25477 ?auto_25479 ) ) ( not ( = ?auto_25477 ?auto_25499 ) ) ( not ( = ?auto_25479 ?auto_25501 ) ) ( not ( = ?auto_25492 ?auto_25493 ) ) ( not ( = ?auto_25494 ?auto_25490 ) ) ( not ( = ?auto_25499 ?auto_25501 ) ) ( not ( = ?auto_25477 ?auto_25480 ) ) ( not ( = ?auto_25477 ?auto_25497 ) ) ( not ( = ?auto_25478 ?auto_25480 ) ) ( not ( = ?auto_25478 ?auto_25497 ) ) ( not ( = ?auto_25480 ?auto_25499 ) ) ( not ( = ?auto_25480 ?auto_25501 ) ) ( not ( = ?auto_25496 ?auto_25492 ) ) ( not ( = ?auto_25496 ?auto_25493 ) ) ( not ( = ?auto_25495 ?auto_25494 ) ) ( not ( = ?auto_25495 ?auto_25490 ) ) ( not ( = ?auto_25497 ?auto_25499 ) ) ( not ( = ?auto_25497 ?auto_25501 ) ) ( not ( = ?auto_25477 ?auto_25481 ) ) ( not ( = ?auto_25477 ?auto_25502 ) ) ( not ( = ?auto_25478 ?auto_25481 ) ) ( not ( = ?auto_25478 ?auto_25502 ) ) ( not ( = ?auto_25479 ?auto_25481 ) ) ( not ( = ?auto_25479 ?auto_25502 ) ) ( not ( = ?auto_25481 ?auto_25497 ) ) ( not ( = ?auto_25481 ?auto_25499 ) ) ( not ( = ?auto_25481 ?auto_25501 ) ) ( not ( = ?auto_25502 ?auto_25497 ) ) ( not ( = ?auto_25502 ?auto_25499 ) ) ( not ( = ?auto_25502 ?auto_25501 ) ) ( not ( = ?auto_25477 ?auto_25483 ) ) ( not ( = ?auto_25477 ?auto_25500 ) ) ( not ( = ?auto_25478 ?auto_25483 ) ) ( not ( = ?auto_25478 ?auto_25500 ) ) ( not ( = ?auto_25479 ?auto_25483 ) ) ( not ( = ?auto_25479 ?auto_25500 ) ) ( not ( = ?auto_25480 ?auto_25483 ) ) ( not ( = ?auto_25480 ?auto_25500 ) ) ( not ( = ?auto_25483 ?auto_25502 ) ) ( not ( = ?auto_25483 ?auto_25497 ) ) ( not ( = ?auto_25483 ?auto_25499 ) ) ( not ( = ?auto_25483 ?auto_25501 ) ) ( not ( = ?auto_25491 ?auto_25493 ) ) ( not ( = ?auto_25491 ?auto_25496 ) ) ( not ( = ?auto_25491 ?auto_25492 ) ) ( not ( = ?auto_25498 ?auto_25490 ) ) ( not ( = ?auto_25498 ?auto_25495 ) ) ( not ( = ?auto_25498 ?auto_25494 ) ) ( not ( = ?auto_25500 ?auto_25502 ) ) ( not ( = ?auto_25500 ?auto_25497 ) ) ( not ( = ?auto_25500 ?auto_25499 ) ) ( not ( = ?auto_25500 ?auto_25501 ) ) ( not ( = ?auto_25477 ?auto_25482 ) ) ( not ( = ?auto_25477 ?auto_25486 ) ) ( not ( = ?auto_25478 ?auto_25482 ) ) ( not ( = ?auto_25478 ?auto_25486 ) ) ( not ( = ?auto_25479 ?auto_25482 ) ) ( not ( = ?auto_25479 ?auto_25486 ) ) ( not ( = ?auto_25480 ?auto_25482 ) ) ( not ( = ?auto_25480 ?auto_25486 ) ) ( not ( = ?auto_25481 ?auto_25482 ) ) ( not ( = ?auto_25481 ?auto_25486 ) ) ( not ( = ?auto_25482 ?auto_25500 ) ) ( not ( = ?auto_25482 ?auto_25502 ) ) ( not ( = ?auto_25482 ?auto_25497 ) ) ( not ( = ?auto_25482 ?auto_25499 ) ) ( not ( = ?auto_25482 ?auto_25501 ) ) ( not ( = ?auto_25484 ?auto_25491 ) ) ( not ( = ?auto_25484 ?auto_25493 ) ) ( not ( = ?auto_25484 ?auto_25496 ) ) ( not ( = ?auto_25484 ?auto_25492 ) ) ( not ( = ?auto_25485 ?auto_25498 ) ) ( not ( = ?auto_25485 ?auto_25490 ) ) ( not ( = ?auto_25485 ?auto_25495 ) ) ( not ( = ?auto_25485 ?auto_25494 ) ) ( not ( = ?auto_25486 ?auto_25500 ) ) ( not ( = ?auto_25486 ?auto_25502 ) ) ( not ( = ?auto_25486 ?auto_25497 ) ) ( not ( = ?auto_25486 ?auto_25499 ) ) ( not ( = ?auto_25486 ?auto_25501 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_25477 ?auto_25478 ?auto_25479 ?auto_25480 ?auto_25481 ?auto_25483 )
      ( MAKE-1CRATE ?auto_25483 ?auto_25482 )
      ( MAKE-6CRATE-VERIFY ?auto_25477 ?auto_25478 ?auto_25479 ?auto_25480 ?auto_25481 ?auto_25483 ?auto_25482 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25505 - SURFACE
      ?auto_25506 - SURFACE
    )
    :vars
    (
      ?auto_25507 - HOIST
      ?auto_25508 - PLACE
      ?auto_25510 - PLACE
      ?auto_25511 - HOIST
      ?auto_25512 - SURFACE
      ?auto_25509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25507 ?auto_25508 ) ( SURFACE-AT ?auto_25505 ?auto_25508 ) ( CLEAR ?auto_25505 ) ( IS-CRATE ?auto_25506 ) ( AVAILABLE ?auto_25507 ) ( not ( = ?auto_25510 ?auto_25508 ) ) ( HOIST-AT ?auto_25511 ?auto_25510 ) ( AVAILABLE ?auto_25511 ) ( SURFACE-AT ?auto_25506 ?auto_25510 ) ( ON ?auto_25506 ?auto_25512 ) ( CLEAR ?auto_25506 ) ( TRUCK-AT ?auto_25509 ?auto_25508 ) ( not ( = ?auto_25505 ?auto_25506 ) ) ( not ( = ?auto_25505 ?auto_25512 ) ) ( not ( = ?auto_25506 ?auto_25512 ) ) ( not ( = ?auto_25507 ?auto_25511 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25509 ?auto_25508 ?auto_25510 )
      ( !LIFT ?auto_25511 ?auto_25506 ?auto_25512 ?auto_25510 )
      ( !LOAD ?auto_25511 ?auto_25506 ?auto_25509 ?auto_25510 )
      ( !DRIVE ?auto_25509 ?auto_25510 ?auto_25508 )
      ( !UNLOAD ?auto_25507 ?auto_25506 ?auto_25509 ?auto_25508 )
      ( !DROP ?auto_25507 ?auto_25506 ?auto_25505 ?auto_25508 )
      ( MAKE-1CRATE-VERIFY ?auto_25505 ?auto_25506 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_25521 - SURFACE
      ?auto_25522 - SURFACE
      ?auto_25523 - SURFACE
      ?auto_25524 - SURFACE
      ?auto_25525 - SURFACE
      ?auto_25527 - SURFACE
      ?auto_25526 - SURFACE
      ?auto_25528 - SURFACE
    )
    :vars
    (
      ?auto_25529 - HOIST
      ?auto_25530 - PLACE
      ?auto_25531 - PLACE
      ?auto_25533 - HOIST
      ?auto_25534 - SURFACE
      ?auto_25535 - PLACE
      ?auto_25536 - HOIST
      ?auto_25549 - SURFACE
      ?auto_25548 - PLACE
      ?auto_25550 - HOIST
      ?auto_25542 - SURFACE
      ?auto_25547 - PLACE
      ?auto_25541 - HOIST
      ?auto_25545 - SURFACE
      ?auto_25538 - PLACE
      ?auto_25539 - HOIST
      ?auto_25537 - SURFACE
      ?auto_25546 - PLACE
      ?auto_25540 - HOIST
      ?auto_25543 - SURFACE
      ?auto_25544 - SURFACE
      ?auto_25532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25529 ?auto_25530 ) ( IS-CRATE ?auto_25528 ) ( not ( = ?auto_25531 ?auto_25530 ) ) ( HOIST-AT ?auto_25533 ?auto_25531 ) ( AVAILABLE ?auto_25533 ) ( SURFACE-AT ?auto_25528 ?auto_25531 ) ( ON ?auto_25528 ?auto_25534 ) ( CLEAR ?auto_25528 ) ( not ( = ?auto_25526 ?auto_25528 ) ) ( not ( = ?auto_25526 ?auto_25534 ) ) ( not ( = ?auto_25528 ?auto_25534 ) ) ( not ( = ?auto_25529 ?auto_25533 ) ) ( IS-CRATE ?auto_25526 ) ( not ( = ?auto_25535 ?auto_25530 ) ) ( HOIST-AT ?auto_25536 ?auto_25535 ) ( AVAILABLE ?auto_25536 ) ( SURFACE-AT ?auto_25526 ?auto_25535 ) ( ON ?auto_25526 ?auto_25549 ) ( CLEAR ?auto_25526 ) ( not ( = ?auto_25527 ?auto_25526 ) ) ( not ( = ?auto_25527 ?auto_25549 ) ) ( not ( = ?auto_25526 ?auto_25549 ) ) ( not ( = ?auto_25529 ?auto_25536 ) ) ( IS-CRATE ?auto_25527 ) ( not ( = ?auto_25548 ?auto_25530 ) ) ( HOIST-AT ?auto_25550 ?auto_25548 ) ( AVAILABLE ?auto_25550 ) ( SURFACE-AT ?auto_25527 ?auto_25548 ) ( ON ?auto_25527 ?auto_25542 ) ( CLEAR ?auto_25527 ) ( not ( = ?auto_25525 ?auto_25527 ) ) ( not ( = ?auto_25525 ?auto_25542 ) ) ( not ( = ?auto_25527 ?auto_25542 ) ) ( not ( = ?auto_25529 ?auto_25550 ) ) ( IS-CRATE ?auto_25525 ) ( not ( = ?auto_25547 ?auto_25530 ) ) ( HOIST-AT ?auto_25541 ?auto_25547 ) ( SURFACE-AT ?auto_25525 ?auto_25547 ) ( ON ?auto_25525 ?auto_25545 ) ( CLEAR ?auto_25525 ) ( not ( = ?auto_25524 ?auto_25525 ) ) ( not ( = ?auto_25524 ?auto_25545 ) ) ( not ( = ?auto_25525 ?auto_25545 ) ) ( not ( = ?auto_25529 ?auto_25541 ) ) ( IS-CRATE ?auto_25524 ) ( not ( = ?auto_25538 ?auto_25530 ) ) ( HOIST-AT ?auto_25539 ?auto_25538 ) ( AVAILABLE ?auto_25539 ) ( SURFACE-AT ?auto_25524 ?auto_25538 ) ( ON ?auto_25524 ?auto_25537 ) ( CLEAR ?auto_25524 ) ( not ( = ?auto_25523 ?auto_25524 ) ) ( not ( = ?auto_25523 ?auto_25537 ) ) ( not ( = ?auto_25524 ?auto_25537 ) ) ( not ( = ?auto_25529 ?auto_25539 ) ) ( IS-CRATE ?auto_25523 ) ( not ( = ?auto_25546 ?auto_25530 ) ) ( HOIST-AT ?auto_25540 ?auto_25546 ) ( AVAILABLE ?auto_25540 ) ( SURFACE-AT ?auto_25523 ?auto_25546 ) ( ON ?auto_25523 ?auto_25543 ) ( CLEAR ?auto_25523 ) ( not ( = ?auto_25522 ?auto_25523 ) ) ( not ( = ?auto_25522 ?auto_25543 ) ) ( not ( = ?auto_25523 ?auto_25543 ) ) ( not ( = ?auto_25529 ?auto_25540 ) ) ( SURFACE-AT ?auto_25521 ?auto_25530 ) ( CLEAR ?auto_25521 ) ( IS-CRATE ?auto_25522 ) ( AVAILABLE ?auto_25529 ) ( AVAILABLE ?auto_25541 ) ( SURFACE-AT ?auto_25522 ?auto_25547 ) ( ON ?auto_25522 ?auto_25544 ) ( CLEAR ?auto_25522 ) ( TRUCK-AT ?auto_25532 ?auto_25530 ) ( not ( = ?auto_25521 ?auto_25522 ) ) ( not ( = ?auto_25521 ?auto_25544 ) ) ( not ( = ?auto_25522 ?auto_25544 ) ) ( not ( = ?auto_25521 ?auto_25523 ) ) ( not ( = ?auto_25521 ?auto_25543 ) ) ( not ( = ?auto_25523 ?auto_25544 ) ) ( not ( = ?auto_25546 ?auto_25547 ) ) ( not ( = ?auto_25540 ?auto_25541 ) ) ( not ( = ?auto_25543 ?auto_25544 ) ) ( not ( = ?auto_25521 ?auto_25524 ) ) ( not ( = ?auto_25521 ?auto_25537 ) ) ( not ( = ?auto_25522 ?auto_25524 ) ) ( not ( = ?auto_25522 ?auto_25537 ) ) ( not ( = ?auto_25524 ?auto_25543 ) ) ( not ( = ?auto_25524 ?auto_25544 ) ) ( not ( = ?auto_25538 ?auto_25546 ) ) ( not ( = ?auto_25538 ?auto_25547 ) ) ( not ( = ?auto_25539 ?auto_25540 ) ) ( not ( = ?auto_25539 ?auto_25541 ) ) ( not ( = ?auto_25537 ?auto_25543 ) ) ( not ( = ?auto_25537 ?auto_25544 ) ) ( not ( = ?auto_25521 ?auto_25525 ) ) ( not ( = ?auto_25521 ?auto_25545 ) ) ( not ( = ?auto_25522 ?auto_25525 ) ) ( not ( = ?auto_25522 ?auto_25545 ) ) ( not ( = ?auto_25523 ?auto_25525 ) ) ( not ( = ?auto_25523 ?auto_25545 ) ) ( not ( = ?auto_25525 ?auto_25537 ) ) ( not ( = ?auto_25525 ?auto_25543 ) ) ( not ( = ?auto_25525 ?auto_25544 ) ) ( not ( = ?auto_25545 ?auto_25537 ) ) ( not ( = ?auto_25545 ?auto_25543 ) ) ( not ( = ?auto_25545 ?auto_25544 ) ) ( not ( = ?auto_25521 ?auto_25527 ) ) ( not ( = ?auto_25521 ?auto_25542 ) ) ( not ( = ?auto_25522 ?auto_25527 ) ) ( not ( = ?auto_25522 ?auto_25542 ) ) ( not ( = ?auto_25523 ?auto_25527 ) ) ( not ( = ?auto_25523 ?auto_25542 ) ) ( not ( = ?auto_25524 ?auto_25527 ) ) ( not ( = ?auto_25524 ?auto_25542 ) ) ( not ( = ?auto_25527 ?auto_25545 ) ) ( not ( = ?auto_25527 ?auto_25537 ) ) ( not ( = ?auto_25527 ?auto_25543 ) ) ( not ( = ?auto_25527 ?auto_25544 ) ) ( not ( = ?auto_25548 ?auto_25547 ) ) ( not ( = ?auto_25548 ?auto_25538 ) ) ( not ( = ?auto_25548 ?auto_25546 ) ) ( not ( = ?auto_25550 ?auto_25541 ) ) ( not ( = ?auto_25550 ?auto_25539 ) ) ( not ( = ?auto_25550 ?auto_25540 ) ) ( not ( = ?auto_25542 ?auto_25545 ) ) ( not ( = ?auto_25542 ?auto_25537 ) ) ( not ( = ?auto_25542 ?auto_25543 ) ) ( not ( = ?auto_25542 ?auto_25544 ) ) ( not ( = ?auto_25521 ?auto_25526 ) ) ( not ( = ?auto_25521 ?auto_25549 ) ) ( not ( = ?auto_25522 ?auto_25526 ) ) ( not ( = ?auto_25522 ?auto_25549 ) ) ( not ( = ?auto_25523 ?auto_25526 ) ) ( not ( = ?auto_25523 ?auto_25549 ) ) ( not ( = ?auto_25524 ?auto_25526 ) ) ( not ( = ?auto_25524 ?auto_25549 ) ) ( not ( = ?auto_25525 ?auto_25526 ) ) ( not ( = ?auto_25525 ?auto_25549 ) ) ( not ( = ?auto_25526 ?auto_25542 ) ) ( not ( = ?auto_25526 ?auto_25545 ) ) ( not ( = ?auto_25526 ?auto_25537 ) ) ( not ( = ?auto_25526 ?auto_25543 ) ) ( not ( = ?auto_25526 ?auto_25544 ) ) ( not ( = ?auto_25535 ?auto_25548 ) ) ( not ( = ?auto_25535 ?auto_25547 ) ) ( not ( = ?auto_25535 ?auto_25538 ) ) ( not ( = ?auto_25535 ?auto_25546 ) ) ( not ( = ?auto_25536 ?auto_25550 ) ) ( not ( = ?auto_25536 ?auto_25541 ) ) ( not ( = ?auto_25536 ?auto_25539 ) ) ( not ( = ?auto_25536 ?auto_25540 ) ) ( not ( = ?auto_25549 ?auto_25542 ) ) ( not ( = ?auto_25549 ?auto_25545 ) ) ( not ( = ?auto_25549 ?auto_25537 ) ) ( not ( = ?auto_25549 ?auto_25543 ) ) ( not ( = ?auto_25549 ?auto_25544 ) ) ( not ( = ?auto_25521 ?auto_25528 ) ) ( not ( = ?auto_25521 ?auto_25534 ) ) ( not ( = ?auto_25522 ?auto_25528 ) ) ( not ( = ?auto_25522 ?auto_25534 ) ) ( not ( = ?auto_25523 ?auto_25528 ) ) ( not ( = ?auto_25523 ?auto_25534 ) ) ( not ( = ?auto_25524 ?auto_25528 ) ) ( not ( = ?auto_25524 ?auto_25534 ) ) ( not ( = ?auto_25525 ?auto_25528 ) ) ( not ( = ?auto_25525 ?auto_25534 ) ) ( not ( = ?auto_25527 ?auto_25528 ) ) ( not ( = ?auto_25527 ?auto_25534 ) ) ( not ( = ?auto_25528 ?auto_25549 ) ) ( not ( = ?auto_25528 ?auto_25542 ) ) ( not ( = ?auto_25528 ?auto_25545 ) ) ( not ( = ?auto_25528 ?auto_25537 ) ) ( not ( = ?auto_25528 ?auto_25543 ) ) ( not ( = ?auto_25528 ?auto_25544 ) ) ( not ( = ?auto_25531 ?auto_25535 ) ) ( not ( = ?auto_25531 ?auto_25548 ) ) ( not ( = ?auto_25531 ?auto_25547 ) ) ( not ( = ?auto_25531 ?auto_25538 ) ) ( not ( = ?auto_25531 ?auto_25546 ) ) ( not ( = ?auto_25533 ?auto_25536 ) ) ( not ( = ?auto_25533 ?auto_25550 ) ) ( not ( = ?auto_25533 ?auto_25541 ) ) ( not ( = ?auto_25533 ?auto_25539 ) ) ( not ( = ?auto_25533 ?auto_25540 ) ) ( not ( = ?auto_25534 ?auto_25549 ) ) ( not ( = ?auto_25534 ?auto_25542 ) ) ( not ( = ?auto_25534 ?auto_25545 ) ) ( not ( = ?auto_25534 ?auto_25537 ) ) ( not ( = ?auto_25534 ?auto_25543 ) ) ( not ( = ?auto_25534 ?auto_25544 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_25521 ?auto_25522 ?auto_25523 ?auto_25524 ?auto_25525 ?auto_25527 ?auto_25526 )
      ( MAKE-1CRATE ?auto_25526 ?auto_25528 )
      ( MAKE-7CRATE-VERIFY ?auto_25521 ?auto_25522 ?auto_25523 ?auto_25524 ?auto_25525 ?auto_25527 ?auto_25526 ?auto_25528 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25553 - SURFACE
      ?auto_25554 - SURFACE
    )
    :vars
    (
      ?auto_25555 - HOIST
      ?auto_25556 - PLACE
      ?auto_25558 - PLACE
      ?auto_25559 - HOIST
      ?auto_25560 - SURFACE
      ?auto_25557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25555 ?auto_25556 ) ( SURFACE-AT ?auto_25553 ?auto_25556 ) ( CLEAR ?auto_25553 ) ( IS-CRATE ?auto_25554 ) ( AVAILABLE ?auto_25555 ) ( not ( = ?auto_25558 ?auto_25556 ) ) ( HOIST-AT ?auto_25559 ?auto_25558 ) ( AVAILABLE ?auto_25559 ) ( SURFACE-AT ?auto_25554 ?auto_25558 ) ( ON ?auto_25554 ?auto_25560 ) ( CLEAR ?auto_25554 ) ( TRUCK-AT ?auto_25557 ?auto_25556 ) ( not ( = ?auto_25553 ?auto_25554 ) ) ( not ( = ?auto_25553 ?auto_25560 ) ) ( not ( = ?auto_25554 ?auto_25560 ) ) ( not ( = ?auto_25555 ?auto_25559 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25557 ?auto_25556 ?auto_25558 )
      ( !LIFT ?auto_25559 ?auto_25554 ?auto_25560 ?auto_25558 )
      ( !LOAD ?auto_25559 ?auto_25554 ?auto_25557 ?auto_25558 )
      ( !DRIVE ?auto_25557 ?auto_25558 ?auto_25556 )
      ( !UNLOAD ?auto_25555 ?auto_25554 ?auto_25557 ?auto_25556 )
      ( !DROP ?auto_25555 ?auto_25554 ?auto_25553 ?auto_25556 )
      ( MAKE-1CRATE-VERIFY ?auto_25553 ?auto_25554 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_25570 - SURFACE
      ?auto_25571 - SURFACE
      ?auto_25572 - SURFACE
      ?auto_25573 - SURFACE
      ?auto_25574 - SURFACE
      ?auto_25576 - SURFACE
      ?auto_25575 - SURFACE
      ?auto_25578 - SURFACE
      ?auto_25577 - SURFACE
    )
    :vars
    (
      ?auto_25581 - HOIST
      ?auto_25583 - PLACE
      ?auto_25582 - PLACE
      ?auto_25584 - HOIST
      ?auto_25579 - SURFACE
      ?auto_25603 - PLACE
      ?auto_25585 - HOIST
      ?auto_25602 - SURFACE
      ?auto_25598 - PLACE
      ?auto_25587 - HOIST
      ?auto_25589 - SURFACE
      ?auto_25590 - PLACE
      ?auto_25600 - HOIST
      ?auto_25591 - SURFACE
      ?auto_25596 - PLACE
      ?auto_25592 - HOIST
      ?auto_25595 - SURFACE
      ?auto_25586 - PLACE
      ?auto_25594 - HOIST
      ?auto_25588 - SURFACE
      ?auto_25597 - PLACE
      ?auto_25593 - HOIST
      ?auto_25599 - SURFACE
      ?auto_25601 - SURFACE
      ?auto_25580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25581 ?auto_25583 ) ( IS-CRATE ?auto_25577 ) ( not ( = ?auto_25582 ?auto_25583 ) ) ( HOIST-AT ?auto_25584 ?auto_25582 ) ( AVAILABLE ?auto_25584 ) ( SURFACE-AT ?auto_25577 ?auto_25582 ) ( ON ?auto_25577 ?auto_25579 ) ( CLEAR ?auto_25577 ) ( not ( = ?auto_25578 ?auto_25577 ) ) ( not ( = ?auto_25578 ?auto_25579 ) ) ( not ( = ?auto_25577 ?auto_25579 ) ) ( not ( = ?auto_25581 ?auto_25584 ) ) ( IS-CRATE ?auto_25578 ) ( not ( = ?auto_25603 ?auto_25583 ) ) ( HOIST-AT ?auto_25585 ?auto_25603 ) ( AVAILABLE ?auto_25585 ) ( SURFACE-AT ?auto_25578 ?auto_25603 ) ( ON ?auto_25578 ?auto_25602 ) ( CLEAR ?auto_25578 ) ( not ( = ?auto_25575 ?auto_25578 ) ) ( not ( = ?auto_25575 ?auto_25602 ) ) ( not ( = ?auto_25578 ?auto_25602 ) ) ( not ( = ?auto_25581 ?auto_25585 ) ) ( IS-CRATE ?auto_25575 ) ( not ( = ?auto_25598 ?auto_25583 ) ) ( HOIST-AT ?auto_25587 ?auto_25598 ) ( AVAILABLE ?auto_25587 ) ( SURFACE-AT ?auto_25575 ?auto_25598 ) ( ON ?auto_25575 ?auto_25589 ) ( CLEAR ?auto_25575 ) ( not ( = ?auto_25576 ?auto_25575 ) ) ( not ( = ?auto_25576 ?auto_25589 ) ) ( not ( = ?auto_25575 ?auto_25589 ) ) ( not ( = ?auto_25581 ?auto_25587 ) ) ( IS-CRATE ?auto_25576 ) ( not ( = ?auto_25590 ?auto_25583 ) ) ( HOIST-AT ?auto_25600 ?auto_25590 ) ( AVAILABLE ?auto_25600 ) ( SURFACE-AT ?auto_25576 ?auto_25590 ) ( ON ?auto_25576 ?auto_25591 ) ( CLEAR ?auto_25576 ) ( not ( = ?auto_25574 ?auto_25576 ) ) ( not ( = ?auto_25574 ?auto_25591 ) ) ( not ( = ?auto_25576 ?auto_25591 ) ) ( not ( = ?auto_25581 ?auto_25600 ) ) ( IS-CRATE ?auto_25574 ) ( not ( = ?auto_25596 ?auto_25583 ) ) ( HOIST-AT ?auto_25592 ?auto_25596 ) ( SURFACE-AT ?auto_25574 ?auto_25596 ) ( ON ?auto_25574 ?auto_25595 ) ( CLEAR ?auto_25574 ) ( not ( = ?auto_25573 ?auto_25574 ) ) ( not ( = ?auto_25573 ?auto_25595 ) ) ( not ( = ?auto_25574 ?auto_25595 ) ) ( not ( = ?auto_25581 ?auto_25592 ) ) ( IS-CRATE ?auto_25573 ) ( not ( = ?auto_25586 ?auto_25583 ) ) ( HOIST-AT ?auto_25594 ?auto_25586 ) ( AVAILABLE ?auto_25594 ) ( SURFACE-AT ?auto_25573 ?auto_25586 ) ( ON ?auto_25573 ?auto_25588 ) ( CLEAR ?auto_25573 ) ( not ( = ?auto_25572 ?auto_25573 ) ) ( not ( = ?auto_25572 ?auto_25588 ) ) ( not ( = ?auto_25573 ?auto_25588 ) ) ( not ( = ?auto_25581 ?auto_25594 ) ) ( IS-CRATE ?auto_25572 ) ( not ( = ?auto_25597 ?auto_25583 ) ) ( HOIST-AT ?auto_25593 ?auto_25597 ) ( AVAILABLE ?auto_25593 ) ( SURFACE-AT ?auto_25572 ?auto_25597 ) ( ON ?auto_25572 ?auto_25599 ) ( CLEAR ?auto_25572 ) ( not ( = ?auto_25571 ?auto_25572 ) ) ( not ( = ?auto_25571 ?auto_25599 ) ) ( not ( = ?auto_25572 ?auto_25599 ) ) ( not ( = ?auto_25581 ?auto_25593 ) ) ( SURFACE-AT ?auto_25570 ?auto_25583 ) ( CLEAR ?auto_25570 ) ( IS-CRATE ?auto_25571 ) ( AVAILABLE ?auto_25581 ) ( AVAILABLE ?auto_25592 ) ( SURFACE-AT ?auto_25571 ?auto_25596 ) ( ON ?auto_25571 ?auto_25601 ) ( CLEAR ?auto_25571 ) ( TRUCK-AT ?auto_25580 ?auto_25583 ) ( not ( = ?auto_25570 ?auto_25571 ) ) ( not ( = ?auto_25570 ?auto_25601 ) ) ( not ( = ?auto_25571 ?auto_25601 ) ) ( not ( = ?auto_25570 ?auto_25572 ) ) ( not ( = ?auto_25570 ?auto_25599 ) ) ( not ( = ?auto_25572 ?auto_25601 ) ) ( not ( = ?auto_25597 ?auto_25596 ) ) ( not ( = ?auto_25593 ?auto_25592 ) ) ( not ( = ?auto_25599 ?auto_25601 ) ) ( not ( = ?auto_25570 ?auto_25573 ) ) ( not ( = ?auto_25570 ?auto_25588 ) ) ( not ( = ?auto_25571 ?auto_25573 ) ) ( not ( = ?auto_25571 ?auto_25588 ) ) ( not ( = ?auto_25573 ?auto_25599 ) ) ( not ( = ?auto_25573 ?auto_25601 ) ) ( not ( = ?auto_25586 ?auto_25597 ) ) ( not ( = ?auto_25586 ?auto_25596 ) ) ( not ( = ?auto_25594 ?auto_25593 ) ) ( not ( = ?auto_25594 ?auto_25592 ) ) ( not ( = ?auto_25588 ?auto_25599 ) ) ( not ( = ?auto_25588 ?auto_25601 ) ) ( not ( = ?auto_25570 ?auto_25574 ) ) ( not ( = ?auto_25570 ?auto_25595 ) ) ( not ( = ?auto_25571 ?auto_25574 ) ) ( not ( = ?auto_25571 ?auto_25595 ) ) ( not ( = ?auto_25572 ?auto_25574 ) ) ( not ( = ?auto_25572 ?auto_25595 ) ) ( not ( = ?auto_25574 ?auto_25588 ) ) ( not ( = ?auto_25574 ?auto_25599 ) ) ( not ( = ?auto_25574 ?auto_25601 ) ) ( not ( = ?auto_25595 ?auto_25588 ) ) ( not ( = ?auto_25595 ?auto_25599 ) ) ( not ( = ?auto_25595 ?auto_25601 ) ) ( not ( = ?auto_25570 ?auto_25576 ) ) ( not ( = ?auto_25570 ?auto_25591 ) ) ( not ( = ?auto_25571 ?auto_25576 ) ) ( not ( = ?auto_25571 ?auto_25591 ) ) ( not ( = ?auto_25572 ?auto_25576 ) ) ( not ( = ?auto_25572 ?auto_25591 ) ) ( not ( = ?auto_25573 ?auto_25576 ) ) ( not ( = ?auto_25573 ?auto_25591 ) ) ( not ( = ?auto_25576 ?auto_25595 ) ) ( not ( = ?auto_25576 ?auto_25588 ) ) ( not ( = ?auto_25576 ?auto_25599 ) ) ( not ( = ?auto_25576 ?auto_25601 ) ) ( not ( = ?auto_25590 ?auto_25596 ) ) ( not ( = ?auto_25590 ?auto_25586 ) ) ( not ( = ?auto_25590 ?auto_25597 ) ) ( not ( = ?auto_25600 ?auto_25592 ) ) ( not ( = ?auto_25600 ?auto_25594 ) ) ( not ( = ?auto_25600 ?auto_25593 ) ) ( not ( = ?auto_25591 ?auto_25595 ) ) ( not ( = ?auto_25591 ?auto_25588 ) ) ( not ( = ?auto_25591 ?auto_25599 ) ) ( not ( = ?auto_25591 ?auto_25601 ) ) ( not ( = ?auto_25570 ?auto_25575 ) ) ( not ( = ?auto_25570 ?auto_25589 ) ) ( not ( = ?auto_25571 ?auto_25575 ) ) ( not ( = ?auto_25571 ?auto_25589 ) ) ( not ( = ?auto_25572 ?auto_25575 ) ) ( not ( = ?auto_25572 ?auto_25589 ) ) ( not ( = ?auto_25573 ?auto_25575 ) ) ( not ( = ?auto_25573 ?auto_25589 ) ) ( not ( = ?auto_25574 ?auto_25575 ) ) ( not ( = ?auto_25574 ?auto_25589 ) ) ( not ( = ?auto_25575 ?auto_25591 ) ) ( not ( = ?auto_25575 ?auto_25595 ) ) ( not ( = ?auto_25575 ?auto_25588 ) ) ( not ( = ?auto_25575 ?auto_25599 ) ) ( not ( = ?auto_25575 ?auto_25601 ) ) ( not ( = ?auto_25598 ?auto_25590 ) ) ( not ( = ?auto_25598 ?auto_25596 ) ) ( not ( = ?auto_25598 ?auto_25586 ) ) ( not ( = ?auto_25598 ?auto_25597 ) ) ( not ( = ?auto_25587 ?auto_25600 ) ) ( not ( = ?auto_25587 ?auto_25592 ) ) ( not ( = ?auto_25587 ?auto_25594 ) ) ( not ( = ?auto_25587 ?auto_25593 ) ) ( not ( = ?auto_25589 ?auto_25591 ) ) ( not ( = ?auto_25589 ?auto_25595 ) ) ( not ( = ?auto_25589 ?auto_25588 ) ) ( not ( = ?auto_25589 ?auto_25599 ) ) ( not ( = ?auto_25589 ?auto_25601 ) ) ( not ( = ?auto_25570 ?auto_25578 ) ) ( not ( = ?auto_25570 ?auto_25602 ) ) ( not ( = ?auto_25571 ?auto_25578 ) ) ( not ( = ?auto_25571 ?auto_25602 ) ) ( not ( = ?auto_25572 ?auto_25578 ) ) ( not ( = ?auto_25572 ?auto_25602 ) ) ( not ( = ?auto_25573 ?auto_25578 ) ) ( not ( = ?auto_25573 ?auto_25602 ) ) ( not ( = ?auto_25574 ?auto_25578 ) ) ( not ( = ?auto_25574 ?auto_25602 ) ) ( not ( = ?auto_25576 ?auto_25578 ) ) ( not ( = ?auto_25576 ?auto_25602 ) ) ( not ( = ?auto_25578 ?auto_25589 ) ) ( not ( = ?auto_25578 ?auto_25591 ) ) ( not ( = ?auto_25578 ?auto_25595 ) ) ( not ( = ?auto_25578 ?auto_25588 ) ) ( not ( = ?auto_25578 ?auto_25599 ) ) ( not ( = ?auto_25578 ?auto_25601 ) ) ( not ( = ?auto_25603 ?auto_25598 ) ) ( not ( = ?auto_25603 ?auto_25590 ) ) ( not ( = ?auto_25603 ?auto_25596 ) ) ( not ( = ?auto_25603 ?auto_25586 ) ) ( not ( = ?auto_25603 ?auto_25597 ) ) ( not ( = ?auto_25585 ?auto_25587 ) ) ( not ( = ?auto_25585 ?auto_25600 ) ) ( not ( = ?auto_25585 ?auto_25592 ) ) ( not ( = ?auto_25585 ?auto_25594 ) ) ( not ( = ?auto_25585 ?auto_25593 ) ) ( not ( = ?auto_25602 ?auto_25589 ) ) ( not ( = ?auto_25602 ?auto_25591 ) ) ( not ( = ?auto_25602 ?auto_25595 ) ) ( not ( = ?auto_25602 ?auto_25588 ) ) ( not ( = ?auto_25602 ?auto_25599 ) ) ( not ( = ?auto_25602 ?auto_25601 ) ) ( not ( = ?auto_25570 ?auto_25577 ) ) ( not ( = ?auto_25570 ?auto_25579 ) ) ( not ( = ?auto_25571 ?auto_25577 ) ) ( not ( = ?auto_25571 ?auto_25579 ) ) ( not ( = ?auto_25572 ?auto_25577 ) ) ( not ( = ?auto_25572 ?auto_25579 ) ) ( not ( = ?auto_25573 ?auto_25577 ) ) ( not ( = ?auto_25573 ?auto_25579 ) ) ( not ( = ?auto_25574 ?auto_25577 ) ) ( not ( = ?auto_25574 ?auto_25579 ) ) ( not ( = ?auto_25576 ?auto_25577 ) ) ( not ( = ?auto_25576 ?auto_25579 ) ) ( not ( = ?auto_25575 ?auto_25577 ) ) ( not ( = ?auto_25575 ?auto_25579 ) ) ( not ( = ?auto_25577 ?auto_25602 ) ) ( not ( = ?auto_25577 ?auto_25589 ) ) ( not ( = ?auto_25577 ?auto_25591 ) ) ( not ( = ?auto_25577 ?auto_25595 ) ) ( not ( = ?auto_25577 ?auto_25588 ) ) ( not ( = ?auto_25577 ?auto_25599 ) ) ( not ( = ?auto_25577 ?auto_25601 ) ) ( not ( = ?auto_25582 ?auto_25603 ) ) ( not ( = ?auto_25582 ?auto_25598 ) ) ( not ( = ?auto_25582 ?auto_25590 ) ) ( not ( = ?auto_25582 ?auto_25596 ) ) ( not ( = ?auto_25582 ?auto_25586 ) ) ( not ( = ?auto_25582 ?auto_25597 ) ) ( not ( = ?auto_25584 ?auto_25585 ) ) ( not ( = ?auto_25584 ?auto_25587 ) ) ( not ( = ?auto_25584 ?auto_25600 ) ) ( not ( = ?auto_25584 ?auto_25592 ) ) ( not ( = ?auto_25584 ?auto_25594 ) ) ( not ( = ?auto_25584 ?auto_25593 ) ) ( not ( = ?auto_25579 ?auto_25602 ) ) ( not ( = ?auto_25579 ?auto_25589 ) ) ( not ( = ?auto_25579 ?auto_25591 ) ) ( not ( = ?auto_25579 ?auto_25595 ) ) ( not ( = ?auto_25579 ?auto_25588 ) ) ( not ( = ?auto_25579 ?auto_25599 ) ) ( not ( = ?auto_25579 ?auto_25601 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_25570 ?auto_25571 ?auto_25572 ?auto_25573 ?auto_25574 ?auto_25576 ?auto_25575 ?auto_25578 )
      ( MAKE-1CRATE ?auto_25578 ?auto_25577 )
      ( MAKE-8CRATE-VERIFY ?auto_25570 ?auto_25571 ?auto_25572 ?auto_25573 ?auto_25574 ?auto_25576 ?auto_25575 ?auto_25578 ?auto_25577 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25606 - SURFACE
      ?auto_25607 - SURFACE
    )
    :vars
    (
      ?auto_25608 - HOIST
      ?auto_25609 - PLACE
      ?auto_25611 - PLACE
      ?auto_25612 - HOIST
      ?auto_25613 - SURFACE
      ?auto_25610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25608 ?auto_25609 ) ( SURFACE-AT ?auto_25606 ?auto_25609 ) ( CLEAR ?auto_25606 ) ( IS-CRATE ?auto_25607 ) ( AVAILABLE ?auto_25608 ) ( not ( = ?auto_25611 ?auto_25609 ) ) ( HOIST-AT ?auto_25612 ?auto_25611 ) ( AVAILABLE ?auto_25612 ) ( SURFACE-AT ?auto_25607 ?auto_25611 ) ( ON ?auto_25607 ?auto_25613 ) ( CLEAR ?auto_25607 ) ( TRUCK-AT ?auto_25610 ?auto_25609 ) ( not ( = ?auto_25606 ?auto_25607 ) ) ( not ( = ?auto_25606 ?auto_25613 ) ) ( not ( = ?auto_25607 ?auto_25613 ) ) ( not ( = ?auto_25608 ?auto_25612 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25610 ?auto_25609 ?auto_25611 )
      ( !LIFT ?auto_25612 ?auto_25607 ?auto_25613 ?auto_25611 )
      ( !LOAD ?auto_25612 ?auto_25607 ?auto_25610 ?auto_25611 )
      ( !DRIVE ?auto_25610 ?auto_25611 ?auto_25609 )
      ( !UNLOAD ?auto_25608 ?auto_25607 ?auto_25610 ?auto_25609 )
      ( !DROP ?auto_25608 ?auto_25607 ?auto_25606 ?auto_25609 )
      ( MAKE-1CRATE-VERIFY ?auto_25606 ?auto_25607 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_25624 - SURFACE
      ?auto_25625 - SURFACE
      ?auto_25626 - SURFACE
      ?auto_25627 - SURFACE
      ?auto_25628 - SURFACE
      ?auto_25631 - SURFACE
      ?auto_25629 - SURFACE
      ?auto_25633 - SURFACE
      ?auto_25632 - SURFACE
      ?auto_25630 - SURFACE
    )
    :vars
    (
      ?auto_25638 - HOIST
      ?auto_25636 - PLACE
      ?auto_25635 - PLACE
      ?auto_25637 - HOIST
      ?auto_25634 - SURFACE
      ?auto_25656 - PLACE
      ?auto_25660 - HOIST
      ?auto_25657 - SURFACE
      ?auto_25642 - PLACE
      ?auto_25643 - HOIST
      ?auto_25645 - SURFACE
      ?auto_25652 - PLACE
      ?auto_25644 - HOIST
      ?auto_25640 - SURFACE
      ?auto_25655 - PLACE
      ?auto_25647 - HOIST
      ?auto_25654 - SURFACE
      ?auto_25649 - PLACE
      ?auto_25658 - HOIST
      ?auto_25650 - SURFACE
      ?auto_25659 - PLACE
      ?auto_25648 - HOIST
      ?auto_25641 - SURFACE
      ?auto_25651 - PLACE
      ?auto_25646 - HOIST
      ?auto_25653 - SURFACE
      ?auto_25661 - SURFACE
      ?auto_25639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25638 ?auto_25636 ) ( IS-CRATE ?auto_25630 ) ( not ( = ?auto_25635 ?auto_25636 ) ) ( HOIST-AT ?auto_25637 ?auto_25635 ) ( AVAILABLE ?auto_25637 ) ( SURFACE-AT ?auto_25630 ?auto_25635 ) ( ON ?auto_25630 ?auto_25634 ) ( CLEAR ?auto_25630 ) ( not ( = ?auto_25632 ?auto_25630 ) ) ( not ( = ?auto_25632 ?auto_25634 ) ) ( not ( = ?auto_25630 ?auto_25634 ) ) ( not ( = ?auto_25638 ?auto_25637 ) ) ( IS-CRATE ?auto_25632 ) ( not ( = ?auto_25656 ?auto_25636 ) ) ( HOIST-AT ?auto_25660 ?auto_25656 ) ( AVAILABLE ?auto_25660 ) ( SURFACE-AT ?auto_25632 ?auto_25656 ) ( ON ?auto_25632 ?auto_25657 ) ( CLEAR ?auto_25632 ) ( not ( = ?auto_25633 ?auto_25632 ) ) ( not ( = ?auto_25633 ?auto_25657 ) ) ( not ( = ?auto_25632 ?auto_25657 ) ) ( not ( = ?auto_25638 ?auto_25660 ) ) ( IS-CRATE ?auto_25633 ) ( not ( = ?auto_25642 ?auto_25636 ) ) ( HOIST-AT ?auto_25643 ?auto_25642 ) ( AVAILABLE ?auto_25643 ) ( SURFACE-AT ?auto_25633 ?auto_25642 ) ( ON ?auto_25633 ?auto_25645 ) ( CLEAR ?auto_25633 ) ( not ( = ?auto_25629 ?auto_25633 ) ) ( not ( = ?auto_25629 ?auto_25645 ) ) ( not ( = ?auto_25633 ?auto_25645 ) ) ( not ( = ?auto_25638 ?auto_25643 ) ) ( IS-CRATE ?auto_25629 ) ( not ( = ?auto_25652 ?auto_25636 ) ) ( HOIST-AT ?auto_25644 ?auto_25652 ) ( AVAILABLE ?auto_25644 ) ( SURFACE-AT ?auto_25629 ?auto_25652 ) ( ON ?auto_25629 ?auto_25640 ) ( CLEAR ?auto_25629 ) ( not ( = ?auto_25631 ?auto_25629 ) ) ( not ( = ?auto_25631 ?auto_25640 ) ) ( not ( = ?auto_25629 ?auto_25640 ) ) ( not ( = ?auto_25638 ?auto_25644 ) ) ( IS-CRATE ?auto_25631 ) ( not ( = ?auto_25655 ?auto_25636 ) ) ( HOIST-AT ?auto_25647 ?auto_25655 ) ( AVAILABLE ?auto_25647 ) ( SURFACE-AT ?auto_25631 ?auto_25655 ) ( ON ?auto_25631 ?auto_25654 ) ( CLEAR ?auto_25631 ) ( not ( = ?auto_25628 ?auto_25631 ) ) ( not ( = ?auto_25628 ?auto_25654 ) ) ( not ( = ?auto_25631 ?auto_25654 ) ) ( not ( = ?auto_25638 ?auto_25647 ) ) ( IS-CRATE ?auto_25628 ) ( not ( = ?auto_25649 ?auto_25636 ) ) ( HOIST-AT ?auto_25658 ?auto_25649 ) ( SURFACE-AT ?auto_25628 ?auto_25649 ) ( ON ?auto_25628 ?auto_25650 ) ( CLEAR ?auto_25628 ) ( not ( = ?auto_25627 ?auto_25628 ) ) ( not ( = ?auto_25627 ?auto_25650 ) ) ( not ( = ?auto_25628 ?auto_25650 ) ) ( not ( = ?auto_25638 ?auto_25658 ) ) ( IS-CRATE ?auto_25627 ) ( not ( = ?auto_25659 ?auto_25636 ) ) ( HOIST-AT ?auto_25648 ?auto_25659 ) ( AVAILABLE ?auto_25648 ) ( SURFACE-AT ?auto_25627 ?auto_25659 ) ( ON ?auto_25627 ?auto_25641 ) ( CLEAR ?auto_25627 ) ( not ( = ?auto_25626 ?auto_25627 ) ) ( not ( = ?auto_25626 ?auto_25641 ) ) ( not ( = ?auto_25627 ?auto_25641 ) ) ( not ( = ?auto_25638 ?auto_25648 ) ) ( IS-CRATE ?auto_25626 ) ( not ( = ?auto_25651 ?auto_25636 ) ) ( HOIST-AT ?auto_25646 ?auto_25651 ) ( AVAILABLE ?auto_25646 ) ( SURFACE-AT ?auto_25626 ?auto_25651 ) ( ON ?auto_25626 ?auto_25653 ) ( CLEAR ?auto_25626 ) ( not ( = ?auto_25625 ?auto_25626 ) ) ( not ( = ?auto_25625 ?auto_25653 ) ) ( not ( = ?auto_25626 ?auto_25653 ) ) ( not ( = ?auto_25638 ?auto_25646 ) ) ( SURFACE-AT ?auto_25624 ?auto_25636 ) ( CLEAR ?auto_25624 ) ( IS-CRATE ?auto_25625 ) ( AVAILABLE ?auto_25638 ) ( AVAILABLE ?auto_25658 ) ( SURFACE-AT ?auto_25625 ?auto_25649 ) ( ON ?auto_25625 ?auto_25661 ) ( CLEAR ?auto_25625 ) ( TRUCK-AT ?auto_25639 ?auto_25636 ) ( not ( = ?auto_25624 ?auto_25625 ) ) ( not ( = ?auto_25624 ?auto_25661 ) ) ( not ( = ?auto_25625 ?auto_25661 ) ) ( not ( = ?auto_25624 ?auto_25626 ) ) ( not ( = ?auto_25624 ?auto_25653 ) ) ( not ( = ?auto_25626 ?auto_25661 ) ) ( not ( = ?auto_25651 ?auto_25649 ) ) ( not ( = ?auto_25646 ?auto_25658 ) ) ( not ( = ?auto_25653 ?auto_25661 ) ) ( not ( = ?auto_25624 ?auto_25627 ) ) ( not ( = ?auto_25624 ?auto_25641 ) ) ( not ( = ?auto_25625 ?auto_25627 ) ) ( not ( = ?auto_25625 ?auto_25641 ) ) ( not ( = ?auto_25627 ?auto_25653 ) ) ( not ( = ?auto_25627 ?auto_25661 ) ) ( not ( = ?auto_25659 ?auto_25651 ) ) ( not ( = ?auto_25659 ?auto_25649 ) ) ( not ( = ?auto_25648 ?auto_25646 ) ) ( not ( = ?auto_25648 ?auto_25658 ) ) ( not ( = ?auto_25641 ?auto_25653 ) ) ( not ( = ?auto_25641 ?auto_25661 ) ) ( not ( = ?auto_25624 ?auto_25628 ) ) ( not ( = ?auto_25624 ?auto_25650 ) ) ( not ( = ?auto_25625 ?auto_25628 ) ) ( not ( = ?auto_25625 ?auto_25650 ) ) ( not ( = ?auto_25626 ?auto_25628 ) ) ( not ( = ?auto_25626 ?auto_25650 ) ) ( not ( = ?auto_25628 ?auto_25641 ) ) ( not ( = ?auto_25628 ?auto_25653 ) ) ( not ( = ?auto_25628 ?auto_25661 ) ) ( not ( = ?auto_25650 ?auto_25641 ) ) ( not ( = ?auto_25650 ?auto_25653 ) ) ( not ( = ?auto_25650 ?auto_25661 ) ) ( not ( = ?auto_25624 ?auto_25631 ) ) ( not ( = ?auto_25624 ?auto_25654 ) ) ( not ( = ?auto_25625 ?auto_25631 ) ) ( not ( = ?auto_25625 ?auto_25654 ) ) ( not ( = ?auto_25626 ?auto_25631 ) ) ( not ( = ?auto_25626 ?auto_25654 ) ) ( not ( = ?auto_25627 ?auto_25631 ) ) ( not ( = ?auto_25627 ?auto_25654 ) ) ( not ( = ?auto_25631 ?auto_25650 ) ) ( not ( = ?auto_25631 ?auto_25641 ) ) ( not ( = ?auto_25631 ?auto_25653 ) ) ( not ( = ?auto_25631 ?auto_25661 ) ) ( not ( = ?auto_25655 ?auto_25649 ) ) ( not ( = ?auto_25655 ?auto_25659 ) ) ( not ( = ?auto_25655 ?auto_25651 ) ) ( not ( = ?auto_25647 ?auto_25658 ) ) ( not ( = ?auto_25647 ?auto_25648 ) ) ( not ( = ?auto_25647 ?auto_25646 ) ) ( not ( = ?auto_25654 ?auto_25650 ) ) ( not ( = ?auto_25654 ?auto_25641 ) ) ( not ( = ?auto_25654 ?auto_25653 ) ) ( not ( = ?auto_25654 ?auto_25661 ) ) ( not ( = ?auto_25624 ?auto_25629 ) ) ( not ( = ?auto_25624 ?auto_25640 ) ) ( not ( = ?auto_25625 ?auto_25629 ) ) ( not ( = ?auto_25625 ?auto_25640 ) ) ( not ( = ?auto_25626 ?auto_25629 ) ) ( not ( = ?auto_25626 ?auto_25640 ) ) ( not ( = ?auto_25627 ?auto_25629 ) ) ( not ( = ?auto_25627 ?auto_25640 ) ) ( not ( = ?auto_25628 ?auto_25629 ) ) ( not ( = ?auto_25628 ?auto_25640 ) ) ( not ( = ?auto_25629 ?auto_25654 ) ) ( not ( = ?auto_25629 ?auto_25650 ) ) ( not ( = ?auto_25629 ?auto_25641 ) ) ( not ( = ?auto_25629 ?auto_25653 ) ) ( not ( = ?auto_25629 ?auto_25661 ) ) ( not ( = ?auto_25652 ?auto_25655 ) ) ( not ( = ?auto_25652 ?auto_25649 ) ) ( not ( = ?auto_25652 ?auto_25659 ) ) ( not ( = ?auto_25652 ?auto_25651 ) ) ( not ( = ?auto_25644 ?auto_25647 ) ) ( not ( = ?auto_25644 ?auto_25658 ) ) ( not ( = ?auto_25644 ?auto_25648 ) ) ( not ( = ?auto_25644 ?auto_25646 ) ) ( not ( = ?auto_25640 ?auto_25654 ) ) ( not ( = ?auto_25640 ?auto_25650 ) ) ( not ( = ?auto_25640 ?auto_25641 ) ) ( not ( = ?auto_25640 ?auto_25653 ) ) ( not ( = ?auto_25640 ?auto_25661 ) ) ( not ( = ?auto_25624 ?auto_25633 ) ) ( not ( = ?auto_25624 ?auto_25645 ) ) ( not ( = ?auto_25625 ?auto_25633 ) ) ( not ( = ?auto_25625 ?auto_25645 ) ) ( not ( = ?auto_25626 ?auto_25633 ) ) ( not ( = ?auto_25626 ?auto_25645 ) ) ( not ( = ?auto_25627 ?auto_25633 ) ) ( not ( = ?auto_25627 ?auto_25645 ) ) ( not ( = ?auto_25628 ?auto_25633 ) ) ( not ( = ?auto_25628 ?auto_25645 ) ) ( not ( = ?auto_25631 ?auto_25633 ) ) ( not ( = ?auto_25631 ?auto_25645 ) ) ( not ( = ?auto_25633 ?auto_25640 ) ) ( not ( = ?auto_25633 ?auto_25654 ) ) ( not ( = ?auto_25633 ?auto_25650 ) ) ( not ( = ?auto_25633 ?auto_25641 ) ) ( not ( = ?auto_25633 ?auto_25653 ) ) ( not ( = ?auto_25633 ?auto_25661 ) ) ( not ( = ?auto_25642 ?auto_25652 ) ) ( not ( = ?auto_25642 ?auto_25655 ) ) ( not ( = ?auto_25642 ?auto_25649 ) ) ( not ( = ?auto_25642 ?auto_25659 ) ) ( not ( = ?auto_25642 ?auto_25651 ) ) ( not ( = ?auto_25643 ?auto_25644 ) ) ( not ( = ?auto_25643 ?auto_25647 ) ) ( not ( = ?auto_25643 ?auto_25658 ) ) ( not ( = ?auto_25643 ?auto_25648 ) ) ( not ( = ?auto_25643 ?auto_25646 ) ) ( not ( = ?auto_25645 ?auto_25640 ) ) ( not ( = ?auto_25645 ?auto_25654 ) ) ( not ( = ?auto_25645 ?auto_25650 ) ) ( not ( = ?auto_25645 ?auto_25641 ) ) ( not ( = ?auto_25645 ?auto_25653 ) ) ( not ( = ?auto_25645 ?auto_25661 ) ) ( not ( = ?auto_25624 ?auto_25632 ) ) ( not ( = ?auto_25624 ?auto_25657 ) ) ( not ( = ?auto_25625 ?auto_25632 ) ) ( not ( = ?auto_25625 ?auto_25657 ) ) ( not ( = ?auto_25626 ?auto_25632 ) ) ( not ( = ?auto_25626 ?auto_25657 ) ) ( not ( = ?auto_25627 ?auto_25632 ) ) ( not ( = ?auto_25627 ?auto_25657 ) ) ( not ( = ?auto_25628 ?auto_25632 ) ) ( not ( = ?auto_25628 ?auto_25657 ) ) ( not ( = ?auto_25631 ?auto_25632 ) ) ( not ( = ?auto_25631 ?auto_25657 ) ) ( not ( = ?auto_25629 ?auto_25632 ) ) ( not ( = ?auto_25629 ?auto_25657 ) ) ( not ( = ?auto_25632 ?auto_25645 ) ) ( not ( = ?auto_25632 ?auto_25640 ) ) ( not ( = ?auto_25632 ?auto_25654 ) ) ( not ( = ?auto_25632 ?auto_25650 ) ) ( not ( = ?auto_25632 ?auto_25641 ) ) ( not ( = ?auto_25632 ?auto_25653 ) ) ( not ( = ?auto_25632 ?auto_25661 ) ) ( not ( = ?auto_25656 ?auto_25642 ) ) ( not ( = ?auto_25656 ?auto_25652 ) ) ( not ( = ?auto_25656 ?auto_25655 ) ) ( not ( = ?auto_25656 ?auto_25649 ) ) ( not ( = ?auto_25656 ?auto_25659 ) ) ( not ( = ?auto_25656 ?auto_25651 ) ) ( not ( = ?auto_25660 ?auto_25643 ) ) ( not ( = ?auto_25660 ?auto_25644 ) ) ( not ( = ?auto_25660 ?auto_25647 ) ) ( not ( = ?auto_25660 ?auto_25658 ) ) ( not ( = ?auto_25660 ?auto_25648 ) ) ( not ( = ?auto_25660 ?auto_25646 ) ) ( not ( = ?auto_25657 ?auto_25645 ) ) ( not ( = ?auto_25657 ?auto_25640 ) ) ( not ( = ?auto_25657 ?auto_25654 ) ) ( not ( = ?auto_25657 ?auto_25650 ) ) ( not ( = ?auto_25657 ?auto_25641 ) ) ( not ( = ?auto_25657 ?auto_25653 ) ) ( not ( = ?auto_25657 ?auto_25661 ) ) ( not ( = ?auto_25624 ?auto_25630 ) ) ( not ( = ?auto_25624 ?auto_25634 ) ) ( not ( = ?auto_25625 ?auto_25630 ) ) ( not ( = ?auto_25625 ?auto_25634 ) ) ( not ( = ?auto_25626 ?auto_25630 ) ) ( not ( = ?auto_25626 ?auto_25634 ) ) ( not ( = ?auto_25627 ?auto_25630 ) ) ( not ( = ?auto_25627 ?auto_25634 ) ) ( not ( = ?auto_25628 ?auto_25630 ) ) ( not ( = ?auto_25628 ?auto_25634 ) ) ( not ( = ?auto_25631 ?auto_25630 ) ) ( not ( = ?auto_25631 ?auto_25634 ) ) ( not ( = ?auto_25629 ?auto_25630 ) ) ( not ( = ?auto_25629 ?auto_25634 ) ) ( not ( = ?auto_25633 ?auto_25630 ) ) ( not ( = ?auto_25633 ?auto_25634 ) ) ( not ( = ?auto_25630 ?auto_25657 ) ) ( not ( = ?auto_25630 ?auto_25645 ) ) ( not ( = ?auto_25630 ?auto_25640 ) ) ( not ( = ?auto_25630 ?auto_25654 ) ) ( not ( = ?auto_25630 ?auto_25650 ) ) ( not ( = ?auto_25630 ?auto_25641 ) ) ( not ( = ?auto_25630 ?auto_25653 ) ) ( not ( = ?auto_25630 ?auto_25661 ) ) ( not ( = ?auto_25635 ?auto_25656 ) ) ( not ( = ?auto_25635 ?auto_25642 ) ) ( not ( = ?auto_25635 ?auto_25652 ) ) ( not ( = ?auto_25635 ?auto_25655 ) ) ( not ( = ?auto_25635 ?auto_25649 ) ) ( not ( = ?auto_25635 ?auto_25659 ) ) ( not ( = ?auto_25635 ?auto_25651 ) ) ( not ( = ?auto_25637 ?auto_25660 ) ) ( not ( = ?auto_25637 ?auto_25643 ) ) ( not ( = ?auto_25637 ?auto_25644 ) ) ( not ( = ?auto_25637 ?auto_25647 ) ) ( not ( = ?auto_25637 ?auto_25658 ) ) ( not ( = ?auto_25637 ?auto_25648 ) ) ( not ( = ?auto_25637 ?auto_25646 ) ) ( not ( = ?auto_25634 ?auto_25657 ) ) ( not ( = ?auto_25634 ?auto_25645 ) ) ( not ( = ?auto_25634 ?auto_25640 ) ) ( not ( = ?auto_25634 ?auto_25654 ) ) ( not ( = ?auto_25634 ?auto_25650 ) ) ( not ( = ?auto_25634 ?auto_25641 ) ) ( not ( = ?auto_25634 ?auto_25653 ) ) ( not ( = ?auto_25634 ?auto_25661 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_25624 ?auto_25625 ?auto_25626 ?auto_25627 ?auto_25628 ?auto_25631 ?auto_25629 ?auto_25633 ?auto_25632 )
      ( MAKE-1CRATE ?auto_25632 ?auto_25630 )
      ( MAKE-9CRATE-VERIFY ?auto_25624 ?auto_25625 ?auto_25626 ?auto_25627 ?auto_25628 ?auto_25631 ?auto_25629 ?auto_25633 ?auto_25632 ?auto_25630 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25664 - SURFACE
      ?auto_25665 - SURFACE
    )
    :vars
    (
      ?auto_25666 - HOIST
      ?auto_25667 - PLACE
      ?auto_25669 - PLACE
      ?auto_25670 - HOIST
      ?auto_25671 - SURFACE
      ?auto_25668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25666 ?auto_25667 ) ( SURFACE-AT ?auto_25664 ?auto_25667 ) ( CLEAR ?auto_25664 ) ( IS-CRATE ?auto_25665 ) ( AVAILABLE ?auto_25666 ) ( not ( = ?auto_25669 ?auto_25667 ) ) ( HOIST-AT ?auto_25670 ?auto_25669 ) ( AVAILABLE ?auto_25670 ) ( SURFACE-AT ?auto_25665 ?auto_25669 ) ( ON ?auto_25665 ?auto_25671 ) ( CLEAR ?auto_25665 ) ( TRUCK-AT ?auto_25668 ?auto_25667 ) ( not ( = ?auto_25664 ?auto_25665 ) ) ( not ( = ?auto_25664 ?auto_25671 ) ) ( not ( = ?auto_25665 ?auto_25671 ) ) ( not ( = ?auto_25666 ?auto_25670 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25668 ?auto_25667 ?auto_25669 )
      ( !LIFT ?auto_25670 ?auto_25665 ?auto_25671 ?auto_25669 )
      ( !LOAD ?auto_25670 ?auto_25665 ?auto_25668 ?auto_25669 )
      ( !DRIVE ?auto_25668 ?auto_25669 ?auto_25667 )
      ( !UNLOAD ?auto_25666 ?auto_25665 ?auto_25668 ?auto_25667 )
      ( !DROP ?auto_25666 ?auto_25665 ?auto_25664 ?auto_25667 )
      ( MAKE-1CRATE-VERIFY ?auto_25664 ?auto_25665 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_25683 - SURFACE
      ?auto_25684 - SURFACE
      ?auto_25685 - SURFACE
      ?auto_25686 - SURFACE
      ?auto_25687 - SURFACE
      ?auto_25690 - SURFACE
      ?auto_25688 - SURFACE
      ?auto_25692 - SURFACE
      ?auto_25691 - SURFACE
      ?auto_25689 - SURFACE
      ?auto_25693 - SURFACE
    )
    :vars
    (
      ?auto_25694 - HOIST
      ?auto_25699 - PLACE
      ?auto_25695 - PLACE
      ?auto_25696 - HOIST
      ?auto_25697 - SURFACE
      ?auto_25703 - PLACE
      ?auto_25710 - HOIST
      ?auto_25717 - SURFACE
      ?auto_25700 - PLACE
      ?auto_25714 - HOIST
      ?auto_25722 - SURFACE
      ?auto_25719 - PLACE
      ?auto_25702 - HOIST
      ?auto_25707 - SURFACE
      ?auto_25721 - PLACE
      ?auto_25708 - HOIST
      ?auto_25712 - SURFACE
      ?auto_25715 - PLACE
      ?auto_25705 - HOIST
      ?auto_25711 - SURFACE
      ?auto_25724 - PLACE
      ?auto_25716 - HOIST
      ?auto_25701 - SURFACE
      ?auto_25720 - PLACE
      ?auto_25723 - HOIST
      ?auto_25709 - SURFACE
      ?auto_25713 - PLACE
      ?auto_25706 - HOIST
      ?auto_25704 - SURFACE
      ?auto_25718 - SURFACE
      ?auto_25698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25694 ?auto_25699 ) ( IS-CRATE ?auto_25693 ) ( not ( = ?auto_25695 ?auto_25699 ) ) ( HOIST-AT ?auto_25696 ?auto_25695 ) ( AVAILABLE ?auto_25696 ) ( SURFACE-AT ?auto_25693 ?auto_25695 ) ( ON ?auto_25693 ?auto_25697 ) ( CLEAR ?auto_25693 ) ( not ( = ?auto_25689 ?auto_25693 ) ) ( not ( = ?auto_25689 ?auto_25697 ) ) ( not ( = ?auto_25693 ?auto_25697 ) ) ( not ( = ?auto_25694 ?auto_25696 ) ) ( IS-CRATE ?auto_25689 ) ( not ( = ?auto_25703 ?auto_25699 ) ) ( HOIST-AT ?auto_25710 ?auto_25703 ) ( AVAILABLE ?auto_25710 ) ( SURFACE-AT ?auto_25689 ?auto_25703 ) ( ON ?auto_25689 ?auto_25717 ) ( CLEAR ?auto_25689 ) ( not ( = ?auto_25691 ?auto_25689 ) ) ( not ( = ?auto_25691 ?auto_25717 ) ) ( not ( = ?auto_25689 ?auto_25717 ) ) ( not ( = ?auto_25694 ?auto_25710 ) ) ( IS-CRATE ?auto_25691 ) ( not ( = ?auto_25700 ?auto_25699 ) ) ( HOIST-AT ?auto_25714 ?auto_25700 ) ( AVAILABLE ?auto_25714 ) ( SURFACE-AT ?auto_25691 ?auto_25700 ) ( ON ?auto_25691 ?auto_25722 ) ( CLEAR ?auto_25691 ) ( not ( = ?auto_25692 ?auto_25691 ) ) ( not ( = ?auto_25692 ?auto_25722 ) ) ( not ( = ?auto_25691 ?auto_25722 ) ) ( not ( = ?auto_25694 ?auto_25714 ) ) ( IS-CRATE ?auto_25692 ) ( not ( = ?auto_25719 ?auto_25699 ) ) ( HOIST-AT ?auto_25702 ?auto_25719 ) ( AVAILABLE ?auto_25702 ) ( SURFACE-AT ?auto_25692 ?auto_25719 ) ( ON ?auto_25692 ?auto_25707 ) ( CLEAR ?auto_25692 ) ( not ( = ?auto_25688 ?auto_25692 ) ) ( not ( = ?auto_25688 ?auto_25707 ) ) ( not ( = ?auto_25692 ?auto_25707 ) ) ( not ( = ?auto_25694 ?auto_25702 ) ) ( IS-CRATE ?auto_25688 ) ( not ( = ?auto_25721 ?auto_25699 ) ) ( HOIST-AT ?auto_25708 ?auto_25721 ) ( AVAILABLE ?auto_25708 ) ( SURFACE-AT ?auto_25688 ?auto_25721 ) ( ON ?auto_25688 ?auto_25712 ) ( CLEAR ?auto_25688 ) ( not ( = ?auto_25690 ?auto_25688 ) ) ( not ( = ?auto_25690 ?auto_25712 ) ) ( not ( = ?auto_25688 ?auto_25712 ) ) ( not ( = ?auto_25694 ?auto_25708 ) ) ( IS-CRATE ?auto_25690 ) ( not ( = ?auto_25715 ?auto_25699 ) ) ( HOIST-AT ?auto_25705 ?auto_25715 ) ( AVAILABLE ?auto_25705 ) ( SURFACE-AT ?auto_25690 ?auto_25715 ) ( ON ?auto_25690 ?auto_25711 ) ( CLEAR ?auto_25690 ) ( not ( = ?auto_25687 ?auto_25690 ) ) ( not ( = ?auto_25687 ?auto_25711 ) ) ( not ( = ?auto_25690 ?auto_25711 ) ) ( not ( = ?auto_25694 ?auto_25705 ) ) ( IS-CRATE ?auto_25687 ) ( not ( = ?auto_25724 ?auto_25699 ) ) ( HOIST-AT ?auto_25716 ?auto_25724 ) ( SURFACE-AT ?auto_25687 ?auto_25724 ) ( ON ?auto_25687 ?auto_25701 ) ( CLEAR ?auto_25687 ) ( not ( = ?auto_25686 ?auto_25687 ) ) ( not ( = ?auto_25686 ?auto_25701 ) ) ( not ( = ?auto_25687 ?auto_25701 ) ) ( not ( = ?auto_25694 ?auto_25716 ) ) ( IS-CRATE ?auto_25686 ) ( not ( = ?auto_25720 ?auto_25699 ) ) ( HOIST-AT ?auto_25723 ?auto_25720 ) ( AVAILABLE ?auto_25723 ) ( SURFACE-AT ?auto_25686 ?auto_25720 ) ( ON ?auto_25686 ?auto_25709 ) ( CLEAR ?auto_25686 ) ( not ( = ?auto_25685 ?auto_25686 ) ) ( not ( = ?auto_25685 ?auto_25709 ) ) ( not ( = ?auto_25686 ?auto_25709 ) ) ( not ( = ?auto_25694 ?auto_25723 ) ) ( IS-CRATE ?auto_25685 ) ( not ( = ?auto_25713 ?auto_25699 ) ) ( HOIST-AT ?auto_25706 ?auto_25713 ) ( AVAILABLE ?auto_25706 ) ( SURFACE-AT ?auto_25685 ?auto_25713 ) ( ON ?auto_25685 ?auto_25704 ) ( CLEAR ?auto_25685 ) ( not ( = ?auto_25684 ?auto_25685 ) ) ( not ( = ?auto_25684 ?auto_25704 ) ) ( not ( = ?auto_25685 ?auto_25704 ) ) ( not ( = ?auto_25694 ?auto_25706 ) ) ( SURFACE-AT ?auto_25683 ?auto_25699 ) ( CLEAR ?auto_25683 ) ( IS-CRATE ?auto_25684 ) ( AVAILABLE ?auto_25694 ) ( AVAILABLE ?auto_25716 ) ( SURFACE-AT ?auto_25684 ?auto_25724 ) ( ON ?auto_25684 ?auto_25718 ) ( CLEAR ?auto_25684 ) ( TRUCK-AT ?auto_25698 ?auto_25699 ) ( not ( = ?auto_25683 ?auto_25684 ) ) ( not ( = ?auto_25683 ?auto_25718 ) ) ( not ( = ?auto_25684 ?auto_25718 ) ) ( not ( = ?auto_25683 ?auto_25685 ) ) ( not ( = ?auto_25683 ?auto_25704 ) ) ( not ( = ?auto_25685 ?auto_25718 ) ) ( not ( = ?auto_25713 ?auto_25724 ) ) ( not ( = ?auto_25706 ?auto_25716 ) ) ( not ( = ?auto_25704 ?auto_25718 ) ) ( not ( = ?auto_25683 ?auto_25686 ) ) ( not ( = ?auto_25683 ?auto_25709 ) ) ( not ( = ?auto_25684 ?auto_25686 ) ) ( not ( = ?auto_25684 ?auto_25709 ) ) ( not ( = ?auto_25686 ?auto_25704 ) ) ( not ( = ?auto_25686 ?auto_25718 ) ) ( not ( = ?auto_25720 ?auto_25713 ) ) ( not ( = ?auto_25720 ?auto_25724 ) ) ( not ( = ?auto_25723 ?auto_25706 ) ) ( not ( = ?auto_25723 ?auto_25716 ) ) ( not ( = ?auto_25709 ?auto_25704 ) ) ( not ( = ?auto_25709 ?auto_25718 ) ) ( not ( = ?auto_25683 ?auto_25687 ) ) ( not ( = ?auto_25683 ?auto_25701 ) ) ( not ( = ?auto_25684 ?auto_25687 ) ) ( not ( = ?auto_25684 ?auto_25701 ) ) ( not ( = ?auto_25685 ?auto_25687 ) ) ( not ( = ?auto_25685 ?auto_25701 ) ) ( not ( = ?auto_25687 ?auto_25709 ) ) ( not ( = ?auto_25687 ?auto_25704 ) ) ( not ( = ?auto_25687 ?auto_25718 ) ) ( not ( = ?auto_25701 ?auto_25709 ) ) ( not ( = ?auto_25701 ?auto_25704 ) ) ( not ( = ?auto_25701 ?auto_25718 ) ) ( not ( = ?auto_25683 ?auto_25690 ) ) ( not ( = ?auto_25683 ?auto_25711 ) ) ( not ( = ?auto_25684 ?auto_25690 ) ) ( not ( = ?auto_25684 ?auto_25711 ) ) ( not ( = ?auto_25685 ?auto_25690 ) ) ( not ( = ?auto_25685 ?auto_25711 ) ) ( not ( = ?auto_25686 ?auto_25690 ) ) ( not ( = ?auto_25686 ?auto_25711 ) ) ( not ( = ?auto_25690 ?auto_25701 ) ) ( not ( = ?auto_25690 ?auto_25709 ) ) ( not ( = ?auto_25690 ?auto_25704 ) ) ( not ( = ?auto_25690 ?auto_25718 ) ) ( not ( = ?auto_25715 ?auto_25724 ) ) ( not ( = ?auto_25715 ?auto_25720 ) ) ( not ( = ?auto_25715 ?auto_25713 ) ) ( not ( = ?auto_25705 ?auto_25716 ) ) ( not ( = ?auto_25705 ?auto_25723 ) ) ( not ( = ?auto_25705 ?auto_25706 ) ) ( not ( = ?auto_25711 ?auto_25701 ) ) ( not ( = ?auto_25711 ?auto_25709 ) ) ( not ( = ?auto_25711 ?auto_25704 ) ) ( not ( = ?auto_25711 ?auto_25718 ) ) ( not ( = ?auto_25683 ?auto_25688 ) ) ( not ( = ?auto_25683 ?auto_25712 ) ) ( not ( = ?auto_25684 ?auto_25688 ) ) ( not ( = ?auto_25684 ?auto_25712 ) ) ( not ( = ?auto_25685 ?auto_25688 ) ) ( not ( = ?auto_25685 ?auto_25712 ) ) ( not ( = ?auto_25686 ?auto_25688 ) ) ( not ( = ?auto_25686 ?auto_25712 ) ) ( not ( = ?auto_25687 ?auto_25688 ) ) ( not ( = ?auto_25687 ?auto_25712 ) ) ( not ( = ?auto_25688 ?auto_25711 ) ) ( not ( = ?auto_25688 ?auto_25701 ) ) ( not ( = ?auto_25688 ?auto_25709 ) ) ( not ( = ?auto_25688 ?auto_25704 ) ) ( not ( = ?auto_25688 ?auto_25718 ) ) ( not ( = ?auto_25721 ?auto_25715 ) ) ( not ( = ?auto_25721 ?auto_25724 ) ) ( not ( = ?auto_25721 ?auto_25720 ) ) ( not ( = ?auto_25721 ?auto_25713 ) ) ( not ( = ?auto_25708 ?auto_25705 ) ) ( not ( = ?auto_25708 ?auto_25716 ) ) ( not ( = ?auto_25708 ?auto_25723 ) ) ( not ( = ?auto_25708 ?auto_25706 ) ) ( not ( = ?auto_25712 ?auto_25711 ) ) ( not ( = ?auto_25712 ?auto_25701 ) ) ( not ( = ?auto_25712 ?auto_25709 ) ) ( not ( = ?auto_25712 ?auto_25704 ) ) ( not ( = ?auto_25712 ?auto_25718 ) ) ( not ( = ?auto_25683 ?auto_25692 ) ) ( not ( = ?auto_25683 ?auto_25707 ) ) ( not ( = ?auto_25684 ?auto_25692 ) ) ( not ( = ?auto_25684 ?auto_25707 ) ) ( not ( = ?auto_25685 ?auto_25692 ) ) ( not ( = ?auto_25685 ?auto_25707 ) ) ( not ( = ?auto_25686 ?auto_25692 ) ) ( not ( = ?auto_25686 ?auto_25707 ) ) ( not ( = ?auto_25687 ?auto_25692 ) ) ( not ( = ?auto_25687 ?auto_25707 ) ) ( not ( = ?auto_25690 ?auto_25692 ) ) ( not ( = ?auto_25690 ?auto_25707 ) ) ( not ( = ?auto_25692 ?auto_25712 ) ) ( not ( = ?auto_25692 ?auto_25711 ) ) ( not ( = ?auto_25692 ?auto_25701 ) ) ( not ( = ?auto_25692 ?auto_25709 ) ) ( not ( = ?auto_25692 ?auto_25704 ) ) ( not ( = ?auto_25692 ?auto_25718 ) ) ( not ( = ?auto_25719 ?auto_25721 ) ) ( not ( = ?auto_25719 ?auto_25715 ) ) ( not ( = ?auto_25719 ?auto_25724 ) ) ( not ( = ?auto_25719 ?auto_25720 ) ) ( not ( = ?auto_25719 ?auto_25713 ) ) ( not ( = ?auto_25702 ?auto_25708 ) ) ( not ( = ?auto_25702 ?auto_25705 ) ) ( not ( = ?auto_25702 ?auto_25716 ) ) ( not ( = ?auto_25702 ?auto_25723 ) ) ( not ( = ?auto_25702 ?auto_25706 ) ) ( not ( = ?auto_25707 ?auto_25712 ) ) ( not ( = ?auto_25707 ?auto_25711 ) ) ( not ( = ?auto_25707 ?auto_25701 ) ) ( not ( = ?auto_25707 ?auto_25709 ) ) ( not ( = ?auto_25707 ?auto_25704 ) ) ( not ( = ?auto_25707 ?auto_25718 ) ) ( not ( = ?auto_25683 ?auto_25691 ) ) ( not ( = ?auto_25683 ?auto_25722 ) ) ( not ( = ?auto_25684 ?auto_25691 ) ) ( not ( = ?auto_25684 ?auto_25722 ) ) ( not ( = ?auto_25685 ?auto_25691 ) ) ( not ( = ?auto_25685 ?auto_25722 ) ) ( not ( = ?auto_25686 ?auto_25691 ) ) ( not ( = ?auto_25686 ?auto_25722 ) ) ( not ( = ?auto_25687 ?auto_25691 ) ) ( not ( = ?auto_25687 ?auto_25722 ) ) ( not ( = ?auto_25690 ?auto_25691 ) ) ( not ( = ?auto_25690 ?auto_25722 ) ) ( not ( = ?auto_25688 ?auto_25691 ) ) ( not ( = ?auto_25688 ?auto_25722 ) ) ( not ( = ?auto_25691 ?auto_25707 ) ) ( not ( = ?auto_25691 ?auto_25712 ) ) ( not ( = ?auto_25691 ?auto_25711 ) ) ( not ( = ?auto_25691 ?auto_25701 ) ) ( not ( = ?auto_25691 ?auto_25709 ) ) ( not ( = ?auto_25691 ?auto_25704 ) ) ( not ( = ?auto_25691 ?auto_25718 ) ) ( not ( = ?auto_25700 ?auto_25719 ) ) ( not ( = ?auto_25700 ?auto_25721 ) ) ( not ( = ?auto_25700 ?auto_25715 ) ) ( not ( = ?auto_25700 ?auto_25724 ) ) ( not ( = ?auto_25700 ?auto_25720 ) ) ( not ( = ?auto_25700 ?auto_25713 ) ) ( not ( = ?auto_25714 ?auto_25702 ) ) ( not ( = ?auto_25714 ?auto_25708 ) ) ( not ( = ?auto_25714 ?auto_25705 ) ) ( not ( = ?auto_25714 ?auto_25716 ) ) ( not ( = ?auto_25714 ?auto_25723 ) ) ( not ( = ?auto_25714 ?auto_25706 ) ) ( not ( = ?auto_25722 ?auto_25707 ) ) ( not ( = ?auto_25722 ?auto_25712 ) ) ( not ( = ?auto_25722 ?auto_25711 ) ) ( not ( = ?auto_25722 ?auto_25701 ) ) ( not ( = ?auto_25722 ?auto_25709 ) ) ( not ( = ?auto_25722 ?auto_25704 ) ) ( not ( = ?auto_25722 ?auto_25718 ) ) ( not ( = ?auto_25683 ?auto_25689 ) ) ( not ( = ?auto_25683 ?auto_25717 ) ) ( not ( = ?auto_25684 ?auto_25689 ) ) ( not ( = ?auto_25684 ?auto_25717 ) ) ( not ( = ?auto_25685 ?auto_25689 ) ) ( not ( = ?auto_25685 ?auto_25717 ) ) ( not ( = ?auto_25686 ?auto_25689 ) ) ( not ( = ?auto_25686 ?auto_25717 ) ) ( not ( = ?auto_25687 ?auto_25689 ) ) ( not ( = ?auto_25687 ?auto_25717 ) ) ( not ( = ?auto_25690 ?auto_25689 ) ) ( not ( = ?auto_25690 ?auto_25717 ) ) ( not ( = ?auto_25688 ?auto_25689 ) ) ( not ( = ?auto_25688 ?auto_25717 ) ) ( not ( = ?auto_25692 ?auto_25689 ) ) ( not ( = ?auto_25692 ?auto_25717 ) ) ( not ( = ?auto_25689 ?auto_25722 ) ) ( not ( = ?auto_25689 ?auto_25707 ) ) ( not ( = ?auto_25689 ?auto_25712 ) ) ( not ( = ?auto_25689 ?auto_25711 ) ) ( not ( = ?auto_25689 ?auto_25701 ) ) ( not ( = ?auto_25689 ?auto_25709 ) ) ( not ( = ?auto_25689 ?auto_25704 ) ) ( not ( = ?auto_25689 ?auto_25718 ) ) ( not ( = ?auto_25703 ?auto_25700 ) ) ( not ( = ?auto_25703 ?auto_25719 ) ) ( not ( = ?auto_25703 ?auto_25721 ) ) ( not ( = ?auto_25703 ?auto_25715 ) ) ( not ( = ?auto_25703 ?auto_25724 ) ) ( not ( = ?auto_25703 ?auto_25720 ) ) ( not ( = ?auto_25703 ?auto_25713 ) ) ( not ( = ?auto_25710 ?auto_25714 ) ) ( not ( = ?auto_25710 ?auto_25702 ) ) ( not ( = ?auto_25710 ?auto_25708 ) ) ( not ( = ?auto_25710 ?auto_25705 ) ) ( not ( = ?auto_25710 ?auto_25716 ) ) ( not ( = ?auto_25710 ?auto_25723 ) ) ( not ( = ?auto_25710 ?auto_25706 ) ) ( not ( = ?auto_25717 ?auto_25722 ) ) ( not ( = ?auto_25717 ?auto_25707 ) ) ( not ( = ?auto_25717 ?auto_25712 ) ) ( not ( = ?auto_25717 ?auto_25711 ) ) ( not ( = ?auto_25717 ?auto_25701 ) ) ( not ( = ?auto_25717 ?auto_25709 ) ) ( not ( = ?auto_25717 ?auto_25704 ) ) ( not ( = ?auto_25717 ?auto_25718 ) ) ( not ( = ?auto_25683 ?auto_25693 ) ) ( not ( = ?auto_25683 ?auto_25697 ) ) ( not ( = ?auto_25684 ?auto_25693 ) ) ( not ( = ?auto_25684 ?auto_25697 ) ) ( not ( = ?auto_25685 ?auto_25693 ) ) ( not ( = ?auto_25685 ?auto_25697 ) ) ( not ( = ?auto_25686 ?auto_25693 ) ) ( not ( = ?auto_25686 ?auto_25697 ) ) ( not ( = ?auto_25687 ?auto_25693 ) ) ( not ( = ?auto_25687 ?auto_25697 ) ) ( not ( = ?auto_25690 ?auto_25693 ) ) ( not ( = ?auto_25690 ?auto_25697 ) ) ( not ( = ?auto_25688 ?auto_25693 ) ) ( not ( = ?auto_25688 ?auto_25697 ) ) ( not ( = ?auto_25692 ?auto_25693 ) ) ( not ( = ?auto_25692 ?auto_25697 ) ) ( not ( = ?auto_25691 ?auto_25693 ) ) ( not ( = ?auto_25691 ?auto_25697 ) ) ( not ( = ?auto_25693 ?auto_25717 ) ) ( not ( = ?auto_25693 ?auto_25722 ) ) ( not ( = ?auto_25693 ?auto_25707 ) ) ( not ( = ?auto_25693 ?auto_25712 ) ) ( not ( = ?auto_25693 ?auto_25711 ) ) ( not ( = ?auto_25693 ?auto_25701 ) ) ( not ( = ?auto_25693 ?auto_25709 ) ) ( not ( = ?auto_25693 ?auto_25704 ) ) ( not ( = ?auto_25693 ?auto_25718 ) ) ( not ( = ?auto_25695 ?auto_25703 ) ) ( not ( = ?auto_25695 ?auto_25700 ) ) ( not ( = ?auto_25695 ?auto_25719 ) ) ( not ( = ?auto_25695 ?auto_25721 ) ) ( not ( = ?auto_25695 ?auto_25715 ) ) ( not ( = ?auto_25695 ?auto_25724 ) ) ( not ( = ?auto_25695 ?auto_25720 ) ) ( not ( = ?auto_25695 ?auto_25713 ) ) ( not ( = ?auto_25696 ?auto_25710 ) ) ( not ( = ?auto_25696 ?auto_25714 ) ) ( not ( = ?auto_25696 ?auto_25702 ) ) ( not ( = ?auto_25696 ?auto_25708 ) ) ( not ( = ?auto_25696 ?auto_25705 ) ) ( not ( = ?auto_25696 ?auto_25716 ) ) ( not ( = ?auto_25696 ?auto_25723 ) ) ( not ( = ?auto_25696 ?auto_25706 ) ) ( not ( = ?auto_25697 ?auto_25717 ) ) ( not ( = ?auto_25697 ?auto_25722 ) ) ( not ( = ?auto_25697 ?auto_25707 ) ) ( not ( = ?auto_25697 ?auto_25712 ) ) ( not ( = ?auto_25697 ?auto_25711 ) ) ( not ( = ?auto_25697 ?auto_25701 ) ) ( not ( = ?auto_25697 ?auto_25709 ) ) ( not ( = ?auto_25697 ?auto_25704 ) ) ( not ( = ?auto_25697 ?auto_25718 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_25683 ?auto_25684 ?auto_25685 ?auto_25686 ?auto_25687 ?auto_25690 ?auto_25688 ?auto_25692 ?auto_25691 ?auto_25689 )
      ( MAKE-1CRATE ?auto_25689 ?auto_25693 )
      ( MAKE-10CRATE-VERIFY ?auto_25683 ?auto_25684 ?auto_25685 ?auto_25686 ?auto_25687 ?auto_25690 ?auto_25688 ?auto_25692 ?auto_25691 ?auto_25689 ?auto_25693 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25727 - SURFACE
      ?auto_25728 - SURFACE
    )
    :vars
    (
      ?auto_25729 - HOIST
      ?auto_25730 - PLACE
      ?auto_25732 - PLACE
      ?auto_25733 - HOIST
      ?auto_25734 - SURFACE
      ?auto_25731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25729 ?auto_25730 ) ( SURFACE-AT ?auto_25727 ?auto_25730 ) ( CLEAR ?auto_25727 ) ( IS-CRATE ?auto_25728 ) ( AVAILABLE ?auto_25729 ) ( not ( = ?auto_25732 ?auto_25730 ) ) ( HOIST-AT ?auto_25733 ?auto_25732 ) ( AVAILABLE ?auto_25733 ) ( SURFACE-AT ?auto_25728 ?auto_25732 ) ( ON ?auto_25728 ?auto_25734 ) ( CLEAR ?auto_25728 ) ( TRUCK-AT ?auto_25731 ?auto_25730 ) ( not ( = ?auto_25727 ?auto_25728 ) ) ( not ( = ?auto_25727 ?auto_25734 ) ) ( not ( = ?auto_25728 ?auto_25734 ) ) ( not ( = ?auto_25729 ?auto_25733 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25731 ?auto_25730 ?auto_25732 )
      ( !LIFT ?auto_25733 ?auto_25728 ?auto_25734 ?auto_25732 )
      ( !LOAD ?auto_25733 ?auto_25728 ?auto_25731 ?auto_25732 )
      ( !DRIVE ?auto_25731 ?auto_25732 ?auto_25730 )
      ( !UNLOAD ?auto_25729 ?auto_25728 ?auto_25731 ?auto_25730 )
      ( !DROP ?auto_25729 ?auto_25728 ?auto_25727 ?auto_25730 )
      ( MAKE-1CRATE-VERIFY ?auto_25727 ?auto_25728 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_25747 - SURFACE
      ?auto_25748 - SURFACE
      ?auto_25749 - SURFACE
      ?auto_25750 - SURFACE
      ?auto_25751 - SURFACE
      ?auto_25754 - SURFACE
      ?auto_25752 - SURFACE
      ?auto_25756 - SURFACE
      ?auto_25755 - SURFACE
      ?auto_25753 - SURFACE
      ?auto_25758 - SURFACE
      ?auto_25757 - SURFACE
    )
    :vars
    (
      ?auto_25763 - HOIST
      ?auto_25760 - PLACE
      ?auto_25761 - PLACE
      ?auto_25762 - HOIST
      ?auto_25759 - SURFACE
      ?auto_25776 - PLACE
      ?auto_25785 - HOIST
      ?auto_25768 - SURFACE
      ?auto_25789 - PLACE
      ?auto_25771 - HOIST
      ?auto_25765 - SURFACE
      ?auto_25787 - PLACE
      ?auto_25784 - HOIST
      ?auto_25770 - SURFACE
      ?auto_25779 - PLACE
      ?auto_25791 - HOIST
      ?auto_25769 - SURFACE
      ?auto_25780 - PLACE
      ?auto_25781 - HOIST
      ?auto_25773 - SURFACE
      ?auto_25775 - PLACE
      ?auto_25782 - HOIST
      ?auto_25792 - SURFACE
      ?auto_25786 - PLACE
      ?auto_25790 - HOIST
      ?auto_25777 - SURFACE
      ?auto_25778 - PLACE
      ?auto_25783 - HOIST
      ?auto_25772 - SURFACE
      ?auto_25767 - PLACE
      ?auto_25774 - HOIST
      ?auto_25766 - SURFACE
      ?auto_25788 - SURFACE
      ?auto_25764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25763 ?auto_25760 ) ( IS-CRATE ?auto_25757 ) ( not ( = ?auto_25761 ?auto_25760 ) ) ( HOIST-AT ?auto_25762 ?auto_25761 ) ( AVAILABLE ?auto_25762 ) ( SURFACE-AT ?auto_25757 ?auto_25761 ) ( ON ?auto_25757 ?auto_25759 ) ( CLEAR ?auto_25757 ) ( not ( = ?auto_25758 ?auto_25757 ) ) ( not ( = ?auto_25758 ?auto_25759 ) ) ( not ( = ?auto_25757 ?auto_25759 ) ) ( not ( = ?auto_25763 ?auto_25762 ) ) ( IS-CRATE ?auto_25758 ) ( not ( = ?auto_25776 ?auto_25760 ) ) ( HOIST-AT ?auto_25785 ?auto_25776 ) ( AVAILABLE ?auto_25785 ) ( SURFACE-AT ?auto_25758 ?auto_25776 ) ( ON ?auto_25758 ?auto_25768 ) ( CLEAR ?auto_25758 ) ( not ( = ?auto_25753 ?auto_25758 ) ) ( not ( = ?auto_25753 ?auto_25768 ) ) ( not ( = ?auto_25758 ?auto_25768 ) ) ( not ( = ?auto_25763 ?auto_25785 ) ) ( IS-CRATE ?auto_25753 ) ( not ( = ?auto_25789 ?auto_25760 ) ) ( HOIST-AT ?auto_25771 ?auto_25789 ) ( AVAILABLE ?auto_25771 ) ( SURFACE-AT ?auto_25753 ?auto_25789 ) ( ON ?auto_25753 ?auto_25765 ) ( CLEAR ?auto_25753 ) ( not ( = ?auto_25755 ?auto_25753 ) ) ( not ( = ?auto_25755 ?auto_25765 ) ) ( not ( = ?auto_25753 ?auto_25765 ) ) ( not ( = ?auto_25763 ?auto_25771 ) ) ( IS-CRATE ?auto_25755 ) ( not ( = ?auto_25787 ?auto_25760 ) ) ( HOIST-AT ?auto_25784 ?auto_25787 ) ( AVAILABLE ?auto_25784 ) ( SURFACE-AT ?auto_25755 ?auto_25787 ) ( ON ?auto_25755 ?auto_25770 ) ( CLEAR ?auto_25755 ) ( not ( = ?auto_25756 ?auto_25755 ) ) ( not ( = ?auto_25756 ?auto_25770 ) ) ( not ( = ?auto_25755 ?auto_25770 ) ) ( not ( = ?auto_25763 ?auto_25784 ) ) ( IS-CRATE ?auto_25756 ) ( not ( = ?auto_25779 ?auto_25760 ) ) ( HOIST-AT ?auto_25791 ?auto_25779 ) ( AVAILABLE ?auto_25791 ) ( SURFACE-AT ?auto_25756 ?auto_25779 ) ( ON ?auto_25756 ?auto_25769 ) ( CLEAR ?auto_25756 ) ( not ( = ?auto_25752 ?auto_25756 ) ) ( not ( = ?auto_25752 ?auto_25769 ) ) ( not ( = ?auto_25756 ?auto_25769 ) ) ( not ( = ?auto_25763 ?auto_25791 ) ) ( IS-CRATE ?auto_25752 ) ( not ( = ?auto_25780 ?auto_25760 ) ) ( HOIST-AT ?auto_25781 ?auto_25780 ) ( AVAILABLE ?auto_25781 ) ( SURFACE-AT ?auto_25752 ?auto_25780 ) ( ON ?auto_25752 ?auto_25773 ) ( CLEAR ?auto_25752 ) ( not ( = ?auto_25754 ?auto_25752 ) ) ( not ( = ?auto_25754 ?auto_25773 ) ) ( not ( = ?auto_25752 ?auto_25773 ) ) ( not ( = ?auto_25763 ?auto_25781 ) ) ( IS-CRATE ?auto_25754 ) ( not ( = ?auto_25775 ?auto_25760 ) ) ( HOIST-AT ?auto_25782 ?auto_25775 ) ( AVAILABLE ?auto_25782 ) ( SURFACE-AT ?auto_25754 ?auto_25775 ) ( ON ?auto_25754 ?auto_25792 ) ( CLEAR ?auto_25754 ) ( not ( = ?auto_25751 ?auto_25754 ) ) ( not ( = ?auto_25751 ?auto_25792 ) ) ( not ( = ?auto_25754 ?auto_25792 ) ) ( not ( = ?auto_25763 ?auto_25782 ) ) ( IS-CRATE ?auto_25751 ) ( not ( = ?auto_25786 ?auto_25760 ) ) ( HOIST-AT ?auto_25790 ?auto_25786 ) ( SURFACE-AT ?auto_25751 ?auto_25786 ) ( ON ?auto_25751 ?auto_25777 ) ( CLEAR ?auto_25751 ) ( not ( = ?auto_25750 ?auto_25751 ) ) ( not ( = ?auto_25750 ?auto_25777 ) ) ( not ( = ?auto_25751 ?auto_25777 ) ) ( not ( = ?auto_25763 ?auto_25790 ) ) ( IS-CRATE ?auto_25750 ) ( not ( = ?auto_25778 ?auto_25760 ) ) ( HOIST-AT ?auto_25783 ?auto_25778 ) ( AVAILABLE ?auto_25783 ) ( SURFACE-AT ?auto_25750 ?auto_25778 ) ( ON ?auto_25750 ?auto_25772 ) ( CLEAR ?auto_25750 ) ( not ( = ?auto_25749 ?auto_25750 ) ) ( not ( = ?auto_25749 ?auto_25772 ) ) ( not ( = ?auto_25750 ?auto_25772 ) ) ( not ( = ?auto_25763 ?auto_25783 ) ) ( IS-CRATE ?auto_25749 ) ( not ( = ?auto_25767 ?auto_25760 ) ) ( HOIST-AT ?auto_25774 ?auto_25767 ) ( AVAILABLE ?auto_25774 ) ( SURFACE-AT ?auto_25749 ?auto_25767 ) ( ON ?auto_25749 ?auto_25766 ) ( CLEAR ?auto_25749 ) ( not ( = ?auto_25748 ?auto_25749 ) ) ( not ( = ?auto_25748 ?auto_25766 ) ) ( not ( = ?auto_25749 ?auto_25766 ) ) ( not ( = ?auto_25763 ?auto_25774 ) ) ( SURFACE-AT ?auto_25747 ?auto_25760 ) ( CLEAR ?auto_25747 ) ( IS-CRATE ?auto_25748 ) ( AVAILABLE ?auto_25763 ) ( AVAILABLE ?auto_25790 ) ( SURFACE-AT ?auto_25748 ?auto_25786 ) ( ON ?auto_25748 ?auto_25788 ) ( CLEAR ?auto_25748 ) ( TRUCK-AT ?auto_25764 ?auto_25760 ) ( not ( = ?auto_25747 ?auto_25748 ) ) ( not ( = ?auto_25747 ?auto_25788 ) ) ( not ( = ?auto_25748 ?auto_25788 ) ) ( not ( = ?auto_25747 ?auto_25749 ) ) ( not ( = ?auto_25747 ?auto_25766 ) ) ( not ( = ?auto_25749 ?auto_25788 ) ) ( not ( = ?auto_25767 ?auto_25786 ) ) ( not ( = ?auto_25774 ?auto_25790 ) ) ( not ( = ?auto_25766 ?auto_25788 ) ) ( not ( = ?auto_25747 ?auto_25750 ) ) ( not ( = ?auto_25747 ?auto_25772 ) ) ( not ( = ?auto_25748 ?auto_25750 ) ) ( not ( = ?auto_25748 ?auto_25772 ) ) ( not ( = ?auto_25750 ?auto_25766 ) ) ( not ( = ?auto_25750 ?auto_25788 ) ) ( not ( = ?auto_25778 ?auto_25767 ) ) ( not ( = ?auto_25778 ?auto_25786 ) ) ( not ( = ?auto_25783 ?auto_25774 ) ) ( not ( = ?auto_25783 ?auto_25790 ) ) ( not ( = ?auto_25772 ?auto_25766 ) ) ( not ( = ?auto_25772 ?auto_25788 ) ) ( not ( = ?auto_25747 ?auto_25751 ) ) ( not ( = ?auto_25747 ?auto_25777 ) ) ( not ( = ?auto_25748 ?auto_25751 ) ) ( not ( = ?auto_25748 ?auto_25777 ) ) ( not ( = ?auto_25749 ?auto_25751 ) ) ( not ( = ?auto_25749 ?auto_25777 ) ) ( not ( = ?auto_25751 ?auto_25772 ) ) ( not ( = ?auto_25751 ?auto_25766 ) ) ( not ( = ?auto_25751 ?auto_25788 ) ) ( not ( = ?auto_25777 ?auto_25772 ) ) ( not ( = ?auto_25777 ?auto_25766 ) ) ( not ( = ?auto_25777 ?auto_25788 ) ) ( not ( = ?auto_25747 ?auto_25754 ) ) ( not ( = ?auto_25747 ?auto_25792 ) ) ( not ( = ?auto_25748 ?auto_25754 ) ) ( not ( = ?auto_25748 ?auto_25792 ) ) ( not ( = ?auto_25749 ?auto_25754 ) ) ( not ( = ?auto_25749 ?auto_25792 ) ) ( not ( = ?auto_25750 ?auto_25754 ) ) ( not ( = ?auto_25750 ?auto_25792 ) ) ( not ( = ?auto_25754 ?auto_25777 ) ) ( not ( = ?auto_25754 ?auto_25772 ) ) ( not ( = ?auto_25754 ?auto_25766 ) ) ( not ( = ?auto_25754 ?auto_25788 ) ) ( not ( = ?auto_25775 ?auto_25786 ) ) ( not ( = ?auto_25775 ?auto_25778 ) ) ( not ( = ?auto_25775 ?auto_25767 ) ) ( not ( = ?auto_25782 ?auto_25790 ) ) ( not ( = ?auto_25782 ?auto_25783 ) ) ( not ( = ?auto_25782 ?auto_25774 ) ) ( not ( = ?auto_25792 ?auto_25777 ) ) ( not ( = ?auto_25792 ?auto_25772 ) ) ( not ( = ?auto_25792 ?auto_25766 ) ) ( not ( = ?auto_25792 ?auto_25788 ) ) ( not ( = ?auto_25747 ?auto_25752 ) ) ( not ( = ?auto_25747 ?auto_25773 ) ) ( not ( = ?auto_25748 ?auto_25752 ) ) ( not ( = ?auto_25748 ?auto_25773 ) ) ( not ( = ?auto_25749 ?auto_25752 ) ) ( not ( = ?auto_25749 ?auto_25773 ) ) ( not ( = ?auto_25750 ?auto_25752 ) ) ( not ( = ?auto_25750 ?auto_25773 ) ) ( not ( = ?auto_25751 ?auto_25752 ) ) ( not ( = ?auto_25751 ?auto_25773 ) ) ( not ( = ?auto_25752 ?auto_25792 ) ) ( not ( = ?auto_25752 ?auto_25777 ) ) ( not ( = ?auto_25752 ?auto_25772 ) ) ( not ( = ?auto_25752 ?auto_25766 ) ) ( not ( = ?auto_25752 ?auto_25788 ) ) ( not ( = ?auto_25780 ?auto_25775 ) ) ( not ( = ?auto_25780 ?auto_25786 ) ) ( not ( = ?auto_25780 ?auto_25778 ) ) ( not ( = ?auto_25780 ?auto_25767 ) ) ( not ( = ?auto_25781 ?auto_25782 ) ) ( not ( = ?auto_25781 ?auto_25790 ) ) ( not ( = ?auto_25781 ?auto_25783 ) ) ( not ( = ?auto_25781 ?auto_25774 ) ) ( not ( = ?auto_25773 ?auto_25792 ) ) ( not ( = ?auto_25773 ?auto_25777 ) ) ( not ( = ?auto_25773 ?auto_25772 ) ) ( not ( = ?auto_25773 ?auto_25766 ) ) ( not ( = ?auto_25773 ?auto_25788 ) ) ( not ( = ?auto_25747 ?auto_25756 ) ) ( not ( = ?auto_25747 ?auto_25769 ) ) ( not ( = ?auto_25748 ?auto_25756 ) ) ( not ( = ?auto_25748 ?auto_25769 ) ) ( not ( = ?auto_25749 ?auto_25756 ) ) ( not ( = ?auto_25749 ?auto_25769 ) ) ( not ( = ?auto_25750 ?auto_25756 ) ) ( not ( = ?auto_25750 ?auto_25769 ) ) ( not ( = ?auto_25751 ?auto_25756 ) ) ( not ( = ?auto_25751 ?auto_25769 ) ) ( not ( = ?auto_25754 ?auto_25756 ) ) ( not ( = ?auto_25754 ?auto_25769 ) ) ( not ( = ?auto_25756 ?auto_25773 ) ) ( not ( = ?auto_25756 ?auto_25792 ) ) ( not ( = ?auto_25756 ?auto_25777 ) ) ( not ( = ?auto_25756 ?auto_25772 ) ) ( not ( = ?auto_25756 ?auto_25766 ) ) ( not ( = ?auto_25756 ?auto_25788 ) ) ( not ( = ?auto_25779 ?auto_25780 ) ) ( not ( = ?auto_25779 ?auto_25775 ) ) ( not ( = ?auto_25779 ?auto_25786 ) ) ( not ( = ?auto_25779 ?auto_25778 ) ) ( not ( = ?auto_25779 ?auto_25767 ) ) ( not ( = ?auto_25791 ?auto_25781 ) ) ( not ( = ?auto_25791 ?auto_25782 ) ) ( not ( = ?auto_25791 ?auto_25790 ) ) ( not ( = ?auto_25791 ?auto_25783 ) ) ( not ( = ?auto_25791 ?auto_25774 ) ) ( not ( = ?auto_25769 ?auto_25773 ) ) ( not ( = ?auto_25769 ?auto_25792 ) ) ( not ( = ?auto_25769 ?auto_25777 ) ) ( not ( = ?auto_25769 ?auto_25772 ) ) ( not ( = ?auto_25769 ?auto_25766 ) ) ( not ( = ?auto_25769 ?auto_25788 ) ) ( not ( = ?auto_25747 ?auto_25755 ) ) ( not ( = ?auto_25747 ?auto_25770 ) ) ( not ( = ?auto_25748 ?auto_25755 ) ) ( not ( = ?auto_25748 ?auto_25770 ) ) ( not ( = ?auto_25749 ?auto_25755 ) ) ( not ( = ?auto_25749 ?auto_25770 ) ) ( not ( = ?auto_25750 ?auto_25755 ) ) ( not ( = ?auto_25750 ?auto_25770 ) ) ( not ( = ?auto_25751 ?auto_25755 ) ) ( not ( = ?auto_25751 ?auto_25770 ) ) ( not ( = ?auto_25754 ?auto_25755 ) ) ( not ( = ?auto_25754 ?auto_25770 ) ) ( not ( = ?auto_25752 ?auto_25755 ) ) ( not ( = ?auto_25752 ?auto_25770 ) ) ( not ( = ?auto_25755 ?auto_25769 ) ) ( not ( = ?auto_25755 ?auto_25773 ) ) ( not ( = ?auto_25755 ?auto_25792 ) ) ( not ( = ?auto_25755 ?auto_25777 ) ) ( not ( = ?auto_25755 ?auto_25772 ) ) ( not ( = ?auto_25755 ?auto_25766 ) ) ( not ( = ?auto_25755 ?auto_25788 ) ) ( not ( = ?auto_25787 ?auto_25779 ) ) ( not ( = ?auto_25787 ?auto_25780 ) ) ( not ( = ?auto_25787 ?auto_25775 ) ) ( not ( = ?auto_25787 ?auto_25786 ) ) ( not ( = ?auto_25787 ?auto_25778 ) ) ( not ( = ?auto_25787 ?auto_25767 ) ) ( not ( = ?auto_25784 ?auto_25791 ) ) ( not ( = ?auto_25784 ?auto_25781 ) ) ( not ( = ?auto_25784 ?auto_25782 ) ) ( not ( = ?auto_25784 ?auto_25790 ) ) ( not ( = ?auto_25784 ?auto_25783 ) ) ( not ( = ?auto_25784 ?auto_25774 ) ) ( not ( = ?auto_25770 ?auto_25769 ) ) ( not ( = ?auto_25770 ?auto_25773 ) ) ( not ( = ?auto_25770 ?auto_25792 ) ) ( not ( = ?auto_25770 ?auto_25777 ) ) ( not ( = ?auto_25770 ?auto_25772 ) ) ( not ( = ?auto_25770 ?auto_25766 ) ) ( not ( = ?auto_25770 ?auto_25788 ) ) ( not ( = ?auto_25747 ?auto_25753 ) ) ( not ( = ?auto_25747 ?auto_25765 ) ) ( not ( = ?auto_25748 ?auto_25753 ) ) ( not ( = ?auto_25748 ?auto_25765 ) ) ( not ( = ?auto_25749 ?auto_25753 ) ) ( not ( = ?auto_25749 ?auto_25765 ) ) ( not ( = ?auto_25750 ?auto_25753 ) ) ( not ( = ?auto_25750 ?auto_25765 ) ) ( not ( = ?auto_25751 ?auto_25753 ) ) ( not ( = ?auto_25751 ?auto_25765 ) ) ( not ( = ?auto_25754 ?auto_25753 ) ) ( not ( = ?auto_25754 ?auto_25765 ) ) ( not ( = ?auto_25752 ?auto_25753 ) ) ( not ( = ?auto_25752 ?auto_25765 ) ) ( not ( = ?auto_25756 ?auto_25753 ) ) ( not ( = ?auto_25756 ?auto_25765 ) ) ( not ( = ?auto_25753 ?auto_25770 ) ) ( not ( = ?auto_25753 ?auto_25769 ) ) ( not ( = ?auto_25753 ?auto_25773 ) ) ( not ( = ?auto_25753 ?auto_25792 ) ) ( not ( = ?auto_25753 ?auto_25777 ) ) ( not ( = ?auto_25753 ?auto_25772 ) ) ( not ( = ?auto_25753 ?auto_25766 ) ) ( not ( = ?auto_25753 ?auto_25788 ) ) ( not ( = ?auto_25789 ?auto_25787 ) ) ( not ( = ?auto_25789 ?auto_25779 ) ) ( not ( = ?auto_25789 ?auto_25780 ) ) ( not ( = ?auto_25789 ?auto_25775 ) ) ( not ( = ?auto_25789 ?auto_25786 ) ) ( not ( = ?auto_25789 ?auto_25778 ) ) ( not ( = ?auto_25789 ?auto_25767 ) ) ( not ( = ?auto_25771 ?auto_25784 ) ) ( not ( = ?auto_25771 ?auto_25791 ) ) ( not ( = ?auto_25771 ?auto_25781 ) ) ( not ( = ?auto_25771 ?auto_25782 ) ) ( not ( = ?auto_25771 ?auto_25790 ) ) ( not ( = ?auto_25771 ?auto_25783 ) ) ( not ( = ?auto_25771 ?auto_25774 ) ) ( not ( = ?auto_25765 ?auto_25770 ) ) ( not ( = ?auto_25765 ?auto_25769 ) ) ( not ( = ?auto_25765 ?auto_25773 ) ) ( not ( = ?auto_25765 ?auto_25792 ) ) ( not ( = ?auto_25765 ?auto_25777 ) ) ( not ( = ?auto_25765 ?auto_25772 ) ) ( not ( = ?auto_25765 ?auto_25766 ) ) ( not ( = ?auto_25765 ?auto_25788 ) ) ( not ( = ?auto_25747 ?auto_25758 ) ) ( not ( = ?auto_25747 ?auto_25768 ) ) ( not ( = ?auto_25748 ?auto_25758 ) ) ( not ( = ?auto_25748 ?auto_25768 ) ) ( not ( = ?auto_25749 ?auto_25758 ) ) ( not ( = ?auto_25749 ?auto_25768 ) ) ( not ( = ?auto_25750 ?auto_25758 ) ) ( not ( = ?auto_25750 ?auto_25768 ) ) ( not ( = ?auto_25751 ?auto_25758 ) ) ( not ( = ?auto_25751 ?auto_25768 ) ) ( not ( = ?auto_25754 ?auto_25758 ) ) ( not ( = ?auto_25754 ?auto_25768 ) ) ( not ( = ?auto_25752 ?auto_25758 ) ) ( not ( = ?auto_25752 ?auto_25768 ) ) ( not ( = ?auto_25756 ?auto_25758 ) ) ( not ( = ?auto_25756 ?auto_25768 ) ) ( not ( = ?auto_25755 ?auto_25758 ) ) ( not ( = ?auto_25755 ?auto_25768 ) ) ( not ( = ?auto_25758 ?auto_25765 ) ) ( not ( = ?auto_25758 ?auto_25770 ) ) ( not ( = ?auto_25758 ?auto_25769 ) ) ( not ( = ?auto_25758 ?auto_25773 ) ) ( not ( = ?auto_25758 ?auto_25792 ) ) ( not ( = ?auto_25758 ?auto_25777 ) ) ( not ( = ?auto_25758 ?auto_25772 ) ) ( not ( = ?auto_25758 ?auto_25766 ) ) ( not ( = ?auto_25758 ?auto_25788 ) ) ( not ( = ?auto_25776 ?auto_25789 ) ) ( not ( = ?auto_25776 ?auto_25787 ) ) ( not ( = ?auto_25776 ?auto_25779 ) ) ( not ( = ?auto_25776 ?auto_25780 ) ) ( not ( = ?auto_25776 ?auto_25775 ) ) ( not ( = ?auto_25776 ?auto_25786 ) ) ( not ( = ?auto_25776 ?auto_25778 ) ) ( not ( = ?auto_25776 ?auto_25767 ) ) ( not ( = ?auto_25785 ?auto_25771 ) ) ( not ( = ?auto_25785 ?auto_25784 ) ) ( not ( = ?auto_25785 ?auto_25791 ) ) ( not ( = ?auto_25785 ?auto_25781 ) ) ( not ( = ?auto_25785 ?auto_25782 ) ) ( not ( = ?auto_25785 ?auto_25790 ) ) ( not ( = ?auto_25785 ?auto_25783 ) ) ( not ( = ?auto_25785 ?auto_25774 ) ) ( not ( = ?auto_25768 ?auto_25765 ) ) ( not ( = ?auto_25768 ?auto_25770 ) ) ( not ( = ?auto_25768 ?auto_25769 ) ) ( not ( = ?auto_25768 ?auto_25773 ) ) ( not ( = ?auto_25768 ?auto_25792 ) ) ( not ( = ?auto_25768 ?auto_25777 ) ) ( not ( = ?auto_25768 ?auto_25772 ) ) ( not ( = ?auto_25768 ?auto_25766 ) ) ( not ( = ?auto_25768 ?auto_25788 ) ) ( not ( = ?auto_25747 ?auto_25757 ) ) ( not ( = ?auto_25747 ?auto_25759 ) ) ( not ( = ?auto_25748 ?auto_25757 ) ) ( not ( = ?auto_25748 ?auto_25759 ) ) ( not ( = ?auto_25749 ?auto_25757 ) ) ( not ( = ?auto_25749 ?auto_25759 ) ) ( not ( = ?auto_25750 ?auto_25757 ) ) ( not ( = ?auto_25750 ?auto_25759 ) ) ( not ( = ?auto_25751 ?auto_25757 ) ) ( not ( = ?auto_25751 ?auto_25759 ) ) ( not ( = ?auto_25754 ?auto_25757 ) ) ( not ( = ?auto_25754 ?auto_25759 ) ) ( not ( = ?auto_25752 ?auto_25757 ) ) ( not ( = ?auto_25752 ?auto_25759 ) ) ( not ( = ?auto_25756 ?auto_25757 ) ) ( not ( = ?auto_25756 ?auto_25759 ) ) ( not ( = ?auto_25755 ?auto_25757 ) ) ( not ( = ?auto_25755 ?auto_25759 ) ) ( not ( = ?auto_25753 ?auto_25757 ) ) ( not ( = ?auto_25753 ?auto_25759 ) ) ( not ( = ?auto_25757 ?auto_25768 ) ) ( not ( = ?auto_25757 ?auto_25765 ) ) ( not ( = ?auto_25757 ?auto_25770 ) ) ( not ( = ?auto_25757 ?auto_25769 ) ) ( not ( = ?auto_25757 ?auto_25773 ) ) ( not ( = ?auto_25757 ?auto_25792 ) ) ( not ( = ?auto_25757 ?auto_25777 ) ) ( not ( = ?auto_25757 ?auto_25772 ) ) ( not ( = ?auto_25757 ?auto_25766 ) ) ( not ( = ?auto_25757 ?auto_25788 ) ) ( not ( = ?auto_25761 ?auto_25776 ) ) ( not ( = ?auto_25761 ?auto_25789 ) ) ( not ( = ?auto_25761 ?auto_25787 ) ) ( not ( = ?auto_25761 ?auto_25779 ) ) ( not ( = ?auto_25761 ?auto_25780 ) ) ( not ( = ?auto_25761 ?auto_25775 ) ) ( not ( = ?auto_25761 ?auto_25786 ) ) ( not ( = ?auto_25761 ?auto_25778 ) ) ( not ( = ?auto_25761 ?auto_25767 ) ) ( not ( = ?auto_25762 ?auto_25785 ) ) ( not ( = ?auto_25762 ?auto_25771 ) ) ( not ( = ?auto_25762 ?auto_25784 ) ) ( not ( = ?auto_25762 ?auto_25791 ) ) ( not ( = ?auto_25762 ?auto_25781 ) ) ( not ( = ?auto_25762 ?auto_25782 ) ) ( not ( = ?auto_25762 ?auto_25790 ) ) ( not ( = ?auto_25762 ?auto_25783 ) ) ( not ( = ?auto_25762 ?auto_25774 ) ) ( not ( = ?auto_25759 ?auto_25768 ) ) ( not ( = ?auto_25759 ?auto_25765 ) ) ( not ( = ?auto_25759 ?auto_25770 ) ) ( not ( = ?auto_25759 ?auto_25769 ) ) ( not ( = ?auto_25759 ?auto_25773 ) ) ( not ( = ?auto_25759 ?auto_25792 ) ) ( not ( = ?auto_25759 ?auto_25777 ) ) ( not ( = ?auto_25759 ?auto_25772 ) ) ( not ( = ?auto_25759 ?auto_25766 ) ) ( not ( = ?auto_25759 ?auto_25788 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_25747 ?auto_25748 ?auto_25749 ?auto_25750 ?auto_25751 ?auto_25754 ?auto_25752 ?auto_25756 ?auto_25755 ?auto_25753 ?auto_25758 )
      ( MAKE-1CRATE ?auto_25758 ?auto_25757 )
      ( MAKE-11CRATE-VERIFY ?auto_25747 ?auto_25748 ?auto_25749 ?auto_25750 ?auto_25751 ?auto_25754 ?auto_25752 ?auto_25756 ?auto_25755 ?auto_25753 ?auto_25758 ?auto_25757 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25795 - SURFACE
      ?auto_25796 - SURFACE
    )
    :vars
    (
      ?auto_25797 - HOIST
      ?auto_25798 - PLACE
      ?auto_25800 - PLACE
      ?auto_25801 - HOIST
      ?auto_25802 - SURFACE
      ?auto_25799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25797 ?auto_25798 ) ( SURFACE-AT ?auto_25795 ?auto_25798 ) ( CLEAR ?auto_25795 ) ( IS-CRATE ?auto_25796 ) ( AVAILABLE ?auto_25797 ) ( not ( = ?auto_25800 ?auto_25798 ) ) ( HOIST-AT ?auto_25801 ?auto_25800 ) ( AVAILABLE ?auto_25801 ) ( SURFACE-AT ?auto_25796 ?auto_25800 ) ( ON ?auto_25796 ?auto_25802 ) ( CLEAR ?auto_25796 ) ( TRUCK-AT ?auto_25799 ?auto_25798 ) ( not ( = ?auto_25795 ?auto_25796 ) ) ( not ( = ?auto_25795 ?auto_25802 ) ) ( not ( = ?auto_25796 ?auto_25802 ) ) ( not ( = ?auto_25797 ?auto_25801 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25799 ?auto_25798 ?auto_25800 )
      ( !LIFT ?auto_25801 ?auto_25796 ?auto_25802 ?auto_25800 )
      ( !LOAD ?auto_25801 ?auto_25796 ?auto_25799 ?auto_25800 )
      ( !DRIVE ?auto_25799 ?auto_25800 ?auto_25798 )
      ( !UNLOAD ?auto_25797 ?auto_25796 ?auto_25799 ?auto_25798 )
      ( !DROP ?auto_25797 ?auto_25796 ?auto_25795 ?auto_25798 )
      ( MAKE-1CRATE-VERIFY ?auto_25795 ?auto_25796 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_25816 - SURFACE
      ?auto_25817 - SURFACE
      ?auto_25818 - SURFACE
      ?auto_25819 - SURFACE
      ?auto_25820 - SURFACE
      ?auto_25823 - SURFACE
      ?auto_25821 - SURFACE
      ?auto_25825 - SURFACE
      ?auto_25824 - SURFACE
      ?auto_25822 - SURFACE
      ?auto_25827 - SURFACE
      ?auto_25826 - SURFACE
      ?auto_25828 - SURFACE
    )
    :vars
    (
      ?auto_25834 - HOIST
      ?auto_25832 - PLACE
      ?auto_25831 - PLACE
      ?auto_25829 - HOIST
      ?auto_25833 - SURFACE
      ?auto_25853 - PLACE
      ?auto_25860 - HOIST
      ?auto_25842 - SURFACE
      ?auto_25848 - SURFACE
      ?auto_25837 - PLACE
      ?auto_25839 - HOIST
      ?auto_25856 - SURFACE
      ?auto_25862 - PLACE
      ?auto_25840 - HOIST
      ?auto_25852 - SURFACE
      ?auto_25846 - PLACE
      ?auto_25851 - HOIST
      ?auto_25857 - SURFACE
      ?auto_25861 - PLACE
      ?auto_25838 - HOIST
      ?auto_25850 - SURFACE
      ?auto_25835 - PLACE
      ?auto_25843 - HOIST
      ?auto_25863 - SURFACE
      ?auto_25859 - PLACE
      ?auto_25844 - HOIST
      ?auto_25858 - SURFACE
      ?auto_25849 - PLACE
      ?auto_25847 - HOIST
      ?auto_25845 - SURFACE
      ?auto_25836 - PLACE
      ?auto_25854 - HOIST
      ?auto_25841 - SURFACE
      ?auto_25855 - SURFACE
      ?auto_25830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25834 ?auto_25832 ) ( IS-CRATE ?auto_25828 ) ( not ( = ?auto_25831 ?auto_25832 ) ) ( HOIST-AT ?auto_25829 ?auto_25831 ) ( SURFACE-AT ?auto_25828 ?auto_25831 ) ( ON ?auto_25828 ?auto_25833 ) ( CLEAR ?auto_25828 ) ( not ( = ?auto_25826 ?auto_25828 ) ) ( not ( = ?auto_25826 ?auto_25833 ) ) ( not ( = ?auto_25828 ?auto_25833 ) ) ( not ( = ?auto_25834 ?auto_25829 ) ) ( IS-CRATE ?auto_25826 ) ( not ( = ?auto_25853 ?auto_25832 ) ) ( HOIST-AT ?auto_25860 ?auto_25853 ) ( AVAILABLE ?auto_25860 ) ( SURFACE-AT ?auto_25826 ?auto_25853 ) ( ON ?auto_25826 ?auto_25842 ) ( CLEAR ?auto_25826 ) ( not ( = ?auto_25827 ?auto_25826 ) ) ( not ( = ?auto_25827 ?auto_25842 ) ) ( not ( = ?auto_25826 ?auto_25842 ) ) ( not ( = ?auto_25834 ?auto_25860 ) ) ( IS-CRATE ?auto_25827 ) ( AVAILABLE ?auto_25829 ) ( SURFACE-AT ?auto_25827 ?auto_25831 ) ( ON ?auto_25827 ?auto_25848 ) ( CLEAR ?auto_25827 ) ( not ( = ?auto_25822 ?auto_25827 ) ) ( not ( = ?auto_25822 ?auto_25848 ) ) ( not ( = ?auto_25827 ?auto_25848 ) ) ( IS-CRATE ?auto_25822 ) ( not ( = ?auto_25837 ?auto_25832 ) ) ( HOIST-AT ?auto_25839 ?auto_25837 ) ( AVAILABLE ?auto_25839 ) ( SURFACE-AT ?auto_25822 ?auto_25837 ) ( ON ?auto_25822 ?auto_25856 ) ( CLEAR ?auto_25822 ) ( not ( = ?auto_25824 ?auto_25822 ) ) ( not ( = ?auto_25824 ?auto_25856 ) ) ( not ( = ?auto_25822 ?auto_25856 ) ) ( not ( = ?auto_25834 ?auto_25839 ) ) ( IS-CRATE ?auto_25824 ) ( not ( = ?auto_25862 ?auto_25832 ) ) ( HOIST-AT ?auto_25840 ?auto_25862 ) ( AVAILABLE ?auto_25840 ) ( SURFACE-AT ?auto_25824 ?auto_25862 ) ( ON ?auto_25824 ?auto_25852 ) ( CLEAR ?auto_25824 ) ( not ( = ?auto_25825 ?auto_25824 ) ) ( not ( = ?auto_25825 ?auto_25852 ) ) ( not ( = ?auto_25824 ?auto_25852 ) ) ( not ( = ?auto_25834 ?auto_25840 ) ) ( IS-CRATE ?auto_25825 ) ( not ( = ?auto_25846 ?auto_25832 ) ) ( HOIST-AT ?auto_25851 ?auto_25846 ) ( AVAILABLE ?auto_25851 ) ( SURFACE-AT ?auto_25825 ?auto_25846 ) ( ON ?auto_25825 ?auto_25857 ) ( CLEAR ?auto_25825 ) ( not ( = ?auto_25821 ?auto_25825 ) ) ( not ( = ?auto_25821 ?auto_25857 ) ) ( not ( = ?auto_25825 ?auto_25857 ) ) ( not ( = ?auto_25834 ?auto_25851 ) ) ( IS-CRATE ?auto_25821 ) ( not ( = ?auto_25861 ?auto_25832 ) ) ( HOIST-AT ?auto_25838 ?auto_25861 ) ( AVAILABLE ?auto_25838 ) ( SURFACE-AT ?auto_25821 ?auto_25861 ) ( ON ?auto_25821 ?auto_25850 ) ( CLEAR ?auto_25821 ) ( not ( = ?auto_25823 ?auto_25821 ) ) ( not ( = ?auto_25823 ?auto_25850 ) ) ( not ( = ?auto_25821 ?auto_25850 ) ) ( not ( = ?auto_25834 ?auto_25838 ) ) ( IS-CRATE ?auto_25823 ) ( not ( = ?auto_25835 ?auto_25832 ) ) ( HOIST-AT ?auto_25843 ?auto_25835 ) ( AVAILABLE ?auto_25843 ) ( SURFACE-AT ?auto_25823 ?auto_25835 ) ( ON ?auto_25823 ?auto_25863 ) ( CLEAR ?auto_25823 ) ( not ( = ?auto_25820 ?auto_25823 ) ) ( not ( = ?auto_25820 ?auto_25863 ) ) ( not ( = ?auto_25823 ?auto_25863 ) ) ( not ( = ?auto_25834 ?auto_25843 ) ) ( IS-CRATE ?auto_25820 ) ( not ( = ?auto_25859 ?auto_25832 ) ) ( HOIST-AT ?auto_25844 ?auto_25859 ) ( SURFACE-AT ?auto_25820 ?auto_25859 ) ( ON ?auto_25820 ?auto_25858 ) ( CLEAR ?auto_25820 ) ( not ( = ?auto_25819 ?auto_25820 ) ) ( not ( = ?auto_25819 ?auto_25858 ) ) ( not ( = ?auto_25820 ?auto_25858 ) ) ( not ( = ?auto_25834 ?auto_25844 ) ) ( IS-CRATE ?auto_25819 ) ( not ( = ?auto_25849 ?auto_25832 ) ) ( HOIST-AT ?auto_25847 ?auto_25849 ) ( AVAILABLE ?auto_25847 ) ( SURFACE-AT ?auto_25819 ?auto_25849 ) ( ON ?auto_25819 ?auto_25845 ) ( CLEAR ?auto_25819 ) ( not ( = ?auto_25818 ?auto_25819 ) ) ( not ( = ?auto_25818 ?auto_25845 ) ) ( not ( = ?auto_25819 ?auto_25845 ) ) ( not ( = ?auto_25834 ?auto_25847 ) ) ( IS-CRATE ?auto_25818 ) ( not ( = ?auto_25836 ?auto_25832 ) ) ( HOIST-AT ?auto_25854 ?auto_25836 ) ( AVAILABLE ?auto_25854 ) ( SURFACE-AT ?auto_25818 ?auto_25836 ) ( ON ?auto_25818 ?auto_25841 ) ( CLEAR ?auto_25818 ) ( not ( = ?auto_25817 ?auto_25818 ) ) ( not ( = ?auto_25817 ?auto_25841 ) ) ( not ( = ?auto_25818 ?auto_25841 ) ) ( not ( = ?auto_25834 ?auto_25854 ) ) ( SURFACE-AT ?auto_25816 ?auto_25832 ) ( CLEAR ?auto_25816 ) ( IS-CRATE ?auto_25817 ) ( AVAILABLE ?auto_25834 ) ( AVAILABLE ?auto_25844 ) ( SURFACE-AT ?auto_25817 ?auto_25859 ) ( ON ?auto_25817 ?auto_25855 ) ( CLEAR ?auto_25817 ) ( TRUCK-AT ?auto_25830 ?auto_25832 ) ( not ( = ?auto_25816 ?auto_25817 ) ) ( not ( = ?auto_25816 ?auto_25855 ) ) ( not ( = ?auto_25817 ?auto_25855 ) ) ( not ( = ?auto_25816 ?auto_25818 ) ) ( not ( = ?auto_25816 ?auto_25841 ) ) ( not ( = ?auto_25818 ?auto_25855 ) ) ( not ( = ?auto_25836 ?auto_25859 ) ) ( not ( = ?auto_25854 ?auto_25844 ) ) ( not ( = ?auto_25841 ?auto_25855 ) ) ( not ( = ?auto_25816 ?auto_25819 ) ) ( not ( = ?auto_25816 ?auto_25845 ) ) ( not ( = ?auto_25817 ?auto_25819 ) ) ( not ( = ?auto_25817 ?auto_25845 ) ) ( not ( = ?auto_25819 ?auto_25841 ) ) ( not ( = ?auto_25819 ?auto_25855 ) ) ( not ( = ?auto_25849 ?auto_25836 ) ) ( not ( = ?auto_25849 ?auto_25859 ) ) ( not ( = ?auto_25847 ?auto_25854 ) ) ( not ( = ?auto_25847 ?auto_25844 ) ) ( not ( = ?auto_25845 ?auto_25841 ) ) ( not ( = ?auto_25845 ?auto_25855 ) ) ( not ( = ?auto_25816 ?auto_25820 ) ) ( not ( = ?auto_25816 ?auto_25858 ) ) ( not ( = ?auto_25817 ?auto_25820 ) ) ( not ( = ?auto_25817 ?auto_25858 ) ) ( not ( = ?auto_25818 ?auto_25820 ) ) ( not ( = ?auto_25818 ?auto_25858 ) ) ( not ( = ?auto_25820 ?auto_25845 ) ) ( not ( = ?auto_25820 ?auto_25841 ) ) ( not ( = ?auto_25820 ?auto_25855 ) ) ( not ( = ?auto_25858 ?auto_25845 ) ) ( not ( = ?auto_25858 ?auto_25841 ) ) ( not ( = ?auto_25858 ?auto_25855 ) ) ( not ( = ?auto_25816 ?auto_25823 ) ) ( not ( = ?auto_25816 ?auto_25863 ) ) ( not ( = ?auto_25817 ?auto_25823 ) ) ( not ( = ?auto_25817 ?auto_25863 ) ) ( not ( = ?auto_25818 ?auto_25823 ) ) ( not ( = ?auto_25818 ?auto_25863 ) ) ( not ( = ?auto_25819 ?auto_25823 ) ) ( not ( = ?auto_25819 ?auto_25863 ) ) ( not ( = ?auto_25823 ?auto_25858 ) ) ( not ( = ?auto_25823 ?auto_25845 ) ) ( not ( = ?auto_25823 ?auto_25841 ) ) ( not ( = ?auto_25823 ?auto_25855 ) ) ( not ( = ?auto_25835 ?auto_25859 ) ) ( not ( = ?auto_25835 ?auto_25849 ) ) ( not ( = ?auto_25835 ?auto_25836 ) ) ( not ( = ?auto_25843 ?auto_25844 ) ) ( not ( = ?auto_25843 ?auto_25847 ) ) ( not ( = ?auto_25843 ?auto_25854 ) ) ( not ( = ?auto_25863 ?auto_25858 ) ) ( not ( = ?auto_25863 ?auto_25845 ) ) ( not ( = ?auto_25863 ?auto_25841 ) ) ( not ( = ?auto_25863 ?auto_25855 ) ) ( not ( = ?auto_25816 ?auto_25821 ) ) ( not ( = ?auto_25816 ?auto_25850 ) ) ( not ( = ?auto_25817 ?auto_25821 ) ) ( not ( = ?auto_25817 ?auto_25850 ) ) ( not ( = ?auto_25818 ?auto_25821 ) ) ( not ( = ?auto_25818 ?auto_25850 ) ) ( not ( = ?auto_25819 ?auto_25821 ) ) ( not ( = ?auto_25819 ?auto_25850 ) ) ( not ( = ?auto_25820 ?auto_25821 ) ) ( not ( = ?auto_25820 ?auto_25850 ) ) ( not ( = ?auto_25821 ?auto_25863 ) ) ( not ( = ?auto_25821 ?auto_25858 ) ) ( not ( = ?auto_25821 ?auto_25845 ) ) ( not ( = ?auto_25821 ?auto_25841 ) ) ( not ( = ?auto_25821 ?auto_25855 ) ) ( not ( = ?auto_25861 ?auto_25835 ) ) ( not ( = ?auto_25861 ?auto_25859 ) ) ( not ( = ?auto_25861 ?auto_25849 ) ) ( not ( = ?auto_25861 ?auto_25836 ) ) ( not ( = ?auto_25838 ?auto_25843 ) ) ( not ( = ?auto_25838 ?auto_25844 ) ) ( not ( = ?auto_25838 ?auto_25847 ) ) ( not ( = ?auto_25838 ?auto_25854 ) ) ( not ( = ?auto_25850 ?auto_25863 ) ) ( not ( = ?auto_25850 ?auto_25858 ) ) ( not ( = ?auto_25850 ?auto_25845 ) ) ( not ( = ?auto_25850 ?auto_25841 ) ) ( not ( = ?auto_25850 ?auto_25855 ) ) ( not ( = ?auto_25816 ?auto_25825 ) ) ( not ( = ?auto_25816 ?auto_25857 ) ) ( not ( = ?auto_25817 ?auto_25825 ) ) ( not ( = ?auto_25817 ?auto_25857 ) ) ( not ( = ?auto_25818 ?auto_25825 ) ) ( not ( = ?auto_25818 ?auto_25857 ) ) ( not ( = ?auto_25819 ?auto_25825 ) ) ( not ( = ?auto_25819 ?auto_25857 ) ) ( not ( = ?auto_25820 ?auto_25825 ) ) ( not ( = ?auto_25820 ?auto_25857 ) ) ( not ( = ?auto_25823 ?auto_25825 ) ) ( not ( = ?auto_25823 ?auto_25857 ) ) ( not ( = ?auto_25825 ?auto_25850 ) ) ( not ( = ?auto_25825 ?auto_25863 ) ) ( not ( = ?auto_25825 ?auto_25858 ) ) ( not ( = ?auto_25825 ?auto_25845 ) ) ( not ( = ?auto_25825 ?auto_25841 ) ) ( not ( = ?auto_25825 ?auto_25855 ) ) ( not ( = ?auto_25846 ?auto_25861 ) ) ( not ( = ?auto_25846 ?auto_25835 ) ) ( not ( = ?auto_25846 ?auto_25859 ) ) ( not ( = ?auto_25846 ?auto_25849 ) ) ( not ( = ?auto_25846 ?auto_25836 ) ) ( not ( = ?auto_25851 ?auto_25838 ) ) ( not ( = ?auto_25851 ?auto_25843 ) ) ( not ( = ?auto_25851 ?auto_25844 ) ) ( not ( = ?auto_25851 ?auto_25847 ) ) ( not ( = ?auto_25851 ?auto_25854 ) ) ( not ( = ?auto_25857 ?auto_25850 ) ) ( not ( = ?auto_25857 ?auto_25863 ) ) ( not ( = ?auto_25857 ?auto_25858 ) ) ( not ( = ?auto_25857 ?auto_25845 ) ) ( not ( = ?auto_25857 ?auto_25841 ) ) ( not ( = ?auto_25857 ?auto_25855 ) ) ( not ( = ?auto_25816 ?auto_25824 ) ) ( not ( = ?auto_25816 ?auto_25852 ) ) ( not ( = ?auto_25817 ?auto_25824 ) ) ( not ( = ?auto_25817 ?auto_25852 ) ) ( not ( = ?auto_25818 ?auto_25824 ) ) ( not ( = ?auto_25818 ?auto_25852 ) ) ( not ( = ?auto_25819 ?auto_25824 ) ) ( not ( = ?auto_25819 ?auto_25852 ) ) ( not ( = ?auto_25820 ?auto_25824 ) ) ( not ( = ?auto_25820 ?auto_25852 ) ) ( not ( = ?auto_25823 ?auto_25824 ) ) ( not ( = ?auto_25823 ?auto_25852 ) ) ( not ( = ?auto_25821 ?auto_25824 ) ) ( not ( = ?auto_25821 ?auto_25852 ) ) ( not ( = ?auto_25824 ?auto_25857 ) ) ( not ( = ?auto_25824 ?auto_25850 ) ) ( not ( = ?auto_25824 ?auto_25863 ) ) ( not ( = ?auto_25824 ?auto_25858 ) ) ( not ( = ?auto_25824 ?auto_25845 ) ) ( not ( = ?auto_25824 ?auto_25841 ) ) ( not ( = ?auto_25824 ?auto_25855 ) ) ( not ( = ?auto_25862 ?auto_25846 ) ) ( not ( = ?auto_25862 ?auto_25861 ) ) ( not ( = ?auto_25862 ?auto_25835 ) ) ( not ( = ?auto_25862 ?auto_25859 ) ) ( not ( = ?auto_25862 ?auto_25849 ) ) ( not ( = ?auto_25862 ?auto_25836 ) ) ( not ( = ?auto_25840 ?auto_25851 ) ) ( not ( = ?auto_25840 ?auto_25838 ) ) ( not ( = ?auto_25840 ?auto_25843 ) ) ( not ( = ?auto_25840 ?auto_25844 ) ) ( not ( = ?auto_25840 ?auto_25847 ) ) ( not ( = ?auto_25840 ?auto_25854 ) ) ( not ( = ?auto_25852 ?auto_25857 ) ) ( not ( = ?auto_25852 ?auto_25850 ) ) ( not ( = ?auto_25852 ?auto_25863 ) ) ( not ( = ?auto_25852 ?auto_25858 ) ) ( not ( = ?auto_25852 ?auto_25845 ) ) ( not ( = ?auto_25852 ?auto_25841 ) ) ( not ( = ?auto_25852 ?auto_25855 ) ) ( not ( = ?auto_25816 ?auto_25822 ) ) ( not ( = ?auto_25816 ?auto_25856 ) ) ( not ( = ?auto_25817 ?auto_25822 ) ) ( not ( = ?auto_25817 ?auto_25856 ) ) ( not ( = ?auto_25818 ?auto_25822 ) ) ( not ( = ?auto_25818 ?auto_25856 ) ) ( not ( = ?auto_25819 ?auto_25822 ) ) ( not ( = ?auto_25819 ?auto_25856 ) ) ( not ( = ?auto_25820 ?auto_25822 ) ) ( not ( = ?auto_25820 ?auto_25856 ) ) ( not ( = ?auto_25823 ?auto_25822 ) ) ( not ( = ?auto_25823 ?auto_25856 ) ) ( not ( = ?auto_25821 ?auto_25822 ) ) ( not ( = ?auto_25821 ?auto_25856 ) ) ( not ( = ?auto_25825 ?auto_25822 ) ) ( not ( = ?auto_25825 ?auto_25856 ) ) ( not ( = ?auto_25822 ?auto_25852 ) ) ( not ( = ?auto_25822 ?auto_25857 ) ) ( not ( = ?auto_25822 ?auto_25850 ) ) ( not ( = ?auto_25822 ?auto_25863 ) ) ( not ( = ?auto_25822 ?auto_25858 ) ) ( not ( = ?auto_25822 ?auto_25845 ) ) ( not ( = ?auto_25822 ?auto_25841 ) ) ( not ( = ?auto_25822 ?auto_25855 ) ) ( not ( = ?auto_25837 ?auto_25862 ) ) ( not ( = ?auto_25837 ?auto_25846 ) ) ( not ( = ?auto_25837 ?auto_25861 ) ) ( not ( = ?auto_25837 ?auto_25835 ) ) ( not ( = ?auto_25837 ?auto_25859 ) ) ( not ( = ?auto_25837 ?auto_25849 ) ) ( not ( = ?auto_25837 ?auto_25836 ) ) ( not ( = ?auto_25839 ?auto_25840 ) ) ( not ( = ?auto_25839 ?auto_25851 ) ) ( not ( = ?auto_25839 ?auto_25838 ) ) ( not ( = ?auto_25839 ?auto_25843 ) ) ( not ( = ?auto_25839 ?auto_25844 ) ) ( not ( = ?auto_25839 ?auto_25847 ) ) ( not ( = ?auto_25839 ?auto_25854 ) ) ( not ( = ?auto_25856 ?auto_25852 ) ) ( not ( = ?auto_25856 ?auto_25857 ) ) ( not ( = ?auto_25856 ?auto_25850 ) ) ( not ( = ?auto_25856 ?auto_25863 ) ) ( not ( = ?auto_25856 ?auto_25858 ) ) ( not ( = ?auto_25856 ?auto_25845 ) ) ( not ( = ?auto_25856 ?auto_25841 ) ) ( not ( = ?auto_25856 ?auto_25855 ) ) ( not ( = ?auto_25816 ?auto_25827 ) ) ( not ( = ?auto_25816 ?auto_25848 ) ) ( not ( = ?auto_25817 ?auto_25827 ) ) ( not ( = ?auto_25817 ?auto_25848 ) ) ( not ( = ?auto_25818 ?auto_25827 ) ) ( not ( = ?auto_25818 ?auto_25848 ) ) ( not ( = ?auto_25819 ?auto_25827 ) ) ( not ( = ?auto_25819 ?auto_25848 ) ) ( not ( = ?auto_25820 ?auto_25827 ) ) ( not ( = ?auto_25820 ?auto_25848 ) ) ( not ( = ?auto_25823 ?auto_25827 ) ) ( not ( = ?auto_25823 ?auto_25848 ) ) ( not ( = ?auto_25821 ?auto_25827 ) ) ( not ( = ?auto_25821 ?auto_25848 ) ) ( not ( = ?auto_25825 ?auto_25827 ) ) ( not ( = ?auto_25825 ?auto_25848 ) ) ( not ( = ?auto_25824 ?auto_25827 ) ) ( not ( = ?auto_25824 ?auto_25848 ) ) ( not ( = ?auto_25827 ?auto_25856 ) ) ( not ( = ?auto_25827 ?auto_25852 ) ) ( not ( = ?auto_25827 ?auto_25857 ) ) ( not ( = ?auto_25827 ?auto_25850 ) ) ( not ( = ?auto_25827 ?auto_25863 ) ) ( not ( = ?auto_25827 ?auto_25858 ) ) ( not ( = ?auto_25827 ?auto_25845 ) ) ( not ( = ?auto_25827 ?auto_25841 ) ) ( not ( = ?auto_25827 ?auto_25855 ) ) ( not ( = ?auto_25831 ?auto_25837 ) ) ( not ( = ?auto_25831 ?auto_25862 ) ) ( not ( = ?auto_25831 ?auto_25846 ) ) ( not ( = ?auto_25831 ?auto_25861 ) ) ( not ( = ?auto_25831 ?auto_25835 ) ) ( not ( = ?auto_25831 ?auto_25859 ) ) ( not ( = ?auto_25831 ?auto_25849 ) ) ( not ( = ?auto_25831 ?auto_25836 ) ) ( not ( = ?auto_25829 ?auto_25839 ) ) ( not ( = ?auto_25829 ?auto_25840 ) ) ( not ( = ?auto_25829 ?auto_25851 ) ) ( not ( = ?auto_25829 ?auto_25838 ) ) ( not ( = ?auto_25829 ?auto_25843 ) ) ( not ( = ?auto_25829 ?auto_25844 ) ) ( not ( = ?auto_25829 ?auto_25847 ) ) ( not ( = ?auto_25829 ?auto_25854 ) ) ( not ( = ?auto_25848 ?auto_25856 ) ) ( not ( = ?auto_25848 ?auto_25852 ) ) ( not ( = ?auto_25848 ?auto_25857 ) ) ( not ( = ?auto_25848 ?auto_25850 ) ) ( not ( = ?auto_25848 ?auto_25863 ) ) ( not ( = ?auto_25848 ?auto_25858 ) ) ( not ( = ?auto_25848 ?auto_25845 ) ) ( not ( = ?auto_25848 ?auto_25841 ) ) ( not ( = ?auto_25848 ?auto_25855 ) ) ( not ( = ?auto_25816 ?auto_25826 ) ) ( not ( = ?auto_25816 ?auto_25842 ) ) ( not ( = ?auto_25817 ?auto_25826 ) ) ( not ( = ?auto_25817 ?auto_25842 ) ) ( not ( = ?auto_25818 ?auto_25826 ) ) ( not ( = ?auto_25818 ?auto_25842 ) ) ( not ( = ?auto_25819 ?auto_25826 ) ) ( not ( = ?auto_25819 ?auto_25842 ) ) ( not ( = ?auto_25820 ?auto_25826 ) ) ( not ( = ?auto_25820 ?auto_25842 ) ) ( not ( = ?auto_25823 ?auto_25826 ) ) ( not ( = ?auto_25823 ?auto_25842 ) ) ( not ( = ?auto_25821 ?auto_25826 ) ) ( not ( = ?auto_25821 ?auto_25842 ) ) ( not ( = ?auto_25825 ?auto_25826 ) ) ( not ( = ?auto_25825 ?auto_25842 ) ) ( not ( = ?auto_25824 ?auto_25826 ) ) ( not ( = ?auto_25824 ?auto_25842 ) ) ( not ( = ?auto_25822 ?auto_25826 ) ) ( not ( = ?auto_25822 ?auto_25842 ) ) ( not ( = ?auto_25826 ?auto_25848 ) ) ( not ( = ?auto_25826 ?auto_25856 ) ) ( not ( = ?auto_25826 ?auto_25852 ) ) ( not ( = ?auto_25826 ?auto_25857 ) ) ( not ( = ?auto_25826 ?auto_25850 ) ) ( not ( = ?auto_25826 ?auto_25863 ) ) ( not ( = ?auto_25826 ?auto_25858 ) ) ( not ( = ?auto_25826 ?auto_25845 ) ) ( not ( = ?auto_25826 ?auto_25841 ) ) ( not ( = ?auto_25826 ?auto_25855 ) ) ( not ( = ?auto_25853 ?auto_25831 ) ) ( not ( = ?auto_25853 ?auto_25837 ) ) ( not ( = ?auto_25853 ?auto_25862 ) ) ( not ( = ?auto_25853 ?auto_25846 ) ) ( not ( = ?auto_25853 ?auto_25861 ) ) ( not ( = ?auto_25853 ?auto_25835 ) ) ( not ( = ?auto_25853 ?auto_25859 ) ) ( not ( = ?auto_25853 ?auto_25849 ) ) ( not ( = ?auto_25853 ?auto_25836 ) ) ( not ( = ?auto_25860 ?auto_25829 ) ) ( not ( = ?auto_25860 ?auto_25839 ) ) ( not ( = ?auto_25860 ?auto_25840 ) ) ( not ( = ?auto_25860 ?auto_25851 ) ) ( not ( = ?auto_25860 ?auto_25838 ) ) ( not ( = ?auto_25860 ?auto_25843 ) ) ( not ( = ?auto_25860 ?auto_25844 ) ) ( not ( = ?auto_25860 ?auto_25847 ) ) ( not ( = ?auto_25860 ?auto_25854 ) ) ( not ( = ?auto_25842 ?auto_25848 ) ) ( not ( = ?auto_25842 ?auto_25856 ) ) ( not ( = ?auto_25842 ?auto_25852 ) ) ( not ( = ?auto_25842 ?auto_25857 ) ) ( not ( = ?auto_25842 ?auto_25850 ) ) ( not ( = ?auto_25842 ?auto_25863 ) ) ( not ( = ?auto_25842 ?auto_25858 ) ) ( not ( = ?auto_25842 ?auto_25845 ) ) ( not ( = ?auto_25842 ?auto_25841 ) ) ( not ( = ?auto_25842 ?auto_25855 ) ) ( not ( = ?auto_25816 ?auto_25828 ) ) ( not ( = ?auto_25816 ?auto_25833 ) ) ( not ( = ?auto_25817 ?auto_25828 ) ) ( not ( = ?auto_25817 ?auto_25833 ) ) ( not ( = ?auto_25818 ?auto_25828 ) ) ( not ( = ?auto_25818 ?auto_25833 ) ) ( not ( = ?auto_25819 ?auto_25828 ) ) ( not ( = ?auto_25819 ?auto_25833 ) ) ( not ( = ?auto_25820 ?auto_25828 ) ) ( not ( = ?auto_25820 ?auto_25833 ) ) ( not ( = ?auto_25823 ?auto_25828 ) ) ( not ( = ?auto_25823 ?auto_25833 ) ) ( not ( = ?auto_25821 ?auto_25828 ) ) ( not ( = ?auto_25821 ?auto_25833 ) ) ( not ( = ?auto_25825 ?auto_25828 ) ) ( not ( = ?auto_25825 ?auto_25833 ) ) ( not ( = ?auto_25824 ?auto_25828 ) ) ( not ( = ?auto_25824 ?auto_25833 ) ) ( not ( = ?auto_25822 ?auto_25828 ) ) ( not ( = ?auto_25822 ?auto_25833 ) ) ( not ( = ?auto_25827 ?auto_25828 ) ) ( not ( = ?auto_25827 ?auto_25833 ) ) ( not ( = ?auto_25828 ?auto_25842 ) ) ( not ( = ?auto_25828 ?auto_25848 ) ) ( not ( = ?auto_25828 ?auto_25856 ) ) ( not ( = ?auto_25828 ?auto_25852 ) ) ( not ( = ?auto_25828 ?auto_25857 ) ) ( not ( = ?auto_25828 ?auto_25850 ) ) ( not ( = ?auto_25828 ?auto_25863 ) ) ( not ( = ?auto_25828 ?auto_25858 ) ) ( not ( = ?auto_25828 ?auto_25845 ) ) ( not ( = ?auto_25828 ?auto_25841 ) ) ( not ( = ?auto_25828 ?auto_25855 ) ) ( not ( = ?auto_25833 ?auto_25842 ) ) ( not ( = ?auto_25833 ?auto_25848 ) ) ( not ( = ?auto_25833 ?auto_25856 ) ) ( not ( = ?auto_25833 ?auto_25852 ) ) ( not ( = ?auto_25833 ?auto_25857 ) ) ( not ( = ?auto_25833 ?auto_25850 ) ) ( not ( = ?auto_25833 ?auto_25863 ) ) ( not ( = ?auto_25833 ?auto_25858 ) ) ( not ( = ?auto_25833 ?auto_25845 ) ) ( not ( = ?auto_25833 ?auto_25841 ) ) ( not ( = ?auto_25833 ?auto_25855 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_25816 ?auto_25817 ?auto_25818 ?auto_25819 ?auto_25820 ?auto_25823 ?auto_25821 ?auto_25825 ?auto_25824 ?auto_25822 ?auto_25827 ?auto_25826 )
      ( MAKE-1CRATE ?auto_25826 ?auto_25828 )
      ( MAKE-12CRATE-VERIFY ?auto_25816 ?auto_25817 ?auto_25818 ?auto_25819 ?auto_25820 ?auto_25823 ?auto_25821 ?auto_25825 ?auto_25824 ?auto_25822 ?auto_25827 ?auto_25826 ?auto_25828 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25866 - SURFACE
      ?auto_25867 - SURFACE
    )
    :vars
    (
      ?auto_25868 - HOIST
      ?auto_25869 - PLACE
      ?auto_25871 - PLACE
      ?auto_25872 - HOIST
      ?auto_25873 - SURFACE
      ?auto_25870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25868 ?auto_25869 ) ( SURFACE-AT ?auto_25866 ?auto_25869 ) ( CLEAR ?auto_25866 ) ( IS-CRATE ?auto_25867 ) ( AVAILABLE ?auto_25868 ) ( not ( = ?auto_25871 ?auto_25869 ) ) ( HOIST-AT ?auto_25872 ?auto_25871 ) ( AVAILABLE ?auto_25872 ) ( SURFACE-AT ?auto_25867 ?auto_25871 ) ( ON ?auto_25867 ?auto_25873 ) ( CLEAR ?auto_25867 ) ( TRUCK-AT ?auto_25870 ?auto_25869 ) ( not ( = ?auto_25866 ?auto_25867 ) ) ( not ( = ?auto_25866 ?auto_25873 ) ) ( not ( = ?auto_25867 ?auto_25873 ) ) ( not ( = ?auto_25868 ?auto_25872 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25870 ?auto_25869 ?auto_25871 )
      ( !LIFT ?auto_25872 ?auto_25867 ?auto_25873 ?auto_25871 )
      ( !LOAD ?auto_25872 ?auto_25867 ?auto_25870 ?auto_25871 )
      ( !DRIVE ?auto_25870 ?auto_25871 ?auto_25869 )
      ( !UNLOAD ?auto_25868 ?auto_25867 ?auto_25870 ?auto_25869 )
      ( !DROP ?auto_25868 ?auto_25867 ?auto_25866 ?auto_25869 )
      ( MAKE-1CRATE-VERIFY ?auto_25866 ?auto_25867 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_25888 - SURFACE
      ?auto_25889 - SURFACE
      ?auto_25890 - SURFACE
      ?auto_25891 - SURFACE
      ?auto_25892 - SURFACE
      ?auto_25895 - SURFACE
      ?auto_25893 - SURFACE
      ?auto_25897 - SURFACE
      ?auto_25896 - SURFACE
      ?auto_25894 - SURFACE
      ?auto_25899 - SURFACE
      ?auto_25898 - SURFACE
      ?auto_25900 - SURFACE
      ?auto_25901 - SURFACE
    )
    :vars
    (
      ?auto_25907 - HOIST
      ?auto_25904 - PLACE
      ?auto_25903 - PLACE
      ?auto_25902 - HOIST
      ?auto_25905 - SURFACE
      ?auto_25936 - PLACE
      ?auto_25920 - HOIST
      ?auto_25917 - SURFACE
      ?auto_25909 - PLACE
      ?auto_25918 - HOIST
      ?auto_25911 - SURFACE
      ?auto_25922 - SURFACE
      ?auto_25932 - PLACE
      ?auto_25923 - HOIST
      ?auto_25930 - SURFACE
      ?auto_25935 - PLACE
      ?auto_25933 - HOIST
      ?auto_25913 - SURFACE
      ?auto_25925 - PLACE
      ?auto_25916 - HOIST
      ?auto_25914 - SURFACE
      ?auto_25915 - PLACE
      ?auto_25931 - HOIST
      ?auto_25927 - SURFACE
      ?auto_25924 - SURFACE
      ?auto_25919 - PLACE
      ?auto_25921 - HOIST
      ?auto_25912 - SURFACE
      ?auto_25928 - PLACE
      ?auto_25937 - HOIST
      ?auto_25910 - SURFACE
      ?auto_25908 - PLACE
      ?auto_25929 - HOIST
      ?auto_25934 - SURFACE
      ?auto_25926 - SURFACE
      ?auto_25906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25907 ?auto_25904 ) ( IS-CRATE ?auto_25901 ) ( not ( = ?auto_25903 ?auto_25904 ) ) ( HOIST-AT ?auto_25902 ?auto_25903 ) ( SURFACE-AT ?auto_25901 ?auto_25903 ) ( ON ?auto_25901 ?auto_25905 ) ( CLEAR ?auto_25901 ) ( not ( = ?auto_25900 ?auto_25901 ) ) ( not ( = ?auto_25900 ?auto_25905 ) ) ( not ( = ?auto_25901 ?auto_25905 ) ) ( not ( = ?auto_25907 ?auto_25902 ) ) ( IS-CRATE ?auto_25900 ) ( not ( = ?auto_25936 ?auto_25904 ) ) ( HOIST-AT ?auto_25920 ?auto_25936 ) ( SURFACE-AT ?auto_25900 ?auto_25936 ) ( ON ?auto_25900 ?auto_25917 ) ( CLEAR ?auto_25900 ) ( not ( = ?auto_25898 ?auto_25900 ) ) ( not ( = ?auto_25898 ?auto_25917 ) ) ( not ( = ?auto_25900 ?auto_25917 ) ) ( not ( = ?auto_25907 ?auto_25920 ) ) ( IS-CRATE ?auto_25898 ) ( not ( = ?auto_25909 ?auto_25904 ) ) ( HOIST-AT ?auto_25918 ?auto_25909 ) ( AVAILABLE ?auto_25918 ) ( SURFACE-AT ?auto_25898 ?auto_25909 ) ( ON ?auto_25898 ?auto_25911 ) ( CLEAR ?auto_25898 ) ( not ( = ?auto_25899 ?auto_25898 ) ) ( not ( = ?auto_25899 ?auto_25911 ) ) ( not ( = ?auto_25898 ?auto_25911 ) ) ( not ( = ?auto_25907 ?auto_25918 ) ) ( IS-CRATE ?auto_25899 ) ( AVAILABLE ?auto_25920 ) ( SURFACE-AT ?auto_25899 ?auto_25936 ) ( ON ?auto_25899 ?auto_25922 ) ( CLEAR ?auto_25899 ) ( not ( = ?auto_25894 ?auto_25899 ) ) ( not ( = ?auto_25894 ?auto_25922 ) ) ( not ( = ?auto_25899 ?auto_25922 ) ) ( IS-CRATE ?auto_25894 ) ( not ( = ?auto_25932 ?auto_25904 ) ) ( HOIST-AT ?auto_25923 ?auto_25932 ) ( AVAILABLE ?auto_25923 ) ( SURFACE-AT ?auto_25894 ?auto_25932 ) ( ON ?auto_25894 ?auto_25930 ) ( CLEAR ?auto_25894 ) ( not ( = ?auto_25896 ?auto_25894 ) ) ( not ( = ?auto_25896 ?auto_25930 ) ) ( not ( = ?auto_25894 ?auto_25930 ) ) ( not ( = ?auto_25907 ?auto_25923 ) ) ( IS-CRATE ?auto_25896 ) ( not ( = ?auto_25935 ?auto_25904 ) ) ( HOIST-AT ?auto_25933 ?auto_25935 ) ( AVAILABLE ?auto_25933 ) ( SURFACE-AT ?auto_25896 ?auto_25935 ) ( ON ?auto_25896 ?auto_25913 ) ( CLEAR ?auto_25896 ) ( not ( = ?auto_25897 ?auto_25896 ) ) ( not ( = ?auto_25897 ?auto_25913 ) ) ( not ( = ?auto_25896 ?auto_25913 ) ) ( not ( = ?auto_25907 ?auto_25933 ) ) ( IS-CRATE ?auto_25897 ) ( not ( = ?auto_25925 ?auto_25904 ) ) ( HOIST-AT ?auto_25916 ?auto_25925 ) ( AVAILABLE ?auto_25916 ) ( SURFACE-AT ?auto_25897 ?auto_25925 ) ( ON ?auto_25897 ?auto_25914 ) ( CLEAR ?auto_25897 ) ( not ( = ?auto_25893 ?auto_25897 ) ) ( not ( = ?auto_25893 ?auto_25914 ) ) ( not ( = ?auto_25897 ?auto_25914 ) ) ( not ( = ?auto_25907 ?auto_25916 ) ) ( IS-CRATE ?auto_25893 ) ( not ( = ?auto_25915 ?auto_25904 ) ) ( HOIST-AT ?auto_25931 ?auto_25915 ) ( AVAILABLE ?auto_25931 ) ( SURFACE-AT ?auto_25893 ?auto_25915 ) ( ON ?auto_25893 ?auto_25927 ) ( CLEAR ?auto_25893 ) ( not ( = ?auto_25895 ?auto_25893 ) ) ( not ( = ?auto_25895 ?auto_25927 ) ) ( not ( = ?auto_25893 ?auto_25927 ) ) ( not ( = ?auto_25907 ?auto_25931 ) ) ( IS-CRATE ?auto_25895 ) ( AVAILABLE ?auto_25902 ) ( SURFACE-AT ?auto_25895 ?auto_25903 ) ( ON ?auto_25895 ?auto_25924 ) ( CLEAR ?auto_25895 ) ( not ( = ?auto_25892 ?auto_25895 ) ) ( not ( = ?auto_25892 ?auto_25924 ) ) ( not ( = ?auto_25895 ?auto_25924 ) ) ( IS-CRATE ?auto_25892 ) ( not ( = ?auto_25919 ?auto_25904 ) ) ( HOIST-AT ?auto_25921 ?auto_25919 ) ( SURFACE-AT ?auto_25892 ?auto_25919 ) ( ON ?auto_25892 ?auto_25912 ) ( CLEAR ?auto_25892 ) ( not ( = ?auto_25891 ?auto_25892 ) ) ( not ( = ?auto_25891 ?auto_25912 ) ) ( not ( = ?auto_25892 ?auto_25912 ) ) ( not ( = ?auto_25907 ?auto_25921 ) ) ( IS-CRATE ?auto_25891 ) ( not ( = ?auto_25928 ?auto_25904 ) ) ( HOIST-AT ?auto_25937 ?auto_25928 ) ( AVAILABLE ?auto_25937 ) ( SURFACE-AT ?auto_25891 ?auto_25928 ) ( ON ?auto_25891 ?auto_25910 ) ( CLEAR ?auto_25891 ) ( not ( = ?auto_25890 ?auto_25891 ) ) ( not ( = ?auto_25890 ?auto_25910 ) ) ( not ( = ?auto_25891 ?auto_25910 ) ) ( not ( = ?auto_25907 ?auto_25937 ) ) ( IS-CRATE ?auto_25890 ) ( not ( = ?auto_25908 ?auto_25904 ) ) ( HOIST-AT ?auto_25929 ?auto_25908 ) ( AVAILABLE ?auto_25929 ) ( SURFACE-AT ?auto_25890 ?auto_25908 ) ( ON ?auto_25890 ?auto_25934 ) ( CLEAR ?auto_25890 ) ( not ( = ?auto_25889 ?auto_25890 ) ) ( not ( = ?auto_25889 ?auto_25934 ) ) ( not ( = ?auto_25890 ?auto_25934 ) ) ( not ( = ?auto_25907 ?auto_25929 ) ) ( SURFACE-AT ?auto_25888 ?auto_25904 ) ( CLEAR ?auto_25888 ) ( IS-CRATE ?auto_25889 ) ( AVAILABLE ?auto_25907 ) ( AVAILABLE ?auto_25921 ) ( SURFACE-AT ?auto_25889 ?auto_25919 ) ( ON ?auto_25889 ?auto_25926 ) ( CLEAR ?auto_25889 ) ( TRUCK-AT ?auto_25906 ?auto_25904 ) ( not ( = ?auto_25888 ?auto_25889 ) ) ( not ( = ?auto_25888 ?auto_25926 ) ) ( not ( = ?auto_25889 ?auto_25926 ) ) ( not ( = ?auto_25888 ?auto_25890 ) ) ( not ( = ?auto_25888 ?auto_25934 ) ) ( not ( = ?auto_25890 ?auto_25926 ) ) ( not ( = ?auto_25908 ?auto_25919 ) ) ( not ( = ?auto_25929 ?auto_25921 ) ) ( not ( = ?auto_25934 ?auto_25926 ) ) ( not ( = ?auto_25888 ?auto_25891 ) ) ( not ( = ?auto_25888 ?auto_25910 ) ) ( not ( = ?auto_25889 ?auto_25891 ) ) ( not ( = ?auto_25889 ?auto_25910 ) ) ( not ( = ?auto_25891 ?auto_25934 ) ) ( not ( = ?auto_25891 ?auto_25926 ) ) ( not ( = ?auto_25928 ?auto_25908 ) ) ( not ( = ?auto_25928 ?auto_25919 ) ) ( not ( = ?auto_25937 ?auto_25929 ) ) ( not ( = ?auto_25937 ?auto_25921 ) ) ( not ( = ?auto_25910 ?auto_25934 ) ) ( not ( = ?auto_25910 ?auto_25926 ) ) ( not ( = ?auto_25888 ?auto_25892 ) ) ( not ( = ?auto_25888 ?auto_25912 ) ) ( not ( = ?auto_25889 ?auto_25892 ) ) ( not ( = ?auto_25889 ?auto_25912 ) ) ( not ( = ?auto_25890 ?auto_25892 ) ) ( not ( = ?auto_25890 ?auto_25912 ) ) ( not ( = ?auto_25892 ?auto_25910 ) ) ( not ( = ?auto_25892 ?auto_25934 ) ) ( not ( = ?auto_25892 ?auto_25926 ) ) ( not ( = ?auto_25912 ?auto_25910 ) ) ( not ( = ?auto_25912 ?auto_25934 ) ) ( not ( = ?auto_25912 ?auto_25926 ) ) ( not ( = ?auto_25888 ?auto_25895 ) ) ( not ( = ?auto_25888 ?auto_25924 ) ) ( not ( = ?auto_25889 ?auto_25895 ) ) ( not ( = ?auto_25889 ?auto_25924 ) ) ( not ( = ?auto_25890 ?auto_25895 ) ) ( not ( = ?auto_25890 ?auto_25924 ) ) ( not ( = ?auto_25891 ?auto_25895 ) ) ( not ( = ?auto_25891 ?auto_25924 ) ) ( not ( = ?auto_25895 ?auto_25912 ) ) ( not ( = ?auto_25895 ?auto_25910 ) ) ( not ( = ?auto_25895 ?auto_25934 ) ) ( not ( = ?auto_25895 ?auto_25926 ) ) ( not ( = ?auto_25903 ?auto_25919 ) ) ( not ( = ?auto_25903 ?auto_25928 ) ) ( not ( = ?auto_25903 ?auto_25908 ) ) ( not ( = ?auto_25902 ?auto_25921 ) ) ( not ( = ?auto_25902 ?auto_25937 ) ) ( not ( = ?auto_25902 ?auto_25929 ) ) ( not ( = ?auto_25924 ?auto_25912 ) ) ( not ( = ?auto_25924 ?auto_25910 ) ) ( not ( = ?auto_25924 ?auto_25934 ) ) ( not ( = ?auto_25924 ?auto_25926 ) ) ( not ( = ?auto_25888 ?auto_25893 ) ) ( not ( = ?auto_25888 ?auto_25927 ) ) ( not ( = ?auto_25889 ?auto_25893 ) ) ( not ( = ?auto_25889 ?auto_25927 ) ) ( not ( = ?auto_25890 ?auto_25893 ) ) ( not ( = ?auto_25890 ?auto_25927 ) ) ( not ( = ?auto_25891 ?auto_25893 ) ) ( not ( = ?auto_25891 ?auto_25927 ) ) ( not ( = ?auto_25892 ?auto_25893 ) ) ( not ( = ?auto_25892 ?auto_25927 ) ) ( not ( = ?auto_25893 ?auto_25924 ) ) ( not ( = ?auto_25893 ?auto_25912 ) ) ( not ( = ?auto_25893 ?auto_25910 ) ) ( not ( = ?auto_25893 ?auto_25934 ) ) ( not ( = ?auto_25893 ?auto_25926 ) ) ( not ( = ?auto_25915 ?auto_25903 ) ) ( not ( = ?auto_25915 ?auto_25919 ) ) ( not ( = ?auto_25915 ?auto_25928 ) ) ( not ( = ?auto_25915 ?auto_25908 ) ) ( not ( = ?auto_25931 ?auto_25902 ) ) ( not ( = ?auto_25931 ?auto_25921 ) ) ( not ( = ?auto_25931 ?auto_25937 ) ) ( not ( = ?auto_25931 ?auto_25929 ) ) ( not ( = ?auto_25927 ?auto_25924 ) ) ( not ( = ?auto_25927 ?auto_25912 ) ) ( not ( = ?auto_25927 ?auto_25910 ) ) ( not ( = ?auto_25927 ?auto_25934 ) ) ( not ( = ?auto_25927 ?auto_25926 ) ) ( not ( = ?auto_25888 ?auto_25897 ) ) ( not ( = ?auto_25888 ?auto_25914 ) ) ( not ( = ?auto_25889 ?auto_25897 ) ) ( not ( = ?auto_25889 ?auto_25914 ) ) ( not ( = ?auto_25890 ?auto_25897 ) ) ( not ( = ?auto_25890 ?auto_25914 ) ) ( not ( = ?auto_25891 ?auto_25897 ) ) ( not ( = ?auto_25891 ?auto_25914 ) ) ( not ( = ?auto_25892 ?auto_25897 ) ) ( not ( = ?auto_25892 ?auto_25914 ) ) ( not ( = ?auto_25895 ?auto_25897 ) ) ( not ( = ?auto_25895 ?auto_25914 ) ) ( not ( = ?auto_25897 ?auto_25927 ) ) ( not ( = ?auto_25897 ?auto_25924 ) ) ( not ( = ?auto_25897 ?auto_25912 ) ) ( not ( = ?auto_25897 ?auto_25910 ) ) ( not ( = ?auto_25897 ?auto_25934 ) ) ( not ( = ?auto_25897 ?auto_25926 ) ) ( not ( = ?auto_25925 ?auto_25915 ) ) ( not ( = ?auto_25925 ?auto_25903 ) ) ( not ( = ?auto_25925 ?auto_25919 ) ) ( not ( = ?auto_25925 ?auto_25928 ) ) ( not ( = ?auto_25925 ?auto_25908 ) ) ( not ( = ?auto_25916 ?auto_25931 ) ) ( not ( = ?auto_25916 ?auto_25902 ) ) ( not ( = ?auto_25916 ?auto_25921 ) ) ( not ( = ?auto_25916 ?auto_25937 ) ) ( not ( = ?auto_25916 ?auto_25929 ) ) ( not ( = ?auto_25914 ?auto_25927 ) ) ( not ( = ?auto_25914 ?auto_25924 ) ) ( not ( = ?auto_25914 ?auto_25912 ) ) ( not ( = ?auto_25914 ?auto_25910 ) ) ( not ( = ?auto_25914 ?auto_25934 ) ) ( not ( = ?auto_25914 ?auto_25926 ) ) ( not ( = ?auto_25888 ?auto_25896 ) ) ( not ( = ?auto_25888 ?auto_25913 ) ) ( not ( = ?auto_25889 ?auto_25896 ) ) ( not ( = ?auto_25889 ?auto_25913 ) ) ( not ( = ?auto_25890 ?auto_25896 ) ) ( not ( = ?auto_25890 ?auto_25913 ) ) ( not ( = ?auto_25891 ?auto_25896 ) ) ( not ( = ?auto_25891 ?auto_25913 ) ) ( not ( = ?auto_25892 ?auto_25896 ) ) ( not ( = ?auto_25892 ?auto_25913 ) ) ( not ( = ?auto_25895 ?auto_25896 ) ) ( not ( = ?auto_25895 ?auto_25913 ) ) ( not ( = ?auto_25893 ?auto_25896 ) ) ( not ( = ?auto_25893 ?auto_25913 ) ) ( not ( = ?auto_25896 ?auto_25914 ) ) ( not ( = ?auto_25896 ?auto_25927 ) ) ( not ( = ?auto_25896 ?auto_25924 ) ) ( not ( = ?auto_25896 ?auto_25912 ) ) ( not ( = ?auto_25896 ?auto_25910 ) ) ( not ( = ?auto_25896 ?auto_25934 ) ) ( not ( = ?auto_25896 ?auto_25926 ) ) ( not ( = ?auto_25935 ?auto_25925 ) ) ( not ( = ?auto_25935 ?auto_25915 ) ) ( not ( = ?auto_25935 ?auto_25903 ) ) ( not ( = ?auto_25935 ?auto_25919 ) ) ( not ( = ?auto_25935 ?auto_25928 ) ) ( not ( = ?auto_25935 ?auto_25908 ) ) ( not ( = ?auto_25933 ?auto_25916 ) ) ( not ( = ?auto_25933 ?auto_25931 ) ) ( not ( = ?auto_25933 ?auto_25902 ) ) ( not ( = ?auto_25933 ?auto_25921 ) ) ( not ( = ?auto_25933 ?auto_25937 ) ) ( not ( = ?auto_25933 ?auto_25929 ) ) ( not ( = ?auto_25913 ?auto_25914 ) ) ( not ( = ?auto_25913 ?auto_25927 ) ) ( not ( = ?auto_25913 ?auto_25924 ) ) ( not ( = ?auto_25913 ?auto_25912 ) ) ( not ( = ?auto_25913 ?auto_25910 ) ) ( not ( = ?auto_25913 ?auto_25934 ) ) ( not ( = ?auto_25913 ?auto_25926 ) ) ( not ( = ?auto_25888 ?auto_25894 ) ) ( not ( = ?auto_25888 ?auto_25930 ) ) ( not ( = ?auto_25889 ?auto_25894 ) ) ( not ( = ?auto_25889 ?auto_25930 ) ) ( not ( = ?auto_25890 ?auto_25894 ) ) ( not ( = ?auto_25890 ?auto_25930 ) ) ( not ( = ?auto_25891 ?auto_25894 ) ) ( not ( = ?auto_25891 ?auto_25930 ) ) ( not ( = ?auto_25892 ?auto_25894 ) ) ( not ( = ?auto_25892 ?auto_25930 ) ) ( not ( = ?auto_25895 ?auto_25894 ) ) ( not ( = ?auto_25895 ?auto_25930 ) ) ( not ( = ?auto_25893 ?auto_25894 ) ) ( not ( = ?auto_25893 ?auto_25930 ) ) ( not ( = ?auto_25897 ?auto_25894 ) ) ( not ( = ?auto_25897 ?auto_25930 ) ) ( not ( = ?auto_25894 ?auto_25913 ) ) ( not ( = ?auto_25894 ?auto_25914 ) ) ( not ( = ?auto_25894 ?auto_25927 ) ) ( not ( = ?auto_25894 ?auto_25924 ) ) ( not ( = ?auto_25894 ?auto_25912 ) ) ( not ( = ?auto_25894 ?auto_25910 ) ) ( not ( = ?auto_25894 ?auto_25934 ) ) ( not ( = ?auto_25894 ?auto_25926 ) ) ( not ( = ?auto_25932 ?auto_25935 ) ) ( not ( = ?auto_25932 ?auto_25925 ) ) ( not ( = ?auto_25932 ?auto_25915 ) ) ( not ( = ?auto_25932 ?auto_25903 ) ) ( not ( = ?auto_25932 ?auto_25919 ) ) ( not ( = ?auto_25932 ?auto_25928 ) ) ( not ( = ?auto_25932 ?auto_25908 ) ) ( not ( = ?auto_25923 ?auto_25933 ) ) ( not ( = ?auto_25923 ?auto_25916 ) ) ( not ( = ?auto_25923 ?auto_25931 ) ) ( not ( = ?auto_25923 ?auto_25902 ) ) ( not ( = ?auto_25923 ?auto_25921 ) ) ( not ( = ?auto_25923 ?auto_25937 ) ) ( not ( = ?auto_25923 ?auto_25929 ) ) ( not ( = ?auto_25930 ?auto_25913 ) ) ( not ( = ?auto_25930 ?auto_25914 ) ) ( not ( = ?auto_25930 ?auto_25927 ) ) ( not ( = ?auto_25930 ?auto_25924 ) ) ( not ( = ?auto_25930 ?auto_25912 ) ) ( not ( = ?auto_25930 ?auto_25910 ) ) ( not ( = ?auto_25930 ?auto_25934 ) ) ( not ( = ?auto_25930 ?auto_25926 ) ) ( not ( = ?auto_25888 ?auto_25899 ) ) ( not ( = ?auto_25888 ?auto_25922 ) ) ( not ( = ?auto_25889 ?auto_25899 ) ) ( not ( = ?auto_25889 ?auto_25922 ) ) ( not ( = ?auto_25890 ?auto_25899 ) ) ( not ( = ?auto_25890 ?auto_25922 ) ) ( not ( = ?auto_25891 ?auto_25899 ) ) ( not ( = ?auto_25891 ?auto_25922 ) ) ( not ( = ?auto_25892 ?auto_25899 ) ) ( not ( = ?auto_25892 ?auto_25922 ) ) ( not ( = ?auto_25895 ?auto_25899 ) ) ( not ( = ?auto_25895 ?auto_25922 ) ) ( not ( = ?auto_25893 ?auto_25899 ) ) ( not ( = ?auto_25893 ?auto_25922 ) ) ( not ( = ?auto_25897 ?auto_25899 ) ) ( not ( = ?auto_25897 ?auto_25922 ) ) ( not ( = ?auto_25896 ?auto_25899 ) ) ( not ( = ?auto_25896 ?auto_25922 ) ) ( not ( = ?auto_25899 ?auto_25930 ) ) ( not ( = ?auto_25899 ?auto_25913 ) ) ( not ( = ?auto_25899 ?auto_25914 ) ) ( not ( = ?auto_25899 ?auto_25927 ) ) ( not ( = ?auto_25899 ?auto_25924 ) ) ( not ( = ?auto_25899 ?auto_25912 ) ) ( not ( = ?auto_25899 ?auto_25910 ) ) ( not ( = ?auto_25899 ?auto_25934 ) ) ( not ( = ?auto_25899 ?auto_25926 ) ) ( not ( = ?auto_25936 ?auto_25932 ) ) ( not ( = ?auto_25936 ?auto_25935 ) ) ( not ( = ?auto_25936 ?auto_25925 ) ) ( not ( = ?auto_25936 ?auto_25915 ) ) ( not ( = ?auto_25936 ?auto_25903 ) ) ( not ( = ?auto_25936 ?auto_25919 ) ) ( not ( = ?auto_25936 ?auto_25928 ) ) ( not ( = ?auto_25936 ?auto_25908 ) ) ( not ( = ?auto_25920 ?auto_25923 ) ) ( not ( = ?auto_25920 ?auto_25933 ) ) ( not ( = ?auto_25920 ?auto_25916 ) ) ( not ( = ?auto_25920 ?auto_25931 ) ) ( not ( = ?auto_25920 ?auto_25902 ) ) ( not ( = ?auto_25920 ?auto_25921 ) ) ( not ( = ?auto_25920 ?auto_25937 ) ) ( not ( = ?auto_25920 ?auto_25929 ) ) ( not ( = ?auto_25922 ?auto_25930 ) ) ( not ( = ?auto_25922 ?auto_25913 ) ) ( not ( = ?auto_25922 ?auto_25914 ) ) ( not ( = ?auto_25922 ?auto_25927 ) ) ( not ( = ?auto_25922 ?auto_25924 ) ) ( not ( = ?auto_25922 ?auto_25912 ) ) ( not ( = ?auto_25922 ?auto_25910 ) ) ( not ( = ?auto_25922 ?auto_25934 ) ) ( not ( = ?auto_25922 ?auto_25926 ) ) ( not ( = ?auto_25888 ?auto_25898 ) ) ( not ( = ?auto_25888 ?auto_25911 ) ) ( not ( = ?auto_25889 ?auto_25898 ) ) ( not ( = ?auto_25889 ?auto_25911 ) ) ( not ( = ?auto_25890 ?auto_25898 ) ) ( not ( = ?auto_25890 ?auto_25911 ) ) ( not ( = ?auto_25891 ?auto_25898 ) ) ( not ( = ?auto_25891 ?auto_25911 ) ) ( not ( = ?auto_25892 ?auto_25898 ) ) ( not ( = ?auto_25892 ?auto_25911 ) ) ( not ( = ?auto_25895 ?auto_25898 ) ) ( not ( = ?auto_25895 ?auto_25911 ) ) ( not ( = ?auto_25893 ?auto_25898 ) ) ( not ( = ?auto_25893 ?auto_25911 ) ) ( not ( = ?auto_25897 ?auto_25898 ) ) ( not ( = ?auto_25897 ?auto_25911 ) ) ( not ( = ?auto_25896 ?auto_25898 ) ) ( not ( = ?auto_25896 ?auto_25911 ) ) ( not ( = ?auto_25894 ?auto_25898 ) ) ( not ( = ?auto_25894 ?auto_25911 ) ) ( not ( = ?auto_25898 ?auto_25922 ) ) ( not ( = ?auto_25898 ?auto_25930 ) ) ( not ( = ?auto_25898 ?auto_25913 ) ) ( not ( = ?auto_25898 ?auto_25914 ) ) ( not ( = ?auto_25898 ?auto_25927 ) ) ( not ( = ?auto_25898 ?auto_25924 ) ) ( not ( = ?auto_25898 ?auto_25912 ) ) ( not ( = ?auto_25898 ?auto_25910 ) ) ( not ( = ?auto_25898 ?auto_25934 ) ) ( not ( = ?auto_25898 ?auto_25926 ) ) ( not ( = ?auto_25909 ?auto_25936 ) ) ( not ( = ?auto_25909 ?auto_25932 ) ) ( not ( = ?auto_25909 ?auto_25935 ) ) ( not ( = ?auto_25909 ?auto_25925 ) ) ( not ( = ?auto_25909 ?auto_25915 ) ) ( not ( = ?auto_25909 ?auto_25903 ) ) ( not ( = ?auto_25909 ?auto_25919 ) ) ( not ( = ?auto_25909 ?auto_25928 ) ) ( not ( = ?auto_25909 ?auto_25908 ) ) ( not ( = ?auto_25918 ?auto_25920 ) ) ( not ( = ?auto_25918 ?auto_25923 ) ) ( not ( = ?auto_25918 ?auto_25933 ) ) ( not ( = ?auto_25918 ?auto_25916 ) ) ( not ( = ?auto_25918 ?auto_25931 ) ) ( not ( = ?auto_25918 ?auto_25902 ) ) ( not ( = ?auto_25918 ?auto_25921 ) ) ( not ( = ?auto_25918 ?auto_25937 ) ) ( not ( = ?auto_25918 ?auto_25929 ) ) ( not ( = ?auto_25911 ?auto_25922 ) ) ( not ( = ?auto_25911 ?auto_25930 ) ) ( not ( = ?auto_25911 ?auto_25913 ) ) ( not ( = ?auto_25911 ?auto_25914 ) ) ( not ( = ?auto_25911 ?auto_25927 ) ) ( not ( = ?auto_25911 ?auto_25924 ) ) ( not ( = ?auto_25911 ?auto_25912 ) ) ( not ( = ?auto_25911 ?auto_25910 ) ) ( not ( = ?auto_25911 ?auto_25934 ) ) ( not ( = ?auto_25911 ?auto_25926 ) ) ( not ( = ?auto_25888 ?auto_25900 ) ) ( not ( = ?auto_25888 ?auto_25917 ) ) ( not ( = ?auto_25889 ?auto_25900 ) ) ( not ( = ?auto_25889 ?auto_25917 ) ) ( not ( = ?auto_25890 ?auto_25900 ) ) ( not ( = ?auto_25890 ?auto_25917 ) ) ( not ( = ?auto_25891 ?auto_25900 ) ) ( not ( = ?auto_25891 ?auto_25917 ) ) ( not ( = ?auto_25892 ?auto_25900 ) ) ( not ( = ?auto_25892 ?auto_25917 ) ) ( not ( = ?auto_25895 ?auto_25900 ) ) ( not ( = ?auto_25895 ?auto_25917 ) ) ( not ( = ?auto_25893 ?auto_25900 ) ) ( not ( = ?auto_25893 ?auto_25917 ) ) ( not ( = ?auto_25897 ?auto_25900 ) ) ( not ( = ?auto_25897 ?auto_25917 ) ) ( not ( = ?auto_25896 ?auto_25900 ) ) ( not ( = ?auto_25896 ?auto_25917 ) ) ( not ( = ?auto_25894 ?auto_25900 ) ) ( not ( = ?auto_25894 ?auto_25917 ) ) ( not ( = ?auto_25899 ?auto_25900 ) ) ( not ( = ?auto_25899 ?auto_25917 ) ) ( not ( = ?auto_25900 ?auto_25911 ) ) ( not ( = ?auto_25900 ?auto_25922 ) ) ( not ( = ?auto_25900 ?auto_25930 ) ) ( not ( = ?auto_25900 ?auto_25913 ) ) ( not ( = ?auto_25900 ?auto_25914 ) ) ( not ( = ?auto_25900 ?auto_25927 ) ) ( not ( = ?auto_25900 ?auto_25924 ) ) ( not ( = ?auto_25900 ?auto_25912 ) ) ( not ( = ?auto_25900 ?auto_25910 ) ) ( not ( = ?auto_25900 ?auto_25934 ) ) ( not ( = ?auto_25900 ?auto_25926 ) ) ( not ( = ?auto_25917 ?auto_25911 ) ) ( not ( = ?auto_25917 ?auto_25922 ) ) ( not ( = ?auto_25917 ?auto_25930 ) ) ( not ( = ?auto_25917 ?auto_25913 ) ) ( not ( = ?auto_25917 ?auto_25914 ) ) ( not ( = ?auto_25917 ?auto_25927 ) ) ( not ( = ?auto_25917 ?auto_25924 ) ) ( not ( = ?auto_25917 ?auto_25912 ) ) ( not ( = ?auto_25917 ?auto_25910 ) ) ( not ( = ?auto_25917 ?auto_25934 ) ) ( not ( = ?auto_25917 ?auto_25926 ) ) ( not ( = ?auto_25888 ?auto_25901 ) ) ( not ( = ?auto_25888 ?auto_25905 ) ) ( not ( = ?auto_25889 ?auto_25901 ) ) ( not ( = ?auto_25889 ?auto_25905 ) ) ( not ( = ?auto_25890 ?auto_25901 ) ) ( not ( = ?auto_25890 ?auto_25905 ) ) ( not ( = ?auto_25891 ?auto_25901 ) ) ( not ( = ?auto_25891 ?auto_25905 ) ) ( not ( = ?auto_25892 ?auto_25901 ) ) ( not ( = ?auto_25892 ?auto_25905 ) ) ( not ( = ?auto_25895 ?auto_25901 ) ) ( not ( = ?auto_25895 ?auto_25905 ) ) ( not ( = ?auto_25893 ?auto_25901 ) ) ( not ( = ?auto_25893 ?auto_25905 ) ) ( not ( = ?auto_25897 ?auto_25901 ) ) ( not ( = ?auto_25897 ?auto_25905 ) ) ( not ( = ?auto_25896 ?auto_25901 ) ) ( not ( = ?auto_25896 ?auto_25905 ) ) ( not ( = ?auto_25894 ?auto_25901 ) ) ( not ( = ?auto_25894 ?auto_25905 ) ) ( not ( = ?auto_25899 ?auto_25901 ) ) ( not ( = ?auto_25899 ?auto_25905 ) ) ( not ( = ?auto_25898 ?auto_25901 ) ) ( not ( = ?auto_25898 ?auto_25905 ) ) ( not ( = ?auto_25901 ?auto_25917 ) ) ( not ( = ?auto_25901 ?auto_25911 ) ) ( not ( = ?auto_25901 ?auto_25922 ) ) ( not ( = ?auto_25901 ?auto_25930 ) ) ( not ( = ?auto_25901 ?auto_25913 ) ) ( not ( = ?auto_25901 ?auto_25914 ) ) ( not ( = ?auto_25901 ?auto_25927 ) ) ( not ( = ?auto_25901 ?auto_25924 ) ) ( not ( = ?auto_25901 ?auto_25912 ) ) ( not ( = ?auto_25901 ?auto_25910 ) ) ( not ( = ?auto_25901 ?auto_25934 ) ) ( not ( = ?auto_25901 ?auto_25926 ) ) ( not ( = ?auto_25905 ?auto_25917 ) ) ( not ( = ?auto_25905 ?auto_25911 ) ) ( not ( = ?auto_25905 ?auto_25922 ) ) ( not ( = ?auto_25905 ?auto_25930 ) ) ( not ( = ?auto_25905 ?auto_25913 ) ) ( not ( = ?auto_25905 ?auto_25914 ) ) ( not ( = ?auto_25905 ?auto_25927 ) ) ( not ( = ?auto_25905 ?auto_25924 ) ) ( not ( = ?auto_25905 ?auto_25912 ) ) ( not ( = ?auto_25905 ?auto_25910 ) ) ( not ( = ?auto_25905 ?auto_25934 ) ) ( not ( = ?auto_25905 ?auto_25926 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_25888 ?auto_25889 ?auto_25890 ?auto_25891 ?auto_25892 ?auto_25895 ?auto_25893 ?auto_25897 ?auto_25896 ?auto_25894 ?auto_25899 ?auto_25898 ?auto_25900 )
      ( MAKE-1CRATE ?auto_25900 ?auto_25901 )
      ( MAKE-13CRATE-VERIFY ?auto_25888 ?auto_25889 ?auto_25890 ?auto_25891 ?auto_25892 ?auto_25895 ?auto_25893 ?auto_25897 ?auto_25896 ?auto_25894 ?auto_25899 ?auto_25898 ?auto_25900 ?auto_25901 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25940 - SURFACE
      ?auto_25941 - SURFACE
    )
    :vars
    (
      ?auto_25942 - HOIST
      ?auto_25943 - PLACE
      ?auto_25945 - PLACE
      ?auto_25946 - HOIST
      ?auto_25947 - SURFACE
      ?auto_25944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25942 ?auto_25943 ) ( SURFACE-AT ?auto_25940 ?auto_25943 ) ( CLEAR ?auto_25940 ) ( IS-CRATE ?auto_25941 ) ( AVAILABLE ?auto_25942 ) ( not ( = ?auto_25945 ?auto_25943 ) ) ( HOIST-AT ?auto_25946 ?auto_25945 ) ( AVAILABLE ?auto_25946 ) ( SURFACE-AT ?auto_25941 ?auto_25945 ) ( ON ?auto_25941 ?auto_25947 ) ( CLEAR ?auto_25941 ) ( TRUCK-AT ?auto_25944 ?auto_25943 ) ( not ( = ?auto_25940 ?auto_25941 ) ) ( not ( = ?auto_25940 ?auto_25947 ) ) ( not ( = ?auto_25941 ?auto_25947 ) ) ( not ( = ?auto_25942 ?auto_25946 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25944 ?auto_25943 ?auto_25945 )
      ( !LIFT ?auto_25946 ?auto_25941 ?auto_25947 ?auto_25945 )
      ( !LOAD ?auto_25946 ?auto_25941 ?auto_25944 ?auto_25945 )
      ( !DRIVE ?auto_25944 ?auto_25945 ?auto_25943 )
      ( !UNLOAD ?auto_25942 ?auto_25941 ?auto_25944 ?auto_25943 )
      ( !DROP ?auto_25942 ?auto_25941 ?auto_25940 ?auto_25943 )
      ( MAKE-1CRATE-VERIFY ?auto_25940 ?auto_25941 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_25963 - SURFACE
      ?auto_25964 - SURFACE
      ?auto_25965 - SURFACE
      ?auto_25966 - SURFACE
      ?auto_25967 - SURFACE
      ?auto_25970 - SURFACE
      ?auto_25968 - SURFACE
      ?auto_25972 - SURFACE
      ?auto_25971 - SURFACE
      ?auto_25969 - SURFACE
      ?auto_25974 - SURFACE
      ?auto_25973 - SURFACE
      ?auto_25975 - SURFACE
      ?auto_25976 - SURFACE
      ?auto_25977 - SURFACE
    )
    :vars
    (
      ?auto_25979 - HOIST
      ?auto_25981 - PLACE
      ?auto_25983 - PLACE
      ?auto_25978 - HOIST
      ?auto_25980 - SURFACE
      ?auto_25987 - PLACE
      ?auto_26008 - HOIST
      ?auto_26009 - SURFACE
      ?auto_25985 - PLACE
      ?auto_25984 - HOIST
      ?auto_26015 - SURFACE
      ?auto_26013 - PLACE
      ?auto_26014 - HOIST
      ?auto_26011 - SURFACE
      ?auto_26004 - SURFACE
      ?auto_25994 - PLACE
      ?auto_25993 - HOIST
      ?auto_25999 - SURFACE
      ?auto_26010 - PLACE
      ?auto_26002 - HOIST
      ?auto_25996 - SURFACE
      ?auto_26006 - PLACE
      ?auto_26003 - HOIST
      ?auto_25990 - SURFACE
      ?auto_26005 - PLACE
      ?auto_26016 - HOIST
      ?auto_26007 - SURFACE
      ?auto_25992 - SURFACE
      ?auto_25998 - PLACE
      ?auto_25997 - HOIST
      ?auto_26012 - SURFACE
      ?auto_25995 - PLACE
      ?auto_26000 - HOIST
      ?auto_26001 - SURFACE
      ?auto_25988 - PLACE
      ?auto_25991 - HOIST
      ?auto_25986 - SURFACE
      ?auto_25989 - SURFACE
      ?auto_25982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25979 ?auto_25981 ) ( IS-CRATE ?auto_25977 ) ( not ( = ?auto_25983 ?auto_25981 ) ) ( HOIST-AT ?auto_25978 ?auto_25983 ) ( AVAILABLE ?auto_25978 ) ( SURFACE-AT ?auto_25977 ?auto_25983 ) ( ON ?auto_25977 ?auto_25980 ) ( CLEAR ?auto_25977 ) ( not ( = ?auto_25976 ?auto_25977 ) ) ( not ( = ?auto_25976 ?auto_25980 ) ) ( not ( = ?auto_25977 ?auto_25980 ) ) ( not ( = ?auto_25979 ?auto_25978 ) ) ( IS-CRATE ?auto_25976 ) ( not ( = ?auto_25987 ?auto_25981 ) ) ( HOIST-AT ?auto_26008 ?auto_25987 ) ( SURFACE-AT ?auto_25976 ?auto_25987 ) ( ON ?auto_25976 ?auto_26009 ) ( CLEAR ?auto_25976 ) ( not ( = ?auto_25975 ?auto_25976 ) ) ( not ( = ?auto_25975 ?auto_26009 ) ) ( not ( = ?auto_25976 ?auto_26009 ) ) ( not ( = ?auto_25979 ?auto_26008 ) ) ( IS-CRATE ?auto_25975 ) ( not ( = ?auto_25985 ?auto_25981 ) ) ( HOIST-AT ?auto_25984 ?auto_25985 ) ( SURFACE-AT ?auto_25975 ?auto_25985 ) ( ON ?auto_25975 ?auto_26015 ) ( CLEAR ?auto_25975 ) ( not ( = ?auto_25973 ?auto_25975 ) ) ( not ( = ?auto_25973 ?auto_26015 ) ) ( not ( = ?auto_25975 ?auto_26015 ) ) ( not ( = ?auto_25979 ?auto_25984 ) ) ( IS-CRATE ?auto_25973 ) ( not ( = ?auto_26013 ?auto_25981 ) ) ( HOIST-AT ?auto_26014 ?auto_26013 ) ( AVAILABLE ?auto_26014 ) ( SURFACE-AT ?auto_25973 ?auto_26013 ) ( ON ?auto_25973 ?auto_26011 ) ( CLEAR ?auto_25973 ) ( not ( = ?auto_25974 ?auto_25973 ) ) ( not ( = ?auto_25974 ?auto_26011 ) ) ( not ( = ?auto_25973 ?auto_26011 ) ) ( not ( = ?auto_25979 ?auto_26014 ) ) ( IS-CRATE ?auto_25974 ) ( AVAILABLE ?auto_25984 ) ( SURFACE-AT ?auto_25974 ?auto_25985 ) ( ON ?auto_25974 ?auto_26004 ) ( CLEAR ?auto_25974 ) ( not ( = ?auto_25969 ?auto_25974 ) ) ( not ( = ?auto_25969 ?auto_26004 ) ) ( not ( = ?auto_25974 ?auto_26004 ) ) ( IS-CRATE ?auto_25969 ) ( not ( = ?auto_25994 ?auto_25981 ) ) ( HOIST-AT ?auto_25993 ?auto_25994 ) ( AVAILABLE ?auto_25993 ) ( SURFACE-AT ?auto_25969 ?auto_25994 ) ( ON ?auto_25969 ?auto_25999 ) ( CLEAR ?auto_25969 ) ( not ( = ?auto_25971 ?auto_25969 ) ) ( not ( = ?auto_25971 ?auto_25999 ) ) ( not ( = ?auto_25969 ?auto_25999 ) ) ( not ( = ?auto_25979 ?auto_25993 ) ) ( IS-CRATE ?auto_25971 ) ( not ( = ?auto_26010 ?auto_25981 ) ) ( HOIST-AT ?auto_26002 ?auto_26010 ) ( AVAILABLE ?auto_26002 ) ( SURFACE-AT ?auto_25971 ?auto_26010 ) ( ON ?auto_25971 ?auto_25996 ) ( CLEAR ?auto_25971 ) ( not ( = ?auto_25972 ?auto_25971 ) ) ( not ( = ?auto_25972 ?auto_25996 ) ) ( not ( = ?auto_25971 ?auto_25996 ) ) ( not ( = ?auto_25979 ?auto_26002 ) ) ( IS-CRATE ?auto_25972 ) ( not ( = ?auto_26006 ?auto_25981 ) ) ( HOIST-AT ?auto_26003 ?auto_26006 ) ( AVAILABLE ?auto_26003 ) ( SURFACE-AT ?auto_25972 ?auto_26006 ) ( ON ?auto_25972 ?auto_25990 ) ( CLEAR ?auto_25972 ) ( not ( = ?auto_25968 ?auto_25972 ) ) ( not ( = ?auto_25968 ?auto_25990 ) ) ( not ( = ?auto_25972 ?auto_25990 ) ) ( not ( = ?auto_25979 ?auto_26003 ) ) ( IS-CRATE ?auto_25968 ) ( not ( = ?auto_26005 ?auto_25981 ) ) ( HOIST-AT ?auto_26016 ?auto_26005 ) ( AVAILABLE ?auto_26016 ) ( SURFACE-AT ?auto_25968 ?auto_26005 ) ( ON ?auto_25968 ?auto_26007 ) ( CLEAR ?auto_25968 ) ( not ( = ?auto_25970 ?auto_25968 ) ) ( not ( = ?auto_25970 ?auto_26007 ) ) ( not ( = ?auto_25968 ?auto_26007 ) ) ( not ( = ?auto_25979 ?auto_26016 ) ) ( IS-CRATE ?auto_25970 ) ( AVAILABLE ?auto_26008 ) ( SURFACE-AT ?auto_25970 ?auto_25987 ) ( ON ?auto_25970 ?auto_25992 ) ( CLEAR ?auto_25970 ) ( not ( = ?auto_25967 ?auto_25970 ) ) ( not ( = ?auto_25967 ?auto_25992 ) ) ( not ( = ?auto_25970 ?auto_25992 ) ) ( IS-CRATE ?auto_25967 ) ( not ( = ?auto_25998 ?auto_25981 ) ) ( HOIST-AT ?auto_25997 ?auto_25998 ) ( SURFACE-AT ?auto_25967 ?auto_25998 ) ( ON ?auto_25967 ?auto_26012 ) ( CLEAR ?auto_25967 ) ( not ( = ?auto_25966 ?auto_25967 ) ) ( not ( = ?auto_25966 ?auto_26012 ) ) ( not ( = ?auto_25967 ?auto_26012 ) ) ( not ( = ?auto_25979 ?auto_25997 ) ) ( IS-CRATE ?auto_25966 ) ( not ( = ?auto_25995 ?auto_25981 ) ) ( HOIST-AT ?auto_26000 ?auto_25995 ) ( AVAILABLE ?auto_26000 ) ( SURFACE-AT ?auto_25966 ?auto_25995 ) ( ON ?auto_25966 ?auto_26001 ) ( CLEAR ?auto_25966 ) ( not ( = ?auto_25965 ?auto_25966 ) ) ( not ( = ?auto_25965 ?auto_26001 ) ) ( not ( = ?auto_25966 ?auto_26001 ) ) ( not ( = ?auto_25979 ?auto_26000 ) ) ( IS-CRATE ?auto_25965 ) ( not ( = ?auto_25988 ?auto_25981 ) ) ( HOIST-AT ?auto_25991 ?auto_25988 ) ( AVAILABLE ?auto_25991 ) ( SURFACE-AT ?auto_25965 ?auto_25988 ) ( ON ?auto_25965 ?auto_25986 ) ( CLEAR ?auto_25965 ) ( not ( = ?auto_25964 ?auto_25965 ) ) ( not ( = ?auto_25964 ?auto_25986 ) ) ( not ( = ?auto_25965 ?auto_25986 ) ) ( not ( = ?auto_25979 ?auto_25991 ) ) ( SURFACE-AT ?auto_25963 ?auto_25981 ) ( CLEAR ?auto_25963 ) ( IS-CRATE ?auto_25964 ) ( AVAILABLE ?auto_25979 ) ( AVAILABLE ?auto_25997 ) ( SURFACE-AT ?auto_25964 ?auto_25998 ) ( ON ?auto_25964 ?auto_25989 ) ( CLEAR ?auto_25964 ) ( TRUCK-AT ?auto_25982 ?auto_25981 ) ( not ( = ?auto_25963 ?auto_25964 ) ) ( not ( = ?auto_25963 ?auto_25989 ) ) ( not ( = ?auto_25964 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25965 ) ) ( not ( = ?auto_25963 ?auto_25986 ) ) ( not ( = ?auto_25965 ?auto_25989 ) ) ( not ( = ?auto_25988 ?auto_25998 ) ) ( not ( = ?auto_25991 ?auto_25997 ) ) ( not ( = ?auto_25986 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25966 ) ) ( not ( = ?auto_25963 ?auto_26001 ) ) ( not ( = ?auto_25964 ?auto_25966 ) ) ( not ( = ?auto_25964 ?auto_26001 ) ) ( not ( = ?auto_25966 ?auto_25986 ) ) ( not ( = ?auto_25966 ?auto_25989 ) ) ( not ( = ?auto_25995 ?auto_25988 ) ) ( not ( = ?auto_25995 ?auto_25998 ) ) ( not ( = ?auto_26000 ?auto_25991 ) ) ( not ( = ?auto_26000 ?auto_25997 ) ) ( not ( = ?auto_26001 ?auto_25986 ) ) ( not ( = ?auto_26001 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25967 ) ) ( not ( = ?auto_25963 ?auto_26012 ) ) ( not ( = ?auto_25964 ?auto_25967 ) ) ( not ( = ?auto_25964 ?auto_26012 ) ) ( not ( = ?auto_25965 ?auto_25967 ) ) ( not ( = ?auto_25965 ?auto_26012 ) ) ( not ( = ?auto_25967 ?auto_26001 ) ) ( not ( = ?auto_25967 ?auto_25986 ) ) ( not ( = ?auto_25967 ?auto_25989 ) ) ( not ( = ?auto_26012 ?auto_26001 ) ) ( not ( = ?auto_26012 ?auto_25986 ) ) ( not ( = ?auto_26012 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25970 ) ) ( not ( = ?auto_25963 ?auto_25992 ) ) ( not ( = ?auto_25964 ?auto_25970 ) ) ( not ( = ?auto_25964 ?auto_25992 ) ) ( not ( = ?auto_25965 ?auto_25970 ) ) ( not ( = ?auto_25965 ?auto_25992 ) ) ( not ( = ?auto_25966 ?auto_25970 ) ) ( not ( = ?auto_25966 ?auto_25992 ) ) ( not ( = ?auto_25970 ?auto_26012 ) ) ( not ( = ?auto_25970 ?auto_26001 ) ) ( not ( = ?auto_25970 ?auto_25986 ) ) ( not ( = ?auto_25970 ?auto_25989 ) ) ( not ( = ?auto_25987 ?auto_25998 ) ) ( not ( = ?auto_25987 ?auto_25995 ) ) ( not ( = ?auto_25987 ?auto_25988 ) ) ( not ( = ?auto_26008 ?auto_25997 ) ) ( not ( = ?auto_26008 ?auto_26000 ) ) ( not ( = ?auto_26008 ?auto_25991 ) ) ( not ( = ?auto_25992 ?auto_26012 ) ) ( not ( = ?auto_25992 ?auto_26001 ) ) ( not ( = ?auto_25992 ?auto_25986 ) ) ( not ( = ?auto_25992 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25968 ) ) ( not ( = ?auto_25963 ?auto_26007 ) ) ( not ( = ?auto_25964 ?auto_25968 ) ) ( not ( = ?auto_25964 ?auto_26007 ) ) ( not ( = ?auto_25965 ?auto_25968 ) ) ( not ( = ?auto_25965 ?auto_26007 ) ) ( not ( = ?auto_25966 ?auto_25968 ) ) ( not ( = ?auto_25966 ?auto_26007 ) ) ( not ( = ?auto_25967 ?auto_25968 ) ) ( not ( = ?auto_25967 ?auto_26007 ) ) ( not ( = ?auto_25968 ?auto_25992 ) ) ( not ( = ?auto_25968 ?auto_26012 ) ) ( not ( = ?auto_25968 ?auto_26001 ) ) ( not ( = ?auto_25968 ?auto_25986 ) ) ( not ( = ?auto_25968 ?auto_25989 ) ) ( not ( = ?auto_26005 ?auto_25987 ) ) ( not ( = ?auto_26005 ?auto_25998 ) ) ( not ( = ?auto_26005 ?auto_25995 ) ) ( not ( = ?auto_26005 ?auto_25988 ) ) ( not ( = ?auto_26016 ?auto_26008 ) ) ( not ( = ?auto_26016 ?auto_25997 ) ) ( not ( = ?auto_26016 ?auto_26000 ) ) ( not ( = ?auto_26016 ?auto_25991 ) ) ( not ( = ?auto_26007 ?auto_25992 ) ) ( not ( = ?auto_26007 ?auto_26012 ) ) ( not ( = ?auto_26007 ?auto_26001 ) ) ( not ( = ?auto_26007 ?auto_25986 ) ) ( not ( = ?auto_26007 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25972 ) ) ( not ( = ?auto_25963 ?auto_25990 ) ) ( not ( = ?auto_25964 ?auto_25972 ) ) ( not ( = ?auto_25964 ?auto_25990 ) ) ( not ( = ?auto_25965 ?auto_25972 ) ) ( not ( = ?auto_25965 ?auto_25990 ) ) ( not ( = ?auto_25966 ?auto_25972 ) ) ( not ( = ?auto_25966 ?auto_25990 ) ) ( not ( = ?auto_25967 ?auto_25972 ) ) ( not ( = ?auto_25967 ?auto_25990 ) ) ( not ( = ?auto_25970 ?auto_25972 ) ) ( not ( = ?auto_25970 ?auto_25990 ) ) ( not ( = ?auto_25972 ?auto_26007 ) ) ( not ( = ?auto_25972 ?auto_25992 ) ) ( not ( = ?auto_25972 ?auto_26012 ) ) ( not ( = ?auto_25972 ?auto_26001 ) ) ( not ( = ?auto_25972 ?auto_25986 ) ) ( not ( = ?auto_25972 ?auto_25989 ) ) ( not ( = ?auto_26006 ?auto_26005 ) ) ( not ( = ?auto_26006 ?auto_25987 ) ) ( not ( = ?auto_26006 ?auto_25998 ) ) ( not ( = ?auto_26006 ?auto_25995 ) ) ( not ( = ?auto_26006 ?auto_25988 ) ) ( not ( = ?auto_26003 ?auto_26016 ) ) ( not ( = ?auto_26003 ?auto_26008 ) ) ( not ( = ?auto_26003 ?auto_25997 ) ) ( not ( = ?auto_26003 ?auto_26000 ) ) ( not ( = ?auto_26003 ?auto_25991 ) ) ( not ( = ?auto_25990 ?auto_26007 ) ) ( not ( = ?auto_25990 ?auto_25992 ) ) ( not ( = ?auto_25990 ?auto_26012 ) ) ( not ( = ?auto_25990 ?auto_26001 ) ) ( not ( = ?auto_25990 ?auto_25986 ) ) ( not ( = ?auto_25990 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25971 ) ) ( not ( = ?auto_25963 ?auto_25996 ) ) ( not ( = ?auto_25964 ?auto_25971 ) ) ( not ( = ?auto_25964 ?auto_25996 ) ) ( not ( = ?auto_25965 ?auto_25971 ) ) ( not ( = ?auto_25965 ?auto_25996 ) ) ( not ( = ?auto_25966 ?auto_25971 ) ) ( not ( = ?auto_25966 ?auto_25996 ) ) ( not ( = ?auto_25967 ?auto_25971 ) ) ( not ( = ?auto_25967 ?auto_25996 ) ) ( not ( = ?auto_25970 ?auto_25971 ) ) ( not ( = ?auto_25970 ?auto_25996 ) ) ( not ( = ?auto_25968 ?auto_25971 ) ) ( not ( = ?auto_25968 ?auto_25996 ) ) ( not ( = ?auto_25971 ?auto_25990 ) ) ( not ( = ?auto_25971 ?auto_26007 ) ) ( not ( = ?auto_25971 ?auto_25992 ) ) ( not ( = ?auto_25971 ?auto_26012 ) ) ( not ( = ?auto_25971 ?auto_26001 ) ) ( not ( = ?auto_25971 ?auto_25986 ) ) ( not ( = ?auto_25971 ?auto_25989 ) ) ( not ( = ?auto_26010 ?auto_26006 ) ) ( not ( = ?auto_26010 ?auto_26005 ) ) ( not ( = ?auto_26010 ?auto_25987 ) ) ( not ( = ?auto_26010 ?auto_25998 ) ) ( not ( = ?auto_26010 ?auto_25995 ) ) ( not ( = ?auto_26010 ?auto_25988 ) ) ( not ( = ?auto_26002 ?auto_26003 ) ) ( not ( = ?auto_26002 ?auto_26016 ) ) ( not ( = ?auto_26002 ?auto_26008 ) ) ( not ( = ?auto_26002 ?auto_25997 ) ) ( not ( = ?auto_26002 ?auto_26000 ) ) ( not ( = ?auto_26002 ?auto_25991 ) ) ( not ( = ?auto_25996 ?auto_25990 ) ) ( not ( = ?auto_25996 ?auto_26007 ) ) ( not ( = ?auto_25996 ?auto_25992 ) ) ( not ( = ?auto_25996 ?auto_26012 ) ) ( not ( = ?auto_25996 ?auto_26001 ) ) ( not ( = ?auto_25996 ?auto_25986 ) ) ( not ( = ?auto_25996 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25969 ) ) ( not ( = ?auto_25963 ?auto_25999 ) ) ( not ( = ?auto_25964 ?auto_25969 ) ) ( not ( = ?auto_25964 ?auto_25999 ) ) ( not ( = ?auto_25965 ?auto_25969 ) ) ( not ( = ?auto_25965 ?auto_25999 ) ) ( not ( = ?auto_25966 ?auto_25969 ) ) ( not ( = ?auto_25966 ?auto_25999 ) ) ( not ( = ?auto_25967 ?auto_25969 ) ) ( not ( = ?auto_25967 ?auto_25999 ) ) ( not ( = ?auto_25970 ?auto_25969 ) ) ( not ( = ?auto_25970 ?auto_25999 ) ) ( not ( = ?auto_25968 ?auto_25969 ) ) ( not ( = ?auto_25968 ?auto_25999 ) ) ( not ( = ?auto_25972 ?auto_25969 ) ) ( not ( = ?auto_25972 ?auto_25999 ) ) ( not ( = ?auto_25969 ?auto_25996 ) ) ( not ( = ?auto_25969 ?auto_25990 ) ) ( not ( = ?auto_25969 ?auto_26007 ) ) ( not ( = ?auto_25969 ?auto_25992 ) ) ( not ( = ?auto_25969 ?auto_26012 ) ) ( not ( = ?auto_25969 ?auto_26001 ) ) ( not ( = ?auto_25969 ?auto_25986 ) ) ( not ( = ?auto_25969 ?auto_25989 ) ) ( not ( = ?auto_25994 ?auto_26010 ) ) ( not ( = ?auto_25994 ?auto_26006 ) ) ( not ( = ?auto_25994 ?auto_26005 ) ) ( not ( = ?auto_25994 ?auto_25987 ) ) ( not ( = ?auto_25994 ?auto_25998 ) ) ( not ( = ?auto_25994 ?auto_25995 ) ) ( not ( = ?auto_25994 ?auto_25988 ) ) ( not ( = ?auto_25993 ?auto_26002 ) ) ( not ( = ?auto_25993 ?auto_26003 ) ) ( not ( = ?auto_25993 ?auto_26016 ) ) ( not ( = ?auto_25993 ?auto_26008 ) ) ( not ( = ?auto_25993 ?auto_25997 ) ) ( not ( = ?auto_25993 ?auto_26000 ) ) ( not ( = ?auto_25993 ?auto_25991 ) ) ( not ( = ?auto_25999 ?auto_25996 ) ) ( not ( = ?auto_25999 ?auto_25990 ) ) ( not ( = ?auto_25999 ?auto_26007 ) ) ( not ( = ?auto_25999 ?auto_25992 ) ) ( not ( = ?auto_25999 ?auto_26012 ) ) ( not ( = ?auto_25999 ?auto_26001 ) ) ( not ( = ?auto_25999 ?auto_25986 ) ) ( not ( = ?auto_25999 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25974 ) ) ( not ( = ?auto_25963 ?auto_26004 ) ) ( not ( = ?auto_25964 ?auto_25974 ) ) ( not ( = ?auto_25964 ?auto_26004 ) ) ( not ( = ?auto_25965 ?auto_25974 ) ) ( not ( = ?auto_25965 ?auto_26004 ) ) ( not ( = ?auto_25966 ?auto_25974 ) ) ( not ( = ?auto_25966 ?auto_26004 ) ) ( not ( = ?auto_25967 ?auto_25974 ) ) ( not ( = ?auto_25967 ?auto_26004 ) ) ( not ( = ?auto_25970 ?auto_25974 ) ) ( not ( = ?auto_25970 ?auto_26004 ) ) ( not ( = ?auto_25968 ?auto_25974 ) ) ( not ( = ?auto_25968 ?auto_26004 ) ) ( not ( = ?auto_25972 ?auto_25974 ) ) ( not ( = ?auto_25972 ?auto_26004 ) ) ( not ( = ?auto_25971 ?auto_25974 ) ) ( not ( = ?auto_25971 ?auto_26004 ) ) ( not ( = ?auto_25974 ?auto_25999 ) ) ( not ( = ?auto_25974 ?auto_25996 ) ) ( not ( = ?auto_25974 ?auto_25990 ) ) ( not ( = ?auto_25974 ?auto_26007 ) ) ( not ( = ?auto_25974 ?auto_25992 ) ) ( not ( = ?auto_25974 ?auto_26012 ) ) ( not ( = ?auto_25974 ?auto_26001 ) ) ( not ( = ?auto_25974 ?auto_25986 ) ) ( not ( = ?auto_25974 ?auto_25989 ) ) ( not ( = ?auto_25985 ?auto_25994 ) ) ( not ( = ?auto_25985 ?auto_26010 ) ) ( not ( = ?auto_25985 ?auto_26006 ) ) ( not ( = ?auto_25985 ?auto_26005 ) ) ( not ( = ?auto_25985 ?auto_25987 ) ) ( not ( = ?auto_25985 ?auto_25998 ) ) ( not ( = ?auto_25985 ?auto_25995 ) ) ( not ( = ?auto_25985 ?auto_25988 ) ) ( not ( = ?auto_25984 ?auto_25993 ) ) ( not ( = ?auto_25984 ?auto_26002 ) ) ( not ( = ?auto_25984 ?auto_26003 ) ) ( not ( = ?auto_25984 ?auto_26016 ) ) ( not ( = ?auto_25984 ?auto_26008 ) ) ( not ( = ?auto_25984 ?auto_25997 ) ) ( not ( = ?auto_25984 ?auto_26000 ) ) ( not ( = ?auto_25984 ?auto_25991 ) ) ( not ( = ?auto_26004 ?auto_25999 ) ) ( not ( = ?auto_26004 ?auto_25996 ) ) ( not ( = ?auto_26004 ?auto_25990 ) ) ( not ( = ?auto_26004 ?auto_26007 ) ) ( not ( = ?auto_26004 ?auto_25992 ) ) ( not ( = ?auto_26004 ?auto_26012 ) ) ( not ( = ?auto_26004 ?auto_26001 ) ) ( not ( = ?auto_26004 ?auto_25986 ) ) ( not ( = ?auto_26004 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25973 ) ) ( not ( = ?auto_25963 ?auto_26011 ) ) ( not ( = ?auto_25964 ?auto_25973 ) ) ( not ( = ?auto_25964 ?auto_26011 ) ) ( not ( = ?auto_25965 ?auto_25973 ) ) ( not ( = ?auto_25965 ?auto_26011 ) ) ( not ( = ?auto_25966 ?auto_25973 ) ) ( not ( = ?auto_25966 ?auto_26011 ) ) ( not ( = ?auto_25967 ?auto_25973 ) ) ( not ( = ?auto_25967 ?auto_26011 ) ) ( not ( = ?auto_25970 ?auto_25973 ) ) ( not ( = ?auto_25970 ?auto_26011 ) ) ( not ( = ?auto_25968 ?auto_25973 ) ) ( not ( = ?auto_25968 ?auto_26011 ) ) ( not ( = ?auto_25972 ?auto_25973 ) ) ( not ( = ?auto_25972 ?auto_26011 ) ) ( not ( = ?auto_25971 ?auto_25973 ) ) ( not ( = ?auto_25971 ?auto_26011 ) ) ( not ( = ?auto_25969 ?auto_25973 ) ) ( not ( = ?auto_25969 ?auto_26011 ) ) ( not ( = ?auto_25973 ?auto_26004 ) ) ( not ( = ?auto_25973 ?auto_25999 ) ) ( not ( = ?auto_25973 ?auto_25996 ) ) ( not ( = ?auto_25973 ?auto_25990 ) ) ( not ( = ?auto_25973 ?auto_26007 ) ) ( not ( = ?auto_25973 ?auto_25992 ) ) ( not ( = ?auto_25973 ?auto_26012 ) ) ( not ( = ?auto_25973 ?auto_26001 ) ) ( not ( = ?auto_25973 ?auto_25986 ) ) ( not ( = ?auto_25973 ?auto_25989 ) ) ( not ( = ?auto_26013 ?auto_25985 ) ) ( not ( = ?auto_26013 ?auto_25994 ) ) ( not ( = ?auto_26013 ?auto_26010 ) ) ( not ( = ?auto_26013 ?auto_26006 ) ) ( not ( = ?auto_26013 ?auto_26005 ) ) ( not ( = ?auto_26013 ?auto_25987 ) ) ( not ( = ?auto_26013 ?auto_25998 ) ) ( not ( = ?auto_26013 ?auto_25995 ) ) ( not ( = ?auto_26013 ?auto_25988 ) ) ( not ( = ?auto_26014 ?auto_25984 ) ) ( not ( = ?auto_26014 ?auto_25993 ) ) ( not ( = ?auto_26014 ?auto_26002 ) ) ( not ( = ?auto_26014 ?auto_26003 ) ) ( not ( = ?auto_26014 ?auto_26016 ) ) ( not ( = ?auto_26014 ?auto_26008 ) ) ( not ( = ?auto_26014 ?auto_25997 ) ) ( not ( = ?auto_26014 ?auto_26000 ) ) ( not ( = ?auto_26014 ?auto_25991 ) ) ( not ( = ?auto_26011 ?auto_26004 ) ) ( not ( = ?auto_26011 ?auto_25999 ) ) ( not ( = ?auto_26011 ?auto_25996 ) ) ( not ( = ?auto_26011 ?auto_25990 ) ) ( not ( = ?auto_26011 ?auto_26007 ) ) ( not ( = ?auto_26011 ?auto_25992 ) ) ( not ( = ?auto_26011 ?auto_26012 ) ) ( not ( = ?auto_26011 ?auto_26001 ) ) ( not ( = ?auto_26011 ?auto_25986 ) ) ( not ( = ?auto_26011 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25975 ) ) ( not ( = ?auto_25963 ?auto_26015 ) ) ( not ( = ?auto_25964 ?auto_25975 ) ) ( not ( = ?auto_25964 ?auto_26015 ) ) ( not ( = ?auto_25965 ?auto_25975 ) ) ( not ( = ?auto_25965 ?auto_26015 ) ) ( not ( = ?auto_25966 ?auto_25975 ) ) ( not ( = ?auto_25966 ?auto_26015 ) ) ( not ( = ?auto_25967 ?auto_25975 ) ) ( not ( = ?auto_25967 ?auto_26015 ) ) ( not ( = ?auto_25970 ?auto_25975 ) ) ( not ( = ?auto_25970 ?auto_26015 ) ) ( not ( = ?auto_25968 ?auto_25975 ) ) ( not ( = ?auto_25968 ?auto_26015 ) ) ( not ( = ?auto_25972 ?auto_25975 ) ) ( not ( = ?auto_25972 ?auto_26015 ) ) ( not ( = ?auto_25971 ?auto_25975 ) ) ( not ( = ?auto_25971 ?auto_26015 ) ) ( not ( = ?auto_25969 ?auto_25975 ) ) ( not ( = ?auto_25969 ?auto_26015 ) ) ( not ( = ?auto_25974 ?auto_25975 ) ) ( not ( = ?auto_25974 ?auto_26015 ) ) ( not ( = ?auto_25975 ?auto_26011 ) ) ( not ( = ?auto_25975 ?auto_26004 ) ) ( not ( = ?auto_25975 ?auto_25999 ) ) ( not ( = ?auto_25975 ?auto_25996 ) ) ( not ( = ?auto_25975 ?auto_25990 ) ) ( not ( = ?auto_25975 ?auto_26007 ) ) ( not ( = ?auto_25975 ?auto_25992 ) ) ( not ( = ?auto_25975 ?auto_26012 ) ) ( not ( = ?auto_25975 ?auto_26001 ) ) ( not ( = ?auto_25975 ?auto_25986 ) ) ( not ( = ?auto_25975 ?auto_25989 ) ) ( not ( = ?auto_26015 ?auto_26011 ) ) ( not ( = ?auto_26015 ?auto_26004 ) ) ( not ( = ?auto_26015 ?auto_25999 ) ) ( not ( = ?auto_26015 ?auto_25996 ) ) ( not ( = ?auto_26015 ?auto_25990 ) ) ( not ( = ?auto_26015 ?auto_26007 ) ) ( not ( = ?auto_26015 ?auto_25992 ) ) ( not ( = ?auto_26015 ?auto_26012 ) ) ( not ( = ?auto_26015 ?auto_26001 ) ) ( not ( = ?auto_26015 ?auto_25986 ) ) ( not ( = ?auto_26015 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25976 ) ) ( not ( = ?auto_25963 ?auto_26009 ) ) ( not ( = ?auto_25964 ?auto_25976 ) ) ( not ( = ?auto_25964 ?auto_26009 ) ) ( not ( = ?auto_25965 ?auto_25976 ) ) ( not ( = ?auto_25965 ?auto_26009 ) ) ( not ( = ?auto_25966 ?auto_25976 ) ) ( not ( = ?auto_25966 ?auto_26009 ) ) ( not ( = ?auto_25967 ?auto_25976 ) ) ( not ( = ?auto_25967 ?auto_26009 ) ) ( not ( = ?auto_25970 ?auto_25976 ) ) ( not ( = ?auto_25970 ?auto_26009 ) ) ( not ( = ?auto_25968 ?auto_25976 ) ) ( not ( = ?auto_25968 ?auto_26009 ) ) ( not ( = ?auto_25972 ?auto_25976 ) ) ( not ( = ?auto_25972 ?auto_26009 ) ) ( not ( = ?auto_25971 ?auto_25976 ) ) ( not ( = ?auto_25971 ?auto_26009 ) ) ( not ( = ?auto_25969 ?auto_25976 ) ) ( not ( = ?auto_25969 ?auto_26009 ) ) ( not ( = ?auto_25974 ?auto_25976 ) ) ( not ( = ?auto_25974 ?auto_26009 ) ) ( not ( = ?auto_25973 ?auto_25976 ) ) ( not ( = ?auto_25973 ?auto_26009 ) ) ( not ( = ?auto_25976 ?auto_26015 ) ) ( not ( = ?auto_25976 ?auto_26011 ) ) ( not ( = ?auto_25976 ?auto_26004 ) ) ( not ( = ?auto_25976 ?auto_25999 ) ) ( not ( = ?auto_25976 ?auto_25996 ) ) ( not ( = ?auto_25976 ?auto_25990 ) ) ( not ( = ?auto_25976 ?auto_26007 ) ) ( not ( = ?auto_25976 ?auto_25992 ) ) ( not ( = ?auto_25976 ?auto_26012 ) ) ( not ( = ?auto_25976 ?auto_26001 ) ) ( not ( = ?auto_25976 ?auto_25986 ) ) ( not ( = ?auto_25976 ?auto_25989 ) ) ( not ( = ?auto_26009 ?auto_26015 ) ) ( not ( = ?auto_26009 ?auto_26011 ) ) ( not ( = ?auto_26009 ?auto_26004 ) ) ( not ( = ?auto_26009 ?auto_25999 ) ) ( not ( = ?auto_26009 ?auto_25996 ) ) ( not ( = ?auto_26009 ?auto_25990 ) ) ( not ( = ?auto_26009 ?auto_26007 ) ) ( not ( = ?auto_26009 ?auto_25992 ) ) ( not ( = ?auto_26009 ?auto_26012 ) ) ( not ( = ?auto_26009 ?auto_26001 ) ) ( not ( = ?auto_26009 ?auto_25986 ) ) ( not ( = ?auto_26009 ?auto_25989 ) ) ( not ( = ?auto_25963 ?auto_25977 ) ) ( not ( = ?auto_25963 ?auto_25980 ) ) ( not ( = ?auto_25964 ?auto_25977 ) ) ( not ( = ?auto_25964 ?auto_25980 ) ) ( not ( = ?auto_25965 ?auto_25977 ) ) ( not ( = ?auto_25965 ?auto_25980 ) ) ( not ( = ?auto_25966 ?auto_25977 ) ) ( not ( = ?auto_25966 ?auto_25980 ) ) ( not ( = ?auto_25967 ?auto_25977 ) ) ( not ( = ?auto_25967 ?auto_25980 ) ) ( not ( = ?auto_25970 ?auto_25977 ) ) ( not ( = ?auto_25970 ?auto_25980 ) ) ( not ( = ?auto_25968 ?auto_25977 ) ) ( not ( = ?auto_25968 ?auto_25980 ) ) ( not ( = ?auto_25972 ?auto_25977 ) ) ( not ( = ?auto_25972 ?auto_25980 ) ) ( not ( = ?auto_25971 ?auto_25977 ) ) ( not ( = ?auto_25971 ?auto_25980 ) ) ( not ( = ?auto_25969 ?auto_25977 ) ) ( not ( = ?auto_25969 ?auto_25980 ) ) ( not ( = ?auto_25974 ?auto_25977 ) ) ( not ( = ?auto_25974 ?auto_25980 ) ) ( not ( = ?auto_25973 ?auto_25977 ) ) ( not ( = ?auto_25973 ?auto_25980 ) ) ( not ( = ?auto_25975 ?auto_25977 ) ) ( not ( = ?auto_25975 ?auto_25980 ) ) ( not ( = ?auto_25977 ?auto_26009 ) ) ( not ( = ?auto_25977 ?auto_26015 ) ) ( not ( = ?auto_25977 ?auto_26011 ) ) ( not ( = ?auto_25977 ?auto_26004 ) ) ( not ( = ?auto_25977 ?auto_25999 ) ) ( not ( = ?auto_25977 ?auto_25996 ) ) ( not ( = ?auto_25977 ?auto_25990 ) ) ( not ( = ?auto_25977 ?auto_26007 ) ) ( not ( = ?auto_25977 ?auto_25992 ) ) ( not ( = ?auto_25977 ?auto_26012 ) ) ( not ( = ?auto_25977 ?auto_26001 ) ) ( not ( = ?auto_25977 ?auto_25986 ) ) ( not ( = ?auto_25977 ?auto_25989 ) ) ( not ( = ?auto_25983 ?auto_25987 ) ) ( not ( = ?auto_25983 ?auto_25985 ) ) ( not ( = ?auto_25983 ?auto_26013 ) ) ( not ( = ?auto_25983 ?auto_25994 ) ) ( not ( = ?auto_25983 ?auto_26010 ) ) ( not ( = ?auto_25983 ?auto_26006 ) ) ( not ( = ?auto_25983 ?auto_26005 ) ) ( not ( = ?auto_25983 ?auto_25998 ) ) ( not ( = ?auto_25983 ?auto_25995 ) ) ( not ( = ?auto_25983 ?auto_25988 ) ) ( not ( = ?auto_25978 ?auto_26008 ) ) ( not ( = ?auto_25978 ?auto_25984 ) ) ( not ( = ?auto_25978 ?auto_26014 ) ) ( not ( = ?auto_25978 ?auto_25993 ) ) ( not ( = ?auto_25978 ?auto_26002 ) ) ( not ( = ?auto_25978 ?auto_26003 ) ) ( not ( = ?auto_25978 ?auto_26016 ) ) ( not ( = ?auto_25978 ?auto_25997 ) ) ( not ( = ?auto_25978 ?auto_26000 ) ) ( not ( = ?auto_25978 ?auto_25991 ) ) ( not ( = ?auto_25980 ?auto_26009 ) ) ( not ( = ?auto_25980 ?auto_26015 ) ) ( not ( = ?auto_25980 ?auto_26011 ) ) ( not ( = ?auto_25980 ?auto_26004 ) ) ( not ( = ?auto_25980 ?auto_25999 ) ) ( not ( = ?auto_25980 ?auto_25996 ) ) ( not ( = ?auto_25980 ?auto_25990 ) ) ( not ( = ?auto_25980 ?auto_26007 ) ) ( not ( = ?auto_25980 ?auto_25992 ) ) ( not ( = ?auto_25980 ?auto_26012 ) ) ( not ( = ?auto_25980 ?auto_26001 ) ) ( not ( = ?auto_25980 ?auto_25986 ) ) ( not ( = ?auto_25980 ?auto_25989 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_25963 ?auto_25964 ?auto_25965 ?auto_25966 ?auto_25967 ?auto_25970 ?auto_25968 ?auto_25972 ?auto_25971 ?auto_25969 ?auto_25974 ?auto_25973 ?auto_25975 ?auto_25976 )
      ( MAKE-1CRATE ?auto_25976 ?auto_25977 )
      ( MAKE-14CRATE-VERIFY ?auto_25963 ?auto_25964 ?auto_25965 ?auto_25966 ?auto_25967 ?auto_25970 ?auto_25968 ?auto_25972 ?auto_25971 ?auto_25969 ?auto_25974 ?auto_25973 ?auto_25975 ?auto_25976 ?auto_25977 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26019 - SURFACE
      ?auto_26020 - SURFACE
    )
    :vars
    (
      ?auto_26021 - HOIST
      ?auto_26022 - PLACE
      ?auto_26024 - PLACE
      ?auto_26025 - HOIST
      ?auto_26026 - SURFACE
      ?auto_26023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26021 ?auto_26022 ) ( SURFACE-AT ?auto_26019 ?auto_26022 ) ( CLEAR ?auto_26019 ) ( IS-CRATE ?auto_26020 ) ( AVAILABLE ?auto_26021 ) ( not ( = ?auto_26024 ?auto_26022 ) ) ( HOIST-AT ?auto_26025 ?auto_26024 ) ( AVAILABLE ?auto_26025 ) ( SURFACE-AT ?auto_26020 ?auto_26024 ) ( ON ?auto_26020 ?auto_26026 ) ( CLEAR ?auto_26020 ) ( TRUCK-AT ?auto_26023 ?auto_26022 ) ( not ( = ?auto_26019 ?auto_26020 ) ) ( not ( = ?auto_26019 ?auto_26026 ) ) ( not ( = ?auto_26020 ?auto_26026 ) ) ( not ( = ?auto_26021 ?auto_26025 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26023 ?auto_26022 ?auto_26024 )
      ( !LIFT ?auto_26025 ?auto_26020 ?auto_26026 ?auto_26024 )
      ( !LOAD ?auto_26025 ?auto_26020 ?auto_26023 ?auto_26024 )
      ( !DRIVE ?auto_26023 ?auto_26024 ?auto_26022 )
      ( !UNLOAD ?auto_26021 ?auto_26020 ?auto_26023 ?auto_26022 )
      ( !DROP ?auto_26021 ?auto_26020 ?auto_26019 ?auto_26022 )
      ( MAKE-1CRATE-VERIFY ?auto_26019 ?auto_26020 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_26043 - SURFACE
      ?auto_26044 - SURFACE
      ?auto_26045 - SURFACE
      ?auto_26046 - SURFACE
      ?auto_26047 - SURFACE
      ?auto_26050 - SURFACE
      ?auto_26048 - SURFACE
      ?auto_26052 - SURFACE
      ?auto_26051 - SURFACE
      ?auto_26049 - SURFACE
      ?auto_26054 - SURFACE
      ?auto_26053 - SURFACE
      ?auto_26055 - SURFACE
      ?auto_26057 - SURFACE
      ?auto_26058 - SURFACE
      ?auto_26056 - SURFACE
    )
    :vars
    (
      ?auto_26062 - HOIST
      ?auto_26063 - PLACE
      ?auto_26064 - PLACE
      ?auto_26059 - HOIST
      ?auto_26061 - SURFACE
      ?auto_26088 - PLACE
      ?auto_26079 - HOIST
      ?auto_26072 - SURFACE
      ?auto_26096 - PLACE
      ?auto_26086 - HOIST
      ?auto_26089 - SURFACE
      ?auto_26087 - PLACE
      ?auto_26073 - HOIST
      ?auto_26068 - SURFACE
      ?auto_26081 - PLACE
      ?auto_26100 - HOIST
      ?auto_26076 - SURFACE
      ?auto_26083 - SURFACE
      ?auto_26074 - PLACE
      ?auto_26071 - HOIST
      ?auto_26066 - SURFACE
      ?auto_26067 - PLACE
      ?auto_26093 - HOIST
      ?auto_26095 - SURFACE
      ?auto_26082 - PLACE
      ?auto_26094 - HOIST
      ?auto_26070 - SURFACE
      ?auto_26098 - PLACE
      ?auto_26092 - HOIST
      ?auto_26099 - SURFACE
      ?auto_26069 - SURFACE
      ?auto_26097 - PLACE
      ?auto_26078 - HOIST
      ?auto_26080 - SURFACE
      ?auto_26065 - PLACE
      ?auto_26075 - HOIST
      ?auto_26077 - SURFACE
      ?auto_26085 - PLACE
      ?auto_26091 - HOIST
      ?auto_26090 - SURFACE
      ?auto_26084 - SURFACE
      ?auto_26060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26062 ?auto_26063 ) ( IS-CRATE ?auto_26056 ) ( not ( = ?auto_26064 ?auto_26063 ) ) ( HOIST-AT ?auto_26059 ?auto_26064 ) ( AVAILABLE ?auto_26059 ) ( SURFACE-AT ?auto_26056 ?auto_26064 ) ( ON ?auto_26056 ?auto_26061 ) ( CLEAR ?auto_26056 ) ( not ( = ?auto_26058 ?auto_26056 ) ) ( not ( = ?auto_26058 ?auto_26061 ) ) ( not ( = ?auto_26056 ?auto_26061 ) ) ( not ( = ?auto_26062 ?auto_26059 ) ) ( IS-CRATE ?auto_26058 ) ( not ( = ?auto_26088 ?auto_26063 ) ) ( HOIST-AT ?auto_26079 ?auto_26088 ) ( AVAILABLE ?auto_26079 ) ( SURFACE-AT ?auto_26058 ?auto_26088 ) ( ON ?auto_26058 ?auto_26072 ) ( CLEAR ?auto_26058 ) ( not ( = ?auto_26057 ?auto_26058 ) ) ( not ( = ?auto_26057 ?auto_26072 ) ) ( not ( = ?auto_26058 ?auto_26072 ) ) ( not ( = ?auto_26062 ?auto_26079 ) ) ( IS-CRATE ?auto_26057 ) ( not ( = ?auto_26096 ?auto_26063 ) ) ( HOIST-AT ?auto_26086 ?auto_26096 ) ( SURFACE-AT ?auto_26057 ?auto_26096 ) ( ON ?auto_26057 ?auto_26089 ) ( CLEAR ?auto_26057 ) ( not ( = ?auto_26055 ?auto_26057 ) ) ( not ( = ?auto_26055 ?auto_26089 ) ) ( not ( = ?auto_26057 ?auto_26089 ) ) ( not ( = ?auto_26062 ?auto_26086 ) ) ( IS-CRATE ?auto_26055 ) ( not ( = ?auto_26087 ?auto_26063 ) ) ( HOIST-AT ?auto_26073 ?auto_26087 ) ( SURFACE-AT ?auto_26055 ?auto_26087 ) ( ON ?auto_26055 ?auto_26068 ) ( CLEAR ?auto_26055 ) ( not ( = ?auto_26053 ?auto_26055 ) ) ( not ( = ?auto_26053 ?auto_26068 ) ) ( not ( = ?auto_26055 ?auto_26068 ) ) ( not ( = ?auto_26062 ?auto_26073 ) ) ( IS-CRATE ?auto_26053 ) ( not ( = ?auto_26081 ?auto_26063 ) ) ( HOIST-AT ?auto_26100 ?auto_26081 ) ( AVAILABLE ?auto_26100 ) ( SURFACE-AT ?auto_26053 ?auto_26081 ) ( ON ?auto_26053 ?auto_26076 ) ( CLEAR ?auto_26053 ) ( not ( = ?auto_26054 ?auto_26053 ) ) ( not ( = ?auto_26054 ?auto_26076 ) ) ( not ( = ?auto_26053 ?auto_26076 ) ) ( not ( = ?auto_26062 ?auto_26100 ) ) ( IS-CRATE ?auto_26054 ) ( AVAILABLE ?auto_26073 ) ( SURFACE-AT ?auto_26054 ?auto_26087 ) ( ON ?auto_26054 ?auto_26083 ) ( CLEAR ?auto_26054 ) ( not ( = ?auto_26049 ?auto_26054 ) ) ( not ( = ?auto_26049 ?auto_26083 ) ) ( not ( = ?auto_26054 ?auto_26083 ) ) ( IS-CRATE ?auto_26049 ) ( not ( = ?auto_26074 ?auto_26063 ) ) ( HOIST-AT ?auto_26071 ?auto_26074 ) ( AVAILABLE ?auto_26071 ) ( SURFACE-AT ?auto_26049 ?auto_26074 ) ( ON ?auto_26049 ?auto_26066 ) ( CLEAR ?auto_26049 ) ( not ( = ?auto_26051 ?auto_26049 ) ) ( not ( = ?auto_26051 ?auto_26066 ) ) ( not ( = ?auto_26049 ?auto_26066 ) ) ( not ( = ?auto_26062 ?auto_26071 ) ) ( IS-CRATE ?auto_26051 ) ( not ( = ?auto_26067 ?auto_26063 ) ) ( HOIST-AT ?auto_26093 ?auto_26067 ) ( AVAILABLE ?auto_26093 ) ( SURFACE-AT ?auto_26051 ?auto_26067 ) ( ON ?auto_26051 ?auto_26095 ) ( CLEAR ?auto_26051 ) ( not ( = ?auto_26052 ?auto_26051 ) ) ( not ( = ?auto_26052 ?auto_26095 ) ) ( not ( = ?auto_26051 ?auto_26095 ) ) ( not ( = ?auto_26062 ?auto_26093 ) ) ( IS-CRATE ?auto_26052 ) ( not ( = ?auto_26082 ?auto_26063 ) ) ( HOIST-AT ?auto_26094 ?auto_26082 ) ( AVAILABLE ?auto_26094 ) ( SURFACE-AT ?auto_26052 ?auto_26082 ) ( ON ?auto_26052 ?auto_26070 ) ( CLEAR ?auto_26052 ) ( not ( = ?auto_26048 ?auto_26052 ) ) ( not ( = ?auto_26048 ?auto_26070 ) ) ( not ( = ?auto_26052 ?auto_26070 ) ) ( not ( = ?auto_26062 ?auto_26094 ) ) ( IS-CRATE ?auto_26048 ) ( not ( = ?auto_26098 ?auto_26063 ) ) ( HOIST-AT ?auto_26092 ?auto_26098 ) ( AVAILABLE ?auto_26092 ) ( SURFACE-AT ?auto_26048 ?auto_26098 ) ( ON ?auto_26048 ?auto_26099 ) ( CLEAR ?auto_26048 ) ( not ( = ?auto_26050 ?auto_26048 ) ) ( not ( = ?auto_26050 ?auto_26099 ) ) ( not ( = ?auto_26048 ?auto_26099 ) ) ( not ( = ?auto_26062 ?auto_26092 ) ) ( IS-CRATE ?auto_26050 ) ( AVAILABLE ?auto_26086 ) ( SURFACE-AT ?auto_26050 ?auto_26096 ) ( ON ?auto_26050 ?auto_26069 ) ( CLEAR ?auto_26050 ) ( not ( = ?auto_26047 ?auto_26050 ) ) ( not ( = ?auto_26047 ?auto_26069 ) ) ( not ( = ?auto_26050 ?auto_26069 ) ) ( IS-CRATE ?auto_26047 ) ( not ( = ?auto_26097 ?auto_26063 ) ) ( HOIST-AT ?auto_26078 ?auto_26097 ) ( SURFACE-AT ?auto_26047 ?auto_26097 ) ( ON ?auto_26047 ?auto_26080 ) ( CLEAR ?auto_26047 ) ( not ( = ?auto_26046 ?auto_26047 ) ) ( not ( = ?auto_26046 ?auto_26080 ) ) ( not ( = ?auto_26047 ?auto_26080 ) ) ( not ( = ?auto_26062 ?auto_26078 ) ) ( IS-CRATE ?auto_26046 ) ( not ( = ?auto_26065 ?auto_26063 ) ) ( HOIST-AT ?auto_26075 ?auto_26065 ) ( AVAILABLE ?auto_26075 ) ( SURFACE-AT ?auto_26046 ?auto_26065 ) ( ON ?auto_26046 ?auto_26077 ) ( CLEAR ?auto_26046 ) ( not ( = ?auto_26045 ?auto_26046 ) ) ( not ( = ?auto_26045 ?auto_26077 ) ) ( not ( = ?auto_26046 ?auto_26077 ) ) ( not ( = ?auto_26062 ?auto_26075 ) ) ( IS-CRATE ?auto_26045 ) ( not ( = ?auto_26085 ?auto_26063 ) ) ( HOIST-AT ?auto_26091 ?auto_26085 ) ( AVAILABLE ?auto_26091 ) ( SURFACE-AT ?auto_26045 ?auto_26085 ) ( ON ?auto_26045 ?auto_26090 ) ( CLEAR ?auto_26045 ) ( not ( = ?auto_26044 ?auto_26045 ) ) ( not ( = ?auto_26044 ?auto_26090 ) ) ( not ( = ?auto_26045 ?auto_26090 ) ) ( not ( = ?auto_26062 ?auto_26091 ) ) ( SURFACE-AT ?auto_26043 ?auto_26063 ) ( CLEAR ?auto_26043 ) ( IS-CRATE ?auto_26044 ) ( AVAILABLE ?auto_26062 ) ( AVAILABLE ?auto_26078 ) ( SURFACE-AT ?auto_26044 ?auto_26097 ) ( ON ?auto_26044 ?auto_26084 ) ( CLEAR ?auto_26044 ) ( TRUCK-AT ?auto_26060 ?auto_26063 ) ( not ( = ?auto_26043 ?auto_26044 ) ) ( not ( = ?auto_26043 ?auto_26084 ) ) ( not ( = ?auto_26044 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26045 ) ) ( not ( = ?auto_26043 ?auto_26090 ) ) ( not ( = ?auto_26045 ?auto_26084 ) ) ( not ( = ?auto_26085 ?auto_26097 ) ) ( not ( = ?auto_26091 ?auto_26078 ) ) ( not ( = ?auto_26090 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26046 ) ) ( not ( = ?auto_26043 ?auto_26077 ) ) ( not ( = ?auto_26044 ?auto_26046 ) ) ( not ( = ?auto_26044 ?auto_26077 ) ) ( not ( = ?auto_26046 ?auto_26090 ) ) ( not ( = ?auto_26046 ?auto_26084 ) ) ( not ( = ?auto_26065 ?auto_26085 ) ) ( not ( = ?auto_26065 ?auto_26097 ) ) ( not ( = ?auto_26075 ?auto_26091 ) ) ( not ( = ?auto_26075 ?auto_26078 ) ) ( not ( = ?auto_26077 ?auto_26090 ) ) ( not ( = ?auto_26077 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26047 ) ) ( not ( = ?auto_26043 ?auto_26080 ) ) ( not ( = ?auto_26044 ?auto_26047 ) ) ( not ( = ?auto_26044 ?auto_26080 ) ) ( not ( = ?auto_26045 ?auto_26047 ) ) ( not ( = ?auto_26045 ?auto_26080 ) ) ( not ( = ?auto_26047 ?auto_26077 ) ) ( not ( = ?auto_26047 ?auto_26090 ) ) ( not ( = ?auto_26047 ?auto_26084 ) ) ( not ( = ?auto_26080 ?auto_26077 ) ) ( not ( = ?auto_26080 ?auto_26090 ) ) ( not ( = ?auto_26080 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26050 ) ) ( not ( = ?auto_26043 ?auto_26069 ) ) ( not ( = ?auto_26044 ?auto_26050 ) ) ( not ( = ?auto_26044 ?auto_26069 ) ) ( not ( = ?auto_26045 ?auto_26050 ) ) ( not ( = ?auto_26045 ?auto_26069 ) ) ( not ( = ?auto_26046 ?auto_26050 ) ) ( not ( = ?auto_26046 ?auto_26069 ) ) ( not ( = ?auto_26050 ?auto_26080 ) ) ( not ( = ?auto_26050 ?auto_26077 ) ) ( not ( = ?auto_26050 ?auto_26090 ) ) ( not ( = ?auto_26050 ?auto_26084 ) ) ( not ( = ?auto_26096 ?auto_26097 ) ) ( not ( = ?auto_26096 ?auto_26065 ) ) ( not ( = ?auto_26096 ?auto_26085 ) ) ( not ( = ?auto_26086 ?auto_26078 ) ) ( not ( = ?auto_26086 ?auto_26075 ) ) ( not ( = ?auto_26086 ?auto_26091 ) ) ( not ( = ?auto_26069 ?auto_26080 ) ) ( not ( = ?auto_26069 ?auto_26077 ) ) ( not ( = ?auto_26069 ?auto_26090 ) ) ( not ( = ?auto_26069 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26048 ) ) ( not ( = ?auto_26043 ?auto_26099 ) ) ( not ( = ?auto_26044 ?auto_26048 ) ) ( not ( = ?auto_26044 ?auto_26099 ) ) ( not ( = ?auto_26045 ?auto_26048 ) ) ( not ( = ?auto_26045 ?auto_26099 ) ) ( not ( = ?auto_26046 ?auto_26048 ) ) ( not ( = ?auto_26046 ?auto_26099 ) ) ( not ( = ?auto_26047 ?auto_26048 ) ) ( not ( = ?auto_26047 ?auto_26099 ) ) ( not ( = ?auto_26048 ?auto_26069 ) ) ( not ( = ?auto_26048 ?auto_26080 ) ) ( not ( = ?auto_26048 ?auto_26077 ) ) ( not ( = ?auto_26048 ?auto_26090 ) ) ( not ( = ?auto_26048 ?auto_26084 ) ) ( not ( = ?auto_26098 ?auto_26096 ) ) ( not ( = ?auto_26098 ?auto_26097 ) ) ( not ( = ?auto_26098 ?auto_26065 ) ) ( not ( = ?auto_26098 ?auto_26085 ) ) ( not ( = ?auto_26092 ?auto_26086 ) ) ( not ( = ?auto_26092 ?auto_26078 ) ) ( not ( = ?auto_26092 ?auto_26075 ) ) ( not ( = ?auto_26092 ?auto_26091 ) ) ( not ( = ?auto_26099 ?auto_26069 ) ) ( not ( = ?auto_26099 ?auto_26080 ) ) ( not ( = ?auto_26099 ?auto_26077 ) ) ( not ( = ?auto_26099 ?auto_26090 ) ) ( not ( = ?auto_26099 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26052 ) ) ( not ( = ?auto_26043 ?auto_26070 ) ) ( not ( = ?auto_26044 ?auto_26052 ) ) ( not ( = ?auto_26044 ?auto_26070 ) ) ( not ( = ?auto_26045 ?auto_26052 ) ) ( not ( = ?auto_26045 ?auto_26070 ) ) ( not ( = ?auto_26046 ?auto_26052 ) ) ( not ( = ?auto_26046 ?auto_26070 ) ) ( not ( = ?auto_26047 ?auto_26052 ) ) ( not ( = ?auto_26047 ?auto_26070 ) ) ( not ( = ?auto_26050 ?auto_26052 ) ) ( not ( = ?auto_26050 ?auto_26070 ) ) ( not ( = ?auto_26052 ?auto_26099 ) ) ( not ( = ?auto_26052 ?auto_26069 ) ) ( not ( = ?auto_26052 ?auto_26080 ) ) ( not ( = ?auto_26052 ?auto_26077 ) ) ( not ( = ?auto_26052 ?auto_26090 ) ) ( not ( = ?auto_26052 ?auto_26084 ) ) ( not ( = ?auto_26082 ?auto_26098 ) ) ( not ( = ?auto_26082 ?auto_26096 ) ) ( not ( = ?auto_26082 ?auto_26097 ) ) ( not ( = ?auto_26082 ?auto_26065 ) ) ( not ( = ?auto_26082 ?auto_26085 ) ) ( not ( = ?auto_26094 ?auto_26092 ) ) ( not ( = ?auto_26094 ?auto_26086 ) ) ( not ( = ?auto_26094 ?auto_26078 ) ) ( not ( = ?auto_26094 ?auto_26075 ) ) ( not ( = ?auto_26094 ?auto_26091 ) ) ( not ( = ?auto_26070 ?auto_26099 ) ) ( not ( = ?auto_26070 ?auto_26069 ) ) ( not ( = ?auto_26070 ?auto_26080 ) ) ( not ( = ?auto_26070 ?auto_26077 ) ) ( not ( = ?auto_26070 ?auto_26090 ) ) ( not ( = ?auto_26070 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26051 ) ) ( not ( = ?auto_26043 ?auto_26095 ) ) ( not ( = ?auto_26044 ?auto_26051 ) ) ( not ( = ?auto_26044 ?auto_26095 ) ) ( not ( = ?auto_26045 ?auto_26051 ) ) ( not ( = ?auto_26045 ?auto_26095 ) ) ( not ( = ?auto_26046 ?auto_26051 ) ) ( not ( = ?auto_26046 ?auto_26095 ) ) ( not ( = ?auto_26047 ?auto_26051 ) ) ( not ( = ?auto_26047 ?auto_26095 ) ) ( not ( = ?auto_26050 ?auto_26051 ) ) ( not ( = ?auto_26050 ?auto_26095 ) ) ( not ( = ?auto_26048 ?auto_26051 ) ) ( not ( = ?auto_26048 ?auto_26095 ) ) ( not ( = ?auto_26051 ?auto_26070 ) ) ( not ( = ?auto_26051 ?auto_26099 ) ) ( not ( = ?auto_26051 ?auto_26069 ) ) ( not ( = ?auto_26051 ?auto_26080 ) ) ( not ( = ?auto_26051 ?auto_26077 ) ) ( not ( = ?auto_26051 ?auto_26090 ) ) ( not ( = ?auto_26051 ?auto_26084 ) ) ( not ( = ?auto_26067 ?auto_26082 ) ) ( not ( = ?auto_26067 ?auto_26098 ) ) ( not ( = ?auto_26067 ?auto_26096 ) ) ( not ( = ?auto_26067 ?auto_26097 ) ) ( not ( = ?auto_26067 ?auto_26065 ) ) ( not ( = ?auto_26067 ?auto_26085 ) ) ( not ( = ?auto_26093 ?auto_26094 ) ) ( not ( = ?auto_26093 ?auto_26092 ) ) ( not ( = ?auto_26093 ?auto_26086 ) ) ( not ( = ?auto_26093 ?auto_26078 ) ) ( not ( = ?auto_26093 ?auto_26075 ) ) ( not ( = ?auto_26093 ?auto_26091 ) ) ( not ( = ?auto_26095 ?auto_26070 ) ) ( not ( = ?auto_26095 ?auto_26099 ) ) ( not ( = ?auto_26095 ?auto_26069 ) ) ( not ( = ?auto_26095 ?auto_26080 ) ) ( not ( = ?auto_26095 ?auto_26077 ) ) ( not ( = ?auto_26095 ?auto_26090 ) ) ( not ( = ?auto_26095 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26049 ) ) ( not ( = ?auto_26043 ?auto_26066 ) ) ( not ( = ?auto_26044 ?auto_26049 ) ) ( not ( = ?auto_26044 ?auto_26066 ) ) ( not ( = ?auto_26045 ?auto_26049 ) ) ( not ( = ?auto_26045 ?auto_26066 ) ) ( not ( = ?auto_26046 ?auto_26049 ) ) ( not ( = ?auto_26046 ?auto_26066 ) ) ( not ( = ?auto_26047 ?auto_26049 ) ) ( not ( = ?auto_26047 ?auto_26066 ) ) ( not ( = ?auto_26050 ?auto_26049 ) ) ( not ( = ?auto_26050 ?auto_26066 ) ) ( not ( = ?auto_26048 ?auto_26049 ) ) ( not ( = ?auto_26048 ?auto_26066 ) ) ( not ( = ?auto_26052 ?auto_26049 ) ) ( not ( = ?auto_26052 ?auto_26066 ) ) ( not ( = ?auto_26049 ?auto_26095 ) ) ( not ( = ?auto_26049 ?auto_26070 ) ) ( not ( = ?auto_26049 ?auto_26099 ) ) ( not ( = ?auto_26049 ?auto_26069 ) ) ( not ( = ?auto_26049 ?auto_26080 ) ) ( not ( = ?auto_26049 ?auto_26077 ) ) ( not ( = ?auto_26049 ?auto_26090 ) ) ( not ( = ?auto_26049 ?auto_26084 ) ) ( not ( = ?auto_26074 ?auto_26067 ) ) ( not ( = ?auto_26074 ?auto_26082 ) ) ( not ( = ?auto_26074 ?auto_26098 ) ) ( not ( = ?auto_26074 ?auto_26096 ) ) ( not ( = ?auto_26074 ?auto_26097 ) ) ( not ( = ?auto_26074 ?auto_26065 ) ) ( not ( = ?auto_26074 ?auto_26085 ) ) ( not ( = ?auto_26071 ?auto_26093 ) ) ( not ( = ?auto_26071 ?auto_26094 ) ) ( not ( = ?auto_26071 ?auto_26092 ) ) ( not ( = ?auto_26071 ?auto_26086 ) ) ( not ( = ?auto_26071 ?auto_26078 ) ) ( not ( = ?auto_26071 ?auto_26075 ) ) ( not ( = ?auto_26071 ?auto_26091 ) ) ( not ( = ?auto_26066 ?auto_26095 ) ) ( not ( = ?auto_26066 ?auto_26070 ) ) ( not ( = ?auto_26066 ?auto_26099 ) ) ( not ( = ?auto_26066 ?auto_26069 ) ) ( not ( = ?auto_26066 ?auto_26080 ) ) ( not ( = ?auto_26066 ?auto_26077 ) ) ( not ( = ?auto_26066 ?auto_26090 ) ) ( not ( = ?auto_26066 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26054 ) ) ( not ( = ?auto_26043 ?auto_26083 ) ) ( not ( = ?auto_26044 ?auto_26054 ) ) ( not ( = ?auto_26044 ?auto_26083 ) ) ( not ( = ?auto_26045 ?auto_26054 ) ) ( not ( = ?auto_26045 ?auto_26083 ) ) ( not ( = ?auto_26046 ?auto_26054 ) ) ( not ( = ?auto_26046 ?auto_26083 ) ) ( not ( = ?auto_26047 ?auto_26054 ) ) ( not ( = ?auto_26047 ?auto_26083 ) ) ( not ( = ?auto_26050 ?auto_26054 ) ) ( not ( = ?auto_26050 ?auto_26083 ) ) ( not ( = ?auto_26048 ?auto_26054 ) ) ( not ( = ?auto_26048 ?auto_26083 ) ) ( not ( = ?auto_26052 ?auto_26054 ) ) ( not ( = ?auto_26052 ?auto_26083 ) ) ( not ( = ?auto_26051 ?auto_26054 ) ) ( not ( = ?auto_26051 ?auto_26083 ) ) ( not ( = ?auto_26054 ?auto_26066 ) ) ( not ( = ?auto_26054 ?auto_26095 ) ) ( not ( = ?auto_26054 ?auto_26070 ) ) ( not ( = ?auto_26054 ?auto_26099 ) ) ( not ( = ?auto_26054 ?auto_26069 ) ) ( not ( = ?auto_26054 ?auto_26080 ) ) ( not ( = ?auto_26054 ?auto_26077 ) ) ( not ( = ?auto_26054 ?auto_26090 ) ) ( not ( = ?auto_26054 ?auto_26084 ) ) ( not ( = ?auto_26087 ?auto_26074 ) ) ( not ( = ?auto_26087 ?auto_26067 ) ) ( not ( = ?auto_26087 ?auto_26082 ) ) ( not ( = ?auto_26087 ?auto_26098 ) ) ( not ( = ?auto_26087 ?auto_26096 ) ) ( not ( = ?auto_26087 ?auto_26097 ) ) ( not ( = ?auto_26087 ?auto_26065 ) ) ( not ( = ?auto_26087 ?auto_26085 ) ) ( not ( = ?auto_26073 ?auto_26071 ) ) ( not ( = ?auto_26073 ?auto_26093 ) ) ( not ( = ?auto_26073 ?auto_26094 ) ) ( not ( = ?auto_26073 ?auto_26092 ) ) ( not ( = ?auto_26073 ?auto_26086 ) ) ( not ( = ?auto_26073 ?auto_26078 ) ) ( not ( = ?auto_26073 ?auto_26075 ) ) ( not ( = ?auto_26073 ?auto_26091 ) ) ( not ( = ?auto_26083 ?auto_26066 ) ) ( not ( = ?auto_26083 ?auto_26095 ) ) ( not ( = ?auto_26083 ?auto_26070 ) ) ( not ( = ?auto_26083 ?auto_26099 ) ) ( not ( = ?auto_26083 ?auto_26069 ) ) ( not ( = ?auto_26083 ?auto_26080 ) ) ( not ( = ?auto_26083 ?auto_26077 ) ) ( not ( = ?auto_26083 ?auto_26090 ) ) ( not ( = ?auto_26083 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26053 ) ) ( not ( = ?auto_26043 ?auto_26076 ) ) ( not ( = ?auto_26044 ?auto_26053 ) ) ( not ( = ?auto_26044 ?auto_26076 ) ) ( not ( = ?auto_26045 ?auto_26053 ) ) ( not ( = ?auto_26045 ?auto_26076 ) ) ( not ( = ?auto_26046 ?auto_26053 ) ) ( not ( = ?auto_26046 ?auto_26076 ) ) ( not ( = ?auto_26047 ?auto_26053 ) ) ( not ( = ?auto_26047 ?auto_26076 ) ) ( not ( = ?auto_26050 ?auto_26053 ) ) ( not ( = ?auto_26050 ?auto_26076 ) ) ( not ( = ?auto_26048 ?auto_26053 ) ) ( not ( = ?auto_26048 ?auto_26076 ) ) ( not ( = ?auto_26052 ?auto_26053 ) ) ( not ( = ?auto_26052 ?auto_26076 ) ) ( not ( = ?auto_26051 ?auto_26053 ) ) ( not ( = ?auto_26051 ?auto_26076 ) ) ( not ( = ?auto_26049 ?auto_26053 ) ) ( not ( = ?auto_26049 ?auto_26076 ) ) ( not ( = ?auto_26053 ?auto_26083 ) ) ( not ( = ?auto_26053 ?auto_26066 ) ) ( not ( = ?auto_26053 ?auto_26095 ) ) ( not ( = ?auto_26053 ?auto_26070 ) ) ( not ( = ?auto_26053 ?auto_26099 ) ) ( not ( = ?auto_26053 ?auto_26069 ) ) ( not ( = ?auto_26053 ?auto_26080 ) ) ( not ( = ?auto_26053 ?auto_26077 ) ) ( not ( = ?auto_26053 ?auto_26090 ) ) ( not ( = ?auto_26053 ?auto_26084 ) ) ( not ( = ?auto_26081 ?auto_26087 ) ) ( not ( = ?auto_26081 ?auto_26074 ) ) ( not ( = ?auto_26081 ?auto_26067 ) ) ( not ( = ?auto_26081 ?auto_26082 ) ) ( not ( = ?auto_26081 ?auto_26098 ) ) ( not ( = ?auto_26081 ?auto_26096 ) ) ( not ( = ?auto_26081 ?auto_26097 ) ) ( not ( = ?auto_26081 ?auto_26065 ) ) ( not ( = ?auto_26081 ?auto_26085 ) ) ( not ( = ?auto_26100 ?auto_26073 ) ) ( not ( = ?auto_26100 ?auto_26071 ) ) ( not ( = ?auto_26100 ?auto_26093 ) ) ( not ( = ?auto_26100 ?auto_26094 ) ) ( not ( = ?auto_26100 ?auto_26092 ) ) ( not ( = ?auto_26100 ?auto_26086 ) ) ( not ( = ?auto_26100 ?auto_26078 ) ) ( not ( = ?auto_26100 ?auto_26075 ) ) ( not ( = ?auto_26100 ?auto_26091 ) ) ( not ( = ?auto_26076 ?auto_26083 ) ) ( not ( = ?auto_26076 ?auto_26066 ) ) ( not ( = ?auto_26076 ?auto_26095 ) ) ( not ( = ?auto_26076 ?auto_26070 ) ) ( not ( = ?auto_26076 ?auto_26099 ) ) ( not ( = ?auto_26076 ?auto_26069 ) ) ( not ( = ?auto_26076 ?auto_26080 ) ) ( not ( = ?auto_26076 ?auto_26077 ) ) ( not ( = ?auto_26076 ?auto_26090 ) ) ( not ( = ?auto_26076 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26055 ) ) ( not ( = ?auto_26043 ?auto_26068 ) ) ( not ( = ?auto_26044 ?auto_26055 ) ) ( not ( = ?auto_26044 ?auto_26068 ) ) ( not ( = ?auto_26045 ?auto_26055 ) ) ( not ( = ?auto_26045 ?auto_26068 ) ) ( not ( = ?auto_26046 ?auto_26055 ) ) ( not ( = ?auto_26046 ?auto_26068 ) ) ( not ( = ?auto_26047 ?auto_26055 ) ) ( not ( = ?auto_26047 ?auto_26068 ) ) ( not ( = ?auto_26050 ?auto_26055 ) ) ( not ( = ?auto_26050 ?auto_26068 ) ) ( not ( = ?auto_26048 ?auto_26055 ) ) ( not ( = ?auto_26048 ?auto_26068 ) ) ( not ( = ?auto_26052 ?auto_26055 ) ) ( not ( = ?auto_26052 ?auto_26068 ) ) ( not ( = ?auto_26051 ?auto_26055 ) ) ( not ( = ?auto_26051 ?auto_26068 ) ) ( not ( = ?auto_26049 ?auto_26055 ) ) ( not ( = ?auto_26049 ?auto_26068 ) ) ( not ( = ?auto_26054 ?auto_26055 ) ) ( not ( = ?auto_26054 ?auto_26068 ) ) ( not ( = ?auto_26055 ?auto_26076 ) ) ( not ( = ?auto_26055 ?auto_26083 ) ) ( not ( = ?auto_26055 ?auto_26066 ) ) ( not ( = ?auto_26055 ?auto_26095 ) ) ( not ( = ?auto_26055 ?auto_26070 ) ) ( not ( = ?auto_26055 ?auto_26099 ) ) ( not ( = ?auto_26055 ?auto_26069 ) ) ( not ( = ?auto_26055 ?auto_26080 ) ) ( not ( = ?auto_26055 ?auto_26077 ) ) ( not ( = ?auto_26055 ?auto_26090 ) ) ( not ( = ?auto_26055 ?auto_26084 ) ) ( not ( = ?auto_26068 ?auto_26076 ) ) ( not ( = ?auto_26068 ?auto_26083 ) ) ( not ( = ?auto_26068 ?auto_26066 ) ) ( not ( = ?auto_26068 ?auto_26095 ) ) ( not ( = ?auto_26068 ?auto_26070 ) ) ( not ( = ?auto_26068 ?auto_26099 ) ) ( not ( = ?auto_26068 ?auto_26069 ) ) ( not ( = ?auto_26068 ?auto_26080 ) ) ( not ( = ?auto_26068 ?auto_26077 ) ) ( not ( = ?auto_26068 ?auto_26090 ) ) ( not ( = ?auto_26068 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26057 ) ) ( not ( = ?auto_26043 ?auto_26089 ) ) ( not ( = ?auto_26044 ?auto_26057 ) ) ( not ( = ?auto_26044 ?auto_26089 ) ) ( not ( = ?auto_26045 ?auto_26057 ) ) ( not ( = ?auto_26045 ?auto_26089 ) ) ( not ( = ?auto_26046 ?auto_26057 ) ) ( not ( = ?auto_26046 ?auto_26089 ) ) ( not ( = ?auto_26047 ?auto_26057 ) ) ( not ( = ?auto_26047 ?auto_26089 ) ) ( not ( = ?auto_26050 ?auto_26057 ) ) ( not ( = ?auto_26050 ?auto_26089 ) ) ( not ( = ?auto_26048 ?auto_26057 ) ) ( not ( = ?auto_26048 ?auto_26089 ) ) ( not ( = ?auto_26052 ?auto_26057 ) ) ( not ( = ?auto_26052 ?auto_26089 ) ) ( not ( = ?auto_26051 ?auto_26057 ) ) ( not ( = ?auto_26051 ?auto_26089 ) ) ( not ( = ?auto_26049 ?auto_26057 ) ) ( not ( = ?auto_26049 ?auto_26089 ) ) ( not ( = ?auto_26054 ?auto_26057 ) ) ( not ( = ?auto_26054 ?auto_26089 ) ) ( not ( = ?auto_26053 ?auto_26057 ) ) ( not ( = ?auto_26053 ?auto_26089 ) ) ( not ( = ?auto_26057 ?auto_26068 ) ) ( not ( = ?auto_26057 ?auto_26076 ) ) ( not ( = ?auto_26057 ?auto_26083 ) ) ( not ( = ?auto_26057 ?auto_26066 ) ) ( not ( = ?auto_26057 ?auto_26095 ) ) ( not ( = ?auto_26057 ?auto_26070 ) ) ( not ( = ?auto_26057 ?auto_26099 ) ) ( not ( = ?auto_26057 ?auto_26069 ) ) ( not ( = ?auto_26057 ?auto_26080 ) ) ( not ( = ?auto_26057 ?auto_26077 ) ) ( not ( = ?auto_26057 ?auto_26090 ) ) ( not ( = ?auto_26057 ?auto_26084 ) ) ( not ( = ?auto_26089 ?auto_26068 ) ) ( not ( = ?auto_26089 ?auto_26076 ) ) ( not ( = ?auto_26089 ?auto_26083 ) ) ( not ( = ?auto_26089 ?auto_26066 ) ) ( not ( = ?auto_26089 ?auto_26095 ) ) ( not ( = ?auto_26089 ?auto_26070 ) ) ( not ( = ?auto_26089 ?auto_26099 ) ) ( not ( = ?auto_26089 ?auto_26069 ) ) ( not ( = ?auto_26089 ?auto_26080 ) ) ( not ( = ?auto_26089 ?auto_26077 ) ) ( not ( = ?auto_26089 ?auto_26090 ) ) ( not ( = ?auto_26089 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26058 ) ) ( not ( = ?auto_26043 ?auto_26072 ) ) ( not ( = ?auto_26044 ?auto_26058 ) ) ( not ( = ?auto_26044 ?auto_26072 ) ) ( not ( = ?auto_26045 ?auto_26058 ) ) ( not ( = ?auto_26045 ?auto_26072 ) ) ( not ( = ?auto_26046 ?auto_26058 ) ) ( not ( = ?auto_26046 ?auto_26072 ) ) ( not ( = ?auto_26047 ?auto_26058 ) ) ( not ( = ?auto_26047 ?auto_26072 ) ) ( not ( = ?auto_26050 ?auto_26058 ) ) ( not ( = ?auto_26050 ?auto_26072 ) ) ( not ( = ?auto_26048 ?auto_26058 ) ) ( not ( = ?auto_26048 ?auto_26072 ) ) ( not ( = ?auto_26052 ?auto_26058 ) ) ( not ( = ?auto_26052 ?auto_26072 ) ) ( not ( = ?auto_26051 ?auto_26058 ) ) ( not ( = ?auto_26051 ?auto_26072 ) ) ( not ( = ?auto_26049 ?auto_26058 ) ) ( not ( = ?auto_26049 ?auto_26072 ) ) ( not ( = ?auto_26054 ?auto_26058 ) ) ( not ( = ?auto_26054 ?auto_26072 ) ) ( not ( = ?auto_26053 ?auto_26058 ) ) ( not ( = ?auto_26053 ?auto_26072 ) ) ( not ( = ?auto_26055 ?auto_26058 ) ) ( not ( = ?auto_26055 ?auto_26072 ) ) ( not ( = ?auto_26058 ?auto_26089 ) ) ( not ( = ?auto_26058 ?auto_26068 ) ) ( not ( = ?auto_26058 ?auto_26076 ) ) ( not ( = ?auto_26058 ?auto_26083 ) ) ( not ( = ?auto_26058 ?auto_26066 ) ) ( not ( = ?auto_26058 ?auto_26095 ) ) ( not ( = ?auto_26058 ?auto_26070 ) ) ( not ( = ?auto_26058 ?auto_26099 ) ) ( not ( = ?auto_26058 ?auto_26069 ) ) ( not ( = ?auto_26058 ?auto_26080 ) ) ( not ( = ?auto_26058 ?auto_26077 ) ) ( not ( = ?auto_26058 ?auto_26090 ) ) ( not ( = ?auto_26058 ?auto_26084 ) ) ( not ( = ?auto_26088 ?auto_26096 ) ) ( not ( = ?auto_26088 ?auto_26087 ) ) ( not ( = ?auto_26088 ?auto_26081 ) ) ( not ( = ?auto_26088 ?auto_26074 ) ) ( not ( = ?auto_26088 ?auto_26067 ) ) ( not ( = ?auto_26088 ?auto_26082 ) ) ( not ( = ?auto_26088 ?auto_26098 ) ) ( not ( = ?auto_26088 ?auto_26097 ) ) ( not ( = ?auto_26088 ?auto_26065 ) ) ( not ( = ?auto_26088 ?auto_26085 ) ) ( not ( = ?auto_26079 ?auto_26086 ) ) ( not ( = ?auto_26079 ?auto_26073 ) ) ( not ( = ?auto_26079 ?auto_26100 ) ) ( not ( = ?auto_26079 ?auto_26071 ) ) ( not ( = ?auto_26079 ?auto_26093 ) ) ( not ( = ?auto_26079 ?auto_26094 ) ) ( not ( = ?auto_26079 ?auto_26092 ) ) ( not ( = ?auto_26079 ?auto_26078 ) ) ( not ( = ?auto_26079 ?auto_26075 ) ) ( not ( = ?auto_26079 ?auto_26091 ) ) ( not ( = ?auto_26072 ?auto_26089 ) ) ( not ( = ?auto_26072 ?auto_26068 ) ) ( not ( = ?auto_26072 ?auto_26076 ) ) ( not ( = ?auto_26072 ?auto_26083 ) ) ( not ( = ?auto_26072 ?auto_26066 ) ) ( not ( = ?auto_26072 ?auto_26095 ) ) ( not ( = ?auto_26072 ?auto_26070 ) ) ( not ( = ?auto_26072 ?auto_26099 ) ) ( not ( = ?auto_26072 ?auto_26069 ) ) ( not ( = ?auto_26072 ?auto_26080 ) ) ( not ( = ?auto_26072 ?auto_26077 ) ) ( not ( = ?auto_26072 ?auto_26090 ) ) ( not ( = ?auto_26072 ?auto_26084 ) ) ( not ( = ?auto_26043 ?auto_26056 ) ) ( not ( = ?auto_26043 ?auto_26061 ) ) ( not ( = ?auto_26044 ?auto_26056 ) ) ( not ( = ?auto_26044 ?auto_26061 ) ) ( not ( = ?auto_26045 ?auto_26056 ) ) ( not ( = ?auto_26045 ?auto_26061 ) ) ( not ( = ?auto_26046 ?auto_26056 ) ) ( not ( = ?auto_26046 ?auto_26061 ) ) ( not ( = ?auto_26047 ?auto_26056 ) ) ( not ( = ?auto_26047 ?auto_26061 ) ) ( not ( = ?auto_26050 ?auto_26056 ) ) ( not ( = ?auto_26050 ?auto_26061 ) ) ( not ( = ?auto_26048 ?auto_26056 ) ) ( not ( = ?auto_26048 ?auto_26061 ) ) ( not ( = ?auto_26052 ?auto_26056 ) ) ( not ( = ?auto_26052 ?auto_26061 ) ) ( not ( = ?auto_26051 ?auto_26056 ) ) ( not ( = ?auto_26051 ?auto_26061 ) ) ( not ( = ?auto_26049 ?auto_26056 ) ) ( not ( = ?auto_26049 ?auto_26061 ) ) ( not ( = ?auto_26054 ?auto_26056 ) ) ( not ( = ?auto_26054 ?auto_26061 ) ) ( not ( = ?auto_26053 ?auto_26056 ) ) ( not ( = ?auto_26053 ?auto_26061 ) ) ( not ( = ?auto_26055 ?auto_26056 ) ) ( not ( = ?auto_26055 ?auto_26061 ) ) ( not ( = ?auto_26057 ?auto_26056 ) ) ( not ( = ?auto_26057 ?auto_26061 ) ) ( not ( = ?auto_26056 ?auto_26072 ) ) ( not ( = ?auto_26056 ?auto_26089 ) ) ( not ( = ?auto_26056 ?auto_26068 ) ) ( not ( = ?auto_26056 ?auto_26076 ) ) ( not ( = ?auto_26056 ?auto_26083 ) ) ( not ( = ?auto_26056 ?auto_26066 ) ) ( not ( = ?auto_26056 ?auto_26095 ) ) ( not ( = ?auto_26056 ?auto_26070 ) ) ( not ( = ?auto_26056 ?auto_26099 ) ) ( not ( = ?auto_26056 ?auto_26069 ) ) ( not ( = ?auto_26056 ?auto_26080 ) ) ( not ( = ?auto_26056 ?auto_26077 ) ) ( not ( = ?auto_26056 ?auto_26090 ) ) ( not ( = ?auto_26056 ?auto_26084 ) ) ( not ( = ?auto_26064 ?auto_26088 ) ) ( not ( = ?auto_26064 ?auto_26096 ) ) ( not ( = ?auto_26064 ?auto_26087 ) ) ( not ( = ?auto_26064 ?auto_26081 ) ) ( not ( = ?auto_26064 ?auto_26074 ) ) ( not ( = ?auto_26064 ?auto_26067 ) ) ( not ( = ?auto_26064 ?auto_26082 ) ) ( not ( = ?auto_26064 ?auto_26098 ) ) ( not ( = ?auto_26064 ?auto_26097 ) ) ( not ( = ?auto_26064 ?auto_26065 ) ) ( not ( = ?auto_26064 ?auto_26085 ) ) ( not ( = ?auto_26059 ?auto_26079 ) ) ( not ( = ?auto_26059 ?auto_26086 ) ) ( not ( = ?auto_26059 ?auto_26073 ) ) ( not ( = ?auto_26059 ?auto_26100 ) ) ( not ( = ?auto_26059 ?auto_26071 ) ) ( not ( = ?auto_26059 ?auto_26093 ) ) ( not ( = ?auto_26059 ?auto_26094 ) ) ( not ( = ?auto_26059 ?auto_26092 ) ) ( not ( = ?auto_26059 ?auto_26078 ) ) ( not ( = ?auto_26059 ?auto_26075 ) ) ( not ( = ?auto_26059 ?auto_26091 ) ) ( not ( = ?auto_26061 ?auto_26072 ) ) ( not ( = ?auto_26061 ?auto_26089 ) ) ( not ( = ?auto_26061 ?auto_26068 ) ) ( not ( = ?auto_26061 ?auto_26076 ) ) ( not ( = ?auto_26061 ?auto_26083 ) ) ( not ( = ?auto_26061 ?auto_26066 ) ) ( not ( = ?auto_26061 ?auto_26095 ) ) ( not ( = ?auto_26061 ?auto_26070 ) ) ( not ( = ?auto_26061 ?auto_26099 ) ) ( not ( = ?auto_26061 ?auto_26069 ) ) ( not ( = ?auto_26061 ?auto_26080 ) ) ( not ( = ?auto_26061 ?auto_26077 ) ) ( not ( = ?auto_26061 ?auto_26090 ) ) ( not ( = ?auto_26061 ?auto_26084 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_26043 ?auto_26044 ?auto_26045 ?auto_26046 ?auto_26047 ?auto_26050 ?auto_26048 ?auto_26052 ?auto_26051 ?auto_26049 ?auto_26054 ?auto_26053 ?auto_26055 ?auto_26057 ?auto_26058 )
      ( MAKE-1CRATE ?auto_26058 ?auto_26056 )
      ( MAKE-15CRATE-VERIFY ?auto_26043 ?auto_26044 ?auto_26045 ?auto_26046 ?auto_26047 ?auto_26050 ?auto_26048 ?auto_26052 ?auto_26051 ?auto_26049 ?auto_26054 ?auto_26053 ?auto_26055 ?auto_26057 ?auto_26058 ?auto_26056 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26103 - SURFACE
      ?auto_26104 - SURFACE
    )
    :vars
    (
      ?auto_26105 - HOIST
      ?auto_26106 - PLACE
      ?auto_26108 - PLACE
      ?auto_26109 - HOIST
      ?auto_26110 - SURFACE
      ?auto_26107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26105 ?auto_26106 ) ( SURFACE-AT ?auto_26103 ?auto_26106 ) ( CLEAR ?auto_26103 ) ( IS-CRATE ?auto_26104 ) ( AVAILABLE ?auto_26105 ) ( not ( = ?auto_26108 ?auto_26106 ) ) ( HOIST-AT ?auto_26109 ?auto_26108 ) ( AVAILABLE ?auto_26109 ) ( SURFACE-AT ?auto_26104 ?auto_26108 ) ( ON ?auto_26104 ?auto_26110 ) ( CLEAR ?auto_26104 ) ( TRUCK-AT ?auto_26107 ?auto_26106 ) ( not ( = ?auto_26103 ?auto_26104 ) ) ( not ( = ?auto_26103 ?auto_26110 ) ) ( not ( = ?auto_26104 ?auto_26110 ) ) ( not ( = ?auto_26105 ?auto_26109 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26107 ?auto_26106 ?auto_26108 )
      ( !LIFT ?auto_26109 ?auto_26104 ?auto_26110 ?auto_26108 )
      ( !LOAD ?auto_26109 ?auto_26104 ?auto_26107 ?auto_26108 )
      ( !DRIVE ?auto_26107 ?auto_26108 ?auto_26106 )
      ( !UNLOAD ?auto_26105 ?auto_26104 ?auto_26107 ?auto_26106 )
      ( !DROP ?auto_26105 ?auto_26104 ?auto_26103 ?auto_26106 )
      ( MAKE-1CRATE-VERIFY ?auto_26103 ?auto_26104 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_26128 - SURFACE
      ?auto_26129 - SURFACE
      ?auto_26130 - SURFACE
      ?auto_26131 - SURFACE
      ?auto_26132 - SURFACE
      ?auto_26135 - SURFACE
      ?auto_26133 - SURFACE
      ?auto_26137 - SURFACE
      ?auto_26136 - SURFACE
      ?auto_26134 - SURFACE
      ?auto_26139 - SURFACE
      ?auto_26138 - SURFACE
      ?auto_26140 - SURFACE
      ?auto_26142 - SURFACE
      ?auto_26143 - SURFACE
      ?auto_26141 - SURFACE
      ?auto_26144 - SURFACE
    )
    :vars
    (
      ?auto_26150 - HOIST
      ?auto_26145 - PLACE
      ?auto_26147 - PLACE
      ?auto_26149 - HOIST
      ?auto_26146 - SURFACE
      ?auto_26151 - PLACE
      ?auto_26171 - HOIST
      ?auto_26186 - SURFACE
      ?auto_26184 - PLACE
      ?auto_26158 - HOIST
      ?auto_26165 - SURFACE
      ?auto_26181 - PLACE
      ?auto_26177 - HOIST
      ?auto_26172 - SURFACE
      ?auto_26187 - PLACE
      ?auto_26163 - HOIST
      ?auto_26183 - SURFACE
      ?auto_26155 - PLACE
      ?auto_26168 - HOIST
      ?auto_26185 - SURFACE
      ?auto_26152 - SURFACE
      ?auto_26162 - SURFACE
      ?auto_26167 - PLACE
      ?auto_26154 - HOIST
      ?auto_26178 - SURFACE
      ?auto_26174 - PLACE
      ?auto_26159 - HOIST
      ?auto_26166 - SURFACE
      ?auto_26157 - PLACE
      ?auto_26169 - HOIST
      ?auto_26173 - SURFACE
      ?auto_26176 - SURFACE
      ?auto_26182 - PLACE
      ?auto_26180 - HOIST
      ?auto_26179 - SURFACE
      ?auto_26153 - PLACE
      ?auto_26161 - HOIST
      ?auto_26156 - SURFACE
      ?auto_26160 - PLACE
      ?auto_26175 - HOIST
      ?auto_26170 - SURFACE
      ?auto_26164 - SURFACE
      ?auto_26148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26150 ?auto_26145 ) ( IS-CRATE ?auto_26144 ) ( not ( = ?auto_26147 ?auto_26145 ) ) ( HOIST-AT ?auto_26149 ?auto_26147 ) ( SURFACE-AT ?auto_26144 ?auto_26147 ) ( ON ?auto_26144 ?auto_26146 ) ( CLEAR ?auto_26144 ) ( not ( = ?auto_26141 ?auto_26144 ) ) ( not ( = ?auto_26141 ?auto_26146 ) ) ( not ( = ?auto_26144 ?auto_26146 ) ) ( not ( = ?auto_26150 ?auto_26149 ) ) ( IS-CRATE ?auto_26141 ) ( not ( = ?auto_26151 ?auto_26145 ) ) ( HOIST-AT ?auto_26171 ?auto_26151 ) ( AVAILABLE ?auto_26171 ) ( SURFACE-AT ?auto_26141 ?auto_26151 ) ( ON ?auto_26141 ?auto_26186 ) ( CLEAR ?auto_26141 ) ( not ( = ?auto_26143 ?auto_26141 ) ) ( not ( = ?auto_26143 ?auto_26186 ) ) ( not ( = ?auto_26141 ?auto_26186 ) ) ( not ( = ?auto_26150 ?auto_26171 ) ) ( IS-CRATE ?auto_26143 ) ( not ( = ?auto_26184 ?auto_26145 ) ) ( HOIST-AT ?auto_26158 ?auto_26184 ) ( AVAILABLE ?auto_26158 ) ( SURFACE-AT ?auto_26143 ?auto_26184 ) ( ON ?auto_26143 ?auto_26165 ) ( CLEAR ?auto_26143 ) ( not ( = ?auto_26142 ?auto_26143 ) ) ( not ( = ?auto_26142 ?auto_26165 ) ) ( not ( = ?auto_26143 ?auto_26165 ) ) ( not ( = ?auto_26150 ?auto_26158 ) ) ( IS-CRATE ?auto_26142 ) ( not ( = ?auto_26181 ?auto_26145 ) ) ( HOIST-AT ?auto_26177 ?auto_26181 ) ( SURFACE-AT ?auto_26142 ?auto_26181 ) ( ON ?auto_26142 ?auto_26172 ) ( CLEAR ?auto_26142 ) ( not ( = ?auto_26140 ?auto_26142 ) ) ( not ( = ?auto_26140 ?auto_26172 ) ) ( not ( = ?auto_26142 ?auto_26172 ) ) ( not ( = ?auto_26150 ?auto_26177 ) ) ( IS-CRATE ?auto_26140 ) ( not ( = ?auto_26187 ?auto_26145 ) ) ( HOIST-AT ?auto_26163 ?auto_26187 ) ( SURFACE-AT ?auto_26140 ?auto_26187 ) ( ON ?auto_26140 ?auto_26183 ) ( CLEAR ?auto_26140 ) ( not ( = ?auto_26138 ?auto_26140 ) ) ( not ( = ?auto_26138 ?auto_26183 ) ) ( not ( = ?auto_26140 ?auto_26183 ) ) ( not ( = ?auto_26150 ?auto_26163 ) ) ( IS-CRATE ?auto_26138 ) ( not ( = ?auto_26155 ?auto_26145 ) ) ( HOIST-AT ?auto_26168 ?auto_26155 ) ( AVAILABLE ?auto_26168 ) ( SURFACE-AT ?auto_26138 ?auto_26155 ) ( ON ?auto_26138 ?auto_26185 ) ( CLEAR ?auto_26138 ) ( not ( = ?auto_26139 ?auto_26138 ) ) ( not ( = ?auto_26139 ?auto_26185 ) ) ( not ( = ?auto_26138 ?auto_26185 ) ) ( not ( = ?auto_26150 ?auto_26168 ) ) ( IS-CRATE ?auto_26139 ) ( AVAILABLE ?auto_26163 ) ( SURFACE-AT ?auto_26139 ?auto_26187 ) ( ON ?auto_26139 ?auto_26152 ) ( CLEAR ?auto_26139 ) ( not ( = ?auto_26134 ?auto_26139 ) ) ( not ( = ?auto_26134 ?auto_26152 ) ) ( not ( = ?auto_26139 ?auto_26152 ) ) ( IS-CRATE ?auto_26134 ) ( AVAILABLE ?auto_26149 ) ( SURFACE-AT ?auto_26134 ?auto_26147 ) ( ON ?auto_26134 ?auto_26162 ) ( CLEAR ?auto_26134 ) ( not ( = ?auto_26136 ?auto_26134 ) ) ( not ( = ?auto_26136 ?auto_26162 ) ) ( not ( = ?auto_26134 ?auto_26162 ) ) ( IS-CRATE ?auto_26136 ) ( not ( = ?auto_26167 ?auto_26145 ) ) ( HOIST-AT ?auto_26154 ?auto_26167 ) ( AVAILABLE ?auto_26154 ) ( SURFACE-AT ?auto_26136 ?auto_26167 ) ( ON ?auto_26136 ?auto_26178 ) ( CLEAR ?auto_26136 ) ( not ( = ?auto_26137 ?auto_26136 ) ) ( not ( = ?auto_26137 ?auto_26178 ) ) ( not ( = ?auto_26136 ?auto_26178 ) ) ( not ( = ?auto_26150 ?auto_26154 ) ) ( IS-CRATE ?auto_26137 ) ( not ( = ?auto_26174 ?auto_26145 ) ) ( HOIST-AT ?auto_26159 ?auto_26174 ) ( AVAILABLE ?auto_26159 ) ( SURFACE-AT ?auto_26137 ?auto_26174 ) ( ON ?auto_26137 ?auto_26166 ) ( CLEAR ?auto_26137 ) ( not ( = ?auto_26133 ?auto_26137 ) ) ( not ( = ?auto_26133 ?auto_26166 ) ) ( not ( = ?auto_26137 ?auto_26166 ) ) ( not ( = ?auto_26150 ?auto_26159 ) ) ( IS-CRATE ?auto_26133 ) ( not ( = ?auto_26157 ?auto_26145 ) ) ( HOIST-AT ?auto_26169 ?auto_26157 ) ( AVAILABLE ?auto_26169 ) ( SURFACE-AT ?auto_26133 ?auto_26157 ) ( ON ?auto_26133 ?auto_26173 ) ( CLEAR ?auto_26133 ) ( not ( = ?auto_26135 ?auto_26133 ) ) ( not ( = ?auto_26135 ?auto_26173 ) ) ( not ( = ?auto_26133 ?auto_26173 ) ) ( not ( = ?auto_26150 ?auto_26169 ) ) ( IS-CRATE ?auto_26135 ) ( AVAILABLE ?auto_26177 ) ( SURFACE-AT ?auto_26135 ?auto_26181 ) ( ON ?auto_26135 ?auto_26176 ) ( CLEAR ?auto_26135 ) ( not ( = ?auto_26132 ?auto_26135 ) ) ( not ( = ?auto_26132 ?auto_26176 ) ) ( not ( = ?auto_26135 ?auto_26176 ) ) ( IS-CRATE ?auto_26132 ) ( not ( = ?auto_26182 ?auto_26145 ) ) ( HOIST-AT ?auto_26180 ?auto_26182 ) ( SURFACE-AT ?auto_26132 ?auto_26182 ) ( ON ?auto_26132 ?auto_26179 ) ( CLEAR ?auto_26132 ) ( not ( = ?auto_26131 ?auto_26132 ) ) ( not ( = ?auto_26131 ?auto_26179 ) ) ( not ( = ?auto_26132 ?auto_26179 ) ) ( not ( = ?auto_26150 ?auto_26180 ) ) ( IS-CRATE ?auto_26131 ) ( not ( = ?auto_26153 ?auto_26145 ) ) ( HOIST-AT ?auto_26161 ?auto_26153 ) ( AVAILABLE ?auto_26161 ) ( SURFACE-AT ?auto_26131 ?auto_26153 ) ( ON ?auto_26131 ?auto_26156 ) ( CLEAR ?auto_26131 ) ( not ( = ?auto_26130 ?auto_26131 ) ) ( not ( = ?auto_26130 ?auto_26156 ) ) ( not ( = ?auto_26131 ?auto_26156 ) ) ( not ( = ?auto_26150 ?auto_26161 ) ) ( IS-CRATE ?auto_26130 ) ( not ( = ?auto_26160 ?auto_26145 ) ) ( HOIST-AT ?auto_26175 ?auto_26160 ) ( AVAILABLE ?auto_26175 ) ( SURFACE-AT ?auto_26130 ?auto_26160 ) ( ON ?auto_26130 ?auto_26170 ) ( CLEAR ?auto_26130 ) ( not ( = ?auto_26129 ?auto_26130 ) ) ( not ( = ?auto_26129 ?auto_26170 ) ) ( not ( = ?auto_26130 ?auto_26170 ) ) ( not ( = ?auto_26150 ?auto_26175 ) ) ( SURFACE-AT ?auto_26128 ?auto_26145 ) ( CLEAR ?auto_26128 ) ( IS-CRATE ?auto_26129 ) ( AVAILABLE ?auto_26150 ) ( AVAILABLE ?auto_26180 ) ( SURFACE-AT ?auto_26129 ?auto_26182 ) ( ON ?auto_26129 ?auto_26164 ) ( CLEAR ?auto_26129 ) ( TRUCK-AT ?auto_26148 ?auto_26145 ) ( not ( = ?auto_26128 ?auto_26129 ) ) ( not ( = ?auto_26128 ?auto_26164 ) ) ( not ( = ?auto_26129 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26130 ) ) ( not ( = ?auto_26128 ?auto_26170 ) ) ( not ( = ?auto_26130 ?auto_26164 ) ) ( not ( = ?auto_26160 ?auto_26182 ) ) ( not ( = ?auto_26175 ?auto_26180 ) ) ( not ( = ?auto_26170 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26131 ) ) ( not ( = ?auto_26128 ?auto_26156 ) ) ( not ( = ?auto_26129 ?auto_26131 ) ) ( not ( = ?auto_26129 ?auto_26156 ) ) ( not ( = ?auto_26131 ?auto_26170 ) ) ( not ( = ?auto_26131 ?auto_26164 ) ) ( not ( = ?auto_26153 ?auto_26160 ) ) ( not ( = ?auto_26153 ?auto_26182 ) ) ( not ( = ?auto_26161 ?auto_26175 ) ) ( not ( = ?auto_26161 ?auto_26180 ) ) ( not ( = ?auto_26156 ?auto_26170 ) ) ( not ( = ?auto_26156 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26132 ) ) ( not ( = ?auto_26128 ?auto_26179 ) ) ( not ( = ?auto_26129 ?auto_26132 ) ) ( not ( = ?auto_26129 ?auto_26179 ) ) ( not ( = ?auto_26130 ?auto_26132 ) ) ( not ( = ?auto_26130 ?auto_26179 ) ) ( not ( = ?auto_26132 ?auto_26156 ) ) ( not ( = ?auto_26132 ?auto_26170 ) ) ( not ( = ?auto_26132 ?auto_26164 ) ) ( not ( = ?auto_26179 ?auto_26156 ) ) ( not ( = ?auto_26179 ?auto_26170 ) ) ( not ( = ?auto_26179 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26135 ) ) ( not ( = ?auto_26128 ?auto_26176 ) ) ( not ( = ?auto_26129 ?auto_26135 ) ) ( not ( = ?auto_26129 ?auto_26176 ) ) ( not ( = ?auto_26130 ?auto_26135 ) ) ( not ( = ?auto_26130 ?auto_26176 ) ) ( not ( = ?auto_26131 ?auto_26135 ) ) ( not ( = ?auto_26131 ?auto_26176 ) ) ( not ( = ?auto_26135 ?auto_26179 ) ) ( not ( = ?auto_26135 ?auto_26156 ) ) ( not ( = ?auto_26135 ?auto_26170 ) ) ( not ( = ?auto_26135 ?auto_26164 ) ) ( not ( = ?auto_26181 ?auto_26182 ) ) ( not ( = ?auto_26181 ?auto_26153 ) ) ( not ( = ?auto_26181 ?auto_26160 ) ) ( not ( = ?auto_26177 ?auto_26180 ) ) ( not ( = ?auto_26177 ?auto_26161 ) ) ( not ( = ?auto_26177 ?auto_26175 ) ) ( not ( = ?auto_26176 ?auto_26179 ) ) ( not ( = ?auto_26176 ?auto_26156 ) ) ( not ( = ?auto_26176 ?auto_26170 ) ) ( not ( = ?auto_26176 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26133 ) ) ( not ( = ?auto_26128 ?auto_26173 ) ) ( not ( = ?auto_26129 ?auto_26133 ) ) ( not ( = ?auto_26129 ?auto_26173 ) ) ( not ( = ?auto_26130 ?auto_26133 ) ) ( not ( = ?auto_26130 ?auto_26173 ) ) ( not ( = ?auto_26131 ?auto_26133 ) ) ( not ( = ?auto_26131 ?auto_26173 ) ) ( not ( = ?auto_26132 ?auto_26133 ) ) ( not ( = ?auto_26132 ?auto_26173 ) ) ( not ( = ?auto_26133 ?auto_26176 ) ) ( not ( = ?auto_26133 ?auto_26179 ) ) ( not ( = ?auto_26133 ?auto_26156 ) ) ( not ( = ?auto_26133 ?auto_26170 ) ) ( not ( = ?auto_26133 ?auto_26164 ) ) ( not ( = ?auto_26157 ?auto_26181 ) ) ( not ( = ?auto_26157 ?auto_26182 ) ) ( not ( = ?auto_26157 ?auto_26153 ) ) ( not ( = ?auto_26157 ?auto_26160 ) ) ( not ( = ?auto_26169 ?auto_26177 ) ) ( not ( = ?auto_26169 ?auto_26180 ) ) ( not ( = ?auto_26169 ?auto_26161 ) ) ( not ( = ?auto_26169 ?auto_26175 ) ) ( not ( = ?auto_26173 ?auto_26176 ) ) ( not ( = ?auto_26173 ?auto_26179 ) ) ( not ( = ?auto_26173 ?auto_26156 ) ) ( not ( = ?auto_26173 ?auto_26170 ) ) ( not ( = ?auto_26173 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26137 ) ) ( not ( = ?auto_26128 ?auto_26166 ) ) ( not ( = ?auto_26129 ?auto_26137 ) ) ( not ( = ?auto_26129 ?auto_26166 ) ) ( not ( = ?auto_26130 ?auto_26137 ) ) ( not ( = ?auto_26130 ?auto_26166 ) ) ( not ( = ?auto_26131 ?auto_26137 ) ) ( not ( = ?auto_26131 ?auto_26166 ) ) ( not ( = ?auto_26132 ?auto_26137 ) ) ( not ( = ?auto_26132 ?auto_26166 ) ) ( not ( = ?auto_26135 ?auto_26137 ) ) ( not ( = ?auto_26135 ?auto_26166 ) ) ( not ( = ?auto_26137 ?auto_26173 ) ) ( not ( = ?auto_26137 ?auto_26176 ) ) ( not ( = ?auto_26137 ?auto_26179 ) ) ( not ( = ?auto_26137 ?auto_26156 ) ) ( not ( = ?auto_26137 ?auto_26170 ) ) ( not ( = ?auto_26137 ?auto_26164 ) ) ( not ( = ?auto_26174 ?auto_26157 ) ) ( not ( = ?auto_26174 ?auto_26181 ) ) ( not ( = ?auto_26174 ?auto_26182 ) ) ( not ( = ?auto_26174 ?auto_26153 ) ) ( not ( = ?auto_26174 ?auto_26160 ) ) ( not ( = ?auto_26159 ?auto_26169 ) ) ( not ( = ?auto_26159 ?auto_26177 ) ) ( not ( = ?auto_26159 ?auto_26180 ) ) ( not ( = ?auto_26159 ?auto_26161 ) ) ( not ( = ?auto_26159 ?auto_26175 ) ) ( not ( = ?auto_26166 ?auto_26173 ) ) ( not ( = ?auto_26166 ?auto_26176 ) ) ( not ( = ?auto_26166 ?auto_26179 ) ) ( not ( = ?auto_26166 ?auto_26156 ) ) ( not ( = ?auto_26166 ?auto_26170 ) ) ( not ( = ?auto_26166 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26136 ) ) ( not ( = ?auto_26128 ?auto_26178 ) ) ( not ( = ?auto_26129 ?auto_26136 ) ) ( not ( = ?auto_26129 ?auto_26178 ) ) ( not ( = ?auto_26130 ?auto_26136 ) ) ( not ( = ?auto_26130 ?auto_26178 ) ) ( not ( = ?auto_26131 ?auto_26136 ) ) ( not ( = ?auto_26131 ?auto_26178 ) ) ( not ( = ?auto_26132 ?auto_26136 ) ) ( not ( = ?auto_26132 ?auto_26178 ) ) ( not ( = ?auto_26135 ?auto_26136 ) ) ( not ( = ?auto_26135 ?auto_26178 ) ) ( not ( = ?auto_26133 ?auto_26136 ) ) ( not ( = ?auto_26133 ?auto_26178 ) ) ( not ( = ?auto_26136 ?auto_26166 ) ) ( not ( = ?auto_26136 ?auto_26173 ) ) ( not ( = ?auto_26136 ?auto_26176 ) ) ( not ( = ?auto_26136 ?auto_26179 ) ) ( not ( = ?auto_26136 ?auto_26156 ) ) ( not ( = ?auto_26136 ?auto_26170 ) ) ( not ( = ?auto_26136 ?auto_26164 ) ) ( not ( = ?auto_26167 ?auto_26174 ) ) ( not ( = ?auto_26167 ?auto_26157 ) ) ( not ( = ?auto_26167 ?auto_26181 ) ) ( not ( = ?auto_26167 ?auto_26182 ) ) ( not ( = ?auto_26167 ?auto_26153 ) ) ( not ( = ?auto_26167 ?auto_26160 ) ) ( not ( = ?auto_26154 ?auto_26159 ) ) ( not ( = ?auto_26154 ?auto_26169 ) ) ( not ( = ?auto_26154 ?auto_26177 ) ) ( not ( = ?auto_26154 ?auto_26180 ) ) ( not ( = ?auto_26154 ?auto_26161 ) ) ( not ( = ?auto_26154 ?auto_26175 ) ) ( not ( = ?auto_26178 ?auto_26166 ) ) ( not ( = ?auto_26178 ?auto_26173 ) ) ( not ( = ?auto_26178 ?auto_26176 ) ) ( not ( = ?auto_26178 ?auto_26179 ) ) ( not ( = ?auto_26178 ?auto_26156 ) ) ( not ( = ?auto_26178 ?auto_26170 ) ) ( not ( = ?auto_26178 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26134 ) ) ( not ( = ?auto_26128 ?auto_26162 ) ) ( not ( = ?auto_26129 ?auto_26134 ) ) ( not ( = ?auto_26129 ?auto_26162 ) ) ( not ( = ?auto_26130 ?auto_26134 ) ) ( not ( = ?auto_26130 ?auto_26162 ) ) ( not ( = ?auto_26131 ?auto_26134 ) ) ( not ( = ?auto_26131 ?auto_26162 ) ) ( not ( = ?auto_26132 ?auto_26134 ) ) ( not ( = ?auto_26132 ?auto_26162 ) ) ( not ( = ?auto_26135 ?auto_26134 ) ) ( not ( = ?auto_26135 ?auto_26162 ) ) ( not ( = ?auto_26133 ?auto_26134 ) ) ( not ( = ?auto_26133 ?auto_26162 ) ) ( not ( = ?auto_26137 ?auto_26134 ) ) ( not ( = ?auto_26137 ?auto_26162 ) ) ( not ( = ?auto_26134 ?auto_26178 ) ) ( not ( = ?auto_26134 ?auto_26166 ) ) ( not ( = ?auto_26134 ?auto_26173 ) ) ( not ( = ?auto_26134 ?auto_26176 ) ) ( not ( = ?auto_26134 ?auto_26179 ) ) ( not ( = ?auto_26134 ?auto_26156 ) ) ( not ( = ?auto_26134 ?auto_26170 ) ) ( not ( = ?auto_26134 ?auto_26164 ) ) ( not ( = ?auto_26147 ?auto_26167 ) ) ( not ( = ?auto_26147 ?auto_26174 ) ) ( not ( = ?auto_26147 ?auto_26157 ) ) ( not ( = ?auto_26147 ?auto_26181 ) ) ( not ( = ?auto_26147 ?auto_26182 ) ) ( not ( = ?auto_26147 ?auto_26153 ) ) ( not ( = ?auto_26147 ?auto_26160 ) ) ( not ( = ?auto_26149 ?auto_26154 ) ) ( not ( = ?auto_26149 ?auto_26159 ) ) ( not ( = ?auto_26149 ?auto_26169 ) ) ( not ( = ?auto_26149 ?auto_26177 ) ) ( not ( = ?auto_26149 ?auto_26180 ) ) ( not ( = ?auto_26149 ?auto_26161 ) ) ( not ( = ?auto_26149 ?auto_26175 ) ) ( not ( = ?auto_26162 ?auto_26178 ) ) ( not ( = ?auto_26162 ?auto_26166 ) ) ( not ( = ?auto_26162 ?auto_26173 ) ) ( not ( = ?auto_26162 ?auto_26176 ) ) ( not ( = ?auto_26162 ?auto_26179 ) ) ( not ( = ?auto_26162 ?auto_26156 ) ) ( not ( = ?auto_26162 ?auto_26170 ) ) ( not ( = ?auto_26162 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26139 ) ) ( not ( = ?auto_26128 ?auto_26152 ) ) ( not ( = ?auto_26129 ?auto_26139 ) ) ( not ( = ?auto_26129 ?auto_26152 ) ) ( not ( = ?auto_26130 ?auto_26139 ) ) ( not ( = ?auto_26130 ?auto_26152 ) ) ( not ( = ?auto_26131 ?auto_26139 ) ) ( not ( = ?auto_26131 ?auto_26152 ) ) ( not ( = ?auto_26132 ?auto_26139 ) ) ( not ( = ?auto_26132 ?auto_26152 ) ) ( not ( = ?auto_26135 ?auto_26139 ) ) ( not ( = ?auto_26135 ?auto_26152 ) ) ( not ( = ?auto_26133 ?auto_26139 ) ) ( not ( = ?auto_26133 ?auto_26152 ) ) ( not ( = ?auto_26137 ?auto_26139 ) ) ( not ( = ?auto_26137 ?auto_26152 ) ) ( not ( = ?auto_26136 ?auto_26139 ) ) ( not ( = ?auto_26136 ?auto_26152 ) ) ( not ( = ?auto_26139 ?auto_26162 ) ) ( not ( = ?auto_26139 ?auto_26178 ) ) ( not ( = ?auto_26139 ?auto_26166 ) ) ( not ( = ?auto_26139 ?auto_26173 ) ) ( not ( = ?auto_26139 ?auto_26176 ) ) ( not ( = ?auto_26139 ?auto_26179 ) ) ( not ( = ?auto_26139 ?auto_26156 ) ) ( not ( = ?auto_26139 ?auto_26170 ) ) ( not ( = ?auto_26139 ?auto_26164 ) ) ( not ( = ?auto_26187 ?auto_26147 ) ) ( not ( = ?auto_26187 ?auto_26167 ) ) ( not ( = ?auto_26187 ?auto_26174 ) ) ( not ( = ?auto_26187 ?auto_26157 ) ) ( not ( = ?auto_26187 ?auto_26181 ) ) ( not ( = ?auto_26187 ?auto_26182 ) ) ( not ( = ?auto_26187 ?auto_26153 ) ) ( not ( = ?auto_26187 ?auto_26160 ) ) ( not ( = ?auto_26163 ?auto_26149 ) ) ( not ( = ?auto_26163 ?auto_26154 ) ) ( not ( = ?auto_26163 ?auto_26159 ) ) ( not ( = ?auto_26163 ?auto_26169 ) ) ( not ( = ?auto_26163 ?auto_26177 ) ) ( not ( = ?auto_26163 ?auto_26180 ) ) ( not ( = ?auto_26163 ?auto_26161 ) ) ( not ( = ?auto_26163 ?auto_26175 ) ) ( not ( = ?auto_26152 ?auto_26162 ) ) ( not ( = ?auto_26152 ?auto_26178 ) ) ( not ( = ?auto_26152 ?auto_26166 ) ) ( not ( = ?auto_26152 ?auto_26173 ) ) ( not ( = ?auto_26152 ?auto_26176 ) ) ( not ( = ?auto_26152 ?auto_26179 ) ) ( not ( = ?auto_26152 ?auto_26156 ) ) ( not ( = ?auto_26152 ?auto_26170 ) ) ( not ( = ?auto_26152 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26138 ) ) ( not ( = ?auto_26128 ?auto_26185 ) ) ( not ( = ?auto_26129 ?auto_26138 ) ) ( not ( = ?auto_26129 ?auto_26185 ) ) ( not ( = ?auto_26130 ?auto_26138 ) ) ( not ( = ?auto_26130 ?auto_26185 ) ) ( not ( = ?auto_26131 ?auto_26138 ) ) ( not ( = ?auto_26131 ?auto_26185 ) ) ( not ( = ?auto_26132 ?auto_26138 ) ) ( not ( = ?auto_26132 ?auto_26185 ) ) ( not ( = ?auto_26135 ?auto_26138 ) ) ( not ( = ?auto_26135 ?auto_26185 ) ) ( not ( = ?auto_26133 ?auto_26138 ) ) ( not ( = ?auto_26133 ?auto_26185 ) ) ( not ( = ?auto_26137 ?auto_26138 ) ) ( not ( = ?auto_26137 ?auto_26185 ) ) ( not ( = ?auto_26136 ?auto_26138 ) ) ( not ( = ?auto_26136 ?auto_26185 ) ) ( not ( = ?auto_26134 ?auto_26138 ) ) ( not ( = ?auto_26134 ?auto_26185 ) ) ( not ( = ?auto_26138 ?auto_26152 ) ) ( not ( = ?auto_26138 ?auto_26162 ) ) ( not ( = ?auto_26138 ?auto_26178 ) ) ( not ( = ?auto_26138 ?auto_26166 ) ) ( not ( = ?auto_26138 ?auto_26173 ) ) ( not ( = ?auto_26138 ?auto_26176 ) ) ( not ( = ?auto_26138 ?auto_26179 ) ) ( not ( = ?auto_26138 ?auto_26156 ) ) ( not ( = ?auto_26138 ?auto_26170 ) ) ( not ( = ?auto_26138 ?auto_26164 ) ) ( not ( = ?auto_26155 ?auto_26187 ) ) ( not ( = ?auto_26155 ?auto_26147 ) ) ( not ( = ?auto_26155 ?auto_26167 ) ) ( not ( = ?auto_26155 ?auto_26174 ) ) ( not ( = ?auto_26155 ?auto_26157 ) ) ( not ( = ?auto_26155 ?auto_26181 ) ) ( not ( = ?auto_26155 ?auto_26182 ) ) ( not ( = ?auto_26155 ?auto_26153 ) ) ( not ( = ?auto_26155 ?auto_26160 ) ) ( not ( = ?auto_26168 ?auto_26163 ) ) ( not ( = ?auto_26168 ?auto_26149 ) ) ( not ( = ?auto_26168 ?auto_26154 ) ) ( not ( = ?auto_26168 ?auto_26159 ) ) ( not ( = ?auto_26168 ?auto_26169 ) ) ( not ( = ?auto_26168 ?auto_26177 ) ) ( not ( = ?auto_26168 ?auto_26180 ) ) ( not ( = ?auto_26168 ?auto_26161 ) ) ( not ( = ?auto_26168 ?auto_26175 ) ) ( not ( = ?auto_26185 ?auto_26152 ) ) ( not ( = ?auto_26185 ?auto_26162 ) ) ( not ( = ?auto_26185 ?auto_26178 ) ) ( not ( = ?auto_26185 ?auto_26166 ) ) ( not ( = ?auto_26185 ?auto_26173 ) ) ( not ( = ?auto_26185 ?auto_26176 ) ) ( not ( = ?auto_26185 ?auto_26179 ) ) ( not ( = ?auto_26185 ?auto_26156 ) ) ( not ( = ?auto_26185 ?auto_26170 ) ) ( not ( = ?auto_26185 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26140 ) ) ( not ( = ?auto_26128 ?auto_26183 ) ) ( not ( = ?auto_26129 ?auto_26140 ) ) ( not ( = ?auto_26129 ?auto_26183 ) ) ( not ( = ?auto_26130 ?auto_26140 ) ) ( not ( = ?auto_26130 ?auto_26183 ) ) ( not ( = ?auto_26131 ?auto_26140 ) ) ( not ( = ?auto_26131 ?auto_26183 ) ) ( not ( = ?auto_26132 ?auto_26140 ) ) ( not ( = ?auto_26132 ?auto_26183 ) ) ( not ( = ?auto_26135 ?auto_26140 ) ) ( not ( = ?auto_26135 ?auto_26183 ) ) ( not ( = ?auto_26133 ?auto_26140 ) ) ( not ( = ?auto_26133 ?auto_26183 ) ) ( not ( = ?auto_26137 ?auto_26140 ) ) ( not ( = ?auto_26137 ?auto_26183 ) ) ( not ( = ?auto_26136 ?auto_26140 ) ) ( not ( = ?auto_26136 ?auto_26183 ) ) ( not ( = ?auto_26134 ?auto_26140 ) ) ( not ( = ?auto_26134 ?auto_26183 ) ) ( not ( = ?auto_26139 ?auto_26140 ) ) ( not ( = ?auto_26139 ?auto_26183 ) ) ( not ( = ?auto_26140 ?auto_26185 ) ) ( not ( = ?auto_26140 ?auto_26152 ) ) ( not ( = ?auto_26140 ?auto_26162 ) ) ( not ( = ?auto_26140 ?auto_26178 ) ) ( not ( = ?auto_26140 ?auto_26166 ) ) ( not ( = ?auto_26140 ?auto_26173 ) ) ( not ( = ?auto_26140 ?auto_26176 ) ) ( not ( = ?auto_26140 ?auto_26179 ) ) ( not ( = ?auto_26140 ?auto_26156 ) ) ( not ( = ?auto_26140 ?auto_26170 ) ) ( not ( = ?auto_26140 ?auto_26164 ) ) ( not ( = ?auto_26183 ?auto_26185 ) ) ( not ( = ?auto_26183 ?auto_26152 ) ) ( not ( = ?auto_26183 ?auto_26162 ) ) ( not ( = ?auto_26183 ?auto_26178 ) ) ( not ( = ?auto_26183 ?auto_26166 ) ) ( not ( = ?auto_26183 ?auto_26173 ) ) ( not ( = ?auto_26183 ?auto_26176 ) ) ( not ( = ?auto_26183 ?auto_26179 ) ) ( not ( = ?auto_26183 ?auto_26156 ) ) ( not ( = ?auto_26183 ?auto_26170 ) ) ( not ( = ?auto_26183 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26142 ) ) ( not ( = ?auto_26128 ?auto_26172 ) ) ( not ( = ?auto_26129 ?auto_26142 ) ) ( not ( = ?auto_26129 ?auto_26172 ) ) ( not ( = ?auto_26130 ?auto_26142 ) ) ( not ( = ?auto_26130 ?auto_26172 ) ) ( not ( = ?auto_26131 ?auto_26142 ) ) ( not ( = ?auto_26131 ?auto_26172 ) ) ( not ( = ?auto_26132 ?auto_26142 ) ) ( not ( = ?auto_26132 ?auto_26172 ) ) ( not ( = ?auto_26135 ?auto_26142 ) ) ( not ( = ?auto_26135 ?auto_26172 ) ) ( not ( = ?auto_26133 ?auto_26142 ) ) ( not ( = ?auto_26133 ?auto_26172 ) ) ( not ( = ?auto_26137 ?auto_26142 ) ) ( not ( = ?auto_26137 ?auto_26172 ) ) ( not ( = ?auto_26136 ?auto_26142 ) ) ( not ( = ?auto_26136 ?auto_26172 ) ) ( not ( = ?auto_26134 ?auto_26142 ) ) ( not ( = ?auto_26134 ?auto_26172 ) ) ( not ( = ?auto_26139 ?auto_26142 ) ) ( not ( = ?auto_26139 ?auto_26172 ) ) ( not ( = ?auto_26138 ?auto_26142 ) ) ( not ( = ?auto_26138 ?auto_26172 ) ) ( not ( = ?auto_26142 ?auto_26183 ) ) ( not ( = ?auto_26142 ?auto_26185 ) ) ( not ( = ?auto_26142 ?auto_26152 ) ) ( not ( = ?auto_26142 ?auto_26162 ) ) ( not ( = ?auto_26142 ?auto_26178 ) ) ( not ( = ?auto_26142 ?auto_26166 ) ) ( not ( = ?auto_26142 ?auto_26173 ) ) ( not ( = ?auto_26142 ?auto_26176 ) ) ( not ( = ?auto_26142 ?auto_26179 ) ) ( not ( = ?auto_26142 ?auto_26156 ) ) ( not ( = ?auto_26142 ?auto_26170 ) ) ( not ( = ?auto_26142 ?auto_26164 ) ) ( not ( = ?auto_26172 ?auto_26183 ) ) ( not ( = ?auto_26172 ?auto_26185 ) ) ( not ( = ?auto_26172 ?auto_26152 ) ) ( not ( = ?auto_26172 ?auto_26162 ) ) ( not ( = ?auto_26172 ?auto_26178 ) ) ( not ( = ?auto_26172 ?auto_26166 ) ) ( not ( = ?auto_26172 ?auto_26173 ) ) ( not ( = ?auto_26172 ?auto_26176 ) ) ( not ( = ?auto_26172 ?auto_26179 ) ) ( not ( = ?auto_26172 ?auto_26156 ) ) ( not ( = ?auto_26172 ?auto_26170 ) ) ( not ( = ?auto_26172 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26143 ) ) ( not ( = ?auto_26128 ?auto_26165 ) ) ( not ( = ?auto_26129 ?auto_26143 ) ) ( not ( = ?auto_26129 ?auto_26165 ) ) ( not ( = ?auto_26130 ?auto_26143 ) ) ( not ( = ?auto_26130 ?auto_26165 ) ) ( not ( = ?auto_26131 ?auto_26143 ) ) ( not ( = ?auto_26131 ?auto_26165 ) ) ( not ( = ?auto_26132 ?auto_26143 ) ) ( not ( = ?auto_26132 ?auto_26165 ) ) ( not ( = ?auto_26135 ?auto_26143 ) ) ( not ( = ?auto_26135 ?auto_26165 ) ) ( not ( = ?auto_26133 ?auto_26143 ) ) ( not ( = ?auto_26133 ?auto_26165 ) ) ( not ( = ?auto_26137 ?auto_26143 ) ) ( not ( = ?auto_26137 ?auto_26165 ) ) ( not ( = ?auto_26136 ?auto_26143 ) ) ( not ( = ?auto_26136 ?auto_26165 ) ) ( not ( = ?auto_26134 ?auto_26143 ) ) ( not ( = ?auto_26134 ?auto_26165 ) ) ( not ( = ?auto_26139 ?auto_26143 ) ) ( not ( = ?auto_26139 ?auto_26165 ) ) ( not ( = ?auto_26138 ?auto_26143 ) ) ( not ( = ?auto_26138 ?auto_26165 ) ) ( not ( = ?auto_26140 ?auto_26143 ) ) ( not ( = ?auto_26140 ?auto_26165 ) ) ( not ( = ?auto_26143 ?auto_26172 ) ) ( not ( = ?auto_26143 ?auto_26183 ) ) ( not ( = ?auto_26143 ?auto_26185 ) ) ( not ( = ?auto_26143 ?auto_26152 ) ) ( not ( = ?auto_26143 ?auto_26162 ) ) ( not ( = ?auto_26143 ?auto_26178 ) ) ( not ( = ?auto_26143 ?auto_26166 ) ) ( not ( = ?auto_26143 ?auto_26173 ) ) ( not ( = ?auto_26143 ?auto_26176 ) ) ( not ( = ?auto_26143 ?auto_26179 ) ) ( not ( = ?auto_26143 ?auto_26156 ) ) ( not ( = ?auto_26143 ?auto_26170 ) ) ( not ( = ?auto_26143 ?auto_26164 ) ) ( not ( = ?auto_26184 ?auto_26181 ) ) ( not ( = ?auto_26184 ?auto_26187 ) ) ( not ( = ?auto_26184 ?auto_26155 ) ) ( not ( = ?auto_26184 ?auto_26147 ) ) ( not ( = ?auto_26184 ?auto_26167 ) ) ( not ( = ?auto_26184 ?auto_26174 ) ) ( not ( = ?auto_26184 ?auto_26157 ) ) ( not ( = ?auto_26184 ?auto_26182 ) ) ( not ( = ?auto_26184 ?auto_26153 ) ) ( not ( = ?auto_26184 ?auto_26160 ) ) ( not ( = ?auto_26158 ?auto_26177 ) ) ( not ( = ?auto_26158 ?auto_26163 ) ) ( not ( = ?auto_26158 ?auto_26168 ) ) ( not ( = ?auto_26158 ?auto_26149 ) ) ( not ( = ?auto_26158 ?auto_26154 ) ) ( not ( = ?auto_26158 ?auto_26159 ) ) ( not ( = ?auto_26158 ?auto_26169 ) ) ( not ( = ?auto_26158 ?auto_26180 ) ) ( not ( = ?auto_26158 ?auto_26161 ) ) ( not ( = ?auto_26158 ?auto_26175 ) ) ( not ( = ?auto_26165 ?auto_26172 ) ) ( not ( = ?auto_26165 ?auto_26183 ) ) ( not ( = ?auto_26165 ?auto_26185 ) ) ( not ( = ?auto_26165 ?auto_26152 ) ) ( not ( = ?auto_26165 ?auto_26162 ) ) ( not ( = ?auto_26165 ?auto_26178 ) ) ( not ( = ?auto_26165 ?auto_26166 ) ) ( not ( = ?auto_26165 ?auto_26173 ) ) ( not ( = ?auto_26165 ?auto_26176 ) ) ( not ( = ?auto_26165 ?auto_26179 ) ) ( not ( = ?auto_26165 ?auto_26156 ) ) ( not ( = ?auto_26165 ?auto_26170 ) ) ( not ( = ?auto_26165 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26141 ) ) ( not ( = ?auto_26128 ?auto_26186 ) ) ( not ( = ?auto_26129 ?auto_26141 ) ) ( not ( = ?auto_26129 ?auto_26186 ) ) ( not ( = ?auto_26130 ?auto_26141 ) ) ( not ( = ?auto_26130 ?auto_26186 ) ) ( not ( = ?auto_26131 ?auto_26141 ) ) ( not ( = ?auto_26131 ?auto_26186 ) ) ( not ( = ?auto_26132 ?auto_26141 ) ) ( not ( = ?auto_26132 ?auto_26186 ) ) ( not ( = ?auto_26135 ?auto_26141 ) ) ( not ( = ?auto_26135 ?auto_26186 ) ) ( not ( = ?auto_26133 ?auto_26141 ) ) ( not ( = ?auto_26133 ?auto_26186 ) ) ( not ( = ?auto_26137 ?auto_26141 ) ) ( not ( = ?auto_26137 ?auto_26186 ) ) ( not ( = ?auto_26136 ?auto_26141 ) ) ( not ( = ?auto_26136 ?auto_26186 ) ) ( not ( = ?auto_26134 ?auto_26141 ) ) ( not ( = ?auto_26134 ?auto_26186 ) ) ( not ( = ?auto_26139 ?auto_26141 ) ) ( not ( = ?auto_26139 ?auto_26186 ) ) ( not ( = ?auto_26138 ?auto_26141 ) ) ( not ( = ?auto_26138 ?auto_26186 ) ) ( not ( = ?auto_26140 ?auto_26141 ) ) ( not ( = ?auto_26140 ?auto_26186 ) ) ( not ( = ?auto_26142 ?auto_26141 ) ) ( not ( = ?auto_26142 ?auto_26186 ) ) ( not ( = ?auto_26141 ?auto_26165 ) ) ( not ( = ?auto_26141 ?auto_26172 ) ) ( not ( = ?auto_26141 ?auto_26183 ) ) ( not ( = ?auto_26141 ?auto_26185 ) ) ( not ( = ?auto_26141 ?auto_26152 ) ) ( not ( = ?auto_26141 ?auto_26162 ) ) ( not ( = ?auto_26141 ?auto_26178 ) ) ( not ( = ?auto_26141 ?auto_26166 ) ) ( not ( = ?auto_26141 ?auto_26173 ) ) ( not ( = ?auto_26141 ?auto_26176 ) ) ( not ( = ?auto_26141 ?auto_26179 ) ) ( not ( = ?auto_26141 ?auto_26156 ) ) ( not ( = ?auto_26141 ?auto_26170 ) ) ( not ( = ?auto_26141 ?auto_26164 ) ) ( not ( = ?auto_26151 ?auto_26184 ) ) ( not ( = ?auto_26151 ?auto_26181 ) ) ( not ( = ?auto_26151 ?auto_26187 ) ) ( not ( = ?auto_26151 ?auto_26155 ) ) ( not ( = ?auto_26151 ?auto_26147 ) ) ( not ( = ?auto_26151 ?auto_26167 ) ) ( not ( = ?auto_26151 ?auto_26174 ) ) ( not ( = ?auto_26151 ?auto_26157 ) ) ( not ( = ?auto_26151 ?auto_26182 ) ) ( not ( = ?auto_26151 ?auto_26153 ) ) ( not ( = ?auto_26151 ?auto_26160 ) ) ( not ( = ?auto_26171 ?auto_26158 ) ) ( not ( = ?auto_26171 ?auto_26177 ) ) ( not ( = ?auto_26171 ?auto_26163 ) ) ( not ( = ?auto_26171 ?auto_26168 ) ) ( not ( = ?auto_26171 ?auto_26149 ) ) ( not ( = ?auto_26171 ?auto_26154 ) ) ( not ( = ?auto_26171 ?auto_26159 ) ) ( not ( = ?auto_26171 ?auto_26169 ) ) ( not ( = ?auto_26171 ?auto_26180 ) ) ( not ( = ?auto_26171 ?auto_26161 ) ) ( not ( = ?auto_26171 ?auto_26175 ) ) ( not ( = ?auto_26186 ?auto_26165 ) ) ( not ( = ?auto_26186 ?auto_26172 ) ) ( not ( = ?auto_26186 ?auto_26183 ) ) ( not ( = ?auto_26186 ?auto_26185 ) ) ( not ( = ?auto_26186 ?auto_26152 ) ) ( not ( = ?auto_26186 ?auto_26162 ) ) ( not ( = ?auto_26186 ?auto_26178 ) ) ( not ( = ?auto_26186 ?auto_26166 ) ) ( not ( = ?auto_26186 ?auto_26173 ) ) ( not ( = ?auto_26186 ?auto_26176 ) ) ( not ( = ?auto_26186 ?auto_26179 ) ) ( not ( = ?auto_26186 ?auto_26156 ) ) ( not ( = ?auto_26186 ?auto_26170 ) ) ( not ( = ?auto_26186 ?auto_26164 ) ) ( not ( = ?auto_26128 ?auto_26144 ) ) ( not ( = ?auto_26128 ?auto_26146 ) ) ( not ( = ?auto_26129 ?auto_26144 ) ) ( not ( = ?auto_26129 ?auto_26146 ) ) ( not ( = ?auto_26130 ?auto_26144 ) ) ( not ( = ?auto_26130 ?auto_26146 ) ) ( not ( = ?auto_26131 ?auto_26144 ) ) ( not ( = ?auto_26131 ?auto_26146 ) ) ( not ( = ?auto_26132 ?auto_26144 ) ) ( not ( = ?auto_26132 ?auto_26146 ) ) ( not ( = ?auto_26135 ?auto_26144 ) ) ( not ( = ?auto_26135 ?auto_26146 ) ) ( not ( = ?auto_26133 ?auto_26144 ) ) ( not ( = ?auto_26133 ?auto_26146 ) ) ( not ( = ?auto_26137 ?auto_26144 ) ) ( not ( = ?auto_26137 ?auto_26146 ) ) ( not ( = ?auto_26136 ?auto_26144 ) ) ( not ( = ?auto_26136 ?auto_26146 ) ) ( not ( = ?auto_26134 ?auto_26144 ) ) ( not ( = ?auto_26134 ?auto_26146 ) ) ( not ( = ?auto_26139 ?auto_26144 ) ) ( not ( = ?auto_26139 ?auto_26146 ) ) ( not ( = ?auto_26138 ?auto_26144 ) ) ( not ( = ?auto_26138 ?auto_26146 ) ) ( not ( = ?auto_26140 ?auto_26144 ) ) ( not ( = ?auto_26140 ?auto_26146 ) ) ( not ( = ?auto_26142 ?auto_26144 ) ) ( not ( = ?auto_26142 ?auto_26146 ) ) ( not ( = ?auto_26143 ?auto_26144 ) ) ( not ( = ?auto_26143 ?auto_26146 ) ) ( not ( = ?auto_26144 ?auto_26186 ) ) ( not ( = ?auto_26144 ?auto_26165 ) ) ( not ( = ?auto_26144 ?auto_26172 ) ) ( not ( = ?auto_26144 ?auto_26183 ) ) ( not ( = ?auto_26144 ?auto_26185 ) ) ( not ( = ?auto_26144 ?auto_26152 ) ) ( not ( = ?auto_26144 ?auto_26162 ) ) ( not ( = ?auto_26144 ?auto_26178 ) ) ( not ( = ?auto_26144 ?auto_26166 ) ) ( not ( = ?auto_26144 ?auto_26173 ) ) ( not ( = ?auto_26144 ?auto_26176 ) ) ( not ( = ?auto_26144 ?auto_26179 ) ) ( not ( = ?auto_26144 ?auto_26156 ) ) ( not ( = ?auto_26144 ?auto_26170 ) ) ( not ( = ?auto_26144 ?auto_26164 ) ) ( not ( = ?auto_26146 ?auto_26186 ) ) ( not ( = ?auto_26146 ?auto_26165 ) ) ( not ( = ?auto_26146 ?auto_26172 ) ) ( not ( = ?auto_26146 ?auto_26183 ) ) ( not ( = ?auto_26146 ?auto_26185 ) ) ( not ( = ?auto_26146 ?auto_26152 ) ) ( not ( = ?auto_26146 ?auto_26162 ) ) ( not ( = ?auto_26146 ?auto_26178 ) ) ( not ( = ?auto_26146 ?auto_26166 ) ) ( not ( = ?auto_26146 ?auto_26173 ) ) ( not ( = ?auto_26146 ?auto_26176 ) ) ( not ( = ?auto_26146 ?auto_26179 ) ) ( not ( = ?auto_26146 ?auto_26156 ) ) ( not ( = ?auto_26146 ?auto_26170 ) ) ( not ( = ?auto_26146 ?auto_26164 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_26128 ?auto_26129 ?auto_26130 ?auto_26131 ?auto_26132 ?auto_26135 ?auto_26133 ?auto_26137 ?auto_26136 ?auto_26134 ?auto_26139 ?auto_26138 ?auto_26140 ?auto_26142 ?auto_26143 ?auto_26141 )
      ( MAKE-1CRATE ?auto_26141 ?auto_26144 )
      ( MAKE-16CRATE-VERIFY ?auto_26128 ?auto_26129 ?auto_26130 ?auto_26131 ?auto_26132 ?auto_26135 ?auto_26133 ?auto_26137 ?auto_26136 ?auto_26134 ?auto_26139 ?auto_26138 ?auto_26140 ?auto_26142 ?auto_26143 ?auto_26141 ?auto_26144 ) )
  )

)

