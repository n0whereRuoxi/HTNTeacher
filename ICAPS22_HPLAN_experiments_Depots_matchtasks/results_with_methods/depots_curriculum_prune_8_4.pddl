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
      ?auto_4700 - SURFACE
      ?auto_4701 - SURFACE
    )
    :vars
    (
      ?auto_4702 - HOIST
      ?auto_4703 - PLACE
      ?auto_4705 - PLACE
      ?auto_4706 - HOIST
      ?auto_4707 - SURFACE
      ?auto_4704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4702 ?auto_4703 ) ( SURFACE-AT ?auto_4700 ?auto_4703 ) ( CLEAR ?auto_4700 ) ( IS-CRATE ?auto_4701 ) ( AVAILABLE ?auto_4702 ) ( not ( = ?auto_4705 ?auto_4703 ) ) ( HOIST-AT ?auto_4706 ?auto_4705 ) ( AVAILABLE ?auto_4706 ) ( SURFACE-AT ?auto_4701 ?auto_4705 ) ( ON ?auto_4701 ?auto_4707 ) ( CLEAR ?auto_4701 ) ( TRUCK-AT ?auto_4704 ?auto_4703 ) ( not ( = ?auto_4700 ?auto_4701 ) ) ( not ( = ?auto_4700 ?auto_4707 ) ) ( not ( = ?auto_4701 ?auto_4707 ) ) ( not ( = ?auto_4702 ?auto_4706 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4704 ?auto_4703 ?auto_4705 )
      ( !LIFT ?auto_4706 ?auto_4701 ?auto_4707 ?auto_4705 )
      ( !LOAD ?auto_4706 ?auto_4701 ?auto_4704 ?auto_4705 )
      ( !DRIVE ?auto_4704 ?auto_4705 ?auto_4703 )
      ( !UNLOAD ?auto_4702 ?auto_4701 ?auto_4704 ?auto_4703 )
      ( !DROP ?auto_4702 ?auto_4701 ?auto_4700 ?auto_4703 )
      ( MAKE-1CRATE-VERIFY ?auto_4700 ?auto_4701 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4721 - SURFACE
      ?auto_4722 - SURFACE
      ?auto_4723 - SURFACE
    )
    :vars
    (
      ?auto_4724 - HOIST
      ?auto_4725 - PLACE
      ?auto_4729 - PLACE
      ?auto_4728 - HOIST
      ?auto_4726 - SURFACE
      ?auto_4731 - PLACE
      ?auto_4732 - HOIST
      ?auto_4730 - SURFACE
      ?auto_4727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4724 ?auto_4725 ) ( IS-CRATE ?auto_4723 ) ( not ( = ?auto_4729 ?auto_4725 ) ) ( HOIST-AT ?auto_4728 ?auto_4729 ) ( AVAILABLE ?auto_4728 ) ( SURFACE-AT ?auto_4723 ?auto_4729 ) ( ON ?auto_4723 ?auto_4726 ) ( CLEAR ?auto_4723 ) ( not ( = ?auto_4722 ?auto_4723 ) ) ( not ( = ?auto_4722 ?auto_4726 ) ) ( not ( = ?auto_4723 ?auto_4726 ) ) ( not ( = ?auto_4724 ?auto_4728 ) ) ( SURFACE-AT ?auto_4721 ?auto_4725 ) ( CLEAR ?auto_4721 ) ( IS-CRATE ?auto_4722 ) ( AVAILABLE ?auto_4724 ) ( not ( = ?auto_4731 ?auto_4725 ) ) ( HOIST-AT ?auto_4732 ?auto_4731 ) ( AVAILABLE ?auto_4732 ) ( SURFACE-AT ?auto_4722 ?auto_4731 ) ( ON ?auto_4722 ?auto_4730 ) ( CLEAR ?auto_4722 ) ( TRUCK-AT ?auto_4727 ?auto_4725 ) ( not ( = ?auto_4721 ?auto_4722 ) ) ( not ( = ?auto_4721 ?auto_4730 ) ) ( not ( = ?auto_4722 ?auto_4730 ) ) ( not ( = ?auto_4724 ?auto_4732 ) ) ( not ( = ?auto_4721 ?auto_4723 ) ) ( not ( = ?auto_4721 ?auto_4726 ) ) ( not ( = ?auto_4723 ?auto_4730 ) ) ( not ( = ?auto_4729 ?auto_4731 ) ) ( not ( = ?auto_4728 ?auto_4732 ) ) ( not ( = ?auto_4726 ?auto_4730 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4721 ?auto_4722 )
      ( MAKE-1CRATE ?auto_4722 ?auto_4723 )
      ( MAKE-2CRATE-VERIFY ?auto_4721 ?auto_4722 ?auto_4723 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4747 - SURFACE
      ?auto_4748 - SURFACE
      ?auto_4749 - SURFACE
      ?auto_4750 - SURFACE
    )
    :vars
    (
      ?auto_4751 - HOIST
      ?auto_4755 - PLACE
      ?auto_4754 - PLACE
      ?auto_4752 - HOIST
      ?auto_4756 - SURFACE
      ?auto_4758 - PLACE
      ?auto_4762 - HOIST
      ?auto_4759 - SURFACE
      ?auto_4761 - PLACE
      ?auto_4760 - HOIST
      ?auto_4757 - SURFACE
      ?auto_4753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4751 ?auto_4755 ) ( IS-CRATE ?auto_4750 ) ( not ( = ?auto_4754 ?auto_4755 ) ) ( HOIST-AT ?auto_4752 ?auto_4754 ) ( AVAILABLE ?auto_4752 ) ( SURFACE-AT ?auto_4750 ?auto_4754 ) ( ON ?auto_4750 ?auto_4756 ) ( CLEAR ?auto_4750 ) ( not ( = ?auto_4749 ?auto_4750 ) ) ( not ( = ?auto_4749 ?auto_4756 ) ) ( not ( = ?auto_4750 ?auto_4756 ) ) ( not ( = ?auto_4751 ?auto_4752 ) ) ( IS-CRATE ?auto_4749 ) ( not ( = ?auto_4758 ?auto_4755 ) ) ( HOIST-AT ?auto_4762 ?auto_4758 ) ( AVAILABLE ?auto_4762 ) ( SURFACE-AT ?auto_4749 ?auto_4758 ) ( ON ?auto_4749 ?auto_4759 ) ( CLEAR ?auto_4749 ) ( not ( = ?auto_4748 ?auto_4749 ) ) ( not ( = ?auto_4748 ?auto_4759 ) ) ( not ( = ?auto_4749 ?auto_4759 ) ) ( not ( = ?auto_4751 ?auto_4762 ) ) ( SURFACE-AT ?auto_4747 ?auto_4755 ) ( CLEAR ?auto_4747 ) ( IS-CRATE ?auto_4748 ) ( AVAILABLE ?auto_4751 ) ( not ( = ?auto_4761 ?auto_4755 ) ) ( HOIST-AT ?auto_4760 ?auto_4761 ) ( AVAILABLE ?auto_4760 ) ( SURFACE-AT ?auto_4748 ?auto_4761 ) ( ON ?auto_4748 ?auto_4757 ) ( CLEAR ?auto_4748 ) ( TRUCK-AT ?auto_4753 ?auto_4755 ) ( not ( = ?auto_4747 ?auto_4748 ) ) ( not ( = ?auto_4747 ?auto_4757 ) ) ( not ( = ?auto_4748 ?auto_4757 ) ) ( not ( = ?auto_4751 ?auto_4760 ) ) ( not ( = ?auto_4747 ?auto_4749 ) ) ( not ( = ?auto_4747 ?auto_4759 ) ) ( not ( = ?auto_4749 ?auto_4757 ) ) ( not ( = ?auto_4758 ?auto_4761 ) ) ( not ( = ?auto_4762 ?auto_4760 ) ) ( not ( = ?auto_4759 ?auto_4757 ) ) ( not ( = ?auto_4747 ?auto_4750 ) ) ( not ( = ?auto_4747 ?auto_4756 ) ) ( not ( = ?auto_4748 ?auto_4750 ) ) ( not ( = ?auto_4748 ?auto_4756 ) ) ( not ( = ?auto_4750 ?auto_4759 ) ) ( not ( = ?auto_4750 ?auto_4757 ) ) ( not ( = ?auto_4754 ?auto_4758 ) ) ( not ( = ?auto_4754 ?auto_4761 ) ) ( not ( = ?auto_4752 ?auto_4762 ) ) ( not ( = ?auto_4752 ?auto_4760 ) ) ( not ( = ?auto_4756 ?auto_4759 ) ) ( not ( = ?auto_4756 ?auto_4757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4747 ?auto_4748 ?auto_4749 )
      ( MAKE-1CRATE ?auto_4749 ?auto_4750 )
      ( MAKE-3CRATE-VERIFY ?auto_4747 ?auto_4748 ?auto_4749 ?auto_4750 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_4778 - SURFACE
      ?auto_4779 - SURFACE
      ?auto_4780 - SURFACE
      ?auto_4781 - SURFACE
      ?auto_4782 - SURFACE
    )
    :vars
    (
      ?auto_4785 - HOIST
      ?auto_4786 - PLACE
      ?auto_4784 - PLACE
      ?auto_4788 - HOIST
      ?auto_4783 - SURFACE
      ?auto_4793 - SURFACE
      ?auto_4789 - PLACE
      ?auto_4795 - HOIST
      ?auto_4790 - SURFACE
      ?auto_4791 - PLACE
      ?auto_4792 - HOIST
      ?auto_4794 - SURFACE
      ?auto_4787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4785 ?auto_4786 ) ( IS-CRATE ?auto_4782 ) ( not ( = ?auto_4784 ?auto_4786 ) ) ( HOIST-AT ?auto_4788 ?auto_4784 ) ( SURFACE-AT ?auto_4782 ?auto_4784 ) ( ON ?auto_4782 ?auto_4783 ) ( CLEAR ?auto_4782 ) ( not ( = ?auto_4781 ?auto_4782 ) ) ( not ( = ?auto_4781 ?auto_4783 ) ) ( not ( = ?auto_4782 ?auto_4783 ) ) ( not ( = ?auto_4785 ?auto_4788 ) ) ( IS-CRATE ?auto_4781 ) ( AVAILABLE ?auto_4788 ) ( SURFACE-AT ?auto_4781 ?auto_4784 ) ( ON ?auto_4781 ?auto_4793 ) ( CLEAR ?auto_4781 ) ( not ( = ?auto_4780 ?auto_4781 ) ) ( not ( = ?auto_4780 ?auto_4793 ) ) ( not ( = ?auto_4781 ?auto_4793 ) ) ( IS-CRATE ?auto_4780 ) ( not ( = ?auto_4789 ?auto_4786 ) ) ( HOIST-AT ?auto_4795 ?auto_4789 ) ( AVAILABLE ?auto_4795 ) ( SURFACE-AT ?auto_4780 ?auto_4789 ) ( ON ?auto_4780 ?auto_4790 ) ( CLEAR ?auto_4780 ) ( not ( = ?auto_4779 ?auto_4780 ) ) ( not ( = ?auto_4779 ?auto_4790 ) ) ( not ( = ?auto_4780 ?auto_4790 ) ) ( not ( = ?auto_4785 ?auto_4795 ) ) ( SURFACE-AT ?auto_4778 ?auto_4786 ) ( CLEAR ?auto_4778 ) ( IS-CRATE ?auto_4779 ) ( AVAILABLE ?auto_4785 ) ( not ( = ?auto_4791 ?auto_4786 ) ) ( HOIST-AT ?auto_4792 ?auto_4791 ) ( AVAILABLE ?auto_4792 ) ( SURFACE-AT ?auto_4779 ?auto_4791 ) ( ON ?auto_4779 ?auto_4794 ) ( CLEAR ?auto_4779 ) ( TRUCK-AT ?auto_4787 ?auto_4786 ) ( not ( = ?auto_4778 ?auto_4779 ) ) ( not ( = ?auto_4778 ?auto_4794 ) ) ( not ( = ?auto_4779 ?auto_4794 ) ) ( not ( = ?auto_4785 ?auto_4792 ) ) ( not ( = ?auto_4778 ?auto_4780 ) ) ( not ( = ?auto_4778 ?auto_4790 ) ) ( not ( = ?auto_4780 ?auto_4794 ) ) ( not ( = ?auto_4789 ?auto_4791 ) ) ( not ( = ?auto_4795 ?auto_4792 ) ) ( not ( = ?auto_4790 ?auto_4794 ) ) ( not ( = ?auto_4778 ?auto_4781 ) ) ( not ( = ?auto_4778 ?auto_4793 ) ) ( not ( = ?auto_4779 ?auto_4781 ) ) ( not ( = ?auto_4779 ?auto_4793 ) ) ( not ( = ?auto_4781 ?auto_4790 ) ) ( not ( = ?auto_4781 ?auto_4794 ) ) ( not ( = ?auto_4784 ?auto_4789 ) ) ( not ( = ?auto_4784 ?auto_4791 ) ) ( not ( = ?auto_4788 ?auto_4795 ) ) ( not ( = ?auto_4788 ?auto_4792 ) ) ( not ( = ?auto_4793 ?auto_4790 ) ) ( not ( = ?auto_4793 ?auto_4794 ) ) ( not ( = ?auto_4778 ?auto_4782 ) ) ( not ( = ?auto_4778 ?auto_4783 ) ) ( not ( = ?auto_4779 ?auto_4782 ) ) ( not ( = ?auto_4779 ?auto_4783 ) ) ( not ( = ?auto_4780 ?auto_4782 ) ) ( not ( = ?auto_4780 ?auto_4783 ) ) ( not ( = ?auto_4782 ?auto_4793 ) ) ( not ( = ?auto_4782 ?auto_4790 ) ) ( not ( = ?auto_4782 ?auto_4794 ) ) ( not ( = ?auto_4783 ?auto_4793 ) ) ( not ( = ?auto_4783 ?auto_4790 ) ) ( not ( = ?auto_4783 ?auto_4794 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4778 ?auto_4779 ?auto_4780 ?auto_4781 )
      ( MAKE-1CRATE ?auto_4781 ?auto_4782 )
      ( MAKE-4CRATE-VERIFY ?auto_4778 ?auto_4779 ?auto_4780 ?auto_4781 ?auto_4782 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_4812 - SURFACE
      ?auto_4813 - SURFACE
      ?auto_4814 - SURFACE
      ?auto_4815 - SURFACE
      ?auto_4816 - SURFACE
      ?auto_4817 - SURFACE
    )
    :vars
    (
      ?auto_4822 - HOIST
      ?auto_4819 - PLACE
      ?auto_4818 - PLACE
      ?auto_4823 - HOIST
      ?auto_4821 - SURFACE
      ?auto_4832 - PLACE
      ?auto_4825 - HOIST
      ?auto_4828 - SURFACE
      ?auto_4824 - SURFACE
      ?auto_4833 - PLACE
      ?auto_4827 - HOIST
      ?auto_4830 - SURFACE
      ?auto_4831 - PLACE
      ?auto_4829 - HOIST
      ?auto_4826 - SURFACE
      ?auto_4820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4822 ?auto_4819 ) ( IS-CRATE ?auto_4817 ) ( not ( = ?auto_4818 ?auto_4819 ) ) ( HOIST-AT ?auto_4823 ?auto_4818 ) ( AVAILABLE ?auto_4823 ) ( SURFACE-AT ?auto_4817 ?auto_4818 ) ( ON ?auto_4817 ?auto_4821 ) ( CLEAR ?auto_4817 ) ( not ( = ?auto_4816 ?auto_4817 ) ) ( not ( = ?auto_4816 ?auto_4821 ) ) ( not ( = ?auto_4817 ?auto_4821 ) ) ( not ( = ?auto_4822 ?auto_4823 ) ) ( IS-CRATE ?auto_4816 ) ( not ( = ?auto_4832 ?auto_4819 ) ) ( HOIST-AT ?auto_4825 ?auto_4832 ) ( SURFACE-AT ?auto_4816 ?auto_4832 ) ( ON ?auto_4816 ?auto_4828 ) ( CLEAR ?auto_4816 ) ( not ( = ?auto_4815 ?auto_4816 ) ) ( not ( = ?auto_4815 ?auto_4828 ) ) ( not ( = ?auto_4816 ?auto_4828 ) ) ( not ( = ?auto_4822 ?auto_4825 ) ) ( IS-CRATE ?auto_4815 ) ( AVAILABLE ?auto_4825 ) ( SURFACE-AT ?auto_4815 ?auto_4832 ) ( ON ?auto_4815 ?auto_4824 ) ( CLEAR ?auto_4815 ) ( not ( = ?auto_4814 ?auto_4815 ) ) ( not ( = ?auto_4814 ?auto_4824 ) ) ( not ( = ?auto_4815 ?auto_4824 ) ) ( IS-CRATE ?auto_4814 ) ( not ( = ?auto_4833 ?auto_4819 ) ) ( HOIST-AT ?auto_4827 ?auto_4833 ) ( AVAILABLE ?auto_4827 ) ( SURFACE-AT ?auto_4814 ?auto_4833 ) ( ON ?auto_4814 ?auto_4830 ) ( CLEAR ?auto_4814 ) ( not ( = ?auto_4813 ?auto_4814 ) ) ( not ( = ?auto_4813 ?auto_4830 ) ) ( not ( = ?auto_4814 ?auto_4830 ) ) ( not ( = ?auto_4822 ?auto_4827 ) ) ( SURFACE-AT ?auto_4812 ?auto_4819 ) ( CLEAR ?auto_4812 ) ( IS-CRATE ?auto_4813 ) ( AVAILABLE ?auto_4822 ) ( not ( = ?auto_4831 ?auto_4819 ) ) ( HOIST-AT ?auto_4829 ?auto_4831 ) ( AVAILABLE ?auto_4829 ) ( SURFACE-AT ?auto_4813 ?auto_4831 ) ( ON ?auto_4813 ?auto_4826 ) ( CLEAR ?auto_4813 ) ( TRUCK-AT ?auto_4820 ?auto_4819 ) ( not ( = ?auto_4812 ?auto_4813 ) ) ( not ( = ?auto_4812 ?auto_4826 ) ) ( not ( = ?auto_4813 ?auto_4826 ) ) ( not ( = ?auto_4822 ?auto_4829 ) ) ( not ( = ?auto_4812 ?auto_4814 ) ) ( not ( = ?auto_4812 ?auto_4830 ) ) ( not ( = ?auto_4814 ?auto_4826 ) ) ( not ( = ?auto_4833 ?auto_4831 ) ) ( not ( = ?auto_4827 ?auto_4829 ) ) ( not ( = ?auto_4830 ?auto_4826 ) ) ( not ( = ?auto_4812 ?auto_4815 ) ) ( not ( = ?auto_4812 ?auto_4824 ) ) ( not ( = ?auto_4813 ?auto_4815 ) ) ( not ( = ?auto_4813 ?auto_4824 ) ) ( not ( = ?auto_4815 ?auto_4830 ) ) ( not ( = ?auto_4815 ?auto_4826 ) ) ( not ( = ?auto_4832 ?auto_4833 ) ) ( not ( = ?auto_4832 ?auto_4831 ) ) ( not ( = ?auto_4825 ?auto_4827 ) ) ( not ( = ?auto_4825 ?auto_4829 ) ) ( not ( = ?auto_4824 ?auto_4830 ) ) ( not ( = ?auto_4824 ?auto_4826 ) ) ( not ( = ?auto_4812 ?auto_4816 ) ) ( not ( = ?auto_4812 ?auto_4828 ) ) ( not ( = ?auto_4813 ?auto_4816 ) ) ( not ( = ?auto_4813 ?auto_4828 ) ) ( not ( = ?auto_4814 ?auto_4816 ) ) ( not ( = ?auto_4814 ?auto_4828 ) ) ( not ( = ?auto_4816 ?auto_4824 ) ) ( not ( = ?auto_4816 ?auto_4830 ) ) ( not ( = ?auto_4816 ?auto_4826 ) ) ( not ( = ?auto_4828 ?auto_4824 ) ) ( not ( = ?auto_4828 ?auto_4830 ) ) ( not ( = ?auto_4828 ?auto_4826 ) ) ( not ( = ?auto_4812 ?auto_4817 ) ) ( not ( = ?auto_4812 ?auto_4821 ) ) ( not ( = ?auto_4813 ?auto_4817 ) ) ( not ( = ?auto_4813 ?auto_4821 ) ) ( not ( = ?auto_4814 ?auto_4817 ) ) ( not ( = ?auto_4814 ?auto_4821 ) ) ( not ( = ?auto_4815 ?auto_4817 ) ) ( not ( = ?auto_4815 ?auto_4821 ) ) ( not ( = ?auto_4817 ?auto_4828 ) ) ( not ( = ?auto_4817 ?auto_4824 ) ) ( not ( = ?auto_4817 ?auto_4830 ) ) ( not ( = ?auto_4817 ?auto_4826 ) ) ( not ( = ?auto_4818 ?auto_4832 ) ) ( not ( = ?auto_4818 ?auto_4833 ) ) ( not ( = ?auto_4818 ?auto_4831 ) ) ( not ( = ?auto_4823 ?auto_4825 ) ) ( not ( = ?auto_4823 ?auto_4827 ) ) ( not ( = ?auto_4823 ?auto_4829 ) ) ( not ( = ?auto_4821 ?auto_4828 ) ) ( not ( = ?auto_4821 ?auto_4824 ) ) ( not ( = ?auto_4821 ?auto_4830 ) ) ( not ( = ?auto_4821 ?auto_4826 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4812 ?auto_4813 ?auto_4814 ?auto_4815 ?auto_4816 )
      ( MAKE-1CRATE ?auto_4816 ?auto_4817 )
      ( MAKE-5CRATE-VERIFY ?auto_4812 ?auto_4813 ?auto_4814 ?auto_4815 ?auto_4816 ?auto_4817 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4851 - SURFACE
      ?auto_4852 - SURFACE
      ?auto_4853 - SURFACE
      ?auto_4854 - SURFACE
      ?auto_4855 - SURFACE
      ?auto_4856 - SURFACE
      ?auto_4857 - SURFACE
    )
    :vars
    (
      ?auto_4858 - HOIST
      ?auto_4862 - PLACE
      ?auto_4863 - PLACE
      ?auto_4859 - HOIST
      ?auto_4860 - SURFACE
      ?auto_4868 - PLACE
      ?auto_4870 - HOIST
      ?auto_4867 - SURFACE
      ?auto_4869 - PLACE
      ?auto_4865 - HOIST
      ?auto_4873 - SURFACE
      ?auto_4875 - SURFACE
      ?auto_4866 - PLACE
      ?auto_4874 - HOIST
      ?auto_4872 - SURFACE
      ?auto_4864 - PLACE
      ?auto_4876 - HOIST
      ?auto_4871 - SURFACE
      ?auto_4861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4858 ?auto_4862 ) ( IS-CRATE ?auto_4857 ) ( not ( = ?auto_4863 ?auto_4862 ) ) ( HOIST-AT ?auto_4859 ?auto_4863 ) ( AVAILABLE ?auto_4859 ) ( SURFACE-AT ?auto_4857 ?auto_4863 ) ( ON ?auto_4857 ?auto_4860 ) ( CLEAR ?auto_4857 ) ( not ( = ?auto_4856 ?auto_4857 ) ) ( not ( = ?auto_4856 ?auto_4860 ) ) ( not ( = ?auto_4857 ?auto_4860 ) ) ( not ( = ?auto_4858 ?auto_4859 ) ) ( IS-CRATE ?auto_4856 ) ( not ( = ?auto_4868 ?auto_4862 ) ) ( HOIST-AT ?auto_4870 ?auto_4868 ) ( AVAILABLE ?auto_4870 ) ( SURFACE-AT ?auto_4856 ?auto_4868 ) ( ON ?auto_4856 ?auto_4867 ) ( CLEAR ?auto_4856 ) ( not ( = ?auto_4855 ?auto_4856 ) ) ( not ( = ?auto_4855 ?auto_4867 ) ) ( not ( = ?auto_4856 ?auto_4867 ) ) ( not ( = ?auto_4858 ?auto_4870 ) ) ( IS-CRATE ?auto_4855 ) ( not ( = ?auto_4869 ?auto_4862 ) ) ( HOIST-AT ?auto_4865 ?auto_4869 ) ( SURFACE-AT ?auto_4855 ?auto_4869 ) ( ON ?auto_4855 ?auto_4873 ) ( CLEAR ?auto_4855 ) ( not ( = ?auto_4854 ?auto_4855 ) ) ( not ( = ?auto_4854 ?auto_4873 ) ) ( not ( = ?auto_4855 ?auto_4873 ) ) ( not ( = ?auto_4858 ?auto_4865 ) ) ( IS-CRATE ?auto_4854 ) ( AVAILABLE ?auto_4865 ) ( SURFACE-AT ?auto_4854 ?auto_4869 ) ( ON ?auto_4854 ?auto_4875 ) ( CLEAR ?auto_4854 ) ( not ( = ?auto_4853 ?auto_4854 ) ) ( not ( = ?auto_4853 ?auto_4875 ) ) ( not ( = ?auto_4854 ?auto_4875 ) ) ( IS-CRATE ?auto_4853 ) ( not ( = ?auto_4866 ?auto_4862 ) ) ( HOIST-AT ?auto_4874 ?auto_4866 ) ( AVAILABLE ?auto_4874 ) ( SURFACE-AT ?auto_4853 ?auto_4866 ) ( ON ?auto_4853 ?auto_4872 ) ( CLEAR ?auto_4853 ) ( not ( = ?auto_4852 ?auto_4853 ) ) ( not ( = ?auto_4852 ?auto_4872 ) ) ( not ( = ?auto_4853 ?auto_4872 ) ) ( not ( = ?auto_4858 ?auto_4874 ) ) ( SURFACE-AT ?auto_4851 ?auto_4862 ) ( CLEAR ?auto_4851 ) ( IS-CRATE ?auto_4852 ) ( AVAILABLE ?auto_4858 ) ( not ( = ?auto_4864 ?auto_4862 ) ) ( HOIST-AT ?auto_4876 ?auto_4864 ) ( AVAILABLE ?auto_4876 ) ( SURFACE-AT ?auto_4852 ?auto_4864 ) ( ON ?auto_4852 ?auto_4871 ) ( CLEAR ?auto_4852 ) ( TRUCK-AT ?auto_4861 ?auto_4862 ) ( not ( = ?auto_4851 ?auto_4852 ) ) ( not ( = ?auto_4851 ?auto_4871 ) ) ( not ( = ?auto_4852 ?auto_4871 ) ) ( not ( = ?auto_4858 ?auto_4876 ) ) ( not ( = ?auto_4851 ?auto_4853 ) ) ( not ( = ?auto_4851 ?auto_4872 ) ) ( not ( = ?auto_4853 ?auto_4871 ) ) ( not ( = ?auto_4866 ?auto_4864 ) ) ( not ( = ?auto_4874 ?auto_4876 ) ) ( not ( = ?auto_4872 ?auto_4871 ) ) ( not ( = ?auto_4851 ?auto_4854 ) ) ( not ( = ?auto_4851 ?auto_4875 ) ) ( not ( = ?auto_4852 ?auto_4854 ) ) ( not ( = ?auto_4852 ?auto_4875 ) ) ( not ( = ?auto_4854 ?auto_4872 ) ) ( not ( = ?auto_4854 ?auto_4871 ) ) ( not ( = ?auto_4869 ?auto_4866 ) ) ( not ( = ?auto_4869 ?auto_4864 ) ) ( not ( = ?auto_4865 ?auto_4874 ) ) ( not ( = ?auto_4865 ?auto_4876 ) ) ( not ( = ?auto_4875 ?auto_4872 ) ) ( not ( = ?auto_4875 ?auto_4871 ) ) ( not ( = ?auto_4851 ?auto_4855 ) ) ( not ( = ?auto_4851 ?auto_4873 ) ) ( not ( = ?auto_4852 ?auto_4855 ) ) ( not ( = ?auto_4852 ?auto_4873 ) ) ( not ( = ?auto_4853 ?auto_4855 ) ) ( not ( = ?auto_4853 ?auto_4873 ) ) ( not ( = ?auto_4855 ?auto_4875 ) ) ( not ( = ?auto_4855 ?auto_4872 ) ) ( not ( = ?auto_4855 ?auto_4871 ) ) ( not ( = ?auto_4873 ?auto_4875 ) ) ( not ( = ?auto_4873 ?auto_4872 ) ) ( not ( = ?auto_4873 ?auto_4871 ) ) ( not ( = ?auto_4851 ?auto_4856 ) ) ( not ( = ?auto_4851 ?auto_4867 ) ) ( not ( = ?auto_4852 ?auto_4856 ) ) ( not ( = ?auto_4852 ?auto_4867 ) ) ( not ( = ?auto_4853 ?auto_4856 ) ) ( not ( = ?auto_4853 ?auto_4867 ) ) ( not ( = ?auto_4854 ?auto_4856 ) ) ( not ( = ?auto_4854 ?auto_4867 ) ) ( not ( = ?auto_4856 ?auto_4873 ) ) ( not ( = ?auto_4856 ?auto_4875 ) ) ( not ( = ?auto_4856 ?auto_4872 ) ) ( not ( = ?auto_4856 ?auto_4871 ) ) ( not ( = ?auto_4868 ?auto_4869 ) ) ( not ( = ?auto_4868 ?auto_4866 ) ) ( not ( = ?auto_4868 ?auto_4864 ) ) ( not ( = ?auto_4870 ?auto_4865 ) ) ( not ( = ?auto_4870 ?auto_4874 ) ) ( not ( = ?auto_4870 ?auto_4876 ) ) ( not ( = ?auto_4867 ?auto_4873 ) ) ( not ( = ?auto_4867 ?auto_4875 ) ) ( not ( = ?auto_4867 ?auto_4872 ) ) ( not ( = ?auto_4867 ?auto_4871 ) ) ( not ( = ?auto_4851 ?auto_4857 ) ) ( not ( = ?auto_4851 ?auto_4860 ) ) ( not ( = ?auto_4852 ?auto_4857 ) ) ( not ( = ?auto_4852 ?auto_4860 ) ) ( not ( = ?auto_4853 ?auto_4857 ) ) ( not ( = ?auto_4853 ?auto_4860 ) ) ( not ( = ?auto_4854 ?auto_4857 ) ) ( not ( = ?auto_4854 ?auto_4860 ) ) ( not ( = ?auto_4855 ?auto_4857 ) ) ( not ( = ?auto_4855 ?auto_4860 ) ) ( not ( = ?auto_4857 ?auto_4867 ) ) ( not ( = ?auto_4857 ?auto_4873 ) ) ( not ( = ?auto_4857 ?auto_4875 ) ) ( not ( = ?auto_4857 ?auto_4872 ) ) ( not ( = ?auto_4857 ?auto_4871 ) ) ( not ( = ?auto_4863 ?auto_4868 ) ) ( not ( = ?auto_4863 ?auto_4869 ) ) ( not ( = ?auto_4863 ?auto_4866 ) ) ( not ( = ?auto_4863 ?auto_4864 ) ) ( not ( = ?auto_4859 ?auto_4870 ) ) ( not ( = ?auto_4859 ?auto_4865 ) ) ( not ( = ?auto_4859 ?auto_4874 ) ) ( not ( = ?auto_4859 ?auto_4876 ) ) ( not ( = ?auto_4860 ?auto_4867 ) ) ( not ( = ?auto_4860 ?auto_4873 ) ) ( not ( = ?auto_4860 ?auto_4875 ) ) ( not ( = ?auto_4860 ?auto_4872 ) ) ( not ( = ?auto_4860 ?auto_4871 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4851 ?auto_4852 ?auto_4853 ?auto_4854 ?auto_4855 ?auto_4856 )
      ( MAKE-1CRATE ?auto_4856 ?auto_4857 )
      ( MAKE-6CRATE-VERIFY ?auto_4851 ?auto_4852 ?auto_4853 ?auto_4854 ?auto_4855 ?auto_4856 ?auto_4857 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4895 - SURFACE
      ?auto_4896 - SURFACE
      ?auto_4897 - SURFACE
      ?auto_4898 - SURFACE
      ?auto_4899 - SURFACE
      ?auto_4900 - SURFACE
      ?auto_4901 - SURFACE
      ?auto_4902 - SURFACE
    )
    :vars
    (
      ?auto_4904 - HOIST
      ?auto_4907 - PLACE
      ?auto_4908 - PLACE
      ?auto_4905 - HOIST
      ?auto_4903 - SURFACE
      ?auto_4922 - PLACE
      ?auto_4910 - HOIST
      ?auto_4924 - SURFACE
      ?auto_4912 - PLACE
      ?auto_4909 - HOIST
      ?auto_4913 - SURFACE
      ?auto_4923 - PLACE
      ?auto_4915 - HOIST
      ?auto_4916 - SURFACE
      ?auto_4918 - SURFACE
      ?auto_4920 - PLACE
      ?auto_4919 - HOIST
      ?auto_4914 - SURFACE
      ?auto_4917 - PLACE
      ?auto_4921 - HOIST
      ?auto_4911 - SURFACE
      ?auto_4906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4904 ?auto_4907 ) ( IS-CRATE ?auto_4902 ) ( not ( = ?auto_4908 ?auto_4907 ) ) ( HOIST-AT ?auto_4905 ?auto_4908 ) ( AVAILABLE ?auto_4905 ) ( SURFACE-AT ?auto_4902 ?auto_4908 ) ( ON ?auto_4902 ?auto_4903 ) ( CLEAR ?auto_4902 ) ( not ( = ?auto_4901 ?auto_4902 ) ) ( not ( = ?auto_4901 ?auto_4903 ) ) ( not ( = ?auto_4902 ?auto_4903 ) ) ( not ( = ?auto_4904 ?auto_4905 ) ) ( IS-CRATE ?auto_4901 ) ( not ( = ?auto_4922 ?auto_4907 ) ) ( HOIST-AT ?auto_4910 ?auto_4922 ) ( AVAILABLE ?auto_4910 ) ( SURFACE-AT ?auto_4901 ?auto_4922 ) ( ON ?auto_4901 ?auto_4924 ) ( CLEAR ?auto_4901 ) ( not ( = ?auto_4900 ?auto_4901 ) ) ( not ( = ?auto_4900 ?auto_4924 ) ) ( not ( = ?auto_4901 ?auto_4924 ) ) ( not ( = ?auto_4904 ?auto_4910 ) ) ( IS-CRATE ?auto_4900 ) ( not ( = ?auto_4912 ?auto_4907 ) ) ( HOIST-AT ?auto_4909 ?auto_4912 ) ( AVAILABLE ?auto_4909 ) ( SURFACE-AT ?auto_4900 ?auto_4912 ) ( ON ?auto_4900 ?auto_4913 ) ( CLEAR ?auto_4900 ) ( not ( = ?auto_4899 ?auto_4900 ) ) ( not ( = ?auto_4899 ?auto_4913 ) ) ( not ( = ?auto_4900 ?auto_4913 ) ) ( not ( = ?auto_4904 ?auto_4909 ) ) ( IS-CRATE ?auto_4899 ) ( not ( = ?auto_4923 ?auto_4907 ) ) ( HOIST-AT ?auto_4915 ?auto_4923 ) ( SURFACE-AT ?auto_4899 ?auto_4923 ) ( ON ?auto_4899 ?auto_4916 ) ( CLEAR ?auto_4899 ) ( not ( = ?auto_4898 ?auto_4899 ) ) ( not ( = ?auto_4898 ?auto_4916 ) ) ( not ( = ?auto_4899 ?auto_4916 ) ) ( not ( = ?auto_4904 ?auto_4915 ) ) ( IS-CRATE ?auto_4898 ) ( AVAILABLE ?auto_4915 ) ( SURFACE-AT ?auto_4898 ?auto_4923 ) ( ON ?auto_4898 ?auto_4918 ) ( CLEAR ?auto_4898 ) ( not ( = ?auto_4897 ?auto_4898 ) ) ( not ( = ?auto_4897 ?auto_4918 ) ) ( not ( = ?auto_4898 ?auto_4918 ) ) ( IS-CRATE ?auto_4897 ) ( not ( = ?auto_4920 ?auto_4907 ) ) ( HOIST-AT ?auto_4919 ?auto_4920 ) ( AVAILABLE ?auto_4919 ) ( SURFACE-AT ?auto_4897 ?auto_4920 ) ( ON ?auto_4897 ?auto_4914 ) ( CLEAR ?auto_4897 ) ( not ( = ?auto_4896 ?auto_4897 ) ) ( not ( = ?auto_4896 ?auto_4914 ) ) ( not ( = ?auto_4897 ?auto_4914 ) ) ( not ( = ?auto_4904 ?auto_4919 ) ) ( SURFACE-AT ?auto_4895 ?auto_4907 ) ( CLEAR ?auto_4895 ) ( IS-CRATE ?auto_4896 ) ( AVAILABLE ?auto_4904 ) ( not ( = ?auto_4917 ?auto_4907 ) ) ( HOIST-AT ?auto_4921 ?auto_4917 ) ( AVAILABLE ?auto_4921 ) ( SURFACE-AT ?auto_4896 ?auto_4917 ) ( ON ?auto_4896 ?auto_4911 ) ( CLEAR ?auto_4896 ) ( TRUCK-AT ?auto_4906 ?auto_4907 ) ( not ( = ?auto_4895 ?auto_4896 ) ) ( not ( = ?auto_4895 ?auto_4911 ) ) ( not ( = ?auto_4896 ?auto_4911 ) ) ( not ( = ?auto_4904 ?auto_4921 ) ) ( not ( = ?auto_4895 ?auto_4897 ) ) ( not ( = ?auto_4895 ?auto_4914 ) ) ( not ( = ?auto_4897 ?auto_4911 ) ) ( not ( = ?auto_4920 ?auto_4917 ) ) ( not ( = ?auto_4919 ?auto_4921 ) ) ( not ( = ?auto_4914 ?auto_4911 ) ) ( not ( = ?auto_4895 ?auto_4898 ) ) ( not ( = ?auto_4895 ?auto_4918 ) ) ( not ( = ?auto_4896 ?auto_4898 ) ) ( not ( = ?auto_4896 ?auto_4918 ) ) ( not ( = ?auto_4898 ?auto_4914 ) ) ( not ( = ?auto_4898 ?auto_4911 ) ) ( not ( = ?auto_4923 ?auto_4920 ) ) ( not ( = ?auto_4923 ?auto_4917 ) ) ( not ( = ?auto_4915 ?auto_4919 ) ) ( not ( = ?auto_4915 ?auto_4921 ) ) ( not ( = ?auto_4918 ?auto_4914 ) ) ( not ( = ?auto_4918 ?auto_4911 ) ) ( not ( = ?auto_4895 ?auto_4899 ) ) ( not ( = ?auto_4895 ?auto_4916 ) ) ( not ( = ?auto_4896 ?auto_4899 ) ) ( not ( = ?auto_4896 ?auto_4916 ) ) ( not ( = ?auto_4897 ?auto_4899 ) ) ( not ( = ?auto_4897 ?auto_4916 ) ) ( not ( = ?auto_4899 ?auto_4918 ) ) ( not ( = ?auto_4899 ?auto_4914 ) ) ( not ( = ?auto_4899 ?auto_4911 ) ) ( not ( = ?auto_4916 ?auto_4918 ) ) ( not ( = ?auto_4916 ?auto_4914 ) ) ( not ( = ?auto_4916 ?auto_4911 ) ) ( not ( = ?auto_4895 ?auto_4900 ) ) ( not ( = ?auto_4895 ?auto_4913 ) ) ( not ( = ?auto_4896 ?auto_4900 ) ) ( not ( = ?auto_4896 ?auto_4913 ) ) ( not ( = ?auto_4897 ?auto_4900 ) ) ( not ( = ?auto_4897 ?auto_4913 ) ) ( not ( = ?auto_4898 ?auto_4900 ) ) ( not ( = ?auto_4898 ?auto_4913 ) ) ( not ( = ?auto_4900 ?auto_4916 ) ) ( not ( = ?auto_4900 ?auto_4918 ) ) ( not ( = ?auto_4900 ?auto_4914 ) ) ( not ( = ?auto_4900 ?auto_4911 ) ) ( not ( = ?auto_4912 ?auto_4923 ) ) ( not ( = ?auto_4912 ?auto_4920 ) ) ( not ( = ?auto_4912 ?auto_4917 ) ) ( not ( = ?auto_4909 ?auto_4915 ) ) ( not ( = ?auto_4909 ?auto_4919 ) ) ( not ( = ?auto_4909 ?auto_4921 ) ) ( not ( = ?auto_4913 ?auto_4916 ) ) ( not ( = ?auto_4913 ?auto_4918 ) ) ( not ( = ?auto_4913 ?auto_4914 ) ) ( not ( = ?auto_4913 ?auto_4911 ) ) ( not ( = ?auto_4895 ?auto_4901 ) ) ( not ( = ?auto_4895 ?auto_4924 ) ) ( not ( = ?auto_4896 ?auto_4901 ) ) ( not ( = ?auto_4896 ?auto_4924 ) ) ( not ( = ?auto_4897 ?auto_4901 ) ) ( not ( = ?auto_4897 ?auto_4924 ) ) ( not ( = ?auto_4898 ?auto_4901 ) ) ( not ( = ?auto_4898 ?auto_4924 ) ) ( not ( = ?auto_4899 ?auto_4901 ) ) ( not ( = ?auto_4899 ?auto_4924 ) ) ( not ( = ?auto_4901 ?auto_4913 ) ) ( not ( = ?auto_4901 ?auto_4916 ) ) ( not ( = ?auto_4901 ?auto_4918 ) ) ( not ( = ?auto_4901 ?auto_4914 ) ) ( not ( = ?auto_4901 ?auto_4911 ) ) ( not ( = ?auto_4922 ?auto_4912 ) ) ( not ( = ?auto_4922 ?auto_4923 ) ) ( not ( = ?auto_4922 ?auto_4920 ) ) ( not ( = ?auto_4922 ?auto_4917 ) ) ( not ( = ?auto_4910 ?auto_4909 ) ) ( not ( = ?auto_4910 ?auto_4915 ) ) ( not ( = ?auto_4910 ?auto_4919 ) ) ( not ( = ?auto_4910 ?auto_4921 ) ) ( not ( = ?auto_4924 ?auto_4913 ) ) ( not ( = ?auto_4924 ?auto_4916 ) ) ( not ( = ?auto_4924 ?auto_4918 ) ) ( not ( = ?auto_4924 ?auto_4914 ) ) ( not ( = ?auto_4924 ?auto_4911 ) ) ( not ( = ?auto_4895 ?auto_4902 ) ) ( not ( = ?auto_4895 ?auto_4903 ) ) ( not ( = ?auto_4896 ?auto_4902 ) ) ( not ( = ?auto_4896 ?auto_4903 ) ) ( not ( = ?auto_4897 ?auto_4902 ) ) ( not ( = ?auto_4897 ?auto_4903 ) ) ( not ( = ?auto_4898 ?auto_4902 ) ) ( not ( = ?auto_4898 ?auto_4903 ) ) ( not ( = ?auto_4899 ?auto_4902 ) ) ( not ( = ?auto_4899 ?auto_4903 ) ) ( not ( = ?auto_4900 ?auto_4902 ) ) ( not ( = ?auto_4900 ?auto_4903 ) ) ( not ( = ?auto_4902 ?auto_4924 ) ) ( not ( = ?auto_4902 ?auto_4913 ) ) ( not ( = ?auto_4902 ?auto_4916 ) ) ( not ( = ?auto_4902 ?auto_4918 ) ) ( not ( = ?auto_4902 ?auto_4914 ) ) ( not ( = ?auto_4902 ?auto_4911 ) ) ( not ( = ?auto_4908 ?auto_4922 ) ) ( not ( = ?auto_4908 ?auto_4912 ) ) ( not ( = ?auto_4908 ?auto_4923 ) ) ( not ( = ?auto_4908 ?auto_4920 ) ) ( not ( = ?auto_4908 ?auto_4917 ) ) ( not ( = ?auto_4905 ?auto_4910 ) ) ( not ( = ?auto_4905 ?auto_4909 ) ) ( not ( = ?auto_4905 ?auto_4915 ) ) ( not ( = ?auto_4905 ?auto_4919 ) ) ( not ( = ?auto_4905 ?auto_4921 ) ) ( not ( = ?auto_4903 ?auto_4924 ) ) ( not ( = ?auto_4903 ?auto_4913 ) ) ( not ( = ?auto_4903 ?auto_4916 ) ) ( not ( = ?auto_4903 ?auto_4918 ) ) ( not ( = ?auto_4903 ?auto_4914 ) ) ( not ( = ?auto_4903 ?auto_4911 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4895 ?auto_4896 ?auto_4897 ?auto_4898 ?auto_4899 ?auto_4900 ?auto_4901 )
      ( MAKE-1CRATE ?auto_4901 ?auto_4902 )
      ( MAKE-7CRATE-VERIFY ?auto_4895 ?auto_4896 ?auto_4897 ?auto_4898 ?auto_4899 ?auto_4900 ?auto_4901 ?auto_4902 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4944 - SURFACE
      ?auto_4945 - SURFACE
      ?auto_4946 - SURFACE
      ?auto_4947 - SURFACE
      ?auto_4948 - SURFACE
      ?auto_4949 - SURFACE
      ?auto_4950 - SURFACE
      ?auto_4951 - SURFACE
      ?auto_4952 - SURFACE
    )
    :vars
    (
      ?auto_4958 - HOIST
      ?auto_4957 - PLACE
      ?auto_4953 - PLACE
      ?auto_4954 - HOIST
      ?auto_4955 - SURFACE
      ?auto_4962 - SURFACE
      ?auto_4967 - PLACE
      ?auto_4963 - HOIST
      ?auto_4964 - SURFACE
      ?auto_4961 - PLACE
      ?auto_4975 - HOIST
      ?auto_4972 - SURFACE
      ?auto_4965 - PLACE
      ?auto_4966 - HOIST
      ?auto_4971 - SURFACE
      ?auto_4974 - SURFACE
      ?auto_4973 - PLACE
      ?auto_4960 - HOIST
      ?auto_4969 - SURFACE
      ?auto_4970 - PLACE
      ?auto_4968 - HOIST
      ?auto_4959 - SURFACE
      ?auto_4956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4958 ?auto_4957 ) ( IS-CRATE ?auto_4952 ) ( not ( = ?auto_4953 ?auto_4957 ) ) ( HOIST-AT ?auto_4954 ?auto_4953 ) ( SURFACE-AT ?auto_4952 ?auto_4953 ) ( ON ?auto_4952 ?auto_4955 ) ( CLEAR ?auto_4952 ) ( not ( = ?auto_4951 ?auto_4952 ) ) ( not ( = ?auto_4951 ?auto_4955 ) ) ( not ( = ?auto_4952 ?auto_4955 ) ) ( not ( = ?auto_4958 ?auto_4954 ) ) ( IS-CRATE ?auto_4951 ) ( AVAILABLE ?auto_4954 ) ( SURFACE-AT ?auto_4951 ?auto_4953 ) ( ON ?auto_4951 ?auto_4962 ) ( CLEAR ?auto_4951 ) ( not ( = ?auto_4950 ?auto_4951 ) ) ( not ( = ?auto_4950 ?auto_4962 ) ) ( not ( = ?auto_4951 ?auto_4962 ) ) ( IS-CRATE ?auto_4950 ) ( not ( = ?auto_4967 ?auto_4957 ) ) ( HOIST-AT ?auto_4963 ?auto_4967 ) ( AVAILABLE ?auto_4963 ) ( SURFACE-AT ?auto_4950 ?auto_4967 ) ( ON ?auto_4950 ?auto_4964 ) ( CLEAR ?auto_4950 ) ( not ( = ?auto_4949 ?auto_4950 ) ) ( not ( = ?auto_4949 ?auto_4964 ) ) ( not ( = ?auto_4950 ?auto_4964 ) ) ( not ( = ?auto_4958 ?auto_4963 ) ) ( IS-CRATE ?auto_4949 ) ( not ( = ?auto_4961 ?auto_4957 ) ) ( HOIST-AT ?auto_4975 ?auto_4961 ) ( AVAILABLE ?auto_4975 ) ( SURFACE-AT ?auto_4949 ?auto_4961 ) ( ON ?auto_4949 ?auto_4972 ) ( CLEAR ?auto_4949 ) ( not ( = ?auto_4948 ?auto_4949 ) ) ( not ( = ?auto_4948 ?auto_4972 ) ) ( not ( = ?auto_4949 ?auto_4972 ) ) ( not ( = ?auto_4958 ?auto_4975 ) ) ( IS-CRATE ?auto_4948 ) ( not ( = ?auto_4965 ?auto_4957 ) ) ( HOIST-AT ?auto_4966 ?auto_4965 ) ( SURFACE-AT ?auto_4948 ?auto_4965 ) ( ON ?auto_4948 ?auto_4971 ) ( CLEAR ?auto_4948 ) ( not ( = ?auto_4947 ?auto_4948 ) ) ( not ( = ?auto_4947 ?auto_4971 ) ) ( not ( = ?auto_4948 ?auto_4971 ) ) ( not ( = ?auto_4958 ?auto_4966 ) ) ( IS-CRATE ?auto_4947 ) ( AVAILABLE ?auto_4966 ) ( SURFACE-AT ?auto_4947 ?auto_4965 ) ( ON ?auto_4947 ?auto_4974 ) ( CLEAR ?auto_4947 ) ( not ( = ?auto_4946 ?auto_4947 ) ) ( not ( = ?auto_4946 ?auto_4974 ) ) ( not ( = ?auto_4947 ?auto_4974 ) ) ( IS-CRATE ?auto_4946 ) ( not ( = ?auto_4973 ?auto_4957 ) ) ( HOIST-AT ?auto_4960 ?auto_4973 ) ( AVAILABLE ?auto_4960 ) ( SURFACE-AT ?auto_4946 ?auto_4973 ) ( ON ?auto_4946 ?auto_4969 ) ( CLEAR ?auto_4946 ) ( not ( = ?auto_4945 ?auto_4946 ) ) ( not ( = ?auto_4945 ?auto_4969 ) ) ( not ( = ?auto_4946 ?auto_4969 ) ) ( not ( = ?auto_4958 ?auto_4960 ) ) ( SURFACE-AT ?auto_4944 ?auto_4957 ) ( CLEAR ?auto_4944 ) ( IS-CRATE ?auto_4945 ) ( AVAILABLE ?auto_4958 ) ( not ( = ?auto_4970 ?auto_4957 ) ) ( HOIST-AT ?auto_4968 ?auto_4970 ) ( AVAILABLE ?auto_4968 ) ( SURFACE-AT ?auto_4945 ?auto_4970 ) ( ON ?auto_4945 ?auto_4959 ) ( CLEAR ?auto_4945 ) ( TRUCK-AT ?auto_4956 ?auto_4957 ) ( not ( = ?auto_4944 ?auto_4945 ) ) ( not ( = ?auto_4944 ?auto_4959 ) ) ( not ( = ?auto_4945 ?auto_4959 ) ) ( not ( = ?auto_4958 ?auto_4968 ) ) ( not ( = ?auto_4944 ?auto_4946 ) ) ( not ( = ?auto_4944 ?auto_4969 ) ) ( not ( = ?auto_4946 ?auto_4959 ) ) ( not ( = ?auto_4973 ?auto_4970 ) ) ( not ( = ?auto_4960 ?auto_4968 ) ) ( not ( = ?auto_4969 ?auto_4959 ) ) ( not ( = ?auto_4944 ?auto_4947 ) ) ( not ( = ?auto_4944 ?auto_4974 ) ) ( not ( = ?auto_4945 ?auto_4947 ) ) ( not ( = ?auto_4945 ?auto_4974 ) ) ( not ( = ?auto_4947 ?auto_4969 ) ) ( not ( = ?auto_4947 ?auto_4959 ) ) ( not ( = ?auto_4965 ?auto_4973 ) ) ( not ( = ?auto_4965 ?auto_4970 ) ) ( not ( = ?auto_4966 ?auto_4960 ) ) ( not ( = ?auto_4966 ?auto_4968 ) ) ( not ( = ?auto_4974 ?auto_4969 ) ) ( not ( = ?auto_4974 ?auto_4959 ) ) ( not ( = ?auto_4944 ?auto_4948 ) ) ( not ( = ?auto_4944 ?auto_4971 ) ) ( not ( = ?auto_4945 ?auto_4948 ) ) ( not ( = ?auto_4945 ?auto_4971 ) ) ( not ( = ?auto_4946 ?auto_4948 ) ) ( not ( = ?auto_4946 ?auto_4971 ) ) ( not ( = ?auto_4948 ?auto_4974 ) ) ( not ( = ?auto_4948 ?auto_4969 ) ) ( not ( = ?auto_4948 ?auto_4959 ) ) ( not ( = ?auto_4971 ?auto_4974 ) ) ( not ( = ?auto_4971 ?auto_4969 ) ) ( not ( = ?auto_4971 ?auto_4959 ) ) ( not ( = ?auto_4944 ?auto_4949 ) ) ( not ( = ?auto_4944 ?auto_4972 ) ) ( not ( = ?auto_4945 ?auto_4949 ) ) ( not ( = ?auto_4945 ?auto_4972 ) ) ( not ( = ?auto_4946 ?auto_4949 ) ) ( not ( = ?auto_4946 ?auto_4972 ) ) ( not ( = ?auto_4947 ?auto_4949 ) ) ( not ( = ?auto_4947 ?auto_4972 ) ) ( not ( = ?auto_4949 ?auto_4971 ) ) ( not ( = ?auto_4949 ?auto_4974 ) ) ( not ( = ?auto_4949 ?auto_4969 ) ) ( not ( = ?auto_4949 ?auto_4959 ) ) ( not ( = ?auto_4961 ?auto_4965 ) ) ( not ( = ?auto_4961 ?auto_4973 ) ) ( not ( = ?auto_4961 ?auto_4970 ) ) ( not ( = ?auto_4975 ?auto_4966 ) ) ( not ( = ?auto_4975 ?auto_4960 ) ) ( not ( = ?auto_4975 ?auto_4968 ) ) ( not ( = ?auto_4972 ?auto_4971 ) ) ( not ( = ?auto_4972 ?auto_4974 ) ) ( not ( = ?auto_4972 ?auto_4969 ) ) ( not ( = ?auto_4972 ?auto_4959 ) ) ( not ( = ?auto_4944 ?auto_4950 ) ) ( not ( = ?auto_4944 ?auto_4964 ) ) ( not ( = ?auto_4945 ?auto_4950 ) ) ( not ( = ?auto_4945 ?auto_4964 ) ) ( not ( = ?auto_4946 ?auto_4950 ) ) ( not ( = ?auto_4946 ?auto_4964 ) ) ( not ( = ?auto_4947 ?auto_4950 ) ) ( not ( = ?auto_4947 ?auto_4964 ) ) ( not ( = ?auto_4948 ?auto_4950 ) ) ( not ( = ?auto_4948 ?auto_4964 ) ) ( not ( = ?auto_4950 ?auto_4972 ) ) ( not ( = ?auto_4950 ?auto_4971 ) ) ( not ( = ?auto_4950 ?auto_4974 ) ) ( not ( = ?auto_4950 ?auto_4969 ) ) ( not ( = ?auto_4950 ?auto_4959 ) ) ( not ( = ?auto_4967 ?auto_4961 ) ) ( not ( = ?auto_4967 ?auto_4965 ) ) ( not ( = ?auto_4967 ?auto_4973 ) ) ( not ( = ?auto_4967 ?auto_4970 ) ) ( not ( = ?auto_4963 ?auto_4975 ) ) ( not ( = ?auto_4963 ?auto_4966 ) ) ( not ( = ?auto_4963 ?auto_4960 ) ) ( not ( = ?auto_4963 ?auto_4968 ) ) ( not ( = ?auto_4964 ?auto_4972 ) ) ( not ( = ?auto_4964 ?auto_4971 ) ) ( not ( = ?auto_4964 ?auto_4974 ) ) ( not ( = ?auto_4964 ?auto_4969 ) ) ( not ( = ?auto_4964 ?auto_4959 ) ) ( not ( = ?auto_4944 ?auto_4951 ) ) ( not ( = ?auto_4944 ?auto_4962 ) ) ( not ( = ?auto_4945 ?auto_4951 ) ) ( not ( = ?auto_4945 ?auto_4962 ) ) ( not ( = ?auto_4946 ?auto_4951 ) ) ( not ( = ?auto_4946 ?auto_4962 ) ) ( not ( = ?auto_4947 ?auto_4951 ) ) ( not ( = ?auto_4947 ?auto_4962 ) ) ( not ( = ?auto_4948 ?auto_4951 ) ) ( not ( = ?auto_4948 ?auto_4962 ) ) ( not ( = ?auto_4949 ?auto_4951 ) ) ( not ( = ?auto_4949 ?auto_4962 ) ) ( not ( = ?auto_4951 ?auto_4964 ) ) ( not ( = ?auto_4951 ?auto_4972 ) ) ( not ( = ?auto_4951 ?auto_4971 ) ) ( not ( = ?auto_4951 ?auto_4974 ) ) ( not ( = ?auto_4951 ?auto_4969 ) ) ( not ( = ?auto_4951 ?auto_4959 ) ) ( not ( = ?auto_4953 ?auto_4967 ) ) ( not ( = ?auto_4953 ?auto_4961 ) ) ( not ( = ?auto_4953 ?auto_4965 ) ) ( not ( = ?auto_4953 ?auto_4973 ) ) ( not ( = ?auto_4953 ?auto_4970 ) ) ( not ( = ?auto_4954 ?auto_4963 ) ) ( not ( = ?auto_4954 ?auto_4975 ) ) ( not ( = ?auto_4954 ?auto_4966 ) ) ( not ( = ?auto_4954 ?auto_4960 ) ) ( not ( = ?auto_4954 ?auto_4968 ) ) ( not ( = ?auto_4962 ?auto_4964 ) ) ( not ( = ?auto_4962 ?auto_4972 ) ) ( not ( = ?auto_4962 ?auto_4971 ) ) ( not ( = ?auto_4962 ?auto_4974 ) ) ( not ( = ?auto_4962 ?auto_4969 ) ) ( not ( = ?auto_4962 ?auto_4959 ) ) ( not ( = ?auto_4944 ?auto_4952 ) ) ( not ( = ?auto_4944 ?auto_4955 ) ) ( not ( = ?auto_4945 ?auto_4952 ) ) ( not ( = ?auto_4945 ?auto_4955 ) ) ( not ( = ?auto_4946 ?auto_4952 ) ) ( not ( = ?auto_4946 ?auto_4955 ) ) ( not ( = ?auto_4947 ?auto_4952 ) ) ( not ( = ?auto_4947 ?auto_4955 ) ) ( not ( = ?auto_4948 ?auto_4952 ) ) ( not ( = ?auto_4948 ?auto_4955 ) ) ( not ( = ?auto_4949 ?auto_4952 ) ) ( not ( = ?auto_4949 ?auto_4955 ) ) ( not ( = ?auto_4950 ?auto_4952 ) ) ( not ( = ?auto_4950 ?auto_4955 ) ) ( not ( = ?auto_4952 ?auto_4962 ) ) ( not ( = ?auto_4952 ?auto_4964 ) ) ( not ( = ?auto_4952 ?auto_4972 ) ) ( not ( = ?auto_4952 ?auto_4971 ) ) ( not ( = ?auto_4952 ?auto_4974 ) ) ( not ( = ?auto_4952 ?auto_4969 ) ) ( not ( = ?auto_4952 ?auto_4959 ) ) ( not ( = ?auto_4955 ?auto_4962 ) ) ( not ( = ?auto_4955 ?auto_4964 ) ) ( not ( = ?auto_4955 ?auto_4972 ) ) ( not ( = ?auto_4955 ?auto_4971 ) ) ( not ( = ?auto_4955 ?auto_4974 ) ) ( not ( = ?auto_4955 ?auto_4969 ) ) ( not ( = ?auto_4955 ?auto_4959 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4944 ?auto_4945 ?auto_4946 ?auto_4947 ?auto_4948 ?auto_4949 ?auto_4950 ?auto_4951 )
      ( MAKE-1CRATE ?auto_4951 ?auto_4952 )
      ( MAKE-8CRATE-VERIFY ?auto_4944 ?auto_4945 ?auto_4946 ?auto_4947 ?auto_4948 ?auto_4949 ?auto_4950 ?auto_4951 ?auto_4952 ) )
  )

)

