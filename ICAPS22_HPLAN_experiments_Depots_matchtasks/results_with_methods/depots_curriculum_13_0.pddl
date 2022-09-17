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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13356 - SURFACE
      ?auto_13357 - SURFACE
    )
    :vars
    (
      ?auto_13358 - HOIST
      ?auto_13359 - PLACE
      ?auto_13361 - PLACE
      ?auto_13362 - HOIST
      ?auto_13363 - SURFACE
      ?auto_13360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13358 ?auto_13359 ) ( SURFACE-AT ?auto_13356 ?auto_13359 ) ( CLEAR ?auto_13356 ) ( IS-CRATE ?auto_13357 ) ( AVAILABLE ?auto_13358 ) ( not ( = ?auto_13361 ?auto_13359 ) ) ( HOIST-AT ?auto_13362 ?auto_13361 ) ( AVAILABLE ?auto_13362 ) ( SURFACE-AT ?auto_13357 ?auto_13361 ) ( ON ?auto_13357 ?auto_13363 ) ( CLEAR ?auto_13357 ) ( TRUCK-AT ?auto_13360 ?auto_13359 ) ( not ( = ?auto_13356 ?auto_13357 ) ) ( not ( = ?auto_13356 ?auto_13363 ) ) ( not ( = ?auto_13357 ?auto_13363 ) ) ( not ( = ?auto_13358 ?auto_13362 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13360 ?auto_13359 ?auto_13361 )
      ( !LIFT ?auto_13362 ?auto_13357 ?auto_13363 ?auto_13361 )
      ( !LOAD ?auto_13362 ?auto_13357 ?auto_13360 ?auto_13361 )
      ( !DRIVE ?auto_13360 ?auto_13361 ?auto_13359 )
      ( !UNLOAD ?auto_13358 ?auto_13357 ?auto_13360 ?auto_13359 )
      ( !DROP ?auto_13358 ?auto_13357 ?auto_13356 ?auto_13359 )
      ( MAKE-1CRATE-VERIFY ?auto_13356 ?auto_13357 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13366 - SURFACE
      ?auto_13367 - SURFACE
    )
    :vars
    (
      ?auto_13368 - HOIST
      ?auto_13369 - PLACE
      ?auto_13371 - PLACE
      ?auto_13372 - HOIST
      ?auto_13373 - SURFACE
      ?auto_13370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13368 ?auto_13369 ) ( SURFACE-AT ?auto_13366 ?auto_13369 ) ( CLEAR ?auto_13366 ) ( IS-CRATE ?auto_13367 ) ( AVAILABLE ?auto_13368 ) ( not ( = ?auto_13371 ?auto_13369 ) ) ( HOIST-AT ?auto_13372 ?auto_13371 ) ( AVAILABLE ?auto_13372 ) ( SURFACE-AT ?auto_13367 ?auto_13371 ) ( ON ?auto_13367 ?auto_13373 ) ( CLEAR ?auto_13367 ) ( TRUCK-AT ?auto_13370 ?auto_13369 ) ( not ( = ?auto_13366 ?auto_13367 ) ) ( not ( = ?auto_13366 ?auto_13373 ) ) ( not ( = ?auto_13367 ?auto_13373 ) ) ( not ( = ?auto_13368 ?auto_13372 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13370 ?auto_13369 ?auto_13371 )
      ( !LIFT ?auto_13372 ?auto_13367 ?auto_13373 ?auto_13371 )
      ( !LOAD ?auto_13372 ?auto_13367 ?auto_13370 ?auto_13371 )
      ( !DRIVE ?auto_13370 ?auto_13371 ?auto_13369 )
      ( !UNLOAD ?auto_13368 ?auto_13367 ?auto_13370 ?auto_13369 )
      ( !DROP ?auto_13368 ?auto_13367 ?auto_13366 ?auto_13369 )
      ( MAKE-1CRATE-VERIFY ?auto_13366 ?auto_13367 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13377 - SURFACE
      ?auto_13378 - SURFACE
      ?auto_13379 - SURFACE
    )
    :vars
    (
      ?auto_13383 - HOIST
      ?auto_13381 - PLACE
      ?auto_13385 - PLACE
      ?auto_13384 - HOIST
      ?auto_13380 - SURFACE
      ?auto_13388 - PLACE
      ?auto_13386 - HOIST
      ?auto_13387 - SURFACE
      ?auto_13382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13383 ?auto_13381 ) ( IS-CRATE ?auto_13379 ) ( not ( = ?auto_13385 ?auto_13381 ) ) ( HOIST-AT ?auto_13384 ?auto_13385 ) ( AVAILABLE ?auto_13384 ) ( SURFACE-AT ?auto_13379 ?auto_13385 ) ( ON ?auto_13379 ?auto_13380 ) ( CLEAR ?auto_13379 ) ( not ( = ?auto_13378 ?auto_13379 ) ) ( not ( = ?auto_13378 ?auto_13380 ) ) ( not ( = ?auto_13379 ?auto_13380 ) ) ( not ( = ?auto_13383 ?auto_13384 ) ) ( SURFACE-AT ?auto_13377 ?auto_13381 ) ( CLEAR ?auto_13377 ) ( IS-CRATE ?auto_13378 ) ( AVAILABLE ?auto_13383 ) ( not ( = ?auto_13388 ?auto_13381 ) ) ( HOIST-AT ?auto_13386 ?auto_13388 ) ( AVAILABLE ?auto_13386 ) ( SURFACE-AT ?auto_13378 ?auto_13388 ) ( ON ?auto_13378 ?auto_13387 ) ( CLEAR ?auto_13378 ) ( TRUCK-AT ?auto_13382 ?auto_13381 ) ( not ( = ?auto_13377 ?auto_13378 ) ) ( not ( = ?auto_13377 ?auto_13387 ) ) ( not ( = ?auto_13378 ?auto_13387 ) ) ( not ( = ?auto_13383 ?auto_13386 ) ) ( not ( = ?auto_13377 ?auto_13379 ) ) ( not ( = ?auto_13377 ?auto_13380 ) ) ( not ( = ?auto_13379 ?auto_13387 ) ) ( not ( = ?auto_13385 ?auto_13388 ) ) ( not ( = ?auto_13384 ?auto_13386 ) ) ( not ( = ?auto_13380 ?auto_13387 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13377 ?auto_13378 )
      ( MAKE-1CRATE ?auto_13378 ?auto_13379 )
      ( MAKE-2CRATE-VERIFY ?auto_13377 ?auto_13378 ?auto_13379 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13391 - SURFACE
      ?auto_13392 - SURFACE
    )
    :vars
    (
      ?auto_13393 - HOIST
      ?auto_13394 - PLACE
      ?auto_13396 - PLACE
      ?auto_13397 - HOIST
      ?auto_13398 - SURFACE
      ?auto_13395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13393 ?auto_13394 ) ( SURFACE-AT ?auto_13391 ?auto_13394 ) ( CLEAR ?auto_13391 ) ( IS-CRATE ?auto_13392 ) ( AVAILABLE ?auto_13393 ) ( not ( = ?auto_13396 ?auto_13394 ) ) ( HOIST-AT ?auto_13397 ?auto_13396 ) ( AVAILABLE ?auto_13397 ) ( SURFACE-AT ?auto_13392 ?auto_13396 ) ( ON ?auto_13392 ?auto_13398 ) ( CLEAR ?auto_13392 ) ( TRUCK-AT ?auto_13395 ?auto_13394 ) ( not ( = ?auto_13391 ?auto_13392 ) ) ( not ( = ?auto_13391 ?auto_13398 ) ) ( not ( = ?auto_13392 ?auto_13398 ) ) ( not ( = ?auto_13393 ?auto_13397 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13395 ?auto_13394 ?auto_13396 )
      ( !LIFT ?auto_13397 ?auto_13392 ?auto_13398 ?auto_13396 )
      ( !LOAD ?auto_13397 ?auto_13392 ?auto_13395 ?auto_13396 )
      ( !DRIVE ?auto_13395 ?auto_13396 ?auto_13394 )
      ( !UNLOAD ?auto_13393 ?auto_13392 ?auto_13395 ?auto_13394 )
      ( !DROP ?auto_13393 ?auto_13392 ?auto_13391 ?auto_13394 )
      ( MAKE-1CRATE-VERIFY ?auto_13391 ?auto_13392 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13403 - SURFACE
      ?auto_13404 - SURFACE
      ?auto_13405 - SURFACE
      ?auto_13406 - SURFACE
    )
    :vars
    (
      ?auto_13409 - HOIST
      ?auto_13408 - PLACE
      ?auto_13410 - PLACE
      ?auto_13411 - HOIST
      ?auto_13407 - SURFACE
      ?auto_13418 - PLACE
      ?auto_13415 - HOIST
      ?auto_13414 - SURFACE
      ?auto_13416 - PLACE
      ?auto_13413 - HOIST
      ?auto_13417 - SURFACE
      ?auto_13412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13409 ?auto_13408 ) ( IS-CRATE ?auto_13406 ) ( not ( = ?auto_13410 ?auto_13408 ) ) ( HOIST-AT ?auto_13411 ?auto_13410 ) ( AVAILABLE ?auto_13411 ) ( SURFACE-AT ?auto_13406 ?auto_13410 ) ( ON ?auto_13406 ?auto_13407 ) ( CLEAR ?auto_13406 ) ( not ( = ?auto_13405 ?auto_13406 ) ) ( not ( = ?auto_13405 ?auto_13407 ) ) ( not ( = ?auto_13406 ?auto_13407 ) ) ( not ( = ?auto_13409 ?auto_13411 ) ) ( IS-CRATE ?auto_13405 ) ( not ( = ?auto_13418 ?auto_13408 ) ) ( HOIST-AT ?auto_13415 ?auto_13418 ) ( AVAILABLE ?auto_13415 ) ( SURFACE-AT ?auto_13405 ?auto_13418 ) ( ON ?auto_13405 ?auto_13414 ) ( CLEAR ?auto_13405 ) ( not ( = ?auto_13404 ?auto_13405 ) ) ( not ( = ?auto_13404 ?auto_13414 ) ) ( not ( = ?auto_13405 ?auto_13414 ) ) ( not ( = ?auto_13409 ?auto_13415 ) ) ( SURFACE-AT ?auto_13403 ?auto_13408 ) ( CLEAR ?auto_13403 ) ( IS-CRATE ?auto_13404 ) ( AVAILABLE ?auto_13409 ) ( not ( = ?auto_13416 ?auto_13408 ) ) ( HOIST-AT ?auto_13413 ?auto_13416 ) ( AVAILABLE ?auto_13413 ) ( SURFACE-AT ?auto_13404 ?auto_13416 ) ( ON ?auto_13404 ?auto_13417 ) ( CLEAR ?auto_13404 ) ( TRUCK-AT ?auto_13412 ?auto_13408 ) ( not ( = ?auto_13403 ?auto_13404 ) ) ( not ( = ?auto_13403 ?auto_13417 ) ) ( not ( = ?auto_13404 ?auto_13417 ) ) ( not ( = ?auto_13409 ?auto_13413 ) ) ( not ( = ?auto_13403 ?auto_13405 ) ) ( not ( = ?auto_13403 ?auto_13414 ) ) ( not ( = ?auto_13405 ?auto_13417 ) ) ( not ( = ?auto_13418 ?auto_13416 ) ) ( not ( = ?auto_13415 ?auto_13413 ) ) ( not ( = ?auto_13414 ?auto_13417 ) ) ( not ( = ?auto_13403 ?auto_13406 ) ) ( not ( = ?auto_13403 ?auto_13407 ) ) ( not ( = ?auto_13404 ?auto_13406 ) ) ( not ( = ?auto_13404 ?auto_13407 ) ) ( not ( = ?auto_13406 ?auto_13414 ) ) ( not ( = ?auto_13406 ?auto_13417 ) ) ( not ( = ?auto_13410 ?auto_13418 ) ) ( not ( = ?auto_13410 ?auto_13416 ) ) ( not ( = ?auto_13411 ?auto_13415 ) ) ( not ( = ?auto_13411 ?auto_13413 ) ) ( not ( = ?auto_13407 ?auto_13414 ) ) ( not ( = ?auto_13407 ?auto_13417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13403 ?auto_13404 ?auto_13405 )
      ( MAKE-1CRATE ?auto_13405 ?auto_13406 )
      ( MAKE-3CRATE-VERIFY ?auto_13403 ?auto_13404 ?auto_13405 ?auto_13406 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13421 - SURFACE
      ?auto_13422 - SURFACE
    )
    :vars
    (
      ?auto_13423 - HOIST
      ?auto_13424 - PLACE
      ?auto_13426 - PLACE
      ?auto_13427 - HOIST
      ?auto_13428 - SURFACE
      ?auto_13425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13423 ?auto_13424 ) ( SURFACE-AT ?auto_13421 ?auto_13424 ) ( CLEAR ?auto_13421 ) ( IS-CRATE ?auto_13422 ) ( AVAILABLE ?auto_13423 ) ( not ( = ?auto_13426 ?auto_13424 ) ) ( HOIST-AT ?auto_13427 ?auto_13426 ) ( AVAILABLE ?auto_13427 ) ( SURFACE-AT ?auto_13422 ?auto_13426 ) ( ON ?auto_13422 ?auto_13428 ) ( CLEAR ?auto_13422 ) ( TRUCK-AT ?auto_13425 ?auto_13424 ) ( not ( = ?auto_13421 ?auto_13422 ) ) ( not ( = ?auto_13421 ?auto_13428 ) ) ( not ( = ?auto_13422 ?auto_13428 ) ) ( not ( = ?auto_13423 ?auto_13427 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13425 ?auto_13424 ?auto_13426 )
      ( !LIFT ?auto_13427 ?auto_13422 ?auto_13428 ?auto_13426 )
      ( !LOAD ?auto_13427 ?auto_13422 ?auto_13425 ?auto_13426 )
      ( !DRIVE ?auto_13425 ?auto_13426 ?auto_13424 )
      ( !UNLOAD ?auto_13423 ?auto_13422 ?auto_13425 ?auto_13424 )
      ( !DROP ?auto_13423 ?auto_13422 ?auto_13421 ?auto_13424 )
      ( MAKE-1CRATE-VERIFY ?auto_13421 ?auto_13422 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13434 - SURFACE
      ?auto_13435 - SURFACE
      ?auto_13436 - SURFACE
      ?auto_13437 - SURFACE
      ?auto_13438 - SURFACE
    )
    :vars
    (
      ?auto_13442 - HOIST
      ?auto_13439 - PLACE
      ?auto_13443 - PLACE
      ?auto_13441 - HOIST
      ?auto_13444 - SURFACE
      ?auto_13445 - PLACE
      ?auto_13450 - HOIST
      ?auto_13451 - SURFACE
      ?auto_13449 - PLACE
      ?auto_13447 - HOIST
      ?auto_13453 - SURFACE
      ?auto_13452 - PLACE
      ?auto_13446 - HOIST
      ?auto_13448 - SURFACE
      ?auto_13440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13442 ?auto_13439 ) ( IS-CRATE ?auto_13438 ) ( not ( = ?auto_13443 ?auto_13439 ) ) ( HOIST-AT ?auto_13441 ?auto_13443 ) ( AVAILABLE ?auto_13441 ) ( SURFACE-AT ?auto_13438 ?auto_13443 ) ( ON ?auto_13438 ?auto_13444 ) ( CLEAR ?auto_13438 ) ( not ( = ?auto_13437 ?auto_13438 ) ) ( not ( = ?auto_13437 ?auto_13444 ) ) ( not ( = ?auto_13438 ?auto_13444 ) ) ( not ( = ?auto_13442 ?auto_13441 ) ) ( IS-CRATE ?auto_13437 ) ( not ( = ?auto_13445 ?auto_13439 ) ) ( HOIST-AT ?auto_13450 ?auto_13445 ) ( AVAILABLE ?auto_13450 ) ( SURFACE-AT ?auto_13437 ?auto_13445 ) ( ON ?auto_13437 ?auto_13451 ) ( CLEAR ?auto_13437 ) ( not ( = ?auto_13436 ?auto_13437 ) ) ( not ( = ?auto_13436 ?auto_13451 ) ) ( not ( = ?auto_13437 ?auto_13451 ) ) ( not ( = ?auto_13442 ?auto_13450 ) ) ( IS-CRATE ?auto_13436 ) ( not ( = ?auto_13449 ?auto_13439 ) ) ( HOIST-AT ?auto_13447 ?auto_13449 ) ( AVAILABLE ?auto_13447 ) ( SURFACE-AT ?auto_13436 ?auto_13449 ) ( ON ?auto_13436 ?auto_13453 ) ( CLEAR ?auto_13436 ) ( not ( = ?auto_13435 ?auto_13436 ) ) ( not ( = ?auto_13435 ?auto_13453 ) ) ( not ( = ?auto_13436 ?auto_13453 ) ) ( not ( = ?auto_13442 ?auto_13447 ) ) ( SURFACE-AT ?auto_13434 ?auto_13439 ) ( CLEAR ?auto_13434 ) ( IS-CRATE ?auto_13435 ) ( AVAILABLE ?auto_13442 ) ( not ( = ?auto_13452 ?auto_13439 ) ) ( HOIST-AT ?auto_13446 ?auto_13452 ) ( AVAILABLE ?auto_13446 ) ( SURFACE-AT ?auto_13435 ?auto_13452 ) ( ON ?auto_13435 ?auto_13448 ) ( CLEAR ?auto_13435 ) ( TRUCK-AT ?auto_13440 ?auto_13439 ) ( not ( = ?auto_13434 ?auto_13435 ) ) ( not ( = ?auto_13434 ?auto_13448 ) ) ( not ( = ?auto_13435 ?auto_13448 ) ) ( not ( = ?auto_13442 ?auto_13446 ) ) ( not ( = ?auto_13434 ?auto_13436 ) ) ( not ( = ?auto_13434 ?auto_13453 ) ) ( not ( = ?auto_13436 ?auto_13448 ) ) ( not ( = ?auto_13449 ?auto_13452 ) ) ( not ( = ?auto_13447 ?auto_13446 ) ) ( not ( = ?auto_13453 ?auto_13448 ) ) ( not ( = ?auto_13434 ?auto_13437 ) ) ( not ( = ?auto_13434 ?auto_13451 ) ) ( not ( = ?auto_13435 ?auto_13437 ) ) ( not ( = ?auto_13435 ?auto_13451 ) ) ( not ( = ?auto_13437 ?auto_13453 ) ) ( not ( = ?auto_13437 ?auto_13448 ) ) ( not ( = ?auto_13445 ?auto_13449 ) ) ( not ( = ?auto_13445 ?auto_13452 ) ) ( not ( = ?auto_13450 ?auto_13447 ) ) ( not ( = ?auto_13450 ?auto_13446 ) ) ( not ( = ?auto_13451 ?auto_13453 ) ) ( not ( = ?auto_13451 ?auto_13448 ) ) ( not ( = ?auto_13434 ?auto_13438 ) ) ( not ( = ?auto_13434 ?auto_13444 ) ) ( not ( = ?auto_13435 ?auto_13438 ) ) ( not ( = ?auto_13435 ?auto_13444 ) ) ( not ( = ?auto_13436 ?auto_13438 ) ) ( not ( = ?auto_13436 ?auto_13444 ) ) ( not ( = ?auto_13438 ?auto_13451 ) ) ( not ( = ?auto_13438 ?auto_13453 ) ) ( not ( = ?auto_13438 ?auto_13448 ) ) ( not ( = ?auto_13443 ?auto_13445 ) ) ( not ( = ?auto_13443 ?auto_13449 ) ) ( not ( = ?auto_13443 ?auto_13452 ) ) ( not ( = ?auto_13441 ?auto_13450 ) ) ( not ( = ?auto_13441 ?auto_13447 ) ) ( not ( = ?auto_13441 ?auto_13446 ) ) ( not ( = ?auto_13444 ?auto_13451 ) ) ( not ( = ?auto_13444 ?auto_13453 ) ) ( not ( = ?auto_13444 ?auto_13448 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_13434 ?auto_13435 ?auto_13436 ?auto_13437 )
      ( MAKE-1CRATE ?auto_13437 ?auto_13438 )
      ( MAKE-4CRATE-VERIFY ?auto_13434 ?auto_13435 ?auto_13436 ?auto_13437 ?auto_13438 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13456 - SURFACE
      ?auto_13457 - SURFACE
    )
    :vars
    (
      ?auto_13458 - HOIST
      ?auto_13459 - PLACE
      ?auto_13461 - PLACE
      ?auto_13462 - HOIST
      ?auto_13463 - SURFACE
      ?auto_13460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13458 ?auto_13459 ) ( SURFACE-AT ?auto_13456 ?auto_13459 ) ( CLEAR ?auto_13456 ) ( IS-CRATE ?auto_13457 ) ( AVAILABLE ?auto_13458 ) ( not ( = ?auto_13461 ?auto_13459 ) ) ( HOIST-AT ?auto_13462 ?auto_13461 ) ( AVAILABLE ?auto_13462 ) ( SURFACE-AT ?auto_13457 ?auto_13461 ) ( ON ?auto_13457 ?auto_13463 ) ( CLEAR ?auto_13457 ) ( TRUCK-AT ?auto_13460 ?auto_13459 ) ( not ( = ?auto_13456 ?auto_13457 ) ) ( not ( = ?auto_13456 ?auto_13463 ) ) ( not ( = ?auto_13457 ?auto_13463 ) ) ( not ( = ?auto_13458 ?auto_13462 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13460 ?auto_13459 ?auto_13461 )
      ( !LIFT ?auto_13462 ?auto_13457 ?auto_13463 ?auto_13461 )
      ( !LOAD ?auto_13462 ?auto_13457 ?auto_13460 ?auto_13461 )
      ( !DRIVE ?auto_13460 ?auto_13461 ?auto_13459 )
      ( !UNLOAD ?auto_13458 ?auto_13457 ?auto_13460 ?auto_13459 )
      ( !DROP ?auto_13458 ?auto_13457 ?auto_13456 ?auto_13459 )
      ( MAKE-1CRATE-VERIFY ?auto_13456 ?auto_13457 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_13470 - SURFACE
      ?auto_13471 - SURFACE
      ?auto_13472 - SURFACE
      ?auto_13473 - SURFACE
      ?auto_13474 - SURFACE
      ?auto_13475 - SURFACE
    )
    :vars
    (
      ?auto_13481 - HOIST
      ?auto_13477 - PLACE
      ?auto_13479 - PLACE
      ?auto_13480 - HOIST
      ?auto_13478 - SURFACE
      ?auto_13490 - PLACE
      ?auto_13492 - HOIST
      ?auto_13489 - SURFACE
      ?auto_13493 - PLACE
      ?auto_13485 - HOIST
      ?auto_13491 - SURFACE
      ?auto_13484 - PLACE
      ?auto_13488 - HOIST
      ?auto_13482 - SURFACE
      ?auto_13483 - PLACE
      ?auto_13487 - HOIST
      ?auto_13486 - SURFACE
      ?auto_13476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13481 ?auto_13477 ) ( IS-CRATE ?auto_13475 ) ( not ( = ?auto_13479 ?auto_13477 ) ) ( HOIST-AT ?auto_13480 ?auto_13479 ) ( AVAILABLE ?auto_13480 ) ( SURFACE-AT ?auto_13475 ?auto_13479 ) ( ON ?auto_13475 ?auto_13478 ) ( CLEAR ?auto_13475 ) ( not ( = ?auto_13474 ?auto_13475 ) ) ( not ( = ?auto_13474 ?auto_13478 ) ) ( not ( = ?auto_13475 ?auto_13478 ) ) ( not ( = ?auto_13481 ?auto_13480 ) ) ( IS-CRATE ?auto_13474 ) ( not ( = ?auto_13490 ?auto_13477 ) ) ( HOIST-AT ?auto_13492 ?auto_13490 ) ( AVAILABLE ?auto_13492 ) ( SURFACE-AT ?auto_13474 ?auto_13490 ) ( ON ?auto_13474 ?auto_13489 ) ( CLEAR ?auto_13474 ) ( not ( = ?auto_13473 ?auto_13474 ) ) ( not ( = ?auto_13473 ?auto_13489 ) ) ( not ( = ?auto_13474 ?auto_13489 ) ) ( not ( = ?auto_13481 ?auto_13492 ) ) ( IS-CRATE ?auto_13473 ) ( not ( = ?auto_13493 ?auto_13477 ) ) ( HOIST-AT ?auto_13485 ?auto_13493 ) ( AVAILABLE ?auto_13485 ) ( SURFACE-AT ?auto_13473 ?auto_13493 ) ( ON ?auto_13473 ?auto_13491 ) ( CLEAR ?auto_13473 ) ( not ( = ?auto_13472 ?auto_13473 ) ) ( not ( = ?auto_13472 ?auto_13491 ) ) ( not ( = ?auto_13473 ?auto_13491 ) ) ( not ( = ?auto_13481 ?auto_13485 ) ) ( IS-CRATE ?auto_13472 ) ( not ( = ?auto_13484 ?auto_13477 ) ) ( HOIST-AT ?auto_13488 ?auto_13484 ) ( AVAILABLE ?auto_13488 ) ( SURFACE-AT ?auto_13472 ?auto_13484 ) ( ON ?auto_13472 ?auto_13482 ) ( CLEAR ?auto_13472 ) ( not ( = ?auto_13471 ?auto_13472 ) ) ( not ( = ?auto_13471 ?auto_13482 ) ) ( not ( = ?auto_13472 ?auto_13482 ) ) ( not ( = ?auto_13481 ?auto_13488 ) ) ( SURFACE-AT ?auto_13470 ?auto_13477 ) ( CLEAR ?auto_13470 ) ( IS-CRATE ?auto_13471 ) ( AVAILABLE ?auto_13481 ) ( not ( = ?auto_13483 ?auto_13477 ) ) ( HOIST-AT ?auto_13487 ?auto_13483 ) ( AVAILABLE ?auto_13487 ) ( SURFACE-AT ?auto_13471 ?auto_13483 ) ( ON ?auto_13471 ?auto_13486 ) ( CLEAR ?auto_13471 ) ( TRUCK-AT ?auto_13476 ?auto_13477 ) ( not ( = ?auto_13470 ?auto_13471 ) ) ( not ( = ?auto_13470 ?auto_13486 ) ) ( not ( = ?auto_13471 ?auto_13486 ) ) ( not ( = ?auto_13481 ?auto_13487 ) ) ( not ( = ?auto_13470 ?auto_13472 ) ) ( not ( = ?auto_13470 ?auto_13482 ) ) ( not ( = ?auto_13472 ?auto_13486 ) ) ( not ( = ?auto_13484 ?auto_13483 ) ) ( not ( = ?auto_13488 ?auto_13487 ) ) ( not ( = ?auto_13482 ?auto_13486 ) ) ( not ( = ?auto_13470 ?auto_13473 ) ) ( not ( = ?auto_13470 ?auto_13491 ) ) ( not ( = ?auto_13471 ?auto_13473 ) ) ( not ( = ?auto_13471 ?auto_13491 ) ) ( not ( = ?auto_13473 ?auto_13482 ) ) ( not ( = ?auto_13473 ?auto_13486 ) ) ( not ( = ?auto_13493 ?auto_13484 ) ) ( not ( = ?auto_13493 ?auto_13483 ) ) ( not ( = ?auto_13485 ?auto_13488 ) ) ( not ( = ?auto_13485 ?auto_13487 ) ) ( not ( = ?auto_13491 ?auto_13482 ) ) ( not ( = ?auto_13491 ?auto_13486 ) ) ( not ( = ?auto_13470 ?auto_13474 ) ) ( not ( = ?auto_13470 ?auto_13489 ) ) ( not ( = ?auto_13471 ?auto_13474 ) ) ( not ( = ?auto_13471 ?auto_13489 ) ) ( not ( = ?auto_13472 ?auto_13474 ) ) ( not ( = ?auto_13472 ?auto_13489 ) ) ( not ( = ?auto_13474 ?auto_13491 ) ) ( not ( = ?auto_13474 ?auto_13482 ) ) ( not ( = ?auto_13474 ?auto_13486 ) ) ( not ( = ?auto_13490 ?auto_13493 ) ) ( not ( = ?auto_13490 ?auto_13484 ) ) ( not ( = ?auto_13490 ?auto_13483 ) ) ( not ( = ?auto_13492 ?auto_13485 ) ) ( not ( = ?auto_13492 ?auto_13488 ) ) ( not ( = ?auto_13492 ?auto_13487 ) ) ( not ( = ?auto_13489 ?auto_13491 ) ) ( not ( = ?auto_13489 ?auto_13482 ) ) ( not ( = ?auto_13489 ?auto_13486 ) ) ( not ( = ?auto_13470 ?auto_13475 ) ) ( not ( = ?auto_13470 ?auto_13478 ) ) ( not ( = ?auto_13471 ?auto_13475 ) ) ( not ( = ?auto_13471 ?auto_13478 ) ) ( not ( = ?auto_13472 ?auto_13475 ) ) ( not ( = ?auto_13472 ?auto_13478 ) ) ( not ( = ?auto_13473 ?auto_13475 ) ) ( not ( = ?auto_13473 ?auto_13478 ) ) ( not ( = ?auto_13475 ?auto_13489 ) ) ( not ( = ?auto_13475 ?auto_13491 ) ) ( not ( = ?auto_13475 ?auto_13482 ) ) ( not ( = ?auto_13475 ?auto_13486 ) ) ( not ( = ?auto_13479 ?auto_13490 ) ) ( not ( = ?auto_13479 ?auto_13493 ) ) ( not ( = ?auto_13479 ?auto_13484 ) ) ( not ( = ?auto_13479 ?auto_13483 ) ) ( not ( = ?auto_13480 ?auto_13492 ) ) ( not ( = ?auto_13480 ?auto_13485 ) ) ( not ( = ?auto_13480 ?auto_13488 ) ) ( not ( = ?auto_13480 ?auto_13487 ) ) ( not ( = ?auto_13478 ?auto_13489 ) ) ( not ( = ?auto_13478 ?auto_13491 ) ) ( not ( = ?auto_13478 ?auto_13482 ) ) ( not ( = ?auto_13478 ?auto_13486 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_13470 ?auto_13471 ?auto_13472 ?auto_13473 ?auto_13474 )
      ( MAKE-1CRATE ?auto_13474 ?auto_13475 )
      ( MAKE-5CRATE-VERIFY ?auto_13470 ?auto_13471 ?auto_13472 ?auto_13473 ?auto_13474 ?auto_13475 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13496 - SURFACE
      ?auto_13497 - SURFACE
    )
    :vars
    (
      ?auto_13498 - HOIST
      ?auto_13499 - PLACE
      ?auto_13501 - PLACE
      ?auto_13502 - HOIST
      ?auto_13503 - SURFACE
      ?auto_13500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13498 ?auto_13499 ) ( SURFACE-AT ?auto_13496 ?auto_13499 ) ( CLEAR ?auto_13496 ) ( IS-CRATE ?auto_13497 ) ( AVAILABLE ?auto_13498 ) ( not ( = ?auto_13501 ?auto_13499 ) ) ( HOIST-AT ?auto_13502 ?auto_13501 ) ( AVAILABLE ?auto_13502 ) ( SURFACE-AT ?auto_13497 ?auto_13501 ) ( ON ?auto_13497 ?auto_13503 ) ( CLEAR ?auto_13497 ) ( TRUCK-AT ?auto_13500 ?auto_13499 ) ( not ( = ?auto_13496 ?auto_13497 ) ) ( not ( = ?auto_13496 ?auto_13503 ) ) ( not ( = ?auto_13497 ?auto_13503 ) ) ( not ( = ?auto_13498 ?auto_13502 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13500 ?auto_13499 ?auto_13501 )
      ( !LIFT ?auto_13502 ?auto_13497 ?auto_13503 ?auto_13501 )
      ( !LOAD ?auto_13502 ?auto_13497 ?auto_13500 ?auto_13501 )
      ( !DRIVE ?auto_13500 ?auto_13501 ?auto_13499 )
      ( !UNLOAD ?auto_13498 ?auto_13497 ?auto_13500 ?auto_13499 )
      ( !DROP ?auto_13498 ?auto_13497 ?auto_13496 ?auto_13499 )
      ( MAKE-1CRATE-VERIFY ?auto_13496 ?auto_13497 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_13511 - SURFACE
      ?auto_13512 - SURFACE
      ?auto_13513 - SURFACE
      ?auto_13514 - SURFACE
      ?auto_13515 - SURFACE
      ?auto_13517 - SURFACE
      ?auto_13516 - SURFACE
    )
    :vars
    (
      ?auto_13521 - HOIST
      ?auto_13520 - PLACE
      ?auto_13519 - PLACE
      ?auto_13518 - HOIST
      ?auto_13523 - SURFACE
      ?auto_13534 - PLACE
      ?auto_13524 - HOIST
      ?auto_13535 - SURFACE
      ?auto_13525 - PLACE
      ?auto_13526 - HOIST
      ?auto_13530 - SURFACE
      ?auto_13529 - PLACE
      ?auto_13536 - HOIST
      ?auto_13528 - SURFACE
      ?auto_13538 - PLACE
      ?auto_13531 - HOIST
      ?auto_13527 - SURFACE
      ?auto_13537 - PLACE
      ?auto_13532 - HOIST
      ?auto_13533 - SURFACE
      ?auto_13522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13521 ?auto_13520 ) ( IS-CRATE ?auto_13516 ) ( not ( = ?auto_13519 ?auto_13520 ) ) ( HOIST-AT ?auto_13518 ?auto_13519 ) ( AVAILABLE ?auto_13518 ) ( SURFACE-AT ?auto_13516 ?auto_13519 ) ( ON ?auto_13516 ?auto_13523 ) ( CLEAR ?auto_13516 ) ( not ( = ?auto_13517 ?auto_13516 ) ) ( not ( = ?auto_13517 ?auto_13523 ) ) ( not ( = ?auto_13516 ?auto_13523 ) ) ( not ( = ?auto_13521 ?auto_13518 ) ) ( IS-CRATE ?auto_13517 ) ( not ( = ?auto_13534 ?auto_13520 ) ) ( HOIST-AT ?auto_13524 ?auto_13534 ) ( AVAILABLE ?auto_13524 ) ( SURFACE-AT ?auto_13517 ?auto_13534 ) ( ON ?auto_13517 ?auto_13535 ) ( CLEAR ?auto_13517 ) ( not ( = ?auto_13515 ?auto_13517 ) ) ( not ( = ?auto_13515 ?auto_13535 ) ) ( not ( = ?auto_13517 ?auto_13535 ) ) ( not ( = ?auto_13521 ?auto_13524 ) ) ( IS-CRATE ?auto_13515 ) ( not ( = ?auto_13525 ?auto_13520 ) ) ( HOIST-AT ?auto_13526 ?auto_13525 ) ( AVAILABLE ?auto_13526 ) ( SURFACE-AT ?auto_13515 ?auto_13525 ) ( ON ?auto_13515 ?auto_13530 ) ( CLEAR ?auto_13515 ) ( not ( = ?auto_13514 ?auto_13515 ) ) ( not ( = ?auto_13514 ?auto_13530 ) ) ( not ( = ?auto_13515 ?auto_13530 ) ) ( not ( = ?auto_13521 ?auto_13526 ) ) ( IS-CRATE ?auto_13514 ) ( not ( = ?auto_13529 ?auto_13520 ) ) ( HOIST-AT ?auto_13536 ?auto_13529 ) ( AVAILABLE ?auto_13536 ) ( SURFACE-AT ?auto_13514 ?auto_13529 ) ( ON ?auto_13514 ?auto_13528 ) ( CLEAR ?auto_13514 ) ( not ( = ?auto_13513 ?auto_13514 ) ) ( not ( = ?auto_13513 ?auto_13528 ) ) ( not ( = ?auto_13514 ?auto_13528 ) ) ( not ( = ?auto_13521 ?auto_13536 ) ) ( IS-CRATE ?auto_13513 ) ( not ( = ?auto_13538 ?auto_13520 ) ) ( HOIST-AT ?auto_13531 ?auto_13538 ) ( AVAILABLE ?auto_13531 ) ( SURFACE-AT ?auto_13513 ?auto_13538 ) ( ON ?auto_13513 ?auto_13527 ) ( CLEAR ?auto_13513 ) ( not ( = ?auto_13512 ?auto_13513 ) ) ( not ( = ?auto_13512 ?auto_13527 ) ) ( not ( = ?auto_13513 ?auto_13527 ) ) ( not ( = ?auto_13521 ?auto_13531 ) ) ( SURFACE-AT ?auto_13511 ?auto_13520 ) ( CLEAR ?auto_13511 ) ( IS-CRATE ?auto_13512 ) ( AVAILABLE ?auto_13521 ) ( not ( = ?auto_13537 ?auto_13520 ) ) ( HOIST-AT ?auto_13532 ?auto_13537 ) ( AVAILABLE ?auto_13532 ) ( SURFACE-AT ?auto_13512 ?auto_13537 ) ( ON ?auto_13512 ?auto_13533 ) ( CLEAR ?auto_13512 ) ( TRUCK-AT ?auto_13522 ?auto_13520 ) ( not ( = ?auto_13511 ?auto_13512 ) ) ( not ( = ?auto_13511 ?auto_13533 ) ) ( not ( = ?auto_13512 ?auto_13533 ) ) ( not ( = ?auto_13521 ?auto_13532 ) ) ( not ( = ?auto_13511 ?auto_13513 ) ) ( not ( = ?auto_13511 ?auto_13527 ) ) ( not ( = ?auto_13513 ?auto_13533 ) ) ( not ( = ?auto_13538 ?auto_13537 ) ) ( not ( = ?auto_13531 ?auto_13532 ) ) ( not ( = ?auto_13527 ?auto_13533 ) ) ( not ( = ?auto_13511 ?auto_13514 ) ) ( not ( = ?auto_13511 ?auto_13528 ) ) ( not ( = ?auto_13512 ?auto_13514 ) ) ( not ( = ?auto_13512 ?auto_13528 ) ) ( not ( = ?auto_13514 ?auto_13527 ) ) ( not ( = ?auto_13514 ?auto_13533 ) ) ( not ( = ?auto_13529 ?auto_13538 ) ) ( not ( = ?auto_13529 ?auto_13537 ) ) ( not ( = ?auto_13536 ?auto_13531 ) ) ( not ( = ?auto_13536 ?auto_13532 ) ) ( not ( = ?auto_13528 ?auto_13527 ) ) ( not ( = ?auto_13528 ?auto_13533 ) ) ( not ( = ?auto_13511 ?auto_13515 ) ) ( not ( = ?auto_13511 ?auto_13530 ) ) ( not ( = ?auto_13512 ?auto_13515 ) ) ( not ( = ?auto_13512 ?auto_13530 ) ) ( not ( = ?auto_13513 ?auto_13515 ) ) ( not ( = ?auto_13513 ?auto_13530 ) ) ( not ( = ?auto_13515 ?auto_13528 ) ) ( not ( = ?auto_13515 ?auto_13527 ) ) ( not ( = ?auto_13515 ?auto_13533 ) ) ( not ( = ?auto_13525 ?auto_13529 ) ) ( not ( = ?auto_13525 ?auto_13538 ) ) ( not ( = ?auto_13525 ?auto_13537 ) ) ( not ( = ?auto_13526 ?auto_13536 ) ) ( not ( = ?auto_13526 ?auto_13531 ) ) ( not ( = ?auto_13526 ?auto_13532 ) ) ( not ( = ?auto_13530 ?auto_13528 ) ) ( not ( = ?auto_13530 ?auto_13527 ) ) ( not ( = ?auto_13530 ?auto_13533 ) ) ( not ( = ?auto_13511 ?auto_13517 ) ) ( not ( = ?auto_13511 ?auto_13535 ) ) ( not ( = ?auto_13512 ?auto_13517 ) ) ( not ( = ?auto_13512 ?auto_13535 ) ) ( not ( = ?auto_13513 ?auto_13517 ) ) ( not ( = ?auto_13513 ?auto_13535 ) ) ( not ( = ?auto_13514 ?auto_13517 ) ) ( not ( = ?auto_13514 ?auto_13535 ) ) ( not ( = ?auto_13517 ?auto_13530 ) ) ( not ( = ?auto_13517 ?auto_13528 ) ) ( not ( = ?auto_13517 ?auto_13527 ) ) ( not ( = ?auto_13517 ?auto_13533 ) ) ( not ( = ?auto_13534 ?auto_13525 ) ) ( not ( = ?auto_13534 ?auto_13529 ) ) ( not ( = ?auto_13534 ?auto_13538 ) ) ( not ( = ?auto_13534 ?auto_13537 ) ) ( not ( = ?auto_13524 ?auto_13526 ) ) ( not ( = ?auto_13524 ?auto_13536 ) ) ( not ( = ?auto_13524 ?auto_13531 ) ) ( not ( = ?auto_13524 ?auto_13532 ) ) ( not ( = ?auto_13535 ?auto_13530 ) ) ( not ( = ?auto_13535 ?auto_13528 ) ) ( not ( = ?auto_13535 ?auto_13527 ) ) ( not ( = ?auto_13535 ?auto_13533 ) ) ( not ( = ?auto_13511 ?auto_13516 ) ) ( not ( = ?auto_13511 ?auto_13523 ) ) ( not ( = ?auto_13512 ?auto_13516 ) ) ( not ( = ?auto_13512 ?auto_13523 ) ) ( not ( = ?auto_13513 ?auto_13516 ) ) ( not ( = ?auto_13513 ?auto_13523 ) ) ( not ( = ?auto_13514 ?auto_13516 ) ) ( not ( = ?auto_13514 ?auto_13523 ) ) ( not ( = ?auto_13515 ?auto_13516 ) ) ( not ( = ?auto_13515 ?auto_13523 ) ) ( not ( = ?auto_13516 ?auto_13535 ) ) ( not ( = ?auto_13516 ?auto_13530 ) ) ( not ( = ?auto_13516 ?auto_13528 ) ) ( not ( = ?auto_13516 ?auto_13527 ) ) ( not ( = ?auto_13516 ?auto_13533 ) ) ( not ( = ?auto_13519 ?auto_13534 ) ) ( not ( = ?auto_13519 ?auto_13525 ) ) ( not ( = ?auto_13519 ?auto_13529 ) ) ( not ( = ?auto_13519 ?auto_13538 ) ) ( not ( = ?auto_13519 ?auto_13537 ) ) ( not ( = ?auto_13518 ?auto_13524 ) ) ( not ( = ?auto_13518 ?auto_13526 ) ) ( not ( = ?auto_13518 ?auto_13536 ) ) ( not ( = ?auto_13518 ?auto_13531 ) ) ( not ( = ?auto_13518 ?auto_13532 ) ) ( not ( = ?auto_13523 ?auto_13535 ) ) ( not ( = ?auto_13523 ?auto_13530 ) ) ( not ( = ?auto_13523 ?auto_13528 ) ) ( not ( = ?auto_13523 ?auto_13527 ) ) ( not ( = ?auto_13523 ?auto_13533 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_13511 ?auto_13512 ?auto_13513 ?auto_13514 ?auto_13515 ?auto_13517 )
      ( MAKE-1CRATE ?auto_13517 ?auto_13516 )
      ( MAKE-6CRATE-VERIFY ?auto_13511 ?auto_13512 ?auto_13513 ?auto_13514 ?auto_13515 ?auto_13517 ?auto_13516 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13541 - SURFACE
      ?auto_13542 - SURFACE
    )
    :vars
    (
      ?auto_13543 - HOIST
      ?auto_13544 - PLACE
      ?auto_13546 - PLACE
      ?auto_13547 - HOIST
      ?auto_13548 - SURFACE
      ?auto_13545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13543 ?auto_13544 ) ( SURFACE-AT ?auto_13541 ?auto_13544 ) ( CLEAR ?auto_13541 ) ( IS-CRATE ?auto_13542 ) ( AVAILABLE ?auto_13543 ) ( not ( = ?auto_13546 ?auto_13544 ) ) ( HOIST-AT ?auto_13547 ?auto_13546 ) ( AVAILABLE ?auto_13547 ) ( SURFACE-AT ?auto_13542 ?auto_13546 ) ( ON ?auto_13542 ?auto_13548 ) ( CLEAR ?auto_13542 ) ( TRUCK-AT ?auto_13545 ?auto_13544 ) ( not ( = ?auto_13541 ?auto_13542 ) ) ( not ( = ?auto_13541 ?auto_13548 ) ) ( not ( = ?auto_13542 ?auto_13548 ) ) ( not ( = ?auto_13543 ?auto_13547 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13545 ?auto_13544 ?auto_13546 )
      ( !LIFT ?auto_13547 ?auto_13542 ?auto_13548 ?auto_13546 )
      ( !LOAD ?auto_13547 ?auto_13542 ?auto_13545 ?auto_13546 )
      ( !DRIVE ?auto_13545 ?auto_13546 ?auto_13544 )
      ( !UNLOAD ?auto_13543 ?auto_13542 ?auto_13545 ?auto_13544 )
      ( !DROP ?auto_13543 ?auto_13542 ?auto_13541 ?auto_13544 )
      ( MAKE-1CRATE-VERIFY ?auto_13541 ?auto_13542 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_13557 - SURFACE
      ?auto_13558 - SURFACE
      ?auto_13559 - SURFACE
      ?auto_13560 - SURFACE
      ?auto_13561 - SURFACE
      ?auto_13563 - SURFACE
      ?auto_13562 - SURFACE
      ?auto_13564 - SURFACE
    )
    :vars
    (
      ?auto_13565 - HOIST
      ?auto_13569 - PLACE
      ?auto_13568 - PLACE
      ?auto_13566 - HOIST
      ?auto_13567 - SURFACE
      ?auto_13581 - PLACE
      ?auto_13587 - HOIST
      ?auto_13586 - SURFACE
      ?auto_13588 - PLACE
      ?auto_13573 - HOIST
      ?auto_13574 - SURFACE
      ?auto_13583 - PLACE
      ?auto_13584 - HOIST
      ?auto_13578 - SURFACE
      ?auto_13579 - PLACE
      ?auto_13575 - HOIST
      ?auto_13580 - SURFACE
      ?auto_13585 - PLACE
      ?auto_13577 - HOIST
      ?auto_13582 - SURFACE
      ?auto_13576 - PLACE
      ?auto_13571 - HOIST
      ?auto_13572 - SURFACE
      ?auto_13570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13565 ?auto_13569 ) ( IS-CRATE ?auto_13564 ) ( not ( = ?auto_13568 ?auto_13569 ) ) ( HOIST-AT ?auto_13566 ?auto_13568 ) ( AVAILABLE ?auto_13566 ) ( SURFACE-AT ?auto_13564 ?auto_13568 ) ( ON ?auto_13564 ?auto_13567 ) ( CLEAR ?auto_13564 ) ( not ( = ?auto_13562 ?auto_13564 ) ) ( not ( = ?auto_13562 ?auto_13567 ) ) ( not ( = ?auto_13564 ?auto_13567 ) ) ( not ( = ?auto_13565 ?auto_13566 ) ) ( IS-CRATE ?auto_13562 ) ( not ( = ?auto_13581 ?auto_13569 ) ) ( HOIST-AT ?auto_13587 ?auto_13581 ) ( AVAILABLE ?auto_13587 ) ( SURFACE-AT ?auto_13562 ?auto_13581 ) ( ON ?auto_13562 ?auto_13586 ) ( CLEAR ?auto_13562 ) ( not ( = ?auto_13563 ?auto_13562 ) ) ( not ( = ?auto_13563 ?auto_13586 ) ) ( not ( = ?auto_13562 ?auto_13586 ) ) ( not ( = ?auto_13565 ?auto_13587 ) ) ( IS-CRATE ?auto_13563 ) ( not ( = ?auto_13588 ?auto_13569 ) ) ( HOIST-AT ?auto_13573 ?auto_13588 ) ( AVAILABLE ?auto_13573 ) ( SURFACE-AT ?auto_13563 ?auto_13588 ) ( ON ?auto_13563 ?auto_13574 ) ( CLEAR ?auto_13563 ) ( not ( = ?auto_13561 ?auto_13563 ) ) ( not ( = ?auto_13561 ?auto_13574 ) ) ( not ( = ?auto_13563 ?auto_13574 ) ) ( not ( = ?auto_13565 ?auto_13573 ) ) ( IS-CRATE ?auto_13561 ) ( not ( = ?auto_13583 ?auto_13569 ) ) ( HOIST-AT ?auto_13584 ?auto_13583 ) ( AVAILABLE ?auto_13584 ) ( SURFACE-AT ?auto_13561 ?auto_13583 ) ( ON ?auto_13561 ?auto_13578 ) ( CLEAR ?auto_13561 ) ( not ( = ?auto_13560 ?auto_13561 ) ) ( not ( = ?auto_13560 ?auto_13578 ) ) ( not ( = ?auto_13561 ?auto_13578 ) ) ( not ( = ?auto_13565 ?auto_13584 ) ) ( IS-CRATE ?auto_13560 ) ( not ( = ?auto_13579 ?auto_13569 ) ) ( HOIST-AT ?auto_13575 ?auto_13579 ) ( AVAILABLE ?auto_13575 ) ( SURFACE-AT ?auto_13560 ?auto_13579 ) ( ON ?auto_13560 ?auto_13580 ) ( CLEAR ?auto_13560 ) ( not ( = ?auto_13559 ?auto_13560 ) ) ( not ( = ?auto_13559 ?auto_13580 ) ) ( not ( = ?auto_13560 ?auto_13580 ) ) ( not ( = ?auto_13565 ?auto_13575 ) ) ( IS-CRATE ?auto_13559 ) ( not ( = ?auto_13585 ?auto_13569 ) ) ( HOIST-AT ?auto_13577 ?auto_13585 ) ( AVAILABLE ?auto_13577 ) ( SURFACE-AT ?auto_13559 ?auto_13585 ) ( ON ?auto_13559 ?auto_13582 ) ( CLEAR ?auto_13559 ) ( not ( = ?auto_13558 ?auto_13559 ) ) ( not ( = ?auto_13558 ?auto_13582 ) ) ( not ( = ?auto_13559 ?auto_13582 ) ) ( not ( = ?auto_13565 ?auto_13577 ) ) ( SURFACE-AT ?auto_13557 ?auto_13569 ) ( CLEAR ?auto_13557 ) ( IS-CRATE ?auto_13558 ) ( AVAILABLE ?auto_13565 ) ( not ( = ?auto_13576 ?auto_13569 ) ) ( HOIST-AT ?auto_13571 ?auto_13576 ) ( AVAILABLE ?auto_13571 ) ( SURFACE-AT ?auto_13558 ?auto_13576 ) ( ON ?auto_13558 ?auto_13572 ) ( CLEAR ?auto_13558 ) ( TRUCK-AT ?auto_13570 ?auto_13569 ) ( not ( = ?auto_13557 ?auto_13558 ) ) ( not ( = ?auto_13557 ?auto_13572 ) ) ( not ( = ?auto_13558 ?auto_13572 ) ) ( not ( = ?auto_13565 ?auto_13571 ) ) ( not ( = ?auto_13557 ?auto_13559 ) ) ( not ( = ?auto_13557 ?auto_13582 ) ) ( not ( = ?auto_13559 ?auto_13572 ) ) ( not ( = ?auto_13585 ?auto_13576 ) ) ( not ( = ?auto_13577 ?auto_13571 ) ) ( not ( = ?auto_13582 ?auto_13572 ) ) ( not ( = ?auto_13557 ?auto_13560 ) ) ( not ( = ?auto_13557 ?auto_13580 ) ) ( not ( = ?auto_13558 ?auto_13560 ) ) ( not ( = ?auto_13558 ?auto_13580 ) ) ( not ( = ?auto_13560 ?auto_13582 ) ) ( not ( = ?auto_13560 ?auto_13572 ) ) ( not ( = ?auto_13579 ?auto_13585 ) ) ( not ( = ?auto_13579 ?auto_13576 ) ) ( not ( = ?auto_13575 ?auto_13577 ) ) ( not ( = ?auto_13575 ?auto_13571 ) ) ( not ( = ?auto_13580 ?auto_13582 ) ) ( not ( = ?auto_13580 ?auto_13572 ) ) ( not ( = ?auto_13557 ?auto_13561 ) ) ( not ( = ?auto_13557 ?auto_13578 ) ) ( not ( = ?auto_13558 ?auto_13561 ) ) ( not ( = ?auto_13558 ?auto_13578 ) ) ( not ( = ?auto_13559 ?auto_13561 ) ) ( not ( = ?auto_13559 ?auto_13578 ) ) ( not ( = ?auto_13561 ?auto_13580 ) ) ( not ( = ?auto_13561 ?auto_13582 ) ) ( not ( = ?auto_13561 ?auto_13572 ) ) ( not ( = ?auto_13583 ?auto_13579 ) ) ( not ( = ?auto_13583 ?auto_13585 ) ) ( not ( = ?auto_13583 ?auto_13576 ) ) ( not ( = ?auto_13584 ?auto_13575 ) ) ( not ( = ?auto_13584 ?auto_13577 ) ) ( not ( = ?auto_13584 ?auto_13571 ) ) ( not ( = ?auto_13578 ?auto_13580 ) ) ( not ( = ?auto_13578 ?auto_13582 ) ) ( not ( = ?auto_13578 ?auto_13572 ) ) ( not ( = ?auto_13557 ?auto_13563 ) ) ( not ( = ?auto_13557 ?auto_13574 ) ) ( not ( = ?auto_13558 ?auto_13563 ) ) ( not ( = ?auto_13558 ?auto_13574 ) ) ( not ( = ?auto_13559 ?auto_13563 ) ) ( not ( = ?auto_13559 ?auto_13574 ) ) ( not ( = ?auto_13560 ?auto_13563 ) ) ( not ( = ?auto_13560 ?auto_13574 ) ) ( not ( = ?auto_13563 ?auto_13578 ) ) ( not ( = ?auto_13563 ?auto_13580 ) ) ( not ( = ?auto_13563 ?auto_13582 ) ) ( not ( = ?auto_13563 ?auto_13572 ) ) ( not ( = ?auto_13588 ?auto_13583 ) ) ( not ( = ?auto_13588 ?auto_13579 ) ) ( not ( = ?auto_13588 ?auto_13585 ) ) ( not ( = ?auto_13588 ?auto_13576 ) ) ( not ( = ?auto_13573 ?auto_13584 ) ) ( not ( = ?auto_13573 ?auto_13575 ) ) ( not ( = ?auto_13573 ?auto_13577 ) ) ( not ( = ?auto_13573 ?auto_13571 ) ) ( not ( = ?auto_13574 ?auto_13578 ) ) ( not ( = ?auto_13574 ?auto_13580 ) ) ( not ( = ?auto_13574 ?auto_13582 ) ) ( not ( = ?auto_13574 ?auto_13572 ) ) ( not ( = ?auto_13557 ?auto_13562 ) ) ( not ( = ?auto_13557 ?auto_13586 ) ) ( not ( = ?auto_13558 ?auto_13562 ) ) ( not ( = ?auto_13558 ?auto_13586 ) ) ( not ( = ?auto_13559 ?auto_13562 ) ) ( not ( = ?auto_13559 ?auto_13586 ) ) ( not ( = ?auto_13560 ?auto_13562 ) ) ( not ( = ?auto_13560 ?auto_13586 ) ) ( not ( = ?auto_13561 ?auto_13562 ) ) ( not ( = ?auto_13561 ?auto_13586 ) ) ( not ( = ?auto_13562 ?auto_13574 ) ) ( not ( = ?auto_13562 ?auto_13578 ) ) ( not ( = ?auto_13562 ?auto_13580 ) ) ( not ( = ?auto_13562 ?auto_13582 ) ) ( not ( = ?auto_13562 ?auto_13572 ) ) ( not ( = ?auto_13581 ?auto_13588 ) ) ( not ( = ?auto_13581 ?auto_13583 ) ) ( not ( = ?auto_13581 ?auto_13579 ) ) ( not ( = ?auto_13581 ?auto_13585 ) ) ( not ( = ?auto_13581 ?auto_13576 ) ) ( not ( = ?auto_13587 ?auto_13573 ) ) ( not ( = ?auto_13587 ?auto_13584 ) ) ( not ( = ?auto_13587 ?auto_13575 ) ) ( not ( = ?auto_13587 ?auto_13577 ) ) ( not ( = ?auto_13587 ?auto_13571 ) ) ( not ( = ?auto_13586 ?auto_13574 ) ) ( not ( = ?auto_13586 ?auto_13578 ) ) ( not ( = ?auto_13586 ?auto_13580 ) ) ( not ( = ?auto_13586 ?auto_13582 ) ) ( not ( = ?auto_13586 ?auto_13572 ) ) ( not ( = ?auto_13557 ?auto_13564 ) ) ( not ( = ?auto_13557 ?auto_13567 ) ) ( not ( = ?auto_13558 ?auto_13564 ) ) ( not ( = ?auto_13558 ?auto_13567 ) ) ( not ( = ?auto_13559 ?auto_13564 ) ) ( not ( = ?auto_13559 ?auto_13567 ) ) ( not ( = ?auto_13560 ?auto_13564 ) ) ( not ( = ?auto_13560 ?auto_13567 ) ) ( not ( = ?auto_13561 ?auto_13564 ) ) ( not ( = ?auto_13561 ?auto_13567 ) ) ( not ( = ?auto_13563 ?auto_13564 ) ) ( not ( = ?auto_13563 ?auto_13567 ) ) ( not ( = ?auto_13564 ?auto_13586 ) ) ( not ( = ?auto_13564 ?auto_13574 ) ) ( not ( = ?auto_13564 ?auto_13578 ) ) ( not ( = ?auto_13564 ?auto_13580 ) ) ( not ( = ?auto_13564 ?auto_13582 ) ) ( not ( = ?auto_13564 ?auto_13572 ) ) ( not ( = ?auto_13568 ?auto_13581 ) ) ( not ( = ?auto_13568 ?auto_13588 ) ) ( not ( = ?auto_13568 ?auto_13583 ) ) ( not ( = ?auto_13568 ?auto_13579 ) ) ( not ( = ?auto_13568 ?auto_13585 ) ) ( not ( = ?auto_13568 ?auto_13576 ) ) ( not ( = ?auto_13566 ?auto_13587 ) ) ( not ( = ?auto_13566 ?auto_13573 ) ) ( not ( = ?auto_13566 ?auto_13584 ) ) ( not ( = ?auto_13566 ?auto_13575 ) ) ( not ( = ?auto_13566 ?auto_13577 ) ) ( not ( = ?auto_13566 ?auto_13571 ) ) ( not ( = ?auto_13567 ?auto_13586 ) ) ( not ( = ?auto_13567 ?auto_13574 ) ) ( not ( = ?auto_13567 ?auto_13578 ) ) ( not ( = ?auto_13567 ?auto_13580 ) ) ( not ( = ?auto_13567 ?auto_13582 ) ) ( not ( = ?auto_13567 ?auto_13572 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_13557 ?auto_13558 ?auto_13559 ?auto_13560 ?auto_13561 ?auto_13563 ?auto_13562 )
      ( MAKE-1CRATE ?auto_13562 ?auto_13564 )
      ( MAKE-7CRATE-VERIFY ?auto_13557 ?auto_13558 ?auto_13559 ?auto_13560 ?auto_13561 ?auto_13563 ?auto_13562 ?auto_13564 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13591 - SURFACE
      ?auto_13592 - SURFACE
    )
    :vars
    (
      ?auto_13593 - HOIST
      ?auto_13594 - PLACE
      ?auto_13596 - PLACE
      ?auto_13597 - HOIST
      ?auto_13598 - SURFACE
      ?auto_13595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13593 ?auto_13594 ) ( SURFACE-AT ?auto_13591 ?auto_13594 ) ( CLEAR ?auto_13591 ) ( IS-CRATE ?auto_13592 ) ( AVAILABLE ?auto_13593 ) ( not ( = ?auto_13596 ?auto_13594 ) ) ( HOIST-AT ?auto_13597 ?auto_13596 ) ( AVAILABLE ?auto_13597 ) ( SURFACE-AT ?auto_13592 ?auto_13596 ) ( ON ?auto_13592 ?auto_13598 ) ( CLEAR ?auto_13592 ) ( TRUCK-AT ?auto_13595 ?auto_13594 ) ( not ( = ?auto_13591 ?auto_13592 ) ) ( not ( = ?auto_13591 ?auto_13598 ) ) ( not ( = ?auto_13592 ?auto_13598 ) ) ( not ( = ?auto_13593 ?auto_13597 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13595 ?auto_13594 ?auto_13596 )
      ( !LIFT ?auto_13597 ?auto_13592 ?auto_13598 ?auto_13596 )
      ( !LOAD ?auto_13597 ?auto_13592 ?auto_13595 ?auto_13596 )
      ( !DRIVE ?auto_13595 ?auto_13596 ?auto_13594 )
      ( !UNLOAD ?auto_13593 ?auto_13592 ?auto_13595 ?auto_13594 )
      ( !DROP ?auto_13593 ?auto_13592 ?auto_13591 ?auto_13594 )
      ( MAKE-1CRATE-VERIFY ?auto_13591 ?auto_13592 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_13608 - SURFACE
      ?auto_13609 - SURFACE
      ?auto_13610 - SURFACE
      ?auto_13611 - SURFACE
      ?auto_13612 - SURFACE
      ?auto_13614 - SURFACE
      ?auto_13613 - SURFACE
      ?auto_13616 - SURFACE
      ?auto_13615 - SURFACE
    )
    :vars
    (
      ?auto_13621 - HOIST
      ?auto_13619 - PLACE
      ?auto_13622 - PLACE
      ?auto_13617 - HOIST
      ?auto_13620 - SURFACE
      ?auto_13625 - PLACE
      ?auto_13624 - HOIST
      ?auto_13643 - SURFACE
      ?auto_13634 - PLACE
      ?auto_13630 - HOIST
      ?auto_13632 - SURFACE
      ?auto_13629 - PLACE
      ?auto_13627 - HOIST
      ?auto_13623 - SURFACE
      ?auto_13637 - PLACE
      ?auto_13638 - HOIST
      ?auto_13639 - SURFACE
      ?auto_13633 - PLACE
      ?auto_13642 - HOIST
      ?auto_13635 - SURFACE
      ?auto_13628 - PLACE
      ?auto_13640 - HOIST
      ?auto_13636 - SURFACE
      ?auto_13641 - PLACE
      ?auto_13631 - HOIST
      ?auto_13626 - SURFACE
      ?auto_13618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13621 ?auto_13619 ) ( IS-CRATE ?auto_13615 ) ( not ( = ?auto_13622 ?auto_13619 ) ) ( HOIST-AT ?auto_13617 ?auto_13622 ) ( AVAILABLE ?auto_13617 ) ( SURFACE-AT ?auto_13615 ?auto_13622 ) ( ON ?auto_13615 ?auto_13620 ) ( CLEAR ?auto_13615 ) ( not ( = ?auto_13616 ?auto_13615 ) ) ( not ( = ?auto_13616 ?auto_13620 ) ) ( not ( = ?auto_13615 ?auto_13620 ) ) ( not ( = ?auto_13621 ?auto_13617 ) ) ( IS-CRATE ?auto_13616 ) ( not ( = ?auto_13625 ?auto_13619 ) ) ( HOIST-AT ?auto_13624 ?auto_13625 ) ( AVAILABLE ?auto_13624 ) ( SURFACE-AT ?auto_13616 ?auto_13625 ) ( ON ?auto_13616 ?auto_13643 ) ( CLEAR ?auto_13616 ) ( not ( = ?auto_13613 ?auto_13616 ) ) ( not ( = ?auto_13613 ?auto_13643 ) ) ( not ( = ?auto_13616 ?auto_13643 ) ) ( not ( = ?auto_13621 ?auto_13624 ) ) ( IS-CRATE ?auto_13613 ) ( not ( = ?auto_13634 ?auto_13619 ) ) ( HOIST-AT ?auto_13630 ?auto_13634 ) ( AVAILABLE ?auto_13630 ) ( SURFACE-AT ?auto_13613 ?auto_13634 ) ( ON ?auto_13613 ?auto_13632 ) ( CLEAR ?auto_13613 ) ( not ( = ?auto_13614 ?auto_13613 ) ) ( not ( = ?auto_13614 ?auto_13632 ) ) ( not ( = ?auto_13613 ?auto_13632 ) ) ( not ( = ?auto_13621 ?auto_13630 ) ) ( IS-CRATE ?auto_13614 ) ( not ( = ?auto_13629 ?auto_13619 ) ) ( HOIST-AT ?auto_13627 ?auto_13629 ) ( AVAILABLE ?auto_13627 ) ( SURFACE-AT ?auto_13614 ?auto_13629 ) ( ON ?auto_13614 ?auto_13623 ) ( CLEAR ?auto_13614 ) ( not ( = ?auto_13612 ?auto_13614 ) ) ( not ( = ?auto_13612 ?auto_13623 ) ) ( not ( = ?auto_13614 ?auto_13623 ) ) ( not ( = ?auto_13621 ?auto_13627 ) ) ( IS-CRATE ?auto_13612 ) ( not ( = ?auto_13637 ?auto_13619 ) ) ( HOIST-AT ?auto_13638 ?auto_13637 ) ( AVAILABLE ?auto_13638 ) ( SURFACE-AT ?auto_13612 ?auto_13637 ) ( ON ?auto_13612 ?auto_13639 ) ( CLEAR ?auto_13612 ) ( not ( = ?auto_13611 ?auto_13612 ) ) ( not ( = ?auto_13611 ?auto_13639 ) ) ( not ( = ?auto_13612 ?auto_13639 ) ) ( not ( = ?auto_13621 ?auto_13638 ) ) ( IS-CRATE ?auto_13611 ) ( not ( = ?auto_13633 ?auto_13619 ) ) ( HOIST-AT ?auto_13642 ?auto_13633 ) ( AVAILABLE ?auto_13642 ) ( SURFACE-AT ?auto_13611 ?auto_13633 ) ( ON ?auto_13611 ?auto_13635 ) ( CLEAR ?auto_13611 ) ( not ( = ?auto_13610 ?auto_13611 ) ) ( not ( = ?auto_13610 ?auto_13635 ) ) ( not ( = ?auto_13611 ?auto_13635 ) ) ( not ( = ?auto_13621 ?auto_13642 ) ) ( IS-CRATE ?auto_13610 ) ( not ( = ?auto_13628 ?auto_13619 ) ) ( HOIST-AT ?auto_13640 ?auto_13628 ) ( AVAILABLE ?auto_13640 ) ( SURFACE-AT ?auto_13610 ?auto_13628 ) ( ON ?auto_13610 ?auto_13636 ) ( CLEAR ?auto_13610 ) ( not ( = ?auto_13609 ?auto_13610 ) ) ( not ( = ?auto_13609 ?auto_13636 ) ) ( not ( = ?auto_13610 ?auto_13636 ) ) ( not ( = ?auto_13621 ?auto_13640 ) ) ( SURFACE-AT ?auto_13608 ?auto_13619 ) ( CLEAR ?auto_13608 ) ( IS-CRATE ?auto_13609 ) ( AVAILABLE ?auto_13621 ) ( not ( = ?auto_13641 ?auto_13619 ) ) ( HOIST-AT ?auto_13631 ?auto_13641 ) ( AVAILABLE ?auto_13631 ) ( SURFACE-AT ?auto_13609 ?auto_13641 ) ( ON ?auto_13609 ?auto_13626 ) ( CLEAR ?auto_13609 ) ( TRUCK-AT ?auto_13618 ?auto_13619 ) ( not ( = ?auto_13608 ?auto_13609 ) ) ( not ( = ?auto_13608 ?auto_13626 ) ) ( not ( = ?auto_13609 ?auto_13626 ) ) ( not ( = ?auto_13621 ?auto_13631 ) ) ( not ( = ?auto_13608 ?auto_13610 ) ) ( not ( = ?auto_13608 ?auto_13636 ) ) ( not ( = ?auto_13610 ?auto_13626 ) ) ( not ( = ?auto_13628 ?auto_13641 ) ) ( not ( = ?auto_13640 ?auto_13631 ) ) ( not ( = ?auto_13636 ?auto_13626 ) ) ( not ( = ?auto_13608 ?auto_13611 ) ) ( not ( = ?auto_13608 ?auto_13635 ) ) ( not ( = ?auto_13609 ?auto_13611 ) ) ( not ( = ?auto_13609 ?auto_13635 ) ) ( not ( = ?auto_13611 ?auto_13636 ) ) ( not ( = ?auto_13611 ?auto_13626 ) ) ( not ( = ?auto_13633 ?auto_13628 ) ) ( not ( = ?auto_13633 ?auto_13641 ) ) ( not ( = ?auto_13642 ?auto_13640 ) ) ( not ( = ?auto_13642 ?auto_13631 ) ) ( not ( = ?auto_13635 ?auto_13636 ) ) ( not ( = ?auto_13635 ?auto_13626 ) ) ( not ( = ?auto_13608 ?auto_13612 ) ) ( not ( = ?auto_13608 ?auto_13639 ) ) ( not ( = ?auto_13609 ?auto_13612 ) ) ( not ( = ?auto_13609 ?auto_13639 ) ) ( not ( = ?auto_13610 ?auto_13612 ) ) ( not ( = ?auto_13610 ?auto_13639 ) ) ( not ( = ?auto_13612 ?auto_13635 ) ) ( not ( = ?auto_13612 ?auto_13636 ) ) ( not ( = ?auto_13612 ?auto_13626 ) ) ( not ( = ?auto_13637 ?auto_13633 ) ) ( not ( = ?auto_13637 ?auto_13628 ) ) ( not ( = ?auto_13637 ?auto_13641 ) ) ( not ( = ?auto_13638 ?auto_13642 ) ) ( not ( = ?auto_13638 ?auto_13640 ) ) ( not ( = ?auto_13638 ?auto_13631 ) ) ( not ( = ?auto_13639 ?auto_13635 ) ) ( not ( = ?auto_13639 ?auto_13636 ) ) ( not ( = ?auto_13639 ?auto_13626 ) ) ( not ( = ?auto_13608 ?auto_13614 ) ) ( not ( = ?auto_13608 ?auto_13623 ) ) ( not ( = ?auto_13609 ?auto_13614 ) ) ( not ( = ?auto_13609 ?auto_13623 ) ) ( not ( = ?auto_13610 ?auto_13614 ) ) ( not ( = ?auto_13610 ?auto_13623 ) ) ( not ( = ?auto_13611 ?auto_13614 ) ) ( not ( = ?auto_13611 ?auto_13623 ) ) ( not ( = ?auto_13614 ?auto_13639 ) ) ( not ( = ?auto_13614 ?auto_13635 ) ) ( not ( = ?auto_13614 ?auto_13636 ) ) ( not ( = ?auto_13614 ?auto_13626 ) ) ( not ( = ?auto_13629 ?auto_13637 ) ) ( not ( = ?auto_13629 ?auto_13633 ) ) ( not ( = ?auto_13629 ?auto_13628 ) ) ( not ( = ?auto_13629 ?auto_13641 ) ) ( not ( = ?auto_13627 ?auto_13638 ) ) ( not ( = ?auto_13627 ?auto_13642 ) ) ( not ( = ?auto_13627 ?auto_13640 ) ) ( not ( = ?auto_13627 ?auto_13631 ) ) ( not ( = ?auto_13623 ?auto_13639 ) ) ( not ( = ?auto_13623 ?auto_13635 ) ) ( not ( = ?auto_13623 ?auto_13636 ) ) ( not ( = ?auto_13623 ?auto_13626 ) ) ( not ( = ?auto_13608 ?auto_13613 ) ) ( not ( = ?auto_13608 ?auto_13632 ) ) ( not ( = ?auto_13609 ?auto_13613 ) ) ( not ( = ?auto_13609 ?auto_13632 ) ) ( not ( = ?auto_13610 ?auto_13613 ) ) ( not ( = ?auto_13610 ?auto_13632 ) ) ( not ( = ?auto_13611 ?auto_13613 ) ) ( not ( = ?auto_13611 ?auto_13632 ) ) ( not ( = ?auto_13612 ?auto_13613 ) ) ( not ( = ?auto_13612 ?auto_13632 ) ) ( not ( = ?auto_13613 ?auto_13623 ) ) ( not ( = ?auto_13613 ?auto_13639 ) ) ( not ( = ?auto_13613 ?auto_13635 ) ) ( not ( = ?auto_13613 ?auto_13636 ) ) ( not ( = ?auto_13613 ?auto_13626 ) ) ( not ( = ?auto_13634 ?auto_13629 ) ) ( not ( = ?auto_13634 ?auto_13637 ) ) ( not ( = ?auto_13634 ?auto_13633 ) ) ( not ( = ?auto_13634 ?auto_13628 ) ) ( not ( = ?auto_13634 ?auto_13641 ) ) ( not ( = ?auto_13630 ?auto_13627 ) ) ( not ( = ?auto_13630 ?auto_13638 ) ) ( not ( = ?auto_13630 ?auto_13642 ) ) ( not ( = ?auto_13630 ?auto_13640 ) ) ( not ( = ?auto_13630 ?auto_13631 ) ) ( not ( = ?auto_13632 ?auto_13623 ) ) ( not ( = ?auto_13632 ?auto_13639 ) ) ( not ( = ?auto_13632 ?auto_13635 ) ) ( not ( = ?auto_13632 ?auto_13636 ) ) ( not ( = ?auto_13632 ?auto_13626 ) ) ( not ( = ?auto_13608 ?auto_13616 ) ) ( not ( = ?auto_13608 ?auto_13643 ) ) ( not ( = ?auto_13609 ?auto_13616 ) ) ( not ( = ?auto_13609 ?auto_13643 ) ) ( not ( = ?auto_13610 ?auto_13616 ) ) ( not ( = ?auto_13610 ?auto_13643 ) ) ( not ( = ?auto_13611 ?auto_13616 ) ) ( not ( = ?auto_13611 ?auto_13643 ) ) ( not ( = ?auto_13612 ?auto_13616 ) ) ( not ( = ?auto_13612 ?auto_13643 ) ) ( not ( = ?auto_13614 ?auto_13616 ) ) ( not ( = ?auto_13614 ?auto_13643 ) ) ( not ( = ?auto_13616 ?auto_13632 ) ) ( not ( = ?auto_13616 ?auto_13623 ) ) ( not ( = ?auto_13616 ?auto_13639 ) ) ( not ( = ?auto_13616 ?auto_13635 ) ) ( not ( = ?auto_13616 ?auto_13636 ) ) ( not ( = ?auto_13616 ?auto_13626 ) ) ( not ( = ?auto_13625 ?auto_13634 ) ) ( not ( = ?auto_13625 ?auto_13629 ) ) ( not ( = ?auto_13625 ?auto_13637 ) ) ( not ( = ?auto_13625 ?auto_13633 ) ) ( not ( = ?auto_13625 ?auto_13628 ) ) ( not ( = ?auto_13625 ?auto_13641 ) ) ( not ( = ?auto_13624 ?auto_13630 ) ) ( not ( = ?auto_13624 ?auto_13627 ) ) ( not ( = ?auto_13624 ?auto_13638 ) ) ( not ( = ?auto_13624 ?auto_13642 ) ) ( not ( = ?auto_13624 ?auto_13640 ) ) ( not ( = ?auto_13624 ?auto_13631 ) ) ( not ( = ?auto_13643 ?auto_13632 ) ) ( not ( = ?auto_13643 ?auto_13623 ) ) ( not ( = ?auto_13643 ?auto_13639 ) ) ( not ( = ?auto_13643 ?auto_13635 ) ) ( not ( = ?auto_13643 ?auto_13636 ) ) ( not ( = ?auto_13643 ?auto_13626 ) ) ( not ( = ?auto_13608 ?auto_13615 ) ) ( not ( = ?auto_13608 ?auto_13620 ) ) ( not ( = ?auto_13609 ?auto_13615 ) ) ( not ( = ?auto_13609 ?auto_13620 ) ) ( not ( = ?auto_13610 ?auto_13615 ) ) ( not ( = ?auto_13610 ?auto_13620 ) ) ( not ( = ?auto_13611 ?auto_13615 ) ) ( not ( = ?auto_13611 ?auto_13620 ) ) ( not ( = ?auto_13612 ?auto_13615 ) ) ( not ( = ?auto_13612 ?auto_13620 ) ) ( not ( = ?auto_13614 ?auto_13615 ) ) ( not ( = ?auto_13614 ?auto_13620 ) ) ( not ( = ?auto_13613 ?auto_13615 ) ) ( not ( = ?auto_13613 ?auto_13620 ) ) ( not ( = ?auto_13615 ?auto_13643 ) ) ( not ( = ?auto_13615 ?auto_13632 ) ) ( not ( = ?auto_13615 ?auto_13623 ) ) ( not ( = ?auto_13615 ?auto_13639 ) ) ( not ( = ?auto_13615 ?auto_13635 ) ) ( not ( = ?auto_13615 ?auto_13636 ) ) ( not ( = ?auto_13615 ?auto_13626 ) ) ( not ( = ?auto_13622 ?auto_13625 ) ) ( not ( = ?auto_13622 ?auto_13634 ) ) ( not ( = ?auto_13622 ?auto_13629 ) ) ( not ( = ?auto_13622 ?auto_13637 ) ) ( not ( = ?auto_13622 ?auto_13633 ) ) ( not ( = ?auto_13622 ?auto_13628 ) ) ( not ( = ?auto_13622 ?auto_13641 ) ) ( not ( = ?auto_13617 ?auto_13624 ) ) ( not ( = ?auto_13617 ?auto_13630 ) ) ( not ( = ?auto_13617 ?auto_13627 ) ) ( not ( = ?auto_13617 ?auto_13638 ) ) ( not ( = ?auto_13617 ?auto_13642 ) ) ( not ( = ?auto_13617 ?auto_13640 ) ) ( not ( = ?auto_13617 ?auto_13631 ) ) ( not ( = ?auto_13620 ?auto_13643 ) ) ( not ( = ?auto_13620 ?auto_13632 ) ) ( not ( = ?auto_13620 ?auto_13623 ) ) ( not ( = ?auto_13620 ?auto_13639 ) ) ( not ( = ?auto_13620 ?auto_13635 ) ) ( not ( = ?auto_13620 ?auto_13636 ) ) ( not ( = ?auto_13620 ?auto_13626 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_13608 ?auto_13609 ?auto_13610 ?auto_13611 ?auto_13612 ?auto_13614 ?auto_13613 ?auto_13616 )
      ( MAKE-1CRATE ?auto_13616 ?auto_13615 )
      ( MAKE-8CRATE-VERIFY ?auto_13608 ?auto_13609 ?auto_13610 ?auto_13611 ?auto_13612 ?auto_13614 ?auto_13613 ?auto_13616 ?auto_13615 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13646 - SURFACE
      ?auto_13647 - SURFACE
    )
    :vars
    (
      ?auto_13648 - HOIST
      ?auto_13649 - PLACE
      ?auto_13651 - PLACE
      ?auto_13652 - HOIST
      ?auto_13653 - SURFACE
      ?auto_13650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13648 ?auto_13649 ) ( SURFACE-AT ?auto_13646 ?auto_13649 ) ( CLEAR ?auto_13646 ) ( IS-CRATE ?auto_13647 ) ( AVAILABLE ?auto_13648 ) ( not ( = ?auto_13651 ?auto_13649 ) ) ( HOIST-AT ?auto_13652 ?auto_13651 ) ( AVAILABLE ?auto_13652 ) ( SURFACE-AT ?auto_13647 ?auto_13651 ) ( ON ?auto_13647 ?auto_13653 ) ( CLEAR ?auto_13647 ) ( TRUCK-AT ?auto_13650 ?auto_13649 ) ( not ( = ?auto_13646 ?auto_13647 ) ) ( not ( = ?auto_13646 ?auto_13653 ) ) ( not ( = ?auto_13647 ?auto_13653 ) ) ( not ( = ?auto_13648 ?auto_13652 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13650 ?auto_13649 ?auto_13651 )
      ( !LIFT ?auto_13652 ?auto_13647 ?auto_13653 ?auto_13651 )
      ( !LOAD ?auto_13652 ?auto_13647 ?auto_13650 ?auto_13651 )
      ( !DRIVE ?auto_13650 ?auto_13651 ?auto_13649 )
      ( !UNLOAD ?auto_13648 ?auto_13647 ?auto_13650 ?auto_13649 )
      ( !DROP ?auto_13648 ?auto_13647 ?auto_13646 ?auto_13649 )
      ( MAKE-1CRATE-VERIFY ?auto_13646 ?auto_13647 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_13664 - SURFACE
      ?auto_13665 - SURFACE
      ?auto_13666 - SURFACE
      ?auto_13667 - SURFACE
      ?auto_13668 - SURFACE
      ?auto_13671 - SURFACE
      ?auto_13669 - SURFACE
      ?auto_13673 - SURFACE
      ?auto_13672 - SURFACE
      ?auto_13670 - SURFACE
    )
    :vars
    (
      ?auto_13675 - HOIST
      ?auto_13678 - PLACE
      ?auto_13674 - PLACE
      ?auto_13679 - HOIST
      ?auto_13676 - SURFACE
      ?auto_13696 - PLACE
      ?auto_13703 - HOIST
      ?auto_13697 - SURFACE
      ?auto_13700 - PLACE
      ?auto_13702 - HOIST
      ?auto_13683 - SURFACE
      ?auto_13689 - PLACE
      ?auto_13692 - HOIST
      ?auto_13688 - SURFACE
      ?auto_13693 - PLACE
      ?auto_13695 - HOIST
      ?auto_13680 - SURFACE
      ?auto_13698 - PLACE
      ?auto_13685 - HOIST
      ?auto_13681 - SURFACE
      ?auto_13687 - PLACE
      ?auto_13684 - HOIST
      ?auto_13690 - SURFACE
      ?auto_13694 - PLACE
      ?auto_13699 - HOIST
      ?auto_13691 - SURFACE
      ?auto_13682 - PLACE
      ?auto_13686 - HOIST
      ?auto_13701 - SURFACE
      ?auto_13677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13675 ?auto_13678 ) ( IS-CRATE ?auto_13670 ) ( not ( = ?auto_13674 ?auto_13678 ) ) ( HOIST-AT ?auto_13679 ?auto_13674 ) ( AVAILABLE ?auto_13679 ) ( SURFACE-AT ?auto_13670 ?auto_13674 ) ( ON ?auto_13670 ?auto_13676 ) ( CLEAR ?auto_13670 ) ( not ( = ?auto_13672 ?auto_13670 ) ) ( not ( = ?auto_13672 ?auto_13676 ) ) ( not ( = ?auto_13670 ?auto_13676 ) ) ( not ( = ?auto_13675 ?auto_13679 ) ) ( IS-CRATE ?auto_13672 ) ( not ( = ?auto_13696 ?auto_13678 ) ) ( HOIST-AT ?auto_13703 ?auto_13696 ) ( AVAILABLE ?auto_13703 ) ( SURFACE-AT ?auto_13672 ?auto_13696 ) ( ON ?auto_13672 ?auto_13697 ) ( CLEAR ?auto_13672 ) ( not ( = ?auto_13673 ?auto_13672 ) ) ( not ( = ?auto_13673 ?auto_13697 ) ) ( not ( = ?auto_13672 ?auto_13697 ) ) ( not ( = ?auto_13675 ?auto_13703 ) ) ( IS-CRATE ?auto_13673 ) ( not ( = ?auto_13700 ?auto_13678 ) ) ( HOIST-AT ?auto_13702 ?auto_13700 ) ( AVAILABLE ?auto_13702 ) ( SURFACE-AT ?auto_13673 ?auto_13700 ) ( ON ?auto_13673 ?auto_13683 ) ( CLEAR ?auto_13673 ) ( not ( = ?auto_13669 ?auto_13673 ) ) ( not ( = ?auto_13669 ?auto_13683 ) ) ( not ( = ?auto_13673 ?auto_13683 ) ) ( not ( = ?auto_13675 ?auto_13702 ) ) ( IS-CRATE ?auto_13669 ) ( not ( = ?auto_13689 ?auto_13678 ) ) ( HOIST-AT ?auto_13692 ?auto_13689 ) ( AVAILABLE ?auto_13692 ) ( SURFACE-AT ?auto_13669 ?auto_13689 ) ( ON ?auto_13669 ?auto_13688 ) ( CLEAR ?auto_13669 ) ( not ( = ?auto_13671 ?auto_13669 ) ) ( not ( = ?auto_13671 ?auto_13688 ) ) ( not ( = ?auto_13669 ?auto_13688 ) ) ( not ( = ?auto_13675 ?auto_13692 ) ) ( IS-CRATE ?auto_13671 ) ( not ( = ?auto_13693 ?auto_13678 ) ) ( HOIST-AT ?auto_13695 ?auto_13693 ) ( AVAILABLE ?auto_13695 ) ( SURFACE-AT ?auto_13671 ?auto_13693 ) ( ON ?auto_13671 ?auto_13680 ) ( CLEAR ?auto_13671 ) ( not ( = ?auto_13668 ?auto_13671 ) ) ( not ( = ?auto_13668 ?auto_13680 ) ) ( not ( = ?auto_13671 ?auto_13680 ) ) ( not ( = ?auto_13675 ?auto_13695 ) ) ( IS-CRATE ?auto_13668 ) ( not ( = ?auto_13698 ?auto_13678 ) ) ( HOIST-AT ?auto_13685 ?auto_13698 ) ( AVAILABLE ?auto_13685 ) ( SURFACE-AT ?auto_13668 ?auto_13698 ) ( ON ?auto_13668 ?auto_13681 ) ( CLEAR ?auto_13668 ) ( not ( = ?auto_13667 ?auto_13668 ) ) ( not ( = ?auto_13667 ?auto_13681 ) ) ( not ( = ?auto_13668 ?auto_13681 ) ) ( not ( = ?auto_13675 ?auto_13685 ) ) ( IS-CRATE ?auto_13667 ) ( not ( = ?auto_13687 ?auto_13678 ) ) ( HOIST-AT ?auto_13684 ?auto_13687 ) ( AVAILABLE ?auto_13684 ) ( SURFACE-AT ?auto_13667 ?auto_13687 ) ( ON ?auto_13667 ?auto_13690 ) ( CLEAR ?auto_13667 ) ( not ( = ?auto_13666 ?auto_13667 ) ) ( not ( = ?auto_13666 ?auto_13690 ) ) ( not ( = ?auto_13667 ?auto_13690 ) ) ( not ( = ?auto_13675 ?auto_13684 ) ) ( IS-CRATE ?auto_13666 ) ( not ( = ?auto_13694 ?auto_13678 ) ) ( HOIST-AT ?auto_13699 ?auto_13694 ) ( AVAILABLE ?auto_13699 ) ( SURFACE-AT ?auto_13666 ?auto_13694 ) ( ON ?auto_13666 ?auto_13691 ) ( CLEAR ?auto_13666 ) ( not ( = ?auto_13665 ?auto_13666 ) ) ( not ( = ?auto_13665 ?auto_13691 ) ) ( not ( = ?auto_13666 ?auto_13691 ) ) ( not ( = ?auto_13675 ?auto_13699 ) ) ( SURFACE-AT ?auto_13664 ?auto_13678 ) ( CLEAR ?auto_13664 ) ( IS-CRATE ?auto_13665 ) ( AVAILABLE ?auto_13675 ) ( not ( = ?auto_13682 ?auto_13678 ) ) ( HOIST-AT ?auto_13686 ?auto_13682 ) ( AVAILABLE ?auto_13686 ) ( SURFACE-AT ?auto_13665 ?auto_13682 ) ( ON ?auto_13665 ?auto_13701 ) ( CLEAR ?auto_13665 ) ( TRUCK-AT ?auto_13677 ?auto_13678 ) ( not ( = ?auto_13664 ?auto_13665 ) ) ( not ( = ?auto_13664 ?auto_13701 ) ) ( not ( = ?auto_13665 ?auto_13701 ) ) ( not ( = ?auto_13675 ?auto_13686 ) ) ( not ( = ?auto_13664 ?auto_13666 ) ) ( not ( = ?auto_13664 ?auto_13691 ) ) ( not ( = ?auto_13666 ?auto_13701 ) ) ( not ( = ?auto_13694 ?auto_13682 ) ) ( not ( = ?auto_13699 ?auto_13686 ) ) ( not ( = ?auto_13691 ?auto_13701 ) ) ( not ( = ?auto_13664 ?auto_13667 ) ) ( not ( = ?auto_13664 ?auto_13690 ) ) ( not ( = ?auto_13665 ?auto_13667 ) ) ( not ( = ?auto_13665 ?auto_13690 ) ) ( not ( = ?auto_13667 ?auto_13691 ) ) ( not ( = ?auto_13667 ?auto_13701 ) ) ( not ( = ?auto_13687 ?auto_13694 ) ) ( not ( = ?auto_13687 ?auto_13682 ) ) ( not ( = ?auto_13684 ?auto_13699 ) ) ( not ( = ?auto_13684 ?auto_13686 ) ) ( not ( = ?auto_13690 ?auto_13691 ) ) ( not ( = ?auto_13690 ?auto_13701 ) ) ( not ( = ?auto_13664 ?auto_13668 ) ) ( not ( = ?auto_13664 ?auto_13681 ) ) ( not ( = ?auto_13665 ?auto_13668 ) ) ( not ( = ?auto_13665 ?auto_13681 ) ) ( not ( = ?auto_13666 ?auto_13668 ) ) ( not ( = ?auto_13666 ?auto_13681 ) ) ( not ( = ?auto_13668 ?auto_13690 ) ) ( not ( = ?auto_13668 ?auto_13691 ) ) ( not ( = ?auto_13668 ?auto_13701 ) ) ( not ( = ?auto_13698 ?auto_13687 ) ) ( not ( = ?auto_13698 ?auto_13694 ) ) ( not ( = ?auto_13698 ?auto_13682 ) ) ( not ( = ?auto_13685 ?auto_13684 ) ) ( not ( = ?auto_13685 ?auto_13699 ) ) ( not ( = ?auto_13685 ?auto_13686 ) ) ( not ( = ?auto_13681 ?auto_13690 ) ) ( not ( = ?auto_13681 ?auto_13691 ) ) ( not ( = ?auto_13681 ?auto_13701 ) ) ( not ( = ?auto_13664 ?auto_13671 ) ) ( not ( = ?auto_13664 ?auto_13680 ) ) ( not ( = ?auto_13665 ?auto_13671 ) ) ( not ( = ?auto_13665 ?auto_13680 ) ) ( not ( = ?auto_13666 ?auto_13671 ) ) ( not ( = ?auto_13666 ?auto_13680 ) ) ( not ( = ?auto_13667 ?auto_13671 ) ) ( not ( = ?auto_13667 ?auto_13680 ) ) ( not ( = ?auto_13671 ?auto_13681 ) ) ( not ( = ?auto_13671 ?auto_13690 ) ) ( not ( = ?auto_13671 ?auto_13691 ) ) ( not ( = ?auto_13671 ?auto_13701 ) ) ( not ( = ?auto_13693 ?auto_13698 ) ) ( not ( = ?auto_13693 ?auto_13687 ) ) ( not ( = ?auto_13693 ?auto_13694 ) ) ( not ( = ?auto_13693 ?auto_13682 ) ) ( not ( = ?auto_13695 ?auto_13685 ) ) ( not ( = ?auto_13695 ?auto_13684 ) ) ( not ( = ?auto_13695 ?auto_13699 ) ) ( not ( = ?auto_13695 ?auto_13686 ) ) ( not ( = ?auto_13680 ?auto_13681 ) ) ( not ( = ?auto_13680 ?auto_13690 ) ) ( not ( = ?auto_13680 ?auto_13691 ) ) ( not ( = ?auto_13680 ?auto_13701 ) ) ( not ( = ?auto_13664 ?auto_13669 ) ) ( not ( = ?auto_13664 ?auto_13688 ) ) ( not ( = ?auto_13665 ?auto_13669 ) ) ( not ( = ?auto_13665 ?auto_13688 ) ) ( not ( = ?auto_13666 ?auto_13669 ) ) ( not ( = ?auto_13666 ?auto_13688 ) ) ( not ( = ?auto_13667 ?auto_13669 ) ) ( not ( = ?auto_13667 ?auto_13688 ) ) ( not ( = ?auto_13668 ?auto_13669 ) ) ( not ( = ?auto_13668 ?auto_13688 ) ) ( not ( = ?auto_13669 ?auto_13680 ) ) ( not ( = ?auto_13669 ?auto_13681 ) ) ( not ( = ?auto_13669 ?auto_13690 ) ) ( not ( = ?auto_13669 ?auto_13691 ) ) ( not ( = ?auto_13669 ?auto_13701 ) ) ( not ( = ?auto_13689 ?auto_13693 ) ) ( not ( = ?auto_13689 ?auto_13698 ) ) ( not ( = ?auto_13689 ?auto_13687 ) ) ( not ( = ?auto_13689 ?auto_13694 ) ) ( not ( = ?auto_13689 ?auto_13682 ) ) ( not ( = ?auto_13692 ?auto_13695 ) ) ( not ( = ?auto_13692 ?auto_13685 ) ) ( not ( = ?auto_13692 ?auto_13684 ) ) ( not ( = ?auto_13692 ?auto_13699 ) ) ( not ( = ?auto_13692 ?auto_13686 ) ) ( not ( = ?auto_13688 ?auto_13680 ) ) ( not ( = ?auto_13688 ?auto_13681 ) ) ( not ( = ?auto_13688 ?auto_13690 ) ) ( not ( = ?auto_13688 ?auto_13691 ) ) ( not ( = ?auto_13688 ?auto_13701 ) ) ( not ( = ?auto_13664 ?auto_13673 ) ) ( not ( = ?auto_13664 ?auto_13683 ) ) ( not ( = ?auto_13665 ?auto_13673 ) ) ( not ( = ?auto_13665 ?auto_13683 ) ) ( not ( = ?auto_13666 ?auto_13673 ) ) ( not ( = ?auto_13666 ?auto_13683 ) ) ( not ( = ?auto_13667 ?auto_13673 ) ) ( not ( = ?auto_13667 ?auto_13683 ) ) ( not ( = ?auto_13668 ?auto_13673 ) ) ( not ( = ?auto_13668 ?auto_13683 ) ) ( not ( = ?auto_13671 ?auto_13673 ) ) ( not ( = ?auto_13671 ?auto_13683 ) ) ( not ( = ?auto_13673 ?auto_13688 ) ) ( not ( = ?auto_13673 ?auto_13680 ) ) ( not ( = ?auto_13673 ?auto_13681 ) ) ( not ( = ?auto_13673 ?auto_13690 ) ) ( not ( = ?auto_13673 ?auto_13691 ) ) ( not ( = ?auto_13673 ?auto_13701 ) ) ( not ( = ?auto_13700 ?auto_13689 ) ) ( not ( = ?auto_13700 ?auto_13693 ) ) ( not ( = ?auto_13700 ?auto_13698 ) ) ( not ( = ?auto_13700 ?auto_13687 ) ) ( not ( = ?auto_13700 ?auto_13694 ) ) ( not ( = ?auto_13700 ?auto_13682 ) ) ( not ( = ?auto_13702 ?auto_13692 ) ) ( not ( = ?auto_13702 ?auto_13695 ) ) ( not ( = ?auto_13702 ?auto_13685 ) ) ( not ( = ?auto_13702 ?auto_13684 ) ) ( not ( = ?auto_13702 ?auto_13699 ) ) ( not ( = ?auto_13702 ?auto_13686 ) ) ( not ( = ?auto_13683 ?auto_13688 ) ) ( not ( = ?auto_13683 ?auto_13680 ) ) ( not ( = ?auto_13683 ?auto_13681 ) ) ( not ( = ?auto_13683 ?auto_13690 ) ) ( not ( = ?auto_13683 ?auto_13691 ) ) ( not ( = ?auto_13683 ?auto_13701 ) ) ( not ( = ?auto_13664 ?auto_13672 ) ) ( not ( = ?auto_13664 ?auto_13697 ) ) ( not ( = ?auto_13665 ?auto_13672 ) ) ( not ( = ?auto_13665 ?auto_13697 ) ) ( not ( = ?auto_13666 ?auto_13672 ) ) ( not ( = ?auto_13666 ?auto_13697 ) ) ( not ( = ?auto_13667 ?auto_13672 ) ) ( not ( = ?auto_13667 ?auto_13697 ) ) ( not ( = ?auto_13668 ?auto_13672 ) ) ( not ( = ?auto_13668 ?auto_13697 ) ) ( not ( = ?auto_13671 ?auto_13672 ) ) ( not ( = ?auto_13671 ?auto_13697 ) ) ( not ( = ?auto_13669 ?auto_13672 ) ) ( not ( = ?auto_13669 ?auto_13697 ) ) ( not ( = ?auto_13672 ?auto_13683 ) ) ( not ( = ?auto_13672 ?auto_13688 ) ) ( not ( = ?auto_13672 ?auto_13680 ) ) ( not ( = ?auto_13672 ?auto_13681 ) ) ( not ( = ?auto_13672 ?auto_13690 ) ) ( not ( = ?auto_13672 ?auto_13691 ) ) ( not ( = ?auto_13672 ?auto_13701 ) ) ( not ( = ?auto_13696 ?auto_13700 ) ) ( not ( = ?auto_13696 ?auto_13689 ) ) ( not ( = ?auto_13696 ?auto_13693 ) ) ( not ( = ?auto_13696 ?auto_13698 ) ) ( not ( = ?auto_13696 ?auto_13687 ) ) ( not ( = ?auto_13696 ?auto_13694 ) ) ( not ( = ?auto_13696 ?auto_13682 ) ) ( not ( = ?auto_13703 ?auto_13702 ) ) ( not ( = ?auto_13703 ?auto_13692 ) ) ( not ( = ?auto_13703 ?auto_13695 ) ) ( not ( = ?auto_13703 ?auto_13685 ) ) ( not ( = ?auto_13703 ?auto_13684 ) ) ( not ( = ?auto_13703 ?auto_13699 ) ) ( not ( = ?auto_13703 ?auto_13686 ) ) ( not ( = ?auto_13697 ?auto_13683 ) ) ( not ( = ?auto_13697 ?auto_13688 ) ) ( not ( = ?auto_13697 ?auto_13680 ) ) ( not ( = ?auto_13697 ?auto_13681 ) ) ( not ( = ?auto_13697 ?auto_13690 ) ) ( not ( = ?auto_13697 ?auto_13691 ) ) ( not ( = ?auto_13697 ?auto_13701 ) ) ( not ( = ?auto_13664 ?auto_13670 ) ) ( not ( = ?auto_13664 ?auto_13676 ) ) ( not ( = ?auto_13665 ?auto_13670 ) ) ( not ( = ?auto_13665 ?auto_13676 ) ) ( not ( = ?auto_13666 ?auto_13670 ) ) ( not ( = ?auto_13666 ?auto_13676 ) ) ( not ( = ?auto_13667 ?auto_13670 ) ) ( not ( = ?auto_13667 ?auto_13676 ) ) ( not ( = ?auto_13668 ?auto_13670 ) ) ( not ( = ?auto_13668 ?auto_13676 ) ) ( not ( = ?auto_13671 ?auto_13670 ) ) ( not ( = ?auto_13671 ?auto_13676 ) ) ( not ( = ?auto_13669 ?auto_13670 ) ) ( not ( = ?auto_13669 ?auto_13676 ) ) ( not ( = ?auto_13673 ?auto_13670 ) ) ( not ( = ?auto_13673 ?auto_13676 ) ) ( not ( = ?auto_13670 ?auto_13697 ) ) ( not ( = ?auto_13670 ?auto_13683 ) ) ( not ( = ?auto_13670 ?auto_13688 ) ) ( not ( = ?auto_13670 ?auto_13680 ) ) ( not ( = ?auto_13670 ?auto_13681 ) ) ( not ( = ?auto_13670 ?auto_13690 ) ) ( not ( = ?auto_13670 ?auto_13691 ) ) ( not ( = ?auto_13670 ?auto_13701 ) ) ( not ( = ?auto_13674 ?auto_13696 ) ) ( not ( = ?auto_13674 ?auto_13700 ) ) ( not ( = ?auto_13674 ?auto_13689 ) ) ( not ( = ?auto_13674 ?auto_13693 ) ) ( not ( = ?auto_13674 ?auto_13698 ) ) ( not ( = ?auto_13674 ?auto_13687 ) ) ( not ( = ?auto_13674 ?auto_13694 ) ) ( not ( = ?auto_13674 ?auto_13682 ) ) ( not ( = ?auto_13679 ?auto_13703 ) ) ( not ( = ?auto_13679 ?auto_13702 ) ) ( not ( = ?auto_13679 ?auto_13692 ) ) ( not ( = ?auto_13679 ?auto_13695 ) ) ( not ( = ?auto_13679 ?auto_13685 ) ) ( not ( = ?auto_13679 ?auto_13684 ) ) ( not ( = ?auto_13679 ?auto_13699 ) ) ( not ( = ?auto_13679 ?auto_13686 ) ) ( not ( = ?auto_13676 ?auto_13697 ) ) ( not ( = ?auto_13676 ?auto_13683 ) ) ( not ( = ?auto_13676 ?auto_13688 ) ) ( not ( = ?auto_13676 ?auto_13680 ) ) ( not ( = ?auto_13676 ?auto_13681 ) ) ( not ( = ?auto_13676 ?auto_13690 ) ) ( not ( = ?auto_13676 ?auto_13691 ) ) ( not ( = ?auto_13676 ?auto_13701 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_13664 ?auto_13665 ?auto_13666 ?auto_13667 ?auto_13668 ?auto_13671 ?auto_13669 ?auto_13673 ?auto_13672 )
      ( MAKE-1CRATE ?auto_13672 ?auto_13670 )
      ( MAKE-9CRATE-VERIFY ?auto_13664 ?auto_13665 ?auto_13666 ?auto_13667 ?auto_13668 ?auto_13671 ?auto_13669 ?auto_13673 ?auto_13672 ?auto_13670 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13706 - SURFACE
      ?auto_13707 - SURFACE
    )
    :vars
    (
      ?auto_13708 - HOIST
      ?auto_13709 - PLACE
      ?auto_13711 - PLACE
      ?auto_13712 - HOIST
      ?auto_13713 - SURFACE
      ?auto_13710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13708 ?auto_13709 ) ( SURFACE-AT ?auto_13706 ?auto_13709 ) ( CLEAR ?auto_13706 ) ( IS-CRATE ?auto_13707 ) ( AVAILABLE ?auto_13708 ) ( not ( = ?auto_13711 ?auto_13709 ) ) ( HOIST-AT ?auto_13712 ?auto_13711 ) ( AVAILABLE ?auto_13712 ) ( SURFACE-AT ?auto_13707 ?auto_13711 ) ( ON ?auto_13707 ?auto_13713 ) ( CLEAR ?auto_13707 ) ( TRUCK-AT ?auto_13710 ?auto_13709 ) ( not ( = ?auto_13706 ?auto_13707 ) ) ( not ( = ?auto_13706 ?auto_13713 ) ) ( not ( = ?auto_13707 ?auto_13713 ) ) ( not ( = ?auto_13708 ?auto_13712 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13710 ?auto_13709 ?auto_13711 )
      ( !LIFT ?auto_13712 ?auto_13707 ?auto_13713 ?auto_13711 )
      ( !LOAD ?auto_13712 ?auto_13707 ?auto_13710 ?auto_13711 )
      ( !DRIVE ?auto_13710 ?auto_13711 ?auto_13709 )
      ( !UNLOAD ?auto_13708 ?auto_13707 ?auto_13710 ?auto_13709 )
      ( !DROP ?auto_13708 ?auto_13707 ?auto_13706 ?auto_13709 )
      ( MAKE-1CRATE-VERIFY ?auto_13706 ?auto_13707 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_13725 - SURFACE
      ?auto_13726 - SURFACE
      ?auto_13727 - SURFACE
      ?auto_13728 - SURFACE
      ?auto_13729 - SURFACE
      ?auto_13732 - SURFACE
      ?auto_13730 - SURFACE
      ?auto_13734 - SURFACE
      ?auto_13733 - SURFACE
      ?auto_13731 - SURFACE
      ?auto_13735 - SURFACE
    )
    :vars
    (
      ?auto_13739 - HOIST
      ?auto_13737 - PLACE
      ?auto_13741 - PLACE
      ?auto_13740 - HOIST
      ?auto_13736 - SURFACE
      ?auto_13749 - PLACE
      ?auto_13763 - HOIST
      ?auto_13747 - SURFACE
      ?auto_13758 - PLACE
      ?auto_13754 - HOIST
      ?auto_13745 - SURFACE
      ?auto_13756 - PLACE
      ?auto_13766 - HOIST
      ?auto_13744 - SURFACE
      ?auto_13751 - PLACE
      ?auto_13761 - HOIST
      ?auto_13750 - SURFACE
      ?auto_13752 - PLACE
      ?auto_13765 - HOIST
      ?auto_13768 - SURFACE
      ?auto_13743 - PLACE
      ?auto_13748 - HOIST
      ?auto_13742 - SURFACE
      ?auto_13753 - PLACE
      ?auto_13746 - HOIST
      ?auto_13760 - SURFACE
      ?auto_13755 - PLACE
      ?auto_13757 - HOIST
      ?auto_13767 - SURFACE
      ?auto_13759 - PLACE
      ?auto_13762 - HOIST
      ?auto_13764 - SURFACE
      ?auto_13738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13739 ?auto_13737 ) ( IS-CRATE ?auto_13735 ) ( not ( = ?auto_13741 ?auto_13737 ) ) ( HOIST-AT ?auto_13740 ?auto_13741 ) ( AVAILABLE ?auto_13740 ) ( SURFACE-AT ?auto_13735 ?auto_13741 ) ( ON ?auto_13735 ?auto_13736 ) ( CLEAR ?auto_13735 ) ( not ( = ?auto_13731 ?auto_13735 ) ) ( not ( = ?auto_13731 ?auto_13736 ) ) ( not ( = ?auto_13735 ?auto_13736 ) ) ( not ( = ?auto_13739 ?auto_13740 ) ) ( IS-CRATE ?auto_13731 ) ( not ( = ?auto_13749 ?auto_13737 ) ) ( HOIST-AT ?auto_13763 ?auto_13749 ) ( AVAILABLE ?auto_13763 ) ( SURFACE-AT ?auto_13731 ?auto_13749 ) ( ON ?auto_13731 ?auto_13747 ) ( CLEAR ?auto_13731 ) ( not ( = ?auto_13733 ?auto_13731 ) ) ( not ( = ?auto_13733 ?auto_13747 ) ) ( not ( = ?auto_13731 ?auto_13747 ) ) ( not ( = ?auto_13739 ?auto_13763 ) ) ( IS-CRATE ?auto_13733 ) ( not ( = ?auto_13758 ?auto_13737 ) ) ( HOIST-AT ?auto_13754 ?auto_13758 ) ( AVAILABLE ?auto_13754 ) ( SURFACE-AT ?auto_13733 ?auto_13758 ) ( ON ?auto_13733 ?auto_13745 ) ( CLEAR ?auto_13733 ) ( not ( = ?auto_13734 ?auto_13733 ) ) ( not ( = ?auto_13734 ?auto_13745 ) ) ( not ( = ?auto_13733 ?auto_13745 ) ) ( not ( = ?auto_13739 ?auto_13754 ) ) ( IS-CRATE ?auto_13734 ) ( not ( = ?auto_13756 ?auto_13737 ) ) ( HOIST-AT ?auto_13766 ?auto_13756 ) ( AVAILABLE ?auto_13766 ) ( SURFACE-AT ?auto_13734 ?auto_13756 ) ( ON ?auto_13734 ?auto_13744 ) ( CLEAR ?auto_13734 ) ( not ( = ?auto_13730 ?auto_13734 ) ) ( not ( = ?auto_13730 ?auto_13744 ) ) ( not ( = ?auto_13734 ?auto_13744 ) ) ( not ( = ?auto_13739 ?auto_13766 ) ) ( IS-CRATE ?auto_13730 ) ( not ( = ?auto_13751 ?auto_13737 ) ) ( HOIST-AT ?auto_13761 ?auto_13751 ) ( AVAILABLE ?auto_13761 ) ( SURFACE-AT ?auto_13730 ?auto_13751 ) ( ON ?auto_13730 ?auto_13750 ) ( CLEAR ?auto_13730 ) ( not ( = ?auto_13732 ?auto_13730 ) ) ( not ( = ?auto_13732 ?auto_13750 ) ) ( not ( = ?auto_13730 ?auto_13750 ) ) ( not ( = ?auto_13739 ?auto_13761 ) ) ( IS-CRATE ?auto_13732 ) ( not ( = ?auto_13752 ?auto_13737 ) ) ( HOIST-AT ?auto_13765 ?auto_13752 ) ( AVAILABLE ?auto_13765 ) ( SURFACE-AT ?auto_13732 ?auto_13752 ) ( ON ?auto_13732 ?auto_13768 ) ( CLEAR ?auto_13732 ) ( not ( = ?auto_13729 ?auto_13732 ) ) ( not ( = ?auto_13729 ?auto_13768 ) ) ( not ( = ?auto_13732 ?auto_13768 ) ) ( not ( = ?auto_13739 ?auto_13765 ) ) ( IS-CRATE ?auto_13729 ) ( not ( = ?auto_13743 ?auto_13737 ) ) ( HOIST-AT ?auto_13748 ?auto_13743 ) ( AVAILABLE ?auto_13748 ) ( SURFACE-AT ?auto_13729 ?auto_13743 ) ( ON ?auto_13729 ?auto_13742 ) ( CLEAR ?auto_13729 ) ( not ( = ?auto_13728 ?auto_13729 ) ) ( not ( = ?auto_13728 ?auto_13742 ) ) ( not ( = ?auto_13729 ?auto_13742 ) ) ( not ( = ?auto_13739 ?auto_13748 ) ) ( IS-CRATE ?auto_13728 ) ( not ( = ?auto_13753 ?auto_13737 ) ) ( HOIST-AT ?auto_13746 ?auto_13753 ) ( AVAILABLE ?auto_13746 ) ( SURFACE-AT ?auto_13728 ?auto_13753 ) ( ON ?auto_13728 ?auto_13760 ) ( CLEAR ?auto_13728 ) ( not ( = ?auto_13727 ?auto_13728 ) ) ( not ( = ?auto_13727 ?auto_13760 ) ) ( not ( = ?auto_13728 ?auto_13760 ) ) ( not ( = ?auto_13739 ?auto_13746 ) ) ( IS-CRATE ?auto_13727 ) ( not ( = ?auto_13755 ?auto_13737 ) ) ( HOIST-AT ?auto_13757 ?auto_13755 ) ( AVAILABLE ?auto_13757 ) ( SURFACE-AT ?auto_13727 ?auto_13755 ) ( ON ?auto_13727 ?auto_13767 ) ( CLEAR ?auto_13727 ) ( not ( = ?auto_13726 ?auto_13727 ) ) ( not ( = ?auto_13726 ?auto_13767 ) ) ( not ( = ?auto_13727 ?auto_13767 ) ) ( not ( = ?auto_13739 ?auto_13757 ) ) ( SURFACE-AT ?auto_13725 ?auto_13737 ) ( CLEAR ?auto_13725 ) ( IS-CRATE ?auto_13726 ) ( AVAILABLE ?auto_13739 ) ( not ( = ?auto_13759 ?auto_13737 ) ) ( HOIST-AT ?auto_13762 ?auto_13759 ) ( AVAILABLE ?auto_13762 ) ( SURFACE-AT ?auto_13726 ?auto_13759 ) ( ON ?auto_13726 ?auto_13764 ) ( CLEAR ?auto_13726 ) ( TRUCK-AT ?auto_13738 ?auto_13737 ) ( not ( = ?auto_13725 ?auto_13726 ) ) ( not ( = ?auto_13725 ?auto_13764 ) ) ( not ( = ?auto_13726 ?auto_13764 ) ) ( not ( = ?auto_13739 ?auto_13762 ) ) ( not ( = ?auto_13725 ?auto_13727 ) ) ( not ( = ?auto_13725 ?auto_13767 ) ) ( not ( = ?auto_13727 ?auto_13764 ) ) ( not ( = ?auto_13755 ?auto_13759 ) ) ( not ( = ?auto_13757 ?auto_13762 ) ) ( not ( = ?auto_13767 ?auto_13764 ) ) ( not ( = ?auto_13725 ?auto_13728 ) ) ( not ( = ?auto_13725 ?auto_13760 ) ) ( not ( = ?auto_13726 ?auto_13728 ) ) ( not ( = ?auto_13726 ?auto_13760 ) ) ( not ( = ?auto_13728 ?auto_13767 ) ) ( not ( = ?auto_13728 ?auto_13764 ) ) ( not ( = ?auto_13753 ?auto_13755 ) ) ( not ( = ?auto_13753 ?auto_13759 ) ) ( not ( = ?auto_13746 ?auto_13757 ) ) ( not ( = ?auto_13746 ?auto_13762 ) ) ( not ( = ?auto_13760 ?auto_13767 ) ) ( not ( = ?auto_13760 ?auto_13764 ) ) ( not ( = ?auto_13725 ?auto_13729 ) ) ( not ( = ?auto_13725 ?auto_13742 ) ) ( not ( = ?auto_13726 ?auto_13729 ) ) ( not ( = ?auto_13726 ?auto_13742 ) ) ( not ( = ?auto_13727 ?auto_13729 ) ) ( not ( = ?auto_13727 ?auto_13742 ) ) ( not ( = ?auto_13729 ?auto_13760 ) ) ( not ( = ?auto_13729 ?auto_13767 ) ) ( not ( = ?auto_13729 ?auto_13764 ) ) ( not ( = ?auto_13743 ?auto_13753 ) ) ( not ( = ?auto_13743 ?auto_13755 ) ) ( not ( = ?auto_13743 ?auto_13759 ) ) ( not ( = ?auto_13748 ?auto_13746 ) ) ( not ( = ?auto_13748 ?auto_13757 ) ) ( not ( = ?auto_13748 ?auto_13762 ) ) ( not ( = ?auto_13742 ?auto_13760 ) ) ( not ( = ?auto_13742 ?auto_13767 ) ) ( not ( = ?auto_13742 ?auto_13764 ) ) ( not ( = ?auto_13725 ?auto_13732 ) ) ( not ( = ?auto_13725 ?auto_13768 ) ) ( not ( = ?auto_13726 ?auto_13732 ) ) ( not ( = ?auto_13726 ?auto_13768 ) ) ( not ( = ?auto_13727 ?auto_13732 ) ) ( not ( = ?auto_13727 ?auto_13768 ) ) ( not ( = ?auto_13728 ?auto_13732 ) ) ( not ( = ?auto_13728 ?auto_13768 ) ) ( not ( = ?auto_13732 ?auto_13742 ) ) ( not ( = ?auto_13732 ?auto_13760 ) ) ( not ( = ?auto_13732 ?auto_13767 ) ) ( not ( = ?auto_13732 ?auto_13764 ) ) ( not ( = ?auto_13752 ?auto_13743 ) ) ( not ( = ?auto_13752 ?auto_13753 ) ) ( not ( = ?auto_13752 ?auto_13755 ) ) ( not ( = ?auto_13752 ?auto_13759 ) ) ( not ( = ?auto_13765 ?auto_13748 ) ) ( not ( = ?auto_13765 ?auto_13746 ) ) ( not ( = ?auto_13765 ?auto_13757 ) ) ( not ( = ?auto_13765 ?auto_13762 ) ) ( not ( = ?auto_13768 ?auto_13742 ) ) ( not ( = ?auto_13768 ?auto_13760 ) ) ( not ( = ?auto_13768 ?auto_13767 ) ) ( not ( = ?auto_13768 ?auto_13764 ) ) ( not ( = ?auto_13725 ?auto_13730 ) ) ( not ( = ?auto_13725 ?auto_13750 ) ) ( not ( = ?auto_13726 ?auto_13730 ) ) ( not ( = ?auto_13726 ?auto_13750 ) ) ( not ( = ?auto_13727 ?auto_13730 ) ) ( not ( = ?auto_13727 ?auto_13750 ) ) ( not ( = ?auto_13728 ?auto_13730 ) ) ( not ( = ?auto_13728 ?auto_13750 ) ) ( not ( = ?auto_13729 ?auto_13730 ) ) ( not ( = ?auto_13729 ?auto_13750 ) ) ( not ( = ?auto_13730 ?auto_13768 ) ) ( not ( = ?auto_13730 ?auto_13742 ) ) ( not ( = ?auto_13730 ?auto_13760 ) ) ( not ( = ?auto_13730 ?auto_13767 ) ) ( not ( = ?auto_13730 ?auto_13764 ) ) ( not ( = ?auto_13751 ?auto_13752 ) ) ( not ( = ?auto_13751 ?auto_13743 ) ) ( not ( = ?auto_13751 ?auto_13753 ) ) ( not ( = ?auto_13751 ?auto_13755 ) ) ( not ( = ?auto_13751 ?auto_13759 ) ) ( not ( = ?auto_13761 ?auto_13765 ) ) ( not ( = ?auto_13761 ?auto_13748 ) ) ( not ( = ?auto_13761 ?auto_13746 ) ) ( not ( = ?auto_13761 ?auto_13757 ) ) ( not ( = ?auto_13761 ?auto_13762 ) ) ( not ( = ?auto_13750 ?auto_13768 ) ) ( not ( = ?auto_13750 ?auto_13742 ) ) ( not ( = ?auto_13750 ?auto_13760 ) ) ( not ( = ?auto_13750 ?auto_13767 ) ) ( not ( = ?auto_13750 ?auto_13764 ) ) ( not ( = ?auto_13725 ?auto_13734 ) ) ( not ( = ?auto_13725 ?auto_13744 ) ) ( not ( = ?auto_13726 ?auto_13734 ) ) ( not ( = ?auto_13726 ?auto_13744 ) ) ( not ( = ?auto_13727 ?auto_13734 ) ) ( not ( = ?auto_13727 ?auto_13744 ) ) ( not ( = ?auto_13728 ?auto_13734 ) ) ( not ( = ?auto_13728 ?auto_13744 ) ) ( not ( = ?auto_13729 ?auto_13734 ) ) ( not ( = ?auto_13729 ?auto_13744 ) ) ( not ( = ?auto_13732 ?auto_13734 ) ) ( not ( = ?auto_13732 ?auto_13744 ) ) ( not ( = ?auto_13734 ?auto_13750 ) ) ( not ( = ?auto_13734 ?auto_13768 ) ) ( not ( = ?auto_13734 ?auto_13742 ) ) ( not ( = ?auto_13734 ?auto_13760 ) ) ( not ( = ?auto_13734 ?auto_13767 ) ) ( not ( = ?auto_13734 ?auto_13764 ) ) ( not ( = ?auto_13756 ?auto_13751 ) ) ( not ( = ?auto_13756 ?auto_13752 ) ) ( not ( = ?auto_13756 ?auto_13743 ) ) ( not ( = ?auto_13756 ?auto_13753 ) ) ( not ( = ?auto_13756 ?auto_13755 ) ) ( not ( = ?auto_13756 ?auto_13759 ) ) ( not ( = ?auto_13766 ?auto_13761 ) ) ( not ( = ?auto_13766 ?auto_13765 ) ) ( not ( = ?auto_13766 ?auto_13748 ) ) ( not ( = ?auto_13766 ?auto_13746 ) ) ( not ( = ?auto_13766 ?auto_13757 ) ) ( not ( = ?auto_13766 ?auto_13762 ) ) ( not ( = ?auto_13744 ?auto_13750 ) ) ( not ( = ?auto_13744 ?auto_13768 ) ) ( not ( = ?auto_13744 ?auto_13742 ) ) ( not ( = ?auto_13744 ?auto_13760 ) ) ( not ( = ?auto_13744 ?auto_13767 ) ) ( not ( = ?auto_13744 ?auto_13764 ) ) ( not ( = ?auto_13725 ?auto_13733 ) ) ( not ( = ?auto_13725 ?auto_13745 ) ) ( not ( = ?auto_13726 ?auto_13733 ) ) ( not ( = ?auto_13726 ?auto_13745 ) ) ( not ( = ?auto_13727 ?auto_13733 ) ) ( not ( = ?auto_13727 ?auto_13745 ) ) ( not ( = ?auto_13728 ?auto_13733 ) ) ( not ( = ?auto_13728 ?auto_13745 ) ) ( not ( = ?auto_13729 ?auto_13733 ) ) ( not ( = ?auto_13729 ?auto_13745 ) ) ( not ( = ?auto_13732 ?auto_13733 ) ) ( not ( = ?auto_13732 ?auto_13745 ) ) ( not ( = ?auto_13730 ?auto_13733 ) ) ( not ( = ?auto_13730 ?auto_13745 ) ) ( not ( = ?auto_13733 ?auto_13744 ) ) ( not ( = ?auto_13733 ?auto_13750 ) ) ( not ( = ?auto_13733 ?auto_13768 ) ) ( not ( = ?auto_13733 ?auto_13742 ) ) ( not ( = ?auto_13733 ?auto_13760 ) ) ( not ( = ?auto_13733 ?auto_13767 ) ) ( not ( = ?auto_13733 ?auto_13764 ) ) ( not ( = ?auto_13758 ?auto_13756 ) ) ( not ( = ?auto_13758 ?auto_13751 ) ) ( not ( = ?auto_13758 ?auto_13752 ) ) ( not ( = ?auto_13758 ?auto_13743 ) ) ( not ( = ?auto_13758 ?auto_13753 ) ) ( not ( = ?auto_13758 ?auto_13755 ) ) ( not ( = ?auto_13758 ?auto_13759 ) ) ( not ( = ?auto_13754 ?auto_13766 ) ) ( not ( = ?auto_13754 ?auto_13761 ) ) ( not ( = ?auto_13754 ?auto_13765 ) ) ( not ( = ?auto_13754 ?auto_13748 ) ) ( not ( = ?auto_13754 ?auto_13746 ) ) ( not ( = ?auto_13754 ?auto_13757 ) ) ( not ( = ?auto_13754 ?auto_13762 ) ) ( not ( = ?auto_13745 ?auto_13744 ) ) ( not ( = ?auto_13745 ?auto_13750 ) ) ( not ( = ?auto_13745 ?auto_13768 ) ) ( not ( = ?auto_13745 ?auto_13742 ) ) ( not ( = ?auto_13745 ?auto_13760 ) ) ( not ( = ?auto_13745 ?auto_13767 ) ) ( not ( = ?auto_13745 ?auto_13764 ) ) ( not ( = ?auto_13725 ?auto_13731 ) ) ( not ( = ?auto_13725 ?auto_13747 ) ) ( not ( = ?auto_13726 ?auto_13731 ) ) ( not ( = ?auto_13726 ?auto_13747 ) ) ( not ( = ?auto_13727 ?auto_13731 ) ) ( not ( = ?auto_13727 ?auto_13747 ) ) ( not ( = ?auto_13728 ?auto_13731 ) ) ( not ( = ?auto_13728 ?auto_13747 ) ) ( not ( = ?auto_13729 ?auto_13731 ) ) ( not ( = ?auto_13729 ?auto_13747 ) ) ( not ( = ?auto_13732 ?auto_13731 ) ) ( not ( = ?auto_13732 ?auto_13747 ) ) ( not ( = ?auto_13730 ?auto_13731 ) ) ( not ( = ?auto_13730 ?auto_13747 ) ) ( not ( = ?auto_13734 ?auto_13731 ) ) ( not ( = ?auto_13734 ?auto_13747 ) ) ( not ( = ?auto_13731 ?auto_13745 ) ) ( not ( = ?auto_13731 ?auto_13744 ) ) ( not ( = ?auto_13731 ?auto_13750 ) ) ( not ( = ?auto_13731 ?auto_13768 ) ) ( not ( = ?auto_13731 ?auto_13742 ) ) ( not ( = ?auto_13731 ?auto_13760 ) ) ( not ( = ?auto_13731 ?auto_13767 ) ) ( not ( = ?auto_13731 ?auto_13764 ) ) ( not ( = ?auto_13749 ?auto_13758 ) ) ( not ( = ?auto_13749 ?auto_13756 ) ) ( not ( = ?auto_13749 ?auto_13751 ) ) ( not ( = ?auto_13749 ?auto_13752 ) ) ( not ( = ?auto_13749 ?auto_13743 ) ) ( not ( = ?auto_13749 ?auto_13753 ) ) ( not ( = ?auto_13749 ?auto_13755 ) ) ( not ( = ?auto_13749 ?auto_13759 ) ) ( not ( = ?auto_13763 ?auto_13754 ) ) ( not ( = ?auto_13763 ?auto_13766 ) ) ( not ( = ?auto_13763 ?auto_13761 ) ) ( not ( = ?auto_13763 ?auto_13765 ) ) ( not ( = ?auto_13763 ?auto_13748 ) ) ( not ( = ?auto_13763 ?auto_13746 ) ) ( not ( = ?auto_13763 ?auto_13757 ) ) ( not ( = ?auto_13763 ?auto_13762 ) ) ( not ( = ?auto_13747 ?auto_13745 ) ) ( not ( = ?auto_13747 ?auto_13744 ) ) ( not ( = ?auto_13747 ?auto_13750 ) ) ( not ( = ?auto_13747 ?auto_13768 ) ) ( not ( = ?auto_13747 ?auto_13742 ) ) ( not ( = ?auto_13747 ?auto_13760 ) ) ( not ( = ?auto_13747 ?auto_13767 ) ) ( not ( = ?auto_13747 ?auto_13764 ) ) ( not ( = ?auto_13725 ?auto_13735 ) ) ( not ( = ?auto_13725 ?auto_13736 ) ) ( not ( = ?auto_13726 ?auto_13735 ) ) ( not ( = ?auto_13726 ?auto_13736 ) ) ( not ( = ?auto_13727 ?auto_13735 ) ) ( not ( = ?auto_13727 ?auto_13736 ) ) ( not ( = ?auto_13728 ?auto_13735 ) ) ( not ( = ?auto_13728 ?auto_13736 ) ) ( not ( = ?auto_13729 ?auto_13735 ) ) ( not ( = ?auto_13729 ?auto_13736 ) ) ( not ( = ?auto_13732 ?auto_13735 ) ) ( not ( = ?auto_13732 ?auto_13736 ) ) ( not ( = ?auto_13730 ?auto_13735 ) ) ( not ( = ?auto_13730 ?auto_13736 ) ) ( not ( = ?auto_13734 ?auto_13735 ) ) ( not ( = ?auto_13734 ?auto_13736 ) ) ( not ( = ?auto_13733 ?auto_13735 ) ) ( not ( = ?auto_13733 ?auto_13736 ) ) ( not ( = ?auto_13735 ?auto_13747 ) ) ( not ( = ?auto_13735 ?auto_13745 ) ) ( not ( = ?auto_13735 ?auto_13744 ) ) ( not ( = ?auto_13735 ?auto_13750 ) ) ( not ( = ?auto_13735 ?auto_13768 ) ) ( not ( = ?auto_13735 ?auto_13742 ) ) ( not ( = ?auto_13735 ?auto_13760 ) ) ( not ( = ?auto_13735 ?auto_13767 ) ) ( not ( = ?auto_13735 ?auto_13764 ) ) ( not ( = ?auto_13741 ?auto_13749 ) ) ( not ( = ?auto_13741 ?auto_13758 ) ) ( not ( = ?auto_13741 ?auto_13756 ) ) ( not ( = ?auto_13741 ?auto_13751 ) ) ( not ( = ?auto_13741 ?auto_13752 ) ) ( not ( = ?auto_13741 ?auto_13743 ) ) ( not ( = ?auto_13741 ?auto_13753 ) ) ( not ( = ?auto_13741 ?auto_13755 ) ) ( not ( = ?auto_13741 ?auto_13759 ) ) ( not ( = ?auto_13740 ?auto_13763 ) ) ( not ( = ?auto_13740 ?auto_13754 ) ) ( not ( = ?auto_13740 ?auto_13766 ) ) ( not ( = ?auto_13740 ?auto_13761 ) ) ( not ( = ?auto_13740 ?auto_13765 ) ) ( not ( = ?auto_13740 ?auto_13748 ) ) ( not ( = ?auto_13740 ?auto_13746 ) ) ( not ( = ?auto_13740 ?auto_13757 ) ) ( not ( = ?auto_13740 ?auto_13762 ) ) ( not ( = ?auto_13736 ?auto_13747 ) ) ( not ( = ?auto_13736 ?auto_13745 ) ) ( not ( = ?auto_13736 ?auto_13744 ) ) ( not ( = ?auto_13736 ?auto_13750 ) ) ( not ( = ?auto_13736 ?auto_13768 ) ) ( not ( = ?auto_13736 ?auto_13742 ) ) ( not ( = ?auto_13736 ?auto_13760 ) ) ( not ( = ?auto_13736 ?auto_13767 ) ) ( not ( = ?auto_13736 ?auto_13764 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_13725 ?auto_13726 ?auto_13727 ?auto_13728 ?auto_13729 ?auto_13732 ?auto_13730 ?auto_13734 ?auto_13733 ?auto_13731 )
      ( MAKE-1CRATE ?auto_13731 ?auto_13735 )
      ( MAKE-10CRATE-VERIFY ?auto_13725 ?auto_13726 ?auto_13727 ?auto_13728 ?auto_13729 ?auto_13732 ?auto_13730 ?auto_13734 ?auto_13733 ?auto_13731 ?auto_13735 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13771 - SURFACE
      ?auto_13772 - SURFACE
    )
    :vars
    (
      ?auto_13773 - HOIST
      ?auto_13774 - PLACE
      ?auto_13776 - PLACE
      ?auto_13777 - HOIST
      ?auto_13778 - SURFACE
      ?auto_13775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13773 ?auto_13774 ) ( SURFACE-AT ?auto_13771 ?auto_13774 ) ( CLEAR ?auto_13771 ) ( IS-CRATE ?auto_13772 ) ( AVAILABLE ?auto_13773 ) ( not ( = ?auto_13776 ?auto_13774 ) ) ( HOIST-AT ?auto_13777 ?auto_13776 ) ( AVAILABLE ?auto_13777 ) ( SURFACE-AT ?auto_13772 ?auto_13776 ) ( ON ?auto_13772 ?auto_13778 ) ( CLEAR ?auto_13772 ) ( TRUCK-AT ?auto_13775 ?auto_13774 ) ( not ( = ?auto_13771 ?auto_13772 ) ) ( not ( = ?auto_13771 ?auto_13778 ) ) ( not ( = ?auto_13772 ?auto_13778 ) ) ( not ( = ?auto_13773 ?auto_13777 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13775 ?auto_13774 ?auto_13776 )
      ( !LIFT ?auto_13777 ?auto_13772 ?auto_13778 ?auto_13776 )
      ( !LOAD ?auto_13777 ?auto_13772 ?auto_13775 ?auto_13776 )
      ( !DRIVE ?auto_13775 ?auto_13776 ?auto_13774 )
      ( !UNLOAD ?auto_13773 ?auto_13772 ?auto_13775 ?auto_13774 )
      ( !DROP ?auto_13773 ?auto_13772 ?auto_13771 ?auto_13774 )
      ( MAKE-1CRATE-VERIFY ?auto_13771 ?auto_13772 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_13791 - SURFACE
      ?auto_13792 - SURFACE
      ?auto_13793 - SURFACE
      ?auto_13794 - SURFACE
      ?auto_13795 - SURFACE
      ?auto_13798 - SURFACE
      ?auto_13796 - SURFACE
      ?auto_13800 - SURFACE
      ?auto_13799 - SURFACE
      ?auto_13797 - SURFACE
      ?auto_13802 - SURFACE
      ?auto_13801 - SURFACE
    )
    :vars
    (
      ?auto_13805 - HOIST
      ?auto_13803 - PLACE
      ?auto_13804 - PLACE
      ?auto_13807 - HOIST
      ?auto_13808 - SURFACE
      ?auto_13838 - PLACE
      ?auto_13809 - HOIST
      ?auto_13832 - SURFACE
      ?auto_13826 - PLACE
      ?auto_13828 - HOIST
      ?auto_13829 - SURFACE
      ?auto_13819 - PLACE
      ?auto_13822 - HOIST
      ?auto_13831 - SURFACE
      ?auto_13833 - PLACE
      ?auto_13816 - HOIST
      ?auto_13820 - SURFACE
      ?auto_13815 - PLACE
      ?auto_13827 - HOIST
      ?auto_13817 - SURFACE
      ?auto_13823 - PLACE
      ?auto_13834 - HOIST
      ?auto_13811 - SURFACE
      ?auto_13836 - PLACE
      ?auto_13812 - HOIST
      ?auto_13830 - SURFACE
      ?auto_13818 - PLACE
      ?auto_13813 - HOIST
      ?auto_13821 - SURFACE
      ?auto_13814 - PLACE
      ?auto_13837 - HOIST
      ?auto_13835 - SURFACE
      ?auto_13810 - PLACE
      ?auto_13824 - HOIST
      ?auto_13825 - SURFACE
      ?auto_13806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13805 ?auto_13803 ) ( IS-CRATE ?auto_13801 ) ( not ( = ?auto_13804 ?auto_13803 ) ) ( HOIST-AT ?auto_13807 ?auto_13804 ) ( AVAILABLE ?auto_13807 ) ( SURFACE-AT ?auto_13801 ?auto_13804 ) ( ON ?auto_13801 ?auto_13808 ) ( CLEAR ?auto_13801 ) ( not ( = ?auto_13802 ?auto_13801 ) ) ( not ( = ?auto_13802 ?auto_13808 ) ) ( not ( = ?auto_13801 ?auto_13808 ) ) ( not ( = ?auto_13805 ?auto_13807 ) ) ( IS-CRATE ?auto_13802 ) ( not ( = ?auto_13838 ?auto_13803 ) ) ( HOIST-AT ?auto_13809 ?auto_13838 ) ( AVAILABLE ?auto_13809 ) ( SURFACE-AT ?auto_13802 ?auto_13838 ) ( ON ?auto_13802 ?auto_13832 ) ( CLEAR ?auto_13802 ) ( not ( = ?auto_13797 ?auto_13802 ) ) ( not ( = ?auto_13797 ?auto_13832 ) ) ( not ( = ?auto_13802 ?auto_13832 ) ) ( not ( = ?auto_13805 ?auto_13809 ) ) ( IS-CRATE ?auto_13797 ) ( not ( = ?auto_13826 ?auto_13803 ) ) ( HOIST-AT ?auto_13828 ?auto_13826 ) ( AVAILABLE ?auto_13828 ) ( SURFACE-AT ?auto_13797 ?auto_13826 ) ( ON ?auto_13797 ?auto_13829 ) ( CLEAR ?auto_13797 ) ( not ( = ?auto_13799 ?auto_13797 ) ) ( not ( = ?auto_13799 ?auto_13829 ) ) ( not ( = ?auto_13797 ?auto_13829 ) ) ( not ( = ?auto_13805 ?auto_13828 ) ) ( IS-CRATE ?auto_13799 ) ( not ( = ?auto_13819 ?auto_13803 ) ) ( HOIST-AT ?auto_13822 ?auto_13819 ) ( AVAILABLE ?auto_13822 ) ( SURFACE-AT ?auto_13799 ?auto_13819 ) ( ON ?auto_13799 ?auto_13831 ) ( CLEAR ?auto_13799 ) ( not ( = ?auto_13800 ?auto_13799 ) ) ( not ( = ?auto_13800 ?auto_13831 ) ) ( not ( = ?auto_13799 ?auto_13831 ) ) ( not ( = ?auto_13805 ?auto_13822 ) ) ( IS-CRATE ?auto_13800 ) ( not ( = ?auto_13833 ?auto_13803 ) ) ( HOIST-AT ?auto_13816 ?auto_13833 ) ( AVAILABLE ?auto_13816 ) ( SURFACE-AT ?auto_13800 ?auto_13833 ) ( ON ?auto_13800 ?auto_13820 ) ( CLEAR ?auto_13800 ) ( not ( = ?auto_13796 ?auto_13800 ) ) ( not ( = ?auto_13796 ?auto_13820 ) ) ( not ( = ?auto_13800 ?auto_13820 ) ) ( not ( = ?auto_13805 ?auto_13816 ) ) ( IS-CRATE ?auto_13796 ) ( not ( = ?auto_13815 ?auto_13803 ) ) ( HOIST-AT ?auto_13827 ?auto_13815 ) ( AVAILABLE ?auto_13827 ) ( SURFACE-AT ?auto_13796 ?auto_13815 ) ( ON ?auto_13796 ?auto_13817 ) ( CLEAR ?auto_13796 ) ( not ( = ?auto_13798 ?auto_13796 ) ) ( not ( = ?auto_13798 ?auto_13817 ) ) ( not ( = ?auto_13796 ?auto_13817 ) ) ( not ( = ?auto_13805 ?auto_13827 ) ) ( IS-CRATE ?auto_13798 ) ( not ( = ?auto_13823 ?auto_13803 ) ) ( HOIST-AT ?auto_13834 ?auto_13823 ) ( AVAILABLE ?auto_13834 ) ( SURFACE-AT ?auto_13798 ?auto_13823 ) ( ON ?auto_13798 ?auto_13811 ) ( CLEAR ?auto_13798 ) ( not ( = ?auto_13795 ?auto_13798 ) ) ( not ( = ?auto_13795 ?auto_13811 ) ) ( not ( = ?auto_13798 ?auto_13811 ) ) ( not ( = ?auto_13805 ?auto_13834 ) ) ( IS-CRATE ?auto_13795 ) ( not ( = ?auto_13836 ?auto_13803 ) ) ( HOIST-AT ?auto_13812 ?auto_13836 ) ( AVAILABLE ?auto_13812 ) ( SURFACE-AT ?auto_13795 ?auto_13836 ) ( ON ?auto_13795 ?auto_13830 ) ( CLEAR ?auto_13795 ) ( not ( = ?auto_13794 ?auto_13795 ) ) ( not ( = ?auto_13794 ?auto_13830 ) ) ( not ( = ?auto_13795 ?auto_13830 ) ) ( not ( = ?auto_13805 ?auto_13812 ) ) ( IS-CRATE ?auto_13794 ) ( not ( = ?auto_13818 ?auto_13803 ) ) ( HOIST-AT ?auto_13813 ?auto_13818 ) ( AVAILABLE ?auto_13813 ) ( SURFACE-AT ?auto_13794 ?auto_13818 ) ( ON ?auto_13794 ?auto_13821 ) ( CLEAR ?auto_13794 ) ( not ( = ?auto_13793 ?auto_13794 ) ) ( not ( = ?auto_13793 ?auto_13821 ) ) ( not ( = ?auto_13794 ?auto_13821 ) ) ( not ( = ?auto_13805 ?auto_13813 ) ) ( IS-CRATE ?auto_13793 ) ( not ( = ?auto_13814 ?auto_13803 ) ) ( HOIST-AT ?auto_13837 ?auto_13814 ) ( AVAILABLE ?auto_13837 ) ( SURFACE-AT ?auto_13793 ?auto_13814 ) ( ON ?auto_13793 ?auto_13835 ) ( CLEAR ?auto_13793 ) ( not ( = ?auto_13792 ?auto_13793 ) ) ( not ( = ?auto_13792 ?auto_13835 ) ) ( not ( = ?auto_13793 ?auto_13835 ) ) ( not ( = ?auto_13805 ?auto_13837 ) ) ( SURFACE-AT ?auto_13791 ?auto_13803 ) ( CLEAR ?auto_13791 ) ( IS-CRATE ?auto_13792 ) ( AVAILABLE ?auto_13805 ) ( not ( = ?auto_13810 ?auto_13803 ) ) ( HOIST-AT ?auto_13824 ?auto_13810 ) ( AVAILABLE ?auto_13824 ) ( SURFACE-AT ?auto_13792 ?auto_13810 ) ( ON ?auto_13792 ?auto_13825 ) ( CLEAR ?auto_13792 ) ( TRUCK-AT ?auto_13806 ?auto_13803 ) ( not ( = ?auto_13791 ?auto_13792 ) ) ( not ( = ?auto_13791 ?auto_13825 ) ) ( not ( = ?auto_13792 ?auto_13825 ) ) ( not ( = ?auto_13805 ?auto_13824 ) ) ( not ( = ?auto_13791 ?auto_13793 ) ) ( not ( = ?auto_13791 ?auto_13835 ) ) ( not ( = ?auto_13793 ?auto_13825 ) ) ( not ( = ?auto_13814 ?auto_13810 ) ) ( not ( = ?auto_13837 ?auto_13824 ) ) ( not ( = ?auto_13835 ?auto_13825 ) ) ( not ( = ?auto_13791 ?auto_13794 ) ) ( not ( = ?auto_13791 ?auto_13821 ) ) ( not ( = ?auto_13792 ?auto_13794 ) ) ( not ( = ?auto_13792 ?auto_13821 ) ) ( not ( = ?auto_13794 ?auto_13835 ) ) ( not ( = ?auto_13794 ?auto_13825 ) ) ( not ( = ?auto_13818 ?auto_13814 ) ) ( not ( = ?auto_13818 ?auto_13810 ) ) ( not ( = ?auto_13813 ?auto_13837 ) ) ( not ( = ?auto_13813 ?auto_13824 ) ) ( not ( = ?auto_13821 ?auto_13835 ) ) ( not ( = ?auto_13821 ?auto_13825 ) ) ( not ( = ?auto_13791 ?auto_13795 ) ) ( not ( = ?auto_13791 ?auto_13830 ) ) ( not ( = ?auto_13792 ?auto_13795 ) ) ( not ( = ?auto_13792 ?auto_13830 ) ) ( not ( = ?auto_13793 ?auto_13795 ) ) ( not ( = ?auto_13793 ?auto_13830 ) ) ( not ( = ?auto_13795 ?auto_13821 ) ) ( not ( = ?auto_13795 ?auto_13835 ) ) ( not ( = ?auto_13795 ?auto_13825 ) ) ( not ( = ?auto_13836 ?auto_13818 ) ) ( not ( = ?auto_13836 ?auto_13814 ) ) ( not ( = ?auto_13836 ?auto_13810 ) ) ( not ( = ?auto_13812 ?auto_13813 ) ) ( not ( = ?auto_13812 ?auto_13837 ) ) ( not ( = ?auto_13812 ?auto_13824 ) ) ( not ( = ?auto_13830 ?auto_13821 ) ) ( not ( = ?auto_13830 ?auto_13835 ) ) ( not ( = ?auto_13830 ?auto_13825 ) ) ( not ( = ?auto_13791 ?auto_13798 ) ) ( not ( = ?auto_13791 ?auto_13811 ) ) ( not ( = ?auto_13792 ?auto_13798 ) ) ( not ( = ?auto_13792 ?auto_13811 ) ) ( not ( = ?auto_13793 ?auto_13798 ) ) ( not ( = ?auto_13793 ?auto_13811 ) ) ( not ( = ?auto_13794 ?auto_13798 ) ) ( not ( = ?auto_13794 ?auto_13811 ) ) ( not ( = ?auto_13798 ?auto_13830 ) ) ( not ( = ?auto_13798 ?auto_13821 ) ) ( not ( = ?auto_13798 ?auto_13835 ) ) ( not ( = ?auto_13798 ?auto_13825 ) ) ( not ( = ?auto_13823 ?auto_13836 ) ) ( not ( = ?auto_13823 ?auto_13818 ) ) ( not ( = ?auto_13823 ?auto_13814 ) ) ( not ( = ?auto_13823 ?auto_13810 ) ) ( not ( = ?auto_13834 ?auto_13812 ) ) ( not ( = ?auto_13834 ?auto_13813 ) ) ( not ( = ?auto_13834 ?auto_13837 ) ) ( not ( = ?auto_13834 ?auto_13824 ) ) ( not ( = ?auto_13811 ?auto_13830 ) ) ( not ( = ?auto_13811 ?auto_13821 ) ) ( not ( = ?auto_13811 ?auto_13835 ) ) ( not ( = ?auto_13811 ?auto_13825 ) ) ( not ( = ?auto_13791 ?auto_13796 ) ) ( not ( = ?auto_13791 ?auto_13817 ) ) ( not ( = ?auto_13792 ?auto_13796 ) ) ( not ( = ?auto_13792 ?auto_13817 ) ) ( not ( = ?auto_13793 ?auto_13796 ) ) ( not ( = ?auto_13793 ?auto_13817 ) ) ( not ( = ?auto_13794 ?auto_13796 ) ) ( not ( = ?auto_13794 ?auto_13817 ) ) ( not ( = ?auto_13795 ?auto_13796 ) ) ( not ( = ?auto_13795 ?auto_13817 ) ) ( not ( = ?auto_13796 ?auto_13811 ) ) ( not ( = ?auto_13796 ?auto_13830 ) ) ( not ( = ?auto_13796 ?auto_13821 ) ) ( not ( = ?auto_13796 ?auto_13835 ) ) ( not ( = ?auto_13796 ?auto_13825 ) ) ( not ( = ?auto_13815 ?auto_13823 ) ) ( not ( = ?auto_13815 ?auto_13836 ) ) ( not ( = ?auto_13815 ?auto_13818 ) ) ( not ( = ?auto_13815 ?auto_13814 ) ) ( not ( = ?auto_13815 ?auto_13810 ) ) ( not ( = ?auto_13827 ?auto_13834 ) ) ( not ( = ?auto_13827 ?auto_13812 ) ) ( not ( = ?auto_13827 ?auto_13813 ) ) ( not ( = ?auto_13827 ?auto_13837 ) ) ( not ( = ?auto_13827 ?auto_13824 ) ) ( not ( = ?auto_13817 ?auto_13811 ) ) ( not ( = ?auto_13817 ?auto_13830 ) ) ( not ( = ?auto_13817 ?auto_13821 ) ) ( not ( = ?auto_13817 ?auto_13835 ) ) ( not ( = ?auto_13817 ?auto_13825 ) ) ( not ( = ?auto_13791 ?auto_13800 ) ) ( not ( = ?auto_13791 ?auto_13820 ) ) ( not ( = ?auto_13792 ?auto_13800 ) ) ( not ( = ?auto_13792 ?auto_13820 ) ) ( not ( = ?auto_13793 ?auto_13800 ) ) ( not ( = ?auto_13793 ?auto_13820 ) ) ( not ( = ?auto_13794 ?auto_13800 ) ) ( not ( = ?auto_13794 ?auto_13820 ) ) ( not ( = ?auto_13795 ?auto_13800 ) ) ( not ( = ?auto_13795 ?auto_13820 ) ) ( not ( = ?auto_13798 ?auto_13800 ) ) ( not ( = ?auto_13798 ?auto_13820 ) ) ( not ( = ?auto_13800 ?auto_13817 ) ) ( not ( = ?auto_13800 ?auto_13811 ) ) ( not ( = ?auto_13800 ?auto_13830 ) ) ( not ( = ?auto_13800 ?auto_13821 ) ) ( not ( = ?auto_13800 ?auto_13835 ) ) ( not ( = ?auto_13800 ?auto_13825 ) ) ( not ( = ?auto_13833 ?auto_13815 ) ) ( not ( = ?auto_13833 ?auto_13823 ) ) ( not ( = ?auto_13833 ?auto_13836 ) ) ( not ( = ?auto_13833 ?auto_13818 ) ) ( not ( = ?auto_13833 ?auto_13814 ) ) ( not ( = ?auto_13833 ?auto_13810 ) ) ( not ( = ?auto_13816 ?auto_13827 ) ) ( not ( = ?auto_13816 ?auto_13834 ) ) ( not ( = ?auto_13816 ?auto_13812 ) ) ( not ( = ?auto_13816 ?auto_13813 ) ) ( not ( = ?auto_13816 ?auto_13837 ) ) ( not ( = ?auto_13816 ?auto_13824 ) ) ( not ( = ?auto_13820 ?auto_13817 ) ) ( not ( = ?auto_13820 ?auto_13811 ) ) ( not ( = ?auto_13820 ?auto_13830 ) ) ( not ( = ?auto_13820 ?auto_13821 ) ) ( not ( = ?auto_13820 ?auto_13835 ) ) ( not ( = ?auto_13820 ?auto_13825 ) ) ( not ( = ?auto_13791 ?auto_13799 ) ) ( not ( = ?auto_13791 ?auto_13831 ) ) ( not ( = ?auto_13792 ?auto_13799 ) ) ( not ( = ?auto_13792 ?auto_13831 ) ) ( not ( = ?auto_13793 ?auto_13799 ) ) ( not ( = ?auto_13793 ?auto_13831 ) ) ( not ( = ?auto_13794 ?auto_13799 ) ) ( not ( = ?auto_13794 ?auto_13831 ) ) ( not ( = ?auto_13795 ?auto_13799 ) ) ( not ( = ?auto_13795 ?auto_13831 ) ) ( not ( = ?auto_13798 ?auto_13799 ) ) ( not ( = ?auto_13798 ?auto_13831 ) ) ( not ( = ?auto_13796 ?auto_13799 ) ) ( not ( = ?auto_13796 ?auto_13831 ) ) ( not ( = ?auto_13799 ?auto_13820 ) ) ( not ( = ?auto_13799 ?auto_13817 ) ) ( not ( = ?auto_13799 ?auto_13811 ) ) ( not ( = ?auto_13799 ?auto_13830 ) ) ( not ( = ?auto_13799 ?auto_13821 ) ) ( not ( = ?auto_13799 ?auto_13835 ) ) ( not ( = ?auto_13799 ?auto_13825 ) ) ( not ( = ?auto_13819 ?auto_13833 ) ) ( not ( = ?auto_13819 ?auto_13815 ) ) ( not ( = ?auto_13819 ?auto_13823 ) ) ( not ( = ?auto_13819 ?auto_13836 ) ) ( not ( = ?auto_13819 ?auto_13818 ) ) ( not ( = ?auto_13819 ?auto_13814 ) ) ( not ( = ?auto_13819 ?auto_13810 ) ) ( not ( = ?auto_13822 ?auto_13816 ) ) ( not ( = ?auto_13822 ?auto_13827 ) ) ( not ( = ?auto_13822 ?auto_13834 ) ) ( not ( = ?auto_13822 ?auto_13812 ) ) ( not ( = ?auto_13822 ?auto_13813 ) ) ( not ( = ?auto_13822 ?auto_13837 ) ) ( not ( = ?auto_13822 ?auto_13824 ) ) ( not ( = ?auto_13831 ?auto_13820 ) ) ( not ( = ?auto_13831 ?auto_13817 ) ) ( not ( = ?auto_13831 ?auto_13811 ) ) ( not ( = ?auto_13831 ?auto_13830 ) ) ( not ( = ?auto_13831 ?auto_13821 ) ) ( not ( = ?auto_13831 ?auto_13835 ) ) ( not ( = ?auto_13831 ?auto_13825 ) ) ( not ( = ?auto_13791 ?auto_13797 ) ) ( not ( = ?auto_13791 ?auto_13829 ) ) ( not ( = ?auto_13792 ?auto_13797 ) ) ( not ( = ?auto_13792 ?auto_13829 ) ) ( not ( = ?auto_13793 ?auto_13797 ) ) ( not ( = ?auto_13793 ?auto_13829 ) ) ( not ( = ?auto_13794 ?auto_13797 ) ) ( not ( = ?auto_13794 ?auto_13829 ) ) ( not ( = ?auto_13795 ?auto_13797 ) ) ( not ( = ?auto_13795 ?auto_13829 ) ) ( not ( = ?auto_13798 ?auto_13797 ) ) ( not ( = ?auto_13798 ?auto_13829 ) ) ( not ( = ?auto_13796 ?auto_13797 ) ) ( not ( = ?auto_13796 ?auto_13829 ) ) ( not ( = ?auto_13800 ?auto_13797 ) ) ( not ( = ?auto_13800 ?auto_13829 ) ) ( not ( = ?auto_13797 ?auto_13831 ) ) ( not ( = ?auto_13797 ?auto_13820 ) ) ( not ( = ?auto_13797 ?auto_13817 ) ) ( not ( = ?auto_13797 ?auto_13811 ) ) ( not ( = ?auto_13797 ?auto_13830 ) ) ( not ( = ?auto_13797 ?auto_13821 ) ) ( not ( = ?auto_13797 ?auto_13835 ) ) ( not ( = ?auto_13797 ?auto_13825 ) ) ( not ( = ?auto_13826 ?auto_13819 ) ) ( not ( = ?auto_13826 ?auto_13833 ) ) ( not ( = ?auto_13826 ?auto_13815 ) ) ( not ( = ?auto_13826 ?auto_13823 ) ) ( not ( = ?auto_13826 ?auto_13836 ) ) ( not ( = ?auto_13826 ?auto_13818 ) ) ( not ( = ?auto_13826 ?auto_13814 ) ) ( not ( = ?auto_13826 ?auto_13810 ) ) ( not ( = ?auto_13828 ?auto_13822 ) ) ( not ( = ?auto_13828 ?auto_13816 ) ) ( not ( = ?auto_13828 ?auto_13827 ) ) ( not ( = ?auto_13828 ?auto_13834 ) ) ( not ( = ?auto_13828 ?auto_13812 ) ) ( not ( = ?auto_13828 ?auto_13813 ) ) ( not ( = ?auto_13828 ?auto_13837 ) ) ( not ( = ?auto_13828 ?auto_13824 ) ) ( not ( = ?auto_13829 ?auto_13831 ) ) ( not ( = ?auto_13829 ?auto_13820 ) ) ( not ( = ?auto_13829 ?auto_13817 ) ) ( not ( = ?auto_13829 ?auto_13811 ) ) ( not ( = ?auto_13829 ?auto_13830 ) ) ( not ( = ?auto_13829 ?auto_13821 ) ) ( not ( = ?auto_13829 ?auto_13835 ) ) ( not ( = ?auto_13829 ?auto_13825 ) ) ( not ( = ?auto_13791 ?auto_13802 ) ) ( not ( = ?auto_13791 ?auto_13832 ) ) ( not ( = ?auto_13792 ?auto_13802 ) ) ( not ( = ?auto_13792 ?auto_13832 ) ) ( not ( = ?auto_13793 ?auto_13802 ) ) ( not ( = ?auto_13793 ?auto_13832 ) ) ( not ( = ?auto_13794 ?auto_13802 ) ) ( not ( = ?auto_13794 ?auto_13832 ) ) ( not ( = ?auto_13795 ?auto_13802 ) ) ( not ( = ?auto_13795 ?auto_13832 ) ) ( not ( = ?auto_13798 ?auto_13802 ) ) ( not ( = ?auto_13798 ?auto_13832 ) ) ( not ( = ?auto_13796 ?auto_13802 ) ) ( not ( = ?auto_13796 ?auto_13832 ) ) ( not ( = ?auto_13800 ?auto_13802 ) ) ( not ( = ?auto_13800 ?auto_13832 ) ) ( not ( = ?auto_13799 ?auto_13802 ) ) ( not ( = ?auto_13799 ?auto_13832 ) ) ( not ( = ?auto_13802 ?auto_13829 ) ) ( not ( = ?auto_13802 ?auto_13831 ) ) ( not ( = ?auto_13802 ?auto_13820 ) ) ( not ( = ?auto_13802 ?auto_13817 ) ) ( not ( = ?auto_13802 ?auto_13811 ) ) ( not ( = ?auto_13802 ?auto_13830 ) ) ( not ( = ?auto_13802 ?auto_13821 ) ) ( not ( = ?auto_13802 ?auto_13835 ) ) ( not ( = ?auto_13802 ?auto_13825 ) ) ( not ( = ?auto_13838 ?auto_13826 ) ) ( not ( = ?auto_13838 ?auto_13819 ) ) ( not ( = ?auto_13838 ?auto_13833 ) ) ( not ( = ?auto_13838 ?auto_13815 ) ) ( not ( = ?auto_13838 ?auto_13823 ) ) ( not ( = ?auto_13838 ?auto_13836 ) ) ( not ( = ?auto_13838 ?auto_13818 ) ) ( not ( = ?auto_13838 ?auto_13814 ) ) ( not ( = ?auto_13838 ?auto_13810 ) ) ( not ( = ?auto_13809 ?auto_13828 ) ) ( not ( = ?auto_13809 ?auto_13822 ) ) ( not ( = ?auto_13809 ?auto_13816 ) ) ( not ( = ?auto_13809 ?auto_13827 ) ) ( not ( = ?auto_13809 ?auto_13834 ) ) ( not ( = ?auto_13809 ?auto_13812 ) ) ( not ( = ?auto_13809 ?auto_13813 ) ) ( not ( = ?auto_13809 ?auto_13837 ) ) ( not ( = ?auto_13809 ?auto_13824 ) ) ( not ( = ?auto_13832 ?auto_13829 ) ) ( not ( = ?auto_13832 ?auto_13831 ) ) ( not ( = ?auto_13832 ?auto_13820 ) ) ( not ( = ?auto_13832 ?auto_13817 ) ) ( not ( = ?auto_13832 ?auto_13811 ) ) ( not ( = ?auto_13832 ?auto_13830 ) ) ( not ( = ?auto_13832 ?auto_13821 ) ) ( not ( = ?auto_13832 ?auto_13835 ) ) ( not ( = ?auto_13832 ?auto_13825 ) ) ( not ( = ?auto_13791 ?auto_13801 ) ) ( not ( = ?auto_13791 ?auto_13808 ) ) ( not ( = ?auto_13792 ?auto_13801 ) ) ( not ( = ?auto_13792 ?auto_13808 ) ) ( not ( = ?auto_13793 ?auto_13801 ) ) ( not ( = ?auto_13793 ?auto_13808 ) ) ( not ( = ?auto_13794 ?auto_13801 ) ) ( not ( = ?auto_13794 ?auto_13808 ) ) ( not ( = ?auto_13795 ?auto_13801 ) ) ( not ( = ?auto_13795 ?auto_13808 ) ) ( not ( = ?auto_13798 ?auto_13801 ) ) ( not ( = ?auto_13798 ?auto_13808 ) ) ( not ( = ?auto_13796 ?auto_13801 ) ) ( not ( = ?auto_13796 ?auto_13808 ) ) ( not ( = ?auto_13800 ?auto_13801 ) ) ( not ( = ?auto_13800 ?auto_13808 ) ) ( not ( = ?auto_13799 ?auto_13801 ) ) ( not ( = ?auto_13799 ?auto_13808 ) ) ( not ( = ?auto_13797 ?auto_13801 ) ) ( not ( = ?auto_13797 ?auto_13808 ) ) ( not ( = ?auto_13801 ?auto_13832 ) ) ( not ( = ?auto_13801 ?auto_13829 ) ) ( not ( = ?auto_13801 ?auto_13831 ) ) ( not ( = ?auto_13801 ?auto_13820 ) ) ( not ( = ?auto_13801 ?auto_13817 ) ) ( not ( = ?auto_13801 ?auto_13811 ) ) ( not ( = ?auto_13801 ?auto_13830 ) ) ( not ( = ?auto_13801 ?auto_13821 ) ) ( not ( = ?auto_13801 ?auto_13835 ) ) ( not ( = ?auto_13801 ?auto_13825 ) ) ( not ( = ?auto_13804 ?auto_13838 ) ) ( not ( = ?auto_13804 ?auto_13826 ) ) ( not ( = ?auto_13804 ?auto_13819 ) ) ( not ( = ?auto_13804 ?auto_13833 ) ) ( not ( = ?auto_13804 ?auto_13815 ) ) ( not ( = ?auto_13804 ?auto_13823 ) ) ( not ( = ?auto_13804 ?auto_13836 ) ) ( not ( = ?auto_13804 ?auto_13818 ) ) ( not ( = ?auto_13804 ?auto_13814 ) ) ( not ( = ?auto_13804 ?auto_13810 ) ) ( not ( = ?auto_13807 ?auto_13809 ) ) ( not ( = ?auto_13807 ?auto_13828 ) ) ( not ( = ?auto_13807 ?auto_13822 ) ) ( not ( = ?auto_13807 ?auto_13816 ) ) ( not ( = ?auto_13807 ?auto_13827 ) ) ( not ( = ?auto_13807 ?auto_13834 ) ) ( not ( = ?auto_13807 ?auto_13812 ) ) ( not ( = ?auto_13807 ?auto_13813 ) ) ( not ( = ?auto_13807 ?auto_13837 ) ) ( not ( = ?auto_13807 ?auto_13824 ) ) ( not ( = ?auto_13808 ?auto_13832 ) ) ( not ( = ?auto_13808 ?auto_13829 ) ) ( not ( = ?auto_13808 ?auto_13831 ) ) ( not ( = ?auto_13808 ?auto_13820 ) ) ( not ( = ?auto_13808 ?auto_13817 ) ) ( not ( = ?auto_13808 ?auto_13811 ) ) ( not ( = ?auto_13808 ?auto_13830 ) ) ( not ( = ?auto_13808 ?auto_13821 ) ) ( not ( = ?auto_13808 ?auto_13835 ) ) ( not ( = ?auto_13808 ?auto_13825 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_13791 ?auto_13792 ?auto_13793 ?auto_13794 ?auto_13795 ?auto_13798 ?auto_13796 ?auto_13800 ?auto_13799 ?auto_13797 ?auto_13802 )
      ( MAKE-1CRATE ?auto_13802 ?auto_13801 )
      ( MAKE-11CRATE-VERIFY ?auto_13791 ?auto_13792 ?auto_13793 ?auto_13794 ?auto_13795 ?auto_13798 ?auto_13796 ?auto_13800 ?auto_13799 ?auto_13797 ?auto_13802 ?auto_13801 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13841 - SURFACE
      ?auto_13842 - SURFACE
    )
    :vars
    (
      ?auto_13843 - HOIST
      ?auto_13844 - PLACE
      ?auto_13846 - PLACE
      ?auto_13847 - HOIST
      ?auto_13848 - SURFACE
      ?auto_13845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13843 ?auto_13844 ) ( SURFACE-AT ?auto_13841 ?auto_13844 ) ( CLEAR ?auto_13841 ) ( IS-CRATE ?auto_13842 ) ( AVAILABLE ?auto_13843 ) ( not ( = ?auto_13846 ?auto_13844 ) ) ( HOIST-AT ?auto_13847 ?auto_13846 ) ( AVAILABLE ?auto_13847 ) ( SURFACE-AT ?auto_13842 ?auto_13846 ) ( ON ?auto_13842 ?auto_13848 ) ( CLEAR ?auto_13842 ) ( TRUCK-AT ?auto_13845 ?auto_13844 ) ( not ( = ?auto_13841 ?auto_13842 ) ) ( not ( = ?auto_13841 ?auto_13848 ) ) ( not ( = ?auto_13842 ?auto_13848 ) ) ( not ( = ?auto_13843 ?auto_13847 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13845 ?auto_13844 ?auto_13846 )
      ( !LIFT ?auto_13847 ?auto_13842 ?auto_13848 ?auto_13846 )
      ( !LOAD ?auto_13847 ?auto_13842 ?auto_13845 ?auto_13846 )
      ( !DRIVE ?auto_13845 ?auto_13846 ?auto_13844 )
      ( !UNLOAD ?auto_13843 ?auto_13842 ?auto_13845 ?auto_13844 )
      ( !DROP ?auto_13843 ?auto_13842 ?auto_13841 ?auto_13844 )
      ( MAKE-1CRATE-VERIFY ?auto_13841 ?auto_13842 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_13862 - SURFACE
      ?auto_13863 - SURFACE
      ?auto_13864 - SURFACE
      ?auto_13865 - SURFACE
      ?auto_13866 - SURFACE
      ?auto_13869 - SURFACE
      ?auto_13867 - SURFACE
      ?auto_13871 - SURFACE
      ?auto_13870 - SURFACE
      ?auto_13868 - SURFACE
      ?auto_13873 - SURFACE
      ?auto_13872 - SURFACE
      ?auto_13874 - SURFACE
    )
    :vars
    (
      ?auto_13880 - HOIST
      ?auto_13877 - PLACE
      ?auto_13876 - PLACE
      ?auto_13879 - HOIST
      ?auto_13878 - SURFACE
      ?auto_13904 - PLACE
      ?auto_13893 - HOIST
      ?auto_13894 - SURFACE
      ?auto_13890 - PLACE
      ?auto_13901 - HOIST
      ?auto_13887 - SURFACE
      ?auto_13908 - PLACE
      ?auto_13905 - HOIST
      ?auto_13882 - SURFACE
      ?auto_13896 - PLACE
      ?auto_13886 - HOIST
      ?auto_13891 - SURFACE
      ?auto_13903 - SURFACE
      ?auto_13907 - PLACE
      ?auto_13911 - HOIST
      ?auto_13884 - SURFACE
      ?auto_13898 - PLACE
      ?auto_13909 - HOIST
      ?auto_13888 - SURFACE
      ?auto_13892 - PLACE
      ?auto_13900 - HOIST
      ?auto_13895 - SURFACE
      ?auto_13897 - PLACE
      ?auto_13885 - HOIST
      ?auto_13910 - SURFACE
      ?auto_13881 - PLACE
      ?auto_13906 - HOIST
      ?auto_13883 - SURFACE
      ?auto_13899 - PLACE
      ?auto_13902 - HOIST
      ?auto_13889 - SURFACE
      ?auto_13875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13880 ?auto_13877 ) ( IS-CRATE ?auto_13874 ) ( not ( = ?auto_13876 ?auto_13877 ) ) ( HOIST-AT ?auto_13879 ?auto_13876 ) ( SURFACE-AT ?auto_13874 ?auto_13876 ) ( ON ?auto_13874 ?auto_13878 ) ( CLEAR ?auto_13874 ) ( not ( = ?auto_13872 ?auto_13874 ) ) ( not ( = ?auto_13872 ?auto_13878 ) ) ( not ( = ?auto_13874 ?auto_13878 ) ) ( not ( = ?auto_13880 ?auto_13879 ) ) ( IS-CRATE ?auto_13872 ) ( not ( = ?auto_13904 ?auto_13877 ) ) ( HOIST-AT ?auto_13893 ?auto_13904 ) ( AVAILABLE ?auto_13893 ) ( SURFACE-AT ?auto_13872 ?auto_13904 ) ( ON ?auto_13872 ?auto_13894 ) ( CLEAR ?auto_13872 ) ( not ( = ?auto_13873 ?auto_13872 ) ) ( not ( = ?auto_13873 ?auto_13894 ) ) ( not ( = ?auto_13872 ?auto_13894 ) ) ( not ( = ?auto_13880 ?auto_13893 ) ) ( IS-CRATE ?auto_13873 ) ( not ( = ?auto_13890 ?auto_13877 ) ) ( HOIST-AT ?auto_13901 ?auto_13890 ) ( AVAILABLE ?auto_13901 ) ( SURFACE-AT ?auto_13873 ?auto_13890 ) ( ON ?auto_13873 ?auto_13887 ) ( CLEAR ?auto_13873 ) ( not ( = ?auto_13868 ?auto_13873 ) ) ( not ( = ?auto_13868 ?auto_13887 ) ) ( not ( = ?auto_13873 ?auto_13887 ) ) ( not ( = ?auto_13880 ?auto_13901 ) ) ( IS-CRATE ?auto_13868 ) ( not ( = ?auto_13908 ?auto_13877 ) ) ( HOIST-AT ?auto_13905 ?auto_13908 ) ( AVAILABLE ?auto_13905 ) ( SURFACE-AT ?auto_13868 ?auto_13908 ) ( ON ?auto_13868 ?auto_13882 ) ( CLEAR ?auto_13868 ) ( not ( = ?auto_13870 ?auto_13868 ) ) ( not ( = ?auto_13870 ?auto_13882 ) ) ( not ( = ?auto_13868 ?auto_13882 ) ) ( not ( = ?auto_13880 ?auto_13905 ) ) ( IS-CRATE ?auto_13870 ) ( not ( = ?auto_13896 ?auto_13877 ) ) ( HOIST-AT ?auto_13886 ?auto_13896 ) ( AVAILABLE ?auto_13886 ) ( SURFACE-AT ?auto_13870 ?auto_13896 ) ( ON ?auto_13870 ?auto_13891 ) ( CLEAR ?auto_13870 ) ( not ( = ?auto_13871 ?auto_13870 ) ) ( not ( = ?auto_13871 ?auto_13891 ) ) ( not ( = ?auto_13870 ?auto_13891 ) ) ( not ( = ?auto_13880 ?auto_13886 ) ) ( IS-CRATE ?auto_13871 ) ( AVAILABLE ?auto_13879 ) ( SURFACE-AT ?auto_13871 ?auto_13876 ) ( ON ?auto_13871 ?auto_13903 ) ( CLEAR ?auto_13871 ) ( not ( = ?auto_13867 ?auto_13871 ) ) ( not ( = ?auto_13867 ?auto_13903 ) ) ( not ( = ?auto_13871 ?auto_13903 ) ) ( IS-CRATE ?auto_13867 ) ( not ( = ?auto_13907 ?auto_13877 ) ) ( HOIST-AT ?auto_13911 ?auto_13907 ) ( AVAILABLE ?auto_13911 ) ( SURFACE-AT ?auto_13867 ?auto_13907 ) ( ON ?auto_13867 ?auto_13884 ) ( CLEAR ?auto_13867 ) ( not ( = ?auto_13869 ?auto_13867 ) ) ( not ( = ?auto_13869 ?auto_13884 ) ) ( not ( = ?auto_13867 ?auto_13884 ) ) ( not ( = ?auto_13880 ?auto_13911 ) ) ( IS-CRATE ?auto_13869 ) ( not ( = ?auto_13898 ?auto_13877 ) ) ( HOIST-AT ?auto_13909 ?auto_13898 ) ( AVAILABLE ?auto_13909 ) ( SURFACE-AT ?auto_13869 ?auto_13898 ) ( ON ?auto_13869 ?auto_13888 ) ( CLEAR ?auto_13869 ) ( not ( = ?auto_13866 ?auto_13869 ) ) ( not ( = ?auto_13866 ?auto_13888 ) ) ( not ( = ?auto_13869 ?auto_13888 ) ) ( not ( = ?auto_13880 ?auto_13909 ) ) ( IS-CRATE ?auto_13866 ) ( not ( = ?auto_13892 ?auto_13877 ) ) ( HOIST-AT ?auto_13900 ?auto_13892 ) ( AVAILABLE ?auto_13900 ) ( SURFACE-AT ?auto_13866 ?auto_13892 ) ( ON ?auto_13866 ?auto_13895 ) ( CLEAR ?auto_13866 ) ( not ( = ?auto_13865 ?auto_13866 ) ) ( not ( = ?auto_13865 ?auto_13895 ) ) ( not ( = ?auto_13866 ?auto_13895 ) ) ( not ( = ?auto_13880 ?auto_13900 ) ) ( IS-CRATE ?auto_13865 ) ( not ( = ?auto_13897 ?auto_13877 ) ) ( HOIST-AT ?auto_13885 ?auto_13897 ) ( AVAILABLE ?auto_13885 ) ( SURFACE-AT ?auto_13865 ?auto_13897 ) ( ON ?auto_13865 ?auto_13910 ) ( CLEAR ?auto_13865 ) ( not ( = ?auto_13864 ?auto_13865 ) ) ( not ( = ?auto_13864 ?auto_13910 ) ) ( not ( = ?auto_13865 ?auto_13910 ) ) ( not ( = ?auto_13880 ?auto_13885 ) ) ( IS-CRATE ?auto_13864 ) ( not ( = ?auto_13881 ?auto_13877 ) ) ( HOIST-AT ?auto_13906 ?auto_13881 ) ( AVAILABLE ?auto_13906 ) ( SURFACE-AT ?auto_13864 ?auto_13881 ) ( ON ?auto_13864 ?auto_13883 ) ( CLEAR ?auto_13864 ) ( not ( = ?auto_13863 ?auto_13864 ) ) ( not ( = ?auto_13863 ?auto_13883 ) ) ( not ( = ?auto_13864 ?auto_13883 ) ) ( not ( = ?auto_13880 ?auto_13906 ) ) ( SURFACE-AT ?auto_13862 ?auto_13877 ) ( CLEAR ?auto_13862 ) ( IS-CRATE ?auto_13863 ) ( AVAILABLE ?auto_13880 ) ( not ( = ?auto_13899 ?auto_13877 ) ) ( HOIST-AT ?auto_13902 ?auto_13899 ) ( AVAILABLE ?auto_13902 ) ( SURFACE-AT ?auto_13863 ?auto_13899 ) ( ON ?auto_13863 ?auto_13889 ) ( CLEAR ?auto_13863 ) ( TRUCK-AT ?auto_13875 ?auto_13877 ) ( not ( = ?auto_13862 ?auto_13863 ) ) ( not ( = ?auto_13862 ?auto_13889 ) ) ( not ( = ?auto_13863 ?auto_13889 ) ) ( not ( = ?auto_13880 ?auto_13902 ) ) ( not ( = ?auto_13862 ?auto_13864 ) ) ( not ( = ?auto_13862 ?auto_13883 ) ) ( not ( = ?auto_13864 ?auto_13889 ) ) ( not ( = ?auto_13881 ?auto_13899 ) ) ( not ( = ?auto_13906 ?auto_13902 ) ) ( not ( = ?auto_13883 ?auto_13889 ) ) ( not ( = ?auto_13862 ?auto_13865 ) ) ( not ( = ?auto_13862 ?auto_13910 ) ) ( not ( = ?auto_13863 ?auto_13865 ) ) ( not ( = ?auto_13863 ?auto_13910 ) ) ( not ( = ?auto_13865 ?auto_13883 ) ) ( not ( = ?auto_13865 ?auto_13889 ) ) ( not ( = ?auto_13897 ?auto_13881 ) ) ( not ( = ?auto_13897 ?auto_13899 ) ) ( not ( = ?auto_13885 ?auto_13906 ) ) ( not ( = ?auto_13885 ?auto_13902 ) ) ( not ( = ?auto_13910 ?auto_13883 ) ) ( not ( = ?auto_13910 ?auto_13889 ) ) ( not ( = ?auto_13862 ?auto_13866 ) ) ( not ( = ?auto_13862 ?auto_13895 ) ) ( not ( = ?auto_13863 ?auto_13866 ) ) ( not ( = ?auto_13863 ?auto_13895 ) ) ( not ( = ?auto_13864 ?auto_13866 ) ) ( not ( = ?auto_13864 ?auto_13895 ) ) ( not ( = ?auto_13866 ?auto_13910 ) ) ( not ( = ?auto_13866 ?auto_13883 ) ) ( not ( = ?auto_13866 ?auto_13889 ) ) ( not ( = ?auto_13892 ?auto_13897 ) ) ( not ( = ?auto_13892 ?auto_13881 ) ) ( not ( = ?auto_13892 ?auto_13899 ) ) ( not ( = ?auto_13900 ?auto_13885 ) ) ( not ( = ?auto_13900 ?auto_13906 ) ) ( not ( = ?auto_13900 ?auto_13902 ) ) ( not ( = ?auto_13895 ?auto_13910 ) ) ( not ( = ?auto_13895 ?auto_13883 ) ) ( not ( = ?auto_13895 ?auto_13889 ) ) ( not ( = ?auto_13862 ?auto_13869 ) ) ( not ( = ?auto_13862 ?auto_13888 ) ) ( not ( = ?auto_13863 ?auto_13869 ) ) ( not ( = ?auto_13863 ?auto_13888 ) ) ( not ( = ?auto_13864 ?auto_13869 ) ) ( not ( = ?auto_13864 ?auto_13888 ) ) ( not ( = ?auto_13865 ?auto_13869 ) ) ( not ( = ?auto_13865 ?auto_13888 ) ) ( not ( = ?auto_13869 ?auto_13895 ) ) ( not ( = ?auto_13869 ?auto_13910 ) ) ( not ( = ?auto_13869 ?auto_13883 ) ) ( not ( = ?auto_13869 ?auto_13889 ) ) ( not ( = ?auto_13898 ?auto_13892 ) ) ( not ( = ?auto_13898 ?auto_13897 ) ) ( not ( = ?auto_13898 ?auto_13881 ) ) ( not ( = ?auto_13898 ?auto_13899 ) ) ( not ( = ?auto_13909 ?auto_13900 ) ) ( not ( = ?auto_13909 ?auto_13885 ) ) ( not ( = ?auto_13909 ?auto_13906 ) ) ( not ( = ?auto_13909 ?auto_13902 ) ) ( not ( = ?auto_13888 ?auto_13895 ) ) ( not ( = ?auto_13888 ?auto_13910 ) ) ( not ( = ?auto_13888 ?auto_13883 ) ) ( not ( = ?auto_13888 ?auto_13889 ) ) ( not ( = ?auto_13862 ?auto_13867 ) ) ( not ( = ?auto_13862 ?auto_13884 ) ) ( not ( = ?auto_13863 ?auto_13867 ) ) ( not ( = ?auto_13863 ?auto_13884 ) ) ( not ( = ?auto_13864 ?auto_13867 ) ) ( not ( = ?auto_13864 ?auto_13884 ) ) ( not ( = ?auto_13865 ?auto_13867 ) ) ( not ( = ?auto_13865 ?auto_13884 ) ) ( not ( = ?auto_13866 ?auto_13867 ) ) ( not ( = ?auto_13866 ?auto_13884 ) ) ( not ( = ?auto_13867 ?auto_13888 ) ) ( not ( = ?auto_13867 ?auto_13895 ) ) ( not ( = ?auto_13867 ?auto_13910 ) ) ( not ( = ?auto_13867 ?auto_13883 ) ) ( not ( = ?auto_13867 ?auto_13889 ) ) ( not ( = ?auto_13907 ?auto_13898 ) ) ( not ( = ?auto_13907 ?auto_13892 ) ) ( not ( = ?auto_13907 ?auto_13897 ) ) ( not ( = ?auto_13907 ?auto_13881 ) ) ( not ( = ?auto_13907 ?auto_13899 ) ) ( not ( = ?auto_13911 ?auto_13909 ) ) ( not ( = ?auto_13911 ?auto_13900 ) ) ( not ( = ?auto_13911 ?auto_13885 ) ) ( not ( = ?auto_13911 ?auto_13906 ) ) ( not ( = ?auto_13911 ?auto_13902 ) ) ( not ( = ?auto_13884 ?auto_13888 ) ) ( not ( = ?auto_13884 ?auto_13895 ) ) ( not ( = ?auto_13884 ?auto_13910 ) ) ( not ( = ?auto_13884 ?auto_13883 ) ) ( not ( = ?auto_13884 ?auto_13889 ) ) ( not ( = ?auto_13862 ?auto_13871 ) ) ( not ( = ?auto_13862 ?auto_13903 ) ) ( not ( = ?auto_13863 ?auto_13871 ) ) ( not ( = ?auto_13863 ?auto_13903 ) ) ( not ( = ?auto_13864 ?auto_13871 ) ) ( not ( = ?auto_13864 ?auto_13903 ) ) ( not ( = ?auto_13865 ?auto_13871 ) ) ( not ( = ?auto_13865 ?auto_13903 ) ) ( not ( = ?auto_13866 ?auto_13871 ) ) ( not ( = ?auto_13866 ?auto_13903 ) ) ( not ( = ?auto_13869 ?auto_13871 ) ) ( not ( = ?auto_13869 ?auto_13903 ) ) ( not ( = ?auto_13871 ?auto_13884 ) ) ( not ( = ?auto_13871 ?auto_13888 ) ) ( not ( = ?auto_13871 ?auto_13895 ) ) ( not ( = ?auto_13871 ?auto_13910 ) ) ( not ( = ?auto_13871 ?auto_13883 ) ) ( not ( = ?auto_13871 ?auto_13889 ) ) ( not ( = ?auto_13876 ?auto_13907 ) ) ( not ( = ?auto_13876 ?auto_13898 ) ) ( not ( = ?auto_13876 ?auto_13892 ) ) ( not ( = ?auto_13876 ?auto_13897 ) ) ( not ( = ?auto_13876 ?auto_13881 ) ) ( not ( = ?auto_13876 ?auto_13899 ) ) ( not ( = ?auto_13879 ?auto_13911 ) ) ( not ( = ?auto_13879 ?auto_13909 ) ) ( not ( = ?auto_13879 ?auto_13900 ) ) ( not ( = ?auto_13879 ?auto_13885 ) ) ( not ( = ?auto_13879 ?auto_13906 ) ) ( not ( = ?auto_13879 ?auto_13902 ) ) ( not ( = ?auto_13903 ?auto_13884 ) ) ( not ( = ?auto_13903 ?auto_13888 ) ) ( not ( = ?auto_13903 ?auto_13895 ) ) ( not ( = ?auto_13903 ?auto_13910 ) ) ( not ( = ?auto_13903 ?auto_13883 ) ) ( not ( = ?auto_13903 ?auto_13889 ) ) ( not ( = ?auto_13862 ?auto_13870 ) ) ( not ( = ?auto_13862 ?auto_13891 ) ) ( not ( = ?auto_13863 ?auto_13870 ) ) ( not ( = ?auto_13863 ?auto_13891 ) ) ( not ( = ?auto_13864 ?auto_13870 ) ) ( not ( = ?auto_13864 ?auto_13891 ) ) ( not ( = ?auto_13865 ?auto_13870 ) ) ( not ( = ?auto_13865 ?auto_13891 ) ) ( not ( = ?auto_13866 ?auto_13870 ) ) ( not ( = ?auto_13866 ?auto_13891 ) ) ( not ( = ?auto_13869 ?auto_13870 ) ) ( not ( = ?auto_13869 ?auto_13891 ) ) ( not ( = ?auto_13867 ?auto_13870 ) ) ( not ( = ?auto_13867 ?auto_13891 ) ) ( not ( = ?auto_13870 ?auto_13903 ) ) ( not ( = ?auto_13870 ?auto_13884 ) ) ( not ( = ?auto_13870 ?auto_13888 ) ) ( not ( = ?auto_13870 ?auto_13895 ) ) ( not ( = ?auto_13870 ?auto_13910 ) ) ( not ( = ?auto_13870 ?auto_13883 ) ) ( not ( = ?auto_13870 ?auto_13889 ) ) ( not ( = ?auto_13896 ?auto_13876 ) ) ( not ( = ?auto_13896 ?auto_13907 ) ) ( not ( = ?auto_13896 ?auto_13898 ) ) ( not ( = ?auto_13896 ?auto_13892 ) ) ( not ( = ?auto_13896 ?auto_13897 ) ) ( not ( = ?auto_13896 ?auto_13881 ) ) ( not ( = ?auto_13896 ?auto_13899 ) ) ( not ( = ?auto_13886 ?auto_13879 ) ) ( not ( = ?auto_13886 ?auto_13911 ) ) ( not ( = ?auto_13886 ?auto_13909 ) ) ( not ( = ?auto_13886 ?auto_13900 ) ) ( not ( = ?auto_13886 ?auto_13885 ) ) ( not ( = ?auto_13886 ?auto_13906 ) ) ( not ( = ?auto_13886 ?auto_13902 ) ) ( not ( = ?auto_13891 ?auto_13903 ) ) ( not ( = ?auto_13891 ?auto_13884 ) ) ( not ( = ?auto_13891 ?auto_13888 ) ) ( not ( = ?auto_13891 ?auto_13895 ) ) ( not ( = ?auto_13891 ?auto_13910 ) ) ( not ( = ?auto_13891 ?auto_13883 ) ) ( not ( = ?auto_13891 ?auto_13889 ) ) ( not ( = ?auto_13862 ?auto_13868 ) ) ( not ( = ?auto_13862 ?auto_13882 ) ) ( not ( = ?auto_13863 ?auto_13868 ) ) ( not ( = ?auto_13863 ?auto_13882 ) ) ( not ( = ?auto_13864 ?auto_13868 ) ) ( not ( = ?auto_13864 ?auto_13882 ) ) ( not ( = ?auto_13865 ?auto_13868 ) ) ( not ( = ?auto_13865 ?auto_13882 ) ) ( not ( = ?auto_13866 ?auto_13868 ) ) ( not ( = ?auto_13866 ?auto_13882 ) ) ( not ( = ?auto_13869 ?auto_13868 ) ) ( not ( = ?auto_13869 ?auto_13882 ) ) ( not ( = ?auto_13867 ?auto_13868 ) ) ( not ( = ?auto_13867 ?auto_13882 ) ) ( not ( = ?auto_13871 ?auto_13868 ) ) ( not ( = ?auto_13871 ?auto_13882 ) ) ( not ( = ?auto_13868 ?auto_13891 ) ) ( not ( = ?auto_13868 ?auto_13903 ) ) ( not ( = ?auto_13868 ?auto_13884 ) ) ( not ( = ?auto_13868 ?auto_13888 ) ) ( not ( = ?auto_13868 ?auto_13895 ) ) ( not ( = ?auto_13868 ?auto_13910 ) ) ( not ( = ?auto_13868 ?auto_13883 ) ) ( not ( = ?auto_13868 ?auto_13889 ) ) ( not ( = ?auto_13908 ?auto_13896 ) ) ( not ( = ?auto_13908 ?auto_13876 ) ) ( not ( = ?auto_13908 ?auto_13907 ) ) ( not ( = ?auto_13908 ?auto_13898 ) ) ( not ( = ?auto_13908 ?auto_13892 ) ) ( not ( = ?auto_13908 ?auto_13897 ) ) ( not ( = ?auto_13908 ?auto_13881 ) ) ( not ( = ?auto_13908 ?auto_13899 ) ) ( not ( = ?auto_13905 ?auto_13886 ) ) ( not ( = ?auto_13905 ?auto_13879 ) ) ( not ( = ?auto_13905 ?auto_13911 ) ) ( not ( = ?auto_13905 ?auto_13909 ) ) ( not ( = ?auto_13905 ?auto_13900 ) ) ( not ( = ?auto_13905 ?auto_13885 ) ) ( not ( = ?auto_13905 ?auto_13906 ) ) ( not ( = ?auto_13905 ?auto_13902 ) ) ( not ( = ?auto_13882 ?auto_13891 ) ) ( not ( = ?auto_13882 ?auto_13903 ) ) ( not ( = ?auto_13882 ?auto_13884 ) ) ( not ( = ?auto_13882 ?auto_13888 ) ) ( not ( = ?auto_13882 ?auto_13895 ) ) ( not ( = ?auto_13882 ?auto_13910 ) ) ( not ( = ?auto_13882 ?auto_13883 ) ) ( not ( = ?auto_13882 ?auto_13889 ) ) ( not ( = ?auto_13862 ?auto_13873 ) ) ( not ( = ?auto_13862 ?auto_13887 ) ) ( not ( = ?auto_13863 ?auto_13873 ) ) ( not ( = ?auto_13863 ?auto_13887 ) ) ( not ( = ?auto_13864 ?auto_13873 ) ) ( not ( = ?auto_13864 ?auto_13887 ) ) ( not ( = ?auto_13865 ?auto_13873 ) ) ( not ( = ?auto_13865 ?auto_13887 ) ) ( not ( = ?auto_13866 ?auto_13873 ) ) ( not ( = ?auto_13866 ?auto_13887 ) ) ( not ( = ?auto_13869 ?auto_13873 ) ) ( not ( = ?auto_13869 ?auto_13887 ) ) ( not ( = ?auto_13867 ?auto_13873 ) ) ( not ( = ?auto_13867 ?auto_13887 ) ) ( not ( = ?auto_13871 ?auto_13873 ) ) ( not ( = ?auto_13871 ?auto_13887 ) ) ( not ( = ?auto_13870 ?auto_13873 ) ) ( not ( = ?auto_13870 ?auto_13887 ) ) ( not ( = ?auto_13873 ?auto_13882 ) ) ( not ( = ?auto_13873 ?auto_13891 ) ) ( not ( = ?auto_13873 ?auto_13903 ) ) ( not ( = ?auto_13873 ?auto_13884 ) ) ( not ( = ?auto_13873 ?auto_13888 ) ) ( not ( = ?auto_13873 ?auto_13895 ) ) ( not ( = ?auto_13873 ?auto_13910 ) ) ( not ( = ?auto_13873 ?auto_13883 ) ) ( not ( = ?auto_13873 ?auto_13889 ) ) ( not ( = ?auto_13890 ?auto_13908 ) ) ( not ( = ?auto_13890 ?auto_13896 ) ) ( not ( = ?auto_13890 ?auto_13876 ) ) ( not ( = ?auto_13890 ?auto_13907 ) ) ( not ( = ?auto_13890 ?auto_13898 ) ) ( not ( = ?auto_13890 ?auto_13892 ) ) ( not ( = ?auto_13890 ?auto_13897 ) ) ( not ( = ?auto_13890 ?auto_13881 ) ) ( not ( = ?auto_13890 ?auto_13899 ) ) ( not ( = ?auto_13901 ?auto_13905 ) ) ( not ( = ?auto_13901 ?auto_13886 ) ) ( not ( = ?auto_13901 ?auto_13879 ) ) ( not ( = ?auto_13901 ?auto_13911 ) ) ( not ( = ?auto_13901 ?auto_13909 ) ) ( not ( = ?auto_13901 ?auto_13900 ) ) ( not ( = ?auto_13901 ?auto_13885 ) ) ( not ( = ?auto_13901 ?auto_13906 ) ) ( not ( = ?auto_13901 ?auto_13902 ) ) ( not ( = ?auto_13887 ?auto_13882 ) ) ( not ( = ?auto_13887 ?auto_13891 ) ) ( not ( = ?auto_13887 ?auto_13903 ) ) ( not ( = ?auto_13887 ?auto_13884 ) ) ( not ( = ?auto_13887 ?auto_13888 ) ) ( not ( = ?auto_13887 ?auto_13895 ) ) ( not ( = ?auto_13887 ?auto_13910 ) ) ( not ( = ?auto_13887 ?auto_13883 ) ) ( not ( = ?auto_13887 ?auto_13889 ) ) ( not ( = ?auto_13862 ?auto_13872 ) ) ( not ( = ?auto_13862 ?auto_13894 ) ) ( not ( = ?auto_13863 ?auto_13872 ) ) ( not ( = ?auto_13863 ?auto_13894 ) ) ( not ( = ?auto_13864 ?auto_13872 ) ) ( not ( = ?auto_13864 ?auto_13894 ) ) ( not ( = ?auto_13865 ?auto_13872 ) ) ( not ( = ?auto_13865 ?auto_13894 ) ) ( not ( = ?auto_13866 ?auto_13872 ) ) ( not ( = ?auto_13866 ?auto_13894 ) ) ( not ( = ?auto_13869 ?auto_13872 ) ) ( not ( = ?auto_13869 ?auto_13894 ) ) ( not ( = ?auto_13867 ?auto_13872 ) ) ( not ( = ?auto_13867 ?auto_13894 ) ) ( not ( = ?auto_13871 ?auto_13872 ) ) ( not ( = ?auto_13871 ?auto_13894 ) ) ( not ( = ?auto_13870 ?auto_13872 ) ) ( not ( = ?auto_13870 ?auto_13894 ) ) ( not ( = ?auto_13868 ?auto_13872 ) ) ( not ( = ?auto_13868 ?auto_13894 ) ) ( not ( = ?auto_13872 ?auto_13887 ) ) ( not ( = ?auto_13872 ?auto_13882 ) ) ( not ( = ?auto_13872 ?auto_13891 ) ) ( not ( = ?auto_13872 ?auto_13903 ) ) ( not ( = ?auto_13872 ?auto_13884 ) ) ( not ( = ?auto_13872 ?auto_13888 ) ) ( not ( = ?auto_13872 ?auto_13895 ) ) ( not ( = ?auto_13872 ?auto_13910 ) ) ( not ( = ?auto_13872 ?auto_13883 ) ) ( not ( = ?auto_13872 ?auto_13889 ) ) ( not ( = ?auto_13904 ?auto_13890 ) ) ( not ( = ?auto_13904 ?auto_13908 ) ) ( not ( = ?auto_13904 ?auto_13896 ) ) ( not ( = ?auto_13904 ?auto_13876 ) ) ( not ( = ?auto_13904 ?auto_13907 ) ) ( not ( = ?auto_13904 ?auto_13898 ) ) ( not ( = ?auto_13904 ?auto_13892 ) ) ( not ( = ?auto_13904 ?auto_13897 ) ) ( not ( = ?auto_13904 ?auto_13881 ) ) ( not ( = ?auto_13904 ?auto_13899 ) ) ( not ( = ?auto_13893 ?auto_13901 ) ) ( not ( = ?auto_13893 ?auto_13905 ) ) ( not ( = ?auto_13893 ?auto_13886 ) ) ( not ( = ?auto_13893 ?auto_13879 ) ) ( not ( = ?auto_13893 ?auto_13911 ) ) ( not ( = ?auto_13893 ?auto_13909 ) ) ( not ( = ?auto_13893 ?auto_13900 ) ) ( not ( = ?auto_13893 ?auto_13885 ) ) ( not ( = ?auto_13893 ?auto_13906 ) ) ( not ( = ?auto_13893 ?auto_13902 ) ) ( not ( = ?auto_13894 ?auto_13887 ) ) ( not ( = ?auto_13894 ?auto_13882 ) ) ( not ( = ?auto_13894 ?auto_13891 ) ) ( not ( = ?auto_13894 ?auto_13903 ) ) ( not ( = ?auto_13894 ?auto_13884 ) ) ( not ( = ?auto_13894 ?auto_13888 ) ) ( not ( = ?auto_13894 ?auto_13895 ) ) ( not ( = ?auto_13894 ?auto_13910 ) ) ( not ( = ?auto_13894 ?auto_13883 ) ) ( not ( = ?auto_13894 ?auto_13889 ) ) ( not ( = ?auto_13862 ?auto_13874 ) ) ( not ( = ?auto_13862 ?auto_13878 ) ) ( not ( = ?auto_13863 ?auto_13874 ) ) ( not ( = ?auto_13863 ?auto_13878 ) ) ( not ( = ?auto_13864 ?auto_13874 ) ) ( not ( = ?auto_13864 ?auto_13878 ) ) ( not ( = ?auto_13865 ?auto_13874 ) ) ( not ( = ?auto_13865 ?auto_13878 ) ) ( not ( = ?auto_13866 ?auto_13874 ) ) ( not ( = ?auto_13866 ?auto_13878 ) ) ( not ( = ?auto_13869 ?auto_13874 ) ) ( not ( = ?auto_13869 ?auto_13878 ) ) ( not ( = ?auto_13867 ?auto_13874 ) ) ( not ( = ?auto_13867 ?auto_13878 ) ) ( not ( = ?auto_13871 ?auto_13874 ) ) ( not ( = ?auto_13871 ?auto_13878 ) ) ( not ( = ?auto_13870 ?auto_13874 ) ) ( not ( = ?auto_13870 ?auto_13878 ) ) ( not ( = ?auto_13868 ?auto_13874 ) ) ( not ( = ?auto_13868 ?auto_13878 ) ) ( not ( = ?auto_13873 ?auto_13874 ) ) ( not ( = ?auto_13873 ?auto_13878 ) ) ( not ( = ?auto_13874 ?auto_13894 ) ) ( not ( = ?auto_13874 ?auto_13887 ) ) ( not ( = ?auto_13874 ?auto_13882 ) ) ( not ( = ?auto_13874 ?auto_13891 ) ) ( not ( = ?auto_13874 ?auto_13903 ) ) ( not ( = ?auto_13874 ?auto_13884 ) ) ( not ( = ?auto_13874 ?auto_13888 ) ) ( not ( = ?auto_13874 ?auto_13895 ) ) ( not ( = ?auto_13874 ?auto_13910 ) ) ( not ( = ?auto_13874 ?auto_13883 ) ) ( not ( = ?auto_13874 ?auto_13889 ) ) ( not ( = ?auto_13878 ?auto_13894 ) ) ( not ( = ?auto_13878 ?auto_13887 ) ) ( not ( = ?auto_13878 ?auto_13882 ) ) ( not ( = ?auto_13878 ?auto_13891 ) ) ( not ( = ?auto_13878 ?auto_13903 ) ) ( not ( = ?auto_13878 ?auto_13884 ) ) ( not ( = ?auto_13878 ?auto_13888 ) ) ( not ( = ?auto_13878 ?auto_13895 ) ) ( not ( = ?auto_13878 ?auto_13910 ) ) ( not ( = ?auto_13878 ?auto_13883 ) ) ( not ( = ?auto_13878 ?auto_13889 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_13862 ?auto_13863 ?auto_13864 ?auto_13865 ?auto_13866 ?auto_13869 ?auto_13867 ?auto_13871 ?auto_13870 ?auto_13868 ?auto_13873 ?auto_13872 )
      ( MAKE-1CRATE ?auto_13872 ?auto_13874 )
      ( MAKE-12CRATE-VERIFY ?auto_13862 ?auto_13863 ?auto_13864 ?auto_13865 ?auto_13866 ?auto_13869 ?auto_13867 ?auto_13871 ?auto_13870 ?auto_13868 ?auto_13873 ?auto_13872 ?auto_13874 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13914 - SURFACE
      ?auto_13915 - SURFACE
    )
    :vars
    (
      ?auto_13916 - HOIST
      ?auto_13917 - PLACE
      ?auto_13919 - PLACE
      ?auto_13920 - HOIST
      ?auto_13921 - SURFACE
      ?auto_13918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13916 ?auto_13917 ) ( SURFACE-AT ?auto_13914 ?auto_13917 ) ( CLEAR ?auto_13914 ) ( IS-CRATE ?auto_13915 ) ( AVAILABLE ?auto_13916 ) ( not ( = ?auto_13919 ?auto_13917 ) ) ( HOIST-AT ?auto_13920 ?auto_13919 ) ( AVAILABLE ?auto_13920 ) ( SURFACE-AT ?auto_13915 ?auto_13919 ) ( ON ?auto_13915 ?auto_13921 ) ( CLEAR ?auto_13915 ) ( TRUCK-AT ?auto_13918 ?auto_13917 ) ( not ( = ?auto_13914 ?auto_13915 ) ) ( not ( = ?auto_13914 ?auto_13921 ) ) ( not ( = ?auto_13915 ?auto_13921 ) ) ( not ( = ?auto_13916 ?auto_13920 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13918 ?auto_13917 ?auto_13919 )
      ( !LIFT ?auto_13920 ?auto_13915 ?auto_13921 ?auto_13919 )
      ( !LOAD ?auto_13920 ?auto_13915 ?auto_13918 ?auto_13919 )
      ( !DRIVE ?auto_13918 ?auto_13919 ?auto_13917 )
      ( !UNLOAD ?auto_13916 ?auto_13915 ?auto_13918 ?auto_13917 )
      ( !DROP ?auto_13916 ?auto_13915 ?auto_13914 ?auto_13917 )
      ( MAKE-1CRATE-VERIFY ?auto_13914 ?auto_13915 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_13936 - SURFACE
      ?auto_13937 - SURFACE
      ?auto_13938 - SURFACE
      ?auto_13939 - SURFACE
      ?auto_13940 - SURFACE
      ?auto_13943 - SURFACE
      ?auto_13941 - SURFACE
      ?auto_13945 - SURFACE
      ?auto_13944 - SURFACE
      ?auto_13942 - SURFACE
      ?auto_13947 - SURFACE
      ?auto_13946 - SURFACE
      ?auto_13948 - SURFACE
      ?auto_13949 - SURFACE
    )
    :vars
    (
      ?auto_13955 - HOIST
      ?auto_13954 - PLACE
      ?auto_13951 - PLACE
      ?auto_13953 - HOIST
      ?auto_13952 - SURFACE
      ?auto_13956 - PLACE
      ?auto_13961 - HOIST
      ?auto_13966 - SURFACE
      ?auto_13962 - PLACE
      ?auto_13967 - HOIST
      ?auto_13968 - SURFACE
      ?auto_13979 - PLACE
      ?auto_13971 - HOIST
      ?auto_13975 - SURFACE
      ?auto_13973 - SURFACE
      ?auto_13972 - PLACE
      ?auto_13978 - HOIST
      ?auto_13964 - SURFACE
      ?auto_13959 - SURFACE
      ?auto_13970 - PLACE
      ?auto_13982 - HOIST
      ?auto_13976 - SURFACE
      ?auto_13960 - PLACE
      ?auto_13984 - HOIST
      ?auto_13987 - SURFACE
      ?auto_13985 - PLACE
      ?auto_13969 - HOIST
      ?auto_13958 - SURFACE
      ?auto_13957 - PLACE
      ?auto_13981 - HOIST
      ?auto_13983 - SURFACE
      ?auto_13986 - PLACE
      ?auto_13980 - HOIST
      ?auto_13977 - SURFACE
      ?auto_13965 - PLACE
      ?auto_13963 - HOIST
      ?auto_13974 - SURFACE
      ?auto_13950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13955 ?auto_13954 ) ( IS-CRATE ?auto_13949 ) ( not ( = ?auto_13951 ?auto_13954 ) ) ( HOIST-AT ?auto_13953 ?auto_13951 ) ( SURFACE-AT ?auto_13949 ?auto_13951 ) ( ON ?auto_13949 ?auto_13952 ) ( CLEAR ?auto_13949 ) ( not ( = ?auto_13948 ?auto_13949 ) ) ( not ( = ?auto_13948 ?auto_13952 ) ) ( not ( = ?auto_13949 ?auto_13952 ) ) ( not ( = ?auto_13955 ?auto_13953 ) ) ( IS-CRATE ?auto_13948 ) ( not ( = ?auto_13956 ?auto_13954 ) ) ( HOIST-AT ?auto_13961 ?auto_13956 ) ( SURFACE-AT ?auto_13948 ?auto_13956 ) ( ON ?auto_13948 ?auto_13966 ) ( CLEAR ?auto_13948 ) ( not ( = ?auto_13946 ?auto_13948 ) ) ( not ( = ?auto_13946 ?auto_13966 ) ) ( not ( = ?auto_13948 ?auto_13966 ) ) ( not ( = ?auto_13955 ?auto_13961 ) ) ( IS-CRATE ?auto_13946 ) ( not ( = ?auto_13962 ?auto_13954 ) ) ( HOIST-AT ?auto_13967 ?auto_13962 ) ( AVAILABLE ?auto_13967 ) ( SURFACE-AT ?auto_13946 ?auto_13962 ) ( ON ?auto_13946 ?auto_13968 ) ( CLEAR ?auto_13946 ) ( not ( = ?auto_13947 ?auto_13946 ) ) ( not ( = ?auto_13947 ?auto_13968 ) ) ( not ( = ?auto_13946 ?auto_13968 ) ) ( not ( = ?auto_13955 ?auto_13967 ) ) ( IS-CRATE ?auto_13947 ) ( not ( = ?auto_13979 ?auto_13954 ) ) ( HOIST-AT ?auto_13971 ?auto_13979 ) ( AVAILABLE ?auto_13971 ) ( SURFACE-AT ?auto_13947 ?auto_13979 ) ( ON ?auto_13947 ?auto_13975 ) ( CLEAR ?auto_13947 ) ( not ( = ?auto_13942 ?auto_13947 ) ) ( not ( = ?auto_13942 ?auto_13975 ) ) ( not ( = ?auto_13947 ?auto_13975 ) ) ( not ( = ?auto_13955 ?auto_13971 ) ) ( IS-CRATE ?auto_13942 ) ( AVAILABLE ?auto_13953 ) ( SURFACE-AT ?auto_13942 ?auto_13951 ) ( ON ?auto_13942 ?auto_13973 ) ( CLEAR ?auto_13942 ) ( not ( = ?auto_13944 ?auto_13942 ) ) ( not ( = ?auto_13944 ?auto_13973 ) ) ( not ( = ?auto_13942 ?auto_13973 ) ) ( IS-CRATE ?auto_13944 ) ( not ( = ?auto_13972 ?auto_13954 ) ) ( HOIST-AT ?auto_13978 ?auto_13972 ) ( AVAILABLE ?auto_13978 ) ( SURFACE-AT ?auto_13944 ?auto_13972 ) ( ON ?auto_13944 ?auto_13964 ) ( CLEAR ?auto_13944 ) ( not ( = ?auto_13945 ?auto_13944 ) ) ( not ( = ?auto_13945 ?auto_13964 ) ) ( not ( = ?auto_13944 ?auto_13964 ) ) ( not ( = ?auto_13955 ?auto_13978 ) ) ( IS-CRATE ?auto_13945 ) ( AVAILABLE ?auto_13961 ) ( SURFACE-AT ?auto_13945 ?auto_13956 ) ( ON ?auto_13945 ?auto_13959 ) ( CLEAR ?auto_13945 ) ( not ( = ?auto_13941 ?auto_13945 ) ) ( not ( = ?auto_13941 ?auto_13959 ) ) ( not ( = ?auto_13945 ?auto_13959 ) ) ( IS-CRATE ?auto_13941 ) ( not ( = ?auto_13970 ?auto_13954 ) ) ( HOIST-AT ?auto_13982 ?auto_13970 ) ( AVAILABLE ?auto_13982 ) ( SURFACE-AT ?auto_13941 ?auto_13970 ) ( ON ?auto_13941 ?auto_13976 ) ( CLEAR ?auto_13941 ) ( not ( = ?auto_13943 ?auto_13941 ) ) ( not ( = ?auto_13943 ?auto_13976 ) ) ( not ( = ?auto_13941 ?auto_13976 ) ) ( not ( = ?auto_13955 ?auto_13982 ) ) ( IS-CRATE ?auto_13943 ) ( not ( = ?auto_13960 ?auto_13954 ) ) ( HOIST-AT ?auto_13984 ?auto_13960 ) ( AVAILABLE ?auto_13984 ) ( SURFACE-AT ?auto_13943 ?auto_13960 ) ( ON ?auto_13943 ?auto_13987 ) ( CLEAR ?auto_13943 ) ( not ( = ?auto_13940 ?auto_13943 ) ) ( not ( = ?auto_13940 ?auto_13987 ) ) ( not ( = ?auto_13943 ?auto_13987 ) ) ( not ( = ?auto_13955 ?auto_13984 ) ) ( IS-CRATE ?auto_13940 ) ( not ( = ?auto_13985 ?auto_13954 ) ) ( HOIST-AT ?auto_13969 ?auto_13985 ) ( AVAILABLE ?auto_13969 ) ( SURFACE-AT ?auto_13940 ?auto_13985 ) ( ON ?auto_13940 ?auto_13958 ) ( CLEAR ?auto_13940 ) ( not ( = ?auto_13939 ?auto_13940 ) ) ( not ( = ?auto_13939 ?auto_13958 ) ) ( not ( = ?auto_13940 ?auto_13958 ) ) ( not ( = ?auto_13955 ?auto_13969 ) ) ( IS-CRATE ?auto_13939 ) ( not ( = ?auto_13957 ?auto_13954 ) ) ( HOIST-AT ?auto_13981 ?auto_13957 ) ( AVAILABLE ?auto_13981 ) ( SURFACE-AT ?auto_13939 ?auto_13957 ) ( ON ?auto_13939 ?auto_13983 ) ( CLEAR ?auto_13939 ) ( not ( = ?auto_13938 ?auto_13939 ) ) ( not ( = ?auto_13938 ?auto_13983 ) ) ( not ( = ?auto_13939 ?auto_13983 ) ) ( not ( = ?auto_13955 ?auto_13981 ) ) ( IS-CRATE ?auto_13938 ) ( not ( = ?auto_13986 ?auto_13954 ) ) ( HOIST-AT ?auto_13980 ?auto_13986 ) ( AVAILABLE ?auto_13980 ) ( SURFACE-AT ?auto_13938 ?auto_13986 ) ( ON ?auto_13938 ?auto_13977 ) ( CLEAR ?auto_13938 ) ( not ( = ?auto_13937 ?auto_13938 ) ) ( not ( = ?auto_13937 ?auto_13977 ) ) ( not ( = ?auto_13938 ?auto_13977 ) ) ( not ( = ?auto_13955 ?auto_13980 ) ) ( SURFACE-AT ?auto_13936 ?auto_13954 ) ( CLEAR ?auto_13936 ) ( IS-CRATE ?auto_13937 ) ( AVAILABLE ?auto_13955 ) ( not ( = ?auto_13965 ?auto_13954 ) ) ( HOIST-AT ?auto_13963 ?auto_13965 ) ( AVAILABLE ?auto_13963 ) ( SURFACE-AT ?auto_13937 ?auto_13965 ) ( ON ?auto_13937 ?auto_13974 ) ( CLEAR ?auto_13937 ) ( TRUCK-AT ?auto_13950 ?auto_13954 ) ( not ( = ?auto_13936 ?auto_13937 ) ) ( not ( = ?auto_13936 ?auto_13974 ) ) ( not ( = ?auto_13937 ?auto_13974 ) ) ( not ( = ?auto_13955 ?auto_13963 ) ) ( not ( = ?auto_13936 ?auto_13938 ) ) ( not ( = ?auto_13936 ?auto_13977 ) ) ( not ( = ?auto_13938 ?auto_13974 ) ) ( not ( = ?auto_13986 ?auto_13965 ) ) ( not ( = ?auto_13980 ?auto_13963 ) ) ( not ( = ?auto_13977 ?auto_13974 ) ) ( not ( = ?auto_13936 ?auto_13939 ) ) ( not ( = ?auto_13936 ?auto_13983 ) ) ( not ( = ?auto_13937 ?auto_13939 ) ) ( not ( = ?auto_13937 ?auto_13983 ) ) ( not ( = ?auto_13939 ?auto_13977 ) ) ( not ( = ?auto_13939 ?auto_13974 ) ) ( not ( = ?auto_13957 ?auto_13986 ) ) ( not ( = ?auto_13957 ?auto_13965 ) ) ( not ( = ?auto_13981 ?auto_13980 ) ) ( not ( = ?auto_13981 ?auto_13963 ) ) ( not ( = ?auto_13983 ?auto_13977 ) ) ( not ( = ?auto_13983 ?auto_13974 ) ) ( not ( = ?auto_13936 ?auto_13940 ) ) ( not ( = ?auto_13936 ?auto_13958 ) ) ( not ( = ?auto_13937 ?auto_13940 ) ) ( not ( = ?auto_13937 ?auto_13958 ) ) ( not ( = ?auto_13938 ?auto_13940 ) ) ( not ( = ?auto_13938 ?auto_13958 ) ) ( not ( = ?auto_13940 ?auto_13983 ) ) ( not ( = ?auto_13940 ?auto_13977 ) ) ( not ( = ?auto_13940 ?auto_13974 ) ) ( not ( = ?auto_13985 ?auto_13957 ) ) ( not ( = ?auto_13985 ?auto_13986 ) ) ( not ( = ?auto_13985 ?auto_13965 ) ) ( not ( = ?auto_13969 ?auto_13981 ) ) ( not ( = ?auto_13969 ?auto_13980 ) ) ( not ( = ?auto_13969 ?auto_13963 ) ) ( not ( = ?auto_13958 ?auto_13983 ) ) ( not ( = ?auto_13958 ?auto_13977 ) ) ( not ( = ?auto_13958 ?auto_13974 ) ) ( not ( = ?auto_13936 ?auto_13943 ) ) ( not ( = ?auto_13936 ?auto_13987 ) ) ( not ( = ?auto_13937 ?auto_13943 ) ) ( not ( = ?auto_13937 ?auto_13987 ) ) ( not ( = ?auto_13938 ?auto_13943 ) ) ( not ( = ?auto_13938 ?auto_13987 ) ) ( not ( = ?auto_13939 ?auto_13943 ) ) ( not ( = ?auto_13939 ?auto_13987 ) ) ( not ( = ?auto_13943 ?auto_13958 ) ) ( not ( = ?auto_13943 ?auto_13983 ) ) ( not ( = ?auto_13943 ?auto_13977 ) ) ( not ( = ?auto_13943 ?auto_13974 ) ) ( not ( = ?auto_13960 ?auto_13985 ) ) ( not ( = ?auto_13960 ?auto_13957 ) ) ( not ( = ?auto_13960 ?auto_13986 ) ) ( not ( = ?auto_13960 ?auto_13965 ) ) ( not ( = ?auto_13984 ?auto_13969 ) ) ( not ( = ?auto_13984 ?auto_13981 ) ) ( not ( = ?auto_13984 ?auto_13980 ) ) ( not ( = ?auto_13984 ?auto_13963 ) ) ( not ( = ?auto_13987 ?auto_13958 ) ) ( not ( = ?auto_13987 ?auto_13983 ) ) ( not ( = ?auto_13987 ?auto_13977 ) ) ( not ( = ?auto_13987 ?auto_13974 ) ) ( not ( = ?auto_13936 ?auto_13941 ) ) ( not ( = ?auto_13936 ?auto_13976 ) ) ( not ( = ?auto_13937 ?auto_13941 ) ) ( not ( = ?auto_13937 ?auto_13976 ) ) ( not ( = ?auto_13938 ?auto_13941 ) ) ( not ( = ?auto_13938 ?auto_13976 ) ) ( not ( = ?auto_13939 ?auto_13941 ) ) ( not ( = ?auto_13939 ?auto_13976 ) ) ( not ( = ?auto_13940 ?auto_13941 ) ) ( not ( = ?auto_13940 ?auto_13976 ) ) ( not ( = ?auto_13941 ?auto_13987 ) ) ( not ( = ?auto_13941 ?auto_13958 ) ) ( not ( = ?auto_13941 ?auto_13983 ) ) ( not ( = ?auto_13941 ?auto_13977 ) ) ( not ( = ?auto_13941 ?auto_13974 ) ) ( not ( = ?auto_13970 ?auto_13960 ) ) ( not ( = ?auto_13970 ?auto_13985 ) ) ( not ( = ?auto_13970 ?auto_13957 ) ) ( not ( = ?auto_13970 ?auto_13986 ) ) ( not ( = ?auto_13970 ?auto_13965 ) ) ( not ( = ?auto_13982 ?auto_13984 ) ) ( not ( = ?auto_13982 ?auto_13969 ) ) ( not ( = ?auto_13982 ?auto_13981 ) ) ( not ( = ?auto_13982 ?auto_13980 ) ) ( not ( = ?auto_13982 ?auto_13963 ) ) ( not ( = ?auto_13976 ?auto_13987 ) ) ( not ( = ?auto_13976 ?auto_13958 ) ) ( not ( = ?auto_13976 ?auto_13983 ) ) ( not ( = ?auto_13976 ?auto_13977 ) ) ( not ( = ?auto_13976 ?auto_13974 ) ) ( not ( = ?auto_13936 ?auto_13945 ) ) ( not ( = ?auto_13936 ?auto_13959 ) ) ( not ( = ?auto_13937 ?auto_13945 ) ) ( not ( = ?auto_13937 ?auto_13959 ) ) ( not ( = ?auto_13938 ?auto_13945 ) ) ( not ( = ?auto_13938 ?auto_13959 ) ) ( not ( = ?auto_13939 ?auto_13945 ) ) ( not ( = ?auto_13939 ?auto_13959 ) ) ( not ( = ?auto_13940 ?auto_13945 ) ) ( not ( = ?auto_13940 ?auto_13959 ) ) ( not ( = ?auto_13943 ?auto_13945 ) ) ( not ( = ?auto_13943 ?auto_13959 ) ) ( not ( = ?auto_13945 ?auto_13976 ) ) ( not ( = ?auto_13945 ?auto_13987 ) ) ( not ( = ?auto_13945 ?auto_13958 ) ) ( not ( = ?auto_13945 ?auto_13983 ) ) ( not ( = ?auto_13945 ?auto_13977 ) ) ( not ( = ?auto_13945 ?auto_13974 ) ) ( not ( = ?auto_13956 ?auto_13970 ) ) ( not ( = ?auto_13956 ?auto_13960 ) ) ( not ( = ?auto_13956 ?auto_13985 ) ) ( not ( = ?auto_13956 ?auto_13957 ) ) ( not ( = ?auto_13956 ?auto_13986 ) ) ( not ( = ?auto_13956 ?auto_13965 ) ) ( not ( = ?auto_13961 ?auto_13982 ) ) ( not ( = ?auto_13961 ?auto_13984 ) ) ( not ( = ?auto_13961 ?auto_13969 ) ) ( not ( = ?auto_13961 ?auto_13981 ) ) ( not ( = ?auto_13961 ?auto_13980 ) ) ( not ( = ?auto_13961 ?auto_13963 ) ) ( not ( = ?auto_13959 ?auto_13976 ) ) ( not ( = ?auto_13959 ?auto_13987 ) ) ( not ( = ?auto_13959 ?auto_13958 ) ) ( not ( = ?auto_13959 ?auto_13983 ) ) ( not ( = ?auto_13959 ?auto_13977 ) ) ( not ( = ?auto_13959 ?auto_13974 ) ) ( not ( = ?auto_13936 ?auto_13944 ) ) ( not ( = ?auto_13936 ?auto_13964 ) ) ( not ( = ?auto_13937 ?auto_13944 ) ) ( not ( = ?auto_13937 ?auto_13964 ) ) ( not ( = ?auto_13938 ?auto_13944 ) ) ( not ( = ?auto_13938 ?auto_13964 ) ) ( not ( = ?auto_13939 ?auto_13944 ) ) ( not ( = ?auto_13939 ?auto_13964 ) ) ( not ( = ?auto_13940 ?auto_13944 ) ) ( not ( = ?auto_13940 ?auto_13964 ) ) ( not ( = ?auto_13943 ?auto_13944 ) ) ( not ( = ?auto_13943 ?auto_13964 ) ) ( not ( = ?auto_13941 ?auto_13944 ) ) ( not ( = ?auto_13941 ?auto_13964 ) ) ( not ( = ?auto_13944 ?auto_13959 ) ) ( not ( = ?auto_13944 ?auto_13976 ) ) ( not ( = ?auto_13944 ?auto_13987 ) ) ( not ( = ?auto_13944 ?auto_13958 ) ) ( not ( = ?auto_13944 ?auto_13983 ) ) ( not ( = ?auto_13944 ?auto_13977 ) ) ( not ( = ?auto_13944 ?auto_13974 ) ) ( not ( = ?auto_13972 ?auto_13956 ) ) ( not ( = ?auto_13972 ?auto_13970 ) ) ( not ( = ?auto_13972 ?auto_13960 ) ) ( not ( = ?auto_13972 ?auto_13985 ) ) ( not ( = ?auto_13972 ?auto_13957 ) ) ( not ( = ?auto_13972 ?auto_13986 ) ) ( not ( = ?auto_13972 ?auto_13965 ) ) ( not ( = ?auto_13978 ?auto_13961 ) ) ( not ( = ?auto_13978 ?auto_13982 ) ) ( not ( = ?auto_13978 ?auto_13984 ) ) ( not ( = ?auto_13978 ?auto_13969 ) ) ( not ( = ?auto_13978 ?auto_13981 ) ) ( not ( = ?auto_13978 ?auto_13980 ) ) ( not ( = ?auto_13978 ?auto_13963 ) ) ( not ( = ?auto_13964 ?auto_13959 ) ) ( not ( = ?auto_13964 ?auto_13976 ) ) ( not ( = ?auto_13964 ?auto_13987 ) ) ( not ( = ?auto_13964 ?auto_13958 ) ) ( not ( = ?auto_13964 ?auto_13983 ) ) ( not ( = ?auto_13964 ?auto_13977 ) ) ( not ( = ?auto_13964 ?auto_13974 ) ) ( not ( = ?auto_13936 ?auto_13942 ) ) ( not ( = ?auto_13936 ?auto_13973 ) ) ( not ( = ?auto_13937 ?auto_13942 ) ) ( not ( = ?auto_13937 ?auto_13973 ) ) ( not ( = ?auto_13938 ?auto_13942 ) ) ( not ( = ?auto_13938 ?auto_13973 ) ) ( not ( = ?auto_13939 ?auto_13942 ) ) ( not ( = ?auto_13939 ?auto_13973 ) ) ( not ( = ?auto_13940 ?auto_13942 ) ) ( not ( = ?auto_13940 ?auto_13973 ) ) ( not ( = ?auto_13943 ?auto_13942 ) ) ( not ( = ?auto_13943 ?auto_13973 ) ) ( not ( = ?auto_13941 ?auto_13942 ) ) ( not ( = ?auto_13941 ?auto_13973 ) ) ( not ( = ?auto_13945 ?auto_13942 ) ) ( not ( = ?auto_13945 ?auto_13973 ) ) ( not ( = ?auto_13942 ?auto_13964 ) ) ( not ( = ?auto_13942 ?auto_13959 ) ) ( not ( = ?auto_13942 ?auto_13976 ) ) ( not ( = ?auto_13942 ?auto_13987 ) ) ( not ( = ?auto_13942 ?auto_13958 ) ) ( not ( = ?auto_13942 ?auto_13983 ) ) ( not ( = ?auto_13942 ?auto_13977 ) ) ( not ( = ?auto_13942 ?auto_13974 ) ) ( not ( = ?auto_13951 ?auto_13972 ) ) ( not ( = ?auto_13951 ?auto_13956 ) ) ( not ( = ?auto_13951 ?auto_13970 ) ) ( not ( = ?auto_13951 ?auto_13960 ) ) ( not ( = ?auto_13951 ?auto_13985 ) ) ( not ( = ?auto_13951 ?auto_13957 ) ) ( not ( = ?auto_13951 ?auto_13986 ) ) ( not ( = ?auto_13951 ?auto_13965 ) ) ( not ( = ?auto_13953 ?auto_13978 ) ) ( not ( = ?auto_13953 ?auto_13961 ) ) ( not ( = ?auto_13953 ?auto_13982 ) ) ( not ( = ?auto_13953 ?auto_13984 ) ) ( not ( = ?auto_13953 ?auto_13969 ) ) ( not ( = ?auto_13953 ?auto_13981 ) ) ( not ( = ?auto_13953 ?auto_13980 ) ) ( not ( = ?auto_13953 ?auto_13963 ) ) ( not ( = ?auto_13973 ?auto_13964 ) ) ( not ( = ?auto_13973 ?auto_13959 ) ) ( not ( = ?auto_13973 ?auto_13976 ) ) ( not ( = ?auto_13973 ?auto_13987 ) ) ( not ( = ?auto_13973 ?auto_13958 ) ) ( not ( = ?auto_13973 ?auto_13983 ) ) ( not ( = ?auto_13973 ?auto_13977 ) ) ( not ( = ?auto_13973 ?auto_13974 ) ) ( not ( = ?auto_13936 ?auto_13947 ) ) ( not ( = ?auto_13936 ?auto_13975 ) ) ( not ( = ?auto_13937 ?auto_13947 ) ) ( not ( = ?auto_13937 ?auto_13975 ) ) ( not ( = ?auto_13938 ?auto_13947 ) ) ( not ( = ?auto_13938 ?auto_13975 ) ) ( not ( = ?auto_13939 ?auto_13947 ) ) ( not ( = ?auto_13939 ?auto_13975 ) ) ( not ( = ?auto_13940 ?auto_13947 ) ) ( not ( = ?auto_13940 ?auto_13975 ) ) ( not ( = ?auto_13943 ?auto_13947 ) ) ( not ( = ?auto_13943 ?auto_13975 ) ) ( not ( = ?auto_13941 ?auto_13947 ) ) ( not ( = ?auto_13941 ?auto_13975 ) ) ( not ( = ?auto_13945 ?auto_13947 ) ) ( not ( = ?auto_13945 ?auto_13975 ) ) ( not ( = ?auto_13944 ?auto_13947 ) ) ( not ( = ?auto_13944 ?auto_13975 ) ) ( not ( = ?auto_13947 ?auto_13973 ) ) ( not ( = ?auto_13947 ?auto_13964 ) ) ( not ( = ?auto_13947 ?auto_13959 ) ) ( not ( = ?auto_13947 ?auto_13976 ) ) ( not ( = ?auto_13947 ?auto_13987 ) ) ( not ( = ?auto_13947 ?auto_13958 ) ) ( not ( = ?auto_13947 ?auto_13983 ) ) ( not ( = ?auto_13947 ?auto_13977 ) ) ( not ( = ?auto_13947 ?auto_13974 ) ) ( not ( = ?auto_13979 ?auto_13951 ) ) ( not ( = ?auto_13979 ?auto_13972 ) ) ( not ( = ?auto_13979 ?auto_13956 ) ) ( not ( = ?auto_13979 ?auto_13970 ) ) ( not ( = ?auto_13979 ?auto_13960 ) ) ( not ( = ?auto_13979 ?auto_13985 ) ) ( not ( = ?auto_13979 ?auto_13957 ) ) ( not ( = ?auto_13979 ?auto_13986 ) ) ( not ( = ?auto_13979 ?auto_13965 ) ) ( not ( = ?auto_13971 ?auto_13953 ) ) ( not ( = ?auto_13971 ?auto_13978 ) ) ( not ( = ?auto_13971 ?auto_13961 ) ) ( not ( = ?auto_13971 ?auto_13982 ) ) ( not ( = ?auto_13971 ?auto_13984 ) ) ( not ( = ?auto_13971 ?auto_13969 ) ) ( not ( = ?auto_13971 ?auto_13981 ) ) ( not ( = ?auto_13971 ?auto_13980 ) ) ( not ( = ?auto_13971 ?auto_13963 ) ) ( not ( = ?auto_13975 ?auto_13973 ) ) ( not ( = ?auto_13975 ?auto_13964 ) ) ( not ( = ?auto_13975 ?auto_13959 ) ) ( not ( = ?auto_13975 ?auto_13976 ) ) ( not ( = ?auto_13975 ?auto_13987 ) ) ( not ( = ?auto_13975 ?auto_13958 ) ) ( not ( = ?auto_13975 ?auto_13983 ) ) ( not ( = ?auto_13975 ?auto_13977 ) ) ( not ( = ?auto_13975 ?auto_13974 ) ) ( not ( = ?auto_13936 ?auto_13946 ) ) ( not ( = ?auto_13936 ?auto_13968 ) ) ( not ( = ?auto_13937 ?auto_13946 ) ) ( not ( = ?auto_13937 ?auto_13968 ) ) ( not ( = ?auto_13938 ?auto_13946 ) ) ( not ( = ?auto_13938 ?auto_13968 ) ) ( not ( = ?auto_13939 ?auto_13946 ) ) ( not ( = ?auto_13939 ?auto_13968 ) ) ( not ( = ?auto_13940 ?auto_13946 ) ) ( not ( = ?auto_13940 ?auto_13968 ) ) ( not ( = ?auto_13943 ?auto_13946 ) ) ( not ( = ?auto_13943 ?auto_13968 ) ) ( not ( = ?auto_13941 ?auto_13946 ) ) ( not ( = ?auto_13941 ?auto_13968 ) ) ( not ( = ?auto_13945 ?auto_13946 ) ) ( not ( = ?auto_13945 ?auto_13968 ) ) ( not ( = ?auto_13944 ?auto_13946 ) ) ( not ( = ?auto_13944 ?auto_13968 ) ) ( not ( = ?auto_13942 ?auto_13946 ) ) ( not ( = ?auto_13942 ?auto_13968 ) ) ( not ( = ?auto_13946 ?auto_13975 ) ) ( not ( = ?auto_13946 ?auto_13973 ) ) ( not ( = ?auto_13946 ?auto_13964 ) ) ( not ( = ?auto_13946 ?auto_13959 ) ) ( not ( = ?auto_13946 ?auto_13976 ) ) ( not ( = ?auto_13946 ?auto_13987 ) ) ( not ( = ?auto_13946 ?auto_13958 ) ) ( not ( = ?auto_13946 ?auto_13983 ) ) ( not ( = ?auto_13946 ?auto_13977 ) ) ( not ( = ?auto_13946 ?auto_13974 ) ) ( not ( = ?auto_13962 ?auto_13979 ) ) ( not ( = ?auto_13962 ?auto_13951 ) ) ( not ( = ?auto_13962 ?auto_13972 ) ) ( not ( = ?auto_13962 ?auto_13956 ) ) ( not ( = ?auto_13962 ?auto_13970 ) ) ( not ( = ?auto_13962 ?auto_13960 ) ) ( not ( = ?auto_13962 ?auto_13985 ) ) ( not ( = ?auto_13962 ?auto_13957 ) ) ( not ( = ?auto_13962 ?auto_13986 ) ) ( not ( = ?auto_13962 ?auto_13965 ) ) ( not ( = ?auto_13967 ?auto_13971 ) ) ( not ( = ?auto_13967 ?auto_13953 ) ) ( not ( = ?auto_13967 ?auto_13978 ) ) ( not ( = ?auto_13967 ?auto_13961 ) ) ( not ( = ?auto_13967 ?auto_13982 ) ) ( not ( = ?auto_13967 ?auto_13984 ) ) ( not ( = ?auto_13967 ?auto_13969 ) ) ( not ( = ?auto_13967 ?auto_13981 ) ) ( not ( = ?auto_13967 ?auto_13980 ) ) ( not ( = ?auto_13967 ?auto_13963 ) ) ( not ( = ?auto_13968 ?auto_13975 ) ) ( not ( = ?auto_13968 ?auto_13973 ) ) ( not ( = ?auto_13968 ?auto_13964 ) ) ( not ( = ?auto_13968 ?auto_13959 ) ) ( not ( = ?auto_13968 ?auto_13976 ) ) ( not ( = ?auto_13968 ?auto_13987 ) ) ( not ( = ?auto_13968 ?auto_13958 ) ) ( not ( = ?auto_13968 ?auto_13983 ) ) ( not ( = ?auto_13968 ?auto_13977 ) ) ( not ( = ?auto_13968 ?auto_13974 ) ) ( not ( = ?auto_13936 ?auto_13948 ) ) ( not ( = ?auto_13936 ?auto_13966 ) ) ( not ( = ?auto_13937 ?auto_13948 ) ) ( not ( = ?auto_13937 ?auto_13966 ) ) ( not ( = ?auto_13938 ?auto_13948 ) ) ( not ( = ?auto_13938 ?auto_13966 ) ) ( not ( = ?auto_13939 ?auto_13948 ) ) ( not ( = ?auto_13939 ?auto_13966 ) ) ( not ( = ?auto_13940 ?auto_13948 ) ) ( not ( = ?auto_13940 ?auto_13966 ) ) ( not ( = ?auto_13943 ?auto_13948 ) ) ( not ( = ?auto_13943 ?auto_13966 ) ) ( not ( = ?auto_13941 ?auto_13948 ) ) ( not ( = ?auto_13941 ?auto_13966 ) ) ( not ( = ?auto_13945 ?auto_13948 ) ) ( not ( = ?auto_13945 ?auto_13966 ) ) ( not ( = ?auto_13944 ?auto_13948 ) ) ( not ( = ?auto_13944 ?auto_13966 ) ) ( not ( = ?auto_13942 ?auto_13948 ) ) ( not ( = ?auto_13942 ?auto_13966 ) ) ( not ( = ?auto_13947 ?auto_13948 ) ) ( not ( = ?auto_13947 ?auto_13966 ) ) ( not ( = ?auto_13948 ?auto_13968 ) ) ( not ( = ?auto_13948 ?auto_13975 ) ) ( not ( = ?auto_13948 ?auto_13973 ) ) ( not ( = ?auto_13948 ?auto_13964 ) ) ( not ( = ?auto_13948 ?auto_13959 ) ) ( not ( = ?auto_13948 ?auto_13976 ) ) ( not ( = ?auto_13948 ?auto_13987 ) ) ( not ( = ?auto_13948 ?auto_13958 ) ) ( not ( = ?auto_13948 ?auto_13983 ) ) ( not ( = ?auto_13948 ?auto_13977 ) ) ( not ( = ?auto_13948 ?auto_13974 ) ) ( not ( = ?auto_13966 ?auto_13968 ) ) ( not ( = ?auto_13966 ?auto_13975 ) ) ( not ( = ?auto_13966 ?auto_13973 ) ) ( not ( = ?auto_13966 ?auto_13964 ) ) ( not ( = ?auto_13966 ?auto_13959 ) ) ( not ( = ?auto_13966 ?auto_13976 ) ) ( not ( = ?auto_13966 ?auto_13987 ) ) ( not ( = ?auto_13966 ?auto_13958 ) ) ( not ( = ?auto_13966 ?auto_13983 ) ) ( not ( = ?auto_13966 ?auto_13977 ) ) ( not ( = ?auto_13966 ?auto_13974 ) ) ( not ( = ?auto_13936 ?auto_13949 ) ) ( not ( = ?auto_13936 ?auto_13952 ) ) ( not ( = ?auto_13937 ?auto_13949 ) ) ( not ( = ?auto_13937 ?auto_13952 ) ) ( not ( = ?auto_13938 ?auto_13949 ) ) ( not ( = ?auto_13938 ?auto_13952 ) ) ( not ( = ?auto_13939 ?auto_13949 ) ) ( not ( = ?auto_13939 ?auto_13952 ) ) ( not ( = ?auto_13940 ?auto_13949 ) ) ( not ( = ?auto_13940 ?auto_13952 ) ) ( not ( = ?auto_13943 ?auto_13949 ) ) ( not ( = ?auto_13943 ?auto_13952 ) ) ( not ( = ?auto_13941 ?auto_13949 ) ) ( not ( = ?auto_13941 ?auto_13952 ) ) ( not ( = ?auto_13945 ?auto_13949 ) ) ( not ( = ?auto_13945 ?auto_13952 ) ) ( not ( = ?auto_13944 ?auto_13949 ) ) ( not ( = ?auto_13944 ?auto_13952 ) ) ( not ( = ?auto_13942 ?auto_13949 ) ) ( not ( = ?auto_13942 ?auto_13952 ) ) ( not ( = ?auto_13947 ?auto_13949 ) ) ( not ( = ?auto_13947 ?auto_13952 ) ) ( not ( = ?auto_13946 ?auto_13949 ) ) ( not ( = ?auto_13946 ?auto_13952 ) ) ( not ( = ?auto_13949 ?auto_13966 ) ) ( not ( = ?auto_13949 ?auto_13968 ) ) ( not ( = ?auto_13949 ?auto_13975 ) ) ( not ( = ?auto_13949 ?auto_13973 ) ) ( not ( = ?auto_13949 ?auto_13964 ) ) ( not ( = ?auto_13949 ?auto_13959 ) ) ( not ( = ?auto_13949 ?auto_13976 ) ) ( not ( = ?auto_13949 ?auto_13987 ) ) ( not ( = ?auto_13949 ?auto_13958 ) ) ( not ( = ?auto_13949 ?auto_13983 ) ) ( not ( = ?auto_13949 ?auto_13977 ) ) ( not ( = ?auto_13949 ?auto_13974 ) ) ( not ( = ?auto_13952 ?auto_13966 ) ) ( not ( = ?auto_13952 ?auto_13968 ) ) ( not ( = ?auto_13952 ?auto_13975 ) ) ( not ( = ?auto_13952 ?auto_13973 ) ) ( not ( = ?auto_13952 ?auto_13964 ) ) ( not ( = ?auto_13952 ?auto_13959 ) ) ( not ( = ?auto_13952 ?auto_13976 ) ) ( not ( = ?auto_13952 ?auto_13987 ) ) ( not ( = ?auto_13952 ?auto_13958 ) ) ( not ( = ?auto_13952 ?auto_13983 ) ) ( not ( = ?auto_13952 ?auto_13977 ) ) ( not ( = ?auto_13952 ?auto_13974 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_13936 ?auto_13937 ?auto_13938 ?auto_13939 ?auto_13940 ?auto_13943 ?auto_13941 ?auto_13945 ?auto_13944 ?auto_13942 ?auto_13947 ?auto_13946 ?auto_13948 )
      ( MAKE-1CRATE ?auto_13948 ?auto_13949 )
      ( MAKE-13CRATE-VERIFY ?auto_13936 ?auto_13937 ?auto_13938 ?auto_13939 ?auto_13940 ?auto_13943 ?auto_13941 ?auto_13945 ?auto_13944 ?auto_13942 ?auto_13947 ?auto_13946 ?auto_13948 ?auto_13949 ) )
  )

)

