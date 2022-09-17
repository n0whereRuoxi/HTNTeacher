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
      ?auto_4502 - SURFACE
      ?auto_4503 - SURFACE
    )
    :vars
    (
      ?auto_4504 - HOIST
      ?auto_4505 - PLACE
      ?auto_4507 - PLACE
      ?auto_4508 - HOIST
      ?auto_4509 - SURFACE
      ?auto_4506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4504 ?auto_4505 ) ( SURFACE-AT ?auto_4503 ?auto_4505 ) ( CLEAR ?auto_4503 ) ( IS-CRATE ?auto_4502 ) ( AVAILABLE ?auto_4504 ) ( not ( = ?auto_4507 ?auto_4505 ) ) ( HOIST-AT ?auto_4508 ?auto_4507 ) ( AVAILABLE ?auto_4508 ) ( SURFACE-AT ?auto_4502 ?auto_4507 ) ( ON ?auto_4502 ?auto_4509 ) ( CLEAR ?auto_4502 ) ( TRUCK-AT ?auto_4506 ?auto_4505 ) ( not ( = ?auto_4502 ?auto_4503 ) ) ( not ( = ?auto_4502 ?auto_4509 ) ) ( not ( = ?auto_4503 ?auto_4509 ) ) ( not ( = ?auto_4504 ?auto_4508 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4506 ?auto_4505 ?auto_4507 )
      ( !LIFT ?auto_4508 ?auto_4502 ?auto_4509 ?auto_4507 )
      ( !LOAD ?auto_4508 ?auto_4502 ?auto_4506 ?auto_4507 )
      ( !DRIVE ?auto_4506 ?auto_4507 ?auto_4505 )
      ( !UNLOAD ?auto_4504 ?auto_4502 ?auto_4506 ?auto_4505 )
      ( !DROP ?auto_4504 ?auto_4502 ?auto_4503 ?auto_4505 )
      ( MAKE-ON-VERIFY ?auto_4502 ?auto_4503 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4512 - SURFACE
      ?auto_4513 - SURFACE
    )
    :vars
    (
      ?auto_4514 - HOIST
      ?auto_4515 - PLACE
      ?auto_4517 - PLACE
      ?auto_4518 - HOIST
      ?auto_4519 - SURFACE
      ?auto_4516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4514 ?auto_4515 ) ( SURFACE-AT ?auto_4513 ?auto_4515 ) ( CLEAR ?auto_4513 ) ( IS-CRATE ?auto_4512 ) ( AVAILABLE ?auto_4514 ) ( not ( = ?auto_4517 ?auto_4515 ) ) ( HOIST-AT ?auto_4518 ?auto_4517 ) ( AVAILABLE ?auto_4518 ) ( SURFACE-AT ?auto_4512 ?auto_4517 ) ( ON ?auto_4512 ?auto_4519 ) ( CLEAR ?auto_4512 ) ( TRUCK-AT ?auto_4516 ?auto_4515 ) ( not ( = ?auto_4512 ?auto_4513 ) ) ( not ( = ?auto_4512 ?auto_4519 ) ) ( not ( = ?auto_4513 ?auto_4519 ) ) ( not ( = ?auto_4514 ?auto_4518 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4516 ?auto_4515 ?auto_4517 )
      ( !LIFT ?auto_4518 ?auto_4512 ?auto_4519 ?auto_4517 )
      ( !LOAD ?auto_4518 ?auto_4512 ?auto_4516 ?auto_4517 )
      ( !DRIVE ?auto_4516 ?auto_4517 ?auto_4515 )
      ( !UNLOAD ?auto_4514 ?auto_4512 ?auto_4516 ?auto_4515 )
      ( !DROP ?auto_4514 ?auto_4512 ?auto_4513 ?auto_4515 )
      ( MAKE-ON-VERIFY ?auto_4512 ?auto_4513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4522 - SURFACE
      ?auto_4523 - SURFACE
    )
    :vars
    (
      ?auto_4524 - HOIST
      ?auto_4525 - PLACE
      ?auto_4527 - PLACE
      ?auto_4528 - HOIST
      ?auto_4529 - SURFACE
      ?auto_4526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4524 ?auto_4525 ) ( SURFACE-AT ?auto_4523 ?auto_4525 ) ( CLEAR ?auto_4523 ) ( IS-CRATE ?auto_4522 ) ( AVAILABLE ?auto_4524 ) ( not ( = ?auto_4527 ?auto_4525 ) ) ( HOIST-AT ?auto_4528 ?auto_4527 ) ( AVAILABLE ?auto_4528 ) ( SURFACE-AT ?auto_4522 ?auto_4527 ) ( ON ?auto_4522 ?auto_4529 ) ( CLEAR ?auto_4522 ) ( TRUCK-AT ?auto_4526 ?auto_4525 ) ( not ( = ?auto_4522 ?auto_4523 ) ) ( not ( = ?auto_4522 ?auto_4529 ) ) ( not ( = ?auto_4523 ?auto_4529 ) ) ( not ( = ?auto_4524 ?auto_4528 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4526 ?auto_4525 ?auto_4527 )
      ( !LIFT ?auto_4528 ?auto_4522 ?auto_4529 ?auto_4527 )
      ( !LOAD ?auto_4528 ?auto_4522 ?auto_4526 ?auto_4527 )
      ( !DRIVE ?auto_4526 ?auto_4527 ?auto_4525 )
      ( !UNLOAD ?auto_4524 ?auto_4522 ?auto_4526 ?auto_4525 )
      ( !DROP ?auto_4524 ?auto_4522 ?auto_4523 ?auto_4525 )
      ( MAKE-ON-VERIFY ?auto_4522 ?auto_4523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4532 - SURFACE
      ?auto_4533 - SURFACE
    )
    :vars
    (
      ?auto_4534 - HOIST
      ?auto_4535 - PLACE
      ?auto_4537 - PLACE
      ?auto_4538 - HOIST
      ?auto_4539 - SURFACE
      ?auto_4536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4534 ?auto_4535 ) ( SURFACE-AT ?auto_4533 ?auto_4535 ) ( CLEAR ?auto_4533 ) ( IS-CRATE ?auto_4532 ) ( AVAILABLE ?auto_4534 ) ( not ( = ?auto_4537 ?auto_4535 ) ) ( HOIST-AT ?auto_4538 ?auto_4537 ) ( AVAILABLE ?auto_4538 ) ( SURFACE-AT ?auto_4532 ?auto_4537 ) ( ON ?auto_4532 ?auto_4539 ) ( CLEAR ?auto_4532 ) ( TRUCK-AT ?auto_4536 ?auto_4535 ) ( not ( = ?auto_4532 ?auto_4533 ) ) ( not ( = ?auto_4532 ?auto_4539 ) ) ( not ( = ?auto_4533 ?auto_4539 ) ) ( not ( = ?auto_4534 ?auto_4538 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4536 ?auto_4535 ?auto_4537 )
      ( !LIFT ?auto_4538 ?auto_4532 ?auto_4539 ?auto_4537 )
      ( !LOAD ?auto_4538 ?auto_4532 ?auto_4536 ?auto_4537 )
      ( !DRIVE ?auto_4536 ?auto_4537 ?auto_4535 )
      ( !UNLOAD ?auto_4534 ?auto_4532 ?auto_4536 ?auto_4535 )
      ( !DROP ?auto_4534 ?auto_4532 ?auto_4533 ?auto_4535 )
      ( MAKE-ON-VERIFY ?auto_4532 ?auto_4533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4542 - SURFACE
      ?auto_4543 - SURFACE
    )
    :vars
    (
      ?auto_4544 - HOIST
      ?auto_4545 - PLACE
      ?auto_4547 - PLACE
      ?auto_4548 - HOIST
      ?auto_4549 - SURFACE
      ?auto_4546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4544 ?auto_4545 ) ( SURFACE-AT ?auto_4543 ?auto_4545 ) ( CLEAR ?auto_4543 ) ( IS-CRATE ?auto_4542 ) ( AVAILABLE ?auto_4544 ) ( not ( = ?auto_4547 ?auto_4545 ) ) ( HOIST-AT ?auto_4548 ?auto_4547 ) ( AVAILABLE ?auto_4548 ) ( SURFACE-AT ?auto_4542 ?auto_4547 ) ( ON ?auto_4542 ?auto_4549 ) ( CLEAR ?auto_4542 ) ( TRUCK-AT ?auto_4546 ?auto_4545 ) ( not ( = ?auto_4542 ?auto_4543 ) ) ( not ( = ?auto_4542 ?auto_4549 ) ) ( not ( = ?auto_4543 ?auto_4549 ) ) ( not ( = ?auto_4544 ?auto_4548 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4546 ?auto_4545 ?auto_4547 )
      ( !LIFT ?auto_4548 ?auto_4542 ?auto_4549 ?auto_4547 )
      ( !LOAD ?auto_4548 ?auto_4542 ?auto_4546 ?auto_4547 )
      ( !DRIVE ?auto_4546 ?auto_4547 ?auto_4545 )
      ( !UNLOAD ?auto_4544 ?auto_4542 ?auto_4546 ?auto_4545 )
      ( !DROP ?auto_4544 ?auto_4542 ?auto_4543 ?auto_4545 )
      ( MAKE-ON-VERIFY ?auto_4542 ?auto_4543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4552 - SURFACE
      ?auto_4553 - SURFACE
    )
    :vars
    (
      ?auto_4554 - HOIST
      ?auto_4555 - PLACE
      ?auto_4557 - PLACE
      ?auto_4558 - HOIST
      ?auto_4559 - SURFACE
      ?auto_4556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4554 ?auto_4555 ) ( SURFACE-AT ?auto_4553 ?auto_4555 ) ( CLEAR ?auto_4553 ) ( IS-CRATE ?auto_4552 ) ( AVAILABLE ?auto_4554 ) ( not ( = ?auto_4557 ?auto_4555 ) ) ( HOIST-AT ?auto_4558 ?auto_4557 ) ( AVAILABLE ?auto_4558 ) ( SURFACE-AT ?auto_4552 ?auto_4557 ) ( ON ?auto_4552 ?auto_4559 ) ( CLEAR ?auto_4552 ) ( TRUCK-AT ?auto_4556 ?auto_4555 ) ( not ( = ?auto_4552 ?auto_4553 ) ) ( not ( = ?auto_4552 ?auto_4559 ) ) ( not ( = ?auto_4553 ?auto_4559 ) ) ( not ( = ?auto_4554 ?auto_4558 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4556 ?auto_4555 ?auto_4557 )
      ( !LIFT ?auto_4558 ?auto_4552 ?auto_4559 ?auto_4557 )
      ( !LOAD ?auto_4558 ?auto_4552 ?auto_4556 ?auto_4557 )
      ( !DRIVE ?auto_4556 ?auto_4557 ?auto_4555 )
      ( !UNLOAD ?auto_4554 ?auto_4552 ?auto_4556 ?auto_4555 )
      ( !DROP ?auto_4554 ?auto_4552 ?auto_4553 ?auto_4555 )
      ( MAKE-ON-VERIFY ?auto_4552 ?auto_4553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4562 - SURFACE
      ?auto_4563 - SURFACE
    )
    :vars
    (
      ?auto_4564 - HOIST
      ?auto_4565 - PLACE
      ?auto_4567 - PLACE
      ?auto_4568 - HOIST
      ?auto_4569 - SURFACE
      ?auto_4566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4564 ?auto_4565 ) ( SURFACE-AT ?auto_4563 ?auto_4565 ) ( CLEAR ?auto_4563 ) ( IS-CRATE ?auto_4562 ) ( AVAILABLE ?auto_4564 ) ( not ( = ?auto_4567 ?auto_4565 ) ) ( HOIST-AT ?auto_4568 ?auto_4567 ) ( AVAILABLE ?auto_4568 ) ( SURFACE-AT ?auto_4562 ?auto_4567 ) ( ON ?auto_4562 ?auto_4569 ) ( CLEAR ?auto_4562 ) ( TRUCK-AT ?auto_4566 ?auto_4565 ) ( not ( = ?auto_4562 ?auto_4563 ) ) ( not ( = ?auto_4562 ?auto_4569 ) ) ( not ( = ?auto_4563 ?auto_4569 ) ) ( not ( = ?auto_4564 ?auto_4568 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4566 ?auto_4565 ?auto_4567 )
      ( !LIFT ?auto_4568 ?auto_4562 ?auto_4569 ?auto_4567 )
      ( !LOAD ?auto_4568 ?auto_4562 ?auto_4566 ?auto_4567 )
      ( !DRIVE ?auto_4566 ?auto_4567 ?auto_4565 )
      ( !UNLOAD ?auto_4564 ?auto_4562 ?auto_4566 ?auto_4565 )
      ( !DROP ?auto_4564 ?auto_4562 ?auto_4563 ?auto_4565 )
      ( MAKE-ON-VERIFY ?auto_4562 ?auto_4563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4572 - SURFACE
      ?auto_4573 - SURFACE
    )
    :vars
    (
      ?auto_4574 - HOIST
      ?auto_4575 - PLACE
      ?auto_4577 - PLACE
      ?auto_4578 - HOIST
      ?auto_4579 - SURFACE
      ?auto_4576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4574 ?auto_4575 ) ( SURFACE-AT ?auto_4573 ?auto_4575 ) ( CLEAR ?auto_4573 ) ( IS-CRATE ?auto_4572 ) ( AVAILABLE ?auto_4574 ) ( not ( = ?auto_4577 ?auto_4575 ) ) ( HOIST-AT ?auto_4578 ?auto_4577 ) ( AVAILABLE ?auto_4578 ) ( SURFACE-AT ?auto_4572 ?auto_4577 ) ( ON ?auto_4572 ?auto_4579 ) ( CLEAR ?auto_4572 ) ( TRUCK-AT ?auto_4576 ?auto_4575 ) ( not ( = ?auto_4572 ?auto_4573 ) ) ( not ( = ?auto_4572 ?auto_4579 ) ) ( not ( = ?auto_4573 ?auto_4579 ) ) ( not ( = ?auto_4574 ?auto_4578 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4576 ?auto_4575 ?auto_4577 )
      ( !LIFT ?auto_4578 ?auto_4572 ?auto_4579 ?auto_4577 )
      ( !LOAD ?auto_4578 ?auto_4572 ?auto_4576 ?auto_4577 )
      ( !DRIVE ?auto_4576 ?auto_4577 ?auto_4575 )
      ( !UNLOAD ?auto_4574 ?auto_4572 ?auto_4576 ?auto_4575 )
      ( !DROP ?auto_4574 ?auto_4572 ?auto_4573 ?auto_4575 )
      ( MAKE-ON-VERIFY ?auto_4572 ?auto_4573 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4582 - SURFACE
      ?auto_4583 - SURFACE
    )
    :vars
    (
      ?auto_4584 - HOIST
      ?auto_4585 - PLACE
      ?auto_4587 - PLACE
      ?auto_4588 - HOIST
      ?auto_4589 - SURFACE
      ?auto_4586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4584 ?auto_4585 ) ( SURFACE-AT ?auto_4583 ?auto_4585 ) ( CLEAR ?auto_4583 ) ( IS-CRATE ?auto_4582 ) ( AVAILABLE ?auto_4584 ) ( not ( = ?auto_4587 ?auto_4585 ) ) ( HOIST-AT ?auto_4588 ?auto_4587 ) ( AVAILABLE ?auto_4588 ) ( SURFACE-AT ?auto_4582 ?auto_4587 ) ( ON ?auto_4582 ?auto_4589 ) ( CLEAR ?auto_4582 ) ( TRUCK-AT ?auto_4586 ?auto_4585 ) ( not ( = ?auto_4582 ?auto_4583 ) ) ( not ( = ?auto_4582 ?auto_4589 ) ) ( not ( = ?auto_4583 ?auto_4589 ) ) ( not ( = ?auto_4584 ?auto_4588 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4586 ?auto_4585 ?auto_4587 )
      ( !LIFT ?auto_4588 ?auto_4582 ?auto_4589 ?auto_4587 )
      ( !LOAD ?auto_4588 ?auto_4582 ?auto_4586 ?auto_4587 )
      ( !DRIVE ?auto_4586 ?auto_4587 ?auto_4585 )
      ( !UNLOAD ?auto_4584 ?auto_4582 ?auto_4586 ?auto_4585 )
      ( !DROP ?auto_4584 ?auto_4582 ?auto_4583 ?auto_4585 )
      ( MAKE-ON-VERIFY ?auto_4582 ?auto_4583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4592 - SURFACE
      ?auto_4593 - SURFACE
    )
    :vars
    (
      ?auto_4594 - HOIST
      ?auto_4595 - PLACE
      ?auto_4597 - PLACE
      ?auto_4598 - HOIST
      ?auto_4599 - SURFACE
      ?auto_4596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4594 ?auto_4595 ) ( SURFACE-AT ?auto_4593 ?auto_4595 ) ( CLEAR ?auto_4593 ) ( IS-CRATE ?auto_4592 ) ( AVAILABLE ?auto_4594 ) ( not ( = ?auto_4597 ?auto_4595 ) ) ( HOIST-AT ?auto_4598 ?auto_4597 ) ( AVAILABLE ?auto_4598 ) ( SURFACE-AT ?auto_4592 ?auto_4597 ) ( ON ?auto_4592 ?auto_4599 ) ( CLEAR ?auto_4592 ) ( TRUCK-AT ?auto_4596 ?auto_4595 ) ( not ( = ?auto_4592 ?auto_4593 ) ) ( not ( = ?auto_4592 ?auto_4599 ) ) ( not ( = ?auto_4593 ?auto_4599 ) ) ( not ( = ?auto_4594 ?auto_4598 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4596 ?auto_4595 ?auto_4597 )
      ( !LIFT ?auto_4598 ?auto_4592 ?auto_4599 ?auto_4597 )
      ( !LOAD ?auto_4598 ?auto_4592 ?auto_4596 ?auto_4597 )
      ( !DRIVE ?auto_4596 ?auto_4597 ?auto_4595 )
      ( !UNLOAD ?auto_4594 ?auto_4592 ?auto_4596 ?auto_4595 )
      ( !DROP ?auto_4594 ?auto_4592 ?auto_4593 ?auto_4595 )
      ( MAKE-ON-VERIFY ?auto_4592 ?auto_4593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4602 - SURFACE
      ?auto_4603 - SURFACE
    )
    :vars
    (
      ?auto_4604 - HOIST
      ?auto_4605 - PLACE
      ?auto_4607 - PLACE
      ?auto_4608 - HOIST
      ?auto_4609 - SURFACE
      ?auto_4606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4604 ?auto_4605 ) ( SURFACE-AT ?auto_4603 ?auto_4605 ) ( CLEAR ?auto_4603 ) ( IS-CRATE ?auto_4602 ) ( AVAILABLE ?auto_4604 ) ( not ( = ?auto_4607 ?auto_4605 ) ) ( HOIST-AT ?auto_4608 ?auto_4607 ) ( AVAILABLE ?auto_4608 ) ( SURFACE-AT ?auto_4602 ?auto_4607 ) ( ON ?auto_4602 ?auto_4609 ) ( CLEAR ?auto_4602 ) ( TRUCK-AT ?auto_4606 ?auto_4605 ) ( not ( = ?auto_4602 ?auto_4603 ) ) ( not ( = ?auto_4602 ?auto_4609 ) ) ( not ( = ?auto_4603 ?auto_4609 ) ) ( not ( = ?auto_4604 ?auto_4608 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4606 ?auto_4605 ?auto_4607 )
      ( !LIFT ?auto_4608 ?auto_4602 ?auto_4609 ?auto_4607 )
      ( !LOAD ?auto_4608 ?auto_4602 ?auto_4606 ?auto_4607 )
      ( !DRIVE ?auto_4606 ?auto_4607 ?auto_4605 )
      ( !UNLOAD ?auto_4604 ?auto_4602 ?auto_4606 ?auto_4605 )
      ( !DROP ?auto_4604 ?auto_4602 ?auto_4603 ?auto_4605 )
      ( MAKE-ON-VERIFY ?auto_4602 ?auto_4603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4612 - SURFACE
      ?auto_4613 - SURFACE
    )
    :vars
    (
      ?auto_4614 - HOIST
      ?auto_4615 - PLACE
      ?auto_4617 - PLACE
      ?auto_4618 - HOIST
      ?auto_4619 - SURFACE
      ?auto_4616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4614 ?auto_4615 ) ( SURFACE-AT ?auto_4613 ?auto_4615 ) ( CLEAR ?auto_4613 ) ( IS-CRATE ?auto_4612 ) ( AVAILABLE ?auto_4614 ) ( not ( = ?auto_4617 ?auto_4615 ) ) ( HOIST-AT ?auto_4618 ?auto_4617 ) ( AVAILABLE ?auto_4618 ) ( SURFACE-AT ?auto_4612 ?auto_4617 ) ( ON ?auto_4612 ?auto_4619 ) ( CLEAR ?auto_4612 ) ( TRUCK-AT ?auto_4616 ?auto_4615 ) ( not ( = ?auto_4612 ?auto_4613 ) ) ( not ( = ?auto_4612 ?auto_4619 ) ) ( not ( = ?auto_4613 ?auto_4619 ) ) ( not ( = ?auto_4614 ?auto_4618 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4616 ?auto_4615 ?auto_4617 )
      ( !LIFT ?auto_4618 ?auto_4612 ?auto_4619 ?auto_4617 )
      ( !LOAD ?auto_4618 ?auto_4612 ?auto_4616 ?auto_4617 )
      ( !DRIVE ?auto_4616 ?auto_4617 ?auto_4615 )
      ( !UNLOAD ?auto_4614 ?auto_4612 ?auto_4616 ?auto_4615 )
      ( !DROP ?auto_4614 ?auto_4612 ?auto_4613 ?auto_4615 )
      ( MAKE-ON-VERIFY ?auto_4612 ?auto_4613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4622 - SURFACE
      ?auto_4623 - SURFACE
    )
    :vars
    (
      ?auto_4624 - HOIST
      ?auto_4625 - PLACE
      ?auto_4627 - PLACE
      ?auto_4628 - HOIST
      ?auto_4629 - SURFACE
      ?auto_4626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4624 ?auto_4625 ) ( SURFACE-AT ?auto_4623 ?auto_4625 ) ( CLEAR ?auto_4623 ) ( IS-CRATE ?auto_4622 ) ( AVAILABLE ?auto_4624 ) ( not ( = ?auto_4627 ?auto_4625 ) ) ( HOIST-AT ?auto_4628 ?auto_4627 ) ( AVAILABLE ?auto_4628 ) ( SURFACE-AT ?auto_4622 ?auto_4627 ) ( ON ?auto_4622 ?auto_4629 ) ( CLEAR ?auto_4622 ) ( TRUCK-AT ?auto_4626 ?auto_4625 ) ( not ( = ?auto_4622 ?auto_4623 ) ) ( not ( = ?auto_4622 ?auto_4629 ) ) ( not ( = ?auto_4623 ?auto_4629 ) ) ( not ( = ?auto_4624 ?auto_4628 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4626 ?auto_4625 ?auto_4627 )
      ( !LIFT ?auto_4628 ?auto_4622 ?auto_4629 ?auto_4627 )
      ( !LOAD ?auto_4628 ?auto_4622 ?auto_4626 ?auto_4627 )
      ( !DRIVE ?auto_4626 ?auto_4627 ?auto_4625 )
      ( !UNLOAD ?auto_4624 ?auto_4622 ?auto_4626 ?auto_4625 )
      ( !DROP ?auto_4624 ?auto_4622 ?auto_4623 ?auto_4625 )
      ( MAKE-ON-VERIFY ?auto_4622 ?auto_4623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4632 - SURFACE
      ?auto_4633 - SURFACE
    )
    :vars
    (
      ?auto_4634 - HOIST
      ?auto_4635 - PLACE
      ?auto_4637 - PLACE
      ?auto_4638 - HOIST
      ?auto_4639 - SURFACE
      ?auto_4636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4634 ?auto_4635 ) ( SURFACE-AT ?auto_4633 ?auto_4635 ) ( CLEAR ?auto_4633 ) ( IS-CRATE ?auto_4632 ) ( AVAILABLE ?auto_4634 ) ( not ( = ?auto_4637 ?auto_4635 ) ) ( HOIST-AT ?auto_4638 ?auto_4637 ) ( AVAILABLE ?auto_4638 ) ( SURFACE-AT ?auto_4632 ?auto_4637 ) ( ON ?auto_4632 ?auto_4639 ) ( CLEAR ?auto_4632 ) ( TRUCK-AT ?auto_4636 ?auto_4635 ) ( not ( = ?auto_4632 ?auto_4633 ) ) ( not ( = ?auto_4632 ?auto_4639 ) ) ( not ( = ?auto_4633 ?auto_4639 ) ) ( not ( = ?auto_4634 ?auto_4638 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4636 ?auto_4635 ?auto_4637 )
      ( !LIFT ?auto_4638 ?auto_4632 ?auto_4639 ?auto_4637 )
      ( !LOAD ?auto_4638 ?auto_4632 ?auto_4636 ?auto_4637 )
      ( !DRIVE ?auto_4636 ?auto_4637 ?auto_4635 )
      ( !UNLOAD ?auto_4634 ?auto_4632 ?auto_4636 ?auto_4635 )
      ( !DROP ?auto_4634 ?auto_4632 ?auto_4633 ?auto_4635 )
      ( MAKE-ON-VERIFY ?auto_4632 ?auto_4633 ) )
  )

)

