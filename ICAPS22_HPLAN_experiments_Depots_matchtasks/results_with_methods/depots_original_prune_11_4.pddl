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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555309 - SURFACE
      ?auto_555310 - SURFACE
    )
    :vars
    (
      ?auto_555311 - HOIST
      ?auto_555312 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555311 ?auto_555312 ) ( SURFACE-AT ?auto_555309 ?auto_555312 ) ( CLEAR ?auto_555309 ) ( LIFTING ?auto_555311 ?auto_555310 ) ( IS-CRATE ?auto_555310 ) ( not ( = ?auto_555309 ?auto_555310 ) ) )
    :subtasks
    ( ( !DROP ?auto_555311 ?auto_555310 ?auto_555309 ?auto_555312 )
      ( MAKE-1CRATE-VERIFY ?auto_555309 ?auto_555310 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555313 - SURFACE
      ?auto_555314 - SURFACE
    )
    :vars
    (
      ?auto_555315 - HOIST
      ?auto_555316 - PLACE
      ?auto_555317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555315 ?auto_555316 ) ( SURFACE-AT ?auto_555313 ?auto_555316 ) ( CLEAR ?auto_555313 ) ( IS-CRATE ?auto_555314 ) ( not ( = ?auto_555313 ?auto_555314 ) ) ( TRUCK-AT ?auto_555317 ?auto_555316 ) ( AVAILABLE ?auto_555315 ) ( IN ?auto_555314 ?auto_555317 ) )
    :subtasks
    ( ( !UNLOAD ?auto_555315 ?auto_555314 ?auto_555317 ?auto_555316 )
      ( MAKE-1CRATE ?auto_555313 ?auto_555314 )
      ( MAKE-1CRATE-VERIFY ?auto_555313 ?auto_555314 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555318 - SURFACE
      ?auto_555319 - SURFACE
    )
    :vars
    (
      ?auto_555322 - HOIST
      ?auto_555320 - PLACE
      ?auto_555321 - TRUCK
      ?auto_555323 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555322 ?auto_555320 ) ( SURFACE-AT ?auto_555318 ?auto_555320 ) ( CLEAR ?auto_555318 ) ( IS-CRATE ?auto_555319 ) ( not ( = ?auto_555318 ?auto_555319 ) ) ( AVAILABLE ?auto_555322 ) ( IN ?auto_555319 ?auto_555321 ) ( TRUCK-AT ?auto_555321 ?auto_555323 ) ( not ( = ?auto_555323 ?auto_555320 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_555321 ?auto_555323 ?auto_555320 )
      ( MAKE-1CRATE ?auto_555318 ?auto_555319 )
      ( MAKE-1CRATE-VERIFY ?auto_555318 ?auto_555319 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555324 - SURFACE
      ?auto_555325 - SURFACE
    )
    :vars
    (
      ?auto_555329 - HOIST
      ?auto_555328 - PLACE
      ?auto_555327 - TRUCK
      ?auto_555326 - PLACE
      ?auto_555330 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_555329 ?auto_555328 ) ( SURFACE-AT ?auto_555324 ?auto_555328 ) ( CLEAR ?auto_555324 ) ( IS-CRATE ?auto_555325 ) ( not ( = ?auto_555324 ?auto_555325 ) ) ( AVAILABLE ?auto_555329 ) ( TRUCK-AT ?auto_555327 ?auto_555326 ) ( not ( = ?auto_555326 ?auto_555328 ) ) ( HOIST-AT ?auto_555330 ?auto_555326 ) ( LIFTING ?auto_555330 ?auto_555325 ) ( not ( = ?auto_555329 ?auto_555330 ) ) )
    :subtasks
    ( ( !LOAD ?auto_555330 ?auto_555325 ?auto_555327 ?auto_555326 )
      ( MAKE-1CRATE ?auto_555324 ?auto_555325 )
      ( MAKE-1CRATE-VERIFY ?auto_555324 ?auto_555325 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555331 - SURFACE
      ?auto_555332 - SURFACE
    )
    :vars
    (
      ?auto_555336 - HOIST
      ?auto_555333 - PLACE
      ?auto_555337 - TRUCK
      ?auto_555334 - PLACE
      ?auto_555335 - HOIST
      ?auto_555338 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555336 ?auto_555333 ) ( SURFACE-AT ?auto_555331 ?auto_555333 ) ( CLEAR ?auto_555331 ) ( IS-CRATE ?auto_555332 ) ( not ( = ?auto_555331 ?auto_555332 ) ) ( AVAILABLE ?auto_555336 ) ( TRUCK-AT ?auto_555337 ?auto_555334 ) ( not ( = ?auto_555334 ?auto_555333 ) ) ( HOIST-AT ?auto_555335 ?auto_555334 ) ( not ( = ?auto_555336 ?auto_555335 ) ) ( AVAILABLE ?auto_555335 ) ( SURFACE-AT ?auto_555332 ?auto_555334 ) ( ON ?auto_555332 ?auto_555338 ) ( CLEAR ?auto_555332 ) ( not ( = ?auto_555331 ?auto_555338 ) ) ( not ( = ?auto_555332 ?auto_555338 ) ) )
    :subtasks
    ( ( !LIFT ?auto_555335 ?auto_555332 ?auto_555338 ?auto_555334 )
      ( MAKE-1CRATE ?auto_555331 ?auto_555332 )
      ( MAKE-1CRATE-VERIFY ?auto_555331 ?auto_555332 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555339 - SURFACE
      ?auto_555340 - SURFACE
    )
    :vars
    (
      ?auto_555345 - HOIST
      ?auto_555346 - PLACE
      ?auto_555341 - PLACE
      ?auto_555344 - HOIST
      ?auto_555342 - SURFACE
      ?auto_555343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555345 ?auto_555346 ) ( SURFACE-AT ?auto_555339 ?auto_555346 ) ( CLEAR ?auto_555339 ) ( IS-CRATE ?auto_555340 ) ( not ( = ?auto_555339 ?auto_555340 ) ) ( AVAILABLE ?auto_555345 ) ( not ( = ?auto_555341 ?auto_555346 ) ) ( HOIST-AT ?auto_555344 ?auto_555341 ) ( not ( = ?auto_555345 ?auto_555344 ) ) ( AVAILABLE ?auto_555344 ) ( SURFACE-AT ?auto_555340 ?auto_555341 ) ( ON ?auto_555340 ?auto_555342 ) ( CLEAR ?auto_555340 ) ( not ( = ?auto_555339 ?auto_555342 ) ) ( not ( = ?auto_555340 ?auto_555342 ) ) ( TRUCK-AT ?auto_555343 ?auto_555346 ) )
    :subtasks
    ( ( !DRIVE ?auto_555343 ?auto_555346 ?auto_555341 )
      ( MAKE-1CRATE ?auto_555339 ?auto_555340 )
      ( MAKE-1CRATE-VERIFY ?auto_555339 ?auto_555340 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_555356 - SURFACE
      ?auto_555357 - SURFACE
      ?auto_555358 - SURFACE
    )
    :vars
    (
      ?auto_555359 - HOIST
      ?auto_555360 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555359 ?auto_555360 ) ( SURFACE-AT ?auto_555357 ?auto_555360 ) ( CLEAR ?auto_555357 ) ( LIFTING ?auto_555359 ?auto_555358 ) ( IS-CRATE ?auto_555358 ) ( not ( = ?auto_555357 ?auto_555358 ) ) ( ON ?auto_555357 ?auto_555356 ) ( not ( = ?auto_555356 ?auto_555357 ) ) ( not ( = ?auto_555356 ?auto_555358 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555357 ?auto_555358 )
      ( MAKE-2CRATE-VERIFY ?auto_555356 ?auto_555357 ?auto_555358 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_555366 - SURFACE
      ?auto_555367 - SURFACE
      ?auto_555368 - SURFACE
    )
    :vars
    (
      ?auto_555369 - HOIST
      ?auto_555370 - PLACE
      ?auto_555371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555369 ?auto_555370 ) ( SURFACE-AT ?auto_555367 ?auto_555370 ) ( CLEAR ?auto_555367 ) ( IS-CRATE ?auto_555368 ) ( not ( = ?auto_555367 ?auto_555368 ) ) ( TRUCK-AT ?auto_555371 ?auto_555370 ) ( AVAILABLE ?auto_555369 ) ( IN ?auto_555368 ?auto_555371 ) ( ON ?auto_555367 ?auto_555366 ) ( not ( = ?auto_555366 ?auto_555367 ) ) ( not ( = ?auto_555366 ?auto_555368 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555367 ?auto_555368 )
      ( MAKE-2CRATE-VERIFY ?auto_555366 ?auto_555367 ?auto_555368 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555372 - SURFACE
      ?auto_555373 - SURFACE
    )
    :vars
    (
      ?auto_555376 - HOIST
      ?auto_555374 - PLACE
      ?auto_555375 - TRUCK
      ?auto_555377 - SURFACE
      ?auto_555378 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555376 ?auto_555374 ) ( SURFACE-AT ?auto_555372 ?auto_555374 ) ( CLEAR ?auto_555372 ) ( IS-CRATE ?auto_555373 ) ( not ( = ?auto_555372 ?auto_555373 ) ) ( AVAILABLE ?auto_555376 ) ( IN ?auto_555373 ?auto_555375 ) ( ON ?auto_555372 ?auto_555377 ) ( not ( = ?auto_555377 ?auto_555372 ) ) ( not ( = ?auto_555377 ?auto_555373 ) ) ( TRUCK-AT ?auto_555375 ?auto_555378 ) ( not ( = ?auto_555378 ?auto_555374 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_555375 ?auto_555378 ?auto_555374 )
      ( MAKE-2CRATE ?auto_555377 ?auto_555372 ?auto_555373 )
      ( MAKE-1CRATE-VERIFY ?auto_555372 ?auto_555373 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_555379 - SURFACE
      ?auto_555380 - SURFACE
      ?auto_555381 - SURFACE
    )
    :vars
    (
      ?auto_555383 - HOIST
      ?auto_555385 - PLACE
      ?auto_555384 - TRUCK
      ?auto_555382 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555383 ?auto_555385 ) ( SURFACE-AT ?auto_555380 ?auto_555385 ) ( CLEAR ?auto_555380 ) ( IS-CRATE ?auto_555381 ) ( not ( = ?auto_555380 ?auto_555381 ) ) ( AVAILABLE ?auto_555383 ) ( IN ?auto_555381 ?auto_555384 ) ( ON ?auto_555380 ?auto_555379 ) ( not ( = ?auto_555379 ?auto_555380 ) ) ( not ( = ?auto_555379 ?auto_555381 ) ) ( TRUCK-AT ?auto_555384 ?auto_555382 ) ( not ( = ?auto_555382 ?auto_555385 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555380 ?auto_555381 )
      ( MAKE-2CRATE-VERIFY ?auto_555379 ?auto_555380 ?auto_555381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555386 - SURFACE
      ?auto_555387 - SURFACE
    )
    :vars
    (
      ?auto_555391 - HOIST
      ?auto_555392 - PLACE
      ?auto_555389 - SURFACE
      ?auto_555388 - TRUCK
      ?auto_555390 - PLACE
      ?auto_555393 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_555391 ?auto_555392 ) ( SURFACE-AT ?auto_555386 ?auto_555392 ) ( CLEAR ?auto_555386 ) ( IS-CRATE ?auto_555387 ) ( not ( = ?auto_555386 ?auto_555387 ) ) ( AVAILABLE ?auto_555391 ) ( ON ?auto_555386 ?auto_555389 ) ( not ( = ?auto_555389 ?auto_555386 ) ) ( not ( = ?auto_555389 ?auto_555387 ) ) ( TRUCK-AT ?auto_555388 ?auto_555390 ) ( not ( = ?auto_555390 ?auto_555392 ) ) ( HOIST-AT ?auto_555393 ?auto_555390 ) ( LIFTING ?auto_555393 ?auto_555387 ) ( not ( = ?auto_555391 ?auto_555393 ) ) )
    :subtasks
    ( ( !LOAD ?auto_555393 ?auto_555387 ?auto_555388 ?auto_555390 )
      ( MAKE-2CRATE ?auto_555389 ?auto_555386 ?auto_555387 )
      ( MAKE-1CRATE-VERIFY ?auto_555386 ?auto_555387 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_555394 - SURFACE
      ?auto_555395 - SURFACE
      ?auto_555396 - SURFACE
    )
    :vars
    (
      ?auto_555398 - HOIST
      ?auto_555400 - PLACE
      ?auto_555397 - TRUCK
      ?auto_555399 - PLACE
      ?auto_555401 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_555398 ?auto_555400 ) ( SURFACE-AT ?auto_555395 ?auto_555400 ) ( CLEAR ?auto_555395 ) ( IS-CRATE ?auto_555396 ) ( not ( = ?auto_555395 ?auto_555396 ) ) ( AVAILABLE ?auto_555398 ) ( ON ?auto_555395 ?auto_555394 ) ( not ( = ?auto_555394 ?auto_555395 ) ) ( not ( = ?auto_555394 ?auto_555396 ) ) ( TRUCK-AT ?auto_555397 ?auto_555399 ) ( not ( = ?auto_555399 ?auto_555400 ) ) ( HOIST-AT ?auto_555401 ?auto_555399 ) ( LIFTING ?auto_555401 ?auto_555396 ) ( not ( = ?auto_555398 ?auto_555401 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555395 ?auto_555396 )
      ( MAKE-2CRATE-VERIFY ?auto_555394 ?auto_555395 ?auto_555396 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555402 - SURFACE
      ?auto_555403 - SURFACE
    )
    :vars
    (
      ?auto_555408 - HOIST
      ?auto_555409 - PLACE
      ?auto_555405 - SURFACE
      ?auto_555406 - TRUCK
      ?auto_555404 - PLACE
      ?auto_555407 - HOIST
      ?auto_555410 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555408 ?auto_555409 ) ( SURFACE-AT ?auto_555402 ?auto_555409 ) ( CLEAR ?auto_555402 ) ( IS-CRATE ?auto_555403 ) ( not ( = ?auto_555402 ?auto_555403 ) ) ( AVAILABLE ?auto_555408 ) ( ON ?auto_555402 ?auto_555405 ) ( not ( = ?auto_555405 ?auto_555402 ) ) ( not ( = ?auto_555405 ?auto_555403 ) ) ( TRUCK-AT ?auto_555406 ?auto_555404 ) ( not ( = ?auto_555404 ?auto_555409 ) ) ( HOIST-AT ?auto_555407 ?auto_555404 ) ( not ( = ?auto_555408 ?auto_555407 ) ) ( AVAILABLE ?auto_555407 ) ( SURFACE-AT ?auto_555403 ?auto_555404 ) ( ON ?auto_555403 ?auto_555410 ) ( CLEAR ?auto_555403 ) ( not ( = ?auto_555402 ?auto_555410 ) ) ( not ( = ?auto_555403 ?auto_555410 ) ) ( not ( = ?auto_555405 ?auto_555410 ) ) )
    :subtasks
    ( ( !LIFT ?auto_555407 ?auto_555403 ?auto_555410 ?auto_555404 )
      ( MAKE-2CRATE ?auto_555405 ?auto_555402 ?auto_555403 )
      ( MAKE-1CRATE-VERIFY ?auto_555402 ?auto_555403 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_555411 - SURFACE
      ?auto_555412 - SURFACE
      ?auto_555413 - SURFACE
    )
    :vars
    (
      ?auto_555419 - HOIST
      ?auto_555415 - PLACE
      ?auto_555417 - TRUCK
      ?auto_555414 - PLACE
      ?auto_555416 - HOIST
      ?auto_555418 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555419 ?auto_555415 ) ( SURFACE-AT ?auto_555412 ?auto_555415 ) ( CLEAR ?auto_555412 ) ( IS-CRATE ?auto_555413 ) ( not ( = ?auto_555412 ?auto_555413 ) ) ( AVAILABLE ?auto_555419 ) ( ON ?auto_555412 ?auto_555411 ) ( not ( = ?auto_555411 ?auto_555412 ) ) ( not ( = ?auto_555411 ?auto_555413 ) ) ( TRUCK-AT ?auto_555417 ?auto_555414 ) ( not ( = ?auto_555414 ?auto_555415 ) ) ( HOIST-AT ?auto_555416 ?auto_555414 ) ( not ( = ?auto_555419 ?auto_555416 ) ) ( AVAILABLE ?auto_555416 ) ( SURFACE-AT ?auto_555413 ?auto_555414 ) ( ON ?auto_555413 ?auto_555418 ) ( CLEAR ?auto_555413 ) ( not ( = ?auto_555412 ?auto_555418 ) ) ( not ( = ?auto_555413 ?auto_555418 ) ) ( not ( = ?auto_555411 ?auto_555418 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555412 ?auto_555413 )
      ( MAKE-2CRATE-VERIFY ?auto_555411 ?auto_555412 ?auto_555413 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555420 - SURFACE
      ?auto_555421 - SURFACE
    )
    :vars
    (
      ?auto_555423 - HOIST
      ?auto_555428 - PLACE
      ?auto_555426 - SURFACE
      ?auto_555424 - PLACE
      ?auto_555427 - HOIST
      ?auto_555422 - SURFACE
      ?auto_555425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555423 ?auto_555428 ) ( SURFACE-AT ?auto_555420 ?auto_555428 ) ( CLEAR ?auto_555420 ) ( IS-CRATE ?auto_555421 ) ( not ( = ?auto_555420 ?auto_555421 ) ) ( AVAILABLE ?auto_555423 ) ( ON ?auto_555420 ?auto_555426 ) ( not ( = ?auto_555426 ?auto_555420 ) ) ( not ( = ?auto_555426 ?auto_555421 ) ) ( not ( = ?auto_555424 ?auto_555428 ) ) ( HOIST-AT ?auto_555427 ?auto_555424 ) ( not ( = ?auto_555423 ?auto_555427 ) ) ( AVAILABLE ?auto_555427 ) ( SURFACE-AT ?auto_555421 ?auto_555424 ) ( ON ?auto_555421 ?auto_555422 ) ( CLEAR ?auto_555421 ) ( not ( = ?auto_555420 ?auto_555422 ) ) ( not ( = ?auto_555421 ?auto_555422 ) ) ( not ( = ?auto_555426 ?auto_555422 ) ) ( TRUCK-AT ?auto_555425 ?auto_555428 ) )
    :subtasks
    ( ( !DRIVE ?auto_555425 ?auto_555428 ?auto_555424 )
      ( MAKE-2CRATE ?auto_555426 ?auto_555420 ?auto_555421 )
      ( MAKE-1CRATE-VERIFY ?auto_555420 ?auto_555421 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_555429 - SURFACE
      ?auto_555430 - SURFACE
      ?auto_555431 - SURFACE
    )
    :vars
    (
      ?auto_555432 - HOIST
      ?auto_555433 - PLACE
      ?auto_555436 - PLACE
      ?auto_555434 - HOIST
      ?auto_555435 - SURFACE
      ?auto_555437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555432 ?auto_555433 ) ( SURFACE-AT ?auto_555430 ?auto_555433 ) ( CLEAR ?auto_555430 ) ( IS-CRATE ?auto_555431 ) ( not ( = ?auto_555430 ?auto_555431 ) ) ( AVAILABLE ?auto_555432 ) ( ON ?auto_555430 ?auto_555429 ) ( not ( = ?auto_555429 ?auto_555430 ) ) ( not ( = ?auto_555429 ?auto_555431 ) ) ( not ( = ?auto_555436 ?auto_555433 ) ) ( HOIST-AT ?auto_555434 ?auto_555436 ) ( not ( = ?auto_555432 ?auto_555434 ) ) ( AVAILABLE ?auto_555434 ) ( SURFACE-AT ?auto_555431 ?auto_555436 ) ( ON ?auto_555431 ?auto_555435 ) ( CLEAR ?auto_555431 ) ( not ( = ?auto_555430 ?auto_555435 ) ) ( not ( = ?auto_555431 ?auto_555435 ) ) ( not ( = ?auto_555429 ?auto_555435 ) ) ( TRUCK-AT ?auto_555437 ?auto_555433 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555430 ?auto_555431 )
      ( MAKE-2CRATE-VERIFY ?auto_555429 ?auto_555430 ?auto_555431 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555438 - SURFACE
      ?auto_555439 - SURFACE
    )
    :vars
    (
      ?auto_555442 - HOIST
      ?auto_555443 - PLACE
      ?auto_555445 - SURFACE
      ?auto_555440 - PLACE
      ?auto_555446 - HOIST
      ?auto_555441 - SURFACE
      ?auto_555444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555442 ?auto_555443 ) ( IS-CRATE ?auto_555439 ) ( not ( = ?auto_555438 ?auto_555439 ) ) ( not ( = ?auto_555445 ?auto_555438 ) ) ( not ( = ?auto_555445 ?auto_555439 ) ) ( not ( = ?auto_555440 ?auto_555443 ) ) ( HOIST-AT ?auto_555446 ?auto_555440 ) ( not ( = ?auto_555442 ?auto_555446 ) ) ( AVAILABLE ?auto_555446 ) ( SURFACE-AT ?auto_555439 ?auto_555440 ) ( ON ?auto_555439 ?auto_555441 ) ( CLEAR ?auto_555439 ) ( not ( = ?auto_555438 ?auto_555441 ) ) ( not ( = ?auto_555439 ?auto_555441 ) ) ( not ( = ?auto_555445 ?auto_555441 ) ) ( TRUCK-AT ?auto_555444 ?auto_555443 ) ( SURFACE-AT ?auto_555445 ?auto_555443 ) ( CLEAR ?auto_555445 ) ( LIFTING ?auto_555442 ?auto_555438 ) ( IS-CRATE ?auto_555438 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555445 ?auto_555438 )
      ( MAKE-2CRATE ?auto_555445 ?auto_555438 ?auto_555439 )
      ( MAKE-1CRATE-VERIFY ?auto_555438 ?auto_555439 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_555447 - SURFACE
      ?auto_555448 - SURFACE
      ?auto_555449 - SURFACE
    )
    :vars
    (
      ?auto_555452 - HOIST
      ?auto_555453 - PLACE
      ?auto_555451 - PLACE
      ?auto_555455 - HOIST
      ?auto_555450 - SURFACE
      ?auto_555454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555452 ?auto_555453 ) ( IS-CRATE ?auto_555449 ) ( not ( = ?auto_555448 ?auto_555449 ) ) ( not ( = ?auto_555447 ?auto_555448 ) ) ( not ( = ?auto_555447 ?auto_555449 ) ) ( not ( = ?auto_555451 ?auto_555453 ) ) ( HOIST-AT ?auto_555455 ?auto_555451 ) ( not ( = ?auto_555452 ?auto_555455 ) ) ( AVAILABLE ?auto_555455 ) ( SURFACE-AT ?auto_555449 ?auto_555451 ) ( ON ?auto_555449 ?auto_555450 ) ( CLEAR ?auto_555449 ) ( not ( = ?auto_555448 ?auto_555450 ) ) ( not ( = ?auto_555449 ?auto_555450 ) ) ( not ( = ?auto_555447 ?auto_555450 ) ) ( TRUCK-AT ?auto_555454 ?auto_555453 ) ( SURFACE-AT ?auto_555447 ?auto_555453 ) ( CLEAR ?auto_555447 ) ( LIFTING ?auto_555452 ?auto_555448 ) ( IS-CRATE ?auto_555448 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555448 ?auto_555449 )
      ( MAKE-2CRATE-VERIFY ?auto_555447 ?auto_555448 ?auto_555449 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555456 - SURFACE
      ?auto_555457 - SURFACE
    )
    :vars
    (
      ?auto_555461 - HOIST
      ?auto_555463 - PLACE
      ?auto_555459 - SURFACE
      ?auto_555458 - PLACE
      ?auto_555464 - HOIST
      ?auto_555462 - SURFACE
      ?auto_555460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555461 ?auto_555463 ) ( IS-CRATE ?auto_555457 ) ( not ( = ?auto_555456 ?auto_555457 ) ) ( not ( = ?auto_555459 ?auto_555456 ) ) ( not ( = ?auto_555459 ?auto_555457 ) ) ( not ( = ?auto_555458 ?auto_555463 ) ) ( HOIST-AT ?auto_555464 ?auto_555458 ) ( not ( = ?auto_555461 ?auto_555464 ) ) ( AVAILABLE ?auto_555464 ) ( SURFACE-AT ?auto_555457 ?auto_555458 ) ( ON ?auto_555457 ?auto_555462 ) ( CLEAR ?auto_555457 ) ( not ( = ?auto_555456 ?auto_555462 ) ) ( not ( = ?auto_555457 ?auto_555462 ) ) ( not ( = ?auto_555459 ?auto_555462 ) ) ( TRUCK-AT ?auto_555460 ?auto_555463 ) ( SURFACE-AT ?auto_555459 ?auto_555463 ) ( CLEAR ?auto_555459 ) ( IS-CRATE ?auto_555456 ) ( AVAILABLE ?auto_555461 ) ( IN ?auto_555456 ?auto_555460 ) )
    :subtasks
    ( ( !UNLOAD ?auto_555461 ?auto_555456 ?auto_555460 ?auto_555463 )
      ( MAKE-2CRATE ?auto_555459 ?auto_555456 ?auto_555457 )
      ( MAKE-1CRATE-VERIFY ?auto_555456 ?auto_555457 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_555465 - SURFACE
      ?auto_555466 - SURFACE
      ?auto_555467 - SURFACE
    )
    :vars
    (
      ?auto_555473 - HOIST
      ?auto_555472 - PLACE
      ?auto_555468 - PLACE
      ?auto_555470 - HOIST
      ?auto_555469 - SURFACE
      ?auto_555471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555473 ?auto_555472 ) ( IS-CRATE ?auto_555467 ) ( not ( = ?auto_555466 ?auto_555467 ) ) ( not ( = ?auto_555465 ?auto_555466 ) ) ( not ( = ?auto_555465 ?auto_555467 ) ) ( not ( = ?auto_555468 ?auto_555472 ) ) ( HOIST-AT ?auto_555470 ?auto_555468 ) ( not ( = ?auto_555473 ?auto_555470 ) ) ( AVAILABLE ?auto_555470 ) ( SURFACE-AT ?auto_555467 ?auto_555468 ) ( ON ?auto_555467 ?auto_555469 ) ( CLEAR ?auto_555467 ) ( not ( = ?auto_555466 ?auto_555469 ) ) ( not ( = ?auto_555467 ?auto_555469 ) ) ( not ( = ?auto_555465 ?auto_555469 ) ) ( TRUCK-AT ?auto_555471 ?auto_555472 ) ( SURFACE-AT ?auto_555465 ?auto_555472 ) ( CLEAR ?auto_555465 ) ( IS-CRATE ?auto_555466 ) ( AVAILABLE ?auto_555473 ) ( IN ?auto_555466 ?auto_555471 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555466 ?auto_555467 )
      ( MAKE-2CRATE-VERIFY ?auto_555465 ?auto_555466 ?auto_555467 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555510 - SURFACE
      ?auto_555511 - SURFACE
    )
    :vars
    (
      ?auto_555516 - HOIST
      ?auto_555512 - PLACE
      ?auto_555518 - SURFACE
      ?auto_555514 - PLACE
      ?auto_555513 - HOIST
      ?auto_555515 - SURFACE
      ?auto_555517 - TRUCK
      ?auto_555519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555516 ?auto_555512 ) ( SURFACE-AT ?auto_555510 ?auto_555512 ) ( CLEAR ?auto_555510 ) ( IS-CRATE ?auto_555511 ) ( not ( = ?auto_555510 ?auto_555511 ) ) ( AVAILABLE ?auto_555516 ) ( ON ?auto_555510 ?auto_555518 ) ( not ( = ?auto_555518 ?auto_555510 ) ) ( not ( = ?auto_555518 ?auto_555511 ) ) ( not ( = ?auto_555514 ?auto_555512 ) ) ( HOIST-AT ?auto_555513 ?auto_555514 ) ( not ( = ?auto_555516 ?auto_555513 ) ) ( AVAILABLE ?auto_555513 ) ( SURFACE-AT ?auto_555511 ?auto_555514 ) ( ON ?auto_555511 ?auto_555515 ) ( CLEAR ?auto_555511 ) ( not ( = ?auto_555510 ?auto_555515 ) ) ( not ( = ?auto_555511 ?auto_555515 ) ) ( not ( = ?auto_555518 ?auto_555515 ) ) ( TRUCK-AT ?auto_555517 ?auto_555519 ) ( not ( = ?auto_555519 ?auto_555512 ) ) ( not ( = ?auto_555514 ?auto_555519 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_555517 ?auto_555519 ?auto_555512 )
      ( MAKE-1CRATE ?auto_555510 ?auto_555511 )
      ( MAKE-1CRATE-VERIFY ?auto_555510 ?auto_555511 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555550 - SURFACE
      ?auto_555551 - SURFACE
      ?auto_555552 - SURFACE
      ?auto_555549 - SURFACE
    )
    :vars
    (
      ?auto_555553 - HOIST
      ?auto_555554 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555553 ?auto_555554 ) ( SURFACE-AT ?auto_555552 ?auto_555554 ) ( CLEAR ?auto_555552 ) ( LIFTING ?auto_555553 ?auto_555549 ) ( IS-CRATE ?auto_555549 ) ( not ( = ?auto_555552 ?auto_555549 ) ) ( ON ?auto_555551 ?auto_555550 ) ( ON ?auto_555552 ?auto_555551 ) ( not ( = ?auto_555550 ?auto_555551 ) ) ( not ( = ?auto_555550 ?auto_555552 ) ) ( not ( = ?auto_555550 ?auto_555549 ) ) ( not ( = ?auto_555551 ?auto_555552 ) ) ( not ( = ?auto_555551 ?auto_555549 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555552 ?auto_555549 )
      ( MAKE-3CRATE-VERIFY ?auto_555550 ?auto_555551 ?auto_555552 ?auto_555549 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555567 - SURFACE
      ?auto_555568 - SURFACE
      ?auto_555569 - SURFACE
      ?auto_555566 - SURFACE
    )
    :vars
    (
      ?auto_555570 - HOIST
      ?auto_555572 - PLACE
      ?auto_555571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555570 ?auto_555572 ) ( SURFACE-AT ?auto_555569 ?auto_555572 ) ( CLEAR ?auto_555569 ) ( IS-CRATE ?auto_555566 ) ( not ( = ?auto_555569 ?auto_555566 ) ) ( TRUCK-AT ?auto_555571 ?auto_555572 ) ( AVAILABLE ?auto_555570 ) ( IN ?auto_555566 ?auto_555571 ) ( ON ?auto_555569 ?auto_555568 ) ( not ( = ?auto_555568 ?auto_555569 ) ) ( not ( = ?auto_555568 ?auto_555566 ) ) ( ON ?auto_555568 ?auto_555567 ) ( not ( = ?auto_555567 ?auto_555568 ) ) ( not ( = ?auto_555567 ?auto_555569 ) ) ( not ( = ?auto_555567 ?auto_555566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555568 ?auto_555569 ?auto_555566 )
      ( MAKE-3CRATE-VERIFY ?auto_555567 ?auto_555568 ?auto_555569 ?auto_555566 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555588 - SURFACE
      ?auto_555589 - SURFACE
      ?auto_555590 - SURFACE
      ?auto_555587 - SURFACE
    )
    :vars
    (
      ?auto_555594 - HOIST
      ?auto_555593 - PLACE
      ?auto_555591 - TRUCK
      ?auto_555592 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555594 ?auto_555593 ) ( SURFACE-AT ?auto_555590 ?auto_555593 ) ( CLEAR ?auto_555590 ) ( IS-CRATE ?auto_555587 ) ( not ( = ?auto_555590 ?auto_555587 ) ) ( AVAILABLE ?auto_555594 ) ( IN ?auto_555587 ?auto_555591 ) ( ON ?auto_555590 ?auto_555589 ) ( not ( = ?auto_555589 ?auto_555590 ) ) ( not ( = ?auto_555589 ?auto_555587 ) ) ( TRUCK-AT ?auto_555591 ?auto_555592 ) ( not ( = ?auto_555592 ?auto_555593 ) ) ( ON ?auto_555589 ?auto_555588 ) ( not ( = ?auto_555588 ?auto_555589 ) ) ( not ( = ?auto_555588 ?auto_555590 ) ) ( not ( = ?auto_555588 ?auto_555587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555589 ?auto_555590 ?auto_555587 )
      ( MAKE-3CRATE-VERIFY ?auto_555588 ?auto_555589 ?auto_555590 ?auto_555587 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555612 - SURFACE
      ?auto_555613 - SURFACE
      ?auto_555614 - SURFACE
      ?auto_555611 - SURFACE
    )
    :vars
    (
      ?auto_555617 - HOIST
      ?auto_555619 - PLACE
      ?auto_555616 - TRUCK
      ?auto_555615 - PLACE
      ?auto_555618 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_555617 ?auto_555619 ) ( SURFACE-AT ?auto_555614 ?auto_555619 ) ( CLEAR ?auto_555614 ) ( IS-CRATE ?auto_555611 ) ( not ( = ?auto_555614 ?auto_555611 ) ) ( AVAILABLE ?auto_555617 ) ( ON ?auto_555614 ?auto_555613 ) ( not ( = ?auto_555613 ?auto_555614 ) ) ( not ( = ?auto_555613 ?auto_555611 ) ) ( TRUCK-AT ?auto_555616 ?auto_555615 ) ( not ( = ?auto_555615 ?auto_555619 ) ) ( HOIST-AT ?auto_555618 ?auto_555615 ) ( LIFTING ?auto_555618 ?auto_555611 ) ( not ( = ?auto_555617 ?auto_555618 ) ) ( ON ?auto_555613 ?auto_555612 ) ( not ( = ?auto_555612 ?auto_555613 ) ) ( not ( = ?auto_555612 ?auto_555614 ) ) ( not ( = ?auto_555612 ?auto_555611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555613 ?auto_555614 ?auto_555611 )
      ( MAKE-3CRATE-VERIFY ?auto_555612 ?auto_555613 ?auto_555614 ?auto_555611 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555639 - SURFACE
      ?auto_555640 - SURFACE
      ?auto_555641 - SURFACE
      ?auto_555638 - SURFACE
    )
    :vars
    (
      ?auto_555643 - HOIST
      ?auto_555647 - PLACE
      ?auto_555645 - TRUCK
      ?auto_555646 - PLACE
      ?auto_555644 - HOIST
      ?auto_555642 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555643 ?auto_555647 ) ( SURFACE-AT ?auto_555641 ?auto_555647 ) ( CLEAR ?auto_555641 ) ( IS-CRATE ?auto_555638 ) ( not ( = ?auto_555641 ?auto_555638 ) ) ( AVAILABLE ?auto_555643 ) ( ON ?auto_555641 ?auto_555640 ) ( not ( = ?auto_555640 ?auto_555641 ) ) ( not ( = ?auto_555640 ?auto_555638 ) ) ( TRUCK-AT ?auto_555645 ?auto_555646 ) ( not ( = ?auto_555646 ?auto_555647 ) ) ( HOIST-AT ?auto_555644 ?auto_555646 ) ( not ( = ?auto_555643 ?auto_555644 ) ) ( AVAILABLE ?auto_555644 ) ( SURFACE-AT ?auto_555638 ?auto_555646 ) ( ON ?auto_555638 ?auto_555642 ) ( CLEAR ?auto_555638 ) ( not ( = ?auto_555641 ?auto_555642 ) ) ( not ( = ?auto_555638 ?auto_555642 ) ) ( not ( = ?auto_555640 ?auto_555642 ) ) ( ON ?auto_555640 ?auto_555639 ) ( not ( = ?auto_555639 ?auto_555640 ) ) ( not ( = ?auto_555639 ?auto_555641 ) ) ( not ( = ?auto_555639 ?auto_555638 ) ) ( not ( = ?auto_555639 ?auto_555642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555640 ?auto_555641 ?auto_555638 )
      ( MAKE-3CRATE-VERIFY ?auto_555639 ?auto_555640 ?auto_555641 ?auto_555638 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555667 - SURFACE
      ?auto_555668 - SURFACE
      ?auto_555669 - SURFACE
      ?auto_555666 - SURFACE
    )
    :vars
    (
      ?auto_555674 - HOIST
      ?auto_555670 - PLACE
      ?auto_555675 - PLACE
      ?auto_555673 - HOIST
      ?auto_555671 - SURFACE
      ?auto_555672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555674 ?auto_555670 ) ( SURFACE-AT ?auto_555669 ?auto_555670 ) ( CLEAR ?auto_555669 ) ( IS-CRATE ?auto_555666 ) ( not ( = ?auto_555669 ?auto_555666 ) ) ( AVAILABLE ?auto_555674 ) ( ON ?auto_555669 ?auto_555668 ) ( not ( = ?auto_555668 ?auto_555669 ) ) ( not ( = ?auto_555668 ?auto_555666 ) ) ( not ( = ?auto_555675 ?auto_555670 ) ) ( HOIST-AT ?auto_555673 ?auto_555675 ) ( not ( = ?auto_555674 ?auto_555673 ) ) ( AVAILABLE ?auto_555673 ) ( SURFACE-AT ?auto_555666 ?auto_555675 ) ( ON ?auto_555666 ?auto_555671 ) ( CLEAR ?auto_555666 ) ( not ( = ?auto_555669 ?auto_555671 ) ) ( not ( = ?auto_555666 ?auto_555671 ) ) ( not ( = ?auto_555668 ?auto_555671 ) ) ( TRUCK-AT ?auto_555672 ?auto_555670 ) ( ON ?auto_555668 ?auto_555667 ) ( not ( = ?auto_555667 ?auto_555668 ) ) ( not ( = ?auto_555667 ?auto_555669 ) ) ( not ( = ?auto_555667 ?auto_555666 ) ) ( not ( = ?auto_555667 ?auto_555671 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555668 ?auto_555669 ?auto_555666 )
      ( MAKE-3CRATE-VERIFY ?auto_555667 ?auto_555668 ?auto_555669 ?auto_555666 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555695 - SURFACE
      ?auto_555696 - SURFACE
      ?auto_555697 - SURFACE
      ?auto_555694 - SURFACE
    )
    :vars
    (
      ?auto_555703 - HOIST
      ?auto_555702 - PLACE
      ?auto_555700 - PLACE
      ?auto_555698 - HOIST
      ?auto_555701 - SURFACE
      ?auto_555699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555703 ?auto_555702 ) ( IS-CRATE ?auto_555694 ) ( not ( = ?auto_555697 ?auto_555694 ) ) ( not ( = ?auto_555696 ?auto_555697 ) ) ( not ( = ?auto_555696 ?auto_555694 ) ) ( not ( = ?auto_555700 ?auto_555702 ) ) ( HOIST-AT ?auto_555698 ?auto_555700 ) ( not ( = ?auto_555703 ?auto_555698 ) ) ( AVAILABLE ?auto_555698 ) ( SURFACE-AT ?auto_555694 ?auto_555700 ) ( ON ?auto_555694 ?auto_555701 ) ( CLEAR ?auto_555694 ) ( not ( = ?auto_555697 ?auto_555701 ) ) ( not ( = ?auto_555694 ?auto_555701 ) ) ( not ( = ?auto_555696 ?auto_555701 ) ) ( TRUCK-AT ?auto_555699 ?auto_555702 ) ( SURFACE-AT ?auto_555696 ?auto_555702 ) ( CLEAR ?auto_555696 ) ( LIFTING ?auto_555703 ?auto_555697 ) ( IS-CRATE ?auto_555697 ) ( ON ?auto_555696 ?auto_555695 ) ( not ( = ?auto_555695 ?auto_555696 ) ) ( not ( = ?auto_555695 ?auto_555697 ) ) ( not ( = ?auto_555695 ?auto_555694 ) ) ( not ( = ?auto_555695 ?auto_555701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555696 ?auto_555697 ?auto_555694 )
      ( MAKE-3CRATE-VERIFY ?auto_555695 ?auto_555696 ?auto_555697 ?auto_555694 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555723 - SURFACE
      ?auto_555724 - SURFACE
      ?auto_555725 - SURFACE
      ?auto_555722 - SURFACE
    )
    :vars
    (
      ?auto_555731 - HOIST
      ?auto_555728 - PLACE
      ?auto_555726 - PLACE
      ?auto_555729 - HOIST
      ?auto_555730 - SURFACE
      ?auto_555727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555731 ?auto_555728 ) ( IS-CRATE ?auto_555722 ) ( not ( = ?auto_555725 ?auto_555722 ) ) ( not ( = ?auto_555724 ?auto_555725 ) ) ( not ( = ?auto_555724 ?auto_555722 ) ) ( not ( = ?auto_555726 ?auto_555728 ) ) ( HOIST-AT ?auto_555729 ?auto_555726 ) ( not ( = ?auto_555731 ?auto_555729 ) ) ( AVAILABLE ?auto_555729 ) ( SURFACE-AT ?auto_555722 ?auto_555726 ) ( ON ?auto_555722 ?auto_555730 ) ( CLEAR ?auto_555722 ) ( not ( = ?auto_555725 ?auto_555730 ) ) ( not ( = ?auto_555722 ?auto_555730 ) ) ( not ( = ?auto_555724 ?auto_555730 ) ) ( TRUCK-AT ?auto_555727 ?auto_555728 ) ( SURFACE-AT ?auto_555724 ?auto_555728 ) ( CLEAR ?auto_555724 ) ( IS-CRATE ?auto_555725 ) ( AVAILABLE ?auto_555731 ) ( IN ?auto_555725 ?auto_555727 ) ( ON ?auto_555724 ?auto_555723 ) ( not ( = ?auto_555723 ?auto_555724 ) ) ( not ( = ?auto_555723 ?auto_555725 ) ) ( not ( = ?auto_555723 ?auto_555722 ) ) ( not ( = ?auto_555723 ?auto_555730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555724 ?auto_555725 ?auto_555722 )
      ( MAKE-3CRATE-VERIFY ?auto_555723 ?auto_555724 ?auto_555725 ?auto_555722 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_556014 - SURFACE
      ?auto_556015 - SURFACE
      ?auto_556016 - SURFACE
      ?auto_556013 - SURFACE
      ?auto_556017 - SURFACE
    )
    :vars
    (
      ?auto_556019 - HOIST
      ?auto_556018 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556019 ?auto_556018 ) ( SURFACE-AT ?auto_556013 ?auto_556018 ) ( CLEAR ?auto_556013 ) ( LIFTING ?auto_556019 ?auto_556017 ) ( IS-CRATE ?auto_556017 ) ( not ( = ?auto_556013 ?auto_556017 ) ) ( ON ?auto_556015 ?auto_556014 ) ( ON ?auto_556016 ?auto_556015 ) ( ON ?auto_556013 ?auto_556016 ) ( not ( = ?auto_556014 ?auto_556015 ) ) ( not ( = ?auto_556014 ?auto_556016 ) ) ( not ( = ?auto_556014 ?auto_556013 ) ) ( not ( = ?auto_556014 ?auto_556017 ) ) ( not ( = ?auto_556015 ?auto_556016 ) ) ( not ( = ?auto_556015 ?auto_556013 ) ) ( not ( = ?auto_556015 ?auto_556017 ) ) ( not ( = ?auto_556016 ?auto_556013 ) ) ( not ( = ?auto_556016 ?auto_556017 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_556013 ?auto_556017 )
      ( MAKE-4CRATE-VERIFY ?auto_556014 ?auto_556015 ?auto_556016 ?auto_556013 ?auto_556017 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_556039 - SURFACE
      ?auto_556040 - SURFACE
      ?auto_556041 - SURFACE
      ?auto_556038 - SURFACE
      ?auto_556042 - SURFACE
    )
    :vars
    (
      ?auto_556043 - HOIST
      ?auto_556045 - PLACE
      ?auto_556044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556043 ?auto_556045 ) ( SURFACE-AT ?auto_556038 ?auto_556045 ) ( CLEAR ?auto_556038 ) ( IS-CRATE ?auto_556042 ) ( not ( = ?auto_556038 ?auto_556042 ) ) ( TRUCK-AT ?auto_556044 ?auto_556045 ) ( AVAILABLE ?auto_556043 ) ( IN ?auto_556042 ?auto_556044 ) ( ON ?auto_556038 ?auto_556041 ) ( not ( = ?auto_556041 ?auto_556038 ) ) ( not ( = ?auto_556041 ?auto_556042 ) ) ( ON ?auto_556040 ?auto_556039 ) ( ON ?auto_556041 ?auto_556040 ) ( not ( = ?auto_556039 ?auto_556040 ) ) ( not ( = ?auto_556039 ?auto_556041 ) ) ( not ( = ?auto_556039 ?auto_556038 ) ) ( not ( = ?auto_556039 ?auto_556042 ) ) ( not ( = ?auto_556040 ?auto_556041 ) ) ( not ( = ?auto_556040 ?auto_556038 ) ) ( not ( = ?auto_556040 ?auto_556042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556041 ?auto_556038 ?auto_556042 )
      ( MAKE-4CRATE-VERIFY ?auto_556039 ?auto_556040 ?auto_556041 ?auto_556038 ?auto_556042 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_556069 - SURFACE
      ?auto_556070 - SURFACE
      ?auto_556071 - SURFACE
      ?auto_556068 - SURFACE
      ?auto_556072 - SURFACE
    )
    :vars
    (
      ?auto_556073 - HOIST
      ?auto_556076 - PLACE
      ?auto_556074 - TRUCK
      ?auto_556075 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556073 ?auto_556076 ) ( SURFACE-AT ?auto_556068 ?auto_556076 ) ( CLEAR ?auto_556068 ) ( IS-CRATE ?auto_556072 ) ( not ( = ?auto_556068 ?auto_556072 ) ) ( AVAILABLE ?auto_556073 ) ( IN ?auto_556072 ?auto_556074 ) ( ON ?auto_556068 ?auto_556071 ) ( not ( = ?auto_556071 ?auto_556068 ) ) ( not ( = ?auto_556071 ?auto_556072 ) ) ( TRUCK-AT ?auto_556074 ?auto_556075 ) ( not ( = ?auto_556075 ?auto_556076 ) ) ( ON ?auto_556070 ?auto_556069 ) ( ON ?auto_556071 ?auto_556070 ) ( not ( = ?auto_556069 ?auto_556070 ) ) ( not ( = ?auto_556069 ?auto_556071 ) ) ( not ( = ?auto_556069 ?auto_556068 ) ) ( not ( = ?auto_556069 ?auto_556072 ) ) ( not ( = ?auto_556070 ?auto_556071 ) ) ( not ( = ?auto_556070 ?auto_556068 ) ) ( not ( = ?auto_556070 ?auto_556072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556071 ?auto_556068 ?auto_556072 )
      ( MAKE-4CRATE-VERIFY ?auto_556069 ?auto_556070 ?auto_556071 ?auto_556068 ?auto_556072 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_556103 - SURFACE
      ?auto_556104 - SURFACE
      ?auto_556105 - SURFACE
      ?auto_556102 - SURFACE
      ?auto_556106 - SURFACE
    )
    :vars
    (
      ?auto_556110 - HOIST
      ?auto_556111 - PLACE
      ?auto_556109 - TRUCK
      ?auto_556108 - PLACE
      ?auto_556107 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_556110 ?auto_556111 ) ( SURFACE-AT ?auto_556102 ?auto_556111 ) ( CLEAR ?auto_556102 ) ( IS-CRATE ?auto_556106 ) ( not ( = ?auto_556102 ?auto_556106 ) ) ( AVAILABLE ?auto_556110 ) ( ON ?auto_556102 ?auto_556105 ) ( not ( = ?auto_556105 ?auto_556102 ) ) ( not ( = ?auto_556105 ?auto_556106 ) ) ( TRUCK-AT ?auto_556109 ?auto_556108 ) ( not ( = ?auto_556108 ?auto_556111 ) ) ( HOIST-AT ?auto_556107 ?auto_556108 ) ( LIFTING ?auto_556107 ?auto_556106 ) ( not ( = ?auto_556110 ?auto_556107 ) ) ( ON ?auto_556104 ?auto_556103 ) ( ON ?auto_556105 ?auto_556104 ) ( not ( = ?auto_556103 ?auto_556104 ) ) ( not ( = ?auto_556103 ?auto_556105 ) ) ( not ( = ?auto_556103 ?auto_556102 ) ) ( not ( = ?auto_556103 ?auto_556106 ) ) ( not ( = ?auto_556104 ?auto_556105 ) ) ( not ( = ?auto_556104 ?auto_556102 ) ) ( not ( = ?auto_556104 ?auto_556106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556105 ?auto_556102 ?auto_556106 )
      ( MAKE-4CRATE-VERIFY ?auto_556103 ?auto_556104 ?auto_556105 ?auto_556102 ?auto_556106 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_556141 - SURFACE
      ?auto_556142 - SURFACE
      ?auto_556143 - SURFACE
      ?auto_556140 - SURFACE
      ?auto_556144 - SURFACE
    )
    :vars
    (
      ?auto_556145 - HOIST
      ?auto_556148 - PLACE
      ?auto_556149 - TRUCK
      ?auto_556147 - PLACE
      ?auto_556146 - HOIST
      ?auto_556150 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556145 ?auto_556148 ) ( SURFACE-AT ?auto_556140 ?auto_556148 ) ( CLEAR ?auto_556140 ) ( IS-CRATE ?auto_556144 ) ( not ( = ?auto_556140 ?auto_556144 ) ) ( AVAILABLE ?auto_556145 ) ( ON ?auto_556140 ?auto_556143 ) ( not ( = ?auto_556143 ?auto_556140 ) ) ( not ( = ?auto_556143 ?auto_556144 ) ) ( TRUCK-AT ?auto_556149 ?auto_556147 ) ( not ( = ?auto_556147 ?auto_556148 ) ) ( HOIST-AT ?auto_556146 ?auto_556147 ) ( not ( = ?auto_556145 ?auto_556146 ) ) ( AVAILABLE ?auto_556146 ) ( SURFACE-AT ?auto_556144 ?auto_556147 ) ( ON ?auto_556144 ?auto_556150 ) ( CLEAR ?auto_556144 ) ( not ( = ?auto_556140 ?auto_556150 ) ) ( not ( = ?auto_556144 ?auto_556150 ) ) ( not ( = ?auto_556143 ?auto_556150 ) ) ( ON ?auto_556142 ?auto_556141 ) ( ON ?auto_556143 ?auto_556142 ) ( not ( = ?auto_556141 ?auto_556142 ) ) ( not ( = ?auto_556141 ?auto_556143 ) ) ( not ( = ?auto_556141 ?auto_556140 ) ) ( not ( = ?auto_556141 ?auto_556144 ) ) ( not ( = ?auto_556141 ?auto_556150 ) ) ( not ( = ?auto_556142 ?auto_556143 ) ) ( not ( = ?auto_556142 ?auto_556140 ) ) ( not ( = ?auto_556142 ?auto_556144 ) ) ( not ( = ?auto_556142 ?auto_556150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556143 ?auto_556140 ?auto_556144 )
      ( MAKE-4CRATE-VERIFY ?auto_556141 ?auto_556142 ?auto_556143 ?auto_556140 ?auto_556144 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_556180 - SURFACE
      ?auto_556181 - SURFACE
      ?auto_556182 - SURFACE
      ?auto_556179 - SURFACE
      ?auto_556183 - SURFACE
    )
    :vars
    (
      ?auto_556184 - HOIST
      ?auto_556187 - PLACE
      ?auto_556189 - PLACE
      ?auto_556186 - HOIST
      ?auto_556188 - SURFACE
      ?auto_556185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556184 ?auto_556187 ) ( SURFACE-AT ?auto_556179 ?auto_556187 ) ( CLEAR ?auto_556179 ) ( IS-CRATE ?auto_556183 ) ( not ( = ?auto_556179 ?auto_556183 ) ) ( AVAILABLE ?auto_556184 ) ( ON ?auto_556179 ?auto_556182 ) ( not ( = ?auto_556182 ?auto_556179 ) ) ( not ( = ?auto_556182 ?auto_556183 ) ) ( not ( = ?auto_556189 ?auto_556187 ) ) ( HOIST-AT ?auto_556186 ?auto_556189 ) ( not ( = ?auto_556184 ?auto_556186 ) ) ( AVAILABLE ?auto_556186 ) ( SURFACE-AT ?auto_556183 ?auto_556189 ) ( ON ?auto_556183 ?auto_556188 ) ( CLEAR ?auto_556183 ) ( not ( = ?auto_556179 ?auto_556188 ) ) ( not ( = ?auto_556183 ?auto_556188 ) ) ( not ( = ?auto_556182 ?auto_556188 ) ) ( TRUCK-AT ?auto_556185 ?auto_556187 ) ( ON ?auto_556181 ?auto_556180 ) ( ON ?auto_556182 ?auto_556181 ) ( not ( = ?auto_556180 ?auto_556181 ) ) ( not ( = ?auto_556180 ?auto_556182 ) ) ( not ( = ?auto_556180 ?auto_556179 ) ) ( not ( = ?auto_556180 ?auto_556183 ) ) ( not ( = ?auto_556180 ?auto_556188 ) ) ( not ( = ?auto_556181 ?auto_556182 ) ) ( not ( = ?auto_556181 ?auto_556179 ) ) ( not ( = ?auto_556181 ?auto_556183 ) ) ( not ( = ?auto_556181 ?auto_556188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556182 ?auto_556179 ?auto_556183 )
      ( MAKE-4CRATE-VERIFY ?auto_556180 ?auto_556181 ?auto_556182 ?auto_556179 ?auto_556183 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_556219 - SURFACE
      ?auto_556220 - SURFACE
      ?auto_556221 - SURFACE
      ?auto_556218 - SURFACE
      ?auto_556222 - SURFACE
    )
    :vars
    (
      ?auto_556228 - HOIST
      ?auto_556224 - PLACE
      ?auto_556227 - PLACE
      ?auto_556223 - HOIST
      ?auto_556225 - SURFACE
      ?auto_556226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556228 ?auto_556224 ) ( IS-CRATE ?auto_556222 ) ( not ( = ?auto_556218 ?auto_556222 ) ) ( not ( = ?auto_556221 ?auto_556218 ) ) ( not ( = ?auto_556221 ?auto_556222 ) ) ( not ( = ?auto_556227 ?auto_556224 ) ) ( HOIST-AT ?auto_556223 ?auto_556227 ) ( not ( = ?auto_556228 ?auto_556223 ) ) ( AVAILABLE ?auto_556223 ) ( SURFACE-AT ?auto_556222 ?auto_556227 ) ( ON ?auto_556222 ?auto_556225 ) ( CLEAR ?auto_556222 ) ( not ( = ?auto_556218 ?auto_556225 ) ) ( not ( = ?auto_556222 ?auto_556225 ) ) ( not ( = ?auto_556221 ?auto_556225 ) ) ( TRUCK-AT ?auto_556226 ?auto_556224 ) ( SURFACE-AT ?auto_556221 ?auto_556224 ) ( CLEAR ?auto_556221 ) ( LIFTING ?auto_556228 ?auto_556218 ) ( IS-CRATE ?auto_556218 ) ( ON ?auto_556220 ?auto_556219 ) ( ON ?auto_556221 ?auto_556220 ) ( not ( = ?auto_556219 ?auto_556220 ) ) ( not ( = ?auto_556219 ?auto_556221 ) ) ( not ( = ?auto_556219 ?auto_556218 ) ) ( not ( = ?auto_556219 ?auto_556222 ) ) ( not ( = ?auto_556219 ?auto_556225 ) ) ( not ( = ?auto_556220 ?auto_556221 ) ) ( not ( = ?auto_556220 ?auto_556218 ) ) ( not ( = ?auto_556220 ?auto_556222 ) ) ( not ( = ?auto_556220 ?auto_556225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556221 ?auto_556218 ?auto_556222 )
      ( MAKE-4CRATE-VERIFY ?auto_556219 ?auto_556220 ?auto_556221 ?auto_556218 ?auto_556222 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_556258 - SURFACE
      ?auto_556259 - SURFACE
      ?auto_556260 - SURFACE
      ?auto_556257 - SURFACE
      ?auto_556261 - SURFACE
    )
    :vars
    (
      ?auto_556267 - HOIST
      ?auto_556262 - PLACE
      ?auto_556266 - PLACE
      ?auto_556263 - HOIST
      ?auto_556265 - SURFACE
      ?auto_556264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556267 ?auto_556262 ) ( IS-CRATE ?auto_556261 ) ( not ( = ?auto_556257 ?auto_556261 ) ) ( not ( = ?auto_556260 ?auto_556257 ) ) ( not ( = ?auto_556260 ?auto_556261 ) ) ( not ( = ?auto_556266 ?auto_556262 ) ) ( HOIST-AT ?auto_556263 ?auto_556266 ) ( not ( = ?auto_556267 ?auto_556263 ) ) ( AVAILABLE ?auto_556263 ) ( SURFACE-AT ?auto_556261 ?auto_556266 ) ( ON ?auto_556261 ?auto_556265 ) ( CLEAR ?auto_556261 ) ( not ( = ?auto_556257 ?auto_556265 ) ) ( not ( = ?auto_556261 ?auto_556265 ) ) ( not ( = ?auto_556260 ?auto_556265 ) ) ( TRUCK-AT ?auto_556264 ?auto_556262 ) ( SURFACE-AT ?auto_556260 ?auto_556262 ) ( CLEAR ?auto_556260 ) ( IS-CRATE ?auto_556257 ) ( AVAILABLE ?auto_556267 ) ( IN ?auto_556257 ?auto_556264 ) ( ON ?auto_556259 ?auto_556258 ) ( ON ?auto_556260 ?auto_556259 ) ( not ( = ?auto_556258 ?auto_556259 ) ) ( not ( = ?auto_556258 ?auto_556260 ) ) ( not ( = ?auto_556258 ?auto_556257 ) ) ( not ( = ?auto_556258 ?auto_556261 ) ) ( not ( = ?auto_556258 ?auto_556265 ) ) ( not ( = ?auto_556259 ?auto_556260 ) ) ( not ( = ?auto_556259 ?auto_556257 ) ) ( not ( = ?auto_556259 ?auto_556261 ) ) ( not ( = ?auto_556259 ?auto_556265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556260 ?auto_556257 ?auto_556261 )
      ( MAKE-4CRATE-VERIFY ?auto_556258 ?auto_556259 ?auto_556260 ?auto_556257 ?auto_556261 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_556268 - SURFACE
      ?auto_556269 - SURFACE
    )
    :vars
    (
      ?auto_556276 - HOIST
      ?auto_556271 - PLACE
      ?auto_556270 - SURFACE
      ?auto_556275 - PLACE
      ?auto_556272 - HOIST
      ?auto_556274 - SURFACE
      ?auto_556273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556276 ?auto_556271 ) ( IS-CRATE ?auto_556269 ) ( not ( = ?auto_556268 ?auto_556269 ) ) ( not ( = ?auto_556270 ?auto_556268 ) ) ( not ( = ?auto_556270 ?auto_556269 ) ) ( not ( = ?auto_556275 ?auto_556271 ) ) ( HOIST-AT ?auto_556272 ?auto_556275 ) ( not ( = ?auto_556276 ?auto_556272 ) ) ( AVAILABLE ?auto_556272 ) ( SURFACE-AT ?auto_556269 ?auto_556275 ) ( ON ?auto_556269 ?auto_556274 ) ( CLEAR ?auto_556269 ) ( not ( = ?auto_556268 ?auto_556274 ) ) ( not ( = ?auto_556269 ?auto_556274 ) ) ( not ( = ?auto_556270 ?auto_556274 ) ) ( SURFACE-AT ?auto_556270 ?auto_556271 ) ( CLEAR ?auto_556270 ) ( IS-CRATE ?auto_556268 ) ( AVAILABLE ?auto_556276 ) ( IN ?auto_556268 ?auto_556273 ) ( TRUCK-AT ?auto_556273 ?auto_556275 ) )
    :subtasks
    ( ( !DRIVE ?auto_556273 ?auto_556275 ?auto_556271 )
      ( MAKE-2CRATE ?auto_556270 ?auto_556268 ?auto_556269 )
      ( MAKE-1CRATE-VERIFY ?auto_556268 ?auto_556269 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_556277 - SURFACE
      ?auto_556278 - SURFACE
      ?auto_556279 - SURFACE
    )
    :vars
    (
      ?auto_556281 - HOIST
      ?auto_556282 - PLACE
      ?auto_556280 - PLACE
      ?auto_556284 - HOIST
      ?auto_556283 - SURFACE
      ?auto_556285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556281 ?auto_556282 ) ( IS-CRATE ?auto_556279 ) ( not ( = ?auto_556278 ?auto_556279 ) ) ( not ( = ?auto_556277 ?auto_556278 ) ) ( not ( = ?auto_556277 ?auto_556279 ) ) ( not ( = ?auto_556280 ?auto_556282 ) ) ( HOIST-AT ?auto_556284 ?auto_556280 ) ( not ( = ?auto_556281 ?auto_556284 ) ) ( AVAILABLE ?auto_556284 ) ( SURFACE-AT ?auto_556279 ?auto_556280 ) ( ON ?auto_556279 ?auto_556283 ) ( CLEAR ?auto_556279 ) ( not ( = ?auto_556278 ?auto_556283 ) ) ( not ( = ?auto_556279 ?auto_556283 ) ) ( not ( = ?auto_556277 ?auto_556283 ) ) ( SURFACE-AT ?auto_556277 ?auto_556282 ) ( CLEAR ?auto_556277 ) ( IS-CRATE ?auto_556278 ) ( AVAILABLE ?auto_556281 ) ( IN ?auto_556278 ?auto_556285 ) ( TRUCK-AT ?auto_556285 ?auto_556280 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_556278 ?auto_556279 )
      ( MAKE-2CRATE-VERIFY ?auto_556277 ?auto_556278 ?auto_556279 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_556287 - SURFACE
      ?auto_556288 - SURFACE
      ?auto_556289 - SURFACE
      ?auto_556286 - SURFACE
    )
    :vars
    (
      ?auto_556290 - HOIST
      ?auto_556295 - PLACE
      ?auto_556292 - PLACE
      ?auto_556294 - HOIST
      ?auto_556293 - SURFACE
      ?auto_556291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556290 ?auto_556295 ) ( IS-CRATE ?auto_556286 ) ( not ( = ?auto_556289 ?auto_556286 ) ) ( not ( = ?auto_556288 ?auto_556289 ) ) ( not ( = ?auto_556288 ?auto_556286 ) ) ( not ( = ?auto_556292 ?auto_556295 ) ) ( HOIST-AT ?auto_556294 ?auto_556292 ) ( not ( = ?auto_556290 ?auto_556294 ) ) ( AVAILABLE ?auto_556294 ) ( SURFACE-AT ?auto_556286 ?auto_556292 ) ( ON ?auto_556286 ?auto_556293 ) ( CLEAR ?auto_556286 ) ( not ( = ?auto_556289 ?auto_556293 ) ) ( not ( = ?auto_556286 ?auto_556293 ) ) ( not ( = ?auto_556288 ?auto_556293 ) ) ( SURFACE-AT ?auto_556288 ?auto_556295 ) ( CLEAR ?auto_556288 ) ( IS-CRATE ?auto_556289 ) ( AVAILABLE ?auto_556290 ) ( IN ?auto_556289 ?auto_556291 ) ( TRUCK-AT ?auto_556291 ?auto_556292 ) ( ON ?auto_556288 ?auto_556287 ) ( not ( = ?auto_556287 ?auto_556288 ) ) ( not ( = ?auto_556287 ?auto_556289 ) ) ( not ( = ?auto_556287 ?auto_556286 ) ) ( not ( = ?auto_556287 ?auto_556293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556288 ?auto_556289 ?auto_556286 )
      ( MAKE-3CRATE-VERIFY ?auto_556287 ?auto_556288 ?auto_556289 ?auto_556286 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_556297 - SURFACE
      ?auto_556298 - SURFACE
      ?auto_556299 - SURFACE
      ?auto_556296 - SURFACE
      ?auto_556300 - SURFACE
    )
    :vars
    (
      ?auto_556301 - HOIST
      ?auto_556306 - PLACE
      ?auto_556303 - PLACE
      ?auto_556305 - HOIST
      ?auto_556304 - SURFACE
      ?auto_556302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556301 ?auto_556306 ) ( IS-CRATE ?auto_556300 ) ( not ( = ?auto_556296 ?auto_556300 ) ) ( not ( = ?auto_556299 ?auto_556296 ) ) ( not ( = ?auto_556299 ?auto_556300 ) ) ( not ( = ?auto_556303 ?auto_556306 ) ) ( HOIST-AT ?auto_556305 ?auto_556303 ) ( not ( = ?auto_556301 ?auto_556305 ) ) ( AVAILABLE ?auto_556305 ) ( SURFACE-AT ?auto_556300 ?auto_556303 ) ( ON ?auto_556300 ?auto_556304 ) ( CLEAR ?auto_556300 ) ( not ( = ?auto_556296 ?auto_556304 ) ) ( not ( = ?auto_556300 ?auto_556304 ) ) ( not ( = ?auto_556299 ?auto_556304 ) ) ( SURFACE-AT ?auto_556299 ?auto_556306 ) ( CLEAR ?auto_556299 ) ( IS-CRATE ?auto_556296 ) ( AVAILABLE ?auto_556301 ) ( IN ?auto_556296 ?auto_556302 ) ( TRUCK-AT ?auto_556302 ?auto_556303 ) ( ON ?auto_556298 ?auto_556297 ) ( ON ?auto_556299 ?auto_556298 ) ( not ( = ?auto_556297 ?auto_556298 ) ) ( not ( = ?auto_556297 ?auto_556299 ) ) ( not ( = ?auto_556297 ?auto_556296 ) ) ( not ( = ?auto_556297 ?auto_556300 ) ) ( not ( = ?auto_556297 ?auto_556304 ) ) ( not ( = ?auto_556298 ?auto_556299 ) ) ( not ( = ?auto_556298 ?auto_556296 ) ) ( not ( = ?auto_556298 ?auto_556300 ) ) ( not ( = ?auto_556298 ?auto_556304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556299 ?auto_556296 ?auto_556300 )
      ( MAKE-4CRATE-VERIFY ?auto_556297 ?auto_556298 ?auto_556299 ?auto_556296 ?auto_556300 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_556307 - SURFACE
      ?auto_556308 - SURFACE
    )
    :vars
    (
      ?auto_556309 - HOIST
      ?auto_556315 - PLACE
      ?auto_556313 - SURFACE
      ?auto_556311 - PLACE
      ?auto_556314 - HOIST
      ?auto_556312 - SURFACE
      ?auto_556310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556309 ?auto_556315 ) ( IS-CRATE ?auto_556308 ) ( not ( = ?auto_556307 ?auto_556308 ) ) ( not ( = ?auto_556313 ?auto_556307 ) ) ( not ( = ?auto_556313 ?auto_556308 ) ) ( not ( = ?auto_556311 ?auto_556315 ) ) ( HOIST-AT ?auto_556314 ?auto_556311 ) ( not ( = ?auto_556309 ?auto_556314 ) ) ( SURFACE-AT ?auto_556308 ?auto_556311 ) ( ON ?auto_556308 ?auto_556312 ) ( CLEAR ?auto_556308 ) ( not ( = ?auto_556307 ?auto_556312 ) ) ( not ( = ?auto_556308 ?auto_556312 ) ) ( not ( = ?auto_556313 ?auto_556312 ) ) ( SURFACE-AT ?auto_556313 ?auto_556315 ) ( CLEAR ?auto_556313 ) ( IS-CRATE ?auto_556307 ) ( AVAILABLE ?auto_556309 ) ( TRUCK-AT ?auto_556310 ?auto_556311 ) ( LIFTING ?auto_556314 ?auto_556307 ) )
    :subtasks
    ( ( !LOAD ?auto_556314 ?auto_556307 ?auto_556310 ?auto_556311 )
      ( MAKE-2CRATE ?auto_556313 ?auto_556307 ?auto_556308 )
      ( MAKE-1CRATE-VERIFY ?auto_556307 ?auto_556308 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_556316 - SURFACE
      ?auto_556317 - SURFACE
      ?auto_556318 - SURFACE
    )
    :vars
    (
      ?auto_556321 - HOIST
      ?auto_556319 - PLACE
      ?auto_556323 - PLACE
      ?auto_556324 - HOIST
      ?auto_556320 - SURFACE
      ?auto_556322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556321 ?auto_556319 ) ( IS-CRATE ?auto_556318 ) ( not ( = ?auto_556317 ?auto_556318 ) ) ( not ( = ?auto_556316 ?auto_556317 ) ) ( not ( = ?auto_556316 ?auto_556318 ) ) ( not ( = ?auto_556323 ?auto_556319 ) ) ( HOIST-AT ?auto_556324 ?auto_556323 ) ( not ( = ?auto_556321 ?auto_556324 ) ) ( SURFACE-AT ?auto_556318 ?auto_556323 ) ( ON ?auto_556318 ?auto_556320 ) ( CLEAR ?auto_556318 ) ( not ( = ?auto_556317 ?auto_556320 ) ) ( not ( = ?auto_556318 ?auto_556320 ) ) ( not ( = ?auto_556316 ?auto_556320 ) ) ( SURFACE-AT ?auto_556316 ?auto_556319 ) ( CLEAR ?auto_556316 ) ( IS-CRATE ?auto_556317 ) ( AVAILABLE ?auto_556321 ) ( TRUCK-AT ?auto_556322 ?auto_556323 ) ( LIFTING ?auto_556324 ?auto_556317 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_556317 ?auto_556318 )
      ( MAKE-2CRATE-VERIFY ?auto_556316 ?auto_556317 ?auto_556318 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_556326 - SURFACE
      ?auto_556327 - SURFACE
      ?auto_556328 - SURFACE
      ?auto_556325 - SURFACE
    )
    :vars
    (
      ?auto_556333 - HOIST
      ?auto_556334 - PLACE
      ?auto_556332 - PLACE
      ?auto_556331 - HOIST
      ?auto_556330 - SURFACE
      ?auto_556329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556333 ?auto_556334 ) ( IS-CRATE ?auto_556325 ) ( not ( = ?auto_556328 ?auto_556325 ) ) ( not ( = ?auto_556327 ?auto_556328 ) ) ( not ( = ?auto_556327 ?auto_556325 ) ) ( not ( = ?auto_556332 ?auto_556334 ) ) ( HOIST-AT ?auto_556331 ?auto_556332 ) ( not ( = ?auto_556333 ?auto_556331 ) ) ( SURFACE-AT ?auto_556325 ?auto_556332 ) ( ON ?auto_556325 ?auto_556330 ) ( CLEAR ?auto_556325 ) ( not ( = ?auto_556328 ?auto_556330 ) ) ( not ( = ?auto_556325 ?auto_556330 ) ) ( not ( = ?auto_556327 ?auto_556330 ) ) ( SURFACE-AT ?auto_556327 ?auto_556334 ) ( CLEAR ?auto_556327 ) ( IS-CRATE ?auto_556328 ) ( AVAILABLE ?auto_556333 ) ( TRUCK-AT ?auto_556329 ?auto_556332 ) ( LIFTING ?auto_556331 ?auto_556328 ) ( ON ?auto_556327 ?auto_556326 ) ( not ( = ?auto_556326 ?auto_556327 ) ) ( not ( = ?auto_556326 ?auto_556328 ) ) ( not ( = ?auto_556326 ?auto_556325 ) ) ( not ( = ?auto_556326 ?auto_556330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556327 ?auto_556328 ?auto_556325 )
      ( MAKE-3CRATE-VERIFY ?auto_556326 ?auto_556327 ?auto_556328 ?auto_556325 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_556336 - SURFACE
      ?auto_556337 - SURFACE
      ?auto_556338 - SURFACE
      ?auto_556335 - SURFACE
      ?auto_556339 - SURFACE
    )
    :vars
    (
      ?auto_556344 - HOIST
      ?auto_556345 - PLACE
      ?auto_556343 - PLACE
      ?auto_556342 - HOIST
      ?auto_556341 - SURFACE
      ?auto_556340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556344 ?auto_556345 ) ( IS-CRATE ?auto_556339 ) ( not ( = ?auto_556335 ?auto_556339 ) ) ( not ( = ?auto_556338 ?auto_556335 ) ) ( not ( = ?auto_556338 ?auto_556339 ) ) ( not ( = ?auto_556343 ?auto_556345 ) ) ( HOIST-AT ?auto_556342 ?auto_556343 ) ( not ( = ?auto_556344 ?auto_556342 ) ) ( SURFACE-AT ?auto_556339 ?auto_556343 ) ( ON ?auto_556339 ?auto_556341 ) ( CLEAR ?auto_556339 ) ( not ( = ?auto_556335 ?auto_556341 ) ) ( not ( = ?auto_556339 ?auto_556341 ) ) ( not ( = ?auto_556338 ?auto_556341 ) ) ( SURFACE-AT ?auto_556338 ?auto_556345 ) ( CLEAR ?auto_556338 ) ( IS-CRATE ?auto_556335 ) ( AVAILABLE ?auto_556344 ) ( TRUCK-AT ?auto_556340 ?auto_556343 ) ( LIFTING ?auto_556342 ?auto_556335 ) ( ON ?auto_556337 ?auto_556336 ) ( ON ?auto_556338 ?auto_556337 ) ( not ( = ?auto_556336 ?auto_556337 ) ) ( not ( = ?auto_556336 ?auto_556338 ) ) ( not ( = ?auto_556336 ?auto_556335 ) ) ( not ( = ?auto_556336 ?auto_556339 ) ) ( not ( = ?auto_556336 ?auto_556341 ) ) ( not ( = ?auto_556337 ?auto_556338 ) ) ( not ( = ?auto_556337 ?auto_556335 ) ) ( not ( = ?auto_556337 ?auto_556339 ) ) ( not ( = ?auto_556337 ?auto_556341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556338 ?auto_556335 ?auto_556339 )
      ( MAKE-4CRATE-VERIFY ?auto_556336 ?auto_556337 ?auto_556338 ?auto_556335 ?auto_556339 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_556346 - SURFACE
      ?auto_556347 - SURFACE
    )
    :vars
    (
      ?auto_556353 - HOIST
      ?auto_556354 - PLACE
      ?auto_556351 - SURFACE
      ?auto_556352 - PLACE
      ?auto_556350 - HOIST
      ?auto_556349 - SURFACE
      ?auto_556348 - TRUCK
      ?auto_556355 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556353 ?auto_556354 ) ( IS-CRATE ?auto_556347 ) ( not ( = ?auto_556346 ?auto_556347 ) ) ( not ( = ?auto_556351 ?auto_556346 ) ) ( not ( = ?auto_556351 ?auto_556347 ) ) ( not ( = ?auto_556352 ?auto_556354 ) ) ( HOIST-AT ?auto_556350 ?auto_556352 ) ( not ( = ?auto_556353 ?auto_556350 ) ) ( SURFACE-AT ?auto_556347 ?auto_556352 ) ( ON ?auto_556347 ?auto_556349 ) ( CLEAR ?auto_556347 ) ( not ( = ?auto_556346 ?auto_556349 ) ) ( not ( = ?auto_556347 ?auto_556349 ) ) ( not ( = ?auto_556351 ?auto_556349 ) ) ( SURFACE-AT ?auto_556351 ?auto_556354 ) ( CLEAR ?auto_556351 ) ( IS-CRATE ?auto_556346 ) ( AVAILABLE ?auto_556353 ) ( TRUCK-AT ?auto_556348 ?auto_556352 ) ( AVAILABLE ?auto_556350 ) ( SURFACE-AT ?auto_556346 ?auto_556352 ) ( ON ?auto_556346 ?auto_556355 ) ( CLEAR ?auto_556346 ) ( not ( = ?auto_556346 ?auto_556355 ) ) ( not ( = ?auto_556347 ?auto_556355 ) ) ( not ( = ?auto_556351 ?auto_556355 ) ) ( not ( = ?auto_556349 ?auto_556355 ) ) )
    :subtasks
    ( ( !LIFT ?auto_556350 ?auto_556346 ?auto_556355 ?auto_556352 )
      ( MAKE-2CRATE ?auto_556351 ?auto_556346 ?auto_556347 )
      ( MAKE-1CRATE-VERIFY ?auto_556346 ?auto_556347 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_556356 - SURFACE
      ?auto_556357 - SURFACE
      ?auto_556358 - SURFACE
    )
    :vars
    (
      ?auto_556365 - HOIST
      ?auto_556364 - PLACE
      ?auto_556363 - PLACE
      ?auto_556361 - HOIST
      ?auto_556359 - SURFACE
      ?auto_556360 - TRUCK
      ?auto_556362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556365 ?auto_556364 ) ( IS-CRATE ?auto_556358 ) ( not ( = ?auto_556357 ?auto_556358 ) ) ( not ( = ?auto_556356 ?auto_556357 ) ) ( not ( = ?auto_556356 ?auto_556358 ) ) ( not ( = ?auto_556363 ?auto_556364 ) ) ( HOIST-AT ?auto_556361 ?auto_556363 ) ( not ( = ?auto_556365 ?auto_556361 ) ) ( SURFACE-AT ?auto_556358 ?auto_556363 ) ( ON ?auto_556358 ?auto_556359 ) ( CLEAR ?auto_556358 ) ( not ( = ?auto_556357 ?auto_556359 ) ) ( not ( = ?auto_556358 ?auto_556359 ) ) ( not ( = ?auto_556356 ?auto_556359 ) ) ( SURFACE-AT ?auto_556356 ?auto_556364 ) ( CLEAR ?auto_556356 ) ( IS-CRATE ?auto_556357 ) ( AVAILABLE ?auto_556365 ) ( TRUCK-AT ?auto_556360 ?auto_556363 ) ( AVAILABLE ?auto_556361 ) ( SURFACE-AT ?auto_556357 ?auto_556363 ) ( ON ?auto_556357 ?auto_556362 ) ( CLEAR ?auto_556357 ) ( not ( = ?auto_556357 ?auto_556362 ) ) ( not ( = ?auto_556358 ?auto_556362 ) ) ( not ( = ?auto_556356 ?auto_556362 ) ) ( not ( = ?auto_556359 ?auto_556362 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_556357 ?auto_556358 )
      ( MAKE-2CRATE-VERIFY ?auto_556356 ?auto_556357 ?auto_556358 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_556367 - SURFACE
      ?auto_556368 - SURFACE
      ?auto_556369 - SURFACE
      ?auto_556366 - SURFACE
    )
    :vars
    (
      ?auto_556372 - HOIST
      ?auto_556375 - PLACE
      ?auto_556373 - PLACE
      ?auto_556374 - HOIST
      ?auto_556370 - SURFACE
      ?auto_556376 - TRUCK
      ?auto_556371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556372 ?auto_556375 ) ( IS-CRATE ?auto_556366 ) ( not ( = ?auto_556369 ?auto_556366 ) ) ( not ( = ?auto_556368 ?auto_556369 ) ) ( not ( = ?auto_556368 ?auto_556366 ) ) ( not ( = ?auto_556373 ?auto_556375 ) ) ( HOIST-AT ?auto_556374 ?auto_556373 ) ( not ( = ?auto_556372 ?auto_556374 ) ) ( SURFACE-AT ?auto_556366 ?auto_556373 ) ( ON ?auto_556366 ?auto_556370 ) ( CLEAR ?auto_556366 ) ( not ( = ?auto_556369 ?auto_556370 ) ) ( not ( = ?auto_556366 ?auto_556370 ) ) ( not ( = ?auto_556368 ?auto_556370 ) ) ( SURFACE-AT ?auto_556368 ?auto_556375 ) ( CLEAR ?auto_556368 ) ( IS-CRATE ?auto_556369 ) ( AVAILABLE ?auto_556372 ) ( TRUCK-AT ?auto_556376 ?auto_556373 ) ( AVAILABLE ?auto_556374 ) ( SURFACE-AT ?auto_556369 ?auto_556373 ) ( ON ?auto_556369 ?auto_556371 ) ( CLEAR ?auto_556369 ) ( not ( = ?auto_556369 ?auto_556371 ) ) ( not ( = ?auto_556366 ?auto_556371 ) ) ( not ( = ?auto_556368 ?auto_556371 ) ) ( not ( = ?auto_556370 ?auto_556371 ) ) ( ON ?auto_556368 ?auto_556367 ) ( not ( = ?auto_556367 ?auto_556368 ) ) ( not ( = ?auto_556367 ?auto_556369 ) ) ( not ( = ?auto_556367 ?auto_556366 ) ) ( not ( = ?auto_556367 ?auto_556370 ) ) ( not ( = ?auto_556367 ?auto_556371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556368 ?auto_556369 ?auto_556366 )
      ( MAKE-3CRATE-VERIFY ?auto_556367 ?auto_556368 ?auto_556369 ?auto_556366 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_556378 - SURFACE
      ?auto_556379 - SURFACE
      ?auto_556380 - SURFACE
      ?auto_556377 - SURFACE
      ?auto_556381 - SURFACE
    )
    :vars
    (
      ?auto_556384 - HOIST
      ?auto_556387 - PLACE
      ?auto_556385 - PLACE
      ?auto_556386 - HOIST
      ?auto_556382 - SURFACE
      ?auto_556388 - TRUCK
      ?auto_556383 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556384 ?auto_556387 ) ( IS-CRATE ?auto_556381 ) ( not ( = ?auto_556377 ?auto_556381 ) ) ( not ( = ?auto_556380 ?auto_556377 ) ) ( not ( = ?auto_556380 ?auto_556381 ) ) ( not ( = ?auto_556385 ?auto_556387 ) ) ( HOIST-AT ?auto_556386 ?auto_556385 ) ( not ( = ?auto_556384 ?auto_556386 ) ) ( SURFACE-AT ?auto_556381 ?auto_556385 ) ( ON ?auto_556381 ?auto_556382 ) ( CLEAR ?auto_556381 ) ( not ( = ?auto_556377 ?auto_556382 ) ) ( not ( = ?auto_556381 ?auto_556382 ) ) ( not ( = ?auto_556380 ?auto_556382 ) ) ( SURFACE-AT ?auto_556380 ?auto_556387 ) ( CLEAR ?auto_556380 ) ( IS-CRATE ?auto_556377 ) ( AVAILABLE ?auto_556384 ) ( TRUCK-AT ?auto_556388 ?auto_556385 ) ( AVAILABLE ?auto_556386 ) ( SURFACE-AT ?auto_556377 ?auto_556385 ) ( ON ?auto_556377 ?auto_556383 ) ( CLEAR ?auto_556377 ) ( not ( = ?auto_556377 ?auto_556383 ) ) ( not ( = ?auto_556381 ?auto_556383 ) ) ( not ( = ?auto_556380 ?auto_556383 ) ) ( not ( = ?auto_556382 ?auto_556383 ) ) ( ON ?auto_556379 ?auto_556378 ) ( ON ?auto_556380 ?auto_556379 ) ( not ( = ?auto_556378 ?auto_556379 ) ) ( not ( = ?auto_556378 ?auto_556380 ) ) ( not ( = ?auto_556378 ?auto_556377 ) ) ( not ( = ?auto_556378 ?auto_556381 ) ) ( not ( = ?auto_556378 ?auto_556382 ) ) ( not ( = ?auto_556378 ?auto_556383 ) ) ( not ( = ?auto_556379 ?auto_556380 ) ) ( not ( = ?auto_556379 ?auto_556377 ) ) ( not ( = ?auto_556379 ?auto_556381 ) ) ( not ( = ?auto_556379 ?auto_556382 ) ) ( not ( = ?auto_556379 ?auto_556383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556380 ?auto_556377 ?auto_556381 )
      ( MAKE-4CRATE-VERIFY ?auto_556378 ?auto_556379 ?auto_556380 ?auto_556377 ?auto_556381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_556389 - SURFACE
      ?auto_556390 - SURFACE
    )
    :vars
    (
      ?auto_556393 - HOIST
      ?auto_556396 - PLACE
      ?auto_556398 - SURFACE
      ?auto_556394 - PLACE
      ?auto_556395 - HOIST
      ?auto_556391 - SURFACE
      ?auto_556392 - SURFACE
      ?auto_556397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556393 ?auto_556396 ) ( IS-CRATE ?auto_556390 ) ( not ( = ?auto_556389 ?auto_556390 ) ) ( not ( = ?auto_556398 ?auto_556389 ) ) ( not ( = ?auto_556398 ?auto_556390 ) ) ( not ( = ?auto_556394 ?auto_556396 ) ) ( HOIST-AT ?auto_556395 ?auto_556394 ) ( not ( = ?auto_556393 ?auto_556395 ) ) ( SURFACE-AT ?auto_556390 ?auto_556394 ) ( ON ?auto_556390 ?auto_556391 ) ( CLEAR ?auto_556390 ) ( not ( = ?auto_556389 ?auto_556391 ) ) ( not ( = ?auto_556390 ?auto_556391 ) ) ( not ( = ?auto_556398 ?auto_556391 ) ) ( SURFACE-AT ?auto_556398 ?auto_556396 ) ( CLEAR ?auto_556398 ) ( IS-CRATE ?auto_556389 ) ( AVAILABLE ?auto_556393 ) ( AVAILABLE ?auto_556395 ) ( SURFACE-AT ?auto_556389 ?auto_556394 ) ( ON ?auto_556389 ?auto_556392 ) ( CLEAR ?auto_556389 ) ( not ( = ?auto_556389 ?auto_556392 ) ) ( not ( = ?auto_556390 ?auto_556392 ) ) ( not ( = ?auto_556398 ?auto_556392 ) ) ( not ( = ?auto_556391 ?auto_556392 ) ) ( TRUCK-AT ?auto_556397 ?auto_556396 ) )
    :subtasks
    ( ( !DRIVE ?auto_556397 ?auto_556396 ?auto_556394 )
      ( MAKE-2CRATE ?auto_556398 ?auto_556389 ?auto_556390 )
      ( MAKE-1CRATE-VERIFY ?auto_556389 ?auto_556390 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_556399 - SURFACE
      ?auto_556400 - SURFACE
      ?auto_556401 - SURFACE
    )
    :vars
    (
      ?auto_556408 - HOIST
      ?auto_556403 - PLACE
      ?auto_556404 - PLACE
      ?auto_556405 - HOIST
      ?auto_556402 - SURFACE
      ?auto_556406 - SURFACE
      ?auto_556407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556408 ?auto_556403 ) ( IS-CRATE ?auto_556401 ) ( not ( = ?auto_556400 ?auto_556401 ) ) ( not ( = ?auto_556399 ?auto_556400 ) ) ( not ( = ?auto_556399 ?auto_556401 ) ) ( not ( = ?auto_556404 ?auto_556403 ) ) ( HOIST-AT ?auto_556405 ?auto_556404 ) ( not ( = ?auto_556408 ?auto_556405 ) ) ( SURFACE-AT ?auto_556401 ?auto_556404 ) ( ON ?auto_556401 ?auto_556402 ) ( CLEAR ?auto_556401 ) ( not ( = ?auto_556400 ?auto_556402 ) ) ( not ( = ?auto_556401 ?auto_556402 ) ) ( not ( = ?auto_556399 ?auto_556402 ) ) ( SURFACE-AT ?auto_556399 ?auto_556403 ) ( CLEAR ?auto_556399 ) ( IS-CRATE ?auto_556400 ) ( AVAILABLE ?auto_556408 ) ( AVAILABLE ?auto_556405 ) ( SURFACE-AT ?auto_556400 ?auto_556404 ) ( ON ?auto_556400 ?auto_556406 ) ( CLEAR ?auto_556400 ) ( not ( = ?auto_556400 ?auto_556406 ) ) ( not ( = ?auto_556401 ?auto_556406 ) ) ( not ( = ?auto_556399 ?auto_556406 ) ) ( not ( = ?auto_556402 ?auto_556406 ) ) ( TRUCK-AT ?auto_556407 ?auto_556403 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_556400 ?auto_556401 )
      ( MAKE-2CRATE-VERIFY ?auto_556399 ?auto_556400 ?auto_556401 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_556410 - SURFACE
      ?auto_556411 - SURFACE
      ?auto_556412 - SURFACE
      ?auto_556409 - SURFACE
    )
    :vars
    (
      ?auto_556417 - HOIST
      ?auto_556413 - PLACE
      ?auto_556415 - PLACE
      ?auto_556419 - HOIST
      ?auto_556418 - SURFACE
      ?auto_556414 - SURFACE
      ?auto_556416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556417 ?auto_556413 ) ( IS-CRATE ?auto_556409 ) ( not ( = ?auto_556412 ?auto_556409 ) ) ( not ( = ?auto_556411 ?auto_556412 ) ) ( not ( = ?auto_556411 ?auto_556409 ) ) ( not ( = ?auto_556415 ?auto_556413 ) ) ( HOIST-AT ?auto_556419 ?auto_556415 ) ( not ( = ?auto_556417 ?auto_556419 ) ) ( SURFACE-AT ?auto_556409 ?auto_556415 ) ( ON ?auto_556409 ?auto_556418 ) ( CLEAR ?auto_556409 ) ( not ( = ?auto_556412 ?auto_556418 ) ) ( not ( = ?auto_556409 ?auto_556418 ) ) ( not ( = ?auto_556411 ?auto_556418 ) ) ( SURFACE-AT ?auto_556411 ?auto_556413 ) ( CLEAR ?auto_556411 ) ( IS-CRATE ?auto_556412 ) ( AVAILABLE ?auto_556417 ) ( AVAILABLE ?auto_556419 ) ( SURFACE-AT ?auto_556412 ?auto_556415 ) ( ON ?auto_556412 ?auto_556414 ) ( CLEAR ?auto_556412 ) ( not ( = ?auto_556412 ?auto_556414 ) ) ( not ( = ?auto_556409 ?auto_556414 ) ) ( not ( = ?auto_556411 ?auto_556414 ) ) ( not ( = ?auto_556418 ?auto_556414 ) ) ( TRUCK-AT ?auto_556416 ?auto_556413 ) ( ON ?auto_556411 ?auto_556410 ) ( not ( = ?auto_556410 ?auto_556411 ) ) ( not ( = ?auto_556410 ?auto_556412 ) ) ( not ( = ?auto_556410 ?auto_556409 ) ) ( not ( = ?auto_556410 ?auto_556418 ) ) ( not ( = ?auto_556410 ?auto_556414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556411 ?auto_556412 ?auto_556409 )
      ( MAKE-3CRATE-VERIFY ?auto_556410 ?auto_556411 ?auto_556412 ?auto_556409 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_556421 - SURFACE
      ?auto_556422 - SURFACE
      ?auto_556423 - SURFACE
      ?auto_556420 - SURFACE
      ?auto_556424 - SURFACE
    )
    :vars
    (
      ?auto_556429 - HOIST
      ?auto_556425 - PLACE
      ?auto_556427 - PLACE
      ?auto_556431 - HOIST
      ?auto_556430 - SURFACE
      ?auto_556426 - SURFACE
      ?auto_556428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556429 ?auto_556425 ) ( IS-CRATE ?auto_556424 ) ( not ( = ?auto_556420 ?auto_556424 ) ) ( not ( = ?auto_556423 ?auto_556420 ) ) ( not ( = ?auto_556423 ?auto_556424 ) ) ( not ( = ?auto_556427 ?auto_556425 ) ) ( HOIST-AT ?auto_556431 ?auto_556427 ) ( not ( = ?auto_556429 ?auto_556431 ) ) ( SURFACE-AT ?auto_556424 ?auto_556427 ) ( ON ?auto_556424 ?auto_556430 ) ( CLEAR ?auto_556424 ) ( not ( = ?auto_556420 ?auto_556430 ) ) ( not ( = ?auto_556424 ?auto_556430 ) ) ( not ( = ?auto_556423 ?auto_556430 ) ) ( SURFACE-AT ?auto_556423 ?auto_556425 ) ( CLEAR ?auto_556423 ) ( IS-CRATE ?auto_556420 ) ( AVAILABLE ?auto_556429 ) ( AVAILABLE ?auto_556431 ) ( SURFACE-AT ?auto_556420 ?auto_556427 ) ( ON ?auto_556420 ?auto_556426 ) ( CLEAR ?auto_556420 ) ( not ( = ?auto_556420 ?auto_556426 ) ) ( not ( = ?auto_556424 ?auto_556426 ) ) ( not ( = ?auto_556423 ?auto_556426 ) ) ( not ( = ?auto_556430 ?auto_556426 ) ) ( TRUCK-AT ?auto_556428 ?auto_556425 ) ( ON ?auto_556422 ?auto_556421 ) ( ON ?auto_556423 ?auto_556422 ) ( not ( = ?auto_556421 ?auto_556422 ) ) ( not ( = ?auto_556421 ?auto_556423 ) ) ( not ( = ?auto_556421 ?auto_556420 ) ) ( not ( = ?auto_556421 ?auto_556424 ) ) ( not ( = ?auto_556421 ?auto_556430 ) ) ( not ( = ?auto_556421 ?auto_556426 ) ) ( not ( = ?auto_556422 ?auto_556423 ) ) ( not ( = ?auto_556422 ?auto_556420 ) ) ( not ( = ?auto_556422 ?auto_556424 ) ) ( not ( = ?auto_556422 ?auto_556430 ) ) ( not ( = ?auto_556422 ?auto_556426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556423 ?auto_556420 ?auto_556424 )
      ( MAKE-4CRATE-VERIFY ?auto_556421 ?auto_556422 ?auto_556423 ?auto_556420 ?auto_556424 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_556432 - SURFACE
      ?auto_556433 - SURFACE
    )
    :vars
    (
      ?auto_556438 - HOIST
      ?auto_556434 - PLACE
      ?auto_556441 - SURFACE
      ?auto_556436 - PLACE
      ?auto_556440 - HOIST
      ?auto_556439 - SURFACE
      ?auto_556435 - SURFACE
      ?auto_556437 - TRUCK
      ?auto_556442 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556438 ?auto_556434 ) ( IS-CRATE ?auto_556433 ) ( not ( = ?auto_556432 ?auto_556433 ) ) ( not ( = ?auto_556441 ?auto_556432 ) ) ( not ( = ?auto_556441 ?auto_556433 ) ) ( not ( = ?auto_556436 ?auto_556434 ) ) ( HOIST-AT ?auto_556440 ?auto_556436 ) ( not ( = ?auto_556438 ?auto_556440 ) ) ( SURFACE-AT ?auto_556433 ?auto_556436 ) ( ON ?auto_556433 ?auto_556439 ) ( CLEAR ?auto_556433 ) ( not ( = ?auto_556432 ?auto_556439 ) ) ( not ( = ?auto_556433 ?auto_556439 ) ) ( not ( = ?auto_556441 ?auto_556439 ) ) ( IS-CRATE ?auto_556432 ) ( AVAILABLE ?auto_556440 ) ( SURFACE-AT ?auto_556432 ?auto_556436 ) ( ON ?auto_556432 ?auto_556435 ) ( CLEAR ?auto_556432 ) ( not ( = ?auto_556432 ?auto_556435 ) ) ( not ( = ?auto_556433 ?auto_556435 ) ) ( not ( = ?auto_556441 ?auto_556435 ) ) ( not ( = ?auto_556439 ?auto_556435 ) ) ( TRUCK-AT ?auto_556437 ?auto_556434 ) ( SURFACE-AT ?auto_556442 ?auto_556434 ) ( CLEAR ?auto_556442 ) ( LIFTING ?auto_556438 ?auto_556441 ) ( IS-CRATE ?auto_556441 ) ( not ( = ?auto_556442 ?auto_556441 ) ) ( not ( = ?auto_556432 ?auto_556442 ) ) ( not ( = ?auto_556433 ?auto_556442 ) ) ( not ( = ?auto_556439 ?auto_556442 ) ) ( not ( = ?auto_556435 ?auto_556442 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_556442 ?auto_556441 )
      ( MAKE-2CRATE ?auto_556441 ?auto_556432 ?auto_556433 )
      ( MAKE-1CRATE-VERIFY ?auto_556432 ?auto_556433 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_556443 - SURFACE
      ?auto_556444 - SURFACE
      ?auto_556445 - SURFACE
    )
    :vars
    (
      ?auto_556446 - HOIST
      ?auto_556453 - PLACE
      ?auto_556450 - PLACE
      ?auto_556448 - HOIST
      ?auto_556449 - SURFACE
      ?auto_556452 - SURFACE
      ?auto_556451 - TRUCK
      ?auto_556447 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556446 ?auto_556453 ) ( IS-CRATE ?auto_556445 ) ( not ( = ?auto_556444 ?auto_556445 ) ) ( not ( = ?auto_556443 ?auto_556444 ) ) ( not ( = ?auto_556443 ?auto_556445 ) ) ( not ( = ?auto_556450 ?auto_556453 ) ) ( HOIST-AT ?auto_556448 ?auto_556450 ) ( not ( = ?auto_556446 ?auto_556448 ) ) ( SURFACE-AT ?auto_556445 ?auto_556450 ) ( ON ?auto_556445 ?auto_556449 ) ( CLEAR ?auto_556445 ) ( not ( = ?auto_556444 ?auto_556449 ) ) ( not ( = ?auto_556445 ?auto_556449 ) ) ( not ( = ?auto_556443 ?auto_556449 ) ) ( IS-CRATE ?auto_556444 ) ( AVAILABLE ?auto_556448 ) ( SURFACE-AT ?auto_556444 ?auto_556450 ) ( ON ?auto_556444 ?auto_556452 ) ( CLEAR ?auto_556444 ) ( not ( = ?auto_556444 ?auto_556452 ) ) ( not ( = ?auto_556445 ?auto_556452 ) ) ( not ( = ?auto_556443 ?auto_556452 ) ) ( not ( = ?auto_556449 ?auto_556452 ) ) ( TRUCK-AT ?auto_556451 ?auto_556453 ) ( SURFACE-AT ?auto_556447 ?auto_556453 ) ( CLEAR ?auto_556447 ) ( LIFTING ?auto_556446 ?auto_556443 ) ( IS-CRATE ?auto_556443 ) ( not ( = ?auto_556447 ?auto_556443 ) ) ( not ( = ?auto_556444 ?auto_556447 ) ) ( not ( = ?auto_556445 ?auto_556447 ) ) ( not ( = ?auto_556449 ?auto_556447 ) ) ( not ( = ?auto_556452 ?auto_556447 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_556444 ?auto_556445 )
      ( MAKE-2CRATE-VERIFY ?auto_556443 ?auto_556444 ?auto_556445 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_556455 - SURFACE
      ?auto_556456 - SURFACE
      ?auto_556457 - SURFACE
      ?auto_556454 - SURFACE
    )
    :vars
    (
      ?auto_556462 - HOIST
      ?auto_556461 - PLACE
      ?auto_556463 - PLACE
      ?auto_556458 - HOIST
      ?auto_556464 - SURFACE
      ?auto_556460 - SURFACE
      ?auto_556459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556462 ?auto_556461 ) ( IS-CRATE ?auto_556454 ) ( not ( = ?auto_556457 ?auto_556454 ) ) ( not ( = ?auto_556456 ?auto_556457 ) ) ( not ( = ?auto_556456 ?auto_556454 ) ) ( not ( = ?auto_556463 ?auto_556461 ) ) ( HOIST-AT ?auto_556458 ?auto_556463 ) ( not ( = ?auto_556462 ?auto_556458 ) ) ( SURFACE-AT ?auto_556454 ?auto_556463 ) ( ON ?auto_556454 ?auto_556464 ) ( CLEAR ?auto_556454 ) ( not ( = ?auto_556457 ?auto_556464 ) ) ( not ( = ?auto_556454 ?auto_556464 ) ) ( not ( = ?auto_556456 ?auto_556464 ) ) ( IS-CRATE ?auto_556457 ) ( AVAILABLE ?auto_556458 ) ( SURFACE-AT ?auto_556457 ?auto_556463 ) ( ON ?auto_556457 ?auto_556460 ) ( CLEAR ?auto_556457 ) ( not ( = ?auto_556457 ?auto_556460 ) ) ( not ( = ?auto_556454 ?auto_556460 ) ) ( not ( = ?auto_556456 ?auto_556460 ) ) ( not ( = ?auto_556464 ?auto_556460 ) ) ( TRUCK-AT ?auto_556459 ?auto_556461 ) ( SURFACE-AT ?auto_556455 ?auto_556461 ) ( CLEAR ?auto_556455 ) ( LIFTING ?auto_556462 ?auto_556456 ) ( IS-CRATE ?auto_556456 ) ( not ( = ?auto_556455 ?auto_556456 ) ) ( not ( = ?auto_556457 ?auto_556455 ) ) ( not ( = ?auto_556454 ?auto_556455 ) ) ( not ( = ?auto_556464 ?auto_556455 ) ) ( not ( = ?auto_556460 ?auto_556455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556456 ?auto_556457 ?auto_556454 )
      ( MAKE-3CRATE-VERIFY ?auto_556455 ?auto_556456 ?auto_556457 ?auto_556454 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_556466 - SURFACE
      ?auto_556467 - SURFACE
      ?auto_556468 - SURFACE
      ?auto_556465 - SURFACE
      ?auto_556469 - SURFACE
    )
    :vars
    (
      ?auto_556474 - HOIST
      ?auto_556473 - PLACE
      ?auto_556475 - PLACE
      ?auto_556470 - HOIST
      ?auto_556476 - SURFACE
      ?auto_556472 - SURFACE
      ?auto_556471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556474 ?auto_556473 ) ( IS-CRATE ?auto_556469 ) ( not ( = ?auto_556465 ?auto_556469 ) ) ( not ( = ?auto_556468 ?auto_556465 ) ) ( not ( = ?auto_556468 ?auto_556469 ) ) ( not ( = ?auto_556475 ?auto_556473 ) ) ( HOIST-AT ?auto_556470 ?auto_556475 ) ( not ( = ?auto_556474 ?auto_556470 ) ) ( SURFACE-AT ?auto_556469 ?auto_556475 ) ( ON ?auto_556469 ?auto_556476 ) ( CLEAR ?auto_556469 ) ( not ( = ?auto_556465 ?auto_556476 ) ) ( not ( = ?auto_556469 ?auto_556476 ) ) ( not ( = ?auto_556468 ?auto_556476 ) ) ( IS-CRATE ?auto_556465 ) ( AVAILABLE ?auto_556470 ) ( SURFACE-AT ?auto_556465 ?auto_556475 ) ( ON ?auto_556465 ?auto_556472 ) ( CLEAR ?auto_556465 ) ( not ( = ?auto_556465 ?auto_556472 ) ) ( not ( = ?auto_556469 ?auto_556472 ) ) ( not ( = ?auto_556468 ?auto_556472 ) ) ( not ( = ?auto_556476 ?auto_556472 ) ) ( TRUCK-AT ?auto_556471 ?auto_556473 ) ( SURFACE-AT ?auto_556467 ?auto_556473 ) ( CLEAR ?auto_556467 ) ( LIFTING ?auto_556474 ?auto_556468 ) ( IS-CRATE ?auto_556468 ) ( not ( = ?auto_556467 ?auto_556468 ) ) ( not ( = ?auto_556465 ?auto_556467 ) ) ( not ( = ?auto_556469 ?auto_556467 ) ) ( not ( = ?auto_556476 ?auto_556467 ) ) ( not ( = ?auto_556472 ?auto_556467 ) ) ( ON ?auto_556467 ?auto_556466 ) ( not ( = ?auto_556466 ?auto_556467 ) ) ( not ( = ?auto_556466 ?auto_556468 ) ) ( not ( = ?auto_556466 ?auto_556465 ) ) ( not ( = ?auto_556466 ?auto_556469 ) ) ( not ( = ?auto_556466 ?auto_556476 ) ) ( not ( = ?auto_556466 ?auto_556472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556468 ?auto_556465 ?auto_556469 )
      ( MAKE-4CRATE-VERIFY ?auto_556466 ?auto_556467 ?auto_556468 ?auto_556465 ?auto_556469 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556913 - SURFACE
      ?auto_556914 - SURFACE
      ?auto_556915 - SURFACE
      ?auto_556912 - SURFACE
      ?auto_556916 - SURFACE
      ?auto_556917 - SURFACE
    )
    :vars
    (
      ?auto_556918 - HOIST
      ?auto_556919 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556918 ?auto_556919 ) ( SURFACE-AT ?auto_556916 ?auto_556919 ) ( CLEAR ?auto_556916 ) ( LIFTING ?auto_556918 ?auto_556917 ) ( IS-CRATE ?auto_556917 ) ( not ( = ?auto_556916 ?auto_556917 ) ) ( ON ?auto_556914 ?auto_556913 ) ( ON ?auto_556915 ?auto_556914 ) ( ON ?auto_556912 ?auto_556915 ) ( ON ?auto_556916 ?auto_556912 ) ( not ( = ?auto_556913 ?auto_556914 ) ) ( not ( = ?auto_556913 ?auto_556915 ) ) ( not ( = ?auto_556913 ?auto_556912 ) ) ( not ( = ?auto_556913 ?auto_556916 ) ) ( not ( = ?auto_556913 ?auto_556917 ) ) ( not ( = ?auto_556914 ?auto_556915 ) ) ( not ( = ?auto_556914 ?auto_556912 ) ) ( not ( = ?auto_556914 ?auto_556916 ) ) ( not ( = ?auto_556914 ?auto_556917 ) ) ( not ( = ?auto_556915 ?auto_556912 ) ) ( not ( = ?auto_556915 ?auto_556916 ) ) ( not ( = ?auto_556915 ?auto_556917 ) ) ( not ( = ?auto_556912 ?auto_556916 ) ) ( not ( = ?auto_556912 ?auto_556917 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_556916 ?auto_556917 )
      ( MAKE-5CRATE-VERIFY ?auto_556913 ?auto_556914 ?auto_556915 ?auto_556912 ?auto_556916 ?auto_556917 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556947 - SURFACE
      ?auto_556948 - SURFACE
      ?auto_556949 - SURFACE
      ?auto_556946 - SURFACE
      ?auto_556950 - SURFACE
      ?auto_556951 - SURFACE
    )
    :vars
    (
      ?auto_556953 - HOIST
      ?auto_556954 - PLACE
      ?auto_556952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556953 ?auto_556954 ) ( SURFACE-AT ?auto_556950 ?auto_556954 ) ( CLEAR ?auto_556950 ) ( IS-CRATE ?auto_556951 ) ( not ( = ?auto_556950 ?auto_556951 ) ) ( TRUCK-AT ?auto_556952 ?auto_556954 ) ( AVAILABLE ?auto_556953 ) ( IN ?auto_556951 ?auto_556952 ) ( ON ?auto_556950 ?auto_556946 ) ( not ( = ?auto_556946 ?auto_556950 ) ) ( not ( = ?auto_556946 ?auto_556951 ) ) ( ON ?auto_556948 ?auto_556947 ) ( ON ?auto_556949 ?auto_556948 ) ( ON ?auto_556946 ?auto_556949 ) ( not ( = ?auto_556947 ?auto_556948 ) ) ( not ( = ?auto_556947 ?auto_556949 ) ) ( not ( = ?auto_556947 ?auto_556946 ) ) ( not ( = ?auto_556947 ?auto_556950 ) ) ( not ( = ?auto_556947 ?auto_556951 ) ) ( not ( = ?auto_556948 ?auto_556949 ) ) ( not ( = ?auto_556948 ?auto_556946 ) ) ( not ( = ?auto_556948 ?auto_556950 ) ) ( not ( = ?auto_556948 ?auto_556951 ) ) ( not ( = ?auto_556949 ?auto_556946 ) ) ( not ( = ?auto_556949 ?auto_556950 ) ) ( not ( = ?auto_556949 ?auto_556951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556946 ?auto_556950 ?auto_556951 )
      ( MAKE-5CRATE-VERIFY ?auto_556947 ?auto_556948 ?auto_556949 ?auto_556946 ?auto_556950 ?auto_556951 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556987 - SURFACE
      ?auto_556988 - SURFACE
      ?auto_556989 - SURFACE
      ?auto_556986 - SURFACE
      ?auto_556990 - SURFACE
      ?auto_556991 - SURFACE
    )
    :vars
    (
      ?auto_556995 - HOIST
      ?auto_556994 - PLACE
      ?auto_556992 - TRUCK
      ?auto_556993 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556995 ?auto_556994 ) ( SURFACE-AT ?auto_556990 ?auto_556994 ) ( CLEAR ?auto_556990 ) ( IS-CRATE ?auto_556991 ) ( not ( = ?auto_556990 ?auto_556991 ) ) ( AVAILABLE ?auto_556995 ) ( IN ?auto_556991 ?auto_556992 ) ( ON ?auto_556990 ?auto_556986 ) ( not ( = ?auto_556986 ?auto_556990 ) ) ( not ( = ?auto_556986 ?auto_556991 ) ) ( TRUCK-AT ?auto_556992 ?auto_556993 ) ( not ( = ?auto_556993 ?auto_556994 ) ) ( ON ?auto_556988 ?auto_556987 ) ( ON ?auto_556989 ?auto_556988 ) ( ON ?auto_556986 ?auto_556989 ) ( not ( = ?auto_556987 ?auto_556988 ) ) ( not ( = ?auto_556987 ?auto_556989 ) ) ( not ( = ?auto_556987 ?auto_556986 ) ) ( not ( = ?auto_556987 ?auto_556990 ) ) ( not ( = ?auto_556987 ?auto_556991 ) ) ( not ( = ?auto_556988 ?auto_556989 ) ) ( not ( = ?auto_556988 ?auto_556986 ) ) ( not ( = ?auto_556988 ?auto_556990 ) ) ( not ( = ?auto_556988 ?auto_556991 ) ) ( not ( = ?auto_556989 ?auto_556986 ) ) ( not ( = ?auto_556989 ?auto_556990 ) ) ( not ( = ?auto_556989 ?auto_556991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556986 ?auto_556990 ?auto_556991 )
      ( MAKE-5CRATE-VERIFY ?auto_556987 ?auto_556988 ?auto_556989 ?auto_556986 ?auto_556990 ?auto_556991 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_557032 - SURFACE
      ?auto_557033 - SURFACE
      ?auto_557034 - SURFACE
      ?auto_557031 - SURFACE
      ?auto_557035 - SURFACE
      ?auto_557036 - SURFACE
    )
    :vars
    (
      ?auto_557037 - HOIST
      ?auto_557040 - PLACE
      ?auto_557038 - TRUCK
      ?auto_557039 - PLACE
      ?auto_557041 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_557037 ?auto_557040 ) ( SURFACE-AT ?auto_557035 ?auto_557040 ) ( CLEAR ?auto_557035 ) ( IS-CRATE ?auto_557036 ) ( not ( = ?auto_557035 ?auto_557036 ) ) ( AVAILABLE ?auto_557037 ) ( ON ?auto_557035 ?auto_557031 ) ( not ( = ?auto_557031 ?auto_557035 ) ) ( not ( = ?auto_557031 ?auto_557036 ) ) ( TRUCK-AT ?auto_557038 ?auto_557039 ) ( not ( = ?auto_557039 ?auto_557040 ) ) ( HOIST-AT ?auto_557041 ?auto_557039 ) ( LIFTING ?auto_557041 ?auto_557036 ) ( not ( = ?auto_557037 ?auto_557041 ) ) ( ON ?auto_557033 ?auto_557032 ) ( ON ?auto_557034 ?auto_557033 ) ( ON ?auto_557031 ?auto_557034 ) ( not ( = ?auto_557032 ?auto_557033 ) ) ( not ( = ?auto_557032 ?auto_557034 ) ) ( not ( = ?auto_557032 ?auto_557031 ) ) ( not ( = ?auto_557032 ?auto_557035 ) ) ( not ( = ?auto_557032 ?auto_557036 ) ) ( not ( = ?auto_557033 ?auto_557034 ) ) ( not ( = ?auto_557033 ?auto_557031 ) ) ( not ( = ?auto_557033 ?auto_557035 ) ) ( not ( = ?auto_557033 ?auto_557036 ) ) ( not ( = ?auto_557034 ?auto_557031 ) ) ( not ( = ?auto_557034 ?auto_557035 ) ) ( not ( = ?auto_557034 ?auto_557036 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_557031 ?auto_557035 ?auto_557036 )
      ( MAKE-5CRATE-VERIFY ?auto_557032 ?auto_557033 ?auto_557034 ?auto_557031 ?auto_557035 ?auto_557036 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_557082 - SURFACE
      ?auto_557083 - SURFACE
      ?auto_557084 - SURFACE
      ?auto_557081 - SURFACE
      ?auto_557085 - SURFACE
      ?auto_557086 - SURFACE
    )
    :vars
    (
      ?auto_557088 - HOIST
      ?auto_557087 - PLACE
      ?auto_557089 - TRUCK
      ?auto_557091 - PLACE
      ?auto_557090 - HOIST
      ?auto_557092 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_557088 ?auto_557087 ) ( SURFACE-AT ?auto_557085 ?auto_557087 ) ( CLEAR ?auto_557085 ) ( IS-CRATE ?auto_557086 ) ( not ( = ?auto_557085 ?auto_557086 ) ) ( AVAILABLE ?auto_557088 ) ( ON ?auto_557085 ?auto_557081 ) ( not ( = ?auto_557081 ?auto_557085 ) ) ( not ( = ?auto_557081 ?auto_557086 ) ) ( TRUCK-AT ?auto_557089 ?auto_557091 ) ( not ( = ?auto_557091 ?auto_557087 ) ) ( HOIST-AT ?auto_557090 ?auto_557091 ) ( not ( = ?auto_557088 ?auto_557090 ) ) ( AVAILABLE ?auto_557090 ) ( SURFACE-AT ?auto_557086 ?auto_557091 ) ( ON ?auto_557086 ?auto_557092 ) ( CLEAR ?auto_557086 ) ( not ( = ?auto_557085 ?auto_557092 ) ) ( not ( = ?auto_557086 ?auto_557092 ) ) ( not ( = ?auto_557081 ?auto_557092 ) ) ( ON ?auto_557083 ?auto_557082 ) ( ON ?auto_557084 ?auto_557083 ) ( ON ?auto_557081 ?auto_557084 ) ( not ( = ?auto_557082 ?auto_557083 ) ) ( not ( = ?auto_557082 ?auto_557084 ) ) ( not ( = ?auto_557082 ?auto_557081 ) ) ( not ( = ?auto_557082 ?auto_557085 ) ) ( not ( = ?auto_557082 ?auto_557086 ) ) ( not ( = ?auto_557082 ?auto_557092 ) ) ( not ( = ?auto_557083 ?auto_557084 ) ) ( not ( = ?auto_557083 ?auto_557081 ) ) ( not ( = ?auto_557083 ?auto_557085 ) ) ( not ( = ?auto_557083 ?auto_557086 ) ) ( not ( = ?auto_557083 ?auto_557092 ) ) ( not ( = ?auto_557084 ?auto_557081 ) ) ( not ( = ?auto_557084 ?auto_557085 ) ) ( not ( = ?auto_557084 ?auto_557086 ) ) ( not ( = ?auto_557084 ?auto_557092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_557081 ?auto_557085 ?auto_557086 )
      ( MAKE-5CRATE-VERIFY ?auto_557082 ?auto_557083 ?auto_557084 ?auto_557081 ?auto_557085 ?auto_557086 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_557133 - SURFACE
      ?auto_557134 - SURFACE
      ?auto_557135 - SURFACE
      ?auto_557132 - SURFACE
      ?auto_557136 - SURFACE
      ?auto_557137 - SURFACE
    )
    :vars
    (
      ?auto_557139 - HOIST
      ?auto_557140 - PLACE
      ?auto_557138 - PLACE
      ?auto_557142 - HOIST
      ?auto_557141 - SURFACE
      ?auto_557143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_557139 ?auto_557140 ) ( SURFACE-AT ?auto_557136 ?auto_557140 ) ( CLEAR ?auto_557136 ) ( IS-CRATE ?auto_557137 ) ( not ( = ?auto_557136 ?auto_557137 ) ) ( AVAILABLE ?auto_557139 ) ( ON ?auto_557136 ?auto_557132 ) ( not ( = ?auto_557132 ?auto_557136 ) ) ( not ( = ?auto_557132 ?auto_557137 ) ) ( not ( = ?auto_557138 ?auto_557140 ) ) ( HOIST-AT ?auto_557142 ?auto_557138 ) ( not ( = ?auto_557139 ?auto_557142 ) ) ( AVAILABLE ?auto_557142 ) ( SURFACE-AT ?auto_557137 ?auto_557138 ) ( ON ?auto_557137 ?auto_557141 ) ( CLEAR ?auto_557137 ) ( not ( = ?auto_557136 ?auto_557141 ) ) ( not ( = ?auto_557137 ?auto_557141 ) ) ( not ( = ?auto_557132 ?auto_557141 ) ) ( TRUCK-AT ?auto_557143 ?auto_557140 ) ( ON ?auto_557134 ?auto_557133 ) ( ON ?auto_557135 ?auto_557134 ) ( ON ?auto_557132 ?auto_557135 ) ( not ( = ?auto_557133 ?auto_557134 ) ) ( not ( = ?auto_557133 ?auto_557135 ) ) ( not ( = ?auto_557133 ?auto_557132 ) ) ( not ( = ?auto_557133 ?auto_557136 ) ) ( not ( = ?auto_557133 ?auto_557137 ) ) ( not ( = ?auto_557133 ?auto_557141 ) ) ( not ( = ?auto_557134 ?auto_557135 ) ) ( not ( = ?auto_557134 ?auto_557132 ) ) ( not ( = ?auto_557134 ?auto_557136 ) ) ( not ( = ?auto_557134 ?auto_557137 ) ) ( not ( = ?auto_557134 ?auto_557141 ) ) ( not ( = ?auto_557135 ?auto_557132 ) ) ( not ( = ?auto_557135 ?auto_557136 ) ) ( not ( = ?auto_557135 ?auto_557137 ) ) ( not ( = ?auto_557135 ?auto_557141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_557132 ?auto_557136 ?auto_557137 )
      ( MAKE-5CRATE-VERIFY ?auto_557133 ?auto_557134 ?auto_557135 ?auto_557132 ?auto_557136 ?auto_557137 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_557184 - SURFACE
      ?auto_557185 - SURFACE
      ?auto_557186 - SURFACE
      ?auto_557183 - SURFACE
      ?auto_557187 - SURFACE
      ?auto_557188 - SURFACE
    )
    :vars
    (
      ?auto_557193 - HOIST
      ?auto_557192 - PLACE
      ?auto_557189 - PLACE
      ?auto_557191 - HOIST
      ?auto_557190 - SURFACE
      ?auto_557194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_557193 ?auto_557192 ) ( IS-CRATE ?auto_557188 ) ( not ( = ?auto_557187 ?auto_557188 ) ) ( not ( = ?auto_557183 ?auto_557187 ) ) ( not ( = ?auto_557183 ?auto_557188 ) ) ( not ( = ?auto_557189 ?auto_557192 ) ) ( HOIST-AT ?auto_557191 ?auto_557189 ) ( not ( = ?auto_557193 ?auto_557191 ) ) ( AVAILABLE ?auto_557191 ) ( SURFACE-AT ?auto_557188 ?auto_557189 ) ( ON ?auto_557188 ?auto_557190 ) ( CLEAR ?auto_557188 ) ( not ( = ?auto_557187 ?auto_557190 ) ) ( not ( = ?auto_557188 ?auto_557190 ) ) ( not ( = ?auto_557183 ?auto_557190 ) ) ( TRUCK-AT ?auto_557194 ?auto_557192 ) ( SURFACE-AT ?auto_557183 ?auto_557192 ) ( CLEAR ?auto_557183 ) ( LIFTING ?auto_557193 ?auto_557187 ) ( IS-CRATE ?auto_557187 ) ( ON ?auto_557185 ?auto_557184 ) ( ON ?auto_557186 ?auto_557185 ) ( ON ?auto_557183 ?auto_557186 ) ( not ( = ?auto_557184 ?auto_557185 ) ) ( not ( = ?auto_557184 ?auto_557186 ) ) ( not ( = ?auto_557184 ?auto_557183 ) ) ( not ( = ?auto_557184 ?auto_557187 ) ) ( not ( = ?auto_557184 ?auto_557188 ) ) ( not ( = ?auto_557184 ?auto_557190 ) ) ( not ( = ?auto_557185 ?auto_557186 ) ) ( not ( = ?auto_557185 ?auto_557183 ) ) ( not ( = ?auto_557185 ?auto_557187 ) ) ( not ( = ?auto_557185 ?auto_557188 ) ) ( not ( = ?auto_557185 ?auto_557190 ) ) ( not ( = ?auto_557186 ?auto_557183 ) ) ( not ( = ?auto_557186 ?auto_557187 ) ) ( not ( = ?auto_557186 ?auto_557188 ) ) ( not ( = ?auto_557186 ?auto_557190 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_557183 ?auto_557187 ?auto_557188 )
      ( MAKE-5CRATE-VERIFY ?auto_557184 ?auto_557185 ?auto_557186 ?auto_557183 ?auto_557187 ?auto_557188 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_557235 - SURFACE
      ?auto_557236 - SURFACE
      ?auto_557237 - SURFACE
      ?auto_557234 - SURFACE
      ?auto_557238 - SURFACE
      ?auto_557239 - SURFACE
    )
    :vars
    (
      ?auto_557241 - HOIST
      ?auto_557240 - PLACE
      ?auto_557242 - PLACE
      ?auto_557245 - HOIST
      ?auto_557243 - SURFACE
      ?auto_557244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_557241 ?auto_557240 ) ( IS-CRATE ?auto_557239 ) ( not ( = ?auto_557238 ?auto_557239 ) ) ( not ( = ?auto_557234 ?auto_557238 ) ) ( not ( = ?auto_557234 ?auto_557239 ) ) ( not ( = ?auto_557242 ?auto_557240 ) ) ( HOIST-AT ?auto_557245 ?auto_557242 ) ( not ( = ?auto_557241 ?auto_557245 ) ) ( AVAILABLE ?auto_557245 ) ( SURFACE-AT ?auto_557239 ?auto_557242 ) ( ON ?auto_557239 ?auto_557243 ) ( CLEAR ?auto_557239 ) ( not ( = ?auto_557238 ?auto_557243 ) ) ( not ( = ?auto_557239 ?auto_557243 ) ) ( not ( = ?auto_557234 ?auto_557243 ) ) ( TRUCK-AT ?auto_557244 ?auto_557240 ) ( SURFACE-AT ?auto_557234 ?auto_557240 ) ( CLEAR ?auto_557234 ) ( IS-CRATE ?auto_557238 ) ( AVAILABLE ?auto_557241 ) ( IN ?auto_557238 ?auto_557244 ) ( ON ?auto_557236 ?auto_557235 ) ( ON ?auto_557237 ?auto_557236 ) ( ON ?auto_557234 ?auto_557237 ) ( not ( = ?auto_557235 ?auto_557236 ) ) ( not ( = ?auto_557235 ?auto_557237 ) ) ( not ( = ?auto_557235 ?auto_557234 ) ) ( not ( = ?auto_557235 ?auto_557238 ) ) ( not ( = ?auto_557235 ?auto_557239 ) ) ( not ( = ?auto_557235 ?auto_557243 ) ) ( not ( = ?auto_557236 ?auto_557237 ) ) ( not ( = ?auto_557236 ?auto_557234 ) ) ( not ( = ?auto_557236 ?auto_557238 ) ) ( not ( = ?auto_557236 ?auto_557239 ) ) ( not ( = ?auto_557236 ?auto_557243 ) ) ( not ( = ?auto_557237 ?auto_557234 ) ) ( not ( = ?auto_557237 ?auto_557238 ) ) ( not ( = ?auto_557237 ?auto_557239 ) ) ( not ( = ?auto_557237 ?auto_557243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_557234 ?auto_557238 ?auto_557239 )
      ( MAKE-5CRATE-VERIFY ?auto_557235 ?auto_557236 ?auto_557237 ?auto_557234 ?auto_557238 ?auto_557239 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_557602 - SURFACE
      ?auto_557603 - SURFACE
    )
    :vars
    (
      ?auto_557605 - HOIST
      ?auto_557607 - PLACE
      ?auto_557604 - SURFACE
      ?auto_557608 - PLACE
      ?auto_557609 - HOIST
      ?auto_557610 - SURFACE
      ?auto_557606 - TRUCK
      ?auto_557611 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_557605 ?auto_557607 ) ( SURFACE-AT ?auto_557602 ?auto_557607 ) ( CLEAR ?auto_557602 ) ( IS-CRATE ?auto_557603 ) ( not ( = ?auto_557602 ?auto_557603 ) ) ( ON ?auto_557602 ?auto_557604 ) ( not ( = ?auto_557604 ?auto_557602 ) ) ( not ( = ?auto_557604 ?auto_557603 ) ) ( not ( = ?auto_557608 ?auto_557607 ) ) ( HOIST-AT ?auto_557609 ?auto_557608 ) ( not ( = ?auto_557605 ?auto_557609 ) ) ( AVAILABLE ?auto_557609 ) ( SURFACE-AT ?auto_557603 ?auto_557608 ) ( ON ?auto_557603 ?auto_557610 ) ( CLEAR ?auto_557603 ) ( not ( = ?auto_557602 ?auto_557610 ) ) ( not ( = ?auto_557603 ?auto_557610 ) ) ( not ( = ?auto_557604 ?auto_557610 ) ) ( TRUCK-AT ?auto_557606 ?auto_557607 ) ( LIFTING ?auto_557605 ?auto_557611 ) ( IS-CRATE ?auto_557611 ) ( not ( = ?auto_557602 ?auto_557611 ) ) ( not ( = ?auto_557603 ?auto_557611 ) ) ( not ( = ?auto_557604 ?auto_557611 ) ) ( not ( = ?auto_557610 ?auto_557611 ) ) )
    :subtasks
    ( ( !LOAD ?auto_557605 ?auto_557611 ?auto_557606 ?auto_557607 )
      ( MAKE-1CRATE ?auto_557602 ?auto_557603 )
      ( MAKE-1CRATE-VERIFY ?auto_557602 ?auto_557603 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558440 - SURFACE
      ?auto_558441 - SURFACE
      ?auto_558442 - SURFACE
      ?auto_558439 - SURFACE
      ?auto_558443 - SURFACE
      ?auto_558445 - SURFACE
      ?auto_558444 - SURFACE
    )
    :vars
    (
      ?auto_558446 - HOIST
      ?auto_558447 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_558446 ?auto_558447 ) ( SURFACE-AT ?auto_558445 ?auto_558447 ) ( CLEAR ?auto_558445 ) ( LIFTING ?auto_558446 ?auto_558444 ) ( IS-CRATE ?auto_558444 ) ( not ( = ?auto_558445 ?auto_558444 ) ) ( ON ?auto_558441 ?auto_558440 ) ( ON ?auto_558442 ?auto_558441 ) ( ON ?auto_558439 ?auto_558442 ) ( ON ?auto_558443 ?auto_558439 ) ( ON ?auto_558445 ?auto_558443 ) ( not ( = ?auto_558440 ?auto_558441 ) ) ( not ( = ?auto_558440 ?auto_558442 ) ) ( not ( = ?auto_558440 ?auto_558439 ) ) ( not ( = ?auto_558440 ?auto_558443 ) ) ( not ( = ?auto_558440 ?auto_558445 ) ) ( not ( = ?auto_558440 ?auto_558444 ) ) ( not ( = ?auto_558441 ?auto_558442 ) ) ( not ( = ?auto_558441 ?auto_558439 ) ) ( not ( = ?auto_558441 ?auto_558443 ) ) ( not ( = ?auto_558441 ?auto_558445 ) ) ( not ( = ?auto_558441 ?auto_558444 ) ) ( not ( = ?auto_558442 ?auto_558439 ) ) ( not ( = ?auto_558442 ?auto_558443 ) ) ( not ( = ?auto_558442 ?auto_558445 ) ) ( not ( = ?auto_558442 ?auto_558444 ) ) ( not ( = ?auto_558439 ?auto_558443 ) ) ( not ( = ?auto_558439 ?auto_558445 ) ) ( not ( = ?auto_558439 ?auto_558444 ) ) ( not ( = ?auto_558443 ?auto_558445 ) ) ( not ( = ?auto_558443 ?auto_558444 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_558445 ?auto_558444 )
      ( MAKE-6CRATE-VERIFY ?auto_558440 ?auto_558441 ?auto_558442 ?auto_558439 ?auto_558443 ?auto_558445 ?auto_558444 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558484 - SURFACE
      ?auto_558485 - SURFACE
      ?auto_558486 - SURFACE
      ?auto_558483 - SURFACE
      ?auto_558487 - SURFACE
      ?auto_558489 - SURFACE
      ?auto_558488 - SURFACE
    )
    :vars
    (
      ?auto_558490 - HOIST
      ?auto_558491 - PLACE
      ?auto_558492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_558490 ?auto_558491 ) ( SURFACE-AT ?auto_558489 ?auto_558491 ) ( CLEAR ?auto_558489 ) ( IS-CRATE ?auto_558488 ) ( not ( = ?auto_558489 ?auto_558488 ) ) ( TRUCK-AT ?auto_558492 ?auto_558491 ) ( AVAILABLE ?auto_558490 ) ( IN ?auto_558488 ?auto_558492 ) ( ON ?auto_558489 ?auto_558487 ) ( not ( = ?auto_558487 ?auto_558489 ) ) ( not ( = ?auto_558487 ?auto_558488 ) ) ( ON ?auto_558485 ?auto_558484 ) ( ON ?auto_558486 ?auto_558485 ) ( ON ?auto_558483 ?auto_558486 ) ( ON ?auto_558487 ?auto_558483 ) ( not ( = ?auto_558484 ?auto_558485 ) ) ( not ( = ?auto_558484 ?auto_558486 ) ) ( not ( = ?auto_558484 ?auto_558483 ) ) ( not ( = ?auto_558484 ?auto_558487 ) ) ( not ( = ?auto_558484 ?auto_558489 ) ) ( not ( = ?auto_558484 ?auto_558488 ) ) ( not ( = ?auto_558485 ?auto_558486 ) ) ( not ( = ?auto_558485 ?auto_558483 ) ) ( not ( = ?auto_558485 ?auto_558487 ) ) ( not ( = ?auto_558485 ?auto_558489 ) ) ( not ( = ?auto_558485 ?auto_558488 ) ) ( not ( = ?auto_558486 ?auto_558483 ) ) ( not ( = ?auto_558486 ?auto_558487 ) ) ( not ( = ?auto_558486 ?auto_558489 ) ) ( not ( = ?auto_558486 ?auto_558488 ) ) ( not ( = ?auto_558483 ?auto_558487 ) ) ( not ( = ?auto_558483 ?auto_558489 ) ) ( not ( = ?auto_558483 ?auto_558488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558487 ?auto_558489 ?auto_558488 )
      ( MAKE-6CRATE-VERIFY ?auto_558484 ?auto_558485 ?auto_558486 ?auto_558483 ?auto_558487 ?auto_558489 ?auto_558488 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558535 - SURFACE
      ?auto_558536 - SURFACE
      ?auto_558537 - SURFACE
      ?auto_558534 - SURFACE
      ?auto_558538 - SURFACE
      ?auto_558540 - SURFACE
      ?auto_558539 - SURFACE
    )
    :vars
    (
      ?auto_558543 - HOIST
      ?auto_558542 - PLACE
      ?auto_558541 - TRUCK
      ?auto_558544 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_558543 ?auto_558542 ) ( SURFACE-AT ?auto_558540 ?auto_558542 ) ( CLEAR ?auto_558540 ) ( IS-CRATE ?auto_558539 ) ( not ( = ?auto_558540 ?auto_558539 ) ) ( AVAILABLE ?auto_558543 ) ( IN ?auto_558539 ?auto_558541 ) ( ON ?auto_558540 ?auto_558538 ) ( not ( = ?auto_558538 ?auto_558540 ) ) ( not ( = ?auto_558538 ?auto_558539 ) ) ( TRUCK-AT ?auto_558541 ?auto_558544 ) ( not ( = ?auto_558544 ?auto_558542 ) ) ( ON ?auto_558536 ?auto_558535 ) ( ON ?auto_558537 ?auto_558536 ) ( ON ?auto_558534 ?auto_558537 ) ( ON ?auto_558538 ?auto_558534 ) ( not ( = ?auto_558535 ?auto_558536 ) ) ( not ( = ?auto_558535 ?auto_558537 ) ) ( not ( = ?auto_558535 ?auto_558534 ) ) ( not ( = ?auto_558535 ?auto_558538 ) ) ( not ( = ?auto_558535 ?auto_558540 ) ) ( not ( = ?auto_558535 ?auto_558539 ) ) ( not ( = ?auto_558536 ?auto_558537 ) ) ( not ( = ?auto_558536 ?auto_558534 ) ) ( not ( = ?auto_558536 ?auto_558538 ) ) ( not ( = ?auto_558536 ?auto_558540 ) ) ( not ( = ?auto_558536 ?auto_558539 ) ) ( not ( = ?auto_558537 ?auto_558534 ) ) ( not ( = ?auto_558537 ?auto_558538 ) ) ( not ( = ?auto_558537 ?auto_558540 ) ) ( not ( = ?auto_558537 ?auto_558539 ) ) ( not ( = ?auto_558534 ?auto_558538 ) ) ( not ( = ?auto_558534 ?auto_558540 ) ) ( not ( = ?auto_558534 ?auto_558539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558538 ?auto_558540 ?auto_558539 )
      ( MAKE-6CRATE-VERIFY ?auto_558535 ?auto_558536 ?auto_558537 ?auto_558534 ?auto_558538 ?auto_558540 ?auto_558539 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558592 - SURFACE
      ?auto_558593 - SURFACE
      ?auto_558594 - SURFACE
      ?auto_558591 - SURFACE
      ?auto_558595 - SURFACE
      ?auto_558597 - SURFACE
      ?auto_558596 - SURFACE
    )
    :vars
    (
      ?auto_558602 - HOIST
      ?auto_558600 - PLACE
      ?auto_558601 - TRUCK
      ?auto_558599 - PLACE
      ?auto_558598 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_558602 ?auto_558600 ) ( SURFACE-AT ?auto_558597 ?auto_558600 ) ( CLEAR ?auto_558597 ) ( IS-CRATE ?auto_558596 ) ( not ( = ?auto_558597 ?auto_558596 ) ) ( AVAILABLE ?auto_558602 ) ( ON ?auto_558597 ?auto_558595 ) ( not ( = ?auto_558595 ?auto_558597 ) ) ( not ( = ?auto_558595 ?auto_558596 ) ) ( TRUCK-AT ?auto_558601 ?auto_558599 ) ( not ( = ?auto_558599 ?auto_558600 ) ) ( HOIST-AT ?auto_558598 ?auto_558599 ) ( LIFTING ?auto_558598 ?auto_558596 ) ( not ( = ?auto_558602 ?auto_558598 ) ) ( ON ?auto_558593 ?auto_558592 ) ( ON ?auto_558594 ?auto_558593 ) ( ON ?auto_558591 ?auto_558594 ) ( ON ?auto_558595 ?auto_558591 ) ( not ( = ?auto_558592 ?auto_558593 ) ) ( not ( = ?auto_558592 ?auto_558594 ) ) ( not ( = ?auto_558592 ?auto_558591 ) ) ( not ( = ?auto_558592 ?auto_558595 ) ) ( not ( = ?auto_558592 ?auto_558597 ) ) ( not ( = ?auto_558592 ?auto_558596 ) ) ( not ( = ?auto_558593 ?auto_558594 ) ) ( not ( = ?auto_558593 ?auto_558591 ) ) ( not ( = ?auto_558593 ?auto_558595 ) ) ( not ( = ?auto_558593 ?auto_558597 ) ) ( not ( = ?auto_558593 ?auto_558596 ) ) ( not ( = ?auto_558594 ?auto_558591 ) ) ( not ( = ?auto_558594 ?auto_558595 ) ) ( not ( = ?auto_558594 ?auto_558597 ) ) ( not ( = ?auto_558594 ?auto_558596 ) ) ( not ( = ?auto_558591 ?auto_558595 ) ) ( not ( = ?auto_558591 ?auto_558597 ) ) ( not ( = ?auto_558591 ?auto_558596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558595 ?auto_558597 ?auto_558596 )
      ( MAKE-6CRATE-VERIFY ?auto_558592 ?auto_558593 ?auto_558594 ?auto_558591 ?auto_558595 ?auto_558597 ?auto_558596 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558655 - SURFACE
      ?auto_558656 - SURFACE
      ?auto_558657 - SURFACE
      ?auto_558654 - SURFACE
      ?auto_558658 - SURFACE
      ?auto_558660 - SURFACE
      ?auto_558659 - SURFACE
    )
    :vars
    (
      ?auto_558664 - HOIST
      ?auto_558666 - PLACE
      ?auto_558662 - TRUCK
      ?auto_558663 - PLACE
      ?auto_558661 - HOIST
      ?auto_558665 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_558664 ?auto_558666 ) ( SURFACE-AT ?auto_558660 ?auto_558666 ) ( CLEAR ?auto_558660 ) ( IS-CRATE ?auto_558659 ) ( not ( = ?auto_558660 ?auto_558659 ) ) ( AVAILABLE ?auto_558664 ) ( ON ?auto_558660 ?auto_558658 ) ( not ( = ?auto_558658 ?auto_558660 ) ) ( not ( = ?auto_558658 ?auto_558659 ) ) ( TRUCK-AT ?auto_558662 ?auto_558663 ) ( not ( = ?auto_558663 ?auto_558666 ) ) ( HOIST-AT ?auto_558661 ?auto_558663 ) ( not ( = ?auto_558664 ?auto_558661 ) ) ( AVAILABLE ?auto_558661 ) ( SURFACE-AT ?auto_558659 ?auto_558663 ) ( ON ?auto_558659 ?auto_558665 ) ( CLEAR ?auto_558659 ) ( not ( = ?auto_558660 ?auto_558665 ) ) ( not ( = ?auto_558659 ?auto_558665 ) ) ( not ( = ?auto_558658 ?auto_558665 ) ) ( ON ?auto_558656 ?auto_558655 ) ( ON ?auto_558657 ?auto_558656 ) ( ON ?auto_558654 ?auto_558657 ) ( ON ?auto_558658 ?auto_558654 ) ( not ( = ?auto_558655 ?auto_558656 ) ) ( not ( = ?auto_558655 ?auto_558657 ) ) ( not ( = ?auto_558655 ?auto_558654 ) ) ( not ( = ?auto_558655 ?auto_558658 ) ) ( not ( = ?auto_558655 ?auto_558660 ) ) ( not ( = ?auto_558655 ?auto_558659 ) ) ( not ( = ?auto_558655 ?auto_558665 ) ) ( not ( = ?auto_558656 ?auto_558657 ) ) ( not ( = ?auto_558656 ?auto_558654 ) ) ( not ( = ?auto_558656 ?auto_558658 ) ) ( not ( = ?auto_558656 ?auto_558660 ) ) ( not ( = ?auto_558656 ?auto_558659 ) ) ( not ( = ?auto_558656 ?auto_558665 ) ) ( not ( = ?auto_558657 ?auto_558654 ) ) ( not ( = ?auto_558657 ?auto_558658 ) ) ( not ( = ?auto_558657 ?auto_558660 ) ) ( not ( = ?auto_558657 ?auto_558659 ) ) ( not ( = ?auto_558657 ?auto_558665 ) ) ( not ( = ?auto_558654 ?auto_558658 ) ) ( not ( = ?auto_558654 ?auto_558660 ) ) ( not ( = ?auto_558654 ?auto_558659 ) ) ( not ( = ?auto_558654 ?auto_558665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558658 ?auto_558660 ?auto_558659 )
      ( MAKE-6CRATE-VERIFY ?auto_558655 ?auto_558656 ?auto_558657 ?auto_558654 ?auto_558658 ?auto_558660 ?auto_558659 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558719 - SURFACE
      ?auto_558720 - SURFACE
      ?auto_558721 - SURFACE
      ?auto_558718 - SURFACE
      ?auto_558722 - SURFACE
      ?auto_558724 - SURFACE
      ?auto_558723 - SURFACE
    )
    :vars
    (
      ?auto_558730 - HOIST
      ?auto_558726 - PLACE
      ?auto_558725 - PLACE
      ?auto_558727 - HOIST
      ?auto_558728 - SURFACE
      ?auto_558729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_558730 ?auto_558726 ) ( SURFACE-AT ?auto_558724 ?auto_558726 ) ( CLEAR ?auto_558724 ) ( IS-CRATE ?auto_558723 ) ( not ( = ?auto_558724 ?auto_558723 ) ) ( AVAILABLE ?auto_558730 ) ( ON ?auto_558724 ?auto_558722 ) ( not ( = ?auto_558722 ?auto_558724 ) ) ( not ( = ?auto_558722 ?auto_558723 ) ) ( not ( = ?auto_558725 ?auto_558726 ) ) ( HOIST-AT ?auto_558727 ?auto_558725 ) ( not ( = ?auto_558730 ?auto_558727 ) ) ( AVAILABLE ?auto_558727 ) ( SURFACE-AT ?auto_558723 ?auto_558725 ) ( ON ?auto_558723 ?auto_558728 ) ( CLEAR ?auto_558723 ) ( not ( = ?auto_558724 ?auto_558728 ) ) ( not ( = ?auto_558723 ?auto_558728 ) ) ( not ( = ?auto_558722 ?auto_558728 ) ) ( TRUCK-AT ?auto_558729 ?auto_558726 ) ( ON ?auto_558720 ?auto_558719 ) ( ON ?auto_558721 ?auto_558720 ) ( ON ?auto_558718 ?auto_558721 ) ( ON ?auto_558722 ?auto_558718 ) ( not ( = ?auto_558719 ?auto_558720 ) ) ( not ( = ?auto_558719 ?auto_558721 ) ) ( not ( = ?auto_558719 ?auto_558718 ) ) ( not ( = ?auto_558719 ?auto_558722 ) ) ( not ( = ?auto_558719 ?auto_558724 ) ) ( not ( = ?auto_558719 ?auto_558723 ) ) ( not ( = ?auto_558719 ?auto_558728 ) ) ( not ( = ?auto_558720 ?auto_558721 ) ) ( not ( = ?auto_558720 ?auto_558718 ) ) ( not ( = ?auto_558720 ?auto_558722 ) ) ( not ( = ?auto_558720 ?auto_558724 ) ) ( not ( = ?auto_558720 ?auto_558723 ) ) ( not ( = ?auto_558720 ?auto_558728 ) ) ( not ( = ?auto_558721 ?auto_558718 ) ) ( not ( = ?auto_558721 ?auto_558722 ) ) ( not ( = ?auto_558721 ?auto_558724 ) ) ( not ( = ?auto_558721 ?auto_558723 ) ) ( not ( = ?auto_558721 ?auto_558728 ) ) ( not ( = ?auto_558718 ?auto_558722 ) ) ( not ( = ?auto_558718 ?auto_558724 ) ) ( not ( = ?auto_558718 ?auto_558723 ) ) ( not ( = ?auto_558718 ?auto_558728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558722 ?auto_558724 ?auto_558723 )
      ( MAKE-6CRATE-VERIFY ?auto_558719 ?auto_558720 ?auto_558721 ?auto_558718 ?auto_558722 ?auto_558724 ?auto_558723 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558783 - SURFACE
      ?auto_558784 - SURFACE
      ?auto_558785 - SURFACE
      ?auto_558782 - SURFACE
      ?auto_558786 - SURFACE
      ?auto_558788 - SURFACE
      ?auto_558787 - SURFACE
    )
    :vars
    (
      ?auto_558790 - HOIST
      ?auto_558791 - PLACE
      ?auto_558793 - PLACE
      ?auto_558789 - HOIST
      ?auto_558792 - SURFACE
      ?auto_558794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_558790 ?auto_558791 ) ( IS-CRATE ?auto_558787 ) ( not ( = ?auto_558788 ?auto_558787 ) ) ( not ( = ?auto_558786 ?auto_558788 ) ) ( not ( = ?auto_558786 ?auto_558787 ) ) ( not ( = ?auto_558793 ?auto_558791 ) ) ( HOIST-AT ?auto_558789 ?auto_558793 ) ( not ( = ?auto_558790 ?auto_558789 ) ) ( AVAILABLE ?auto_558789 ) ( SURFACE-AT ?auto_558787 ?auto_558793 ) ( ON ?auto_558787 ?auto_558792 ) ( CLEAR ?auto_558787 ) ( not ( = ?auto_558788 ?auto_558792 ) ) ( not ( = ?auto_558787 ?auto_558792 ) ) ( not ( = ?auto_558786 ?auto_558792 ) ) ( TRUCK-AT ?auto_558794 ?auto_558791 ) ( SURFACE-AT ?auto_558786 ?auto_558791 ) ( CLEAR ?auto_558786 ) ( LIFTING ?auto_558790 ?auto_558788 ) ( IS-CRATE ?auto_558788 ) ( ON ?auto_558784 ?auto_558783 ) ( ON ?auto_558785 ?auto_558784 ) ( ON ?auto_558782 ?auto_558785 ) ( ON ?auto_558786 ?auto_558782 ) ( not ( = ?auto_558783 ?auto_558784 ) ) ( not ( = ?auto_558783 ?auto_558785 ) ) ( not ( = ?auto_558783 ?auto_558782 ) ) ( not ( = ?auto_558783 ?auto_558786 ) ) ( not ( = ?auto_558783 ?auto_558788 ) ) ( not ( = ?auto_558783 ?auto_558787 ) ) ( not ( = ?auto_558783 ?auto_558792 ) ) ( not ( = ?auto_558784 ?auto_558785 ) ) ( not ( = ?auto_558784 ?auto_558782 ) ) ( not ( = ?auto_558784 ?auto_558786 ) ) ( not ( = ?auto_558784 ?auto_558788 ) ) ( not ( = ?auto_558784 ?auto_558787 ) ) ( not ( = ?auto_558784 ?auto_558792 ) ) ( not ( = ?auto_558785 ?auto_558782 ) ) ( not ( = ?auto_558785 ?auto_558786 ) ) ( not ( = ?auto_558785 ?auto_558788 ) ) ( not ( = ?auto_558785 ?auto_558787 ) ) ( not ( = ?auto_558785 ?auto_558792 ) ) ( not ( = ?auto_558782 ?auto_558786 ) ) ( not ( = ?auto_558782 ?auto_558788 ) ) ( not ( = ?auto_558782 ?auto_558787 ) ) ( not ( = ?auto_558782 ?auto_558792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558786 ?auto_558788 ?auto_558787 )
      ( MAKE-6CRATE-VERIFY ?auto_558783 ?auto_558784 ?auto_558785 ?auto_558782 ?auto_558786 ?auto_558788 ?auto_558787 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558847 - SURFACE
      ?auto_558848 - SURFACE
      ?auto_558849 - SURFACE
      ?auto_558846 - SURFACE
      ?auto_558850 - SURFACE
      ?auto_558852 - SURFACE
      ?auto_558851 - SURFACE
    )
    :vars
    (
      ?auto_558856 - HOIST
      ?auto_558858 - PLACE
      ?auto_558853 - PLACE
      ?auto_558857 - HOIST
      ?auto_558854 - SURFACE
      ?auto_558855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_558856 ?auto_558858 ) ( IS-CRATE ?auto_558851 ) ( not ( = ?auto_558852 ?auto_558851 ) ) ( not ( = ?auto_558850 ?auto_558852 ) ) ( not ( = ?auto_558850 ?auto_558851 ) ) ( not ( = ?auto_558853 ?auto_558858 ) ) ( HOIST-AT ?auto_558857 ?auto_558853 ) ( not ( = ?auto_558856 ?auto_558857 ) ) ( AVAILABLE ?auto_558857 ) ( SURFACE-AT ?auto_558851 ?auto_558853 ) ( ON ?auto_558851 ?auto_558854 ) ( CLEAR ?auto_558851 ) ( not ( = ?auto_558852 ?auto_558854 ) ) ( not ( = ?auto_558851 ?auto_558854 ) ) ( not ( = ?auto_558850 ?auto_558854 ) ) ( TRUCK-AT ?auto_558855 ?auto_558858 ) ( SURFACE-AT ?auto_558850 ?auto_558858 ) ( CLEAR ?auto_558850 ) ( IS-CRATE ?auto_558852 ) ( AVAILABLE ?auto_558856 ) ( IN ?auto_558852 ?auto_558855 ) ( ON ?auto_558848 ?auto_558847 ) ( ON ?auto_558849 ?auto_558848 ) ( ON ?auto_558846 ?auto_558849 ) ( ON ?auto_558850 ?auto_558846 ) ( not ( = ?auto_558847 ?auto_558848 ) ) ( not ( = ?auto_558847 ?auto_558849 ) ) ( not ( = ?auto_558847 ?auto_558846 ) ) ( not ( = ?auto_558847 ?auto_558850 ) ) ( not ( = ?auto_558847 ?auto_558852 ) ) ( not ( = ?auto_558847 ?auto_558851 ) ) ( not ( = ?auto_558847 ?auto_558854 ) ) ( not ( = ?auto_558848 ?auto_558849 ) ) ( not ( = ?auto_558848 ?auto_558846 ) ) ( not ( = ?auto_558848 ?auto_558850 ) ) ( not ( = ?auto_558848 ?auto_558852 ) ) ( not ( = ?auto_558848 ?auto_558851 ) ) ( not ( = ?auto_558848 ?auto_558854 ) ) ( not ( = ?auto_558849 ?auto_558846 ) ) ( not ( = ?auto_558849 ?auto_558850 ) ) ( not ( = ?auto_558849 ?auto_558852 ) ) ( not ( = ?auto_558849 ?auto_558851 ) ) ( not ( = ?auto_558849 ?auto_558854 ) ) ( not ( = ?auto_558846 ?auto_558850 ) ) ( not ( = ?auto_558846 ?auto_558852 ) ) ( not ( = ?auto_558846 ?auto_558851 ) ) ( not ( = ?auto_558846 ?auto_558854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558850 ?auto_558852 ?auto_558851 )
      ( MAKE-6CRATE-VERIFY ?auto_558847 ?auto_558848 ?auto_558849 ?auto_558846 ?auto_558850 ?auto_558852 ?auto_558851 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_560522 - SURFACE
      ?auto_560523 - SURFACE
    )
    :vars
    (
      ?auto_560526 - HOIST
      ?auto_560525 - PLACE
      ?auto_560529 - SURFACE
      ?auto_560527 - TRUCK
      ?auto_560528 - PLACE
      ?auto_560524 - HOIST
      ?auto_560530 - SURFACE
      ?auto_560531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_560526 ?auto_560525 ) ( SURFACE-AT ?auto_560522 ?auto_560525 ) ( CLEAR ?auto_560522 ) ( IS-CRATE ?auto_560523 ) ( not ( = ?auto_560522 ?auto_560523 ) ) ( AVAILABLE ?auto_560526 ) ( ON ?auto_560522 ?auto_560529 ) ( not ( = ?auto_560529 ?auto_560522 ) ) ( not ( = ?auto_560529 ?auto_560523 ) ) ( TRUCK-AT ?auto_560527 ?auto_560528 ) ( not ( = ?auto_560528 ?auto_560525 ) ) ( HOIST-AT ?auto_560524 ?auto_560528 ) ( not ( = ?auto_560526 ?auto_560524 ) ) ( SURFACE-AT ?auto_560523 ?auto_560528 ) ( ON ?auto_560523 ?auto_560530 ) ( CLEAR ?auto_560523 ) ( not ( = ?auto_560522 ?auto_560530 ) ) ( not ( = ?auto_560523 ?auto_560530 ) ) ( not ( = ?auto_560529 ?auto_560530 ) ) ( LIFTING ?auto_560524 ?auto_560531 ) ( IS-CRATE ?auto_560531 ) ( not ( = ?auto_560522 ?auto_560531 ) ) ( not ( = ?auto_560523 ?auto_560531 ) ) ( not ( = ?auto_560529 ?auto_560531 ) ) ( not ( = ?auto_560530 ?auto_560531 ) ) )
    :subtasks
    ( ( !LOAD ?auto_560524 ?auto_560531 ?auto_560527 ?auto_560528 )
      ( MAKE-1CRATE ?auto_560522 ?auto_560523 )
      ( MAKE-1CRATE-VERIFY ?auto_560522 ?auto_560523 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560799 - SURFACE
      ?auto_560800 - SURFACE
      ?auto_560801 - SURFACE
      ?auto_560798 - SURFACE
      ?auto_560802 - SURFACE
      ?auto_560804 - SURFACE
      ?auto_560803 - SURFACE
      ?auto_560805 - SURFACE
    )
    :vars
    (
      ?auto_560806 - HOIST
      ?auto_560807 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_560806 ?auto_560807 ) ( SURFACE-AT ?auto_560803 ?auto_560807 ) ( CLEAR ?auto_560803 ) ( LIFTING ?auto_560806 ?auto_560805 ) ( IS-CRATE ?auto_560805 ) ( not ( = ?auto_560803 ?auto_560805 ) ) ( ON ?auto_560800 ?auto_560799 ) ( ON ?auto_560801 ?auto_560800 ) ( ON ?auto_560798 ?auto_560801 ) ( ON ?auto_560802 ?auto_560798 ) ( ON ?auto_560804 ?auto_560802 ) ( ON ?auto_560803 ?auto_560804 ) ( not ( = ?auto_560799 ?auto_560800 ) ) ( not ( = ?auto_560799 ?auto_560801 ) ) ( not ( = ?auto_560799 ?auto_560798 ) ) ( not ( = ?auto_560799 ?auto_560802 ) ) ( not ( = ?auto_560799 ?auto_560804 ) ) ( not ( = ?auto_560799 ?auto_560803 ) ) ( not ( = ?auto_560799 ?auto_560805 ) ) ( not ( = ?auto_560800 ?auto_560801 ) ) ( not ( = ?auto_560800 ?auto_560798 ) ) ( not ( = ?auto_560800 ?auto_560802 ) ) ( not ( = ?auto_560800 ?auto_560804 ) ) ( not ( = ?auto_560800 ?auto_560803 ) ) ( not ( = ?auto_560800 ?auto_560805 ) ) ( not ( = ?auto_560801 ?auto_560798 ) ) ( not ( = ?auto_560801 ?auto_560802 ) ) ( not ( = ?auto_560801 ?auto_560804 ) ) ( not ( = ?auto_560801 ?auto_560803 ) ) ( not ( = ?auto_560801 ?auto_560805 ) ) ( not ( = ?auto_560798 ?auto_560802 ) ) ( not ( = ?auto_560798 ?auto_560804 ) ) ( not ( = ?auto_560798 ?auto_560803 ) ) ( not ( = ?auto_560798 ?auto_560805 ) ) ( not ( = ?auto_560802 ?auto_560804 ) ) ( not ( = ?auto_560802 ?auto_560803 ) ) ( not ( = ?auto_560802 ?auto_560805 ) ) ( not ( = ?auto_560804 ?auto_560803 ) ) ( not ( = ?auto_560804 ?auto_560805 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_560803 ?auto_560805 )
      ( MAKE-7CRATE-VERIFY ?auto_560799 ?auto_560800 ?auto_560801 ?auto_560798 ?auto_560802 ?auto_560804 ?auto_560803 ?auto_560805 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560854 - SURFACE
      ?auto_560855 - SURFACE
      ?auto_560856 - SURFACE
      ?auto_560853 - SURFACE
      ?auto_560857 - SURFACE
      ?auto_560859 - SURFACE
      ?auto_560858 - SURFACE
      ?auto_560860 - SURFACE
    )
    :vars
    (
      ?auto_560862 - HOIST
      ?auto_560861 - PLACE
      ?auto_560863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_560862 ?auto_560861 ) ( SURFACE-AT ?auto_560858 ?auto_560861 ) ( CLEAR ?auto_560858 ) ( IS-CRATE ?auto_560860 ) ( not ( = ?auto_560858 ?auto_560860 ) ) ( TRUCK-AT ?auto_560863 ?auto_560861 ) ( AVAILABLE ?auto_560862 ) ( IN ?auto_560860 ?auto_560863 ) ( ON ?auto_560858 ?auto_560859 ) ( not ( = ?auto_560859 ?auto_560858 ) ) ( not ( = ?auto_560859 ?auto_560860 ) ) ( ON ?auto_560855 ?auto_560854 ) ( ON ?auto_560856 ?auto_560855 ) ( ON ?auto_560853 ?auto_560856 ) ( ON ?auto_560857 ?auto_560853 ) ( ON ?auto_560859 ?auto_560857 ) ( not ( = ?auto_560854 ?auto_560855 ) ) ( not ( = ?auto_560854 ?auto_560856 ) ) ( not ( = ?auto_560854 ?auto_560853 ) ) ( not ( = ?auto_560854 ?auto_560857 ) ) ( not ( = ?auto_560854 ?auto_560859 ) ) ( not ( = ?auto_560854 ?auto_560858 ) ) ( not ( = ?auto_560854 ?auto_560860 ) ) ( not ( = ?auto_560855 ?auto_560856 ) ) ( not ( = ?auto_560855 ?auto_560853 ) ) ( not ( = ?auto_560855 ?auto_560857 ) ) ( not ( = ?auto_560855 ?auto_560859 ) ) ( not ( = ?auto_560855 ?auto_560858 ) ) ( not ( = ?auto_560855 ?auto_560860 ) ) ( not ( = ?auto_560856 ?auto_560853 ) ) ( not ( = ?auto_560856 ?auto_560857 ) ) ( not ( = ?auto_560856 ?auto_560859 ) ) ( not ( = ?auto_560856 ?auto_560858 ) ) ( not ( = ?auto_560856 ?auto_560860 ) ) ( not ( = ?auto_560853 ?auto_560857 ) ) ( not ( = ?auto_560853 ?auto_560859 ) ) ( not ( = ?auto_560853 ?auto_560858 ) ) ( not ( = ?auto_560853 ?auto_560860 ) ) ( not ( = ?auto_560857 ?auto_560859 ) ) ( not ( = ?auto_560857 ?auto_560858 ) ) ( not ( = ?auto_560857 ?auto_560860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560859 ?auto_560858 ?auto_560860 )
      ( MAKE-7CRATE-VERIFY ?auto_560854 ?auto_560855 ?auto_560856 ?auto_560853 ?auto_560857 ?auto_560859 ?auto_560858 ?auto_560860 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560917 - SURFACE
      ?auto_560918 - SURFACE
      ?auto_560919 - SURFACE
      ?auto_560916 - SURFACE
      ?auto_560920 - SURFACE
      ?auto_560922 - SURFACE
      ?auto_560921 - SURFACE
      ?auto_560923 - SURFACE
    )
    :vars
    (
      ?auto_560925 - HOIST
      ?auto_560924 - PLACE
      ?auto_560927 - TRUCK
      ?auto_560926 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_560925 ?auto_560924 ) ( SURFACE-AT ?auto_560921 ?auto_560924 ) ( CLEAR ?auto_560921 ) ( IS-CRATE ?auto_560923 ) ( not ( = ?auto_560921 ?auto_560923 ) ) ( AVAILABLE ?auto_560925 ) ( IN ?auto_560923 ?auto_560927 ) ( ON ?auto_560921 ?auto_560922 ) ( not ( = ?auto_560922 ?auto_560921 ) ) ( not ( = ?auto_560922 ?auto_560923 ) ) ( TRUCK-AT ?auto_560927 ?auto_560926 ) ( not ( = ?auto_560926 ?auto_560924 ) ) ( ON ?auto_560918 ?auto_560917 ) ( ON ?auto_560919 ?auto_560918 ) ( ON ?auto_560916 ?auto_560919 ) ( ON ?auto_560920 ?auto_560916 ) ( ON ?auto_560922 ?auto_560920 ) ( not ( = ?auto_560917 ?auto_560918 ) ) ( not ( = ?auto_560917 ?auto_560919 ) ) ( not ( = ?auto_560917 ?auto_560916 ) ) ( not ( = ?auto_560917 ?auto_560920 ) ) ( not ( = ?auto_560917 ?auto_560922 ) ) ( not ( = ?auto_560917 ?auto_560921 ) ) ( not ( = ?auto_560917 ?auto_560923 ) ) ( not ( = ?auto_560918 ?auto_560919 ) ) ( not ( = ?auto_560918 ?auto_560916 ) ) ( not ( = ?auto_560918 ?auto_560920 ) ) ( not ( = ?auto_560918 ?auto_560922 ) ) ( not ( = ?auto_560918 ?auto_560921 ) ) ( not ( = ?auto_560918 ?auto_560923 ) ) ( not ( = ?auto_560919 ?auto_560916 ) ) ( not ( = ?auto_560919 ?auto_560920 ) ) ( not ( = ?auto_560919 ?auto_560922 ) ) ( not ( = ?auto_560919 ?auto_560921 ) ) ( not ( = ?auto_560919 ?auto_560923 ) ) ( not ( = ?auto_560916 ?auto_560920 ) ) ( not ( = ?auto_560916 ?auto_560922 ) ) ( not ( = ?auto_560916 ?auto_560921 ) ) ( not ( = ?auto_560916 ?auto_560923 ) ) ( not ( = ?auto_560920 ?auto_560922 ) ) ( not ( = ?auto_560920 ?auto_560921 ) ) ( not ( = ?auto_560920 ?auto_560923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560922 ?auto_560921 ?auto_560923 )
      ( MAKE-7CRATE-VERIFY ?auto_560917 ?auto_560918 ?auto_560919 ?auto_560916 ?auto_560920 ?auto_560922 ?auto_560921 ?auto_560923 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560987 - SURFACE
      ?auto_560988 - SURFACE
      ?auto_560989 - SURFACE
      ?auto_560986 - SURFACE
      ?auto_560990 - SURFACE
      ?auto_560992 - SURFACE
      ?auto_560991 - SURFACE
      ?auto_560993 - SURFACE
    )
    :vars
    (
      ?auto_560996 - HOIST
      ?auto_560997 - PLACE
      ?auto_560998 - TRUCK
      ?auto_560995 - PLACE
      ?auto_560994 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_560996 ?auto_560997 ) ( SURFACE-AT ?auto_560991 ?auto_560997 ) ( CLEAR ?auto_560991 ) ( IS-CRATE ?auto_560993 ) ( not ( = ?auto_560991 ?auto_560993 ) ) ( AVAILABLE ?auto_560996 ) ( ON ?auto_560991 ?auto_560992 ) ( not ( = ?auto_560992 ?auto_560991 ) ) ( not ( = ?auto_560992 ?auto_560993 ) ) ( TRUCK-AT ?auto_560998 ?auto_560995 ) ( not ( = ?auto_560995 ?auto_560997 ) ) ( HOIST-AT ?auto_560994 ?auto_560995 ) ( LIFTING ?auto_560994 ?auto_560993 ) ( not ( = ?auto_560996 ?auto_560994 ) ) ( ON ?auto_560988 ?auto_560987 ) ( ON ?auto_560989 ?auto_560988 ) ( ON ?auto_560986 ?auto_560989 ) ( ON ?auto_560990 ?auto_560986 ) ( ON ?auto_560992 ?auto_560990 ) ( not ( = ?auto_560987 ?auto_560988 ) ) ( not ( = ?auto_560987 ?auto_560989 ) ) ( not ( = ?auto_560987 ?auto_560986 ) ) ( not ( = ?auto_560987 ?auto_560990 ) ) ( not ( = ?auto_560987 ?auto_560992 ) ) ( not ( = ?auto_560987 ?auto_560991 ) ) ( not ( = ?auto_560987 ?auto_560993 ) ) ( not ( = ?auto_560988 ?auto_560989 ) ) ( not ( = ?auto_560988 ?auto_560986 ) ) ( not ( = ?auto_560988 ?auto_560990 ) ) ( not ( = ?auto_560988 ?auto_560992 ) ) ( not ( = ?auto_560988 ?auto_560991 ) ) ( not ( = ?auto_560988 ?auto_560993 ) ) ( not ( = ?auto_560989 ?auto_560986 ) ) ( not ( = ?auto_560989 ?auto_560990 ) ) ( not ( = ?auto_560989 ?auto_560992 ) ) ( not ( = ?auto_560989 ?auto_560991 ) ) ( not ( = ?auto_560989 ?auto_560993 ) ) ( not ( = ?auto_560986 ?auto_560990 ) ) ( not ( = ?auto_560986 ?auto_560992 ) ) ( not ( = ?auto_560986 ?auto_560991 ) ) ( not ( = ?auto_560986 ?auto_560993 ) ) ( not ( = ?auto_560990 ?auto_560992 ) ) ( not ( = ?auto_560990 ?auto_560991 ) ) ( not ( = ?auto_560990 ?auto_560993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560992 ?auto_560991 ?auto_560993 )
      ( MAKE-7CRATE-VERIFY ?auto_560987 ?auto_560988 ?auto_560989 ?auto_560986 ?auto_560990 ?auto_560992 ?auto_560991 ?auto_560993 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_561064 - SURFACE
      ?auto_561065 - SURFACE
      ?auto_561066 - SURFACE
      ?auto_561063 - SURFACE
      ?auto_561067 - SURFACE
      ?auto_561069 - SURFACE
      ?auto_561068 - SURFACE
      ?auto_561070 - SURFACE
    )
    :vars
    (
      ?auto_561071 - HOIST
      ?auto_561074 - PLACE
      ?auto_561072 - TRUCK
      ?auto_561073 - PLACE
      ?auto_561076 - HOIST
      ?auto_561075 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_561071 ?auto_561074 ) ( SURFACE-AT ?auto_561068 ?auto_561074 ) ( CLEAR ?auto_561068 ) ( IS-CRATE ?auto_561070 ) ( not ( = ?auto_561068 ?auto_561070 ) ) ( AVAILABLE ?auto_561071 ) ( ON ?auto_561068 ?auto_561069 ) ( not ( = ?auto_561069 ?auto_561068 ) ) ( not ( = ?auto_561069 ?auto_561070 ) ) ( TRUCK-AT ?auto_561072 ?auto_561073 ) ( not ( = ?auto_561073 ?auto_561074 ) ) ( HOIST-AT ?auto_561076 ?auto_561073 ) ( not ( = ?auto_561071 ?auto_561076 ) ) ( AVAILABLE ?auto_561076 ) ( SURFACE-AT ?auto_561070 ?auto_561073 ) ( ON ?auto_561070 ?auto_561075 ) ( CLEAR ?auto_561070 ) ( not ( = ?auto_561068 ?auto_561075 ) ) ( not ( = ?auto_561070 ?auto_561075 ) ) ( not ( = ?auto_561069 ?auto_561075 ) ) ( ON ?auto_561065 ?auto_561064 ) ( ON ?auto_561066 ?auto_561065 ) ( ON ?auto_561063 ?auto_561066 ) ( ON ?auto_561067 ?auto_561063 ) ( ON ?auto_561069 ?auto_561067 ) ( not ( = ?auto_561064 ?auto_561065 ) ) ( not ( = ?auto_561064 ?auto_561066 ) ) ( not ( = ?auto_561064 ?auto_561063 ) ) ( not ( = ?auto_561064 ?auto_561067 ) ) ( not ( = ?auto_561064 ?auto_561069 ) ) ( not ( = ?auto_561064 ?auto_561068 ) ) ( not ( = ?auto_561064 ?auto_561070 ) ) ( not ( = ?auto_561064 ?auto_561075 ) ) ( not ( = ?auto_561065 ?auto_561066 ) ) ( not ( = ?auto_561065 ?auto_561063 ) ) ( not ( = ?auto_561065 ?auto_561067 ) ) ( not ( = ?auto_561065 ?auto_561069 ) ) ( not ( = ?auto_561065 ?auto_561068 ) ) ( not ( = ?auto_561065 ?auto_561070 ) ) ( not ( = ?auto_561065 ?auto_561075 ) ) ( not ( = ?auto_561066 ?auto_561063 ) ) ( not ( = ?auto_561066 ?auto_561067 ) ) ( not ( = ?auto_561066 ?auto_561069 ) ) ( not ( = ?auto_561066 ?auto_561068 ) ) ( not ( = ?auto_561066 ?auto_561070 ) ) ( not ( = ?auto_561066 ?auto_561075 ) ) ( not ( = ?auto_561063 ?auto_561067 ) ) ( not ( = ?auto_561063 ?auto_561069 ) ) ( not ( = ?auto_561063 ?auto_561068 ) ) ( not ( = ?auto_561063 ?auto_561070 ) ) ( not ( = ?auto_561063 ?auto_561075 ) ) ( not ( = ?auto_561067 ?auto_561069 ) ) ( not ( = ?auto_561067 ?auto_561068 ) ) ( not ( = ?auto_561067 ?auto_561070 ) ) ( not ( = ?auto_561067 ?auto_561075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_561069 ?auto_561068 ?auto_561070 )
      ( MAKE-7CRATE-VERIFY ?auto_561064 ?auto_561065 ?auto_561066 ?auto_561063 ?auto_561067 ?auto_561069 ?auto_561068 ?auto_561070 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_561142 - SURFACE
      ?auto_561143 - SURFACE
      ?auto_561144 - SURFACE
      ?auto_561141 - SURFACE
      ?auto_561145 - SURFACE
      ?auto_561147 - SURFACE
      ?auto_561146 - SURFACE
      ?auto_561148 - SURFACE
    )
    :vars
    (
      ?auto_561151 - HOIST
      ?auto_561153 - PLACE
      ?auto_561150 - PLACE
      ?auto_561152 - HOIST
      ?auto_561149 - SURFACE
      ?auto_561154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_561151 ?auto_561153 ) ( SURFACE-AT ?auto_561146 ?auto_561153 ) ( CLEAR ?auto_561146 ) ( IS-CRATE ?auto_561148 ) ( not ( = ?auto_561146 ?auto_561148 ) ) ( AVAILABLE ?auto_561151 ) ( ON ?auto_561146 ?auto_561147 ) ( not ( = ?auto_561147 ?auto_561146 ) ) ( not ( = ?auto_561147 ?auto_561148 ) ) ( not ( = ?auto_561150 ?auto_561153 ) ) ( HOIST-AT ?auto_561152 ?auto_561150 ) ( not ( = ?auto_561151 ?auto_561152 ) ) ( AVAILABLE ?auto_561152 ) ( SURFACE-AT ?auto_561148 ?auto_561150 ) ( ON ?auto_561148 ?auto_561149 ) ( CLEAR ?auto_561148 ) ( not ( = ?auto_561146 ?auto_561149 ) ) ( not ( = ?auto_561148 ?auto_561149 ) ) ( not ( = ?auto_561147 ?auto_561149 ) ) ( TRUCK-AT ?auto_561154 ?auto_561153 ) ( ON ?auto_561143 ?auto_561142 ) ( ON ?auto_561144 ?auto_561143 ) ( ON ?auto_561141 ?auto_561144 ) ( ON ?auto_561145 ?auto_561141 ) ( ON ?auto_561147 ?auto_561145 ) ( not ( = ?auto_561142 ?auto_561143 ) ) ( not ( = ?auto_561142 ?auto_561144 ) ) ( not ( = ?auto_561142 ?auto_561141 ) ) ( not ( = ?auto_561142 ?auto_561145 ) ) ( not ( = ?auto_561142 ?auto_561147 ) ) ( not ( = ?auto_561142 ?auto_561146 ) ) ( not ( = ?auto_561142 ?auto_561148 ) ) ( not ( = ?auto_561142 ?auto_561149 ) ) ( not ( = ?auto_561143 ?auto_561144 ) ) ( not ( = ?auto_561143 ?auto_561141 ) ) ( not ( = ?auto_561143 ?auto_561145 ) ) ( not ( = ?auto_561143 ?auto_561147 ) ) ( not ( = ?auto_561143 ?auto_561146 ) ) ( not ( = ?auto_561143 ?auto_561148 ) ) ( not ( = ?auto_561143 ?auto_561149 ) ) ( not ( = ?auto_561144 ?auto_561141 ) ) ( not ( = ?auto_561144 ?auto_561145 ) ) ( not ( = ?auto_561144 ?auto_561147 ) ) ( not ( = ?auto_561144 ?auto_561146 ) ) ( not ( = ?auto_561144 ?auto_561148 ) ) ( not ( = ?auto_561144 ?auto_561149 ) ) ( not ( = ?auto_561141 ?auto_561145 ) ) ( not ( = ?auto_561141 ?auto_561147 ) ) ( not ( = ?auto_561141 ?auto_561146 ) ) ( not ( = ?auto_561141 ?auto_561148 ) ) ( not ( = ?auto_561141 ?auto_561149 ) ) ( not ( = ?auto_561145 ?auto_561147 ) ) ( not ( = ?auto_561145 ?auto_561146 ) ) ( not ( = ?auto_561145 ?auto_561148 ) ) ( not ( = ?auto_561145 ?auto_561149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_561147 ?auto_561146 ?auto_561148 )
      ( MAKE-7CRATE-VERIFY ?auto_561142 ?auto_561143 ?auto_561144 ?auto_561141 ?auto_561145 ?auto_561147 ?auto_561146 ?auto_561148 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_561220 - SURFACE
      ?auto_561221 - SURFACE
      ?auto_561222 - SURFACE
      ?auto_561219 - SURFACE
      ?auto_561223 - SURFACE
      ?auto_561225 - SURFACE
      ?auto_561224 - SURFACE
      ?auto_561226 - SURFACE
    )
    :vars
    (
      ?auto_561227 - HOIST
      ?auto_561229 - PLACE
      ?auto_561230 - PLACE
      ?auto_561231 - HOIST
      ?auto_561232 - SURFACE
      ?auto_561228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_561227 ?auto_561229 ) ( IS-CRATE ?auto_561226 ) ( not ( = ?auto_561224 ?auto_561226 ) ) ( not ( = ?auto_561225 ?auto_561224 ) ) ( not ( = ?auto_561225 ?auto_561226 ) ) ( not ( = ?auto_561230 ?auto_561229 ) ) ( HOIST-AT ?auto_561231 ?auto_561230 ) ( not ( = ?auto_561227 ?auto_561231 ) ) ( AVAILABLE ?auto_561231 ) ( SURFACE-AT ?auto_561226 ?auto_561230 ) ( ON ?auto_561226 ?auto_561232 ) ( CLEAR ?auto_561226 ) ( not ( = ?auto_561224 ?auto_561232 ) ) ( not ( = ?auto_561226 ?auto_561232 ) ) ( not ( = ?auto_561225 ?auto_561232 ) ) ( TRUCK-AT ?auto_561228 ?auto_561229 ) ( SURFACE-AT ?auto_561225 ?auto_561229 ) ( CLEAR ?auto_561225 ) ( LIFTING ?auto_561227 ?auto_561224 ) ( IS-CRATE ?auto_561224 ) ( ON ?auto_561221 ?auto_561220 ) ( ON ?auto_561222 ?auto_561221 ) ( ON ?auto_561219 ?auto_561222 ) ( ON ?auto_561223 ?auto_561219 ) ( ON ?auto_561225 ?auto_561223 ) ( not ( = ?auto_561220 ?auto_561221 ) ) ( not ( = ?auto_561220 ?auto_561222 ) ) ( not ( = ?auto_561220 ?auto_561219 ) ) ( not ( = ?auto_561220 ?auto_561223 ) ) ( not ( = ?auto_561220 ?auto_561225 ) ) ( not ( = ?auto_561220 ?auto_561224 ) ) ( not ( = ?auto_561220 ?auto_561226 ) ) ( not ( = ?auto_561220 ?auto_561232 ) ) ( not ( = ?auto_561221 ?auto_561222 ) ) ( not ( = ?auto_561221 ?auto_561219 ) ) ( not ( = ?auto_561221 ?auto_561223 ) ) ( not ( = ?auto_561221 ?auto_561225 ) ) ( not ( = ?auto_561221 ?auto_561224 ) ) ( not ( = ?auto_561221 ?auto_561226 ) ) ( not ( = ?auto_561221 ?auto_561232 ) ) ( not ( = ?auto_561222 ?auto_561219 ) ) ( not ( = ?auto_561222 ?auto_561223 ) ) ( not ( = ?auto_561222 ?auto_561225 ) ) ( not ( = ?auto_561222 ?auto_561224 ) ) ( not ( = ?auto_561222 ?auto_561226 ) ) ( not ( = ?auto_561222 ?auto_561232 ) ) ( not ( = ?auto_561219 ?auto_561223 ) ) ( not ( = ?auto_561219 ?auto_561225 ) ) ( not ( = ?auto_561219 ?auto_561224 ) ) ( not ( = ?auto_561219 ?auto_561226 ) ) ( not ( = ?auto_561219 ?auto_561232 ) ) ( not ( = ?auto_561223 ?auto_561225 ) ) ( not ( = ?auto_561223 ?auto_561224 ) ) ( not ( = ?auto_561223 ?auto_561226 ) ) ( not ( = ?auto_561223 ?auto_561232 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_561225 ?auto_561224 ?auto_561226 )
      ( MAKE-7CRATE-VERIFY ?auto_561220 ?auto_561221 ?auto_561222 ?auto_561219 ?auto_561223 ?auto_561225 ?auto_561224 ?auto_561226 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_561298 - SURFACE
      ?auto_561299 - SURFACE
      ?auto_561300 - SURFACE
      ?auto_561297 - SURFACE
      ?auto_561301 - SURFACE
      ?auto_561303 - SURFACE
      ?auto_561302 - SURFACE
      ?auto_561304 - SURFACE
    )
    :vars
    (
      ?auto_561305 - HOIST
      ?auto_561306 - PLACE
      ?auto_561309 - PLACE
      ?auto_561307 - HOIST
      ?auto_561310 - SURFACE
      ?auto_561308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_561305 ?auto_561306 ) ( IS-CRATE ?auto_561304 ) ( not ( = ?auto_561302 ?auto_561304 ) ) ( not ( = ?auto_561303 ?auto_561302 ) ) ( not ( = ?auto_561303 ?auto_561304 ) ) ( not ( = ?auto_561309 ?auto_561306 ) ) ( HOIST-AT ?auto_561307 ?auto_561309 ) ( not ( = ?auto_561305 ?auto_561307 ) ) ( AVAILABLE ?auto_561307 ) ( SURFACE-AT ?auto_561304 ?auto_561309 ) ( ON ?auto_561304 ?auto_561310 ) ( CLEAR ?auto_561304 ) ( not ( = ?auto_561302 ?auto_561310 ) ) ( not ( = ?auto_561304 ?auto_561310 ) ) ( not ( = ?auto_561303 ?auto_561310 ) ) ( TRUCK-AT ?auto_561308 ?auto_561306 ) ( SURFACE-AT ?auto_561303 ?auto_561306 ) ( CLEAR ?auto_561303 ) ( IS-CRATE ?auto_561302 ) ( AVAILABLE ?auto_561305 ) ( IN ?auto_561302 ?auto_561308 ) ( ON ?auto_561299 ?auto_561298 ) ( ON ?auto_561300 ?auto_561299 ) ( ON ?auto_561297 ?auto_561300 ) ( ON ?auto_561301 ?auto_561297 ) ( ON ?auto_561303 ?auto_561301 ) ( not ( = ?auto_561298 ?auto_561299 ) ) ( not ( = ?auto_561298 ?auto_561300 ) ) ( not ( = ?auto_561298 ?auto_561297 ) ) ( not ( = ?auto_561298 ?auto_561301 ) ) ( not ( = ?auto_561298 ?auto_561303 ) ) ( not ( = ?auto_561298 ?auto_561302 ) ) ( not ( = ?auto_561298 ?auto_561304 ) ) ( not ( = ?auto_561298 ?auto_561310 ) ) ( not ( = ?auto_561299 ?auto_561300 ) ) ( not ( = ?auto_561299 ?auto_561297 ) ) ( not ( = ?auto_561299 ?auto_561301 ) ) ( not ( = ?auto_561299 ?auto_561303 ) ) ( not ( = ?auto_561299 ?auto_561302 ) ) ( not ( = ?auto_561299 ?auto_561304 ) ) ( not ( = ?auto_561299 ?auto_561310 ) ) ( not ( = ?auto_561300 ?auto_561297 ) ) ( not ( = ?auto_561300 ?auto_561301 ) ) ( not ( = ?auto_561300 ?auto_561303 ) ) ( not ( = ?auto_561300 ?auto_561302 ) ) ( not ( = ?auto_561300 ?auto_561304 ) ) ( not ( = ?auto_561300 ?auto_561310 ) ) ( not ( = ?auto_561297 ?auto_561301 ) ) ( not ( = ?auto_561297 ?auto_561303 ) ) ( not ( = ?auto_561297 ?auto_561302 ) ) ( not ( = ?auto_561297 ?auto_561304 ) ) ( not ( = ?auto_561297 ?auto_561310 ) ) ( not ( = ?auto_561301 ?auto_561303 ) ) ( not ( = ?auto_561301 ?auto_561302 ) ) ( not ( = ?auto_561301 ?auto_561304 ) ) ( not ( = ?auto_561301 ?auto_561310 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_561303 ?auto_561302 ?auto_561304 )
      ( MAKE-7CRATE-VERIFY ?auto_561298 ?auto_561299 ?auto_561300 ?auto_561297 ?auto_561301 ?auto_561303 ?auto_561302 ?auto_561304 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_564203 - SURFACE
      ?auto_564204 - SURFACE
      ?auto_564205 - SURFACE
      ?auto_564202 - SURFACE
      ?auto_564206 - SURFACE
      ?auto_564208 - SURFACE
      ?auto_564207 - SURFACE
      ?auto_564209 - SURFACE
      ?auto_564210 - SURFACE
    )
    :vars
    (
      ?auto_564212 - HOIST
      ?auto_564211 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_564212 ?auto_564211 ) ( SURFACE-AT ?auto_564209 ?auto_564211 ) ( CLEAR ?auto_564209 ) ( LIFTING ?auto_564212 ?auto_564210 ) ( IS-CRATE ?auto_564210 ) ( not ( = ?auto_564209 ?auto_564210 ) ) ( ON ?auto_564204 ?auto_564203 ) ( ON ?auto_564205 ?auto_564204 ) ( ON ?auto_564202 ?auto_564205 ) ( ON ?auto_564206 ?auto_564202 ) ( ON ?auto_564208 ?auto_564206 ) ( ON ?auto_564207 ?auto_564208 ) ( ON ?auto_564209 ?auto_564207 ) ( not ( = ?auto_564203 ?auto_564204 ) ) ( not ( = ?auto_564203 ?auto_564205 ) ) ( not ( = ?auto_564203 ?auto_564202 ) ) ( not ( = ?auto_564203 ?auto_564206 ) ) ( not ( = ?auto_564203 ?auto_564208 ) ) ( not ( = ?auto_564203 ?auto_564207 ) ) ( not ( = ?auto_564203 ?auto_564209 ) ) ( not ( = ?auto_564203 ?auto_564210 ) ) ( not ( = ?auto_564204 ?auto_564205 ) ) ( not ( = ?auto_564204 ?auto_564202 ) ) ( not ( = ?auto_564204 ?auto_564206 ) ) ( not ( = ?auto_564204 ?auto_564208 ) ) ( not ( = ?auto_564204 ?auto_564207 ) ) ( not ( = ?auto_564204 ?auto_564209 ) ) ( not ( = ?auto_564204 ?auto_564210 ) ) ( not ( = ?auto_564205 ?auto_564202 ) ) ( not ( = ?auto_564205 ?auto_564206 ) ) ( not ( = ?auto_564205 ?auto_564208 ) ) ( not ( = ?auto_564205 ?auto_564207 ) ) ( not ( = ?auto_564205 ?auto_564209 ) ) ( not ( = ?auto_564205 ?auto_564210 ) ) ( not ( = ?auto_564202 ?auto_564206 ) ) ( not ( = ?auto_564202 ?auto_564208 ) ) ( not ( = ?auto_564202 ?auto_564207 ) ) ( not ( = ?auto_564202 ?auto_564209 ) ) ( not ( = ?auto_564202 ?auto_564210 ) ) ( not ( = ?auto_564206 ?auto_564208 ) ) ( not ( = ?auto_564206 ?auto_564207 ) ) ( not ( = ?auto_564206 ?auto_564209 ) ) ( not ( = ?auto_564206 ?auto_564210 ) ) ( not ( = ?auto_564208 ?auto_564207 ) ) ( not ( = ?auto_564208 ?auto_564209 ) ) ( not ( = ?auto_564208 ?auto_564210 ) ) ( not ( = ?auto_564207 ?auto_564209 ) ) ( not ( = ?auto_564207 ?auto_564210 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_564209 ?auto_564210 )
      ( MAKE-8CRATE-VERIFY ?auto_564203 ?auto_564204 ?auto_564205 ?auto_564202 ?auto_564206 ?auto_564208 ?auto_564207 ?auto_564209 ?auto_564210 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_564270 - SURFACE
      ?auto_564271 - SURFACE
      ?auto_564272 - SURFACE
      ?auto_564269 - SURFACE
      ?auto_564273 - SURFACE
      ?auto_564275 - SURFACE
      ?auto_564274 - SURFACE
      ?auto_564276 - SURFACE
      ?auto_564277 - SURFACE
    )
    :vars
    (
      ?auto_564279 - HOIST
      ?auto_564280 - PLACE
      ?auto_564278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_564279 ?auto_564280 ) ( SURFACE-AT ?auto_564276 ?auto_564280 ) ( CLEAR ?auto_564276 ) ( IS-CRATE ?auto_564277 ) ( not ( = ?auto_564276 ?auto_564277 ) ) ( TRUCK-AT ?auto_564278 ?auto_564280 ) ( AVAILABLE ?auto_564279 ) ( IN ?auto_564277 ?auto_564278 ) ( ON ?auto_564276 ?auto_564274 ) ( not ( = ?auto_564274 ?auto_564276 ) ) ( not ( = ?auto_564274 ?auto_564277 ) ) ( ON ?auto_564271 ?auto_564270 ) ( ON ?auto_564272 ?auto_564271 ) ( ON ?auto_564269 ?auto_564272 ) ( ON ?auto_564273 ?auto_564269 ) ( ON ?auto_564275 ?auto_564273 ) ( ON ?auto_564274 ?auto_564275 ) ( not ( = ?auto_564270 ?auto_564271 ) ) ( not ( = ?auto_564270 ?auto_564272 ) ) ( not ( = ?auto_564270 ?auto_564269 ) ) ( not ( = ?auto_564270 ?auto_564273 ) ) ( not ( = ?auto_564270 ?auto_564275 ) ) ( not ( = ?auto_564270 ?auto_564274 ) ) ( not ( = ?auto_564270 ?auto_564276 ) ) ( not ( = ?auto_564270 ?auto_564277 ) ) ( not ( = ?auto_564271 ?auto_564272 ) ) ( not ( = ?auto_564271 ?auto_564269 ) ) ( not ( = ?auto_564271 ?auto_564273 ) ) ( not ( = ?auto_564271 ?auto_564275 ) ) ( not ( = ?auto_564271 ?auto_564274 ) ) ( not ( = ?auto_564271 ?auto_564276 ) ) ( not ( = ?auto_564271 ?auto_564277 ) ) ( not ( = ?auto_564272 ?auto_564269 ) ) ( not ( = ?auto_564272 ?auto_564273 ) ) ( not ( = ?auto_564272 ?auto_564275 ) ) ( not ( = ?auto_564272 ?auto_564274 ) ) ( not ( = ?auto_564272 ?auto_564276 ) ) ( not ( = ?auto_564272 ?auto_564277 ) ) ( not ( = ?auto_564269 ?auto_564273 ) ) ( not ( = ?auto_564269 ?auto_564275 ) ) ( not ( = ?auto_564269 ?auto_564274 ) ) ( not ( = ?auto_564269 ?auto_564276 ) ) ( not ( = ?auto_564269 ?auto_564277 ) ) ( not ( = ?auto_564273 ?auto_564275 ) ) ( not ( = ?auto_564273 ?auto_564274 ) ) ( not ( = ?auto_564273 ?auto_564276 ) ) ( not ( = ?auto_564273 ?auto_564277 ) ) ( not ( = ?auto_564275 ?auto_564274 ) ) ( not ( = ?auto_564275 ?auto_564276 ) ) ( not ( = ?auto_564275 ?auto_564277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_564274 ?auto_564276 ?auto_564277 )
      ( MAKE-8CRATE-VERIFY ?auto_564270 ?auto_564271 ?auto_564272 ?auto_564269 ?auto_564273 ?auto_564275 ?auto_564274 ?auto_564276 ?auto_564277 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_564346 - SURFACE
      ?auto_564347 - SURFACE
      ?auto_564348 - SURFACE
      ?auto_564345 - SURFACE
      ?auto_564349 - SURFACE
      ?auto_564351 - SURFACE
      ?auto_564350 - SURFACE
      ?auto_564352 - SURFACE
      ?auto_564353 - SURFACE
    )
    :vars
    (
      ?auto_564354 - HOIST
      ?auto_564355 - PLACE
      ?auto_564356 - TRUCK
      ?auto_564357 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_564354 ?auto_564355 ) ( SURFACE-AT ?auto_564352 ?auto_564355 ) ( CLEAR ?auto_564352 ) ( IS-CRATE ?auto_564353 ) ( not ( = ?auto_564352 ?auto_564353 ) ) ( AVAILABLE ?auto_564354 ) ( IN ?auto_564353 ?auto_564356 ) ( ON ?auto_564352 ?auto_564350 ) ( not ( = ?auto_564350 ?auto_564352 ) ) ( not ( = ?auto_564350 ?auto_564353 ) ) ( TRUCK-AT ?auto_564356 ?auto_564357 ) ( not ( = ?auto_564357 ?auto_564355 ) ) ( ON ?auto_564347 ?auto_564346 ) ( ON ?auto_564348 ?auto_564347 ) ( ON ?auto_564345 ?auto_564348 ) ( ON ?auto_564349 ?auto_564345 ) ( ON ?auto_564351 ?auto_564349 ) ( ON ?auto_564350 ?auto_564351 ) ( not ( = ?auto_564346 ?auto_564347 ) ) ( not ( = ?auto_564346 ?auto_564348 ) ) ( not ( = ?auto_564346 ?auto_564345 ) ) ( not ( = ?auto_564346 ?auto_564349 ) ) ( not ( = ?auto_564346 ?auto_564351 ) ) ( not ( = ?auto_564346 ?auto_564350 ) ) ( not ( = ?auto_564346 ?auto_564352 ) ) ( not ( = ?auto_564346 ?auto_564353 ) ) ( not ( = ?auto_564347 ?auto_564348 ) ) ( not ( = ?auto_564347 ?auto_564345 ) ) ( not ( = ?auto_564347 ?auto_564349 ) ) ( not ( = ?auto_564347 ?auto_564351 ) ) ( not ( = ?auto_564347 ?auto_564350 ) ) ( not ( = ?auto_564347 ?auto_564352 ) ) ( not ( = ?auto_564347 ?auto_564353 ) ) ( not ( = ?auto_564348 ?auto_564345 ) ) ( not ( = ?auto_564348 ?auto_564349 ) ) ( not ( = ?auto_564348 ?auto_564351 ) ) ( not ( = ?auto_564348 ?auto_564350 ) ) ( not ( = ?auto_564348 ?auto_564352 ) ) ( not ( = ?auto_564348 ?auto_564353 ) ) ( not ( = ?auto_564345 ?auto_564349 ) ) ( not ( = ?auto_564345 ?auto_564351 ) ) ( not ( = ?auto_564345 ?auto_564350 ) ) ( not ( = ?auto_564345 ?auto_564352 ) ) ( not ( = ?auto_564345 ?auto_564353 ) ) ( not ( = ?auto_564349 ?auto_564351 ) ) ( not ( = ?auto_564349 ?auto_564350 ) ) ( not ( = ?auto_564349 ?auto_564352 ) ) ( not ( = ?auto_564349 ?auto_564353 ) ) ( not ( = ?auto_564351 ?auto_564350 ) ) ( not ( = ?auto_564351 ?auto_564352 ) ) ( not ( = ?auto_564351 ?auto_564353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_564350 ?auto_564352 ?auto_564353 )
      ( MAKE-8CRATE-VERIFY ?auto_564346 ?auto_564347 ?auto_564348 ?auto_564345 ?auto_564349 ?auto_564351 ?auto_564350 ?auto_564352 ?auto_564353 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_564430 - SURFACE
      ?auto_564431 - SURFACE
      ?auto_564432 - SURFACE
      ?auto_564429 - SURFACE
      ?auto_564433 - SURFACE
      ?auto_564435 - SURFACE
      ?auto_564434 - SURFACE
      ?auto_564436 - SURFACE
      ?auto_564437 - SURFACE
    )
    :vars
    (
      ?auto_564438 - HOIST
      ?auto_564439 - PLACE
      ?auto_564442 - TRUCK
      ?auto_564440 - PLACE
      ?auto_564441 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_564438 ?auto_564439 ) ( SURFACE-AT ?auto_564436 ?auto_564439 ) ( CLEAR ?auto_564436 ) ( IS-CRATE ?auto_564437 ) ( not ( = ?auto_564436 ?auto_564437 ) ) ( AVAILABLE ?auto_564438 ) ( ON ?auto_564436 ?auto_564434 ) ( not ( = ?auto_564434 ?auto_564436 ) ) ( not ( = ?auto_564434 ?auto_564437 ) ) ( TRUCK-AT ?auto_564442 ?auto_564440 ) ( not ( = ?auto_564440 ?auto_564439 ) ) ( HOIST-AT ?auto_564441 ?auto_564440 ) ( LIFTING ?auto_564441 ?auto_564437 ) ( not ( = ?auto_564438 ?auto_564441 ) ) ( ON ?auto_564431 ?auto_564430 ) ( ON ?auto_564432 ?auto_564431 ) ( ON ?auto_564429 ?auto_564432 ) ( ON ?auto_564433 ?auto_564429 ) ( ON ?auto_564435 ?auto_564433 ) ( ON ?auto_564434 ?auto_564435 ) ( not ( = ?auto_564430 ?auto_564431 ) ) ( not ( = ?auto_564430 ?auto_564432 ) ) ( not ( = ?auto_564430 ?auto_564429 ) ) ( not ( = ?auto_564430 ?auto_564433 ) ) ( not ( = ?auto_564430 ?auto_564435 ) ) ( not ( = ?auto_564430 ?auto_564434 ) ) ( not ( = ?auto_564430 ?auto_564436 ) ) ( not ( = ?auto_564430 ?auto_564437 ) ) ( not ( = ?auto_564431 ?auto_564432 ) ) ( not ( = ?auto_564431 ?auto_564429 ) ) ( not ( = ?auto_564431 ?auto_564433 ) ) ( not ( = ?auto_564431 ?auto_564435 ) ) ( not ( = ?auto_564431 ?auto_564434 ) ) ( not ( = ?auto_564431 ?auto_564436 ) ) ( not ( = ?auto_564431 ?auto_564437 ) ) ( not ( = ?auto_564432 ?auto_564429 ) ) ( not ( = ?auto_564432 ?auto_564433 ) ) ( not ( = ?auto_564432 ?auto_564435 ) ) ( not ( = ?auto_564432 ?auto_564434 ) ) ( not ( = ?auto_564432 ?auto_564436 ) ) ( not ( = ?auto_564432 ?auto_564437 ) ) ( not ( = ?auto_564429 ?auto_564433 ) ) ( not ( = ?auto_564429 ?auto_564435 ) ) ( not ( = ?auto_564429 ?auto_564434 ) ) ( not ( = ?auto_564429 ?auto_564436 ) ) ( not ( = ?auto_564429 ?auto_564437 ) ) ( not ( = ?auto_564433 ?auto_564435 ) ) ( not ( = ?auto_564433 ?auto_564434 ) ) ( not ( = ?auto_564433 ?auto_564436 ) ) ( not ( = ?auto_564433 ?auto_564437 ) ) ( not ( = ?auto_564435 ?auto_564434 ) ) ( not ( = ?auto_564435 ?auto_564436 ) ) ( not ( = ?auto_564435 ?auto_564437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_564434 ?auto_564436 ?auto_564437 )
      ( MAKE-8CRATE-VERIFY ?auto_564430 ?auto_564431 ?auto_564432 ?auto_564429 ?auto_564433 ?auto_564435 ?auto_564434 ?auto_564436 ?auto_564437 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_564522 - SURFACE
      ?auto_564523 - SURFACE
      ?auto_564524 - SURFACE
      ?auto_564521 - SURFACE
      ?auto_564525 - SURFACE
      ?auto_564527 - SURFACE
      ?auto_564526 - SURFACE
      ?auto_564528 - SURFACE
      ?auto_564529 - SURFACE
    )
    :vars
    (
      ?auto_564533 - HOIST
      ?auto_564531 - PLACE
      ?auto_564532 - TRUCK
      ?auto_564534 - PLACE
      ?auto_564535 - HOIST
      ?auto_564530 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_564533 ?auto_564531 ) ( SURFACE-AT ?auto_564528 ?auto_564531 ) ( CLEAR ?auto_564528 ) ( IS-CRATE ?auto_564529 ) ( not ( = ?auto_564528 ?auto_564529 ) ) ( AVAILABLE ?auto_564533 ) ( ON ?auto_564528 ?auto_564526 ) ( not ( = ?auto_564526 ?auto_564528 ) ) ( not ( = ?auto_564526 ?auto_564529 ) ) ( TRUCK-AT ?auto_564532 ?auto_564534 ) ( not ( = ?auto_564534 ?auto_564531 ) ) ( HOIST-AT ?auto_564535 ?auto_564534 ) ( not ( = ?auto_564533 ?auto_564535 ) ) ( AVAILABLE ?auto_564535 ) ( SURFACE-AT ?auto_564529 ?auto_564534 ) ( ON ?auto_564529 ?auto_564530 ) ( CLEAR ?auto_564529 ) ( not ( = ?auto_564528 ?auto_564530 ) ) ( not ( = ?auto_564529 ?auto_564530 ) ) ( not ( = ?auto_564526 ?auto_564530 ) ) ( ON ?auto_564523 ?auto_564522 ) ( ON ?auto_564524 ?auto_564523 ) ( ON ?auto_564521 ?auto_564524 ) ( ON ?auto_564525 ?auto_564521 ) ( ON ?auto_564527 ?auto_564525 ) ( ON ?auto_564526 ?auto_564527 ) ( not ( = ?auto_564522 ?auto_564523 ) ) ( not ( = ?auto_564522 ?auto_564524 ) ) ( not ( = ?auto_564522 ?auto_564521 ) ) ( not ( = ?auto_564522 ?auto_564525 ) ) ( not ( = ?auto_564522 ?auto_564527 ) ) ( not ( = ?auto_564522 ?auto_564526 ) ) ( not ( = ?auto_564522 ?auto_564528 ) ) ( not ( = ?auto_564522 ?auto_564529 ) ) ( not ( = ?auto_564522 ?auto_564530 ) ) ( not ( = ?auto_564523 ?auto_564524 ) ) ( not ( = ?auto_564523 ?auto_564521 ) ) ( not ( = ?auto_564523 ?auto_564525 ) ) ( not ( = ?auto_564523 ?auto_564527 ) ) ( not ( = ?auto_564523 ?auto_564526 ) ) ( not ( = ?auto_564523 ?auto_564528 ) ) ( not ( = ?auto_564523 ?auto_564529 ) ) ( not ( = ?auto_564523 ?auto_564530 ) ) ( not ( = ?auto_564524 ?auto_564521 ) ) ( not ( = ?auto_564524 ?auto_564525 ) ) ( not ( = ?auto_564524 ?auto_564527 ) ) ( not ( = ?auto_564524 ?auto_564526 ) ) ( not ( = ?auto_564524 ?auto_564528 ) ) ( not ( = ?auto_564524 ?auto_564529 ) ) ( not ( = ?auto_564524 ?auto_564530 ) ) ( not ( = ?auto_564521 ?auto_564525 ) ) ( not ( = ?auto_564521 ?auto_564527 ) ) ( not ( = ?auto_564521 ?auto_564526 ) ) ( not ( = ?auto_564521 ?auto_564528 ) ) ( not ( = ?auto_564521 ?auto_564529 ) ) ( not ( = ?auto_564521 ?auto_564530 ) ) ( not ( = ?auto_564525 ?auto_564527 ) ) ( not ( = ?auto_564525 ?auto_564526 ) ) ( not ( = ?auto_564525 ?auto_564528 ) ) ( not ( = ?auto_564525 ?auto_564529 ) ) ( not ( = ?auto_564525 ?auto_564530 ) ) ( not ( = ?auto_564527 ?auto_564526 ) ) ( not ( = ?auto_564527 ?auto_564528 ) ) ( not ( = ?auto_564527 ?auto_564529 ) ) ( not ( = ?auto_564527 ?auto_564530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_564526 ?auto_564528 ?auto_564529 )
      ( MAKE-8CRATE-VERIFY ?auto_564522 ?auto_564523 ?auto_564524 ?auto_564521 ?auto_564525 ?auto_564527 ?auto_564526 ?auto_564528 ?auto_564529 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_564615 - SURFACE
      ?auto_564616 - SURFACE
      ?auto_564617 - SURFACE
      ?auto_564614 - SURFACE
      ?auto_564618 - SURFACE
      ?auto_564620 - SURFACE
      ?auto_564619 - SURFACE
      ?auto_564621 - SURFACE
      ?auto_564622 - SURFACE
    )
    :vars
    (
      ?auto_564625 - HOIST
      ?auto_564623 - PLACE
      ?auto_564626 - PLACE
      ?auto_564627 - HOIST
      ?auto_564624 - SURFACE
      ?auto_564628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_564625 ?auto_564623 ) ( SURFACE-AT ?auto_564621 ?auto_564623 ) ( CLEAR ?auto_564621 ) ( IS-CRATE ?auto_564622 ) ( not ( = ?auto_564621 ?auto_564622 ) ) ( AVAILABLE ?auto_564625 ) ( ON ?auto_564621 ?auto_564619 ) ( not ( = ?auto_564619 ?auto_564621 ) ) ( not ( = ?auto_564619 ?auto_564622 ) ) ( not ( = ?auto_564626 ?auto_564623 ) ) ( HOIST-AT ?auto_564627 ?auto_564626 ) ( not ( = ?auto_564625 ?auto_564627 ) ) ( AVAILABLE ?auto_564627 ) ( SURFACE-AT ?auto_564622 ?auto_564626 ) ( ON ?auto_564622 ?auto_564624 ) ( CLEAR ?auto_564622 ) ( not ( = ?auto_564621 ?auto_564624 ) ) ( not ( = ?auto_564622 ?auto_564624 ) ) ( not ( = ?auto_564619 ?auto_564624 ) ) ( TRUCK-AT ?auto_564628 ?auto_564623 ) ( ON ?auto_564616 ?auto_564615 ) ( ON ?auto_564617 ?auto_564616 ) ( ON ?auto_564614 ?auto_564617 ) ( ON ?auto_564618 ?auto_564614 ) ( ON ?auto_564620 ?auto_564618 ) ( ON ?auto_564619 ?auto_564620 ) ( not ( = ?auto_564615 ?auto_564616 ) ) ( not ( = ?auto_564615 ?auto_564617 ) ) ( not ( = ?auto_564615 ?auto_564614 ) ) ( not ( = ?auto_564615 ?auto_564618 ) ) ( not ( = ?auto_564615 ?auto_564620 ) ) ( not ( = ?auto_564615 ?auto_564619 ) ) ( not ( = ?auto_564615 ?auto_564621 ) ) ( not ( = ?auto_564615 ?auto_564622 ) ) ( not ( = ?auto_564615 ?auto_564624 ) ) ( not ( = ?auto_564616 ?auto_564617 ) ) ( not ( = ?auto_564616 ?auto_564614 ) ) ( not ( = ?auto_564616 ?auto_564618 ) ) ( not ( = ?auto_564616 ?auto_564620 ) ) ( not ( = ?auto_564616 ?auto_564619 ) ) ( not ( = ?auto_564616 ?auto_564621 ) ) ( not ( = ?auto_564616 ?auto_564622 ) ) ( not ( = ?auto_564616 ?auto_564624 ) ) ( not ( = ?auto_564617 ?auto_564614 ) ) ( not ( = ?auto_564617 ?auto_564618 ) ) ( not ( = ?auto_564617 ?auto_564620 ) ) ( not ( = ?auto_564617 ?auto_564619 ) ) ( not ( = ?auto_564617 ?auto_564621 ) ) ( not ( = ?auto_564617 ?auto_564622 ) ) ( not ( = ?auto_564617 ?auto_564624 ) ) ( not ( = ?auto_564614 ?auto_564618 ) ) ( not ( = ?auto_564614 ?auto_564620 ) ) ( not ( = ?auto_564614 ?auto_564619 ) ) ( not ( = ?auto_564614 ?auto_564621 ) ) ( not ( = ?auto_564614 ?auto_564622 ) ) ( not ( = ?auto_564614 ?auto_564624 ) ) ( not ( = ?auto_564618 ?auto_564620 ) ) ( not ( = ?auto_564618 ?auto_564619 ) ) ( not ( = ?auto_564618 ?auto_564621 ) ) ( not ( = ?auto_564618 ?auto_564622 ) ) ( not ( = ?auto_564618 ?auto_564624 ) ) ( not ( = ?auto_564620 ?auto_564619 ) ) ( not ( = ?auto_564620 ?auto_564621 ) ) ( not ( = ?auto_564620 ?auto_564622 ) ) ( not ( = ?auto_564620 ?auto_564624 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_564619 ?auto_564621 ?auto_564622 )
      ( MAKE-8CRATE-VERIFY ?auto_564615 ?auto_564616 ?auto_564617 ?auto_564614 ?auto_564618 ?auto_564620 ?auto_564619 ?auto_564621 ?auto_564622 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_564708 - SURFACE
      ?auto_564709 - SURFACE
      ?auto_564710 - SURFACE
      ?auto_564707 - SURFACE
      ?auto_564711 - SURFACE
      ?auto_564713 - SURFACE
      ?auto_564712 - SURFACE
      ?auto_564714 - SURFACE
      ?auto_564715 - SURFACE
    )
    :vars
    (
      ?auto_564719 - HOIST
      ?auto_564717 - PLACE
      ?auto_564718 - PLACE
      ?auto_564720 - HOIST
      ?auto_564721 - SURFACE
      ?auto_564716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_564719 ?auto_564717 ) ( IS-CRATE ?auto_564715 ) ( not ( = ?auto_564714 ?auto_564715 ) ) ( not ( = ?auto_564712 ?auto_564714 ) ) ( not ( = ?auto_564712 ?auto_564715 ) ) ( not ( = ?auto_564718 ?auto_564717 ) ) ( HOIST-AT ?auto_564720 ?auto_564718 ) ( not ( = ?auto_564719 ?auto_564720 ) ) ( AVAILABLE ?auto_564720 ) ( SURFACE-AT ?auto_564715 ?auto_564718 ) ( ON ?auto_564715 ?auto_564721 ) ( CLEAR ?auto_564715 ) ( not ( = ?auto_564714 ?auto_564721 ) ) ( not ( = ?auto_564715 ?auto_564721 ) ) ( not ( = ?auto_564712 ?auto_564721 ) ) ( TRUCK-AT ?auto_564716 ?auto_564717 ) ( SURFACE-AT ?auto_564712 ?auto_564717 ) ( CLEAR ?auto_564712 ) ( LIFTING ?auto_564719 ?auto_564714 ) ( IS-CRATE ?auto_564714 ) ( ON ?auto_564709 ?auto_564708 ) ( ON ?auto_564710 ?auto_564709 ) ( ON ?auto_564707 ?auto_564710 ) ( ON ?auto_564711 ?auto_564707 ) ( ON ?auto_564713 ?auto_564711 ) ( ON ?auto_564712 ?auto_564713 ) ( not ( = ?auto_564708 ?auto_564709 ) ) ( not ( = ?auto_564708 ?auto_564710 ) ) ( not ( = ?auto_564708 ?auto_564707 ) ) ( not ( = ?auto_564708 ?auto_564711 ) ) ( not ( = ?auto_564708 ?auto_564713 ) ) ( not ( = ?auto_564708 ?auto_564712 ) ) ( not ( = ?auto_564708 ?auto_564714 ) ) ( not ( = ?auto_564708 ?auto_564715 ) ) ( not ( = ?auto_564708 ?auto_564721 ) ) ( not ( = ?auto_564709 ?auto_564710 ) ) ( not ( = ?auto_564709 ?auto_564707 ) ) ( not ( = ?auto_564709 ?auto_564711 ) ) ( not ( = ?auto_564709 ?auto_564713 ) ) ( not ( = ?auto_564709 ?auto_564712 ) ) ( not ( = ?auto_564709 ?auto_564714 ) ) ( not ( = ?auto_564709 ?auto_564715 ) ) ( not ( = ?auto_564709 ?auto_564721 ) ) ( not ( = ?auto_564710 ?auto_564707 ) ) ( not ( = ?auto_564710 ?auto_564711 ) ) ( not ( = ?auto_564710 ?auto_564713 ) ) ( not ( = ?auto_564710 ?auto_564712 ) ) ( not ( = ?auto_564710 ?auto_564714 ) ) ( not ( = ?auto_564710 ?auto_564715 ) ) ( not ( = ?auto_564710 ?auto_564721 ) ) ( not ( = ?auto_564707 ?auto_564711 ) ) ( not ( = ?auto_564707 ?auto_564713 ) ) ( not ( = ?auto_564707 ?auto_564712 ) ) ( not ( = ?auto_564707 ?auto_564714 ) ) ( not ( = ?auto_564707 ?auto_564715 ) ) ( not ( = ?auto_564707 ?auto_564721 ) ) ( not ( = ?auto_564711 ?auto_564713 ) ) ( not ( = ?auto_564711 ?auto_564712 ) ) ( not ( = ?auto_564711 ?auto_564714 ) ) ( not ( = ?auto_564711 ?auto_564715 ) ) ( not ( = ?auto_564711 ?auto_564721 ) ) ( not ( = ?auto_564713 ?auto_564712 ) ) ( not ( = ?auto_564713 ?auto_564714 ) ) ( not ( = ?auto_564713 ?auto_564715 ) ) ( not ( = ?auto_564713 ?auto_564721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_564712 ?auto_564714 ?auto_564715 )
      ( MAKE-8CRATE-VERIFY ?auto_564708 ?auto_564709 ?auto_564710 ?auto_564707 ?auto_564711 ?auto_564713 ?auto_564712 ?auto_564714 ?auto_564715 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_564801 - SURFACE
      ?auto_564802 - SURFACE
      ?auto_564803 - SURFACE
      ?auto_564800 - SURFACE
      ?auto_564804 - SURFACE
      ?auto_564806 - SURFACE
      ?auto_564805 - SURFACE
      ?auto_564807 - SURFACE
      ?auto_564808 - SURFACE
    )
    :vars
    (
      ?auto_564809 - HOIST
      ?auto_564813 - PLACE
      ?auto_564811 - PLACE
      ?auto_564814 - HOIST
      ?auto_564812 - SURFACE
      ?auto_564810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_564809 ?auto_564813 ) ( IS-CRATE ?auto_564808 ) ( not ( = ?auto_564807 ?auto_564808 ) ) ( not ( = ?auto_564805 ?auto_564807 ) ) ( not ( = ?auto_564805 ?auto_564808 ) ) ( not ( = ?auto_564811 ?auto_564813 ) ) ( HOIST-AT ?auto_564814 ?auto_564811 ) ( not ( = ?auto_564809 ?auto_564814 ) ) ( AVAILABLE ?auto_564814 ) ( SURFACE-AT ?auto_564808 ?auto_564811 ) ( ON ?auto_564808 ?auto_564812 ) ( CLEAR ?auto_564808 ) ( not ( = ?auto_564807 ?auto_564812 ) ) ( not ( = ?auto_564808 ?auto_564812 ) ) ( not ( = ?auto_564805 ?auto_564812 ) ) ( TRUCK-AT ?auto_564810 ?auto_564813 ) ( SURFACE-AT ?auto_564805 ?auto_564813 ) ( CLEAR ?auto_564805 ) ( IS-CRATE ?auto_564807 ) ( AVAILABLE ?auto_564809 ) ( IN ?auto_564807 ?auto_564810 ) ( ON ?auto_564802 ?auto_564801 ) ( ON ?auto_564803 ?auto_564802 ) ( ON ?auto_564800 ?auto_564803 ) ( ON ?auto_564804 ?auto_564800 ) ( ON ?auto_564806 ?auto_564804 ) ( ON ?auto_564805 ?auto_564806 ) ( not ( = ?auto_564801 ?auto_564802 ) ) ( not ( = ?auto_564801 ?auto_564803 ) ) ( not ( = ?auto_564801 ?auto_564800 ) ) ( not ( = ?auto_564801 ?auto_564804 ) ) ( not ( = ?auto_564801 ?auto_564806 ) ) ( not ( = ?auto_564801 ?auto_564805 ) ) ( not ( = ?auto_564801 ?auto_564807 ) ) ( not ( = ?auto_564801 ?auto_564808 ) ) ( not ( = ?auto_564801 ?auto_564812 ) ) ( not ( = ?auto_564802 ?auto_564803 ) ) ( not ( = ?auto_564802 ?auto_564800 ) ) ( not ( = ?auto_564802 ?auto_564804 ) ) ( not ( = ?auto_564802 ?auto_564806 ) ) ( not ( = ?auto_564802 ?auto_564805 ) ) ( not ( = ?auto_564802 ?auto_564807 ) ) ( not ( = ?auto_564802 ?auto_564808 ) ) ( not ( = ?auto_564802 ?auto_564812 ) ) ( not ( = ?auto_564803 ?auto_564800 ) ) ( not ( = ?auto_564803 ?auto_564804 ) ) ( not ( = ?auto_564803 ?auto_564806 ) ) ( not ( = ?auto_564803 ?auto_564805 ) ) ( not ( = ?auto_564803 ?auto_564807 ) ) ( not ( = ?auto_564803 ?auto_564808 ) ) ( not ( = ?auto_564803 ?auto_564812 ) ) ( not ( = ?auto_564800 ?auto_564804 ) ) ( not ( = ?auto_564800 ?auto_564806 ) ) ( not ( = ?auto_564800 ?auto_564805 ) ) ( not ( = ?auto_564800 ?auto_564807 ) ) ( not ( = ?auto_564800 ?auto_564808 ) ) ( not ( = ?auto_564800 ?auto_564812 ) ) ( not ( = ?auto_564804 ?auto_564806 ) ) ( not ( = ?auto_564804 ?auto_564805 ) ) ( not ( = ?auto_564804 ?auto_564807 ) ) ( not ( = ?auto_564804 ?auto_564808 ) ) ( not ( = ?auto_564804 ?auto_564812 ) ) ( not ( = ?auto_564806 ?auto_564805 ) ) ( not ( = ?auto_564806 ?auto_564807 ) ) ( not ( = ?auto_564806 ?auto_564808 ) ) ( not ( = ?auto_564806 ?auto_564812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_564805 ?auto_564807 ?auto_564808 )
      ( MAKE-8CRATE-VERIFY ?auto_564801 ?auto_564802 ?auto_564803 ?auto_564800 ?auto_564804 ?auto_564806 ?auto_564805 ?auto_564807 ?auto_564808 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568888 - SURFACE
      ?auto_568889 - SURFACE
      ?auto_568890 - SURFACE
      ?auto_568887 - SURFACE
      ?auto_568891 - SURFACE
      ?auto_568893 - SURFACE
      ?auto_568892 - SURFACE
      ?auto_568894 - SURFACE
      ?auto_568895 - SURFACE
      ?auto_568896 - SURFACE
    )
    :vars
    (
      ?auto_568897 - HOIST
      ?auto_568898 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_568897 ?auto_568898 ) ( SURFACE-AT ?auto_568895 ?auto_568898 ) ( CLEAR ?auto_568895 ) ( LIFTING ?auto_568897 ?auto_568896 ) ( IS-CRATE ?auto_568896 ) ( not ( = ?auto_568895 ?auto_568896 ) ) ( ON ?auto_568889 ?auto_568888 ) ( ON ?auto_568890 ?auto_568889 ) ( ON ?auto_568887 ?auto_568890 ) ( ON ?auto_568891 ?auto_568887 ) ( ON ?auto_568893 ?auto_568891 ) ( ON ?auto_568892 ?auto_568893 ) ( ON ?auto_568894 ?auto_568892 ) ( ON ?auto_568895 ?auto_568894 ) ( not ( = ?auto_568888 ?auto_568889 ) ) ( not ( = ?auto_568888 ?auto_568890 ) ) ( not ( = ?auto_568888 ?auto_568887 ) ) ( not ( = ?auto_568888 ?auto_568891 ) ) ( not ( = ?auto_568888 ?auto_568893 ) ) ( not ( = ?auto_568888 ?auto_568892 ) ) ( not ( = ?auto_568888 ?auto_568894 ) ) ( not ( = ?auto_568888 ?auto_568895 ) ) ( not ( = ?auto_568888 ?auto_568896 ) ) ( not ( = ?auto_568889 ?auto_568890 ) ) ( not ( = ?auto_568889 ?auto_568887 ) ) ( not ( = ?auto_568889 ?auto_568891 ) ) ( not ( = ?auto_568889 ?auto_568893 ) ) ( not ( = ?auto_568889 ?auto_568892 ) ) ( not ( = ?auto_568889 ?auto_568894 ) ) ( not ( = ?auto_568889 ?auto_568895 ) ) ( not ( = ?auto_568889 ?auto_568896 ) ) ( not ( = ?auto_568890 ?auto_568887 ) ) ( not ( = ?auto_568890 ?auto_568891 ) ) ( not ( = ?auto_568890 ?auto_568893 ) ) ( not ( = ?auto_568890 ?auto_568892 ) ) ( not ( = ?auto_568890 ?auto_568894 ) ) ( not ( = ?auto_568890 ?auto_568895 ) ) ( not ( = ?auto_568890 ?auto_568896 ) ) ( not ( = ?auto_568887 ?auto_568891 ) ) ( not ( = ?auto_568887 ?auto_568893 ) ) ( not ( = ?auto_568887 ?auto_568892 ) ) ( not ( = ?auto_568887 ?auto_568894 ) ) ( not ( = ?auto_568887 ?auto_568895 ) ) ( not ( = ?auto_568887 ?auto_568896 ) ) ( not ( = ?auto_568891 ?auto_568893 ) ) ( not ( = ?auto_568891 ?auto_568892 ) ) ( not ( = ?auto_568891 ?auto_568894 ) ) ( not ( = ?auto_568891 ?auto_568895 ) ) ( not ( = ?auto_568891 ?auto_568896 ) ) ( not ( = ?auto_568893 ?auto_568892 ) ) ( not ( = ?auto_568893 ?auto_568894 ) ) ( not ( = ?auto_568893 ?auto_568895 ) ) ( not ( = ?auto_568893 ?auto_568896 ) ) ( not ( = ?auto_568892 ?auto_568894 ) ) ( not ( = ?auto_568892 ?auto_568895 ) ) ( not ( = ?auto_568892 ?auto_568896 ) ) ( not ( = ?auto_568894 ?auto_568895 ) ) ( not ( = ?auto_568894 ?auto_568896 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_568895 ?auto_568896 )
      ( MAKE-9CRATE-VERIFY ?auto_568888 ?auto_568889 ?auto_568890 ?auto_568887 ?auto_568891 ?auto_568893 ?auto_568892 ?auto_568894 ?auto_568895 ?auto_568896 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568968 - SURFACE
      ?auto_568969 - SURFACE
      ?auto_568970 - SURFACE
      ?auto_568967 - SURFACE
      ?auto_568971 - SURFACE
      ?auto_568973 - SURFACE
      ?auto_568972 - SURFACE
      ?auto_568974 - SURFACE
      ?auto_568975 - SURFACE
      ?auto_568976 - SURFACE
    )
    :vars
    (
      ?auto_568977 - HOIST
      ?auto_568979 - PLACE
      ?auto_568978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_568977 ?auto_568979 ) ( SURFACE-AT ?auto_568975 ?auto_568979 ) ( CLEAR ?auto_568975 ) ( IS-CRATE ?auto_568976 ) ( not ( = ?auto_568975 ?auto_568976 ) ) ( TRUCK-AT ?auto_568978 ?auto_568979 ) ( AVAILABLE ?auto_568977 ) ( IN ?auto_568976 ?auto_568978 ) ( ON ?auto_568975 ?auto_568974 ) ( not ( = ?auto_568974 ?auto_568975 ) ) ( not ( = ?auto_568974 ?auto_568976 ) ) ( ON ?auto_568969 ?auto_568968 ) ( ON ?auto_568970 ?auto_568969 ) ( ON ?auto_568967 ?auto_568970 ) ( ON ?auto_568971 ?auto_568967 ) ( ON ?auto_568973 ?auto_568971 ) ( ON ?auto_568972 ?auto_568973 ) ( ON ?auto_568974 ?auto_568972 ) ( not ( = ?auto_568968 ?auto_568969 ) ) ( not ( = ?auto_568968 ?auto_568970 ) ) ( not ( = ?auto_568968 ?auto_568967 ) ) ( not ( = ?auto_568968 ?auto_568971 ) ) ( not ( = ?auto_568968 ?auto_568973 ) ) ( not ( = ?auto_568968 ?auto_568972 ) ) ( not ( = ?auto_568968 ?auto_568974 ) ) ( not ( = ?auto_568968 ?auto_568975 ) ) ( not ( = ?auto_568968 ?auto_568976 ) ) ( not ( = ?auto_568969 ?auto_568970 ) ) ( not ( = ?auto_568969 ?auto_568967 ) ) ( not ( = ?auto_568969 ?auto_568971 ) ) ( not ( = ?auto_568969 ?auto_568973 ) ) ( not ( = ?auto_568969 ?auto_568972 ) ) ( not ( = ?auto_568969 ?auto_568974 ) ) ( not ( = ?auto_568969 ?auto_568975 ) ) ( not ( = ?auto_568969 ?auto_568976 ) ) ( not ( = ?auto_568970 ?auto_568967 ) ) ( not ( = ?auto_568970 ?auto_568971 ) ) ( not ( = ?auto_568970 ?auto_568973 ) ) ( not ( = ?auto_568970 ?auto_568972 ) ) ( not ( = ?auto_568970 ?auto_568974 ) ) ( not ( = ?auto_568970 ?auto_568975 ) ) ( not ( = ?auto_568970 ?auto_568976 ) ) ( not ( = ?auto_568967 ?auto_568971 ) ) ( not ( = ?auto_568967 ?auto_568973 ) ) ( not ( = ?auto_568967 ?auto_568972 ) ) ( not ( = ?auto_568967 ?auto_568974 ) ) ( not ( = ?auto_568967 ?auto_568975 ) ) ( not ( = ?auto_568967 ?auto_568976 ) ) ( not ( = ?auto_568971 ?auto_568973 ) ) ( not ( = ?auto_568971 ?auto_568972 ) ) ( not ( = ?auto_568971 ?auto_568974 ) ) ( not ( = ?auto_568971 ?auto_568975 ) ) ( not ( = ?auto_568971 ?auto_568976 ) ) ( not ( = ?auto_568973 ?auto_568972 ) ) ( not ( = ?auto_568973 ?auto_568974 ) ) ( not ( = ?auto_568973 ?auto_568975 ) ) ( not ( = ?auto_568973 ?auto_568976 ) ) ( not ( = ?auto_568972 ?auto_568974 ) ) ( not ( = ?auto_568972 ?auto_568975 ) ) ( not ( = ?auto_568972 ?auto_568976 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_568974 ?auto_568975 ?auto_568976 )
      ( MAKE-9CRATE-VERIFY ?auto_568968 ?auto_568969 ?auto_568970 ?auto_568967 ?auto_568971 ?auto_568973 ?auto_568972 ?auto_568974 ?auto_568975 ?auto_568976 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_569058 - SURFACE
      ?auto_569059 - SURFACE
      ?auto_569060 - SURFACE
      ?auto_569057 - SURFACE
      ?auto_569061 - SURFACE
      ?auto_569063 - SURFACE
      ?auto_569062 - SURFACE
      ?auto_569064 - SURFACE
      ?auto_569065 - SURFACE
      ?auto_569066 - SURFACE
    )
    :vars
    (
      ?auto_569070 - HOIST
      ?auto_569068 - PLACE
      ?auto_569067 - TRUCK
      ?auto_569069 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_569070 ?auto_569068 ) ( SURFACE-AT ?auto_569065 ?auto_569068 ) ( CLEAR ?auto_569065 ) ( IS-CRATE ?auto_569066 ) ( not ( = ?auto_569065 ?auto_569066 ) ) ( AVAILABLE ?auto_569070 ) ( IN ?auto_569066 ?auto_569067 ) ( ON ?auto_569065 ?auto_569064 ) ( not ( = ?auto_569064 ?auto_569065 ) ) ( not ( = ?auto_569064 ?auto_569066 ) ) ( TRUCK-AT ?auto_569067 ?auto_569069 ) ( not ( = ?auto_569069 ?auto_569068 ) ) ( ON ?auto_569059 ?auto_569058 ) ( ON ?auto_569060 ?auto_569059 ) ( ON ?auto_569057 ?auto_569060 ) ( ON ?auto_569061 ?auto_569057 ) ( ON ?auto_569063 ?auto_569061 ) ( ON ?auto_569062 ?auto_569063 ) ( ON ?auto_569064 ?auto_569062 ) ( not ( = ?auto_569058 ?auto_569059 ) ) ( not ( = ?auto_569058 ?auto_569060 ) ) ( not ( = ?auto_569058 ?auto_569057 ) ) ( not ( = ?auto_569058 ?auto_569061 ) ) ( not ( = ?auto_569058 ?auto_569063 ) ) ( not ( = ?auto_569058 ?auto_569062 ) ) ( not ( = ?auto_569058 ?auto_569064 ) ) ( not ( = ?auto_569058 ?auto_569065 ) ) ( not ( = ?auto_569058 ?auto_569066 ) ) ( not ( = ?auto_569059 ?auto_569060 ) ) ( not ( = ?auto_569059 ?auto_569057 ) ) ( not ( = ?auto_569059 ?auto_569061 ) ) ( not ( = ?auto_569059 ?auto_569063 ) ) ( not ( = ?auto_569059 ?auto_569062 ) ) ( not ( = ?auto_569059 ?auto_569064 ) ) ( not ( = ?auto_569059 ?auto_569065 ) ) ( not ( = ?auto_569059 ?auto_569066 ) ) ( not ( = ?auto_569060 ?auto_569057 ) ) ( not ( = ?auto_569060 ?auto_569061 ) ) ( not ( = ?auto_569060 ?auto_569063 ) ) ( not ( = ?auto_569060 ?auto_569062 ) ) ( not ( = ?auto_569060 ?auto_569064 ) ) ( not ( = ?auto_569060 ?auto_569065 ) ) ( not ( = ?auto_569060 ?auto_569066 ) ) ( not ( = ?auto_569057 ?auto_569061 ) ) ( not ( = ?auto_569057 ?auto_569063 ) ) ( not ( = ?auto_569057 ?auto_569062 ) ) ( not ( = ?auto_569057 ?auto_569064 ) ) ( not ( = ?auto_569057 ?auto_569065 ) ) ( not ( = ?auto_569057 ?auto_569066 ) ) ( not ( = ?auto_569061 ?auto_569063 ) ) ( not ( = ?auto_569061 ?auto_569062 ) ) ( not ( = ?auto_569061 ?auto_569064 ) ) ( not ( = ?auto_569061 ?auto_569065 ) ) ( not ( = ?auto_569061 ?auto_569066 ) ) ( not ( = ?auto_569063 ?auto_569062 ) ) ( not ( = ?auto_569063 ?auto_569064 ) ) ( not ( = ?auto_569063 ?auto_569065 ) ) ( not ( = ?auto_569063 ?auto_569066 ) ) ( not ( = ?auto_569062 ?auto_569064 ) ) ( not ( = ?auto_569062 ?auto_569065 ) ) ( not ( = ?auto_569062 ?auto_569066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_569064 ?auto_569065 ?auto_569066 )
      ( MAKE-9CRATE-VERIFY ?auto_569058 ?auto_569059 ?auto_569060 ?auto_569057 ?auto_569061 ?auto_569063 ?auto_569062 ?auto_569064 ?auto_569065 ?auto_569066 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_569157 - SURFACE
      ?auto_569158 - SURFACE
      ?auto_569159 - SURFACE
      ?auto_569156 - SURFACE
      ?auto_569160 - SURFACE
      ?auto_569162 - SURFACE
      ?auto_569161 - SURFACE
      ?auto_569163 - SURFACE
      ?auto_569164 - SURFACE
      ?auto_569165 - SURFACE
    )
    :vars
    (
      ?auto_569167 - HOIST
      ?auto_569170 - PLACE
      ?auto_569168 - TRUCK
      ?auto_569169 - PLACE
      ?auto_569166 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_569167 ?auto_569170 ) ( SURFACE-AT ?auto_569164 ?auto_569170 ) ( CLEAR ?auto_569164 ) ( IS-CRATE ?auto_569165 ) ( not ( = ?auto_569164 ?auto_569165 ) ) ( AVAILABLE ?auto_569167 ) ( ON ?auto_569164 ?auto_569163 ) ( not ( = ?auto_569163 ?auto_569164 ) ) ( not ( = ?auto_569163 ?auto_569165 ) ) ( TRUCK-AT ?auto_569168 ?auto_569169 ) ( not ( = ?auto_569169 ?auto_569170 ) ) ( HOIST-AT ?auto_569166 ?auto_569169 ) ( LIFTING ?auto_569166 ?auto_569165 ) ( not ( = ?auto_569167 ?auto_569166 ) ) ( ON ?auto_569158 ?auto_569157 ) ( ON ?auto_569159 ?auto_569158 ) ( ON ?auto_569156 ?auto_569159 ) ( ON ?auto_569160 ?auto_569156 ) ( ON ?auto_569162 ?auto_569160 ) ( ON ?auto_569161 ?auto_569162 ) ( ON ?auto_569163 ?auto_569161 ) ( not ( = ?auto_569157 ?auto_569158 ) ) ( not ( = ?auto_569157 ?auto_569159 ) ) ( not ( = ?auto_569157 ?auto_569156 ) ) ( not ( = ?auto_569157 ?auto_569160 ) ) ( not ( = ?auto_569157 ?auto_569162 ) ) ( not ( = ?auto_569157 ?auto_569161 ) ) ( not ( = ?auto_569157 ?auto_569163 ) ) ( not ( = ?auto_569157 ?auto_569164 ) ) ( not ( = ?auto_569157 ?auto_569165 ) ) ( not ( = ?auto_569158 ?auto_569159 ) ) ( not ( = ?auto_569158 ?auto_569156 ) ) ( not ( = ?auto_569158 ?auto_569160 ) ) ( not ( = ?auto_569158 ?auto_569162 ) ) ( not ( = ?auto_569158 ?auto_569161 ) ) ( not ( = ?auto_569158 ?auto_569163 ) ) ( not ( = ?auto_569158 ?auto_569164 ) ) ( not ( = ?auto_569158 ?auto_569165 ) ) ( not ( = ?auto_569159 ?auto_569156 ) ) ( not ( = ?auto_569159 ?auto_569160 ) ) ( not ( = ?auto_569159 ?auto_569162 ) ) ( not ( = ?auto_569159 ?auto_569161 ) ) ( not ( = ?auto_569159 ?auto_569163 ) ) ( not ( = ?auto_569159 ?auto_569164 ) ) ( not ( = ?auto_569159 ?auto_569165 ) ) ( not ( = ?auto_569156 ?auto_569160 ) ) ( not ( = ?auto_569156 ?auto_569162 ) ) ( not ( = ?auto_569156 ?auto_569161 ) ) ( not ( = ?auto_569156 ?auto_569163 ) ) ( not ( = ?auto_569156 ?auto_569164 ) ) ( not ( = ?auto_569156 ?auto_569165 ) ) ( not ( = ?auto_569160 ?auto_569162 ) ) ( not ( = ?auto_569160 ?auto_569161 ) ) ( not ( = ?auto_569160 ?auto_569163 ) ) ( not ( = ?auto_569160 ?auto_569164 ) ) ( not ( = ?auto_569160 ?auto_569165 ) ) ( not ( = ?auto_569162 ?auto_569161 ) ) ( not ( = ?auto_569162 ?auto_569163 ) ) ( not ( = ?auto_569162 ?auto_569164 ) ) ( not ( = ?auto_569162 ?auto_569165 ) ) ( not ( = ?auto_569161 ?auto_569163 ) ) ( not ( = ?auto_569161 ?auto_569164 ) ) ( not ( = ?auto_569161 ?auto_569165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_569163 ?auto_569164 ?auto_569165 )
      ( MAKE-9CRATE-VERIFY ?auto_569157 ?auto_569158 ?auto_569159 ?auto_569156 ?auto_569160 ?auto_569162 ?auto_569161 ?auto_569163 ?auto_569164 ?auto_569165 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_569265 - SURFACE
      ?auto_569266 - SURFACE
      ?auto_569267 - SURFACE
      ?auto_569264 - SURFACE
      ?auto_569268 - SURFACE
      ?auto_569270 - SURFACE
      ?auto_569269 - SURFACE
      ?auto_569271 - SURFACE
      ?auto_569272 - SURFACE
      ?auto_569273 - SURFACE
    )
    :vars
    (
      ?auto_569279 - HOIST
      ?auto_569276 - PLACE
      ?auto_569277 - TRUCK
      ?auto_569278 - PLACE
      ?auto_569275 - HOIST
      ?auto_569274 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_569279 ?auto_569276 ) ( SURFACE-AT ?auto_569272 ?auto_569276 ) ( CLEAR ?auto_569272 ) ( IS-CRATE ?auto_569273 ) ( not ( = ?auto_569272 ?auto_569273 ) ) ( AVAILABLE ?auto_569279 ) ( ON ?auto_569272 ?auto_569271 ) ( not ( = ?auto_569271 ?auto_569272 ) ) ( not ( = ?auto_569271 ?auto_569273 ) ) ( TRUCK-AT ?auto_569277 ?auto_569278 ) ( not ( = ?auto_569278 ?auto_569276 ) ) ( HOIST-AT ?auto_569275 ?auto_569278 ) ( not ( = ?auto_569279 ?auto_569275 ) ) ( AVAILABLE ?auto_569275 ) ( SURFACE-AT ?auto_569273 ?auto_569278 ) ( ON ?auto_569273 ?auto_569274 ) ( CLEAR ?auto_569273 ) ( not ( = ?auto_569272 ?auto_569274 ) ) ( not ( = ?auto_569273 ?auto_569274 ) ) ( not ( = ?auto_569271 ?auto_569274 ) ) ( ON ?auto_569266 ?auto_569265 ) ( ON ?auto_569267 ?auto_569266 ) ( ON ?auto_569264 ?auto_569267 ) ( ON ?auto_569268 ?auto_569264 ) ( ON ?auto_569270 ?auto_569268 ) ( ON ?auto_569269 ?auto_569270 ) ( ON ?auto_569271 ?auto_569269 ) ( not ( = ?auto_569265 ?auto_569266 ) ) ( not ( = ?auto_569265 ?auto_569267 ) ) ( not ( = ?auto_569265 ?auto_569264 ) ) ( not ( = ?auto_569265 ?auto_569268 ) ) ( not ( = ?auto_569265 ?auto_569270 ) ) ( not ( = ?auto_569265 ?auto_569269 ) ) ( not ( = ?auto_569265 ?auto_569271 ) ) ( not ( = ?auto_569265 ?auto_569272 ) ) ( not ( = ?auto_569265 ?auto_569273 ) ) ( not ( = ?auto_569265 ?auto_569274 ) ) ( not ( = ?auto_569266 ?auto_569267 ) ) ( not ( = ?auto_569266 ?auto_569264 ) ) ( not ( = ?auto_569266 ?auto_569268 ) ) ( not ( = ?auto_569266 ?auto_569270 ) ) ( not ( = ?auto_569266 ?auto_569269 ) ) ( not ( = ?auto_569266 ?auto_569271 ) ) ( not ( = ?auto_569266 ?auto_569272 ) ) ( not ( = ?auto_569266 ?auto_569273 ) ) ( not ( = ?auto_569266 ?auto_569274 ) ) ( not ( = ?auto_569267 ?auto_569264 ) ) ( not ( = ?auto_569267 ?auto_569268 ) ) ( not ( = ?auto_569267 ?auto_569270 ) ) ( not ( = ?auto_569267 ?auto_569269 ) ) ( not ( = ?auto_569267 ?auto_569271 ) ) ( not ( = ?auto_569267 ?auto_569272 ) ) ( not ( = ?auto_569267 ?auto_569273 ) ) ( not ( = ?auto_569267 ?auto_569274 ) ) ( not ( = ?auto_569264 ?auto_569268 ) ) ( not ( = ?auto_569264 ?auto_569270 ) ) ( not ( = ?auto_569264 ?auto_569269 ) ) ( not ( = ?auto_569264 ?auto_569271 ) ) ( not ( = ?auto_569264 ?auto_569272 ) ) ( not ( = ?auto_569264 ?auto_569273 ) ) ( not ( = ?auto_569264 ?auto_569274 ) ) ( not ( = ?auto_569268 ?auto_569270 ) ) ( not ( = ?auto_569268 ?auto_569269 ) ) ( not ( = ?auto_569268 ?auto_569271 ) ) ( not ( = ?auto_569268 ?auto_569272 ) ) ( not ( = ?auto_569268 ?auto_569273 ) ) ( not ( = ?auto_569268 ?auto_569274 ) ) ( not ( = ?auto_569270 ?auto_569269 ) ) ( not ( = ?auto_569270 ?auto_569271 ) ) ( not ( = ?auto_569270 ?auto_569272 ) ) ( not ( = ?auto_569270 ?auto_569273 ) ) ( not ( = ?auto_569270 ?auto_569274 ) ) ( not ( = ?auto_569269 ?auto_569271 ) ) ( not ( = ?auto_569269 ?auto_569272 ) ) ( not ( = ?auto_569269 ?auto_569273 ) ) ( not ( = ?auto_569269 ?auto_569274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_569271 ?auto_569272 ?auto_569273 )
      ( MAKE-9CRATE-VERIFY ?auto_569265 ?auto_569266 ?auto_569267 ?auto_569264 ?auto_569268 ?auto_569270 ?auto_569269 ?auto_569271 ?auto_569272 ?auto_569273 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_569374 - SURFACE
      ?auto_569375 - SURFACE
      ?auto_569376 - SURFACE
      ?auto_569373 - SURFACE
      ?auto_569377 - SURFACE
      ?auto_569379 - SURFACE
      ?auto_569378 - SURFACE
      ?auto_569380 - SURFACE
      ?auto_569381 - SURFACE
      ?auto_569382 - SURFACE
    )
    :vars
    (
      ?auto_569383 - HOIST
      ?auto_569387 - PLACE
      ?auto_569386 - PLACE
      ?auto_569388 - HOIST
      ?auto_569385 - SURFACE
      ?auto_569384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_569383 ?auto_569387 ) ( SURFACE-AT ?auto_569381 ?auto_569387 ) ( CLEAR ?auto_569381 ) ( IS-CRATE ?auto_569382 ) ( not ( = ?auto_569381 ?auto_569382 ) ) ( AVAILABLE ?auto_569383 ) ( ON ?auto_569381 ?auto_569380 ) ( not ( = ?auto_569380 ?auto_569381 ) ) ( not ( = ?auto_569380 ?auto_569382 ) ) ( not ( = ?auto_569386 ?auto_569387 ) ) ( HOIST-AT ?auto_569388 ?auto_569386 ) ( not ( = ?auto_569383 ?auto_569388 ) ) ( AVAILABLE ?auto_569388 ) ( SURFACE-AT ?auto_569382 ?auto_569386 ) ( ON ?auto_569382 ?auto_569385 ) ( CLEAR ?auto_569382 ) ( not ( = ?auto_569381 ?auto_569385 ) ) ( not ( = ?auto_569382 ?auto_569385 ) ) ( not ( = ?auto_569380 ?auto_569385 ) ) ( TRUCK-AT ?auto_569384 ?auto_569387 ) ( ON ?auto_569375 ?auto_569374 ) ( ON ?auto_569376 ?auto_569375 ) ( ON ?auto_569373 ?auto_569376 ) ( ON ?auto_569377 ?auto_569373 ) ( ON ?auto_569379 ?auto_569377 ) ( ON ?auto_569378 ?auto_569379 ) ( ON ?auto_569380 ?auto_569378 ) ( not ( = ?auto_569374 ?auto_569375 ) ) ( not ( = ?auto_569374 ?auto_569376 ) ) ( not ( = ?auto_569374 ?auto_569373 ) ) ( not ( = ?auto_569374 ?auto_569377 ) ) ( not ( = ?auto_569374 ?auto_569379 ) ) ( not ( = ?auto_569374 ?auto_569378 ) ) ( not ( = ?auto_569374 ?auto_569380 ) ) ( not ( = ?auto_569374 ?auto_569381 ) ) ( not ( = ?auto_569374 ?auto_569382 ) ) ( not ( = ?auto_569374 ?auto_569385 ) ) ( not ( = ?auto_569375 ?auto_569376 ) ) ( not ( = ?auto_569375 ?auto_569373 ) ) ( not ( = ?auto_569375 ?auto_569377 ) ) ( not ( = ?auto_569375 ?auto_569379 ) ) ( not ( = ?auto_569375 ?auto_569378 ) ) ( not ( = ?auto_569375 ?auto_569380 ) ) ( not ( = ?auto_569375 ?auto_569381 ) ) ( not ( = ?auto_569375 ?auto_569382 ) ) ( not ( = ?auto_569375 ?auto_569385 ) ) ( not ( = ?auto_569376 ?auto_569373 ) ) ( not ( = ?auto_569376 ?auto_569377 ) ) ( not ( = ?auto_569376 ?auto_569379 ) ) ( not ( = ?auto_569376 ?auto_569378 ) ) ( not ( = ?auto_569376 ?auto_569380 ) ) ( not ( = ?auto_569376 ?auto_569381 ) ) ( not ( = ?auto_569376 ?auto_569382 ) ) ( not ( = ?auto_569376 ?auto_569385 ) ) ( not ( = ?auto_569373 ?auto_569377 ) ) ( not ( = ?auto_569373 ?auto_569379 ) ) ( not ( = ?auto_569373 ?auto_569378 ) ) ( not ( = ?auto_569373 ?auto_569380 ) ) ( not ( = ?auto_569373 ?auto_569381 ) ) ( not ( = ?auto_569373 ?auto_569382 ) ) ( not ( = ?auto_569373 ?auto_569385 ) ) ( not ( = ?auto_569377 ?auto_569379 ) ) ( not ( = ?auto_569377 ?auto_569378 ) ) ( not ( = ?auto_569377 ?auto_569380 ) ) ( not ( = ?auto_569377 ?auto_569381 ) ) ( not ( = ?auto_569377 ?auto_569382 ) ) ( not ( = ?auto_569377 ?auto_569385 ) ) ( not ( = ?auto_569379 ?auto_569378 ) ) ( not ( = ?auto_569379 ?auto_569380 ) ) ( not ( = ?auto_569379 ?auto_569381 ) ) ( not ( = ?auto_569379 ?auto_569382 ) ) ( not ( = ?auto_569379 ?auto_569385 ) ) ( not ( = ?auto_569378 ?auto_569380 ) ) ( not ( = ?auto_569378 ?auto_569381 ) ) ( not ( = ?auto_569378 ?auto_569382 ) ) ( not ( = ?auto_569378 ?auto_569385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_569380 ?auto_569381 ?auto_569382 )
      ( MAKE-9CRATE-VERIFY ?auto_569374 ?auto_569375 ?auto_569376 ?auto_569373 ?auto_569377 ?auto_569379 ?auto_569378 ?auto_569380 ?auto_569381 ?auto_569382 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_569483 - SURFACE
      ?auto_569484 - SURFACE
      ?auto_569485 - SURFACE
      ?auto_569482 - SURFACE
      ?auto_569486 - SURFACE
      ?auto_569488 - SURFACE
      ?auto_569487 - SURFACE
      ?auto_569489 - SURFACE
      ?auto_569490 - SURFACE
      ?auto_569491 - SURFACE
    )
    :vars
    (
      ?auto_569494 - HOIST
      ?auto_569497 - PLACE
      ?auto_569493 - PLACE
      ?auto_569496 - HOIST
      ?auto_569495 - SURFACE
      ?auto_569492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_569494 ?auto_569497 ) ( IS-CRATE ?auto_569491 ) ( not ( = ?auto_569490 ?auto_569491 ) ) ( not ( = ?auto_569489 ?auto_569490 ) ) ( not ( = ?auto_569489 ?auto_569491 ) ) ( not ( = ?auto_569493 ?auto_569497 ) ) ( HOIST-AT ?auto_569496 ?auto_569493 ) ( not ( = ?auto_569494 ?auto_569496 ) ) ( AVAILABLE ?auto_569496 ) ( SURFACE-AT ?auto_569491 ?auto_569493 ) ( ON ?auto_569491 ?auto_569495 ) ( CLEAR ?auto_569491 ) ( not ( = ?auto_569490 ?auto_569495 ) ) ( not ( = ?auto_569491 ?auto_569495 ) ) ( not ( = ?auto_569489 ?auto_569495 ) ) ( TRUCK-AT ?auto_569492 ?auto_569497 ) ( SURFACE-AT ?auto_569489 ?auto_569497 ) ( CLEAR ?auto_569489 ) ( LIFTING ?auto_569494 ?auto_569490 ) ( IS-CRATE ?auto_569490 ) ( ON ?auto_569484 ?auto_569483 ) ( ON ?auto_569485 ?auto_569484 ) ( ON ?auto_569482 ?auto_569485 ) ( ON ?auto_569486 ?auto_569482 ) ( ON ?auto_569488 ?auto_569486 ) ( ON ?auto_569487 ?auto_569488 ) ( ON ?auto_569489 ?auto_569487 ) ( not ( = ?auto_569483 ?auto_569484 ) ) ( not ( = ?auto_569483 ?auto_569485 ) ) ( not ( = ?auto_569483 ?auto_569482 ) ) ( not ( = ?auto_569483 ?auto_569486 ) ) ( not ( = ?auto_569483 ?auto_569488 ) ) ( not ( = ?auto_569483 ?auto_569487 ) ) ( not ( = ?auto_569483 ?auto_569489 ) ) ( not ( = ?auto_569483 ?auto_569490 ) ) ( not ( = ?auto_569483 ?auto_569491 ) ) ( not ( = ?auto_569483 ?auto_569495 ) ) ( not ( = ?auto_569484 ?auto_569485 ) ) ( not ( = ?auto_569484 ?auto_569482 ) ) ( not ( = ?auto_569484 ?auto_569486 ) ) ( not ( = ?auto_569484 ?auto_569488 ) ) ( not ( = ?auto_569484 ?auto_569487 ) ) ( not ( = ?auto_569484 ?auto_569489 ) ) ( not ( = ?auto_569484 ?auto_569490 ) ) ( not ( = ?auto_569484 ?auto_569491 ) ) ( not ( = ?auto_569484 ?auto_569495 ) ) ( not ( = ?auto_569485 ?auto_569482 ) ) ( not ( = ?auto_569485 ?auto_569486 ) ) ( not ( = ?auto_569485 ?auto_569488 ) ) ( not ( = ?auto_569485 ?auto_569487 ) ) ( not ( = ?auto_569485 ?auto_569489 ) ) ( not ( = ?auto_569485 ?auto_569490 ) ) ( not ( = ?auto_569485 ?auto_569491 ) ) ( not ( = ?auto_569485 ?auto_569495 ) ) ( not ( = ?auto_569482 ?auto_569486 ) ) ( not ( = ?auto_569482 ?auto_569488 ) ) ( not ( = ?auto_569482 ?auto_569487 ) ) ( not ( = ?auto_569482 ?auto_569489 ) ) ( not ( = ?auto_569482 ?auto_569490 ) ) ( not ( = ?auto_569482 ?auto_569491 ) ) ( not ( = ?auto_569482 ?auto_569495 ) ) ( not ( = ?auto_569486 ?auto_569488 ) ) ( not ( = ?auto_569486 ?auto_569487 ) ) ( not ( = ?auto_569486 ?auto_569489 ) ) ( not ( = ?auto_569486 ?auto_569490 ) ) ( not ( = ?auto_569486 ?auto_569491 ) ) ( not ( = ?auto_569486 ?auto_569495 ) ) ( not ( = ?auto_569488 ?auto_569487 ) ) ( not ( = ?auto_569488 ?auto_569489 ) ) ( not ( = ?auto_569488 ?auto_569490 ) ) ( not ( = ?auto_569488 ?auto_569491 ) ) ( not ( = ?auto_569488 ?auto_569495 ) ) ( not ( = ?auto_569487 ?auto_569489 ) ) ( not ( = ?auto_569487 ?auto_569490 ) ) ( not ( = ?auto_569487 ?auto_569491 ) ) ( not ( = ?auto_569487 ?auto_569495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_569489 ?auto_569490 ?auto_569491 )
      ( MAKE-9CRATE-VERIFY ?auto_569483 ?auto_569484 ?auto_569485 ?auto_569482 ?auto_569486 ?auto_569488 ?auto_569487 ?auto_569489 ?auto_569490 ?auto_569491 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_569592 - SURFACE
      ?auto_569593 - SURFACE
      ?auto_569594 - SURFACE
      ?auto_569591 - SURFACE
      ?auto_569595 - SURFACE
      ?auto_569597 - SURFACE
      ?auto_569596 - SURFACE
      ?auto_569598 - SURFACE
      ?auto_569599 - SURFACE
      ?auto_569600 - SURFACE
    )
    :vars
    (
      ?auto_569606 - HOIST
      ?auto_569601 - PLACE
      ?auto_569602 - PLACE
      ?auto_569604 - HOIST
      ?auto_569605 - SURFACE
      ?auto_569603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_569606 ?auto_569601 ) ( IS-CRATE ?auto_569600 ) ( not ( = ?auto_569599 ?auto_569600 ) ) ( not ( = ?auto_569598 ?auto_569599 ) ) ( not ( = ?auto_569598 ?auto_569600 ) ) ( not ( = ?auto_569602 ?auto_569601 ) ) ( HOIST-AT ?auto_569604 ?auto_569602 ) ( not ( = ?auto_569606 ?auto_569604 ) ) ( AVAILABLE ?auto_569604 ) ( SURFACE-AT ?auto_569600 ?auto_569602 ) ( ON ?auto_569600 ?auto_569605 ) ( CLEAR ?auto_569600 ) ( not ( = ?auto_569599 ?auto_569605 ) ) ( not ( = ?auto_569600 ?auto_569605 ) ) ( not ( = ?auto_569598 ?auto_569605 ) ) ( TRUCK-AT ?auto_569603 ?auto_569601 ) ( SURFACE-AT ?auto_569598 ?auto_569601 ) ( CLEAR ?auto_569598 ) ( IS-CRATE ?auto_569599 ) ( AVAILABLE ?auto_569606 ) ( IN ?auto_569599 ?auto_569603 ) ( ON ?auto_569593 ?auto_569592 ) ( ON ?auto_569594 ?auto_569593 ) ( ON ?auto_569591 ?auto_569594 ) ( ON ?auto_569595 ?auto_569591 ) ( ON ?auto_569597 ?auto_569595 ) ( ON ?auto_569596 ?auto_569597 ) ( ON ?auto_569598 ?auto_569596 ) ( not ( = ?auto_569592 ?auto_569593 ) ) ( not ( = ?auto_569592 ?auto_569594 ) ) ( not ( = ?auto_569592 ?auto_569591 ) ) ( not ( = ?auto_569592 ?auto_569595 ) ) ( not ( = ?auto_569592 ?auto_569597 ) ) ( not ( = ?auto_569592 ?auto_569596 ) ) ( not ( = ?auto_569592 ?auto_569598 ) ) ( not ( = ?auto_569592 ?auto_569599 ) ) ( not ( = ?auto_569592 ?auto_569600 ) ) ( not ( = ?auto_569592 ?auto_569605 ) ) ( not ( = ?auto_569593 ?auto_569594 ) ) ( not ( = ?auto_569593 ?auto_569591 ) ) ( not ( = ?auto_569593 ?auto_569595 ) ) ( not ( = ?auto_569593 ?auto_569597 ) ) ( not ( = ?auto_569593 ?auto_569596 ) ) ( not ( = ?auto_569593 ?auto_569598 ) ) ( not ( = ?auto_569593 ?auto_569599 ) ) ( not ( = ?auto_569593 ?auto_569600 ) ) ( not ( = ?auto_569593 ?auto_569605 ) ) ( not ( = ?auto_569594 ?auto_569591 ) ) ( not ( = ?auto_569594 ?auto_569595 ) ) ( not ( = ?auto_569594 ?auto_569597 ) ) ( not ( = ?auto_569594 ?auto_569596 ) ) ( not ( = ?auto_569594 ?auto_569598 ) ) ( not ( = ?auto_569594 ?auto_569599 ) ) ( not ( = ?auto_569594 ?auto_569600 ) ) ( not ( = ?auto_569594 ?auto_569605 ) ) ( not ( = ?auto_569591 ?auto_569595 ) ) ( not ( = ?auto_569591 ?auto_569597 ) ) ( not ( = ?auto_569591 ?auto_569596 ) ) ( not ( = ?auto_569591 ?auto_569598 ) ) ( not ( = ?auto_569591 ?auto_569599 ) ) ( not ( = ?auto_569591 ?auto_569600 ) ) ( not ( = ?auto_569591 ?auto_569605 ) ) ( not ( = ?auto_569595 ?auto_569597 ) ) ( not ( = ?auto_569595 ?auto_569596 ) ) ( not ( = ?auto_569595 ?auto_569598 ) ) ( not ( = ?auto_569595 ?auto_569599 ) ) ( not ( = ?auto_569595 ?auto_569600 ) ) ( not ( = ?auto_569595 ?auto_569605 ) ) ( not ( = ?auto_569597 ?auto_569596 ) ) ( not ( = ?auto_569597 ?auto_569598 ) ) ( not ( = ?auto_569597 ?auto_569599 ) ) ( not ( = ?auto_569597 ?auto_569600 ) ) ( not ( = ?auto_569597 ?auto_569605 ) ) ( not ( = ?auto_569596 ?auto_569598 ) ) ( not ( = ?auto_569596 ?auto_569599 ) ) ( not ( = ?auto_569596 ?auto_569600 ) ) ( not ( = ?auto_569596 ?auto_569605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_569598 ?auto_569599 ?auto_569600 )
      ( MAKE-9CRATE-VERIFY ?auto_569592 ?auto_569593 ?auto_569594 ?auto_569591 ?auto_569595 ?auto_569597 ?auto_569596 ?auto_569598 ?auto_569599 ?auto_569600 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575102 - SURFACE
      ?auto_575103 - SURFACE
      ?auto_575104 - SURFACE
      ?auto_575101 - SURFACE
      ?auto_575105 - SURFACE
      ?auto_575107 - SURFACE
      ?auto_575106 - SURFACE
      ?auto_575108 - SURFACE
      ?auto_575109 - SURFACE
      ?auto_575110 - SURFACE
      ?auto_575111 - SURFACE
    )
    :vars
    (
      ?auto_575113 - HOIST
      ?auto_575112 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575113 ?auto_575112 ) ( SURFACE-AT ?auto_575110 ?auto_575112 ) ( CLEAR ?auto_575110 ) ( LIFTING ?auto_575113 ?auto_575111 ) ( IS-CRATE ?auto_575111 ) ( not ( = ?auto_575110 ?auto_575111 ) ) ( ON ?auto_575103 ?auto_575102 ) ( ON ?auto_575104 ?auto_575103 ) ( ON ?auto_575101 ?auto_575104 ) ( ON ?auto_575105 ?auto_575101 ) ( ON ?auto_575107 ?auto_575105 ) ( ON ?auto_575106 ?auto_575107 ) ( ON ?auto_575108 ?auto_575106 ) ( ON ?auto_575109 ?auto_575108 ) ( ON ?auto_575110 ?auto_575109 ) ( not ( = ?auto_575102 ?auto_575103 ) ) ( not ( = ?auto_575102 ?auto_575104 ) ) ( not ( = ?auto_575102 ?auto_575101 ) ) ( not ( = ?auto_575102 ?auto_575105 ) ) ( not ( = ?auto_575102 ?auto_575107 ) ) ( not ( = ?auto_575102 ?auto_575106 ) ) ( not ( = ?auto_575102 ?auto_575108 ) ) ( not ( = ?auto_575102 ?auto_575109 ) ) ( not ( = ?auto_575102 ?auto_575110 ) ) ( not ( = ?auto_575102 ?auto_575111 ) ) ( not ( = ?auto_575103 ?auto_575104 ) ) ( not ( = ?auto_575103 ?auto_575101 ) ) ( not ( = ?auto_575103 ?auto_575105 ) ) ( not ( = ?auto_575103 ?auto_575107 ) ) ( not ( = ?auto_575103 ?auto_575106 ) ) ( not ( = ?auto_575103 ?auto_575108 ) ) ( not ( = ?auto_575103 ?auto_575109 ) ) ( not ( = ?auto_575103 ?auto_575110 ) ) ( not ( = ?auto_575103 ?auto_575111 ) ) ( not ( = ?auto_575104 ?auto_575101 ) ) ( not ( = ?auto_575104 ?auto_575105 ) ) ( not ( = ?auto_575104 ?auto_575107 ) ) ( not ( = ?auto_575104 ?auto_575106 ) ) ( not ( = ?auto_575104 ?auto_575108 ) ) ( not ( = ?auto_575104 ?auto_575109 ) ) ( not ( = ?auto_575104 ?auto_575110 ) ) ( not ( = ?auto_575104 ?auto_575111 ) ) ( not ( = ?auto_575101 ?auto_575105 ) ) ( not ( = ?auto_575101 ?auto_575107 ) ) ( not ( = ?auto_575101 ?auto_575106 ) ) ( not ( = ?auto_575101 ?auto_575108 ) ) ( not ( = ?auto_575101 ?auto_575109 ) ) ( not ( = ?auto_575101 ?auto_575110 ) ) ( not ( = ?auto_575101 ?auto_575111 ) ) ( not ( = ?auto_575105 ?auto_575107 ) ) ( not ( = ?auto_575105 ?auto_575106 ) ) ( not ( = ?auto_575105 ?auto_575108 ) ) ( not ( = ?auto_575105 ?auto_575109 ) ) ( not ( = ?auto_575105 ?auto_575110 ) ) ( not ( = ?auto_575105 ?auto_575111 ) ) ( not ( = ?auto_575107 ?auto_575106 ) ) ( not ( = ?auto_575107 ?auto_575108 ) ) ( not ( = ?auto_575107 ?auto_575109 ) ) ( not ( = ?auto_575107 ?auto_575110 ) ) ( not ( = ?auto_575107 ?auto_575111 ) ) ( not ( = ?auto_575106 ?auto_575108 ) ) ( not ( = ?auto_575106 ?auto_575109 ) ) ( not ( = ?auto_575106 ?auto_575110 ) ) ( not ( = ?auto_575106 ?auto_575111 ) ) ( not ( = ?auto_575108 ?auto_575109 ) ) ( not ( = ?auto_575108 ?auto_575110 ) ) ( not ( = ?auto_575108 ?auto_575111 ) ) ( not ( = ?auto_575109 ?auto_575110 ) ) ( not ( = ?auto_575109 ?auto_575111 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_575110 ?auto_575111 )
      ( MAKE-10CRATE-VERIFY ?auto_575102 ?auto_575103 ?auto_575104 ?auto_575101 ?auto_575105 ?auto_575107 ?auto_575106 ?auto_575108 ?auto_575109 ?auto_575110 ?auto_575111 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575196 - SURFACE
      ?auto_575197 - SURFACE
      ?auto_575198 - SURFACE
      ?auto_575195 - SURFACE
      ?auto_575199 - SURFACE
      ?auto_575201 - SURFACE
      ?auto_575200 - SURFACE
      ?auto_575202 - SURFACE
      ?auto_575203 - SURFACE
      ?auto_575204 - SURFACE
      ?auto_575205 - SURFACE
    )
    :vars
    (
      ?auto_575206 - HOIST
      ?auto_575207 - PLACE
      ?auto_575208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575206 ?auto_575207 ) ( SURFACE-AT ?auto_575204 ?auto_575207 ) ( CLEAR ?auto_575204 ) ( IS-CRATE ?auto_575205 ) ( not ( = ?auto_575204 ?auto_575205 ) ) ( TRUCK-AT ?auto_575208 ?auto_575207 ) ( AVAILABLE ?auto_575206 ) ( IN ?auto_575205 ?auto_575208 ) ( ON ?auto_575204 ?auto_575203 ) ( not ( = ?auto_575203 ?auto_575204 ) ) ( not ( = ?auto_575203 ?auto_575205 ) ) ( ON ?auto_575197 ?auto_575196 ) ( ON ?auto_575198 ?auto_575197 ) ( ON ?auto_575195 ?auto_575198 ) ( ON ?auto_575199 ?auto_575195 ) ( ON ?auto_575201 ?auto_575199 ) ( ON ?auto_575200 ?auto_575201 ) ( ON ?auto_575202 ?auto_575200 ) ( ON ?auto_575203 ?auto_575202 ) ( not ( = ?auto_575196 ?auto_575197 ) ) ( not ( = ?auto_575196 ?auto_575198 ) ) ( not ( = ?auto_575196 ?auto_575195 ) ) ( not ( = ?auto_575196 ?auto_575199 ) ) ( not ( = ?auto_575196 ?auto_575201 ) ) ( not ( = ?auto_575196 ?auto_575200 ) ) ( not ( = ?auto_575196 ?auto_575202 ) ) ( not ( = ?auto_575196 ?auto_575203 ) ) ( not ( = ?auto_575196 ?auto_575204 ) ) ( not ( = ?auto_575196 ?auto_575205 ) ) ( not ( = ?auto_575197 ?auto_575198 ) ) ( not ( = ?auto_575197 ?auto_575195 ) ) ( not ( = ?auto_575197 ?auto_575199 ) ) ( not ( = ?auto_575197 ?auto_575201 ) ) ( not ( = ?auto_575197 ?auto_575200 ) ) ( not ( = ?auto_575197 ?auto_575202 ) ) ( not ( = ?auto_575197 ?auto_575203 ) ) ( not ( = ?auto_575197 ?auto_575204 ) ) ( not ( = ?auto_575197 ?auto_575205 ) ) ( not ( = ?auto_575198 ?auto_575195 ) ) ( not ( = ?auto_575198 ?auto_575199 ) ) ( not ( = ?auto_575198 ?auto_575201 ) ) ( not ( = ?auto_575198 ?auto_575200 ) ) ( not ( = ?auto_575198 ?auto_575202 ) ) ( not ( = ?auto_575198 ?auto_575203 ) ) ( not ( = ?auto_575198 ?auto_575204 ) ) ( not ( = ?auto_575198 ?auto_575205 ) ) ( not ( = ?auto_575195 ?auto_575199 ) ) ( not ( = ?auto_575195 ?auto_575201 ) ) ( not ( = ?auto_575195 ?auto_575200 ) ) ( not ( = ?auto_575195 ?auto_575202 ) ) ( not ( = ?auto_575195 ?auto_575203 ) ) ( not ( = ?auto_575195 ?auto_575204 ) ) ( not ( = ?auto_575195 ?auto_575205 ) ) ( not ( = ?auto_575199 ?auto_575201 ) ) ( not ( = ?auto_575199 ?auto_575200 ) ) ( not ( = ?auto_575199 ?auto_575202 ) ) ( not ( = ?auto_575199 ?auto_575203 ) ) ( not ( = ?auto_575199 ?auto_575204 ) ) ( not ( = ?auto_575199 ?auto_575205 ) ) ( not ( = ?auto_575201 ?auto_575200 ) ) ( not ( = ?auto_575201 ?auto_575202 ) ) ( not ( = ?auto_575201 ?auto_575203 ) ) ( not ( = ?auto_575201 ?auto_575204 ) ) ( not ( = ?auto_575201 ?auto_575205 ) ) ( not ( = ?auto_575200 ?auto_575202 ) ) ( not ( = ?auto_575200 ?auto_575203 ) ) ( not ( = ?auto_575200 ?auto_575204 ) ) ( not ( = ?auto_575200 ?auto_575205 ) ) ( not ( = ?auto_575202 ?auto_575203 ) ) ( not ( = ?auto_575202 ?auto_575204 ) ) ( not ( = ?auto_575202 ?auto_575205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575203 ?auto_575204 ?auto_575205 )
      ( MAKE-10CRATE-VERIFY ?auto_575196 ?auto_575197 ?auto_575198 ?auto_575195 ?auto_575199 ?auto_575201 ?auto_575200 ?auto_575202 ?auto_575203 ?auto_575204 ?auto_575205 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575301 - SURFACE
      ?auto_575302 - SURFACE
      ?auto_575303 - SURFACE
      ?auto_575300 - SURFACE
      ?auto_575304 - SURFACE
      ?auto_575306 - SURFACE
      ?auto_575305 - SURFACE
      ?auto_575307 - SURFACE
      ?auto_575308 - SURFACE
      ?auto_575309 - SURFACE
      ?auto_575310 - SURFACE
    )
    :vars
    (
      ?auto_575313 - HOIST
      ?auto_575311 - PLACE
      ?auto_575314 - TRUCK
      ?auto_575312 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575313 ?auto_575311 ) ( SURFACE-AT ?auto_575309 ?auto_575311 ) ( CLEAR ?auto_575309 ) ( IS-CRATE ?auto_575310 ) ( not ( = ?auto_575309 ?auto_575310 ) ) ( AVAILABLE ?auto_575313 ) ( IN ?auto_575310 ?auto_575314 ) ( ON ?auto_575309 ?auto_575308 ) ( not ( = ?auto_575308 ?auto_575309 ) ) ( not ( = ?auto_575308 ?auto_575310 ) ) ( TRUCK-AT ?auto_575314 ?auto_575312 ) ( not ( = ?auto_575312 ?auto_575311 ) ) ( ON ?auto_575302 ?auto_575301 ) ( ON ?auto_575303 ?auto_575302 ) ( ON ?auto_575300 ?auto_575303 ) ( ON ?auto_575304 ?auto_575300 ) ( ON ?auto_575306 ?auto_575304 ) ( ON ?auto_575305 ?auto_575306 ) ( ON ?auto_575307 ?auto_575305 ) ( ON ?auto_575308 ?auto_575307 ) ( not ( = ?auto_575301 ?auto_575302 ) ) ( not ( = ?auto_575301 ?auto_575303 ) ) ( not ( = ?auto_575301 ?auto_575300 ) ) ( not ( = ?auto_575301 ?auto_575304 ) ) ( not ( = ?auto_575301 ?auto_575306 ) ) ( not ( = ?auto_575301 ?auto_575305 ) ) ( not ( = ?auto_575301 ?auto_575307 ) ) ( not ( = ?auto_575301 ?auto_575308 ) ) ( not ( = ?auto_575301 ?auto_575309 ) ) ( not ( = ?auto_575301 ?auto_575310 ) ) ( not ( = ?auto_575302 ?auto_575303 ) ) ( not ( = ?auto_575302 ?auto_575300 ) ) ( not ( = ?auto_575302 ?auto_575304 ) ) ( not ( = ?auto_575302 ?auto_575306 ) ) ( not ( = ?auto_575302 ?auto_575305 ) ) ( not ( = ?auto_575302 ?auto_575307 ) ) ( not ( = ?auto_575302 ?auto_575308 ) ) ( not ( = ?auto_575302 ?auto_575309 ) ) ( not ( = ?auto_575302 ?auto_575310 ) ) ( not ( = ?auto_575303 ?auto_575300 ) ) ( not ( = ?auto_575303 ?auto_575304 ) ) ( not ( = ?auto_575303 ?auto_575306 ) ) ( not ( = ?auto_575303 ?auto_575305 ) ) ( not ( = ?auto_575303 ?auto_575307 ) ) ( not ( = ?auto_575303 ?auto_575308 ) ) ( not ( = ?auto_575303 ?auto_575309 ) ) ( not ( = ?auto_575303 ?auto_575310 ) ) ( not ( = ?auto_575300 ?auto_575304 ) ) ( not ( = ?auto_575300 ?auto_575306 ) ) ( not ( = ?auto_575300 ?auto_575305 ) ) ( not ( = ?auto_575300 ?auto_575307 ) ) ( not ( = ?auto_575300 ?auto_575308 ) ) ( not ( = ?auto_575300 ?auto_575309 ) ) ( not ( = ?auto_575300 ?auto_575310 ) ) ( not ( = ?auto_575304 ?auto_575306 ) ) ( not ( = ?auto_575304 ?auto_575305 ) ) ( not ( = ?auto_575304 ?auto_575307 ) ) ( not ( = ?auto_575304 ?auto_575308 ) ) ( not ( = ?auto_575304 ?auto_575309 ) ) ( not ( = ?auto_575304 ?auto_575310 ) ) ( not ( = ?auto_575306 ?auto_575305 ) ) ( not ( = ?auto_575306 ?auto_575307 ) ) ( not ( = ?auto_575306 ?auto_575308 ) ) ( not ( = ?auto_575306 ?auto_575309 ) ) ( not ( = ?auto_575306 ?auto_575310 ) ) ( not ( = ?auto_575305 ?auto_575307 ) ) ( not ( = ?auto_575305 ?auto_575308 ) ) ( not ( = ?auto_575305 ?auto_575309 ) ) ( not ( = ?auto_575305 ?auto_575310 ) ) ( not ( = ?auto_575307 ?auto_575308 ) ) ( not ( = ?auto_575307 ?auto_575309 ) ) ( not ( = ?auto_575307 ?auto_575310 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575308 ?auto_575309 ?auto_575310 )
      ( MAKE-10CRATE-VERIFY ?auto_575301 ?auto_575302 ?auto_575303 ?auto_575300 ?auto_575304 ?auto_575306 ?auto_575305 ?auto_575307 ?auto_575308 ?auto_575309 ?auto_575310 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575416 - SURFACE
      ?auto_575417 - SURFACE
      ?auto_575418 - SURFACE
      ?auto_575415 - SURFACE
      ?auto_575419 - SURFACE
      ?auto_575421 - SURFACE
      ?auto_575420 - SURFACE
      ?auto_575422 - SURFACE
      ?auto_575423 - SURFACE
      ?auto_575424 - SURFACE
      ?auto_575425 - SURFACE
    )
    :vars
    (
      ?auto_575428 - HOIST
      ?auto_575427 - PLACE
      ?auto_575426 - TRUCK
      ?auto_575429 - PLACE
      ?auto_575430 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_575428 ?auto_575427 ) ( SURFACE-AT ?auto_575424 ?auto_575427 ) ( CLEAR ?auto_575424 ) ( IS-CRATE ?auto_575425 ) ( not ( = ?auto_575424 ?auto_575425 ) ) ( AVAILABLE ?auto_575428 ) ( ON ?auto_575424 ?auto_575423 ) ( not ( = ?auto_575423 ?auto_575424 ) ) ( not ( = ?auto_575423 ?auto_575425 ) ) ( TRUCK-AT ?auto_575426 ?auto_575429 ) ( not ( = ?auto_575429 ?auto_575427 ) ) ( HOIST-AT ?auto_575430 ?auto_575429 ) ( LIFTING ?auto_575430 ?auto_575425 ) ( not ( = ?auto_575428 ?auto_575430 ) ) ( ON ?auto_575417 ?auto_575416 ) ( ON ?auto_575418 ?auto_575417 ) ( ON ?auto_575415 ?auto_575418 ) ( ON ?auto_575419 ?auto_575415 ) ( ON ?auto_575421 ?auto_575419 ) ( ON ?auto_575420 ?auto_575421 ) ( ON ?auto_575422 ?auto_575420 ) ( ON ?auto_575423 ?auto_575422 ) ( not ( = ?auto_575416 ?auto_575417 ) ) ( not ( = ?auto_575416 ?auto_575418 ) ) ( not ( = ?auto_575416 ?auto_575415 ) ) ( not ( = ?auto_575416 ?auto_575419 ) ) ( not ( = ?auto_575416 ?auto_575421 ) ) ( not ( = ?auto_575416 ?auto_575420 ) ) ( not ( = ?auto_575416 ?auto_575422 ) ) ( not ( = ?auto_575416 ?auto_575423 ) ) ( not ( = ?auto_575416 ?auto_575424 ) ) ( not ( = ?auto_575416 ?auto_575425 ) ) ( not ( = ?auto_575417 ?auto_575418 ) ) ( not ( = ?auto_575417 ?auto_575415 ) ) ( not ( = ?auto_575417 ?auto_575419 ) ) ( not ( = ?auto_575417 ?auto_575421 ) ) ( not ( = ?auto_575417 ?auto_575420 ) ) ( not ( = ?auto_575417 ?auto_575422 ) ) ( not ( = ?auto_575417 ?auto_575423 ) ) ( not ( = ?auto_575417 ?auto_575424 ) ) ( not ( = ?auto_575417 ?auto_575425 ) ) ( not ( = ?auto_575418 ?auto_575415 ) ) ( not ( = ?auto_575418 ?auto_575419 ) ) ( not ( = ?auto_575418 ?auto_575421 ) ) ( not ( = ?auto_575418 ?auto_575420 ) ) ( not ( = ?auto_575418 ?auto_575422 ) ) ( not ( = ?auto_575418 ?auto_575423 ) ) ( not ( = ?auto_575418 ?auto_575424 ) ) ( not ( = ?auto_575418 ?auto_575425 ) ) ( not ( = ?auto_575415 ?auto_575419 ) ) ( not ( = ?auto_575415 ?auto_575421 ) ) ( not ( = ?auto_575415 ?auto_575420 ) ) ( not ( = ?auto_575415 ?auto_575422 ) ) ( not ( = ?auto_575415 ?auto_575423 ) ) ( not ( = ?auto_575415 ?auto_575424 ) ) ( not ( = ?auto_575415 ?auto_575425 ) ) ( not ( = ?auto_575419 ?auto_575421 ) ) ( not ( = ?auto_575419 ?auto_575420 ) ) ( not ( = ?auto_575419 ?auto_575422 ) ) ( not ( = ?auto_575419 ?auto_575423 ) ) ( not ( = ?auto_575419 ?auto_575424 ) ) ( not ( = ?auto_575419 ?auto_575425 ) ) ( not ( = ?auto_575421 ?auto_575420 ) ) ( not ( = ?auto_575421 ?auto_575422 ) ) ( not ( = ?auto_575421 ?auto_575423 ) ) ( not ( = ?auto_575421 ?auto_575424 ) ) ( not ( = ?auto_575421 ?auto_575425 ) ) ( not ( = ?auto_575420 ?auto_575422 ) ) ( not ( = ?auto_575420 ?auto_575423 ) ) ( not ( = ?auto_575420 ?auto_575424 ) ) ( not ( = ?auto_575420 ?auto_575425 ) ) ( not ( = ?auto_575422 ?auto_575423 ) ) ( not ( = ?auto_575422 ?auto_575424 ) ) ( not ( = ?auto_575422 ?auto_575425 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575423 ?auto_575424 ?auto_575425 )
      ( MAKE-10CRATE-VERIFY ?auto_575416 ?auto_575417 ?auto_575418 ?auto_575415 ?auto_575419 ?auto_575421 ?auto_575420 ?auto_575422 ?auto_575423 ?auto_575424 ?auto_575425 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575541 - SURFACE
      ?auto_575542 - SURFACE
      ?auto_575543 - SURFACE
      ?auto_575540 - SURFACE
      ?auto_575544 - SURFACE
      ?auto_575546 - SURFACE
      ?auto_575545 - SURFACE
      ?auto_575547 - SURFACE
      ?auto_575548 - SURFACE
      ?auto_575549 - SURFACE
      ?auto_575550 - SURFACE
    )
    :vars
    (
      ?auto_575554 - HOIST
      ?auto_575553 - PLACE
      ?auto_575556 - TRUCK
      ?auto_575551 - PLACE
      ?auto_575552 - HOIST
      ?auto_575555 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575554 ?auto_575553 ) ( SURFACE-AT ?auto_575549 ?auto_575553 ) ( CLEAR ?auto_575549 ) ( IS-CRATE ?auto_575550 ) ( not ( = ?auto_575549 ?auto_575550 ) ) ( AVAILABLE ?auto_575554 ) ( ON ?auto_575549 ?auto_575548 ) ( not ( = ?auto_575548 ?auto_575549 ) ) ( not ( = ?auto_575548 ?auto_575550 ) ) ( TRUCK-AT ?auto_575556 ?auto_575551 ) ( not ( = ?auto_575551 ?auto_575553 ) ) ( HOIST-AT ?auto_575552 ?auto_575551 ) ( not ( = ?auto_575554 ?auto_575552 ) ) ( AVAILABLE ?auto_575552 ) ( SURFACE-AT ?auto_575550 ?auto_575551 ) ( ON ?auto_575550 ?auto_575555 ) ( CLEAR ?auto_575550 ) ( not ( = ?auto_575549 ?auto_575555 ) ) ( not ( = ?auto_575550 ?auto_575555 ) ) ( not ( = ?auto_575548 ?auto_575555 ) ) ( ON ?auto_575542 ?auto_575541 ) ( ON ?auto_575543 ?auto_575542 ) ( ON ?auto_575540 ?auto_575543 ) ( ON ?auto_575544 ?auto_575540 ) ( ON ?auto_575546 ?auto_575544 ) ( ON ?auto_575545 ?auto_575546 ) ( ON ?auto_575547 ?auto_575545 ) ( ON ?auto_575548 ?auto_575547 ) ( not ( = ?auto_575541 ?auto_575542 ) ) ( not ( = ?auto_575541 ?auto_575543 ) ) ( not ( = ?auto_575541 ?auto_575540 ) ) ( not ( = ?auto_575541 ?auto_575544 ) ) ( not ( = ?auto_575541 ?auto_575546 ) ) ( not ( = ?auto_575541 ?auto_575545 ) ) ( not ( = ?auto_575541 ?auto_575547 ) ) ( not ( = ?auto_575541 ?auto_575548 ) ) ( not ( = ?auto_575541 ?auto_575549 ) ) ( not ( = ?auto_575541 ?auto_575550 ) ) ( not ( = ?auto_575541 ?auto_575555 ) ) ( not ( = ?auto_575542 ?auto_575543 ) ) ( not ( = ?auto_575542 ?auto_575540 ) ) ( not ( = ?auto_575542 ?auto_575544 ) ) ( not ( = ?auto_575542 ?auto_575546 ) ) ( not ( = ?auto_575542 ?auto_575545 ) ) ( not ( = ?auto_575542 ?auto_575547 ) ) ( not ( = ?auto_575542 ?auto_575548 ) ) ( not ( = ?auto_575542 ?auto_575549 ) ) ( not ( = ?auto_575542 ?auto_575550 ) ) ( not ( = ?auto_575542 ?auto_575555 ) ) ( not ( = ?auto_575543 ?auto_575540 ) ) ( not ( = ?auto_575543 ?auto_575544 ) ) ( not ( = ?auto_575543 ?auto_575546 ) ) ( not ( = ?auto_575543 ?auto_575545 ) ) ( not ( = ?auto_575543 ?auto_575547 ) ) ( not ( = ?auto_575543 ?auto_575548 ) ) ( not ( = ?auto_575543 ?auto_575549 ) ) ( not ( = ?auto_575543 ?auto_575550 ) ) ( not ( = ?auto_575543 ?auto_575555 ) ) ( not ( = ?auto_575540 ?auto_575544 ) ) ( not ( = ?auto_575540 ?auto_575546 ) ) ( not ( = ?auto_575540 ?auto_575545 ) ) ( not ( = ?auto_575540 ?auto_575547 ) ) ( not ( = ?auto_575540 ?auto_575548 ) ) ( not ( = ?auto_575540 ?auto_575549 ) ) ( not ( = ?auto_575540 ?auto_575550 ) ) ( not ( = ?auto_575540 ?auto_575555 ) ) ( not ( = ?auto_575544 ?auto_575546 ) ) ( not ( = ?auto_575544 ?auto_575545 ) ) ( not ( = ?auto_575544 ?auto_575547 ) ) ( not ( = ?auto_575544 ?auto_575548 ) ) ( not ( = ?auto_575544 ?auto_575549 ) ) ( not ( = ?auto_575544 ?auto_575550 ) ) ( not ( = ?auto_575544 ?auto_575555 ) ) ( not ( = ?auto_575546 ?auto_575545 ) ) ( not ( = ?auto_575546 ?auto_575547 ) ) ( not ( = ?auto_575546 ?auto_575548 ) ) ( not ( = ?auto_575546 ?auto_575549 ) ) ( not ( = ?auto_575546 ?auto_575550 ) ) ( not ( = ?auto_575546 ?auto_575555 ) ) ( not ( = ?auto_575545 ?auto_575547 ) ) ( not ( = ?auto_575545 ?auto_575548 ) ) ( not ( = ?auto_575545 ?auto_575549 ) ) ( not ( = ?auto_575545 ?auto_575550 ) ) ( not ( = ?auto_575545 ?auto_575555 ) ) ( not ( = ?auto_575547 ?auto_575548 ) ) ( not ( = ?auto_575547 ?auto_575549 ) ) ( not ( = ?auto_575547 ?auto_575550 ) ) ( not ( = ?auto_575547 ?auto_575555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575548 ?auto_575549 ?auto_575550 )
      ( MAKE-10CRATE-VERIFY ?auto_575541 ?auto_575542 ?auto_575543 ?auto_575540 ?auto_575544 ?auto_575546 ?auto_575545 ?auto_575547 ?auto_575548 ?auto_575549 ?auto_575550 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575667 - SURFACE
      ?auto_575668 - SURFACE
      ?auto_575669 - SURFACE
      ?auto_575666 - SURFACE
      ?auto_575670 - SURFACE
      ?auto_575672 - SURFACE
      ?auto_575671 - SURFACE
      ?auto_575673 - SURFACE
      ?auto_575674 - SURFACE
      ?auto_575675 - SURFACE
      ?auto_575676 - SURFACE
    )
    :vars
    (
      ?auto_575681 - HOIST
      ?auto_575682 - PLACE
      ?auto_575680 - PLACE
      ?auto_575679 - HOIST
      ?auto_575678 - SURFACE
      ?auto_575677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575681 ?auto_575682 ) ( SURFACE-AT ?auto_575675 ?auto_575682 ) ( CLEAR ?auto_575675 ) ( IS-CRATE ?auto_575676 ) ( not ( = ?auto_575675 ?auto_575676 ) ) ( AVAILABLE ?auto_575681 ) ( ON ?auto_575675 ?auto_575674 ) ( not ( = ?auto_575674 ?auto_575675 ) ) ( not ( = ?auto_575674 ?auto_575676 ) ) ( not ( = ?auto_575680 ?auto_575682 ) ) ( HOIST-AT ?auto_575679 ?auto_575680 ) ( not ( = ?auto_575681 ?auto_575679 ) ) ( AVAILABLE ?auto_575679 ) ( SURFACE-AT ?auto_575676 ?auto_575680 ) ( ON ?auto_575676 ?auto_575678 ) ( CLEAR ?auto_575676 ) ( not ( = ?auto_575675 ?auto_575678 ) ) ( not ( = ?auto_575676 ?auto_575678 ) ) ( not ( = ?auto_575674 ?auto_575678 ) ) ( TRUCK-AT ?auto_575677 ?auto_575682 ) ( ON ?auto_575668 ?auto_575667 ) ( ON ?auto_575669 ?auto_575668 ) ( ON ?auto_575666 ?auto_575669 ) ( ON ?auto_575670 ?auto_575666 ) ( ON ?auto_575672 ?auto_575670 ) ( ON ?auto_575671 ?auto_575672 ) ( ON ?auto_575673 ?auto_575671 ) ( ON ?auto_575674 ?auto_575673 ) ( not ( = ?auto_575667 ?auto_575668 ) ) ( not ( = ?auto_575667 ?auto_575669 ) ) ( not ( = ?auto_575667 ?auto_575666 ) ) ( not ( = ?auto_575667 ?auto_575670 ) ) ( not ( = ?auto_575667 ?auto_575672 ) ) ( not ( = ?auto_575667 ?auto_575671 ) ) ( not ( = ?auto_575667 ?auto_575673 ) ) ( not ( = ?auto_575667 ?auto_575674 ) ) ( not ( = ?auto_575667 ?auto_575675 ) ) ( not ( = ?auto_575667 ?auto_575676 ) ) ( not ( = ?auto_575667 ?auto_575678 ) ) ( not ( = ?auto_575668 ?auto_575669 ) ) ( not ( = ?auto_575668 ?auto_575666 ) ) ( not ( = ?auto_575668 ?auto_575670 ) ) ( not ( = ?auto_575668 ?auto_575672 ) ) ( not ( = ?auto_575668 ?auto_575671 ) ) ( not ( = ?auto_575668 ?auto_575673 ) ) ( not ( = ?auto_575668 ?auto_575674 ) ) ( not ( = ?auto_575668 ?auto_575675 ) ) ( not ( = ?auto_575668 ?auto_575676 ) ) ( not ( = ?auto_575668 ?auto_575678 ) ) ( not ( = ?auto_575669 ?auto_575666 ) ) ( not ( = ?auto_575669 ?auto_575670 ) ) ( not ( = ?auto_575669 ?auto_575672 ) ) ( not ( = ?auto_575669 ?auto_575671 ) ) ( not ( = ?auto_575669 ?auto_575673 ) ) ( not ( = ?auto_575669 ?auto_575674 ) ) ( not ( = ?auto_575669 ?auto_575675 ) ) ( not ( = ?auto_575669 ?auto_575676 ) ) ( not ( = ?auto_575669 ?auto_575678 ) ) ( not ( = ?auto_575666 ?auto_575670 ) ) ( not ( = ?auto_575666 ?auto_575672 ) ) ( not ( = ?auto_575666 ?auto_575671 ) ) ( not ( = ?auto_575666 ?auto_575673 ) ) ( not ( = ?auto_575666 ?auto_575674 ) ) ( not ( = ?auto_575666 ?auto_575675 ) ) ( not ( = ?auto_575666 ?auto_575676 ) ) ( not ( = ?auto_575666 ?auto_575678 ) ) ( not ( = ?auto_575670 ?auto_575672 ) ) ( not ( = ?auto_575670 ?auto_575671 ) ) ( not ( = ?auto_575670 ?auto_575673 ) ) ( not ( = ?auto_575670 ?auto_575674 ) ) ( not ( = ?auto_575670 ?auto_575675 ) ) ( not ( = ?auto_575670 ?auto_575676 ) ) ( not ( = ?auto_575670 ?auto_575678 ) ) ( not ( = ?auto_575672 ?auto_575671 ) ) ( not ( = ?auto_575672 ?auto_575673 ) ) ( not ( = ?auto_575672 ?auto_575674 ) ) ( not ( = ?auto_575672 ?auto_575675 ) ) ( not ( = ?auto_575672 ?auto_575676 ) ) ( not ( = ?auto_575672 ?auto_575678 ) ) ( not ( = ?auto_575671 ?auto_575673 ) ) ( not ( = ?auto_575671 ?auto_575674 ) ) ( not ( = ?auto_575671 ?auto_575675 ) ) ( not ( = ?auto_575671 ?auto_575676 ) ) ( not ( = ?auto_575671 ?auto_575678 ) ) ( not ( = ?auto_575673 ?auto_575674 ) ) ( not ( = ?auto_575673 ?auto_575675 ) ) ( not ( = ?auto_575673 ?auto_575676 ) ) ( not ( = ?auto_575673 ?auto_575678 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575674 ?auto_575675 ?auto_575676 )
      ( MAKE-10CRATE-VERIFY ?auto_575667 ?auto_575668 ?auto_575669 ?auto_575666 ?auto_575670 ?auto_575672 ?auto_575671 ?auto_575673 ?auto_575674 ?auto_575675 ?auto_575676 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575793 - SURFACE
      ?auto_575794 - SURFACE
      ?auto_575795 - SURFACE
      ?auto_575792 - SURFACE
      ?auto_575796 - SURFACE
      ?auto_575798 - SURFACE
      ?auto_575797 - SURFACE
      ?auto_575799 - SURFACE
      ?auto_575800 - SURFACE
      ?auto_575801 - SURFACE
      ?auto_575802 - SURFACE
    )
    :vars
    (
      ?auto_575805 - HOIST
      ?auto_575803 - PLACE
      ?auto_575804 - PLACE
      ?auto_575807 - HOIST
      ?auto_575808 - SURFACE
      ?auto_575806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575805 ?auto_575803 ) ( IS-CRATE ?auto_575802 ) ( not ( = ?auto_575801 ?auto_575802 ) ) ( not ( = ?auto_575800 ?auto_575801 ) ) ( not ( = ?auto_575800 ?auto_575802 ) ) ( not ( = ?auto_575804 ?auto_575803 ) ) ( HOIST-AT ?auto_575807 ?auto_575804 ) ( not ( = ?auto_575805 ?auto_575807 ) ) ( AVAILABLE ?auto_575807 ) ( SURFACE-AT ?auto_575802 ?auto_575804 ) ( ON ?auto_575802 ?auto_575808 ) ( CLEAR ?auto_575802 ) ( not ( = ?auto_575801 ?auto_575808 ) ) ( not ( = ?auto_575802 ?auto_575808 ) ) ( not ( = ?auto_575800 ?auto_575808 ) ) ( TRUCK-AT ?auto_575806 ?auto_575803 ) ( SURFACE-AT ?auto_575800 ?auto_575803 ) ( CLEAR ?auto_575800 ) ( LIFTING ?auto_575805 ?auto_575801 ) ( IS-CRATE ?auto_575801 ) ( ON ?auto_575794 ?auto_575793 ) ( ON ?auto_575795 ?auto_575794 ) ( ON ?auto_575792 ?auto_575795 ) ( ON ?auto_575796 ?auto_575792 ) ( ON ?auto_575798 ?auto_575796 ) ( ON ?auto_575797 ?auto_575798 ) ( ON ?auto_575799 ?auto_575797 ) ( ON ?auto_575800 ?auto_575799 ) ( not ( = ?auto_575793 ?auto_575794 ) ) ( not ( = ?auto_575793 ?auto_575795 ) ) ( not ( = ?auto_575793 ?auto_575792 ) ) ( not ( = ?auto_575793 ?auto_575796 ) ) ( not ( = ?auto_575793 ?auto_575798 ) ) ( not ( = ?auto_575793 ?auto_575797 ) ) ( not ( = ?auto_575793 ?auto_575799 ) ) ( not ( = ?auto_575793 ?auto_575800 ) ) ( not ( = ?auto_575793 ?auto_575801 ) ) ( not ( = ?auto_575793 ?auto_575802 ) ) ( not ( = ?auto_575793 ?auto_575808 ) ) ( not ( = ?auto_575794 ?auto_575795 ) ) ( not ( = ?auto_575794 ?auto_575792 ) ) ( not ( = ?auto_575794 ?auto_575796 ) ) ( not ( = ?auto_575794 ?auto_575798 ) ) ( not ( = ?auto_575794 ?auto_575797 ) ) ( not ( = ?auto_575794 ?auto_575799 ) ) ( not ( = ?auto_575794 ?auto_575800 ) ) ( not ( = ?auto_575794 ?auto_575801 ) ) ( not ( = ?auto_575794 ?auto_575802 ) ) ( not ( = ?auto_575794 ?auto_575808 ) ) ( not ( = ?auto_575795 ?auto_575792 ) ) ( not ( = ?auto_575795 ?auto_575796 ) ) ( not ( = ?auto_575795 ?auto_575798 ) ) ( not ( = ?auto_575795 ?auto_575797 ) ) ( not ( = ?auto_575795 ?auto_575799 ) ) ( not ( = ?auto_575795 ?auto_575800 ) ) ( not ( = ?auto_575795 ?auto_575801 ) ) ( not ( = ?auto_575795 ?auto_575802 ) ) ( not ( = ?auto_575795 ?auto_575808 ) ) ( not ( = ?auto_575792 ?auto_575796 ) ) ( not ( = ?auto_575792 ?auto_575798 ) ) ( not ( = ?auto_575792 ?auto_575797 ) ) ( not ( = ?auto_575792 ?auto_575799 ) ) ( not ( = ?auto_575792 ?auto_575800 ) ) ( not ( = ?auto_575792 ?auto_575801 ) ) ( not ( = ?auto_575792 ?auto_575802 ) ) ( not ( = ?auto_575792 ?auto_575808 ) ) ( not ( = ?auto_575796 ?auto_575798 ) ) ( not ( = ?auto_575796 ?auto_575797 ) ) ( not ( = ?auto_575796 ?auto_575799 ) ) ( not ( = ?auto_575796 ?auto_575800 ) ) ( not ( = ?auto_575796 ?auto_575801 ) ) ( not ( = ?auto_575796 ?auto_575802 ) ) ( not ( = ?auto_575796 ?auto_575808 ) ) ( not ( = ?auto_575798 ?auto_575797 ) ) ( not ( = ?auto_575798 ?auto_575799 ) ) ( not ( = ?auto_575798 ?auto_575800 ) ) ( not ( = ?auto_575798 ?auto_575801 ) ) ( not ( = ?auto_575798 ?auto_575802 ) ) ( not ( = ?auto_575798 ?auto_575808 ) ) ( not ( = ?auto_575797 ?auto_575799 ) ) ( not ( = ?auto_575797 ?auto_575800 ) ) ( not ( = ?auto_575797 ?auto_575801 ) ) ( not ( = ?auto_575797 ?auto_575802 ) ) ( not ( = ?auto_575797 ?auto_575808 ) ) ( not ( = ?auto_575799 ?auto_575800 ) ) ( not ( = ?auto_575799 ?auto_575801 ) ) ( not ( = ?auto_575799 ?auto_575802 ) ) ( not ( = ?auto_575799 ?auto_575808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575800 ?auto_575801 ?auto_575802 )
      ( MAKE-10CRATE-VERIFY ?auto_575793 ?auto_575794 ?auto_575795 ?auto_575792 ?auto_575796 ?auto_575798 ?auto_575797 ?auto_575799 ?auto_575800 ?auto_575801 ?auto_575802 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575919 - SURFACE
      ?auto_575920 - SURFACE
      ?auto_575921 - SURFACE
      ?auto_575918 - SURFACE
      ?auto_575922 - SURFACE
      ?auto_575924 - SURFACE
      ?auto_575923 - SURFACE
      ?auto_575925 - SURFACE
      ?auto_575926 - SURFACE
      ?auto_575927 - SURFACE
      ?auto_575928 - SURFACE
    )
    :vars
    (
      ?auto_575933 - HOIST
      ?auto_575930 - PLACE
      ?auto_575929 - PLACE
      ?auto_575932 - HOIST
      ?auto_575934 - SURFACE
      ?auto_575931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575933 ?auto_575930 ) ( IS-CRATE ?auto_575928 ) ( not ( = ?auto_575927 ?auto_575928 ) ) ( not ( = ?auto_575926 ?auto_575927 ) ) ( not ( = ?auto_575926 ?auto_575928 ) ) ( not ( = ?auto_575929 ?auto_575930 ) ) ( HOIST-AT ?auto_575932 ?auto_575929 ) ( not ( = ?auto_575933 ?auto_575932 ) ) ( AVAILABLE ?auto_575932 ) ( SURFACE-AT ?auto_575928 ?auto_575929 ) ( ON ?auto_575928 ?auto_575934 ) ( CLEAR ?auto_575928 ) ( not ( = ?auto_575927 ?auto_575934 ) ) ( not ( = ?auto_575928 ?auto_575934 ) ) ( not ( = ?auto_575926 ?auto_575934 ) ) ( TRUCK-AT ?auto_575931 ?auto_575930 ) ( SURFACE-AT ?auto_575926 ?auto_575930 ) ( CLEAR ?auto_575926 ) ( IS-CRATE ?auto_575927 ) ( AVAILABLE ?auto_575933 ) ( IN ?auto_575927 ?auto_575931 ) ( ON ?auto_575920 ?auto_575919 ) ( ON ?auto_575921 ?auto_575920 ) ( ON ?auto_575918 ?auto_575921 ) ( ON ?auto_575922 ?auto_575918 ) ( ON ?auto_575924 ?auto_575922 ) ( ON ?auto_575923 ?auto_575924 ) ( ON ?auto_575925 ?auto_575923 ) ( ON ?auto_575926 ?auto_575925 ) ( not ( = ?auto_575919 ?auto_575920 ) ) ( not ( = ?auto_575919 ?auto_575921 ) ) ( not ( = ?auto_575919 ?auto_575918 ) ) ( not ( = ?auto_575919 ?auto_575922 ) ) ( not ( = ?auto_575919 ?auto_575924 ) ) ( not ( = ?auto_575919 ?auto_575923 ) ) ( not ( = ?auto_575919 ?auto_575925 ) ) ( not ( = ?auto_575919 ?auto_575926 ) ) ( not ( = ?auto_575919 ?auto_575927 ) ) ( not ( = ?auto_575919 ?auto_575928 ) ) ( not ( = ?auto_575919 ?auto_575934 ) ) ( not ( = ?auto_575920 ?auto_575921 ) ) ( not ( = ?auto_575920 ?auto_575918 ) ) ( not ( = ?auto_575920 ?auto_575922 ) ) ( not ( = ?auto_575920 ?auto_575924 ) ) ( not ( = ?auto_575920 ?auto_575923 ) ) ( not ( = ?auto_575920 ?auto_575925 ) ) ( not ( = ?auto_575920 ?auto_575926 ) ) ( not ( = ?auto_575920 ?auto_575927 ) ) ( not ( = ?auto_575920 ?auto_575928 ) ) ( not ( = ?auto_575920 ?auto_575934 ) ) ( not ( = ?auto_575921 ?auto_575918 ) ) ( not ( = ?auto_575921 ?auto_575922 ) ) ( not ( = ?auto_575921 ?auto_575924 ) ) ( not ( = ?auto_575921 ?auto_575923 ) ) ( not ( = ?auto_575921 ?auto_575925 ) ) ( not ( = ?auto_575921 ?auto_575926 ) ) ( not ( = ?auto_575921 ?auto_575927 ) ) ( not ( = ?auto_575921 ?auto_575928 ) ) ( not ( = ?auto_575921 ?auto_575934 ) ) ( not ( = ?auto_575918 ?auto_575922 ) ) ( not ( = ?auto_575918 ?auto_575924 ) ) ( not ( = ?auto_575918 ?auto_575923 ) ) ( not ( = ?auto_575918 ?auto_575925 ) ) ( not ( = ?auto_575918 ?auto_575926 ) ) ( not ( = ?auto_575918 ?auto_575927 ) ) ( not ( = ?auto_575918 ?auto_575928 ) ) ( not ( = ?auto_575918 ?auto_575934 ) ) ( not ( = ?auto_575922 ?auto_575924 ) ) ( not ( = ?auto_575922 ?auto_575923 ) ) ( not ( = ?auto_575922 ?auto_575925 ) ) ( not ( = ?auto_575922 ?auto_575926 ) ) ( not ( = ?auto_575922 ?auto_575927 ) ) ( not ( = ?auto_575922 ?auto_575928 ) ) ( not ( = ?auto_575922 ?auto_575934 ) ) ( not ( = ?auto_575924 ?auto_575923 ) ) ( not ( = ?auto_575924 ?auto_575925 ) ) ( not ( = ?auto_575924 ?auto_575926 ) ) ( not ( = ?auto_575924 ?auto_575927 ) ) ( not ( = ?auto_575924 ?auto_575928 ) ) ( not ( = ?auto_575924 ?auto_575934 ) ) ( not ( = ?auto_575923 ?auto_575925 ) ) ( not ( = ?auto_575923 ?auto_575926 ) ) ( not ( = ?auto_575923 ?auto_575927 ) ) ( not ( = ?auto_575923 ?auto_575928 ) ) ( not ( = ?auto_575923 ?auto_575934 ) ) ( not ( = ?auto_575925 ?auto_575926 ) ) ( not ( = ?auto_575925 ?auto_575927 ) ) ( not ( = ?auto_575925 ?auto_575928 ) ) ( not ( = ?auto_575925 ?auto_575934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575926 ?auto_575927 ?auto_575928 )
      ( MAKE-10CRATE-VERIFY ?auto_575919 ?auto_575920 ?auto_575921 ?auto_575918 ?auto_575922 ?auto_575924 ?auto_575923 ?auto_575925 ?auto_575926 ?auto_575927 ?auto_575928 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583158 - SURFACE
      ?auto_583159 - SURFACE
      ?auto_583160 - SURFACE
      ?auto_583157 - SURFACE
      ?auto_583161 - SURFACE
      ?auto_583163 - SURFACE
      ?auto_583162 - SURFACE
      ?auto_583164 - SURFACE
      ?auto_583165 - SURFACE
      ?auto_583166 - SURFACE
      ?auto_583167 - SURFACE
      ?auto_583168 - SURFACE
    )
    :vars
    (
      ?auto_583170 - HOIST
      ?auto_583169 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_583170 ?auto_583169 ) ( SURFACE-AT ?auto_583167 ?auto_583169 ) ( CLEAR ?auto_583167 ) ( LIFTING ?auto_583170 ?auto_583168 ) ( IS-CRATE ?auto_583168 ) ( not ( = ?auto_583167 ?auto_583168 ) ) ( ON ?auto_583159 ?auto_583158 ) ( ON ?auto_583160 ?auto_583159 ) ( ON ?auto_583157 ?auto_583160 ) ( ON ?auto_583161 ?auto_583157 ) ( ON ?auto_583163 ?auto_583161 ) ( ON ?auto_583162 ?auto_583163 ) ( ON ?auto_583164 ?auto_583162 ) ( ON ?auto_583165 ?auto_583164 ) ( ON ?auto_583166 ?auto_583165 ) ( ON ?auto_583167 ?auto_583166 ) ( not ( = ?auto_583158 ?auto_583159 ) ) ( not ( = ?auto_583158 ?auto_583160 ) ) ( not ( = ?auto_583158 ?auto_583157 ) ) ( not ( = ?auto_583158 ?auto_583161 ) ) ( not ( = ?auto_583158 ?auto_583163 ) ) ( not ( = ?auto_583158 ?auto_583162 ) ) ( not ( = ?auto_583158 ?auto_583164 ) ) ( not ( = ?auto_583158 ?auto_583165 ) ) ( not ( = ?auto_583158 ?auto_583166 ) ) ( not ( = ?auto_583158 ?auto_583167 ) ) ( not ( = ?auto_583158 ?auto_583168 ) ) ( not ( = ?auto_583159 ?auto_583160 ) ) ( not ( = ?auto_583159 ?auto_583157 ) ) ( not ( = ?auto_583159 ?auto_583161 ) ) ( not ( = ?auto_583159 ?auto_583163 ) ) ( not ( = ?auto_583159 ?auto_583162 ) ) ( not ( = ?auto_583159 ?auto_583164 ) ) ( not ( = ?auto_583159 ?auto_583165 ) ) ( not ( = ?auto_583159 ?auto_583166 ) ) ( not ( = ?auto_583159 ?auto_583167 ) ) ( not ( = ?auto_583159 ?auto_583168 ) ) ( not ( = ?auto_583160 ?auto_583157 ) ) ( not ( = ?auto_583160 ?auto_583161 ) ) ( not ( = ?auto_583160 ?auto_583163 ) ) ( not ( = ?auto_583160 ?auto_583162 ) ) ( not ( = ?auto_583160 ?auto_583164 ) ) ( not ( = ?auto_583160 ?auto_583165 ) ) ( not ( = ?auto_583160 ?auto_583166 ) ) ( not ( = ?auto_583160 ?auto_583167 ) ) ( not ( = ?auto_583160 ?auto_583168 ) ) ( not ( = ?auto_583157 ?auto_583161 ) ) ( not ( = ?auto_583157 ?auto_583163 ) ) ( not ( = ?auto_583157 ?auto_583162 ) ) ( not ( = ?auto_583157 ?auto_583164 ) ) ( not ( = ?auto_583157 ?auto_583165 ) ) ( not ( = ?auto_583157 ?auto_583166 ) ) ( not ( = ?auto_583157 ?auto_583167 ) ) ( not ( = ?auto_583157 ?auto_583168 ) ) ( not ( = ?auto_583161 ?auto_583163 ) ) ( not ( = ?auto_583161 ?auto_583162 ) ) ( not ( = ?auto_583161 ?auto_583164 ) ) ( not ( = ?auto_583161 ?auto_583165 ) ) ( not ( = ?auto_583161 ?auto_583166 ) ) ( not ( = ?auto_583161 ?auto_583167 ) ) ( not ( = ?auto_583161 ?auto_583168 ) ) ( not ( = ?auto_583163 ?auto_583162 ) ) ( not ( = ?auto_583163 ?auto_583164 ) ) ( not ( = ?auto_583163 ?auto_583165 ) ) ( not ( = ?auto_583163 ?auto_583166 ) ) ( not ( = ?auto_583163 ?auto_583167 ) ) ( not ( = ?auto_583163 ?auto_583168 ) ) ( not ( = ?auto_583162 ?auto_583164 ) ) ( not ( = ?auto_583162 ?auto_583165 ) ) ( not ( = ?auto_583162 ?auto_583166 ) ) ( not ( = ?auto_583162 ?auto_583167 ) ) ( not ( = ?auto_583162 ?auto_583168 ) ) ( not ( = ?auto_583164 ?auto_583165 ) ) ( not ( = ?auto_583164 ?auto_583166 ) ) ( not ( = ?auto_583164 ?auto_583167 ) ) ( not ( = ?auto_583164 ?auto_583168 ) ) ( not ( = ?auto_583165 ?auto_583166 ) ) ( not ( = ?auto_583165 ?auto_583167 ) ) ( not ( = ?auto_583165 ?auto_583168 ) ) ( not ( = ?auto_583166 ?auto_583167 ) ) ( not ( = ?auto_583166 ?auto_583168 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_583167 ?auto_583168 )
      ( MAKE-11CRATE-VERIFY ?auto_583158 ?auto_583159 ?auto_583160 ?auto_583157 ?auto_583161 ?auto_583163 ?auto_583162 ?auto_583164 ?auto_583165 ?auto_583166 ?auto_583167 ?auto_583168 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583267 - SURFACE
      ?auto_583268 - SURFACE
      ?auto_583269 - SURFACE
      ?auto_583266 - SURFACE
      ?auto_583270 - SURFACE
      ?auto_583272 - SURFACE
      ?auto_583271 - SURFACE
      ?auto_583273 - SURFACE
      ?auto_583274 - SURFACE
      ?auto_583275 - SURFACE
      ?auto_583276 - SURFACE
      ?auto_583277 - SURFACE
    )
    :vars
    (
      ?auto_583280 - HOIST
      ?auto_583279 - PLACE
      ?auto_583278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_583280 ?auto_583279 ) ( SURFACE-AT ?auto_583276 ?auto_583279 ) ( CLEAR ?auto_583276 ) ( IS-CRATE ?auto_583277 ) ( not ( = ?auto_583276 ?auto_583277 ) ) ( TRUCK-AT ?auto_583278 ?auto_583279 ) ( AVAILABLE ?auto_583280 ) ( IN ?auto_583277 ?auto_583278 ) ( ON ?auto_583276 ?auto_583275 ) ( not ( = ?auto_583275 ?auto_583276 ) ) ( not ( = ?auto_583275 ?auto_583277 ) ) ( ON ?auto_583268 ?auto_583267 ) ( ON ?auto_583269 ?auto_583268 ) ( ON ?auto_583266 ?auto_583269 ) ( ON ?auto_583270 ?auto_583266 ) ( ON ?auto_583272 ?auto_583270 ) ( ON ?auto_583271 ?auto_583272 ) ( ON ?auto_583273 ?auto_583271 ) ( ON ?auto_583274 ?auto_583273 ) ( ON ?auto_583275 ?auto_583274 ) ( not ( = ?auto_583267 ?auto_583268 ) ) ( not ( = ?auto_583267 ?auto_583269 ) ) ( not ( = ?auto_583267 ?auto_583266 ) ) ( not ( = ?auto_583267 ?auto_583270 ) ) ( not ( = ?auto_583267 ?auto_583272 ) ) ( not ( = ?auto_583267 ?auto_583271 ) ) ( not ( = ?auto_583267 ?auto_583273 ) ) ( not ( = ?auto_583267 ?auto_583274 ) ) ( not ( = ?auto_583267 ?auto_583275 ) ) ( not ( = ?auto_583267 ?auto_583276 ) ) ( not ( = ?auto_583267 ?auto_583277 ) ) ( not ( = ?auto_583268 ?auto_583269 ) ) ( not ( = ?auto_583268 ?auto_583266 ) ) ( not ( = ?auto_583268 ?auto_583270 ) ) ( not ( = ?auto_583268 ?auto_583272 ) ) ( not ( = ?auto_583268 ?auto_583271 ) ) ( not ( = ?auto_583268 ?auto_583273 ) ) ( not ( = ?auto_583268 ?auto_583274 ) ) ( not ( = ?auto_583268 ?auto_583275 ) ) ( not ( = ?auto_583268 ?auto_583276 ) ) ( not ( = ?auto_583268 ?auto_583277 ) ) ( not ( = ?auto_583269 ?auto_583266 ) ) ( not ( = ?auto_583269 ?auto_583270 ) ) ( not ( = ?auto_583269 ?auto_583272 ) ) ( not ( = ?auto_583269 ?auto_583271 ) ) ( not ( = ?auto_583269 ?auto_583273 ) ) ( not ( = ?auto_583269 ?auto_583274 ) ) ( not ( = ?auto_583269 ?auto_583275 ) ) ( not ( = ?auto_583269 ?auto_583276 ) ) ( not ( = ?auto_583269 ?auto_583277 ) ) ( not ( = ?auto_583266 ?auto_583270 ) ) ( not ( = ?auto_583266 ?auto_583272 ) ) ( not ( = ?auto_583266 ?auto_583271 ) ) ( not ( = ?auto_583266 ?auto_583273 ) ) ( not ( = ?auto_583266 ?auto_583274 ) ) ( not ( = ?auto_583266 ?auto_583275 ) ) ( not ( = ?auto_583266 ?auto_583276 ) ) ( not ( = ?auto_583266 ?auto_583277 ) ) ( not ( = ?auto_583270 ?auto_583272 ) ) ( not ( = ?auto_583270 ?auto_583271 ) ) ( not ( = ?auto_583270 ?auto_583273 ) ) ( not ( = ?auto_583270 ?auto_583274 ) ) ( not ( = ?auto_583270 ?auto_583275 ) ) ( not ( = ?auto_583270 ?auto_583276 ) ) ( not ( = ?auto_583270 ?auto_583277 ) ) ( not ( = ?auto_583272 ?auto_583271 ) ) ( not ( = ?auto_583272 ?auto_583273 ) ) ( not ( = ?auto_583272 ?auto_583274 ) ) ( not ( = ?auto_583272 ?auto_583275 ) ) ( not ( = ?auto_583272 ?auto_583276 ) ) ( not ( = ?auto_583272 ?auto_583277 ) ) ( not ( = ?auto_583271 ?auto_583273 ) ) ( not ( = ?auto_583271 ?auto_583274 ) ) ( not ( = ?auto_583271 ?auto_583275 ) ) ( not ( = ?auto_583271 ?auto_583276 ) ) ( not ( = ?auto_583271 ?auto_583277 ) ) ( not ( = ?auto_583273 ?auto_583274 ) ) ( not ( = ?auto_583273 ?auto_583275 ) ) ( not ( = ?auto_583273 ?auto_583276 ) ) ( not ( = ?auto_583273 ?auto_583277 ) ) ( not ( = ?auto_583274 ?auto_583275 ) ) ( not ( = ?auto_583274 ?auto_583276 ) ) ( not ( = ?auto_583274 ?auto_583277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583275 ?auto_583276 ?auto_583277 )
      ( MAKE-11CRATE-VERIFY ?auto_583267 ?auto_583268 ?auto_583269 ?auto_583266 ?auto_583270 ?auto_583272 ?auto_583271 ?auto_583273 ?auto_583274 ?auto_583275 ?auto_583276 ?auto_583277 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583388 - SURFACE
      ?auto_583389 - SURFACE
      ?auto_583390 - SURFACE
      ?auto_583387 - SURFACE
      ?auto_583391 - SURFACE
      ?auto_583393 - SURFACE
      ?auto_583392 - SURFACE
      ?auto_583394 - SURFACE
      ?auto_583395 - SURFACE
      ?auto_583396 - SURFACE
      ?auto_583397 - SURFACE
      ?auto_583398 - SURFACE
    )
    :vars
    (
      ?auto_583399 - HOIST
      ?auto_583401 - PLACE
      ?auto_583400 - TRUCK
      ?auto_583402 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_583399 ?auto_583401 ) ( SURFACE-AT ?auto_583397 ?auto_583401 ) ( CLEAR ?auto_583397 ) ( IS-CRATE ?auto_583398 ) ( not ( = ?auto_583397 ?auto_583398 ) ) ( AVAILABLE ?auto_583399 ) ( IN ?auto_583398 ?auto_583400 ) ( ON ?auto_583397 ?auto_583396 ) ( not ( = ?auto_583396 ?auto_583397 ) ) ( not ( = ?auto_583396 ?auto_583398 ) ) ( TRUCK-AT ?auto_583400 ?auto_583402 ) ( not ( = ?auto_583402 ?auto_583401 ) ) ( ON ?auto_583389 ?auto_583388 ) ( ON ?auto_583390 ?auto_583389 ) ( ON ?auto_583387 ?auto_583390 ) ( ON ?auto_583391 ?auto_583387 ) ( ON ?auto_583393 ?auto_583391 ) ( ON ?auto_583392 ?auto_583393 ) ( ON ?auto_583394 ?auto_583392 ) ( ON ?auto_583395 ?auto_583394 ) ( ON ?auto_583396 ?auto_583395 ) ( not ( = ?auto_583388 ?auto_583389 ) ) ( not ( = ?auto_583388 ?auto_583390 ) ) ( not ( = ?auto_583388 ?auto_583387 ) ) ( not ( = ?auto_583388 ?auto_583391 ) ) ( not ( = ?auto_583388 ?auto_583393 ) ) ( not ( = ?auto_583388 ?auto_583392 ) ) ( not ( = ?auto_583388 ?auto_583394 ) ) ( not ( = ?auto_583388 ?auto_583395 ) ) ( not ( = ?auto_583388 ?auto_583396 ) ) ( not ( = ?auto_583388 ?auto_583397 ) ) ( not ( = ?auto_583388 ?auto_583398 ) ) ( not ( = ?auto_583389 ?auto_583390 ) ) ( not ( = ?auto_583389 ?auto_583387 ) ) ( not ( = ?auto_583389 ?auto_583391 ) ) ( not ( = ?auto_583389 ?auto_583393 ) ) ( not ( = ?auto_583389 ?auto_583392 ) ) ( not ( = ?auto_583389 ?auto_583394 ) ) ( not ( = ?auto_583389 ?auto_583395 ) ) ( not ( = ?auto_583389 ?auto_583396 ) ) ( not ( = ?auto_583389 ?auto_583397 ) ) ( not ( = ?auto_583389 ?auto_583398 ) ) ( not ( = ?auto_583390 ?auto_583387 ) ) ( not ( = ?auto_583390 ?auto_583391 ) ) ( not ( = ?auto_583390 ?auto_583393 ) ) ( not ( = ?auto_583390 ?auto_583392 ) ) ( not ( = ?auto_583390 ?auto_583394 ) ) ( not ( = ?auto_583390 ?auto_583395 ) ) ( not ( = ?auto_583390 ?auto_583396 ) ) ( not ( = ?auto_583390 ?auto_583397 ) ) ( not ( = ?auto_583390 ?auto_583398 ) ) ( not ( = ?auto_583387 ?auto_583391 ) ) ( not ( = ?auto_583387 ?auto_583393 ) ) ( not ( = ?auto_583387 ?auto_583392 ) ) ( not ( = ?auto_583387 ?auto_583394 ) ) ( not ( = ?auto_583387 ?auto_583395 ) ) ( not ( = ?auto_583387 ?auto_583396 ) ) ( not ( = ?auto_583387 ?auto_583397 ) ) ( not ( = ?auto_583387 ?auto_583398 ) ) ( not ( = ?auto_583391 ?auto_583393 ) ) ( not ( = ?auto_583391 ?auto_583392 ) ) ( not ( = ?auto_583391 ?auto_583394 ) ) ( not ( = ?auto_583391 ?auto_583395 ) ) ( not ( = ?auto_583391 ?auto_583396 ) ) ( not ( = ?auto_583391 ?auto_583397 ) ) ( not ( = ?auto_583391 ?auto_583398 ) ) ( not ( = ?auto_583393 ?auto_583392 ) ) ( not ( = ?auto_583393 ?auto_583394 ) ) ( not ( = ?auto_583393 ?auto_583395 ) ) ( not ( = ?auto_583393 ?auto_583396 ) ) ( not ( = ?auto_583393 ?auto_583397 ) ) ( not ( = ?auto_583393 ?auto_583398 ) ) ( not ( = ?auto_583392 ?auto_583394 ) ) ( not ( = ?auto_583392 ?auto_583395 ) ) ( not ( = ?auto_583392 ?auto_583396 ) ) ( not ( = ?auto_583392 ?auto_583397 ) ) ( not ( = ?auto_583392 ?auto_583398 ) ) ( not ( = ?auto_583394 ?auto_583395 ) ) ( not ( = ?auto_583394 ?auto_583396 ) ) ( not ( = ?auto_583394 ?auto_583397 ) ) ( not ( = ?auto_583394 ?auto_583398 ) ) ( not ( = ?auto_583395 ?auto_583396 ) ) ( not ( = ?auto_583395 ?auto_583397 ) ) ( not ( = ?auto_583395 ?auto_583398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583396 ?auto_583397 ?auto_583398 )
      ( MAKE-11CRATE-VERIFY ?auto_583388 ?auto_583389 ?auto_583390 ?auto_583387 ?auto_583391 ?auto_583393 ?auto_583392 ?auto_583394 ?auto_583395 ?auto_583396 ?auto_583397 ?auto_583398 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583520 - SURFACE
      ?auto_583521 - SURFACE
      ?auto_583522 - SURFACE
      ?auto_583519 - SURFACE
      ?auto_583523 - SURFACE
      ?auto_583525 - SURFACE
      ?auto_583524 - SURFACE
      ?auto_583526 - SURFACE
      ?auto_583527 - SURFACE
      ?auto_583528 - SURFACE
      ?auto_583529 - SURFACE
      ?auto_583530 - SURFACE
    )
    :vars
    (
      ?auto_583532 - HOIST
      ?auto_583531 - PLACE
      ?auto_583534 - TRUCK
      ?auto_583535 - PLACE
      ?auto_583533 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_583532 ?auto_583531 ) ( SURFACE-AT ?auto_583529 ?auto_583531 ) ( CLEAR ?auto_583529 ) ( IS-CRATE ?auto_583530 ) ( not ( = ?auto_583529 ?auto_583530 ) ) ( AVAILABLE ?auto_583532 ) ( ON ?auto_583529 ?auto_583528 ) ( not ( = ?auto_583528 ?auto_583529 ) ) ( not ( = ?auto_583528 ?auto_583530 ) ) ( TRUCK-AT ?auto_583534 ?auto_583535 ) ( not ( = ?auto_583535 ?auto_583531 ) ) ( HOIST-AT ?auto_583533 ?auto_583535 ) ( LIFTING ?auto_583533 ?auto_583530 ) ( not ( = ?auto_583532 ?auto_583533 ) ) ( ON ?auto_583521 ?auto_583520 ) ( ON ?auto_583522 ?auto_583521 ) ( ON ?auto_583519 ?auto_583522 ) ( ON ?auto_583523 ?auto_583519 ) ( ON ?auto_583525 ?auto_583523 ) ( ON ?auto_583524 ?auto_583525 ) ( ON ?auto_583526 ?auto_583524 ) ( ON ?auto_583527 ?auto_583526 ) ( ON ?auto_583528 ?auto_583527 ) ( not ( = ?auto_583520 ?auto_583521 ) ) ( not ( = ?auto_583520 ?auto_583522 ) ) ( not ( = ?auto_583520 ?auto_583519 ) ) ( not ( = ?auto_583520 ?auto_583523 ) ) ( not ( = ?auto_583520 ?auto_583525 ) ) ( not ( = ?auto_583520 ?auto_583524 ) ) ( not ( = ?auto_583520 ?auto_583526 ) ) ( not ( = ?auto_583520 ?auto_583527 ) ) ( not ( = ?auto_583520 ?auto_583528 ) ) ( not ( = ?auto_583520 ?auto_583529 ) ) ( not ( = ?auto_583520 ?auto_583530 ) ) ( not ( = ?auto_583521 ?auto_583522 ) ) ( not ( = ?auto_583521 ?auto_583519 ) ) ( not ( = ?auto_583521 ?auto_583523 ) ) ( not ( = ?auto_583521 ?auto_583525 ) ) ( not ( = ?auto_583521 ?auto_583524 ) ) ( not ( = ?auto_583521 ?auto_583526 ) ) ( not ( = ?auto_583521 ?auto_583527 ) ) ( not ( = ?auto_583521 ?auto_583528 ) ) ( not ( = ?auto_583521 ?auto_583529 ) ) ( not ( = ?auto_583521 ?auto_583530 ) ) ( not ( = ?auto_583522 ?auto_583519 ) ) ( not ( = ?auto_583522 ?auto_583523 ) ) ( not ( = ?auto_583522 ?auto_583525 ) ) ( not ( = ?auto_583522 ?auto_583524 ) ) ( not ( = ?auto_583522 ?auto_583526 ) ) ( not ( = ?auto_583522 ?auto_583527 ) ) ( not ( = ?auto_583522 ?auto_583528 ) ) ( not ( = ?auto_583522 ?auto_583529 ) ) ( not ( = ?auto_583522 ?auto_583530 ) ) ( not ( = ?auto_583519 ?auto_583523 ) ) ( not ( = ?auto_583519 ?auto_583525 ) ) ( not ( = ?auto_583519 ?auto_583524 ) ) ( not ( = ?auto_583519 ?auto_583526 ) ) ( not ( = ?auto_583519 ?auto_583527 ) ) ( not ( = ?auto_583519 ?auto_583528 ) ) ( not ( = ?auto_583519 ?auto_583529 ) ) ( not ( = ?auto_583519 ?auto_583530 ) ) ( not ( = ?auto_583523 ?auto_583525 ) ) ( not ( = ?auto_583523 ?auto_583524 ) ) ( not ( = ?auto_583523 ?auto_583526 ) ) ( not ( = ?auto_583523 ?auto_583527 ) ) ( not ( = ?auto_583523 ?auto_583528 ) ) ( not ( = ?auto_583523 ?auto_583529 ) ) ( not ( = ?auto_583523 ?auto_583530 ) ) ( not ( = ?auto_583525 ?auto_583524 ) ) ( not ( = ?auto_583525 ?auto_583526 ) ) ( not ( = ?auto_583525 ?auto_583527 ) ) ( not ( = ?auto_583525 ?auto_583528 ) ) ( not ( = ?auto_583525 ?auto_583529 ) ) ( not ( = ?auto_583525 ?auto_583530 ) ) ( not ( = ?auto_583524 ?auto_583526 ) ) ( not ( = ?auto_583524 ?auto_583527 ) ) ( not ( = ?auto_583524 ?auto_583528 ) ) ( not ( = ?auto_583524 ?auto_583529 ) ) ( not ( = ?auto_583524 ?auto_583530 ) ) ( not ( = ?auto_583526 ?auto_583527 ) ) ( not ( = ?auto_583526 ?auto_583528 ) ) ( not ( = ?auto_583526 ?auto_583529 ) ) ( not ( = ?auto_583526 ?auto_583530 ) ) ( not ( = ?auto_583527 ?auto_583528 ) ) ( not ( = ?auto_583527 ?auto_583529 ) ) ( not ( = ?auto_583527 ?auto_583530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583528 ?auto_583529 ?auto_583530 )
      ( MAKE-11CRATE-VERIFY ?auto_583520 ?auto_583521 ?auto_583522 ?auto_583519 ?auto_583523 ?auto_583525 ?auto_583524 ?auto_583526 ?auto_583527 ?auto_583528 ?auto_583529 ?auto_583530 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583663 - SURFACE
      ?auto_583664 - SURFACE
      ?auto_583665 - SURFACE
      ?auto_583662 - SURFACE
      ?auto_583666 - SURFACE
      ?auto_583668 - SURFACE
      ?auto_583667 - SURFACE
      ?auto_583669 - SURFACE
      ?auto_583670 - SURFACE
      ?auto_583671 - SURFACE
      ?auto_583672 - SURFACE
      ?auto_583673 - SURFACE
    )
    :vars
    (
      ?auto_583677 - HOIST
      ?auto_583678 - PLACE
      ?auto_583679 - TRUCK
      ?auto_583675 - PLACE
      ?auto_583676 - HOIST
      ?auto_583674 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_583677 ?auto_583678 ) ( SURFACE-AT ?auto_583672 ?auto_583678 ) ( CLEAR ?auto_583672 ) ( IS-CRATE ?auto_583673 ) ( not ( = ?auto_583672 ?auto_583673 ) ) ( AVAILABLE ?auto_583677 ) ( ON ?auto_583672 ?auto_583671 ) ( not ( = ?auto_583671 ?auto_583672 ) ) ( not ( = ?auto_583671 ?auto_583673 ) ) ( TRUCK-AT ?auto_583679 ?auto_583675 ) ( not ( = ?auto_583675 ?auto_583678 ) ) ( HOIST-AT ?auto_583676 ?auto_583675 ) ( not ( = ?auto_583677 ?auto_583676 ) ) ( AVAILABLE ?auto_583676 ) ( SURFACE-AT ?auto_583673 ?auto_583675 ) ( ON ?auto_583673 ?auto_583674 ) ( CLEAR ?auto_583673 ) ( not ( = ?auto_583672 ?auto_583674 ) ) ( not ( = ?auto_583673 ?auto_583674 ) ) ( not ( = ?auto_583671 ?auto_583674 ) ) ( ON ?auto_583664 ?auto_583663 ) ( ON ?auto_583665 ?auto_583664 ) ( ON ?auto_583662 ?auto_583665 ) ( ON ?auto_583666 ?auto_583662 ) ( ON ?auto_583668 ?auto_583666 ) ( ON ?auto_583667 ?auto_583668 ) ( ON ?auto_583669 ?auto_583667 ) ( ON ?auto_583670 ?auto_583669 ) ( ON ?auto_583671 ?auto_583670 ) ( not ( = ?auto_583663 ?auto_583664 ) ) ( not ( = ?auto_583663 ?auto_583665 ) ) ( not ( = ?auto_583663 ?auto_583662 ) ) ( not ( = ?auto_583663 ?auto_583666 ) ) ( not ( = ?auto_583663 ?auto_583668 ) ) ( not ( = ?auto_583663 ?auto_583667 ) ) ( not ( = ?auto_583663 ?auto_583669 ) ) ( not ( = ?auto_583663 ?auto_583670 ) ) ( not ( = ?auto_583663 ?auto_583671 ) ) ( not ( = ?auto_583663 ?auto_583672 ) ) ( not ( = ?auto_583663 ?auto_583673 ) ) ( not ( = ?auto_583663 ?auto_583674 ) ) ( not ( = ?auto_583664 ?auto_583665 ) ) ( not ( = ?auto_583664 ?auto_583662 ) ) ( not ( = ?auto_583664 ?auto_583666 ) ) ( not ( = ?auto_583664 ?auto_583668 ) ) ( not ( = ?auto_583664 ?auto_583667 ) ) ( not ( = ?auto_583664 ?auto_583669 ) ) ( not ( = ?auto_583664 ?auto_583670 ) ) ( not ( = ?auto_583664 ?auto_583671 ) ) ( not ( = ?auto_583664 ?auto_583672 ) ) ( not ( = ?auto_583664 ?auto_583673 ) ) ( not ( = ?auto_583664 ?auto_583674 ) ) ( not ( = ?auto_583665 ?auto_583662 ) ) ( not ( = ?auto_583665 ?auto_583666 ) ) ( not ( = ?auto_583665 ?auto_583668 ) ) ( not ( = ?auto_583665 ?auto_583667 ) ) ( not ( = ?auto_583665 ?auto_583669 ) ) ( not ( = ?auto_583665 ?auto_583670 ) ) ( not ( = ?auto_583665 ?auto_583671 ) ) ( not ( = ?auto_583665 ?auto_583672 ) ) ( not ( = ?auto_583665 ?auto_583673 ) ) ( not ( = ?auto_583665 ?auto_583674 ) ) ( not ( = ?auto_583662 ?auto_583666 ) ) ( not ( = ?auto_583662 ?auto_583668 ) ) ( not ( = ?auto_583662 ?auto_583667 ) ) ( not ( = ?auto_583662 ?auto_583669 ) ) ( not ( = ?auto_583662 ?auto_583670 ) ) ( not ( = ?auto_583662 ?auto_583671 ) ) ( not ( = ?auto_583662 ?auto_583672 ) ) ( not ( = ?auto_583662 ?auto_583673 ) ) ( not ( = ?auto_583662 ?auto_583674 ) ) ( not ( = ?auto_583666 ?auto_583668 ) ) ( not ( = ?auto_583666 ?auto_583667 ) ) ( not ( = ?auto_583666 ?auto_583669 ) ) ( not ( = ?auto_583666 ?auto_583670 ) ) ( not ( = ?auto_583666 ?auto_583671 ) ) ( not ( = ?auto_583666 ?auto_583672 ) ) ( not ( = ?auto_583666 ?auto_583673 ) ) ( not ( = ?auto_583666 ?auto_583674 ) ) ( not ( = ?auto_583668 ?auto_583667 ) ) ( not ( = ?auto_583668 ?auto_583669 ) ) ( not ( = ?auto_583668 ?auto_583670 ) ) ( not ( = ?auto_583668 ?auto_583671 ) ) ( not ( = ?auto_583668 ?auto_583672 ) ) ( not ( = ?auto_583668 ?auto_583673 ) ) ( not ( = ?auto_583668 ?auto_583674 ) ) ( not ( = ?auto_583667 ?auto_583669 ) ) ( not ( = ?auto_583667 ?auto_583670 ) ) ( not ( = ?auto_583667 ?auto_583671 ) ) ( not ( = ?auto_583667 ?auto_583672 ) ) ( not ( = ?auto_583667 ?auto_583673 ) ) ( not ( = ?auto_583667 ?auto_583674 ) ) ( not ( = ?auto_583669 ?auto_583670 ) ) ( not ( = ?auto_583669 ?auto_583671 ) ) ( not ( = ?auto_583669 ?auto_583672 ) ) ( not ( = ?auto_583669 ?auto_583673 ) ) ( not ( = ?auto_583669 ?auto_583674 ) ) ( not ( = ?auto_583670 ?auto_583671 ) ) ( not ( = ?auto_583670 ?auto_583672 ) ) ( not ( = ?auto_583670 ?auto_583673 ) ) ( not ( = ?auto_583670 ?auto_583674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583671 ?auto_583672 ?auto_583673 )
      ( MAKE-11CRATE-VERIFY ?auto_583663 ?auto_583664 ?auto_583665 ?auto_583662 ?auto_583666 ?auto_583668 ?auto_583667 ?auto_583669 ?auto_583670 ?auto_583671 ?auto_583672 ?auto_583673 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583807 - SURFACE
      ?auto_583808 - SURFACE
      ?auto_583809 - SURFACE
      ?auto_583806 - SURFACE
      ?auto_583810 - SURFACE
      ?auto_583812 - SURFACE
      ?auto_583811 - SURFACE
      ?auto_583813 - SURFACE
      ?auto_583814 - SURFACE
      ?auto_583815 - SURFACE
      ?auto_583816 - SURFACE
      ?auto_583817 - SURFACE
    )
    :vars
    (
      ?auto_583820 - HOIST
      ?auto_583818 - PLACE
      ?auto_583821 - PLACE
      ?auto_583819 - HOIST
      ?auto_583823 - SURFACE
      ?auto_583822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_583820 ?auto_583818 ) ( SURFACE-AT ?auto_583816 ?auto_583818 ) ( CLEAR ?auto_583816 ) ( IS-CRATE ?auto_583817 ) ( not ( = ?auto_583816 ?auto_583817 ) ) ( AVAILABLE ?auto_583820 ) ( ON ?auto_583816 ?auto_583815 ) ( not ( = ?auto_583815 ?auto_583816 ) ) ( not ( = ?auto_583815 ?auto_583817 ) ) ( not ( = ?auto_583821 ?auto_583818 ) ) ( HOIST-AT ?auto_583819 ?auto_583821 ) ( not ( = ?auto_583820 ?auto_583819 ) ) ( AVAILABLE ?auto_583819 ) ( SURFACE-AT ?auto_583817 ?auto_583821 ) ( ON ?auto_583817 ?auto_583823 ) ( CLEAR ?auto_583817 ) ( not ( = ?auto_583816 ?auto_583823 ) ) ( not ( = ?auto_583817 ?auto_583823 ) ) ( not ( = ?auto_583815 ?auto_583823 ) ) ( TRUCK-AT ?auto_583822 ?auto_583818 ) ( ON ?auto_583808 ?auto_583807 ) ( ON ?auto_583809 ?auto_583808 ) ( ON ?auto_583806 ?auto_583809 ) ( ON ?auto_583810 ?auto_583806 ) ( ON ?auto_583812 ?auto_583810 ) ( ON ?auto_583811 ?auto_583812 ) ( ON ?auto_583813 ?auto_583811 ) ( ON ?auto_583814 ?auto_583813 ) ( ON ?auto_583815 ?auto_583814 ) ( not ( = ?auto_583807 ?auto_583808 ) ) ( not ( = ?auto_583807 ?auto_583809 ) ) ( not ( = ?auto_583807 ?auto_583806 ) ) ( not ( = ?auto_583807 ?auto_583810 ) ) ( not ( = ?auto_583807 ?auto_583812 ) ) ( not ( = ?auto_583807 ?auto_583811 ) ) ( not ( = ?auto_583807 ?auto_583813 ) ) ( not ( = ?auto_583807 ?auto_583814 ) ) ( not ( = ?auto_583807 ?auto_583815 ) ) ( not ( = ?auto_583807 ?auto_583816 ) ) ( not ( = ?auto_583807 ?auto_583817 ) ) ( not ( = ?auto_583807 ?auto_583823 ) ) ( not ( = ?auto_583808 ?auto_583809 ) ) ( not ( = ?auto_583808 ?auto_583806 ) ) ( not ( = ?auto_583808 ?auto_583810 ) ) ( not ( = ?auto_583808 ?auto_583812 ) ) ( not ( = ?auto_583808 ?auto_583811 ) ) ( not ( = ?auto_583808 ?auto_583813 ) ) ( not ( = ?auto_583808 ?auto_583814 ) ) ( not ( = ?auto_583808 ?auto_583815 ) ) ( not ( = ?auto_583808 ?auto_583816 ) ) ( not ( = ?auto_583808 ?auto_583817 ) ) ( not ( = ?auto_583808 ?auto_583823 ) ) ( not ( = ?auto_583809 ?auto_583806 ) ) ( not ( = ?auto_583809 ?auto_583810 ) ) ( not ( = ?auto_583809 ?auto_583812 ) ) ( not ( = ?auto_583809 ?auto_583811 ) ) ( not ( = ?auto_583809 ?auto_583813 ) ) ( not ( = ?auto_583809 ?auto_583814 ) ) ( not ( = ?auto_583809 ?auto_583815 ) ) ( not ( = ?auto_583809 ?auto_583816 ) ) ( not ( = ?auto_583809 ?auto_583817 ) ) ( not ( = ?auto_583809 ?auto_583823 ) ) ( not ( = ?auto_583806 ?auto_583810 ) ) ( not ( = ?auto_583806 ?auto_583812 ) ) ( not ( = ?auto_583806 ?auto_583811 ) ) ( not ( = ?auto_583806 ?auto_583813 ) ) ( not ( = ?auto_583806 ?auto_583814 ) ) ( not ( = ?auto_583806 ?auto_583815 ) ) ( not ( = ?auto_583806 ?auto_583816 ) ) ( not ( = ?auto_583806 ?auto_583817 ) ) ( not ( = ?auto_583806 ?auto_583823 ) ) ( not ( = ?auto_583810 ?auto_583812 ) ) ( not ( = ?auto_583810 ?auto_583811 ) ) ( not ( = ?auto_583810 ?auto_583813 ) ) ( not ( = ?auto_583810 ?auto_583814 ) ) ( not ( = ?auto_583810 ?auto_583815 ) ) ( not ( = ?auto_583810 ?auto_583816 ) ) ( not ( = ?auto_583810 ?auto_583817 ) ) ( not ( = ?auto_583810 ?auto_583823 ) ) ( not ( = ?auto_583812 ?auto_583811 ) ) ( not ( = ?auto_583812 ?auto_583813 ) ) ( not ( = ?auto_583812 ?auto_583814 ) ) ( not ( = ?auto_583812 ?auto_583815 ) ) ( not ( = ?auto_583812 ?auto_583816 ) ) ( not ( = ?auto_583812 ?auto_583817 ) ) ( not ( = ?auto_583812 ?auto_583823 ) ) ( not ( = ?auto_583811 ?auto_583813 ) ) ( not ( = ?auto_583811 ?auto_583814 ) ) ( not ( = ?auto_583811 ?auto_583815 ) ) ( not ( = ?auto_583811 ?auto_583816 ) ) ( not ( = ?auto_583811 ?auto_583817 ) ) ( not ( = ?auto_583811 ?auto_583823 ) ) ( not ( = ?auto_583813 ?auto_583814 ) ) ( not ( = ?auto_583813 ?auto_583815 ) ) ( not ( = ?auto_583813 ?auto_583816 ) ) ( not ( = ?auto_583813 ?auto_583817 ) ) ( not ( = ?auto_583813 ?auto_583823 ) ) ( not ( = ?auto_583814 ?auto_583815 ) ) ( not ( = ?auto_583814 ?auto_583816 ) ) ( not ( = ?auto_583814 ?auto_583817 ) ) ( not ( = ?auto_583814 ?auto_583823 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583815 ?auto_583816 ?auto_583817 )
      ( MAKE-11CRATE-VERIFY ?auto_583807 ?auto_583808 ?auto_583809 ?auto_583806 ?auto_583810 ?auto_583812 ?auto_583811 ?auto_583813 ?auto_583814 ?auto_583815 ?auto_583816 ?auto_583817 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583951 - SURFACE
      ?auto_583952 - SURFACE
      ?auto_583953 - SURFACE
      ?auto_583950 - SURFACE
      ?auto_583954 - SURFACE
      ?auto_583956 - SURFACE
      ?auto_583955 - SURFACE
      ?auto_583957 - SURFACE
      ?auto_583958 - SURFACE
      ?auto_583959 - SURFACE
      ?auto_583960 - SURFACE
      ?auto_583961 - SURFACE
    )
    :vars
    (
      ?auto_583962 - HOIST
      ?auto_583964 - PLACE
      ?auto_583963 - PLACE
      ?auto_583966 - HOIST
      ?auto_583965 - SURFACE
      ?auto_583967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_583962 ?auto_583964 ) ( IS-CRATE ?auto_583961 ) ( not ( = ?auto_583960 ?auto_583961 ) ) ( not ( = ?auto_583959 ?auto_583960 ) ) ( not ( = ?auto_583959 ?auto_583961 ) ) ( not ( = ?auto_583963 ?auto_583964 ) ) ( HOIST-AT ?auto_583966 ?auto_583963 ) ( not ( = ?auto_583962 ?auto_583966 ) ) ( AVAILABLE ?auto_583966 ) ( SURFACE-AT ?auto_583961 ?auto_583963 ) ( ON ?auto_583961 ?auto_583965 ) ( CLEAR ?auto_583961 ) ( not ( = ?auto_583960 ?auto_583965 ) ) ( not ( = ?auto_583961 ?auto_583965 ) ) ( not ( = ?auto_583959 ?auto_583965 ) ) ( TRUCK-AT ?auto_583967 ?auto_583964 ) ( SURFACE-AT ?auto_583959 ?auto_583964 ) ( CLEAR ?auto_583959 ) ( LIFTING ?auto_583962 ?auto_583960 ) ( IS-CRATE ?auto_583960 ) ( ON ?auto_583952 ?auto_583951 ) ( ON ?auto_583953 ?auto_583952 ) ( ON ?auto_583950 ?auto_583953 ) ( ON ?auto_583954 ?auto_583950 ) ( ON ?auto_583956 ?auto_583954 ) ( ON ?auto_583955 ?auto_583956 ) ( ON ?auto_583957 ?auto_583955 ) ( ON ?auto_583958 ?auto_583957 ) ( ON ?auto_583959 ?auto_583958 ) ( not ( = ?auto_583951 ?auto_583952 ) ) ( not ( = ?auto_583951 ?auto_583953 ) ) ( not ( = ?auto_583951 ?auto_583950 ) ) ( not ( = ?auto_583951 ?auto_583954 ) ) ( not ( = ?auto_583951 ?auto_583956 ) ) ( not ( = ?auto_583951 ?auto_583955 ) ) ( not ( = ?auto_583951 ?auto_583957 ) ) ( not ( = ?auto_583951 ?auto_583958 ) ) ( not ( = ?auto_583951 ?auto_583959 ) ) ( not ( = ?auto_583951 ?auto_583960 ) ) ( not ( = ?auto_583951 ?auto_583961 ) ) ( not ( = ?auto_583951 ?auto_583965 ) ) ( not ( = ?auto_583952 ?auto_583953 ) ) ( not ( = ?auto_583952 ?auto_583950 ) ) ( not ( = ?auto_583952 ?auto_583954 ) ) ( not ( = ?auto_583952 ?auto_583956 ) ) ( not ( = ?auto_583952 ?auto_583955 ) ) ( not ( = ?auto_583952 ?auto_583957 ) ) ( not ( = ?auto_583952 ?auto_583958 ) ) ( not ( = ?auto_583952 ?auto_583959 ) ) ( not ( = ?auto_583952 ?auto_583960 ) ) ( not ( = ?auto_583952 ?auto_583961 ) ) ( not ( = ?auto_583952 ?auto_583965 ) ) ( not ( = ?auto_583953 ?auto_583950 ) ) ( not ( = ?auto_583953 ?auto_583954 ) ) ( not ( = ?auto_583953 ?auto_583956 ) ) ( not ( = ?auto_583953 ?auto_583955 ) ) ( not ( = ?auto_583953 ?auto_583957 ) ) ( not ( = ?auto_583953 ?auto_583958 ) ) ( not ( = ?auto_583953 ?auto_583959 ) ) ( not ( = ?auto_583953 ?auto_583960 ) ) ( not ( = ?auto_583953 ?auto_583961 ) ) ( not ( = ?auto_583953 ?auto_583965 ) ) ( not ( = ?auto_583950 ?auto_583954 ) ) ( not ( = ?auto_583950 ?auto_583956 ) ) ( not ( = ?auto_583950 ?auto_583955 ) ) ( not ( = ?auto_583950 ?auto_583957 ) ) ( not ( = ?auto_583950 ?auto_583958 ) ) ( not ( = ?auto_583950 ?auto_583959 ) ) ( not ( = ?auto_583950 ?auto_583960 ) ) ( not ( = ?auto_583950 ?auto_583961 ) ) ( not ( = ?auto_583950 ?auto_583965 ) ) ( not ( = ?auto_583954 ?auto_583956 ) ) ( not ( = ?auto_583954 ?auto_583955 ) ) ( not ( = ?auto_583954 ?auto_583957 ) ) ( not ( = ?auto_583954 ?auto_583958 ) ) ( not ( = ?auto_583954 ?auto_583959 ) ) ( not ( = ?auto_583954 ?auto_583960 ) ) ( not ( = ?auto_583954 ?auto_583961 ) ) ( not ( = ?auto_583954 ?auto_583965 ) ) ( not ( = ?auto_583956 ?auto_583955 ) ) ( not ( = ?auto_583956 ?auto_583957 ) ) ( not ( = ?auto_583956 ?auto_583958 ) ) ( not ( = ?auto_583956 ?auto_583959 ) ) ( not ( = ?auto_583956 ?auto_583960 ) ) ( not ( = ?auto_583956 ?auto_583961 ) ) ( not ( = ?auto_583956 ?auto_583965 ) ) ( not ( = ?auto_583955 ?auto_583957 ) ) ( not ( = ?auto_583955 ?auto_583958 ) ) ( not ( = ?auto_583955 ?auto_583959 ) ) ( not ( = ?auto_583955 ?auto_583960 ) ) ( not ( = ?auto_583955 ?auto_583961 ) ) ( not ( = ?auto_583955 ?auto_583965 ) ) ( not ( = ?auto_583957 ?auto_583958 ) ) ( not ( = ?auto_583957 ?auto_583959 ) ) ( not ( = ?auto_583957 ?auto_583960 ) ) ( not ( = ?auto_583957 ?auto_583961 ) ) ( not ( = ?auto_583957 ?auto_583965 ) ) ( not ( = ?auto_583958 ?auto_583959 ) ) ( not ( = ?auto_583958 ?auto_583960 ) ) ( not ( = ?auto_583958 ?auto_583961 ) ) ( not ( = ?auto_583958 ?auto_583965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583959 ?auto_583960 ?auto_583961 )
      ( MAKE-11CRATE-VERIFY ?auto_583951 ?auto_583952 ?auto_583953 ?auto_583950 ?auto_583954 ?auto_583956 ?auto_583955 ?auto_583957 ?auto_583958 ?auto_583959 ?auto_583960 ?auto_583961 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_584095 - SURFACE
      ?auto_584096 - SURFACE
      ?auto_584097 - SURFACE
      ?auto_584094 - SURFACE
      ?auto_584098 - SURFACE
      ?auto_584100 - SURFACE
      ?auto_584099 - SURFACE
      ?auto_584101 - SURFACE
      ?auto_584102 - SURFACE
      ?auto_584103 - SURFACE
      ?auto_584104 - SURFACE
      ?auto_584105 - SURFACE
    )
    :vars
    (
      ?auto_584110 - HOIST
      ?auto_584106 - PLACE
      ?auto_584107 - PLACE
      ?auto_584109 - HOIST
      ?auto_584111 - SURFACE
      ?auto_584108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_584110 ?auto_584106 ) ( IS-CRATE ?auto_584105 ) ( not ( = ?auto_584104 ?auto_584105 ) ) ( not ( = ?auto_584103 ?auto_584104 ) ) ( not ( = ?auto_584103 ?auto_584105 ) ) ( not ( = ?auto_584107 ?auto_584106 ) ) ( HOIST-AT ?auto_584109 ?auto_584107 ) ( not ( = ?auto_584110 ?auto_584109 ) ) ( AVAILABLE ?auto_584109 ) ( SURFACE-AT ?auto_584105 ?auto_584107 ) ( ON ?auto_584105 ?auto_584111 ) ( CLEAR ?auto_584105 ) ( not ( = ?auto_584104 ?auto_584111 ) ) ( not ( = ?auto_584105 ?auto_584111 ) ) ( not ( = ?auto_584103 ?auto_584111 ) ) ( TRUCK-AT ?auto_584108 ?auto_584106 ) ( SURFACE-AT ?auto_584103 ?auto_584106 ) ( CLEAR ?auto_584103 ) ( IS-CRATE ?auto_584104 ) ( AVAILABLE ?auto_584110 ) ( IN ?auto_584104 ?auto_584108 ) ( ON ?auto_584096 ?auto_584095 ) ( ON ?auto_584097 ?auto_584096 ) ( ON ?auto_584094 ?auto_584097 ) ( ON ?auto_584098 ?auto_584094 ) ( ON ?auto_584100 ?auto_584098 ) ( ON ?auto_584099 ?auto_584100 ) ( ON ?auto_584101 ?auto_584099 ) ( ON ?auto_584102 ?auto_584101 ) ( ON ?auto_584103 ?auto_584102 ) ( not ( = ?auto_584095 ?auto_584096 ) ) ( not ( = ?auto_584095 ?auto_584097 ) ) ( not ( = ?auto_584095 ?auto_584094 ) ) ( not ( = ?auto_584095 ?auto_584098 ) ) ( not ( = ?auto_584095 ?auto_584100 ) ) ( not ( = ?auto_584095 ?auto_584099 ) ) ( not ( = ?auto_584095 ?auto_584101 ) ) ( not ( = ?auto_584095 ?auto_584102 ) ) ( not ( = ?auto_584095 ?auto_584103 ) ) ( not ( = ?auto_584095 ?auto_584104 ) ) ( not ( = ?auto_584095 ?auto_584105 ) ) ( not ( = ?auto_584095 ?auto_584111 ) ) ( not ( = ?auto_584096 ?auto_584097 ) ) ( not ( = ?auto_584096 ?auto_584094 ) ) ( not ( = ?auto_584096 ?auto_584098 ) ) ( not ( = ?auto_584096 ?auto_584100 ) ) ( not ( = ?auto_584096 ?auto_584099 ) ) ( not ( = ?auto_584096 ?auto_584101 ) ) ( not ( = ?auto_584096 ?auto_584102 ) ) ( not ( = ?auto_584096 ?auto_584103 ) ) ( not ( = ?auto_584096 ?auto_584104 ) ) ( not ( = ?auto_584096 ?auto_584105 ) ) ( not ( = ?auto_584096 ?auto_584111 ) ) ( not ( = ?auto_584097 ?auto_584094 ) ) ( not ( = ?auto_584097 ?auto_584098 ) ) ( not ( = ?auto_584097 ?auto_584100 ) ) ( not ( = ?auto_584097 ?auto_584099 ) ) ( not ( = ?auto_584097 ?auto_584101 ) ) ( not ( = ?auto_584097 ?auto_584102 ) ) ( not ( = ?auto_584097 ?auto_584103 ) ) ( not ( = ?auto_584097 ?auto_584104 ) ) ( not ( = ?auto_584097 ?auto_584105 ) ) ( not ( = ?auto_584097 ?auto_584111 ) ) ( not ( = ?auto_584094 ?auto_584098 ) ) ( not ( = ?auto_584094 ?auto_584100 ) ) ( not ( = ?auto_584094 ?auto_584099 ) ) ( not ( = ?auto_584094 ?auto_584101 ) ) ( not ( = ?auto_584094 ?auto_584102 ) ) ( not ( = ?auto_584094 ?auto_584103 ) ) ( not ( = ?auto_584094 ?auto_584104 ) ) ( not ( = ?auto_584094 ?auto_584105 ) ) ( not ( = ?auto_584094 ?auto_584111 ) ) ( not ( = ?auto_584098 ?auto_584100 ) ) ( not ( = ?auto_584098 ?auto_584099 ) ) ( not ( = ?auto_584098 ?auto_584101 ) ) ( not ( = ?auto_584098 ?auto_584102 ) ) ( not ( = ?auto_584098 ?auto_584103 ) ) ( not ( = ?auto_584098 ?auto_584104 ) ) ( not ( = ?auto_584098 ?auto_584105 ) ) ( not ( = ?auto_584098 ?auto_584111 ) ) ( not ( = ?auto_584100 ?auto_584099 ) ) ( not ( = ?auto_584100 ?auto_584101 ) ) ( not ( = ?auto_584100 ?auto_584102 ) ) ( not ( = ?auto_584100 ?auto_584103 ) ) ( not ( = ?auto_584100 ?auto_584104 ) ) ( not ( = ?auto_584100 ?auto_584105 ) ) ( not ( = ?auto_584100 ?auto_584111 ) ) ( not ( = ?auto_584099 ?auto_584101 ) ) ( not ( = ?auto_584099 ?auto_584102 ) ) ( not ( = ?auto_584099 ?auto_584103 ) ) ( not ( = ?auto_584099 ?auto_584104 ) ) ( not ( = ?auto_584099 ?auto_584105 ) ) ( not ( = ?auto_584099 ?auto_584111 ) ) ( not ( = ?auto_584101 ?auto_584102 ) ) ( not ( = ?auto_584101 ?auto_584103 ) ) ( not ( = ?auto_584101 ?auto_584104 ) ) ( not ( = ?auto_584101 ?auto_584105 ) ) ( not ( = ?auto_584101 ?auto_584111 ) ) ( not ( = ?auto_584102 ?auto_584103 ) ) ( not ( = ?auto_584102 ?auto_584104 ) ) ( not ( = ?auto_584102 ?auto_584105 ) ) ( not ( = ?auto_584102 ?auto_584111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_584103 ?auto_584104 ?auto_584105 )
      ( MAKE-11CRATE-VERIFY ?auto_584095 ?auto_584096 ?auto_584097 ?auto_584094 ?auto_584098 ?auto_584100 ?auto_584099 ?auto_584101 ?auto_584102 ?auto_584103 ?auto_584104 ?auto_584105 ) )
  )

)

