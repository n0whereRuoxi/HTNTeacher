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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4442 - SURFACE
      ?auto_4443 - SURFACE
    )
    :vars
    (
      ?auto_4444 - HOIST
      ?auto_4445 - PLACE
      ?auto_4447 - PLACE
      ?auto_4448 - HOIST
      ?auto_4449 - SURFACE
      ?auto_4446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4444 ?auto_4445 ) ( SURFACE-AT ?auto_4442 ?auto_4445 ) ( CLEAR ?auto_4442 ) ( IS-CRATE ?auto_4443 ) ( AVAILABLE ?auto_4444 ) ( not ( = ?auto_4447 ?auto_4445 ) ) ( HOIST-AT ?auto_4448 ?auto_4447 ) ( AVAILABLE ?auto_4448 ) ( SURFACE-AT ?auto_4443 ?auto_4447 ) ( ON ?auto_4443 ?auto_4449 ) ( CLEAR ?auto_4443 ) ( TRUCK-AT ?auto_4446 ?auto_4445 ) ( not ( = ?auto_4442 ?auto_4443 ) ) ( not ( = ?auto_4442 ?auto_4449 ) ) ( not ( = ?auto_4443 ?auto_4449 ) ) ( not ( = ?auto_4444 ?auto_4448 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4446 ?auto_4445 ?auto_4447 )
      ( !LIFT ?auto_4448 ?auto_4443 ?auto_4449 ?auto_4447 )
      ( !LOAD ?auto_4448 ?auto_4443 ?auto_4446 ?auto_4447 )
      ( !DRIVE ?auto_4446 ?auto_4447 ?auto_4445 )
      ( !UNLOAD ?auto_4444 ?auto_4443 ?auto_4446 ?auto_4445 )
      ( !DROP ?auto_4444 ?auto_4443 ?auto_4442 ?auto_4445 )
      ( MAKE-1CRATE-VERIFY ?auto_4442 ?auto_4443 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4463 - SURFACE
      ?auto_4464 - SURFACE
      ?auto_4465 - SURFACE
    )
    :vars
    (
      ?auto_4471 - HOIST
      ?auto_4467 - PLACE
      ?auto_4466 - PLACE
      ?auto_4469 - HOIST
      ?auto_4468 - SURFACE
      ?auto_4472 - SURFACE
      ?auto_4470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4471 ?auto_4467 ) ( IS-CRATE ?auto_4465 ) ( not ( = ?auto_4466 ?auto_4467 ) ) ( HOIST-AT ?auto_4469 ?auto_4466 ) ( SURFACE-AT ?auto_4465 ?auto_4466 ) ( ON ?auto_4465 ?auto_4468 ) ( CLEAR ?auto_4465 ) ( not ( = ?auto_4464 ?auto_4465 ) ) ( not ( = ?auto_4464 ?auto_4468 ) ) ( not ( = ?auto_4465 ?auto_4468 ) ) ( not ( = ?auto_4471 ?auto_4469 ) ) ( SURFACE-AT ?auto_4463 ?auto_4467 ) ( CLEAR ?auto_4463 ) ( IS-CRATE ?auto_4464 ) ( AVAILABLE ?auto_4471 ) ( AVAILABLE ?auto_4469 ) ( SURFACE-AT ?auto_4464 ?auto_4466 ) ( ON ?auto_4464 ?auto_4472 ) ( CLEAR ?auto_4464 ) ( TRUCK-AT ?auto_4470 ?auto_4467 ) ( not ( = ?auto_4463 ?auto_4464 ) ) ( not ( = ?auto_4463 ?auto_4472 ) ) ( not ( = ?auto_4464 ?auto_4472 ) ) ( not ( = ?auto_4463 ?auto_4465 ) ) ( not ( = ?auto_4463 ?auto_4468 ) ) ( not ( = ?auto_4465 ?auto_4472 ) ) ( not ( = ?auto_4468 ?auto_4472 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4463 ?auto_4464 )
      ( MAKE-1CRATE ?auto_4464 ?auto_4465 )
      ( MAKE-2CRATE-VERIFY ?auto_4463 ?auto_4464 ?auto_4465 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4487 - SURFACE
      ?auto_4488 - SURFACE
      ?auto_4489 - SURFACE
      ?auto_4490 - SURFACE
    )
    :vars
    (
      ?auto_4491 - HOIST
      ?auto_4494 - PLACE
      ?auto_4493 - PLACE
      ?auto_4496 - HOIST
      ?auto_4495 - SURFACE
      ?auto_4498 - SURFACE
      ?auto_4497 - SURFACE
      ?auto_4492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4491 ?auto_4494 ) ( IS-CRATE ?auto_4490 ) ( not ( = ?auto_4493 ?auto_4494 ) ) ( HOIST-AT ?auto_4496 ?auto_4493 ) ( SURFACE-AT ?auto_4490 ?auto_4493 ) ( ON ?auto_4490 ?auto_4495 ) ( CLEAR ?auto_4490 ) ( not ( = ?auto_4489 ?auto_4490 ) ) ( not ( = ?auto_4489 ?auto_4495 ) ) ( not ( = ?auto_4490 ?auto_4495 ) ) ( not ( = ?auto_4491 ?auto_4496 ) ) ( IS-CRATE ?auto_4489 ) ( SURFACE-AT ?auto_4489 ?auto_4493 ) ( ON ?auto_4489 ?auto_4498 ) ( CLEAR ?auto_4489 ) ( not ( = ?auto_4488 ?auto_4489 ) ) ( not ( = ?auto_4488 ?auto_4498 ) ) ( not ( = ?auto_4489 ?auto_4498 ) ) ( SURFACE-AT ?auto_4487 ?auto_4494 ) ( CLEAR ?auto_4487 ) ( IS-CRATE ?auto_4488 ) ( AVAILABLE ?auto_4491 ) ( AVAILABLE ?auto_4496 ) ( SURFACE-AT ?auto_4488 ?auto_4493 ) ( ON ?auto_4488 ?auto_4497 ) ( CLEAR ?auto_4488 ) ( TRUCK-AT ?auto_4492 ?auto_4494 ) ( not ( = ?auto_4487 ?auto_4488 ) ) ( not ( = ?auto_4487 ?auto_4497 ) ) ( not ( = ?auto_4488 ?auto_4497 ) ) ( not ( = ?auto_4487 ?auto_4489 ) ) ( not ( = ?auto_4487 ?auto_4498 ) ) ( not ( = ?auto_4489 ?auto_4497 ) ) ( not ( = ?auto_4498 ?auto_4497 ) ) ( not ( = ?auto_4487 ?auto_4490 ) ) ( not ( = ?auto_4487 ?auto_4495 ) ) ( not ( = ?auto_4488 ?auto_4490 ) ) ( not ( = ?auto_4488 ?auto_4495 ) ) ( not ( = ?auto_4490 ?auto_4498 ) ) ( not ( = ?auto_4490 ?auto_4497 ) ) ( not ( = ?auto_4495 ?auto_4498 ) ) ( not ( = ?auto_4495 ?auto_4497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4487 ?auto_4488 ?auto_4489 )
      ( MAKE-1CRATE ?auto_4489 ?auto_4490 )
      ( MAKE-3CRATE-VERIFY ?auto_4487 ?auto_4488 ?auto_4489 ?auto_4490 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_4514 - SURFACE
      ?auto_4515 - SURFACE
      ?auto_4516 - SURFACE
      ?auto_4517 - SURFACE
      ?auto_4518 - SURFACE
    )
    :vars
    (
      ?auto_4521 - HOIST
      ?auto_4520 - PLACE
      ?auto_4522 - PLACE
      ?auto_4523 - HOIST
      ?auto_4519 - SURFACE
      ?auto_4529 - PLACE
      ?auto_4526 - HOIST
      ?auto_4528 - SURFACE
      ?auto_4527 - SURFACE
      ?auto_4525 - SURFACE
      ?auto_4524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4521 ?auto_4520 ) ( IS-CRATE ?auto_4518 ) ( not ( = ?auto_4522 ?auto_4520 ) ) ( HOIST-AT ?auto_4523 ?auto_4522 ) ( AVAILABLE ?auto_4523 ) ( SURFACE-AT ?auto_4518 ?auto_4522 ) ( ON ?auto_4518 ?auto_4519 ) ( CLEAR ?auto_4518 ) ( not ( = ?auto_4517 ?auto_4518 ) ) ( not ( = ?auto_4517 ?auto_4519 ) ) ( not ( = ?auto_4518 ?auto_4519 ) ) ( not ( = ?auto_4521 ?auto_4523 ) ) ( IS-CRATE ?auto_4517 ) ( not ( = ?auto_4529 ?auto_4520 ) ) ( HOIST-AT ?auto_4526 ?auto_4529 ) ( SURFACE-AT ?auto_4517 ?auto_4529 ) ( ON ?auto_4517 ?auto_4528 ) ( CLEAR ?auto_4517 ) ( not ( = ?auto_4516 ?auto_4517 ) ) ( not ( = ?auto_4516 ?auto_4528 ) ) ( not ( = ?auto_4517 ?auto_4528 ) ) ( not ( = ?auto_4521 ?auto_4526 ) ) ( IS-CRATE ?auto_4516 ) ( SURFACE-AT ?auto_4516 ?auto_4529 ) ( ON ?auto_4516 ?auto_4527 ) ( CLEAR ?auto_4516 ) ( not ( = ?auto_4515 ?auto_4516 ) ) ( not ( = ?auto_4515 ?auto_4527 ) ) ( not ( = ?auto_4516 ?auto_4527 ) ) ( SURFACE-AT ?auto_4514 ?auto_4520 ) ( CLEAR ?auto_4514 ) ( IS-CRATE ?auto_4515 ) ( AVAILABLE ?auto_4521 ) ( AVAILABLE ?auto_4526 ) ( SURFACE-AT ?auto_4515 ?auto_4529 ) ( ON ?auto_4515 ?auto_4525 ) ( CLEAR ?auto_4515 ) ( TRUCK-AT ?auto_4524 ?auto_4520 ) ( not ( = ?auto_4514 ?auto_4515 ) ) ( not ( = ?auto_4514 ?auto_4525 ) ) ( not ( = ?auto_4515 ?auto_4525 ) ) ( not ( = ?auto_4514 ?auto_4516 ) ) ( not ( = ?auto_4514 ?auto_4527 ) ) ( not ( = ?auto_4516 ?auto_4525 ) ) ( not ( = ?auto_4527 ?auto_4525 ) ) ( not ( = ?auto_4514 ?auto_4517 ) ) ( not ( = ?auto_4514 ?auto_4528 ) ) ( not ( = ?auto_4515 ?auto_4517 ) ) ( not ( = ?auto_4515 ?auto_4528 ) ) ( not ( = ?auto_4517 ?auto_4527 ) ) ( not ( = ?auto_4517 ?auto_4525 ) ) ( not ( = ?auto_4528 ?auto_4527 ) ) ( not ( = ?auto_4528 ?auto_4525 ) ) ( not ( = ?auto_4514 ?auto_4518 ) ) ( not ( = ?auto_4514 ?auto_4519 ) ) ( not ( = ?auto_4515 ?auto_4518 ) ) ( not ( = ?auto_4515 ?auto_4519 ) ) ( not ( = ?auto_4516 ?auto_4518 ) ) ( not ( = ?auto_4516 ?auto_4519 ) ) ( not ( = ?auto_4518 ?auto_4528 ) ) ( not ( = ?auto_4518 ?auto_4527 ) ) ( not ( = ?auto_4518 ?auto_4525 ) ) ( not ( = ?auto_4522 ?auto_4529 ) ) ( not ( = ?auto_4523 ?auto_4526 ) ) ( not ( = ?auto_4519 ?auto_4528 ) ) ( not ( = ?auto_4519 ?auto_4527 ) ) ( not ( = ?auto_4519 ?auto_4525 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4514 ?auto_4515 ?auto_4516 ?auto_4517 )
      ( MAKE-1CRATE ?auto_4517 ?auto_4518 )
      ( MAKE-4CRATE-VERIFY ?auto_4514 ?auto_4515 ?auto_4516 ?auto_4517 ?auto_4518 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_4546 - SURFACE
      ?auto_4547 - SURFACE
      ?auto_4548 - SURFACE
      ?auto_4549 - SURFACE
      ?auto_4550 - SURFACE
      ?auto_4551 - SURFACE
    )
    :vars
    (
      ?auto_4557 - HOIST
      ?auto_4553 - PLACE
      ?auto_4556 - PLACE
      ?auto_4555 - HOIST
      ?auto_4554 - SURFACE
      ?auto_4562 - PLACE
      ?auto_4561 - HOIST
      ?auto_4558 - SURFACE
      ?auto_4565 - PLACE
      ?auto_4563 - HOIST
      ?auto_4564 - SURFACE
      ?auto_4559 - SURFACE
      ?auto_4560 - SURFACE
      ?auto_4552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4557 ?auto_4553 ) ( IS-CRATE ?auto_4551 ) ( not ( = ?auto_4556 ?auto_4553 ) ) ( HOIST-AT ?auto_4555 ?auto_4556 ) ( AVAILABLE ?auto_4555 ) ( SURFACE-AT ?auto_4551 ?auto_4556 ) ( ON ?auto_4551 ?auto_4554 ) ( CLEAR ?auto_4551 ) ( not ( = ?auto_4550 ?auto_4551 ) ) ( not ( = ?auto_4550 ?auto_4554 ) ) ( not ( = ?auto_4551 ?auto_4554 ) ) ( not ( = ?auto_4557 ?auto_4555 ) ) ( IS-CRATE ?auto_4550 ) ( not ( = ?auto_4562 ?auto_4553 ) ) ( HOIST-AT ?auto_4561 ?auto_4562 ) ( AVAILABLE ?auto_4561 ) ( SURFACE-AT ?auto_4550 ?auto_4562 ) ( ON ?auto_4550 ?auto_4558 ) ( CLEAR ?auto_4550 ) ( not ( = ?auto_4549 ?auto_4550 ) ) ( not ( = ?auto_4549 ?auto_4558 ) ) ( not ( = ?auto_4550 ?auto_4558 ) ) ( not ( = ?auto_4557 ?auto_4561 ) ) ( IS-CRATE ?auto_4549 ) ( not ( = ?auto_4565 ?auto_4553 ) ) ( HOIST-AT ?auto_4563 ?auto_4565 ) ( SURFACE-AT ?auto_4549 ?auto_4565 ) ( ON ?auto_4549 ?auto_4564 ) ( CLEAR ?auto_4549 ) ( not ( = ?auto_4548 ?auto_4549 ) ) ( not ( = ?auto_4548 ?auto_4564 ) ) ( not ( = ?auto_4549 ?auto_4564 ) ) ( not ( = ?auto_4557 ?auto_4563 ) ) ( IS-CRATE ?auto_4548 ) ( SURFACE-AT ?auto_4548 ?auto_4565 ) ( ON ?auto_4548 ?auto_4559 ) ( CLEAR ?auto_4548 ) ( not ( = ?auto_4547 ?auto_4548 ) ) ( not ( = ?auto_4547 ?auto_4559 ) ) ( not ( = ?auto_4548 ?auto_4559 ) ) ( SURFACE-AT ?auto_4546 ?auto_4553 ) ( CLEAR ?auto_4546 ) ( IS-CRATE ?auto_4547 ) ( AVAILABLE ?auto_4557 ) ( AVAILABLE ?auto_4563 ) ( SURFACE-AT ?auto_4547 ?auto_4565 ) ( ON ?auto_4547 ?auto_4560 ) ( CLEAR ?auto_4547 ) ( TRUCK-AT ?auto_4552 ?auto_4553 ) ( not ( = ?auto_4546 ?auto_4547 ) ) ( not ( = ?auto_4546 ?auto_4560 ) ) ( not ( = ?auto_4547 ?auto_4560 ) ) ( not ( = ?auto_4546 ?auto_4548 ) ) ( not ( = ?auto_4546 ?auto_4559 ) ) ( not ( = ?auto_4548 ?auto_4560 ) ) ( not ( = ?auto_4559 ?auto_4560 ) ) ( not ( = ?auto_4546 ?auto_4549 ) ) ( not ( = ?auto_4546 ?auto_4564 ) ) ( not ( = ?auto_4547 ?auto_4549 ) ) ( not ( = ?auto_4547 ?auto_4564 ) ) ( not ( = ?auto_4549 ?auto_4559 ) ) ( not ( = ?auto_4549 ?auto_4560 ) ) ( not ( = ?auto_4564 ?auto_4559 ) ) ( not ( = ?auto_4564 ?auto_4560 ) ) ( not ( = ?auto_4546 ?auto_4550 ) ) ( not ( = ?auto_4546 ?auto_4558 ) ) ( not ( = ?auto_4547 ?auto_4550 ) ) ( not ( = ?auto_4547 ?auto_4558 ) ) ( not ( = ?auto_4548 ?auto_4550 ) ) ( not ( = ?auto_4548 ?auto_4558 ) ) ( not ( = ?auto_4550 ?auto_4564 ) ) ( not ( = ?auto_4550 ?auto_4559 ) ) ( not ( = ?auto_4550 ?auto_4560 ) ) ( not ( = ?auto_4562 ?auto_4565 ) ) ( not ( = ?auto_4561 ?auto_4563 ) ) ( not ( = ?auto_4558 ?auto_4564 ) ) ( not ( = ?auto_4558 ?auto_4559 ) ) ( not ( = ?auto_4558 ?auto_4560 ) ) ( not ( = ?auto_4546 ?auto_4551 ) ) ( not ( = ?auto_4546 ?auto_4554 ) ) ( not ( = ?auto_4547 ?auto_4551 ) ) ( not ( = ?auto_4547 ?auto_4554 ) ) ( not ( = ?auto_4548 ?auto_4551 ) ) ( not ( = ?auto_4548 ?auto_4554 ) ) ( not ( = ?auto_4549 ?auto_4551 ) ) ( not ( = ?auto_4549 ?auto_4554 ) ) ( not ( = ?auto_4551 ?auto_4558 ) ) ( not ( = ?auto_4551 ?auto_4564 ) ) ( not ( = ?auto_4551 ?auto_4559 ) ) ( not ( = ?auto_4551 ?auto_4560 ) ) ( not ( = ?auto_4556 ?auto_4562 ) ) ( not ( = ?auto_4556 ?auto_4565 ) ) ( not ( = ?auto_4555 ?auto_4561 ) ) ( not ( = ?auto_4555 ?auto_4563 ) ) ( not ( = ?auto_4554 ?auto_4558 ) ) ( not ( = ?auto_4554 ?auto_4564 ) ) ( not ( = ?auto_4554 ?auto_4559 ) ) ( not ( = ?auto_4554 ?auto_4560 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4546 ?auto_4547 ?auto_4548 ?auto_4549 ?auto_4550 )
      ( MAKE-1CRATE ?auto_4550 ?auto_4551 )
      ( MAKE-5CRATE-VERIFY ?auto_4546 ?auto_4547 ?auto_4548 ?auto_4549 ?auto_4550 ?auto_4551 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4583 - SURFACE
      ?auto_4584 - SURFACE
      ?auto_4585 - SURFACE
      ?auto_4586 - SURFACE
      ?auto_4587 - SURFACE
      ?auto_4588 - SURFACE
      ?auto_4589 - SURFACE
    )
    :vars
    (
      ?auto_4594 - HOIST
      ?auto_4595 - PLACE
      ?auto_4591 - PLACE
      ?auto_4592 - HOIST
      ?auto_4593 - SURFACE
      ?auto_4601 - PLACE
      ?auto_4600 - HOIST
      ?auto_4599 - SURFACE
      ?auto_4603 - PLACE
      ?auto_4598 - HOIST
      ?auto_4597 - SURFACE
      ?auto_4605 - PLACE
      ?auto_4602 - HOIST
      ?auto_4604 - SURFACE
      ?auto_4596 - SURFACE
      ?auto_4606 - SURFACE
      ?auto_4590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4594 ?auto_4595 ) ( IS-CRATE ?auto_4589 ) ( not ( = ?auto_4591 ?auto_4595 ) ) ( HOIST-AT ?auto_4592 ?auto_4591 ) ( AVAILABLE ?auto_4592 ) ( SURFACE-AT ?auto_4589 ?auto_4591 ) ( ON ?auto_4589 ?auto_4593 ) ( CLEAR ?auto_4589 ) ( not ( = ?auto_4588 ?auto_4589 ) ) ( not ( = ?auto_4588 ?auto_4593 ) ) ( not ( = ?auto_4589 ?auto_4593 ) ) ( not ( = ?auto_4594 ?auto_4592 ) ) ( IS-CRATE ?auto_4588 ) ( not ( = ?auto_4601 ?auto_4595 ) ) ( HOIST-AT ?auto_4600 ?auto_4601 ) ( AVAILABLE ?auto_4600 ) ( SURFACE-AT ?auto_4588 ?auto_4601 ) ( ON ?auto_4588 ?auto_4599 ) ( CLEAR ?auto_4588 ) ( not ( = ?auto_4587 ?auto_4588 ) ) ( not ( = ?auto_4587 ?auto_4599 ) ) ( not ( = ?auto_4588 ?auto_4599 ) ) ( not ( = ?auto_4594 ?auto_4600 ) ) ( IS-CRATE ?auto_4587 ) ( not ( = ?auto_4603 ?auto_4595 ) ) ( HOIST-AT ?auto_4598 ?auto_4603 ) ( AVAILABLE ?auto_4598 ) ( SURFACE-AT ?auto_4587 ?auto_4603 ) ( ON ?auto_4587 ?auto_4597 ) ( CLEAR ?auto_4587 ) ( not ( = ?auto_4586 ?auto_4587 ) ) ( not ( = ?auto_4586 ?auto_4597 ) ) ( not ( = ?auto_4587 ?auto_4597 ) ) ( not ( = ?auto_4594 ?auto_4598 ) ) ( IS-CRATE ?auto_4586 ) ( not ( = ?auto_4605 ?auto_4595 ) ) ( HOIST-AT ?auto_4602 ?auto_4605 ) ( SURFACE-AT ?auto_4586 ?auto_4605 ) ( ON ?auto_4586 ?auto_4604 ) ( CLEAR ?auto_4586 ) ( not ( = ?auto_4585 ?auto_4586 ) ) ( not ( = ?auto_4585 ?auto_4604 ) ) ( not ( = ?auto_4586 ?auto_4604 ) ) ( not ( = ?auto_4594 ?auto_4602 ) ) ( IS-CRATE ?auto_4585 ) ( SURFACE-AT ?auto_4585 ?auto_4605 ) ( ON ?auto_4585 ?auto_4596 ) ( CLEAR ?auto_4585 ) ( not ( = ?auto_4584 ?auto_4585 ) ) ( not ( = ?auto_4584 ?auto_4596 ) ) ( not ( = ?auto_4585 ?auto_4596 ) ) ( SURFACE-AT ?auto_4583 ?auto_4595 ) ( CLEAR ?auto_4583 ) ( IS-CRATE ?auto_4584 ) ( AVAILABLE ?auto_4594 ) ( AVAILABLE ?auto_4602 ) ( SURFACE-AT ?auto_4584 ?auto_4605 ) ( ON ?auto_4584 ?auto_4606 ) ( CLEAR ?auto_4584 ) ( TRUCK-AT ?auto_4590 ?auto_4595 ) ( not ( = ?auto_4583 ?auto_4584 ) ) ( not ( = ?auto_4583 ?auto_4606 ) ) ( not ( = ?auto_4584 ?auto_4606 ) ) ( not ( = ?auto_4583 ?auto_4585 ) ) ( not ( = ?auto_4583 ?auto_4596 ) ) ( not ( = ?auto_4585 ?auto_4606 ) ) ( not ( = ?auto_4596 ?auto_4606 ) ) ( not ( = ?auto_4583 ?auto_4586 ) ) ( not ( = ?auto_4583 ?auto_4604 ) ) ( not ( = ?auto_4584 ?auto_4586 ) ) ( not ( = ?auto_4584 ?auto_4604 ) ) ( not ( = ?auto_4586 ?auto_4596 ) ) ( not ( = ?auto_4586 ?auto_4606 ) ) ( not ( = ?auto_4604 ?auto_4596 ) ) ( not ( = ?auto_4604 ?auto_4606 ) ) ( not ( = ?auto_4583 ?auto_4587 ) ) ( not ( = ?auto_4583 ?auto_4597 ) ) ( not ( = ?auto_4584 ?auto_4587 ) ) ( not ( = ?auto_4584 ?auto_4597 ) ) ( not ( = ?auto_4585 ?auto_4587 ) ) ( not ( = ?auto_4585 ?auto_4597 ) ) ( not ( = ?auto_4587 ?auto_4604 ) ) ( not ( = ?auto_4587 ?auto_4596 ) ) ( not ( = ?auto_4587 ?auto_4606 ) ) ( not ( = ?auto_4603 ?auto_4605 ) ) ( not ( = ?auto_4598 ?auto_4602 ) ) ( not ( = ?auto_4597 ?auto_4604 ) ) ( not ( = ?auto_4597 ?auto_4596 ) ) ( not ( = ?auto_4597 ?auto_4606 ) ) ( not ( = ?auto_4583 ?auto_4588 ) ) ( not ( = ?auto_4583 ?auto_4599 ) ) ( not ( = ?auto_4584 ?auto_4588 ) ) ( not ( = ?auto_4584 ?auto_4599 ) ) ( not ( = ?auto_4585 ?auto_4588 ) ) ( not ( = ?auto_4585 ?auto_4599 ) ) ( not ( = ?auto_4586 ?auto_4588 ) ) ( not ( = ?auto_4586 ?auto_4599 ) ) ( not ( = ?auto_4588 ?auto_4597 ) ) ( not ( = ?auto_4588 ?auto_4604 ) ) ( not ( = ?auto_4588 ?auto_4596 ) ) ( not ( = ?auto_4588 ?auto_4606 ) ) ( not ( = ?auto_4601 ?auto_4603 ) ) ( not ( = ?auto_4601 ?auto_4605 ) ) ( not ( = ?auto_4600 ?auto_4598 ) ) ( not ( = ?auto_4600 ?auto_4602 ) ) ( not ( = ?auto_4599 ?auto_4597 ) ) ( not ( = ?auto_4599 ?auto_4604 ) ) ( not ( = ?auto_4599 ?auto_4596 ) ) ( not ( = ?auto_4599 ?auto_4606 ) ) ( not ( = ?auto_4583 ?auto_4589 ) ) ( not ( = ?auto_4583 ?auto_4593 ) ) ( not ( = ?auto_4584 ?auto_4589 ) ) ( not ( = ?auto_4584 ?auto_4593 ) ) ( not ( = ?auto_4585 ?auto_4589 ) ) ( not ( = ?auto_4585 ?auto_4593 ) ) ( not ( = ?auto_4586 ?auto_4589 ) ) ( not ( = ?auto_4586 ?auto_4593 ) ) ( not ( = ?auto_4587 ?auto_4589 ) ) ( not ( = ?auto_4587 ?auto_4593 ) ) ( not ( = ?auto_4589 ?auto_4599 ) ) ( not ( = ?auto_4589 ?auto_4597 ) ) ( not ( = ?auto_4589 ?auto_4604 ) ) ( not ( = ?auto_4589 ?auto_4596 ) ) ( not ( = ?auto_4589 ?auto_4606 ) ) ( not ( = ?auto_4591 ?auto_4601 ) ) ( not ( = ?auto_4591 ?auto_4603 ) ) ( not ( = ?auto_4591 ?auto_4605 ) ) ( not ( = ?auto_4592 ?auto_4600 ) ) ( not ( = ?auto_4592 ?auto_4598 ) ) ( not ( = ?auto_4592 ?auto_4602 ) ) ( not ( = ?auto_4593 ?auto_4599 ) ) ( not ( = ?auto_4593 ?auto_4597 ) ) ( not ( = ?auto_4593 ?auto_4604 ) ) ( not ( = ?auto_4593 ?auto_4596 ) ) ( not ( = ?auto_4593 ?auto_4606 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4583 ?auto_4584 ?auto_4585 ?auto_4586 ?auto_4587 ?auto_4588 )
      ( MAKE-1CRATE ?auto_4588 ?auto_4589 )
      ( MAKE-6CRATE-VERIFY ?auto_4583 ?auto_4584 ?auto_4585 ?auto_4586 ?auto_4587 ?auto_4588 ?auto_4589 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4625 - SURFACE
      ?auto_4626 - SURFACE
      ?auto_4627 - SURFACE
      ?auto_4628 - SURFACE
      ?auto_4629 - SURFACE
      ?auto_4630 - SURFACE
      ?auto_4631 - SURFACE
      ?auto_4632 - SURFACE
    )
    :vars
    (
      ?auto_4634 - HOIST
      ?auto_4633 - PLACE
      ?auto_4637 - PLACE
      ?auto_4638 - HOIST
      ?auto_4636 - SURFACE
      ?auto_4647 - PLACE
      ?auto_4642 - HOIST
      ?auto_4645 - SURFACE
      ?auto_4639 - PLACE
      ?auto_4643 - HOIST
      ?auto_4650 - SURFACE
      ?auto_4646 - PLACE
      ?auto_4644 - HOIST
      ?auto_4641 - SURFACE
      ?auto_4648 - SURFACE
      ?auto_4640 - SURFACE
      ?auto_4649 - SURFACE
      ?auto_4635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4634 ?auto_4633 ) ( IS-CRATE ?auto_4632 ) ( not ( = ?auto_4637 ?auto_4633 ) ) ( HOIST-AT ?auto_4638 ?auto_4637 ) ( SURFACE-AT ?auto_4632 ?auto_4637 ) ( ON ?auto_4632 ?auto_4636 ) ( CLEAR ?auto_4632 ) ( not ( = ?auto_4631 ?auto_4632 ) ) ( not ( = ?auto_4631 ?auto_4636 ) ) ( not ( = ?auto_4632 ?auto_4636 ) ) ( not ( = ?auto_4634 ?auto_4638 ) ) ( IS-CRATE ?auto_4631 ) ( not ( = ?auto_4647 ?auto_4633 ) ) ( HOIST-AT ?auto_4642 ?auto_4647 ) ( AVAILABLE ?auto_4642 ) ( SURFACE-AT ?auto_4631 ?auto_4647 ) ( ON ?auto_4631 ?auto_4645 ) ( CLEAR ?auto_4631 ) ( not ( = ?auto_4630 ?auto_4631 ) ) ( not ( = ?auto_4630 ?auto_4645 ) ) ( not ( = ?auto_4631 ?auto_4645 ) ) ( not ( = ?auto_4634 ?auto_4642 ) ) ( IS-CRATE ?auto_4630 ) ( not ( = ?auto_4639 ?auto_4633 ) ) ( HOIST-AT ?auto_4643 ?auto_4639 ) ( AVAILABLE ?auto_4643 ) ( SURFACE-AT ?auto_4630 ?auto_4639 ) ( ON ?auto_4630 ?auto_4650 ) ( CLEAR ?auto_4630 ) ( not ( = ?auto_4629 ?auto_4630 ) ) ( not ( = ?auto_4629 ?auto_4650 ) ) ( not ( = ?auto_4630 ?auto_4650 ) ) ( not ( = ?auto_4634 ?auto_4643 ) ) ( IS-CRATE ?auto_4629 ) ( not ( = ?auto_4646 ?auto_4633 ) ) ( HOIST-AT ?auto_4644 ?auto_4646 ) ( AVAILABLE ?auto_4644 ) ( SURFACE-AT ?auto_4629 ?auto_4646 ) ( ON ?auto_4629 ?auto_4641 ) ( CLEAR ?auto_4629 ) ( not ( = ?auto_4628 ?auto_4629 ) ) ( not ( = ?auto_4628 ?auto_4641 ) ) ( not ( = ?auto_4629 ?auto_4641 ) ) ( not ( = ?auto_4634 ?auto_4644 ) ) ( IS-CRATE ?auto_4628 ) ( SURFACE-AT ?auto_4628 ?auto_4637 ) ( ON ?auto_4628 ?auto_4648 ) ( CLEAR ?auto_4628 ) ( not ( = ?auto_4627 ?auto_4628 ) ) ( not ( = ?auto_4627 ?auto_4648 ) ) ( not ( = ?auto_4628 ?auto_4648 ) ) ( IS-CRATE ?auto_4627 ) ( SURFACE-AT ?auto_4627 ?auto_4637 ) ( ON ?auto_4627 ?auto_4640 ) ( CLEAR ?auto_4627 ) ( not ( = ?auto_4626 ?auto_4627 ) ) ( not ( = ?auto_4626 ?auto_4640 ) ) ( not ( = ?auto_4627 ?auto_4640 ) ) ( SURFACE-AT ?auto_4625 ?auto_4633 ) ( CLEAR ?auto_4625 ) ( IS-CRATE ?auto_4626 ) ( AVAILABLE ?auto_4634 ) ( AVAILABLE ?auto_4638 ) ( SURFACE-AT ?auto_4626 ?auto_4637 ) ( ON ?auto_4626 ?auto_4649 ) ( CLEAR ?auto_4626 ) ( TRUCK-AT ?auto_4635 ?auto_4633 ) ( not ( = ?auto_4625 ?auto_4626 ) ) ( not ( = ?auto_4625 ?auto_4649 ) ) ( not ( = ?auto_4626 ?auto_4649 ) ) ( not ( = ?auto_4625 ?auto_4627 ) ) ( not ( = ?auto_4625 ?auto_4640 ) ) ( not ( = ?auto_4627 ?auto_4649 ) ) ( not ( = ?auto_4640 ?auto_4649 ) ) ( not ( = ?auto_4625 ?auto_4628 ) ) ( not ( = ?auto_4625 ?auto_4648 ) ) ( not ( = ?auto_4626 ?auto_4628 ) ) ( not ( = ?auto_4626 ?auto_4648 ) ) ( not ( = ?auto_4628 ?auto_4640 ) ) ( not ( = ?auto_4628 ?auto_4649 ) ) ( not ( = ?auto_4648 ?auto_4640 ) ) ( not ( = ?auto_4648 ?auto_4649 ) ) ( not ( = ?auto_4625 ?auto_4629 ) ) ( not ( = ?auto_4625 ?auto_4641 ) ) ( not ( = ?auto_4626 ?auto_4629 ) ) ( not ( = ?auto_4626 ?auto_4641 ) ) ( not ( = ?auto_4627 ?auto_4629 ) ) ( not ( = ?auto_4627 ?auto_4641 ) ) ( not ( = ?auto_4629 ?auto_4648 ) ) ( not ( = ?auto_4629 ?auto_4640 ) ) ( not ( = ?auto_4629 ?auto_4649 ) ) ( not ( = ?auto_4646 ?auto_4637 ) ) ( not ( = ?auto_4644 ?auto_4638 ) ) ( not ( = ?auto_4641 ?auto_4648 ) ) ( not ( = ?auto_4641 ?auto_4640 ) ) ( not ( = ?auto_4641 ?auto_4649 ) ) ( not ( = ?auto_4625 ?auto_4630 ) ) ( not ( = ?auto_4625 ?auto_4650 ) ) ( not ( = ?auto_4626 ?auto_4630 ) ) ( not ( = ?auto_4626 ?auto_4650 ) ) ( not ( = ?auto_4627 ?auto_4630 ) ) ( not ( = ?auto_4627 ?auto_4650 ) ) ( not ( = ?auto_4628 ?auto_4630 ) ) ( not ( = ?auto_4628 ?auto_4650 ) ) ( not ( = ?auto_4630 ?auto_4641 ) ) ( not ( = ?auto_4630 ?auto_4648 ) ) ( not ( = ?auto_4630 ?auto_4640 ) ) ( not ( = ?auto_4630 ?auto_4649 ) ) ( not ( = ?auto_4639 ?auto_4646 ) ) ( not ( = ?auto_4639 ?auto_4637 ) ) ( not ( = ?auto_4643 ?auto_4644 ) ) ( not ( = ?auto_4643 ?auto_4638 ) ) ( not ( = ?auto_4650 ?auto_4641 ) ) ( not ( = ?auto_4650 ?auto_4648 ) ) ( not ( = ?auto_4650 ?auto_4640 ) ) ( not ( = ?auto_4650 ?auto_4649 ) ) ( not ( = ?auto_4625 ?auto_4631 ) ) ( not ( = ?auto_4625 ?auto_4645 ) ) ( not ( = ?auto_4626 ?auto_4631 ) ) ( not ( = ?auto_4626 ?auto_4645 ) ) ( not ( = ?auto_4627 ?auto_4631 ) ) ( not ( = ?auto_4627 ?auto_4645 ) ) ( not ( = ?auto_4628 ?auto_4631 ) ) ( not ( = ?auto_4628 ?auto_4645 ) ) ( not ( = ?auto_4629 ?auto_4631 ) ) ( not ( = ?auto_4629 ?auto_4645 ) ) ( not ( = ?auto_4631 ?auto_4650 ) ) ( not ( = ?auto_4631 ?auto_4641 ) ) ( not ( = ?auto_4631 ?auto_4648 ) ) ( not ( = ?auto_4631 ?auto_4640 ) ) ( not ( = ?auto_4631 ?auto_4649 ) ) ( not ( = ?auto_4647 ?auto_4639 ) ) ( not ( = ?auto_4647 ?auto_4646 ) ) ( not ( = ?auto_4647 ?auto_4637 ) ) ( not ( = ?auto_4642 ?auto_4643 ) ) ( not ( = ?auto_4642 ?auto_4644 ) ) ( not ( = ?auto_4642 ?auto_4638 ) ) ( not ( = ?auto_4645 ?auto_4650 ) ) ( not ( = ?auto_4645 ?auto_4641 ) ) ( not ( = ?auto_4645 ?auto_4648 ) ) ( not ( = ?auto_4645 ?auto_4640 ) ) ( not ( = ?auto_4645 ?auto_4649 ) ) ( not ( = ?auto_4625 ?auto_4632 ) ) ( not ( = ?auto_4625 ?auto_4636 ) ) ( not ( = ?auto_4626 ?auto_4632 ) ) ( not ( = ?auto_4626 ?auto_4636 ) ) ( not ( = ?auto_4627 ?auto_4632 ) ) ( not ( = ?auto_4627 ?auto_4636 ) ) ( not ( = ?auto_4628 ?auto_4632 ) ) ( not ( = ?auto_4628 ?auto_4636 ) ) ( not ( = ?auto_4629 ?auto_4632 ) ) ( not ( = ?auto_4629 ?auto_4636 ) ) ( not ( = ?auto_4630 ?auto_4632 ) ) ( not ( = ?auto_4630 ?auto_4636 ) ) ( not ( = ?auto_4632 ?auto_4645 ) ) ( not ( = ?auto_4632 ?auto_4650 ) ) ( not ( = ?auto_4632 ?auto_4641 ) ) ( not ( = ?auto_4632 ?auto_4648 ) ) ( not ( = ?auto_4632 ?auto_4640 ) ) ( not ( = ?auto_4632 ?auto_4649 ) ) ( not ( = ?auto_4636 ?auto_4645 ) ) ( not ( = ?auto_4636 ?auto_4650 ) ) ( not ( = ?auto_4636 ?auto_4641 ) ) ( not ( = ?auto_4636 ?auto_4648 ) ) ( not ( = ?auto_4636 ?auto_4640 ) ) ( not ( = ?auto_4636 ?auto_4649 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4625 ?auto_4626 ?auto_4627 ?auto_4628 ?auto_4629 ?auto_4630 ?auto_4631 )
      ( MAKE-1CRATE ?auto_4631 ?auto_4632 )
      ( MAKE-7CRATE-VERIFY ?auto_4625 ?auto_4626 ?auto_4627 ?auto_4628 ?auto_4629 ?auto_4630 ?auto_4631 ?auto_4632 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4670 - SURFACE
      ?auto_4671 - SURFACE
      ?auto_4672 - SURFACE
      ?auto_4673 - SURFACE
      ?auto_4674 - SURFACE
      ?auto_4675 - SURFACE
      ?auto_4676 - SURFACE
      ?auto_4677 - SURFACE
      ?auto_4678 - SURFACE
    )
    :vars
    (
      ?auto_4679 - HOIST
      ?auto_4681 - PLACE
      ?auto_4682 - PLACE
      ?auto_4680 - HOIST
      ?auto_4684 - SURFACE
      ?auto_4686 - PLACE
      ?auto_4685 - HOIST
      ?auto_4688 - SURFACE
      ?auto_4695 - SURFACE
      ?auto_4692 - PLACE
      ?auto_4697 - HOIST
      ?auto_4689 - SURFACE
      ?auto_4693 - PLACE
      ?auto_4691 - HOIST
      ?auto_4687 - SURFACE
      ?auto_4694 - SURFACE
      ?auto_4690 - SURFACE
      ?auto_4696 - SURFACE
      ?auto_4683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4679 ?auto_4681 ) ( IS-CRATE ?auto_4678 ) ( not ( = ?auto_4682 ?auto_4681 ) ) ( HOIST-AT ?auto_4680 ?auto_4682 ) ( SURFACE-AT ?auto_4678 ?auto_4682 ) ( ON ?auto_4678 ?auto_4684 ) ( CLEAR ?auto_4678 ) ( not ( = ?auto_4677 ?auto_4678 ) ) ( not ( = ?auto_4677 ?auto_4684 ) ) ( not ( = ?auto_4678 ?auto_4684 ) ) ( not ( = ?auto_4679 ?auto_4680 ) ) ( IS-CRATE ?auto_4677 ) ( not ( = ?auto_4686 ?auto_4681 ) ) ( HOIST-AT ?auto_4685 ?auto_4686 ) ( SURFACE-AT ?auto_4677 ?auto_4686 ) ( ON ?auto_4677 ?auto_4688 ) ( CLEAR ?auto_4677 ) ( not ( = ?auto_4676 ?auto_4677 ) ) ( not ( = ?auto_4676 ?auto_4688 ) ) ( not ( = ?auto_4677 ?auto_4688 ) ) ( not ( = ?auto_4679 ?auto_4685 ) ) ( IS-CRATE ?auto_4676 ) ( AVAILABLE ?auto_4680 ) ( SURFACE-AT ?auto_4676 ?auto_4682 ) ( ON ?auto_4676 ?auto_4695 ) ( CLEAR ?auto_4676 ) ( not ( = ?auto_4675 ?auto_4676 ) ) ( not ( = ?auto_4675 ?auto_4695 ) ) ( not ( = ?auto_4676 ?auto_4695 ) ) ( IS-CRATE ?auto_4675 ) ( not ( = ?auto_4692 ?auto_4681 ) ) ( HOIST-AT ?auto_4697 ?auto_4692 ) ( AVAILABLE ?auto_4697 ) ( SURFACE-AT ?auto_4675 ?auto_4692 ) ( ON ?auto_4675 ?auto_4689 ) ( CLEAR ?auto_4675 ) ( not ( = ?auto_4674 ?auto_4675 ) ) ( not ( = ?auto_4674 ?auto_4689 ) ) ( not ( = ?auto_4675 ?auto_4689 ) ) ( not ( = ?auto_4679 ?auto_4697 ) ) ( IS-CRATE ?auto_4674 ) ( not ( = ?auto_4693 ?auto_4681 ) ) ( HOIST-AT ?auto_4691 ?auto_4693 ) ( AVAILABLE ?auto_4691 ) ( SURFACE-AT ?auto_4674 ?auto_4693 ) ( ON ?auto_4674 ?auto_4687 ) ( CLEAR ?auto_4674 ) ( not ( = ?auto_4673 ?auto_4674 ) ) ( not ( = ?auto_4673 ?auto_4687 ) ) ( not ( = ?auto_4674 ?auto_4687 ) ) ( not ( = ?auto_4679 ?auto_4691 ) ) ( IS-CRATE ?auto_4673 ) ( SURFACE-AT ?auto_4673 ?auto_4686 ) ( ON ?auto_4673 ?auto_4694 ) ( CLEAR ?auto_4673 ) ( not ( = ?auto_4672 ?auto_4673 ) ) ( not ( = ?auto_4672 ?auto_4694 ) ) ( not ( = ?auto_4673 ?auto_4694 ) ) ( IS-CRATE ?auto_4672 ) ( SURFACE-AT ?auto_4672 ?auto_4686 ) ( ON ?auto_4672 ?auto_4690 ) ( CLEAR ?auto_4672 ) ( not ( = ?auto_4671 ?auto_4672 ) ) ( not ( = ?auto_4671 ?auto_4690 ) ) ( not ( = ?auto_4672 ?auto_4690 ) ) ( SURFACE-AT ?auto_4670 ?auto_4681 ) ( CLEAR ?auto_4670 ) ( IS-CRATE ?auto_4671 ) ( AVAILABLE ?auto_4679 ) ( AVAILABLE ?auto_4685 ) ( SURFACE-AT ?auto_4671 ?auto_4686 ) ( ON ?auto_4671 ?auto_4696 ) ( CLEAR ?auto_4671 ) ( TRUCK-AT ?auto_4683 ?auto_4681 ) ( not ( = ?auto_4670 ?auto_4671 ) ) ( not ( = ?auto_4670 ?auto_4696 ) ) ( not ( = ?auto_4671 ?auto_4696 ) ) ( not ( = ?auto_4670 ?auto_4672 ) ) ( not ( = ?auto_4670 ?auto_4690 ) ) ( not ( = ?auto_4672 ?auto_4696 ) ) ( not ( = ?auto_4690 ?auto_4696 ) ) ( not ( = ?auto_4670 ?auto_4673 ) ) ( not ( = ?auto_4670 ?auto_4694 ) ) ( not ( = ?auto_4671 ?auto_4673 ) ) ( not ( = ?auto_4671 ?auto_4694 ) ) ( not ( = ?auto_4673 ?auto_4690 ) ) ( not ( = ?auto_4673 ?auto_4696 ) ) ( not ( = ?auto_4694 ?auto_4690 ) ) ( not ( = ?auto_4694 ?auto_4696 ) ) ( not ( = ?auto_4670 ?auto_4674 ) ) ( not ( = ?auto_4670 ?auto_4687 ) ) ( not ( = ?auto_4671 ?auto_4674 ) ) ( not ( = ?auto_4671 ?auto_4687 ) ) ( not ( = ?auto_4672 ?auto_4674 ) ) ( not ( = ?auto_4672 ?auto_4687 ) ) ( not ( = ?auto_4674 ?auto_4694 ) ) ( not ( = ?auto_4674 ?auto_4690 ) ) ( not ( = ?auto_4674 ?auto_4696 ) ) ( not ( = ?auto_4693 ?auto_4686 ) ) ( not ( = ?auto_4691 ?auto_4685 ) ) ( not ( = ?auto_4687 ?auto_4694 ) ) ( not ( = ?auto_4687 ?auto_4690 ) ) ( not ( = ?auto_4687 ?auto_4696 ) ) ( not ( = ?auto_4670 ?auto_4675 ) ) ( not ( = ?auto_4670 ?auto_4689 ) ) ( not ( = ?auto_4671 ?auto_4675 ) ) ( not ( = ?auto_4671 ?auto_4689 ) ) ( not ( = ?auto_4672 ?auto_4675 ) ) ( not ( = ?auto_4672 ?auto_4689 ) ) ( not ( = ?auto_4673 ?auto_4675 ) ) ( not ( = ?auto_4673 ?auto_4689 ) ) ( not ( = ?auto_4675 ?auto_4687 ) ) ( not ( = ?auto_4675 ?auto_4694 ) ) ( not ( = ?auto_4675 ?auto_4690 ) ) ( not ( = ?auto_4675 ?auto_4696 ) ) ( not ( = ?auto_4692 ?auto_4693 ) ) ( not ( = ?auto_4692 ?auto_4686 ) ) ( not ( = ?auto_4697 ?auto_4691 ) ) ( not ( = ?auto_4697 ?auto_4685 ) ) ( not ( = ?auto_4689 ?auto_4687 ) ) ( not ( = ?auto_4689 ?auto_4694 ) ) ( not ( = ?auto_4689 ?auto_4690 ) ) ( not ( = ?auto_4689 ?auto_4696 ) ) ( not ( = ?auto_4670 ?auto_4676 ) ) ( not ( = ?auto_4670 ?auto_4695 ) ) ( not ( = ?auto_4671 ?auto_4676 ) ) ( not ( = ?auto_4671 ?auto_4695 ) ) ( not ( = ?auto_4672 ?auto_4676 ) ) ( not ( = ?auto_4672 ?auto_4695 ) ) ( not ( = ?auto_4673 ?auto_4676 ) ) ( not ( = ?auto_4673 ?auto_4695 ) ) ( not ( = ?auto_4674 ?auto_4676 ) ) ( not ( = ?auto_4674 ?auto_4695 ) ) ( not ( = ?auto_4676 ?auto_4689 ) ) ( not ( = ?auto_4676 ?auto_4687 ) ) ( not ( = ?auto_4676 ?auto_4694 ) ) ( not ( = ?auto_4676 ?auto_4690 ) ) ( not ( = ?auto_4676 ?auto_4696 ) ) ( not ( = ?auto_4682 ?auto_4692 ) ) ( not ( = ?auto_4682 ?auto_4693 ) ) ( not ( = ?auto_4682 ?auto_4686 ) ) ( not ( = ?auto_4680 ?auto_4697 ) ) ( not ( = ?auto_4680 ?auto_4691 ) ) ( not ( = ?auto_4680 ?auto_4685 ) ) ( not ( = ?auto_4695 ?auto_4689 ) ) ( not ( = ?auto_4695 ?auto_4687 ) ) ( not ( = ?auto_4695 ?auto_4694 ) ) ( not ( = ?auto_4695 ?auto_4690 ) ) ( not ( = ?auto_4695 ?auto_4696 ) ) ( not ( = ?auto_4670 ?auto_4677 ) ) ( not ( = ?auto_4670 ?auto_4688 ) ) ( not ( = ?auto_4671 ?auto_4677 ) ) ( not ( = ?auto_4671 ?auto_4688 ) ) ( not ( = ?auto_4672 ?auto_4677 ) ) ( not ( = ?auto_4672 ?auto_4688 ) ) ( not ( = ?auto_4673 ?auto_4677 ) ) ( not ( = ?auto_4673 ?auto_4688 ) ) ( not ( = ?auto_4674 ?auto_4677 ) ) ( not ( = ?auto_4674 ?auto_4688 ) ) ( not ( = ?auto_4675 ?auto_4677 ) ) ( not ( = ?auto_4675 ?auto_4688 ) ) ( not ( = ?auto_4677 ?auto_4695 ) ) ( not ( = ?auto_4677 ?auto_4689 ) ) ( not ( = ?auto_4677 ?auto_4687 ) ) ( not ( = ?auto_4677 ?auto_4694 ) ) ( not ( = ?auto_4677 ?auto_4690 ) ) ( not ( = ?auto_4677 ?auto_4696 ) ) ( not ( = ?auto_4688 ?auto_4695 ) ) ( not ( = ?auto_4688 ?auto_4689 ) ) ( not ( = ?auto_4688 ?auto_4687 ) ) ( not ( = ?auto_4688 ?auto_4694 ) ) ( not ( = ?auto_4688 ?auto_4690 ) ) ( not ( = ?auto_4688 ?auto_4696 ) ) ( not ( = ?auto_4670 ?auto_4678 ) ) ( not ( = ?auto_4670 ?auto_4684 ) ) ( not ( = ?auto_4671 ?auto_4678 ) ) ( not ( = ?auto_4671 ?auto_4684 ) ) ( not ( = ?auto_4672 ?auto_4678 ) ) ( not ( = ?auto_4672 ?auto_4684 ) ) ( not ( = ?auto_4673 ?auto_4678 ) ) ( not ( = ?auto_4673 ?auto_4684 ) ) ( not ( = ?auto_4674 ?auto_4678 ) ) ( not ( = ?auto_4674 ?auto_4684 ) ) ( not ( = ?auto_4675 ?auto_4678 ) ) ( not ( = ?auto_4675 ?auto_4684 ) ) ( not ( = ?auto_4676 ?auto_4678 ) ) ( not ( = ?auto_4676 ?auto_4684 ) ) ( not ( = ?auto_4678 ?auto_4688 ) ) ( not ( = ?auto_4678 ?auto_4695 ) ) ( not ( = ?auto_4678 ?auto_4689 ) ) ( not ( = ?auto_4678 ?auto_4687 ) ) ( not ( = ?auto_4678 ?auto_4694 ) ) ( not ( = ?auto_4678 ?auto_4690 ) ) ( not ( = ?auto_4678 ?auto_4696 ) ) ( not ( = ?auto_4684 ?auto_4688 ) ) ( not ( = ?auto_4684 ?auto_4695 ) ) ( not ( = ?auto_4684 ?auto_4689 ) ) ( not ( = ?auto_4684 ?auto_4687 ) ) ( not ( = ?auto_4684 ?auto_4694 ) ) ( not ( = ?auto_4684 ?auto_4690 ) ) ( not ( = ?auto_4684 ?auto_4696 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4670 ?auto_4671 ?auto_4672 ?auto_4673 ?auto_4674 ?auto_4675 ?auto_4676 ?auto_4677 )
      ( MAKE-1CRATE ?auto_4677 ?auto_4678 )
      ( MAKE-8CRATE-VERIFY ?auto_4670 ?auto_4671 ?auto_4672 ?auto_4673 ?auto_4674 ?auto_4675 ?auto_4676 ?auto_4677 ?auto_4678 ) )
  )

)

