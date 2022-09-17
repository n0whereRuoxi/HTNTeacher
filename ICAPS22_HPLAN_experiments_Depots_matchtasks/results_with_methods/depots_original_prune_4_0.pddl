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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4596 - SURFACE
      ?auto_4597 - SURFACE
    )
    :vars
    (
      ?auto_4598 - HOIST
      ?auto_4599 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4598 ?auto_4599 ) ( SURFACE-AT ?auto_4596 ?auto_4599 ) ( CLEAR ?auto_4596 ) ( LIFTING ?auto_4598 ?auto_4597 ) ( IS-CRATE ?auto_4597 ) ( not ( = ?auto_4596 ?auto_4597 ) ) )
    :subtasks
    ( ( !DROP ?auto_4598 ?auto_4597 ?auto_4596 ?auto_4599 )
      ( MAKE-1CRATE-VERIFY ?auto_4596 ?auto_4597 ) )
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
      ?auto_4604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4602 ?auto_4603 ) ( SURFACE-AT ?auto_4600 ?auto_4603 ) ( CLEAR ?auto_4600 ) ( IS-CRATE ?auto_4601 ) ( not ( = ?auto_4600 ?auto_4601 ) ) ( TRUCK-AT ?auto_4604 ?auto_4603 ) ( AVAILABLE ?auto_4602 ) ( IN ?auto_4601 ?auto_4604 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4602 ?auto_4601 ?auto_4604 ?auto_4603 )
      ( MAKE-1CRATE ?auto_4600 ?auto_4601 )
      ( MAKE-1CRATE-VERIFY ?auto_4600 ?auto_4601 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4605 - SURFACE
      ?auto_4606 - SURFACE
    )
    :vars
    (
      ?auto_4608 - HOIST
      ?auto_4607 - PLACE
      ?auto_4609 - TRUCK
      ?auto_4610 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4608 ?auto_4607 ) ( SURFACE-AT ?auto_4605 ?auto_4607 ) ( CLEAR ?auto_4605 ) ( IS-CRATE ?auto_4606 ) ( not ( = ?auto_4605 ?auto_4606 ) ) ( AVAILABLE ?auto_4608 ) ( IN ?auto_4606 ?auto_4609 ) ( TRUCK-AT ?auto_4609 ?auto_4610 ) ( not ( = ?auto_4610 ?auto_4607 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4609 ?auto_4610 ?auto_4607 )
      ( MAKE-1CRATE ?auto_4605 ?auto_4606 )
      ( MAKE-1CRATE-VERIFY ?auto_4605 ?auto_4606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4611 - SURFACE
      ?auto_4612 - SURFACE
    )
    :vars
    (
      ?auto_4614 - HOIST
      ?auto_4613 - PLACE
      ?auto_4615 - TRUCK
      ?auto_4616 - PLACE
      ?auto_4617 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4614 ?auto_4613 ) ( SURFACE-AT ?auto_4611 ?auto_4613 ) ( CLEAR ?auto_4611 ) ( IS-CRATE ?auto_4612 ) ( not ( = ?auto_4611 ?auto_4612 ) ) ( AVAILABLE ?auto_4614 ) ( TRUCK-AT ?auto_4615 ?auto_4616 ) ( not ( = ?auto_4616 ?auto_4613 ) ) ( HOIST-AT ?auto_4617 ?auto_4616 ) ( LIFTING ?auto_4617 ?auto_4612 ) ( not ( = ?auto_4614 ?auto_4617 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4617 ?auto_4612 ?auto_4615 ?auto_4616 )
      ( MAKE-1CRATE ?auto_4611 ?auto_4612 )
      ( MAKE-1CRATE-VERIFY ?auto_4611 ?auto_4612 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4618 - SURFACE
      ?auto_4619 - SURFACE
    )
    :vars
    (
      ?auto_4623 - HOIST
      ?auto_4624 - PLACE
      ?auto_4622 - TRUCK
      ?auto_4620 - PLACE
      ?auto_4621 - HOIST
      ?auto_4625 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4623 ?auto_4624 ) ( SURFACE-AT ?auto_4618 ?auto_4624 ) ( CLEAR ?auto_4618 ) ( IS-CRATE ?auto_4619 ) ( not ( = ?auto_4618 ?auto_4619 ) ) ( AVAILABLE ?auto_4623 ) ( TRUCK-AT ?auto_4622 ?auto_4620 ) ( not ( = ?auto_4620 ?auto_4624 ) ) ( HOIST-AT ?auto_4621 ?auto_4620 ) ( not ( = ?auto_4623 ?auto_4621 ) ) ( AVAILABLE ?auto_4621 ) ( SURFACE-AT ?auto_4619 ?auto_4620 ) ( ON ?auto_4619 ?auto_4625 ) ( CLEAR ?auto_4619 ) ( not ( = ?auto_4618 ?auto_4625 ) ) ( not ( = ?auto_4619 ?auto_4625 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4621 ?auto_4619 ?auto_4625 ?auto_4620 )
      ( MAKE-1CRATE ?auto_4618 ?auto_4619 )
      ( MAKE-1CRATE-VERIFY ?auto_4618 ?auto_4619 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4626 - SURFACE
      ?auto_4627 - SURFACE
    )
    :vars
    (
      ?auto_4628 - HOIST
      ?auto_4630 - PLACE
      ?auto_4632 - PLACE
      ?auto_4631 - HOIST
      ?auto_4633 - SURFACE
      ?auto_4629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4628 ?auto_4630 ) ( SURFACE-AT ?auto_4626 ?auto_4630 ) ( CLEAR ?auto_4626 ) ( IS-CRATE ?auto_4627 ) ( not ( = ?auto_4626 ?auto_4627 ) ) ( AVAILABLE ?auto_4628 ) ( not ( = ?auto_4632 ?auto_4630 ) ) ( HOIST-AT ?auto_4631 ?auto_4632 ) ( not ( = ?auto_4628 ?auto_4631 ) ) ( AVAILABLE ?auto_4631 ) ( SURFACE-AT ?auto_4627 ?auto_4632 ) ( ON ?auto_4627 ?auto_4633 ) ( CLEAR ?auto_4627 ) ( not ( = ?auto_4626 ?auto_4633 ) ) ( not ( = ?auto_4627 ?auto_4633 ) ) ( TRUCK-AT ?auto_4629 ?auto_4630 ) )
    :subtasks
    ( ( !DRIVE ?auto_4629 ?auto_4630 ?auto_4632 )
      ( MAKE-1CRATE ?auto_4626 ?auto_4627 )
      ( MAKE-1CRATE-VERIFY ?auto_4626 ?auto_4627 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4643 - SURFACE
      ?auto_4644 - SURFACE
      ?auto_4645 - SURFACE
    )
    :vars
    (
      ?auto_4647 - HOIST
      ?auto_4646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4647 ?auto_4646 ) ( SURFACE-AT ?auto_4644 ?auto_4646 ) ( CLEAR ?auto_4644 ) ( LIFTING ?auto_4647 ?auto_4645 ) ( IS-CRATE ?auto_4645 ) ( not ( = ?auto_4644 ?auto_4645 ) ) ( ON ?auto_4644 ?auto_4643 ) ( not ( = ?auto_4643 ?auto_4644 ) ) ( not ( = ?auto_4643 ?auto_4645 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4644 ?auto_4645 )
      ( MAKE-2CRATE-VERIFY ?auto_4643 ?auto_4644 ?auto_4645 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4653 - SURFACE
      ?auto_4654 - SURFACE
      ?auto_4655 - SURFACE
    )
    :vars
    (
      ?auto_4656 - HOIST
      ?auto_4658 - PLACE
      ?auto_4657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4656 ?auto_4658 ) ( SURFACE-AT ?auto_4654 ?auto_4658 ) ( CLEAR ?auto_4654 ) ( IS-CRATE ?auto_4655 ) ( not ( = ?auto_4654 ?auto_4655 ) ) ( TRUCK-AT ?auto_4657 ?auto_4658 ) ( AVAILABLE ?auto_4656 ) ( IN ?auto_4655 ?auto_4657 ) ( ON ?auto_4654 ?auto_4653 ) ( not ( = ?auto_4653 ?auto_4654 ) ) ( not ( = ?auto_4653 ?auto_4655 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4654 ?auto_4655 )
      ( MAKE-2CRATE-VERIFY ?auto_4653 ?auto_4654 ?auto_4655 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4659 - SURFACE
      ?auto_4660 - SURFACE
    )
    :vars
    (
      ?auto_4662 - HOIST
      ?auto_4664 - PLACE
      ?auto_4661 - TRUCK
      ?auto_4663 - SURFACE
      ?auto_4665 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4662 ?auto_4664 ) ( SURFACE-AT ?auto_4659 ?auto_4664 ) ( CLEAR ?auto_4659 ) ( IS-CRATE ?auto_4660 ) ( not ( = ?auto_4659 ?auto_4660 ) ) ( AVAILABLE ?auto_4662 ) ( IN ?auto_4660 ?auto_4661 ) ( ON ?auto_4659 ?auto_4663 ) ( not ( = ?auto_4663 ?auto_4659 ) ) ( not ( = ?auto_4663 ?auto_4660 ) ) ( TRUCK-AT ?auto_4661 ?auto_4665 ) ( not ( = ?auto_4665 ?auto_4664 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4661 ?auto_4665 ?auto_4664 )
      ( MAKE-2CRATE ?auto_4663 ?auto_4659 ?auto_4660 )
      ( MAKE-1CRATE-VERIFY ?auto_4659 ?auto_4660 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4666 - SURFACE
      ?auto_4667 - SURFACE
      ?auto_4668 - SURFACE
    )
    :vars
    (
      ?auto_4670 - HOIST
      ?auto_4672 - PLACE
      ?auto_4671 - TRUCK
      ?auto_4669 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4670 ?auto_4672 ) ( SURFACE-AT ?auto_4667 ?auto_4672 ) ( CLEAR ?auto_4667 ) ( IS-CRATE ?auto_4668 ) ( not ( = ?auto_4667 ?auto_4668 ) ) ( AVAILABLE ?auto_4670 ) ( IN ?auto_4668 ?auto_4671 ) ( ON ?auto_4667 ?auto_4666 ) ( not ( = ?auto_4666 ?auto_4667 ) ) ( not ( = ?auto_4666 ?auto_4668 ) ) ( TRUCK-AT ?auto_4671 ?auto_4669 ) ( not ( = ?auto_4669 ?auto_4672 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4667 ?auto_4668 )
      ( MAKE-2CRATE-VERIFY ?auto_4666 ?auto_4667 ?auto_4668 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4673 - SURFACE
      ?auto_4674 - SURFACE
    )
    :vars
    (
      ?auto_4675 - HOIST
      ?auto_4677 - PLACE
      ?auto_4679 - SURFACE
      ?auto_4676 - TRUCK
      ?auto_4678 - PLACE
      ?auto_4680 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4675 ?auto_4677 ) ( SURFACE-AT ?auto_4673 ?auto_4677 ) ( CLEAR ?auto_4673 ) ( IS-CRATE ?auto_4674 ) ( not ( = ?auto_4673 ?auto_4674 ) ) ( AVAILABLE ?auto_4675 ) ( ON ?auto_4673 ?auto_4679 ) ( not ( = ?auto_4679 ?auto_4673 ) ) ( not ( = ?auto_4679 ?auto_4674 ) ) ( TRUCK-AT ?auto_4676 ?auto_4678 ) ( not ( = ?auto_4678 ?auto_4677 ) ) ( HOIST-AT ?auto_4680 ?auto_4678 ) ( LIFTING ?auto_4680 ?auto_4674 ) ( not ( = ?auto_4675 ?auto_4680 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4680 ?auto_4674 ?auto_4676 ?auto_4678 )
      ( MAKE-2CRATE ?auto_4679 ?auto_4673 ?auto_4674 )
      ( MAKE-1CRATE-VERIFY ?auto_4673 ?auto_4674 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4681 - SURFACE
      ?auto_4682 - SURFACE
      ?auto_4683 - SURFACE
    )
    :vars
    (
      ?auto_4684 - HOIST
      ?auto_4687 - PLACE
      ?auto_4688 - TRUCK
      ?auto_4686 - PLACE
      ?auto_4685 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4684 ?auto_4687 ) ( SURFACE-AT ?auto_4682 ?auto_4687 ) ( CLEAR ?auto_4682 ) ( IS-CRATE ?auto_4683 ) ( not ( = ?auto_4682 ?auto_4683 ) ) ( AVAILABLE ?auto_4684 ) ( ON ?auto_4682 ?auto_4681 ) ( not ( = ?auto_4681 ?auto_4682 ) ) ( not ( = ?auto_4681 ?auto_4683 ) ) ( TRUCK-AT ?auto_4688 ?auto_4686 ) ( not ( = ?auto_4686 ?auto_4687 ) ) ( HOIST-AT ?auto_4685 ?auto_4686 ) ( LIFTING ?auto_4685 ?auto_4683 ) ( not ( = ?auto_4684 ?auto_4685 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4682 ?auto_4683 )
      ( MAKE-2CRATE-VERIFY ?auto_4681 ?auto_4682 ?auto_4683 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4689 - SURFACE
      ?auto_4690 - SURFACE
    )
    :vars
    (
      ?auto_4691 - HOIST
      ?auto_4693 - PLACE
      ?auto_4695 - SURFACE
      ?auto_4692 - TRUCK
      ?auto_4694 - PLACE
      ?auto_4696 - HOIST
      ?auto_4697 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4691 ?auto_4693 ) ( SURFACE-AT ?auto_4689 ?auto_4693 ) ( CLEAR ?auto_4689 ) ( IS-CRATE ?auto_4690 ) ( not ( = ?auto_4689 ?auto_4690 ) ) ( AVAILABLE ?auto_4691 ) ( ON ?auto_4689 ?auto_4695 ) ( not ( = ?auto_4695 ?auto_4689 ) ) ( not ( = ?auto_4695 ?auto_4690 ) ) ( TRUCK-AT ?auto_4692 ?auto_4694 ) ( not ( = ?auto_4694 ?auto_4693 ) ) ( HOIST-AT ?auto_4696 ?auto_4694 ) ( not ( = ?auto_4691 ?auto_4696 ) ) ( AVAILABLE ?auto_4696 ) ( SURFACE-AT ?auto_4690 ?auto_4694 ) ( ON ?auto_4690 ?auto_4697 ) ( CLEAR ?auto_4690 ) ( not ( = ?auto_4689 ?auto_4697 ) ) ( not ( = ?auto_4690 ?auto_4697 ) ) ( not ( = ?auto_4695 ?auto_4697 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4696 ?auto_4690 ?auto_4697 ?auto_4694 )
      ( MAKE-2CRATE ?auto_4695 ?auto_4689 ?auto_4690 )
      ( MAKE-1CRATE-VERIFY ?auto_4689 ?auto_4690 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4698 - SURFACE
      ?auto_4699 - SURFACE
      ?auto_4700 - SURFACE
    )
    :vars
    (
      ?auto_4705 - HOIST
      ?auto_4703 - PLACE
      ?auto_4702 - TRUCK
      ?auto_4706 - PLACE
      ?auto_4704 - HOIST
      ?auto_4701 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4705 ?auto_4703 ) ( SURFACE-AT ?auto_4699 ?auto_4703 ) ( CLEAR ?auto_4699 ) ( IS-CRATE ?auto_4700 ) ( not ( = ?auto_4699 ?auto_4700 ) ) ( AVAILABLE ?auto_4705 ) ( ON ?auto_4699 ?auto_4698 ) ( not ( = ?auto_4698 ?auto_4699 ) ) ( not ( = ?auto_4698 ?auto_4700 ) ) ( TRUCK-AT ?auto_4702 ?auto_4706 ) ( not ( = ?auto_4706 ?auto_4703 ) ) ( HOIST-AT ?auto_4704 ?auto_4706 ) ( not ( = ?auto_4705 ?auto_4704 ) ) ( AVAILABLE ?auto_4704 ) ( SURFACE-AT ?auto_4700 ?auto_4706 ) ( ON ?auto_4700 ?auto_4701 ) ( CLEAR ?auto_4700 ) ( not ( = ?auto_4699 ?auto_4701 ) ) ( not ( = ?auto_4700 ?auto_4701 ) ) ( not ( = ?auto_4698 ?auto_4701 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4699 ?auto_4700 )
      ( MAKE-2CRATE-VERIFY ?auto_4698 ?auto_4699 ?auto_4700 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4707 - SURFACE
      ?auto_4708 - SURFACE
    )
    :vars
    (
      ?auto_4713 - HOIST
      ?auto_4709 - PLACE
      ?auto_4712 - SURFACE
      ?auto_4714 - PLACE
      ?auto_4715 - HOIST
      ?auto_4711 - SURFACE
      ?auto_4710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4713 ?auto_4709 ) ( SURFACE-AT ?auto_4707 ?auto_4709 ) ( CLEAR ?auto_4707 ) ( IS-CRATE ?auto_4708 ) ( not ( = ?auto_4707 ?auto_4708 ) ) ( AVAILABLE ?auto_4713 ) ( ON ?auto_4707 ?auto_4712 ) ( not ( = ?auto_4712 ?auto_4707 ) ) ( not ( = ?auto_4712 ?auto_4708 ) ) ( not ( = ?auto_4714 ?auto_4709 ) ) ( HOIST-AT ?auto_4715 ?auto_4714 ) ( not ( = ?auto_4713 ?auto_4715 ) ) ( AVAILABLE ?auto_4715 ) ( SURFACE-AT ?auto_4708 ?auto_4714 ) ( ON ?auto_4708 ?auto_4711 ) ( CLEAR ?auto_4708 ) ( not ( = ?auto_4707 ?auto_4711 ) ) ( not ( = ?auto_4708 ?auto_4711 ) ) ( not ( = ?auto_4712 ?auto_4711 ) ) ( TRUCK-AT ?auto_4710 ?auto_4709 ) )
    :subtasks
    ( ( !DRIVE ?auto_4710 ?auto_4709 ?auto_4714 )
      ( MAKE-2CRATE ?auto_4712 ?auto_4707 ?auto_4708 )
      ( MAKE-1CRATE-VERIFY ?auto_4707 ?auto_4708 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4716 - SURFACE
      ?auto_4717 - SURFACE
      ?auto_4718 - SURFACE
    )
    :vars
    (
      ?auto_4723 - HOIST
      ?auto_4720 - PLACE
      ?auto_4724 - PLACE
      ?auto_4722 - HOIST
      ?auto_4719 - SURFACE
      ?auto_4721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4723 ?auto_4720 ) ( SURFACE-AT ?auto_4717 ?auto_4720 ) ( CLEAR ?auto_4717 ) ( IS-CRATE ?auto_4718 ) ( not ( = ?auto_4717 ?auto_4718 ) ) ( AVAILABLE ?auto_4723 ) ( ON ?auto_4717 ?auto_4716 ) ( not ( = ?auto_4716 ?auto_4717 ) ) ( not ( = ?auto_4716 ?auto_4718 ) ) ( not ( = ?auto_4724 ?auto_4720 ) ) ( HOIST-AT ?auto_4722 ?auto_4724 ) ( not ( = ?auto_4723 ?auto_4722 ) ) ( AVAILABLE ?auto_4722 ) ( SURFACE-AT ?auto_4718 ?auto_4724 ) ( ON ?auto_4718 ?auto_4719 ) ( CLEAR ?auto_4718 ) ( not ( = ?auto_4717 ?auto_4719 ) ) ( not ( = ?auto_4718 ?auto_4719 ) ) ( not ( = ?auto_4716 ?auto_4719 ) ) ( TRUCK-AT ?auto_4721 ?auto_4720 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4717 ?auto_4718 )
      ( MAKE-2CRATE-VERIFY ?auto_4716 ?auto_4717 ?auto_4718 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4725 - SURFACE
      ?auto_4726 - SURFACE
    )
    :vars
    (
      ?auto_4731 - HOIST
      ?auto_4728 - PLACE
      ?auto_4729 - SURFACE
      ?auto_4732 - PLACE
      ?auto_4730 - HOIST
      ?auto_4727 - SURFACE
      ?auto_4733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4731 ?auto_4728 ) ( IS-CRATE ?auto_4726 ) ( not ( = ?auto_4725 ?auto_4726 ) ) ( not ( = ?auto_4729 ?auto_4725 ) ) ( not ( = ?auto_4729 ?auto_4726 ) ) ( not ( = ?auto_4732 ?auto_4728 ) ) ( HOIST-AT ?auto_4730 ?auto_4732 ) ( not ( = ?auto_4731 ?auto_4730 ) ) ( AVAILABLE ?auto_4730 ) ( SURFACE-AT ?auto_4726 ?auto_4732 ) ( ON ?auto_4726 ?auto_4727 ) ( CLEAR ?auto_4726 ) ( not ( = ?auto_4725 ?auto_4727 ) ) ( not ( = ?auto_4726 ?auto_4727 ) ) ( not ( = ?auto_4729 ?auto_4727 ) ) ( TRUCK-AT ?auto_4733 ?auto_4728 ) ( SURFACE-AT ?auto_4729 ?auto_4728 ) ( CLEAR ?auto_4729 ) ( LIFTING ?auto_4731 ?auto_4725 ) ( IS-CRATE ?auto_4725 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4729 ?auto_4725 )
      ( MAKE-2CRATE ?auto_4729 ?auto_4725 ?auto_4726 )
      ( MAKE-1CRATE-VERIFY ?auto_4725 ?auto_4726 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4734 - SURFACE
      ?auto_4735 - SURFACE
      ?auto_4736 - SURFACE
    )
    :vars
    (
      ?auto_4738 - HOIST
      ?auto_4739 - PLACE
      ?auto_4740 - PLACE
      ?auto_4737 - HOIST
      ?auto_4742 - SURFACE
      ?auto_4741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4738 ?auto_4739 ) ( IS-CRATE ?auto_4736 ) ( not ( = ?auto_4735 ?auto_4736 ) ) ( not ( = ?auto_4734 ?auto_4735 ) ) ( not ( = ?auto_4734 ?auto_4736 ) ) ( not ( = ?auto_4740 ?auto_4739 ) ) ( HOIST-AT ?auto_4737 ?auto_4740 ) ( not ( = ?auto_4738 ?auto_4737 ) ) ( AVAILABLE ?auto_4737 ) ( SURFACE-AT ?auto_4736 ?auto_4740 ) ( ON ?auto_4736 ?auto_4742 ) ( CLEAR ?auto_4736 ) ( not ( = ?auto_4735 ?auto_4742 ) ) ( not ( = ?auto_4736 ?auto_4742 ) ) ( not ( = ?auto_4734 ?auto_4742 ) ) ( TRUCK-AT ?auto_4741 ?auto_4739 ) ( SURFACE-AT ?auto_4734 ?auto_4739 ) ( CLEAR ?auto_4734 ) ( LIFTING ?auto_4738 ?auto_4735 ) ( IS-CRATE ?auto_4735 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4735 ?auto_4736 )
      ( MAKE-2CRATE-VERIFY ?auto_4734 ?auto_4735 ?auto_4736 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4743 - SURFACE
      ?auto_4744 - SURFACE
    )
    :vars
    (
      ?auto_4750 - HOIST
      ?auto_4746 - PLACE
      ?auto_4747 - SURFACE
      ?auto_4745 - PLACE
      ?auto_4748 - HOIST
      ?auto_4751 - SURFACE
      ?auto_4749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4750 ?auto_4746 ) ( IS-CRATE ?auto_4744 ) ( not ( = ?auto_4743 ?auto_4744 ) ) ( not ( = ?auto_4747 ?auto_4743 ) ) ( not ( = ?auto_4747 ?auto_4744 ) ) ( not ( = ?auto_4745 ?auto_4746 ) ) ( HOIST-AT ?auto_4748 ?auto_4745 ) ( not ( = ?auto_4750 ?auto_4748 ) ) ( AVAILABLE ?auto_4748 ) ( SURFACE-AT ?auto_4744 ?auto_4745 ) ( ON ?auto_4744 ?auto_4751 ) ( CLEAR ?auto_4744 ) ( not ( = ?auto_4743 ?auto_4751 ) ) ( not ( = ?auto_4744 ?auto_4751 ) ) ( not ( = ?auto_4747 ?auto_4751 ) ) ( TRUCK-AT ?auto_4749 ?auto_4746 ) ( SURFACE-AT ?auto_4747 ?auto_4746 ) ( CLEAR ?auto_4747 ) ( IS-CRATE ?auto_4743 ) ( AVAILABLE ?auto_4750 ) ( IN ?auto_4743 ?auto_4749 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4750 ?auto_4743 ?auto_4749 ?auto_4746 )
      ( MAKE-2CRATE ?auto_4747 ?auto_4743 ?auto_4744 )
      ( MAKE-1CRATE-VERIFY ?auto_4743 ?auto_4744 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4752 - SURFACE
      ?auto_4753 - SURFACE
      ?auto_4754 - SURFACE
    )
    :vars
    (
      ?auto_4759 - HOIST
      ?auto_4755 - PLACE
      ?auto_4756 - PLACE
      ?auto_4758 - HOIST
      ?auto_4760 - SURFACE
      ?auto_4757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4759 ?auto_4755 ) ( IS-CRATE ?auto_4754 ) ( not ( = ?auto_4753 ?auto_4754 ) ) ( not ( = ?auto_4752 ?auto_4753 ) ) ( not ( = ?auto_4752 ?auto_4754 ) ) ( not ( = ?auto_4756 ?auto_4755 ) ) ( HOIST-AT ?auto_4758 ?auto_4756 ) ( not ( = ?auto_4759 ?auto_4758 ) ) ( AVAILABLE ?auto_4758 ) ( SURFACE-AT ?auto_4754 ?auto_4756 ) ( ON ?auto_4754 ?auto_4760 ) ( CLEAR ?auto_4754 ) ( not ( = ?auto_4753 ?auto_4760 ) ) ( not ( = ?auto_4754 ?auto_4760 ) ) ( not ( = ?auto_4752 ?auto_4760 ) ) ( TRUCK-AT ?auto_4757 ?auto_4755 ) ( SURFACE-AT ?auto_4752 ?auto_4755 ) ( CLEAR ?auto_4752 ) ( IS-CRATE ?auto_4753 ) ( AVAILABLE ?auto_4759 ) ( IN ?auto_4753 ?auto_4757 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4753 ?auto_4754 )
      ( MAKE-2CRATE-VERIFY ?auto_4752 ?auto_4753 ?auto_4754 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4797 - SURFACE
      ?auto_4798 - SURFACE
    )
    :vars
    (
      ?auto_4805 - HOIST
      ?auto_4801 - PLACE
      ?auto_4799 - SURFACE
      ?auto_4803 - PLACE
      ?auto_4804 - HOIST
      ?auto_4802 - SURFACE
      ?auto_4800 - TRUCK
      ?auto_4806 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4805 ?auto_4801 ) ( SURFACE-AT ?auto_4797 ?auto_4801 ) ( CLEAR ?auto_4797 ) ( IS-CRATE ?auto_4798 ) ( not ( = ?auto_4797 ?auto_4798 ) ) ( AVAILABLE ?auto_4805 ) ( ON ?auto_4797 ?auto_4799 ) ( not ( = ?auto_4799 ?auto_4797 ) ) ( not ( = ?auto_4799 ?auto_4798 ) ) ( not ( = ?auto_4803 ?auto_4801 ) ) ( HOIST-AT ?auto_4804 ?auto_4803 ) ( not ( = ?auto_4805 ?auto_4804 ) ) ( AVAILABLE ?auto_4804 ) ( SURFACE-AT ?auto_4798 ?auto_4803 ) ( ON ?auto_4798 ?auto_4802 ) ( CLEAR ?auto_4798 ) ( not ( = ?auto_4797 ?auto_4802 ) ) ( not ( = ?auto_4798 ?auto_4802 ) ) ( not ( = ?auto_4799 ?auto_4802 ) ) ( TRUCK-AT ?auto_4800 ?auto_4806 ) ( not ( = ?auto_4806 ?auto_4801 ) ) ( not ( = ?auto_4803 ?auto_4806 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4800 ?auto_4806 ?auto_4801 )
      ( MAKE-1CRATE ?auto_4797 ?auto_4798 )
      ( MAKE-1CRATE-VERIFY ?auto_4797 ?auto_4798 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4837 - SURFACE
      ?auto_4838 - SURFACE
      ?auto_4839 - SURFACE
      ?auto_4836 - SURFACE
    )
    :vars
    (
      ?auto_4840 - HOIST
      ?auto_4841 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4840 ?auto_4841 ) ( SURFACE-AT ?auto_4839 ?auto_4841 ) ( CLEAR ?auto_4839 ) ( LIFTING ?auto_4840 ?auto_4836 ) ( IS-CRATE ?auto_4836 ) ( not ( = ?auto_4839 ?auto_4836 ) ) ( ON ?auto_4838 ?auto_4837 ) ( ON ?auto_4839 ?auto_4838 ) ( not ( = ?auto_4837 ?auto_4838 ) ) ( not ( = ?auto_4837 ?auto_4839 ) ) ( not ( = ?auto_4837 ?auto_4836 ) ) ( not ( = ?auto_4838 ?auto_4839 ) ) ( not ( = ?auto_4838 ?auto_4836 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4839 ?auto_4836 )
      ( MAKE-3CRATE-VERIFY ?auto_4837 ?auto_4838 ?auto_4839 ?auto_4836 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4854 - SURFACE
      ?auto_4855 - SURFACE
      ?auto_4856 - SURFACE
      ?auto_4853 - SURFACE
    )
    :vars
    (
      ?auto_4859 - HOIST
      ?auto_4858 - PLACE
      ?auto_4857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4859 ?auto_4858 ) ( SURFACE-AT ?auto_4856 ?auto_4858 ) ( CLEAR ?auto_4856 ) ( IS-CRATE ?auto_4853 ) ( not ( = ?auto_4856 ?auto_4853 ) ) ( TRUCK-AT ?auto_4857 ?auto_4858 ) ( AVAILABLE ?auto_4859 ) ( IN ?auto_4853 ?auto_4857 ) ( ON ?auto_4856 ?auto_4855 ) ( not ( = ?auto_4855 ?auto_4856 ) ) ( not ( = ?auto_4855 ?auto_4853 ) ) ( ON ?auto_4855 ?auto_4854 ) ( not ( = ?auto_4854 ?auto_4855 ) ) ( not ( = ?auto_4854 ?auto_4856 ) ) ( not ( = ?auto_4854 ?auto_4853 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4855 ?auto_4856 ?auto_4853 )
      ( MAKE-3CRATE-VERIFY ?auto_4854 ?auto_4855 ?auto_4856 ?auto_4853 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4875 - SURFACE
      ?auto_4876 - SURFACE
      ?auto_4877 - SURFACE
      ?auto_4874 - SURFACE
    )
    :vars
    (
      ?auto_4878 - HOIST
      ?auto_4881 - PLACE
      ?auto_4879 - TRUCK
      ?auto_4880 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4878 ?auto_4881 ) ( SURFACE-AT ?auto_4877 ?auto_4881 ) ( CLEAR ?auto_4877 ) ( IS-CRATE ?auto_4874 ) ( not ( = ?auto_4877 ?auto_4874 ) ) ( AVAILABLE ?auto_4878 ) ( IN ?auto_4874 ?auto_4879 ) ( ON ?auto_4877 ?auto_4876 ) ( not ( = ?auto_4876 ?auto_4877 ) ) ( not ( = ?auto_4876 ?auto_4874 ) ) ( TRUCK-AT ?auto_4879 ?auto_4880 ) ( not ( = ?auto_4880 ?auto_4881 ) ) ( ON ?auto_4876 ?auto_4875 ) ( not ( = ?auto_4875 ?auto_4876 ) ) ( not ( = ?auto_4875 ?auto_4877 ) ) ( not ( = ?auto_4875 ?auto_4874 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4876 ?auto_4877 ?auto_4874 )
      ( MAKE-3CRATE-VERIFY ?auto_4875 ?auto_4876 ?auto_4877 ?auto_4874 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4899 - SURFACE
      ?auto_4900 - SURFACE
      ?auto_4901 - SURFACE
      ?auto_4898 - SURFACE
    )
    :vars
    (
      ?auto_4905 - HOIST
      ?auto_4903 - PLACE
      ?auto_4906 - TRUCK
      ?auto_4904 - PLACE
      ?auto_4902 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4905 ?auto_4903 ) ( SURFACE-AT ?auto_4901 ?auto_4903 ) ( CLEAR ?auto_4901 ) ( IS-CRATE ?auto_4898 ) ( not ( = ?auto_4901 ?auto_4898 ) ) ( AVAILABLE ?auto_4905 ) ( ON ?auto_4901 ?auto_4900 ) ( not ( = ?auto_4900 ?auto_4901 ) ) ( not ( = ?auto_4900 ?auto_4898 ) ) ( TRUCK-AT ?auto_4906 ?auto_4904 ) ( not ( = ?auto_4904 ?auto_4903 ) ) ( HOIST-AT ?auto_4902 ?auto_4904 ) ( LIFTING ?auto_4902 ?auto_4898 ) ( not ( = ?auto_4905 ?auto_4902 ) ) ( ON ?auto_4900 ?auto_4899 ) ( not ( = ?auto_4899 ?auto_4900 ) ) ( not ( = ?auto_4899 ?auto_4901 ) ) ( not ( = ?auto_4899 ?auto_4898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4900 ?auto_4901 ?auto_4898 )
      ( MAKE-3CRATE-VERIFY ?auto_4899 ?auto_4900 ?auto_4901 ?auto_4898 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4926 - SURFACE
      ?auto_4927 - SURFACE
      ?auto_4928 - SURFACE
      ?auto_4925 - SURFACE
    )
    :vars
    (
      ?auto_4931 - HOIST
      ?auto_4930 - PLACE
      ?auto_4933 - TRUCK
      ?auto_4932 - PLACE
      ?auto_4929 - HOIST
      ?auto_4934 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4931 ?auto_4930 ) ( SURFACE-AT ?auto_4928 ?auto_4930 ) ( CLEAR ?auto_4928 ) ( IS-CRATE ?auto_4925 ) ( not ( = ?auto_4928 ?auto_4925 ) ) ( AVAILABLE ?auto_4931 ) ( ON ?auto_4928 ?auto_4927 ) ( not ( = ?auto_4927 ?auto_4928 ) ) ( not ( = ?auto_4927 ?auto_4925 ) ) ( TRUCK-AT ?auto_4933 ?auto_4932 ) ( not ( = ?auto_4932 ?auto_4930 ) ) ( HOIST-AT ?auto_4929 ?auto_4932 ) ( not ( = ?auto_4931 ?auto_4929 ) ) ( AVAILABLE ?auto_4929 ) ( SURFACE-AT ?auto_4925 ?auto_4932 ) ( ON ?auto_4925 ?auto_4934 ) ( CLEAR ?auto_4925 ) ( not ( = ?auto_4928 ?auto_4934 ) ) ( not ( = ?auto_4925 ?auto_4934 ) ) ( not ( = ?auto_4927 ?auto_4934 ) ) ( ON ?auto_4927 ?auto_4926 ) ( not ( = ?auto_4926 ?auto_4927 ) ) ( not ( = ?auto_4926 ?auto_4928 ) ) ( not ( = ?auto_4926 ?auto_4925 ) ) ( not ( = ?auto_4926 ?auto_4934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4927 ?auto_4928 ?auto_4925 )
      ( MAKE-3CRATE-VERIFY ?auto_4926 ?auto_4927 ?auto_4928 ?auto_4925 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4954 - SURFACE
      ?auto_4955 - SURFACE
      ?auto_4956 - SURFACE
      ?auto_4953 - SURFACE
    )
    :vars
    (
      ?auto_4961 - HOIST
      ?auto_4962 - PLACE
      ?auto_4958 - PLACE
      ?auto_4960 - HOIST
      ?auto_4959 - SURFACE
      ?auto_4957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4961 ?auto_4962 ) ( SURFACE-AT ?auto_4956 ?auto_4962 ) ( CLEAR ?auto_4956 ) ( IS-CRATE ?auto_4953 ) ( not ( = ?auto_4956 ?auto_4953 ) ) ( AVAILABLE ?auto_4961 ) ( ON ?auto_4956 ?auto_4955 ) ( not ( = ?auto_4955 ?auto_4956 ) ) ( not ( = ?auto_4955 ?auto_4953 ) ) ( not ( = ?auto_4958 ?auto_4962 ) ) ( HOIST-AT ?auto_4960 ?auto_4958 ) ( not ( = ?auto_4961 ?auto_4960 ) ) ( AVAILABLE ?auto_4960 ) ( SURFACE-AT ?auto_4953 ?auto_4958 ) ( ON ?auto_4953 ?auto_4959 ) ( CLEAR ?auto_4953 ) ( not ( = ?auto_4956 ?auto_4959 ) ) ( not ( = ?auto_4953 ?auto_4959 ) ) ( not ( = ?auto_4955 ?auto_4959 ) ) ( TRUCK-AT ?auto_4957 ?auto_4962 ) ( ON ?auto_4955 ?auto_4954 ) ( not ( = ?auto_4954 ?auto_4955 ) ) ( not ( = ?auto_4954 ?auto_4956 ) ) ( not ( = ?auto_4954 ?auto_4953 ) ) ( not ( = ?auto_4954 ?auto_4959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4955 ?auto_4956 ?auto_4953 )
      ( MAKE-3CRATE-VERIFY ?auto_4954 ?auto_4955 ?auto_4956 ?auto_4953 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4982 - SURFACE
      ?auto_4983 - SURFACE
      ?auto_4984 - SURFACE
      ?auto_4981 - SURFACE
    )
    :vars
    (
      ?auto_4988 - HOIST
      ?auto_4986 - PLACE
      ?auto_4989 - PLACE
      ?auto_4985 - HOIST
      ?auto_4990 - SURFACE
      ?auto_4987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4988 ?auto_4986 ) ( IS-CRATE ?auto_4981 ) ( not ( = ?auto_4984 ?auto_4981 ) ) ( not ( = ?auto_4983 ?auto_4984 ) ) ( not ( = ?auto_4983 ?auto_4981 ) ) ( not ( = ?auto_4989 ?auto_4986 ) ) ( HOIST-AT ?auto_4985 ?auto_4989 ) ( not ( = ?auto_4988 ?auto_4985 ) ) ( AVAILABLE ?auto_4985 ) ( SURFACE-AT ?auto_4981 ?auto_4989 ) ( ON ?auto_4981 ?auto_4990 ) ( CLEAR ?auto_4981 ) ( not ( = ?auto_4984 ?auto_4990 ) ) ( not ( = ?auto_4981 ?auto_4990 ) ) ( not ( = ?auto_4983 ?auto_4990 ) ) ( TRUCK-AT ?auto_4987 ?auto_4986 ) ( SURFACE-AT ?auto_4983 ?auto_4986 ) ( CLEAR ?auto_4983 ) ( LIFTING ?auto_4988 ?auto_4984 ) ( IS-CRATE ?auto_4984 ) ( ON ?auto_4983 ?auto_4982 ) ( not ( = ?auto_4982 ?auto_4983 ) ) ( not ( = ?auto_4982 ?auto_4984 ) ) ( not ( = ?auto_4982 ?auto_4981 ) ) ( not ( = ?auto_4982 ?auto_4990 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4983 ?auto_4984 ?auto_4981 )
      ( MAKE-3CRATE-VERIFY ?auto_4982 ?auto_4983 ?auto_4984 ?auto_4981 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5010 - SURFACE
      ?auto_5011 - SURFACE
      ?auto_5012 - SURFACE
      ?auto_5009 - SURFACE
    )
    :vars
    (
      ?auto_5014 - HOIST
      ?auto_5016 - PLACE
      ?auto_5017 - PLACE
      ?auto_5018 - HOIST
      ?auto_5015 - SURFACE
      ?auto_5013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5014 ?auto_5016 ) ( IS-CRATE ?auto_5009 ) ( not ( = ?auto_5012 ?auto_5009 ) ) ( not ( = ?auto_5011 ?auto_5012 ) ) ( not ( = ?auto_5011 ?auto_5009 ) ) ( not ( = ?auto_5017 ?auto_5016 ) ) ( HOIST-AT ?auto_5018 ?auto_5017 ) ( not ( = ?auto_5014 ?auto_5018 ) ) ( AVAILABLE ?auto_5018 ) ( SURFACE-AT ?auto_5009 ?auto_5017 ) ( ON ?auto_5009 ?auto_5015 ) ( CLEAR ?auto_5009 ) ( not ( = ?auto_5012 ?auto_5015 ) ) ( not ( = ?auto_5009 ?auto_5015 ) ) ( not ( = ?auto_5011 ?auto_5015 ) ) ( TRUCK-AT ?auto_5013 ?auto_5016 ) ( SURFACE-AT ?auto_5011 ?auto_5016 ) ( CLEAR ?auto_5011 ) ( IS-CRATE ?auto_5012 ) ( AVAILABLE ?auto_5014 ) ( IN ?auto_5012 ?auto_5013 ) ( ON ?auto_5011 ?auto_5010 ) ( not ( = ?auto_5010 ?auto_5011 ) ) ( not ( = ?auto_5010 ?auto_5012 ) ) ( not ( = ?auto_5010 ?auto_5009 ) ) ( not ( = ?auto_5010 ?auto_5015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5011 ?auto_5012 ?auto_5009 )
      ( MAKE-3CRATE-VERIFY ?auto_5010 ?auto_5011 ?auto_5012 ?auto_5009 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5301 - SURFACE
      ?auto_5302 - SURFACE
      ?auto_5303 - SURFACE
      ?auto_5300 - SURFACE
      ?auto_5304 - SURFACE
    )
    :vars
    (
      ?auto_5306 - HOIST
      ?auto_5305 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5306 ?auto_5305 ) ( SURFACE-AT ?auto_5300 ?auto_5305 ) ( CLEAR ?auto_5300 ) ( LIFTING ?auto_5306 ?auto_5304 ) ( IS-CRATE ?auto_5304 ) ( not ( = ?auto_5300 ?auto_5304 ) ) ( ON ?auto_5302 ?auto_5301 ) ( ON ?auto_5303 ?auto_5302 ) ( ON ?auto_5300 ?auto_5303 ) ( not ( = ?auto_5301 ?auto_5302 ) ) ( not ( = ?auto_5301 ?auto_5303 ) ) ( not ( = ?auto_5301 ?auto_5300 ) ) ( not ( = ?auto_5301 ?auto_5304 ) ) ( not ( = ?auto_5302 ?auto_5303 ) ) ( not ( = ?auto_5302 ?auto_5300 ) ) ( not ( = ?auto_5302 ?auto_5304 ) ) ( not ( = ?auto_5303 ?auto_5300 ) ) ( not ( = ?auto_5303 ?auto_5304 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5300 ?auto_5304 )
      ( MAKE-4CRATE-VERIFY ?auto_5301 ?auto_5302 ?auto_5303 ?auto_5300 ?auto_5304 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5326 - SURFACE
      ?auto_5327 - SURFACE
      ?auto_5328 - SURFACE
      ?auto_5325 - SURFACE
      ?auto_5329 - SURFACE
    )
    :vars
    (
      ?auto_5330 - HOIST
      ?auto_5332 - PLACE
      ?auto_5331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5330 ?auto_5332 ) ( SURFACE-AT ?auto_5325 ?auto_5332 ) ( CLEAR ?auto_5325 ) ( IS-CRATE ?auto_5329 ) ( not ( = ?auto_5325 ?auto_5329 ) ) ( TRUCK-AT ?auto_5331 ?auto_5332 ) ( AVAILABLE ?auto_5330 ) ( IN ?auto_5329 ?auto_5331 ) ( ON ?auto_5325 ?auto_5328 ) ( not ( = ?auto_5328 ?auto_5325 ) ) ( not ( = ?auto_5328 ?auto_5329 ) ) ( ON ?auto_5327 ?auto_5326 ) ( ON ?auto_5328 ?auto_5327 ) ( not ( = ?auto_5326 ?auto_5327 ) ) ( not ( = ?auto_5326 ?auto_5328 ) ) ( not ( = ?auto_5326 ?auto_5325 ) ) ( not ( = ?auto_5326 ?auto_5329 ) ) ( not ( = ?auto_5327 ?auto_5328 ) ) ( not ( = ?auto_5327 ?auto_5325 ) ) ( not ( = ?auto_5327 ?auto_5329 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5328 ?auto_5325 ?auto_5329 )
      ( MAKE-4CRATE-VERIFY ?auto_5326 ?auto_5327 ?auto_5328 ?auto_5325 ?auto_5329 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5356 - SURFACE
      ?auto_5357 - SURFACE
      ?auto_5358 - SURFACE
      ?auto_5355 - SURFACE
      ?auto_5359 - SURFACE
    )
    :vars
    (
      ?auto_5361 - HOIST
      ?auto_5360 - PLACE
      ?auto_5363 - TRUCK
      ?auto_5362 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5361 ?auto_5360 ) ( SURFACE-AT ?auto_5355 ?auto_5360 ) ( CLEAR ?auto_5355 ) ( IS-CRATE ?auto_5359 ) ( not ( = ?auto_5355 ?auto_5359 ) ) ( AVAILABLE ?auto_5361 ) ( IN ?auto_5359 ?auto_5363 ) ( ON ?auto_5355 ?auto_5358 ) ( not ( = ?auto_5358 ?auto_5355 ) ) ( not ( = ?auto_5358 ?auto_5359 ) ) ( TRUCK-AT ?auto_5363 ?auto_5362 ) ( not ( = ?auto_5362 ?auto_5360 ) ) ( ON ?auto_5357 ?auto_5356 ) ( ON ?auto_5358 ?auto_5357 ) ( not ( = ?auto_5356 ?auto_5357 ) ) ( not ( = ?auto_5356 ?auto_5358 ) ) ( not ( = ?auto_5356 ?auto_5355 ) ) ( not ( = ?auto_5356 ?auto_5359 ) ) ( not ( = ?auto_5357 ?auto_5358 ) ) ( not ( = ?auto_5357 ?auto_5355 ) ) ( not ( = ?auto_5357 ?auto_5359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5358 ?auto_5355 ?auto_5359 )
      ( MAKE-4CRATE-VERIFY ?auto_5356 ?auto_5357 ?auto_5358 ?auto_5355 ?auto_5359 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5390 - SURFACE
      ?auto_5391 - SURFACE
      ?auto_5392 - SURFACE
      ?auto_5389 - SURFACE
      ?auto_5393 - SURFACE
    )
    :vars
    (
      ?auto_5396 - HOIST
      ?auto_5397 - PLACE
      ?auto_5394 - TRUCK
      ?auto_5395 - PLACE
      ?auto_5398 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5396 ?auto_5397 ) ( SURFACE-AT ?auto_5389 ?auto_5397 ) ( CLEAR ?auto_5389 ) ( IS-CRATE ?auto_5393 ) ( not ( = ?auto_5389 ?auto_5393 ) ) ( AVAILABLE ?auto_5396 ) ( ON ?auto_5389 ?auto_5392 ) ( not ( = ?auto_5392 ?auto_5389 ) ) ( not ( = ?auto_5392 ?auto_5393 ) ) ( TRUCK-AT ?auto_5394 ?auto_5395 ) ( not ( = ?auto_5395 ?auto_5397 ) ) ( HOIST-AT ?auto_5398 ?auto_5395 ) ( LIFTING ?auto_5398 ?auto_5393 ) ( not ( = ?auto_5396 ?auto_5398 ) ) ( ON ?auto_5391 ?auto_5390 ) ( ON ?auto_5392 ?auto_5391 ) ( not ( = ?auto_5390 ?auto_5391 ) ) ( not ( = ?auto_5390 ?auto_5392 ) ) ( not ( = ?auto_5390 ?auto_5389 ) ) ( not ( = ?auto_5390 ?auto_5393 ) ) ( not ( = ?auto_5391 ?auto_5392 ) ) ( not ( = ?auto_5391 ?auto_5389 ) ) ( not ( = ?auto_5391 ?auto_5393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5392 ?auto_5389 ?auto_5393 )
      ( MAKE-4CRATE-VERIFY ?auto_5390 ?auto_5391 ?auto_5392 ?auto_5389 ?auto_5393 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5428 - SURFACE
      ?auto_5429 - SURFACE
      ?auto_5430 - SURFACE
      ?auto_5427 - SURFACE
      ?auto_5431 - SURFACE
    )
    :vars
    (
      ?auto_5436 - HOIST
      ?auto_5437 - PLACE
      ?auto_5432 - TRUCK
      ?auto_5434 - PLACE
      ?auto_5433 - HOIST
      ?auto_5435 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5436 ?auto_5437 ) ( SURFACE-AT ?auto_5427 ?auto_5437 ) ( CLEAR ?auto_5427 ) ( IS-CRATE ?auto_5431 ) ( not ( = ?auto_5427 ?auto_5431 ) ) ( AVAILABLE ?auto_5436 ) ( ON ?auto_5427 ?auto_5430 ) ( not ( = ?auto_5430 ?auto_5427 ) ) ( not ( = ?auto_5430 ?auto_5431 ) ) ( TRUCK-AT ?auto_5432 ?auto_5434 ) ( not ( = ?auto_5434 ?auto_5437 ) ) ( HOIST-AT ?auto_5433 ?auto_5434 ) ( not ( = ?auto_5436 ?auto_5433 ) ) ( AVAILABLE ?auto_5433 ) ( SURFACE-AT ?auto_5431 ?auto_5434 ) ( ON ?auto_5431 ?auto_5435 ) ( CLEAR ?auto_5431 ) ( not ( = ?auto_5427 ?auto_5435 ) ) ( not ( = ?auto_5431 ?auto_5435 ) ) ( not ( = ?auto_5430 ?auto_5435 ) ) ( ON ?auto_5429 ?auto_5428 ) ( ON ?auto_5430 ?auto_5429 ) ( not ( = ?auto_5428 ?auto_5429 ) ) ( not ( = ?auto_5428 ?auto_5430 ) ) ( not ( = ?auto_5428 ?auto_5427 ) ) ( not ( = ?auto_5428 ?auto_5431 ) ) ( not ( = ?auto_5428 ?auto_5435 ) ) ( not ( = ?auto_5429 ?auto_5430 ) ) ( not ( = ?auto_5429 ?auto_5427 ) ) ( not ( = ?auto_5429 ?auto_5431 ) ) ( not ( = ?auto_5429 ?auto_5435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5430 ?auto_5427 ?auto_5431 )
      ( MAKE-4CRATE-VERIFY ?auto_5428 ?auto_5429 ?auto_5430 ?auto_5427 ?auto_5431 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5467 - SURFACE
      ?auto_5468 - SURFACE
      ?auto_5469 - SURFACE
      ?auto_5466 - SURFACE
      ?auto_5470 - SURFACE
    )
    :vars
    (
      ?auto_5471 - HOIST
      ?auto_5473 - PLACE
      ?auto_5475 - PLACE
      ?auto_5476 - HOIST
      ?auto_5472 - SURFACE
      ?auto_5474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5471 ?auto_5473 ) ( SURFACE-AT ?auto_5466 ?auto_5473 ) ( CLEAR ?auto_5466 ) ( IS-CRATE ?auto_5470 ) ( not ( = ?auto_5466 ?auto_5470 ) ) ( AVAILABLE ?auto_5471 ) ( ON ?auto_5466 ?auto_5469 ) ( not ( = ?auto_5469 ?auto_5466 ) ) ( not ( = ?auto_5469 ?auto_5470 ) ) ( not ( = ?auto_5475 ?auto_5473 ) ) ( HOIST-AT ?auto_5476 ?auto_5475 ) ( not ( = ?auto_5471 ?auto_5476 ) ) ( AVAILABLE ?auto_5476 ) ( SURFACE-AT ?auto_5470 ?auto_5475 ) ( ON ?auto_5470 ?auto_5472 ) ( CLEAR ?auto_5470 ) ( not ( = ?auto_5466 ?auto_5472 ) ) ( not ( = ?auto_5470 ?auto_5472 ) ) ( not ( = ?auto_5469 ?auto_5472 ) ) ( TRUCK-AT ?auto_5474 ?auto_5473 ) ( ON ?auto_5468 ?auto_5467 ) ( ON ?auto_5469 ?auto_5468 ) ( not ( = ?auto_5467 ?auto_5468 ) ) ( not ( = ?auto_5467 ?auto_5469 ) ) ( not ( = ?auto_5467 ?auto_5466 ) ) ( not ( = ?auto_5467 ?auto_5470 ) ) ( not ( = ?auto_5467 ?auto_5472 ) ) ( not ( = ?auto_5468 ?auto_5469 ) ) ( not ( = ?auto_5468 ?auto_5466 ) ) ( not ( = ?auto_5468 ?auto_5470 ) ) ( not ( = ?auto_5468 ?auto_5472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5469 ?auto_5466 ?auto_5470 )
      ( MAKE-4CRATE-VERIFY ?auto_5467 ?auto_5468 ?auto_5469 ?auto_5466 ?auto_5470 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5506 - SURFACE
      ?auto_5507 - SURFACE
      ?auto_5508 - SURFACE
      ?auto_5505 - SURFACE
      ?auto_5509 - SURFACE
    )
    :vars
    (
      ?auto_5511 - HOIST
      ?auto_5515 - PLACE
      ?auto_5512 - PLACE
      ?auto_5510 - HOIST
      ?auto_5514 - SURFACE
      ?auto_5513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5511 ?auto_5515 ) ( IS-CRATE ?auto_5509 ) ( not ( = ?auto_5505 ?auto_5509 ) ) ( not ( = ?auto_5508 ?auto_5505 ) ) ( not ( = ?auto_5508 ?auto_5509 ) ) ( not ( = ?auto_5512 ?auto_5515 ) ) ( HOIST-AT ?auto_5510 ?auto_5512 ) ( not ( = ?auto_5511 ?auto_5510 ) ) ( AVAILABLE ?auto_5510 ) ( SURFACE-AT ?auto_5509 ?auto_5512 ) ( ON ?auto_5509 ?auto_5514 ) ( CLEAR ?auto_5509 ) ( not ( = ?auto_5505 ?auto_5514 ) ) ( not ( = ?auto_5509 ?auto_5514 ) ) ( not ( = ?auto_5508 ?auto_5514 ) ) ( TRUCK-AT ?auto_5513 ?auto_5515 ) ( SURFACE-AT ?auto_5508 ?auto_5515 ) ( CLEAR ?auto_5508 ) ( LIFTING ?auto_5511 ?auto_5505 ) ( IS-CRATE ?auto_5505 ) ( ON ?auto_5507 ?auto_5506 ) ( ON ?auto_5508 ?auto_5507 ) ( not ( = ?auto_5506 ?auto_5507 ) ) ( not ( = ?auto_5506 ?auto_5508 ) ) ( not ( = ?auto_5506 ?auto_5505 ) ) ( not ( = ?auto_5506 ?auto_5509 ) ) ( not ( = ?auto_5506 ?auto_5514 ) ) ( not ( = ?auto_5507 ?auto_5508 ) ) ( not ( = ?auto_5507 ?auto_5505 ) ) ( not ( = ?auto_5507 ?auto_5509 ) ) ( not ( = ?auto_5507 ?auto_5514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5508 ?auto_5505 ?auto_5509 )
      ( MAKE-4CRATE-VERIFY ?auto_5506 ?auto_5507 ?auto_5508 ?auto_5505 ?auto_5509 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5545 - SURFACE
      ?auto_5546 - SURFACE
      ?auto_5547 - SURFACE
      ?auto_5544 - SURFACE
      ?auto_5548 - SURFACE
    )
    :vars
    (
      ?auto_5553 - HOIST
      ?auto_5554 - PLACE
      ?auto_5552 - PLACE
      ?auto_5549 - HOIST
      ?auto_5550 - SURFACE
      ?auto_5551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5553 ?auto_5554 ) ( IS-CRATE ?auto_5548 ) ( not ( = ?auto_5544 ?auto_5548 ) ) ( not ( = ?auto_5547 ?auto_5544 ) ) ( not ( = ?auto_5547 ?auto_5548 ) ) ( not ( = ?auto_5552 ?auto_5554 ) ) ( HOIST-AT ?auto_5549 ?auto_5552 ) ( not ( = ?auto_5553 ?auto_5549 ) ) ( AVAILABLE ?auto_5549 ) ( SURFACE-AT ?auto_5548 ?auto_5552 ) ( ON ?auto_5548 ?auto_5550 ) ( CLEAR ?auto_5548 ) ( not ( = ?auto_5544 ?auto_5550 ) ) ( not ( = ?auto_5548 ?auto_5550 ) ) ( not ( = ?auto_5547 ?auto_5550 ) ) ( TRUCK-AT ?auto_5551 ?auto_5554 ) ( SURFACE-AT ?auto_5547 ?auto_5554 ) ( CLEAR ?auto_5547 ) ( IS-CRATE ?auto_5544 ) ( AVAILABLE ?auto_5553 ) ( IN ?auto_5544 ?auto_5551 ) ( ON ?auto_5546 ?auto_5545 ) ( ON ?auto_5547 ?auto_5546 ) ( not ( = ?auto_5545 ?auto_5546 ) ) ( not ( = ?auto_5545 ?auto_5547 ) ) ( not ( = ?auto_5545 ?auto_5544 ) ) ( not ( = ?auto_5545 ?auto_5548 ) ) ( not ( = ?auto_5545 ?auto_5550 ) ) ( not ( = ?auto_5546 ?auto_5547 ) ) ( not ( = ?auto_5546 ?auto_5544 ) ) ( not ( = ?auto_5546 ?auto_5548 ) ) ( not ( = ?auto_5546 ?auto_5550 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5547 ?auto_5544 ?auto_5548 )
      ( MAKE-4CRATE-VERIFY ?auto_5545 ?auto_5546 ?auto_5547 ?auto_5544 ?auto_5548 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6045 - SURFACE
      ?auto_6046 - SURFACE
    )
    :vars
    (
      ?auto_6050 - HOIST
      ?auto_6052 - PLACE
      ?auto_6053 - SURFACE
      ?auto_6051 - TRUCK
      ?auto_6049 - PLACE
      ?auto_6047 - HOIST
      ?auto_6048 - SURFACE
      ?auto_6054 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6050 ?auto_6052 ) ( SURFACE-AT ?auto_6045 ?auto_6052 ) ( CLEAR ?auto_6045 ) ( IS-CRATE ?auto_6046 ) ( not ( = ?auto_6045 ?auto_6046 ) ) ( AVAILABLE ?auto_6050 ) ( ON ?auto_6045 ?auto_6053 ) ( not ( = ?auto_6053 ?auto_6045 ) ) ( not ( = ?auto_6053 ?auto_6046 ) ) ( TRUCK-AT ?auto_6051 ?auto_6049 ) ( not ( = ?auto_6049 ?auto_6052 ) ) ( HOIST-AT ?auto_6047 ?auto_6049 ) ( not ( = ?auto_6050 ?auto_6047 ) ) ( SURFACE-AT ?auto_6046 ?auto_6049 ) ( ON ?auto_6046 ?auto_6048 ) ( CLEAR ?auto_6046 ) ( not ( = ?auto_6045 ?auto_6048 ) ) ( not ( = ?auto_6046 ?auto_6048 ) ) ( not ( = ?auto_6053 ?auto_6048 ) ) ( LIFTING ?auto_6047 ?auto_6054 ) ( IS-CRATE ?auto_6054 ) ( not ( = ?auto_6045 ?auto_6054 ) ) ( not ( = ?auto_6046 ?auto_6054 ) ) ( not ( = ?auto_6053 ?auto_6054 ) ) ( not ( = ?auto_6048 ?auto_6054 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6047 ?auto_6054 ?auto_6051 ?auto_6049 )
      ( MAKE-1CRATE ?auto_6045 ?auto_6046 )
      ( MAKE-1CRATE-VERIFY ?auto_6045 ?auto_6046 ) )
  )

)

