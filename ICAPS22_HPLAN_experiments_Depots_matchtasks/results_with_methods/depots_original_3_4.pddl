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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4557 - SURFACE
      ?auto_4558 - SURFACE
    )
    :vars
    (
      ?auto_4559 - HOIST
      ?auto_4560 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4559 ?auto_4560 ) ( SURFACE-AT ?auto_4557 ?auto_4560 ) ( CLEAR ?auto_4557 ) ( LIFTING ?auto_4559 ?auto_4558 ) ( IS-CRATE ?auto_4558 ) ( not ( = ?auto_4557 ?auto_4558 ) ) )
    :subtasks
    ( ( !DROP ?auto_4559 ?auto_4558 ?auto_4557 ?auto_4560 )
      ( MAKE-1CRATE-VERIFY ?auto_4557 ?auto_4558 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4561 - SURFACE
      ?auto_4562 - SURFACE
    )
    :vars
    (
      ?auto_4563 - HOIST
      ?auto_4564 - PLACE
      ?auto_4565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4563 ?auto_4564 ) ( SURFACE-AT ?auto_4561 ?auto_4564 ) ( CLEAR ?auto_4561 ) ( IS-CRATE ?auto_4562 ) ( not ( = ?auto_4561 ?auto_4562 ) ) ( TRUCK-AT ?auto_4565 ?auto_4564 ) ( AVAILABLE ?auto_4563 ) ( IN ?auto_4562 ?auto_4565 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4563 ?auto_4562 ?auto_4565 ?auto_4564 )
      ( MAKE-1CRATE ?auto_4561 ?auto_4562 )
      ( MAKE-1CRATE-VERIFY ?auto_4561 ?auto_4562 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4566 - SURFACE
      ?auto_4567 - SURFACE
    )
    :vars
    (
      ?auto_4568 - HOIST
      ?auto_4569 - PLACE
      ?auto_4570 - TRUCK
      ?auto_4571 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4568 ?auto_4569 ) ( SURFACE-AT ?auto_4566 ?auto_4569 ) ( CLEAR ?auto_4566 ) ( IS-CRATE ?auto_4567 ) ( not ( = ?auto_4566 ?auto_4567 ) ) ( AVAILABLE ?auto_4568 ) ( IN ?auto_4567 ?auto_4570 ) ( TRUCK-AT ?auto_4570 ?auto_4571 ) ( not ( = ?auto_4571 ?auto_4569 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4570 ?auto_4571 ?auto_4569 )
      ( MAKE-1CRATE ?auto_4566 ?auto_4567 )
      ( MAKE-1CRATE-VERIFY ?auto_4566 ?auto_4567 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4572 - SURFACE
      ?auto_4573 - SURFACE
    )
    :vars
    (
      ?auto_4577 - HOIST
      ?auto_4574 - PLACE
      ?auto_4576 - TRUCK
      ?auto_4575 - PLACE
      ?auto_4578 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4577 ?auto_4574 ) ( SURFACE-AT ?auto_4572 ?auto_4574 ) ( CLEAR ?auto_4572 ) ( IS-CRATE ?auto_4573 ) ( not ( = ?auto_4572 ?auto_4573 ) ) ( AVAILABLE ?auto_4577 ) ( TRUCK-AT ?auto_4576 ?auto_4575 ) ( not ( = ?auto_4575 ?auto_4574 ) ) ( HOIST-AT ?auto_4578 ?auto_4575 ) ( LIFTING ?auto_4578 ?auto_4573 ) ( not ( = ?auto_4577 ?auto_4578 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4578 ?auto_4573 ?auto_4576 ?auto_4575 )
      ( MAKE-1CRATE ?auto_4572 ?auto_4573 )
      ( MAKE-1CRATE-VERIFY ?auto_4572 ?auto_4573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4579 - SURFACE
      ?auto_4580 - SURFACE
    )
    :vars
    (
      ?auto_4585 - HOIST
      ?auto_4581 - PLACE
      ?auto_4583 - TRUCK
      ?auto_4584 - PLACE
      ?auto_4582 - HOIST
      ?auto_4586 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4585 ?auto_4581 ) ( SURFACE-AT ?auto_4579 ?auto_4581 ) ( CLEAR ?auto_4579 ) ( IS-CRATE ?auto_4580 ) ( not ( = ?auto_4579 ?auto_4580 ) ) ( AVAILABLE ?auto_4585 ) ( TRUCK-AT ?auto_4583 ?auto_4584 ) ( not ( = ?auto_4584 ?auto_4581 ) ) ( HOIST-AT ?auto_4582 ?auto_4584 ) ( not ( = ?auto_4585 ?auto_4582 ) ) ( AVAILABLE ?auto_4582 ) ( SURFACE-AT ?auto_4580 ?auto_4584 ) ( ON ?auto_4580 ?auto_4586 ) ( CLEAR ?auto_4580 ) ( not ( = ?auto_4579 ?auto_4586 ) ) ( not ( = ?auto_4580 ?auto_4586 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4582 ?auto_4580 ?auto_4586 ?auto_4584 )
      ( MAKE-1CRATE ?auto_4579 ?auto_4580 )
      ( MAKE-1CRATE-VERIFY ?auto_4579 ?auto_4580 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4587 - SURFACE
      ?auto_4588 - SURFACE
    )
    :vars
    (
      ?auto_4589 - HOIST
      ?auto_4594 - PLACE
      ?auto_4593 - PLACE
      ?auto_4590 - HOIST
      ?auto_4592 - SURFACE
      ?auto_4591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4589 ?auto_4594 ) ( SURFACE-AT ?auto_4587 ?auto_4594 ) ( CLEAR ?auto_4587 ) ( IS-CRATE ?auto_4588 ) ( not ( = ?auto_4587 ?auto_4588 ) ) ( AVAILABLE ?auto_4589 ) ( not ( = ?auto_4593 ?auto_4594 ) ) ( HOIST-AT ?auto_4590 ?auto_4593 ) ( not ( = ?auto_4589 ?auto_4590 ) ) ( AVAILABLE ?auto_4590 ) ( SURFACE-AT ?auto_4588 ?auto_4593 ) ( ON ?auto_4588 ?auto_4592 ) ( CLEAR ?auto_4588 ) ( not ( = ?auto_4587 ?auto_4592 ) ) ( not ( = ?auto_4588 ?auto_4592 ) ) ( TRUCK-AT ?auto_4591 ?auto_4594 ) )
    :subtasks
    ( ( !DRIVE ?auto_4591 ?auto_4594 ?auto_4593 )
      ( MAKE-1CRATE ?auto_4587 ?auto_4588 )
      ( MAKE-1CRATE-VERIFY ?auto_4587 ?auto_4588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4600 - SURFACE
      ?auto_4601 - SURFACE
    )
    :vars
    (
      ?auto_4602 - HOIST
      ?auto_4603 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4602 ?auto_4603 ) ( SURFACE-AT ?auto_4600 ?auto_4603 ) ( CLEAR ?auto_4600 ) ( LIFTING ?auto_4602 ?auto_4601 ) ( IS-CRATE ?auto_4601 ) ( not ( = ?auto_4600 ?auto_4601 ) ) )
    :subtasks
    ( ( !DROP ?auto_4602 ?auto_4601 ?auto_4600 ?auto_4603 )
      ( MAKE-1CRATE-VERIFY ?auto_4600 ?auto_4601 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4604 - SURFACE
      ?auto_4605 - SURFACE
      ?auto_4606 - SURFACE
    )
    :vars
    (
      ?auto_4607 - HOIST
      ?auto_4608 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4607 ?auto_4608 ) ( SURFACE-AT ?auto_4605 ?auto_4608 ) ( CLEAR ?auto_4605 ) ( LIFTING ?auto_4607 ?auto_4606 ) ( IS-CRATE ?auto_4606 ) ( not ( = ?auto_4605 ?auto_4606 ) ) ( ON ?auto_4605 ?auto_4604 ) ( not ( = ?auto_4604 ?auto_4605 ) ) ( not ( = ?auto_4604 ?auto_4606 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4605 ?auto_4606 )
      ( MAKE-2CRATE-VERIFY ?auto_4604 ?auto_4605 ?auto_4606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4609 - SURFACE
      ?auto_4610 - SURFACE
    )
    :vars
    (
      ?auto_4611 - HOIST
      ?auto_4612 - PLACE
      ?auto_4613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4611 ?auto_4612 ) ( SURFACE-AT ?auto_4609 ?auto_4612 ) ( CLEAR ?auto_4609 ) ( IS-CRATE ?auto_4610 ) ( not ( = ?auto_4609 ?auto_4610 ) ) ( TRUCK-AT ?auto_4613 ?auto_4612 ) ( AVAILABLE ?auto_4611 ) ( IN ?auto_4610 ?auto_4613 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4611 ?auto_4610 ?auto_4613 ?auto_4612 )
      ( MAKE-1CRATE ?auto_4609 ?auto_4610 )
      ( MAKE-1CRATE-VERIFY ?auto_4609 ?auto_4610 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4614 - SURFACE
      ?auto_4615 - SURFACE
      ?auto_4616 - SURFACE
    )
    :vars
    (
      ?auto_4618 - HOIST
      ?auto_4619 - PLACE
      ?auto_4617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4618 ?auto_4619 ) ( SURFACE-AT ?auto_4615 ?auto_4619 ) ( CLEAR ?auto_4615 ) ( IS-CRATE ?auto_4616 ) ( not ( = ?auto_4615 ?auto_4616 ) ) ( TRUCK-AT ?auto_4617 ?auto_4619 ) ( AVAILABLE ?auto_4618 ) ( IN ?auto_4616 ?auto_4617 ) ( ON ?auto_4615 ?auto_4614 ) ( not ( = ?auto_4614 ?auto_4615 ) ) ( not ( = ?auto_4614 ?auto_4616 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4615 ?auto_4616 )
      ( MAKE-2CRATE-VERIFY ?auto_4614 ?auto_4615 ?auto_4616 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4620 - SURFACE
      ?auto_4621 - SURFACE
    )
    :vars
    (
      ?auto_4624 - HOIST
      ?auto_4623 - PLACE
      ?auto_4625 - TRUCK
      ?auto_4622 - SURFACE
      ?auto_4626 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4624 ?auto_4623 ) ( SURFACE-AT ?auto_4620 ?auto_4623 ) ( CLEAR ?auto_4620 ) ( IS-CRATE ?auto_4621 ) ( not ( = ?auto_4620 ?auto_4621 ) ) ( AVAILABLE ?auto_4624 ) ( IN ?auto_4621 ?auto_4625 ) ( ON ?auto_4620 ?auto_4622 ) ( not ( = ?auto_4622 ?auto_4620 ) ) ( not ( = ?auto_4622 ?auto_4621 ) ) ( TRUCK-AT ?auto_4625 ?auto_4626 ) ( not ( = ?auto_4626 ?auto_4623 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4625 ?auto_4626 ?auto_4623 )
      ( MAKE-2CRATE ?auto_4622 ?auto_4620 ?auto_4621 )
      ( MAKE-1CRATE-VERIFY ?auto_4620 ?auto_4621 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4627 - SURFACE
      ?auto_4628 - SURFACE
      ?auto_4629 - SURFACE
    )
    :vars
    (
      ?auto_4630 - HOIST
      ?auto_4631 - PLACE
      ?auto_4632 - TRUCK
      ?auto_4633 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4630 ?auto_4631 ) ( SURFACE-AT ?auto_4628 ?auto_4631 ) ( CLEAR ?auto_4628 ) ( IS-CRATE ?auto_4629 ) ( not ( = ?auto_4628 ?auto_4629 ) ) ( AVAILABLE ?auto_4630 ) ( IN ?auto_4629 ?auto_4632 ) ( ON ?auto_4628 ?auto_4627 ) ( not ( = ?auto_4627 ?auto_4628 ) ) ( not ( = ?auto_4627 ?auto_4629 ) ) ( TRUCK-AT ?auto_4632 ?auto_4633 ) ( not ( = ?auto_4633 ?auto_4631 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4628 ?auto_4629 )
      ( MAKE-2CRATE-VERIFY ?auto_4627 ?auto_4628 ?auto_4629 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4634 - SURFACE
      ?auto_4635 - SURFACE
    )
    :vars
    (
      ?auto_4638 - HOIST
      ?auto_4636 - PLACE
      ?auto_4639 - SURFACE
      ?auto_4637 - TRUCK
      ?auto_4640 - PLACE
      ?auto_4641 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4638 ?auto_4636 ) ( SURFACE-AT ?auto_4634 ?auto_4636 ) ( CLEAR ?auto_4634 ) ( IS-CRATE ?auto_4635 ) ( not ( = ?auto_4634 ?auto_4635 ) ) ( AVAILABLE ?auto_4638 ) ( ON ?auto_4634 ?auto_4639 ) ( not ( = ?auto_4639 ?auto_4634 ) ) ( not ( = ?auto_4639 ?auto_4635 ) ) ( TRUCK-AT ?auto_4637 ?auto_4640 ) ( not ( = ?auto_4640 ?auto_4636 ) ) ( HOIST-AT ?auto_4641 ?auto_4640 ) ( LIFTING ?auto_4641 ?auto_4635 ) ( not ( = ?auto_4638 ?auto_4641 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4641 ?auto_4635 ?auto_4637 ?auto_4640 )
      ( MAKE-2CRATE ?auto_4639 ?auto_4634 ?auto_4635 )
      ( MAKE-1CRATE-VERIFY ?auto_4634 ?auto_4635 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4642 - SURFACE
      ?auto_4643 - SURFACE
      ?auto_4644 - SURFACE
    )
    :vars
    (
      ?auto_4648 - HOIST
      ?auto_4646 - PLACE
      ?auto_4645 - TRUCK
      ?auto_4647 - PLACE
      ?auto_4649 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4648 ?auto_4646 ) ( SURFACE-AT ?auto_4643 ?auto_4646 ) ( CLEAR ?auto_4643 ) ( IS-CRATE ?auto_4644 ) ( not ( = ?auto_4643 ?auto_4644 ) ) ( AVAILABLE ?auto_4648 ) ( ON ?auto_4643 ?auto_4642 ) ( not ( = ?auto_4642 ?auto_4643 ) ) ( not ( = ?auto_4642 ?auto_4644 ) ) ( TRUCK-AT ?auto_4645 ?auto_4647 ) ( not ( = ?auto_4647 ?auto_4646 ) ) ( HOIST-AT ?auto_4649 ?auto_4647 ) ( LIFTING ?auto_4649 ?auto_4644 ) ( not ( = ?auto_4648 ?auto_4649 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4643 ?auto_4644 )
      ( MAKE-2CRATE-VERIFY ?auto_4642 ?auto_4643 ?auto_4644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4650 - SURFACE
      ?auto_4651 - SURFACE
    )
    :vars
    (
      ?auto_4652 - HOIST
      ?auto_4656 - PLACE
      ?auto_4653 - SURFACE
      ?auto_4657 - TRUCK
      ?auto_4655 - PLACE
      ?auto_4654 - HOIST
      ?auto_4658 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4652 ?auto_4656 ) ( SURFACE-AT ?auto_4650 ?auto_4656 ) ( CLEAR ?auto_4650 ) ( IS-CRATE ?auto_4651 ) ( not ( = ?auto_4650 ?auto_4651 ) ) ( AVAILABLE ?auto_4652 ) ( ON ?auto_4650 ?auto_4653 ) ( not ( = ?auto_4653 ?auto_4650 ) ) ( not ( = ?auto_4653 ?auto_4651 ) ) ( TRUCK-AT ?auto_4657 ?auto_4655 ) ( not ( = ?auto_4655 ?auto_4656 ) ) ( HOIST-AT ?auto_4654 ?auto_4655 ) ( not ( = ?auto_4652 ?auto_4654 ) ) ( AVAILABLE ?auto_4654 ) ( SURFACE-AT ?auto_4651 ?auto_4655 ) ( ON ?auto_4651 ?auto_4658 ) ( CLEAR ?auto_4651 ) ( not ( = ?auto_4650 ?auto_4658 ) ) ( not ( = ?auto_4651 ?auto_4658 ) ) ( not ( = ?auto_4653 ?auto_4658 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4654 ?auto_4651 ?auto_4658 ?auto_4655 )
      ( MAKE-2CRATE ?auto_4653 ?auto_4650 ?auto_4651 )
      ( MAKE-1CRATE-VERIFY ?auto_4650 ?auto_4651 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4659 - SURFACE
      ?auto_4660 - SURFACE
      ?auto_4661 - SURFACE
    )
    :vars
    (
      ?auto_4663 - HOIST
      ?auto_4662 - PLACE
      ?auto_4664 - TRUCK
      ?auto_4666 - PLACE
      ?auto_4665 - HOIST
      ?auto_4667 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4663 ?auto_4662 ) ( SURFACE-AT ?auto_4660 ?auto_4662 ) ( CLEAR ?auto_4660 ) ( IS-CRATE ?auto_4661 ) ( not ( = ?auto_4660 ?auto_4661 ) ) ( AVAILABLE ?auto_4663 ) ( ON ?auto_4660 ?auto_4659 ) ( not ( = ?auto_4659 ?auto_4660 ) ) ( not ( = ?auto_4659 ?auto_4661 ) ) ( TRUCK-AT ?auto_4664 ?auto_4666 ) ( not ( = ?auto_4666 ?auto_4662 ) ) ( HOIST-AT ?auto_4665 ?auto_4666 ) ( not ( = ?auto_4663 ?auto_4665 ) ) ( AVAILABLE ?auto_4665 ) ( SURFACE-AT ?auto_4661 ?auto_4666 ) ( ON ?auto_4661 ?auto_4667 ) ( CLEAR ?auto_4661 ) ( not ( = ?auto_4660 ?auto_4667 ) ) ( not ( = ?auto_4661 ?auto_4667 ) ) ( not ( = ?auto_4659 ?auto_4667 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4660 ?auto_4661 )
      ( MAKE-2CRATE-VERIFY ?auto_4659 ?auto_4660 ?auto_4661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4668 - SURFACE
      ?auto_4669 - SURFACE
    )
    :vars
    (
      ?auto_4676 - HOIST
      ?auto_4671 - PLACE
      ?auto_4675 - SURFACE
      ?auto_4673 - PLACE
      ?auto_4670 - HOIST
      ?auto_4674 - SURFACE
      ?auto_4672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4676 ?auto_4671 ) ( SURFACE-AT ?auto_4668 ?auto_4671 ) ( CLEAR ?auto_4668 ) ( IS-CRATE ?auto_4669 ) ( not ( = ?auto_4668 ?auto_4669 ) ) ( AVAILABLE ?auto_4676 ) ( ON ?auto_4668 ?auto_4675 ) ( not ( = ?auto_4675 ?auto_4668 ) ) ( not ( = ?auto_4675 ?auto_4669 ) ) ( not ( = ?auto_4673 ?auto_4671 ) ) ( HOIST-AT ?auto_4670 ?auto_4673 ) ( not ( = ?auto_4676 ?auto_4670 ) ) ( AVAILABLE ?auto_4670 ) ( SURFACE-AT ?auto_4669 ?auto_4673 ) ( ON ?auto_4669 ?auto_4674 ) ( CLEAR ?auto_4669 ) ( not ( = ?auto_4668 ?auto_4674 ) ) ( not ( = ?auto_4669 ?auto_4674 ) ) ( not ( = ?auto_4675 ?auto_4674 ) ) ( TRUCK-AT ?auto_4672 ?auto_4671 ) )
    :subtasks
    ( ( !DRIVE ?auto_4672 ?auto_4671 ?auto_4673 )
      ( MAKE-2CRATE ?auto_4675 ?auto_4668 ?auto_4669 )
      ( MAKE-1CRATE-VERIFY ?auto_4668 ?auto_4669 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4677 - SURFACE
      ?auto_4678 - SURFACE
      ?auto_4679 - SURFACE
    )
    :vars
    (
      ?auto_4683 - HOIST
      ?auto_4685 - PLACE
      ?auto_4681 - PLACE
      ?auto_4680 - HOIST
      ?auto_4684 - SURFACE
      ?auto_4682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4683 ?auto_4685 ) ( SURFACE-AT ?auto_4678 ?auto_4685 ) ( CLEAR ?auto_4678 ) ( IS-CRATE ?auto_4679 ) ( not ( = ?auto_4678 ?auto_4679 ) ) ( AVAILABLE ?auto_4683 ) ( ON ?auto_4678 ?auto_4677 ) ( not ( = ?auto_4677 ?auto_4678 ) ) ( not ( = ?auto_4677 ?auto_4679 ) ) ( not ( = ?auto_4681 ?auto_4685 ) ) ( HOIST-AT ?auto_4680 ?auto_4681 ) ( not ( = ?auto_4683 ?auto_4680 ) ) ( AVAILABLE ?auto_4680 ) ( SURFACE-AT ?auto_4679 ?auto_4681 ) ( ON ?auto_4679 ?auto_4684 ) ( CLEAR ?auto_4679 ) ( not ( = ?auto_4678 ?auto_4684 ) ) ( not ( = ?auto_4679 ?auto_4684 ) ) ( not ( = ?auto_4677 ?auto_4684 ) ) ( TRUCK-AT ?auto_4682 ?auto_4685 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4678 ?auto_4679 )
      ( MAKE-2CRATE-VERIFY ?auto_4677 ?auto_4678 ?auto_4679 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4686 - SURFACE
      ?auto_4687 - SURFACE
    )
    :vars
    (
      ?auto_4693 - HOIST
      ?auto_4691 - PLACE
      ?auto_4690 - SURFACE
      ?auto_4689 - PLACE
      ?auto_4692 - HOIST
      ?auto_4694 - SURFACE
      ?auto_4688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4693 ?auto_4691 ) ( IS-CRATE ?auto_4687 ) ( not ( = ?auto_4686 ?auto_4687 ) ) ( not ( = ?auto_4690 ?auto_4686 ) ) ( not ( = ?auto_4690 ?auto_4687 ) ) ( not ( = ?auto_4689 ?auto_4691 ) ) ( HOIST-AT ?auto_4692 ?auto_4689 ) ( not ( = ?auto_4693 ?auto_4692 ) ) ( AVAILABLE ?auto_4692 ) ( SURFACE-AT ?auto_4687 ?auto_4689 ) ( ON ?auto_4687 ?auto_4694 ) ( CLEAR ?auto_4687 ) ( not ( = ?auto_4686 ?auto_4694 ) ) ( not ( = ?auto_4687 ?auto_4694 ) ) ( not ( = ?auto_4690 ?auto_4694 ) ) ( TRUCK-AT ?auto_4688 ?auto_4691 ) ( SURFACE-AT ?auto_4690 ?auto_4691 ) ( CLEAR ?auto_4690 ) ( LIFTING ?auto_4693 ?auto_4686 ) ( IS-CRATE ?auto_4686 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4690 ?auto_4686 )
      ( MAKE-2CRATE ?auto_4690 ?auto_4686 ?auto_4687 )
      ( MAKE-1CRATE-VERIFY ?auto_4686 ?auto_4687 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4695 - SURFACE
      ?auto_4696 - SURFACE
      ?auto_4697 - SURFACE
    )
    :vars
    (
      ?auto_4699 - HOIST
      ?auto_4698 - PLACE
      ?auto_4700 - PLACE
      ?auto_4701 - HOIST
      ?auto_4703 - SURFACE
      ?auto_4702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4699 ?auto_4698 ) ( IS-CRATE ?auto_4697 ) ( not ( = ?auto_4696 ?auto_4697 ) ) ( not ( = ?auto_4695 ?auto_4696 ) ) ( not ( = ?auto_4695 ?auto_4697 ) ) ( not ( = ?auto_4700 ?auto_4698 ) ) ( HOIST-AT ?auto_4701 ?auto_4700 ) ( not ( = ?auto_4699 ?auto_4701 ) ) ( AVAILABLE ?auto_4701 ) ( SURFACE-AT ?auto_4697 ?auto_4700 ) ( ON ?auto_4697 ?auto_4703 ) ( CLEAR ?auto_4697 ) ( not ( = ?auto_4696 ?auto_4703 ) ) ( not ( = ?auto_4697 ?auto_4703 ) ) ( not ( = ?auto_4695 ?auto_4703 ) ) ( TRUCK-AT ?auto_4702 ?auto_4698 ) ( SURFACE-AT ?auto_4695 ?auto_4698 ) ( CLEAR ?auto_4695 ) ( LIFTING ?auto_4699 ?auto_4696 ) ( IS-CRATE ?auto_4696 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4696 ?auto_4697 )
      ( MAKE-2CRATE-VERIFY ?auto_4695 ?auto_4696 ?auto_4697 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4704 - SURFACE
      ?auto_4705 - SURFACE
    )
    :vars
    (
      ?auto_4711 - HOIST
      ?auto_4710 - PLACE
      ?auto_4712 - SURFACE
      ?auto_4707 - PLACE
      ?auto_4706 - HOIST
      ?auto_4709 - SURFACE
      ?auto_4708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4711 ?auto_4710 ) ( IS-CRATE ?auto_4705 ) ( not ( = ?auto_4704 ?auto_4705 ) ) ( not ( = ?auto_4712 ?auto_4704 ) ) ( not ( = ?auto_4712 ?auto_4705 ) ) ( not ( = ?auto_4707 ?auto_4710 ) ) ( HOIST-AT ?auto_4706 ?auto_4707 ) ( not ( = ?auto_4711 ?auto_4706 ) ) ( AVAILABLE ?auto_4706 ) ( SURFACE-AT ?auto_4705 ?auto_4707 ) ( ON ?auto_4705 ?auto_4709 ) ( CLEAR ?auto_4705 ) ( not ( = ?auto_4704 ?auto_4709 ) ) ( not ( = ?auto_4705 ?auto_4709 ) ) ( not ( = ?auto_4712 ?auto_4709 ) ) ( TRUCK-AT ?auto_4708 ?auto_4710 ) ( SURFACE-AT ?auto_4712 ?auto_4710 ) ( CLEAR ?auto_4712 ) ( IS-CRATE ?auto_4704 ) ( AVAILABLE ?auto_4711 ) ( IN ?auto_4704 ?auto_4708 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4711 ?auto_4704 ?auto_4708 ?auto_4710 )
      ( MAKE-2CRATE ?auto_4712 ?auto_4704 ?auto_4705 )
      ( MAKE-1CRATE-VERIFY ?auto_4704 ?auto_4705 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4713 - SURFACE
      ?auto_4714 - SURFACE
      ?auto_4715 - SURFACE
    )
    :vars
    (
      ?auto_4717 - HOIST
      ?auto_4721 - PLACE
      ?auto_4719 - PLACE
      ?auto_4716 - HOIST
      ?auto_4718 - SURFACE
      ?auto_4720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4717 ?auto_4721 ) ( IS-CRATE ?auto_4715 ) ( not ( = ?auto_4714 ?auto_4715 ) ) ( not ( = ?auto_4713 ?auto_4714 ) ) ( not ( = ?auto_4713 ?auto_4715 ) ) ( not ( = ?auto_4719 ?auto_4721 ) ) ( HOIST-AT ?auto_4716 ?auto_4719 ) ( not ( = ?auto_4717 ?auto_4716 ) ) ( AVAILABLE ?auto_4716 ) ( SURFACE-AT ?auto_4715 ?auto_4719 ) ( ON ?auto_4715 ?auto_4718 ) ( CLEAR ?auto_4715 ) ( not ( = ?auto_4714 ?auto_4718 ) ) ( not ( = ?auto_4715 ?auto_4718 ) ) ( not ( = ?auto_4713 ?auto_4718 ) ) ( TRUCK-AT ?auto_4720 ?auto_4721 ) ( SURFACE-AT ?auto_4713 ?auto_4721 ) ( CLEAR ?auto_4713 ) ( IS-CRATE ?auto_4714 ) ( AVAILABLE ?auto_4717 ) ( IN ?auto_4714 ?auto_4720 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4714 ?auto_4715 )
      ( MAKE-2CRATE-VERIFY ?auto_4713 ?auto_4714 ?auto_4715 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4722 - SURFACE
      ?auto_4723 - SURFACE
    )
    :vars
    (
      ?auto_4729 - HOIST
      ?auto_4725 - PLACE
      ?auto_4727 - SURFACE
      ?auto_4726 - PLACE
      ?auto_4724 - HOIST
      ?auto_4728 - SURFACE
      ?auto_4730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4729 ?auto_4725 ) ( IS-CRATE ?auto_4723 ) ( not ( = ?auto_4722 ?auto_4723 ) ) ( not ( = ?auto_4727 ?auto_4722 ) ) ( not ( = ?auto_4727 ?auto_4723 ) ) ( not ( = ?auto_4726 ?auto_4725 ) ) ( HOIST-AT ?auto_4724 ?auto_4726 ) ( not ( = ?auto_4729 ?auto_4724 ) ) ( AVAILABLE ?auto_4724 ) ( SURFACE-AT ?auto_4723 ?auto_4726 ) ( ON ?auto_4723 ?auto_4728 ) ( CLEAR ?auto_4723 ) ( not ( = ?auto_4722 ?auto_4728 ) ) ( not ( = ?auto_4723 ?auto_4728 ) ) ( not ( = ?auto_4727 ?auto_4728 ) ) ( SURFACE-AT ?auto_4727 ?auto_4725 ) ( CLEAR ?auto_4727 ) ( IS-CRATE ?auto_4722 ) ( AVAILABLE ?auto_4729 ) ( IN ?auto_4722 ?auto_4730 ) ( TRUCK-AT ?auto_4730 ?auto_4726 ) )
    :subtasks
    ( ( !DRIVE ?auto_4730 ?auto_4726 ?auto_4725 )
      ( MAKE-2CRATE ?auto_4727 ?auto_4722 ?auto_4723 )
      ( MAKE-1CRATE-VERIFY ?auto_4722 ?auto_4723 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4731 - SURFACE
      ?auto_4732 - SURFACE
      ?auto_4733 - SURFACE
    )
    :vars
    (
      ?auto_4735 - HOIST
      ?auto_4734 - PLACE
      ?auto_4737 - PLACE
      ?auto_4736 - HOIST
      ?auto_4738 - SURFACE
      ?auto_4739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4735 ?auto_4734 ) ( IS-CRATE ?auto_4733 ) ( not ( = ?auto_4732 ?auto_4733 ) ) ( not ( = ?auto_4731 ?auto_4732 ) ) ( not ( = ?auto_4731 ?auto_4733 ) ) ( not ( = ?auto_4737 ?auto_4734 ) ) ( HOIST-AT ?auto_4736 ?auto_4737 ) ( not ( = ?auto_4735 ?auto_4736 ) ) ( AVAILABLE ?auto_4736 ) ( SURFACE-AT ?auto_4733 ?auto_4737 ) ( ON ?auto_4733 ?auto_4738 ) ( CLEAR ?auto_4733 ) ( not ( = ?auto_4732 ?auto_4738 ) ) ( not ( = ?auto_4733 ?auto_4738 ) ) ( not ( = ?auto_4731 ?auto_4738 ) ) ( SURFACE-AT ?auto_4731 ?auto_4734 ) ( CLEAR ?auto_4731 ) ( IS-CRATE ?auto_4732 ) ( AVAILABLE ?auto_4735 ) ( IN ?auto_4732 ?auto_4739 ) ( TRUCK-AT ?auto_4739 ?auto_4737 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4732 ?auto_4733 )
      ( MAKE-2CRATE-VERIFY ?auto_4731 ?auto_4732 ?auto_4733 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4740 - SURFACE
      ?auto_4741 - SURFACE
    )
    :vars
    (
      ?auto_4746 - HOIST
      ?auto_4745 - PLACE
      ?auto_4744 - SURFACE
      ?auto_4748 - PLACE
      ?auto_4742 - HOIST
      ?auto_4743 - SURFACE
      ?auto_4747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4746 ?auto_4745 ) ( IS-CRATE ?auto_4741 ) ( not ( = ?auto_4740 ?auto_4741 ) ) ( not ( = ?auto_4744 ?auto_4740 ) ) ( not ( = ?auto_4744 ?auto_4741 ) ) ( not ( = ?auto_4748 ?auto_4745 ) ) ( HOIST-AT ?auto_4742 ?auto_4748 ) ( not ( = ?auto_4746 ?auto_4742 ) ) ( SURFACE-AT ?auto_4741 ?auto_4748 ) ( ON ?auto_4741 ?auto_4743 ) ( CLEAR ?auto_4741 ) ( not ( = ?auto_4740 ?auto_4743 ) ) ( not ( = ?auto_4741 ?auto_4743 ) ) ( not ( = ?auto_4744 ?auto_4743 ) ) ( SURFACE-AT ?auto_4744 ?auto_4745 ) ( CLEAR ?auto_4744 ) ( IS-CRATE ?auto_4740 ) ( AVAILABLE ?auto_4746 ) ( TRUCK-AT ?auto_4747 ?auto_4748 ) ( LIFTING ?auto_4742 ?auto_4740 ) )
    :subtasks
    ( ( !LOAD ?auto_4742 ?auto_4740 ?auto_4747 ?auto_4748 )
      ( MAKE-2CRATE ?auto_4744 ?auto_4740 ?auto_4741 )
      ( MAKE-1CRATE-VERIFY ?auto_4740 ?auto_4741 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4749 - SURFACE
      ?auto_4750 - SURFACE
      ?auto_4751 - SURFACE
    )
    :vars
    (
      ?auto_4757 - HOIST
      ?auto_4752 - PLACE
      ?auto_4753 - PLACE
      ?auto_4755 - HOIST
      ?auto_4756 - SURFACE
      ?auto_4754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4757 ?auto_4752 ) ( IS-CRATE ?auto_4751 ) ( not ( = ?auto_4750 ?auto_4751 ) ) ( not ( = ?auto_4749 ?auto_4750 ) ) ( not ( = ?auto_4749 ?auto_4751 ) ) ( not ( = ?auto_4753 ?auto_4752 ) ) ( HOIST-AT ?auto_4755 ?auto_4753 ) ( not ( = ?auto_4757 ?auto_4755 ) ) ( SURFACE-AT ?auto_4751 ?auto_4753 ) ( ON ?auto_4751 ?auto_4756 ) ( CLEAR ?auto_4751 ) ( not ( = ?auto_4750 ?auto_4756 ) ) ( not ( = ?auto_4751 ?auto_4756 ) ) ( not ( = ?auto_4749 ?auto_4756 ) ) ( SURFACE-AT ?auto_4749 ?auto_4752 ) ( CLEAR ?auto_4749 ) ( IS-CRATE ?auto_4750 ) ( AVAILABLE ?auto_4757 ) ( TRUCK-AT ?auto_4754 ?auto_4753 ) ( LIFTING ?auto_4755 ?auto_4750 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4750 ?auto_4751 )
      ( MAKE-2CRATE-VERIFY ?auto_4749 ?auto_4750 ?auto_4751 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4758 - SURFACE
      ?auto_4759 - SURFACE
    )
    :vars
    (
      ?auto_4761 - HOIST
      ?auto_4763 - PLACE
      ?auto_4765 - SURFACE
      ?auto_4764 - PLACE
      ?auto_4760 - HOIST
      ?auto_4766 - SURFACE
      ?auto_4762 - TRUCK
      ?auto_4767 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4761 ?auto_4763 ) ( IS-CRATE ?auto_4759 ) ( not ( = ?auto_4758 ?auto_4759 ) ) ( not ( = ?auto_4765 ?auto_4758 ) ) ( not ( = ?auto_4765 ?auto_4759 ) ) ( not ( = ?auto_4764 ?auto_4763 ) ) ( HOIST-AT ?auto_4760 ?auto_4764 ) ( not ( = ?auto_4761 ?auto_4760 ) ) ( SURFACE-AT ?auto_4759 ?auto_4764 ) ( ON ?auto_4759 ?auto_4766 ) ( CLEAR ?auto_4759 ) ( not ( = ?auto_4758 ?auto_4766 ) ) ( not ( = ?auto_4759 ?auto_4766 ) ) ( not ( = ?auto_4765 ?auto_4766 ) ) ( SURFACE-AT ?auto_4765 ?auto_4763 ) ( CLEAR ?auto_4765 ) ( IS-CRATE ?auto_4758 ) ( AVAILABLE ?auto_4761 ) ( TRUCK-AT ?auto_4762 ?auto_4764 ) ( AVAILABLE ?auto_4760 ) ( SURFACE-AT ?auto_4758 ?auto_4764 ) ( ON ?auto_4758 ?auto_4767 ) ( CLEAR ?auto_4758 ) ( not ( = ?auto_4758 ?auto_4767 ) ) ( not ( = ?auto_4759 ?auto_4767 ) ) ( not ( = ?auto_4765 ?auto_4767 ) ) ( not ( = ?auto_4766 ?auto_4767 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4760 ?auto_4758 ?auto_4767 ?auto_4764 )
      ( MAKE-2CRATE ?auto_4765 ?auto_4758 ?auto_4759 )
      ( MAKE-1CRATE-VERIFY ?auto_4758 ?auto_4759 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4768 - SURFACE
      ?auto_4769 - SURFACE
      ?auto_4770 - SURFACE
    )
    :vars
    (
      ?auto_4773 - HOIST
      ?auto_4772 - PLACE
      ?auto_4776 - PLACE
      ?auto_4777 - HOIST
      ?auto_4775 - SURFACE
      ?auto_4774 - TRUCK
      ?auto_4771 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4773 ?auto_4772 ) ( IS-CRATE ?auto_4770 ) ( not ( = ?auto_4769 ?auto_4770 ) ) ( not ( = ?auto_4768 ?auto_4769 ) ) ( not ( = ?auto_4768 ?auto_4770 ) ) ( not ( = ?auto_4776 ?auto_4772 ) ) ( HOIST-AT ?auto_4777 ?auto_4776 ) ( not ( = ?auto_4773 ?auto_4777 ) ) ( SURFACE-AT ?auto_4770 ?auto_4776 ) ( ON ?auto_4770 ?auto_4775 ) ( CLEAR ?auto_4770 ) ( not ( = ?auto_4769 ?auto_4775 ) ) ( not ( = ?auto_4770 ?auto_4775 ) ) ( not ( = ?auto_4768 ?auto_4775 ) ) ( SURFACE-AT ?auto_4768 ?auto_4772 ) ( CLEAR ?auto_4768 ) ( IS-CRATE ?auto_4769 ) ( AVAILABLE ?auto_4773 ) ( TRUCK-AT ?auto_4774 ?auto_4776 ) ( AVAILABLE ?auto_4777 ) ( SURFACE-AT ?auto_4769 ?auto_4776 ) ( ON ?auto_4769 ?auto_4771 ) ( CLEAR ?auto_4769 ) ( not ( = ?auto_4769 ?auto_4771 ) ) ( not ( = ?auto_4770 ?auto_4771 ) ) ( not ( = ?auto_4768 ?auto_4771 ) ) ( not ( = ?auto_4775 ?auto_4771 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4769 ?auto_4770 )
      ( MAKE-2CRATE-VERIFY ?auto_4768 ?auto_4769 ?auto_4770 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4778 - SURFACE
      ?auto_4779 - SURFACE
    )
    :vars
    (
      ?auto_4785 - HOIST
      ?auto_4780 - PLACE
      ?auto_4787 - SURFACE
      ?auto_4786 - PLACE
      ?auto_4784 - HOIST
      ?auto_4783 - SURFACE
      ?auto_4781 - SURFACE
      ?auto_4782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4785 ?auto_4780 ) ( IS-CRATE ?auto_4779 ) ( not ( = ?auto_4778 ?auto_4779 ) ) ( not ( = ?auto_4787 ?auto_4778 ) ) ( not ( = ?auto_4787 ?auto_4779 ) ) ( not ( = ?auto_4786 ?auto_4780 ) ) ( HOIST-AT ?auto_4784 ?auto_4786 ) ( not ( = ?auto_4785 ?auto_4784 ) ) ( SURFACE-AT ?auto_4779 ?auto_4786 ) ( ON ?auto_4779 ?auto_4783 ) ( CLEAR ?auto_4779 ) ( not ( = ?auto_4778 ?auto_4783 ) ) ( not ( = ?auto_4779 ?auto_4783 ) ) ( not ( = ?auto_4787 ?auto_4783 ) ) ( SURFACE-AT ?auto_4787 ?auto_4780 ) ( CLEAR ?auto_4787 ) ( IS-CRATE ?auto_4778 ) ( AVAILABLE ?auto_4785 ) ( AVAILABLE ?auto_4784 ) ( SURFACE-AT ?auto_4778 ?auto_4786 ) ( ON ?auto_4778 ?auto_4781 ) ( CLEAR ?auto_4778 ) ( not ( = ?auto_4778 ?auto_4781 ) ) ( not ( = ?auto_4779 ?auto_4781 ) ) ( not ( = ?auto_4787 ?auto_4781 ) ) ( not ( = ?auto_4783 ?auto_4781 ) ) ( TRUCK-AT ?auto_4782 ?auto_4780 ) )
    :subtasks
    ( ( !DRIVE ?auto_4782 ?auto_4780 ?auto_4786 )
      ( MAKE-2CRATE ?auto_4787 ?auto_4778 ?auto_4779 )
      ( MAKE-1CRATE-VERIFY ?auto_4778 ?auto_4779 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4788 - SURFACE
      ?auto_4789 - SURFACE
      ?auto_4790 - SURFACE
    )
    :vars
    (
      ?auto_4795 - HOIST
      ?auto_4794 - PLACE
      ?auto_4793 - PLACE
      ?auto_4796 - HOIST
      ?auto_4797 - SURFACE
      ?auto_4791 - SURFACE
      ?auto_4792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4795 ?auto_4794 ) ( IS-CRATE ?auto_4790 ) ( not ( = ?auto_4789 ?auto_4790 ) ) ( not ( = ?auto_4788 ?auto_4789 ) ) ( not ( = ?auto_4788 ?auto_4790 ) ) ( not ( = ?auto_4793 ?auto_4794 ) ) ( HOIST-AT ?auto_4796 ?auto_4793 ) ( not ( = ?auto_4795 ?auto_4796 ) ) ( SURFACE-AT ?auto_4790 ?auto_4793 ) ( ON ?auto_4790 ?auto_4797 ) ( CLEAR ?auto_4790 ) ( not ( = ?auto_4789 ?auto_4797 ) ) ( not ( = ?auto_4790 ?auto_4797 ) ) ( not ( = ?auto_4788 ?auto_4797 ) ) ( SURFACE-AT ?auto_4788 ?auto_4794 ) ( CLEAR ?auto_4788 ) ( IS-CRATE ?auto_4789 ) ( AVAILABLE ?auto_4795 ) ( AVAILABLE ?auto_4796 ) ( SURFACE-AT ?auto_4789 ?auto_4793 ) ( ON ?auto_4789 ?auto_4791 ) ( CLEAR ?auto_4789 ) ( not ( = ?auto_4789 ?auto_4791 ) ) ( not ( = ?auto_4790 ?auto_4791 ) ) ( not ( = ?auto_4788 ?auto_4791 ) ) ( not ( = ?auto_4797 ?auto_4791 ) ) ( TRUCK-AT ?auto_4792 ?auto_4794 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4789 ?auto_4790 )
      ( MAKE-2CRATE-VERIFY ?auto_4788 ?auto_4789 ?auto_4790 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4807 - SURFACE
      ?auto_4808 - SURFACE
    )
    :vars
    (
      ?auto_4809 - HOIST
      ?auto_4810 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4809 ?auto_4810 ) ( SURFACE-AT ?auto_4807 ?auto_4810 ) ( CLEAR ?auto_4807 ) ( LIFTING ?auto_4809 ?auto_4808 ) ( IS-CRATE ?auto_4808 ) ( not ( = ?auto_4807 ?auto_4808 ) ) )
    :subtasks
    ( ( !DROP ?auto_4809 ?auto_4808 ?auto_4807 ?auto_4810 )
      ( MAKE-1CRATE-VERIFY ?auto_4807 ?auto_4808 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4811 - SURFACE
      ?auto_4812 - SURFACE
      ?auto_4813 - SURFACE
    )
    :vars
    (
      ?auto_4814 - HOIST
      ?auto_4815 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4814 ?auto_4815 ) ( SURFACE-AT ?auto_4812 ?auto_4815 ) ( CLEAR ?auto_4812 ) ( LIFTING ?auto_4814 ?auto_4813 ) ( IS-CRATE ?auto_4813 ) ( not ( = ?auto_4812 ?auto_4813 ) ) ( ON ?auto_4812 ?auto_4811 ) ( not ( = ?auto_4811 ?auto_4812 ) ) ( not ( = ?auto_4811 ?auto_4813 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4812 ?auto_4813 )
      ( MAKE-2CRATE-VERIFY ?auto_4811 ?auto_4812 ?auto_4813 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4816 - SURFACE
      ?auto_4817 - SURFACE
      ?auto_4818 - SURFACE
      ?auto_4819 - SURFACE
    )
    :vars
    (
      ?auto_4820 - HOIST
      ?auto_4821 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4820 ?auto_4821 ) ( SURFACE-AT ?auto_4818 ?auto_4821 ) ( CLEAR ?auto_4818 ) ( LIFTING ?auto_4820 ?auto_4819 ) ( IS-CRATE ?auto_4819 ) ( not ( = ?auto_4818 ?auto_4819 ) ) ( ON ?auto_4817 ?auto_4816 ) ( ON ?auto_4818 ?auto_4817 ) ( not ( = ?auto_4816 ?auto_4817 ) ) ( not ( = ?auto_4816 ?auto_4818 ) ) ( not ( = ?auto_4816 ?auto_4819 ) ) ( not ( = ?auto_4817 ?auto_4818 ) ) ( not ( = ?auto_4817 ?auto_4819 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4818 ?auto_4819 )
      ( MAKE-3CRATE-VERIFY ?auto_4816 ?auto_4817 ?auto_4818 ?auto_4819 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4822 - SURFACE
      ?auto_4823 - SURFACE
    )
    :vars
    (
      ?auto_4824 - HOIST
      ?auto_4825 - PLACE
      ?auto_4826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4824 ?auto_4825 ) ( SURFACE-AT ?auto_4822 ?auto_4825 ) ( CLEAR ?auto_4822 ) ( IS-CRATE ?auto_4823 ) ( not ( = ?auto_4822 ?auto_4823 ) ) ( TRUCK-AT ?auto_4826 ?auto_4825 ) ( AVAILABLE ?auto_4824 ) ( IN ?auto_4823 ?auto_4826 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4824 ?auto_4823 ?auto_4826 ?auto_4825 )
      ( MAKE-1CRATE ?auto_4822 ?auto_4823 )
      ( MAKE-1CRATE-VERIFY ?auto_4822 ?auto_4823 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4827 - SURFACE
      ?auto_4828 - SURFACE
      ?auto_4829 - SURFACE
    )
    :vars
    (
      ?auto_4830 - HOIST
      ?auto_4832 - PLACE
      ?auto_4831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4830 ?auto_4832 ) ( SURFACE-AT ?auto_4828 ?auto_4832 ) ( CLEAR ?auto_4828 ) ( IS-CRATE ?auto_4829 ) ( not ( = ?auto_4828 ?auto_4829 ) ) ( TRUCK-AT ?auto_4831 ?auto_4832 ) ( AVAILABLE ?auto_4830 ) ( IN ?auto_4829 ?auto_4831 ) ( ON ?auto_4828 ?auto_4827 ) ( not ( = ?auto_4827 ?auto_4828 ) ) ( not ( = ?auto_4827 ?auto_4829 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4828 ?auto_4829 )
      ( MAKE-2CRATE-VERIFY ?auto_4827 ?auto_4828 ?auto_4829 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4833 - SURFACE
      ?auto_4834 - SURFACE
      ?auto_4835 - SURFACE
      ?auto_4836 - SURFACE
    )
    :vars
    (
      ?auto_4839 - HOIST
      ?auto_4838 - PLACE
      ?auto_4837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4839 ?auto_4838 ) ( SURFACE-AT ?auto_4835 ?auto_4838 ) ( CLEAR ?auto_4835 ) ( IS-CRATE ?auto_4836 ) ( not ( = ?auto_4835 ?auto_4836 ) ) ( TRUCK-AT ?auto_4837 ?auto_4838 ) ( AVAILABLE ?auto_4839 ) ( IN ?auto_4836 ?auto_4837 ) ( ON ?auto_4835 ?auto_4834 ) ( not ( = ?auto_4834 ?auto_4835 ) ) ( not ( = ?auto_4834 ?auto_4836 ) ) ( ON ?auto_4834 ?auto_4833 ) ( not ( = ?auto_4833 ?auto_4834 ) ) ( not ( = ?auto_4833 ?auto_4835 ) ) ( not ( = ?auto_4833 ?auto_4836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4834 ?auto_4835 ?auto_4836 )
      ( MAKE-3CRATE-VERIFY ?auto_4833 ?auto_4834 ?auto_4835 ?auto_4836 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4840 - SURFACE
      ?auto_4841 - SURFACE
    )
    :vars
    (
      ?auto_4844 - HOIST
      ?auto_4843 - PLACE
      ?auto_4842 - TRUCK
      ?auto_4845 - SURFACE
      ?auto_4846 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4844 ?auto_4843 ) ( SURFACE-AT ?auto_4840 ?auto_4843 ) ( CLEAR ?auto_4840 ) ( IS-CRATE ?auto_4841 ) ( not ( = ?auto_4840 ?auto_4841 ) ) ( AVAILABLE ?auto_4844 ) ( IN ?auto_4841 ?auto_4842 ) ( ON ?auto_4840 ?auto_4845 ) ( not ( = ?auto_4845 ?auto_4840 ) ) ( not ( = ?auto_4845 ?auto_4841 ) ) ( TRUCK-AT ?auto_4842 ?auto_4846 ) ( not ( = ?auto_4846 ?auto_4843 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4842 ?auto_4846 ?auto_4843 )
      ( MAKE-2CRATE ?auto_4845 ?auto_4840 ?auto_4841 )
      ( MAKE-1CRATE-VERIFY ?auto_4840 ?auto_4841 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4847 - SURFACE
      ?auto_4848 - SURFACE
      ?auto_4849 - SURFACE
    )
    :vars
    (
      ?auto_4850 - HOIST
      ?auto_4853 - PLACE
      ?auto_4851 - TRUCK
      ?auto_4852 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4850 ?auto_4853 ) ( SURFACE-AT ?auto_4848 ?auto_4853 ) ( CLEAR ?auto_4848 ) ( IS-CRATE ?auto_4849 ) ( not ( = ?auto_4848 ?auto_4849 ) ) ( AVAILABLE ?auto_4850 ) ( IN ?auto_4849 ?auto_4851 ) ( ON ?auto_4848 ?auto_4847 ) ( not ( = ?auto_4847 ?auto_4848 ) ) ( not ( = ?auto_4847 ?auto_4849 ) ) ( TRUCK-AT ?auto_4851 ?auto_4852 ) ( not ( = ?auto_4852 ?auto_4853 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4848 ?auto_4849 )
      ( MAKE-2CRATE-VERIFY ?auto_4847 ?auto_4848 ?auto_4849 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4854 - SURFACE
      ?auto_4855 - SURFACE
      ?auto_4856 - SURFACE
      ?auto_4857 - SURFACE
    )
    :vars
    (
      ?auto_4861 - HOIST
      ?auto_4860 - PLACE
      ?auto_4858 - TRUCK
      ?auto_4859 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4861 ?auto_4860 ) ( SURFACE-AT ?auto_4856 ?auto_4860 ) ( CLEAR ?auto_4856 ) ( IS-CRATE ?auto_4857 ) ( not ( = ?auto_4856 ?auto_4857 ) ) ( AVAILABLE ?auto_4861 ) ( IN ?auto_4857 ?auto_4858 ) ( ON ?auto_4856 ?auto_4855 ) ( not ( = ?auto_4855 ?auto_4856 ) ) ( not ( = ?auto_4855 ?auto_4857 ) ) ( TRUCK-AT ?auto_4858 ?auto_4859 ) ( not ( = ?auto_4859 ?auto_4860 ) ) ( ON ?auto_4855 ?auto_4854 ) ( not ( = ?auto_4854 ?auto_4855 ) ) ( not ( = ?auto_4854 ?auto_4856 ) ) ( not ( = ?auto_4854 ?auto_4857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4855 ?auto_4856 ?auto_4857 )
      ( MAKE-3CRATE-VERIFY ?auto_4854 ?auto_4855 ?auto_4856 ?auto_4857 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4862 - SURFACE
      ?auto_4863 - SURFACE
    )
    :vars
    (
      ?auto_4868 - HOIST
      ?auto_4867 - PLACE
      ?auto_4866 - SURFACE
      ?auto_4864 - TRUCK
      ?auto_4865 - PLACE
      ?auto_4869 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4868 ?auto_4867 ) ( SURFACE-AT ?auto_4862 ?auto_4867 ) ( CLEAR ?auto_4862 ) ( IS-CRATE ?auto_4863 ) ( not ( = ?auto_4862 ?auto_4863 ) ) ( AVAILABLE ?auto_4868 ) ( ON ?auto_4862 ?auto_4866 ) ( not ( = ?auto_4866 ?auto_4862 ) ) ( not ( = ?auto_4866 ?auto_4863 ) ) ( TRUCK-AT ?auto_4864 ?auto_4865 ) ( not ( = ?auto_4865 ?auto_4867 ) ) ( HOIST-AT ?auto_4869 ?auto_4865 ) ( LIFTING ?auto_4869 ?auto_4863 ) ( not ( = ?auto_4868 ?auto_4869 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4869 ?auto_4863 ?auto_4864 ?auto_4865 )
      ( MAKE-2CRATE ?auto_4866 ?auto_4862 ?auto_4863 )
      ( MAKE-1CRATE-VERIFY ?auto_4862 ?auto_4863 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4870 - SURFACE
      ?auto_4871 - SURFACE
      ?auto_4872 - SURFACE
    )
    :vars
    (
      ?auto_4874 - HOIST
      ?auto_4875 - PLACE
      ?auto_4873 - TRUCK
      ?auto_4877 - PLACE
      ?auto_4876 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4874 ?auto_4875 ) ( SURFACE-AT ?auto_4871 ?auto_4875 ) ( CLEAR ?auto_4871 ) ( IS-CRATE ?auto_4872 ) ( not ( = ?auto_4871 ?auto_4872 ) ) ( AVAILABLE ?auto_4874 ) ( ON ?auto_4871 ?auto_4870 ) ( not ( = ?auto_4870 ?auto_4871 ) ) ( not ( = ?auto_4870 ?auto_4872 ) ) ( TRUCK-AT ?auto_4873 ?auto_4877 ) ( not ( = ?auto_4877 ?auto_4875 ) ) ( HOIST-AT ?auto_4876 ?auto_4877 ) ( LIFTING ?auto_4876 ?auto_4872 ) ( not ( = ?auto_4874 ?auto_4876 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4871 ?auto_4872 )
      ( MAKE-2CRATE-VERIFY ?auto_4870 ?auto_4871 ?auto_4872 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4878 - SURFACE
      ?auto_4879 - SURFACE
      ?auto_4880 - SURFACE
      ?auto_4881 - SURFACE
    )
    :vars
    (
      ?auto_4882 - HOIST
      ?auto_4886 - PLACE
      ?auto_4885 - TRUCK
      ?auto_4884 - PLACE
      ?auto_4883 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4882 ?auto_4886 ) ( SURFACE-AT ?auto_4880 ?auto_4886 ) ( CLEAR ?auto_4880 ) ( IS-CRATE ?auto_4881 ) ( not ( = ?auto_4880 ?auto_4881 ) ) ( AVAILABLE ?auto_4882 ) ( ON ?auto_4880 ?auto_4879 ) ( not ( = ?auto_4879 ?auto_4880 ) ) ( not ( = ?auto_4879 ?auto_4881 ) ) ( TRUCK-AT ?auto_4885 ?auto_4884 ) ( not ( = ?auto_4884 ?auto_4886 ) ) ( HOIST-AT ?auto_4883 ?auto_4884 ) ( LIFTING ?auto_4883 ?auto_4881 ) ( not ( = ?auto_4882 ?auto_4883 ) ) ( ON ?auto_4879 ?auto_4878 ) ( not ( = ?auto_4878 ?auto_4879 ) ) ( not ( = ?auto_4878 ?auto_4880 ) ) ( not ( = ?auto_4878 ?auto_4881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4879 ?auto_4880 ?auto_4881 )
      ( MAKE-3CRATE-VERIFY ?auto_4878 ?auto_4879 ?auto_4880 ?auto_4881 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4887 - SURFACE
      ?auto_4888 - SURFACE
    )
    :vars
    (
      ?auto_4889 - HOIST
      ?auto_4893 - PLACE
      ?auto_4894 - SURFACE
      ?auto_4892 - TRUCK
      ?auto_4891 - PLACE
      ?auto_4890 - HOIST
      ?auto_4895 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4889 ?auto_4893 ) ( SURFACE-AT ?auto_4887 ?auto_4893 ) ( CLEAR ?auto_4887 ) ( IS-CRATE ?auto_4888 ) ( not ( = ?auto_4887 ?auto_4888 ) ) ( AVAILABLE ?auto_4889 ) ( ON ?auto_4887 ?auto_4894 ) ( not ( = ?auto_4894 ?auto_4887 ) ) ( not ( = ?auto_4894 ?auto_4888 ) ) ( TRUCK-AT ?auto_4892 ?auto_4891 ) ( not ( = ?auto_4891 ?auto_4893 ) ) ( HOIST-AT ?auto_4890 ?auto_4891 ) ( not ( = ?auto_4889 ?auto_4890 ) ) ( AVAILABLE ?auto_4890 ) ( SURFACE-AT ?auto_4888 ?auto_4891 ) ( ON ?auto_4888 ?auto_4895 ) ( CLEAR ?auto_4888 ) ( not ( = ?auto_4887 ?auto_4895 ) ) ( not ( = ?auto_4888 ?auto_4895 ) ) ( not ( = ?auto_4894 ?auto_4895 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4890 ?auto_4888 ?auto_4895 ?auto_4891 )
      ( MAKE-2CRATE ?auto_4894 ?auto_4887 ?auto_4888 )
      ( MAKE-1CRATE-VERIFY ?auto_4887 ?auto_4888 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4896 - SURFACE
      ?auto_4897 - SURFACE
      ?auto_4898 - SURFACE
    )
    :vars
    (
      ?auto_4899 - HOIST
      ?auto_4904 - PLACE
      ?auto_4903 - TRUCK
      ?auto_4900 - PLACE
      ?auto_4901 - HOIST
      ?auto_4902 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4899 ?auto_4904 ) ( SURFACE-AT ?auto_4897 ?auto_4904 ) ( CLEAR ?auto_4897 ) ( IS-CRATE ?auto_4898 ) ( not ( = ?auto_4897 ?auto_4898 ) ) ( AVAILABLE ?auto_4899 ) ( ON ?auto_4897 ?auto_4896 ) ( not ( = ?auto_4896 ?auto_4897 ) ) ( not ( = ?auto_4896 ?auto_4898 ) ) ( TRUCK-AT ?auto_4903 ?auto_4900 ) ( not ( = ?auto_4900 ?auto_4904 ) ) ( HOIST-AT ?auto_4901 ?auto_4900 ) ( not ( = ?auto_4899 ?auto_4901 ) ) ( AVAILABLE ?auto_4901 ) ( SURFACE-AT ?auto_4898 ?auto_4900 ) ( ON ?auto_4898 ?auto_4902 ) ( CLEAR ?auto_4898 ) ( not ( = ?auto_4897 ?auto_4902 ) ) ( not ( = ?auto_4898 ?auto_4902 ) ) ( not ( = ?auto_4896 ?auto_4902 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4897 ?auto_4898 )
      ( MAKE-2CRATE-VERIFY ?auto_4896 ?auto_4897 ?auto_4898 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4905 - SURFACE
      ?auto_4906 - SURFACE
      ?auto_4907 - SURFACE
      ?auto_4908 - SURFACE
    )
    :vars
    (
      ?auto_4909 - HOIST
      ?auto_4913 - PLACE
      ?auto_4914 - TRUCK
      ?auto_4912 - PLACE
      ?auto_4911 - HOIST
      ?auto_4910 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4909 ?auto_4913 ) ( SURFACE-AT ?auto_4907 ?auto_4913 ) ( CLEAR ?auto_4907 ) ( IS-CRATE ?auto_4908 ) ( not ( = ?auto_4907 ?auto_4908 ) ) ( AVAILABLE ?auto_4909 ) ( ON ?auto_4907 ?auto_4906 ) ( not ( = ?auto_4906 ?auto_4907 ) ) ( not ( = ?auto_4906 ?auto_4908 ) ) ( TRUCK-AT ?auto_4914 ?auto_4912 ) ( not ( = ?auto_4912 ?auto_4913 ) ) ( HOIST-AT ?auto_4911 ?auto_4912 ) ( not ( = ?auto_4909 ?auto_4911 ) ) ( AVAILABLE ?auto_4911 ) ( SURFACE-AT ?auto_4908 ?auto_4912 ) ( ON ?auto_4908 ?auto_4910 ) ( CLEAR ?auto_4908 ) ( not ( = ?auto_4907 ?auto_4910 ) ) ( not ( = ?auto_4908 ?auto_4910 ) ) ( not ( = ?auto_4906 ?auto_4910 ) ) ( ON ?auto_4906 ?auto_4905 ) ( not ( = ?auto_4905 ?auto_4906 ) ) ( not ( = ?auto_4905 ?auto_4907 ) ) ( not ( = ?auto_4905 ?auto_4908 ) ) ( not ( = ?auto_4905 ?auto_4910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4906 ?auto_4907 ?auto_4908 )
      ( MAKE-3CRATE-VERIFY ?auto_4905 ?auto_4906 ?auto_4907 ?auto_4908 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4915 - SURFACE
      ?auto_4916 - SURFACE
    )
    :vars
    (
      ?auto_4917 - HOIST
      ?auto_4922 - PLACE
      ?auto_4919 - SURFACE
      ?auto_4921 - PLACE
      ?auto_4920 - HOIST
      ?auto_4918 - SURFACE
      ?auto_4923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4917 ?auto_4922 ) ( SURFACE-AT ?auto_4915 ?auto_4922 ) ( CLEAR ?auto_4915 ) ( IS-CRATE ?auto_4916 ) ( not ( = ?auto_4915 ?auto_4916 ) ) ( AVAILABLE ?auto_4917 ) ( ON ?auto_4915 ?auto_4919 ) ( not ( = ?auto_4919 ?auto_4915 ) ) ( not ( = ?auto_4919 ?auto_4916 ) ) ( not ( = ?auto_4921 ?auto_4922 ) ) ( HOIST-AT ?auto_4920 ?auto_4921 ) ( not ( = ?auto_4917 ?auto_4920 ) ) ( AVAILABLE ?auto_4920 ) ( SURFACE-AT ?auto_4916 ?auto_4921 ) ( ON ?auto_4916 ?auto_4918 ) ( CLEAR ?auto_4916 ) ( not ( = ?auto_4915 ?auto_4918 ) ) ( not ( = ?auto_4916 ?auto_4918 ) ) ( not ( = ?auto_4919 ?auto_4918 ) ) ( TRUCK-AT ?auto_4923 ?auto_4922 ) )
    :subtasks
    ( ( !DRIVE ?auto_4923 ?auto_4922 ?auto_4921 )
      ( MAKE-2CRATE ?auto_4919 ?auto_4915 ?auto_4916 )
      ( MAKE-1CRATE-VERIFY ?auto_4915 ?auto_4916 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4924 - SURFACE
      ?auto_4925 - SURFACE
      ?auto_4926 - SURFACE
    )
    :vars
    (
      ?auto_4929 - HOIST
      ?auto_4931 - PLACE
      ?auto_4932 - PLACE
      ?auto_4927 - HOIST
      ?auto_4930 - SURFACE
      ?auto_4928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4929 ?auto_4931 ) ( SURFACE-AT ?auto_4925 ?auto_4931 ) ( CLEAR ?auto_4925 ) ( IS-CRATE ?auto_4926 ) ( not ( = ?auto_4925 ?auto_4926 ) ) ( AVAILABLE ?auto_4929 ) ( ON ?auto_4925 ?auto_4924 ) ( not ( = ?auto_4924 ?auto_4925 ) ) ( not ( = ?auto_4924 ?auto_4926 ) ) ( not ( = ?auto_4932 ?auto_4931 ) ) ( HOIST-AT ?auto_4927 ?auto_4932 ) ( not ( = ?auto_4929 ?auto_4927 ) ) ( AVAILABLE ?auto_4927 ) ( SURFACE-AT ?auto_4926 ?auto_4932 ) ( ON ?auto_4926 ?auto_4930 ) ( CLEAR ?auto_4926 ) ( not ( = ?auto_4925 ?auto_4930 ) ) ( not ( = ?auto_4926 ?auto_4930 ) ) ( not ( = ?auto_4924 ?auto_4930 ) ) ( TRUCK-AT ?auto_4928 ?auto_4931 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4925 ?auto_4926 )
      ( MAKE-2CRATE-VERIFY ?auto_4924 ?auto_4925 ?auto_4926 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4933 - SURFACE
      ?auto_4934 - SURFACE
      ?auto_4935 - SURFACE
      ?auto_4936 - SURFACE
    )
    :vars
    (
      ?auto_4941 - HOIST
      ?auto_4940 - PLACE
      ?auto_4942 - PLACE
      ?auto_4938 - HOIST
      ?auto_4939 - SURFACE
      ?auto_4937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4941 ?auto_4940 ) ( SURFACE-AT ?auto_4935 ?auto_4940 ) ( CLEAR ?auto_4935 ) ( IS-CRATE ?auto_4936 ) ( not ( = ?auto_4935 ?auto_4936 ) ) ( AVAILABLE ?auto_4941 ) ( ON ?auto_4935 ?auto_4934 ) ( not ( = ?auto_4934 ?auto_4935 ) ) ( not ( = ?auto_4934 ?auto_4936 ) ) ( not ( = ?auto_4942 ?auto_4940 ) ) ( HOIST-AT ?auto_4938 ?auto_4942 ) ( not ( = ?auto_4941 ?auto_4938 ) ) ( AVAILABLE ?auto_4938 ) ( SURFACE-AT ?auto_4936 ?auto_4942 ) ( ON ?auto_4936 ?auto_4939 ) ( CLEAR ?auto_4936 ) ( not ( = ?auto_4935 ?auto_4939 ) ) ( not ( = ?auto_4936 ?auto_4939 ) ) ( not ( = ?auto_4934 ?auto_4939 ) ) ( TRUCK-AT ?auto_4937 ?auto_4940 ) ( ON ?auto_4934 ?auto_4933 ) ( not ( = ?auto_4933 ?auto_4934 ) ) ( not ( = ?auto_4933 ?auto_4935 ) ) ( not ( = ?auto_4933 ?auto_4936 ) ) ( not ( = ?auto_4933 ?auto_4939 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4934 ?auto_4935 ?auto_4936 )
      ( MAKE-3CRATE-VERIFY ?auto_4933 ?auto_4934 ?auto_4935 ?auto_4936 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4943 - SURFACE
      ?auto_4944 - SURFACE
    )
    :vars
    (
      ?auto_4950 - HOIST
      ?auto_4949 - PLACE
      ?auto_4947 - SURFACE
      ?auto_4951 - PLACE
      ?auto_4946 - HOIST
      ?auto_4948 - SURFACE
      ?auto_4945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4950 ?auto_4949 ) ( IS-CRATE ?auto_4944 ) ( not ( = ?auto_4943 ?auto_4944 ) ) ( not ( = ?auto_4947 ?auto_4943 ) ) ( not ( = ?auto_4947 ?auto_4944 ) ) ( not ( = ?auto_4951 ?auto_4949 ) ) ( HOIST-AT ?auto_4946 ?auto_4951 ) ( not ( = ?auto_4950 ?auto_4946 ) ) ( AVAILABLE ?auto_4946 ) ( SURFACE-AT ?auto_4944 ?auto_4951 ) ( ON ?auto_4944 ?auto_4948 ) ( CLEAR ?auto_4944 ) ( not ( = ?auto_4943 ?auto_4948 ) ) ( not ( = ?auto_4944 ?auto_4948 ) ) ( not ( = ?auto_4947 ?auto_4948 ) ) ( TRUCK-AT ?auto_4945 ?auto_4949 ) ( SURFACE-AT ?auto_4947 ?auto_4949 ) ( CLEAR ?auto_4947 ) ( LIFTING ?auto_4950 ?auto_4943 ) ( IS-CRATE ?auto_4943 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4947 ?auto_4943 )
      ( MAKE-2CRATE ?auto_4947 ?auto_4943 ?auto_4944 )
      ( MAKE-1CRATE-VERIFY ?auto_4943 ?auto_4944 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4952 - SURFACE
      ?auto_4953 - SURFACE
      ?auto_4954 - SURFACE
    )
    :vars
    (
      ?auto_4960 - HOIST
      ?auto_4958 - PLACE
      ?auto_4957 - PLACE
      ?auto_4956 - HOIST
      ?auto_4955 - SURFACE
      ?auto_4959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4960 ?auto_4958 ) ( IS-CRATE ?auto_4954 ) ( not ( = ?auto_4953 ?auto_4954 ) ) ( not ( = ?auto_4952 ?auto_4953 ) ) ( not ( = ?auto_4952 ?auto_4954 ) ) ( not ( = ?auto_4957 ?auto_4958 ) ) ( HOIST-AT ?auto_4956 ?auto_4957 ) ( not ( = ?auto_4960 ?auto_4956 ) ) ( AVAILABLE ?auto_4956 ) ( SURFACE-AT ?auto_4954 ?auto_4957 ) ( ON ?auto_4954 ?auto_4955 ) ( CLEAR ?auto_4954 ) ( not ( = ?auto_4953 ?auto_4955 ) ) ( not ( = ?auto_4954 ?auto_4955 ) ) ( not ( = ?auto_4952 ?auto_4955 ) ) ( TRUCK-AT ?auto_4959 ?auto_4958 ) ( SURFACE-AT ?auto_4952 ?auto_4958 ) ( CLEAR ?auto_4952 ) ( LIFTING ?auto_4960 ?auto_4953 ) ( IS-CRATE ?auto_4953 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4953 ?auto_4954 )
      ( MAKE-2CRATE-VERIFY ?auto_4952 ?auto_4953 ?auto_4954 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4961 - SURFACE
      ?auto_4962 - SURFACE
      ?auto_4963 - SURFACE
      ?auto_4964 - SURFACE
    )
    :vars
    (
      ?auto_4965 - HOIST
      ?auto_4970 - PLACE
      ?auto_4967 - PLACE
      ?auto_4969 - HOIST
      ?auto_4968 - SURFACE
      ?auto_4966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4965 ?auto_4970 ) ( IS-CRATE ?auto_4964 ) ( not ( = ?auto_4963 ?auto_4964 ) ) ( not ( = ?auto_4962 ?auto_4963 ) ) ( not ( = ?auto_4962 ?auto_4964 ) ) ( not ( = ?auto_4967 ?auto_4970 ) ) ( HOIST-AT ?auto_4969 ?auto_4967 ) ( not ( = ?auto_4965 ?auto_4969 ) ) ( AVAILABLE ?auto_4969 ) ( SURFACE-AT ?auto_4964 ?auto_4967 ) ( ON ?auto_4964 ?auto_4968 ) ( CLEAR ?auto_4964 ) ( not ( = ?auto_4963 ?auto_4968 ) ) ( not ( = ?auto_4964 ?auto_4968 ) ) ( not ( = ?auto_4962 ?auto_4968 ) ) ( TRUCK-AT ?auto_4966 ?auto_4970 ) ( SURFACE-AT ?auto_4962 ?auto_4970 ) ( CLEAR ?auto_4962 ) ( LIFTING ?auto_4965 ?auto_4963 ) ( IS-CRATE ?auto_4963 ) ( ON ?auto_4962 ?auto_4961 ) ( not ( = ?auto_4961 ?auto_4962 ) ) ( not ( = ?auto_4961 ?auto_4963 ) ) ( not ( = ?auto_4961 ?auto_4964 ) ) ( not ( = ?auto_4961 ?auto_4968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4962 ?auto_4963 ?auto_4964 )
      ( MAKE-3CRATE-VERIFY ?auto_4961 ?auto_4962 ?auto_4963 ?auto_4964 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4971 - SURFACE
      ?auto_4972 - SURFACE
    )
    :vars
    (
      ?auto_4973 - HOIST
      ?auto_4979 - PLACE
      ?auto_4977 - SURFACE
      ?auto_4975 - PLACE
      ?auto_4978 - HOIST
      ?auto_4976 - SURFACE
      ?auto_4974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4973 ?auto_4979 ) ( IS-CRATE ?auto_4972 ) ( not ( = ?auto_4971 ?auto_4972 ) ) ( not ( = ?auto_4977 ?auto_4971 ) ) ( not ( = ?auto_4977 ?auto_4972 ) ) ( not ( = ?auto_4975 ?auto_4979 ) ) ( HOIST-AT ?auto_4978 ?auto_4975 ) ( not ( = ?auto_4973 ?auto_4978 ) ) ( AVAILABLE ?auto_4978 ) ( SURFACE-AT ?auto_4972 ?auto_4975 ) ( ON ?auto_4972 ?auto_4976 ) ( CLEAR ?auto_4972 ) ( not ( = ?auto_4971 ?auto_4976 ) ) ( not ( = ?auto_4972 ?auto_4976 ) ) ( not ( = ?auto_4977 ?auto_4976 ) ) ( TRUCK-AT ?auto_4974 ?auto_4979 ) ( SURFACE-AT ?auto_4977 ?auto_4979 ) ( CLEAR ?auto_4977 ) ( IS-CRATE ?auto_4971 ) ( AVAILABLE ?auto_4973 ) ( IN ?auto_4971 ?auto_4974 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4973 ?auto_4971 ?auto_4974 ?auto_4979 )
      ( MAKE-2CRATE ?auto_4977 ?auto_4971 ?auto_4972 )
      ( MAKE-1CRATE-VERIFY ?auto_4971 ?auto_4972 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4980 - SURFACE
      ?auto_4981 - SURFACE
      ?auto_4982 - SURFACE
    )
    :vars
    (
      ?auto_4986 - HOIST
      ?auto_4987 - PLACE
      ?auto_4984 - PLACE
      ?auto_4985 - HOIST
      ?auto_4988 - SURFACE
      ?auto_4983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4986 ?auto_4987 ) ( IS-CRATE ?auto_4982 ) ( not ( = ?auto_4981 ?auto_4982 ) ) ( not ( = ?auto_4980 ?auto_4981 ) ) ( not ( = ?auto_4980 ?auto_4982 ) ) ( not ( = ?auto_4984 ?auto_4987 ) ) ( HOIST-AT ?auto_4985 ?auto_4984 ) ( not ( = ?auto_4986 ?auto_4985 ) ) ( AVAILABLE ?auto_4985 ) ( SURFACE-AT ?auto_4982 ?auto_4984 ) ( ON ?auto_4982 ?auto_4988 ) ( CLEAR ?auto_4982 ) ( not ( = ?auto_4981 ?auto_4988 ) ) ( not ( = ?auto_4982 ?auto_4988 ) ) ( not ( = ?auto_4980 ?auto_4988 ) ) ( TRUCK-AT ?auto_4983 ?auto_4987 ) ( SURFACE-AT ?auto_4980 ?auto_4987 ) ( CLEAR ?auto_4980 ) ( IS-CRATE ?auto_4981 ) ( AVAILABLE ?auto_4986 ) ( IN ?auto_4981 ?auto_4983 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4981 ?auto_4982 )
      ( MAKE-2CRATE-VERIFY ?auto_4980 ?auto_4981 ?auto_4982 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4989 - SURFACE
      ?auto_4990 - SURFACE
      ?auto_4991 - SURFACE
      ?auto_4992 - SURFACE
    )
    :vars
    (
      ?auto_4995 - HOIST
      ?auto_4993 - PLACE
      ?auto_4997 - PLACE
      ?auto_4996 - HOIST
      ?auto_4994 - SURFACE
      ?auto_4998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4995 ?auto_4993 ) ( IS-CRATE ?auto_4992 ) ( not ( = ?auto_4991 ?auto_4992 ) ) ( not ( = ?auto_4990 ?auto_4991 ) ) ( not ( = ?auto_4990 ?auto_4992 ) ) ( not ( = ?auto_4997 ?auto_4993 ) ) ( HOIST-AT ?auto_4996 ?auto_4997 ) ( not ( = ?auto_4995 ?auto_4996 ) ) ( AVAILABLE ?auto_4996 ) ( SURFACE-AT ?auto_4992 ?auto_4997 ) ( ON ?auto_4992 ?auto_4994 ) ( CLEAR ?auto_4992 ) ( not ( = ?auto_4991 ?auto_4994 ) ) ( not ( = ?auto_4992 ?auto_4994 ) ) ( not ( = ?auto_4990 ?auto_4994 ) ) ( TRUCK-AT ?auto_4998 ?auto_4993 ) ( SURFACE-AT ?auto_4990 ?auto_4993 ) ( CLEAR ?auto_4990 ) ( IS-CRATE ?auto_4991 ) ( AVAILABLE ?auto_4995 ) ( IN ?auto_4991 ?auto_4998 ) ( ON ?auto_4990 ?auto_4989 ) ( not ( = ?auto_4989 ?auto_4990 ) ) ( not ( = ?auto_4989 ?auto_4991 ) ) ( not ( = ?auto_4989 ?auto_4992 ) ) ( not ( = ?auto_4989 ?auto_4994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4990 ?auto_4991 ?auto_4992 )
      ( MAKE-3CRATE-VERIFY ?auto_4989 ?auto_4990 ?auto_4991 ?auto_4992 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4999 - SURFACE
      ?auto_5000 - SURFACE
    )
    :vars
    (
      ?auto_5004 - HOIST
      ?auto_5002 - PLACE
      ?auto_5001 - SURFACE
      ?auto_5006 - PLACE
      ?auto_5005 - HOIST
      ?auto_5003 - SURFACE
      ?auto_5007 - TRUCK
      ?auto_5008 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5004 ?auto_5002 ) ( IS-CRATE ?auto_5000 ) ( not ( = ?auto_4999 ?auto_5000 ) ) ( not ( = ?auto_5001 ?auto_4999 ) ) ( not ( = ?auto_5001 ?auto_5000 ) ) ( not ( = ?auto_5006 ?auto_5002 ) ) ( HOIST-AT ?auto_5005 ?auto_5006 ) ( not ( = ?auto_5004 ?auto_5005 ) ) ( AVAILABLE ?auto_5005 ) ( SURFACE-AT ?auto_5000 ?auto_5006 ) ( ON ?auto_5000 ?auto_5003 ) ( CLEAR ?auto_5000 ) ( not ( = ?auto_4999 ?auto_5003 ) ) ( not ( = ?auto_5000 ?auto_5003 ) ) ( not ( = ?auto_5001 ?auto_5003 ) ) ( SURFACE-AT ?auto_5001 ?auto_5002 ) ( CLEAR ?auto_5001 ) ( IS-CRATE ?auto_4999 ) ( AVAILABLE ?auto_5004 ) ( IN ?auto_4999 ?auto_5007 ) ( TRUCK-AT ?auto_5007 ?auto_5008 ) ( not ( = ?auto_5008 ?auto_5002 ) ) ( not ( = ?auto_5006 ?auto_5008 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5007 ?auto_5008 ?auto_5002 )
      ( MAKE-2CRATE ?auto_5001 ?auto_4999 ?auto_5000 )
      ( MAKE-1CRATE-VERIFY ?auto_4999 ?auto_5000 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5009 - SURFACE
      ?auto_5010 - SURFACE
      ?auto_5011 - SURFACE
    )
    :vars
    (
      ?auto_5014 - HOIST
      ?auto_5012 - PLACE
      ?auto_5013 - PLACE
      ?auto_5015 - HOIST
      ?auto_5018 - SURFACE
      ?auto_5016 - TRUCK
      ?auto_5017 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5014 ?auto_5012 ) ( IS-CRATE ?auto_5011 ) ( not ( = ?auto_5010 ?auto_5011 ) ) ( not ( = ?auto_5009 ?auto_5010 ) ) ( not ( = ?auto_5009 ?auto_5011 ) ) ( not ( = ?auto_5013 ?auto_5012 ) ) ( HOIST-AT ?auto_5015 ?auto_5013 ) ( not ( = ?auto_5014 ?auto_5015 ) ) ( AVAILABLE ?auto_5015 ) ( SURFACE-AT ?auto_5011 ?auto_5013 ) ( ON ?auto_5011 ?auto_5018 ) ( CLEAR ?auto_5011 ) ( not ( = ?auto_5010 ?auto_5018 ) ) ( not ( = ?auto_5011 ?auto_5018 ) ) ( not ( = ?auto_5009 ?auto_5018 ) ) ( SURFACE-AT ?auto_5009 ?auto_5012 ) ( CLEAR ?auto_5009 ) ( IS-CRATE ?auto_5010 ) ( AVAILABLE ?auto_5014 ) ( IN ?auto_5010 ?auto_5016 ) ( TRUCK-AT ?auto_5016 ?auto_5017 ) ( not ( = ?auto_5017 ?auto_5012 ) ) ( not ( = ?auto_5013 ?auto_5017 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5010 ?auto_5011 )
      ( MAKE-2CRATE-VERIFY ?auto_5009 ?auto_5010 ?auto_5011 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5019 - SURFACE
      ?auto_5020 - SURFACE
      ?auto_5021 - SURFACE
      ?auto_5022 - SURFACE
    )
    :vars
    (
      ?auto_5029 - HOIST
      ?auto_5023 - PLACE
      ?auto_5027 - PLACE
      ?auto_5026 - HOIST
      ?auto_5024 - SURFACE
      ?auto_5025 - TRUCK
      ?auto_5028 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5029 ?auto_5023 ) ( IS-CRATE ?auto_5022 ) ( not ( = ?auto_5021 ?auto_5022 ) ) ( not ( = ?auto_5020 ?auto_5021 ) ) ( not ( = ?auto_5020 ?auto_5022 ) ) ( not ( = ?auto_5027 ?auto_5023 ) ) ( HOIST-AT ?auto_5026 ?auto_5027 ) ( not ( = ?auto_5029 ?auto_5026 ) ) ( AVAILABLE ?auto_5026 ) ( SURFACE-AT ?auto_5022 ?auto_5027 ) ( ON ?auto_5022 ?auto_5024 ) ( CLEAR ?auto_5022 ) ( not ( = ?auto_5021 ?auto_5024 ) ) ( not ( = ?auto_5022 ?auto_5024 ) ) ( not ( = ?auto_5020 ?auto_5024 ) ) ( SURFACE-AT ?auto_5020 ?auto_5023 ) ( CLEAR ?auto_5020 ) ( IS-CRATE ?auto_5021 ) ( AVAILABLE ?auto_5029 ) ( IN ?auto_5021 ?auto_5025 ) ( TRUCK-AT ?auto_5025 ?auto_5028 ) ( not ( = ?auto_5028 ?auto_5023 ) ) ( not ( = ?auto_5027 ?auto_5028 ) ) ( ON ?auto_5020 ?auto_5019 ) ( not ( = ?auto_5019 ?auto_5020 ) ) ( not ( = ?auto_5019 ?auto_5021 ) ) ( not ( = ?auto_5019 ?auto_5022 ) ) ( not ( = ?auto_5019 ?auto_5024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5020 ?auto_5021 ?auto_5022 )
      ( MAKE-3CRATE-VERIFY ?auto_5019 ?auto_5020 ?auto_5021 ?auto_5022 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5030 - SURFACE
      ?auto_5031 - SURFACE
    )
    :vars
    (
      ?auto_5038 - HOIST
      ?auto_5032 - PLACE
      ?auto_5039 - SURFACE
      ?auto_5036 - PLACE
      ?auto_5035 - HOIST
      ?auto_5033 - SURFACE
      ?auto_5034 - TRUCK
      ?auto_5037 - PLACE
      ?auto_5040 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5038 ?auto_5032 ) ( IS-CRATE ?auto_5031 ) ( not ( = ?auto_5030 ?auto_5031 ) ) ( not ( = ?auto_5039 ?auto_5030 ) ) ( not ( = ?auto_5039 ?auto_5031 ) ) ( not ( = ?auto_5036 ?auto_5032 ) ) ( HOIST-AT ?auto_5035 ?auto_5036 ) ( not ( = ?auto_5038 ?auto_5035 ) ) ( AVAILABLE ?auto_5035 ) ( SURFACE-AT ?auto_5031 ?auto_5036 ) ( ON ?auto_5031 ?auto_5033 ) ( CLEAR ?auto_5031 ) ( not ( = ?auto_5030 ?auto_5033 ) ) ( not ( = ?auto_5031 ?auto_5033 ) ) ( not ( = ?auto_5039 ?auto_5033 ) ) ( SURFACE-AT ?auto_5039 ?auto_5032 ) ( CLEAR ?auto_5039 ) ( IS-CRATE ?auto_5030 ) ( AVAILABLE ?auto_5038 ) ( TRUCK-AT ?auto_5034 ?auto_5037 ) ( not ( = ?auto_5037 ?auto_5032 ) ) ( not ( = ?auto_5036 ?auto_5037 ) ) ( HOIST-AT ?auto_5040 ?auto_5037 ) ( LIFTING ?auto_5040 ?auto_5030 ) ( not ( = ?auto_5038 ?auto_5040 ) ) ( not ( = ?auto_5035 ?auto_5040 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5040 ?auto_5030 ?auto_5034 ?auto_5037 )
      ( MAKE-2CRATE ?auto_5039 ?auto_5030 ?auto_5031 )
      ( MAKE-1CRATE-VERIFY ?auto_5030 ?auto_5031 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5041 - SURFACE
      ?auto_5042 - SURFACE
      ?auto_5043 - SURFACE
    )
    :vars
    (
      ?auto_5051 - HOIST
      ?auto_5049 - PLACE
      ?auto_5045 - PLACE
      ?auto_5050 - HOIST
      ?auto_5044 - SURFACE
      ?auto_5048 - TRUCK
      ?auto_5046 - PLACE
      ?auto_5047 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5051 ?auto_5049 ) ( IS-CRATE ?auto_5043 ) ( not ( = ?auto_5042 ?auto_5043 ) ) ( not ( = ?auto_5041 ?auto_5042 ) ) ( not ( = ?auto_5041 ?auto_5043 ) ) ( not ( = ?auto_5045 ?auto_5049 ) ) ( HOIST-AT ?auto_5050 ?auto_5045 ) ( not ( = ?auto_5051 ?auto_5050 ) ) ( AVAILABLE ?auto_5050 ) ( SURFACE-AT ?auto_5043 ?auto_5045 ) ( ON ?auto_5043 ?auto_5044 ) ( CLEAR ?auto_5043 ) ( not ( = ?auto_5042 ?auto_5044 ) ) ( not ( = ?auto_5043 ?auto_5044 ) ) ( not ( = ?auto_5041 ?auto_5044 ) ) ( SURFACE-AT ?auto_5041 ?auto_5049 ) ( CLEAR ?auto_5041 ) ( IS-CRATE ?auto_5042 ) ( AVAILABLE ?auto_5051 ) ( TRUCK-AT ?auto_5048 ?auto_5046 ) ( not ( = ?auto_5046 ?auto_5049 ) ) ( not ( = ?auto_5045 ?auto_5046 ) ) ( HOIST-AT ?auto_5047 ?auto_5046 ) ( LIFTING ?auto_5047 ?auto_5042 ) ( not ( = ?auto_5051 ?auto_5047 ) ) ( not ( = ?auto_5050 ?auto_5047 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5042 ?auto_5043 )
      ( MAKE-2CRATE-VERIFY ?auto_5041 ?auto_5042 ?auto_5043 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5052 - SURFACE
      ?auto_5053 - SURFACE
      ?auto_5054 - SURFACE
      ?auto_5055 - SURFACE
    )
    :vars
    (
      ?auto_5058 - HOIST
      ?auto_5061 - PLACE
      ?auto_5056 - PLACE
      ?auto_5059 - HOIST
      ?auto_5057 - SURFACE
      ?auto_5060 - TRUCK
      ?auto_5063 - PLACE
      ?auto_5062 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5058 ?auto_5061 ) ( IS-CRATE ?auto_5055 ) ( not ( = ?auto_5054 ?auto_5055 ) ) ( not ( = ?auto_5053 ?auto_5054 ) ) ( not ( = ?auto_5053 ?auto_5055 ) ) ( not ( = ?auto_5056 ?auto_5061 ) ) ( HOIST-AT ?auto_5059 ?auto_5056 ) ( not ( = ?auto_5058 ?auto_5059 ) ) ( AVAILABLE ?auto_5059 ) ( SURFACE-AT ?auto_5055 ?auto_5056 ) ( ON ?auto_5055 ?auto_5057 ) ( CLEAR ?auto_5055 ) ( not ( = ?auto_5054 ?auto_5057 ) ) ( not ( = ?auto_5055 ?auto_5057 ) ) ( not ( = ?auto_5053 ?auto_5057 ) ) ( SURFACE-AT ?auto_5053 ?auto_5061 ) ( CLEAR ?auto_5053 ) ( IS-CRATE ?auto_5054 ) ( AVAILABLE ?auto_5058 ) ( TRUCK-AT ?auto_5060 ?auto_5063 ) ( not ( = ?auto_5063 ?auto_5061 ) ) ( not ( = ?auto_5056 ?auto_5063 ) ) ( HOIST-AT ?auto_5062 ?auto_5063 ) ( LIFTING ?auto_5062 ?auto_5054 ) ( not ( = ?auto_5058 ?auto_5062 ) ) ( not ( = ?auto_5059 ?auto_5062 ) ) ( ON ?auto_5053 ?auto_5052 ) ( not ( = ?auto_5052 ?auto_5053 ) ) ( not ( = ?auto_5052 ?auto_5054 ) ) ( not ( = ?auto_5052 ?auto_5055 ) ) ( not ( = ?auto_5052 ?auto_5057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5053 ?auto_5054 ?auto_5055 )
      ( MAKE-3CRATE-VERIFY ?auto_5052 ?auto_5053 ?auto_5054 ?auto_5055 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5064 - SURFACE
      ?auto_5065 - SURFACE
    )
    :vars
    (
      ?auto_5069 - HOIST
      ?auto_5072 - PLACE
      ?auto_5068 - SURFACE
      ?auto_5066 - PLACE
      ?auto_5070 - HOIST
      ?auto_5067 - SURFACE
      ?auto_5071 - TRUCK
      ?auto_5074 - PLACE
      ?auto_5073 - HOIST
      ?auto_5075 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5069 ?auto_5072 ) ( IS-CRATE ?auto_5065 ) ( not ( = ?auto_5064 ?auto_5065 ) ) ( not ( = ?auto_5068 ?auto_5064 ) ) ( not ( = ?auto_5068 ?auto_5065 ) ) ( not ( = ?auto_5066 ?auto_5072 ) ) ( HOIST-AT ?auto_5070 ?auto_5066 ) ( not ( = ?auto_5069 ?auto_5070 ) ) ( AVAILABLE ?auto_5070 ) ( SURFACE-AT ?auto_5065 ?auto_5066 ) ( ON ?auto_5065 ?auto_5067 ) ( CLEAR ?auto_5065 ) ( not ( = ?auto_5064 ?auto_5067 ) ) ( not ( = ?auto_5065 ?auto_5067 ) ) ( not ( = ?auto_5068 ?auto_5067 ) ) ( SURFACE-AT ?auto_5068 ?auto_5072 ) ( CLEAR ?auto_5068 ) ( IS-CRATE ?auto_5064 ) ( AVAILABLE ?auto_5069 ) ( TRUCK-AT ?auto_5071 ?auto_5074 ) ( not ( = ?auto_5074 ?auto_5072 ) ) ( not ( = ?auto_5066 ?auto_5074 ) ) ( HOIST-AT ?auto_5073 ?auto_5074 ) ( not ( = ?auto_5069 ?auto_5073 ) ) ( not ( = ?auto_5070 ?auto_5073 ) ) ( AVAILABLE ?auto_5073 ) ( SURFACE-AT ?auto_5064 ?auto_5074 ) ( ON ?auto_5064 ?auto_5075 ) ( CLEAR ?auto_5064 ) ( not ( = ?auto_5064 ?auto_5075 ) ) ( not ( = ?auto_5065 ?auto_5075 ) ) ( not ( = ?auto_5068 ?auto_5075 ) ) ( not ( = ?auto_5067 ?auto_5075 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5073 ?auto_5064 ?auto_5075 ?auto_5074 )
      ( MAKE-2CRATE ?auto_5068 ?auto_5064 ?auto_5065 )
      ( MAKE-1CRATE-VERIFY ?auto_5064 ?auto_5065 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5076 - SURFACE
      ?auto_5077 - SURFACE
      ?auto_5078 - SURFACE
    )
    :vars
    (
      ?auto_5082 - HOIST
      ?auto_5079 - PLACE
      ?auto_5081 - PLACE
      ?auto_5087 - HOIST
      ?auto_5084 - SURFACE
      ?auto_5080 - TRUCK
      ?auto_5086 - PLACE
      ?auto_5083 - HOIST
      ?auto_5085 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5082 ?auto_5079 ) ( IS-CRATE ?auto_5078 ) ( not ( = ?auto_5077 ?auto_5078 ) ) ( not ( = ?auto_5076 ?auto_5077 ) ) ( not ( = ?auto_5076 ?auto_5078 ) ) ( not ( = ?auto_5081 ?auto_5079 ) ) ( HOIST-AT ?auto_5087 ?auto_5081 ) ( not ( = ?auto_5082 ?auto_5087 ) ) ( AVAILABLE ?auto_5087 ) ( SURFACE-AT ?auto_5078 ?auto_5081 ) ( ON ?auto_5078 ?auto_5084 ) ( CLEAR ?auto_5078 ) ( not ( = ?auto_5077 ?auto_5084 ) ) ( not ( = ?auto_5078 ?auto_5084 ) ) ( not ( = ?auto_5076 ?auto_5084 ) ) ( SURFACE-AT ?auto_5076 ?auto_5079 ) ( CLEAR ?auto_5076 ) ( IS-CRATE ?auto_5077 ) ( AVAILABLE ?auto_5082 ) ( TRUCK-AT ?auto_5080 ?auto_5086 ) ( not ( = ?auto_5086 ?auto_5079 ) ) ( not ( = ?auto_5081 ?auto_5086 ) ) ( HOIST-AT ?auto_5083 ?auto_5086 ) ( not ( = ?auto_5082 ?auto_5083 ) ) ( not ( = ?auto_5087 ?auto_5083 ) ) ( AVAILABLE ?auto_5083 ) ( SURFACE-AT ?auto_5077 ?auto_5086 ) ( ON ?auto_5077 ?auto_5085 ) ( CLEAR ?auto_5077 ) ( not ( = ?auto_5077 ?auto_5085 ) ) ( not ( = ?auto_5078 ?auto_5085 ) ) ( not ( = ?auto_5076 ?auto_5085 ) ) ( not ( = ?auto_5084 ?auto_5085 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5077 ?auto_5078 )
      ( MAKE-2CRATE-VERIFY ?auto_5076 ?auto_5077 ?auto_5078 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5088 - SURFACE
      ?auto_5089 - SURFACE
      ?auto_5090 - SURFACE
      ?auto_5091 - SURFACE
    )
    :vars
    (
      ?auto_5092 - HOIST
      ?auto_5093 - PLACE
      ?auto_5100 - PLACE
      ?auto_5096 - HOIST
      ?auto_5098 - SURFACE
      ?auto_5097 - TRUCK
      ?auto_5099 - PLACE
      ?auto_5095 - HOIST
      ?auto_5094 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5092 ?auto_5093 ) ( IS-CRATE ?auto_5091 ) ( not ( = ?auto_5090 ?auto_5091 ) ) ( not ( = ?auto_5089 ?auto_5090 ) ) ( not ( = ?auto_5089 ?auto_5091 ) ) ( not ( = ?auto_5100 ?auto_5093 ) ) ( HOIST-AT ?auto_5096 ?auto_5100 ) ( not ( = ?auto_5092 ?auto_5096 ) ) ( AVAILABLE ?auto_5096 ) ( SURFACE-AT ?auto_5091 ?auto_5100 ) ( ON ?auto_5091 ?auto_5098 ) ( CLEAR ?auto_5091 ) ( not ( = ?auto_5090 ?auto_5098 ) ) ( not ( = ?auto_5091 ?auto_5098 ) ) ( not ( = ?auto_5089 ?auto_5098 ) ) ( SURFACE-AT ?auto_5089 ?auto_5093 ) ( CLEAR ?auto_5089 ) ( IS-CRATE ?auto_5090 ) ( AVAILABLE ?auto_5092 ) ( TRUCK-AT ?auto_5097 ?auto_5099 ) ( not ( = ?auto_5099 ?auto_5093 ) ) ( not ( = ?auto_5100 ?auto_5099 ) ) ( HOIST-AT ?auto_5095 ?auto_5099 ) ( not ( = ?auto_5092 ?auto_5095 ) ) ( not ( = ?auto_5096 ?auto_5095 ) ) ( AVAILABLE ?auto_5095 ) ( SURFACE-AT ?auto_5090 ?auto_5099 ) ( ON ?auto_5090 ?auto_5094 ) ( CLEAR ?auto_5090 ) ( not ( = ?auto_5090 ?auto_5094 ) ) ( not ( = ?auto_5091 ?auto_5094 ) ) ( not ( = ?auto_5089 ?auto_5094 ) ) ( not ( = ?auto_5098 ?auto_5094 ) ) ( ON ?auto_5089 ?auto_5088 ) ( not ( = ?auto_5088 ?auto_5089 ) ) ( not ( = ?auto_5088 ?auto_5090 ) ) ( not ( = ?auto_5088 ?auto_5091 ) ) ( not ( = ?auto_5088 ?auto_5098 ) ) ( not ( = ?auto_5088 ?auto_5094 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5089 ?auto_5090 ?auto_5091 )
      ( MAKE-3CRATE-VERIFY ?auto_5088 ?auto_5089 ?auto_5090 ?auto_5091 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5101 - SURFACE
      ?auto_5102 - SURFACE
    )
    :vars
    (
      ?auto_5103 - HOIST
      ?auto_5104 - PLACE
      ?auto_5110 - SURFACE
      ?auto_5112 - PLACE
      ?auto_5107 - HOIST
      ?auto_5109 - SURFACE
      ?auto_5111 - PLACE
      ?auto_5106 - HOIST
      ?auto_5105 - SURFACE
      ?auto_5108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5103 ?auto_5104 ) ( IS-CRATE ?auto_5102 ) ( not ( = ?auto_5101 ?auto_5102 ) ) ( not ( = ?auto_5110 ?auto_5101 ) ) ( not ( = ?auto_5110 ?auto_5102 ) ) ( not ( = ?auto_5112 ?auto_5104 ) ) ( HOIST-AT ?auto_5107 ?auto_5112 ) ( not ( = ?auto_5103 ?auto_5107 ) ) ( AVAILABLE ?auto_5107 ) ( SURFACE-AT ?auto_5102 ?auto_5112 ) ( ON ?auto_5102 ?auto_5109 ) ( CLEAR ?auto_5102 ) ( not ( = ?auto_5101 ?auto_5109 ) ) ( not ( = ?auto_5102 ?auto_5109 ) ) ( not ( = ?auto_5110 ?auto_5109 ) ) ( SURFACE-AT ?auto_5110 ?auto_5104 ) ( CLEAR ?auto_5110 ) ( IS-CRATE ?auto_5101 ) ( AVAILABLE ?auto_5103 ) ( not ( = ?auto_5111 ?auto_5104 ) ) ( not ( = ?auto_5112 ?auto_5111 ) ) ( HOIST-AT ?auto_5106 ?auto_5111 ) ( not ( = ?auto_5103 ?auto_5106 ) ) ( not ( = ?auto_5107 ?auto_5106 ) ) ( AVAILABLE ?auto_5106 ) ( SURFACE-AT ?auto_5101 ?auto_5111 ) ( ON ?auto_5101 ?auto_5105 ) ( CLEAR ?auto_5101 ) ( not ( = ?auto_5101 ?auto_5105 ) ) ( not ( = ?auto_5102 ?auto_5105 ) ) ( not ( = ?auto_5110 ?auto_5105 ) ) ( not ( = ?auto_5109 ?auto_5105 ) ) ( TRUCK-AT ?auto_5108 ?auto_5104 ) )
    :subtasks
    ( ( !DRIVE ?auto_5108 ?auto_5104 ?auto_5111 )
      ( MAKE-2CRATE ?auto_5110 ?auto_5101 ?auto_5102 )
      ( MAKE-1CRATE-VERIFY ?auto_5101 ?auto_5102 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5113 - SURFACE
      ?auto_5114 - SURFACE
      ?auto_5115 - SURFACE
    )
    :vars
    (
      ?auto_5118 - HOIST
      ?auto_5117 - PLACE
      ?auto_5120 - PLACE
      ?auto_5119 - HOIST
      ?auto_5121 - SURFACE
      ?auto_5116 - PLACE
      ?auto_5123 - HOIST
      ?auto_5122 - SURFACE
      ?auto_5124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5118 ?auto_5117 ) ( IS-CRATE ?auto_5115 ) ( not ( = ?auto_5114 ?auto_5115 ) ) ( not ( = ?auto_5113 ?auto_5114 ) ) ( not ( = ?auto_5113 ?auto_5115 ) ) ( not ( = ?auto_5120 ?auto_5117 ) ) ( HOIST-AT ?auto_5119 ?auto_5120 ) ( not ( = ?auto_5118 ?auto_5119 ) ) ( AVAILABLE ?auto_5119 ) ( SURFACE-AT ?auto_5115 ?auto_5120 ) ( ON ?auto_5115 ?auto_5121 ) ( CLEAR ?auto_5115 ) ( not ( = ?auto_5114 ?auto_5121 ) ) ( not ( = ?auto_5115 ?auto_5121 ) ) ( not ( = ?auto_5113 ?auto_5121 ) ) ( SURFACE-AT ?auto_5113 ?auto_5117 ) ( CLEAR ?auto_5113 ) ( IS-CRATE ?auto_5114 ) ( AVAILABLE ?auto_5118 ) ( not ( = ?auto_5116 ?auto_5117 ) ) ( not ( = ?auto_5120 ?auto_5116 ) ) ( HOIST-AT ?auto_5123 ?auto_5116 ) ( not ( = ?auto_5118 ?auto_5123 ) ) ( not ( = ?auto_5119 ?auto_5123 ) ) ( AVAILABLE ?auto_5123 ) ( SURFACE-AT ?auto_5114 ?auto_5116 ) ( ON ?auto_5114 ?auto_5122 ) ( CLEAR ?auto_5114 ) ( not ( = ?auto_5114 ?auto_5122 ) ) ( not ( = ?auto_5115 ?auto_5122 ) ) ( not ( = ?auto_5113 ?auto_5122 ) ) ( not ( = ?auto_5121 ?auto_5122 ) ) ( TRUCK-AT ?auto_5124 ?auto_5117 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5114 ?auto_5115 )
      ( MAKE-2CRATE-VERIFY ?auto_5113 ?auto_5114 ?auto_5115 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5125 - SURFACE
      ?auto_5126 - SURFACE
      ?auto_5127 - SURFACE
      ?auto_5128 - SURFACE
    )
    :vars
    (
      ?auto_5137 - HOIST
      ?auto_5134 - PLACE
      ?auto_5133 - PLACE
      ?auto_5131 - HOIST
      ?auto_5130 - SURFACE
      ?auto_5129 - PLACE
      ?auto_5135 - HOIST
      ?auto_5136 - SURFACE
      ?auto_5132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5137 ?auto_5134 ) ( IS-CRATE ?auto_5128 ) ( not ( = ?auto_5127 ?auto_5128 ) ) ( not ( = ?auto_5126 ?auto_5127 ) ) ( not ( = ?auto_5126 ?auto_5128 ) ) ( not ( = ?auto_5133 ?auto_5134 ) ) ( HOIST-AT ?auto_5131 ?auto_5133 ) ( not ( = ?auto_5137 ?auto_5131 ) ) ( AVAILABLE ?auto_5131 ) ( SURFACE-AT ?auto_5128 ?auto_5133 ) ( ON ?auto_5128 ?auto_5130 ) ( CLEAR ?auto_5128 ) ( not ( = ?auto_5127 ?auto_5130 ) ) ( not ( = ?auto_5128 ?auto_5130 ) ) ( not ( = ?auto_5126 ?auto_5130 ) ) ( SURFACE-AT ?auto_5126 ?auto_5134 ) ( CLEAR ?auto_5126 ) ( IS-CRATE ?auto_5127 ) ( AVAILABLE ?auto_5137 ) ( not ( = ?auto_5129 ?auto_5134 ) ) ( not ( = ?auto_5133 ?auto_5129 ) ) ( HOIST-AT ?auto_5135 ?auto_5129 ) ( not ( = ?auto_5137 ?auto_5135 ) ) ( not ( = ?auto_5131 ?auto_5135 ) ) ( AVAILABLE ?auto_5135 ) ( SURFACE-AT ?auto_5127 ?auto_5129 ) ( ON ?auto_5127 ?auto_5136 ) ( CLEAR ?auto_5127 ) ( not ( = ?auto_5127 ?auto_5136 ) ) ( not ( = ?auto_5128 ?auto_5136 ) ) ( not ( = ?auto_5126 ?auto_5136 ) ) ( not ( = ?auto_5130 ?auto_5136 ) ) ( TRUCK-AT ?auto_5132 ?auto_5134 ) ( ON ?auto_5126 ?auto_5125 ) ( not ( = ?auto_5125 ?auto_5126 ) ) ( not ( = ?auto_5125 ?auto_5127 ) ) ( not ( = ?auto_5125 ?auto_5128 ) ) ( not ( = ?auto_5125 ?auto_5130 ) ) ( not ( = ?auto_5125 ?auto_5136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5126 ?auto_5127 ?auto_5128 )
      ( MAKE-3CRATE-VERIFY ?auto_5125 ?auto_5126 ?auto_5127 ?auto_5128 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5138 - SURFACE
      ?auto_5139 - SURFACE
    )
    :vars
    (
      ?auto_5149 - HOIST
      ?auto_5145 - PLACE
      ?auto_5146 - SURFACE
      ?auto_5144 - PLACE
      ?auto_5142 - HOIST
      ?auto_5141 - SURFACE
      ?auto_5140 - PLACE
      ?auto_5147 - HOIST
      ?auto_5148 - SURFACE
      ?auto_5143 - TRUCK
      ?auto_5150 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5149 ?auto_5145 ) ( IS-CRATE ?auto_5139 ) ( not ( = ?auto_5138 ?auto_5139 ) ) ( not ( = ?auto_5146 ?auto_5138 ) ) ( not ( = ?auto_5146 ?auto_5139 ) ) ( not ( = ?auto_5144 ?auto_5145 ) ) ( HOIST-AT ?auto_5142 ?auto_5144 ) ( not ( = ?auto_5149 ?auto_5142 ) ) ( AVAILABLE ?auto_5142 ) ( SURFACE-AT ?auto_5139 ?auto_5144 ) ( ON ?auto_5139 ?auto_5141 ) ( CLEAR ?auto_5139 ) ( not ( = ?auto_5138 ?auto_5141 ) ) ( not ( = ?auto_5139 ?auto_5141 ) ) ( not ( = ?auto_5146 ?auto_5141 ) ) ( IS-CRATE ?auto_5138 ) ( not ( = ?auto_5140 ?auto_5145 ) ) ( not ( = ?auto_5144 ?auto_5140 ) ) ( HOIST-AT ?auto_5147 ?auto_5140 ) ( not ( = ?auto_5149 ?auto_5147 ) ) ( not ( = ?auto_5142 ?auto_5147 ) ) ( AVAILABLE ?auto_5147 ) ( SURFACE-AT ?auto_5138 ?auto_5140 ) ( ON ?auto_5138 ?auto_5148 ) ( CLEAR ?auto_5138 ) ( not ( = ?auto_5138 ?auto_5148 ) ) ( not ( = ?auto_5139 ?auto_5148 ) ) ( not ( = ?auto_5146 ?auto_5148 ) ) ( not ( = ?auto_5141 ?auto_5148 ) ) ( TRUCK-AT ?auto_5143 ?auto_5145 ) ( SURFACE-AT ?auto_5150 ?auto_5145 ) ( CLEAR ?auto_5150 ) ( LIFTING ?auto_5149 ?auto_5146 ) ( IS-CRATE ?auto_5146 ) ( not ( = ?auto_5150 ?auto_5146 ) ) ( not ( = ?auto_5138 ?auto_5150 ) ) ( not ( = ?auto_5139 ?auto_5150 ) ) ( not ( = ?auto_5141 ?auto_5150 ) ) ( not ( = ?auto_5148 ?auto_5150 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5150 ?auto_5146 )
      ( MAKE-2CRATE ?auto_5146 ?auto_5138 ?auto_5139 )
      ( MAKE-1CRATE-VERIFY ?auto_5138 ?auto_5139 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5151 - SURFACE
      ?auto_5152 - SURFACE
      ?auto_5153 - SURFACE
    )
    :vars
    (
      ?auto_5159 - HOIST
      ?auto_5157 - PLACE
      ?auto_5161 - PLACE
      ?auto_5162 - HOIST
      ?auto_5163 - SURFACE
      ?auto_5154 - PLACE
      ?auto_5158 - HOIST
      ?auto_5160 - SURFACE
      ?auto_5156 - TRUCK
      ?auto_5155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5159 ?auto_5157 ) ( IS-CRATE ?auto_5153 ) ( not ( = ?auto_5152 ?auto_5153 ) ) ( not ( = ?auto_5151 ?auto_5152 ) ) ( not ( = ?auto_5151 ?auto_5153 ) ) ( not ( = ?auto_5161 ?auto_5157 ) ) ( HOIST-AT ?auto_5162 ?auto_5161 ) ( not ( = ?auto_5159 ?auto_5162 ) ) ( AVAILABLE ?auto_5162 ) ( SURFACE-AT ?auto_5153 ?auto_5161 ) ( ON ?auto_5153 ?auto_5163 ) ( CLEAR ?auto_5153 ) ( not ( = ?auto_5152 ?auto_5163 ) ) ( not ( = ?auto_5153 ?auto_5163 ) ) ( not ( = ?auto_5151 ?auto_5163 ) ) ( IS-CRATE ?auto_5152 ) ( not ( = ?auto_5154 ?auto_5157 ) ) ( not ( = ?auto_5161 ?auto_5154 ) ) ( HOIST-AT ?auto_5158 ?auto_5154 ) ( not ( = ?auto_5159 ?auto_5158 ) ) ( not ( = ?auto_5162 ?auto_5158 ) ) ( AVAILABLE ?auto_5158 ) ( SURFACE-AT ?auto_5152 ?auto_5154 ) ( ON ?auto_5152 ?auto_5160 ) ( CLEAR ?auto_5152 ) ( not ( = ?auto_5152 ?auto_5160 ) ) ( not ( = ?auto_5153 ?auto_5160 ) ) ( not ( = ?auto_5151 ?auto_5160 ) ) ( not ( = ?auto_5163 ?auto_5160 ) ) ( TRUCK-AT ?auto_5156 ?auto_5157 ) ( SURFACE-AT ?auto_5155 ?auto_5157 ) ( CLEAR ?auto_5155 ) ( LIFTING ?auto_5159 ?auto_5151 ) ( IS-CRATE ?auto_5151 ) ( not ( = ?auto_5155 ?auto_5151 ) ) ( not ( = ?auto_5152 ?auto_5155 ) ) ( not ( = ?auto_5153 ?auto_5155 ) ) ( not ( = ?auto_5163 ?auto_5155 ) ) ( not ( = ?auto_5160 ?auto_5155 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5152 ?auto_5153 )
      ( MAKE-2CRATE-VERIFY ?auto_5151 ?auto_5152 ?auto_5153 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5164 - SURFACE
      ?auto_5165 - SURFACE
      ?auto_5166 - SURFACE
      ?auto_5167 - SURFACE
    )
    :vars
    (
      ?auto_5172 - HOIST
      ?auto_5168 - PLACE
      ?auto_5174 - PLACE
      ?auto_5171 - HOIST
      ?auto_5170 - SURFACE
      ?auto_5169 - PLACE
      ?auto_5173 - HOIST
      ?auto_5176 - SURFACE
      ?auto_5175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5172 ?auto_5168 ) ( IS-CRATE ?auto_5167 ) ( not ( = ?auto_5166 ?auto_5167 ) ) ( not ( = ?auto_5165 ?auto_5166 ) ) ( not ( = ?auto_5165 ?auto_5167 ) ) ( not ( = ?auto_5174 ?auto_5168 ) ) ( HOIST-AT ?auto_5171 ?auto_5174 ) ( not ( = ?auto_5172 ?auto_5171 ) ) ( AVAILABLE ?auto_5171 ) ( SURFACE-AT ?auto_5167 ?auto_5174 ) ( ON ?auto_5167 ?auto_5170 ) ( CLEAR ?auto_5167 ) ( not ( = ?auto_5166 ?auto_5170 ) ) ( not ( = ?auto_5167 ?auto_5170 ) ) ( not ( = ?auto_5165 ?auto_5170 ) ) ( IS-CRATE ?auto_5166 ) ( not ( = ?auto_5169 ?auto_5168 ) ) ( not ( = ?auto_5174 ?auto_5169 ) ) ( HOIST-AT ?auto_5173 ?auto_5169 ) ( not ( = ?auto_5172 ?auto_5173 ) ) ( not ( = ?auto_5171 ?auto_5173 ) ) ( AVAILABLE ?auto_5173 ) ( SURFACE-AT ?auto_5166 ?auto_5169 ) ( ON ?auto_5166 ?auto_5176 ) ( CLEAR ?auto_5166 ) ( not ( = ?auto_5166 ?auto_5176 ) ) ( not ( = ?auto_5167 ?auto_5176 ) ) ( not ( = ?auto_5165 ?auto_5176 ) ) ( not ( = ?auto_5170 ?auto_5176 ) ) ( TRUCK-AT ?auto_5175 ?auto_5168 ) ( SURFACE-AT ?auto_5164 ?auto_5168 ) ( CLEAR ?auto_5164 ) ( LIFTING ?auto_5172 ?auto_5165 ) ( IS-CRATE ?auto_5165 ) ( not ( = ?auto_5164 ?auto_5165 ) ) ( not ( = ?auto_5166 ?auto_5164 ) ) ( not ( = ?auto_5167 ?auto_5164 ) ) ( not ( = ?auto_5170 ?auto_5164 ) ) ( not ( = ?auto_5176 ?auto_5164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5165 ?auto_5166 ?auto_5167 )
      ( MAKE-3CRATE-VERIFY ?auto_5164 ?auto_5165 ?auto_5166 ?auto_5167 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5177 - SURFACE
      ?auto_5178 - SURFACE
    )
    :vars
    (
      ?auto_5184 - HOIST
      ?auto_5179 - PLACE
      ?auto_5183 - SURFACE
      ?auto_5187 - PLACE
      ?auto_5182 - HOIST
      ?auto_5181 - SURFACE
      ?auto_5180 - PLACE
      ?auto_5185 - HOIST
      ?auto_5189 - SURFACE
      ?auto_5188 - TRUCK
      ?auto_5186 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5184 ?auto_5179 ) ( IS-CRATE ?auto_5178 ) ( not ( = ?auto_5177 ?auto_5178 ) ) ( not ( = ?auto_5183 ?auto_5177 ) ) ( not ( = ?auto_5183 ?auto_5178 ) ) ( not ( = ?auto_5187 ?auto_5179 ) ) ( HOIST-AT ?auto_5182 ?auto_5187 ) ( not ( = ?auto_5184 ?auto_5182 ) ) ( AVAILABLE ?auto_5182 ) ( SURFACE-AT ?auto_5178 ?auto_5187 ) ( ON ?auto_5178 ?auto_5181 ) ( CLEAR ?auto_5178 ) ( not ( = ?auto_5177 ?auto_5181 ) ) ( not ( = ?auto_5178 ?auto_5181 ) ) ( not ( = ?auto_5183 ?auto_5181 ) ) ( IS-CRATE ?auto_5177 ) ( not ( = ?auto_5180 ?auto_5179 ) ) ( not ( = ?auto_5187 ?auto_5180 ) ) ( HOIST-AT ?auto_5185 ?auto_5180 ) ( not ( = ?auto_5184 ?auto_5185 ) ) ( not ( = ?auto_5182 ?auto_5185 ) ) ( AVAILABLE ?auto_5185 ) ( SURFACE-AT ?auto_5177 ?auto_5180 ) ( ON ?auto_5177 ?auto_5189 ) ( CLEAR ?auto_5177 ) ( not ( = ?auto_5177 ?auto_5189 ) ) ( not ( = ?auto_5178 ?auto_5189 ) ) ( not ( = ?auto_5183 ?auto_5189 ) ) ( not ( = ?auto_5181 ?auto_5189 ) ) ( TRUCK-AT ?auto_5188 ?auto_5179 ) ( SURFACE-AT ?auto_5186 ?auto_5179 ) ( CLEAR ?auto_5186 ) ( IS-CRATE ?auto_5183 ) ( not ( = ?auto_5186 ?auto_5183 ) ) ( not ( = ?auto_5177 ?auto_5186 ) ) ( not ( = ?auto_5178 ?auto_5186 ) ) ( not ( = ?auto_5181 ?auto_5186 ) ) ( not ( = ?auto_5189 ?auto_5186 ) ) ( AVAILABLE ?auto_5184 ) ( IN ?auto_5183 ?auto_5188 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5184 ?auto_5183 ?auto_5188 ?auto_5179 )
      ( MAKE-2CRATE ?auto_5183 ?auto_5177 ?auto_5178 )
      ( MAKE-1CRATE-VERIFY ?auto_5177 ?auto_5178 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5190 - SURFACE
      ?auto_5191 - SURFACE
      ?auto_5192 - SURFACE
    )
    :vars
    (
      ?auto_5196 - HOIST
      ?auto_5194 - PLACE
      ?auto_5198 - PLACE
      ?auto_5201 - HOIST
      ?auto_5199 - SURFACE
      ?auto_5195 - PLACE
      ?auto_5193 - HOIST
      ?auto_5197 - SURFACE
      ?auto_5202 - TRUCK
      ?auto_5200 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5196 ?auto_5194 ) ( IS-CRATE ?auto_5192 ) ( not ( = ?auto_5191 ?auto_5192 ) ) ( not ( = ?auto_5190 ?auto_5191 ) ) ( not ( = ?auto_5190 ?auto_5192 ) ) ( not ( = ?auto_5198 ?auto_5194 ) ) ( HOIST-AT ?auto_5201 ?auto_5198 ) ( not ( = ?auto_5196 ?auto_5201 ) ) ( AVAILABLE ?auto_5201 ) ( SURFACE-AT ?auto_5192 ?auto_5198 ) ( ON ?auto_5192 ?auto_5199 ) ( CLEAR ?auto_5192 ) ( not ( = ?auto_5191 ?auto_5199 ) ) ( not ( = ?auto_5192 ?auto_5199 ) ) ( not ( = ?auto_5190 ?auto_5199 ) ) ( IS-CRATE ?auto_5191 ) ( not ( = ?auto_5195 ?auto_5194 ) ) ( not ( = ?auto_5198 ?auto_5195 ) ) ( HOIST-AT ?auto_5193 ?auto_5195 ) ( not ( = ?auto_5196 ?auto_5193 ) ) ( not ( = ?auto_5201 ?auto_5193 ) ) ( AVAILABLE ?auto_5193 ) ( SURFACE-AT ?auto_5191 ?auto_5195 ) ( ON ?auto_5191 ?auto_5197 ) ( CLEAR ?auto_5191 ) ( not ( = ?auto_5191 ?auto_5197 ) ) ( not ( = ?auto_5192 ?auto_5197 ) ) ( not ( = ?auto_5190 ?auto_5197 ) ) ( not ( = ?auto_5199 ?auto_5197 ) ) ( TRUCK-AT ?auto_5202 ?auto_5194 ) ( SURFACE-AT ?auto_5200 ?auto_5194 ) ( CLEAR ?auto_5200 ) ( IS-CRATE ?auto_5190 ) ( not ( = ?auto_5200 ?auto_5190 ) ) ( not ( = ?auto_5191 ?auto_5200 ) ) ( not ( = ?auto_5192 ?auto_5200 ) ) ( not ( = ?auto_5199 ?auto_5200 ) ) ( not ( = ?auto_5197 ?auto_5200 ) ) ( AVAILABLE ?auto_5196 ) ( IN ?auto_5190 ?auto_5202 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5191 ?auto_5192 )
      ( MAKE-2CRATE-VERIFY ?auto_5190 ?auto_5191 ?auto_5192 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5203 - SURFACE
      ?auto_5204 - SURFACE
      ?auto_5205 - SURFACE
      ?auto_5206 - SURFACE
    )
    :vars
    (
      ?auto_5209 - HOIST
      ?auto_5215 - PLACE
      ?auto_5214 - PLACE
      ?auto_5208 - HOIST
      ?auto_5211 - SURFACE
      ?auto_5207 - PLACE
      ?auto_5210 - HOIST
      ?auto_5213 - SURFACE
      ?auto_5212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5209 ?auto_5215 ) ( IS-CRATE ?auto_5206 ) ( not ( = ?auto_5205 ?auto_5206 ) ) ( not ( = ?auto_5204 ?auto_5205 ) ) ( not ( = ?auto_5204 ?auto_5206 ) ) ( not ( = ?auto_5214 ?auto_5215 ) ) ( HOIST-AT ?auto_5208 ?auto_5214 ) ( not ( = ?auto_5209 ?auto_5208 ) ) ( AVAILABLE ?auto_5208 ) ( SURFACE-AT ?auto_5206 ?auto_5214 ) ( ON ?auto_5206 ?auto_5211 ) ( CLEAR ?auto_5206 ) ( not ( = ?auto_5205 ?auto_5211 ) ) ( not ( = ?auto_5206 ?auto_5211 ) ) ( not ( = ?auto_5204 ?auto_5211 ) ) ( IS-CRATE ?auto_5205 ) ( not ( = ?auto_5207 ?auto_5215 ) ) ( not ( = ?auto_5214 ?auto_5207 ) ) ( HOIST-AT ?auto_5210 ?auto_5207 ) ( not ( = ?auto_5209 ?auto_5210 ) ) ( not ( = ?auto_5208 ?auto_5210 ) ) ( AVAILABLE ?auto_5210 ) ( SURFACE-AT ?auto_5205 ?auto_5207 ) ( ON ?auto_5205 ?auto_5213 ) ( CLEAR ?auto_5205 ) ( not ( = ?auto_5205 ?auto_5213 ) ) ( not ( = ?auto_5206 ?auto_5213 ) ) ( not ( = ?auto_5204 ?auto_5213 ) ) ( not ( = ?auto_5211 ?auto_5213 ) ) ( TRUCK-AT ?auto_5212 ?auto_5215 ) ( SURFACE-AT ?auto_5203 ?auto_5215 ) ( CLEAR ?auto_5203 ) ( IS-CRATE ?auto_5204 ) ( not ( = ?auto_5203 ?auto_5204 ) ) ( not ( = ?auto_5205 ?auto_5203 ) ) ( not ( = ?auto_5206 ?auto_5203 ) ) ( not ( = ?auto_5211 ?auto_5203 ) ) ( not ( = ?auto_5213 ?auto_5203 ) ) ( AVAILABLE ?auto_5209 ) ( IN ?auto_5204 ?auto_5212 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5204 ?auto_5205 ?auto_5206 )
      ( MAKE-3CRATE-VERIFY ?auto_5203 ?auto_5204 ?auto_5205 ?auto_5206 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5216 - SURFACE
      ?auto_5217 - SURFACE
    )
    :vars
    (
      ?auto_5220 - HOIST
      ?auto_5227 - PLACE
      ?auto_5221 - SURFACE
      ?auto_5226 - PLACE
      ?auto_5219 - HOIST
      ?auto_5223 - SURFACE
      ?auto_5218 - PLACE
      ?auto_5222 - HOIST
      ?auto_5225 - SURFACE
      ?auto_5228 - SURFACE
      ?auto_5224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5220 ?auto_5227 ) ( IS-CRATE ?auto_5217 ) ( not ( = ?auto_5216 ?auto_5217 ) ) ( not ( = ?auto_5221 ?auto_5216 ) ) ( not ( = ?auto_5221 ?auto_5217 ) ) ( not ( = ?auto_5226 ?auto_5227 ) ) ( HOIST-AT ?auto_5219 ?auto_5226 ) ( not ( = ?auto_5220 ?auto_5219 ) ) ( AVAILABLE ?auto_5219 ) ( SURFACE-AT ?auto_5217 ?auto_5226 ) ( ON ?auto_5217 ?auto_5223 ) ( CLEAR ?auto_5217 ) ( not ( = ?auto_5216 ?auto_5223 ) ) ( not ( = ?auto_5217 ?auto_5223 ) ) ( not ( = ?auto_5221 ?auto_5223 ) ) ( IS-CRATE ?auto_5216 ) ( not ( = ?auto_5218 ?auto_5227 ) ) ( not ( = ?auto_5226 ?auto_5218 ) ) ( HOIST-AT ?auto_5222 ?auto_5218 ) ( not ( = ?auto_5220 ?auto_5222 ) ) ( not ( = ?auto_5219 ?auto_5222 ) ) ( AVAILABLE ?auto_5222 ) ( SURFACE-AT ?auto_5216 ?auto_5218 ) ( ON ?auto_5216 ?auto_5225 ) ( CLEAR ?auto_5216 ) ( not ( = ?auto_5216 ?auto_5225 ) ) ( not ( = ?auto_5217 ?auto_5225 ) ) ( not ( = ?auto_5221 ?auto_5225 ) ) ( not ( = ?auto_5223 ?auto_5225 ) ) ( SURFACE-AT ?auto_5228 ?auto_5227 ) ( CLEAR ?auto_5228 ) ( IS-CRATE ?auto_5221 ) ( not ( = ?auto_5228 ?auto_5221 ) ) ( not ( = ?auto_5216 ?auto_5228 ) ) ( not ( = ?auto_5217 ?auto_5228 ) ) ( not ( = ?auto_5223 ?auto_5228 ) ) ( not ( = ?auto_5225 ?auto_5228 ) ) ( AVAILABLE ?auto_5220 ) ( IN ?auto_5221 ?auto_5224 ) ( TRUCK-AT ?auto_5224 ?auto_5218 ) )
    :subtasks
    ( ( !DRIVE ?auto_5224 ?auto_5218 ?auto_5227 )
      ( MAKE-2CRATE ?auto_5221 ?auto_5216 ?auto_5217 )
      ( MAKE-1CRATE-VERIFY ?auto_5216 ?auto_5217 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5229 - SURFACE
      ?auto_5230 - SURFACE
      ?auto_5231 - SURFACE
    )
    :vars
    (
      ?auto_5239 - HOIST
      ?auto_5241 - PLACE
      ?auto_5238 - PLACE
      ?auto_5234 - HOIST
      ?auto_5236 - SURFACE
      ?auto_5233 - PLACE
      ?auto_5240 - HOIST
      ?auto_5235 - SURFACE
      ?auto_5237 - SURFACE
      ?auto_5232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5239 ?auto_5241 ) ( IS-CRATE ?auto_5231 ) ( not ( = ?auto_5230 ?auto_5231 ) ) ( not ( = ?auto_5229 ?auto_5230 ) ) ( not ( = ?auto_5229 ?auto_5231 ) ) ( not ( = ?auto_5238 ?auto_5241 ) ) ( HOIST-AT ?auto_5234 ?auto_5238 ) ( not ( = ?auto_5239 ?auto_5234 ) ) ( AVAILABLE ?auto_5234 ) ( SURFACE-AT ?auto_5231 ?auto_5238 ) ( ON ?auto_5231 ?auto_5236 ) ( CLEAR ?auto_5231 ) ( not ( = ?auto_5230 ?auto_5236 ) ) ( not ( = ?auto_5231 ?auto_5236 ) ) ( not ( = ?auto_5229 ?auto_5236 ) ) ( IS-CRATE ?auto_5230 ) ( not ( = ?auto_5233 ?auto_5241 ) ) ( not ( = ?auto_5238 ?auto_5233 ) ) ( HOIST-AT ?auto_5240 ?auto_5233 ) ( not ( = ?auto_5239 ?auto_5240 ) ) ( not ( = ?auto_5234 ?auto_5240 ) ) ( AVAILABLE ?auto_5240 ) ( SURFACE-AT ?auto_5230 ?auto_5233 ) ( ON ?auto_5230 ?auto_5235 ) ( CLEAR ?auto_5230 ) ( not ( = ?auto_5230 ?auto_5235 ) ) ( not ( = ?auto_5231 ?auto_5235 ) ) ( not ( = ?auto_5229 ?auto_5235 ) ) ( not ( = ?auto_5236 ?auto_5235 ) ) ( SURFACE-AT ?auto_5237 ?auto_5241 ) ( CLEAR ?auto_5237 ) ( IS-CRATE ?auto_5229 ) ( not ( = ?auto_5237 ?auto_5229 ) ) ( not ( = ?auto_5230 ?auto_5237 ) ) ( not ( = ?auto_5231 ?auto_5237 ) ) ( not ( = ?auto_5236 ?auto_5237 ) ) ( not ( = ?auto_5235 ?auto_5237 ) ) ( AVAILABLE ?auto_5239 ) ( IN ?auto_5229 ?auto_5232 ) ( TRUCK-AT ?auto_5232 ?auto_5233 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5230 ?auto_5231 )
      ( MAKE-2CRATE-VERIFY ?auto_5229 ?auto_5230 ?auto_5231 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5242 - SURFACE
      ?auto_5243 - SURFACE
      ?auto_5244 - SURFACE
      ?auto_5245 - SURFACE
    )
    :vars
    (
      ?auto_5252 - HOIST
      ?auto_5249 - PLACE
      ?auto_5251 - PLACE
      ?auto_5246 - HOIST
      ?auto_5250 - SURFACE
      ?auto_5253 - PLACE
      ?auto_5248 - HOIST
      ?auto_5254 - SURFACE
      ?auto_5247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5252 ?auto_5249 ) ( IS-CRATE ?auto_5245 ) ( not ( = ?auto_5244 ?auto_5245 ) ) ( not ( = ?auto_5243 ?auto_5244 ) ) ( not ( = ?auto_5243 ?auto_5245 ) ) ( not ( = ?auto_5251 ?auto_5249 ) ) ( HOIST-AT ?auto_5246 ?auto_5251 ) ( not ( = ?auto_5252 ?auto_5246 ) ) ( AVAILABLE ?auto_5246 ) ( SURFACE-AT ?auto_5245 ?auto_5251 ) ( ON ?auto_5245 ?auto_5250 ) ( CLEAR ?auto_5245 ) ( not ( = ?auto_5244 ?auto_5250 ) ) ( not ( = ?auto_5245 ?auto_5250 ) ) ( not ( = ?auto_5243 ?auto_5250 ) ) ( IS-CRATE ?auto_5244 ) ( not ( = ?auto_5253 ?auto_5249 ) ) ( not ( = ?auto_5251 ?auto_5253 ) ) ( HOIST-AT ?auto_5248 ?auto_5253 ) ( not ( = ?auto_5252 ?auto_5248 ) ) ( not ( = ?auto_5246 ?auto_5248 ) ) ( AVAILABLE ?auto_5248 ) ( SURFACE-AT ?auto_5244 ?auto_5253 ) ( ON ?auto_5244 ?auto_5254 ) ( CLEAR ?auto_5244 ) ( not ( = ?auto_5244 ?auto_5254 ) ) ( not ( = ?auto_5245 ?auto_5254 ) ) ( not ( = ?auto_5243 ?auto_5254 ) ) ( not ( = ?auto_5250 ?auto_5254 ) ) ( SURFACE-AT ?auto_5242 ?auto_5249 ) ( CLEAR ?auto_5242 ) ( IS-CRATE ?auto_5243 ) ( not ( = ?auto_5242 ?auto_5243 ) ) ( not ( = ?auto_5244 ?auto_5242 ) ) ( not ( = ?auto_5245 ?auto_5242 ) ) ( not ( = ?auto_5250 ?auto_5242 ) ) ( not ( = ?auto_5254 ?auto_5242 ) ) ( AVAILABLE ?auto_5252 ) ( IN ?auto_5243 ?auto_5247 ) ( TRUCK-AT ?auto_5247 ?auto_5253 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5243 ?auto_5244 ?auto_5245 )
      ( MAKE-3CRATE-VERIFY ?auto_5242 ?auto_5243 ?auto_5244 ?auto_5245 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5255 - SURFACE
      ?auto_5256 - SURFACE
    )
    :vars
    (
      ?auto_5265 - HOIST
      ?auto_5261 - PLACE
      ?auto_5264 - SURFACE
      ?auto_5263 - PLACE
      ?auto_5257 - HOIST
      ?auto_5262 - SURFACE
      ?auto_5266 - PLACE
      ?auto_5259 - HOIST
      ?auto_5267 - SURFACE
      ?auto_5260 - SURFACE
      ?auto_5258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5265 ?auto_5261 ) ( IS-CRATE ?auto_5256 ) ( not ( = ?auto_5255 ?auto_5256 ) ) ( not ( = ?auto_5264 ?auto_5255 ) ) ( not ( = ?auto_5264 ?auto_5256 ) ) ( not ( = ?auto_5263 ?auto_5261 ) ) ( HOIST-AT ?auto_5257 ?auto_5263 ) ( not ( = ?auto_5265 ?auto_5257 ) ) ( AVAILABLE ?auto_5257 ) ( SURFACE-AT ?auto_5256 ?auto_5263 ) ( ON ?auto_5256 ?auto_5262 ) ( CLEAR ?auto_5256 ) ( not ( = ?auto_5255 ?auto_5262 ) ) ( not ( = ?auto_5256 ?auto_5262 ) ) ( not ( = ?auto_5264 ?auto_5262 ) ) ( IS-CRATE ?auto_5255 ) ( not ( = ?auto_5266 ?auto_5261 ) ) ( not ( = ?auto_5263 ?auto_5266 ) ) ( HOIST-AT ?auto_5259 ?auto_5266 ) ( not ( = ?auto_5265 ?auto_5259 ) ) ( not ( = ?auto_5257 ?auto_5259 ) ) ( SURFACE-AT ?auto_5255 ?auto_5266 ) ( ON ?auto_5255 ?auto_5267 ) ( CLEAR ?auto_5255 ) ( not ( = ?auto_5255 ?auto_5267 ) ) ( not ( = ?auto_5256 ?auto_5267 ) ) ( not ( = ?auto_5264 ?auto_5267 ) ) ( not ( = ?auto_5262 ?auto_5267 ) ) ( SURFACE-AT ?auto_5260 ?auto_5261 ) ( CLEAR ?auto_5260 ) ( IS-CRATE ?auto_5264 ) ( not ( = ?auto_5260 ?auto_5264 ) ) ( not ( = ?auto_5255 ?auto_5260 ) ) ( not ( = ?auto_5256 ?auto_5260 ) ) ( not ( = ?auto_5262 ?auto_5260 ) ) ( not ( = ?auto_5267 ?auto_5260 ) ) ( AVAILABLE ?auto_5265 ) ( TRUCK-AT ?auto_5258 ?auto_5266 ) ( LIFTING ?auto_5259 ?auto_5264 ) )
    :subtasks
    ( ( !LOAD ?auto_5259 ?auto_5264 ?auto_5258 ?auto_5266 )
      ( MAKE-2CRATE ?auto_5264 ?auto_5255 ?auto_5256 )
      ( MAKE-1CRATE-VERIFY ?auto_5255 ?auto_5256 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5268 - SURFACE
      ?auto_5269 - SURFACE
      ?auto_5270 - SURFACE
    )
    :vars
    (
      ?auto_5272 - HOIST
      ?auto_5277 - PLACE
      ?auto_5278 - PLACE
      ?auto_5276 - HOIST
      ?auto_5273 - SURFACE
      ?auto_5280 - PLACE
      ?auto_5274 - HOIST
      ?auto_5271 - SURFACE
      ?auto_5279 - SURFACE
      ?auto_5275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5272 ?auto_5277 ) ( IS-CRATE ?auto_5270 ) ( not ( = ?auto_5269 ?auto_5270 ) ) ( not ( = ?auto_5268 ?auto_5269 ) ) ( not ( = ?auto_5268 ?auto_5270 ) ) ( not ( = ?auto_5278 ?auto_5277 ) ) ( HOIST-AT ?auto_5276 ?auto_5278 ) ( not ( = ?auto_5272 ?auto_5276 ) ) ( AVAILABLE ?auto_5276 ) ( SURFACE-AT ?auto_5270 ?auto_5278 ) ( ON ?auto_5270 ?auto_5273 ) ( CLEAR ?auto_5270 ) ( not ( = ?auto_5269 ?auto_5273 ) ) ( not ( = ?auto_5270 ?auto_5273 ) ) ( not ( = ?auto_5268 ?auto_5273 ) ) ( IS-CRATE ?auto_5269 ) ( not ( = ?auto_5280 ?auto_5277 ) ) ( not ( = ?auto_5278 ?auto_5280 ) ) ( HOIST-AT ?auto_5274 ?auto_5280 ) ( not ( = ?auto_5272 ?auto_5274 ) ) ( not ( = ?auto_5276 ?auto_5274 ) ) ( SURFACE-AT ?auto_5269 ?auto_5280 ) ( ON ?auto_5269 ?auto_5271 ) ( CLEAR ?auto_5269 ) ( not ( = ?auto_5269 ?auto_5271 ) ) ( not ( = ?auto_5270 ?auto_5271 ) ) ( not ( = ?auto_5268 ?auto_5271 ) ) ( not ( = ?auto_5273 ?auto_5271 ) ) ( SURFACE-AT ?auto_5279 ?auto_5277 ) ( CLEAR ?auto_5279 ) ( IS-CRATE ?auto_5268 ) ( not ( = ?auto_5279 ?auto_5268 ) ) ( not ( = ?auto_5269 ?auto_5279 ) ) ( not ( = ?auto_5270 ?auto_5279 ) ) ( not ( = ?auto_5273 ?auto_5279 ) ) ( not ( = ?auto_5271 ?auto_5279 ) ) ( AVAILABLE ?auto_5272 ) ( TRUCK-AT ?auto_5275 ?auto_5280 ) ( LIFTING ?auto_5274 ?auto_5268 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5269 ?auto_5270 )
      ( MAKE-2CRATE-VERIFY ?auto_5268 ?auto_5269 ?auto_5270 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5281 - SURFACE
      ?auto_5282 - SURFACE
      ?auto_5283 - SURFACE
      ?auto_5284 - SURFACE
    )
    :vars
    (
      ?auto_5291 - HOIST
      ?auto_5289 - PLACE
      ?auto_5292 - PLACE
      ?auto_5287 - HOIST
      ?auto_5285 - SURFACE
      ?auto_5290 - PLACE
      ?auto_5286 - HOIST
      ?auto_5293 - SURFACE
      ?auto_5288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5291 ?auto_5289 ) ( IS-CRATE ?auto_5284 ) ( not ( = ?auto_5283 ?auto_5284 ) ) ( not ( = ?auto_5282 ?auto_5283 ) ) ( not ( = ?auto_5282 ?auto_5284 ) ) ( not ( = ?auto_5292 ?auto_5289 ) ) ( HOIST-AT ?auto_5287 ?auto_5292 ) ( not ( = ?auto_5291 ?auto_5287 ) ) ( AVAILABLE ?auto_5287 ) ( SURFACE-AT ?auto_5284 ?auto_5292 ) ( ON ?auto_5284 ?auto_5285 ) ( CLEAR ?auto_5284 ) ( not ( = ?auto_5283 ?auto_5285 ) ) ( not ( = ?auto_5284 ?auto_5285 ) ) ( not ( = ?auto_5282 ?auto_5285 ) ) ( IS-CRATE ?auto_5283 ) ( not ( = ?auto_5290 ?auto_5289 ) ) ( not ( = ?auto_5292 ?auto_5290 ) ) ( HOIST-AT ?auto_5286 ?auto_5290 ) ( not ( = ?auto_5291 ?auto_5286 ) ) ( not ( = ?auto_5287 ?auto_5286 ) ) ( SURFACE-AT ?auto_5283 ?auto_5290 ) ( ON ?auto_5283 ?auto_5293 ) ( CLEAR ?auto_5283 ) ( not ( = ?auto_5283 ?auto_5293 ) ) ( not ( = ?auto_5284 ?auto_5293 ) ) ( not ( = ?auto_5282 ?auto_5293 ) ) ( not ( = ?auto_5285 ?auto_5293 ) ) ( SURFACE-AT ?auto_5281 ?auto_5289 ) ( CLEAR ?auto_5281 ) ( IS-CRATE ?auto_5282 ) ( not ( = ?auto_5281 ?auto_5282 ) ) ( not ( = ?auto_5283 ?auto_5281 ) ) ( not ( = ?auto_5284 ?auto_5281 ) ) ( not ( = ?auto_5285 ?auto_5281 ) ) ( not ( = ?auto_5293 ?auto_5281 ) ) ( AVAILABLE ?auto_5291 ) ( TRUCK-AT ?auto_5288 ?auto_5290 ) ( LIFTING ?auto_5286 ?auto_5282 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5282 ?auto_5283 ?auto_5284 )
      ( MAKE-3CRATE-VERIFY ?auto_5281 ?auto_5282 ?auto_5283 ?auto_5284 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5294 - SURFACE
      ?auto_5295 - SURFACE
    )
    :vars
    (
      ?auto_5303 - HOIST
      ?auto_5301 - PLACE
      ?auto_5306 - SURFACE
      ?auto_5304 - PLACE
      ?auto_5299 - HOIST
      ?auto_5296 - SURFACE
      ?auto_5302 - PLACE
      ?auto_5297 - HOIST
      ?auto_5305 - SURFACE
      ?auto_5298 - SURFACE
      ?auto_5300 - TRUCK
      ?auto_5307 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5303 ?auto_5301 ) ( IS-CRATE ?auto_5295 ) ( not ( = ?auto_5294 ?auto_5295 ) ) ( not ( = ?auto_5306 ?auto_5294 ) ) ( not ( = ?auto_5306 ?auto_5295 ) ) ( not ( = ?auto_5304 ?auto_5301 ) ) ( HOIST-AT ?auto_5299 ?auto_5304 ) ( not ( = ?auto_5303 ?auto_5299 ) ) ( AVAILABLE ?auto_5299 ) ( SURFACE-AT ?auto_5295 ?auto_5304 ) ( ON ?auto_5295 ?auto_5296 ) ( CLEAR ?auto_5295 ) ( not ( = ?auto_5294 ?auto_5296 ) ) ( not ( = ?auto_5295 ?auto_5296 ) ) ( not ( = ?auto_5306 ?auto_5296 ) ) ( IS-CRATE ?auto_5294 ) ( not ( = ?auto_5302 ?auto_5301 ) ) ( not ( = ?auto_5304 ?auto_5302 ) ) ( HOIST-AT ?auto_5297 ?auto_5302 ) ( not ( = ?auto_5303 ?auto_5297 ) ) ( not ( = ?auto_5299 ?auto_5297 ) ) ( SURFACE-AT ?auto_5294 ?auto_5302 ) ( ON ?auto_5294 ?auto_5305 ) ( CLEAR ?auto_5294 ) ( not ( = ?auto_5294 ?auto_5305 ) ) ( not ( = ?auto_5295 ?auto_5305 ) ) ( not ( = ?auto_5306 ?auto_5305 ) ) ( not ( = ?auto_5296 ?auto_5305 ) ) ( SURFACE-AT ?auto_5298 ?auto_5301 ) ( CLEAR ?auto_5298 ) ( IS-CRATE ?auto_5306 ) ( not ( = ?auto_5298 ?auto_5306 ) ) ( not ( = ?auto_5294 ?auto_5298 ) ) ( not ( = ?auto_5295 ?auto_5298 ) ) ( not ( = ?auto_5296 ?auto_5298 ) ) ( not ( = ?auto_5305 ?auto_5298 ) ) ( AVAILABLE ?auto_5303 ) ( TRUCK-AT ?auto_5300 ?auto_5302 ) ( AVAILABLE ?auto_5297 ) ( SURFACE-AT ?auto_5306 ?auto_5302 ) ( ON ?auto_5306 ?auto_5307 ) ( CLEAR ?auto_5306 ) ( not ( = ?auto_5294 ?auto_5307 ) ) ( not ( = ?auto_5295 ?auto_5307 ) ) ( not ( = ?auto_5306 ?auto_5307 ) ) ( not ( = ?auto_5296 ?auto_5307 ) ) ( not ( = ?auto_5305 ?auto_5307 ) ) ( not ( = ?auto_5298 ?auto_5307 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5297 ?auto_5306 ?auto_5307 ?auto_5302 )
      ( MAKE-2CRATE ?auto_5306 ?auto_5294 ?auto_5295 )
      ( MAKE-1CRATE-VERIFY ?auto_5294 ?auto_5295 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5308 - SURFACE
      ?auto_5309 - SURFACE
      ?auto_5310 - SURFACE
    )
    :vars
    (
      ?auto_5317 - HOIST
      ?auto_5311 - PLACE
      ?auto_5321 - PLACE
      ?auto_5315 - HOIST
      ?auto_5316 - SURFACE
      ?auto_5318 - PLACE
      ?auto_5320 - HOIST
      ?auto_5312 - SURFACE
      ?auto_5314 - SURFACE
      ?auto_5313 - TRUCK
      ?auto_5319 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5317 ?auto_5311 ) ( IS-CRATE ?auto_5310 ) ( not ( = ?auto_5309 ?auto_5310 ) ) ( not ( = ?auto_5308 ?auto_5309 ) ) ( not ( = ?auto_5308 ?auto_5310 ) ) ( not ( = ?auto_5321 ?auto_5311 ) ) ( HOIST-AT ?auto_5315 ?auto_5321 ) ( not ( = ?auto_5317 ?auto_5315 ) ) ( AVAILABLE ?auto_5315 ) ( SURFACE-AT ?auto_5310 ?auto_5321 ) ( ON ?auto_5310 ?auto_5316 ) ( CLEAR ?auto_5310 ) ( not ( = ?auto_5309 ?auto_5316 ) ) ( not ( = ?auto_5310 ?auto_5316 ) ) ( not ( = ?auto_5308 ?auto_5316 ) ) ( IS-CRATE ?auto_5309 ) ( not ( = ?auto_5318 ?auto_5311 ) ) ( not ( = ?auto_5321 ?auto_5318 ) ) ( HOIST-AT ?auto_5320 ?auto_5318 ) ( not ( = ?auto_5317 ?auto_5320 ) ) ( not ( = ?auto_5315 ?auto_5320 ) ) ( SURFACE-AT ?auto_5309 ?auto_5318 ) ( ON ?auto_5309 ?auto_5312 ) ( CLEAR ?auto_5309 ) ( not ( = ?auto_5309 ?auto_5312 ) ) ( not ( = ?auto_5310 ?auto_5312 ) ) ( not ( = ?auto_5308 ?auto_5312 ) ) ( not ( = ?auto_5316 ?auto_5312 ) ) ( SURFACE-AT ?auto_5314 ?auto_5311 ) ( CLEAR ?auto_5314 ) ( IS-CRATE ?auto_5308 ) ( not ( = ?auto_5314 ?auto_5308 ) ) ( not ( = ?auto_5309 ?auto_5314 ) ) ( not ( = ?auto_5310 ?auto_5314 ) ) ( not ( = ?auto_5316 ?auto_5314 ) ) ( not ( = ?auto_5312 ?auto_5314 ) ) ( AVAILABLE ?auto_5317 ) ( TRUCK-AT ?auto_5313 ?auto_5318 ) ( AVAILABLE ?auto_5320 ) ( SURFACE-AT ?auto_5308 ?auto_5318 ) ( ON ?auto_5308 ?auto_5319 ) ( CLEAR ?auto_5308 ) ( not ( = ?auto_5309 ?auto_5319 ) ) ( not ( = ?auto_5310 ?auto_5319 ) ) ( not ( = ?auto_5308 ?auto_5319 ) ) ( not ( = ?auto_5316 ?auto_5319 ) ) ( not ( = ?auto_5312 ?auto_5319 ) ) ( not ( = ?auto_5314 ?auto_5319 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5309 ?auto_5310 )
      ( MAKE-2CRATE-VERIFY ?auto_5308 ?auto_5309 ?auto_5310 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5322 - SURFACE
      ?auto_5323 - SURFACE
      ?auto_5324 - SURFACE
      ?auto_5325 - SURFACE
    )
    :vars
    (
      ?auto_5335 - HOIST
      ?auto_5328 - PLACE
      ?auto_5326 - PLACE
      ?auto_5331 - HOIST
      ?auto_5334 - SURFACE
      ?auto_5329 - PLACE
      ?auto_5330 - HOIST
      ?auto_5332 - SURFACE
      ?auto_5333 - TRUCK
      ?auto_5327 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5335 ?auto_5328 ) ( IS-CRATE ?auto_5325 ) ( not ( = ?auto_5324 ?auto_5325 ) ) ( not ( = ?auto_5323 ?auto_5324 ) ) ( not ( = ?auto_5323 ?auto_5325 ) ) ( not ( = ?auto_5326 ?auto_5328 ) ) ( HOIST-AT ?auto_5331 ?auto_5326 ) ( not ( = ?auto_5335 ?auto_5331 ) ) ( AVAILABLE ?auto_5331 ) ( SURFACE-AT ?auto_5325 ?auto_5326 ) ( ON ?auto_5325 ?auto_5334 ) ( CLEAR ?auto_5325 ) ( not ( = ?auto_5324 ?auto_5334 ) ) ( not ( = ?auto_5325 ?auto_5334 ) ) ( not ( = ?auto_5323 ?auto_5334 ) ) ( IS-CRATE ?auto_5324 ) ( not ( = ?auto_5329 ?auto_5328 ) ) ( not ( = ?auto_5326 ?auto_5329 ) ) ( HOIST-AT ?auto_5330 ?auto_5329 ) ( not ( = ?auto_5335 ?auto_5330 ) ) ( not ( = ?auto_5331 ?auto_5330 ) ) ( SURFACE-AT ?auto_5324 ?auto_5329 ) ( ON ?auto_5324 ?auto_5332 ) ( CLEAR ?auto_5324 ) ( not ( = ?auto_5324 ?auto_5332 ) ) ( not ( = ?auto_5325 ?auto_5332 ) ) ( not ( = ?auto_5323 ?auto_5332 ) ) ( not ( = ?auto_5334 ?auto_5332 ) ) ( SURFACE-AT ?auto_5322 ?auto_5328 ) ( CLEAR ?auto_5322 ) ( IS-CRATE ?auto_5323 ) ( not ( = ?auto_5322 ?auto_5323 ) ) ( not ( = ?auto_5324 ?auto_5322 ) ) ( not ( = ?auto_5325 ?auto_5322 ) ) ( not ( = ?auto_5334 ?auto_5322 ) ) ( not ( = ?auto_5332 ?auto_5322 ) ) ( AVAILABLE ?auto_5335 ) ( TRUCK-AT ?auto_5333 ?auto_5329 ) ( AVAILABLE ?auto_5330 ) ( SURFACE-AT ?auto_5323 ?auto_5329 ) ( ON ?auto_5323 ?auto_5327 ) ( CLEAR ?auto_5323 ) ( not ( = ?auto_5324 ?auto_5327 ) ) ( not ( = ?auto_5325 ?auto_5327 ) ) ( not ( = ?auto_5323 ?auto_5327 ) ) ( not ( = ?auto_5334 ?auto_5327 ) ) ( not ( = ?auto_5332 ?auto_5327 ) ) ( not ( = ?auto_5322 ?auto_5327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5323 ?auto_5324 ?auto_5325 )
      ( MAKE-3CRATE-VERIFY ?auto_5322 ?auto_5323 ?auto_5324 ?auto_5325 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5336 - SURFACE
      ?auto_5337 - SURFACE
    )
    :vars
    (
      ?auto_5348 - HOIST
      ?auto_5340 - PLACE
      ?auto_5349 - SURFACE
      ?auto_5338 - PLACE
      ?auto_5343 - HOIST
      ?auto_5347 - SURFACE
      ?auto_5341 - PLACE
      ?auto_5342 - HOIST
      ?auto_5344 - SURFACE
      ?auto_5346 - SURFACE
      ?auto_5339 - SURFACE
      ?auto_5345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5348 ?auto_5340 ) ( IS-CRATE ?auto_5337 ) ( not ( = ?auto_5336 ?auto_5337 ) ) ( not ( = ?auto_5349 ?auto_5336 ) ) ( not ( = ?auto_5349 ?auto_5337 ) ) ( not ( = ?auto_5338 ?auto_5340 ) ) ( HOIST-AT ?auto_5343 ?auto_5338 ) ( not ( = ?auto_5348 ?auto_5343 ) ) ( AVAILABLE ?auto_5343 ) ( SURFACE-AT ?auto_5337 ?auto_5338 ) ( ON ?auto_5337 ?auto_5347 ) ( CLEAR ?auto_5337 ) ( not ( = ?auto_5336 ?auto_5347 ) ) ( not ( = ?auto_5337 ?auto_5347 ) ) ( not ( = ?auto_5349 ?auto_5347 ) ) ( IS-CRATE ?auto_5336 ) ( not ( = ?auto_5341 ?auto_5340 ) ) ( not ( = ?auto_5338 ?auto_5341 ) ) ( HOIST-AT ?auto_5342 ?auto_5341 ) ( not ( = ?auto_5348 ?auto_5342 ) ) ( not ( = ?auto_5343 ?auto_5342 ) ) ( SURFACE-AT ?auto_5336 ?auto_5341 ) ( ON ?auto_5336 ?auto_5344 ) ( CLEAR ?auto_5336 ) ( not ( = ?auto_5336 ?auto_5344 ) ) ( not ( = ?auto_5337 ?auto_5344 ) ) ( not ( = ?auto_5349 ?auto_5344 ) ) ( not ( = ?auto_5347 ?auto_5344 ) ) ( SURFACE-AT ?auto_5346 ?auto_5340 ) ( CLEAR ?auto_5346 ) ( IS-CRATE ?auto_5349 ) ( not ( = ?auto_5346 ?auto_5349 ) ) ( not ( = ?auto_5336 ?auto_5346 ) ) ( not ( = ?auto_5337 ?auto_5346 ) ) ( not ( = ?auto_5347 ?auto_5346 ) ) ( not ( = ?auto_5344 ?auto_5346 ) ) ( AVAILABLE ?auto_5348 ) ( AVAILABLE ?auto_5342 ) ( SURFACE-AT ?auto_5349 ?auto_5341 ) ( ON ?auto_5349 ?auto_5339 ) ( CLEAR ?auto_5349 ) ( not ( = ?auto_5336 ?auto_5339 ) ) ( not ( = ?auto_5337 ?auto_5339 ) ) ( not ( = ?auto_5349 ?auto_5339 ) ) ( not ( = ?auto_5347 ?auto_5339 ) ) ( not ( = ?auto_5344 ?auto_5339 ) ) ( not ( = ?auto_5346 ?auto_5339 ) ) ( TRUCK-AT ?auto_5345 ?auto_5340 ) )
    :subtasks
    ( ( !DRIVE ?auto_5345 ?auto_5340 ?auto_5341 )
      ( MAKE-2CRATE ?auto_5349 ?auto_5336 ?auto_5337 )
      ( MAKE-1CRATE-VERIFY ?auto_5336 ?auto_5337 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5350 - SURFACE
      ?auto_5351 - SURFACE
      ?auto_5352 - SURFACE
    )
    :vars
    (
      ?auto_5362 - HOIST
      ?auto_5361 - PLACE
      ?auto_5363 - PLACE
      ?auto_5356 - HOIST
      ?auto_5358 - SURFACE
      ?auto_5359 - PLACE
      ?auto_5355 - HOIST
      ?auto_5354 - SURFACE
      ?auto_5353 - SURFACE
      ?auto_5357 - SURFACE
      ?auto_5360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5362 ?auto_5361 ) ( IS-CRATE ?auto_5352 ) ( not ( = ?auto_5351 ?auto_5352 ) ) ( not ( = ?auto_5350 ?auto_5351 ) ) ( not ( = ?auto_5350 ?auto_5352 ) ) ( not ( = ?auto_5363 ?auto_5361 ) ) ( HOIST-AT ?auto_5356 ?auto_5363 ) ( not ( = ?auto_5362 ?auto_5356 ) ) ( AVAILABLE ?auto_5356 ) ( SURFACE-AT ?auto_5352 ?auto_5363 ) ( ON ?auto_5352 ?auto_5358 ) ( CLEAR ?auto_5352 ) ( not ( = ?auto_5351 ?auto_5358 ) ) ( not ( = ?auto_5352 ?auto_5358 ) ) ( not ( = ?auto_5350 ?auto_5358 ) ) ( IS-CRATE ?auto_5351 ) ( not ( = ?auto_5359 ?auto_5361 ) ) ( not ( = ?auto_5363 ?auto_5359 ) ) ( HOIST-AT ?auto_5355 ?auto_5359 ) ( not ( = ?auto_5362 ?auto_5355 ) ) ( not ( = ?auto_5356 ?auto_5355 ) ) ( SURFACE-AT ?auto_5351 ?auto_5359 ) ( ON ?auto_5351 ?auto_5354 ) ( CLEAR ?auto_5351 ) ( not ( = ?auto_5351 ?auto_5354 ) ) ( not ( = ?auto_5352 ?auto_5354 ) ) ( not ( = ?auto_5350 ?auto_5354 ) ) ( not ( = ?auto_5358 ?auto_5354 ) ) ( SURFACE-AT ?auto_5353 ?auto_5361 ) ( CLEAR ?auto_5353 ) ( IS-CRATE ?auto_5350 ) ( not ( = ?auto_5353 ?auto_5350 ) ) ( not ( = ?auto_5351 ?auto_5353 ) ) ( not ( = ?auto_5352 ?auto_5353 ) ) ( not ( = ?auto_5358 ?auto_5353 ) ) ( not ( = ?auto_5354 ?auto_5353 ) ) ( AVAILABLE ?auto_5362 ) ( AVAILABLE ?auto_5355 ) ( SURFACE-AT ?auto_5350 ?auto_5359 ) ( ON ?auto_5350 ?auto_5357 ) ( CLEAR ?auto_5350 ) ( not ( = ?auto_5351 ?auto_5357 ) ) ( not ( = ?auto_5352 ?auto_5357 ) ) ( not ( = ?auto_5350 ?auto_5357 ) ) ( not ( = ?auto_5358 ?auto_5357 ) ) ( not ( = ?auto_5354 ?auto_5357 ) ) ( not ( = ?auto_5353 ?auto_5357 ) ) ( TRUCK-AT ?auto_5360 ?auto_5361 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5351 ?auto_5352 )
      ( MAKE-2CRATE-VERIFY ?auto_5350 ?auto_5351 ?auto_5352 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5364 - SURFACE
      ?auto_5365 - SURFACE
      ?auto_5366 - SURFACE
      ?auto_5367 - SURFACE
    )
    :vars
    (
      ?auto_5371 - HOIST
      ?auto_5375 - PLACE
      ?auto_5373 - PLACE
      ?auto_5372 - HOIST
      ?auto_5368 - SURFACE
      ?auto_5376 - PLACE
      ?auto_5370 - HOIST
      ?auto_5377 - SURFACE
      ?auto_5374 - SURFACE
      ?auto_5369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5371 ?auto_5375 ) ( IS-CRATE ?auto_5367 ) ( not ( = ?auto_5366 ?auto_5367 ) ) ( not ( = ?auto_5365 ?auto_5366 ) ) ( not ( = ?auto_5365 ?auto_5367 ) ) ( not ( = ?auto_5373 ?auto_5375 ) ) ( HOIST-AT ?auto_5372 ?auto_5373 ) ( not ( = ?auto_5371 ?auto_5372 ) ) ( AVAILABLE ?auto_5372 ) ( SURFACE-AT ?auto_5367 ?auto_5373 ) ( ON ?auto_5367 ?auto_5368 ) ( CLEAR ?auto_5367 ) ( not ( = ?auto_5366 ?auto_5368 ) ) ( not ( = ?auto_5367 ?auto_5368 ) ) ( not ( = ?auto_5365 ?auto_5368 ) ) ( IS-CRATE ?auto_5366 ) ( not ( = ?auto_5376 ?auto_5375 ) ) ( not ( = ?auto_5373 ?auto_5376 ) ) ( HOIST-AT ?auto_5370 ?auto_5376 ) ( not ( = ?auto_5371 ?auto_5370 ) ) ( not ( = ?auto_5372 ?auto_5370 ) ) ( SURFACE-AT ?auto_5366 ?auto_5376 ) ( ON ?auto_5366 ?auto_5377 ) ( CLEAR ?auto_5366 ) ( not ( = ?auto_5366 ?auto_5377 ) ) ( not ( = ?auto_5367 ?auto_5377 ) ) ( not ( = ?auto_5365 ?auto_5377 ) ) ( not ( = ?auto_5368 ?auto_5377 ) ) ( SURFACE-AT ?auto_5364 ?auto_5375 ) ( CLEAR ?auto_5364 ) ( IS-CRATE ?auto_5365 ) ( not ( = ?auto_5364 ?auto_5365 ) ) ( not ( = ?auto_5366 ?auto_5364 ) ) ( not ( = ?auto_5367 ?auto_5364 ) ) ( not ( = ?auto_5368 ?auto_5364 ) ) ( not ( = ?auto_5377 ?auto_5364 ) ) ( AVAILABLE ?auto_5371 ) ( AVAILABLE ?auto_5370 ) ( SURFACE-AT ?auto_5365 ?auto_5376 ) ( ON ?auto_5365 ?auto_5374 ) ( CLEAR ?auto_5365 ) ( not ( = ?auto_5366 ?auto_5374 ) ) ( not ( = ?auto_5367 ?auto_5374 ) ) ( not ( = ?auto_5365 ?auto_5374 ) ) ( not ( = ?auto_5368 ?auto_5374 ) ) ( not ( = ?auto_5377 ?auto_5374 ) ) ( not ( = ?auto_5364 ?auto_5374 ) ) ( TRUCK-AT ?auto_5369 ?auto_5375 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5365 ?auto_5366 ?auto_5367 )
      ( MAKE-3CRATE-VERIFY ?auto_5364 ?auto_5365 ?auto_5366 ?auto_5367 ) )
  )

)

