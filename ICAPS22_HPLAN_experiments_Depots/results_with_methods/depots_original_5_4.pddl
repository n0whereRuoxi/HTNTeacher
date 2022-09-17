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
      ?auto_9379 - SURFACE
      ?auto_9380 - SURFACE
    )
    :vars
    (
      ?auto_9381 - HOIST
      ?auto_9382 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9381 ?auto_9382 ) ( SURFACE-AT ?auto_9380 ?auto_9382 ) ( CLEAR ?auto_9380 ) ( LIFTING ?auto_9381 ?auto_9379 ) ( IS-CRATE ?auto_9379 ) ( not ( = ?auto_9379 ?auto_9380 ) ) )
    :subtasks
    ( ( !DROP ?auto_9381 ?auto_9379 ?auto_9380 ?auto_9382 )
      ( MAKE-ON-VERIFY ?auto_9379 ?auto_9380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9383 - SURFACE
      ?auto_9384 - SURFACE
    )
    :vars
    (
      ?auto_9385 - HOIST
      ?auto_9386 - PLACE
      ?auto_9387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9385 ?auto_9386 ) ( SURFACE-AT ?auto_9384 ?auto_9386 ) ( CLEAR ?auto_9384 ) ( IS-CRATE ?auto_9383 ) ( not ( = ?auto_9383 ?auto_9384 ) ) ( TRUCK-AT ?auto_9387 ?auto_9386 ) ( AVAILABLE ?auto_9385 ) ( IN ?auto_9383 ?auto_9387 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9385 ?auto_9383 ?auto_9387 ?auto_9386 )
      ( MAKE-ON ?auto_9383 ?auto_9384 )
      ( MAKE-ON-VERIFY ?auto_9383 ?auto_9384 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9388 - SURFACE
      ?auto_9389 - SURFACE
    )
    :vars
    (
      ?auto_9390 - HOIST
      ?auto_9392 - PLACE
      ?auto_9391 - TRUCK
      ?auto_9393 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9390 ?auto_9392 ) ( SURFACE-AT ?auto_9389 ?auto_9392 ) ( CLEAR ?auto_9389 ) ( IS-CRATE ?auto_9388 ) ( not ( = ?auto_9388 ?auto_9389 ) ) ( AVAILABLE ?auto_9390 ) ( IN ?auto_9388 ?auto_9391 ) ( TRUCK-AT ?auto_9391 ?auto_9393 ) ( not ( = ?auto_9393 ?auto_9392 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9391 ?auto_9393 ?auto_9392 )
      ( MAKE-ON ?auto_9388 ?auto_9389 )
      ( MAKE-ON-VERIFY ?auto_9388 ?auto_9389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9394 - SURFACE
      ?auto_9395 - SURFACE
    )
    :vars
    (
      ?auto_9397 - HOIST
      ?auto_9399 - PLACE
      ?auto_9396 - TRUCK
      ?auto_9398 - PLACE
      ?auto_9400 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9397 ?auto_9399 ) ( SURFACE-AT ?auto_9395 ?auto_9399 ) ( CLEAR ?auto_9395 ) ( IS-CRATE ?auto_9394 ) ( not ( = ?auto_9394 ?auto_9395 ) ) ( AVAILABLE ?auto_9397 ) ( TRUCK-AT ?auto_9396 ?auto_9398 ) ( not ( = ?auto_9398 ?auto_9399 ) ) ( HOIST-AT ?auto_9400 ?auto_9398 ) ( LIFTING ?auto_9400 ?auto_9394 ) ( not ( = ?auto_9397 ?auto_9400 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9400 ?auto_9394 ?auto_9396 ?auto_9398 )
      ( MAKE-ON ?auto_9394 ?auto_9395 )
      ( MAKE-ON-VERIFY ?auto_9394 ?auto_9395 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9401 - SURFACE
      ?auto_9402 - SURFACE
    )
    :vars
    (
      ?auto_9406 - HOIST
      ?auto_9403 - PLACE
      ?auto_9405 - TRUCK
      ?auto_9404 - PLACE
      ?auto_9407 - HOIST
      ?auto_9408 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9406 ?auto_9403 ) ( SURFACE-AT ?auto_9402 ?auto_9403 ) ( CLEAR ?auto_9402 ) ( IS-CRATE ?auto_9401 ) ( not ( = ?auto_9401 ?auto_9402 ) ) ( AVAILABLE ?auto_9406 ) ( TRUCK-AT ?auto_9405 ?auto_9404 ) ( not ( = ?auto_9404 ?auto_9403 ) ) ( HOIST-AT ?auto_9407 ?auto_9404 ) ( not ( = ?auto_9406 ?auto_9407 ) ) ( AVAILABLE ?auto_9407 ) ( SURFACE-AT ?auto_9401 ?auto_9404 ) ( ON ?auto_9401 ?auto_9408 ) ( CLEAR ?auto_9401 ) ( not ( = ?auto_9401 ?auto_9408 ) ) ( not ( = ?auto_9402 ?auto_9408 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9407 ?auto_9401 ?auto_9408 ?auto_9404 )
      ( MAKE-ON ?auto_9401 ?auto_9402 )
      ( MAKE-ON-VERIFY ?auto_9401 ?auto_9402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9409 - SURFACE
      ?auto_9410 - SURFACE
    )
    :vars
    (
      ?auto_9414 - HOIST
      ?auto_9412 - PLACE
      ?auto_9411 - PLACE
      ?auto_9415 - HOIST
      ?auto_9413 - SURFACE
      ?auto_9416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9414 ?auto_9412 ) ( SURFACE-AT ?auto_9410 ?auto_9412 ) ( CLEAR ?auto_9410 ) ( IS-CRATE ?auto_9409 ) ( not ( = ?auto_9409 ?auto_9410 ) ) ( AVAILABLE ?auto_9414 ) ( not ( = ?auto_9411 ?auto_9412 ) ) ( HOIST-AT ?auto_9415 ?auto_9411 ) ( not ( = ?auto_9414 ?auto_9415 ) ) ( AVAILABLE ?auto_9415 ) ( SURFACE-AT ?auto_9409 ?auto_9411 ) ( ON ?auto_9409 ?auto_9413 ) ( CLEAR ?auto_9409 ) ( not ( = ?auto_9409 ?auto_9413 ) ) ( not ( = ?auto_9410 ?auto_9413 ) ) ( TRUCK-AT ?auto_9416 ?auto_9412 ) )
    :subtasks
    ( ( !DRIVE ?auto_9416 ?auto_9412 ?auto_9411 )
      ( MAKE-ON ?auto_9409 ?auto_9410 )
      ( MAKE-ON-VERIFY ?auto_9409 ?auto_9410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9419 - SURFACE
      ?auto_9420 - SURFACE
    )
    :vars
    (
      ?auto_9421 - HOIST
      ?auto_9422 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9421 ?auto_9422 ) ( SURFACE-AT ?auto_9420 ?auto_9422 ) ( CLEAR ?auto_9420 ) ( LIFTING ?auto_9421 ?auto_9419 ) ( IS-CRATE ?auto_9419 ) ( not ( = ?auto_9419 ?auto_9420 ) ) )
    :subtasks
    ( ( !DROP ?auto_9421 ?auto_9419 ?auto_9420 ?auto_9422 )
      ( MAKE-ON-VERIFY ?auto_9419 ?auto_9420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9423 - SURFACE
      ?auto_9424 - SURFACE
    )
    :vars
    (
      ?auto_9426 - HOIST
      ?auto_9425 - PLACE
      ?auto_9427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9426 ?auto_9425 ) ( SURFACE-AT ?auto_9424 ?auto_9425 ) ( CLEAR ?auto_9424 ) ( IS-CRATE ?auto_9423 ) ( not ( = ?auto_9423 ?auto_9424 ) ) ( TRUCK-AT ?auto_9427 ?auto_9425 ) ( AVAILABLE ?auto_9426 ) ( IN ?auto_9423 ?auto_9427 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9426 ?auto_9423 ?auto_9427 ?auto_9425 )
      ( MAKE-ON ?auto_9423 ?auto_9424 )
      ( MAKE-ON-VERIFY ?auto_9423 ?auto_9424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9428 - SURFACE
      ?auto_9429 - SURFACE
    )
    :vars
    (
      ?auto_9431 - HOIST
      ?auto_9432 - PLACE
      ?auto_9430 - TRUCK
      ?auto_9433 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9431 ?auto_9432 ) ( SURFACE-AT ?auto_9429 ?auto_9432 ) ( CLEAR ?auto_9429 ) ( IS-CRATE ?auto_9428 ) ( not ( = ?auto_9428 ?auto_9429 ) ) ( AVAILABLE ?auto_9431 ) ( IN ?auto_9428 ?auto_9430 ) ( TRUCK-AT ?auto_9430 ?auto_9433 ) ( not ( = ?auto_9433 ?auto_9432 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9430 ?auto_9433 ?auto_9432 )
      ( MAKE-ON ?auto_9428 ?auto_9429 )
      ( MAKE-ON-VERIFY ?auto_9428 ?auto_9429 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9434 - SURFACE
      ?auto_9435 - SURFACE
    )
    :vars
    (
      ?auto_9436 - HOIST
      ?auto_9438 - PLACE
      ?auto_9439 - TRUCK
      ?auto_9437 - PLACE
      ?auto_9440 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9436 ?auto_9438 ) ( SURFACE-AT ?auto_9435 ?auto_9438 ) ( CLEAR ?auto_9435 ) ( IS-CRATE ?auto_9434 ) ( not ( = ?auto_9434 ?auto_9435 ) ) ( AVAILABLE ?auto_9436 ) ( TRUCK-AT ?auto_9439 ?auto_9437 ) ( not ( = ?auto_9437 ?auto_9438 ) ) ( HOIST-AT ?auto_9440 ?auto_9437 ) ( LIFTING ?auto_9440 ?auto_9434 ) ( not ( = ?auto_9436 ?auto_9440 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9440 ?auto_9434 ?auto_9439 ?auto_9437 )
      ( MAKE-ON ?auto_9434 ?auto_9435 )
      ( MAKE-ON-VERIFY ?auto_9434 ?auto_9435 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9441 - SURFACE
      ?auto_9442 - SURFACE
    )
    :vars
    (
      ?auto_9446 - HOIST
      ?auto_9445 - PLACE
      ?auto_9447 - TRUCK
      ?auto_9444 - PLACE
      ?auto_9443 - HOIST
      ?auto_9448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9446 ?auto_9445 ) ( SURFACE-AT ?auto_9442 ?auto_9445 ) ( CLEAR ?auto_9442 ) ( IS-CRATE ?auto_9441 ) ( not ( = ?auto_9441 ?auto_9442 ) ) ( AVAILABLE ?auto_9446 ) ( TRUCK-AT ?auto_9447 ?auto_9444 ) ( not ( = ?auto_9444 ?auto_9445 ) ) ( HOIST-AT ?auto_9443 ?auto_9444 ) ( not ( = ?auto_9446 ?auto_9443 ) ) ( AVAILABLE ?auto_9443 ) ( SURFACE-AT ?auto_9441 ?auto_9444 ) ( ON ?auto_9441 ?auto_9448 ) ( CLEAR ?auto_9441 ) ( not ( = ?auto_9441 ?auto_9448 ) ) ( not ( = ?auto_9442 ?auto_9448 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9443 ?auto_9441 ?auto_9448 ?auto_9444 )
      ( MAKE-ON ?auto_9441 ?auto_9442 )
      ( MAKE-ON-VERIFY ?auto_9441 ?auto_9442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9449 - SURFACE
      ?auto_9450 - SURFACE
    )
    :vars
    (
      ?auto_9451 - HOIST
      ?auto_9454 - PLACE
      ?auto_9456 - PLACE
      ?auto_9452 - HOIST
      ?auto_9455 - SURFACE
      ?auto_9453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9451 ?auto_9454 ) ( SURFACE-AT ?auto_9450 ?auto_9454 ) ( CLEAR ?auto_9450 ) ( IS-CRATE ?auto_9449 ) ( not ( = ?auto_9449 ?auto_9450 ) ) ( AVAILABLE ?auto_9451 ) ( not ( = ?auto_9456 ?auto_9454 ) ) ( HOIST-AT ?auto_9452 ?auto_9456 ) ( not ( = ?auto_9451 ?auto_9452 ) ) ( AVAILABLE ?auto_9452 ) ( SURFACE-AT ?auto_9449 ?auto_9456 ) ( ON ?auto_9449 ?auto_9455 ) ( CLEAR ?auto_9449 ) ( not ( = ?auto_9449 ?auto_9455 ) ) ( not ( = ?auto_9450 ?auto_9455 ) ) ( TRUCK-AT ?auto_9453 ?auto_9454 ) )
    :subtasks
    ( ( !DRIVE ?auto_9453 ?auto_9454 ?auto_9456 )
      ( MAKE-ON ?auto_9449 ?auto_9450 )
      ( MAKE-ON-VERIFY ?auto_9449 ?auto_9450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9457 - SURFACE
      ?auto_9458 - SURFACE
    )
    :vars
    (
      ?auto_9459 - HOIST
      ?auto_9462 - PLACE
      ?auto_9464 - PLACE
      ?auto_9460 - HOIST
      ?auto_9463 - SURFACE
      ?auto_9461 - TRUCK
      ?auto_9465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9459 ?auto_9462 ) ( IS-CRATE ?auto_9457 ) ( not ( = ?auto_9457 ?auto_9458 ) ) ( not ( = ?auto_9464 ?auto_9462 ) ) ( HOIST-AT ?auto_9460 ?auto_9464 ) ( not ( = ?auto_9459 ?auto_9460 ) ) ( AVAILABLE ?auto_9460 ) ( SURFACE-AT ?auto_9457 ?auto_9464 ) ( ON ?auto_9457 ?auto_9463 ) ( CLEAR ?auto_9457 ) ( not ( = ?auto_9457 ?auto_9463 ) ) ( not ( = ?auto_9458 ?auto_9463 ) ) ( TRUCK-AT ?auto_9461 ?auto_9462 ) ( SURFACE-AT ?auto_9465 ?auto_9462 ) ( CLEAR ?auto_9465 ) ( LIFTING ?auto_9459 ?auto_9458 ) ( IS-CRATE ?auto_9458 ) ( not ( = ?auto_9457 ?auto_9465 ) ) ( not ( = ?auto_9458 ?auto_9465 ) ) ( not ( = ?auto_9463 ?auto_9465 ) ) )
    :subtasks
    ( ( !DROP ?auto_9459 ?auto_9458 ?auto_9465 ?auto_9462 )
      ( MAKE-ON ?auto_9457 ?auto_9458 )
      ( MAKE-ON-VERIFY ?auto_9457 ?auto_9458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9466 - SURFACE
      ?auto_9467 - SURFACE
    )
    :vars
    (
      ?auto_9468 - HOIST
      ?auto_9473 - PLACE
      ?auto_9471 - PLACE
      ?auto_9474 - HOIST
      ?auto_9470 - SURFACE
      ?auto_9469 - TRUCK
      ?auto_9472 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9468 ?auto_9473 ) ( IS-CRATE ?auto_9466 ) ( not ( = ?auto_9466 ?auto_9467 ) ) ( not ( = ?auto_9471 ?auto_9473 ) ) ( HOIST-AT ?auto_9474 ?auto_9471 ) ( not ( = ?auto_9468 ?auto_9474 ) ) ( AVAILABLE ?auto_9474 ) ( SURFACE-AT ?auto_9466 ?auto_9471 ) ( ON ?auto_9466 ?auto_9470 ) ( CLEAR ?auto_9466 ) ( not ( = ?auto_9466 ?auto_9470 ) ) ( not ( = ?auto_9467 ?auto_9470 ) ) ( TRUCK-AT ?auto_9469 ?auto_9473 ) ( SURFACE-AT ?auto_9472 ?auto_9473 ) ( CLEAR ?auto_9472 ) ( IS-CRATE ?auto_9467 ) ( not ( = ?auto_9466 ?auto_9472 ) ) ( not ( = ?auto_9467 ?auto_9472 ) ) ( not ( = ?auto_9470 ?auto_9472 ) ) ( AVAILABLE ?auto_9468 ) ( IN ?auto_9467 ?auto_9469 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9468 ?auto_9467 ?auto_9469 ?auto_9473 )
      ( MAKE-ON ?auto_9466 ?auto_9467 )
      ( MAKE-ON-VERIFY ?auto_9466 ?auto_9467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9475 - SURFACE
      ?auto_9476 - SURFACE
    )
    :vars
    (
      ?auto_9482 - HOIST
      ?auto_9481 - PLACE
      ?auto_9477 - PLACE
      ?auto_9478 - HOIST
      ?auto_9483 - SURFACE
      ?auto_9480 - SURFACE
      ?auto_9479 - TRUCK
      ?auto_9484 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9482 ?auto_9481 ) ( IS-CRATE ?auto_9475 ) ( not ( = ?auto_9475 ?auto_9476 ) ) ( not ( = ?auto_9477 ?auto_9481 ) ) ( HOIST-AT ?auto_9478 ?auto_9477 ) ( not ( = ?auto_9482 ?auto_9478 ) ) ( AVAILABLE ?auto_9478 ) ( SURFACE-AT ?auto_9475 ?auto_9477 ) ( ON ?auto_9475 ?auto_9483 ) ( CLEAR ?auto_9475 ) ( not ( = ?auto_9475 ?auto_9483 ) ) ( not ( = ?auto_9476 ?auto_9483 ) ) ( SURFACE-AT ?auto_9480 ?auto_9481 ) ( CLEAR ?auto_9480 ) ( IS-CRATE ?auto_9476 ) ( not ( = ?auto_9475 ?auto_9480 ) ) ( not ( = ?auto_9476 ?auto_9480 ) ) ( not ( = ?auto_9483 ?auto_9480 ) ) ( AVAILABLE ?auto_9482 ) ( IN ?auto_9476 ?auto_9479 ) ( TRUCK-AT ?auto_9479 ?auto_9484 ) ( not ( = ?auto_9484 ?auto_9481 ) ) ( not ( = ?auto_9477 ?auto_9484 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9479 ?auto_9484 ?auto_9481 )
      ( MAKE-ON ?auto_9475 ?auto_9476 )
      ( MAKE-ON-VERIFY ?auto_9475 ?auto_9476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9485 - SURFACE
      ?auto_9486 - SURFACE
    )
    :vars
    (
      ?auto_9488 - HOIST
      ?auto_9489 - PLACE
      ?auto_9492 - PLACE
      ?auto_9493 - HOIST
      ?auto_9494 - SURFACE
      ?auto_9490 - SURFACE
      ?auto_9487 - TRUCK
      ?auto_9491 - PLACE
      ?auto_9495 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9488 ?auto_9489 ) ( IS-CRATE ?auto_9485 ) ( not ( = ?auto_9485 ?auto_9486 ) ) ( not ( = ?auto_9492 ?auto_9489 ) ) ( HOIST-AT ?auto_9493 ?auto_9492 ) ( not ( = ?auto_9488 ?auto_9493 ) ) ( AVAILABLE ?auto_9493 ) ( SURFACE-AT ?auto_9485 ?auto_9492 ) ( ON ?auto_9485 ?auto_9494 ) ( CLEAR ?auto_9485 ) ( not ( = ?auto_9485 ?auto_9494 ) ) ( not ( = ?auto_9486 ?auto_9494 ) ) ( SURFACE-AT ?auto_9490 ?auto_9489 ) ( CLEAR ?auto_9490 ) ( IS-CRATE ?auto_9486 ) ( not ( = ?auto_9485 ?auto_9490 ) ) ( not ( = ?auto_9486 ?auto_9490 ) ) ( not ( = ?auto_9494 ?auto_9490 ) ) ( AVAILABLE ?auto_9488 ) ( TRUCK-AT ?auto_9487 ?auto_9491 ) ( not ( = ?auto_9491 ?auto_9489 ) ) ( not ( = ?auto_9492 ?auto_9491 ) ) ( HOIST-AT ?auto_9495 ?auto_9491 ) ( LIFTING ?auto_9495 ?auto_9486 ) ( not ( = ?auto_9488 ?auto_9495 ) ) ( not ( = ?auto_9493 ?auto_9495 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9495 ?auto_9486 ?auto_9487 ?auto_9491 )
      ( MAKE-ON ?auto_9485 ?auto_9486 )
      ( MAKE-ON-VERIFY ?auto_9485 ?auto_9486 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9496 - SURFACE
      ?auto_9497 - SURFACE
    )
    :vars
    (
      ?auto_9501 - HOIST
      ?auto_9502 - PLACE
      ?auto_9505 - PLACE
      ?auto_9500 - HOIST
      ?auto_9499 - SURFACE
      ?auto_9504 - SURFACE
      ?auto_9503 - TRUCK
      ?auto_9498 - PLACE
      ?auto_9506 - HOIST
      ?auto_9507 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9501 ?auto_9502 ) ( IS-CRATE ?auto_9496 ) ( not ( = ?auto_9496 ?auto_9497 ) ) ( not ( = ?auto_9505 ?auto_9502 ) ) ( HOIST-AT ?auto_9500 ?auto_9505 ) ( not ( = ?auto_9501 ?auto_9500 ) ) ( AVAILABLE ?auto_9500 ) ( SURFACE-AT ?auto_9496 ?auto_9505 ) ( ON ?auto_9496 ?auto_9499 ) ( CLEAR ?auto_9496 ) ( not ( = ?auto_9496 ?auto_9499 ) ) ( not ( = ?auto_9497 ?auto_9499 ) ) ( SURFACE-AT ?auto_9504 ?auto_9502 ) ( CLEAR ?auto_9504 ) ( IS-CRATE ?auto_9497 ) ( not ( = ?auto_9496 ?auto_9504 ) ) ( not ( = ?auto_9497 ?auto_9504 ) ) ( not ( = ?auto_9499 ?auto_9504 ) ) ( AVAILABLE ?auto_9501 ) ( TRUCK-AT ?auto_9503 ?auto_9498 ) ( not ( = ?auto_9498 ?auto_9502 ) ) ( not ( = ?auto_9505 ?auto_9498 ) ) ( HOIST-AT ?auto_9506 ?auto_9498 ) ( not ( = ?auto_9501 ?auto_9506 ) ) ( not ( = ?auto_9500 ?auto_9506 ) ) ( AVAILABLE ?auto_9506 ) ( SURFACE-AT ?auto_9497 ?auto_9498 ) ( ON ?auto_9497 ?auto_9507 ) ( CLEAR ?auto_9497 ) ( not ( = ?auto_9496 ?auto_9507 ) ) ( not ( = ?auto_9497 ?auto_9507 ) ) ( not ( = ?auto_9499 ?auto_9507 ) ) ( not ( = ?auto_9504 ?auto_9507 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9506 ?auto_9497 ?auto_9507 ?auto_9498 )
      ( MAKE-ON ?auto_9496 ?auto_9497 )
      ( MAKE-ON-VERIFY ?auto_9496 ?auto_9497 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9508 - SURFACE
      ?auto_9509 - SURFACE
    )
    :vars
    (
      ?auto_9517 - HOIST
      ?auto_9512 - PLACE
      ?auto_9514 - PLACE
      ?auto_9516 - HOIST
      ?auto_9515 - SURFACE
      ?auto_9513 - SURFACE
      ?auto_9510 - PLACE
      ?auto_9519 - HOIST
      ?auto_9518 - SURFACE
      ?auto_9511 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9517 ?auto_9512 ) ( IS-CRATE ?auto_9508 ) ( not ( = ?auto_9508 ?auto_9509 ) ) ( not ( = ?auto_9514 ?auto_9512 ) ) ( HOIST-AT ?auto_9516 ?auto_9514 ) ( not ( = ?auto_9517 ?auto_9516 ) ) ( AVAILABLE ?auto_9516 ) ( SURFACE-AT ?auto_9508 ?auto_9514 ) ( ON ?auto_9508 ?auto_9515 ) ( CLEAR ?auto_9508 ) ( not ( = ?auto_9508 ?auto_9515 ) ) ( not ( = ?auto_9509 ?auto_9515 ) ) ( SURFACE-AT ?auto_9513 ?auto_9512 ) ( CLEAR ?auto_9513 ) ( IS-CRATE ?auto_9509 ) ( not ( = ?auto_9508 ?auto_9513 ) ) ( not ( = ?auto_9509 ?auto_9513 ) ) ( not ( = ?auto_9515 ?auto_9513 ) ) ( AVAILABLE ?auto_9517 ) ( not ( = ?auto_9510 ?auto_9512 ) ) ( not ( = ?auto_9514 ?auto_9510 ) ) ( HOIST-AT ?auto_9519 ?auto_9510 ) ( not ( = ?auto_9517 ?auto_9519 ) ) ( not ( = ?auto_9516 ?auto_9519 ) ) ( AVAILABLE ?auto_9519 ) ( SURFACE-AT ?auto_9509 ?auto_9510 ) ( ON ?auto_9509 ?auto_9518 ) ( CLEAR ?auto_9509 ) ( not ( = ?auto_9508 ?auto_9518 ) ) ( not ( = ?auto_9509 ?auto_9518 ) ) ( not ( = ?auto_9515 ?auto_9518 ) ) ( not ( = ?auto_9513 ?auto_9518 ) ) ( TRUCK-AT ?auto_9511 ?auto_9512 ) )
    :subtasks
    ( ( !DRIVE ?auto_9511 ?auto_9512 ?auto_9510 )
      ( MAKE-ON ?auto_9508 ?auto_9509 )
      ( MAKE-ON-VERIFY ?auto_9508 ?auto_9509 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9522 - SURFACE
      ?auto_9523 - SURFACE
    )
    :vars
    (
      ?auto_9524 - HOIST
      ?auto_9525 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9524 ?auto_9525 ) ( SURFACE-AT ?auto_9523 ?auto_9525 ) ( CLEAR ?auto_9523 ) ( LIFTING ?auto_9524 ?auto_9522 ) ( IS-CRATE ?auto_9522 ) ( not ( = ?auto_9522 ?auto_9523 ) ) )
    :subtasks
    ( ( !DROP ?auto_9524 ?auto_9522 ?auto_9523 ?auto_9525 )
      ( MAKE-ON-VERIFY ?auto_9522 ?auto_9523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9526 - SURFACE
      ?auto_9527 - SURFACE
    )
    :vars
    (
      ?auto_9528 - HOIST
      ?auto_9529 - PLACE
      ?auto_9530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9528 ?auto_9529 ) ( SURFACE-AT ?auto_9527 ?auto_9529 ) ( CLEAR ?auto_9527 ) ( IS-CRATE ?auto_9526 ) ( not ( = ?auto_9526 ?auto_9527 ) ) ( TRUCK-AT ?auto_9530 ?auto_9529 ) ( AVAILABLE ?auto_9528 ) ( IN ?auto_9526 ?auto_9530 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9528 ?auto_9526 ?auto_9530 ?auto_9529 )
      ( MAKE-ON ?auto_9526 ?auto_9527 )
      ( MAKE-ON-VERIFY ?auto_9526 ?auto_9527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9531 - SURFACE
      ?auto_9532 - SURFACE
    )
    :vars
    (
      ?auto_9535 - HOIST
      ?auto_9533 - PLACE
      ?auto_9534 - TRUCK
      ?auto_9536 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9535 ?auto_9533 ) ( SURFACE-AT ?auto_9532 ?auto_9533 ) ( CLEAR ?auto_9532 ) ( IS-CRATE ?auto_9531 ) ( not ( = ?auto_9531 ?auto_9532 ) ) ( AVAILABLE ?auto_9535 ) ( IN ?auto_9531 ?auto_9534 ) ( TRUCK-AT ?auto_9534 ?auto_9536 ) ( not ( = ?auto_9536 ?auto_9533 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9534 ?auto_9536 ?auto_9533 )
      ( MAKE-ON ?auto_9531 ?auto_9532 )
      ( MAKE-ON-VERIFY ?auto_9531 ?auto_9532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9537 - SURFACE
      ?auto_9538 - SURFACE
    )
    :vars
    (
      ?auto_9540 - HOIST
      ?auto_9539 - PLACE
      ?auto_9541 - TRUCK
      ?auto_9542 - PLACE
      ?auto_9543 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9540 ?auto_9539 ) ( SURFACE-AT ?auto_9538 ?auto_9539 ) ( CLEAR ?auto_9538 ) ( IS-CRATE ?auto_9537 ) ( not ( = ?auto_9537 ?auto_9538 ) ) ( AVAILABLE ?auto_9540 ) ( TRUCK-AT ?auto_9541 ?auto_9542 ) ( not ( = ?auto_9542 ?auto_9539 ) ) ( HOIST-AT ?auto_9543 ?auto_9542 ) ( LIFTING ?auto_9543 ?auto_9537 ) ( not ( = ?auto_9540 ?auto_9543 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9543 ?auto_9537 ?auto_9541 ?auto_9542 )
      ( MAKE-ON ?auto_9537 ?auto_9538 )
      ( MAKE-ON-VERIFY ?auto_9537 ?auto_9538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9544 - SURFACE
      ?auto_9545 - SURFACE
    )
    :vars
    (
      ?auto_9546 - HOIST
      ?auto_9549 - PLACE
      ?auto_9548 - TRUCK
      ?auto_9550 - PLACE
      ?auto_9547 - HOIST
      ?auto_9551 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9546 ?auto_9549 ) ( SURFACE-AT ?auto_9545 ?auto_9549 ) ( CLEAR ?auto_9545 ) ( IS-CRATE ?auto_9544 ) ( not ( = ?auto_9544 ?auto_9545 ) ) ( AVAILABLE ?auto_9546 ) ( TRUCK-AT ?auto_9548 ?auto_9550 ) ( not ( = ?auto_9550 ?auto_9549 ) ) ( HOIST-AT ?auto_9547 ?auto_9550 ) ( not ( = ?auto_9546 ?auto_9547 ) ) ( AVAILABLE ?auto_9547 ) ( SURFACE-AT ?auto_9544 ?auto_9550 ) ( ON ?auto_9544 ?auto_9551 ) ( CLEAR ?auto_9544 ) ( not ( = ?auto_9544 ?auto_9551 ) ) ( not ( = ?auto_9545 ?auto_9551 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9547 ?auto_9544 ?auto_9551 ?auto_9550 )
      ( MAKE-ON ?auto_9544 ?auto_9545 )
      ( MAKE-ON-VERIFY ?auto_9544 ?auto_9545 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9552 - SURFACE
      ?auto_9553 - SURFACE
    )
    :vars
    (
      ?auto_9554 - HOIST
      ?auto_9559 - PLACE
      ?auto_9558 - PLACE
      ?auto_9556 - HOIST
      ?auto_9557 - SURFACE
      ?auto_9555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9554 ?auto_9559 ) ( SURFACE-AT ?auto_9553 ?auto_9559 ) ( CLEAR ?auto_9553 ) ( IS-CRATE ?auto_9552 ) ( not ( = ?auto_9552 ?auto_9553 ) ) ( AVAILABLE ?auto_9554 ) ( not ( = ?auto_9558 ?auto_9559 ) ) ( HOIST-AT ?auto_9556 ?auto_9558 ) ( not ( = ?auto_9554 ?auto_9556 ) ) ( AVAILABLE ?auto_9556 ) ( SURFACE-AT ?auto_9552 ?auto_9558 ) ( ON ?auto_9552 ?auto_9557 ) ( CLEAR ?auto_9552 ) ( not ( = ?auto_9552 ?auto_9557 ) ) ( not ( = ?auto_9553 ?auto_9557 ) ) ( TRUCK-AT ?auto_9555 ?auto_9559 ) )
    :subtasks
    ( ( !DRIVE ?auto_9555 ?auto_9559 ?auto_9558 )
      ( MAKE-ON ?auto_9552 ?auto_9553 )
      ( MAKE-ON-VERIFY ?auto_9552 ?auto_9553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9560 - SURFACE
      ?auto_9561 - SURFACE
    )
    :vars
    (
      ?auto_9565 - HOIST
      ?auto_9567 - PLACE
      ?auto_9566 - PLACE
      ?auto_9563 - HOIST
      ?auto_9564 - SURFACE
      ?auto_9562 - TRUCK
      ?auto_9568 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9565 ?auto_9567 ) ( IS-CRATE ?auto_9560 ) ( not ( = ?auto_9560 ?auto_9561 ) ) ( not ( = ?auto_9566 ?auto_9567 ) ) ( HOIST-AT ?auto_9563 ?auto_9566 ) ( not ( = ?auto_9565 ?auto_9563 ) ) ( AVAILABLE ?auto_9563 ) ( SURFACE-AT ?auto_9560 ?auto_9566 ) ( ON ?auto_9560 ?auto_9564 ) ( CLEAR ?auto_9560 ) ( not ( = ?auto_9560 ?auto_9564 ) ) ( not ( = ?auto_9561 ?auto_9564 ) ) ( TRUCK-AT ?auto_9562 ?auto_9567 ) ( SURFACE-AT ?auto_9568 ?auto_9567 ) ( CLEAR ?auto_9568 ) ( LIFTING ?auto_9565 ?auto_9561 ) ( IS-CRATE ?auto_9561 ) ( not ( = ?auto_9560 ?auto_9568 ) ) ( not ( = ?auto_9561 ?auto_9568 ) ) ( not ( = ?auto_9564 ?auto_9568 ) ) )
    :subtasks
    ( ( !DROP ?auto_9565 ?auto_9561 ?auto_9568 ?auto_9567 )
      ( MAKE-ON ?auto_9560 ?auto_9561 )
      ( MAKE-ON-VERIFY ?auto_9560 ?auto_9561 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9569 - SURFACE
      ?auto_9570 - SURFACE
    )
    :vars
    (
      ?auto_9576 - HOIST
      ?auto_9574 - PLACE
      ?auto_9575 - PLACE
      ?auto_9577 - HOIST
      ?auto_9571 - SURFACE
      ?auto_9572 - TRUCK
      ?auto_9573 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9576 ?auto_9574 ) ( IS-CRATE ?auto_9569 ) ( not ( = ?auto_9569 ?auto_9570 ) ) ( not ( = ?auto_9575 ?auto_9574 ) ) ( HOIST-AT ?auto_9577 ?auto_9575 ) ( not ( = ?auto_9576 ?auto_9577 ) ) ( AVAILABLE ?auto_9577 ) ( SURFACE-AT ?auto_9569 ?auto_9575 ) ( ON ?auto_9569 ?auto_9571 ) ( CLEAR ?auto_9569 ) ( not ( = ?auto_9569 ?auto_9571 ) ) ( not ( = ?auto_9570 ?auto_9571 ) ) ( TRUCK-AT ?auto_9572 ?auto_9574 ) ( SURFACE-AT ?auto_9573 ?auto_9574 ) ( CLEAR ?auto_9573 ) ( IS-CRATE ?auto_9570 ) ( not ( = ?auto_9569 ?auto_9573 ) ) ( not ( = ?auto_9570 ?auto_9573 ) ) ( not ( = ?auto_9571 ?auto_9573 ) ) ( AVAILABLE ?auto_9576 ) ( IN ?auto_9570 ?auto_9572 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9576 ?auto_9570 ?auto_9572 ?auto_9574 )
      ( MAKE-ON ?auto_9569 ?auto_9570 )
      ( MAKE-ON-VERIFY ?auto_9569 ?auto_9570 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9578 - SURFACE
      ?auto_9579 - SURFACE
    )
    :vars
    (
      ?auto_9583 - HOIST
      ?auto_9580 - PLACE
      ?auto_9586 - PLACE
      ?auto_9581 - HOIST
      ?auto_9584 - SURFACE
      ?auto_9582 - SURFACE
      ?auto_9585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9583 ?auto_9580 ) ( IS-CRATE ?auto_9578 ) ( not ( = ?auto_9578 ?auto_9579 ) ) ( not ( = ?auto_9586 ?auto_9580 ) ) ( HOIST-AT ?auto_9581 ?auto_9586 ) ( not ( = ?auto_9583 ?auto_9581 ) ) ( AVAILABLE ?auto_9581 ) ( SURFACE-AT ?auto_9578 ?auto_9586 ) ( ON ?auto_9578 ?auto_9584 ) ( CLEAR ?auto_9578 ) ( not ( = ?auto_9578 ?auto_9584 ) ) ( not ( = ?auto_9579 ?auto_9584 ) ) ( SURFACE-AT ?auto_9582 ?auto_9580 ) ( CLEAR ?auto_9582 ) ( IS-CRATE ?auto_9579 ) ( not ( = ?auto_9578 ?auto_9582 ) ) ( not ( = ?auto_9579 ?auto_9582 ) ) ( not ( = ?auto_9584 ?auto_9582 ) ) ( AVAILABLE ?auto_9583 ) ( IN ?auto_9579 ?auto_9585 ) ( TRUCK-AT ?auto_9585 ?auto_9586 ) )
    :subtasks
    ( ( !DRIVE ?auto_9585 ?auto_9586 ?auto_9580 )
      ( MAKE-ON ?auto_9578 ?auto_9579 )
      ( MAKE-ON-VERIFY ?auto_9578 ?auto_9579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9587 - SURFACE
      ?auto_9588 - SURFACE
    )
    :vars
    (
      ?auto_9591 - HOIST
      ?auto_9589 - PLACE
      ?auto_9594 - PLACE
      ?auto_9593 - HOIST
      ?auto_9592 - SURFACE
      ?auto_9595 - SURFACE
      ?auto_9590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9591 ?auto_9589 ) ( IS-CRATE ?auto_9587 ) ( not ( = ?auto_9587 ?auto_9588 ) ) ( not ( = ?auto_9594 ?auto_9589 ) ) ( HOIST-AT ?auto_9593 ?auto_9594 ) ( not ( = ?auto_9591 ?auto_9593 ) ) ( SURFACE-AT ?auto_9587 ?auto_9594 ) ( ON ?auto_9587 ?auto_9592 ) ( CLEAR ?auto_9587 ) ( not ( = ?auto_9587 ?auto_9592 ) ) ( not ( = ?auto_9588 ?auto_9592 ) ) ( SURFACE-AT ?auto_9595 ?auto_9589 ) ( CLEAR ?auto_9595 ) ( IS-CRATE ?auto_9588 ) ( not ( = ?auto_9587 ?auto_9595 ) ) ( not ( = ?auto_9588 ?auto_9595 ) ) ( not ( = ?auto_9592 ?auto_9595 ) ) ( AVAILABLE ?auto_9591 ) ( TRUCK-AT ?auto_9590 ?auto_9594 ) ( LIFTING ?auto_9593 ?auto_9588 ) )
    :subtasks
    ( ( !LOAD ?auto_9593 ?auto_9588 ?auto_9590 ?auto_9594 )
      ( MAKE-ON ?auto_9587 ?auto_9588 )
      ( MAKE-ON-VERIFY ?auto_9587 ?auto_9588 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9596 - SURFACE
      ?auto_9597 - SURFACE
    )
    :vars
    (
      ?auto_9599 - HOIST
      ?auto_9601 - PLACE
      ?auto_9602 - PLACE
      ?auto_9598 - HOIST
      ?auto_9603 - SURFACE
      ?auto_9604 - SURFACE
      ?auto_9600 - TRUCK
      ?auto_9605 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9599 ?auto_9601 ) ( IS-CRATE ?auto_9596 ) ( not ( = ?auto_9596 ?auto_9597 ) ) ( not ( = ?auto_9602 ?auto_9601 ) ) ( HOIST-AT ?auto_9598 ?auto_9602 ) ( not ( = ?auto_9599 ?auto_9598 ) ) ( SURFACE-AT ?auto_9596 ?auto_9602 ) ( ON ?auto_9596 ?auto_9603 ) ( CLEAR ?auto_9596 ) ( not ( = ?auto_9596 ?auto_9603 ) ) ( not ( = ?auto_9597 ?auto_9603 ) ) ( SURFACE-AT ?auto_9604 ?auto_9601 ) ( CLEAR ?auto_9604 ) ( IS-CRATE ?auto_9597 ) ( not ( = ?auto_9596 ?auto_9604 ) ) ( not ( = ?auto_9597 ?auto_9604 ) ) ( not ( = ?auto_9603 ?auto_9604 ) ) ( AVAILABLE ?auto_9599 ) ( TRUCK-AT ?auto_9600 ?auto_9602 ) ( AVAILABLE ?auto_9598 ) ( SURFACE-AT ?auto_9597 ?auto_9602 ) ( ON ?auto_9597 ?auto_9605 ) ( CLEAR ?auto_9597 ) ( not ( = ?auto_9596 ?auto_9605 ) ) ( not ( = ?auto_9597 ?auto_9605 ) ) ( not ( = ?auto_9603 ?auto_9605 ) ) ( not ( = ?auto_9604 ?auto_9605 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9598 ?auto_9597 ?auto_9605 ?auto_9602 )
      ( MAKE-ON ?auto_9596 ?auto_9597 )
      ( MAKE-ON-VERIFY ?auto_9596 ?auto_9597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9606 - SURFACE
      ?auto_9607 - SURFACE
    )
    :vars
    (
      ?auto_9612 - HOIST
      ?auto_9615 - PLACE
      ?auto_9614 - PLACE
      ?auto_9613 - HOIST
      ?auto_9610 - SURFACE
      ?auto_9611 - SURFACE
      ?auto_9609 - SURFACE
      ?auto_9608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9612 ?auto_9615 ) ( IS-CRATE ?auto_9606 ) ( not ( = ?auto_9606 ?auto_9607 ) ) ( not ( = ?auto_9614 ?auto_9615 ) ) ( HOIST-AT ?auto_9613 ?auto_9614 ) ( not ( = ?auto_9612 ?auto_9613 ) ) ( SURFACE-AT ?auto_9606 ?auto_9614 ) ( ON ?auto_9606 ?auto_9610 ) ( CLEAR ?auto_9606 ) ( not ( = ?auto_9606 ?auto_9610 ) ) ( not ( = ?auto_9607 ?auto_9610 ) ) ( SURFACE-AT ?auto_9611 ?auto_9615 ) ( CLEAR ?auto_9611 ) ( IS-CRATE ?auto_9607 ) ( not ( = ?auto_9606 ?auto_9611 ) ) ( not ( = ?auto_9607 ?auto_9611 ) ) ( not ( = ?auto_9610 ?auto_9611 ) ) ( AVAILABLE ?auto_9612 ) ( AVAILABLE ?auto_9613 ) ( SURFACE-AT ?auto_9607 ?auto_9614 ) ( ON ?auto_9607 ?auto_9609 ) ( CLEAR ?auto_9607 ) ( not ( = ?auto_9606 ?auto_9609 ) ) ( not ( = ?auto_9607 ?auto_9609 ) ) ( not ( = ?auto_9610 ?auto_9609 ) ) ( not ( = ?auto_9611 ?auto_9609 ) ) ( TRUCK-AT ?auto_9608 ?auto_9615 ) )
    :subtasks
    ( ( !DRIVE ?auto_9608 ?auto_9615 ?auto_9614 )
      ( MAKE-ON ?auto_9606 ?auto_9607 )
      ( MAKE-ON-VERIFY ?auto_9606 ?auto_9607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9616 - SURFACE
      ?auto_9617 - SURFACE
    )
    :vars
    (
      ?auto_9625 - HOIST
      ?auto_9620 - PLACE
      ?auto_9623 - PLACE
      ?auto_9619 - HOIST
      ?auto_9622 - SURFACE
      ?auto_9621 - SURFACE
      ?auto_9618 - SURFACE
      ?auto_9624 - TRUCK
      ?auto_9626 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9625 ?auto_9620 ) ( IS-CRATE ?auto_9616 ) ( not ( = ?auto_9616 ?auto_9617 ) ) ( not ( = ?auto_9623 ?auto_9620 ) ) ( HOIST-AT ?auto_9619 ?auto_9623 ) ( not ( = ?auto_9625 ?auto_9619 ) ) ( SURFACE-AT ?auto_9616 ?auto_9623 ) ( ON ?auto_9616 ?auto_9622 ) ( CLEAR ?auto_9616 ) ( not ( = ?auto_9616 ?auto_9622 ) ) ( not ( = ?auto_9617 ?auto_9622 ) ) ( IS-CRATE ?auto_9617 ) ( not ( = ?auto_9616 ?auto_9621 ) ) ( not ( = ?auto_9617 ?auto_9621 ) ) ( not ( = ?auto_9622 ?auto_9621 ) ) ( AVAILABLE ?auto_9619 ) ( SURFACE-AT ?auto_9617 ?auto_9623 ) ( ON ?auto_9617 ?auto_9618 ) ( CLEAR ?auto_9617 ) ( not ( = ?auto_9616 ?auto_9618 ) ) ( not ( = ?auto_9617 ?auto_9618 ) ) ( not ( = ?auto_9622 ?auto_9618 ) ) ( not ( = ?auto_9621 ?auto_9618 ) ) ( TRUCK-AT ?auto_9624 ?auto_9620 ) ( SURFACE-AT ?auto_9626 ?auto_9620 ) ( CLEAR ?auto_9626 ) ( LIFTING ?auto_9625 ?auto_9621 ) ( IS-CRATE ?auto_9621 ) ( not ( = ?auto_9616 ?auto_9626 ) ) ( not ( = ?auto_9617 ?auto_9626 ) ) ( not ( = ?auto_9622 ?auto_9626 ) ) ( not ( = ?auto_9621 ?auto_9626 ) ) ( not ( = ?auto_9618 ?auto_9626 ) ) )
    :subtasks
    ( ( !DROP ?auto_9625 ?auto_9621 ?auto_9626 ?auto_9620 )
      ( MAKE-ON ?auto_9616 ?auto_9617 )
      ( MAKE-ON-VERIFY ?auto_9616 ?auto_9617 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9627 - SURFACE
      ?auto_9628 - SURFACE
    )
    :vars
    (
      ?auto_9636 - HOIST
      ?auto_9633 - PLACE
      ?auto_9630 - PLACE
      ?auto_9632 - HOIST
      ?auto_9631 - SURFACE
      ?auto_9635 - SURFACE
      ?auto_9634 - SURFACE
      ?auto_9629 - TRUCK
      ?auto_9637 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9636 ?auto_9633 ) ( IS-CRATE ?auto_9627 ) ( not ( = ?auto_9627 ?auto_9628 ) ) ( not ( = ?auto_9630 ?auto_9633 ) ) ( HOIST-AT ?auto_9632 ?auto_9630 ) ( not ( = ?auto_9636 ?auto_9632 ) ) ( SURFACE-AT ?auto_9627 ?auto_9630 ) ( ON ?auto_9627 ?auto_9631 ) ( CLEAR ?auto_9627 ) ( not ( = ?auto_9627 ?auto_9631 ) ) ( not ( = ?auto_9628 ?auto_9631 ) ) ( IS-CRATE ?auto_9628 ) ( not ( = ?auto_9627 ?auto_9635 ) ) ( not ( = ?auto_9628 ?auto_9635 ) ) ( not ( = ?auto_9631 ?auto_9635 ) ) ( AVAILABLE ?auto_9632 ) ( SURFACE-AT ?auto_9628 ?auto_9630 ) ( ON ?auto_9628 ?auto_9634 ) ( CLEAR ?auto_9628 ) ( not ( = ?auto_9627 ?auto_9634 ) ) ( not ( = ?auto_9628 ?auto_9634 ) ) ( not ( = ?auto_9631 ?auto_9634 ) ) ( not ( = ?auto_9635 ?auto_9634 ) ) ( TRUCK-AT ?auto_9629 ?auto_9633 ) ( SURFACE-AT ?auto_9637 ?auto_9633 ) ( CLEAR ?auto_9637 ) ( IS-CRATE ?auto_9635 ) ( not ( = ?auto_9627 ?auto_9637 ) ) ( not ( = ?auto_9628 ?auto_9637 ) ) ( not ( = ?auto_9631 ?auto_9637 ) ) ( not ( = ?auto_9635 ?auto_9637 ) ) ( not ( = ?auto_9634 ?auto_9637 ) ) ( AVAILABLE ?auto_9636 ) ( IN ?auto_9635 ?auto_9629 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9636 ?auto_9635 ?auto_9629 ?auto_9633 )
      ( MAKE-ON ?auto_9627 ?auto_9628 )
      ( MAKE-ON-VERIFY ?auto_9627 ?auto_9628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9638 - SURFACE
      ?auto_9639 - SURFACE
    )
    :vars
    (
      ?auto_9648 - HOIST
      ?auto_9644 - PLACE
      ?auto_9640 - PLACE
      ?auto_9645 - HOIST
      ?auto_9642 - SURFACE
      ?auto_9647 - SURFACE
      ?auto_9646 - SURFACE
      ?auto_9641 - SURFACE
      ?auto_9643 - TRUCK
      ?auto_9649 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9648 ?auto_9644 ) ( IS-CRATE ?auto_9638 ) ( not ( = ?auto_9638 ?auto_9639 ) ) ( not ( = ?auto_9640 ?auto_9644 ) ) ( HOIST-AT ?auto_9645 ?auto_9640 ) ( not ( = ?auto_9648 ?auto_9645 ) ) ( SURFACE-AT ?auto_9638 ?auto_9640 ) ( ON ?auto_9638 ?auto_9642 ) ( CLEAR ?auto_9638 ) ( not ( = ?auto_9638 ?auto_9642 ) ) ( not ( = ?auto_9639 ?auto_9642 ) ) ( IS-CRATE ?auto_9639 ) ( not ( = ?auto_9638 ?auto_9647 ) ) ( not ( = ?auto_9639 ?auto_9647 ) ) ( not ( = ?auto_9642 ?auto_9647 ) ) ( AVAILABLE ?auto_9645 ) ( SURFACE-AT ?auto_9639 ?auto_9640 ) ( ON ?auto_9639 ?auto_9646 ) ( CLEAR ?auto_9639 ) ( not ( = ?auto_9638 ?auto_9646 ) ) ( not ( = ?auto_9639 ?auto_9646 ) ) ( not ( = ?auto_9642 ?auto_9646 ) ) ( not ( = ?auto_9647 ?auto_9646 ) ) ( SURFACE-AT ?auto_9641 ?auto_9644 ) ( CLEAR ?auto_9641 ) ( IS-CRATE ?auto_9647 ) ( not ( = ?auto_9638 ?auto_9641 ) ) ( not ( = ?auto_9639 ?auto_9641 ) ) ( not ( = ?auto_9642 ?auto_9641 ) ) ( not ( = ?auto_9647 ?auto_9641 ) ) ( not ( = ?auto_9646 ?auto_9641 ) ) ( AVAILABLE ?auto_9648 ) ( IN ?auto_9647 ?auto_9643 ) ( TRUCK-AT ?auto_9643 ?auto_9649 ) ( not ( = ?auto_9649 ?auto_9644 ) ) ( not ( = ?auto_9640 ?auto_9649 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9643 ?auto_9649 ?auto_9644 )
      ( MAKE-ON ?auto_9638 ?auto_9639 )
      ( MAKE-ON-VERIFY ?auto_9638 ?auto_9639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9650 - SURFACE
      ?auto_9651 - SURFACE
    )
    :vars
    (
      ?auto_9658 - HOIST
      ?auto_9657 - PLACE
      ?auto_9655 - PLACE
      ?auto_9660 - HOIST
      ?auto_9652 - SURFACE
      ?auto_9661 - SURFACE
      ?auto_9656 - SURFACE
      ?auto_9659 - SURFACE
      ?auto_9654 - TRUCK
      ?auto_9653 - PLACE
      ?auto_9662 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9658 ?auto_9657 ) ( IS-CRATE ?auto_9650 ) ( not ( = ?auto_9650 ?auto_9651 ) ) ( not ( = ?auto_9655 ?auto_9657 ) ) ( HOIST-AT ?auto_9660 ?auto_9655 ) ( not ( = ?auto_9658 ?auto_9660 ) ) ( SURFACE-AT ?auto_9650 ?auto_9655 ) ( ON ?auto_9650 ?auto_9652 ) ( CLEAR ?auto_9650 ) ( not ( = ?auto_9650 ?auto_9652 ) ) ( not ( = ?auto_9651 ?auto_9652 ) ) ( IS-CRATE ?auto_9651 ) ( not ( = ?auto_9650 ?auto_9661 ) ) ( not ( = ?auto_9651 ?auto_9661 ) ) ( not ( = ?auto_9652 ?auto_9661 ) ) ( AVAILABLE ?auto_9660 ) ( SURFACE-AT ?auto_9651 ?auto_9655 ) ( ON ?auto_9651 ?auto_9656 ) ( CLEAR ?auto_9651 ) ( not ( = ?auto_9650 ?auto_9656 ) ) ( not ( = ?auto_9651 ?auto_9656 ) ) ( not ( = ?auto_9652 ?auto_9656 ) ) ( not ( = ?auto_9661 ?auto_9656 ) ) ( SURFACE-AT ?auto_9659 ?auto_9657 ) ( CLEAR ?auto_9659 ) ( IS-CRATE ?auto_9661 ) ( not ( = ?auto_9650 ?auto_9659 ) ) ( not ( = ?auto_9651 ?auto_9659 ) ) ( not ( = ?auto_9652 ?auto_9659 ) ) ( not ( = ?auto_9661 ?auto_9659 ) ) ( not ( = ?auto_9656 ?auto_9659 ) ) ( AVAILABLE ?auto_9658 ) ( TRUCK-AT ?auto_9654 ?auto_9653 ) ( not ( = ?auto_9653 ?auto_9657 ) ) ( not ( = ?auto_9655 ?auto_9653 ) ) ( HOIST-AT ?auto_9662 ?auto_9653 ) ( LIFTING ?auto_9662 ?auto_9661 ) ( not ( = ?auto_9658 ?auto_9662 ) ) ( not ( = ?auto_9660 ?auto_9662 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9662 ?auto_9661 ?auto_9654 ?auto_9653 )
      ( MAKE-ON ?auto_9650 ?auto_9651 )
      ( MAKE-ON-VERIFY ?auto_9650 ?auto_9651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9663 - SURFACE
      ?auto_9664 - SURFACE
    )
    :vars
    (
      ?auto_9665 - HOIST
      ?auto_9672 - PLACE
      ?auto_9675 - PLACE
      ?auto_9669 - HOIST
      ?auto_9668 - SURFACE
      ?auto_9666 - SURFACE
      ?auto_9670 - SURFACE
      ?auto_9674 - SURFACE
      ?auto_9667 - TRUCK
      ?auto_9671 - PLACE
      ?auto_9673 - HOIST
      ?auto_9676 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9665 ?auto_9672 ) ( IS-CRATE ?auto_9663 ) ( not ( = ?auto_9663 ?auto_9664 ) ) ( not ( = ?auto_9675 ?auto_9672 ) ) ( HOIST-AT ?auto_9669 ?auto_9675 ) ( not ( = ?auto_9665 ?auto_9669 ) ) ( SURFACE-AT ?auto_9663 ?auto_9675 ) ( ON ?auto_9663 ?auto_9668 ) ( CLEAR ?auto_9663 ) ( not ( = ?auto_9663 ?auto_9668 ) ) ( not ( = ?auto_9664 ?auto_9668 ) ) ( IS-CRATE ?auto_9664 ) ( not ( = ?auto_9663 ?auto_9666 ) ) ( not ( = ?auto_9664 ?auto_9666 ) ) ( not ( = ?auto_9668 ?auto_9666 ) ) ( AVAILABLE ?auto_9669 ) ( SURFACE-AT ?auto_9664 ?auto_9675 ) ( ON ?auto_9664 ?auto_9670 ) ( CLEAR ?auto_9664 ) ( not ( = ?auto_9663 ?auto_9670 ) ) ( not ( = ?auto_9664 ?auto_9670 ) ) ( not ( = ?auto_9668 ?auto_9670 ) ) ( not ( = ?auto_9666 ?auto_9670 ) ) ( SURFACE-AT ?auto_9674 ?auto_9672 ) ( CLEAR ?auto_9674 ) ( IS-CRATE ?auto_9666 ) ( not ( = ?auto_9663 ?auto_9674 ) ) ( not ( = ?auto_9664 ?auto_9674 ) ) ( not ( = ?auto_9668 ?auto_9674 ) ) ( not ( = ?auto_9666 ?auto_9674 ) ) ( not ( = ?auto_9670 ?auto_9674 ) ) ( AVAILABLE ?auto_9665 ) ( TRUCK-AT ?auto_9667 ?auto_9671 ) ( not ( = ?auto_9671 ?auto_9672 ) ) ( not ( = ?auto_9675 ?auto_9671 ) ) ( HOIST-AT ?auto_9673 ?auto_9671 ) ( not ( = ?auto_9665 ?auto_9673 ) ) ( not ( = ?auto_9669 ?auto_9673 ) ) ( AVAILABLE ?auto_9673 ) ( SURFACE-AT ?auto_9666 ?auto_9671 ) ( ON ?auto_9666 ?auto_9676 ) ( CLEAR ?auto_9666 ) ( not ( = ?auto_9663 ?auto_9676 ) ) ( not ( = ?auto_9664 ?auto_9676 ) ) ( not ( = ?auto_9668 ?auto_9676 ) ) ( not ( = ?auto_9666 ?auto_9676 ) ) ( not ( = ?auto_9670 ?auto_9676 ) ) ( not ( = ?auto_9674 ?auto_9676 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9673 ?auto_9666 ?auto_9676 ?auto_9671 )
      ( MAKE-ON ?auto_9663 ?auto_9664 )
      ( MAKE-ON-VERIFY ?auto_9663 ?auto_9664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9677 - SURFACE
      ?auto_9678 - SURFACE
    )
    :vars
    (
      ?auto_9686 - HOIST
      ?auto_9679 - PLACE
      ?auto_9689 - PLACE
      ?auto_9685 - HOIST
      ?auto_9680 - SURFACE
      ?auto_9690 - SURFACE
      ?auto_9684 - SURFACE
      ?auto_9681 - SURFACE
      ?auto_9688 - PLACE
      ?auto_9683 - HOIST
      ?auto_9687 - SURFACE
      ?auto_9682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9686 ?auto_9679 ) ( IS-CRATE ?auto_9677 ) ( not ( = ?auto_9677 ?auto_9678 ) ) ( not ( = ?auto_9689 ?auto_9679 ) ) ( HOIST-AT ?auto_9685 ?auto_9689 ) ( not ( = ?auto_9686 ?auto_9685 ) ) ( SURFACE-AT ?auto_9677 ?auto_9689 ) ( ON ?auto_9677 ?auto_9680 ) ( CLEAR ?auto_9677 ) ( not ( = ?auto_9677 ?auto_9680 ) ) ( not ( = ?auto_9678 ?auto_9680 ) ) ( IS-CRATE ?auto_9678 ) ( not ( = ?auto_9677 ?auto_9690 ) ) ( not ( = ?auto_9678 ?auto_9690 ) ) ( not ( = ?auto_9680 ?auto_9690 ) ) ( AVAILABLE ?auto_9685 ) ( SURFACE-AT ?auto_9678 ?auto_9689 ) ( ON ?auto_9678 ?auto_9684 ) ( CLEAR ?auto_9678 ) ( not ( = ?auto_9677 ?auto_9684 ) ) ( not ( = ?auto_9678 ?auto_9684 ) ) ( not ( = ?auto_9680 ?auto_9684 ) ) ( not ( = ?auto_9690 ?auto_9684 ) ) ( SURFACE-AT ?auto_9681 ?auto_9679 ) ( CLEAR ?auto_9681 ) ( IS-CRATE ?auto_9690 ) ( not ( = ?auto_9677 ?auto_9681 ) ) ( not ( = ?auto_9678 ?auto_9681 ) ) ( not ( = ?auto_9680 ?auto_9681 ) ) ( not ( = ?auto_9690 ?auto_9681 ) ) ( not ( = ?auto_9684 ?auto_9681 ) ) ( AVAILABLE ?auto_9686 ) ( not ( = ?auto_9688 ?auto_9679 ) ) ( not ( = ?auto_9689 ?auto_9688 ) ) ( HOIST-AT ?auto_9683 ?auto_9688 ) ( not ( = ?auto_9686 ?auto_9683 ) ) ( not ( = ?auto_9685 ?auto_9683 ) ) ( AVAILABLE ?auto_9683 ) ( SURFACE-AT ?auto_9690 ?auto_9688 ) ( ON ?auto_9690 ?auto_9687 ) ( CLEAR ?auto_9690 ) ( not ( = ?auto_9677 ?auto_9687 ) ) ( not ( = ?auto_9678 ?auto_9687 ) ) ( not ( = ?auto_9680 ?auto_9687 ) ) ( not ( = ?auto_9690 ?auto_9687 ) ) ( not ( = ?auto_9684 ?auto_9687 ) ) ( not ( = ?auto_9681 ?auto_9687 ) ) ( TRUCK-AT ?auto_9682 ?auto_9679 ) )
    :subtasks
    ( ( !DRIVE ?auto_9682 ?auto_9679 ?auto_9688 )
      ( MAKE-ON ?auto_9677 ?auto_9678 )
      ( MAKE-ON-VERIFY ?auto_9677 ?auto_9678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9693 - SURFACE
      ?auto_9694 - SURFACE
    )
    :vars
    (
      ?auto_9695 - HOIST
      ?auto_9696 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9695 ?auto_9696 ) ( SURFACE-AT ?auto_9694 ?auto_9696 ) ( CLEAR ?auto_9694 ) ( LIFTING ?auto_9695 ?auto_9693 ) ( IS-CRATE ?auto_9693 ) ( not ( = ?auto_9693 ?auto_9694 ) ) )
    :subtasks
    ( ( !DROP ?auto_9695 ?auto_9693 ?auto_9694 ?auto_9696 )
      ( MAKE-ON-VERIFY ?auto_9693 ?auto_9694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9697 - SURFACE
      ?auto_9698 - SURFACE
    )
    :vars
    (
      ?auto_9699 - HOIST
      ?auto_9700 - PLACE
      ?auto_9701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9699 ?auto_9700 ) ( SURFACE-AT ?auto_9698 ?auto_9700 ) ( CLEAR ?auto_9698 ) ( IS-CRATE ?auto_9697 ) ( not ( = ?auto_9697 ?auto_9698 ) ) ( TRUCK-AT ?auto_9701 ?auto_9700 ) ( AVAILABLE ?auto_9699 ) ( IN ?auto_9697 ?auto_9701 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9699 ?auto_9697 ?auto_9701 ?auto_9700 )
      ( MAKE-ON ?auto_9697 ?auto_9698 )
      ( MAKE-ON-VERIFY ?auto_9697 ?auto_9698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9702 - SURFACE
      ?auto_9703 - SURFACE
    )
    :vars
    (
      ?auto_9704 - HOIST
      ?auto_9706 - PLACE
      ?auto_9705 - TRUCK
      ?auto_9707 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9704 ?auto_9706 ) ( SURFACE-AT ?auto_9703 ?auto_9706 ) ( CLEAR ?auto_9703 ) ( IS-CRATE ?auto_9702 ) ( not ( = ?auto_9702 ?auto_9703 ) ) ( AVAILABLE ?auto_9704 ) ( IN ?auto_9702 ?auto_9705 ) ( TRUCK-AT ?auto_9705 ?auto_9707 ) ( not ( = ?auto_9707 ?auto_9706 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9705 ?auto_9707 ?auto_9706 )
      ( MAKE-ON ?auto_9702 ?auto_9703 )
      ( MAKE-ON-VERIFY ?auto_9702 ?auto_9703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9708 - SURFACE
      ?auto_9709 - SURFACE
    )
    :vars
    (
      ?auto_9711 - HOIST
      ?auto_9710 - PLACE
      ?auto_9713 - TRUCK
      ?auto_9712 - PLACE
      ?auto_9714 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9711 ?auto_9710 ) ( SURFACE-AT ?auto_9709 ?auto_9710 ) ( CLEAR ?auto_9709 ) ( IS-CRATE ?auto_9708 ) ( not ( = ?auto_9708 ?auto_9709 ) ) ( AVAILABLE ?auto_9711 ) ( TRUCK-AT ?auto_9713 ?auto_9712 ) ( not ( = ?auto_9712 ?auto_9710 ) ) ( HOIST-AT ?auto_9714 ?auto_9712 ) ( LIFTING ?auto_9714 ?auto_9708 ) ( not ( = ?auto_9711 ?auto_9714 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9714 ?auto_9708 ?auto_9713 ?auto_9712 )
      ( MAKE-ON ?auto_9708 ?auto_9709 )
      ( MAKE-ON-VERIFY ?auto_9708 ?auto_9709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9715 - SURFACE
      ?auto_9716 - SURFACE
    )
    :vars
    (
      ?auto_9720 - HOIST
      ?auto_9718 - PLACE
      ?auto_9717 - TRUCK
      ?auto_9721 - PLACE
      ?auto_9719 - HOIST
      ?auto_9722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9720 ?auto_9718 ) ( SURFACE-AT ?auto_9716 ?auto_9718 ) ( CLEAR ?auto_9716 ) ( IS-CRATE ?auto_9715 ) ( not ( = ?auto_9715 ?auto_9716 ) ) ( AVAILABLE ?auto_9720 ) ( TRUCK-AT ?auto_9717 ?auto_9721 ) ( not ( = ?auto_9721 ?auto_9718 ) ) ( HOIST-AT ?auto_9719 ?auto_9721 ) ( not ( = ?auto_9720 ?auto_9719 ) ) ( AVAILABLE ?auto_9719 ) ( SURFACE-AT ?auto_9715 ?auto_9721 ) ( ON ?auto_9715 ?auto_9722 ) ( CLEAR ?auto_9715 ) ( not ( = ?auto_9715 ?auto_9722 ) ) ( not ( = ?auto_9716 ?auto_9722 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9719 ?auto_9715 ?auto_9722 ?auto_9721 )
      ( MAKE-ON ?auto_9715 ?auto_9716 )
      ( MAKE-ON-VERIFY ?auto_9715 ?auto_9716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9723 - SURFACE
      ?auto_9724 - SURFACE
    )
    :vars
    (
      ?auto_9726 - HOIST
      ?auto_9729 - PLACE
      ?auto_9725 - PLACE
      ?auto_9727 - HOIST
      ?auto_9730 - SURFACE
      ?auto_9728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9726 ?auto_9729 ) ( SURFACE-AT ?auto_9724 ?auto_9729 ) ( CLEAR ?auto_9724 ) ( IS-CRATE ?auto_9723 ) ( not ( = ?auto_9723 ?auto_9724 ) ) ( AVAILABLE ?auto_9726 ) ( not ( = ?auto_9725 ?auto_9729 ) ) ( HOIST-AT ?auto_9727 ?auto_9725 ) ( not ( = ?auto_9726 ?auto_9727 ) ) ( AVAILABLE ?auto_9727 ) ( SURFACE-AT ?auto_9723 ?auto_9725 ) ( ON ?auto_9723 ?auto_9730 ) ( CLEAR ?auto_9723 ) ( not ( = ?auto_9723 ?auto_9730 ) ) ( not ( = ?auto_9724 ?auto_9730 ) ) ( TRUCK-AT ?auto_9728 ?auto_9729 ) )
    :subtasks
    ( ( !DRIVE ?auto_9728 ?auto_9729 ?auto_9725 )
      ( MAKE-ON ?auto_9723 ?auto_9724 )
      ( MAKE-ON-VERIFY ?auto_9723 ?auto_9724 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9731 - SURFACE
      ?auto_9732 - SURFACE
    )
    :vars
    (
      ?auto_9735 - HOIST
      ?auto_9733 - PLACE
      ?auto_9734 - PLACE
      ?auto_9736 - HOIST
      ?auto_9737 - SURFACE
      ?auto_9738 - TRUCK
      ?auto_9739 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9735 ?auto_9733 ) ( IS-CRATE ?auto_9731 ) ( not ( = ?auto_9731 ?auto_9732 ) ) ( not ( = ?auto_9734 ?auto_9733 ) ) ( HOIST-AT ?auto_9736 ?auto_9734 ) ( not ( = ?auto_9735 ?auto_9736 ) ) ( AVAILABLE ?auto_9736 ) ( SURFACE-AT ?auto_9731 ?auto_9734 ) ( ON ?auto_9731 ?auto_9737 ) ( CLEAR ?auto_9731 ) ( not ( = ?auto_9731 ?auto_9737 ) ) ( not ( = ?auto_9732 ?auto_9737 ) ) ( TRUCK-AT ?auto_9738 ?auto_9733 ) ( SURFACE-AT ?auto_9739 ?auto_9733 ) ( CLEAR ?auto_9739 ) ( LIFTING ?auto_9735 ?auto_9732 ) ( IS-CRATE ?auto_9732 ) ( not ( = ?auto_9731 ?auto_9739 ) ) ( not ( = ?auto_9732 ?auto_9739 ) ) ( not ( = ?auto_9737 ?auto_9739 ) ) )
    :subtasks
    ( ( !DROP ?auto_9735 ?auto_9732 ?auto_9739 ?auto_9733 )
      ( MAKE-ON ?auto_9731 ?auto_9732 )
      ( MAKE-ON-VERIFY ?auto_9731 ?auto_9732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9740 - SURFACE
      ?auto_9741 - SURFACE
    )
    :vars
    (
      ?auto_9745 - HOIST
      ?auto_9744 - PLACE
      ?auto_9742 - PLACE
      ?auto_9747 - HOIST
      ?auto_9746 - SURFACE
      ?auto_9743 - TRUCK
      ?auto_9748 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9745 ?auto_9744 ) ( IS-CRATE ?auto_9740 ) ( not ( = ?auto_9740 ?auto_9741 ) ) ( not ( = ?auto_9742 ?auto_9744 ) ) ( HOIST-AT ?auto_9747 ?auto_9742 ) ( not ( = ?auto_9745 ?auto_9747 ) ) ( AVAILABLE ?auto_9747 ) ( SURFACE-AT ?auto_9740 ?auto_9742 ) ( ON ?auto_9740 ?auto_9746 ) ( CLEAR ?auto_9740 ) ( not ( = ?auto_9740 ?auto_9746 ) ) ( not ( = ?auto_9741 ?auto_9746 ) ) ( TRUCK-AT ?auto_9743 ?auto_9744 ) ( SURFACE-AT ?auto_9748 ?auto_9744 ) ( CLEAR ?auto_9748 ) ( IS-CRATE ?auto_9741 ) ( not ( = ?auto_9740 ?auto_9748 ) ) ( not ( = ?auto_9741 ?auto_9748 ) ) ( not ( = ?auto_9746 ?auto_9748 ) ) ( AVAILABLE ?auto_9745 ) ( IN ?auto_9741 ?auto_9743 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9745 ?auto_9741 ?auto_9743 ?auto_9744 )
      ( MAKE-ON ?auto_9740 ?auto_9741 )
      ( MAKE-ON-VERIFY ?auto_9740 ?auto_9741 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9749 - SURFACE
      ?auto_9750 - SURFACE
    )
    :vars
    (
      ?auto_9751 - HOIST
      ?auto_9752 - PLACE
      ?auto_9757 - PLACE
      ?auto_9756 - HOIST
      ?auto_9754 - SURFACE
      ?auto_9753 - SURFACE
      ?auto_9755 - TRUCK
      ?auto_9758 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9751 ?auto_9752 ) ( IS-CRATE ?auto_9749 ) ( not ( = ?auto_9749 ?auto_9750 ) ) ( not ( = ?auto_9757 ?auto_9752 ) ) ( HOIST-AT ?auto_9756 ?auto_9757 ) ( not ( = ?auto_9751 ?auto_9756 ) ) ( AVAILABLE ?auto_9756 ) ( SURFACE-AT ?auto_9749 ?auto_9757 ) ( ON ?auto_9749 ?auto_9754 ) ( CLEAR ?auto_9749 ) ( not ( = ?auto_9749 ?auto_9754 ) ) ( not ( = ?auto_9750 ?auto_9754 ) ) ( SURFACE-AT ?auto_9753 ?auto_9752 ) ( CLEAR ?auto_9753 ) ( IS-CRATE ?auto_9750 ) ( not ( = ?auto_9749 ?auto_9753 ) ) ( not ( = ?auto_9750 ?auto_9753 ) ) ( not ( = ?auto_9754 ?auto_9753 ) ) ( AVAILABLE ?auto_9751 ) ( IN ?auto_9750 ?auto_9755 ) ( TRUCK-AT ?auto_9755 ?auto_9758 ) ( not ( = ?auto_9758 ?auto_9752 ) ) ( not ( = ?auto_9757 ?auto_9758 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9755 ?auto_9758 ?auto_9752 )
      ( MAKE-ON ?auto_9749 ?auto_9750 )
      ( MAKE-ON-VERIFY ?auto_9749 ?auto_9750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9759 - SURFACE
      ?auto_9760 - SURFACE
    )
    :vars
    (
      ?auto_9765 - HOIST
      ?auto_9766 - PLACE
      ?auto_9768 - PLACE
      ?auto_9764 - HOIST
      ?auto_9761 - SURFACE
      ?auto_9762 - SURFACE
      ?auto_9767 - TRUCK
      ?auto_9763 - PLACE
      ?auto_9769 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9765 ?auto_9766 ) ( IS-CRATE ?auto_9759 ) ( not ( = ?auto_9759 ?auto_9760 ) ) ( not ( = ?auto_9768 ?auto_9766 ) ) ( HOIST-AT ?auto_9764 ?auto_9768 ) ( not ( = ?auto_9765 ?auto_9764 ) ) ( AVAILABLE ?auto_9764 ) ( SURFACE-AT ?auto_9759 ?auto_9768 ) ( ON ?auto_9759 ?auto_9761 ) ( CLEAR ?auto_9759 ) ( not ( = ?auto_9759 ?auto_9761 ) ) ( not ( = ?auto_9760 ?auto_9761 ) ) ( SURFACE-AT ?auto_9762 ?auto_9766 ) ( CLEAR ?auto_9762 ) ( IS-CRATE ?auto_9760 ) ( not ( = ?auto_9759 ?auto_9762 ) ) ( not ( = ?auto_9760 ?auto_9762 ) ) ( not ( = ?auto_9761 ?auto_9762 ) ) ( AVAILABLE ?auto_9765 ) ( TRUCK-AT ?auto_9767 ?auto_9763 ) ( not ( = ?auto_9763 ?auto_9766 ) ) ( not ( = ?auto_9768 ?auto_9763 ) ) ( HOIST-AT ?auto_9769 ?auto_9763 ) ( LIFTING ?auto_9769 ?auto_9760 ) ( not ( = ?auto_9765 ?auto_9769 ) ) ( not ( = ?auto_9764 ?auto_9769 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9769 ?auto_9760 ?auto_9767 ?auto_9763 )
      ( MAKE-ON ?auto_9759 ?auto_9760 )
      ( MAKE-ON-VERIFY ?auto_9759 ?auto_9760 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9770 - SURFACE
      ?auto_9771 - SURFACE
    )
    :vars
    (
      ?auto_9775 - HOIST
      ?auto_9777 - PLACE
      ?auto_9778 - PLACE
      ?auto_9773 - HOIST
      ?auto_9772 - SURFACE
      ?auto_9776 - SURFACE
      ?auto_9780 - TRUCK
      ?auto_9779 - PLACE
      ?auto_9774 - HOIST
      ?auto_9781 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9775 ?auto_9777 ) ( IS-CRATE ?auto_9770 ) ( not ( = ?auto_9770 ?auto_9771 ) ) ( not ( = ?auto_9778 ?auto_9777 ) ) ( HOIST-AT ?auto_9773 ?auto_9778 ) ( not ( = ?auto_9775 ?auto_9773 ) ) ( AVAILABLE ?auto_9773 ) ( SURFACE-AT ?auto_9770 ?auto_9778 ) ( ON ?auto_9770 ?auto_9772 ) ( CLEAR ?auto_9770 ) ( not ( = ?auto_9770 ?auto_9772 ) ) ( not ( = ?auto_9771 ?auto_9772 ) ) ( SURFACE-AT ?auto_9776 ?auto_9777 ) ( CLEAR ?auto_9776 ) ( IS-CRATE ?auto_9771 ) ( not ( = ?auto_9770 ?auto_9776 ) ) ( not ( = ?auto_9771 ?auto_9776 ) ) ( not ( = ?auto_9772 ?auto_9776 ) ) ( AVAILABLE ?auto_9775 ) ( TRUCK-AT ?auto_9780 ?auto_9779 ) ( not ( = ?auto_9779 ?auto_9777 ) ) ( not ( = ?auto_9778 ?auto_9779 ) ) ( HOIST-AT ?auto_9774 ?auto_9779 ) ( not ( = ?auto_9775 ?auto_9774 ) ) ( not ( = ?auto_9773 ?auto_9774 ) ) ( AVAILABLE ?auto_9774 ) ( SURFACE-AT ?auto_9771 ?auto_9779 ) ( ON ?auto_9771 ?auto_9781 ) ( CLEAR ?auto_9771 ) ( not ( = ?auto_9770 ?auto_9781 ) ) ( not ( = ?auto_9771 ?auto_9781 ) ) ( not ( = ?auto_9772 ?auto_9781 ) ) ( not ( = ?auto_9776 ?auto_9781 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9774 ?auto_9771 ?auto_9781 ?auto_9779 )
      ( MAKE-ON ?auto_9770 ?auto_9771 )
      ( MAKE-ON-VERIFY ?auto_9770 ?auto_9771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9782 - SURFACE
      ?auto_9783 - SURFACE
    )
    :vars
    (
      ?auto_9791 - HOIST
      ?auto_9789 - PLACE
      ?auto_9788 - PLACE
      ?auto_9785 - HOIST
      ?auto_9787 - SURFACE
      ?auto_9786 - SURFACE
      ?auto_9792 - PLACE
      ?auto_9793 - HOIST
      ?auto_9784 - SURFACE
      ?auto_9790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9791 ?auto_9789 ) ( IS-CRATE ?auto_9782 ) ( not ( = ?auto_9782 ?auto_9783 ) ) ( not ( = ?auto_9788 ?auto_9789 ) ) ( HOIST-AT ?auto_9785 ?auto_9788 ) ( not ( = ?auto_9791 ?auto_9785 ) ) ( AVAILABLE ?auto_9785 ) ( SURFACE-AT ?auto_9782 ?auto_9788 ) ( ON ?auto_9782 ?auto_9787 ) ( CLEAR ?auto_9782 ) ( not ( = ?auto_9782 ?auto_9787 ) ) ( not ( = ?auto_9783 ?auto_9787 ) ) ( SURFACE-AT ?auto_9786 ?auto_9789 ) ( CLEAR ?auto_9786 ) ( IS-CRATE ?auto_9783 ) ( not ( = ?auto_9782 ?auto_9786 ) ) ( not ( = ?auto_9783 ?auto_9786 ) ) ( not ( = ?auto_9787 ?auto_9786 ) ) ( AVAILABLE ?auto_9791 ) ( not ( = ?auto_9792 ?auto_9789 ) ) ( not ( = ?auto_9788 ?auto_9792 ) ) ( HOIST-AT ?auto_9793 ?auto_9792 ) ( not ( = ?auto_9791 ?auto_9793 ) ) ( not ( = ?auto_9785 ?auto_9793 ) ) ( AVAILABLE ?auto_9793 ) ( SURFACE-AT ?auto_9783 ?auto_9792 ) ( ON ?auto_9783 ?auto_9784 ) ( CLEAR ?auto_9783 ) ( not ( = ?auto_9782 ?auto_9784 ) ) ( not ( = ?auto_9783 ?auto_9784 ) ) ( not ( = ?auto_9787 ?auto_9784 ) ) ( not ( = ?auto_9786 ?auto_9784 ) ) ( TRUCK-AT ?auto_9790 ?auto_9789 ) )
    :subtasks
    ( ( !DRIVE ?auto_9790 ?auto_9789 ?auto_9792 )
      ( MAKE-ON ?auto_9782 ?auto_9783 )
      ( MAKE-ON-VERIFY ?auto_9782 ?auto_9783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9794 - SURFACE
      ?auto_9795 - SURFACE
    )
    :vars
    (
      ?auto_9802 - HOIST
      ?auto_9805 - PLACE
      ?auto_9799 - PLACE
      ?auto_9796 - HOIST
      ?auto_9803 - SURFACE
      ?auto_9797 - SURFACE
      ?auto_9804 - PLACE
      ?auto_9800 - HOIST
      ?auto_9801 - SURFACE
      ?auto_9798 - TRUCK
      ?auto_9806 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9802 ?auto_9805 ) ( IS-CRATE ?auto_9794 ) ( not ( = ?auto_9794 ?auto_9795 ) ) ( not ( = ?auto_9799 ?auto_9805 ) ) ( HOIST-AT ?auto_9796 ?auto_9799 ) ( not ( = ?auto_9802 ?auto_9796 ) ) ( AVAILABLE ?auto_9796 ) ( SURFACE-AT ?auto_9794 ?auto_9799 ) ( ON ?auto_9794 ?auto_9803 ) ( CLEAR ?auto_9794 ) ( not ( = ?auto_9794 ?auto_9803 ) ) ( not ( = ?auto_9795 ?auto_9803 ) ) ( IS-CRATE ?auto_9795 ) ( not ( = ?auto_9794 ?auto_9797 ) ) ( not ( = ?auto_9795 ?auto_9797 ) ) ( not ( = ?auto_9803 ?auto_9797 ) ) ( not ( = ?auto_9804 ?auto_9805 ) ) ( not ( = ?auto_9799 ?auto_9804 ) ) ( HOIST-AT ?auto_9800 ?auto_9804 ) ( not ( = ?auto_9802 ?auto_9800 ) ) ( not ( = ?auto_9796 ?auto_9800 ) ) ( AVAILABLE ?auto_9800 ) ( SURFACE-AT ?auto_9795 ?auto_9804 ) ( ON ?auto_9795 ?auto_9801 ) ( CLEAR ?auto_9795 ) ( not ( = ?auto_9794 ?auto_9801 ) ) ( not ( = ?auto_9795 ?auto_9801 ) ) ( not ( = ?auto_9803 ?auto_9801 ) ) ( not ( = ?auto_9797 ?auto_9801 ) ) ( TRUCK-AT ?auto_9798 ?auto_9805 ) ( SURFACE-AT ?auto_9806 ?auto_9805 ) ( CLEAR ?auto_9806 ) ( LIFTING ?auto_9802 ?auto_9797 ) ( IS-CRATE ?auto_9797 ) ( not ( = ?auto_9794 ?auto_9806 ) ) ( not ( = ?auto_9795 ?auto_9806 ) ) ( not ( = ?auto_9803 ?auto_9806 ) ) ( not ( = ?auto_9797 ?auto_9806 ) ) ( not ( = ?auto_9801 ?auto_9806 ) ) )
    :subtasks
    ( ( !DROP ?auto_9802 ?auto_9797 ?auto_9806 ?auto_9805 )
      ( MAKE-ON ?auto_9794 ?auto_9795 )
      ( MAKE-ON-VERIFY ?auto_9794 ?auto_9795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9807 - SURFACE
      ?auto_9808 - SURFACE
    )
    :vars
    (
      ?auto_9812 - HOIST
      ?auto_9811 - PLACE
      ?auto_9816 - PLACE
      ?auto_9819 - HOIST
      ?auto_9810 - SURFACE
      ?auto_9814 - SURFACE
      ?auto_9818 - PLACE
      ?auto_9815 - HOIST
      ?auto_9813 - SURFACE
      ?auto_9809 - TRUCK
      ?auto_9817 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9812 ?auto_9811 ) ( IS-CRATE ?auto_9807 ) ( not ( = ?auto_9807 ?auto_9808 ) ) ( not ( = ?auto_9816 ?auto_9811 ) ) ( HOIST-AT ?auto_9819 ?auto_9816 ) ( not ( = ?auto_9812 ?auto_9819 ) ) ( AVAILABLE ?auto_9819 ) ( SURFACE-AT ?auto_9807 ?auto_9816 ) ( ON ?auto_9807 ?auto_9810 ) ( CLEAR ?auto_9807 ) ( not ( = ?auto_9807 ?auto_9810 ) ) ( not ( = ?auto_9808 ?auto_9810 ) ) ( IS-CRATE ?auto_9808 ) ( not ( = ?auto_9807 ?auto_9814 ) ) ( not ( = ?auto_9808 ?auto_9814 ) ) ( not ( = ?auto_9810 ?auto_9814 ) ) ( not ( = ?auto_9818 ?auto_9811 ) ) ( not ( = ?auto_9816 ?auto_9818 ) ) ( HOIST-AT ?auto_9815 ?auto_9818 ) ( not ( = ?auto_9812 ?auto_9815 ) ) ( not ( = ?auto_9819 ?auto_9815 ) ) ( AVAILABLE ?auto_9815 ) ( SURFACE-AT ?auto_9808 ?auto_9818 ) ( ON ?auto_9808 ?auto_9813 ) ( CLEAR ?auto_9808 ) ( not ( = ?auto_9807 ?auto_9813 ) ) ( not ( = ?auto_9808 ?auto_9813 ) ) ( not ( = ?auto_9810 ?auto_9813 ) ) ( not ( = ?auto_9814 ?auto_9813 ) ) ( TRUCK-AT ?auto_9809 ?auto_9811 ) ( SURFACE-AT ?auto_9817 ?auto_9811 ) ( CLEAR ?auto_9817 ) ( IS-CRATE ?auto_9814 ) ( not ( = ?auto_9807 ?auto_9817 ) ) ( not ( = ?auto_9808 ?auto_9817 ) ) ( not ( = ?auto_9810 ?auto_9817 ) ) ( not ( = ?auto_9814 ?auto_9817 ) ) ( not ( = ?auto_9813 ?auto_9817 ) ) ( AVAILABLE ?auto_9812 ) ( IN ?auto_9814 ?auto_9809 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9812 ?auto_9814 ?auto_9809 ?auto_9811 )
      ( MAKE-ON ?auto_9807 ?auto_9808 )
      ( MAKE-ON-VERIFY ?auto_9807 ?auto_9808 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9820 - SURFACE
      ?auto_9821 - SURFACE
    )
    :vars
    (
      ?auto_9830 - HOIST
      ?auto_9829 - PLACE
      ?auto_9825 - PLACE
      ?auto_9824 - HOIST
      ?auto_9831 - SURFACE
      ?auto_9823 - SURFACE
      ?auto_9826 - PLACE
      ?auto_9827 - HOIST
      ?auto_9828 - SURFACE
      ?auto_9832 - SURFACE
      ?auto_9822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9830 ?auto_9829 ) ( IS-CRATE ?auto_9820 ) ( not ( = ?auto_9820 ?auto_9821 ) ) ( not ( = ?auto_9825 ?auto_9829 ) ) ( HOIST-AT ?auto_9824 ?auto_9825 ) ( not ( = ?auto_9830 ?auto_9824 ) ) ( AVAILABLE ?auto_9824 ) ( SURFACE-AT ?auto_9820 ?auto_9825 ) ( ON ?auto_9820 ?auto_9831 ) ( CLEAR ?auto_9820 ) ( not ( = ?auto_9820 ?auto_9831 ) ) ( not ( = ?auto_9821 ?auto_9831 ) ) ( IS-CRATE ?auto_9821 ) ( not ( = ?auto_9820 ?auto_9823 ) ) ( not ( = ?auto_9821 ?auto_9823 ) ) ( not ( = ?auto_9831 ?auto_9823 ) ) ( not ( = ?auto_9826 ?auto_9829 ) ) ( not ( = ?auto_9825 ?auto_9826 ) ) ( HOIST-AT ?auto_9827 ?auto_9826 ) ( not ( = ?auto_9830 ?auto_9827 ) ) ( not ( = ?auto_9824 ?auto_9827 ) ) ( AVAILABLE ?auto_9827 ) ( SURFACE-AT ?auto_9821 ?auto_9826 ) ( ON ?auto_9821 ?auto_9828 ) ( CLEAR ?auto_9821 ) ( not ( = ?auto_9820 ?auto_9828 ) ) ( not ( = ?auto_9821 ?auto_9828 ) ) ( not ( = ?auto_9831 ?auto_9828 ) ) ( not ( = ?auto_9823 ?auto_9828 ) ) ( SURFACE-AT ?auto_9832 ?auto_9829 ) ( CLEAR ?auto_9832 ) ( IS-CRATE ?auto_9823 ) ( not ( = ?auto_9820 ?auto_9832 ) ) ( not ( = ?auto_9821 ?auto_9832 ) ) ( not ( = ?auto_9831 ?auto_9832 ) ) ( not ( = ?auto_9823 ?auto_9832 ) ) ( not ( = ?auto_9828 ?auto_9832 ) ) ( AVAILABLE ?auto_9830 ) ( IN ?auto_9823 ?auto_9822 ) ( TRUCK-AT ?auto_9822 ?auto_9826 ) )
    :subtasks
    ( ( !DRIVE ?auto_9822 ?auto_9826 ?auto_9829 )
      ( MAKE-ON ?auto_9820 ?auto_9821 )
      ( MAKE-ON-VERIFY ?auto_9820 ?auto_9821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9833 - SURFACE
      ?auto_9834 - SURFACE
    )
    :vars
    (
      ?auto_9836 - HOIST
      ?auto_9840 - PLACE
      ?auto_9835 - PLACE
      ?auto_9845 - HOIST
      ?auto_9839 - SURFACE
      ?auto_9844 - SURFACE
      ?auto_9837 - PLACE
      ?auto_9841 - HOIST
      ?auto_9843 - SURFACE
      ?auto_9842 - SURFACE
      ?auto_9838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9836 ?auto_9840 ) ( IS-CRATE ?auto_9833 ) ( not ( = ?auto_9833 ?auto_9834 ) ) ( not ( = ?auto_9835 ?auto_9840 ) ) ( HOIST-AT ?auto_9845 ?auto_9835 ) ( not ( = ?auto_9836 ?auto_9845 ) ) ( AVAILABLE ?auto_9845 ) ( SURFACE-AT ?auto_9833 ?auto_9835 ) ( ON ?auto_9833 ?auto_9839 ) ( CLEAR ?auto_9833 ) ( not ( = ?auto_9833 ?auto_9839 ) ) ( not ( = ?auto_9834 ?auto_9839 ) ) ( IS-CRATE ?auto_9834 ) ( not ( = ?auto_9833 ?auto_9844 ) ) ( not ( = ?auto_9834 ?auto_9844 ) ) ( not ( = ?auto_9839 ?auto_9844 ) ) ( not ( = ?auto_9837 ?auto_9840 ) ) ( not ( = ?auto_9835 ?auto_9837 ) ) ( HOIST-AT ?auto_9841 ?auto_9837 ) ( not ( = ?auto_9836 ?auto_9841 ) ) ( not ( = ?auto_9845 ?auto_9841 ) ) ( SURFACE-AT ?auto_9834 ?auto_9837 ) ( ON ?auto_9834 ?auto_9843 ) ( CLEAR ?auto_9834 ) ( not ( = ?auto_9833 ?auto_9843 ) ) ( not ( = ?auto_9834 ?auto_9843 ) ) ( not ( = ?auto_9839 ?auto_9843 ) ) ( not ( = ?auto_9844 ?auto_9843 ) ) ( SURFACE-AT ?auto_9842 ?auto_9840 ) ( CLEAR ?auto_9842 ) ( IS-CRATE ?auto_9844 ) ( not ( = ?auto_9833 ?auto_9842 ) ) ( not ( = ?auto_9834 ?auto_9842 ) ) ( not ( = ?auto_9839 ?auto_9842 ) ) ( not ( = ?auto_9844 ?auto_9842 ) ) ( not ( = ?auto_9843 ?auto_9842 ) ) ( AVAILABLE ?auto_9836 ) ( TRUCK-AT ?auto_9838 ?auto_9837 ) ( LIFTING ?auto_9841 ?auto_9844 ) )
    :subtasks
    ( ( !LOAD ?auto_9841 ?auto_9844 ?auto_9838 ?auto_9837 )
      ( MAKE-ON ?auto_9833 ?auto_9834 )
      ( MAKE-ON-VERIFY ?auto_9833 ?auto_9834 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9846 - SURFACE
      ?auto_9847 - SURFACE
    )
    :vars
    (
      ?auto_9849 - HOIST
      ?auto_9858 - PLACE
      ?auto_9857 - PLACE
      ?auto_9848 - HOIST
      ?auto_9852 - SURFACE
      ?auto_9851 - SURFACE
      ?auto_9850 - PLACE
      ?auto_9855 - HOIST
      ?auto_9853 - SURFACE
      ?auto_9854 - SURFACE
      ?auto_9856 - TRUCK
      ?auto_9859 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9849 ?auto_9858 ) ( IS-CRATE ?auto_9846 ) ( not ( = ?auto_9846 ?auto_9847 ) ) ( not ( = ?auto_9857 ?auto_9858 ) ) ( HOIST-AT ?auto_9848 ?auto_9857 ) ( not ( = ?auto_9849 ?auto_9848 ) ) ( AVAILABLE ?auto_9848 ) ( SURFACE-AT ?auto_9846 ?auto_9857 ) ( ON ?auto_9846 ?auto_9852 ) ( CLEAR ?auto_9846 ) ( not ( = ?auto_9846 ?auto_9852 ) ) ( not ( = ?auto_9847 ?auto_9852 ) ) ( IS-CRATE ?auto_9847 ) ( not ( = ?auto_9846 ?auto_9851 ) ) ( not ( = ?auto_9847 ?auto_9851 ) ) ( not ( = ?auto_9852 ?auto_9851 ) ) ( not ( = ?auto_9850 ?auto_9858 ) ) ( not ( = ?auto_9857 ?auto_9850 ) ) ( HOIST-AT ?auto_9855 ?auto_9850 ) ( not ( = ?auto_9849 ?auto_9855 ) ) ( not ( = ?auto_9848 ?auto_9855 ) ) ( SURFACE-AT ?auto_9847 ?auto_9850 ) ( ON ?auto_9847 ?auto_9853 ) ( CLEAR ?auto_9847 ) ( not ( = ?auto_9846 ?auto_9853 ) ) ( not ( = ?auto_9847 ?auto_9853 ) ) ( not ( = ?auto_9852 ?auto_9853 ) ) ( not ( = ?auto_9851 ?auto_9853 ) ) ( SURFACE-AT ?auto_9854 ?auto_9858 ) ( CLEAR ?auto_9854 ) ( IS-CRATE ?auto_9851 ) ( not ( = ?auto_9846 ?auto_9854 ) ) ( not ( = ?auto_9847 ?auto_9854 ) ) ( not ( = ?auto_9852 ?auto_9854 ) ) ( not ( = ?auto_9851 ?auto_9854 ) ) ( not ( = ?auto_9853 ?auto_9854 ) ) ( AVAILABLE ?auto_9849 ) ( TRUCK-AT ?auto_9856 ?auto_9850 ) ( AVAILABLE ?auto_9855 ) ( SURFACE-AT ?auto_9851 ?auto_9850 ) ( ON ?auto_9851 ?auto_9859 ) ( CLEAR ?auto_9851 ) ( not ( = ?auto_9846 ?auto_9859 ) ) ( not ( = ?auto_9847 ?auto_9859 ) ) ( not ( = ?auto_9852 ?auto_9859 ) ) ( not ( = ?auto_9851 ?auto_9859 ) ) ( not ( = ?auto_9853 ?auto_9859 ) ) ( not ( = ?auto_9854 ?auto_9859 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9855 ?auto_9851 ?auto_9859 ?auto_9850 )
      ( MAKE-ON ?auto_9846 ?auto_9847 )
      ( MAKE-ON-VERIFY ?auto_9846 ?auto_9847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9860 - SURFACE
      ?auto_9861 - SURFACE
    )
    :vars
    (
      ?auto_9868 - HOIST
      ?auto_9865 - PLACE
      ?auto_9862 - PLACE
      ?auto_9873 - HOIST
      ?auto_9869 - SURFACE
      ?auto_9866 - SURFACE
      ?auto_9870 - PLACE
      ?auto_9864 - HOIST
      ?auto_9867 - SURFACE
      ?auto_9863 - SURFACE
      ?auto_9871 - SURFACE
      ?auto_9872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9868 ?auto_9865 ) ( IS-CRATE ?auto_9860 ) ( not ( = ?auto_9860 ?auto_9861 ) ) ( not ( = ?auto_9862 ?auto_9865 ) ) ( HOIST-AT ?auto_9873 ?auto_9862 ) ( not ( = ?auto_9868 ?auto_9873 ) ) ( AVAILABLE ?auto_9873 ) ( SURFACE-AT ?auto_9860 ?auto_9862 ) ( ON ?auto_9860 ?auto_9869 ) ( CLEAR ?auto_9860 ) ( not ( = ?auto_9860 ?auto_9869 ) ) ( not ( = ?auto_9861 ?auto_9869 ) ) ( IS-CRATE ?auto_9861 ) ( not ( = ?auto_9860 ?auto_9866 ) ) ( not ( = ?auto_9861 ?auto_9866 ) ) ( not ( = ?auto_9869 ?auto_9866 ) ) ( not ( = ?auto_9870 ?auto_9865 ) ) ( not ( = ?auto_9862 ?auto_9870 ) ) ( HOIST-AT ?auto_9864 ?auto_9870 ) ( not ( = ?auto_9868 ?auto_9864 ) ) ( not ( = ?auto_9873 ?auto_9864 ) ) ( SURFACE-AT ?auto_9861 ?auto_9870 ) ( ON ?auto_9861 ?auto_9867 ) ( CLEAR ?auto_9861 ) ( not ( = ?auto_9860 ?auto_9867 ) ) ( not ( = ?auto_9861 ?auto_9867 ) ) ( not ( = ?auto_9869 ?auto_9867 ) ) ( not ( = ?auto_9866 ?auto_9867 ) ) ( SURFACE-AT ?auto_9863 ?auto_9865 ) ( CLEAR ?auto_9863 ) ( IS-CRATE ?auto_9866 ) ( not ( = ?auto_9860 ?auto_9863 ) ) ( not ( = ?auto_9861 ?auto_9863 ) ) ( not ( = ?auto_9869 ?auto_9863 ) ) ( not ( = ?auto_9866 ?auto_9863 ) ) ( not ( = ?auto_9867 ?auto_9863 ) ) ( AVAILABLE ?auto_9868 ) ( AVAILABLE ?auto_9864 ) ( SURFACE-AT ?auto_9866 ?auto_9870 ) ( ON ?auto_9866 ?auto_9871 ) ( CLEAR ?auto_9866 ) ( not ( = ?auto_9860 ?auto_9871 ) ) ( not ( = ?auto_9861 ?auto_9871 ) ) ( not ( = ?auto_9869 ?auto_9871 ) ) ( not ( = ?auto_9866 ?auto_9871 ) ) ( not ( = ?auto_9867 ?auto_9871 ) ) ( not ( = ?auto_9863 ?auto_9871 ) ) ( TRUCK-AT ?auto_9872 ?auto_9865 ) )
    :subtasks
    ( ( !DRIVE ?auto_9872 ?auto_9865 ?auto_9870 )
      ( MAKE-ON ?auto_9860 ?auto_9861 )
      ( MAKE-ON-VERIFY ?auto_9860 ?auto_9861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9874 - SURFACE
      ?auto_9875 - SURFACE
    )
    :vars
    (
      ?auto_9881 - HOIST
      ?auto_9884 - PLACE
      ?auto_9883 - PLACE
      ?auto_9885 - HOIST
      ?auto_9877 - SURFACE
      ?auto_9886 - SURFACE
      ?auto_9879 - PLACE
      ?auto_9876 - HOIST
      ?auto_9887 - SURFACE
      ?auto_9878 - SURFACE
      ?auto_9880 - SURFACE
      ?auto_9882 - TRUCK
      ?auto_9888 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9881 ?auto_9884 ) ( IS-CRATE ?auto_9874 ) ( not ( = ?auto_9874 ?auto_9875 ) ) ( not ( = ?auto_9883 ?auto_9884 ) ) ( HOIST-AT ?auto_9885 ?auto_9883 ) ( not ( = ?auto_9881 ?auto_9885 ) ) ( AVAILABLE ?auto_9885 ) ( SURFACE-AT ?auto_9874 ?auto_9883 ) ( ON ?auto_9874 ?auto_9877 ) ( CLEAR ?auto_9874 ) ( not ( = ?auto_9874 ?auto_9877 ) ) ( not ( = ?auto_9875 ?auto_9877 ) ) ( IS-CRATE ?auto_9875 ) ( not ( = ?auto_9874 ?auto_9886 ) ) ( not ( = ?auto_9875 ?auto_9886 ) ) ( not ( = ?auto_9877 ?auto_9886 ) ) ( not ( = ?auto_9879 ?auto_9884 ) ) ( not ( = ?auto_9883 ?auto_9879 ) ) ( HOIST-AT ?auto_9876 ?auto_9879 ) ( not ( = ?auto_9881 ?auto_9876 ) ) ( not ( = ?auto_9885 ?auto_9876 ) ) ( SURFACE-AT ?auto_9875 ?auto_9879 ) ( ON ?auto_9875 ?auto_9887 ) ( CLEAR ?auto_9875 ) ( not ( = ?auto_9874 ?auto_9887 ) ) ( not ( = ?auto_9875 ?auto_9887 ) ) ( not ( = ?auto_9877 ?auto_9887 ) ) ( not ( = ?auto_9886 ?auto_9887 ) ) ( IS-CRATE ?auto_9886 ) ( not ( = ?auto_9874 ?auto_9878 ) ) ( not ( = ?auto_9875 ?auto_9878 ) ) ( not ( = ?auto_9877 ?auto_9878 ) ) ( not ( = ?auto_9886 ?auto_9878 ) ) ( not ( = ?auto_9887 ?auto_9878 ) ) ( AVAILABLE ?auto_9876 ) ( SURFACE-AT ?auto_9886 ?auto_9879 ) ( ON ?auto_9886 ?auto_9880 ) ( CLEAR ?auto_9886 ) ( not ( = ?auto_9874 ?auto_9880 ) ) ( not ( = ?auto_9875 ?auto_9880 ) ) ( not ( = ?auto_9877 ?auto_9880 ) ) ( not ( = ?auto_9886 ?auto_9880 ) ) ( not ( = ?auto_9887 ?auto_9880 ) ) ( not ( = ?auto_9878 ?auto_9880 ) ) ( TRUCK-AT ?auto_9882 ?auto_9884 ) ( SURFACE-AT ?auto_9888 ?auto_9884 ) ( CLEAR ?auto_9888 ) ( LIFTING ?auto_9881 ?auto_9878 ) ( IS-CRATE ?auto_9878 ) ( not ( = ?auto_9874 ?auto_9888 ) ) ( not ( = ?auto_9875 ?auto_9888 ) ) ( not ( = ?auto_9877 ?auto_9888 ) ) ( not ( = ?auto_9886 ?auto_9888 ) ) ( not ( = ?auto_9887 ?auto_9888 ) ) ( not ( = ?auto_9878 ?auto_9888 ) ) ( not ( = ?auto_9880 ?auto_9888 ) ) )
    :subtasks
    ( ( !DROP ?auto_9881 ?auto_9878 ?auto_9888 ?auto_9884 )
      ( MAKE-ON ?auto_9874 ?auto_9875 )
      ( MAKE-ON-VERIFY ?auto_9874 ?auto_9875 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9889 - SURFACE
      ?auto_9890 - SURFACE
    )
    :vars
    (
      ?auto_9893 - HOIST
      ?auto_9896 - PLACE
      ?auto_9900 - PLACE
      ?auto_9901 - HOIST
      ?auto_9891 - SURFACE
      ?auto_9895 - SURFACE
      ?auto_9892 - PLACE
      ?auto_9903 - HOIST
      ?auto_9897 - SURFACE
      ?auto_9902 - SURFACE
      ?auto_9894 - SURFACE
      ?auto_9898 - TRUCK
      ?auto_9899 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9893 ?auto_9896 ) ( IS-CRATE ?auto_9889 ) ( not ( = ?auto_9889 ?auto_9890 ) ) ( not ( = ?auto_9900 ?auto_9896 ) ) ( HOIST-AT ?auto_9901 ?auto_9900 ) ( not ( = ?auto_9893 ?auto_9901 ) ) ( AVAILABLE ?auto_9901 ) ( SURFACE-AT ?auto_9889 ?auto_9900 ) ( ON ?auto_9889 ?auto_9891 ) ( CLEAR ?auto_9889 ) ( not ( = ?auto_9889 ?auto_9891 ) ) ( not ( = ?auto_9890 ?auto_9891 ) ) ( IS-CRATE ?auto_9890 ) ( not ( = ?auto_9889 ?auto_9895 ) ) ( not ( = ?auto_9890 ?auto_9895 ) ) ( not ( = ?auto_9891 ?auto_9895 ) ) ( not ( = ?auto_9892 ?auto_9896 ) ) ( not ( = ?auto_9900 ?auto_9892 ) ) ( HOIST-AT ?auto_9903 ?auto_9892 ) ( not ( = ?auto_9893 ?auto_9903 ) ) ( not ( = ?auto_9901 ?auto_9903 ) ) ( SURFACE-AT ?auto_9890 ?auto_9892 ) ( ON ?auto_9890 ?auto_9897 ) ( CLEAR ?auto_9890 ) ( not ( = ?auto_9889 ?auto_9897 ) ) ( not ( = ?auto_9890 ?auto_9897 ) ) ( not ( = ?auto_9891 ?auto_9897 ) ) ( not ( = ?auto_9895 ?auto_9897 ) ) ( IS-CRATE ?auto_9895 ) ( not ( = ?auto_9889 ?auto_9902 ) ) ( not ( = ?auto_9890 ?auto_9902 ) ) ( not ( = ?auto_9891 ?auto_9902 ) ) ( not ( = ?auto_9895 ?auto_9902 ) ) ( not ( = ?auto_9897 ?auto_9902 ) ) ( AVAILABLE ?auto_9903 ) ( SURFACE-AT ?auto_9895 ?auto_9892 ) ( ON ?auto_9895 ?auto_9894 ) ( CLEAR ?auto_9895 ) ( not ( = ?auto_9889 ?auto_9894 ) ) ( not ( = ?auto_9890 ?auto_9894 ) ) ( not ( = ?auto_9891 ?auto_9894 ) ) ( not ( = ?auto_9895 ?auto_9894 ) ) ( not ( = ?auto_9897 ?auto_9894 ) ) ( not ( = ?auto_9902 ?auto_9894 ) ) ( TRUCK-AT ?auto_9898 ?auto_9896 ) ( SURFACE-AT ?auto_9899 ?auto_9896 ) ( CLEAR ?auto_9899 ) ( IS-CRATE ?auto_9902 ) ( not ( = ?auto_9889 ?auto_9899 ) ) ( not ( = ?auto_9890 ?auto_9899 ) ) ( not ( = ?auto_9891 ?auto_9899 ) ) ( not ( = ?auto_9895 ?auto_9899 ) ) ( not ( = ?auto_9897 ?auto_9899 ) ) ( not ( = ?auto_9902 ?auto_9899 ) ) ( not ( = ?auto_9894 ?auto_9899 ) ) ( AVAILABLE ?auto_9893 ) ( IN ?auto_9902 ?auto_9898 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9893 ?auto_9902 ?auto_9898 ?auto_9896 )
      ( MAKE-ON ?auto_9889 ?auto_9890 )
      ( MAKE-ON-VERIFY ?auto_9889 ?auto_9890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9904 - SURFACE
      ?auto_9905 - SURFACE
    )
    :vars
    (
      ?auto_9909 - HOIST
      ?auto_9910 - PLACE
      ?auto_9913 - PLACE
      ?auto_9918 - HOIST
      ?auto_9908 - SURFACE
      ?auto_9912 - SURFACE
      ?auto_9906 - PLACE
      ?auto_9914 - HOIST
      ?auto_9911 - SURFACE
      ?auto_9916 - SURFACE
      ?auto_9907 - SURFACE
      ?auto_9915 - SURFACE
      ?auto_9917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9909 ?auto_9910 ) ( IS-CRATE ?auto_9904 ) ( not ( = ?auto_9904 ?auto_9905 ) ) ( not ( = ?auto_9913 ?auto_9910 ) ) ( HOIST-AT ?auto_9918 ?auto_9913 ) ( not ( = ?auto_9909 ?auto_9918 ) ) ( AVAILABLE ?auto_9918 ) ( SURFACE-AT ?auto_9904 ?auto_9913 ) ( ON ?auto_9904 ?auto_9908 ) ( CLEAR ?auto_9904 ) ( not ( = ?auto_9904 ?auto_9908 ) ) ( not ( = ?auto_9905 ?auto_9908 ) ) ( IS-CRATE ?auto_9905 ) ( not ( = ?auto_9904 ?auto_9912 ) ) ( not ( = ?auto_9905 ?auto_9912 ) ) ( not ( = ?auto_9908 ?auto_9912 ) ) ( not ( = ?auto_9906 ?auto_9910 ) ) ( not ( = ?auto_9913 ?auto_9906 ) ) ( HOIST-AT ?auto_9914 ?auto_9906 ) ( not ( = ?auto_9909 ?auto_9914 ) ) ( not ( = ?auto_9918 ?auto_9914 ) ) ( SURFACE-AT ?auto_9905 ?auto_9906 ) ( ON ?auto_9905 ?auto_9911 ) ( CLEAR ?auto_9905 ) ( not ( = ?auto_9904 ?auto_9911 ) ) ( not ( = ?auto_9905 ?auto_9911 ) ) ( not ( = ?auto_9908 ?auto_9911 ) ) ( not ( = ?auto_9912 ?auto_9911 ) ) ( IS-CRATE ?auto_9912 ) ( not ( = ?auto_9904 ?auto_9916 ) ) ( not ( = ?auto_9905 ?auto_9916 ) ) ( not ( = ?auto_9908 ?auto_9916 ) ) ( not ( = ?auto_9912 ?auto_9916 ) ) ( not ( = ?auto_9911 ?auto_9916 ) ) ( AVAILABLE ?auto_9914 ) ( SURFACE-AT ?auto_9912 ?auto_9906 ) ( ON ?auto_9912 ?auto_9907 ) ( CLEAR ?auto_9912 ) ( not ( = ?auto_9904 ?auto_9907 ) ) ( not ( = ?auto_9905 ?auto_9907 ) ) ( not ( = ?auto_9908 ?auto_9907 ) ) ( not ( = ?auto_9912 ?auto_9907 ) ) ( not ( = ?auto_9911 ?auto_9907 ) ) ( not ( = ?auto_9916 ?auto_9907 ) ) ( SURFACE-AT ?auto_9915 ?auto_9910 ) ( CLEAR ?auto_9915 ) ( IS-CRATE ?auto_9916 ) ( not ( = ?auto_9904 ?auto_9915 ) ) ( not ( = ?auto_9905 ?auto_9915 ) ) ( not ( = ?auto_9908 ?auto_9915 ) ) ( not ( = ?auto_9912 ?auto_9915 ) ) ( not ( = ?auto_9911 ?auto_9915 ) ) ( not ( = ?auto_9916 ?auto_9915 ) ) ( not ( = ?auto_9907 ?auto_9915 ) ) ( AVAILABLE ?auto_9909 ) ( IN ?auto_9916 ?auto_9917 ) ( TRUCK-AT ?auto_9917 ?auto_9913 ) )
    :subtasks
    ( ( !DRIVE ?auto_9917 ?auto_9913 ?auto_9910 )
      ( MAKE-ON ?auto_9904 ?auto_9905 )
      ( MAKE-ON-VERIFY ?auto_9904 ?auto_9905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9919 - SURFACE
      ?auto_9920 - SURFACE
    )
    :vars
    (
      ?auto_9932 - HOIST
      ?auto_9924 - PLACE
      ?auto_9927 - PLACE
      ?auto_9926 - HOIST
      ?auto_9929 - SURFACE
      ?auto_9922 - SURFACE
      ?auto_9930 - PLACE
      ?auto_9923 - HOIST
      ?auto_9928 - SURFACE
      ?auto_9931 - SURFACE
      ?auto_9925 - SURFACE
      ?auto_9921 - SURFACE
      ?auto_9933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9932 ?auto_9924 ) ( IS-CRATE ?auto_9919 ) ( not ( = ?auto_9919 ?auto_9920 ) ) ( not ( = ?auto_9927 ?auto_9924 ) ) ( HOIST-AT ?auto_9926 ?auto_9927 ) ( not ( = ?auto_9932 ?auto_9926 ) ) ( SURFACE-AT ?auto_9919 ?auto_9927 ) ( ON ?auto_9919 ?auto_9929 ) ( CLEAR ?auto_9919 ) ( not ( = ?auto_9919 ?auto_9929 ) ) ( not ( = ?auto_9920 ?auto_9929 ) ) ( IS-CRATE ?auto_9920 ) ( not ( = ?auto_9919 ?auto_9922 ) ) ( not ( = ?auto_9920 ?auto_9922 ) ) ( not ( = ?auto_9929 ?auto_9922 ) ) ( not ( = ?auto_9930 ?auto_9924 ) ) ( not ( = ?auto_9927 ?auto_9930 ) ) ( HOIST-AT ?auto_9923 ?auto_9930 ) ( not ( = ?auto_9932 ?auto_9923 ) ) ( not ( = ?auto_9926 ?auto_9923 ) ) ( SURFACE-AT ?auto_9920 ?auto_9930 ) ( ON ?auto_9920 ?auto_9928 ) ( CLEAR ?auto_9920 ) ( not ( = ?auto_9919 ?auto_9928 ) ) ( not ( = ?auto_9920 ?auto_9928 ) ) ( not ( = ?auto_9929 ?auto_9928 ) ) ( not ( = ?auto_9922 ?auto_9928 ) ) ( IS-CRATE ?auto_9922 ) ( not ( = ?auto_9919 ?auto_9931 ) ) ( not ( = ?auto_9920 ?auto_9931 ) ) ( not ( = ?auto_9929 ?auto_9931 ) ) ( not ( = ?auto_9922 ?auto_9931 ) ) ( not ( = ?auto_9928 ?auto_9931 ) ) ( AVAILABLE ?auto_9923 ) ( SURFACE-AT ?auto_9922 ?auto_9930 ) ( ON ?auto_9922 ?auto_9925 ) ( CLEAR ?auto_9922 ) ( not ( = ?auto_9919 ?auto_9925 ) ) ( not ( = ?auto_9920 ?auto_9925 ) ) ( not ( = ?auto_9929 ?auto_9925 ) ) ( not ( = ?auto_9922 ?auto_9925 ) ) ( not ( = ?auto_9928 ?auto_9925 ) ) ( not ( = ?auto_9931 ?auto_9925 ) ) ( SURFACE-AT ?auto_9921 ?auto_9924 ) ( CLEAR ?auto_9921 ) ( IS-CRATE ?auto_9931 ) ( not ( = ?auto_9919 ?auto_9921 ) ) ( not ( = ?auto_9920 ?auto_9921 ) ) ( not ( = ?auto_9929 ?auto_9921 ) ) ( not ( = ?auto_9922 ?auto_9921 ) ) ( not ( = ?auto_9928 ?auto_9921 ) ) ( not ( = ?auto_9931 ?auto_9921 ) ) ( not ( = ?auto_9925 ?auto_9921 ) ) ( AVAILABLE ?auto_9932 ) ( TRUCK-AT ?auto_9933 ?auto_9927 ) ( LIFTING ?auto_9926 ?auto_9931 ) )
    :subtasks
    ( ( !LOAD ?auto_9926 ?auto_9931 ?auto_9933 ?auto_9927 )
      ( MAKE-ON ?auto_9919 ?auto_9920 )
      ( MAKE-ON-VERIFY ?auto_9919 ?auto_9920 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9934 - SURFACE
      ?auto_9935 - SURFACE
    )
    :vars
    (
      ?auto_9939 - HOIST
      ?auto_9944 - PLACE
      ?auto_9945 - PLACE
      ?auto_9936 - HOIST
      ?auto_9947 - SURFACE
      ?auto_9941 - SURFACE
      ?auto_9937 - PLACE
      ?auto_9940 - HOIST
      ?auto_9946 - SURFACE
      ?auto_9938 - SURFACE
      ?auto_9942 - SURFACE
      ?auto_9943 - SURFACE
      ?auto_9948 - TRUCK
      ?auto_9949 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9939 ?auto_9944 ) ( IS-CRATE ?auto_9934 ) ( not ( = ?auto_9934 ?auto_9935 ) ) ( not ( = ?auto_9945 ?auto_9944 ) ) ( HOIST-AT ?auto_9936 ?auto_9945 ) ( not ( = ?auto_9939 ?auto_9936 ) ) ( SURFACE-AT ?auto_9934 ?auto_9945 ) ( ON ?auto_9934 ?auto_9947 ) ( CLEAR ?auto_9934 ) ( not ( = ?auto_9934 ?auto_9947 ) ) ( not ( = ?auto_9935 ?auto_9947 ) ) ( IS-CRATE ?auto_9935 ) ( not ( = ?auto_9934 ?auto_9941 ) ) ( not ( = ?auto_9935 ?auto_9941 ) ) ( not ( = ?auto_9947 ?auto_9941 ) ) ( not ( = ?auto_9937 ?auto_9944 ) ) ( not ( = ?auto_9945 ?auto_9937 ) ) ( HOIST-AT ?auto_9940 ?auto_9937 ) ( not ( = ?auto_9939 ?auto_9940 ) ) ( not ( = ?auto_9936 ?auto_9940 ) ) ( SURFACE-AT ?auto_9935 ?auto_9937 ) ( ON ?auto_9935 ?auto_9946 ) ( CLEAR ?auto_9935 ) ( not ( = ?auto_9934 ?auto_9946 ) ) ( not ( = ?auto_9935 ?auto_9946 ) ) ( not ( = ?auto_9947 ?auto_9946 ) ) ( not ( = ?auto_9941 ?auto_9946 ) ) ( IS-CRATE ?auto_9941 ) ( not ( = ?auto_9934 ?auto_9938 ) ) ( not ( = ?auto_9935 ?auto_9938 ) ) ( not ( = ?auto_9947 ?auto_9938 ) ) ( not ( = ?auto_9941 ?auto_9938 ) ) ( not ( = ?auto_9946 ?auto_9938 ) ) ( AVAILABLE ?auto_9940 ) ( SURFACE-AT ?auto_9941 ?auto_9937 ) ( ON ?auto_9941 ?auto_9942 ) ( CLEAR ?auto_9941 ) ( not ( = ?auto_9934 ?auto_9942 ) ) ( not ( = ?auto_9935 ?auto_9942 ) ) ( not ( = ?auto_9947 ?auto_9942 ) ) ( not ( = ?auto_9941 ?auto_9942 ) ) ( not ( = ?auto_9946 ?auto_9942 ) ) ( not ( = ?auto_9938 ?auto_9942 ) ) ( SURFACE-AT ?auto_9943 ?auto_9944 ) ( CLEAR ?auto_9943 ) ( IS-CRATE ?auto_9938 ) ( not ( = ?auto_9934 ?auto_9943 ) ) ( not ( = ?auto_9935 ?auto_9943 ) ) ( not ( = ?auto_9947 ?auto_9943 ) ) ( not ( = ?auto_9941 ?auto_9943 ) ) ( not ( = ?auto_9946 ?auto_9943 ) ) ( not ( = ?auto_9938 ?auto_9943 ) ) ( not ( = ?auto_9942 ?auto_9943 ) ) ( AVAILABLE ?auto_9939 ) ( TRUCK-AT ?auto_9948 ?auto_9945 ) ( AVAILABLE ?auto_9936 ) ( SURFACE-AT ?auto_9938 ?auto_9945 ) ( ON ?auto_9938 ?auto_9949 ) ( CLEAR ?auto_9938 ) ( not ( = ?auto_9934 ?auto_9949 ) ) ( not ( = ?auto_9935 ?auto_9949 ) ) ( not ( = ?auto_9947 ?auto_9949 ) ) ( not ( = ?auto_9941 ?auto_9949 ) ) ( not ( = ?auto_9946 ?auto_9949 ) ) ( not ( = ?auto_9938 ?auto_9949 ) ) ( not ( = ?auto_9942 ?auto_9949 ) ) ( not ( = ?auto_9943 ?auto_9949 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9936 ?auto_9938 ?auto_9949 ?auto_9945 )
      ( MAKE-ON ?auto_9934 ?auto_9935 )
      ( MAKE-ON-VERIFY ?auto_9934 ?auto_9935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9950 - SURFACE
      ?auto_9951 - SURFACE
    )
    :vars
    (
      ?auto_9964 - HOIST
      ?auto_9952 - PLACE
      ?auto_9965 - PLACE
      ?auto_9955 - HOIST
      ?auto_9957 - SURFACE
      ?auto_9959 - SURFACE
      ?auto_9962 - PLACE
      ?auto_9961 - HOIST
      ?auto_9958 - SURFACE
      ?auto_9960 - SURFACE
      ?auto_9953 - SURFACE
      ?auto_9954 - SURFACE
      ?auto_9956 - SURFACE
      ?auto_9963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9964 ?auto_9952 ) ( IS-CRATE ?auto_9950 ) ( not ( = ?auto_9950 ?auto_9951 ) ) ( not ( = ?auto_9965 ?auto_9952 ) ) ( HOIST-AT ?auto_9955 ?auto_9965 ) ( not ( = ?auto_9964 ?auto_9955 ) ) ( SURFACE-AT ?auto_9950 ?auto_9965 ) ( ON ?auto_9950 ?auto_9957 ) ( CLEAR ?auto_9950 ) ( not ( = ?auto_9950 ?auto_9957 ) ) ( not ( = ?auto_9951 ?auto_9957 ) ) ( IS-CRATE ?auto_9951 ) ( not ( = ?auto_9950 ?auto_9959 ) ) ( not ( = ?auto_9951 ?auto_9959 ) ) ( not ( = ?auto_9957 ?auto_9959 ) ) ( not ( = ?auto_9962 ?auto_9952 ) ) ( not ( = ?auto_9965 ?auto_9962 ) ) ( HOIST-AT ?auto_9961 ?auto_9962 ) ( not ( = ?auto_9964 ?auto_9961 ) ) ( not ( = ?auto_9955 ?auto_9961 ) ) ( SURFACE-AT ?auto_9951 ?auto_9962 ) ( ON ?auto_9951 ?auto_9958 ) ( CLEAR ?auto_9951 ) ( not ( = ?auto_9950 ?auto_9958 ) ) ( not ( = ?auto_9951 ?auto_9958 ) ) ( not ( = ?auto_9957 ?auto_9958 ) ) ( not ( = ?auto_9959 ?auto_9958 ) ) ( IS-CRATE ?auto_9959 ) ( not ( = ?auto_9950 ?auto_9960 ) ) ( not ( = ?auto_9951 ?auto_9960 ) ) ( not ( = ?auto_9957 ?auto_9960 ) ) ( not ( = ?auto_9959 ?auto_9960 ) ) ( not ( = ?auto_9958 ?auto_9960 ) ) ( AVAILABLE ?auto_9961 ) ( SURFACE-AT ?auto_9959 ?auto_9962 ) ( ON ?auto_9959 ?auto_9953 ) ( CLEAR ?auto_9959 ) ( not ( = ?auto_9950 ?auto_9953 ) ) ( not ( = ?auto_9951 ?auto_9953 ) ) ( not ( = ?auto_9957 ?auto_9953 ) ) ( not ( = ?auto_9959 ?auto_9953 ) ) ( not ( = ?auto_9958 ?auto_9953 ) ) ( not ( = ?auto_9960 ?auto_9953 ) ) ( SURFACE-AT ?auto_9954 ?auto_9952 ) ( CLEAR ?auto_9954 ) ( IS-CRATE ?auto_9960 ) ( not ( = ?auto_9950 ?auto_9954 ) ) ( not ( = ?auto_9951 ?auto_9954 ) ) ( not ( = ?auto_9957 ?auto_9954 ) ) ( not ( = ?auto_9959 ?auto_9954 ) ) ( not ( = ?auto_9958 ?auto_9954 ) ) ( not ( = ?auto_9960 ?auto_9954 ) ) ( not ( = ?auto_9953 ?auto_9954 ) ) ( AVAILABLE ?auto_9964 ) ( AVAILABLE ?auto_9955 ) ( SURFACE-AT ?auto_9960 ?auto_9965 ) ( ON ?auto_9960 ?auto_9956 ) ( CLEAR ?auto_9960 ) ( not ( = ?auto_9950 ?auto_9956 ) ) ( not ( = ?auto_9951 ?auto_9956 ) ) ( not ( = ?auto_9957 ?auto_9956 ) ) ( not ( = ?auto_9959 ?auto_9956 ) ) ( not ( = ?auto_9958 ?auto_9956 ) ) ( not ( = ?auto_9960 ?auto_9956 ) ) ( not ( = ?auto_9953 ?auto_9956 ) ) ( not ( = ?auto_9954 ?auto_9956 ) ) ( TRUCK-AT ?auto_9963 ?auto_9952 ) )
    :subtasks
    ( ( !DRIVE ?auto_9963 ?auto_9952 ?auto_9965 )
      ( MAKE-ON ?auto_9950 ?auto_9951 )
      ( MAKE-ON-VERIFY ?auto_9950 ?auto_9951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9968 - SURFACE
      ?auto_9969 - SURFACE
    )
    :vars
    (
      ?auto_9970 - HOIST
      ?auto_9971 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9970 ?auto_9971 ) ( SURFACE-AT ?auto_9969 ?auto_9971 ) ( CLEAR ?auto_9969 ) ( LIFTING ?auto_9970 ?auto_9968 ) ( IS-CRATE ?auto_9968 ) ( not ( = ?auto_9968 ?auto_9969 ) ) )
    :subtasks
    ( ( !DROP ?auto_9970 ?auto_9968 ?auto_9969 ?auto_9971 )
      ( MAKE-ON-VERIFY ?auto_9968 ?auto_9969 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9972 - SURFACE
      ?auto_9973 - SURFACE
    )
    :vars
    (
      ?auto_9974 - HOIST
      ?auto_9975 - PLACE
      ?auto_9976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9974 ?auto_9975 ) ( SURFACE-AT ?auto_9973 ?auto_9975 ) ( CLEAR ?auto_9973 ) ( IS-CRATE ?auto_9972 ) ( not ( = ?auto_9972 ?auto_9973 ) ) ( TRUCK-AT ?auto_9976 ?auto_9975 ) ( AVAILABLE ?auto_9974 ) ( IN ?auto_9972 ?auto_9976 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9974 ?auto_9972 ?auto_9976 ?auto_9975 )
      ( MAKE-ON ?auto_9972 ?auto_9973 )
      ( MAKE-ON-VERIFY ?auto_9972 ?auto_9973 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9977 - SURFACE
      ?auto_9978 - SURFACE
    )
    :vars
    (
      ?auto_9980 - HOIST
      ?auto_9979 - PLACE
      ?auto_9981 - TRUCK
      ?auto_9982 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9980 ?auto_9979 ) ( SURFACE-AT ?auto_9978 ?auto_9979 ) ( CLEAR ?auto_9978 ) ( IS-CRATE ?auto_9977 ) ( not ( = ?auto_9977 ?auto_9978 ) ) ( AVAILABLE ?auto_9980 ) ( IN ?auto_9977 ?auto_9981 ) ( TRUCK-AT ?auto_9981 ?auto_9982 ) ( not ( = ?auto_9982 ?auto_9979 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9981 ?auto_9982 ?auto_9979 )
      ( MAKE-ON ?auto_9977 ?auto_9978 )
      ( MAKE-ON-VERIFY ?auto_9977 ?auto_9978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9983 - SURFACE
      ?auto_9984 - SURFACE
    )
    :vars
    (
      ?auto_9986 - HOIST
      ?auto_9987 - PLACE
      ?auto_9988 - TRUCK
      ?auto_9985 - PLACE
      ?auto_9989 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9986 ?auto_9987 ) ( SURFACE-AT ?auto_9984 ?auto_9987 ) ( CLEAR ?auto_9984 ) ( IS-CRATE ?auto_9983 ) ( not ( = ?auto_9983 ?auto_9984 ) ) ( AVAILABLE ?auto_9986 ) ( TRUCK-AT ?auto_9988 ?auto_9985 ) ( not ( = ?auto_9985 ?auto_9987 ) ) ( HOIST-AT ?auto_9989 ?auto_9985 ) ( LIFTING ?auto_9989 ?auto_9983 ) ( not ( = ?auto_9986 ?auto_9989 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9989 ?auto_9983 ?auto_9988 ?auto_9985 )
      ( MAKE-ON ?auto_9983 ?auto_9984 )
      ( MAKE-ON-VERIFY ?auto_9983 ?auto_9984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9990 - SURFACE
      ?auto_9991 - SURFACE
    )
    :vars
    (
      ?auto_9996 - HOIST
      ?auto_9993 - PLACE
      ?auto_9995 - TRUCK
      ?auto_9992 - PLACE
      ?auto_9994 - HOIST
      ?auto_9997 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9996 ?auto_9993 ) ( SURFACE-AT ?auto_9991 ?auto_9993 ) ( CLEAR ?auto_9991 ) ( IS-CRATE ?auto_9990 ) ( not ( = ?auto_9990 ?auto_9991 ) ) ( AVAILABLE ?auto_9996 ) ( TRUCK-AT ?auto_9995 ?auto_9992 ) ( not ( = ?auto_9992 ?auto_9993 ) ) ( HOIST-AT ?auto_9994 ?auto_9992 ) ( not ( = ?auto_9996 ?auto_9994 ) ) ( AVAILABLE ?auto_9994 ) ( SURFACE-AT ?auto_9990 ?auto_9992 ) ( ON ?auto_9990 ?auto_9997 ) ( CLEAR ?auto_9990 ) ( not ( = ?auto_9990 ?auto_9997 ) ) ( not ( = ?auto_9991 ?auto_9997 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9994 ?auto_9990 ?auto_9997 ?auto_9992 )
      ( MAKE-ON ?auto_9990 ?auto_9991 )
      ( MAKE-ON-VERIFY ?auto_9990 ?auto_9991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9998 - SURFACE
      ?auto_9999 - SURFACE
    )
    :vars
    (
      ?auto_10003 - HOIST
      ?auto_10004 - PLACE
      ?auto_10002 - PLACE
      ?auto_10000 - HOIST
      ?auto_10001 - SURFACE
      ?auto_10005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10003 ?auto_10004 ) ( SURFACE-AT ?auto_9999 ?auto_10004 ) ( CLEAR ?auto_9999 ) ( IS-CRATE ?auto_9998 ) ( not ( = ?auto_9998 ?auto_9999 ) ) ( AVAILABLE ?auto_10003 ) ( not ( = ?auto_10002 ?auto_10004 ) ) ( HOIST-AT ?auto_10000 ?auto_10002 ) ( not ( = ?auto_10003 ?auto_10000 ) ) ( AVAILABLE ?auto_10000 ) ( SURFACE-AT ?auto_9998 ?auto_10002 ) ( ON ?auto_9998 ?auto_10001 ) ( CLEAR ?auto_9998 ) ( not ( = ?auto_9998 ?auto_10001 ) ) ( not ( = ?auto_9999 ?auto_10001 ) ) ( TRUCK-AT ?auto_10005 ?auto_10004 ) )
    :subtasks
    ( ( !DRIVE ?auto_10005 ?auto_10004 ?auto_10002 )
      ( MAKE-ON ?auto_9998 ?auto_9999 )
      ( MAKE-ON-VERIFY ?auto_9998 ?auto_9999 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10006 - SURFACE
      ?auto_10007 - SURFACE
    )
    :vars
    (
      ?auto_10010 - HOIST
      ?auto_10011 - PLACE
      ?auto_10012 - PLACE
      ?auto_10009 - HOIST
      ?auto_10008 - SURFACE
      ?auto_10013 - TRUCK
      ?auto_10014 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10010 ?auto_10011 ) ( IS-CRATE ?auto_10006 ) ( not ( = ?auto_10006 ?auto_10007 ) ) ( not ( = ?auto_10012 ?auto_10011 ) ) ( HOIST-AT ?auto_10009 ?auto_10012 ) ( not ( = ?auto_10010 ?auto_10009 ) ) ( AVAILABLE ?auto_10009 ) ( SURFACE-AT ?auto_10006 ?auto_10012 ) ( ON ?auto_10006 ?auto_10008 ) ( CLEAR ?auto_10006 ) ( not ( = ?auto_10006 ?auto_10008 ) ) ( not ( = ?auto_10007 ?auto_10008 ) ) ( TRUCK-AT ?auto_10013 ?auto_10011 ) ( SURFACE-AT ?auto_10014 ?auto_10011 ) ( CLEAR ?auto_10014 ) ( LIFTING ?auto_10010 ?auto_10007 ) ( IS-CRATE ?auto_10007 ) ( not ( = ?auto_10006 ?auto_10014 ) ) ( not ( = ?auto_10007 ?auto_10014 ) ) ( not ( = ?auto_10008 ?auto_10014 ) ) )
    :subtasks
    ( ( !DROP ?auto_10010 ?auto_10007 ?auto_10014 ?auto_10011 )
      ( MAKE-ON ?auto_10006 ?auto_10007 )
      ( MAKE-ON-VERIFY ?auto_10006 ?auto_10007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10015 - SURFACE
      ?auto_10016 - SURFACE
    )
    :vars
    (
      ?auto_10018 - HOIST
      ?auto_10020 - PLACE
      ?auto_10019 - PLACE
      ?auto_10017 - HOIST
      ?auto_10021 - SURFACE
      ?auto_10023 - TRUCK
      ?auto_10022 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10018 ?auto_10020 ) ( IS-CRATE ?auto_10015 ) ( not ( = ?auto_10015 ?auto_10016 ) ) ( not ( = ?auto_10019 ?auto_10020 ) ) ( HOIST-AT ?auto_10017 ?auto_10019 ) ( not ( = ?auto_10018 ?auto_10017 ) ) ( AVAILABLE ?auto_10017 ) ( SURFACE-AT ?auto_10015 ?auto_10019 ) ( ON ?auto_10015 ?auto_10021 ) ( CLEAR ?auto_10015 ) ( not ( = ?auto_10015 ?auto_10021 ) ) ( not ( = ?auto_10016 ?auto_10021 ) ) ( TRUCK-AT ?auto_10023 ?auto_10020 ) ( SURFACE-AT ?auto_10022 ?auto_10020 ) ( CLEAR ?auto_10022 ) ( IS-CRATE ?auto_10016 ) ( not ( = ?auto_10015 ?auto_10022 ) ) ( not ( = ?auto_10016 ?auto_10022 ) ) ( not ( = ?auto_10021 ?auto_10022 ) ) ( AVAILABLE ?auto_10018 ) ( IN ?auto_10016 ?auto_10023 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10018 ?auto_10016 ?auto_10023 ?auto_10020 )
      ( MAKE-ON ?auto_10015 ?auto_10016 )
      ( MAKE-ON-VERIFY ?auto_10015 ?auto_10016 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10024 - SURFACE
      ?auto_10025 - SURFACE
    )
    :vars
    (
      ?auto_10032 - HOIST
      ?auto_10031 - PLACE
      ?auto_10028 - PLACE
      ?auto_10026 - HOIST
      ?auto_10030 - SURFACE
      ?auto_10027 - SURFACE
      ?auto_10029 - TRUCK
      ?auto_10033 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10032 ?auto_10031 ) ( IS-CRATE ?auto_10024 ) ( not ( = ?auto_10024 ?auto_10025 ) ) ( not ( = ?auto_10028 ?auto_10031 ) ) ( HOIST-AT ?auto_10026 ?auto_10028 ) ( not ( = ?auto_10032 ?auto_10026 ) ) ( AVAILABLE ?auto_10026 ) ( SURFACE-AT ?auto_10024 ?auto_10028 ) ( ON ?auto_10024 ?auto_10030 ) ( CLEAR ?auto_10024 ) ( not ( = ?auto_10024 ?auto_10030 ) ) ( not ( = ?auto_10025 ?auto_10030 ) ) ( SURFACE-AT ?auto_10027 ?auto_10031 ) ( CLEAR ?auto_10027 ) ( IS-CRATE ?auto_10025 ) ( not ( = ?auto_10024 ?auto_10027 ) ) ( not ( = ?auto_10025 ?auto_10027 ) ) ( not ( = ?auto_10030 ?auto_10027 ) ) ( AVAILABLE ?auto_10032 ) ( IN ?auto_10025 ?auto_10029 ) ( TRUCK-AT ?auto_10029 ?auto_10033 ) ( not ( = ?auto_10033 ?auto_10031 ) ) ( not ( = ?auto_10028 ?auto_10033 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10029 ?auto_10033 ?auto_10031 )
      ( MAKE-ON ?auto_10024 ?auto_10025 )
      ( MAKE-ON-VERIFY ?auto_10024 ?auto_10025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10034 - SURFACE
      ?auto_10035 - SURFACE
    )
    :vars
    (
      ?auto_10037 - HOIST
      ?auto_10036 - PLACE
      ?auto_10041 - PLACE
      ?auto_10043 - HOIST
      ?auto_10038 - SURFACE
      ?auto_10039 - SURFACE
      ?auto_10040 - TRUCK
      ?auto_10042 - PLACE
      ?auto_10044 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10037 ?auto_10036 ) ( IS-CRATE ?auto_10034 ) ( not ( = ?auto_10034 ?auto_10035 ) ) ( not ( = ?auto_10041 ?auto_10036 ) ) ( HOIST-AT ?auto_10043 ?auto_10041 ) ( not ( = ?auto_10037 ?auto_10043 ) ) ( AVAILABLE ?auto_10043 ) ( SURFACE-AT ?auto_10034 ?auto_10041 ) ( ON ?auto_10034 ?auto_10038 ) ( CLEAR ?auto_10034 ) ( not ( = ?auto_10034 ?auto_10038 ) ) ( not ( = ?auto_10035 ?auto_10038 ) ) ( SURFACE-AT ?auto_10039 ?auto_10036 ) ( CLEAR ?auto_10039 ) ( IS-CRATE ?auto_10035 ) ( not ( = ?auto_10034 ?auto_10039 ) ) ( not ( = ?auto_10035 ?auto_10039 ) ) ( not ( = ?auto_10038 ?auto_10039 ) ) ( AVAILABLE ?auto_10037 ) ( TRUCK-AT ?auto_10040 ?auto_10042 ) ( not ( = ?auto_10042 ?auto_10036 ) ) ( not ( = ?auto_10041 ?auto_10042 ) ) ( HOIST-AT ?auto_10044 ?auto_10042 ) ( LIFTING ?auto_10044 ?auto_10035 ) ( not ( = ?auto_10037 ?auto_10044 ) ) ( not ( = ?auto_10043 ?auto_10044 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10044 ?auto_10035 ?auto_10040 ?auto_10042 )
      ( MAKE-ON ?auto_10034 ?auto_10035 )
      ( MAKE-ON-VERIFY ?auto_10034 ?auto_10035 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10045 - SURFACE
      ?auto_10046 - SURFACE
    )
    :vars
    (
      ?auto_10055 - HOIST
      ?auto_10048 - PLACE
      ?auto_10050 - PLACE
      ?auto_10049 - HOIST
      ?auto_10051 - SURFACE
      ?auto_10052 - SURFACE
      ?auto_10054 - TRUCK
      ?auto_10053 - PLACE
      ?auto_10047 - HOIST
      ?auto_10056 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10055 ?auto_10048 ) ( IS-CRATE ?auto_10045 ) ( not ( = ?auto_10045 ?auto_10046 ) ) ( not ( = ?auto_10050 ?auto_10048 ) ) ( HOIST-AT ?auto_10049 ?auto_10050 ) ( not ( = ?auto_10055 ?auto_10049 ) ) ( AVAILABLE ?auto_10049 ) ( SURFACE-AT ?auto_10045 ?auto_10050 ) ( ON ?auto_10045 ?auto_10051 ) ( CLEAR ?auto_10045 ) ( not ( = ?auto_10045 ?auto_10051 ) ) ( not ( = ?auto_10046 ?auto_10051 ) ) ( SURFACE-AT ?auto_10052 ?auto_10048 ) ( CLEAR ?auto_10052 ) ( IS-CRATE ?auto_10046 ) ( not ( = ?auto_10045 ?auto_10052 ) ) ( not ( = ?auto_10046 ?auto_10052 ) ) ( not ( = ?auto_10051 ?auto_10052 ) ) ( AVAILABLE ?auto_10055 ) ( TRUCK-AT ?auto_10054 ?auto_10053 ) ( not ( = ?auto_10053 ?auto_10048 ) ) ( not ( = ?auto_10050 ?auto_10053 ) ) ( HOIST-AT ?auto_10047 ?auto_10053 ) ( not ( = ?auto_10055 ?auto_10047 ) ) ( not ( = ?auto_10049 ?auto_10047 ) ) ( AVAILABLE ?auto_10047 ) ( SURFACE-AT ?auto_10046 ?auto_10053 ) ( ON ?auto_10046 ?auto_10056 ) ( CLEAR ?auto_10046 ) ( not ( = ?auto_10045 ?auto_10056 ) ) ( not ( = ?auto_10046 ?auto_10056 ) ) ( not ( = ?auto_10051 ?auto_10056 ) ) ( not ( = ?auto_10052 ?auto_10056 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10047 ?auto_10046 ?auto_10056 ?auto_10053 )
      ( MAKE-ON ?auto_10045 ?auto_10046 )
      ( MAKE-ON-VERIFY ?auto_10045 ?auto_10046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10057 - SURFACE
      ?auto_10058 - SURFACE
    )
    :vars
    (
      ?auto_10066 - HOIST
      ?auto_10062 - PLACE
      ?auto_10065 - PLACE
      ?auto_10063 - HOIST
      ?auto_10067 - SURFACE
      ?auto_10064 - SURFACE
      ?auto_10059 - PLACE
      ?auto_10068 - HOIST
      ?auto_10060 - SURFACE
      ?auto_10061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10066 ?auto_10062 ) ( IS-CRATE ?auto_10057 ) ( not ( = ?auto_10057 ?auto_10058 ) ) ( not ( = ?auto_10065 ?auto_10062 ) ) ( HOIST-AT ?auto_10063 ?auto_10065 ) ( not ( = ?auto_10066 ?auto_10063 ) ) ( AVAILABLE ?auto_10063 ) ( SURFACE-AT ?auto_10057 ?auto_10065 ) ( ON ?auto_10057 ?auto_10067 ) ( CLEAR ?auto_10057 ) ( not ( = ?auto_10057 ?auto_10067 ) ) ( not ( = ?auto_10058 ?auto_10067 ) ) ( SURFACE-AT ?auto_10064 ?auto_10062 ) ( CLEAR ?auto_10064 ) ( IS-CRATE ?auto_10058 ) ( not ( = ?auto_10057 ?auto_10064 ) ) ( not ( = ?auto_10058 ?auto_10064 ) ) ( not ( = ?auto_10067 ?auto_10064 ) ) ( AVAILABLE ?auto_10066 ) ( not ( = ?auto_10059 ?auto_10062 ) ) ( not ( = ?auto_10065 ?auto_10059 ) ) ( HOIST-AT ?auto_10068 ?auto_10059 ) ( not ( = ?auto_10066 ?auto_10068 ) ) ( not ( = ?auto_10063 ?auto_10068 ) ) ( AVAILABLE ?auto_10068 ) ( SURFACE-AT ?auto_10058 ?auto_10059 ) ( ON ?auto_10058 ?auto_10060 ) ( CLEAR ?auto_10058 ) ( not ( = ?auto_10057 ?auto_10060 ) ) ( not ( = ?auto_10058 ?auto_10060 ) ) ( not ( = ?auto_10067 ?auto_10060 ) ) ( not ( = ?auto_10064 ?auto_10060 ) ) ( TRUCK-AT ?auto_10061 ?auto_10062 ) )
    :subtasks
    ( ( !DRIVE ?auto_10061 ?auto_10062 ?auto_10059 )
      ( MAKE-ON ?auto_10057 ?auto_10058 )
      ( MAKE-ON-VERIFY ?auto_10057 ?auto_10058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10069 - SURFACE
      ?auto_10070 - SURFACE
    )
    :vars
    (
      ?auto_10080 - HOIST
      ?auto_10076 - PLACE
      ?auto_10073 - PLACE
      ?auto_10075 - HOIST
      ?auto_10072 - SURFACE
      ?auto_10079 - SURFACE
      ?auto_10071 - PLACE
      ?auto_10077 - HOIST
      ?auto_10078 - SURFACE
      ?auto_10074 - TRUCK
      ?auto_10081 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10080 ?auto_10076 ) ( IS-CRATE ?auto_10069 ) ( not ( = ?auto_10069 ?auto_10070 ) ) ( not ( = ?auto_10073 ?auto_10076 ) ) ( HOIST-AT ?auto_10075 ?auto_10073 ) ( not ( = ?auto_10080 ?auto_10075 ) ) ( AVAILABLE ?auto_10075 ) ( SURFACE-AT ?auto_10069 ?auto_10073 ) ( ON ?auto_10069 ?auto_10072 ) ( CLEAR ?auto_10069 ) ( not ( = ?auto_10069 ?auto_10072 ) ) ( not ( = ?auto_10070 ?auto_10072 ) ) ( IS-CRATE ?auto_10070 ) ( not ( = ?auto_10069 ?auto_10079 ) ) ( not ( = ?auto_10070 ?auto_10079 ) ) ( not ( = ?auto_10072 ?auto_10079 ) ) ( not ( = ?auto_10071 ?auto_10076 ) ) ( not ( = ?auto_10073 ?auto_10071 ) ) ( HOIST-AT ?auto_10077 ?auto_10071 ) ( not ( = ?auto_10080 ?auto_10077 ) ) ( not ( = ?auto_10075 ?auto_10077 ) ) ( AVAILABLE ?auto_10077 ) ( SURFACE-AT ?auto_10070 ?auto_10071 ) ( ON ?auto_10070 ?auto_10078 ) ( CLEAR ?auto_10070 ) ( not ( = ?auto_10069 ?auto_10078 ) ) ( not ( = ?auto_10070 ?auto_10078 ) ) ( not ( = ?auto_10072 ?auto_10078 ) ) ( not ( = ?auto_10079 ?auto_10078 ) ) ( TRUCK-AT ?auto_10074 ?auto_10076 ) ( SURFACE-AT ?auto_10081 ?auto_10076 ) ( CLEAR ?auto_10081 ) ( LIFTING ?auto_10080 ?auto_10079 ) ( IS-CRATE ?auto_10079 ) ( not ( = ?auto_10069 ?auto_10081 ) ) ( not ( = ?auto_10070 ?auto_10081 ) ) ( not ( = ?auto_10072 ?auto_10081 ) ) ( not ( = ?auto_10079 ?auto_10081 ) ) ( not ( = ?auto_10078 ?auto_10081 ) ) )
    :subtasks
    ( ( !DROP ?auto_10080 ?auto_10079 ?auto_10081 ?auto_10076 )
      ( MAKE-ON ?auto_10069 ?auto_10070 )
      ( MAKE-ON-VERIFY ?auto_10069 ?auto_10070 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10082 - SURFACE
      ?auto_10083 - SURFACE
    )
    :vars
    (
      ?auto_10085 - HOIST
      ?auto_10092 - PLACE
      ?auto_10093 - PLACE
      ?auto_10094 - HOIST
      ?auto_10090 - SURFACE
      ?auto_10087 - SURFACE
      ?auto_10088 - PLACE
      ?auto_10084 - HOIST
      ?auto_10086 - SURFACE
      ?auto_10091 - TRUCK
      ?auto_10089 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10085 ?auto_10092 ) ( IS-CRATE ?auto_10082 ) ( not ( = ?auto_10082 ?auto_10083 ) ) ( not ( = ?auto_10093 ?auto_10092 ) ) ( HOIST-AT ?auto_10094 ?auto_10093 ) ( not ( = ?auto_10085 ?auto_10094 ) ) ( AVAILABLE ?auto_10094 ) ( SURFACE-AT ?auto_10082 ?auto_10093 ) ( ON ?auto_10082 ?auto_10090 ) ( CLEAR ?auto_10082 ) ( not ( = ?auto_10082 ?auto_10090 ) ) ( not ( = ?auto_10083 ?auto_10090 ) ) ( IS-CRATE ?auto_10083 ) ( not ( = ?auto_10082 ?auto_10087 ) ) ( not ( = ?auto_10083 ?auto_10087 ) ) ( not ( = ?auto_10090 ?auto_10087 ) ) ( not ( = ?auto_10088 ?auto_10092 ) ) ( not ( = ?auto_10093 ?auto_10088 ) ) ( HOIST-AT ?auto_10084 ?auto_10088 ) ( not ( = ?auto_10085 ?auto_10084 ) ) ( not ( = ?auto_10094 ?auto_10084 ) ) ( AVAILABLE ?auto_10084 ) ( SURFACE-AT ?auto_10083 ?auto_10088 ) ( ON ?auto_10083 ?auto_10086 ) ( CLEAR ?auto_10083 ) ( not ( = ?auto_10082 ?auto_10086 ) ) ( not ( = ?auto_10083 ?auto_10086 ) ) ( not ( = ?auto_10090 ?auto_10086 ) ) ( not ( = ?auto_10087 ?auto_10086 ) ) ( TRUCK-AT ?auto_10091 ?auto_10092 ) ( SURFACE-AT ?auto_10089 ?auto_10092 ) ( CLEAR ?auto_10089 ) ( IS-CRATE ?auto_10087 ) ( not ( = ?auto_10082 ?auto_10089 ) ) ( not ( = ?auto_10083 ?auto_10089 ) ) ( not ( = ?auto_10090 ?auto_10089 ) ) ( not ( = ?auto_10087 ?auto_10089 ) ) ( not ( = ?auto_10086 ?auto_10089 ) ) ( AVAILABLE ?auto_10085 ) ( IN ?auto_10087 ?auto_10091 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10085 ?auto_10087 ?auto_10091 ?auto_10092 )
      ( MAKE-ON ?auto_10082 ?auto_10083 )
      ( MAKE-ON-VERIFY ?auto_10082 ?auto_10083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10095 - SURFACE
      ?auto_10096 - SURFACE
    )
    :vars
    (
      ?auto_10097 - HOIST
      ?auto_10098 - PLACE
      ?auto_10100 - PLACE
      ?auto_10104 - HOIST
      ?auto_10099 - SURFACE
      ?auto_10106 - SURFACE
      ?auto_10102 - PLACE
      ?auto_10107 - HOIST
      ?auto_10105 - SURFACE
      ?auto_10103 - SURFACE
      ?auto_10101 - TRUCK
      ?auto_10108 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10097 ?auto_10098 ) ( IS-CRATE ?auto_10095 ) ( not ( = ?auto_10095 ?auto_10096 ) ) ( not ( = ?auto_10100 ?auto_10098 ) ) ( HOIST-AT ?auto_10104 ?auto_10100 ) ( not ( = ?auto_10097 ?auto_10104 ) ) ( AVAILABLE ?auto_10104 ) ( SURFACE-AT ?auto_10095 ?auto_10100 ) ( ON ?auto_10095 ?auto_10099 ) ( CLEAR ?auto_10095 ) ( not ( = ?auto_10095 ?auto_10099 ) ) ( not ( = ?auto_10096 ?auto_10099 ) ) ( IS-CRATE ?auto_10096 ) ( not ( = ?auto_10095 ?auto_10106 ) ) ( not ( = ?auto_10096 ?auto_10106 ) ) ( not ( = ?auto_10099 ?auto_10106 ) ) ( not ( = ?auto_10102 ?auto_10098 ) ) ( not ( = ?auto_10100 ?auto_10102 ) ) ( HOIST-AT ?auto_10107 ?auto_10102 ) ( not ( = ?auto_10097 ?auto_10107 ) ) ( not ( = ?auto_10104 ?auto_10107 ) ) ( AVAILABLE ?auto_10107 ) ( SURFACE-AT ?auto_10096 ?auto_10102 ) ( ON ?auto_10096 ?auto_10105 ) ( CLEAR ?auto_10096 ) ( not ( = ?auto_10095 ?auto_10105 ) ) ( not ( = ?auto_10096 ?auto_10105 ) ) ( not ( = ?auto_10099 ?auto_10105 ) ) ( not ( = ?auto_10106 ?auto_10105 ) ) ( SURFACE-AT ?auto_10103 ?auto_10098 ) ( CLEAR ?auto_10103 ) ( IS-CRATE ?auto_10106 ) ( not ( = ?auto_10095 ?auto_10103 ) ) ( not ( = ?auto_10096 ?auto_10103 ) ) ( not ( = ?auto_10099 ?auto_10103 ) ) ( not ( = ?auto_10106 ?auto_10103 ) ) ( not ( = ?auto_10105 ?auto_10103 ) ) ( AVAILABLE ?auto_10097 ) ( IN ?auto_10106 ?auto_10101 ) ( TRUCK-AT ?auto_10101 ?auto_10108 ) ( not ( = ?auto_10108 ?auto_10098 ) ) ( not ( = ?auto_10100 ?auto_10108 ) ) ( not ( = ?auto_10102 ?auto_10108 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10101 ?auto_10108 ?auto_10098 )
      ( MAKE-ON ?auto_10095 ?auto_10096 )
      ( MAKE-ON-VERIFY ?auto_10095 ?auto_10096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10109 - SURFACE
      ?auto_10110 - SURFACE
    )
    :vars
    (
      ?auto_10121 - HOIST
      ?auto_10119 - PLACE
      ?auto_10118 - PLACE
      ?auto_10115 - HOIST
      ?auto_10117 - SURFACE
      ?auto_10116 - SURFACE
      ?auto_10114 - PLACE
      ?auto_10120 - HOIST
      ?auto_10112 - SURFACE
      ?auto_10111 - SURFACE
      ?auto_10113 - TRUCK
      ?auto_10122 - PLACE
      ?auto_10123 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10121 ?auto_10119 ) ( IS-CRATE ?auto_10109 ) ( not ( = ?auto_10109 ?auto_10110 ) ) ( not ( = ?auto_10118 ?auto_10119 ) ) ( HOIST-AT ?auto_10115 ?auto_10118 ) ( not ( = ?auto_10121 ?auto_10115 ) ) ( AVAILABLE ?auto_10115 ) ( SURFACE-AT ?auto_10109 ?auto_10118 ) ( ON ?auto_10109 ?auto_10117 ) ( CLEAR ?auto_10109 ) ( not ( = ?auto_10109 ?auto_10117 ) ) ( not ( = ?auto_10110 ?auto_10117 ) ) ( IS-CRATE ?auto_10110 ) ( not ( = ?auto_10109 ?auto_10116 ) ) ( not ( = ?auto_10110 ?auto_10116 ) ) ( not ( = ?auto_10117 ?auto_10116 ) ) ( not ( = ?auto_10114 ?auto_10119 ) ) ( not ( = ?auto_10118 ?auto_10114 ) ) ( HOIST-AT ?auto_10120 ?auto_10114 ) ( not ( = ?auto_10121 ?auto_10120 ) ) ( not ( = ?auto_10115 ?auto_10120 ) ) ( AVAILABLE ?auto_10120 ) ( SURFACE-AT ?auto_10110 ?auto_10114 ) ( ON ?auto_10110 ?auto_10112 ) ( CLEAR ?auto_10110 ) ( not ( = ?auto_10109 ?auto_10112 ) ) ( not ( = ?auto_10110 ?auto_10112 ) ) ( not ( = ?auto_10117 ?auto_10112 ) ) ( not ( = ?auto_10116 ?auto_10112 ) ) ( SURFACE-AT ?auto_10111 ?auto_10119 ) ( CLEAR ?auto_10111 ) ( IS-CRATE ?auto_10116 ) ( not ( = ?auto_10109 ?auto_10111 ) ) ( not ( = ?auto_10110 ?auto_10111 ) ) ( not ( = ?auto_10117 ?auto_10111 ) ) ( not ( = ?auto_10116 ?auto_10111 ) ) ( not ( = ?auto_10112 ?auto_10111 ) ) ( AVAILABLE ?auto_10121 ) ( TRUCK-AT ?auto_10113 ?auto_10122 ) ( not ( = ?auto_10122 ?auto_10119 ) ) ( not ( = ?auto_10118 ?auto_10122 ) ) ( not ( = ?auto_10114 ?auto_10122 ) ) ( HOIST-AT ?auto_10123 ?auto_10122 ) ( LIFTING ?auto_10123 ?auto_10116 ) ( not ( = ?auto_10121 ?auto_10123 ) ) ( not ( = ?auto_10115 ?auto_10123 ) ) ( not ( = ?auto_10120 ?auto_10123 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10123 ?auto_10116 ?auto_10113 ?auto_10122 )
      ( MAKE-ON ?auto_10109 ?auto_10110 )
      ( MAKE-ON-VERIFY ?auto_10109 ?auto_10110 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10124 - SURFACE
      ?auto_10125 - SURFACE
    )
    :vars
    (
      ?auto_10133 - HOIST
      ?auto_10138 - PLACE
      ?auto_10126 - PLACE
      ?auto_10132 - HOIST
      ?auto_10137 - SURFACE
      ?auto_10129 - SURFACE
      ?auto_10134 - PLACE
      ?auto_10130 - HOIST
      ?auto_10135 - SURFACE
      ?auto_10128 - SURFACE
      ?auto_10131 - TRUCK
      ?auto_10127 - PLACE
      ?auto_10136 - HOIST
      ?auto_10139 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10133 ?auto_10138 ) ( IS-CRATE ?auto_10124 ) ( not ( = ?auto_10124 ?auto_10125 ) ) ( not ( = ?auto_10126 ?auto_10138 ) ) ( HOIST-AT ?auto_10132 ?auto_10126 ) ( not ( = ?auto_10133 ?auto_10132 ) ) ( AVAILABLE ?auto_10132 ) ( SURFACE-AT ?auto_10124 ?auto_10126 ) ( ON ?auto_10124 ?auto_10137 ) ( CLEAR ?auto_10124 ) ( not ( = ?auto_10124 ?auto_10137 ) ) ( not ( = ?auto_10125 ?auto_10137 ) ) ( IS-CRATE ?auto_10125 ) ( not ( = ?auto_10124 ?auto_10129 ) ) ( not ( = ?auto_10125 ?auto_10129 ) ) ( not ( = ?auto_10137 ?auto_10129 ) ) ( not ( = ?auto_10134 ?auto_10138 ) ) ( not ( = ?auto_10126 ?auto_10134 ) ) ( HOIST-AT ?auto_10130 ?auto_10134 ) ( not ( = ?auto_10133 ?auto_10130 ) ) ( not ( = ?auto_10132 ?auto_10130 ) ) ( AVAILABLE ?auto_10130 ) ( SURFACE-AT ?auto_10125 ?auto_10134 ) ( ON ?auto_10125 ?auto_10135 ) ( CLEAR ?auto_10125 ) ( not ( = ?auto_10124 ?auto_10135 ) ) ( not ( = ?auto_10125 ?auto_10135 ) ) ( not ( = ?auto_10137 ?auto_10135 ) ) ( not ( = ?auto_10129 ?auto_10135 ) ) ( SURFACE-AT ?auto_10128 ?auto_10138 ) ( CLEAR ?auto_10128 ) ( IS-CRATE ?auto_10129 ) ( not ( = ?auto_10124 ?auto_10128 ) ) ( not ( = ?auto_10125 ?auto_10128 ) ) ( not ( = ?auto_10137 ?auto_10128 ) ) ( not ( = ?auto_10129 ?auto_10128 ) ) ( not ( = ?auto_10135 ?auto_10128 ) ) ( AVAILABLE ?auto_10133 ) ( TRUCK-AT ?auto_10131 ?auto_10127 ) ( not ( = ?auto_10127 ?auto_10138 ) ) ( not ( = ?auto_10126 ?auto_10127 ) ) ( not ( = ?auto_10134 ?auto_10127 ) ) ( HOIST-AT ?auto_10136 ?auto_10127 ) ( not ( = ?auto_10133 ?auto_10136 ) ) ( not ( = ?auto_10132 ?auto_10136 ) ) ( not ( = ?auto_10130 ?auto_10136 ) ) ( AVAILABLE ?auto_10136 ) ( SURFACE-AT ?auto_10129 ?auto_10127 ) ( ON ?auto_10129 ?auto_10139 ) ( CLEAR ?auto_10129 ) ( not ( = ?auto_10124 ?auto_10139 ) ) ( not ( = ?auto_10125 ?auto_10139 ) ) ( not ( = ?auto_10137 ?auto_10139 ) ) ( not ( = ?auto_10129 ?auto_10139 ) ) ( not ( = ?auto_10135 ?auto_10139 ) ) ( not ( = ?auto_10128 ?auto_10139 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10136 ?auto_10129 ?auto_10139 ?auto_10127 )
      ( MAKE-ON ?auto_10124 ?auto_10125 )
      ( MAKE-ON-VERIFY ?auto_10124 ?auto_10125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10140 - SURFACE
      ?auto_10141 - SURFACE
    )
    :vars
    (
      ?auto_10149 - HOIST
      ?auto_10148 - PLACE
      ?auto_10147 - PLACE
      ?auto_10142 - HOIST
      ?auto_10150 - SURFACE
      ?auto_10155 - SURFACE
      ?auto_10143 - PLACE
      ?auto_10153 - HOIST
      ?auto_10144 - SURFACE
      ?auto_10145 - SURFACE
      ?auto_10151 - PLACE
      ?auto_10154 - HOIST
      ?auto_10146 - SURFACE
      ?auto_10152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10149 ?auto_10148 ) ( IS-CRATE ?auto_10140 ) ( not ( = ?auto_10140 ?auto_10141 ) ) ( not ( = ?auto_10147 ?auto_10148 ) ) ( HOIST-AT ?auto_10142 ?auto_10147 ) ( not ( = ?auto_10149 ?auto_10142 ) ) ( AVAILABLE ?auto_10142 ) ( SURFACE-AT ?auto_10140 ?auto_10147 ) ( ON ?auto_10140 ?auto_10150 ) ( CLEAR ?auto_10140 ) ( not ( = ?auto_10140 ?auto_10150 ) ) ( not ( = ?auto_10141 ?auto_10150 ) ) ( IS-CRATE ?auto_10141 ) ( not ( = ?auto_10140 ?auto_10155 ) ) ( not ( = ?auto_10141 ?auto_10155 ) ) ( not ( = ?auto_10150 ?auto_10155 ) ) ( not ( = ?auto_10143 ?auto_10148 ) ) ( not ( = ?auto_10147 ?auto_10143 ) ) ( HOIST-AT ?auto_10153 ?auto_10143 ) ( not ( = ?auto_10149 ?auto_10153 ) ) ( not ( = ?auto_10142 ?auto_10153 ) ) ( AVAILABLE ?auto_10153 ) ( SURFACE-AT ?auto_10141 ?auto_10143 ) ( ON ?auto_10141 ?auto_10144 ) ( CLEAR ?auto_10141 ) ( not ( = ?auto_10140 ?auto_10144 ) ) ( not ( = ?auto_10141 ?auto_10144 ) ) ( not ( = ?auto_10150 ?auto_10144 ) ) ( not ( = ?auto_10155 ?auto_10144 ) ) ( SURFACE-AT ?auto_10145 ?auto_10148 ) ( CLEAR ?auto_10145 ) ( IS-CRATE ?auto_10155 ) ( not ( = ?auto_10140 ?auto_10145 ) ) ( not ( = ?auto_10141 ?auto_10145 ) ) ( not ( = ?auto_10150 ?auto_10145 ) ) ( not ( = ?auto_10155 ?auto_10145 ) ) ( not ( = ?auto_10144 ?auto_10145 ) ) ( AVAILABLE ?auto_10149 ) ( not ( = ?auto_10151 ?auto_10148 ) ) ( not ( = ?auto_10147 ?auto_10151 ) ) ( not ( = ?auto_10143 ?auto_10151 ) ) ( HOIST-AT ?auto_10154 ?auto_10151 ) ( not ( = ?auto_10149 ?auto_10154 ) ) ( not ( = ?auto_10142 ?auto_10154 ) ) ( not ( = ?auto_10153 ?auto_10154 ) ) ( AVAILABLE ?auto_10154 ) ( SURFACE-AT ?auto_10155 ?auto_10151 ) ( ON ?auto_10155 ?auto_10146 ) ( CLEAR ?auto_10155 ) ( not ( = ?auto_10140 ?auto_10146 ) ) ( not ( = ?auto_10141 ?auto_10146 ) ) ( not ( = ?auto_10150 ?auto_10146 ) ) ( not ( = ?auto_10155 ?auto_10146 ) ) ( not ( = ?auto_10144 ?auto_10146 ) ) ( not ( = ?auto_10145 ?auto_10146 ) ) ( TRUCK-AT ?auto_10152 ?auto_10148 ) )
    :subtasks
    ( ( !DRIVE ?auto_10152 ?auto_10148 ?auto_10151 )
      ( MAKE-ON ?auto_10140 ?auto_10141 )
      ( MAKE-ON-VERIFY ?auto_10140 ?auto_10141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10156 - SURFACE
      ?auto_10157 - SURFACE
    )
    :vars
    (
      ?auto_10171 - HOIST
      ?auto_10161 - PLACE
      ?auto_10169 - PLACE
      ?auto_10165 - HOIST
      ?auto_10162 - SURFACE
      ?auto_10164 - SURFACE
      ?auto_10159 - PLACE
      ?auto_10158 - HOIST
      ?auto_10160 - SURFACE
      ?auto_10163 - SURFACE
      ?auto_10168 - PLACE
      ?auto_10166 - HOIST
      ?auto_10167 - SURFACE
      ?auto_10170 - TRUCK
      ?auto_10172 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10171 ?auto_10161 ) ( IS-CRATE ?auto_10156 ) ( not ( = ?auto_10156 ?auto_10157 ) ) ( not ( = ?auto_10169 ?auto_10161 ) ) ( HOIST-AT ?auto_10165 ?auto_10169 ) ( not ( = ?auto_10171 ?auto_10165 ) ) ( AVAILABLE ?auto_10165 ) ( SURFACE-AT ?auto_10156 ?auto_10169 ) ( ON ?auto_10156 ?auto_10162 ) ( CLEAR ?auto_10156 ) ( not ( = ?auto_10156 ?auto_10162 ) ) ( not ( = ?auto_10157 ?auto_10162 ) ) ( IS-CRATE ?auto_10157 ) ( not ( = ?auto_10156 ?auto_10164 ) ) ( not ( = ?auto_10157 ?auto_10164 ) ) ( not ( = ?auto_10162 ?auto_10164 ) ) ( not ( = ?auto_10159 ?auto_10161 ) ) ( not ( = ?auto_10169 ?auto_10159 ) ) ( HOIST-AT ?auto_10158 ?auto_10159 ) ( not ( = ?auto_10171 ?auto_10158 ) ) ( not ( = ?auto_10165 ?auto_10158 ) ) ( AVAILABLE ?auto_10158 ) ( SURFACE-AT ?auto_10157 ?auto_10159 ) ( ON ?auto_10157 ?auto_10160 ) ( CLEAR ?auto_10157 ) ( not ( = ?auto_10156 ?auto_10160 ) ) ( not ( = ?auto_10157 ?auto_10160 ) ) ( not ( = ?auto_10162 ?auto_10160 ) ) ( not ( = ?auto_10164 ?auto_10160 ) ) ( IS-CRATE ?auto_10164 ) ( not ( = ?auto_10156 ?auto_10163 ) ) ( not ( = ?auto_10157 ?auto_10163 ) ) ( not ( = ?auto_10162 ?auto_10163 ) ) ( not ( = ?auto_10164 ?auto_10163 ) ) ( not ( = ?auto_10160 ?auto_10163 ) ) ( not ( = ?auto_10168 ?auto_10161 ) ) ( not ( = ?auto_10169 ?auto_10168 ) ) ( not ( = ?auto_10159 ?auto_10168 ) ) ( HOIST-AT ?auto_10166 ?auto_10168 ) ( not ( = ?auto_10171 ?auto_10166 ) ) ( not ( = ?auto_10165 ?auto_10166 ) ) ( not ( = ?auto_10158 ?auto_10166 ) ) ( AVAILABLE ?auto_10166 ) ( SURFACE-AT ?auto_10164 ?auto_10168 ) ( ON ?auto_10164 ?auto_10167 ) ( CLEAR ?auto_10164 ) ( not ( = ?auto_10156 ?auto_10167 ) ) ( not ( = ?auto_10157 ?auto_10167 ) ) ( not ( = ?auto_10162 ?auto_10167 ) ) ( not ( = ?auto_10164 ?auto_10167 ) ) ( not ( = ?auto_10160 ?auto_10167 ) ) ( not ( = ?auto_10163 ?auto_10167 ) ) ( TRUCK-AT ?auto_10170 ?auto_10161 ) ( SURFACE-AT ?auto_10172 ?auto_10161 ) ( CLEAR ?auto_10172 ) ( LIFTING ?auto_10171 ?auto_10163 ) ( IS-CRATE ?auto_10163 ) ( not ( = ?auto_10156 ?auto_10172 ) ) ( not ( = ?auto_10157 ?auto_10172 ) ) ( not ( = ?auto_10162 ?auto_10172 ) ) ( not ( = ?auto_10164 ?auto_10172 ) ) ( not ( = ?auto_10160 ?auto_10172 ) ) ( not ( = ?auto_10163 ?auto_10172 ) ) ( not ( = ?auto_10167 ?auto_10172 ) ) )
    :subtasks
    ( ( !DROP ?auto_10171 ?auto_10163 ?auto_10172 ?auto_10161 )
      ( MAKE-ON ?auto_10156 ?auto_10157 )
      ( MAKE-ON-VERIFY ?auto_10156 ?auto_10157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10173 - SURFACE
      ?auto_10174 - SURFACE
    )
    :vars
    (
      ?auto_10180 - HOIST
      ?auto_10182 - PLACE
      ?auto_10178 - PLACE
      ?auto_10175 - HOIST
      ?auto_10187 - SURFACE
      ?auto_10188 - SURFACE
      ?auto_10181 - PLACE
      ?auto_10185 - HOIST
      ?auto_10184 - SURFACE
      ?auto_10179 - SURFACE
      ?auto_10176 - PLACE
      ?auto_10177 - HOIST
      ?auto_10186 - SURFACE
      ?auto_10183 - TRUCK
      ?auto_10189 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10180 ?auto_10182 ) ( IS-CRATE ?auto_10173 ) ( not ( = ?auto_10173 ?auto_10174 ) ) ( not ( = ?auto_10178 ?auto_10182 ) ) ( HOIST-AT ?auto_10175 ?auto_10178 ) ( not ( = ?auto_10180 ?auto_10175 ) ) ( AVAILABLE ?auto_10175 ) ( SURFACE-AT ?auto_10173 ?auto_10178 ) ( ON ?auto_10173 ?auto_10187 ) ( CLEAR ?auto_10173 ) ( not ( = ?auto_10173 ?auto_10187 ) ) ( not ( = ?auto_10174 ?auto_10187 ) ) ( IS-CRATE ?auto_10174 ) ( not ( = ?auto_10173 ?auto_10188 ) ) ( not ( = ?auto_10174 ?auto_10188 ) ) ( not ( = ?auto_10187 ?auto_10188 ) ) ( not ( = ?auto_10181 ?auto_10182 ) ) ( not ( = ?auto_10178 ?auto_10181 ) ) ( HOIST-AT ?auto_10185 ?auto_10181 ) ( not ( = ?auto_10180 ?auto_10185 ) ) ( not ( = ?auto_10175 ?auto_10185 ) ) ( AVAILABLE ?auto_10185 ) ( SURFACE-AT ?auto_10174 ?auto_10181 ) ( ON ?auto_10174 ?auto_10184 ) ( CLEAR ?auto_10174 ) ( not ( = ?auto_10173 ?auto_10184 ) ) ( not ( = ?auto_10174 ?auto_10184 ) ) ( not ( = ?auto_10187 ?auto_10184 ) ) ( not ( = ?auto_10188 ?auto_10184 ) ) ( IS-CRATE ?auto_10188 ) ( not ( = ?auto_10173 ?auto_10179 ) ) ( not ( = ?auto_10174 ?auto_10179 ) ) ( not ( = ?auto_10187 ?auto_10179 ) ) ( not ( = ?auto_10188 ?auto_10179 ) ) ( not ( = ?auto_10184 ?auto_10179 ) ) ( not ( = ?auto_10176 ?auto_10182 ) ) ( not ( = ?auto_10178 ?auto_10176 ) ) ( not ( = ?auto_10181 ?auto_10176 ) ) ( HOIST-AT ?auto_10177 ?auto_10176 ) ( not ( = ?auto_10180 ?auto_10177 ) ) ( not ( = ?auto_10175 ?auto_10177 ) ) ( not ( = ?auto_10185 ?auto_10177 ) ) ( AVAILABLE ?auto_10177 ) ( SURFACE-AT ?auto_10188 ?auto_10176 ) ( ON ?auto_10188 ?auto_10186 ) ( CLEAR ?auto_10188 ) ( not ( = ?auto_10173 ?auto_10186 ) ) ( not ( = ?auto_10174 ?auto_10186 ) ) ( not ( = ?auto_10187 ?auto_10186 ) ) ( not ( = ?auto_10188 ?auto_10186 ) ) ( not ( = ?auto_10184 ?auto_10186 ) ) ( not ( = ?auto_10179 ?auto_10186 ) ) ( TRUCK-AT ?auto_10183 ?auto_10182 ) ( SURFACE-AT ?auto_10189 ?auto_10182 ) ( CLEAR ?auto_10189 ) ( IS-CRATE ?auto_10179 ) ( not ( = ?auto_10173 ?auto_10189 ) ) ( not ( = ?auto_10174 ?auto_10189 ) ) ( not ( = ?auto_10187 ?auto_10189 ) ) ( not ( = ?auto_10188 ?auto_10189 ) ) ( not ( = ?auto_10184 ?auto_10189 ) ) ( not ( = ?auto_10179 ?auto_10189 ) ) ( not ( = ?auto_10186 ?auto_10189 ) ) ( AVAILABLE ?auto_10180 ) ( IN ?auto_10179 ?auto_10183 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10180 ?auto_10179 ?auto_10183 ?auto_10182 )
      ( MAKE-ON ?auto_10173 ?auto_10174 )
      ( MAKE-ON-VERIFY ?auto_10173 ?auto_10174 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10190 - SURFACE
      ?auto_10191 - SURFACE
    )
    :vars
    (
      ?auto_10192 - HOIST
      ?auto_10193 - PLACE
      ?auto_10199 - PLACE
      ?auto_10198 - HOIST
      ?auto_10205 - SURFACE
      ?auto_10204 - SURFACE
      ?auto_10194 - PLACE
      ?auto_10202 - HOIST
      ?auto_10200 - SURFACE
      ?auto_10201 - SURFACE
      ?auto_10203 - PLACE
      ?auto_10206 - HOIST
      ?auto_10196 - SURFACE
      ?auto_10197 - SURFACE
      ?auto_10195 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10192 ?auto_10193 ) ( IS-CRATE ?auto_10190 ) ( not ( = ?auto_10190 ?auto_10191 ) ) ( not ( = ?auto_10199 ?auto_10193 ) ) ( HOIST-AT ?auto_10198 ?auto_10199 ) ( not ( = ?auto_10192 ?auto_10198 ) ) ( AVAILABLE ?auto_10198 ) ( SURFACE-AT ?auto_10190 ?auto_10199 ) ( ON ?auto_10190 ?auto_10205 ) ( CLEAR ?auto_10190 ) ( not ( = ?auto_10190 ?auto_10205 ) ) ( not ( = ?auto_10191 ?auto_10205 ) ) ( IS-CRATE ?auto_10191 ) ( not ( = ?auto_10190 ?auto_10204 ) ) ( not ( = ?auto_10191 ?auto_10204 ) ) ( not ( = ?auto_10205 ?auto_10204 ) ) ( not ( = ?auto_10194 ?auto_10193 ) ) ( not ( = ?auto_10199 ?auto_10194 ) ) ( HOIST-AT ?auto_10202 ?auto_10194 ) ( not ( = ?auto_10192 ?auto_10202 ) ) ( not ( = ?auto_10198 ?auto_10202 ) ) ( AVAILABLE ?auto_10202 ) ( SURFACE-AT ?auto_10191 ?auto_10194 ) ( ON ?auto_10191 ?auto_10200 ) ( CLEAR ?auto_10191 ) ( not ( = ?auto_10190 ?auto_10200 ) ) ( not ( = ?auto_10191 ?auto_10200 ) ) ( not ( = ?auto_10205 ?auto_10200 ) ) ( not ( = ?auto_10204 ?auto_10200 ) ) ( IS-CRATE ?auto_10204 ) ( not ( = ?auto_10190 ?auto_10201 ) ) ( not ( = ?auto_10191 ?auto_10201 ) ) ( not ( = ?auto_10205 ?auto_10201 ) ) ( not ( = ?auto_10204 ?auto_10201 ) ) ( not ( = ?auto_10200 ?auto_10201 ) ) ( not ( = ?auto_10203 ?auto_10193 ) ) ( not ( = ?auto_10199 ?auto_10203 ) ) ( not ( = ?auto_10194 ?auto_10203 ) ) ( HOIST-AT ?auto_10206 ?auto_10203 ) ( not ( = ?auto_10192 ?auto_10206 ) ) ( not ( = ?auto_10198 ?auto_10206 ) ) ( not ( = ?auto_10202 ?auto_10206 ) ) ( AVAILABLE ?auto_10206 ) ( SURFACE-AT ?auto_10204 ?auto_10203 ) ( ON ?auto_10204 ?auto_10196 ) ( CLEAR ?auto_10204 ) ( not ( = ?auto_10190 ?auto_10196 ) ) ( not ( = ?auto_10191 ?auto_10196 ) ) ( not ( = ?auto_10205 ?auto_10196 ) ) ( not ( = ?auto_10204 ?auto_10196 ) ) ( not ( = ?auto_10200 ?auto_10196 ) ) ( not ( = ?auto_10201 ?auto_10196 ) ) ( SURFACE-AT ?auto_10197 ?auto_10193 ) ( CLEAR ?auto_10197 ) ( IS-CRATE ?auto_10201 ) ( not ( = ?auto_10190 ?auto_10197 ) ) ( not ( = ?auto_10191 ?auto_10197 ) ) ( not ( = ?auto_10205 ?auto_10197 ) ) ( not ( = ?auto_10204 ?auto_10197 ) ) ( not ( = ?auto_10200 ?auto_10197 ) ) ( not ( = ?auto_10201 ?auto_10197 ) ) ( not ( = ?auto_10196 ?auto_10197 ) ) ( AVAILABLE ?auto_10192 ) ( IN ?auto_10201 ?auto_10195 ) ( TRUCK-AT ?auto_10195 ?auto_10203 ) )
    :subtasks
    ( ( !DRIVE ?auto_10195 ?auto_10203 ?auto_10193 )
      ( MAKE-ON ?auto_10190 ?auto_10191 )
      ( MAKE-ON-VERIFY ?auto_10190 ?auto_10191 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10207 - SURFACE
      ?auto_10208 - SURFACE
    )
    :vars
    (
      ?auto_10209 - HOIST
      ?auto_10221 - PLACE
      ?auto_10218 - PLACE
      ?auto_10215 - HOIST
      ?auto_10216 - SURFACE
      ?auto_10214 - SURFACE
      ?auto_10220 - PLACE
      ?auto_10212 - HOIST
      ?auto_10210 - SURFACE
      ?auto_10222 - SURFACE
      ?auto_10213 - PLACE
      ?auto_10217 - HOIST
      ?auto_10223 - SURFACE
      ?auto_10219 - SURFACE
      ?auto_10211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10209 ?auto_10221 ) ( IS-CRATE ?auto_10207 ) ( not ( = ?auto_10207 ?auto_10208 ) ) ( not ( = ?auto_10218 ?auto_10221 ) ) ( HOIST-AT ?auto_10215 ?auto_10218 ) ( not ( = ?auto_10209 ?auto_10215 ) ) ( AVAILABLE ?auto_10215 ) ( SURFACE-AT ?auto_10207 ?auto_10218 ) ( ON ?auto_10207 ?auto_10216 ) ( CLEAR ?auto_10207 ) ( not ( = ?auto_10207 ?auto_10216 ) ) ( not ( = ?auto_10208 ?auto_10216 ) ) ( IS-CRATE ?auto_10208 ) ( not ( = ?auto_10207 ?auto_10214 ) ) ( not ( = ?auto_10208 ?auto_10214 ) ) ( not ( = ?auto_10216 ?auto_10214 ) ) ( not ( = ?auto_10220 ?auto_10221 ) ) ( not ( = ?auto_10218 ?auto_10220 ) ) ( HOIST-AT ?auto_10212 ?auto_10220 ) ( not ( = ?auto_10209 ?auto_10212 ) ) ( not ( = ?auto_10215 ?auto_10212 ) ) ( AVAILABLE ?auto_10212 ) ( SURFACE-AT ?auto_10208 ?auto_10220 ) ( ON ?auto_10208 ?auto_10210 ) ( CLEAR ?auto_10208 ) ( not ( = ?auto_10207 ?auto_10210 ) ) ( not ( = ?auto_10208 ?auto_10210 ) ) ( not ( = ?auto_10216 ?auto_10210 ) ) ( not ( = ?auto_10214 ?auto_10210 ) ) ( IS-CRATE ?auto_10214 ) ( not ( = ?auto_10207 ?auto_10222 ) ) ( not ( = ?auto_10208 ?auto_10222 ) ) ( not ( = ?auto_10216 ?auto_10222 ) ) ( not ( = ?auto_10214 ?auto_10222 ) ) ( not ( = ?auto_10210 ?auto_10222 ) ) ( not ( = ?auto_10213 ?auto_10221 ) ) ( not ( = ?auto_10218 ?auto_10213 ) ) ( not ( = ?auto_10220 ?auto_10213 ) ) ( HOIST-AT ?auto_10217 ?auto_10213 ) ( not ( = ?auto_10209 ?auto_10217 ) ) ( not ( = ?auto_10215 ?auto_10217 ) ) ( not ( = ?auto_10212 ?auto_10217 ) ) ( SURFACE-AT ?auto_10214 ?auto_10213 ) ( ON ?auto_10214 ?auto_10223 ) ( CLEAR ?auto_10214 ) ( not ( = ?auto_10207 ?auto_10223 ) ) ( not ( = ?auto_10208 ?auto_10223 ) ) ( not ( = ?auto_10216 ?auto_10223 ) ) ( not ( = ?auto_10214 ?auto_10223 ) ) ( not ( = ?auto_10210 ?auto_10223 ) ) ( not ( = ?auto_10222 ?auto_10223 ) ) ( SURFACE-AT ?auto_10219 ?auto_10221 ) ( CLEAR ?auto_10219 ) ( IS-CRATE ?auto_10222 ) ( not ( = ?auto_10207 ?auto_10219 ) ) ( not ( = ?auto_10208 ?auto_10219 ) ) ( not ( = ?auto_10216 ?auto_10219 ) ) ( not ( = ?auto_10214 ?auto_10219 ) ) ( not ( = ?auto_10210 ?auto_10219 ) ) ( not ( = ?auto_10222 ?auto_10219 ) ) ( not ( = ?auto_10223 ?auto_10219 ) ) ( AVAILABLE ?auto_10209 ) ( TRUCK-AT ?auto_10211 ?auto_10213 ) ( LIFTING ?auto_10217 ?auto_10222 ) )
    :subtasks
    ( ( !LOAD ?auto_10217 ?auto_10222 ?auto_10211 ?auto_10213 )
      ( MAKE-ON ?auto_10207 ?auto_10208 )
      ( MAKE-ON-VERIFY ?auto_10207 ?auto_10208 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10224 - SURFACE
      ?auto_10225 - SURFACE
    )
    :vars
    (
      ?auto_10227 - HOIST
      ?auto_10236 - PLACE
      ?auto_10229 - PLACE
      ?auto_10235 - HOIST
      ?auto_10238 - SURFACE
      ?auto_10237 - SURFACE
      ?auto_10230 - PLACE
      ?auto_10226 - HOIST
      ?auto_10240 - SURFACE
      ?auto_10234 - SURFACE
      ?auto_10231 - PLACE
      ?auto_10233 - HOIST
      ?auto_10228 - SURFACE
      ?auto_10232 - SURFACE
      ?auto_10239 - TRUCK
      ?auto_10241 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10227 ?auto_10236 ) ( IS-CRATE ?auto_10224 ) ( not ( = ?auto_10224 ?auto_10225 ) ) ( not ( = ?auto_10229 ?auto_10236 ) ) ( HOIST-AT ?auto_10235 ?auto_10229 ) ( not ( = ?auto_10227 ?auto_10235 ) ) ( AVAILABLE ?auto_10235 ) ( SURFACE-AT ?auto_10224 ?auto_10229 ) ( ON ?auto_10224 ?auto_10238 ) ( CLEAR ?auto_10224 ) ( not ( = ?auto_10224 ?auto_10238 ) ) ( not ( = ?auto_10225 ?auto_10238 ) ) ( IS-CRATE ?auto_10225 ) ( not ( = ?auto_10224 ?auto_10237 ) ) ( not ( = ?auto_10225 ?auto_10237 ) ) ( not ( = ?auto_10238 ?auto_10237 ) ) ( not ( = ?auto_10230 ?auto_10236 ) ) ( not ( = ?auto_10229 ?auto_10230 ) ) ( HOIST-AT ?auto_10226 ?auto_10230 ) ( not ( = ?auto_10227 ?auto_10226 ) ) ( not ( = ?auto_10235 ?auto_10226 ) ) ( AVAILABLE ?auto_10226 ) ( SURFACE-AT ?auto_10225 ?auto_10230 ) ( ON ?auto_10225 ?auto_10240 ) ( CLEAR ?auto_10225 ) ( not ( = ?auto_10224 ?auto_10240 ) ) ( not ( = ?auto_10225 ?auto_10240 ) ) ( not ( = ?auto_10238 ?auto_10240 ) ) ( not ( = ?auto_10237 ?auto_10240 ) ) ( IS-CRATE ?auto_10237 ) ( not ( = ?auto_10224 ?auto_10234 ) ) ( not ( = ?auto_10225 ?auto_10234 ) ) ( not ( = ?auto_10238 ?auto_10234 ) ) ( not ( = ?auto_10237 ?auto_10234 ) ) ( not ( = ?auto_10240 ?auto_10234 ) ) ( not ( = ?auto_10231 ?auto_10236 ) ) ( not ( = ?auto_10229 ?auto_10231 ) ) ( not ( = ?auto_10230 ?auto_10231 ) ) ( HOIST-AT ?auto_10233 ?auto_10231 ) ( not ( = ?auto_10227 ?auto_10233 ) ) ( not ( = ?auto_10235 ?auto_10233 ) ) ( not ( = ?auto_10226 ?auto_10233 ) ) ( SURFACE-AT ?auto_10237 ?auto_10231 ) ( ON ?auto_10237 ?auto_10228 ) ( CLEAR ?auto_10237 ) ( not ( = ?auto_10224 ?auto_10228 ) ) ( not ( = ?auto_10225 ?auto_10228 ) ) ( not ( = ?auto_10238 ?auto_10228 ) ) ( not ( = ?auto_10237 ?auto_10228 ) ) ( not ( = ?auto_10240 ?auto_10228 ) ) ( not ( = ?auto_10234 ?auto_10228 ) ) ( SURFACE-AT ?auto_10232 ?auto_10236 ) ( CLEAR ?auto_10232 ) ( IS-CRATE ?auto_10234 ) ( not ( = ?auto_10224 ?auto_10232 ) ) ( not ( = ?auto_10225 ?auto_10232 ) ) ( not ( = ?auto_10238 ?auto_10232 ) ) ( not ( = ?auto_10237 ?auto_10232 ) ) ( not ( = ?auto_10240 ?auto_10232 ) ) ( not ( = ?auto_10234 ?auto_10232 ) ) ( not ( = ?auto_10228 ?auto_10232 ) ) ( AVAILABLE ?auto_10227 ) ( TRUCK-AT ?auto_10239 ?auto_10231 ) ( AVAILABLE ?auto_10233 ) ( SURFACE-AT ?auto_10234 ?auto_10231 ) ( ON ?auto_10234 ?auto_10241 ) ( CLEAR ?auto_10234 ) ( not ( = ?auto_10224 ?auto_10241 ) ) ( not ( = ?auto_10225 ?auto_10241 ) ) ( not ( = ?auto_10238 ?auto_10241 ) ) ( not ( = ?auto_10237 ?auto_10241 ) ) ( not ( = ?auto_10240 ?auto_10241 ) ) ( not ( = ?auto_10234 ?auto_10241 ) ) ( not ( = ?auto_10228 ?auto_10241 ) ) ( not ( = ?auto_10232 ?auto_10241 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10233 ?auto_10234 ?auto_10241 ?auto_10231 )
      ( MAKE-ON ?auto_10224 ?auto_10225 )
      ( MAKE-ON-VERIFY ?auto_10224 ?auto_10225 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10242 - SURFACE
      ?auto_10243 - SURFACE
    )
    :vars
    (
      ?auto_10250 - HOIST
      ?auto_10245 - PLACE
      ?auto_10251 - PLACE
      ?auto_10256 - HOIST
      ?auto_10244 - SURFACE
      ?auto_10253 - SURFACE
      ?auto_10255 - PLACE
      ?auto_10249 - HOIST
      ?auto_10258 - SURFACE
      ?auto_10254 - SURFACE
      ?auto_10248 - PLACE
      ?auto_10247 - HOIST
      ?auto_10252 - SURFACE
      ?auto_10259 - SURFACE
      ?auto_10257 - SURFACE
      ?auto_10246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10250 ?auto_10245 ) ( IS-CRATE ?auto_10242 ) ( not ( = ?auto_10242 ?auto_10243 ) ) ( not ( = ?auto_10251 ?auto_10245 ) ) ( HOIST-AT ?auto_10256 ?auto_10251 ) ( not ( = ?auto_10250 ?auto_10256 ) ) ( AVAILABLE ?auto_10256 ) ( SURFACE-AT ?auto_10242 ?auto_10251 ) ( ON ?auto_10242 ?auto_10244 ) ( CLEAR ?auto_10242 ) ( not ( = ?auto_10242 ?auto_10244 ) ) ( not ( = ?auto_10243 ?auto_10244 ) ) ( IS-CRATE ?auto_10243 ) ( not ( = ?auto_10242 ?auto_10253 ) ) ( not ( = ?auto_10243 ?auto_10253 ) ) ( not ( = ?auto_10244 ?auto_10253 ) ) ( not ( = ?auto_10255 ?auto_10245 ) ) ( not ( = ?auto_10251 ?auto_10255 ) ) ( HOIST-AT ?auto_10249 ?auto_10255 ) ( not ( = ?auto_10250 ?auto_10249 ) ) ( not ( = ?auto_10256 ?auto_10249 ) ) ( AVAILABLE ?auto_10249 ) ( SURFACE-AT ?auto_10243 ?auto_10255 ) ( ON ?auto_10243 ?auto_10258 ) ( CLEAR ?auto_10243 ) ( not ( = ?auto_10242 ?auto_10258 ) ) ( not ( = ?auto_10243 ?auto_10258 ) ) ( not ( = ?auto_10244 ?auto_10258 ) ) ( not ( = ?auto_10253 ?auto_10258 ) ) ( IS-CRATE ?auto_10253 ) ( not ( = ?auto_10242 ?auto_10254 ) ) ( not ( = ?auto_10243 ?auto_10254 ) ) ( not ( = ?auto_10244 ?auto_10254 ) ) ( not ( = ?auto_10253 ?auto_10254 ) ) ( not ( = ?auto_10258 ?auto_10254 ) ) ( not ( = ?auto_10248 ?auto_10245 ) ) ( not ( = ?auto_10251 ?auto_10248 ) ) ( not ( = ?auto_10255 ?auto_10248 ) ) ( HOIST-AT ?auto_10247 ?auto_10248 ) ( not ( = ?auto_10250 ?auto_10247 ) ) ( not ( = ?auto_10256 ?auto_10247 ) ) ( not ( = ?auto_10249 ?auto_10247 ) ) ( SURFACE-AT ?auto_10253 ?auto_10248 ) ( ON ?auto_10253 ?auto_10252 ) ( CLEAR ?auto_10253 ) ( not ( = ?auto_10242 ?auto_10252 ) ) ( not ( = ?auto_10243 ?auto_10252 ) ) ( not ( = ?auto_10244 ?auto_10252 ) ) ( not ( = ?auto_10253 ?auto_10252 ) ) ( not ( = ?auto_10258 ?auto_10252 ) ) ( not ( = ?auto_10254 ?auto_10252 ) ) ( SURFACE-AT ?auto_10259 ?auto_10245 ) ( CLEAR ?auto_10259 ) ( IS-CRATE ?auto_10254 ) ( not ( = ?auto_10242 ?auto_10259 ) ) ( not ( = ?auto_10243 ?auto_10259 ) ) ( not ( = ?auto_10244 ?auto_10259 ) ) ( not ( = ?auto_10253 ?auto_10259 ) ) ( not ( = ?auto_10258 ?auto_10259 ) ) ( not ( = ?auto_10254 ?auto_10259 ) ) ( not ( = ?auto_10252 ?auto_10259 ) ) ( AVAILABLE ?auto_10250 ) ( AVAILABLE ?auto_10247 ) ( SURFACE-AT ?auto_10254 ?auto_10248 ) ( ON ?auto_10254 ?auto_10257 ) ( CLEAR ?auto_10254 ) ( not ( = ?auto_10242 ?auto_10257 ) ) ( not ( = ?auto_10243 ?auto_10257 ) ) ( not ( = ?auto_10244 ?auto_10257 ) ) ( not ( = ?auto_10253 ?auto_10257 ) ) ( not ( = ?auto_10258 ?auto_10257 ) ) ( not ( = ?auto_10254 ?auto_10257 ) ) ( not ( = ?auto_10252 ?auto_10257 ) ) ( not ( = ?auto_10259 ?auto_10257 ) ) ( TRUCK-AT ?auto_10246 ?auto_10245 ) )
    :subtasks
    ( ( !DRIVE ?auto_10246 ?auto_10245 ?auto_10248 )
      ( MAKE-ON ?auto_10242 ?auto_10243 )
      ( MAKE-ON-VERIFY ?auto_10242 ?auto_10243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10260 - SURFACE
      ?auto_10261 - SURFACE
    )
    :vars
    (
      ?auto_10265 - HOIST
      ?auto_10266 - PLACE
      ?auto_10275 - PLACE
      ?auto_10277 - HOIST
      ?auto_10263 - SURFACE
      ?auto_10272 - SURFACE
      ?auto_10276 - PLACE
      ?auto_10264 - HOIST
      ?auto_10273 - SURFACE
      ?auto_10274 - SURFACE
      ?auto_10267 - PLACE
      ?auto_10268 - HOIST
      ?auto_10262 - SURFACE
      ?auto_10271 - SURFACE
      ?auto_10270 - SURFACE
      ?auto_10269 - TRUCK
      ?auto_10278 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10265 ?auto_10266 ) ( IS-CRATE ?auto_10260 ) ( not ( = ?auto_10260 ?auto_10261 ) ) ( not ( = ?auto_10275 ?auto_10266 ) ) ( HOIST-AT ?auto_10277 ?auto_10275 ) ( not ( = ?auto_10265 ?auto_10277 ) ) ( AVAILABLE ?auto_10277 ) ( SURFACE-AT ?auto_10260 ?auto_10275 ) ( ON ?auto_10260 ?auto_10263 ) ( CLEAR ?auto_10260 ) ( not ( = ?auto_10260 ?auto_10263 ) ) ( not ( = ?auto_10261 ?auto_10263 ) ) ( IS-CRATE ?auto_10261 ) ( not ( = ?auto_10260 ?auto_10272 ) ) ( not ( = ?auto_10261 ?auto_10272 ) ) ( not ( = ?auto_10263 ?auto_10272 ) ) ( not ( = ?auto_10276 ?auto_10266 ) ) ( not ( = ?auto_10275 ?auto_10276 ) ) ( HOIST-AT ?auto_10264 ?auto_10276 ) ( not ( = ?auto_10265 ?auto_10264 ) ) ( not ( = ?auto_10277 ?auto_10264 ) ) ( AVAILABLE ?auto_10264 ) ( SURFACE-AT ?auto_10261 ?auto_10276 ) ( ON ?auto_10261 ?auto_10273 ) ( CLEAR ?auto_10261 ) ( not ( = ?auto_10260 ?auto_10273 ) ) ( not ( = ?auto_10261 ?auto_10273 ) ) ( not ( = ?auto_10263 ?auto_10273 ) ) ( not ( = ?auto_10272 ?auto_10273 ) ) ( IS-CRATE ?auto_10272 ) ( not ( = ?auto_10260 ?auto_10274 ) ) ( not ( = ?auto_10261 ?auto_10274 ) ) ( not ( = ?auto_10263 ?auto_10274 ) ) ( not ( = ?auto_10272 ?auto_10274 ) ) ( not ( = ?auto_10273 ?auto_10274 ) ) ( not ( = ?auto_10267 ?auto_10266 ) ) ( not ( = ?auto_10275 ?auto_10267 ) ) ( not ( = ?auto_10276 ?auto_10267 ) ) ( HOIST-AT ?auto_10268 ?auto_10267 ) ( not ( = ?auto_10265 ?auto_10268 ) ) ( not ( = ?auto_10277 ?auto_10268 ) ) ( not ( = ?auto_10264 ?auto_10268 ) ) ( SURFACE-AT ?auto_10272 ?auto_10267 ) ( ON ?auto_10272 ?auto_10262 ) ( CLEAR ?auto_10272 ) ( not ( = ?auto_10260 ?auto_10262 ) ) ( not ( = ?auto_10261 ?auto_10262 ) ) ( not ( = ?auto_10263 ?auto_10262 ) ) ( not ( = ?auto_10272 ?auto_10262 ) ) ( not ( = ?auto_10273 ?auto_10262 ) ) ( not ( = ?auto_10274 ?auto_10262 ) ) ( IS-CRATE ?auto_10274 ) ( not ( = ?auto_10260 ?auto_10271 ) ) ( not ( = ?auto_10261 ?auto_10271 ) ) ( not ( = ?auto_10263 ?auto_10271 ) ) ( not ( = ?auto_10272 ?auto_10271 ) ) ( not ( = ?auto_10273 ?auto_10271 ) ) ( not ( = ?auto_10274 ?auto_10271 ) ) ( not ( = ?auto_10262 ?auto_10271 ) ) ( AVAILABLE ?auto_10268 ) ( SURFACE-AT ?auto_10274 ?auto_10267 ) ( ON ?auto_10274 ?auto_10270 ) ( CLEAR ?auto_10274 ) ( not ( = ?auto_10260 ?auto_10270 ) ) ( not ( = ?auto_10261 ?auto_10270 ) ) ( not ( = ?auto_10263 ?auto_10270 ) ) ( not ( = ?auto_10272 ?auto_10270 ) ) ( not ( = ?auto_10273 ?auto_10270 ) ) ( not ( = ?auto_10274 ?auto_10270 ) ) ( not ( = ?auto_10262 ?auto_10270 ) ) ( not ( = ?auto_10271 ?auto_10270 ) ) ( TRUCK-AT ?auto_10269 ?auto_10266 ) ( SURFACE-AT ?auto_10278 ?auto_10266 ) ( CLEAR ?auto_10278 ) ( LIFTING ?auto_10265 ?auto_10271 ) ( IS-CRATE ?auto_10271 ) ( not ( = ?auto_10260 ?auto_10278 ) ) ( not ( = ?auto_10261 ?auto_10278 ) ) ( not ( = ?auto_10263 ?auto_10278 ) ) ( not ( = ?auto_10272 ?auto_10278 ) ) ( not ( = ?auto_10273 ?auto_10278 ) ) ( not ( = ?auto_10274 ?auto_10278 ) ) ( not ( = ?auto_10262 ?auto_10278 ) ) ( not ( = ?auto_10271 ?auto_10278 ) ) ( not ( = ?auto_10270 ?auto_10278 ) ) )
    :subtasks
    ( ( !DROP ?auto_10265 ?auto_10271 ?auto_10278 ?auto_10266 )
      ( MAKE-ON ?auto_10260 ?auto_10261 )
      ( MAKE-ON-VERIFY ?auto_10260 ?auto_10261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10279 - SURFACE
      ?auto_10280 - SURFACE
    )
    :vars
    (
      ?auto_10284 - HOIST
      ?auto_10283 - PLACE
      ?auto_10285 - PLACE
      ?auto_10290 - HOIST
      ?auto_10288 - SURFACE
      ?auto_10281 - SURFACE
      ?auto_10293 - PLACE
      ?auto_10289 - HOIST
      ?auto_10297 - SURFACE
      ?auto_10291 - SURFACE
      ?auto_10282 - PLACE
      ?auto_10287 - HOIST
      ?auto_10296 - SURFACE
      ?auto_10292 - SURFACE
      ?auto_10295 - SURFACE
      ?auto_10286 - TRUCK
      ?auto_10294 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10284 ?auto_10283 ) ( IS-CRATE ?auto_10279 ) ( not ( = ?auto_10279 ?auto_10280 ) ) ( not ( = ?auto_10285 ?auto_10283 ) ) ( HOIST-AT ?auto_10290 ?auto_10285 ) ( not ( = ?auto_10284 ?auto_10290 ) ) ( AVAILABLE ?auto_10290 ) ( SURFACE-AT ?auto_10279 ?auto_10285 ) ( ON ?auto_10279 ?auto_10288 ) ( CLEAR ?auto_10279 ) ( not ( = ?auto_10279 ?auto_10288 ) ) ( not ( = ?auto_10280 ?auto_10288 ) ) ( IS-CRATE ?auto_10280 ) ( not ( = ?auto_10279 ?auto_10281 ) ) ( not ( = ?auto_10280 ?auto_10281 ) ) ( not ( = ?auto_10288 ?auto_10281 ) ) ( not ( = ?auto_10293 ?auto_10283 ) ) ( not ( = ?auto_10285 ?auto_10293 ) ) ( HOIST-AT ?auto_10289 ?auto_10293 ) ( not ( = ?auto_10284 ?auto_10289 ) ) ( not ( = ?auto_10290 ?auto_10289 ) ) ( AVAILABLE ?auto_10289 ) ( SURFACE-AT ?auto_10280 ?auto_10293 ) ( ON ?auto_10280 ?auto_10297 ) ( CLEAR ?auto_10280 ) ( not ( = ?auto_10279 ?auto_10297 ) ) ( not ( = ?auto_10280 ?auto_10297 ) ) ( not ( = ?auto_10288 ?auto_10297 ) ) ( not ( = ?auto_10281 ?auto_10297 ) ) ( IS-CRATE ?auto_10281 ) ( not ( = ?auto_10279 ?auto_10291 ) ) ( not ( = ?auto_10280 ?auto_10291 ) ) ( not ( = ?auto_10288 ?auto_10291 ) ) ( not ( = ?auto_10281 ?auto_10291 ) ) ( not ( = ?auto_10297 ?auto_10291 ) ) ( not ( = ?auto_10282 ?auto_10283 ) ) ( not ( = ?auto_10285 ?auto_10282 ) ) ( not ( = ?auto_10293 ?auto_10282 ) ) ( HOIST-AT ?auto_10287 ?auto_10282 ) ( not ( = ?auto_10284 ?auto_10287 ) ) ( not ( = ?auto_10290 ?auto_10287 ) ) ( not ( = ?auto_10289 ?auto_10287 ) ) ( SURFACE-AT ?auto_10281 ?auto_10282 ) ( ON ?auto_10281 ?auto_10296 ) ( CLEAR ?auto_10281 ) ( not ( = ?auto_10279 ?auto_10296 ) ) ( not ( = ?auto_10280 ?auto_10296 ) ) ( not ( = ?auto_10288 ?auto_10296 ) ) ( not ( = ?auto_10281 ?auto_10296 ) ) ( not ( = ?auto_10297 ?auto_10296 ) ) ( not ( = ?auto_10291 ?auto_10296 ) ) ( IS-CRATE ?auto_10291 ) ( not ( = ?auto_10279 ?auto_10292 ) ) ( not ( = ?auto_10280 ?auto_10292 ) ) ( not ( = ?auto_10288 ?auto_10292 ) ) ( not ( = ?auto_10281 ?auto_10292 ) ) ( not ( = ?auto_10297 ?auto_10292 ) ) ( not ( = ?auto_10291 ?auto_10292 ) ) ( not ( = ?auto_10296 ?auto_10292 ) ) ( AVAILABLE ?auto_10287 ) ( SURFACE-AT ?auto_10291 ?auto_10282 ) ( ON ?auto_10291 ?auto_10295 ) ( CLEAR ?auto_10291 ) ( not ( = ?auto_10279 ?auto_10295 ) ) ( not ( = ?auto_10280 ?auto_10295 ) ) ( not ( = ?auto_10288 ?auto_10295 ) ) ( not ( = ?auto_10281 ?auto_10295 ) ) ( not ( = ?auto_10297 ?auto_10295 ) ) ( not ( = ?auto_10291 ?auto_10295 ) ) ( not ( = ?auto_10296 ?auto_10295 ) ) ( not ( = ?auto_10292 ?auto_10295 ) ) ( TRUCK-AT ?auto_10286 ?auto_10283 ) ( SURFACE-AT ?auto_10294 ?auto_10283 ) ( CLEAR ?auto_10294 ) ( IS-CRATE ?auto_10292 ) ( not ( = ?auto_10279 ?auto_10294 ) ) ( not ( = ?auto_10280 ?auto_10294 ) ) ( not ( = ?auto_10288 ?auto_10294 ) ) ( not ( = ?auto_10281 ?auto_10294 ) ) ( not ( = ?auto_10297 ?auto_10294 ) ) ( not ( = ?auto_10291 ?auto_10294 ) ) ( not ( = ?auto_10296 ?auto_10294 ) ) ( not ( = ?auto_10292 ?auto_10294 ) ) ( not ( = ?auto_10295 ?auto_10294 ) ) ( AVAILABLE ?auto_10284 ) ( IN ?auto_10292 ?auto_10286 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10284 ?auto_10292 ?auto_10286 ?auto_10283 )
      ( MAKE-ON ?auto_10279 ?auto_10280 )
      ( MAKE-ON-VERIFY ?auto_10279 ?auto_10280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10298 - SURFACE
      ?auto_10299 - SURFACE
    )
    :vars
    (
      ?auto_10305 - HOIST
      ?auto_10304 - PLACE
      ?auto_10309 - PLACE
      ?auto_10303 - HOIST
      ?auto_10306 - SURFACE
      ?auto_10310 - SURFACE
      ?auto_10314 - PLACE
      ?auto_10315 - HOIST
      ?auto_10312 - SURFACE
      ?auto_10301 - SURFACE
      ?auto_10308 - PLACE
      ?auto_10300 - HOIST
      ?auto_10313 - SURFACE
      ?auto_10316 - SURFACE
      ?auto_10311 - SURFACE
      ?auto_10307 - SURFACE
      ?auto_10302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10305 ?auto_10304 ) ( IS-CRATE ?auto_10298 ) ( not ( = ?auto_10298 ?auto_10299 ) ) ( not ( = ?auto_10309 ?auto_10304 ) ) ( HOIST-AT ?auto_10303 ?auto_10309 ) ( not ( = ?auto_10305 ?auto_10303 ) ) ( AVAILABLE ?auto_10303 ) ( SURFACE-AT ?auto_10298 ?auto_10309 ) ( ON ?auto_10298 ?auto_10306 ) ( CLEAR ?auto_10298 ) ( not ( = ?auto_10298 ?auto_10306 ) ) ( not ( = ?auto_10299 ?auto_10306 ) ) ( IS-CRATE ?auto_10299 ) ( not ( = ?auto_10298 ?auto_10310 ) ) ( not ( = ?auto_10299 ?auto_10310 ) ) ( not ( = ?auto_10306 ?auto_10310 ) ) ( not ( = ?auto_10314 ?auto_10304 ) ) ( not ( = ?auto_10309 ?auto_10314 ) ) ( HOIST-AT ?auto_10315 ?auto_10314 ) ( not ( = ?auto_10305 ?auto_10315 ) ) ( not ( = ?auto_10303 ?auto_10315 ) ) ( AVAILABLE ?auto_10315 ) ( SURFACE-AT ?auto_10299 ?auto_10314 ) ( ON ?auto_10299 ?auto_10312 ) ( CLEAR ?auto_10299 ) ( not ( = ?auto_10298 ?auto_10312 ) ) ( not ( = ?auto_10299 ?auto_10312 ) ) ( not ( = ?auto_10306 ?auto_10312 ) ) ( not ( = ?auto_10310 ?auto_10312 ) ) ( IS-CRATE ?auto_10310 ) ( not ( = ?auto_10298 ?auto_10301 ) ) ( not ( = ?auto_10299 ?auto_10301 ) ) ( not ( = ?auto_10306 ?auto_10301 ) ) ( not ( = ?auto_10310 ?auto_10301 ) ) ( not ( = ?auto_10312 ?auto_10301 ) ) ( not ( = ?auto_10308 ?auto_10304 ) ) ( not ( = ?auto_10309 ?auto_10308 ) ) ( not ( = ?auto_10314 ?auto_10308 ) ) ( HOIST-AT ?auto_10300 ?auto_10308 ) ( not ( = ?auto_10305 ?auto_10300 ) ) ( not ( = ?auto_10303 ?auto_10300 ) ) ( not ( = ?auto_10315 ?auto_10300 ) ) ( SURFACE-AT ?auto_10310 ?auto_10308 ) ( ON ?auto_10310 ?auto_10313 ) ( CLEAR ?auto_10310 ) ( not ( = ?auto_10298 ?auto_10313 ) ) ( not ( = ?auto_10299 ?auto_10313 ) ) ( not ( = ?auto_10306 ?auto_10313 ) ) ( not ( = ?auto_10310 ?auto_10313 ) ) ( not ( = ?auto_10312 ?auto_10313 ) ) ( not ( = ?auto_10301 ?auto_10313 ) ) ( IS-CRATE ?auto_10301 ) ( not ( = ?auto_10298 ?auto_10316 ) ) ( not ( = ?auto_10299 ?auto_10316 ) ) ( not ( = ?auto_10306 ?auto_10316 ) ) ( not ( = ?auto_10310 ?auto_10316 ) ) ( not ( = ?auto_10312 ?auto_10316 ) ) ( not ( = ?auto_10301 ?auto_10316 ) ) ( not ( = ?auto_10313 ?auto_10316 ) ) ( AVAILABLE ?auto_10300 ) ( SURFACE-AT ?auto_10301 ?auto_10308 ) ( ON ?auto_10301 ?auto_10311 ) ( CLEAR ?auto_10301 ) ( not ( = ?auto_10298 ?auto_10311 ) ) ( not ( = ?auto_10299 ?auto_10311 ) ) ( not ( = ?auto_10306 ?auto_10311 ) ) ( not ( = ?auto_10310 ?auto_10311 ) ) ( not ( = ?auto_10312 ?auto_10311 ) ) ( not ( = ?auto_10301 ?auto_10311 ) ) ( not ( = ?auto_10313 ?auto_10311 ) ) ( not ( = ?auto_10316 ?auto_10311 ) ) ( SURFACE-AT ?auto_10307 ?auto_10304 ) ( CLEAR ?auto_10307 ) ( IS-CRATE ?auto_10316 ) ( not ( = ?auto_10298 ?auto_10307 ) ) ( not ( = ?auto_10299 ?auto_10307 ) ) ( not ( = ?auto_10306 ?auto_10307 ) ) ( not ( = ?auto_10310 ?auto_10307 ) ) ( not ( = ?auto_10312 ?auto_10307 ) ) ( not ( = ?auto_10301 ?auto_10307 ) ) ( not ( = ?auto_10313 ?auto_10307 ) ) ( not ( = ?auto_10316 ?auto_10307 ) ) ( not ( = ?auto_10311 ?auto_10307 ) ) ( AVAILABLE ?auto_10305 ) ( IN ?auto_10316 ?auto_10302 ) ( TRUCK-AT ?auto_10302 ?auto_10314 ) )
    :subtasks
    ( ( !DRIVE ?auto_10302 ?auto_10314 ?auto_10304 )
      ( MAKE-ON ?auto_10298 ?auto_10299 )
      ( MAKE-ON-VERIFY ?auto_10298 ?auto_10299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10317 - SURFACE
      ?auto_10318 - SURFACE
    )
    :vars
    (
      ?auto_10320 - HOIST
      ?auto_10319 - PLACE
      ?auto_10335 - PLACE
      ?auto_10321 - HOIST
      ?auto_10330 - SURFACE
      ?auto_10327 - SURFACE
      ?auto_10329 - PLACE
      ?auto_10324 - HOIST
      ?auto_10325 - SURFACE
      ?auto_10328 - SURFACE
      ?auto_10333 - PLACE
      ?auto_10323 - HOIST
      ?auto_10331 - SURFACE
      ?auto_10322 - SURFACE
      ?auto_10334 - SURFACE
      ?auto_10326 - SURFACE
      ?auto_10332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10320 ?auto_10319 ) ( IS-CRATE ?auto_10317 ) ( not ( = ?auto_10317 ?auto_10318 ) ) ( not ( = ?auto_10335 ?auto_10319 ) ) ( HOIST-AT ?auto_10321 ?auto_10335 ) ( not ( = ?auto_10320 ?auto_10321 ) ) ( AVAILABLE ?auto_10321 ) ( SURFACE-AT ?auto_10317 ?auto_10335 ) ( ON ?auto_10317 ?auto_10330 ) ( CLEAR ?auto_10317 ) ( not ( = ?auto_10317 ?auto_10330 ) ) ( not ( = ?auto_10318 ?auto_10330 ) ) ( IS-CRATE ?auto_10318 ) ( not ( = ?auto_10317 ?auto_10327 ) ) ( not ( = ?auto_10318 ?auto_10327 ) ) ( not ( = ?auto_10330 ?auto_10327 ) ) ( not ( = ?auto_10329 ?auto_10319 ) ) ( not ( = ?auto_10335 ?auto_10329 ) ) ( HOIST-AT ?auto_10324 ?auto_10329 ) ( not ( = ?auto_10320 ?auto_10324 ) ) ( not ( = ?auto_10321 ?auto_10324 ) ) ( SURFACE-AT ?auto_10318 ?auto_10329 ) ( ON ?auto_10318 ?auto_10325 ) ( CLEAR ?auto_10318 ) ( not ( = ?auto_10317 ?auto_10325 ) ) ( not ( = ?auto_10318 ?auto_10325 ) ) ( not ( = ?auto_10330 ?auto_10325 ) ) ( not ( = ?auto_10327 ?auto_10325 ) ) ( IS-CRATE ?auto_10327 ) ( not ( = ?auto_10317 ?auto_10328 ) ) ( not ( = ?auto_10318 ?auto_10328 ) ) ( not ( = ?auto_10330 ?auto_10328 ) ) ( not ( = ?auto_10327 ?auto_10328 ) ) ( not ( = ?auto_10325 ?auto_10328 ) ) ( not ( = ?auto_10333 ?auto_10319 ) ) ( not ( = ?auto_10335 ?auto_10333 ) ) ( not ( = ?auto_10329 ?auto_10333 ) ) ( HOIST-AT ?auto_10323 ?auto_10333 ) ( not ( = ?auto_10320 ?auto_10323 ) ) ( not ( = ?auto_10321 ?auto_10323 ) ) ( not ( = ?auto_10324 ?auto_10323 ) ) ( SURFACE-AT ?auto_10327 ?auto_10333 ) ( ON ?auto_10327 ?auto_10331 ) ( CLEAR ?auto_10327 ) ( not ( = ?auto_10317 ?auto_10331 ) ) ( not ( = ?auto_10318 ?auto_10331 ) ) ( not ( = ?auto_10330 ?auto_10331 ) ) ( not ( = ?auto_10327 ?auto_10331 ) ) ( not ( = ?auto_10325 ?auto_10331 ) ) ( not ( = ?auto_10328 ?auto_10331 ) ) ( IS-CRATE ?auto_10328 ) ( not ( = ?auto_10317 ?auto_10322 ) ) ( not ( = ?auto_10318 ?auto_10322 ) ) ( not ( = ?auto_10330 ?auto_10322 ) ) ( not ( = ?auto_10327 ?auto_10322 ) ) ( not ( = ?auto_10325 ?auto_10322 ) ) ( not ( = ?auto_10328 ?auto_10322 ) ) ( not ( = ?auto_10331 ?auto_10322 ) ) ( AVAILABLE ?auto_10323 ) ( SURFACE-AT ?auto_10328 ?auto_10333 ) ( ON ?auto_10328 ?auto_10334 ) ( CLEAR ?auto_10328 ) ( not ( = ?auto_10317 ?auto_10334 ) ) ( not ( = ?auto_10318 ?auto_10334 ) ) ( not ( = ?auto_10330 ?auto_10334 ) ) ( not ( = ?auto_10327 ?auto_10334 ) ) ( not ( = ?auto_10325 ?auto_10334 ) ) ( not ( = ?auto_10328 ?auto_10334 ) ) ( not ( = ?auto_10331 ?auto_10334 ) ) ( not ( = ?auto_10322 ?auto_10334 ) ) ( SURFACE-AT ?auto_10326 ?auto_10319 ) ( CLEAR ?auto_10326 ) ( IS-CRATE ?auto_10322 ) ( not ( = ?auto_10317 ?auto_10326 ) ) ( not ( = ?auto_10318 ?auto_10326 ) ) ( not ( = ?auto_10330 ?auto_10326 ) ) ( not ( = ?auto_10327 ?auto_10326 ) ) ( not ( = ?auto_10325 ?auto_10326 ) ) ( not ( = ?auto_10328 ?auto_10326 ) ) ( not ( = ?auto_10331 ?auto_10326 ) ) ( not ( = ?auto_10322 ?auto_10326 ) ) ( not ( = ?auto_10334 ?auto_10326 ) ) ( AVAILABLE ?auto_10320 ) ( TRUCK-AT ?auto_10332 ?auto_10329 ) ( LIFTING ?auto_10324 ?auto_10322 ) )
    :subtasks
    ( ( !LOAD ?auto_10324 ?auto_10322 ?auto_10332 ?auto_10329 )
      ( MAKE-ON ?auto_10317 ?auto_10318 )
      ( MAKE-ON-VERIFY ?auto_10317 ?auto_10318 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10336 - SURFACE
      ?auto_10337 - SURFACE
    )
    :vars
    (
      ?auto_10353 - HOIST
      ?auto_10339 - PLACE
      ?auto_10340 - PLACE
      ?auto_10349 - HOIST
      ?auto_10352 - SURFACE
      ?auto_10346 - SURFACE
      ?auto_10343 - PLACE
      ?auto_10354 - HOIST
      ?auto_10345 - SURFACE
      ?auto_10348 - SURFACE
      ?auto_10344 - PLACE
      ?auto_10338 - HOIST
      ?auto_10350 - SURFACE
      ?auto_10351 - SURFACE
      ?auto_10342 - SURFACE
      ?auto_10341 - SURFACE
      ?auto_10347 - TRUCK
      ?auto_10355 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10353 ?auto_10339 ) ( IS-CRATE ?auto_10336 ) ( not ( = ?auto_10336 ?auto_10337 ) ) ( not ( = ?auto_10340 ?auto_10339 ) ) ( HOIST-AT ?auto_10349 ?auto_10340 ) ( not ( = ?auto_10353 ?auto_10349 ) ) ( AVAILABLE ?auto_10349 ) ( SURFACE-AT ?auto_10336 ?auto_10340 ) ( ON ?auto_10336 ?auto_10352 ) ( CLEAR ?auto_10336 ) ( not ( = ?auto_10336 ?auto_10352 ) ) ( not ( = ?auto_10337 ?auto_10352 ) ) ( IS-CRATE ?auto_10337 ) ( not ( = ?auto_10336 ?auto_10346 ) ) ( not ( = ?auto_10337 ?auto_10346 ) ) ( not ( = ?auto_10352 ?auto_10346 ) ) ( not ( = ?auto_10343 ?auto_10339 ) ) ( not ( = ?auto_10340 ?auto_10343 ) ) ( HOIST-AT ?auto_10354 ?auto_10343 ) ( not ( = ?auto_10353 ?auto_10354 ) ) ( not ( = ?auto_10349 ?auto_10354 ) ) ( SURFACE-AT ?auto_10337 ?auto_10343 ) ( ON ?auto_10337 ?auto_10345 ) ( CLEAR ?auto_10337 ) ( not ( = ?auto_10336 ?auto_10345 ) ) ( not ( = ?auto_10337 ?auto_10345 ) ) ( not ( = ?auto_10352 ?auto_10345 ) ) ( not ( = ?auto_10346 ?auto_10345 ) ) ( IS-CRATE ?auto_10346 ) ( not ( = ?auto_10336 ?auto_10348 ) ) ( not ( = ?auto_10337 ?auto_10348 ) ) ( not ( = ?auto_10352 ?auto_10348 ) ) ( not ( = ?auto_10346 ?auto_10348 ) ) ( not ( = ?auto_10345 ?auto_10348 ) ) ( not ( = ?auto_10344 ?auto_10339 ) ) ( not ( = ?auto_10340 ?auto_10344 ) ) ( not ( = ?auto_10343 ?auto_10344 ) ) ( HOIST-AT ?auto_10338 ?auto_10344 ) ( not ( = ?auto_10353 ?auto_10338 ) ) ( not ( = ?auto_10349 ?auto_10338 ) ) ( not ( = ?auto_10354 ?auto_10338 ) ) ( SURFACE-AT ?auto_10346 ?auto_10344 ) ( ON ?auto_10346 ?auto_10350 ) ( CLEAR ?auto_10346 ) ( not ( = ?auto_10336 ?auto_10350 ) ) ( not ( = ?auto_10337 ?auto_10350 ) ) ( not ( = ?auto_10352 ?auto_10350 ) ) ( not ( = ?auto_10346 ?auto_10350 ) ) ( not ( = ?auto_10345 ?auto_10350 ) ) ( not ( = ?auto_10348 ?auto_10350 ) ) ( IS-CRATE ?auto_10348 ) ( not ( = ?auto_10336 ?auto_10351 ) ) ( not ( = ?auto_10337 ?auto_10351 ) ) ( not ( = ?auto_10352 ?auto_10351 ) ) ( not ( = ?auto_10346 ?auto_10351 ) ) ( not ( = ?auto_10345 ?auto_10351 ) ) ( not ( = ?auto_10348 ?auto_10351 ) ) ( not ( = ?auto_10350 ?auto_10351 ) ) ( AVAILABLE ?auto_10338 ) ( SURFACE-AT ?auto_10348 ?auto_10344 ) ( ON ?auto_10348 ?auto_10342 ) ( CLEAR ?auto_10348 ) ( not ( = ?auto_10336 ?auto_10342 ) ) ( not ( = ?auto_10337 ?auto_10342 ) ) ( not ( = ?auto_10352 ?auto_10342 ) ) ( not ( = ?auto_10346 ?auto_10342 ) ) ( not ( = ?auto_10345 ?auto_10342 ) ) ( not ( = ?auto_10348 ?auto_10342 ) ) ( not ( = ?auto_10350 ?auto_10342 ) ) ( not ( = ?auto_10351 ?auto_10342 ) ) ( SURFACE-AT ?auto_10341 ?auto_10339 ) ( CLEAR ?auto_10341 ) ( IS-CRATE ?auto_10351 ) ( not ( = ?auto_10336 ?auto_10341 ) ) ( not ( = ?auto_10337 ?auto_10341 ) ) ( not ( = ?auto_10352 ?auto_10341 ) ) ( not ( = ?auto_10346 ?auto_10341 ) ) ( not ( = ?auto_10345 ?auto_10341 ) ) ( not ( = ?auto_10348 ?auto_10341 ) ) ( not ( = ?auto_10350 ?auto_10341 ) ) ( not ( = ?auto_10351 ?auto_10341 ) ) ( not ( = ?auto_10342 ?auto_10341 ) ) ( AVAILABLE ?auto_10353 ) ( TRUCK-AT ?auto_10347 ?auto_10343 ) ( AVAILABLE ?auto_10354 ) ( SURFACE-AT ?auto_10351 ?auto_10343 ) ( ON ?auto_10351 ?auto_10355 ) ( CLEAR ?auto_10351 ) ( not ( = ?auto_10336 ?auto_10355 ) ) ( not ( = ?auto_10337 ?auto_10355 ) ) ( not ( = ?auto_10352 ?auto_10355 ) ) ( not ( = ?auto_10346 ?auto_10355 ) ) ( not ( = ?auto_10345 ?auto_10355 ) ) ( not ( = ?auto_10348 ?auto_10355 ) ) ( not ( = ?auto_10350 ?auto_10355 ) ) ( not ( = ?auto_10351 ?auto_10355 ) ) ( not ( = ?auto_10342 ?auto_10355 ) ) ( not ( = ?auto_10341 ?auto_10355 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10354 ?auto_10351 ?auto_10355 ?auto_10343 )
      ( MAKE-ON ?auto_10336 ?auto_10337 )
      ( MAKE-ON-VERIFY ?auto_10336 ?auto_10337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10356 - SURFACE
      ?auto_10357 - SURFACE
    )
    :vars
    (
      ?auto_10364 - HOIST
      ?auto_10360 - PLACE
      ?auto_10371 - PLACE
      ?auto_10363 - HOIST
      ?auto_10368 - SURFACE
      ?auto_10372 - SURFACE
      ?auto_10361 - PLACE
      ?auto_10375 - HOIST
      ?auto_10365 - SURFACE
      ?auto_10358 - SURFACE
      ?auto_10359 - PLACE
      ?auto_10373 - HOIST
      ?auto_10370 - SURFACE
      ?auto_10366 - SURFACE
      ?auto_10362 - SURFACE
      ?auto_10369 - SURFACE
      ?auto_10374 - SURFACE
      ?auto_10367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10364 ?auto_10360 ) ( IS-CRATE ?auto_10356 ) ( not ( = ?auto_10356 ?auto_10357 ) ) ( not ( = ?auto_10371 ?auto_10360 ) ) ( HOIST-AT ?auto_10363 ?auto_10371 ) ( not ( = ?auto_10364 ?auto_10363 ) ) ( AVAILABLE ?auto_10363 ) ( SURFACE-AT ?auto_10356 ?auto_10371 ) ( ON ?auto_10356 ?auto_10368 ) ( CLEAR ?auto_10356 ) ( not ( = ?auto_10356 ?auto_10368 ) ) ( not ( = ?auto_10357 ?auto_10368 ) ) ( IS-CRATE ?auto_10357 ) ( not ( = ?auto_10356 ?auto_10372 ) ) ( not ( = ?auto_10357 ?auto_10372 ) ) ( not ( = ?auto_10368 ?auto_10372 ) ) ( not ( = ?auto_10361 ?auto_10360 ) ) ( not ( = ?auto_10371 ?auto_10361 ) ) ( HOIST-AT ?auto_10375 ?auto_10361 ) ( not ( = ?auto_10364 ?auto_10375 ) ) ( not ( = ?auto_10363 ?auto_10375 ) ) ( SURFACE-AT ?auto_10357 ?auto_10361 ) ( ON ?auto_10357 ?auto_10365 ) ( CLEAR ?auto_10357 ) ( not ( = ?auto_10356 ?auto_10365 ) ) ( not ( = ?auto_10357 ?auto_10365 ) ) ( not ( = ?auto_10368 ?auto_10365 ) ) ( not ( = ?auto_10372 ?auto_10365 ) ) ( IS-CRATE ?auto_10372 ) ( not ( = ?auto_10356 ?auto_10358 ) ) ( not ( = ?auto_10357 ?auto_10358 ) ) ( not ( = ?auto_10368 ?auto_10358 ) ) ( not ( = ?auto_10372 ?auto_10358 ) ) ( not ( = ?auto_10365 ?auto_10358 ) ) ( not ( = ?auto_10359 ?auto_10360 ) ) ( not ( = ?auto_10371 ?auto_10359 ) ) ( not ( = ?auto_10361 ?auto_10359 ) ) ( HOIST-AT ?auto_10373 ?auto_10359 ) ( not ( = ?auto_10364 ?auto_10373 ) ) ( not ( = ?auto_10363 ?auto_10373 ) ) ( not ( = ?auto_10375 ?auto_10373 ) ) ( SURFACE-AT ?auto_10372 ?auto_10359 ) ( ON ?auto_10372 ?auto_10370 ) ( CLEAR ?auto_10372 ) ( not ( = ?auto_10356 ?auto_10370 ) ) ( not ( = ?auto_10357 ?auto_10370 ) ) ( not ( = ?auto_10368 ?auto_10370 ) ) ( not ( = ?auto_10372 ?auto_10370 ) ) ( not ( = ?auto_10365 ?auto_10370 ) ) ( not ( = ?auto_10358 ?auto_10370 ) ) ( IS-CRATE ?auto_10358 ) ( not ( = ?auto_10356 ?auto_10366 ) ) ( not ( = ?auto_10357 ?auto_10366 ) ) ( not ( = ?auto_10368 ?auto_10366 ) ) ( not ( = ?auto_10372 ?auto_10366 ) ) ( not ( = ?auto_10365 ?auto_10366 ) ) ( not ( = ?auto_10358 ?auto_10366 ) ) ( not ( = ?auto_10370 ?auto_10366 ) ) ( AVAILABLE ?auto_10373 ) ( SURFACE-AT ?auto_10358 ?auto_10359 ) ( ON ?auto_10358 ?auto_10362 ) ( CLEAR ?auto_10358 ) ( not ( = ?auto_10356 ?auto_10362 ) ) ( not ( = ?auto_10357 ?auto_10362 ) ) ( not ( = ?auto_10368 ?auto_10362 ) ) ( not ( = ?auto_10372 ?auto_10362 ) ) ( not ( = ?auto_10365 ?auto_10362 ) ) ( not ( = ?auto_10358 ?auto_10362 ) ) ( not ( = ?auto_10370 ?auto_10362 ) ) ( not ( = ?auto_10366 ?auto_10362 ) ) ( SURFACE-AT ?auto_10369 ?auto_10360 ) ( CLEAR ?auto_10369 ) ( IS-CRATE ?auto_10366 ) ( not ( = ?auto_10356 ?auto_10369 ) ) ( not ( = ?auto_10357 ?auto_10369 ) ) ( not ( = ?auto_10368 ?auto_10369 ) ) ( not ( = ?auto_10372 ?auto_10369 ) ) ( not ( = ?auto_10365 ?auto_10369 ) ) ( not ( = ?auto_10358 ?auto_10369 ) ) ( not ( = ?auto_10370 ?auto_10369 ) ) ( not ( = ?auto_10366 ?auto_10369 ) ) ( not ( = ?auto_10362 ?auto_10369 ) ) ( AVAILABLE ?auto_10364 ) ( AVAILABLE ?auto_10375 ) ( SURFACE-AT ?auto_10366 ?auto_10361 ) ( ON ?auto_10366 ?auto_10374 ) ( CLEAR ?auto_10366 ) ( not ( = ?auto_10356 ?auto_10374 ) ) ( not ( = ?auto_10357 ?auto_10374 ) ) ( not ( = ?auto_10368 ?auto_10374 ) ) ( not ( = ?auto_10372 ?auto_10374 ) ) ( not ( = ?auto_10365 ?auto_10374 ) ) ( not ( = ?auto_10358 ?auto_10374 ) ) ( not ( = ?auto_10370 ?auto_10374 ) ) ( not ( = ?auto_10366 ?auto_10374 ) ) ( not ( = ?auto_10362 ?auto_10374 ) ) ( not ( = ?auto_10369 ?auto_10374 ) ) ( TRUCK-AT ?auto_10367 ?auto_10360 ) )
    :subtasks
    ( ( !DRIVE ?auto_10367 ?auto_10360 ?auto_10361 )
      ( MAKE-ON ?auto_10356 ?auto_10357 )
      ( MAKE-ON-VERIFY ?auto_10356 ?auto_10357 ) )
  )

)

