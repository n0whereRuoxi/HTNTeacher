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
      ?auto_4642 - SURFACE
      ?auto_4643 - SURFACE
    )
    :vars
    (
      ?auto_4644 - HOIST
      ?auto_4645 - PLACE
      ?auto_4647 - PLACE
      ?auto_4648 - HOIST
      ?auto_4649 - SURFACE
      ?auto_4646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4644 ?auto_4645 ) ( SURFACE-AT ?auto_4643 ?auto_4645 ) ( CLEAR ?auto_4643 ) ( IS-CRATE ?auto_4642 ) ( AVAILABLE ?auto_4644 ) ( not ( = ?auto_4647 ?auto_4645 ) ) ( HOIST-AT ?auto_4648 ?auto_4647 ) ( AVAILABLE ?auto_4648 ) ( SURFACE-AT ?auto_4642 ?auto_4647 ) ( ON ?auto_4642 ?auto_4649 ) ( CLEAR ?auto_4642 ) ( TRUCK-AT ?auto_4646 ?auto_4645 ) ( not ( = ?auto_4642 ?auto_4643 ) ) ( not ( = ?auto_4642 ?auto_4649 ) ) ( not ( = ?auto_4643 ?auto_4649 ) ) ( not ( = ?auto_4644 ?auto_4648 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4646 ?auto_4645 ?auto_4647 )
      ( !LIFT ?auto_4648 ?auto_4642 ?auto_4649 ?auto_4647 )
      ( !LOAD ?auto_4648 ?auto_4642 ?auto_4646 ?auto_4647 )
      ( !DRIVE ?auto_4646 ?auto_4647 ?auto_4645 )
      ( !UNLOAD ?auto_4644 ?auto_4642 ?auto_4646 ?auto_4645 )
      ( !DROP ?auto_4644 ?auto_4642 ?auto_4643 ?auto_4645 )
      ( MAKE-ON-VERIFY ?auto_4642 ?auto_4643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4652 - SURFACE
      ?auto_4653 - SURFACE
    )
    :vars
    (
      ?auto_4654 - HOIST
      ?auto_4655 - PLACE
      ?auto_4657 - PLACE
      ?auto_4658 - HOIST
      ?auto_4659 - SURFACE
      ?auto_4656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4654 ?auto_4655 ) ( SURFACE-AT ?auto_4653 ?auto_4655 ) ( CLEAR ?auto_4653 ) ( IS-CRATE ?auto_4652 ) ( AVAILABLE ?auto_4654 ) ( not ( = ?auto_4657 ?auto_4655 ) ) ( HOIST-AT ?auto_4658 ?auto_4657 ) ( AVAILABLE ?auto_4658 ) ( SURFACE-AT ?auto_4652 ?auto_4657 ) ( ON ?auto_4652 ?auto_4659 ) ( CLEAR ?auto_4652 ) ( TRUCK-AT ?auto_4656 ?auto_4655 ) ( not ( = ?auto_4652 ?auto_4653 ) ) ( not ( = ?auto_4652 ?auto_4659 ) ) ( not ( = ?auto_4653 ?auto_4659 ) ) ( not ( = ?auto_4654 ?auto_4658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4656 ?auto_4655 ?auto_4657 )
      ( !LIFT ?auto_4658 ?auto_4652 ?auto_4659 ?auto_4657 )
      ( !LOAD ?auto_4658 ?auto_4652 ?auto_4656 ?auto_4657 )
      ( !DRIVE ?auto_4656 ?auto_4657 ?auto_4655 )
      ( !UNLOAD ?auto_4654 ?auto_4652 ?auto_4656 ?auto_4655 )
      ( !DROP ?auto_4654 ?auto_4652 ?auto_4653 ?auto_4655 )
      ( MAKE-ON-VERIFY ?auto_4652 ?auto_4653 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4662 - SURFACE
      ?auto_4663 - SURFACE
    )
    :vars
    (
      ?auto_4664 - HOIST
      ?auto_4665 - PLACE
      ?auto_4667 - PLACE
      ?auto_4668 - HOIST
      ?auto_4669 - SURFACE
      ?auto_4666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4664 ?auto_4665 ) ( SURFACE-AT ?auto_4663 ?auto_4665 ) ( CLEAR ?auto_4663 ) ( IS-CRATE ?auto_4662 ) ( AVAILABLE ?auto_4664 ) ( not ( = ?auto_4667 ?auto_4665 ) ) ( HOIST-AT ?auto_4668 ?auto_4667 ) ( AVAILABLE ?auto_4668 ) ( SURFACE-AT ?auto_4662 ?auto_4667 ) ( ON ?auto_4662 ?auto_4669 ) ( CLEAR ?auto_4662 ) ( TRUCK-AT ?auto_4666 ?auto_4665 ) ( not ( = ?auto_4662 ?auto_4663 ) ) ( not ( = ?auto_4662 ?auto_4669 ) ) ( not ( = ?auto_4663 ?auto_4669 ) ) ( not ( = ?auto_4664 ?auto_4668 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4666 ?auto_4665 ?auto_4667 )
      ( !LIFT ?auto_4668 ?auto_4662 ?auto_4669 ?auto_4667 )
      ( !LOAD ?auto_4668 ?auto_4662 ?auto_4666 ?auto_4667 )
      ( !DRIVE ?auto_4666 ?auto_4667 ?auto_4665 )
      ( !UNLOAD ?auto_4664 ?auto_4662 ?auto_4666 ?auto_4665 )
      ( !DROP ?auto_4664 ?auto_4662 ?auto_4663 ?auto_4665 )
      ( MAKE-ON-VERIFY ?auto_4662 ?auto_4663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4672 - SURFACE
      ?auto_4673 - SURFACE
    )
    :vars
    (
      ?auto_4674 - HOIST
      ?auto_4675 - PLACE
      ?auto_4677 - PLACE
      ?auto_4678 - HOIST
      ?auto_4679 - SURFACE
      ?auto_4676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4674 ?auto_4675 ) ( SURFACE-AT ?auto_4673 ?auto_4675 ) ( CLEAR ?auto_4673 ) ( IS-CRATE ?auto_4672 ) ( AVAILABLE ?auto_4674 ) ( not ( = ?auto_4677 ?auto_4675 ) ) ( HOIST-AT ?auto_4678 ?auto_4677 ) ( AVAILABLE ?auto_4678 ) ( SURFACE-AT ?auto_4672 ?auto_4677 ) ( ON ?auto_4672 ?auto_4679 ) ( CLEAR ?auto_4672 ) ( TRUCK-AT ?auto_4676 ?auto_4675 ) ( not ( = ?auto_4672 ?auto_4673 ) ) ( not ( = ?auto_4672 ?auto_4679 ) ) ( not ( = ?auto_4673 ?auto_4679 ) ) ( not ( = ?auto_4674 ?auto_4678 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4676 ?auto_4675 ?auto_4677 )
      ( !LIFT ?auto_4678 ?auto_4672 ?auto_4679 ?auto_4677 )
      ( !LOAD ?auto_4678 ?auto_4672 ?auto_4676 ?auto_4677 )
      ( !DRIVE ?auto_4676 ?auto_4677 ?auto_4675 )
      ( !UNLOAD ?auto_4674 ?auto_4672 ?auto_4676 ?auto_4675 )
      ( !DROP ?auto_4674 ?auto_4672 ?auto_4673 ?auto_4675 )
      ( MAKE-ON-VERIFY ?auto_4672 ?auto_4673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4682 - SURFACE
      ?auto_4683 - SURFACE
    )
    :vars
    (
      ?auto_4684 - HOIST
      ?auto_4685 - PLACE
      ?auto_4687 - PLACE
      ?auto_4688 - HOIST
      ?auto_4689 - SURFACE
      ?auto_4686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4684 ?auto_4685 ) ( SURFACE-AT ?auto_4683 ?auto_4685 ) ( CLEAR ?auto_4683 ) ( IS-CRATE ?auto_4682 ) ( AVAILABLE ?auto_4684 ) ( not ( = ?auto_4687 ?auto_4685 ) ) ( HOIST-AT ?auto_4688 ?auto_4687 ) ( AVAILABLE ?auto_4688 ) ( SURFACE-AT ?auto_4682 ?auto_4687 ) ( ON ?auto_4682 ?auto_4689 ) ( CLEAR ?auto_4682 ) ( TRUCK-AT ?auto_4686 ?auto_4685 ) ( not ( = ?auto_4682 ?auto_4683 ) ) ( not ( = ?auto_4682 ?auto_4689 ) ) ( not ( = ?auto_4683 ?auto_4689 ) ) ( not ( = ?auto_4684 ?auto_4688 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4686 ?auto_4685 ?auto_4687 )
      ( !LIFT ?auto_4688 ?auto_4682 ?auto_4689 ?auto_4687 )
      ( !LOAD ?auto_4688 ?auto_4682 ?auto_4686 ?auto_4687 )
      ( !DRIVE ?auto_4686 ?auto_4687 ?auto_4685 )
      ( !UNLOAD ?auto_4684 ?auto_4682 ?auto_4686 ?auto_4685 )
      ( !DROP ?auto_4684 ?auto_4682 ?auto_4683 ?auto_4685 )
      ( MAKE-ON-VERIFY ?auto_4682 ?auto_4683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4692 - SURFACE
      ?auto_4693 - SURFACE
    )
    :vars
    (
      ?auto_4694 - HOIST
      ?auto_4695 - PLACE
      ?auto_4697 - PLACE
      ?auto_4698 - HOIST
      ?auto_4699 - SURFACE
      ?auto_4696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4694 ?auto_4695 ) ( SURFACE-AT ?auto_4693 ?auto_4695 ) ( CLEAR ?auto_4693 ) ( IS-CRATE ?auto_4692 ) ( AVAILABLE ?auto_4694 ) ( not ( = ?auto_4697 ?auto_4695 ) ) ( HOIST-AT ?auto_4698 ?auto_4697 ) ( AVAILABLE ?auto_4698 ) ( SURFACE-AT ?auto_4692 ?auto_4697 ) ( ON ?auto_4692 ?auto_4699 ) ( CLEAR ?auto_4692 ) ( TRUCK-AT ?auto_4696 ?auto_4695 ) ( not ( = ?auto_4692 ?auto_4693 ) ) ( not ( = ?auto_4692 ?auto_4699 ) ) ( not ( = ?auto_4693 ?auto_4699 ) ) ( not ( = ?auto_4694 ?auto_4698 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4696 ?auto_4695 ?auto_4697 )
      ( !LIFT ?auto_4698 ?auto_4692 ?auto_4699 ?auto_4697 )
      ( !LOAD ?auto_4698 ?auto_4692 ?auto_4696 ?auto_4697 )
      ( !DRIVE ?auto_4696 ?auto_4697 ?auto_4695 )
      ( !UNLOAD ?auto_4694 ?auto_4692 ?auto_4696 ?auto_4695 )
      ( !DROP ?auto_4694 ?auto_4692 ?auto_4693 ?auto_4695 )
      ( MAKE-ON-VERIFY ?auto_4692 ?auto_4693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4702 - SURFACE
      ?auto_4703 - SURFACE
    )
    :vars
    (
      ?auto_4704 - HOIST
      ?auto_4705 - PLACE
      ?auto_4707 - PLACE
      ?auto_4708 - HOIST
      ?auto_4709 - SURFACE
      ?auto_4706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4704 ?auto_4705 ) ( SURFACE-AT ?auto_4703 ?auto_4705 ) ( CLEAR ?auto_4703 ) ( IS-CRATE ?auto_4702 ) ( AVAILABLE ?auto_4704 ) ( not ( = ?auto_4707 ?auto_4705 ) ) ( HOIST-AT ?auto_4708 ?auto_4707 ) ( AVAILABLE ?auto_4708 ) ( SURFACE-AT ?auto_4702 ?auto_4707 ) ( ON ?auto_4702 ?auto_4709 ) ( CLEAR ?auto_4702 ) ( TRUCK-AT ?auto_4706 ?auto_4705 ) ( not ( = ?auto_4702 ?auto_4703 ) ) ( not ( = ?auto_4702 ?auto_4709 ) ) ( not ( = ?auto_4703 ?auto_4709 ) ) ( not ( = ?auto_4704 ?auto_4708 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4706 ?auto_4705 ?auto_4707 )
      ( !LIFT ?auto_4708 ?auto_4702 ?auto_4709 ?auto_4707 )
      ( !LOAD ?auto_4708 ?auto_4702 ?auto_4706 ?auto_4707 )
      ( !DRIVE ?auto_4706 ?auto_4707 ?auto_4705 )
      ( !UNLOAD ?auto_4704 ?auto_4702 ?auto_4706 ?auto_4705 )
      ( !DROP ?auto_4704 ?auto_4702 ?auto_4703 ?auto_4705 )
      ( MAKE-ON-VERIFY ?auto_4702 ?auto_4703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4712 - SURFACE
      ?auto_4713 - SURFACE
    )
    :vars
    (
      ?auto_4714 - HOIST
      ?auto_4715 - PLACE
      ?auto_4717 - PLACE
      ?auto_4718 - HOIST
      ?auto_4719 - SURFACE
      ?auto_4716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4714 ?auto_4715 ) ( SURFACE-AT ?auto_4713 ?auto_4715 ) ( CLEAR ?auto_4713 ) ( IS-CRATE ?auto_4712 ) ( AVAILABLE ?auto_4714 ) ( not ( = ?auto_4717 ?auto_4715 ) ) ( HOIST-AT ?auto_4718 ?auto_4717 ) ( AVAILABLE ?auto_4718 ) ( SURFACE-AT ?auto_4712 ?auto_4717 ) ( ON ?auto_4712 ?auto_4719 ) ( CLEAR ?auto_4712 ) ( TRUCK-AT ?auto_4716 ?auto_4715 ) ( not ( = ?auto_4712 ?auto_4713 ) ) ( not ( = ?auto_4712 ?auto_4719 ) ) ( not ( = ?auto_4713 ?auto_4719 ) ) ( not ( = ?auto_4714 ?auto_4718 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4716 ?auto_4715 ?auto_4717 )
      ( !LIFT ?auto_4718 ?auto_4712 ?auto_4719 ?auto_4717 )
      ( !LOAD ?auto_4718 ?auto_4712 ?auto_4716 ?auto_4717 )
      ( !DRIVE ?auto_4716 ?auto_4717 ?auto_4715 )
      ( !UNLOAD ?auto_4714 ?auto_4712 ?auto_4716 ?auto_4715 )
      ( !DROP ?auto_4714 ?auto_4712 ?auto_4713 ?auto_4715 )
      ( MAKE-ON-VERIFY ?auto_4712 ?auto_4713 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4722 - SURFACE
      ?auto_4723 - SURFACE
    )
    :vars
    (
      ?auto_4724 - HOIST
      ?auto_4725 - PLACE
      ?auto_4727 - PLACE
      ?auto_4728 - HOIST
      ?auto_4729 - SURFACE
      ?auto_4726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4724 ?auto_4725 ) ( SURFACE-AT ?auto_4723 ?auto_4725 ) ( CLEAR ?auto_4723 ) ( IS-CRATE ?auto_4722 ) ( AVAILABLE ?auto_4724 ) ( not ( = ?auto_4727 ?auto_4725 ) ) ( HOIST-AT ?auto_4728 ?auto_4727 ) ( AVAILABLE ?auto_4728 ) ( SURFACE-AT ?auto_4722 ?auto_4727 ) ( ON ?auto_4722 ?auto_4729 ) ( CLEAR ?auto_4722 ) ( TRUCK-AT ?auto_4726 ?auto_4725 ) ( not ( = ?auto_4722 ?auto_4723 ) ) ( not ( = ?auto_4722 ?auto_4729 ) ) ( not ( = ?auto_4723 ?auto_4729 ) ) ( not ( = ?auto_4724 ?auto_4728 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4726 ?auto_4725 ?auto_4727 )
      ( !LIFT ?auto_4728 ?auto_4722 ?auto_4729 ?auto_4727 )
      ( !LOAD ?auto_4728 ?auto_4722 ?auto_4726 ?auto_4727 )
      ( !DRIVE ?auto_4726 ?auto_4727 ?auto_4725 )
      ( !UNLOAD ?auto_4724 ?auto_4722 ?auto_4726 ?auto_4725 )
      ( !DROP ?auto_4724 ?auto_4722 ?auto_4723 ?auto_4725 )
      ( MAKE-ON-VERIFY ?auto_4722 ?auto_4723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4732 - SURFACE
      ?auto_4733 - SURFACE
    )
    :vars
    (
      ?auto_4734 - HOIST
      ?auto_4735 - PLACE
      ?auto_4737 - PLACE
      ?auto_4738 - HOIST
      ?auto_4739 - SURFACE
      ?auto_4736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4734 ?auto_4735 ) ( SURFACE-AT ?auto_4733 ?auto_4735 ) ( CLEAR ?auto_4733 ) ( IS-CRATE ?auto_4732 ) ( AVAILABLE ?auto_4734 ) ( not ( = ?auto_4737 ?auto_4735 ) ) ( HOIST-AT ?auto_4738 ?auto_4737 ) ( AVAILABLE ?auto_4738 ) ( SURFACE-AT ?auto_4732 ?auto_4737 ) ( ON ?auto_4732 ?auto_4739 ) ( CLEAR ?auto_4732 ) ( TRUCK-AT ?auto_4736 ?auto_4735 ) ( not ( = ?auto_4732 ?auto_4733 ) ) ( not ( = ?auto_4732 ?auto_4739 ) ) ( not ( = ?auto_4733 ?auto_4739 ) ) ( not ( = ?auto_4734 ?auto_4738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4736 ?auto_4735 ?auto_4737 )
      ( !LIFT ?auto_4738 ?auto_4732 ?auto_4739 ?auto_4737 )
      ( !LOAD ?auto_4738 ?auto_4732 ?auto_4736 ?auto_4737 )
      ( !DRIVE ?auto_4736 ?auto_4737 ?auto_4735 )
      ( !UNLOAD ?auto_4734 ?auto_4732 ?auto_4736 ?auto_4735 )
      ( !DROP ?auto_4734 ?auto_4732 ?auto_4733 ?auto_4735 )
      ( MAKE-ON-VERIFY ?auto_4732 ?auto_4733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4742 - SURFACE
      ?auto_4743 - SURFACE
    )
    :vars
    (
      ?auto_4744 - HOIST
      ?auto_4745 - PLACE
      ?auto_4747 - PLACE
      ?auto_4748 - HOIST
      ?auto_4749 - SURFACE
      ?auto_4746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4744 ?auto_4745 ) ( SURFACE-AT ?auto_4743 ?auto_4745 ) ( CLEAR ?auto_4743 ) ( IS-CRATE ?auto_4742 ) ( AVAILABLE ?auto_4744 ) ( not ( = ?auto_4747 ?auto_4745 ) ) ( HOIST-AT ?auto_4748 ?auto_4747 ) ( AVAILABLE ?auto_4748 ) ( SURFACE-AT ?auto_4742 ?auto_4747 ) ( ON ?auto_4742 ?auto_4749 ) ( CLEAR ?auto_4742 ) ( TRUCK-AT ?auto_4746 ?auto_4745 ) ( not ( = ?auto_4742 ?auto_4743 ) ) ( not ( = ?auto_4742 ?auto_4749 ) ) ( not ( = ?auto_4743 ?auto_4749 ) ) ( not ( = ?auto_4744 ?auto_4748 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4746 ?auto_4745 ?auto_4747 )
      ( !LIFT ?auto_4748 ?auto_4742 ?auto_4749 ?auto_4747 )
      ( !LOAD ?auto_4748 ?auto_4742 ?auto_4746 ?auto_4747 )
      ( !DRIVE ?auto_4746 ?auto_4747 ?auto_4745 )
      ( !UNLOAD ?auto_4744 ?auto_4742 ?auto_4746 ?auto_4745 )
      ( !DROP ?auto_4744 ?auto_4742 ?auto_4743 ?auto_4745 )
      ( MAKE-ON-VERIFY ?auto_4742 ?auto_4743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4752 - SURFACE
      ?auto_4753 - SURFACE
    )
    :vars
    (
      ?auto_4754 - HOIST
      ?auto_4755 - PLACE
      ?auto_4757 - PLACE
      ?auto_4758 - HOIST
      ?auto_4759 - SURFACE
      ?auto_4756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4754 ?auto_4755 ) ( SURFACE-AT ?auto_4753 ?auto_4755 ) ( CLEAR ?auto_4753 ) ( IS-CRATE ?auto_4752 ) ( AVAILABLE ?auto_4754 ) ( not ( = ?auto_4757 ?auto_4755 ) ) ( HOIST-AT ?auto_4758 ?auto_4757 ) ( AVAILABLE ?auto_4758 ) ( SURFACE-AT ?auto_4752 ?auto_4757 ) ( ON ?auto_4752 ?auto_4759 ) ( CLEAR ?auto_4752 ) ( TRUCK-AT ?auto_4756 ?auto_4755 ) ( not ( = ?auto_4752 ?auto_4753 ) ) ( not ( = ?auto_4752 ?auto_4759 ) ) ( not ( = ?auto_4753 ?auto_4759 ) ) ( not ( = ?auto_4754 ?auto_4758 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4756 ?auto_4755 ?auto_4757 )
      ( !LIFT ?auto_4758 ?auto_4752 ?auto_4759 ?auto_4757 )
      ( !LOAD ?auto_4758 ?auto_4752 ?auto_4756 ?auto_4757 )
      ( !DRIVE ?auto_4756 ?auto_4757 ?auto_4755 )
      ( !UNLOAD ?auto_4754 ?auto_4752 ?auto_4756 ?auto_4755 )
      ( !DROP ?auto_4754 ?auto_4752 ?auto_4753 ?auto_4755 )
      ( MAKE-ON-VERIFY ?auto_4752 ?auto_4753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4762 - SURFACE
      ?auto_4763 - SURFACE
    )
    :vars
    (
      ?auto_4764 - HOIST
      ?auto_4765 - PLACE
      ?auto_4767 - PLACE
      ?auto_4768 - HOIST
      ?auto_4769 - SURFACE
      ?auto_4766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4764 ?auto_4765 ) ( SURFACE-AT ?auto_4763 ?auto_4765 ) ( CLEAR ?auto_4763 ) ( IS-CRATE ?auto_4762 ) ( AVAILABLE ?auto_4764 ) ( not ( = ?auto_4767 ?auto_4765 ) ) ( HOIST-AT ?auto_4768 ?auto_4767 ) ( AVAILABLE ?auto_4768 ) ( SURFACE-AT ?auto_4762 ?auto_4767 ) ( ON ?auto_4762 ?auto_4769 ) ( CLEAR ?auto_4762 ) ( TRUCK-AT ?auto_4766 ?auto_4765 ) ( not ( = ?auto_4762 ?auto_4763 ) ) ( not ( = ?auto_4762 ?auto_4769 ) ) ( not ( = ?auto_4763 ?auto_4769 ) ) ( not ( = ?auto_4764 ?auto_4768 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4766 ?auto_4765 ?auto_4767 )
      ( !LIFT ?auto_4768 ?auto_4762 ?auto_4769 ?auto_4767 )
      ( !LOAD ?auto_4768 ?auto_4762 ?auto_4766 ?auto_4767 )
      ( !DRIVE ?auto_4766 ?auto_4767 ?auto_4765 )
      ( !UNLOAD ?auto_4764 ?auto_4762 ?auto_4766 ?auto_4765 )
      ( !DROP ?auto_4764 ?auto_4762 ?auto_4763 ?auto_4765 )
      ( MAKE-ON-VERIFY ?auto_4762 ?auto_4763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4772 - SURFACE
      ?auto_4773 - SURFACE
    )
    :vars
    (
      ?auto_4774 - HOIST
      ?auto_4775 - PLACE
      ?auto_4777 - PLACE
      ?auto_4778 - HOIST
      ?auto_4779 - SURFACE
      ?auto_4776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4774 ?auto_4775 ) ( SURFACE-AT ?auto_4773 ?auto_4775 ) ( CLEAR ?auto_4773 ) ( IS-CRATE ?auto_4772 ) ( AVAILABLE ?auto_4774 ) ( not ( = ?auto_4777 ?auto_4775 ) ) ( HOIST-AT ?auto_4778 ?auto_4777 ) ( AVAILABLE ?auto_4778 ) ( SURFACE-AT ?auto_4772 ?auto_4777 ) ( ON ?auto_4772 ?auto_4779 ) ( CLEAR ?auto_4772 ) ( TRUCK-AT ?auto_4776 ?auto_4775 ) ( not ( = ?auto_4772 ?auto_4773 ) ) ( not ( = ?auto_4772 ?auto_4779 ) ) ( not ( = ?auto_4773 ?auto_4779 ) ) ( not ( = ?auto_4774 ?auto_4778 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4776 ?auto_4775 ?auto_4777 )
      ( !LIFT ?auto_4778 ?auto_4772 ?auto_4779 ?auto_4777 )
      ( !LOAD ?auto_4778 ?auto_4772 ?auto_4776 ?auto_4777 )
      ( !DRIVE ?auto_4776 ?auto_4777 ?auto_4775 )
      ( !UNLOAD ?auto_4774 ?auto_4772 ?auto_4776 ?auto_4775 )
      ( !DROP ?auto_4774 ?auto_4772 ?auto_4773 ?auto_4775 )
      ( MAKE-ON-VERIFY ?auto_4772 ?auto_4773 ) )
  )

)

