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
      ?auto_9419 - SURFACE
      ?auto_9420 - SURFACE
    )
    :vars
    (
      ?auto_9421 - HOIST
      ?auto_9422 - PLACE
      ?auto_9424 - PLACE
      ?auto_9425 - HOIST
      ?auto_9426 - SURFACE
      ?auto_9423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9421 ?auto_9422 ) ( SURFACE-AT ?auto_9419 ?auto_9422 ) ( CLEAR ?auto_9419 ) ( IS-CRATE ?auto_9420 ) ( AVAILABLE ?auto_9421 ) ( not ( = ?auto_9424 ?auto_9422 ) ) ( HOIST-AT ?auto_9425 ?auto_9424 ) ( AVAILABLE ?auto_9425 ) ( SURFACE-AT ?auto_9420 ?auto_9424 ) ( ON ?auto_9420 ?auto_9426 ) ( CLEAR ?auto_9420 ) ( TRUCK-AT ?auto_9423 ?auto_9422 ) ( not ( = ?auto_9419 ?auto_9420 ) ) ( not ( = ?auto_9419 ?auto_9426 ) ) ( not ( = ?auto_9420 ?auto_9426 ) ) ( not ( = ?auto_9421 ?auto_9425 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9423 ?auto_9422 ?auto_9424 )
      ( !LIFT ?auto_9425 ?auto_9420 ?auto_9426 ?auto_9424 )
      ( !LOAD ?auto_9425 ?auto_9420 ?auto_9423 ?auto_9424 )
      ( !DRIVE ?auto_9423 ?auto_9424 ?auto_9422 )
      ( !UNLOAD ?auto_9421 ?auto_9420 ?auto_9423 ?auto_9422 )
      ( !DROP ?auto_9421 ?auto_9420 ?auto_9419 ?auto_9422 )
      ( MAKE-1CRATE-VERIFY ?auto_9419 ?auto_9420 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9429 - SURFACE
      ?auto_9430 - SURFACE
    )
    :vars
    (
      ?auto_9431 - HOIST
      ?auto_9432 - PLACE
      ?auto_9434 - PLACE
      ?auto_9435 - HOIST
      ?auto_9436 - SURFACE
      ?auto_9433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9431 ?auto_9432 ) ( SURFACE-AT ?auto_9429 ?auto_9432 ) ( CLEAR ?auto_9429 ) ( IS-CRATE ?auto_9430 ) ( AVAILABLE ?auto_9431 ) ( not ( = ?auto_9434 ?auto_9432 ) ) ( HOIST-AT ?auto_9435 ?auto_9434 ) ( AVAILABLE ?auto_9435 ) ( SURFACE-AT ?auto_9430 ?auto_9434 ) ( ON ?auto_9430 ?auto_9436 ) ( CLEAR ?auto_9430 ) ( TRUCK-AT ?auto_9433 ?auto_9432 ) ( not ( = ?auto_9429 ?auto_9430 ) ) ( not ( = ?auto_9429 ?auto_9436 ) ) ( not ( = ?auto_9430 ?auto_9436 ) ) ( not ( = ?auto_9431 ?auto_9435 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9433 ?auto_9432 ?auto_9434 )
      ( !LIFT ?auto_9435 ?auto_9430 ?auto_9436 ?auto_9434 )
      ( !LOAD ?auto_9435 ?auto_9430 ?auto_9433 ?auto_9434 )
      ( !DRIVE ?auto_9433 ?auto_9434 ?auto_9432 )
      ( !UNLOAD ?auto_9431 ?auto_9430 ?auto_9433 ?auto_9432 )
      ( !DROP ?auto_9431 ?auto_9430 ?auto_9429 ?auto_9432 )
      ( MAKE-1CRATE-VERIFY ?auto_9429 ?auto_9430 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9440 - SURFACE
      ?auto_9441 - SURFACE
      ?auto_9442 - SURFACE
    )
    :vars
    (
      ?auto_9444 - HOIST
      ?auto_9447 - PLACE
      ?auto_9446 - PLACE
      ?auto_9448 - HOIST
      ?auto_9443 - SURFACE
      ?auto_9451 - PLACE
      ?auto_9450 - HOIST
      ?auto_9449 - SURFACE
      ?auto_9445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9444 ?auto_9447 ) ( IS-CRATE ?auto_9442 ) ( not ( = ?auto_9446 ?auto_9447 ) ) ( HOIST-AT ?auto_9448 ?auto_9446 ) ( AVAILABLE ?auto_9448 ) ( SURFACE-AT ?auto_9442 ?auto_9446 ) ( ON ?auto_9442 ?auto_9443 ) ( CLEAR ?auto_9442 ) ( not ( = ?auto_9441 ?auto_9442 ) ) ( not ( = ?auto_9441 ?auto_9443 ) ) ( not ( = ?auto_9442 ?auto_9443 ) ) ( not ( = ?auto_9444 ?auto_9448 ) ) ( SURFACE-AT ?auto_9440 ?auto_9447 ) ( CLEAR ?auto_9440 ) ( IS-CRATE ?auto_9441 ) ( AVAILABLE ?auto_9444 ) ( not ( = ?auto_9451 ?auto_9447 ) ) ( HOIST-AT ?auto_9450 ?auto_9451 ) ( AVAILABLE ?auto_9450 ) ( SURFACE-AT ?auto_9441 ?auto_9451 ) ( ON ?auto_9441 ?auto_9449 ) ( CLEAR ?auto_9441 ) ( TRUCK-AT ?auto_9445 ?auto_9447 ) ( not ( = ?auto_9440 ?auto_9441 ) ) ( not ( = ?auto_9440 ?auto_9449 ) ) ( not ( = ?auto_9441 ?auto_9449 ) ) ( not ( = ?auto_9444 ?auto_9450 ) ) ( not ( = ?auto_9440 ?auto_9442 ) ) ( not ( = ?auto_9440 ?auto_9443 ) ) ( not ( = ?auto_9442 ?auto_9449 ) ) ( not ( = ?auto_9446 ?auto_9451 ) ) ( not ( = ?auto_9448 ?auto_9450 ) ) ( not ( = ?auto_9443 ?auto_9449 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9440 ?auto_9441 )
      ( MAKE-1CRATE ?auto_9441 ?auto_9442 )
      ( MAKE-2CRATE-VERIFY ?auto_9440 ?auto_9441 ?auto_9442 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9454 - SURFACE
      ?auto_9455 - SURFACE
    )
    :vars
    (
      ?auto_9456 - HOIST
      ?auto_9457 - PLACE
      ?auto_9459 - PLACE
      ?auto_9460 - HOIST
      ?auto_9461 - SURFACE
      ?auto_9458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9456 ?auto_9457 ) ( SURFACE-AT ?auto_9454 ?auto_9457 ) ( CLEAR ?auto_9454 ) ( IS-CRATE ?auto_9455 ) ( AVAILABLE ?auto_9456 ) ( not ( = ?auto_9459 ?auto_9457 ) ) ( HOIST-AT ?auto_9460 ?auto_9459 ) ( AVAILABLE ?auto_9460 ) ( SURFACE-AT ?auto_9455 ?auto_9459 ) ( ON ?auto_9455 ?auto_9461 ) ( CLEAR ?auto_9455 ) ( TRUCK-AT ?auto_9458 ?auto_9457 ) ( not ( = ?auto_9454 ?auto_9455 ) ) ( not ( = ?auto_9454 ?auto_9461 ) ) ( not ( = ?auto_9455 ?auto_9461 ) ) ( not ( = ?auto_9456 ?auto_9460 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9458 ?auto_9457 ?auto_9459 )
      ( !LIFT ?auto_9460 ?auto_9455 ?auto_9461 ?auto_9459 )
      ( !LOAD ?auto_9460 ?auto_9455 ?auto_9458 ?auto_9459 )
      ( !DRIVE ?auto_9458 ?auto_9459 ?auto_9457 )
      ( !UNLOAD ?auto_9456 ?auto_9455 ?auto_9458 ?auto_9457 )
      ( !DROP ?auto_9456 ?auto_9455 ?auto_9454 ?auto_9457 )
      ( MAKE-1CRATE-VERIFY ?auto_9454 ?auto_9455 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9466 - SURFACE
      ?auto_9467 - SURFACE
      ?auto_9468 - SURFACE
      ?auto_9469 - SURFACE
    )
    :vars
    (
      ?auto_9473 - HOIST
      ?auto_9472 - PLACE
      ?auto_9475 - PLACE
      ?auto_9471 - HOIST
      ?auto_9474 - SURFACE
      ?auto_9480 - PLACE
      ?auto_9479 - HOIST
      ?auto_9478 - SURFACE
      ?auto_9477 - PLACE
      ?auto_9476 - HOIST
      ?auto_9481 - SURFACE
      ?auto_9470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9473 ?auto_9472 ) ( IS-CRATE ?auto_9469 ) ( not ( = ?auto_9475 ?auto_9472 ) ) ( HOIST-AT ?auto_9471 ?auto_9475 ) ( AVAILABLE ?auto_9471 ) ( SURFACE-AT ?auto_9469 ?auto_9475 ) ( ON ?auto_9469 ?auto_9474 ) ( CLEAR ?auto_9469 ) ( not ( = ?auto_9468 ?auto_9469 ) ) ( not ( = ?auto_9468 ?auto_9474 ) ) ( not ( = ?auto_9469 ?auto_9474 ) ) ( not ( = ?auto_9473 ?auto_9471 ) ) ( IS-CRATE ?auto_9468 ) ( not ( = ?auto_9480 ?auto_9472 ) ) ( HOIST-AT ?auto_9479 ?auto_9480 ) ( AVAILABLE ?auto_9479 ) ( SURFACE-AT ?auto_9468 ?auto_9480 ) ( ON ?auto_9468 ?auto_9478 ) ( CLEAR ?auto_9468 ) ( not ( = ?auto_9467 ?auto_9468 ) ) ( not ( = ?auto_9467 ?auto_9478 ) ) ( not ( = ?auto_9468 ?auto_9478 ) ) ( not ( = ?auto_9473 ?auto_9479 ) ) ( SURFACE-AT ?auto_9466 ?auto_9472 ) ( CLEAR ?auto_9466 ) ( IS-CRATE ?auto_9467 ) ( AVAILABLE ?auto_9473 ) ( not ( = ?auto_9477 ?auto_9472 ) ) ( HOIST-AT ?auto_9476 ?auto_9477 ) ( AVAILABLE ?auto_9476 ) ( SURFACE-AT ?auto_9467 ?auto_9477 ) ( ON ?auto_9467 ?auto_9481 ) ( CLEAR ?auto_9467 ) ( TRUCK-AT ?auto_9470 ?auto_9472 ) ( not ( = ?auto_9466 ?auto_9467 ) ) ( not ( = ?auto_9466 ?auto_9481 ) ) ( not ( = ?auto_9467 ?auto_9481 ) ) ( not ( = ?auto_9473 ?auto_9476 ) ) ( not ( = ?auto_9466 ?auto_9468 ) ) ( not ( = ?auto_9466 ?auto_9478 ) ) ( not ( = ?auto_9468 ?auto_9481 ) ) ( not ( = ?auto_9480 ?auto_9477 ) ) ( not ( = ?auto_9479 ?auto_9476 ) ) ( not ( = ?auto_9478 ?auto_9481 ) ) ( not ( = ?auto_9466 ?auto_9469 ) ) ( not ( = ?auto_9466 ?auto_9474 ) ) ( not ( = ?auto_9467 ?auto_9469 ) ) ( not ( = ?auto_9467 ?auto_9474 ) ) ( not ( = ?auto_9469 ?auto_9478 ) ) ( not ( = ?auto_9469 ?auto_9481 ) ) ( not ( = ?auto_9475 ?auto_9480 ) ) ( not ( = ?auto_9475 ?auto_9477 ) ) ( not ( = ?auto_9471 ?auto_9479 ) ) ( not ( = ?auto_9471 ?auto_9476 ) ) ( not ( = ?auto_9474 ?auto_9478 ) ) ( not ( = ?auto_9474 ?auto_9481 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9466 ?auto_9467 ?auto_9468 )
      ( MAKE-1CRATE ?auto_9468 ?auto_9469 )
      ( MAKE-3CRATE-VERIFY ?auto_9466 ?auto_9467 ?auto_9468 ?auto_9469 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9484 - SURFACE
      ?auto_9485 - SURFACE
    )
    :vars
    (
      ?auto_9486 - HOIST
      ?auto_9487 - PLACE
      ?auto_9489 - PLACE
      ?auto_9490 - HOIST
      ?auto_9491 - SURFACE
      ?auto_9488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9486 ?auto_9487 ) ( SURFACE-AT ?auto_9484 ?auto_9487 ) ( CLEAR ?auto_9484 ) ( IS-CRATE ?auto_9485 ) ( AVAILABLE ?auto_9486 ) ( not ( = ?auto_9489 ?auto_9487 ) ) ( HOIST-AT ?auto_9490 ?auto_9489 ) ( AVAILABLE ?auto_9490 ) ( SURFACE-AT ?auto_9485 ?auto_9489 ) ( ON ?auto_9485 ?auto_9491 ) ( CLEAR ?auto_9485 ) ( TRUCK-AT ?auto_9488 ?auto_9487 ) ( not ( = ?auto_9484 ?auto_9485 ) ) ( not ( = ?auto_9484 ?auto_9491 ) ) ( not ( = ?auto_9485 ?auto_9491 ) ) ( not ( = ?auto_9486 ?auto_9490 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9488 ?auto_9487 ?auto_9489 )
      ( !LIFT ?auto_9490 ?auto_9485 ?auto_9491 ?auto_9489 )
      ( !LOAD ?auto_9490 ?auto_9485 ?auto_9488 ?auto_9489 )
      ( !DRIVE ?auto_9488 ?auto_9489 ?auto_9487 )
      ( !UNLOAD ?auto_9486 ?auto_9485 ?auto_9488 ?auto_9487 )
      ( !DROP ?auto_9486 ?auto_9485 ?auto_9484 ?auto_9487 )
      ( MAKE-1CRATE-VERIFY ?auto_9484 ?auto_9485 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9497 - SURFACE
      ?auto_9498 - SURFACE
      ?auto_9499 - SURFACE
      ?auto_9500 - SURFACE
      ?auto_9501 - SURFACE
    )
    :vars
    (
      ?auto_9504 - HOIST
      ?auto_9505 - PLACE
      ?auto_9503 - PLACE
      ?auto_9502 - HOIST
      ?auto_9507 - SURFACE
      ?auto_9508 - PLACE
      ?auto_9513 - HOIST
      ?auto_9510 - SURFACE
      ?auto_9512 - PLACE
      ?auto_9514 - HOIST
      ?auto_9509 - SURFACE
      ?auto_9511 - SURFACE
      ?auto_9506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9504 ?auto_9505 ) ( IS-CRATE ?auto_9501 ) ( not ( = ?auto_9503 ?auto_9505 ) ) ( HOIST-AT ?auto_9502 ?auto_9503 ) ( SURFACE-AT ?auto_9501 ?auto_9503 ) ( ON ?auto_9501 ?auto_9507 ) ( CLEAR ?auto_9501 ) ( not ( = ?auto_9500 ?auto_9501 ) ) ( not ( = ?auto_9500 ?auto_9507 ) ) ( not ( = ?auto_9501 ?auto_9507 ) ) ( not ( = ?auto_9504 ?auto_9502 ) ) ( IS-CRATE ?auto_9500 ) ( not ( = ?auto_9508 ?auto_9505 ) ) ( HOIST-AT ?auto_9513 ?auto_9508 ) ( AVAILABLE ?auto_9513 ) ( SURFACE-AT ?auto_9500 ?auto_9508 ) ( ON ?auto_9500 ?auto_9510 ) ( CLEAR ?auto_9500 ) ( not ( = ?auto_9499 ?auto_9500 ) ) ( not ( = ?auto_9499 ?auto_9510 ) ) ( not ( = ?auto_9500 ?auto_9510 ) ) ( not ( = ?auto_9504 ?auto_9513 ) ) ( IS-CRATE ?auto_9499 ) ( not ( = ?auto_9512 ?auto_9505 ) ) ( HOIST-AT ?auto_9514 ?auto_9512 ) ( AVAILABLE ?auto_9514 ) ( SURFACE-AT ?auto_9499 ?auto_9512 ) ( ON ?auto_9499 ?auto_9509 ) ( CLEAR ?auto_9499 ) ( not ( = ?auto_9498 ?auto_9499 ) ) ( not ( = ?auto_9498 ?auto_9509 ) ) ( not ( = ?auto_9499 ?auto_9509 ) ) ( not ( = ?auto_9504 ?auto_9514 ) ) ( SURFACE-AT ?auto_9497 ?auto_9505 ) ( CLEAR ?auto_9497 ) ( IS-CRATE ?auto_9498 ) ( AVAILABLE ?auto_9504 ) ( AVAILABLE ?auto_9502 ) ( SURFACE-AT ?auto_9498 ?auto_9503 ) ( ON ?auto_9498 ?auto_9511 ) ( CLEAR ?auto_9498 ) ( TRUCK-AT ?auto_9506 ?auto_9505 ) ( not ( = ?auto_9497 ?auto_9498 ) ) ( not ( = ?auto_9497 ?auto_9511 ) ) ( not ( = ?auto_9498 ?auto_9511 ) ) ( not ( = ?auto_9497 ?auto_9499 ) ) ( not ( = ?auto_9497 ?auto_9509 ) ) ( not ( = ?auto_9499 ?auto_9511 ) ) ( not ( = ?auto_9512 ?auto_9503 ) ) ( not ( = ?auto_9514 ?auto_9502 ) ) ( not ( = ?auto_9509 ?auto_9511 ) ) ( not ( = ?auto_9497 ?auto_9500 ) ) ( not ( = ?auto_9497 ?auto_9510 ) ) ( not ( = ?auto_9498 ?auto_9500 ) ) ( not ( = ?auto_9498 ?auto_9510 ) ) ( not ( = ?auto_9500 ?auto_9509 ) ) ( not ( = ?auto_9500 ?auto_9511 ) ) ( not ( = ?auto_9508 ?auto_9512 ) ) ( not ( = ?auto_9508 ?auto_9503 ) ) ( not ( = ?auto_9513 ?auto_9514 ) ) ( not ( = ?auto_9513 ?auto_9502 ) ) ( not ( = ?auto_9510 ?auto_9509 ) ) ( not ( = ?auto_9510 ?auto_9511 ) ) ( not ( = ?auto_9497 ?auto_9501 ) ) ( not ( = ?auto_9497 ?auto_9507 ) ) ( not ( = ?auto_9498 ?auto_9501 ) ) ( not ( = ?auto_9498 ?auto_9507 ) ) ( not ( = ?auto_9499 ?auto_9501 ) ) ( not ( = ?auto_9499 ?auto_9507 ) ) ( not ( = ?auto_9501 ?auto_9510 ) ) ( not ( = ?auto_9501 ?auto_9509 ) ) ( not ( = ?auto_9501 ?auto_9511 ) ) ( not ( = ?auto_9507 ?auto_9510 ) ) ( not ( = ?auto_9507 ?auto_9509 ) ) ( not ( = ?auto_9507 ?auto_9511 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9497 ?auto_9498 ?auto_9499 ?auto_9500 )
      ( MAKE-1CRATE ?auto_9500 ?auto_9501 )
      ( MAKE-4CRATE-VERIFY ?auto_9497 ?auto_9498 ?auto_9499 ?auto_9500 ?auto_9501 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9517 - SURFACE
      ?auto_9518 - SURFACE
    )
    :vars
    (
      ?auto_9519 - HOIST
      ?auto_9520 - PLACE
      ?auto_9522 - PLACE
      ?auto_9523 - HOIST
      ?auto_9524 - SURFACE
      ?auto_9521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9519 ?auto_9520 ) ( SURFACE-AT ?auto_9517 ?auto_9520 ) ( CLEAR ?auto_9517 ) ( IS-CRATE ?auto_9518 ) ( AVAILABLE ?auto_9519 ) ( not ( = ?auto_9522 ?auto_9520 ) ) ( HOIST-AT ?auto_9523 ?auto_9522 ) ( AVAILABLE ?auto_9523 ) ( SURFACE-AT ?auto_9518 ?auto_9522 ) ( ON ?auto_9518 ?auto_9524 ) ( CLEAR ?auto_9518 ) ( TRUCK-AT ?auto_9521 ?auto_9520 ) ( not ( = ?auto_9517 ?auto_9518 ) ) ( not ( = ?auto_9517 ?auto_9524 ) ) ( not ( = ?auto_9518 ?auto_9524 ) ) ( not ( = ?auto_9519 ?auto_9523 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9521 ?auto_9520 ?auto_9522 )
      ( !LIFT ?auto_9523 ?auto_9518 ?auto_9524 ?auto_9522 )
      ( !LOAD ?auto_9523 ?auto_9518 ?auto_9521 ?auto_9522 )
      ( !DRIVE ?auto_9521 ?auto_9522 ?auto_9520 )
      ( !UNLOAD ?auto_9519 ?auto_9518 ?auto_9521 ?auto_9520 )
      ( !DROP ?auto_9519 ?auto_9518 ?auto_9517 ?auto_9520 )
      ( MAKE-1CRATE-VERIFY ?auto_9517 ?auto_9518 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_9531 - SURFACE
      ?auto_9532 - SURFACE
      ?auto_9533 - SURFACE
      ?auto_9534 - SURFACE
      ?auto_9535 - SURFACE
      ?auto_9536 - SURFACE
    )
    :vars
    (
      ?auto_9538 - HOIST
      ?auto_9539 - PLACE
      ?auto_9541 - PLACE
      ?auto_9540 - HOIST
      ?auto_9542 - SURFACE
      ?auto_9550 - PLACE
      ?auto_9549 - HOIST
      ?auto_9547 - SURFACE
      ?auto_9543 - SURFACE
      ?auto_9546 - PLACE
      ?auto_9548 - HOIST
      ?auto_9545 - SURFACE
      ?auto_9544 - SURFACE
      ?auto_9537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9538 ?auto_9539 ) ( IS-CRATE ?auto_9536 ) ( not ( = ?auto_9541 ?auto_9539 ) ) ( HOIST-AT ?auto_9540 ?auto_9541 ) ( SURFACE-AT ?auto_9536 ?auto_9541 ) ( ON ?auto_9536 ?auto_9542 ) ( CLEAR ?auto_9536 ) ( not ( = ?auto_9535 ?auto_9536 ) ) ( not ( = ?auto_9535 ?auto_9542 ) ) ( not ( = ?auto_9536 ?auto_9542 ) ) ( not ( = ?auto_9538 ?auto_9540 ) ) ( IS-CRATE ?auto_9535 ) ( not ( = ?auto_9550 ?auto_9539 ) ) ( HOIST-AT ?auto_9549 ?auto_9550 ) ( SURFACE-AT ?auto_9535 ?auto_9550 ) ( ON ?auto_9535 ?auto_9547 ) ( CLEAR ?auto_9535 ) ( not ( = ?auto_9534 ?auto_9535 ) ) ( not ( = ?auto_9534 ?auto_9547 ) ) ( not ( = ?auto_9535 ?auto_9547 ) ) ( not ( = ?auto_9538 ?auto_9549 ) ) ( IS-CRATE ?auto_9534 ) ( AVAILABLE ?auto_9540 ) ( SURFACE-AT ?auto_9534 ?auto_9541 ) ( ON ?auto_9534 ?auto_9543 ) ( CLEAR ?auto_9534 ) ( not ( = ?auto_9533 ?auto_9534 ) ) ( not ( = ?auto_9533 ?auto_9543 ) ) ( not ( = ?auto_9534 ?auto_9543 ) ) ( IS-CRATE ?auto_9533 ) ( not ( = ?auto_9546 ?auto_9539 ) ) ( HOIST-AT ?auto_9548 ?auto_9546 ) ( AVAILABLE ?auto_9548 ) ( SURFACE-AT ?auto_9533 ?auto_9546 ) ( ON ?auto_9533 ?auto_9545 ) ( CLEAR ?auto_9533 ) ( not ( = ?auto_9532 ?auto_9533 ) ) ( not ( = ?auto_9532 ?auto_9545 ) ) ( not ( = ?auto_9533 ?auto_9545 ) ) ( not ( = ?auto_9538 ?auto_9548 ) ) ( SURFACE-AT ?auto_9531 ?auto_9539 ) ( CLEAR ?auto_9531 ) ( IS-CRATE ?auto_9532 ) ( AVAILABLE ?auto_9538 ) ( AVAILABLE ?auto_9549 ) ( SURFACE-AT ?auto_9532 ?auto_9550 ) ( ON ?auto_9532 ?auto_9544 ) ( CLEAR ?auto_9532 ) ( TRUCK-AT ?auto_9537 ?auto_9539 ) ( not ( = ?auto_9531 ?auto_9532 ) ) ( not ( = ?auto_9531 ?auto_9544 ) ) ( not ( = ?auto_9532 ?auto_9544 ) ) ( not ( = ?auto_9531 ?auto_9533 ) ) ( not ( = ?auto_9531 ?auto_9545 ) ) ( not ( = ?auto_9533 ?auto_9544 ) ) ( not ( = ?auto_9546 ?auto_9550 ) ) ( not ( = ?auto_9548 ?auto_9549 ) ) ( not ( = ?auto_9545 ?auto_9544 ) ) ( not ( = ?auto_9531 ?auto_9534 ) ) ( not ( = ?auto_9531 ?auto_9543 ) ) ( not ( = ?auto_9532 ?auto_9534 ) ) ( not ( = ?auto_9532 ?auto_9543 ) ) ( not ( = ?auto_9534 ?auto_9545 ) ) ( not ( = ?auto_9534 ?auto_9544 ) ) ( not ( = ?auto_9541 ?auto_9546 ) ) ( not ( = ?auto_9541 ?auto_9550 ) ) ( not ( = ?auto_9540 ?auto_9548 ) ) ( not ( = ?auto_9540 ?auto_9549 ) ) ( not ( = ?auto_9543 ?auto_9545 ) ) ( not ( = ?auto_9543 ?auto_9544 ) ) ( not ( = ?auto_9531 ?auto_9535 ) ) ( not ( = ?auto_9531 ?auto_9547 ) ) ( not ( = ?auto_9532 ?auto_9535 ) ) ( not ( = ?auto_9532 ?auto_9547 ) ) ( not ( = ?auto_9533 ?auto_9535 ) ) ( not ( = ?auto_9533 ?auto_9547 ) ) ( not ( = ?auto_9535 ?auto_9543 ) ) ( not ( = ?auto_9535 ?auto_9545 ) ) ( not ( = ?auto_9535 ?auto_9544 ) ) ( not ( = ?auto_9547 ?auto_9543 ) ) ( not ( = ?auto_9547 ?auto_9545 ) ) ( not ( = ?auto_9547 ?auto_9544 ) ) ( not ( = ?auto_9531 ?auto_9536 ) ) ( not ( = ?auto_9531 ?auto_9542 ) ) ( not ( = ?auto_9532 ?auto_9536 ) ) ( not ( = ?auto_9532 ?auto_9542 ) ) ( not ( = ?auto_9533 ?auto_9536 ) ) ( not ( = ?auto_9533 ?auto_9542 ) ) ( not ( = ?auto_9534 ?auto_9536 ) ) ( not ( = ?auto_9534 ?auto_9542 ) ) ( not ( = ?auto_9536 ?auto_9547 ) ) ( not ( = ?auto_9536 ?auto_9543 ) ) ( not ( = ?auto_9536 ?auto_9545 ) ) ( not ( = ?auto_9536 ?auto_9544 ) ) ( not ( = ?auto_9542 ?auto_9547 ) ) ( not ( = ?auto_9542 ?auto_9543 ) ) ( not ( = ?auto_9542 ?auto_9545 ) ) ( not ( = ?auto_9542 ?auto_9544 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_9531 ?auto_9532 ?auto_9533 ?auto_9534 ?auto_9535 )
      ( MAKE-1CRATE ?auto_9535 ?auto_9536 )
      ( MAKE-5CRATE-VERIFY ?auto_9531 ?auto_9532 ?auto_9533 ?auto_9534 ?auto_9535 ?auto_9536 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9553 - SURFACE
      ?auto_9554 - SURFACE
    )
    :vars
    (
      ?auto_9555 - HOIST
      ?auto_9556 - PLACE
      ?auto_9558 - PLACE
      ?auto_9559 - HOIST
      ?auto_9560 - SURFACE
      ?auto_9557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9555 ?auto_9556 ) ( SURFACE-AT ?auto_9553 ?auto_9556 ) ( CLEAR ?auto_9553 ) ( IS-CRATE ?auto_9554 ) ( AVAILABLE ?auto_9555 ) ( not ( = ?auto_9558 ?auto_9556 ) ) ( HOIST-AT ?auto_9559 ?auto_9558 ) ( AVAILABLE ?auto_9559 ) ( SURFACE-AT ?auto_9554 ?auto_9558 ) ( ON ?auto_9554 ?auto_9560 ) ( CLEAR ?auto_9554 ) ( TRUCK-AT ?auto_9557 ?auto_9556 ) ( not ( = ?auto_9553 ?auto_9554 ) ) ( not ( = ?auto_9553 ?auto_9560 ) ) ( not ( = ?auto_9554 ?auto_9560 ) ) ( not ( = ?auto_9555 ?auto_9559 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9557 ?auto_9556 ?auto_9558 )
      ( !LIFT ?auto_9559 ?auto_9554 ?auto_9560 ?auto_9558 )
      ( !LOAD ?auto_9559 ?auto_9554 ?auto_9557 ?auto_9558 )
      ( !DRIVE ?auto_9557 ?auto_9558 ?auto_9556 )
      ( !UNLOAD ?auto_9555 ?auto_9554 ?auto_9557 ?auto_9556 )
      ( !DROP ?auto_9555 ?auto_9554 ?auto_9553 ?auto_9556 )
      ( MAKE-1CRATE-VERIFY ?auto_9553 ?auto_9554 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_9568 - SURFACE
      ?auto_9569 - SURFACE
      ?auto_9570 - SURFACE
      ?auto_9571 - SURFACE
      ?auto_9572 - SURFACE
      ?auto_9574 - SURFACE
      ?auto_9573 - SURFACE
    )
    :vars
    (
      ?auto_9575 - HOIST
      ?auto_9576 - PLACE
      ?auto_9579 - PLACE
      ?auto_9578 - HOIST
      ?auto_9580 - SURFACE
      ?auto_9588 - PLACE
      ?auto_9589 - HOIST
      ?auto_9586 - SURFACE
      ?auto_9590 - PLACE
      ?auto_9587 - HOIST
      ?auto_9591 - SURFACE
      ?auto_9583 - SURFACE
      ?auto_9582 - PLACE
      ?auto_9585 - HOIST
      ?auto_9581 - SURFACE
      ?auto_9584 - SURFACE
      ?auto_9577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9575 ?auto_9576 ) ( IS-CRATE ?auto_9573 ) ( not ( = ?auto_9579 ?auto_9576 ) ) ( HOIST-AT ?auto_9578 ?auto_9579 ) ( AVAILABLE ?auto_9578 ) ( SURFACE-AT ?auto_9573 ?auto_9579 ) ( ON ?auto_9573 ?auto_9580 ) ( CLEAR ?auto_9573 ) ( not ( = ?auto_9574 ?auto_9573 ) ) ( not ( = ?auto_9574 ?auto_9580 ) ) ( not ( = ?auto_9573 ?auto_9580 ) ) ( not ( = ?auto_9575 ?auto_9578 ) ) ( IS-CRATE ?auto_9574 ) ( not ( = ?auto_9588 ?auto_9576 ) ) ( HOIST-AT ?auto_9589 ?auto_9588 ) ( SURFACE-AT ?auto_9574 ?auto_9588 ) ( ON ?auto_9574 ?auto_9586 ) ( CLEAR ?auto_9574 ) ( not ( = ?auto_9572 ?auto_9574 ) ) ( not ( = ?auto_9572 ?auto_9586 ) ) ( not ( = ?auto_9574 ?auto_9586 ) ) ( not ( = ?auto_9575 ?auto_9589 ) ) ( IS-CRATE ?auto_9572 ) ( not ( = ?auto_9590 ?auto_9576 ) ) ( HOIST-AT ?auto_9587 ?auto_9590 ) ( SURFACE-AT ?auto_9572 ?auto_9590 ) ( ON ?auto_9572 ?auto_9591 ) ( CLEAR ?auto_9572 ) ( not ( = ?auto_9571 ?auto_9572 ) ) ( not ( = ?auto_9571 ?auto_9591 ) ) ( not ( = ?auto_9572 ?auto_9591 ) ) ( not ( = ?auto_9575 ?auto_9587 ) ) ( IS-CRATE ?auto_9571 ) ( AVAILABLE ?auto_9589 ) ( SURFACE-AT ?auto_9571 ?auto_9588 ) ( ON ?auto_9571 ?auto_9583 ) ( CLEAR ?auto_9571 ) ( not ( = ?auto_9570 ?auto_9571 ) ) ( not ( = ?auto_9570 ?auto_9583 ) ) ( not ( = ?auto_9571 ?auto_9583 ) ) ( IS-CRATE ?auto_9570 ) ( not ( = ?auto_9582 ?auto_9576 ) ) ( HOIST-AT ?auto_9585 ?auto_9582 ) ( AVAILABLE ?auto_9585 ) ( SURFACE-AT ?auto_9570 ?auto_9582 ) ( ON ?auto_9570 ?auto_9581 ) ( CLEAR ?auto_9570 ) ( not ( = ?auto_9569 ?auto_9570 ) ) ( not ( = ?auto_9569 ?auto_9581 ) ) ( not ( = ?auto_9570 ?auto_9581 ) ) ( not ( = ?auto_9575 ?auto_9585 ) ) ( SURFACE-AT ?auto_9568 ?auto_9576 ) ( CLEAR ?auto_9568 ) ( IS-CRATE ?auto_9569 ) ( AVAILABLE ?auto_9575 ) ( AVAILABLE ?auto_9587 ) ( SURFACE-AT ?auto_9569 ?auto_9590 ) ( ON ?auto_9569 ?auto_9584 ) ( CLEAR ?auto_9569 ) ( TRUCK-AT ?auto_9577 ?auto_9576 ) ( not ( = ?auto_9568 ?auto_9569 ) ) ( not ( = ?auto_9568 ?auto_9584 ) ) ( not ( = ?auto_9569 ?auto_9584 ) ) ( not ( = ?auto_9568 ?auto_9570 ) ) ( not ( = ?auto_9568 ?auto_9581 ) ) ( not ( = ?auto_9570 ?auto_9584 ) ) ( not ( = ?auto_9582 ?auto_9590 ) ) ( not ( = ?auto_9585 ?auto_9587 ) ) ( not ( = ?auto_9581 ?auto_9584 ) ) ( not ( = ?auto_9568 ?auto_9571 ) ) ( not ( = ?auto_9568 ?auto_9583 ) ) ( not ( = ?auto_9569 ?auto_9571 ) ) ( not ( = ?auto_9569 ?auto_9583 ) ) ( not ( = ?auto_9571 ?auto_9581 ) ) ( not ( = ?auto_9571 ?auto_9584 ) ) ( not ( = ?auto_9588 ?auto_9582 ) ) ( not ( = ?auto_9588 ?auto_9590 ) ) ( not ( = ?auto_9589 ?auto_9585 ) ) ( not ( = ?auto_9589 ?auto_9587 ) ) ( not ( = ?auto_9583 ?auto_9581 ) ) ( not ( = ?auto_9583 ?auto_9584 ) ) ( not ( = ?auto_9568 ?auto_9572 ) ) ( not ( = ?auto_9568 ?auto_9591 ) ) ( not ( = ?auto_9569 ?auto_9572 ) ) ( not ( = ?auto_9569 ?auto_9591 ) ) ( not ( = ?auto_9570 ?auto_9572 ) ) ( not ( = ?auto_9570 ?auto_9591 ) ) ( not ( = ?auto_9572 ?auto_9583 ) ) ( not ( = ?auto_9572 ?auto_9581 ) ) ( not ( = ?auto_9572 ?auto_9584 ) ) ( not ( = ?auto_9591 ?auto_9583 ) ) ( not ( = ?auto_9591 ?auto_9581 ) ) ( not ( = ?auto_9591 ?auto_9584 ) ) ( not ( = ?auto_9568 ?auto_9574 ) ) ( not ( = ?auto_9568 ?auto_9586 ) ) ( not ( = ?auto_9569 ?auto_9574 ) ) ( not ( = ?auto_9569 ?auto_9586 ) ) ( not ( = ?auto_9570 ?auto_9574 ) ) ( not ( = ?auto_9570 ?auto_9586 ) ) ( not ( = ?auto_9571 ?auto_9574 ) ) ( not ( = ?auto_9571 ?auto_9586 ) ) ( not ( = ?auto_9574 ?auto_9591 ) ) ( not ( = ?auto_9574 ?auto_9583 ) ) ( not ( = ?auto_9574 ?auto_9581 ) ) ( not ( = ?auto_9574 ?auto_9584 ) ) ( not ( = ?auto_9586 ?auto_9591 ) ) ( not ( = ?auto_9586 ?auto_9583 ) ) ( not ( = ?auto_9586 ?auto_9581 ) ) ( not ( = ?auto_9586 ?auto_9584 ) ) ( not ( = ?auto_9568 ?auto_9573 ) ) ( not ( = ?auto_9568 ?auto_9580 ) ) ( not ( = ?auto_9569 ?auto_9573 ) ) ( not ( = ?auto_9569 ?auto_9580 ) ) ( not ( = ?auto_9570 ?auto_9573 ) ) ( not ( = ?auto_9570 ?auto_9580 ) ) ( not ( = ?auto_9571 ?auto_9573 ) ) ( not ( = ?auto_9571 ?auto_9580 ) ) ( not ( = ?auto_9572 ?auto_9573 ) ) ( not ( = ?auto_9572 ?auto_9580 ) ) ( not ( = ?auto_9573 ?auto_9586 ) ) ( not ( = ?auto_9573 ?auto_9591 ) ) ( not ( = ?auto_9573 ?auto_9583 ) ) ( not ( = ?auto_9573 ?auto_9581 ) ) ( not ( = ?auto_9573 ?auto_9584 ) ) ( not ( = ?auto_9579 ?auto_9588 ) ) ( not ( = ?auto_9579 ?auto_9590 ) ) ( not ( = ?auto_9579 ?auto_9582 ) ) ( not ( = ?auto_9578 ?auto_9589 ) ) ( not ( = ?auto_9578 ?auto_9587 ) ) ( not ( = ?auto_9578 ?auto_9585 ) ) ( not ( = ?auto_9580 ?auto_9586 ) ) ( not ( = ?auto_9580 ?auto_9591 ) ) ( not ( = ?auto_9580 ?auto_9583 ) ) ( not ( = ?auto_9580 ?auto_9581 ) ) ( not ( = ?auto_9580 ?auto_9584 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_9568 ?auto_9569 ?auto_9570 ?auto_9571 ?auto_9572 ?auto_9574 )
      ( MAKE-1CRATE ?auto_9574 ?auto_9573 )
      ( MAKE-6CRATE-VERIFY ?auto_9568 ?auto_9569 ?auto_9570 ?auto_9571 ?auto_9572 ?auto_9574 ?auto_9573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9594 - SURFACE
      ?auto_9595 - SURFACE
    )
    :vars
    (
      ?auto_9596 - HOIST
      ?auto_9597 - PLACE
      ?auto_9599 - PLACE
      ?auto_9600 - HOIST
      ?auto_9601 - SURFACE
      ?auto_9598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9596 ?auto_9597 ) ( SURFACE-AT ?auto_9594 ?auto_9597 ) ( CLEAR ?auto_9594 ) ( IS-CRATE ?auto_9595 ) ( AVAILABLE ?auto_9596 ) ( not ( = ?auto_9599 ?auto_9597 ) ) ( HOIST-AT ?auto_9600 ?auto_9599 ) ( AVAILABLE ?auto_9600 ) ( SURFACE-AT ?auto_9595 ?auto_9599 ) ( ON ?auto_9595 ?auto_9601 ) ( CLEAR ?auto_9595 ) ( TRUCK-AT ?auto_9598 ?auto_9597 ) ( not ( = ?auto_9594 ?auto_9595 ) ) ( not ( = ?auto_9594 ?auto_9601 ) ) ( not ( = ?auto_9595 ?auto_9601 ) ) ( not ( = ?auto_9596 ?auto_9600 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9598 ?auto_9597 ?auto_9599 )
      ( !LIFT ?auto_9600 ?auto_9595 ?auto_9601 ?auto_9599 )
      ( !LOAD ?auto_9600 ?auto_9595 ?auto_9598 ?auto_9599 )
      ( !DRIVE ?auto_9598 ?auto_9599 ?auto_9597 )
      ( !UNLOAD ?auto_9596 ?auto_9595 ?auto_9598 ?auto_9597 )
      ( !DROP ?auto_9596 ?auto_9595 ?auto_9594 ?auto_9597 )
      ( MAKE-1CRATE-VERIFY ?auto_9594 ?auto_9595 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_9610 - SURFACE
      ?auto_9611 - SURFACE
      ?auto_9612 - SURFACE
      ?auto_9613 - SURFACE
      ?auto_9614 - SURFACE
      ?auto_9616 - SURFACE
      ?auto_9615 - SURFACE
      ?auto_9617 - SURFACE
    )
    :vars
    (
      ?auto_9618 - HOIST
      ?auto_9620 - PLACE
      ?auto_9621 - PLACE
      ?auto_9623 - HOIST
      ?auto_9622 - SURFACE
      ?auto_9633 - PLACE
      ?auto_9624 - HOIST
      ?auto_9635 - SURFACE
      ?auto_9627 - PLACE
      ?auto_9625 - HOIST
      ?auto_9632 - SURFACE
      ?auto_9626 - PLACE
      ?auto_9628 - HOIST
      ?auto_9629 - SURFACE
      ?auto_9634 - SURFACE
      ?auto_9630 - SURFACE
      ?auto_9631 - SURFACE
      ?auto_9619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9618 ?auto_9620 ) ( IS-CRATE ?auto_9617 ) ( not ( = ?auto_9621 ?auto_9620 ) ) ( HOIST-AT ?auto_9623 ?auto_9621 ) ( SURFACE-AT ?auto_9617 ?auto_9621 ) ( ON ?auto_9617 ?auto_9622 ) ( CLEAR ?auto_9617 ) ( not ( = ?auto_9615 ?auto_9617 ) ) ( not ( = ?auto_9615 ?auto_9622 ) ) ( not ( = ?auto_9617 ?auto_9622 ) ) ( not ( = ?auto_9618 ?auto_9623 ) ) ( IS-CRATE ?auto_9615 ) ( not ( = ?auto_9633 ?auto_9620 ) ) ( HOIST-AT ?auto_9624 ?auto_9633 ) ( AVAILABLE ?auto_9624 ) ( SURFACE-AT ?auto_9615 ?auto_9633 ) ( ON ?auto_9615 ?auto_9635 ) ( CLEAR ?auto_9615 ) ( not ( = ?auto_9616 ?auto_9615 ) ) ( not ( = ?auto_9616 ?auto_9635 ) ) ( not ( = ?auto_9615 ?auto_9635 ) ) ( not ( = ?auto_9618 ?auto_9624 ) ) ( IS-CRATE ?auto_9616 ) ( not ( = ?auto_9627 ?auto_9620 ) ) ( HOIST-AT ?auto_9625 ?auto_9627 ) ( SURFACE-AT ?auto_9616 ?auto_9627 ) ( ON ?auto_9616 ?auto_9632 ) ( CLEAR ?auto_9616 ) ( not ( = ?auto_9614 ?auto_9616 ) ) ( not ( = ?auto_9614 ?auto_9632 ) ) ( not ( = ?auto_9616 ?auto_9632 ) ) ( not ( = ?auto_9618 ?auto_9625 ) ) ( IS-CRATE ?auto_9614 ) ( not ( = ?auto_9626 ?auto_9620 ) ) ( HOIST-AT ?auto_9628 ?auto_9626 ) ( SURFACE-AT ?auto_9614 ?auto_9626 ) ( ON ?auto_9614 ?auto_9629 ) ( CLEAR ?auto_9614 ) ( not ( = ?auto_9613 ?auto_9614 ) ) ( not ( = ?auto_9613 ?auto_9629 ) ) ( not ( = ?auto_9614 ?auto_9629 ) ) ( not ( = ?auto_9618 ?auto_9628 ) ) ( IS-CRATE ?auto_9613 ) ( AVAILABLE ?auto_9625 ) ( SURFACE-AT ?auto_9613 ?auto_9627 ) ( ON ?auto_9613 ?auto_9634 ) ( CLEAR ?auto_9613 ) ( not ( = ?auto_9612 ?auto_9613 ) ) ( not ( = ?auto_9612 ?auto_9634 ) ) ( not ( = ?auto_9613 ?auto_9634 ) ) ( IS-CRATE ?auto_9612 ) ( AVAILABLE ?auto_9623 ) ( SURFACE-AT ?auto_9612 ?auto_9621 ) ( ON ?auto_9612 ?auto_9630 ) ( CLEAR ?auto_9612 ) ( not ( = ?auto_9611 ?auto_9612 ) ) ( not ( = ?auto_9611 ?auto_9630 ) ) ( not ( = ?auto_9612 ?auto_9630 ) ) ( SURFACE-AT ?auto_9610 ?auto_9620 ) ( CLEAR ?auto_9610 ) ( IS-CRATE ?auto_9611 ) ( AVAILABLE ?auto_9618 ) ( AVAILABLE ?auto_9628 ) ( SURFACE-AT ?auto_9611 ?auto_9626 ) ( ON ?auto_9611 ?auto_9631 ) ( CLEAR ?auto_9611 ) ( TRUCK-AT ?auto_9619 ?auto_9620 ) ( not ( = ?auto_9610 ?auto_9611 ) ) ( not ( = ?auto_9610 ?auto_9631 ) ) ( not ( = ?auto_9611 ?auto_9631 ) ) ( not ( = ?auto_9610 ?auto_9612 ) ) ( not ( = ?auto_9610 ?auto_9630 ) ) ( not ( = ?auto_9612 ?auto_9631 ) ) ( not ( = ?auto_9621 ?auto_9626 ) ) ( not ( = ?auto_9623 ?auto_9628 ) ) ( not ( = ?auto_9630 ?auto_9631 ) ) ( not ( = ?auto_9610 ?auto_9613 ) ) ( not ( = ?auto_9610 ?auto_9634 ) ) ( not ( = ?auto_9611 ?auto_9613 ) ) ( not ( = ?auto_9611 ?auto_9634 ) ) ( not ( = ?auto_9613 ?auto_9630 ) ) ( not ( = ?auto_9613 ?auto_9631 ) ) ( not ( = ?auto_9627 ?auto_9621 ) ) ( not ( = ?auto_9627 ?auto_9626 ) ) ( not ( = ?auto_9625 ?auto_9623 ) ) ( not ( = ?auto_9625 ?auto_9628 ) ) ( not ( = ?auto_9634 ?auto_9630 ) ) ( not ( = ?auto_9634 ?auto_9631 ) ) ( not ( = ?auto_9610 ?auto_9614 ) ) ( not ( = ?auto_9610 ?auto_9629 ) ) ( not ( = ?auto_9611 ?auto_9614 ) ) ( not ( = ?auto_9611 ?auto_9629 ) ) ( not ( = ?auto_9612 ?auto_9614 ) ) ( not ( = ?auto_9612 ?auto_9629 ) ) ( not ( = ?auto_9614 ?auto_9634 ) ) ( not ( = ?auto_9614 ?auto_9630 ) ) ( not ( = ?auto_9614 ?auto_9631 ) ) ( not ( = ?auto_9629 ?auto_9634 ) ) ( not ( = ?auto_9629 ?auto_9630 ) ) ( not ( = ?auto_9629 ?auto_9631 ) ) ( not ( = ?auto_9610 ?auto_9616 ) ) ( not ( = ?auto_9610 ?auto_9632 ) ) ( not ( = ?auto_9611 ?auto_9616 ) ) ( not ( = ?auto_9611 ?auto_9632 ) ) ( not ( = ?auto_9612 ?auto_9616 ) ) ( not ( = ?auto_9612 ?auto_9632 ) ) ( not ( = ?auto_9613 ?auto_9616 ) ) ( not ( = ?auto_9613 ?auto_9632 ) ) ( not ( = ?auto_9616 ?auto_9629 ) ) ( not ( = ?auto_9616 ?auto_9634 ) ) ( not ( = ?auto_9616 ?auto_9630 ) ) ( not ( = ?auto_9616 ?auto_9631 ) ) ( not ( = ?auto_9632 ?auto_9629 ) ) ( not ( = ?auto_9632 ?auto_9634 ) ) ( not ( = ?auto_9632 ?auto_9630 ) ) ( not ( = ?auto_9632 ?auto_9631 ) ) ( not ( = ?auto_9610 ?auto_9615 ) ) ( not ( = ?auto_9610 ?auto_9635 ) ) ( not ( = ?auto_9611 ?auto_9615 ) ) ( not ( = ?auto_9611 ?auto_9635 ) ) ( not ( = ?auto_9612 ?auto_9615 ) ) ( not ( = ?auto_9612 ?auto_9635 ) ) ( not ( = ?auto_9613 ?auto_9615 ) ) ( not ( = ?auto_9613 ?auto_9635 ) ) ( not ( = ?auto_9614 ?auto_9615 ) ) ( not ( = ?auto_9614 ?auto_9635 ) ) ( not ( = ?auto_9615 ?auto_9632 ) ) ( not ( = ?auto_9615 ?auto_9629 ) ) ( not ( = ?auto_9615 ?auto_9634 ) ) ( not ( = ?auto_9615 ?auto_9630 ) ) ( not ( = ?auto_9615 ?auto_9631 ) ) ( not ( = ?auto_9633 ?auto_9627 ) ) ( not ( = ?auto_9633 ?auto_9626 ) ) ( not ( = ?auto_9633 ?auto_9621 ) ) ( not ( = ?auto_9624 ?auto_9625 ) ) ( not ( = ?auto_9624 ?auto_9628 ) ) ( not ( = ?auto_9624 ?auto_9623 ) ) ( not ( = ?auto_9635 ?auto_9632 ) ) ( not ( = ?auto_9635 ?auto_9629 ) ) ( not ( = ?auto_9635 ?auto_9634 ) ) ( not ( = ?auto_9635 ?auto_9630 ) ) ( not ( = ?auto_9635 ?auto_9631 ) ) ( not ( = ?auto_9610 ?auto_9617 ) ) ( not ( = ?auto_9610 ?auto_9622 ) ) ( not ( = ?auto_9611 ?auto_9617 ) ) ( not ( = ?auto_9611 ?auto_9622 ) ) ( not ( = ?auto_9612 ?auto_9617 ) ) ( not ( = ?auto_9612 ?auto_9622 ) ) ( not ( = ?auto_9613 ?auto_9617 ) ) ( not ( = ?auto_9613 ?auto_9622 ) ) ( not ( = ?auto_9614 ?auto_9617 ) ) ( not ( = ?auto_9614 ?auto_9622 ) ) ( not ( = ?auto_9616 ?auto_9617 ) ) ( not ( = ?auto_9616 ?auto_9622 ) ) ( not ( = ?auto_9617 ?auto_9635 ) ) ( not ( = ?auto_9617 ?auto_9632 ) ) ( not ( = ?auto_9617 ?auto_9629 ) ) ( not ( = ?auto_9617 ?auto_9634 ) ) ( not ( = ?auto_9617 ?auto_9630 ) ) ( not ( = ?auto_9617 ?auto_9631 ) ) ( not ( = ?auto_9622 ?auto_9635 ) ) ( not ( = ?auto_9622 ?auto_9632 ) ) ( not ( = ?auto_9622 ?auto_9629 ) ) ( not ( = ?auto_9622 ?auto_9634 ) ) ( not ( = ?auto_9622 ?auto_9630 ) ) ( not ( = ?auto_9622 ?auto_9631 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_9610 ?auto_9611 ?auto_9612 ?auto_9613 ?auto_9614 ?auto_9616 ?auto_9615 )
      ( MAKE-1CRATE ?auto_9615 ?auto_9617 )
      ( MAKE-7CRATE-VERIFY ?auto_9610 ?auto_9611 ?auto_9612 ?auto_9613 ?auto_9614 ?auto_9616 ?auto_9615 ?auto_9617 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9638 - SURFACE
      ?auto_9639 - SURFACE
    )
    :vars
    (
      ?auto_9640 - HOIST
      ?auto_9641 - PLACE
      ?auto_9643 - PLACE
      ?auto_9644 - HOIST
      ?auto_9645 - SURFACE
      ?auto_9642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9640 ?auto_9641 ) ( SURFACE-AT ?auto_9638 ?auto_9641 ) ( CLEAR ?auto_9638 ) ( IS-CRATE ?auto_9639 ) ( AVAILABLE ?auto_9640 ) ( not ( = ?auto_9643 ?auto_9641 ) ) ( HOIST-AT ?auto_9644 ?auto_9643 ) ( AVAILABLE ?auto_9644 ) ( SURFACE-AT ?auto_9639 ?auto_9643 ) ( ON ?auto_9639 ?auto_9645 ) ( CLEAR ?auto_9639 ) ( TRUCK-AT ?auto_9642 ?auto_9641 ) ( not ( = ?auto_9638 ?auto_9639 ) ) ( not ( = ?auto_9638 ?auto_9645 ) ) ( not ( = ?auto_9639 ?auto_9645 ) ) ( not ( = ?auto_9640 ?auto_9644 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9642 ?auto_9641 ?auto_9643 )
      ( !LIFT ?auto_9644 ?auto_9639 ?auto_9645 ?auto_9643 )
      ( !LOAD ?auto_9644 ?auto_9639 ?auto_9642 ?auto_9643 )
      ( !DRIVE ?auto_9642 ?auto_9643 ?auto_9641 )
      ( !UNLOAD ?auto_9640 ?auto_9639 ?auto_9642 ?auto_9641 )
      ( !DROP ?auto_9640 ?auto_9639 ?auto_9638 ?auto_9641 )
      ( MAKE-1CRATE-VERIFY ?auto_9638 ?auto_9639 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_9655 - SURFACE
      ?auto_9656 - SURFACE
      ?auto_9657 - SURFACE
      ?auto_9658 - SURFACE
      ?auto_9659 - SURFACE
      ?auto_9661 - SURFACE
      ?auto_9660 - SURFACE
      ?auto_9663 - SURFACE
      ?auto_9662 - SURFACE
    )
    :vars
    (
      ?auto_9666 - HOIST
      ?auto_9665 - PLACE
      ?auto_9668 - PLACE
      ?auto_9667 - HOIST
      ?auto_9664 - SURFACE
      ?auto_9676 - PLACE
      ?auto_9674 - HOIST
      ?auto_9677 - SURFACE
      ?auto_9681 - PLACE
      ?auto_9678 - HOIST
      ?auto_9682 - SURFACE
      ?auto_9673 - PLACE
      ?auto_9675 - HOIST
      ?auto_9679 - SURFACE
      ?auto_9672 - SURFACE
      ?auto_9680 - SURFACE
      ?auto_9671 - SURFACE
      ?auto_9670 - SURFACE
      ?auto_9669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9666 ?auto_9665 ) ( IS-CRATE ?auto_9662 ) ( not ( = ?auto_9668 ?auto_9665 ) ) ( HOIST-AT ?auto_9667 ?auto_9668 ) ( SURFACE-AT ?auto_9662 ?auto_9668 ) ( ON ?auto_9662 ?auto_9664 ) ( CLEAR ?auto_9662 ) ( not ( = ?auto_9663 ?auto_9662 ) ) ( not ( = ?auto_9663 ?auto_9664 ) ) ( not ( = ?auto_9662 ?auto_9664 ) ) ( not ( = ?auto_9666 ?auto_9667 ) ) ( IS-CRATE ?auto_9663 ) ( not ( = ?auto_9676 ?auto_9665 ) ) ( HOIST-AT ?auto_9674 ?auto_9676 ) ( SURFACE-AT ?auto_9663 ?auto_9676 ) ( ON ?auto_9663 ?auto_9677 ) ( CLEAR ?auto_9663 ) ( not ( = ?auto_9660 ?auto_9663 ) ) ( not ( = ?auto_9660 ?auto_9677 ) ) ( not ( = ?auto_9663 ?auto_9677 ) ) ( not ( = ?auto_9666 ?auto_9674 ) ) ( IS-CRATE ?auto_9660 ) ( not ( = ?auto_9681 ?auto_9665 ) ) ( HOIST-AT ?auto_9678 ?auto_9681 ) ( AVAILABLE ?auto_9678 ) ( SURFACE-AT ?auto_9660 ?auto_9681 ) ( ON ?auto_9660 ?auto_9682 ) ( CLEAR ?auto_9660 ) ( not ( = ?auto_9661 ?auto_9660 ) ) ( not ( = ?auto_9661 ?auto_9682 ) ) ( not ( = ?auto_9660 ?auto_9682 ) ) ( not ( = ?auto_9666 ?auto_9678 ) ) ( IS-CRATE ?auto_9661 ) ( not ( = ?auto_9673 ?auto_9665 ) ) ( HOIST-AT ?auto_9675 ?auto_9673 ) ( SURFACE-AT ?auto_9661 ?auto_9673 ) ( ON ?auto_9661 ?auto_9679 ) ( CLEAR ?auto_9661 ) ( not ( = ?auto_9659 ?auto_9661 ) ) ( not ( = ?auto_9659 ?auto_9679 ) ) ( not ( = ?auto_9661 ?auto_9679 ) ) ( not ( = ?auto_9666 ?auto_9675 ) ) ( IS-CRATE ?auto_9659 ) ( SURFACE-AT ?auto_9659 ?auto_9668 ) ( ON ?auto_9659 ?auto_9672 ) ( CLEAR ?auto_9659 ) ( not ( = ?auto_9658 ?auto_9659 ) ) ( not ( = ?auto_9658 ?auto_9672 ) ) ( not ( = ?auto_9659 ?auto_9672 ) ) ( IS-CRATE ?auto_9658 ) ( AVAILABLE ?auto_9675 ) ( SURFACE-AT ?auto_9658 ?auto_9673 ) ( ON ?auto_9658 ?auto_9680 ) ( CLEAR ?auto_9658 ) ( not ( = ?auto_9657 ?auto_9658 ) ) ( not ( = ?auto_9657 ?auto_9680 ) ) ( not ( = ?auto_9658 ?auto_9680 ) ) ( IS-CRATE ?auto_9657 ) ( AVAILABLE ?auto_9674 ) ( SURFACE-AT ?auto_9657 ?auto_9676 ) ( ON ?auto_9657 ?auto_9671 ) ( CLEAR ?auto_9657 ) ( not ( = ?auto_9656 ?auto_9657 ) ) ( not ( = ?auto_9656 ?auto_9671 ) ) ( not ( = ?auto_9657 ?auto_9671 ) ) ( SURFACE-AT ?auto_9655 ?auto_9665 ) ( CLEAR ?auto_9655 ) ( IS-CRATE ?auto_9656 ) ( AVAILABLE ?auto_9666 ) ( AVAILABLE ?auto_9667 ) ( SURFACE-AT ?auto_9656 ?auto_9668 ) ( ON ?auto_9656 ?auto_9670 ) ( CLEAR ?auto_9656 ) ( TRUCK-AT ?auto_9669 ?auto_9665 ) ( not ( = ?auto_9655 ?auto_9656 ) ) ( not ( = ?auto_9655 ?auto_9670 ) ) ( not ( = ?auto_9656 ?auto_9670 ) ) ( not ( = ?auto_9655 ?auto_9657 ) ) ( not ( = ?auto_9655 ?auto_9671 ) ) ( not ( = ?auto_9657 ?auto_9670 ) ) ( not ( = ?auto_9676 ?auto_9668 ) ) ( not ( = ?auto_9674 ?auto_9667 ) ) ( not ( = ?auto_9671 ?auto_9670 ) ) ( not ( = ?auto_9655 ?auto_9658 ) ) ( not ( = ?auto_9655 ?auto_9680 ) ) ( not ( = ?auto_9656 ?auto_9658 ) ) ( not ( = ?auto_9656 ?auto_9680 ) ) ( not ( = ?auto_9658 ?auto_9671 ) ) ( not ( = ?auto_9658 ?auto_9670 ) ) ( not ( = ?auto_9673 ?auto_9676 ) ) ( not ( = ?auto_9673 ?auto_9668 ) ) ( not ( = ?auto_9675 ?auto_9674 ) ) ( not ( = ?auto_9675 ?auto_9667 ) ) ( not ( = ?auto_9680 ?auto_9671 ) ) ( not ( = ?auto_9680 ?auto_9670 ) ) ( not ( = ?auto_9655 ?auto_9659 ) ) ( not ( = ?auto_9655 ?auto_9672 ) ) ( not ( = ?auto_9656 ?auto_9659 ) ) ( not ( = ?auto_9656 ?auto_9672 ) ) ( not ( = ?auto_9657 ?auto_9659 ) ) ( not ( = ?auto_9657 ?auto_9672 ) ) ( not ( = ?auto_9659 ?auto_9680 ) ) ( not ( = ?auto_9659 ?auto_9671 ) ) ( not ( = ?auto_9659 ?auto_9670 ) ) ( not ( = ?auto_9672 ?auto_9680 ) ) ( not ( = ?auto_9672 ?auto_9671 ) ) ( not ( = ?auto_9672 ?auto_9670 ) ) ( not ( = ?auto_9655 ?auto_9661 ) ) ( not ( = ?auto_9655 ?auto_9679 ) ) ( not ( = ?auto_9656 ?auto_9661 ) ) ( not ( = ?auto_9656 ?auto_9679 ) ) ( not ( = ?auto_9657 ?auto_9661 ) ) ( not ( = ?auto_9657 ?auto_9679 ) ) ( not ( = ?auto_9658 ?auto_9661 ) ) ( not ( = ?auto_9658 ?auto_9679 ) ) ( not ( = ?auto_9661 ?auto_9672 ) ) ( not ( = ?auto_9661 ?auto_9680 ) ) ( not ( = ?auto_9661 ?auto_9671 ) ) ( not ( = ?auto_9661 ?auto_9670 ) ) ( not ( = ?auto_9679 ?auto_9672 ) ) ( not ( = ?auto_9679 ?auto_9680 ) ) ( not ( = ?auto_9679 ?auto_9671 ) ) ( not ( = ?auto_9679 ?auto_9670 ) ) ( not ( = ?auto_9655 ?auto_9660 ) ) ( not ( = ?auto_9655 ?auto_9682 ) ) ( not ( = ?auto_9656 ?auto_9660 ) ) ( not ( = ?auto_9656 ?auto_9682 ) ) ( not ( = ?auto_9657 ?auto_9660 ) ) ( not ( = ?auto_9657 ?auto_9682 ) ) ( not ( = ?auto_9658 ?auto_9660 ) ) ( not ( = ?auto_9658 ?auto_9682 ) ) ( not ( = ?auto_9659 ?auto_9660 ) ) ( not ( = ?auto_9659 ?auto_9682 ) ) ( not ( = ?auto_9660 ?auto_9679 ) ) ( not ( = ?auto_9660 ?auto_9672 ) ) ( not ( = ?auto_9660 ?auto_9680 ) ) ( not ( = ?auto_9660 ?auto_9671 ) ) ( not ( = ?auto_9660 ?auto_9670 ) ) ( not ( = ?auto_9681 ?auto_9673 ) ) ( not ( = ?auto_9681 ?auto_9668 ) ) ( not ( = ?auto_9681 ?auto_9676 ) ) ( not ( = ?auto_9678 ?auto_9675 ) ) ( not ( = ?auto_9678 ?auto_9667 ) ) ( not ( = ?auto_9678 ?auto_9674 ) ) ( not ( = ?auto_9682 ?auto_9679 ) ) ( not ( = ?auto_9682 ?auto_9672 ) ) ( not ( = ?auto_9682 ?auto_9680 ) ) ( not ( = ?auto_9682 ?auto_9671 ) ) ( not ( = ?auto_9682 ?auto_9670 ) ) ( not ( = ?auto_9655 ?auto_9663 ) ) ( not ( = ?auto_9655 ?auto_9677 ) ) ( not ( = ?auto_9656 ?auto_9663 ) ) ( not ( = ?auto_9656 ?auto_9677 ) ) ( not ( = ?auto_9657 ?auto_9663 ) ) ( not ( = ?auto_9657 ?auto_9677 ) ) ( not ( = ?auto_9658 ?auto_9663 ) ) ( not ( = ?auto_9658 ?auto_9677 ) ) ( not ( = ?auto_9659 ?auto_9663 ) ) ( not ( = ?auto_9659 ?auto_9677 ) ) ( not ( = ?auto_9661 ?auto_9663 ) ) ( not ( = ?auto_9661 ?auto_9677 ) ) ( not ( = ?auto_9663 ?auto_9682 ) ) ( not ( = ?auto_9663 ?auto_9679 ) ) ( not ( = ?auto_9663 ?auto_9672 ) ) ( not ( = ?auto_9663 ?auto_9680 ) ) ( not ( = ?auto_9663 ?auto_9671 ) ) ( not ( = ?auto_9663 ?auto_9670 ) ) ( not ( = ?auto_9677 ?auto_9682 ) ) ( not ( = ?auto_9677 ?auto_9679 ) ) ( not ( = ?auto_9677 ?auto_9672 ) ) ( not ( = ?auto_9677 ?auto_9680 ) ) ( not ( = ?auto_9677 ?auto_9671 ) ) ( not ( = ?auto_9677 ?auto_9670 ) ) ( not ( = ?auto_9655 ?auto_9662 ) ) ( not ( = ?auto_9655 ?auto_9664 ) ) ( not ( = ?auto_9656 ?auto_9662 ) ) ( not ( = ?auto_9656 ?auto_9664 ) ) ( not ( = ?auto_9657 ?auto_9662 ) ) ( not ( = ?auto_9657 ?auto_9664 ) ) ( not ( = ?auto_9658 ?auto_9662 ) ) ( not ( = ?auto_9658 ?auto_9664 ) ) ( not ( = ?auto_9659 ?auto_9662 ) ) ( not ( = ?auto_9659 ?auto_9664 ) ) ( not ( = ?auto_9661 ?auto_9662 ) ) ( not ( = ?auto_9661 ?auto_9664 ) ) ( not ( = ?auto_9660 ?auto_9662 ) ) ( not ( = ?auto_9660 ?auto_9664 ) ) ( not ( = ?auto_9662 ?auto_9677 ) ) ( not ( = ?auto_9662 ?auto_9682 ) ) ( not ( = ?auto_9662 ?auto_9679 ) ) ( not ( = ?auto_9662 ?auto_9672 ) ) ( not ( = ?auto_9662 ?auto_9680 ) ) ( not ( = ?auto_9662 ?auto_9671 ) ) ( not ( = ?auto_9662 ?auto_9670 ) ) ( not ( = ?auto_9664 ?auto_9677 ) ) ( not ( = ?auto_9664 ?auto_9682 ) ) ( not ( = ?auto_9664 ?auto_9679 ) ) ( not ( = ?auto_9664 ?auto_9672 ) ) ( not ( = ?auto_9664 ?auto_9680 ) ) ( not ( = ?auto_9664 ?auto_9671 ) ) ( not ( = ?auto_9664 ?auto_9670 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_9655 ?auto_9656 ?auto_9657 ?auto_9658 ?auto_9659 ?auto_9661 ?auto_9660 ?auto_9663 )
      ( MAKE-1CRATE ?auto_9663 ?auto_9662 )
      ( MAKE-8CRATE-VERIFY ?auto_9655 ?auto_9656 ?auto_9657 ?auto_9658 ?auto_9659 ?auto_9661 ?auto_9660 ?auto_9663 ?auto_9662 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9685 - SURFACE
      ?auto_9686 - SURFACE
    )
    :vars
    (
      ?auto_9687 - HOIST
      ?auto_9688 - PLACE
      ?auto_9690 - PLACE
      ?auto_9691 - HOIST
      ?auto_9692 - SURFACE
      ?auto_9689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9687 ?auto_9688 ) ( SURFACE-AT ?auto_9685 ?auto_9688 ) ( CLEAR ?auto_9685 ) ( IS-CRATE ?auto_9686 ) ( AVAILABLE ?auto_9687 ) ( not ( = ?auto_9690 ?auto_9688 ) ) ( HOIST-AT ?auto_9691 ?auto_9690 ) ( AVAILABLE ?auto_9691 ) ( SURFACE-AT ?auto_9686 ?auto_9690 ) ( ON ?auto_9686 ?auto_9692 ) ( CLEAR ?auto_9686 ) ( TRUCK-AT ?auto_9689 ?auto_9688 ) ( not ( = ?auto_9685 ?auto_9686 ) ) ( not ( = ?auto_9685 ?auto_9692 ) ) ( not ( = ?auto_9686 ?auto_9692 ) ) ( not ( = ?auto_9687 ?auto_9691 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9689 ?auto_9688 ?auto_9690 )
      ( !LIFT ?auto_9691 ?auto_9686 ?auto_9692 ?auto_9690 )
      ( !LOAD ?auto_9691 ?auto_9686 ?auto_9689 ?auto_9690 )
      ( !DRIVE ?auto_9689 ?auto_9690 ?auto_9688 )
      ( !UNLOAD ?auto_9687 ?auto_9686 ?auto_9689 ?auto_9688 )
      ( !DROP ?auto_9687 ?auto_9686 ?auto_9685 ?auto_9688 )
      ( MAKE-1CRATE-VERIFY ?auto_9685 ?auto_9686 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_9703 - SURFACE
      ?auto_9704 - SURFACE
      ?auto_9705 - SURFACE
      ?auto_9706 - SURFACE
      ?auto_9707 - SURFACE
      ?auto_9710 - SURFACE
      ?auto_9708 - SURFACE
      ?auto_9712 - SURFACE
      ?auto_9711 - SURFACE
      ?auto_9709 - SURFACE
    )
    :vars
    (
      ?auto_9718 - HOIST
      ?auto_9717 - PLACE
      ?auto_9715 - PLACE
      ?auto_9716 - HOIST
      ?auto_9714 - SURFACE
      ?auto_9719 - PLACE
      ?auto_9721 - HOIST
      ?auto_9730 - SURFACE
      ?auto_9731 - PLACE
      ?auto_9732 - HOIST
      ?auto_9728 - SURFACE
      ?auto_9722 - PLACE
      ?auto_9726 - HOIST
      ?auto_9723 - SURFACE
      ?auto_9724 - SURFACE
      ?auto_9729 - SURFACE
      ?auto_9725 - SURFACE
      ?auto_9720 - SURFACE
      ?auto_9727 - SURFACE
      ?auto_9713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9718 ?auto_9717 ) ( IS-CRATE ?auto_9709 ) ( not ( = ?auto_9715 ?auto_9717 ) ) ( HOIST-AT ?auto_9716 ?auto_9715 ) ( SURFACE-AT ?auto_9709 ?auto_9715 ) ( ON ?auto_9709 ?auto_9714 ) ( CLEAR ?auto_9709 ) ( not ( = ?auto_9711 ?auto_9709 ) ) ( not ( = ?auto_9711 ?auto_9714 ) ) ( not ( = ?auto_9709 ?auto_9714 ) ) ( not ( = ?auto_9718 ?auto_9716 ) ) ( IS-CRATE ?auto_9711 ) ( not ( = ?auto_9719 ?auto_9717 ) ) ( HOIST-AT ?auto_9721 ?auto_9719 ) ( SURFACE-AT ?auto_9711 ?auto_9719 ) ( ON ?auto_9711 ?auto_9730 ) ( CLEAR ?auto_9711 ) ( not ( = ?auto_9712 ?auto_9711 ) ) ( not ( = ?auto_9712 ?auto_9730 ) ) ( not ( = ?auto_9711 ?auto_9730 ) ) ( not ( = ?auto_9718 ?auto_9721 ) ) ( IS-CRATE ?auto_9712 ) ( not ( = ?auto_9731 ?auto_9717 ) ) ( HOIST-AT ?auto_9732 ?auto_9731 ) ( SURFACE-AT ?auto_9712 ?auto_9731 ) ( ON ?auto_9712 ?auto_9728 ) ( CLEAR ?auto_9712 ) ( not ( = ?auto_9708 ?auto_9712 ) ) ( not ( = ?auto_9708 ?auto_9728 ) ) ( not ( = ?auto_9712 ?auto_9728 ) ) ( not ( = ?auto_9718 ?auto_9732 ) ) ( IS-CRATE ?auto_9708 ) ( not ( = ?auto_9722 ?auto_9717 ) ) ( HOIST-AT ?auto_9726 ?auto_9722 ) ( AVAILABLE ?auto_9726 ) ( SURFACE-AT ?auto_9708 ?auto_9722 ) ( ON ?auto_9708 ?auto_9723 ) ( CLEAR ?auto_9708 ) ( not ( = ?auto_9710 ?auto_9708 ) ) ( not ( = ?auto_9710 ?auto_9723 ) ) ( not ( = ?auto_9708 ?auto_9723 ) ) ( not ( = ?auto_9718 ?auto_9726 ) ) ( IS-CRATE ?auto_9710 ) ( SURFACE-AT ?auto_9710 ?auto_9715 ) ( ON ?auto_9710 ?auto_9724 ) ( CLEAR ?auto_9710 ) ( not ( = ?auto_9707 ?auto_9710 ) ) ( not ( = ?auto_9707 ?auto_9724 ) ) ( not ( = ?auto_9710 ?auto_9724 ) ) ( IS-CRATE ?auto_9707 ) ( SURFACE-AT ?auto_9707 ?auto_9719 ) ( ON ?auto_9707 ?auto_9729 ) ( CLEAR ?auto_9707 ) ( not ( = ?auto_9706 ?auto_9707 ) ) ( not ( = ?auto_9706 ?auto_9729 ) ) ( not ( = ?auto_9707 ?auto_9729 ) ) ( IS-CRATE ?auto_9706 ) ( AVAILABLE ?auto_9716 ) ( SURFACE-AT ?auto_9706 ?auto_9715 ) ( ON ?auto_9706 ?auto_9725 ) ( CLEAR ?auto_9706 ) ( not ( = ?auto_9705 ?auto_9706 ) ) ( not ( = ?auto_9705 ?auto_9725 ) ) ( not ( = ?auto_9706 ?auto_9725 ) ) ( IS-CRATE ?auto_9705 ) ( AVAILABLE ?auto_9732 ) ( SURFACE-AT ?auto_9705 ?auto_9731 ) ( ON ?auto_9705 ?auto_9720 ) ( CLEAR ?auto_9705 ) ( not ( = ?auto_9704 ?auto_9705 ) ) ( not ( = ?auto_9704 ?auto_9720 ) ) ( not ( = ?auto_9705 ?auto_9720 ) ) ( SURFACE-AT ?auto_9703 ?auto_9717 ) ( CLEAR ?auto_9703 ) ( IS-CRATE ?auto_9704 ) ( AVAILABLE ?auto_9718 ) ( AVAILABLE ?auto_9721 ) ( SURFACE-AT ?auto_9704 ?auto_9719 ) ( ON ?auto_9704 ?auto_9727 ) ( CLEAR ?auto_9704 ) ( TRUCK-AT ?auto_9713 ?auto_9717 ) ( not ( = ?auto_9703 ?auto_9704 ) ) ( not ( = ?auto_9703 ?auto_9727 ) ) ( not ( = ?auto_9704 ?auto_9727 ) ) ( not ( = ?auto_9703 ?auto_9705 ) ) ( not ( = ?auto_9703 ?auto_9720 ) ) ( not ( = ?auto_9705 ?auto_9727 ) ) ( not ( = ?auto_9731 ?auto_9719 ) ) ( not ( = ?auto_9732 ?auto_9721 ) ) ( not ( = ?auto_9720 ?auto_9727 ) ) ( not ( = ?auto_9703 ?auto_9706 ) ) ( not ( = ?auto_9703 ?auto_9725 ) ) ( not ( = ?auto_9704 ?auto_9706 ) ) ( not ( = ?auto_9704 ?auto_9725 ) ) ( not ( = ?auto_9706 ?auto_9720 ) ) ( not ( = ?auto_9706 ?auto_9727 ) ) ( not ( = ?auto_9715 ?auto_9731 ) ) ( not ( = ?auto_9715 ?auto_9719 ) ) ( not ( = ?auto_9716 ?auto_9732 ) ) ( not ( = ?auto_9716 ?auto_9721 ) ) ( not ( = ?auto_9725 ?auto_9720 ) ) ( not ( = ?auto_9725 ?auto_9727 ) ) ( not ( = ?auto_9703 ?auto_9707 ) ) ( not ( = ?auto_9703 ?auto_9729 ) ) ( not ( = ?auto_9704 ?auto_9707 ) ) ( not ( = ?auto_9704 ?auto_9729 ) ) ( not ( = ?auto_9705 ?auto_9707 ) ) ( not ( = ?auto_9705 ?auto_9729 ) ) ( not ( = ?auto_9707 ?auto_9725 ) ) ( not ( = ?auto_9707 ?auto_9720 ) ) ( not ( = ?auto_9707 ?auto_9727 ) ) ( not ( = ?auto_9729 ?auto_9725 ) ) ( not ( = ?auto_9729 ?auto_9720 ) ) ( not ( = ?auto_9729 ?auto_9727 ) ) ( not ( = ?auto_9703 ?auto_9710 ) ) ( not ( = ?auto_9703 ?auto_9724 ) ) ( not ( = ?auto_9704 ?auto_9710 ) ) ( not ( = ?auto_9704 ?auto_9724 ) ) ( not ( = ?auto_9705 ?auto_9710 ) ) ( not ( = ?auto_9705 ?auto_9724 ) ) ( not ( = ?auto_9706 ?auto_9710 ) ) ( not ( = ?auto_9706 ?auto_9724 ) ) ( not ( = ?auto_9710 ?auto_9729 ) ) ( not ( = ?auto_9710 ?auto_9725 ) ) ( not ( = ?auto_9710 ?auto_9720 ) ) ( not ( = ?auto_9710 ?auto_9727 ) ) ( not ( = ?auto_9724 ?auto_9729 ) ) ( not ( = ?auto_9724 ?auto_9725 ) ) ( not ( = ?auto_9724 ?auto_9720 ) ) ( not ( = ?auto_9724 ?auto_9727 ) ) ( not ( = ?auto_9703 ?auto_9708 ) ) ( not ( = ?auto_9703 ?auto_9723 ) ) ( not ( = ?auto_9704 ?auto_9708 ) ) ( not ( = ?auto_9704 ?auto_9723 ) ) ( not ( = ?auto_9705 ?auto_9708 ) ) ( not ( = ?auto_9705 ?auto_9723 ) ) ( not ( = ?auto_9706 ?auto_9708 ) ) ( not ( = ?auto_9706 ?auto_9723 ) ) ( not ( = ?auto_9707 ?auto_9708 ) ) ( not ( = ?auto_9707 ?auto_9723 ) ) ( not ( = ?auto_9708 ?auto_9724 ) ) ( not ( = ?auto_9708 ?auto_9729 ) ) ( not ( = ?auto_9708 ?auto_9725 ) ) ( not ( = ?auto_9708 ?auto_9720 ) ) ( not ( = ?auto_9708 ?auto_9727 ) ) ( not ( = ?auto_9722 ?auto_9715 ) ) ( not ( = ?auto_9722 ?auto_9719 ) ) ( not ( = ?auto_9722 ?auto_9731 ) ) ( not ( = ?auto_9726 ?auto_9716 ) ) ( not ( = ?auto_9726 ?auto_9721 ) ) ( not ( = ?auto_9726 ?auto_9732 ) ) ( not ( = ?auto_9723 ?auto_9724 ) ) ( not ( = ?auto_9723 ?auto_9729 ) ) ( not ( = ?auto_9723 ?auto_9725 ) ) ( not ( = ?auto_9723 ?auto_9720 ) ) ( not ( = ?auto_9723 ?auto_9727 ) ) ( not ( = ?auto_9703 ?auto_9712 ) ) ( not ( = ?auto_9703 ?auto_9728 ) ) ( not ( = ?auto_9704 ?auto_9712 ) ) ( not ( = ?auto_9704 ?auto_9728 ) ) ( not ( = ?auto_9705 ?auto_9712 ) ) ( not ( = ?auto_9705 ?auto_9728 ) ) ( not ( = ?auto_9706 ?auto_9712 ) ) ( not ( = ?auto_9706 ?auto_9728 ) ) ( not ( = ?auto_9707 ?auto_9712 ) ) ( not ( = ?auto_9707 ?auto_9728 ) ) ( not ( = ?auto_9710 ?auto_9712 ) ) ( not ( = ?auto_9710 ?auto_9728 ) ) ( not ( = ?auto_9712 ?auto_9723 ) ) ( not ( = ?auto_9712 ?auto_9724 ) ) ( not ( = ?auto_9712 ?auto_9729 ) ) ( not ( = ?auto_9712 ?auto_9725 ) ) ( not ( = ?auto_9712 ?auto_9720 ) ) ( not ( = ?auto_9712 ?auto_9727 ) ) ( not ( = ?auto_9728 ?auto_9723 ) ) ( not ( = ?auto_9728 ?auto_9724 ) ) ( not ( = ?auto_9728 ?auto_9729 ) ) ( not ( = ?auto_9728 ?auto_9725 ) ) ( not ( = ?auto_9728 ?auto_9720 ) ) ( not ( = ?auto_9728 ?auto_9727 ) ) ( not ( = ?auto_9703 ?auto_9711 ) ) ( not ( = ?auto_9703 ?auto_9730 ) ) ( not ( = ?auto_9704 ?auto_9711 ) ) ( not ( = ?auto_9704 ?auto_9730 ) ) ( not ( = ?auto_9705 ?auto_9711 ) ) ( not ( = ?auto_9705 ?auto_9730 ) ) ( not ( = ?auto_9706 ?auto_9711 ) ) ( not ( = ?auto_9706 ?auto_9730 ) ) ( not ( = ?auto_9707 ?auto_9711 ) ) ( not ( = ?auto_9707 ?auto_9730 ) ) ( not ( = ?auto_9710 ?auto_9711 ) ) ( not ( = ?auto_9710 ?auto_9730 ) ) ( not ( = ?auto_9708 ?auto_9711 ) ) ( not ( = ?auto_9708 ?auto_9730 ) ) ( not ( = ?auto_9711 ?auto_9728 ) ) ( not ( = ?auto_9711 ?auto_9723 ) ) ( not ( = ?auto_9711 ?auto_9724 ) ) ( not ( = ?auto_9711 ?auto_9729 ) ) ( not ( = ?auto_9711 ?auto_9725 ) ) ( not ( = ?auto_9711 ?auto_9720 ) ) ( not ( = ?auto_9711 ?auto_9727 ) ) ( not ( = ?auto_9730 ?auto_9728 ) ) ( not ( = ?auto_9730 ?auto_9723 ) ) ( not ( = ?auto_9730 ?auto_9724 ) ) ( not ( = ?auto_9730 ?auto_9729 ) ) ( not ( = ?auto_9730 ?auto_9725 ) ) ( not ( = ?auto_9730 ?auto_9720 ) ) ( not ( = ?auto_9730 ?auto_9727 ) ) ( not ( = ?auto_9703 ?auto_9709 ) ) ( not ( = ?auto_9703 ?auto_9714 ) ) ( not ( = ?auto_9704 ?auto_9709 ) ) ( not ( = ?auto_9704 ?auto_9714 ) ) ( not ( = ?auto_9705 ?auto_9709 ) ) ( not ( = ?auto_9705 ?auto_9714 ) ) ( not ( = ?auto_9706 ?auto_9709 ) ) ( not ( = ?auto_9706 ?auto_9714 ) ) ( not ( = ?auto_9707 ?auto_9709 ) ) ( not ( = ?auto_9707 ?auto_9714 ) ) ( not ( = ?auto_9710 ?auto_9709 ) ) ( not ( = ?auto_9710 ?auto_9714 ) ) ( not ( = ?auto_9708 ?auto_9709 ) ) ( not ( = ?auto_9708 ?auto_9714 ) ) ( not ( = ?auto_9712 ?auto_9709 ) ) ( not ( = ?auto_9712 ?auto_9714 ) ) ( not ( = ?auto_9709 ?auto_9730 ) ) ( not ( = ?auto_9709 ?auto_9728 ) ) ( not ( = ?auto_9709 ?auto_9723 ) ) ( not ( = ?auto_9709 ?auto_9724 ) ) ( not ( = ?auto_9709 ?auto_9729 ) ) ( not ( = ?auto_9709 ?auto_9725 ) ) ( not ( = ?auto_9709 ?auto_9720 ) ) ( not ( = ?auto_9709 ?auto_9727 ) ) ( not ( = ?auto_9714 ?auto_9730 ) ) ( not ( = ?auto_9714 ?auto_9728 ) ) ( not ( = ?auto_9714 ?auto_9723 ) ) ( not ( = ?auto_9714 ?auto_9724 ) ) ( not ( = ?auto_9714 ?auto_9729 ) ) ( not ( = ?auto_9714 ?auto_9725 ) ) ( not ( = ?auto_9714 ?auto_9720 ) ) ( not ( = ?auto_9714 ?auto_9727 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_9703 ?auto_9704 ?auto_9705 ?auto_9706 ?auto_9707 ?auto_9710 ?auto_9708 ?auto_9712 ?auto_9711 )
      ( MAKE-1CRATE ?auto_9711 ?auto_9709 )
      ( MAKE-9CRATE-VERIFY ?auto_9703 ?auto_9704 ?auto_9705 ?auto_9706 ?auto_9707 ?auto_9710 ?auto_9708 ?auto_9712 ?auto_9711 ?auto_9709 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9735 - SURFACE
      ?auto_9736 - SURFACE
    )
    :vars
    (
      ?auto_9737 - HOIST
      ?auto_9738 - PLACE
      ?auto_9740 - PLACE
      ?auto_9741 - HOIST
      ?auto_9742 - SURFACE
      ?auto_9739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9737 ?auto_9738 ) ( SURFACE-AT ?auto_9735 ?auto_9738 ) ( CLEAR ?auto_9735 ) ( IS-CRATE ?auto_9736 ) ( AVAILABLE ?auto_9737 ) ( not ( = ?auto_9740 ?auto_9738 ) ) ( HOIST-AT ?auto_9741 ?auto_9740 ) ( AVAILABLE ?auto_9741 ) ( SURFACE-AT ?auto_9736 ?auto_9740 ) ( ON ?auto_9736 ?auto_9742 ) ( CLEAR ?auto_9736 ) ( TRUCK-AT ?auto_9739 ?auto_9738 ) ( not ( = ?auto_9735 ?auto_9736 ) ) ( not ( = ?auto_9735 ?auto_9742 ) ) ( not ( = ?auto_9736 ?auto_9742 ) ) ( not ( = ?auto_9737 ?auto_9741 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9739 ?auto_9738 ?auto_9740 )
      ( !LIFT ?auto_9741 ?auto_9736 ?auto_9742 ?auto_9740 )
      ( !LOAD ?auto_9741 ?auto_9736 ?auto_9739 ?auto_9740 )
      ( !DRIVE ?auto_9739 ?auto_9740 ?auto_9738 )
      ( !UNLOAD ?auto_9737 ?auto_9736 ?auto_9739 ?auto_9738 )
      ( !DROP ?auto_9737 ?auto_9736 ?auto_9735 ?auto_9738 )
      ( MAKE-1CRATE-VERIFY ?auto_9735 ?auto_9736 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_9754 - SURFACE
      ?auto_9755 - SURFACE
      ?auto_9756 - SURFACE
      ?auto_9757 - SURFACE
      ?auto_9758 - SURFACE
      ?auto_9761 - SURFACE
      ?auto_9759 - SURFACE
      ?auto_9763 - SURFACE
      ?auto_9762 - SURFACE
      ?auto_9760 - SURFACE
      ?auto_9764 - SURFACE
    )
    :vars
    (
      ?auto_9766 - HOIST
      ?auto_9767 - PLACE
      ?auto_9768 - PLACE
      ?auto_9770 - HOIST
      ?auto_9769 - SURFACE
      ?auto_9784 - PLACE
      ?auto_9785 - HOIST
      ?auto_9771 - SURFACE
      ?auto_9781 - SURFACE
      ?auto_9782 - PLACE
      ?auto_9779 - HOIST
      ?auto_9778 - SURFACE
      ?auto_9777 - PLACE
      ?auto_9780 - HOIST
      ?auto_9774 - SURFACE
      ?auto_9773 - SURFACE
      ?auto_9783 - SURFACE
      ?auto_9772 - SURFACE
      ?auto_9775 - SURFACE
      ?auto_9776 - SURFACE
      ?auto_9765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9766 ?auto_9767 ) ( IS-CRATE ?auto_9764 ) ( not ( = ?auto_9768 ?auto_9767 ) ) ( HOIST-AT ?auto_9770 ?auto_9768 ) ( SURFACE-AT ?auto_9764 ?auto_9768 ) ( ON ?auto_9764 ?auto_9769 ) ( CLEAR ?auto_9764 ) ( not ( = ?auto_9760 ?auto_9764 ) ) ( not ( = ?auto_9760 ?auto_9769 ) ) ( not ( = ?auto_9764 ?auto_9769 ) ) ( not ( = ?auto_9766 ?auto_9770 ) ) ( IS-CRATE ?auto_9760 ) ( not ( = ?auto_9784 ?auto_9767 ) ) ( HOIST-AT ?auto_9785 ?auto_9784 ) ( SURFACE-AT ?auto_9760 ?auto_9784 ) ( ON ?auto_9760 ?auto_9771 ) ( CLEAR ?auto_9760 ) ( not ( = ?auto_9762 ?auto_9760 ) ) ( not ( = ?auto_9762 ?auto_9771 ) ) ( not ( = ?auto_9760 ?auto_9771 ) ) ( not ( = ?auto_9766 ?auto_9785 ) ) ( IS-CRATE ?auto_9762 ) ( SURFACE-AT ?auto_9762 ?auto_9768 ) ( ON ?auto_9762 ?auto_9781 ) ( CLEAR ?auto_9762 ) ( not ( = ?auto_9763 ?auto_9762 ) ) ( not ( = ?auto_9763 ?auto_9781 ) ) ( not ( = ?auto_9762 ?auto_9781 ) ) ( IS-CRATE ?auto_9763 ) ( not ( = ?auto_9782 ?auto_9767 ) ) ( HOIST-AT ?auto_9779 ?auto_9782 ) ( SURFACE-AT ?auto_9763 ?auto_9782 ) ( ON ?auto_9763 ?auto_9778 ) ( CLEAR ?auto_9763 ) ( not ( = ?auto_9759 ?auto_9763 ) ) ( not ( = ?auto_9759 ?auto_9778 ) ) ( not ( = ?auto_9763 ?auto_9778 ) ) ( not ( = ?auto_9766 ?auto_9779 ) ) ( IS-CRATE ?auto_9759 ) ( not ( = ?auto_9777 ?auto_9767 ) ) ( HOIST-AT ?auto_9780 ?auto_9777 ) ( AVAILABLE ?auto_9780 ) ( SURFACE-AT ?auto_9759 ?auto_9777 ) ( ON ?auto_9759 ?auto_9774 ) ( CLEAR ?auto_9759 ) ( not ( = ?auto_9761 ?auto_9759 ) ) ( not ( = ?auto_9761 ?auto_9774 ) ) ( not ( = ?auto_9759 ?auto_9774 ) ) ( not ( = ?auto_9766 ?auto_9780 ) ) ( IS-CRATE ?auto_9761 ) ( SURFACE-AT ?auto_9761 ?auto_9784 ) ( ON ?auto_9761 ?auto_9773 ) ( CLEAR ?auto_9761 ) ( not ( = ?auto_9758 ?auto_9761 ) ) ( not ( = ?auto_9758 ?auto_9773 ) ) ( not ( = ?auto_9761 ?auto_9773 ) ) ( IS-CRATE ?auto_9758 ) ( SURFACE-AT ?auto_9758 ?auto_9768 ) ( ON ?auto_9758 ?auto_9783 ) ( CLEAR ?auto_9758 ) ( not ( = ?auto_9757 ?auto_9758 ) ) ( not ( = ?auto_9757 ?auto_9783 ) ) ( not ( = ?auto_9758 ?auto_9783 ) ) ( IS-CRATE ?auto_9757 ) ( AVAILABLE ?auto_9785 ) ( SURFACE-AT ?auto_9757 ?auto_9784 ) ( ON ?auto_9757 ?auto_9772 ) ( CLEAR ?auto_9757 ) ( not ( = ?auto_9756 ?auto_9757 ) ) ( not ( = ?auto_9756 ?auto_9772 ) ) ( not ( = ?auto_9757 ?auto_9772 ) ) ( IS-CRATE ?auto_9756 ) ( AVAILABLE ?auto_9779 ) ( SURFACE-AT ?auto_9756 ?auto_9782 ) ( ON ?auto_9756 ?auto_9775 ) ( CLEAR ?auto_9756 ) ( not ( = ?auto_9755 ?auto_9756 ) ) ( not ( = ?auto_9755 ?auto_9775 ) ) ( not ( = ?auto_9756 ?auto_9775 ) ) ( SURFACE-AT ?auto_9754 ?auto_9767 ) ( CLEAR ?auto_9754 ) ( IS-CRATE ?auto_9755 ) ( AVAILABLE ?auto_9766 ) ( AVAILABLE ?auto_9770 ) ( SURFACE-AT ?auto_9755 ?auto_9768 ) ( ON ?auto_9755 ?auto_9776 ) ( CLEAR ?auto_9755 ) ( TRUCK-AT ?auto_9765 ?auto_9767 ) ( not ( = ?auto_9754 ?auto_9755 ) ) ( not ( = ?auto_9754 ?auto_9776 ) ) ( not ( = ?auto_9755 ?auto_9776 ) ) ( not ( = ?auto_9754 ?auto_9756 ) ) ( not ( = ?auto_9754 ?auto_9775 ) ) ( not ( = ?auto_9756 ?auto_9776 ) ) ( not ( = ?auto_9782 ?auto_9768 ) ) ( not ( = ?auto_9779 ?auto_9770 ) ) ( not ( = ?auto_9775 ?auto_9776 ) ) ( not ( = ?auto_9754 ?auto_9757 ) ) ( not ( = ?auto_9754 ?auto_9772 ) ) ( not ( = ?auto_9755 ?auto_9757 ) ) ( not ( = ?auto_9755 ?auto_9772 ) ) ( not ( = ?auto_9757 ?auto_9775 ) ) ( not ( = ?auto_9757 ?auto_9776 ) ) ( not ( = ?auto_9784 ?auto_9782 ) ) ( not ( = ?auto_9784 ?auto_9768 ) ) ( not ( = ?auto_9785 ?auto_9779 ) ) ( not ( = ?auto_9785 ?auto_9770 ) ) ( not ( = ?auto_9772 ?auto_9775 ) ) ( not ( = ?auto_9772 ?auto_9776 ) ) ( not ( = ?auto_9754 ?auto_9758 ) ) ( not ( = ?auto_9754 ?auto_9783 ) ) ( not ( = ?auto_9755 ?auto_9758 ) ) ( not ( = ?auto_9755 ?auto_9783 ) ) ( not ( = ?auto_9756 ?auto_9758 ) ) ( not ( = ?auto_9756 ?auto_9783 ) ) ( not ( = ?auto_9758 ?auto_9772 ) ) ( not ( = ?auto_9758 ?auto_9775 ) ) ( not ( = ?auto_9758 ?auto_9776 ) ) ( not ( = ?auto_9783 ?auto_9772 ) ) ( not ( = ?auto_9783 ?auto_9775 ) ) ( not ( = ?auto_9783 ?auto_9776 ) ) ( not ( = ?auto_9754 ?auto_9761 ) ) ( not ( = ?auto_9754 ?auto_9773 ) ) ( not ( = ?auto_9755 ?auto_9761 ) ) ( not ( = ?auto_9755 ?auto_9773 ) ) ( not ( = ?auto_9756 ?auto_9761 ) ) ( not ( = ?auto_9756 ?auto_9773 ) ) ( not ( = ?auto_9757 ?auto_9761 ) ) ( not ( = ?auto_9757 ?auto_9773 ) ) ( not ( = ?auto_9761 ?auto_9783 ) ) ( not ( = ?auto_9761 ?auto_9772 ) ) ( not ( = ?auto_9761 ?auto_9775 ) ) ( not ( = ?auto_9761 ?auto_9776 ) ) ( not ( = ?auto_9773 ?auto_9783 ) ) ( not ( = ?auto_9773 ?auto_9772 ) ) ( not ( = ?auto_9773 ?auto_9775 ) ) ( not ( = ?auto_9773 ?auto_9776 ) ) ( not ( = ?auto_9754 ?auto_9759 ) ) ( not ( = ?auto_9754 ?auto_9774 ) ) ( not ( = ?auto_9755 ?auto_9759 ) ) ( not ( = ?auto_9755 ?auto_9774 ) ) ( not ( = ?auto_9756 ?auto_9759 ) ) ( not ( = ?auto_9756 ?auto_9774 ) ) ( not ( = ?auto_9757 ?auto_9759 ) ) ( not ( = ?auto_9757 ?auto_9774 ) ) ( not ( = ?auto_9758 ?auto_9759 ) ) ( not ( = ?auto_9758 ?auto_9774 ) ) ( not ( = ?auto_9759 ?auto_9773 ) ) ( not ( = ?auto_9759 ?auto_9783 ) ) ( not ( = ?auto_9759 ?auto_9772 ) ) ( not ( = ?auto_9759 ?auto_9775 ) ) ( not ( = ?auto_9759 ?auto_9776 ) ) ( not ( = ?auto_9777 ?auto_9784 ) ) ( not ( = ?auto_9777 ?auto_9768 ) ) ( not ( = ?auto_9777 ?auto_9782 ) ) ( not ( = ?auto_9780 ?auto_9785 ) ) ( not ( = ?auto_9780 ?auto_9770 ) ) ( not ( = ?auto_9780 ?auto_9779 ) ) ( not ( = ?auto_9774 ?auto_9773 ) ) ( not ( = ?auto_9774 ?auto_9783 ) ) ( not ( = ?auto_9774 ?auto_9772 ) ) ( not ( = ?auto_9774 ?auto_9775 ) ) ( not ( = ?auto_9774 ?auto_9776 ) ) ( not ( = ?auto_9754 ?auto_9763 ) ) ( not ( = ?auto_9754 ?auto_9778 ) ) ( not ( = ?auto_9755 ?auto_9763 ) ) ( not ( = ?auto_9755 ?auto_9778 ) ) ( not ( = ?auto_9756 ?auto_9763 ) ) ( not ( = ?auto_9756 ?auto_9778 ) ) ( not ( = ?auto_9757 ?auto_9763 ) ) ( not ( = ?auto_9757 ?auto_9778 ) ) ( not ( = ?auto_9758 ?auto_9763 ) ) ( not ( = ?auto_9758 ?auto_9778 ) ) ( not ( = ?auto_9761 ?auto_9763 ) ) ( not ( = ?auto_9761 ?auto_9778 ) ) ( not ( = ?auto_9763 ?auto_9774 ) ) ( not ( = ?auto_9763 ?auto_9773 ) ) ( not ( = ?auto_9763 ?auto_9783 ) ) ( not ( = ?auto_9763 ?auto_9772 ) ) ( not ( = ?auto_9763 ?auto_9775 ) ) ( not ( = ?auto_9763 ?auto_9776 ) ) ( not ( = ?auto_9778 ?auto_9774 ) ) ( not ( = ?auto_9778 ?auto_9773 ) ) ( not ( = ?auto_9778 ?auto_9783 ) ) ( not ( = ?auto_9778 ?auto_9772 ) ) ( not ( = ?auto_9778 ?auto_9775 ) ) ( not ( = ?auto_9778 ?auto_9776 ) ) ( not ( = ?auto_9754 ?auto_9762 ) ) ( not ( = ?auto_9754 ?auto_9781 ) ) ( not ( = ?auto_9755 ?auto_9762 ) ) ( not ( = ?auto_9755 ?auto_9781 ) ) ( not ( = ?auto_9756 ?auto_9762 ) ) ( not ( = ?auto_9756 ?auto_9781 ) ) ( not ( = ?auto_9757 ?auto_9762 ) ) ( not ( = ?auto_9757 ?auto_9781 ) ) ( not ( = ?auto_9758 ?auto_9762 ) ) ( not ( = ?auto_9758 ?auto_9781 ) ) ( not ( = ?auto_9761 ?auto_9762 ) ) ( not ( = ?auto_9761 ?auto_9781 ) ) ( not ( = ?auto_9759 ?auto_9762 ) ) ( not ( = ?auto_9759 ?auto_9781 ) ) ( not ( = ?auto_9762 ?auto_9778 ) ) ( not ( = ?auto_9762 ?auto_9774 ) ) ( not ( = ?auto_9762 ?auto_9773 ) ) ( not ( = ?auto_9762 ?auto_9783 ) ) ( not ( = ?auto_9762 ?auto_9772 ) ) ( not ( = ?auto_9762 ?auto_9775 ) ) ( not ( = ?auto_9762 ?auto_9776 ) ) ( not ( = ?auto_9781 ?auto_9778 ) ) ( not ( = ?auto_9781 ?auto_9774 ) ) ( not ( = ?auto_9781 ?auto_9773 ) ) ( not ( = ?auto_9781 ?auto_9783 ) ) ( not ( = ?auto_9781 ?auto_9772 ) ) ( not ( = ?auto_9781 ?auto_9775 ) ) ( not ( = ?auto_9781 ?auto_9776 ) ) ( not ( = ?auto_9754 ?auto_9760 ) ) ( not ( = ?auto_9754 ?auto_9771 ) ) ( not ( = ?auto_9755 ?auto_9760 ) ) ( not ( = ?auto_9755 ?auto_9771 ) ) ( not ( = ?auto_9756 ?auto_9760 ) ) ( not ( = ?auto_9756 ?auto_9771 ) ) ( not ( = ?auto_9757 ?auto_9760 ) ) ( not ( = ?auto_9757 ?auto_9771 ) ) ( not ( = ?auto_9758 ?auto_9760 ) ) ( not ( = ?auto_9758 ?auto_9771 ) ) ( not ( = ?auto_9761 ?auto_9760 ) ) ( not ( = ?auto_9761 ?auto_9771 ) ) ( not ( = ?auto_9759 ?auto_9760 ) ) ( not ( = ?auto_9759 ?auto_9771 ) ) ( not ( = ?auto_9763 ?auto_9760 ) ) ( not ( = ?auto_9763 ?auto_9771 ) ) ( not ( = ?auto_9760 ?auto_9781 ) ) ( not ( = ?auto_9760 ?auto_9778 ) ) ( not ( = ?auto_9760 ?auto_9774 ) ) ( not ( = ?auto_9760 ?auto_9773 ) ) ( not ( = ?auto_9760 ?auto_9783 ) ) ( not ( = ?auto_9760 ?auto_9772 ) ) ( not ( = ?auto_9760 ?auto_9775 ) ) ( not ( = ?auto_9760 ?auto_9776 ) ) ( not ( = ?auto_9771 ?auto_9781 ) ) ( not ( = ?auto_9771 ?auto_9778 ) ) ( not ( = ?auto_9771 ?auto_9774 ) ) ( not ( = ?auto_9771 ?auto_9773 ) ) ( not ( = ?auto_9771 ?auto_9783 ) ) ( not ( = ?auto_9771 ?auto_9772 ) ) ( not ( = ?auto_9771 ?auto_9775 ) ) ( not ( = ?auto_9771 ?auto_9776 ) ) ( not ( = ?auto_9754 ?auto_9764 ) ) ( not ( = ?auto_9754 ?auto_9769 ) ) ( not ( = ?auto_9755 ?auto_9764 ) ) ( not ( = ?auto_9755 ?auto_9769 ) ) ( not ( = ?auto_9756 ?auto_9764 ) ) ( not ( = ?auto_9756 ?auto_9769 ) ) ( not ( = ?auto_9757 ?auto_9764 ) ) ( not ( = ?auto_9757 ?auto_9769 ) ) ( not ( = ?auto_9758 ?auto_9764 ) ) ( not ( = ?auto_9758 ?auto_9769 ) ) ( not ( = ?auto_9761 ?auto_9764 ) ) ( not ( = ?auto_9761 ?auto_9769 ) ) ( not ( = ?auto_9759 ?auto_9764 ) ) ( not ( = ?auto_9759 ?auto_9769 ) ) ( not ( = ?auto_9763 ?auto_9764 ) ) ( not ( = ?auto_9763 ?auto_9769 ) ) ( not ( = ?auto_9762 ?auto_9764 ) ) ( not ( = ?auto_9762 ?auto_9769 ) ) ( not ( = ?auto_9764 ?auto_9771 ) ) ( not ( = ?auto_9764 ?auto_9781 ) ) ( not ( = ?auto_9764 ?auto_9778 ) ) ( not ( = ?auto_9764 ?auto_9774 ) ) ( not ( = ?auto_9764 ?auto_9773 ) ) ( not ( = ?auto_9764 ?auto_9783 ) ) ( not ( = ?auto_9764 ?auto_9772 ) ) ( not ( = ?auto_9764 ?auto_9775 ) ) ( not ( = ?auto_9764 ?auto_9776 ) ) ( not ( = ?auto_9769 ?auto_9771 ) ) ( not ( = ?auto_9769 ?auto_9781 ) ) ( not ( = ?auto_9769 ?auto_9778 ) ) ( not ( = ?auto_9769 ?auto_9774 ) ) ( not ( = ?auto_9769 ?auto_9773 ) ) ( not ( = ?auto_9769 ?auto_9783 ) ) ( not ( = ?auto_9769 ?auto_9772 ) ) ( not ( = ?auto_9769 ?auto_9775 ) ) ( not ( = ?auto_9769 ?auto_9776 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_9754 ?auto_9755 ?auto_9756 ?auto_9757 ?auto_9758 ?auto_9761 ?auto_9759 ?auto_9763 ?auto_9762 ?auto_9760 )
      ( MAKE-1CRATE ?auto_9760 ?auto_9764 )
      ( MAKE-10CRATE-VERIFY ?auto_9754 ?auto_9755 ?auto_9756 ?auto_9757 ?auto_9758 ?auto_9761 ?auto_9759 ?auto_9763 ?auto_9762 ?auto_9760 ?auto_9764 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9788 - SURFACE
      ?auto_9789 - SURFACE
    )
    :vars
    (
      ?auto_9790 - HOIST
      ?auto_9791 - PLACE
      ?auto_9793 - PLACE
      ?auto_9794 - HOIST
      ?auto_9795 - SURFACE
      ?auto_9792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9790 ?auto_9791 ) ( SURFACE-AT ?auto_9788 ?auto_9791 ) ( CLEAR ?auto_9788 ) ( IS-CRATE ?auto_9789 ) ( AVAILABLE ?auto_9790 ) ( not ( = ?auto_9793 ?auto_9791 ) ) ( HOIST-AT ?auto_9794 ?auto_9793 ) ( AVAILABLE ?auto_9794 ) ( SURFACE-AT ?auto_9789 ?auto_9793 ) ( ON ?auto_9789 ?auto_9795 ) ( CLEAR ?auto_9789 ) ( TRUCK-AT ?auto_9792 ?auto_9791 ) ( not ( = ?auto_9788 ?auto_9789 ) ) ( not ( = ?auto_9788 ?auto_9795 ) ) ( not ( = ?auto_9789 ?auto_9795 ) ) ( not ( = ?auto_9790 ?auto_9794 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9792 ?auto_9791 ?auto_9793 )
      ( !LIFT ?auto_9794 ?auto_9789 ?auto_9795 ?auto_9793 )
      ( !LOAD ?auto_9794 ?auto_9789 ?auto_9792 ?auto_9793 )
      ( !DRIVE ?auto_9792 ?auto_9793 ?auto_9791 )
      ( !UNLOAD ?auto_9790 ?auto_9789 ?auto_9792 ?auto_9791 )
      ( !DROP ?auto_9790 ?auto_9789 ?auto_9788 ?auto_9791 )
      ( MAKE-1CRATE-VERIFY ?auto_9788 ?auto_9789 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_9808 - SURFACE
      ?auto_9809 - SURFACE
      ?auto_9810 - SURFACE
      ?auto_9811 - SURFACE
      ?auto_9812 - SURFACE
      ?auto_9815 - SURFACE
      ?auto_9813 - SURFACE
      ?auto_9817 - SURFACE
      ?auto_9816 - SURFACE
      ?auto_9814 - SURFACE
      ?auto_9819 - SURFACE
      ?auto_9818 - SURFACE
    )
    :vars
    (
      ?auto_9823 - HOIST
      ?auto_9820 - PLACE
      ?auto_9824 - PLACE
      ?auto_9822 - HOIST
      ?auto_9825 - SURFACE
      ?auto_9826 - PLACE
      ?auto_9827 - HOIST
      ?auto_9830 - SURFACE
      ?auto_9839 - PLACE
      ?auto_9831 - HOIST
      ?auto_9834 - SURFACE
      ?auto_9841 - SURFACE
      ?auto_9836 - PLACE
      ?auto_9832 - HOIST
      ?auto_9828 - SURFACE
      ?auto_9835 - SURFACE
      ?auto_9837 - SURFACE
      ?auto_9840 - SURFACE
      ?auto_9829 - SURFACE
      ?auto_9838 - SURFACE
      ?auto_9833 - SURFACE
      ?auto_9821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9823 ?auto_9820 ) ( IS-CRATE ?auto_9818 ) ( not ( = ?auto_9824 ?auto_9820 ) ) ( HOIST-AT ?auto_9822 ?auto_9824 ) ( SURFACE-AT ?auto_9818 ?auto_9824 ) ( ON ?auto_9818 ?auto_9825 ) ( CLEAR ?auto_9818 ) ( not ( = ?auto_9819 ?auto_9818 ) ) ( not ( = ?auto_9819 ?auto_9825 ) ) ( not ( = ?auto_9818 ?auto_9825 ) ) ( not ( = ?auto_9823 ?auto_9822 ) ) ( IS-CRATE ?auto_9819 ) ( not ( = ?auto_9826 ?auto_9820 ) ) ( HOIST-AT ?auto_9827 ?auto_9826 ) ( SURFACE-AT ?auto_9819 ?auto_9826 ) ( ON ?auto_9819 ?auto_9830 ) ( CLEAR ?auto_9819 ) ( not ( = ?auto_9814 ?auto_9819 ) ) ( not ( = ?auto_9814 ?auto_9830 ) ) ( not ( = ?auto_9819 ?auto_9830 ) ) ( not ( = ?auto_9823 ?auto_9827 ) ) ( IS-CRATE ?auto_9814 ) ( not ( = ?auto_9839 ?auto_9820 ) ) ( HOIST-AT ?auto_9831 ?auto_9839 ) ( SURFACE-AT ?auto_9814 ?auto_9839 ) ( ON ?auto_9814 ?auto_9834 ) ( CLEAR ?auto_9814 ) ( not ( = ?auto_9816 ?auto_9814 ) ) ( not ( = ?auto_9816 ?auto_9834 ) ) ( not ( = ?auto_9814 ?auto_9834 ) ) ( not ( = ?auto_9823 ?auto_9831 ) ) ( IS-CRATE ?auto_9816 ) ( SURFACE-AT ?auto_9816 ?auto_9826 ) ( ON ?auto_9816 ?auto_9841 ) ( CLEAR ?auto_9816 ) ( not ( = ?auto_9817 ?auto_9816 ) ) ( not ( = ?auto_9817 ?auto_9841 ) ) ( not ( = ?auto_9816 ?auto_9841 ) ) ( IS-CRATE ?auto_9817 ) ( not ( = ?auto_9836 ?auto_9820 ) ) ( HOIST-AT ?auto_9832 ?auto_9836 ) ( SURFACE-AT ?auto_9817 ?auto_9836 ) ( ON ?auto_9817 ?auto_9828 ) ( CLEAR ?auto_9817 ) ( not ( = ?auto_9813 ?auto_9817 ) ) ( not ( = ?auto_9813 ?auto_9828 ) ) ( not ( = ?auto_9817 ?auto_9828 ) ) ( not ( = ?auto_9823 ?auto_9832 ) ) ( IS-CRATE ?auto_9813 ) ( AVAILABLE ?auto_9822 ) ( SURFACE-AT ?auto_9813 ?auto_9824 ) ( ON ?auto_9813 ?auto_9835 ) ( CLEAR ?auto_9813 ) ( not ( = ?auto_9815 ?auto_9813 ) ) ( not ( = ?auto_9815 ?auto_9835 ) ) ( not ( = ?auto_9813 ?auto_9835 ) ) ( IS-CRATE ?auto_9815 ) ( SURFACE-AT ?auto_9815 ?auto_9839 ) ( ON ?auto_9815 ?auto_9837 ) ( CLEAR ?auto_9815 ) ( not ( = ?auto_9812 ?auto_9815 ) ) ( not ( = ?auto_9812 ?auto_9837 ) ) ( not ( = ?auto_9815 ?auto_9837 ) ) ( IS-CRATE ?auto_9812 ) ( SURFACE-AT ?auto_9812 ?auto_9826 ) ( ON ?auto_9812 ?auto_9840 ) ( CLEAR ?auto_9812 ) ( not ( = ?auto_9811 ?auto_9812 ) ) ( not ( = ?auto_9811 ?auto_9840 ) ) ( not ( = ?auto_9812 ?auto_9840 ) ) ( IS-CRATE ?auto_9811 ) ( AVAILABLE ?auto_9831 ) ( SURFACE-AT ?auto_9811 ?auto_9839 ) ( ON ?auto_9811 ?auto_9829 ) ( CLEAR ?auto_9811 ) ( not ( = ?auto_9810 ?auto_9811 ) ) ( not ( = ?auto_9810 ?auto_9829 ) ) ( not ( = ?auto_9811 ?auto_9829 ) ) ( IS-CRATE ?auto_9810 ) ( AVAILABLE ?auto_9832 ) ( SURFACE-AT ?auto_9810 ?auto_9836 ) ( ON ?auto_9810 ?auto_9838 ) ( CLEAR ?auto_9810 ) ( not ( = ?auto_9809 ?auto_9810 ) ) ( not ( = ?auto_9809 ?auto_9838 ) ) ( not ( = ?auto_9810 ?auto_9838 ) ) ( SURFACE-AT ?auto_9808 ?auto_9820 ) ( CLEAR ?auto_9808 ) ( IS-CRATE ?auto_9809 ) ( AVAILABLE ?auto_9823 ) ( AVAILABLE ?auto_9827 ) ( SURFACE-AT ?auto_9809 ?auto_9826 ) ( ON ?auto_9809 ?auto_9833 ) ( CLEAR ?auto_9809 ) ( TRUCK-AT ?auto_9821 ?auto_9820 ) ( not ( = ?auto_9808 ?auto_9809 ) ) ( not ( = ?auto_9808 ?auto_9833 ) ) ( not ( = ?auto_9809 ?auto_9833 ) ) ( not ( = ?auto_9808 ?auto_9810 ) ) ( not ( = ?auto_9808 ?auto_9838 ) ) ( not ( = ?auto_9810 ?auto_9833 ) ) ( not ( = ?auto_9836 ?auto_9826 ) ) ( not ( = ?auto_9832 ?auto_9827 ) ) ( not ( = ?auto_9838 ?auto_9833 ) ) ( not ( = ?auto_9808 ?auto_9811 ) ) ( not ( = ?auto_9808 ?auto_9829 ) ) ( not ( = ?auto_9809 ?auto_9811 ) ) ( not ( = ?auto_9809 ?auto_9829 ) ) ( not ( = ?auto_9811 ?auto_9838 ) ) ( not ( = ?auto_9811 ?auto_9833 ) ) ( not ( = ?auto_9839 ?auto_9836 ) ) ( not ( = ?auto_9839 ?auto_9826 ) ) ( not ( = ?auto_9831 ?auto_9832 ) ) ( not ( = ?auto_9831 ?auto_9827 ) ) ( not ( = ?auto_9829 ?auto_9838 ) ) ( not ( = ?auto_9829 ?auto_9833 ) ) ( not ( = ?auto_9808 ?auto_9812 ) ) ( not ( = ?auto_9808 ?auto_9840 ) ) ( not ( = ?auto_9809 ?auto_9812 ) ) ( not ( = ?auto_9809 ?auto_9840 ) ) ( not ( = ?auto_9810 ?auto_9812 ) ) ( not ( = ?auto_9810 ?auto_9840 ) ) ( not ( = ?auto_9812 ?auto_9829 ) ) ( not ( = ?auto_9812 ?auto_9838 ) ) ( not ( = ?auto_9812 ?auto_9833 ) ) ( not ( = ?auto_9840 ?auto_9829 ) ) ( not ( = ?auto_9840 ?auto_9838 ) ) ( not ( = ?auto_9840 ?auto_9833 ) ) ( not ( = ?auto_9808 ?auto_9815 ) ) ( not ( = ?auto_9808 ?auto_9837 ) ) ( not ( = ?auto_9809 ?auto_9815 ) ) ( not ( = ?auto_9809 ?auto_9837 ) ) ( not ( = ?auto_9810 ?auto_9815 ) ) ( not ( = ?auto_9810 ?auto_9837 ) ) ( not ( = ?auto_9811 ?auto_9815 ) ) ( not ( = ?auto_9811 ?auto_9837 ) ) ( not ( = ?auto_9815 ?auto_9840 ) ) ( not ( = ?auto_9815 ?auto_9829 ) ) ( not ( = ?auto_9815 ?auto_9838 ) ) ( not ( = ?auto_9815 ?auto_9833 ) ) ( not ( = ?auto_9837 ?auto_9840 ) ) ( not ( = ?auto_9837 ?auto_9829 ) ) ( not ( = ?auto_9837 ?auto_9838 ) ) ( not ( = ?auto_9837 ?auto_9833 ) ) ( not ( = ?auto_9808 ?auto_9813 ) ) ( not ( = ?auto_9808 ?auto_9835 ) ) ( not ( = ?auto_9809 ?auto_9813 ) ) ( not ( = ?auto_9809 ?auto_9835 ) ) ( not ( = ?auto_9810 ?auto_9813 ) ) ( not ( = ?auto_9810 ?auto_9835 ) ) ( not ( = ?auto_9811 ?auto_9813 ) ) ( not ( = ?auto_9811 ?auto_9835 ) ) ( not ( = ?auto_9812 ?auto_9813 ) ) ( not ( = ?auto_9812 ?auto_9835 ) ) ( not ( = ?auto_9813 ?auto_9837 ) ) ( not ( = ?auto_9813 ?auto_9840 ) ) ( not ( = ?auto_9813 ?auto_9829 ) ) ( not ( = ?auto_9813 ?auto_9838 ) ) ( not ( = ?auto_9813 ?auto_9833 ) ) ( not ( = ?auto_9824 ?auto_9839 ) ) ( not ( = ?auto_9824 ?auto_9826 ) ) ( not ( = ?auto_9824 ?auto_9836 ) ) ( not ( = ?auto_9822 ?auto_9831 ) ) ( not ( = ?auto_9822 ?auto_9827 ) ) ( not ( = ?auto_9822 ?auto_9832 ) ) ( not ( = ?auto_9835 ?auto_9837 ) ) ( not ( = ?auto_9835 ?auto_9840 ) ) ( not ( = ?auto_9835 ?auto_9829 ) ) ( not ( = ?auto_9835 ?auto_9838 ) ) ( not ( = ?auto_9835 ?auto_9833 ) ) ( not ( = ?auto_9808 ?auto_9817 ) ) ( not ( = ?auto_9808 ?auto_9828 ) ) ( not ( = ?auto_9809 ?auto_9817 ) ) ( not ( = ?auto_9809 ?auto_9828 ) ) ( not ( = ?auto_9810 ?auto_9817 ) ) ( not ( = ?auto_9810 ?auto_9828 ) ) ( not ( = ?auto_9811 ?auto_9817 ) ) ( not ( = ?auto_9811 ?auto_9828 ) ) ( not ( = ?auto_9812 ?auto_9817 ) ) ( not ( = ?auto_9812 ?auto_9828 ) ) ( not ( = ?auto_9815 ?auto_9817 ) ) ( not ( = ?auto_9815 ?auto_9828 ) ) ( not ( = ?auto_9817 ?auto_9835 ) ) ( not ( = ?auto_9817 ?auto_9837 ) ) ( not ( = ?auto_9817 ?auto_9840 ) ) ( not ( = ?auto_9817 ?auto_9829 ) ) ( not ( = ?auto_9817 ?auto_9838 ) ) ( not ( = ?auto_9817 ?auto_9833 ) ) ( not ( = ?auto_9828 ?auto_9835 ) ) ( not ( = ?auto_9828 ?auto_9837 ) ) ( not ( = ?auto_9828 ?auto_9840 ) ) ( not ( = ?auto_9828 ?auto_9829 ) ) ( not ( = ?auto_9828 ?auto_9838 ) ) ( not ( = ?auto_9828 ?auto_9833 ) ) ( not ( = ?auto_9808 ?auto_9816 ) ) ( not ( = ?auto_9808 ?auto_9841 ) ) ( not ( = ?auto_9809 ?auto_9816 ) ) ( not ( = ?auto_9809 ?auto_9841 ) ) ( not ( = ?auto_9810 ?auto_9816 ) ) ( not ( = ?auto_9810 ?auto_9841 ) ) ( not ( = ?auto_9811 ?auto_9816 ) ) ( not ( = ?auto_9811 ?auto_9841 ) ) ( not ( = ?auto_9812 ?auto_9816 ) ) ( not ( = ?auto_9812 ?auto_9841 ) ) ( not ( = ?auto_9815 ?auto_9816 ) ) ( not ( = ?auto_9815 ?auto_9841 ) ) ( not ( = ?auto_9813 ?auto_9816 ) ) ( not ( = ?auto_9813 ?auto_9841 ) ) ( not ( = ?auto_9816 ?auto_9828 ) ) ( not ( = ?auto_9816 ?auto_9835 ) ) ( not ( = ?auto_9816 ?auto_9837 ) ) ( not ( = ?auto_9816 ?auto_9840 ) ) ( not ( = ?auto_9816 ?auto_9829 ) ) ( not ( = ?auto_9816 ?auto_9838 ) ) ( not ( = ?auto_9816 ?auto_9833 ) ) ( not ( = ?auto_9841 ?auto_9828 ) ) ( not ( = ?auto_9841 ?auto_9835 ) ) ( not ( = ?auto_9841 ?auto_9837 ) ) ( not ( = ?auto_9841 ?auto_9840 ) ) ( not ( = ?auto_9841 ?auto_9829 ) ) ( not ( = ?auto_9841 ?auto_9838 ) ) ( not ( = ?auto_9841 ?auto_9833 ) ) ( not ( = ?auto_9808 ?auto_9814 ) ) ( not ( = ?auto_9808 ?auto_9834 ) ) ( not ( = ?auto_9809 ?auto_9814 ) ) ( not ( = ?auto_9809 ?auto_9834 ) ) ( not ( = ?auto_9810 ?auto_9814 ) ) ( not ( = ?auto_9810 ?auto_9834 ) ) ( not ( = ?auto_9811 ?auto_9814 ) ) ( not ( = ?auto_9811 ?auto_9834 ) ) ( not ( = ?auto_9812 ?auto_9814 ) ) ( not ( = ?auto_9812 ?auto_9834 ) ) ( not ( = ?auto_9815 ?auto_9814 ) ) ( not ( = ?auto_9815 ?auto_9834 ) ) ( not ( = ?auto_9813 ?auto_9814 ) ) ( not ( = ?auto_9813 ?auto_9834 ) ) ( not ( = ?auto_9817 ?auto_9814 ) ) ( not ( = ?auto_9817 ?auto_9834 ) ) ( not ( = ?auto_9814 ?auto_9841 ) ) ( not ( = ?auto_9814 ?auto_9828 ) ) ( not ( = ?auto_9814 ?auto_9835 ) ) ( not ( = ?auto_9814 ?auto_9837 ) ) ( not ( = ?auto_9814 ?auto_9840 ) ) ( not ( = ?auto_9814 ?auto_9829 ) ) ( not ( = ?auto_9814 ?auto_9838 ) ) ( not ( = ?auto_9814 ?auto_9833 ) ) ( not ( = ?auto_9834 ?auto_9841 ) ) ( not ( = ?auto_9834 ?auto_9828 ) ) ( not ( = ?auto_9834 ?auto_9835 ) ) ( not ( = ?auto_9834 ?auto_9837 ) ) ( not ( = ?auto_9834 ?auto_9840 ) ) ( not ( = ?auto_9834 ?auto_9829 ) ) ( not ( = ?auto_9834 ?auto_9838 ) ) ( not ( = ?auto_9834 ?auto_9833 ) ) ( not ( = ?auto_9808 ?auto_9819 ) ) ( not ( = ?auto_9808 ?auto_9830 ) ) ( not ( = ?auto_9809 ?auto_9819 ) ) ( not ( = ?auto_9809 ?auto_9830 ) ) ( not ( = ?auto_9810 ?auto_9819 ) ) ( not ( = ?auto_9810 ?auto_9830 ) ) ( not ( = ?auto_9811 ?auto_9819 ) ) ( not ( = ?auto_9811 ?auto_9830 ) ) ( not ( = ?auto_9812 ?auto_9819 ) ) ( not ( = ?auto_9812 ?auto_9830 ) ) ( not ( = ?auto_9815 ?auto_9819 ) ) ( not ( = ?auto_9815 ?auto_9830 ) ) ( not ( = ?auto_9813 ?auto_9819 ) ) ( not ( = ?auto_9813 ?auto_9830 ) ) ( not ( = ?auto_9817 ?auto_9819 ) ) ( not ( = ?auto_9817 ?auto_9830 ) ) ( not ( = ?auto_9816 ?auto_9819 ) ) ( not ( = ?auto_9816 ?auto_9830 ) ) ( not ( = ?auto_9819 ?auto_9834 ) ) ( not ( = ?auto_9819 ?auto_9841 ) ) ( not ( = ?auto_9819 ?auto_9828 ) ) ( not ( = ?auto_9819 ?auto_9835 ) ) ( not ( = ?auto_9819 ?auto_9837 ) ) ( not ( = ?auto_9819 ?auto_9840 ) ) ( not ( = ?auto_9819 ?auto_9829 ) ) ( not ( = ?auto_9819 ?auto_9838 ) ) ( not ( = ?auto_9819 ?auto_9833 ) ) ( not ( = ?auto_9830 ?auto_9834 ) ) ( not ( = ?auto_9830 ?auto_9841 ) ) ( not ( = ?auto_9830 ?auto_9828 ) ) ( not ( = ?auto_9830 ?auto_9835 ) ) ( not ( = ?auto_9830 ?auto_9837 ) ) ( not ( = ?auto_9830 ?auto_9840 ) ) ( not ( = ?auto_9830 ?auto_9829 ) ) ( not ( = ?auto_9830 ?auto_9838 ) ) ( not ( = ?auto_9830 ?auto_9833 ) ) ( not ( = ?auto_9808 ?auto_9818 ) ) ( not ( = ?auto_9808 ?auto_9825 ) ) ( not ( = ?auto_9809 ?auto_9818 ) ) ( not ( = ?auto_9809 ?auto_9825 ) ) ( not ( = ?auto_9810 ?auto_9818 ) ) ( not ( = ?auto_9810 ?auto_9825 ) ) ( not ( = ?auto_9811 ?auto_9818 ) ) ( not ( = ?auto_9811 ?auto_9825 ) ) ( not ( = ?auto_9812 ?auto_9818 ) ) ( not ( = ?auto_9812 ?auto_9825 ) ) ( not ( = ?auto_9815 ?auto_9818 ) ) ( not ( = ?auto_9815 ?auto_9825 ) ) ( not ( = ?auto_9813 ?auto_9818 ) ) ( not ( = ?auto_9813 ?auto_9825 ) ) ( not ( = ?auto_9817 ?auto_9818 ) ) ( not ( = ?auto_9817 ?auto_9825 ) ) ( not ( = ?auto_9816 ?auto_9818 ) ) ( not ( = ?auto_9816 ?auto_9825 ) ) ( not ( = ?auto_9814 ?auto_9818 ) ) ( not ( = ?auto_9814 ?auto_9825 ) ) ( not ( = ?auto_9818 ?auto_9830 ) ) ( not ( = ?auto_9818 ?auto_9834 ) ) ( not ( = ?auto_9818 ?auto_9841 ) ) ( not ( = ?auto_9818 ?auto_9828 ) ) ( not ( = ?auto_9818 ?auto_9835 ) ) ( not ( = ?auto_9818 ?auto_9837 ) ) ( not ( = ?auto_9818 ?auto_9840 ) ) ( not ( = ?auto_9818 ?auto_9829 ) ) ( not ( = ?auto_9818 ?auto_9838 ) ) ( not ( = ?auto_9818 ?auto_9833 ) ) ( not ( = ?auto_9825 ?auto_9830 ) ) ( not ( = ?auto_9825 ?auto_9834 ) ) ( not ( = ?auto_9825 ?auto_9841 ) ) ( not ( = ?auto_9825 ?auto_9828 ) ) ( not ( = ?auto_9825 ?auto_9835 ) ) ( not ( = ?auto_9825 ?auto_9837 ) ) ( not ( = ?auto_9825 ?auto_9840 ) ) ( not ( = ?auto_9825 ?auto_9829 ) ) ( not ( = ?auto_9825 ?auto_9838 ) ) ( not ( = ?auto_9825 ?auto_9833 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_9808 ?auto_9809 ?auto_9810 ?auto_9811 ?auto_9812 ?auto_9815 ?auto_9813 ?auto_9817 ?auto_9816 ?auto_9814 ?auto_9819 )
      ( MAKE-1CRATE ?auto_9819 ?auto_9818 )
      ( MAKE-11CRATE-VERIFY ?auto_9808 ?auto_9809 ?auto_9810 ?auto_9811 ?auto_9812 ?auto_9815 ?auto_9813 ?auto_9817 ?auto_9816 ?auto_9814 ?auto_9819 ?auto_9818 ) )
  )

)

