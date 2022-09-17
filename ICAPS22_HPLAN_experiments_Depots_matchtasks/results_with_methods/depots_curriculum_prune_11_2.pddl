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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9440 - SURFACE
      ?auto_9441 - SURFACE
      ?auto_9442 - SURFACE
    )
    :vars
    (
      ?auto_9447 - HOIST
      ?auto_9443 - PLACE
      ?auto_9445 - PLACE
      ?auto_9444 - HOIST
      ?auto_9446 - SURFACE
      ?auto_9449 - PLACE
      ?auto_9451 - HOIST
      ?auto_9450 - SURFACE
      ?auto_9448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9447 ?auto_9443 ) ( IS-CRATE ?auto_9442 ) ( not ( = ?auto_9445 ?auto_9443 ) ) ( HOIST-AT ?auto_9444 ?auto_9445 ) ( AVAILABLE ?auto_9444 ) ( SURFACE-AT ?auto_9442 ?auto_9445 ) ( ON ?auto_9442 ?auto_9446 ) ( CLEAR ?auto_9442 ) ( not ( = ?auto_9441 ?auto_9442 ) ) ( not ( = ?auto_9441 ?auto_9446 ) ) ( not ( = ?auto_9442 ?auto_9446 ) ) ( not ( = ?auto_9447 ?auto_9444 ) ) ( SURFACE-AT ?auto_9440 ?auto_9443 ) ( CLEAR ?auto_9440 ) ( IS-CRATE ?auto_9441 ) ( AVAILABLE ?auto_9447 ) ( not ( = ?auto_9449 ?auto_9443 ) ) ( HOIST-AT ?auto_9451 ?auto_9449 ) ( AVAILABLE ?auto_9451 ) ( SURFACE-AT ?auto_9441 ?auto_9449 ) ( ON ?auto_9441 ?auto_9450 ) ( CLEAR ?auto_9441 ) ( TRUCK-AT ?auto_9448 ?auto_9443 ) ( not ( = ?auto_9440 ?auto_9441 ) ) ( not ( = ?auto_9440 ?auto_9450 ) ) ( not ( = ?auto_9441 ?auto_9450 ) ) ( not ( = ?auto_9447 ?auto_9451 ) ) ( not ( = ?auto_9440 ?auto_9442 ) ) ( not ( = ?auto_9440 ?auto_9446 ) ) ( not ( = ?auto_9442 ?auto_9450 ) ) ( not ( = ?auto_9445 ?auto_9449 ) ) ( not ( = ?auto_9444 ?auto_9451 ) ) ( not ( = ?auto_9446 ?auto_9450 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9440 ?auto_9441 )
      ( MAKE-1CRATE ?auto_9441 ?auto_9442 )
      ( MAKE-2CRATE-VERIFY ?auto_9440 ?auto_9441 ?auto_9442 ) )
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
      ?auto_9475 - HOIST
      ?auto_9472 - PLACE
      ?auto_9470 - PLACE
      ?auto_9473 - HOIST
      ?auto_9474 - SURFACE
      ?auto_9477 - PLACE
      ?auto_9476 - HOIST
      ?auto_9481 - SURFACE
      ?auto_9478 - PLACE
      ?auto_9480 - HOIST
      ?auto_9479 - SURFACE
      ?auto_9471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9475 ?auto_9472 ) ( IS-CRATE ?auto_9469 ) ( not ( = ?auto_9470 ?auto_9472 ) ) ( HOIST-AT ?auto_9473 ?auto_9470 ) ( AVAILABLE ?auto_9473 ) ( SURFACE-AT ?auto_9469 ?auto_9470 ) ( ON ?auto_9469 ?auto_9474 ) ( CLEAR ?auto_9469 ) ( not ( = ?auto_9468 ?auto_9469 ) ) ( not ( = ?auto_9468 ?auto_9474 ) ) ( not ( = ?auto_9469 ?auto_9474 ) ) ( not ( = ?auto_9475 ?auto_9473 ) ) ( IS-CRATE ?auto_9468 ) ( not ( = ?auto_9477 ?auto_9472 ) ) ( HOIST-AT ?auto_9476 ?auto_9477 ) ( AVAILABLE ?auto_9476 ) ( SURFACE-AT ?auto_9468 ?auto_9477 ) ( ON ?auto_9468 ?auto_9481 ) ( CLEAR ?auto_9468 ) ( not ( = ?auto_9467 ?auto_9468 ) ) ( not ( = ?auto_9467 ?auto_9481 ) ) ( not ( = ?auto_9468 ?auto_9481 ) ) ( not ( = ?auto_9475 ?auto_9476 ) ) ( SURFACE-AT ?auto_9466 ?auto_9472 ) ( CLEAR ?auto_9466 ) ( IS-CRATE ?auto_9467 ) ( AVAILABLE ?auto_9475 ) ( not ( = ?auto_9478 ?auto_9472 ) ) ( HOIST-AT ?auto_9480 ?auto_9478 ) ( AVAILABLE ?auto_9480 ) ( SURFACE-AT ?auto_9467 ?auto_9478 ) ( ON ?auto_9467 ?auto_9479 ) ( CLEAR ?auto_9467 ) ( TRUCK-AT ?auto_9471 ?auto_9472 ) ( not ( = ?auto_9466 ?auto_9467 ) ) ( not ( = ?auto_9466 ?auto_9479 ) ) ( not ( = ?auto_9467 ?auto_9479 ) ) ( not ( = ?auto_9475 ?auto_9480 ) ) ( not ( = ?auto_9466 ?auto_9468 ) ) ( not ( = ?auto_9466 ?auto_9481 ) ) ( not ( = ?auto_9468 ?auto_9479 ) ) ( not ( = ?auto_9477 ?auto_9478 ) ) ( not ( = ?auto_9476 ?auto_9480 ) ) ( not ( = ?auto_9481 ?auto_9479 ) ) ( not ( = ?auto_9466 ?auto_9469 ) ) ( not ( = ?auto_9466 ?auto_9474 ) ) ( not ( = ?auto_9467 ?auto_9469 ) ) ( not ( = ?auto_9467 ?auto_9474 ) ) ( not ( = ?auto_9469 ?auto_9481 ) ) ( not ( = ?auto_9469 ?auto_9479 ) ) ( not ( = ?auto_9470 ?auto_9477 ) ) ( not ( = ?auto_9470 ?auto_9478 ) ) ( not ( = ?auto_9473 ?auto_9476 ) ) ( not ( = ?auto_9473 ?auto_9480 ) ) ( not ( = ?auto_9474 ?auto_9481 ) ) ( not ( = ?auto_9474 ?auto_9479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9466 ?auto_9467 ?auto_9468 )
      ( MAKE-1CRATE ?auto_9468 ?auto_9469 )
      ( MAKE-3CRATE-VERIFY ?auto_9466 ?auto_9467 ?auto_9468 ?auto_9469 ) )
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
      ?auto_9503 - HOIST
      ?auto_9506 - PLACE
      ?auto_9504 - PLACE
      ?auto_9505 - HOIST
      ?auto_9502 - SURFACE
      ?auto_9509 - PLACE
      ?auto_9510 - HOIST
      ?auto_9513 - SURFACE
      ?auto_9512 - PLACE
      ?auto_9511 - HOIST
      ?auto_9508 - SURFACE
      ?auto_9514 - SURFACE
      ?auto_9507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9503 ?auto_9506 ) ( IS-CRATE ?auto_9501 ) ( not ( = ?auto_9504 ?auto_9506 ) ) ( HOIST-AT ?auto_9505 ?auto_9504 ) ( SURFACE-AT ?auto_9501 ?auto_9504 ) ( ON ?auto_9501 ?auto_9502 ) ( CLEAR ?auto_9501 ) ( not ( = ?auto_9500 ?auto_9501 ) ) ( not ( = ?auto_9500 ?auto_9502 ) ) ( not ( = ?auto_9501 ?auto_9502 ) ) ( not ( = ?auto_9503 ?auto_9505 ) ) ( IS-CRATE ?auto_9500 ) ( not ( = ?auto_9509 ?auto_9506 ) ) ( HOIST-AT ?auto_9510 ?auto_9509 ) ( AVAILABLE ?auto_9510 ) ( SURFACE-AT ?auto_9500 ?auto_9509 ) ( ON ?auto_9500 ?auto_9513 ) ( CLEAR ?auto_9500 ) ( not ( = ?auto_9499 ?auto_9500 ) ) ( not ( = ?auto_9499 ?auto_9513 ) ) ( not ( = ?auto_9500 ?auto_9513 ) ) ( not ( = ?auto_9503 ?auto_9510 ) ) ( IS-CRATE ?auto_9499 ) ( not ( = ?auto_9512 ?auto_9506 ) ) ( HOIST-AT ?auto_9511 ?auto_9512 ) ( AVAILABLE ?auto_9511 ) ( SURFACE-AT ?auto_9499 ?auto_9512 ) ( ON ?auto_9499 ?auto_9508 ) ( CLEAR ?auto_9499 ) ( not ( = ?auto_9498 ?auto_9499 ) ) ( not ( = ?auto_9498 ?auto_9508 ) ) ( not ( = ?auto_9499 ?auto_9508 ) ) ( not ( = ?auto_9503 ?auto_9511 ) ) ( SURFACE-AT ?auto_9497 ?auto_9506 ) ( CLEAR ?auto_9497 ) ( IS-CRATE ?auto_9498 ) ( AVAILABLE ?auto_9503 ) ( AVAILABLE ?auto_9505 ) ( SURFACE-AT ?auto_9498 ?auto_9504 ) ( ON ?auto_9498 ?auto_9514 ) ( CLEAR ?auto_9498 ) ( TRUCK-AT ?auto_9507 ?auto_9506 ) ( not ( = ?auto_9497 ?auto_9498 ) ) ( not ( = ?auto_9497 ?auto_9514 ) ) ( not ( = ?auto_9498 ?auto_9514 ) ) ( not ( = ?auto_9497 ?auto_9499 ) ) ( not ( = ?auto_9497 ?auto_9508 ) ) ( not ( = ?auto_9499 ?auto_9514 ) ) ( not ( = ?auto_9512 ?auto_9504 ) ) ( not ( = ?auto_9511 ?auto_9505 ) ) ( not ( = ?auto_9508 ?auto_9514 ) ) ( not ( = ?auto_9497 ?auto_9500 ) ) ( not ( = ?auto_9497 ?auto_9513 ) ) ( not ( = ?auto_9498 ?auto_9500 ) ) ( not ( = ?auto_9498 ?auto_9513 ) ) ( not ( = ?auto_9500 ?auto_9508 ) ) ( not ( = ?auto_9500 ?auto_9514 ) ) ( not ( = ?auto_9509 ?auto_9512 ) ) ( not ( = ?auto_9509 ?auto_9504 ) ) ( not ( = ?auto_9510 ?auto_9511 ) ) ( not ( = ?auto_9510 ?auto_9505 ) ) ( not ( = ?auto_9513 ?auto_9508 ) ) ( not ( = ?auto_9513 ?auto_9514 ) ) ( not ( = ?auto_9497 ?auto_9501 ) ) ( not ( = ?auto_9497 ?auto_9502 ) ) ( not ( = ?auto_9498 ?auto_9501 ) ) ( not ( = ?auto_9498 ?auto_9502 ) ) ( not ( = ?auto_9499 ?auto_9501 ) ) ( not ( = ?auto_9499 ?auto_9502 ) ) ( not ( = ?auto_9501 ?auto_9513 ) ) ( not ( = ?auto_9501 ?auto_9508 ) ) ( not ( = ?auto_9501 ?auto_9514 ) ) ( not ( = ?auto_9502 ?auto_9513 ) ) ( not ( = ?auto_9502 ?auto_9508 ) ) ( not ( = ?auto_9502 ?auto_9514 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9497 ?auto_9498 ?auto_9499 ?auto_9500 )
      ( MAKE-1CRATE ?auto_9500 ?auto_9501 )
      ( MAKE-4CRATE-VERIFY ?auto_9497 ?auto_9498 ?auto_9499 ?auto_9500 ?auto_9501 ) )
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
      ?auto_9540 - HOIST
      ?auto_9537 - PLACE
      ?auto_9539 - PLACE
      ?auto_9542 - HOIST
      ?auto_9538 - SURFACE
      ?auto_9547 - PLACE
      ?auto_9548 - HOIST
      ?auto_9543 - SURFACE
      ?auto_9544 - SURFACE
      ?auto_9550 - PLACE
      ?auto_9549 - HOIST
      ?auto_9546 - SURFACE
      ?auto_9545 - SURFACE
      ?auto_9541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9540 ?auto_9537 ) ( IS-CRATE ?auto_9536 ) ( not ( = ?auto_9539 ?auto_9537 ) ) ( HOIST-AT ?auto_9542 ?auto_9539 ) ( SURFACE-AT ?auto_9536 ?auto_9539 ) ( ON ?auto_9536 ?auto_9538 ) ( CLEAR ?auto_9536 ) ( not ( = ?auto_9535 ?auto_9536 ) ) ( not ( = ?auto_9535 ?auto_9538 ) ) ( not ( = ?auto_9536 ?auto_9538 ) ) ( not ( = ?auto_9540 ?auto_9542 ) ) ( IS-CRATE ?auto_9535 ) ( not ( = ?auto_9547 ?auto_9537 ) ) ( HOIST-AT ?auto_9548 ?auto_9547 ) ( SURFACE-AT ?auto_9535 ?auto_9547 ) ( ON ?auto_9535 ?auto_9543 ) ( CLEAR ?auto_9535 ) ( not ( = ?auto_9534 ?auto_9535 ) ) ( not ( = ?auto_9534 ?auto_9543 ) ) ( not ( = ?auto_9535 ?auto_9543 ) ) ( not ( = ?auto_9540 ?auto_9548 ) ) ( IS-CRATE ?auto_9534 ) ( AVAILABLE ?auto_9542 ) ( SURFACE-AT ?auto_9534 ?auto_9539 ) ( ON ?auto_9534 ?auto_9544 ) ( CLEAR ?auto_9534 ) ( not ( = ?auto_9533 ?auto_9534 ) ) ( not ( = ?auto_9533 ?auto_9544 ) ) ( not ( = ?auto_9534 ?auto_9544 ) ) ( IS-CRATE ?auto_9533 ) ( not ( = ?auto_9550 ?auto_9537 ) ) ( HOIST-AT ?auto_9549 ?auto_9550 ) ( AVAILABLE ?auto_9549 ) ( SURFACE-AT ?auto_9533 ?auto_9550 ) ( ON ?auto_9533 ?auto_9546 ) ( CLEAR ?auto_9533 ) ( not ( = ?auto_9532 ?auto_9533 ) ) ( not ( = ?auto_9532 ?auto_9546 ) ) ( not ( = ?auto_9533 ?auto_9546 ) ) ( not ( = ?auto_9540 ?auto_9549 ) ) ( SURFACE-AT ?auto_9531 ?auto_9537 ) ( CLEAR ?auto_9531 ) ( IS-CRATE ?auto_9532 ) ( AVAILABLE ?auto_9540 ) ( AVAILABLE ?auto_9548 ) ( SURFACE-AT ?auto_9532 ?auto_9547 ) ( ON ?auto_9532 ?auto_9545 ) ( CLEAR ?auto_9532 ) ( TRUCK-AT ?auto_9541 ?auto_9537 ) ( not ( = ?auto_9531 ?auto_9532 ) ) ( not ( = ?auto_9531 ?auto_9545 ) ) ( not ( = ?auto_9532 ?auto_9545 ) ) ( not ( = ?auto_9531 ?auto_9533 ) ) ( not ( = ?auto_9531 ?auto_9546 ) ) ( not ( = ?auto_9533 ?auto_9545 ) ) ( not ( = ?auto_9550 ?auto_9547 ) ) ( not ( = ?auto_9549 ?auto_9548 ) ) ( not ( = ?auto_9546 ?auto_9545 ) ) ( not ( = ?auto_9531 ?auto_9534 ) ) ( not ( = ?auto_9531 ?auto_9544 ) ) ( not ( = ?auto_9532 ?auto_9534 ) ) ( not ( = ?auto_9532 ?auto_9544 ) ) ( not ( = ?auto_9534 ?auto_9546 ) ) ( not ( = ?auto_9534 ?auto_9545 ) ) ( not ( = ?auto_9539 ?auto_9550 ) ) ( not ( = ?auto_9539 ?auto_9547 ) ) ( not ( = ?auto_9542 ?auto_9549 ) ) ( not ( = ?auto_9542 ?auto_9548 ) ) ( not ( = ?auto_9544 ?auto_9546 ) ) ( not ( = ?auto_9544 ?auto_9545 ) ) ( not ( = ?auto_9531 ?auto_9535 ) ) ( not ( = ?auto_9531 ?auto_9543 ) ) ( not ( = ?auto_9532 ?auto_9535 ) ) ( not ( = ?auto_9532 ?auto_9543 ) ) ( not ( = ?auto_9533 ?auto_9535 ) ) ( not ( = ?auto_9533 ?auto_9543 ) ) ( not ( = ?auto_9535 ?auto_9544 ) ) ( not ( = ?auto_9535 ?auto_9546 ) ) ( not ( = ?auto_9535 ?auto_9545 ) ) ( not ( = ?auto_9543 ?auto_9544 ) ) ( not ( = ?auto_9543 ?auto_9546 ) ) ( not ( = ?auto_9543 ?auto_9545 ) ) ( not ( = ?auto_9531 ?auto_9536 ) ) ( not ( = ?auto_9531 ?auto_9538 ) ) ( not ( = ?auto_9532 ?auto_9536 ) ) ( not ( = ?auto_9532 ?auto_9538 ) ) ( not ( = ?auto_9533 ?auto_9536 ) ) ( not ( = ?auto_9533 ?auto_9538 ) ) ( not ( = ?auto_9534 ?auto_9536 ) ) ( not ( = ?auto_9534 ?auto_9538 ) ) ( not ( = ?auto_9536 ?auto_9543 ) ) ( not ( = ?auto_9536 ?auto_9544 ) ) ( not ( = ?auto_9536 ?auto_9546 ) ) ( not ( = ?auto_9536 ?auto_9545 ) ) ( not ( = ?auto_9538 ?auto_9543 ) ) ( not ( = ?auto_9538 ?auto_9544 ) ) ( not ( = ?auto_9538 ?auto_9546 ) ) ( not ( = ?auto_9538 ?auto_9545 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_9531 ?auto_9532 ?auto_9533 ?auto_9534 ?auto_9535 )
      ( MAKE-1CRATE ?auto_9535 ?auto_9536 )
      ( MAKE-5CRATE-VERIFY ?auto_9531 ?auto_9532 ?auto_9533 ?auto_9534 ?auto_9535 ?auto_9536 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_9568 - SURFACE
      ?auto_9569 - SURFACE
      ?auto_9570 - SURFACE
      ?auto_9571 - SURFACE
      ?auto_9572 - SURFACE
      ?auto_9573 - SURFACE
      ?auto_9574 - SURFACE
    )
    :vars
    (
      ?auto_9577 - HOIST
      ?auto_9576 - PLACE
      ?auto_9575 - PLACE
      ?auto_9579 - HOIST
      ?auto_9578 - SURFACE
      ?auto_9584 - PLACE
      ?auto_9591 - HOIST
      ?auto_9581 - SURFACE
      ?auto_9583 - PLACE
      ?auto_9582 - HOIST
      ?auto_9586 - SURFACE
      ?auto_9588 - SURFACE
      ?auto_9590 - PLACE
      ?auto_9589 - HOIST
      ?auto_9587 - SURFACE
      ?auto_9585 - SURFACE
      ?auto_9580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9577 ?auto_9576 ) ( IS-CRATE ?auto_9574 ) ( not ( = ?auto_9575 ?auto_9576 ) ) ( HOIST-AT ?auto_9579 ?auto_9575 ) ( AVAILABLE ?auto_9579 ) ( SURFACE-AT ?auto_9574 ?auto_9575 ) ( ON ?auto_9574 ?auto_9578 ) ( CLEAR ?auto_9574 ) ( not ( = ?auto_9573 ?auto_9574 ) ) ( not ( = ?auto_9573 ?auto_9578 ) ) ( not ( = ?auto_9574 ?auto_9578 ) ) ( not ( = ?auto_9577 ?auto_9579 ) ) ( IS-CRATE ?auto_9573 ) ( not ( = ?auto_9584 ?auto_9576 ) ) ( HOIST-AT ?auto_9591 ?auto_9584 ) ( SURFACE-AT ?auto_9573 ?auto_9584 ) ( ON ?auto_9573 ?auto_9581 ) ( CLEAR ?auto_9573 ) ( not ( = ?auto_9572 ?auto_9573 ) ) ( not ( = ?auto_9572 ?auto_9581 ) ) ( not ( = ?auto_9573 ?auto_9581 ) ) ( not ( = ?auto_9577 ?auto_9591 ) ) ( IS-CRATE ?auto_9572 ) ( not ( = ?auto_9583 ?auto_9576 ) ) ( HOIST-AT ?auto_9582 ?auto_9583 ) ( SURFACE-AT ?auto_9572 ?auto_9583 ) ( ON ?auto_9572 ?auto_9586 ) ( CLEAR ?auto_9572 ) ( not ( = ?auto_9571 ?auto_9572 ) ) ( not ( = ?auto_9571 ?auto_9586 ) ) ( not ( = ?auto_9572 ?auto_9586 ) ) ( not ( = ?auto_9577 ?auto_9582 ) ) ( IS-CRATE ?auto_9571 ) ( AVAILABLE ?auto_9591 ) ( SURFACE-AT ?auto_9571 ?auto_9584 ) ( ON ?auto_9571 ?auto_9588 ) ( CLEAR ?auto_9571 ) ( not ( = ?auto_9570 ?auto_9571 ) ) ( not ( = ?auto_9570 ?auto_9588 ) ) ( not ( = ?auto_9571 ?auto_9588 ) ) ( IS-CRATE ?auto_9570 ) ( not ( = ?auto_9590 ?auto_9576 ) ) ( HOIST-AT ?auto_9589 ?auto_9590 ) ( AVAILABLE ?auto_9589 ) ( SURFACE-AT ?auto_9570 ?auto_9590 ) ( ON ?auto_9570 ?auto_9587 ) ( CLEAR ?auto_9570 ) ( not ( = ?auto_9569 ?auto_9570 ) ) ( not ( = ?auto_9569 ?auto_9587 ) ) ( not ( = ?auto_9570 ?auto_9587 ) ) ( not ( = ?auto_9577 ?auto_9589 ) ) ( SURFACE-AT ?auto_9568 ?auto_9576 ) ( CLEAR ?auto_9568 ) ( IS-CRATE ?auto_9569 ) ( AVAILABLE ?auto_9577 ) ( AVAILABLE ?auto_9582 ) ( SURFACE-AT ?auto_9569 ?auto_9583 ) ( ON ?auto_9569 ?auto_9585 ) ( CLEAR ?auto_9569 ) ( TRUCK-AT ?auto_9580 ?auto_9576 ) ( not ( = ?auto_9568 ?auto_9569 ) ) ( not ( = ?auto_9568 ?auto_9585 ) ) ( not ( = ?auto_9569 ?auto_9585 ) ) ( not ( = ?auto_9568 ?auto_9570 ) ) ( not ( = ?auto_9568 ?auto_9587 ) ) ( not ( = ?auto_9570 ?auto_9585 ) ) ( not ( = ?auto_9590 ?auto_9583 ) ) ( not ( = ?auto_9589 ?auto_9582 ) ) ( not ( = ?auto_9587 ?auto_9585 ) ) ( not ( = ?auto_9568 ?auto_9571 ) ) ( not ( = ?auto_9568 ?auto_9588 ) ) ( not ( = ?auto_9569 ?auto_9571 ) ) ( not ( = ?auto_9569 ?auto_9588 ) ) ( not ( = ?auto_9571 ?auto_9587 ) ) ( not ( = ?auto_9571 ?auto_9585 ) ) ( not ( = ?auto_9584 ?auto_9590 ) ) ( not ( = ?auto_9584 ?auto_9583 ) ) ( not ( = ?auto_9591 ?auto_9589 ) ) ( not ( = ?auto_9591 ?auto_9582 ) ) ( not ( = ?auto_9588 ?auto_9587 ) ) ( not ( = ?auto_9588 ?auto_9585 ) ) ( not ( = ?auto_9568 ?auto_9572 ) ) ( not ( = ?auto_9568 ?auto_9586 ) ) ( not ( = ?auto_9569 ?auto_9572 ) ) ( not ( = ?auto_9569 ?auto_9586 ) ) ( not ( = ?auto_9570 ?auto_9572 ) ) ( not ( = ?auto_9570 ?auto_9586 ) ) ( not ( = ?auto_9572 ?auto_9588 ) ) ( not ( = ?auto_9572 ?auto_9587 ) ) ( not ( = ?auto_9572 ?auto_9585 ) ) ( not ( = ?auto_9586 ?auto_9588 ) ) ( not ( = ?auto_9586 ?auto_9587 ) ) ( not ( = ?auto_9586 ?auto_9585 ) ) ( not ( = ?auto_9568 ?auto_9573 ) ) ( not ( = ?auto_9568 ?auto_9581 ) ) ( not ( = ?auto_9569 ?auto_9573 ) ) ( not ( = ?auto_9569 ?auto_9581 ) ) ( not ( = ?auto_9570 ?auto_9573 ) ) ( not ( = ?auto_9570 ?auto_9581 ) ) ( not ( = ?auto_9571 ?auto_9573 ) ) ( not ( = ?auto_9571 ?auto_9581 ) ) ( not ( = ?auto_9573 ?auto_9586 ) ) ( not ( = ?auto_9573 ?auto_9588 ) ) ( not ( = ?auto_9573 ?auto_9587 ) ) ( not ( = ?auto_9573 ?auto_9585 ) ) ( not ( = ?auto_9581 ?auto_9586 ) ) ( not ( = ?auto_9581 ?auto_9588 ) ) ( not ( = ?auto_9581 ?auto_9587 ) ) ( not ( = ?auto_9581 ?auto_9585 ) ) ( not ( = ?auto_9568 ?auto_9574 ) ) ( not ( = ?auto_9568 ?auto_9578 ) ) ( not ( = ?auto_9569 ?auto_9574 ) ) ( not ( = ?auto_9569 ?auto_9578 ) ) ( not ( = ?auto_9570 ?auto_9574 ) ) ( not ( = ?auto_9570 ?auto_9578 ) ) ( not ( = ?auto_9571 ?auto_9574 ) ) ( not ( = ?auto_9571 ?auto_9578 ) ) ( not ( = ?auto_9572 ?auto_9574 ) ) ( not ( = ?auto_9572 ?auto_9578 ) ) ( not ( = ?auto_9574 ?auto_9581 ) ) ( not ( = ?auto_9574 ?auto_9586 ) ) ( not ( = ?auto_9574 ?auto_9588 ) ) ( not ( = ?auto_9574 ?auto_9587 ) ) ( not ( = ?auto_9574 ?auto_9585 ) ) ( not ( = ?auto_9575 ?auto_9584 ) ) ( not ( = ?auto_9575 ?auto_9583 ) ) ( not ( = ?auto_9575 ?auto_9590 ) ) ( not ( = ?auto_9579 ?auto_9591 ) ) ( not ( = ?auto_9579 ?auto_9582 ) ) ( not ( = ?auto_9579 ?auto_9589 ) ) ( not ( = ?auto_9578 ?auto_9581 ) ) ( not ( = ?auto_9578 ?auto_9586 ) ) ( not ( = ?auto_9578 ?auto_9588 ) ) ( not ( = ?auto_9578 ?auto_9587 ) ) ( not ( = ?auto_9578 ?auto_9585 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_9568 ?auto_9569 ?auto_9570 ?auto_9571 ?auto_9572 ?auto_9573 )
      ( MAKE-1CRATE ?auto_9573 ?auto_9574 )
      ( MAKE-6CRATE-VERIFY ?auto_9568 ?auto_9569 ?auto_9570 ?auto_9571 ?auto_9572 ?auto_9573 ?auto_9574 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_9610 - SURFACE
      ?auto_9611 - SURFACE
      ?auto_9612 - SURFACE
      ?auto_9613 - SURFACE
      ?auto_9614 - SURFACE
      ?auto_9615 - SURFACE
      ?auto_9616 - SURFACE
      ?auto_9617 - SURFACE
    )
    :vars
    (
      ?auto_9622 - HOIST
      ?auto_9620 - PLACE
      ?auto_9621 - PLACE
      ?auto_9619 - HOIST
      ?auto_9618 - SURFACE
      ?auto_9627 - PLACE
      ?auto_9633 - HOIST
      ?auto_9634 - SURFACE
      ?auto_9635 - PLACE
      ?auto_9629 - HOIST
      ?auto_9631 - SURFACE
      ?auto_9624 - PLACE
      ?auto_9628 - HOIST
      ?auto_9630 - SURFACE
      ?auto_9626 - SURFACE
      ?auto_9632 - SURFACE
      ?auto_9625 - SURFACE
      ?auto_9623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9622 ?auto_9620 ) ( IS-CRATE ?auto_9617 ) ( not ( = ?auto_9621 ?auto_9620 ) ) ( HOIST-AT ?auto_9619 ?auto_9621 ) ( SURFACE-AT ?auto_9617 ?auto_9621 ) ( ON ?auto_9617 ?auto_9618 ) ( CLEAR ?auto_9617 ) ( not ( = ?auto_9616 ?auto_9617 ) ) ( not ( = ?auto_9616 ?auto_9618 ) ) ( not ( = ?auto_9617 ?auto_9618 ) ) ( not ( = ?auto_9622 ?auto_9619 ) ) ( IS-CRATE ?auto_9616 ) ( not ( = ?auto_9627 ?auto_9620 ) ) ( HOIST-AT ?auto_9633 ?auto_9627 ) ( AVAILABLE ?auto_9633 ) ( SURFACE-AT ?auto_9616 ?auto_9627 ) ( ON ?auto_9616 ?auto_9634 ) ( CLEAR ?auto_9616 ) ( not ( = ?auto_9615 ?auto_9616 ) ) ( not ( = ?auto_9615 ?auto_9634 ) ) ( not ( = ?auto_9616 ?auto_9634 ) ) ( not ( = ?auto_9622 ?auto_9633 ) ) ( IS-CRATE ?auto_9615 ) ( not ( = ?auto_9635 ?auto_9620 ) ) ( HOIST-AT ?auto_9629 ?auto_9635 ) ( SURFACE-AT ?auto_9615 ?auto_9635 ) ( ON ?auto_9615 ?auto_9631 ) ( CLEAR ?auto_9615 ) ( not ( = ?auto_9614 ?auto_9615 ) ) ( not ( = ?auto_9614 ?auto_9631 ) ) ( not ( = ?auto_9615 ?auto_9631 ) ) ( not ( = ?auto_9622 ?auto_9629 ) ) ( IS-CRATE ?auto_9614 ) ( not ( = ?auto_9624 ?auto_9620 ) ) ( HOIST-AT ?auto_9628 ?auto_9624 ) ( SURFACE-AT ?auto_9614 ?auto_9624 ) ( ON ?auto_9614 ?auto_9630 ) ( CLEAR ?auto_9614 ) ( not ( = ?auto_9613 ?auto_9614 ) ) ( not ( = ?auto_9613 ?auto_9630 ) ) ( not ( = ?auto_9614 ?auto_9630 ) ) ( not ( = ?auto_9622 ?auto_9628 ) ) ( IS-CRATE ?auto_9613 ) ( AVAILABLE ?auto_9629 ) ( SURFACE-AT ?auto_9613 ?auto_9635 ) ( ON ?auto_9613 ?auto_9626 ) ( CLEAR ?auto_9613 ) ( not ( = ?auto_9612 ?auto_9613 ) ) ( not ( = ?auto_9612 ?auto_9626 ) ) ( not ( = ?auto_9613 ?auto_9626 ) ) ( IS-CRATE ?auto_9612 ) ( AVAILABLE ?auto_9619 ) ( SURFACE-AT ?auto_9612 ?auto_9621 ) ( ON ?auto_9612 ?auto_9632 ) ( CLEAR ?auto_9612 ) ( not ( = ?auto_9611 ?auto_9612 ) ) ( not ( = ?auto_9611 ?auto_9632 ) ) ( not ( = ?auto_9612 ?auto_9632 ) ) ( SURFACE-AT ?auto_9610 ?auto_9620 ) ( CLEAR ?auto_9610 ) ( IS-CRATE ?auto_9611 ) ( AVAILABLE ?auto_9622 ) ( AVAILABLE ?auto_9628 ) ( SURFACE-AT ?auto_9611 ?auto_9624 ) ( ON ?auto_9611 ?auto_9625 ) ( CLEAR ?auto_9611 ) ( TRUCK-AT ?auto_9623 ?auto_9620 ) ( not ( = ?auto_9610 ?auto_9611 ) ) ( not ( = ?auto_9610 ?auto_9625 ) ) ( not ( = ?auto_9611 ?auto_9625 ) ) ( not ( = ?auto_9610 ?auto_9612 ) ) ( not ( = ?auto_9610 ?auto_9632 ) ) ( not ( = ?auto_9612 ?auto_9625 ) ) ( not ( = ?auto_9621 ?auto_9624 ) ) ( not ( = ?auto_9619 ?auto_9628 ) ) ( not ( = ?auto_9632 ?auto_9625 ) ) ( not ( = ?auto_9610 ?auto_9613 ) ) ( not ( = ?auto_9610 ?auto_9626 ) ) ( not ( = ?auto_9611 ?auto_9613 ) ) ( not ( = ?auto_9611 ?auto_9626 ) ) ( not ( = ?auto_9613 ?auto_9632 ) ) ( not ( = ?auto_9613 ?auto_9625 ) ) ( not ( = ?auto_9635 ?auto_9621 ) ) ( not ( = ?auto_9635 ?auto_9624 ) ) ( not ( = ?auto_9629 ?auto_9619 ) ) ( not ( = ?auto_9629 ?auto_9628 ) ) ( not ( = ?auto_9626 ?auto_9632 ) ) ( not ( = ?auto_9626 ?auto_9625 ) ) ( not ( = ?auto_9610 ?auto_9614 ) ) ( not ( = ?auto_9610 ?auto_9630 ) ) ( not ( = ?auto_9611 ?auto_9614 ) ) ( not ( = ?auto_9611 ?auto_9630 ) ) ( not ( = ?auto_9612 ?auto_9614 ) ) ( not ( = ?auto_9612 ?auto_9630 ) ) ( not ( = ?auto_9614 ?auto_9626 ) ) ( not ( = ?auto_9614 ?auto_9632 ) ) ( not ( = ?auto_9614 ?auto_9625 ) ) ( not ( = ?auto_9630 ?auto_9626 ) ) ( not ( = ?auto_9630 ?auto_9632 ) ) ( not ( = ?auto_9630 ?auto_9625 ) ) ( not ( = ?auto_9610 ?auto_9615 ) ) ( not ( = ?auto_9610 ?auto_9631 ) ) ( not ( = ?auto_9611 ?auto_9615 ) ) ( not ( = ?auto_9611 ?auto_9631 ) ) ( not ( = ?auto_9612 ?auto_9615 ) ) ( not ( = ?auto_9612 ?auto_9631 ) ) ( not ( = ?auto_9613 ?auto_9615 ) ) ( not ( = ?auto_9613 ?auto_9631 ) ) ( not ( = ?auto_9615 ?auto_9630 ) ) ( not ( = ?auto_9615 ?auto_9626 ) ) ( not ( = ?auto_9615 ?auto_9632 ) ) ( not ( = ?auto_9615 ?auto_9625 ) ) ( not ( = ?auto_9631 ?auto_9630 ) ) ( not ( = ?auto_9631 ?auto_9626 ) ) ( not ( = ?auto_9631 ?auto_9632 ) ) ( not ( = ?auto_9631 ?auto_9625 ) ) ( not ( = ?auto_9610 ?auto_9616 ) ) ( not ( = ?auto_9610 ?auto_9634 ) ) ( not ( = ?auto_9611 ?auto_9616 ) ) ( not ( = ?auto_9611 ?auto_9634 ) ) ( not ( = ?auto_9612 ?auto_9616 ) ) ( not ( = ?auto_9612 ?auto_9634 ) ) ( not ( = ?auto_9613 ?auto_9616 ) ) ( not ( = ?auto_9613 ?auto_9634 ) ) ( not ( = ?auto_9614 ?auto_9616 ) ) ( not ( = ?auto_9614 ?auto_9634 ) ) ( not ( = ?auto_9616 ?auto_9631 ) ) ( not ( = ?auto_9616 ?auto_9630 ) ) ( not ( = ?auto_9616 ?auto_9626 ) ) ( not ( = ?auto_9616 ?auto_9632 ) ) ( not ( = ?auto_9616 ?auto_9625 ) ) ( not ( = ?auto_9627 ?auto_9635 ) ) ( not ( = ?auto_9627 ?auto_9624 ) ) ( not ( = ?auto_9627 ?auto_9621 ) ) ( not ( = ?auto_9633 ?auto_9629 ) ) ( not ( = ?auto_9633 ?auto_9628 ) ) ( not ( = ?auto_9633 ?auto_9619 ) ) ( not ( = ?auto_9634 ?auto_9631 ) ) ( not ( = ?auto_9634 ?auto_9630 ) ) ( not ( = ?auto_9634 ?auto_9626 ) ) ( not ( = ?auto_9634 ?auto_9632 ) ) ( not ( = ?auto_9634 ?auto_9625 ) ) ( not ( = ?auto_9610 ?auto_9617 ) ) ( not ( = ?auto_9610 ?auto_9618 ) ) ( not ( = ?auto_9611 ?auto_9617 ) ) ( not ( = ?auto_9611 ?auto_9618 ) ) ( not ( = ?auto_9612 ?auto_9617 ) ) ( not ( = ?auto_9612 ?auto_9618 ) ) ( not ( = ?auto_9613 ?auto_9617 ) ) ( not ( = ?auto_9613 ?auto_9618 ) ) ( not ( = ?auto_9614 ?auto_9617 ) ) ( not ( = ?auto_9614 ?auto_9618 ) ) ( not ( = ?auto_9615 ?auto_9617 ) ) ( not ( = ?auto_9615 ?auto_9618 ) ) ( not ( = ?auto_9617 ?auto_9634 ) ) ( not ( = ?auto_9617 ?auto_9631 ) ) ( not ( = ?auto_9617 ?auto_9630 ) ) ( not ( = ?auto_9617 ?auto_9626 ) ) ( not ( = ?auto_9617 ?auto_9632 ) ) ( not ( = ?auto_9617 ?auto_9625 ) ) ( not ( = ?auto_9618 ?auto_9634 ) ) ( not ( = ?auto_9618 ?auto_9631 ) ) ( not ( = ?auto_9618 ?auto_9630 ) ) ( not ( = ?auto_9618 ?auto_9626 ) ) ( not ( = ?auto_9618 ?auto_9632 ) ) ( not ( = ?auto_9618 ?auto_9625 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_9610 ?auto_9611 ?auto_9612 ?auto_9613 ?auto_9614 ?auto_9615 ?auto_9616 )
      ( MAKE-1CRATE ?auto_9616 ?auto_9617 )
      ( MAKE-7CRATE-VERIFY ?auto_9610 ?auto_9611 ?auto_9612 ?auto_9613 ?auto_9614 ?auto_9615 ?auto_9616 ?auto_9617 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_9655 - SURFACE
      ?auto_9656 - SURFACE
      ?auto_9657 - SURFACE
      ?auto_9658 - SURFACE
      ?auto_9659 - SURFACE
      ?auto_9660 - SURFACE
      ?auto_9661 - SURFACE
      ?auto_9662 - SURFACE
      ?auto_9663 - SURFACE
    )
    :vars
    (
      ?auto_9668 - HOIST
      ?auto_9664 - PLACE
      ?auto_9665 - PLACE
      ?auto_9666 - HOIST
      ?auto_9667 - SURFACE
      ?auto_9681 - PLACE
      ?auto_9671 - HOIST
      ?auto_9682 - SURFACE
      ?auto_9680 - PLACE
      ?auto_9673 - HOIST
      ?auto_9677 - SURFACE
      ?auto_9675 - PLACE
      ?auto_9670 - HOIST
      ?auto_9678 - SURFACE
      ?auto_9679 - SURFACE
      ?auto_9674 - SURFACE
      ?auto_9672 - SURFACE
      ?auto_9676 - SURFACE
      ?auto_9669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9668 ?auto_9664 ) ( IS-CRATE ?auto_9663 ) ( not ( = ?auto_9665 ?auto_9664 ) ) ( HOIST-AT ?auto_9666 ?auto_9665 ) ( SURFACE-AT ?auto_9663 ?auto_9665 ) ( ON ?auto_9663 ?auto_9667 ) ( CLEAR ?auto_9663 ) ( not ( = ?auto_9662 ?auto_9663 ) ) ( not ( = ?auto_9662 ?auto_9667 ) ) ( not ( = ?auto_9663 ?auto_9667 ) ) ( not ( = ?auto_9668 ?auto_9666 ) ) ( IS-CRATE ?auto_9662 ) ( not ( = ?auto_9681 ?auto_9664 ) ) ( HOIST-AT ?auto_9671 ?auto_9681 ) ( SURFACE-AT ?auto_9662 ?auto_9681 ) ( ON ?auto_9662 ?auto_9682 ) ( CLEAR ?auto_9662 ) ( not ( = ?auto_9661 ?auto_9662 ) ) ( not ( = ?auto_9661 ?auto_9682 ) ) ( not ( = ?auto_9662 ?auto_9682 ) ) ( not ( = ?auto_9668 ?auto_9671 ) ) ( IS-CRATE ?auto_9661 ) ( not ( = ?auto_9680 ?auto_9664 ) ) ( HOIST-AT ?auto_9673 ?auto_9680 ) ( AVAILABLE ?auto_9673 ) ( SURFACE-AT ?auto_9661 ?auto_9680 ) ( ON ?auto_9661 ?auto_9677 ) ( CLEAR ?auto_9661 ) ( not ( = ?auto_9660 ?auto_9661 ) ) ( not ( = ?auto_9660 ?auto_9677 ) ) ( not ( = ?auto_9661 ?auto_9677 ) ) ( not ( = ?auto_9668 ?auto_9673 ) ) ( IS-CRATE ?auto_9660 ) ( not ( = ?auto_9675 ?auto_9664 ) ) ( HOIST-AT ?auto_9670 ?auto_9675 ) ( SURFACE-AT ?auto_9660 ?auto_9675 ) ( ON ?auto_9660 ?auto_9678 ) ( CLEAR ?auto_9660 ) ( not ( = ?auto_9659 ?auto_9660 ) ) ( not ( = ?auto_9659 ?auto_9678 ) ) ( not ( = ?auto_9660 ?auto_9678 ) ) ( not ( = ?auto_9668 ?auto_9670 ) ) ( IS-CRATE ?auto_9659 ) ( SURFACE-AT ?auto_9659 ?auto_9665 ) ( ON ?auto_9659 ?auto_9679 ) ( CLEAR ?auto_9659 ) ( not ( = ?auto_9658 ?auto_9659 ) ) ( not ( = ?auto_9658 ?auto_9679 ) ) ( not ( = ?auto_9659 ?auto_9679 ) ) ( IS-CRATE ?auto_9658 ) ( AVAILABLE ?auto_9670 ) ( SURFACE-AT ?auto_9658 ?auto_9675 ) ( ON ?auto_9658 ?auto_9674 ) ( CLEAR ?auto_9658 ) ( not ( = ?auto_9657 ?auto_9658 ) ) ( not ( = ?auto_9657 ?auto_9674 ) ) ( not ( = ?auto_9658 ?auto_9674 ) ) ( IS-CRATE ?auto_9657 ) ( AVAILABLE ?auto_9671 ) ( SURFACE-AT ?auto_9657 ?auto_9681 ) ( ON ?auto_9657 ?auto_9672 ) ( CLEAR ?auto_9657 ) ( not ( = ?auto_9656 ?auto_9657 ) ) ( not ( = ?auto_9656 ?auto_9672 ) ) ( not ( = ?auto_9657 ?auto_9672 ) ) ( SURFACE-AT ?auto_9655 ?auto_9664 ) ( CLEAR ?auto_9655 ) ( IS-CRATE ?auto_9656 ) ( AVAILABLE ?auto_9668 ) ( AVAILABLE ?auto_9666 ) ( SURFACE-AT ?auto_9656 ?auto_9665 ) ( ON ?auto_9656 ?auto_9676 ) ( CLEAR ?auto_9656 ) ( TRUCK-AT ?auto_9669 ?auto_9664 ) ( not ( = ?auto_9655 ?auto_9656 ) ) ( not ( = ?auto_9655 ?auto_9676 ) ) ( not ( = ?auto_9656 ?auto_9676 ) ) ( not ( = ?auto_9655 ?auto_9657 ) ) ( not ( = ?auto_9655 ?auto_9672 ) ) ( not ( = ?auto_9657 ?auto_9676 ) ) ( not ( = ?auto_9681 ?auto_9665 ) ) ( not ( = ?auto_9671 ?auto_9666 ) ) ( not ( = ?auto_9672 ?auto_9676 ) ) ( not ( = ?auto_9655 ?auto_9658 ) ) ( not ( = ?auto_9655 ?auto_9674 ) ) ( not ( = ?auto_9656 ?auto_9658 ) ) ( not ( = ?auto_9656 ?auto_9674 ) ) ( not ( = ?auto_9658 ?auto_9672 ) ) ( not ( = ?auto_9658 ?auto_9676 ) ) ( not ( = ?auto_9675 ?auto_9681 ) ) ( not ( = ?auto_9675 ?auto_9665 ) ) ( not ( = ?auto_9670 ?auto_9671 ) ) ( not ( = ?auto_9670 ?auto_9666 ) ) ( not ( = ?auto_9674 ?auto_9672 ) ) ( not ( = ?auto_9674 ?auto_9676 ) ) ( not ( = ?auto_9655 ?auto_9659 ) ) ( not ( = ?auto_9655 ?auto_9679 ) ) ( not ( = ?auto_9656 ?auto_9659 ) ) ( not ( = ?auto_9656 ?auto_9679 ) ) ( not ( = ?auto_9657 ?auto_9659 ) ) ( not ( = ?auto_9657 ?auto_9679 ) ) ( not ( = ?auto_9659 ?auto_9674 ) ) ( not ( = ?auto_9659 ?auto_9672 ) ) ( not ( = ?auto_9659 ?auto_9676 ) ) ( not ( = ?auto_9679 ?auto_9674 ) ) ( not ( = ?auto_9679 ?auto_9672 ) ) ( not ( = ?auto_9679 ?auto_9676 ) ) ( not ( = ?auto_9655 ?auto_9660 ) ) ( not ( = ?auto_9655 ?auto_9678 ) ) ( not ( = ?auto_9656 ?auto_9660 ) ) ( not ( = ?auto_9656 ?auto_9678 ) ) ( not ( = ?auto_9657 ?auto_9660 ) ) ( not ( = ?auto_9657 ?auto_9678 ) ) ( not ( = ?auto_9658 ?auto_9660 ) ) ( not ( = ?auto_9658 ?auto_9678 ) ) ( not ( = ?auto_9660 ?auto_9679 ) ) ( not ( = ?auto_9660 ?auto_9674 ) ) ( not ( = ?auto_9660 ?auto_9672 ) ) ( not ( = ?auto_9660 ?auto_9676 ) ) ( not ( = ?auto_9678 ?auto_9679 ) ) ( not ( = ?auto_9678 ?auto_9674 ) ) ( not ( = ?auto_9678 ?auto_9672 ) ) ( not ( = ?auto_9678 ?auto_9676 ) ) ( not ( = ?auto_9655 ?auto_9661 ) ) ( not ( = ?auto_9655 ?auto_9677 ) ) ( not ( = ?auto_9656 ?auto_9661 ) ) ( not ( = ?auto_9656 ?auto_9677 ) ) ( not ( = ?auto_9657 ?auto_9661 ) ) ( not ( = ?auto_9657 ?auto_9677 ) ) ( not ( = ?auto_9658 ?auto_9661 ) ) ( not ( = ?auto_9658 ?auto_9677 ) ) ( not ( = ?auto_9659 ?auto_9661 ) ) ( not ( = ?auto_9659 ?auto_9677 ) ) ( not ( = ?auto_9661 ?auto_9678 ) ) ( not ( = ?auto_9661 ?auto_9679 ) ) ( not ( = ?auto_9661 ?auto_9674 ) ) ( not ( = ?auto_9661 ?auto_9672 ) ) ( not ( = ?auto_9661 ?auto_9676 ) ) ( not ( = ?auto_9680 ?auto_9675 ) ) ( not ( = ?auto_9680 ?auto_9665 ) ) ( not ( = ?auto_9680 ?auto_9681 ) ) ( not ( = ?auto_9673 ?auto_9670 ) ) ( not ( = ?auto_9673 ?auto_9666 ) ) ( not ( = ?auto_9673 ?auto_9671 ) ) ( not ( = ?auto_9677 ?auto_9678 ) ) ( not ( = ?auto_9677 ?auto_9679 ) ) ( not ( = ?auto_9677 ?auto_9674 ) ) ( not ( = ?auto_9677 ?auto_9672 ) ) ( not ( = ?auto_9677 ?auto_9676 ) ) ( not ( = ?auto_9655 ?auto_9662 ) ) ( not ( = ?auto_9655 ?auto_9682 ) ) ( not ( = ?auto_9656 ?auto_9662 ) ) ( not ( = ?auto_9656 ?auto_9682 ) ) ( not ( = ?auto_9657 ?auto_9662 ) ) ( not ( = ?auto_9657 ?auto_9682 ) ) ( not ( = ?auto_9658 ?auto_9662 ) ) ( not ( = ?auto_9658 ?auto_9682 ) ) ( not ( = ?auto_9659 ?auto_9662 ) ) ( not ( = ?auto_9659 ?auto_9682 ) ) ( not ( = ?auto_9660 ?auto_9662 ) ) ( not ( = ?auto_9660 ?auto_9682 ) ) ( not ( = ?auto_9662 ?auto_9677 ) ) ( not ( = ?auto_9662 ?auto_9678 ) ) ( not ( = ?auto_9662 ?auto_9679 ) ) ( not ( = ?auto_9662 ?auto_9674 ) ) ( not ( = ?auto_9662 ?auto_9672 ) ) ( not ( = ?auto_9662 ?auto_9676 ) ) ( not ( = ?auto_9682 ?auto_9677 ) ) ( not ( = ?auto_9682 ?auto_9678 ) ) ( not ( = ?auto_9682 ?auto_9679 ) ) ( not ( = ?auto_9682 ?auto_9674 ) ) ( not ( = ?auto_9682 ?auto_9672 ) ) ( not ( = ?auto_9682 ?auto_9676 ) ) ( not ( = ?auto_9655 ?auto_9663 ) ) ( not ( = ?auto_9655 ?auto_9667 ) ) ( not ( = ?auto_9656 ?auto_9663 ) ) ( not ( = ?auto_9656 ?auto_9667 ) ) ( not ( = ?auto_9657 ?auto_9663 ) ) ( not ( = ?auto_9657 ?auto_9667 ) ) ( not ( = ?auto_9658 ?auto_9663 ) ) ( not ( = ?auto_9658 ?auto_9667 ) ) ( not ( = ?auto_9659 ?auto_9663 ) ) ( not ( = ?auto_9659 ?auto_9667 ) ) ( not ( = ?auto_9660 ?auto_9663 ) ) ( not ( = ?auto_9660 ?auto_9667 ) ) ( not ( = ?auto_9661 ?auto_9663 ) ) ( not ( = ?auto_9661 ?auto_9667 ) ) ( not ( = ?auto_9663 ?auto_9682 ) ) ( not ( = ?auto_9663 ?auto_9677 ) ) ( not ( = ?auto_9663 ?auto_9678 ) ) ( not ( = ?auto_9663 ?auto_9679 ) ) ( not ( = ?auto_9663 ?auto_9674 ) ) ( not ( = ?auto_9663 ?auto_9672 ) ) ( not ( = ?auto_9663 ?auto_9676 ) ) ( not ( = ?auto_9667 ?auto_9682 ) ) ( not ( = ?auto_9667 ?auto_9677 ) ) ( not ( = ?auto_9667 ?auto_9678 ) ) ( not ( = ?auto_9667 ?auto_9679 ) ) ( not ( = ?auto_9667 ?auto_9674 ) ) ( not ( = ?auto_9667 ?auto_9672 ) ) ( not ( = ?auto_9667 ?auto_9676 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_9655 ?auto_9656 ?auto_9657 ?auto_9658 ?auto_9659 ?auto_9660 ?auto_9661 ?auto_9662 )
      ( MAKE-1CRATE ?auto_9662 ?auto_9663 )
      ( MAKE-8CRATE-VERIFY ?auto_9655 ?auto_9656 ?auto_9657 ?auto_9658 ?auto_9659 ?auto_9660 ?auto_9661 ?auto_9662 ?auto_9663 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_9703 - SURFACE
      ?auto_9704 - SURFACE
      ?auto_9705 - SURFACE
      ?auto_9706 - SURFACE
      ?auto_9707 - SURFACE
      ?auto_9708 - SURFACE
      ?auto_9709 - SURFACE
      ?auto_9710 - SURFACE
      ?auto_9711 - SURFACE
      ?auto_9712 - SURFACE
    )
    :vars
    (
      ?auto_9716 - HOIST
      ?auto_9713 - PLACE
      ?auto_9717 - PLACE
      ?auto_9714 - HOIST
      ?auto_9718 - SURFACE
      ?auto_9727 - PLACE
      ?auto_9731 - HOIST
      ?auto_9732 - SURFACE
      ?auto_9725 - PLACE
      ?auto_9730 - HOIST
      ?auto_9721 - SURFACE
      ?auto_9720 - PLACE
      ?auto_9724 - HOIST
      ?auto_9729 - SURFACE
      ?auto_9719 - SURFACE
      ?auto_9722 - SURFACE
      ?auto_9726 - SURFACE
      ?auto_9723 - SURFACE
      ?auto_9728 - SURFACE
      ?auto_9715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9716 ?auto_9713 ) ( IS-CRATE ?auto_9712 ) ( not ( = ?auto_9717 ?auto_9713 ) ) ( HOIST-AT ?auto_9714 ?auto_9717 ) ( SURFACE-AT ?auto_9712 ?auto_9717 ) ( ON ?auto_9712 ?auto_9718 ) ( CLEAR ?auto_9712 ) ( not ( = ?auto_9711 ?auto_9712 ) ) ( not ( = ?auto_9711 ?auto_9718 ) ) ( not ( = ?auto_9712 ?auto_9718 ) ) ( not ( = ?auto_9716 ?auto_9714 ) ) ( IS-CRATE ?auto_9711 ) ( not ( = ?auto_9727 ?auto_9713 ) ) ( HOIST-AT ?auto_9731 ?auto_9727 ) ( SURFACE-AT ?auto_9711 ?auto_9727 ) ( ON ?auto_9711 ?auto_9732 ) ( CLEAR ?auto_9711 ) ( not ( = ?auto_9710 ?auto_9711 ) ) ( not ( = ?auto_9710 ?auto_9732 ) ) ( not ( = ?auto_9711 ?auto_9732 ) ) ( not ( = ?auto_9716 ?auto_9731 ) ) ( IS-CRATE ?auto_9710 ) ( not ( = ?auto_9725 ?auto_9713 ) ) ( HOIST-AT ?auto_9730 ?auto_9725 ) ( SURFACE-AT ?auto_9710 ?auto_9725 ) ( ON ?auto_9710 ?auto_9721 ) ( CLEAR ?auto_9710 ) ( not ( = ?auto_9709 ?auto_9710 ) ) ( not ( = ?auto_9709 ?auto_9721 ) ) ( not ( = ?auto_9710 ?auto_9721 ) ) ( not ( = ?auto_9716 ?auto_9730 ) ) ( IS-CRATE ?auto_9709 ) ( not ( = ?auto_9720 ?auto_9713 ) ) ( HOIST-AT ?auto_9724 ?auto_9720 ) ( AVAILABLE ?auto_9724 ) ( SURFACE-AT ?auto_9709 ?auto_9720 ) ( ON ?auto_9709 ?auto_9729 ) ( CLEAR ?auto_9709 ) ( not ( = ?auto_9708 ?auto_9709 ) ) ( not ( = ?auto_9708 ?auto_9729 ) ) ( not ( = ?auto_9709 ?auto_9729 ) ) ( not ( = ?auto_9716 ?auto_9724 ) ) ( IS-CRATE ?auto_9708 ) ( SURFACE-AT ?auto_9708 ?auto_9717 ) ( ON ?auto_9708 ?auto_9719 ) ( CLEAR ?auto_9708 ) ( not ( = ?auto_9707 ?auto_9708 ) ) ( not ( = ?auto_9707 ?auto_9719 ) ) ( not ( = ?auto_9708 ?auto_9719 ) ) ( IS-CRATE ?auto_9707 ) ( SURFACE-AT ?auto_9707 ?auto_9727 ) ( ON ?auto_9707 ?auto_9722 ) ( CLEAR ?auto_9707 ) ( not ( = ?auto_9706 ?auto_9707 ) ) ( not ( = ?auto_9706 ?auto_9722 ) ) ( not ( = ?auto_9707 ?auto_9722 ) ) ( IS-CRATE ?auto_9706 ) ( AVAILABLE ?auto_9714 ) ( SURFACE-AT ?auto_9706 ?auto_9717 ) ( ON ?auto_9706 ?auto_9726 ) ( CLEAR ?auto_9706 ) ( not ( = ?auto_9705 ?auto_9706 ) ) ( not ( = ?auto_9705 ?auto_9726 ) ) ( not ( = ?auto_9706 ?auto_9726 ) ) ( IS-CRATE ?auto_9705 ) ( AVAILABLE ?auto_9730 ) ( SURFACE-AT ?auto_9705 ?auto_9725 ) ( ON ?auto_9705 ?auto_9723 ) ( CLEAR ?auto_9705 ) ( not ( = ?auto_9704 ?auto_9705 ) ) ( not ( = ?auto_9704 ?auto_9723 ) ) ( not ( = ?auto_9705 ?auto_9723 ) ) ( SURFACE-AT ?auto_9703 ?auto_9713 ) ( CLEAR ?auto_9703 ) ( IS-CRATE ?auto_9704 ) ( AVAILABLE ?auto_9716 ) ( AVAILABLE ?auto_9731 ) ( SURFACE-AT ?auto_9704 ?auto_9727 ) ( ON ?auto_9704 ?auto_9728 ) ( CLEAR ?auto_9704 ) ( TRUCK-AT ?auto_9715 ?auto_9713 ) ( not ( = ?auto_9703 ?auto_9704 ) ) ( not ( = ?auto_9703 ?auto_9728 ) ) ( not ( = ?auto_9704 ?auto_9728 ) ) ( not ( = ?auto_9703 ?auto_9705 ) ) ( not ( = ?auto_9703 ?auto_9723 ) ) ( not ( = ?auto_9705 ?auto_9728 ) ) ( not ( = ?auto_9725 ?auto_9727 ) ) ( not ( = ?auto_9730 ?auto_9731 ) ) ( not ( = ?auto_9723 ?auto_9728 ) ) ( not ( = ?auto_9703 ?auto_9706 ) ) ( not ( = ?auto_9703 ?auto_9726 ) ) ( not ( = ?auto_9704 ?auto_9706 ) ) ( not ( = ?auto_9704 ?auto_9726 ) ) ( not ( = ?auto_9706 ?auto_9723 ) ) ( not ( = ?auto_9706 ?auto_9728 ) ) ( not ( = ?auto_9717 ?auto_9725 ) ) ( not ( = ?auto_9717 ?auto_9727 ) ) ( not ( = ?auto_9714 ?auto_9730 ) ) ( not ( = ?auto_9714 ?auto_9731 ) ) ( not ( = ?auto_9726 ?auto_9723 ) ) ( not ( = ?auto_9726 ?auto_9728 ) ) ( not ( = ?auto_9703 ?auto_9707 ) ) ( not ( = ?auto_9703 ?auto_9722 ) ) ( not ( = ?auto_9704 ?auto_9707 ) ) ( not ( = ?auto_9704 ?auto_9722 ) ) ( not ( = ?auto_9705 ?auto_9707 ) ) ( not ( = ?auto_9705 ?auto_9722 ) ) ( not ( = ?auto_9707 ?auto_9726 ) ) ( not ( = ?auto_9707 ?auto_9723 ) ) ( not ( = ?auto_9707 ?auto_9728 ) ) ( not ( = ?auto_9722 ?auto_9726 ) ) ( not ( = ?auto_9722 ?auto_9723 ) ) ( not ( = ?auto_9722 ?auto_9728 ) ) ( not ( = ?auto_9703 ?auto_9708 ) ) ( not ( = ?auto_9703 ?auto_9719 ) ) ( not ( = ?auto_9704 ?auto_9708 ) ) ( not ( = ?auto_9704 ?auto_9719 ) ) ( not ( = ?auto_9705 ?auto_9708 ) ) ( not ( = ?auto_9705 ?auto_9719 ) ) ( not ( = ?auto_9706 ?auto_9708 ) ) ( not ( = ?auto_9706 ?auto_9719 ) ) ( not ( = ?auto_9708 ?auto_9722 ) ) ( not ( = ?auto_9708 ?auto_9726 ) ) ( not ( = ?auto_9708 ?auto_9723 ) ) ( not ( = ?auto_9708 ?auto_9728 ) ) ( not ( = ?auto_9719 ?auto_9722 ) ) ( not ( = ?auto_9719 ?auto_9726 ) ) ( not ( = ?auto_9719 ?auto_9723 ) ) ( not ( = ?auto_9719 ?auto_9728 ) ) ( not ( = ?auto_9703 ?auto_9709 ) ) ( not ( = ?auto_9703 ?auto_9729 ) ) ( not ( = ?auto_9704 ?auto_9709 ) ) ( not ( = ?auto_9704 ?auto_9729 ) ) ( not ( = ?auto_9705 ?auto_9709 ) ) ( not ( = ?auto_9705 ?auto_9729 ) ) ( not ( = ?auto_9706 ?auto_9709 ) ) ( not ( = ?auto_9706 ?auto_9729 ) ) ( not ( = ?auto_9707 ?auto_9709 ) ) ( not ( = ?auto_9707 ?auto_9729 ) ) ( not ( = ?auto_9709 ?auto_9719 ) ) ( not ( = ?auto_9709 ?auto_9722 ) ) ( not ( = ?auto_9709 ?auto_9726 ) ) ( not ( = ?auto_9709 ?auto_9723 ) ) ( not ( = ?auto_9709 ?auto_9728 ) ) ( not ( = ?auto_9720 ?auto_9717 ) ) ( not ( = ?auto_9720 ?auto_9727 ) ) ( not ( = ?auto_9720 ?auto_9725 ) ) ( not ( = ?auto_9724 ?auto_9714 ) ) ( not ( = ?auto_9724 ?auto_9731 ) ) ( not ( = ?auto_9724 ?auto_9730 ) ) ( not ( = ?auto_9729 ?auto_9719 ) ) ( not ( = ?auto_9729 ?auto_9722 ) ) ( not ( = ?auto_9729 ?auto_9726 ) ) ( not ( = ?auto_9729 ?auto_9723 ) ) ( not ( = ?auto_9729 ?auto_9728 ) ) ( not ( = ?auto_9703 ?auto_9710 ) ) ( not ( = ?auto_9703 ?auto_9721 ) ) ( not ( = ?auto_9704 ?auto_9710 ) ) ( not ( = ?auto_9704 ?auto_9721 ) ) ( not ( = ?auto_9705 ?auto_9710 ) ) ( not ( = ?auto_9705 ?auto_9721 ) ) ( not ( = ?auto_9706 ?auto_9710 ) ) ( not ( = ?auto_9706 ?auto_9721 ) ) ( not ( = ?auto_9707 ?auto_9710 ) ) ( not ( = ?auto_9707 ?auto_9721 ) ) ( not ( = ?auto_9708 ?auto_9710 ) ) ( not ( = ?auto_9708 ?auto_9721 ) ) ( not ( = ?auto_9710 ?auto_9729 ) ) ( not ( = ?auto_9710 ?auto_9719 ) ) ( not ( = ?auto_9710 ?auto_9722 ) ) ( not ( = ?auto_9710 ?auto_9726 ) ) ( not ( = ?auto_9710 ?auto_9723 ) ) ( not ( = ?auto_9710 ?auto_9728 ) ) ( not ( = ?auto_9721 ?auto_9729 ) ) ( not ( = ?auto_9721 ?auto_9719 ) ) ( not ( = ?auto_9721 ?auto_9722 ) ) ( not ( = ?auto_9721 ?auto_9726 ) ) ( not ( = ?auto_9721 ?auto_9723 ) ) ( not ( = ?auto_9721 ?auto_9728 ) ) ( not ( = ?auto_9703 ?auto_9711 ) ) ( not ( = ?auto_9703 ?auto_9732 ) ) ( not ( = ?auto_9704 ?auto_9711 ) ) ( not ( = ?auto_9704 ?auto_9732 ) ) ( not ( = ?auto_9705 ?auto_9711 ) ) ( not ( = ?auto_9705 ?auto_9732 ) ) ( not ( = ?auto_9706 ?auto_9711 ) ) ( not ( = ?auto_9706 ?auto_9732 ) ) ( not ( = ?auto_9707 ?auto_9711 ) ) ( not ( = ?auto_9707 ?auto_9732 ) ) ( not ( = ?auto_9708 ?auto_9711 ) ) ( not ( = ?auto_9708 ?auto_9732 ) ) ( not ( = ?auto_9709 ?auto_9711 ) ) ( not ( = ?auto_9709 ?auto_9732 ) ) ( not ( = ?auto_9711 ?auto_9721 ) ) ( not ( = ?auto_9711 ?auto_9729 ) ) ( not ( = ?auto_9711 ?auto_9719 ) ) ( not ( = ?auto_9711 ?auto_9722 ) ) ( not ( = ?auto_9711 ?auto_9726 ) ) ( not ( = ?auto_9711 ?auto_9723 ) ) ( not ( = ?auto_9711 ?auto_9728 ) ) ( not ( = ?auto_9732 ?auto_9721 ) ) ( not ( = ?auto_9732 ?auto_9729 ) ) ( not ( = ?auto_9732 ?auto_9719 ) ) ( not ( = ?auto_9732 ?auto_9722 ) ) ( not ( = ?auto_9732 ?auto_9726 ) ) ( not ( = ?auto_9732 ?auto_9723 ) ) ( not ( = ?auto_9732 ?auto_9728 ) ) ( not ( = ?auto_9703 ?auto_9712 ) ) ( not ( = ?auto_9703 ?auto_9718 ) ) ( not ( = ?auto_9704 ?auto_9712 ) ) ( not ( = ?auto_9704 ?auto_9718 ) ) ( not ( = ?auto_9705 ?auto_9712 ) ) ( not ( = ?auto_9705 ?auto_9718 ) ) ( not ( = ?auto_9706 ?auto_9712 ) ) ( not ( = ?auto_9706 ?auto_9718 ) ) ( not ( = ?auto_9707 ?auto_9712 ) ) ( not ( = ?auto_9707 ?auto_9718 ) ) ( not ( = ?auto_9708 ?auto_9712 ) ) ( not ( = ?auto_9708 ?auto_9718 ) ) ( not ( = ?auto_9709 ?auto_9712 ) ) ( not ( = ?auto_9709 ?auto_9718 ) ) ( not ( = ?auto_9710 ?auto_9712 ) ) ( not ( = ?auto_9710 ?auto_9718 ) ) ( not ( = ?auto_9712 ?auto_9732 ) ) ( not ( = ?auto_9712 ?auto_9721 ) ) ( not ( = ?auto_9712 ?auto_9729 ) ) ( not ( = ?auto_9712 ?auto_9719 ) ) ( not ( = ?auto_9712 ?auto_9722 ) ) ( not ( = ?auto_9712 ?auto_9726 ) ) ( not ( = ?auto_9712 ?auto_9723 ) ) ( not ( = ?auto_9712 ?auto_9728 ) ) ( not ( = ?auto_9718 ?auto_9732 ) ) ( not ( = ?auto_9718 ?auto_9721 ) ) ( not ( = ?auto_9718 ?auto_9729 ) ) ( not ( = ?auto_9718 ?auto_9719 ) ) ( not ( = ?auto_9718 ?auto_9722 ) ) ( not ( = ?auto_9718 ?auto_9726 ) ) ( not ( = ?auto_9718 ?auto_9723 ) ) ( not ( = ?auto_9718 ?auto_9728 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_9703 ?auto_9704 ?auto_9705 ?auto_9706 ?auto_9707 ?auto_9708 ?auto_9709 ?auto_9710 ?auto_9711 )
      ( MAKE-1CRATE ?auto_9711 ?auto_9712 )
      ( MAKE-9CRATE-VERIFY ?auto_9703 ?auto_9704 ?auto_9705 ?auto_9706 ?auto_9707 ?auto_9708 ?auto_9709 ?auto_9710 ?auto_9711 ?auto_9712 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_9754 - SURFACE
      ?auto_9755 - SURFACE
      ?auto_9756 - SURFACE
      ?auto_9757 - SURFACE
      ?auto_9758 - SURFACE
      ?auto_9759 - SURFACE
      ?auto_9760 - SURFACE
      ?auto_9761 - SURFACE
      ?auto_9762 - SURFACE
      ?auto_9763 - SURFACE
      ?auto_9764 - SURFACE
    )
    :vars
    (
      ?auto_9767 - HOIST
      ?auto_9766 - PLACE
      ?auto_9765 - PLACE
      ?auto_9768 - HOIST
      ?auto_9769 - SURFACE
      ?auto_9783 - PLACE
      ?auto_9784 - HOIST
      ?auto_9781 - SURFACE
      ?auto_9774 - SURFACE
      ?auto_9780 - PLACE
      ?auto_9773 - HOIST
      ?auto_9779 - SURFACE
      ?auto_9778 - PLACE
      ?auto_9785 - HOIST
      ?auto_9771 - SURFACE
      ?auto_9777 - SURFACE
      ?auto_9772 - SURFACE
      ?auto_9782 - SURFACE
      ?auto_9776 - SURFACE
      ?auto_9775 - SURFACE
      ?auto_9770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9767 ?auto_9766 ) ( IS-CRATE ?auto_9764 ) ( not ( = ?auto_9765 ?auto_9766 ) ) ( HOIST-AT ?auto_9768 ?auto_9765 ) ( SURFACE-AT ?auto_9764 ?auto_9765 ) ( ON ?auto_9764 ?auto_9769 ) ( CLEAR ?auto_9764 ) ( not ( = ?auto_9763 ?auto_9764 ) ) ( not ( = ?auto_9763 ?auto_9769 ) ) ( not ( = ?auto_9764 ?auto_9769 ) ) ( not ( = ?auto_9767 ?auto_9768 ) ) ( IS-CRATE ?auto_9763 ) ( not ( = ?auto_9783 ?auto_9766 ) ) ( HOIST-AT ?auto_9784 ?auto_9783 ) ( SURFACE-AT ?auto_9763 ?auto_9783 ) ( ON ?auto_9763 ?auto_9781 ) ( CLEAR ?auto_9763 ) ( not ( = ?auto_9762 ?auto_9763 ) ) ( not ( = ?auto_9762 ?auto_9781 ) ) ( not ( = ?auto_9763 ?auto_9781 ) ) ( not ( = ?auto_9767 ?auto_9784 ) ) ( IS-CRATE ?auto_9762 ) ( SURFACE-AT ?auto_9762 ?auto_9765 ) ( ON ?auto_9762 ?auto_9774 ) ( CLEAR ?auto_9762 ) ( not ( = ?auto_9761 ?auto_9762 ) ) ( not ( = ?auto_9761 ?auto_9774 ) ) ( not ( = ?auto_9762 ?auto_9774 ) ) ( IS-CRATE ?auto_9761 ) ( not ( = ?auto_9780 ?auto_9766 ) ) ( HOIST-AT ?auto_9773 ?auto_9780 ) ( SURFACE-AT ?auto_9761 ?auto_9780 ) ( ON ?auto_9761 ?auto_9779 ) ( CLEAR ?auto_9761 ) ( not ( = ?auto_9760 ?auto_9761 ) ) ( not ( = ?auto_9760 ?auto_9779 ) ) ( not ( = ?auto_9761 ?auto_9779 ) ) ( not ( = ?auto_9767 ?auto_9773 ) ) ( IS-CRATE ?auto_9760 ) ( not ( = ?auto_9778 ?auto_9766 ) ) ( HOIST-AT ?auto_9785 ?auto_9778 ) ( AVAILABLE ?auto_9785 ) ( SURFACE-AT ?auto_9760 ?auto_9778 ) ( ON ?auto_9760 ?auto_9771 ) ( CLEAR ?auto_9760 ) ( not ( = ?auto_9759 ?auto_9760 ) ) ( not ( = ?auto_9759 ?auto_9771 ) ) ( not ( = ?auto_9760 ?auto_9771 ) ) ( not ( = ?auto_9767 ?auto_9785 ) ) ( IS-CRATE ?auto_9759 ) ( SURFACE-AT ?auto_9759 ?auto_9783 ) ( ON ?auto_9759 ?auto_9777 ) ( CLEAR ?auto_9759 ) ( not ( = ?auto_9758 ?auto_9759 ) ) ( not ( = ?auto_9758 ?auto_9777 ) ) ( not ( = ?auto_9759 ?auto_9777 ) ) ( IS-CRATE ?auto_9758 ) ( SURFACE-AT ?auto_9758 ?auto_9765 ) ( ON ?auto_9758 ?auto_9772 ) ( CLEAR ?auto_9758 ) ( not ( = ?auto_9757 ?auto_9758 ) ) ( not ( = ?auto_9757 ?auto_9772 ) ) ( not ( = ?auto_9758 ?auto_9772 ) ) ( IS-CRATE ?auto_9757 ) ( AVAILABLE ?auto_9784 ) ( SURFACE-AT ?auto_9757 ?auto_9783 ) ( ON ?auto_9757 ?auto_9782 ) ( CLEAR ?auto_9757 ) ( not ( = ?auto_9756 ?auto_9757 ) ) ( not ( = ?auto_9756 ?auto_9782 ) ) ( not ( = ?auto_9757 ?auto_9782 ) ) ( IS-CRATE ?auto_9756 ) ( AVAILABLE ?auto_9773 ) ( SURFACE-AT ?auto_9756 ?auto_9780 ) ( ON ?auto_9756 ?auto_9776 ) ( CLEAR ?auto_9756 ) ( not ( = ?auto_9755 ?auto_9756 ) ) ( not ( = ?auto_9755 ?auto_9776 ) ) ( not ( = ?auto_9756 ?auto_9776 ) ) ( SURFACE-AT ?auto_9754 ?auto_9766 ) ( CLEAR ?auto_9754 ) ( IS-CRATE ?auto_9755 ) ( AVAILABLE ?auto_9767 ) ( AVAILABLE ?auto_9768 ) ( SURFACE-AT ?auto_9755 ?auto_9765 ) ( ON ?auto_9755 ?auto_9775 ) ( CLEAR ?auto_9755 ) ( TRUCK-AT ?auto_9770 ?auto_9766 ) ( not ( = ?auto_9754 ?auto_9755 ) ) ( not ( = ?auto_9754 ?auto_9775 ) ) ( not ( = ?auto_9755 ?auto_9775 ) ) ( not ( = ?auto_9754 ?auto_9756 ) ) ( not ( = ?auto_9754 ?auto_9776 ) ) ( not ( = ?auto_9756 ?auto_9775 ) ) ( not ( = ?auto_9780 ?auto_9765 ) ) ( not ( = ?auto_9773 ?auto_9768 ) ) ( not ( = ?auto_9776 ?auto_9775 ) ) ( not ( = ?auto_9754 ?auto_9757 ) ) ( not ( = ?auto_9754 ?auto_9782 ) ) ( not ( = ?auto_9755 ?auto_9757 ) ) ( not ( = ?auto_9755 ?auto_9782 ) ) ( not ( = ?auto_9757 ?auto_9776 ) ) ( not ( = ?auto_9757 ?auto_9775 ) ) ( not ( = ?auto_9783 ?auto_9780 ) ) ( not ( = ?auto_9783 ?auto_9765 ) ) ( not ( = ?auto_9784 ?auto_9773 ) ) ( not ( = ?auto_9784 ?auto_9768 ) ) ( not ( = ?auto_9782 ?auto_9776 ) ) ( not ( = ?auto_9782 ?auto_9775 ) ) ( not ( = ?auto_9754 ?auto_9758 ) ) ( not ( = ?auto_9754 ?auto_9772 ) ) ( not ( = ?auto_9755 ?auto_9758 ) ) ( not ( = ?auto_9755 ?auto_9772 ) ) ( not ( = ?auto_9756 ?auto_9758 ) ) ( not ( = ?auto_9756 ?auto_9772 ) ) ( not ( = ?auto_9758 ?auto_9782 ) ) ( not ( = ?auto_9758 ?auto_9776 ) ) ( not ( = ?auto_9758 ?auto_9775 ) ) ( not ( = ?auto_9772 ?auto_9782 ) ) ( not ( = ?auto_9772 ?auto_9776 ) ) ( not ( = ?auto_9772 ?auto_9775 ) ) ( not ( = ?auto_9754 ?auto_9759 ) ) ( not ( = ?auto_9754 ?auto_9777 ) ) ( not ( = ?auto_9755 ?auto_9759 ) ) ( not ( = ?auto_9755 ?auto_9777 ) ) ( not ( = ?auto_9756 ?auto_9759 ) ) ( not ( = ?auto_9756 ?auto_9777 ) ) ( not ( = ?auto_9757 ?auto_9759 ) ) ( not ( = ?auto_9757 ?auto_9777 ) ) ( not ( = ?auto_9759 ?auto_9772 ) ) ( not ( = ?auto_9759 ?auto_9782 ) ) ( not ( = ?auto_9759 ?auto_9776 ) ) ( not ( = ?auto_9759 ?auto_9775 ) ) ( not ( = ?auto_9777 ?auto_9772 ) ) ( not ( = ?auto_9777 ?auto_9782 ) ) ( not ( = ?auto_9777 ?auto_9776 ) ) ( not ( = ?auto_9777 ?auto_9775 ) ) ( not ( = ?auto_9754 ?auto_9760 ) ) ( not ( = ?auto_9754 ?auto_9771 ) ) ( not ( = ?auto_9755 ?auto_9760 ) ) ( not ( = ?auto_9755 ?auto_9771 ) ) ( not ( = ?auto_9756 ?auto_9760 ) ) ( not ( = ?auto_9756 ?auto_9771 ) ) ( not ( = ?auto_9757 ?auto_9760 ) ) ( not ( = ?auto_9757 ?auto_9771 ) ) ( not ( = ?auto_9758 ?auto_9760 ) ) ( not ( = ?auto_9758 ?auto_9771 ) ) ( not ( = ?auto_9760 ?auto_9777 ) ) ( not ( = ?auto_9760 ?auto_9772 ) ) ( not ( = ?auto_9760 ?auto_9782 ) ) ( not ( = ?auto_9760 ?auto_9776 ) ) ( not ( = ?auto_9760 ?auto_9775 ) ) ( not ( = ?auto_9778 ?auto_9783 ) ) ( not ( = ?auto_9778 ?auto_9765 ) ) ( not ( = ?auto_9778 ?auto_9780 ) ) ( not ( = ?auto_9785 ?auto_9784 ) ) ( not ( = ?auto_9785 ?auto_9768 ) ) ( not ( = ?auto_9785 ?auto_9773 ) ) ( not ( = ?auto_9771 ?auto_9777 ) ) ( not ( = ?auto_9771 ?auto_9772 ) ) ( not ( = ?auto_9771 ?auto_9782 ) ) ( not ( = ?auto_9771 ?auto_9776 ) ) ( not ( = ?auto_9771 ?auto_9775 ) ) ( not ( = ?auto_9754 ?auto_9761 ) ) ( not ( = ?auto_9754 ?auto_9779 ) ) ( not ( = ?auto_9755 ?auto_9761 ) ) ( not ( = ?auto_9755 ?auto_9779 ) ) ( not ( = ?auto_9756 ?auto_9761 ) ) ( not ( = ?auto_9756 ?auto_9779 ) ) ( not ( = ?auto_9757 ?auto_9761 ) ) ( not ( = ?auto_9757 ?auto_9779 ) ) ( not ( = ?auto_9758 ?auto_9761 ) ) ( not ( = ?auto_9758 ?auto_9779 ) ) ( not ( = ?auto_9759 ?auto_9761 ) ) ( not ( = ?auto_9759 ?auto_9779 ) ) ( not ( = ?auto_9761 ?auto_9771 ) ) ( not ( = ?auto_9761 ?auto_9777 ) ) ( not ( = ?auto_9761 ?auto_9772 ) ) ( not ( = ?auto_9761 ?auto_9782 ) ) ( not ( = ?auto_9761 ?auto_9776 ) ) ( not ( = ?auto_9761 ?auto_9775 ) ) ( not ( = ?auto_9779 ?auto_9771 ) ) ( not ( = ?auto_9779 ?auto_9777 ) ) ( not ( = ?auto_9779 ?auto_9772 ) ) ( not ( = ?auto_9779 ?auto_9782 ) ) ( not ( = ?auto_9779 ?auto_9776 ) ) ( not ( = ?auto_9779 ?auto_9775 ) ) ( not ( = ?auto_9754 ?auto_9762 ) ) ( not ( = ?auto_9754 ?auto_9774 ) ) ( not ( = ?auto_9755 ?auto_9762 ) ) ( not ( = ?auto_9755 ?auto_9774 ) ) ( not ( = ?auto_9756 ?auto_9762 ) ) ( not ( = ?auto_9756 ?auto_9774 ) ) ( not ( = ?auto_9757 ?auto_9762 ) ) ( not ( = ?auto_9757 ?auto_9774 ) ) ( not ( = ?auto_9758 ?auto_9762 ) ) ( not ( = ?auto_9758 ?auto_9774 ) ) ( not ( = ?auto_9759 ?auto_9762 ) ) ( not ( = ?auto_9759 ?auto_9774 ) ) ( not ( = ?auto_9760 ?auto_9762 ) ) ( not ( = ?auto_9760 ?auto_9774 ) ) ( not ( = ?auto_9762 ?auto_9779 ) ) ( not ( = ?auto_9762 ?auto_9771 ) ) ( not ( = ?auto_9762 ?auto_9777 ) ) ( not ( = ?auto_9762 ?auto_9772 ) ) ( not ( = ?auto_9762 ?auto_9782 ) ) ( not ( = ?auto_9762 ?auto_9776 ) ) ( not ( = ?auto_9762 ?auto_9775 ) ) ( not ( = ?auto_9774 ?auto_9779 ) ) ( not ( = ?auto_9774 ?auto_9771 ) ) ( not ( = ?auto_9774 ?auto_9777 ) ) ( not ( = ?auto_9774 ?auto_9772 ) ) ( not ( = ?auto_9774 ?auto_9782 ) ) ( not ( = ?auto_9774 ?auto_9776 ) ) ( not ( = ?auto_9774 ?auto_9775 ) ) ( not ( = ?auto_9754 ?auto_9763 ) ) ( not ( = ?auto_9754 ?auto_9781 ) ) ( not ( = ?auto_9755 ?auto_9763 ) ) ( not ( = ?auto_9755 ?auto_9781 ) ) ( not ( = ?auto_9756 ?auto_9763 ) ) ( not ( = ?auto_9756 ?auto_9781 ) ) ( not ( = ?auto_9757 ?auto_9763 ) ) ( not ( = ?auto_9757 ?auto_9781 ) ) ( not ( = ?auto_9758 ?auto_9763 ) ) ( not ( = ?auto_9758 ?auto_9781 ) ) ( not ( = ?auto_9759 ?auto_9763 ) ) ( not ( = ?auto_9759 ?auto_9781 ) ) ( not ( = ?auto_9760 ?auto_9763 ) ) ( not ( = ?auto_9760 ?auto_9781 ) ) ( not ( = ?auto_9761 ?auto_9763 ) ) ( not ( = ?auto_9761 ?auto_9781 ) ) ( not ( = ?auto_9763 ?auto_9774 ) ) ( not ( = ?auto_9763 ?auto_9779 ) ) ( not ( = ?auto_9763 ?auto_9771 ) ) ( not ( = ?auto_9763 ?auto_9777 ) ) ( not ( = ?auto_9763 ?auto_9772 ) ) ( not ( = ?auto_9763 ?auto_9782 ) ) ( not ( = ?auto_9763 ?auto_9776 ) ) ( not ( = ?auto_9763 ?auto_9775 ) ) ( not ( = ?auto_9781 ?auto_9774 ) ) ( not ( = ?auto_9781 ?auto_9779 ) ) ( not ( = ?auto_9781 ?auto_9771 ) ) ( not ( = ?auto_9781 ?auto_9777 ) ) ( not ( = ?auto_9781 ?auto_9772 ) ) ( not ( = ?auto_9781 ?auto_9782 ) ) ( not ( = ?auto_9781 ?auto_9776 ) ) ( not ( = ?auto_9781 ?auto_9775 ) ) ( not ( = ?auto_9754 ?auto_9764 ) ) ( not ( = ?auto_9754 ?auto_9769 ) ) ( not ( = ?auto_9755 ?auto_9764 ) ) ( not ( = ?auto_9755 ?auto_9769 ) ) ( not ( = ?auto_9756 ?auto_9764 ) ) ( not ( = ?auto_9756 ?auto_9769 ) ) ( not ( = ?auto_9757 ?auto_9764 ) ) ( not ( = ?auto_9757 ?auto_9769 ) ) ( not ( = ?auto_9758 ?auto_9764 ) ) ( not ( = ?auto_9758 ?auto_9769 ) ) ( not ( = ?auto_9759 ?auto_9764 ) ) ( not ( = ?auto_9759 ?auto_9769 ) ) ( not ( = ?auto_9760 ?auto_9764 ) ) ( not ( = ?auto_9760 ?auto_9769 ) ) ( not ( = ?auto_9761 ?auto_9764 ) ) ( not ( = ?auto_9761 ?auto_9769 ) ) ( not ( = ?auto_9762 ?auto_9764 ) ) ( not ( = ?auto_9762 ?auto_9769 ) ) ( not ( = ?auto_9764 ?auto_9781 ) ) ( not ( = ?auto_9764 ?auto_9774 ) ) ( not ( = ?auto_9764 ?auto_9779 ) ) ( not ( = ?auto_9764 ?auto_9771 ) ) ( not ( = ?auto_9764 ?auto_9777 ) ) ( not ( = ?auto_9764 ?auto_9772 ) ) ( not ( = ?auto_9764 ?auto_9782 ) ) ( not ( = ?auto_9764 ?auto_9776 ) ) ( not ( = ?auto_9764 ?auto_9775 ) ) ( not ( = ?auto_9769 ?auto_9781 ) ) ( not ( = ?auto_9769 ?auto_9774 ) ) ( not ( = ?auto_9769 ?auto_9779 ) ) ( not ( = ?auto_9769 ?auto_9771 ) ) ( not ( = ?auto_9769 ?auto_9777 ) ) ( not ( = ?auto_9769 ?auto_9772 ) ) ( not ( = ?auto_9769 ?auto_9782 ) ) ( not ( = ?auto_9769 ?auto_9776 ) ) ( not ( = ?auto_9769 ?auto_9775 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_9754 ?auto_9755 ?auto_9756 ?auto_9757 ?auto_9758 ?auto_9759 ?auto_9760 ?auto_9761 ?auto_9762 ?auto_9763 )
      ( MAKE-1CRATE ?auto_9763 ?auto_9764 )
      ( MAKE-10CRATE-VERIFY ?auto_9754 ?auto_9755 ?auto_9756 ?auto_9757 ?auto_9758 ?auto_9759 ?auto_9760 ?auto_9761 ?auto_9762 ?auto_9763 ?auto_9764 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_9808 - SURFACE
      ?auto_9809 - SURFACE
      ?auto_9810 - SURFACE
      ?auto_9811 - SURFACE
      ?auto_9812 - SURFACE
      ?auto_9813 - SURFACE
      ?auto_9814 - SURFACE
      ?auto_9815 - SURFACE
      ?auto_9816 - SURFACE
      ?auto_9817 - SURFACE
      ?auto_9818 - SURFACE
      ?auto_9819 - SURFACE
    )
    :vars
    (
      ?auto_9821 - HOIST
      ?auto_9825 - PLACE
      ?auto_9824 - PLACE
      ?auto_9820 - HOIST
      ?auto_9822 - SURFACE
      ?auto_9829 - PLACE
      ?auto_9826 - HOIST
      ?auto_9830 - SURFACE
      ?auto_9838 - PLACE
      ?auto_9835 - HOIST
      ?auto_9836 - SURFACE
      ?auto_9827 - SURFACE
      ?auto_9834 - PLACE
      ?auto_9841 - HOIST
      ?auto_9832 - SURFACE
      ?auto_9839 - SURFACE
      ?auto_9833 - SURFACE
      ?auto_9831 - SURFACE
      ?auto_9828 - SURFACE
      ?auto_9840 - SURFACE
      ?auto_9837 - SURFACE
      ?auto_9823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9821 ?auto_9825 ) ( IS-CRATE ?auto_9819 ) ( not ( = ?auto_9824 ?auto_9825 ) ) ( HOIST-AT ?auto_9820 ?auto_9824 ) ( SURFACE-AT ?auto_9819 ?auto_9824 ) ( ON ?auto_9819 ?auto_9822 ) ( CLEAR ?auto_9819 ) ( not ( = ?auto_9818 ?auto_9819 ) ) ( not ( = ?auto_9818 ?auto_9822 ) ) ( not ( = ?auto_9819 ?auto_9822 ) ) ( not ( = ?auto_9821 ?auto_9820 ) ) ( IS-CRATE ?auto_9818 ) ( not ( = ?auto_9829 ?auto_9825 ) ) ( HOIST-AT ?auto_9826 ?auto_9829 ) ( SURFACE-AT ?auto_9818 ?auto_9829 ) ( ON ?auto_9818 ?auto_9830 ) ( CLEAR ?auto_9818 ) ( not ( = ?auto_9817 ?auto_9818 ) ) ( not ( = ?auto_9817 ?auto_9830 ) ) ( not ( = ?auto_9818 ?auto_9830 ) ) ( not ( = ?auto_9821 ?auto_9826 ) ) ( IS-CRATE ?auto_9817 ) ( not ( = ?auto_9838 ?auto_9825 ) ) ( HOIST-AT ?auto_9835 ?auto_9838 ) ( SURFACE-AT ?auto_9817 ?auto_9838 ) ( ON ?auto_9817 ?auto_9836 ) ( CLEAR ?auto_9817 ) ( not ( = ?auto_9816 ?auto_9817 ) ) ( not ( = ?auto_9816 ?auto_9836 ) ) ( not ( = ?auto_9817 ?auto_9836 ) ) ( not ( = ?auto_9821 ?auto_9835 ) ) ( IS-CRATE ?auto_9816 ) ( SURFACE-AT ?auto_9816 ?auto_9829 ) ( ON ?auto_9816 ?auto_9827 ) ( CLEAR ?auto_9816 ) ( not ( = ?auto_9815 ?auto_9816 ) ) ( not ( = ?auto_9815 ?auto_9827 ) ) ( not ( = ?auto_9816 ?auto_9827 ) ) ( IS-CRATE ?auto_9815 ) ( not ( = ?auto_9834 ?auto_9825 ) ) ( HOIST-AT ?auto_9841 ?auto_9834 ) ( SURFACE-AT ?auto_9815 ?auto_9834 ) ( ON ?auto_9815 ?auto_9832 ) ( CLEAR ?auto_9815 ) ( not ( = ?auto_9814 ?auto_9815 ) ) ( not ( = ?auto_9814 ?auto_9832 ) ) ( not ( = ?auto_9815 ?auto_9832 ) ) ( not ( = ?auto_9821 ?auto_9841 ) ) ( IS-CRATE ?auto_9814 ) ( AVAILABLE ?auto_9820 ) ( SURFACE-AT ?auto_9814 ?auto_9824 ) ( ON ?auto_9814 ?auto_9839 ) ( CLEAR ?auto_9814 ) ( not ( = ?auto_9813 ?auto_9814 ) ) ( not ( = ?auto_9813 ?auto_9839 ) ) ( not ( = ?auto_9814 ?auto_9839 ) ) ( IS-CRATE ?auto_9813 ) ( SURFACE-AT ?auto_9813 ?auto_9838 ) ( ON ?auto_9813 ?auto_9833 ) ( CLEAR ?auto_9813 ) ( not ( = ?auto_9812 ?auto_9813 ) ) ( not ( = ?auto_9812 ?auto_9833 ) ) ( not ( = ?auto_9813 ?auto_9833 ) ) ( IS-CRATE ?auto_9812 ) ( SURFACE-AT ?auto_9812 ?auto_9829 ) ( ON ?auto_9812 ?auto_9831 ) ( CLEAR ?auto_9812 ) ( not ( = ?auto_9811 ?auto_9812 ) ) ( not ( = ?auto_9811 ?auto_9831 ) ) ( not ( = ?auto_9812 ?auto_9831 ) ) ( IS-CRATE ?auto_9811 ) ( AVAILABLE ?auto_9835 ) ( SURFACE-AT ?auto_9811 ?auto_9838 ) ( ON ?auto_9811 ?auto_9828 ) ( CLEAR ?auto_9811 ) ( not ( = ?auto_9810 ?auto_9811 ) ) ( not ( = ?auto_9810 ?auto_9828 ) ) ( not ( = ?auto_9811 ?auto_9828 ) ) ( IS-CRATE ?auto_9810 ) ( AVAILABLE ?auto_9841 ) ( SURFACE-AT ?auto_9810 ?auto_9834 ) ( ON ?auto_9810 ?auto_9840 ) ( CLEAR ?auto_9810 ) ( not ( = ?auto_9809 ?auto_9810 ) ) ( not ( = ?auto_9809 ?auto_9840 ) ) ( not ( = ?auto_9810 ?auto_9840 ) ) ( SURFACE-AT ?auto_9808 ?auto_9825 ) ( CLEAR ?auto_9808 ) ( IS-CRATE ?auto_9809 ) ( AVAILABLE ?auto_9821 ) ( AVAILABLE ?auto_9826 ) ( SURFACE-AT ?auto_9809 ?auto_9829 ) ( ON ?auto_9809 ?auto_9837 ) ( CLEAR ?auto_9809 ) ( TRUCK-AT ?auto_9823 ?auto_9825 ) ( not ( = ?auto_9808 ?auto_9809 ) ) ( not ( = ?auto_9808 ?auto_9837 ) ) ( not ( = ?auto_9809 ?auto_9837 ) ) ( not ( = ?auto_9808 ?auto_9810 ) ) ( not ( = ?auto_9808 ?auto_9840 ) ) ( not ( = ?auto_9810 ?auto_9837 ) ) ( not ( = ?auto_9834 ?auto_9829 ) ) ( not ( = ?auto_9841 ?auto_9826 ) ) ( not ( = ?auto_9840 ?auto_9837 ) ) ( not ( = ?auto_9808 ?auto_9811 ) ) ( not ( = ?auto_9808 ?auto_9828 ) ) ( not ( = ?auto_9809 ?auto_9811 ) ) ( not ( = ?auto_9809 ?auto_9828 ) ) ( not ( = ?auto_9811 ?auto_9840 ) ) ( not ( = ?auto_9811 ?auto_9837 ) ) ( not ( = ?auto_9838 ?auto_9834 ) ) ( not ( = ?auto_9838 ?auto_9829 ) ) ( not ( = ?auto_9835 ?auto_9841 ) ) ( not ( = ?auto_9835 ?auto_9826 ) ) ( not ( = ?auto_9828 ?auto_9840 ) ) ( not ( = ?auto_9828 ?auto_9837 ) ) ( not ( = ?auto_9808 ?auto_9812 ) ) ( not ( = ?auto_9808 ?auto_9831 ) ) ( not ( = ?auto_9809 ?auto_9812 ) ) ( not ( = ?auto_9809 ?auto_9831 ) ) ( not ( = ?auto_9810 ?auto_9812 ) ) ( not ( = ?auto_9810 ?auto_9831 ) ) ( not ( = ?auto_9812 ?auto_9828 ) ) ( not ( = ?auto_9812 ?auto_9840 ) ) ( not ( = ?auto_9812 ?auto_9837 ) ) ( not ( = ?auto_9831 ?auto_9828 ) ) ( not ( = ?auto_9831 ?auto_9840 ) ) ( not ( = ?auto_9831 ?auto_9837 ) ) ( not ( = ?auto_9808 ?auto_9813 ) ) ( not ( = ?auto_9808 ?auto_9833 ) ) ( not ( = ?auto_9809 ?auto_9813 ) ) ( not ( = ?auto_9809 ?auto_9833 ) ) ( not ( = ?auto_9810 ?auto_9813 ) ) ( not ( = ?auto_9810 ?auto_9833 ) ) ( not ( = ?auto_9811 ?auto_9813 ) ) ( not ( = ?auto_9811 ?auto_9833 ) ) ( not ( = ?auto_9813 ?auto_9831 ) ) ( not ( = ?auto_9813 ?auto_9828 ) ) ( not ( = ?auto_9813 ?auto_9840 ) ) ( not ( = ?auto_9813 ?auto_9837 ) ) ( not ( = ?auto_9833 ?auto_9831 ) ) ( not ( = ?auto_9833 ?auto_9828 ) ) ( not ( = ?auto_9833 ?auto_9840 ) ) ( not ( = ?auto_9833 ?auto_9837 ) ) ( not ( = ?auto_9808 ?auto_9814 ) ) ( not ( = ?auto_9808 ?auto_9839 ) ) ( not ( = ?auto_9809 ?auto_9814 ) ) ( not ( = ?auto_9809 ?auto_9839 ) ) ( not ( = ?auto_9810 ?auto_9814 ) ) ( not ( = ?auto_9810 ?auto_9839 ) ) ( not ( = ?auto_9811 ?auto_9814 ) ) ( not ( = ?auto_9811 ?auto_9839 ) ) ( not ( = ?auto_9812 ?auto_9814 ) ) ( not ( = ?auto_9812 ?auto_9839 ) ) ( not ( = ?auto_9814 ?auto_9833 ) ) ( not ( = ?auto_9814 ?auto_9831 ) ) ( not ( = ?auto_9814 ?auto_9828 ) ) ( not ( = ?auto_9814 ?auto_9840 ) ) ( not ( = ?auto_9814 ?auto_9837 ) ) ( not ( = ?auto_9824 ?auto_9838 ) ) ( not ( = ?auto_9824 ?auto_9829 ) ) ( not ( = ?auto_9824 ?auto_9834 ) ) ( not ( = ?auto_9820 ?auto_9835 ) ) ( not ( = ?auto_9820 ?auto_9826 ) ) ( not ( = ?auto_9820 ?auto_9841 ) ) ( not ( = ?auto_9839 ?auto_9833 ) ) ( not ( = ?auto_9839 ?auto_9831 ) ) ( not ( = ?auto_9839 ?auto_9828 ) ) ( not ( = ?auto_9839 ?auto_9840 ) ) ( not ( = ?auto_9839 ?auto_9837 ) ) ( not ( = ?auto_9808 ?auto_9815 ) ) ( not ( = ?auto_9808 ?auto_9832 ) ) ( not ( = ?auto_9809 ?auto_9815 ) ) ( not ( = ?auto_9809 ?auto_9832 ) ) ( not ( = ?auto_9810 ?auto_9815 ) ) ( not ( = ?auto_9810 ?auto_9832 ) ) ( not ( = ?auto_9811 ?auto_9815 ) ) ( not ( = ?auto_9811 ?auto_9832 ) ) ( not ( = ?auto_9812 ?auto_9815 ) ) ( not ( = ?auto_9812 ?auto_9832 ) ) ( not ( = ?auto_9813 ?auto_9815 ) ) ( not ( = ?auto_9813 ?auto_9832 ) ) ( not ( = ?auto_9815 ?auto_9839 ) ) ( not ( = ?auto_9815 ?auto_9833 ) ) ( not ( = ?auto_9815 ?auto_9831 ) ) ( not ( = ?auto_9815 ?auto_9828 ) ) ( not ( = ?auto_9815 ?auto_9840 ) ) ( not ( = ?auto_9815 ?auto_9837 ) ) ( not ( = ?auto_9832 ?auto_9839 ) ) ( not ( = ?auto_9832 ?auto_9833 ) ) ( not ( = ?auto_9832 ?auto_9831 ) ) ( not ( = ?auto_9832 ?auto_9828 ) ) ( not ( = ?auto_9832 ?auto_9840 ) ) ( not ( = ?auto_9832 ?auto_9837 ) ) ( not ( = ?auto_9808 ?auto_9816 ) ) ( not ( = ?auto_9808 ?auto_9827 ) ) ( not ( = ?auto_9809 ?auto_9816 ) ) ( not ( = ?auto_9809 ?auto_9827 ) ) ( not ( = ?auto_9810 ?auto_9816 ) ) ( not ( = ?auto_9810 ?auto_9827 ) ) ( not ( = ?auto_9811 ?auto_9816 ) ) ( not ( = ?auto_9811 ?auto_9827 ) ) ( not ( = ?auto_9812 ?auto_9816 ) ) ( not ( = ?auto_9812 ?auto_9827 ) ) ( not ( = ?auto_9813 ?auto_9816 ) ) ( not ( = ?auto_9813 ?auto_9827 ) ) ( not ( = ?auto_9814 ?auto_9816 ) ) ( not ( = ?auto_9814 ?auto_9827 ) ) ( not ( = ?auto_9816 ?auto_9832 ) ) ( not ( = ?auto_9816 ?auto_9839 ) ) ( not ( = ?auto_9816 ?auto_9833 ) ) ( not ( = ?auto_9816 ?auto_9831 ) ) ( not ( = ?auto_9816 ?auto_9828 ) ) ( not ( = ?auto_9816 ?auto_9840 ) ) ( not ( = ?auto_9816 ?auto_9837 ) ) ( not ( = ?auto_9827 ?auto_9832 ) ) ( not ( = ?auto_9827 ?auto_9839 ) ) ( not ( = ?auto_9827 ?auto_9833 ) ) ( not ( = ?auto_9827 ?auto_9831 ) ) ( not ( = ?auto_9827 ?auto_9828 ) ) ( not ( = ?auto_9827 ?auto_9840 ) ) ( not ( = ?auto_9827 ?auto_9837 ) ) ( not ( = ?auto_9808 ?auto_9817 ) ) ( not ( = ?auto_9808 ?auto_9836 ) ) ( not ( = ?auto_9809 ?auto_9817 ) ) ( not ( = ?auto_9809 ?auto_9836 ) ) ( not ( = ?auto_9810 ?auto_9817 ) ) ( not ( = ?auto_9810 ?auto_9836 ) ) ( not ( = ?auto_9811 ?auto_9817 ) ) ( not ( = ?auto_9811 ?auto_9836 ) ) ( not ( = ?auto_9812 ?auto_9817 ) ) ( not ( = ?auto_9812 ?auto_9836 ) ) ( not ( = ?auto_9813 ?auto_9817 ) ) ( not ( = ?auto_9813 ?auto_9836 ) ) ( not ( = ?auto_9814 ?auto_9817 ) ) ( not ( = ?auto_9814 ?auto_9836 ) ) ( not ( = ?auto_9815 ?auto_9817 ) ) ( not ( = ?auto_9815 ?auto_9836 ) ) ( not ( = ?auto_9817 ?auto_9827 ) ) ( not ( = ?auto_9817 ?auto_9832 ) ) ( not ( = ?auto_9817 ?auto_9839 ) ) ( not ( = ?auto_9817 ?auto_9833 ) ) ( not ( = ?auto_9817 ?auto_9831 ) ) ( not ( = ?auto_9817 ?auto_9828 ) ) ( not ( = ?auto_9817 ?auto_9840 ) ) ( not ( = ?auto_9817 ?auto_9837 ) ) ( not ( = ?auto_9836 ?auto_9827 ) ) ( not ( = ?auto_9836 ?auto_9832 ) ) ( not ( = ?auto_9836 ?auto_9839 ) ) ( not ( = ?auto_9836 ?auto_9833 ) ) ( not ( = ?auto_9836 ?auto_9831 ) ) ( not ( = ?auto_9836 ?auto_9828 ) ) ( not ( = ?auto_9836 ?auto_9840 ) ) ( not ( = ?auto_9836 ?auto_9837 ) ) ( not ( = ?auto_9808 ?auto_9818 ) ) ( not ( = ?auto_9808 ?auto_9830 ) ) ( not ( = ?auto_9809 ?auto_9818 ) ) ( not ( = ?auto_9809 ?auto_9830 ) ) ( not ( = ?auto_9810 ?auto_9818 ) ) ( not ( = ?auto_9810 ?auto_9830 ) ) ( not ( = ?auto_9811 ?auto_9818 ) ) ( not ( = ?auto_9811 ?auto_9830 ) ) ( not ( = ?auto_9812 ?auto_9818 ) ) ( not ( = ?auto_9812 ?auto_9830 ) ) ( not ( = ?auto_9813 ?auto_9818 ) ) ( not ( = ?auto_9813 ?auto_9830 ) ) ( not ( = ?auto_9814 ?auto_9818 ) ) ( not ( = ?auto_9814 ?auto_9830 ) ) ( not ( = ?auto_9815 ?auto_9818 ) ) ( not ( = ?auto_9815 ?auto_9830 ) ) ( not ( = ?auto_9816 ?auto_9818 ) ) ( not ( = ?auto_9816 ?auto_9830 ) ) ( not ( = ?auto_9818 ?auto_9836 ) ) ( not ( = ?auto_9818 ?auto_9827 ) ) ( not ( = ?auto_9818 ?auto_9832 ) ) ( not ( = ?auto_9818 ?auto_9839 ) ) ( not ( = ?auto_9818 ?auto_9833 ) ) ( not ( = ?auto_9818 ?auto_9831 ) ) ( not ( = ?auto_9818 ?auto_9828 ) ) ( not ( = ?auto_9818 ?auto_9840 ) ) ( not ( = ?auto_9818 ?auto_9837 ) ) ( not ( = ?auto_9830 ?auto_9836 ) ) ( not ( = ?auto_9830 ?auto_9827 ) ) ( not ( = ?auto_9830 ?auto_9832 ) ) ( not ( = ?auto_9830 ?auto_9839 ) ) ( not ( = ?auto_9830 ?auto_9833 ) ) ( not ( = ?auto_9830 ?auto_9831 ) ) ( not ( = ?auto_9830 ?auto_9828 ) ) ( not ( = ?auto_9830 ?auto_9840 ) ) ( not ( = ?auto_9830 ?auto_9837 ) ) ( not ( = ?auto_9808 ?auto_9819 ) ) ( not ( = ?auto_9808 ?auto_9822 ) ) ( not ( = ?auto_9809 ?auto_9819 ) ) ( not ( = ?auto_9809 ?auto_9822 ) ) ( not ( = ?auto_9810 ?auto_9819 ) ) ( not ( = ?auto_9810 ?auto_9822 ) ) ( not ( = ?auto_9811 ?auto_9819 ) ) ( not ( = ?auto_9811 ?auto_9822 ) ) ( not ( = ?auto_9812 ?auto_9819 ) ) ( not ( = ?auto_9812 ?auto_9822 ) ) ( not ( = ?auto_9813 ?auto_9819 ) ) ( not ( = ?auto_9813 ?auto_9822 ) ) ( not ( = ?auto_9814 ?auto_9819 ) ) ( not ( = ?auto_9814 ?auto_9822 ) ) ( not ( = ?auto_9815 ?auto_9819 ) ) ( not ( = ?auto_9815 ?auto_9822 ) ) ( not ( = ?auto_9816 ?auto_9819 ) ) ( not ( = ?auto_9816 ?auto_9822 ) ) ( not ( = ?auto_9817 ?auto_9819 ) ) ( not ( = ?auto_9817 ?auto_9822 ) ) ( not ( = ?auto_9819 ?auto_9830 ) ) ( not ( = ?auto_9819 ?auto_9836 ) ) ( not ( = ?auto_9819 ?auto_9827 ) ) ( not ( = ?auto_9819 ?auto_9832 ) ) ( not ( = ?auto_9819 ?auto_9839 ) ) ( not ( = ?auto_9819 ?auto_9833 ) ) ( not ( = ?auto_9819 ?auto_9831 ) ) ( not ( = ?auto_9819 ?auto_9828 ) ) ( not ( = ?auto_9819 ?auto_9840 ) ) ( not ( = ?auto_9819 ?auto_9837 ) ) ( not ( = ?auto_9822 ?auto_9830 ) ) ( not ( = ?auto_9822 ?auto_9836 ) ) ( not ( = ?auto_9822 ?auto_9827 ) ) ( not ( = ?auto_9822 ?auto_9832 ) ) ( not ( = ?auto_9822 ?auto_9839 ) ) ( not ( = ?auto_9822 ?auto_9833 ) ) ( not ( = ?auto_9822 ?auto_9831 ) ) ( not ( = ?auto_9822 ?auto_9828 ) ) ( not ( = ?auto_9822 ?auto_9840 ) ) ( not ( = ?auto_9822 ?auto_9837 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_9808 ?auto_9809 ?auto_9810 ?auto_9811 ?auto_9812 ?auto_9813 ?auto_9814 ?auto_9815 ?auto_9816 ?auto_9817 ?auto_9818 )
      ( MAKE-1CRATE ?auto_9818 ?auto_9819 )
      ( MAKE-11CRATE-VERIFY ?auto_9808 ?auto_9809 ?auto_9810 ?auto_9811 ?auto_9812 ?auto_9813 ?auto_9814 ?auto_9815 ?auto_9816 ?auto_9817 ?auto_9818 ?auto_9819 ) )
  )

)

