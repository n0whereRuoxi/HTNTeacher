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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4710 - SURFACE
      ?auto_4711 - SURFACE
    )
    :vars
    (
      ?auto_4712 - HOIST
      ?auto_4713 - PLACE
      ?auto_4715 - PLACE
      ?auto_4716 - HOIST
      ?auto_4717 - SURFACE
      ?auto_4714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4712 ?auto_4713 ) ( SURFACE-AT ?auto_4710 ?auto_4713 ) ( CLEAR ?auto_4710 ) ( IS-CRATE ?auto_4711 ) ( AVAILABLE ?auto_4712 ) ( not ( = ?auto_4715 ?auto_4713 ) ) ( HOIST-AT ?auto_4716 ?auto_4715 ) ( AVAILABLE ?auto_4716 ) ( SURFACE-AT ?auto_4711 ?auto_4715 ) ( ON ?auto_4711 ?auto_4717 ) ( CLEAR ?auto_4711 ) ( TRUCK-AT ?auto_4714 ?auto_4713 ) ( not ( = ?auto_4710 ?auto_4711 ) ) ( not ( = ?auto_4710 ?auto_4717 ) ) ( not ( = ?auto_4711 ?auto_4717 ) ) ( not ( = ?auto_4712 ?auto_4716 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4714 ?auto_4713 ?auto_4715 )
      ( !LIFT ?auto_4716 ?auto_4711 ?auto_4717 ?auto_4715 )
      ( !LOAD ?auto_4716 ?auto_4711 ?auto_4714 ?auto_4715 )
      ( !DRIVE ?auto_4714 ?auto_4715 ?auto_4713 )
      ( !UNLOAD ?auto_4712 ?auto_4711 ?auto_4714 ?auto_4713 )
      ( !DROP ?auto_4712 ?auto_4711 ?auto_4710 ?auto_4713 )
      ( MAKE-1CRATE-VERIFY ?auto_4710 ?auto_4711 ) )
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
      ?auto_4725 - HOIST
      ?auto_4726 - PLACE
      ?auto_4724 - PLACE
      ?auto_4729 - HOIST
      ?auto_4728 - SURFACE
      ?auto_4732 - PLACE
      ?auto_4730 - HOIST
      ?auto_4731 - SURFACE
      ?auto_4727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4725 ?auto_4726 ) ( IS-CRATE ?auto_4723 ) ( not ( = ?auto_4724 ?auto_4726 ) ) ( HOIST-AT ?auto_4729 ?auto_4724 ) ( AVAILABLE ?auto_4729 ) ( SURFACE-AT ?auto_4723 ?auto_4724 ) ( ON ?auto_4723 ?auto_4728 ) ( CLEAR ?auto_4723 ) ( not ( = ?auto_4722 ?auto_4723 ) ) ( not ( = ?auto_4722 ?auto_4728 ) ) ( not ( = ?auto_4723 ?auto_4728 ) ) ( not ( = ?auto_4725 ?auto_4729 ) ) ( SURFACE-AT ?auto_4721 ?auto_4726 ) ( CLEAR ?auto_4721 ) ( IS-CRATE ?auto_4722 ) ( AVAILABLE ?auto_4725 ) ( not ( = ?auto_4732 ?auto_4726 ) ) ( HOIST-AT ?auto_4730 ?auto_4732 ) ( AVAILABLE ?auto_4730 ) ( SURFACE-AT ?auto_4722 ?auto_4732 ) ( ON ?auto_4722 ?auto_4731 ) ( CLEAR ?auto_4722 ) ( TRUCK-AT ?auto_4727 ?auto_4726 ) ( not ( = ?auto_4721 ?auto_4722 ) ) ( not ( = ?auto_4721 ?auto_4731 ) ) ( not ( = ?auto_4722 ?auto_4731 ) ) ( not ( = ?auto_4725 ?auto_4730 ) ) ( not ( = ?auto_4721 ?auto_4723 ) ) ( not ( = ?auto_4721 ?auto_4728 ) ) ( not ( = ?auto_4723 ?auto_4731 ) ) ( not ( = ?auto_4724 ?auto_4732 ) ) ( not ( = ?auto_4729 ?auto_4730 ) ) ( not ( = ?auto_4728 ?auto_4731 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4721 ?auto_4722 )
      ( MAKE-1CRATE ?auto_4722 ?auto_4723 )
      ( MAKE-2CRATE-VERIFY ?auto_4721 ?auto_4722 ?auto_4723 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4735 - SURFACE
      ?auto_4736 - SURFACE
    )
    :vars
    (
      ?auto_4737 - HOIST
      ?auto_4738 - PLACE
      ?auto_4740 - PLACE
      ?auto_4741 - HOIST
      ?auto_4742 - SURFACE
      ?auto_4739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4737 ?auto_4738 ) ( SURFACE-AT ?auto_4735 ?auto_4738 ) ( CLEAR ?auto_4735 ) ( IS-CRATE ?auto_4736 ) ( AVAILABLE ?auto_4737 ) ( not ( = ?auto_4740 ?auto_4738 ) ) ( HOIST-AT ?auto_4741 ?auto_4740 ) ( AVAILABLE ?auto_4741 ) ( SURFACE-AT ?auto_4736 ?auto_4740 ) ( ON ?auto_4736 ?auto_4742 ) ( CLEAR ?auto_4736 ) ( TRUCK-AT ?auto_4739 ?auto_4738 ) ( not ( = ?auto_4735 ?auto_4736 ) ) ( not ( = ?auto_4735 ?auto_4742 ) ) ( not ( = ?auto_4736 ?auto_4742 ) ) ( not ( = ?auto_4737 ?auto_4741 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4739 ?auto_4738 ?auto_4740 )
      ( !LIFT ?auto_4741 ?auto_4736 ?auto_4742 ?auto_4740 )
      ( !LOAD ?auto_4741 ?auto_4736 ?auto_4739 ?auto_4740 )
      ( !DRIVE ?auto_4739 ?auto_4740 ?auto_4738 )
      ( !UNLOAD ?auto_4737 ?auto_4736 ?auto_4739 ?auto_4738 )
      ( !DROP ?auto_4737 ?auto_4736 ?auto_4735 ?auto_4738 )
      ( MAKE-1CRATE-VERIFY ?auto_4735 ?auto_4736 ) )
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
      ?auto_4756 - HOIST
      ?auto_4751 - PLACE
      ?auto_4754 - PLACE
      ?auto_4752 - HOIST
      ?auto_4755 - SURFACE
      ?auto_4757 - PLACE
      ?auto_4759 - HOIST
      ?auto_4760 - SURFACE
      ?auto_4762 - PLACE
      ?auto_4758 - HOIST
      ?auto_4761 - SURFACE
      ?auto_4753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4756 ?auto_4751 ) ( IS-CRATE ?auto_4750 ) ( not ( = ?auto_4754 ?auto_4751 ) ) ( HOIST-AT ?auto_4752 ?auto_4754 ) ( AVAILABLE ?auto_4752 ) ( SURFACE-AT ?auto_4750 ?auto_4754 ) ( ON ?auto_4750 ?auto_4755 ) ( CLEAR ?auto_4750 ) ( not ( = ?auto_4749 ?auto_4750 ) ) ( not ( = ?auto_4749 ?auto_4755 ) ) ( not ( = ?auto_4750 ?auto_4755 ) ) ( not ( = ?auto_4756 ?auto_4752 ) ) ( IS-CRATE ?auto_4749 ) ( not ( = ?auto_4757 ?auto_4751 ) ) ( HOIST-AT ?auto_4759 ?auto_4757 ) ( AVAILABLE ?auto_4759 ) ( SURFACE-AT ?auto_4749 ?auto_4757 ) ( ON ?auto_4749 ?auto_4760 ) ( CLEAR ?auto_4749 ) ( not ( = ?auto_4748 ?auto_4749 ) ) ( not ( = ?auto_4748 ?auto_4760 ) ) ( not ( = ?auto_4749 ?auto_4760 ) ) ( not ( = ?auto_4756 ?auto_4759 ) ) ( SURFACE-AT ?auto_4747 ?auto_4751 ) ( CLEAR ?auto_4747 ) ( IS-CRATE ?auto_4748 ) ( AVAILABLE ?auto_4756 ) ( not ( = ?auto_4762 ?auto_4751 ) ) ( HOIST-AT ?auto_4758 ?auto_4762 ) ( AVAILABLE ?auto_4758 ) ( SURFACE-AT ?auto_4748 ?auto_4762 ) ( ON ?auto_4748 ?auto_4761 ) ( CLEAR ?auto_4748 ) ( TRUCK-AT ?auto_4753 ?auto_4751 ) ( not ( = ?auto_4747 ?auto_4748 ) ) ( not ( = ?auto_4747 ?auto_4761 ) ) ( not ( = ?auto_4748 ?auto_4761 ) ) ( not ( = ?auto_4756 ?auto_4758 ) ) ( not ( = ?auto_4747 ?auto_4749 ) ) ( not ( = ?auto_4747 ?auto_4760 ) ) ( not ( = ?auto_4749 ?auto_4761 ) ) ( not ( = ?auto_4757 ?auto_4762 ) ) ( not ( = ?auto_4759 ?auto_4758 ) ) ( not ( = ?auto_4760 ?auto_4761 ) ) ( not ( = ?auto_4747 ?auto_4750 ) ) ( not ( = ?auto_4747 ?auto_4755 ) ) ( not ( = ?auto_4748 ?auto_4750 ) ) ( not ( = ?auto_4748 ?auto_4755 ) ) ( not ( = ?auto_4750 ?auto_4760 ) ) ( not ( = ?auto_4750 ?auto_4761 ) ) ( not ( = ?auto_4754 ?auto_4757 ) ) ( not ( = ?auto_4754 ?auto_4762 ) ) ( not ( = ?auto_4752 ?auto_4759 ) ) ( not ( = ?auto_4752 ?auto_4758 ) ) ( not ( = ?auto_4755 ?auto_4760 ) ) ( not ( = ?auto_4755 ?auto_4761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4747 ?auto_4748 ?auto_4749 )
      ( MAKE-1CRATE ?auto_4749 ?auto_4750 )
      ( MAKE-3CRATE-VERIFY ?auto_4747 ?auto_4748 ?auto_4749 ?auto_4750 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4765 - SURFACE
      ?auto_4766 - SURFACE
    )
    :vars
    (
      ?auto_4767 - HOIST
      ?auto_4768 - PLACE
      ?auto_4770 - PLACE
      ?auto_4771 - HOIST
      ?auto_4772 - SURFACE
      ?auto_4769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4767 ?auto_4768 ) ( SURFACE-AT ?auto_4765 ?auto_4768 ) ( CLEAR ?auto_4765 ) ( IS-CRATE ?auto_4766 ) ( AVAILABLE ?auto_4767 ) ( not ( = ?auto_4770 ?auto_4768 ) ) ( HOIST-AT ?auto_4771 ?auto_4770 ) ( AVAILABLE ?auto_4771 ) ( SURFACE-AT ?auto_4766 ?auto_4770 ) ( ON ?auto_4766 ?auto_4772 ) ( CLEAR ?auto_4766 ) ( TRUCK-AT ?auto_4769 ?auto_4768 ) ( not ( = ?auto_4765 ?auto_4766 ) ) ( not ( = ?auto_4765 ?auto_4772 ) ) ( not ( = ?auto_4766 ?auto_4772 ) ) ( not ( = ?auto_4767 ?auto_4771 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4769 ?auto_4768 ?auto_4770 )
      ( !LIFT ?auto_4771 ?auto_4766 ?auto_4772 ?auto_4770 )
      ( !LOAD ?auto_4771 ?auto_4766 ?auto_4769 ?auto_4770 )
      ( !DRIVE ?auto_4769 ?auto_4770 ?auto_4768 )
      ( !UNLOAD ?auto_4767 ?auto_4766 ?auto_4769 ?auto_4768 )
      ( !DROP ?auto_4767 ?auto_4766 ?auto_4765 ?auto_4768 )
      ( MAKE-1CRATE-VERIFY ?auto_4765 ?auto_4766 ) )
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
      ?auto_4786 - HOIST
      ?auto_4784 - PLACE
      ?auto_4783 - PLACE
      ?auto_4787 - HOIST
      ?auto_4788 - SURFACE
      ?auto_4795 - SURFACE
      ?auto_4792 - PLACE
      ?auto_4791 - HOIST
      ?auto_4789 - SURFACE
      ?auto_4794 - PLACE
      ?auto_4793 - HOIST
      ?auto_4790 - SURFACE
      ?auto_4785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4786 ?auto_4784 ) ( IS-CRATE ?auto_4782 ) ( not ( = ?auto_4783 ?auto_4784 ) ) ( HOIST-AT ?auto_4787 ?auto_4783 ) ( SURFACE-AT ?auto_4782 ?auto_4783 ) ( ON ?auto_4782 ?auto_4788 ) ( CLEAR ?auto_4782 ) ( not ( = ?auto_4781 ?auto_4782 ) ) ( not ( = ?auto_4781 ?auto_4788 ) ) ( not ( = ?auto_4782 ?auto_4788 ) ) ( not ( = ?auto_4786 ?auto_4787 ) ) ( IS-CRATE ?auto_4781 ) ( AVAILABLE ?auto_4787 ) ( SURFACE-AT ?auto_4781 ?auto_4783 ) ( ON ?auto_4781 ?auto_4795 ) ( CLEAR ?auto_4781 ) ( not ( = ?auto_4780 ?auto_4781 ) ) ( not ( = ?auto_4780 ?auto_4795 ) ) ( not ( = ?auto_4781 ?auto_4795 ) ) ( IS-CRATE ?auto_4780 ) ( not ( = ?auto_4792 ?auto_4784 ) ) ( HOIST-AT ?auto_4791 ?auto_4792 ) ( AVAILABLE ?auto_4791 ) ( SURFACE-AT ?auto_4780 ?auto_4792 ) ( ON ?auto_4780 ?auto_4789 ) ( CLEAR ?auto_4780 ) ( not ( = ?auto_4779 ?auto_4780 ) ) ( not ( = ?auto_4779 ?auto_4789 ) ) ( not ( = ?auto_4780 ?auto_4789 ) ) ( not ( = ?auto_4786 ?auto_4791 ) ) ( SURFACE-AT ?auto_4778 ?auto_4784 ) ( CLEAR ?auto_4778 ) ( IS-CRATE ?auto_4779 ) ( AVAILABLE ?auto_4786 ) ( not ( = ?auto_4794 ?auto_4784 ) ) ( HOIST-AT ?auto_4793 ?auto_4794 ) ( AVAILABLE ?auto_4793 ) ( SURFACE-AT ?auto_4779 ?auto_4794 ) ( ON ?auto_4779 ?auto_4790 ) ( CLEAR ?auto_4779 ) ( TRUCK-AT ?auto_4785 ?auto_4784 ) ( not ( = ?auto_4778 ?auto_4779 ) ) ( not ( = ?auto_4778 ?auto_4790 ) ) ( not ( = ?auto_4779 ?auto_4790 ) ) ( not ( = ?auto_4786 ?auto_4793 ) ) ( not ( = ?auto_4778 ?auto_4780 ) ) ( not ( = ?auto_4778 ?auto_4789 ) ) ( not ( = ?auto_4780 ?auto_4790 ) ) ( not ( = ?auto_4792 ?auto_4794 ) ) ( not ( = ?auto_4791 ?auto_4793 ) ) ( not ( = ?auto_4789 ?auto_4790 ) ) ( not ( = ?auto_4778 ?auto_4781 ) ) ( not ( = ?auto_4778 ?auto_4795 ) ) ( not ( = ?auto_4779 ?auto_4781 ) ) ( not ( = ?auto_4779 ?auto_4795 ) ) ( not ( = ?auto_4781 ?auto_4789 ) ) ( not ( = ?auto_4781 ?auto_4790 ) ) ( not ( = ?auto_4783 ?auto_4792 ) ) ( not ( = ?auto_4783 ?auto_4794 ) ) ( not ( = ?auto_4787 ?auto_4791 ) ) ( not ( = ?auto_4787 ?auto_4793 ) ) ( not ( = ?auto_4795 ?auto_4789 ) ) ( not ( = ?auto_4795 ?auto_4790 ) ) ( not ( = ?auto_4778 ?auto_4782 ) ) ( not ( = ?auto_4778 ?auto_4788 ) ) ( not ( = ?auto_4779 ?auto_4782 ) ) ( not ( = ?auto_4779 ?auto_4788 ) ) ( not ( = ?auto_4780 ?auto_4782 ) ) ( not ( = ?auto_4780 ?auto_4788 ) ) ( not ( = ?auto_4782 ?auto_4795 ) ) ( not ( = ?auto_4782 ?auto_4789 ) ) ( not ( = ?auto_4782 ?auto_4790 ) ) ( not ( = ?auto_4788 ?auto_4795 ) ) ( not ( = ?auto_4788 ?auto_4789 ) ) ( not ( = ?auto_4788 ?auto_4790 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4778 ?auto_4779 ?auto_4780 ?auto_4781 )
      ( MAKE-1CRATE ?auto_4781 ?auto_4782 )
      ( MAKE-4CRATE-VERIFY ?auto_4778 ?auto_4779 ?auto_4780 ?auto_4781 ?auto_4782 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4798 - SURFACE
      ?auto_4799 - SURFACE
    )
    :vars
    (
      ?auto_4800 - HOIST
      ?auto_4801 - PLACE
      ?auto_4803 - PLACE
      ?auto_4804 - HOIST
      ?auto_4805 - SURFACE
      ?auto_4802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4800 ?auto_4801 ) ( SURFACE-AT ?auto_4798 ?auto_4801 ) ( CLEAR ?auto_4798 ) ( IS-CRATE ?auto_4799 ) ( AVAILABLE ?auto_4800 ) ( not ( = ?auto_4803 ?auto_4801 ) ) ( HOIST-AT ?auto_4804 ?auto_4803 ) ( AVAILABLE ?auto_4804 ) ( SURFACE-AT ?auto_4799 ?auto_4803 ) ( ON ?auto_4799 ?auto_4805 ) ( CLEAR ?auto_4799 ) ( TRUCK-AT ?auto_4802 ?auto_4801 ) ( not ( = ?auto_4798 ?auto_4799 ) ) ( not ( = ?auto_4798 ?auto_4805 ) ) ( not ( = ?auto_4799 ?auto_4805 ) ) ( not ( = ?auto_4800 ?auto_4804 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4802 ?auto_4801 ?auto_4803 )
      ( !LIFT ?auto_4804 ?auto_4799 ?auto_4805 ?auto_4803 )
      ( !LOAD ?auto_4804 ?auto_4799 ?auto_4802 ?auto_4803 )
      ( !DRIVE ?auto_4802 ?auto_4803 ?auto_4801 )
      ( !UNLOAD ?auto_4800 ?auto_4799 ?auto_4802 ?auto_4801 )
      ( !DROP ?auto_4800 ?auto_4799 ?auto_4798 ?auto_4801 )
      ( MAKE-1CRATE-VERIFY ?auto_4798 ?auto_4799 ) )
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
      ?auto_4821 - HOIST
      ?auto_4823 - PLACE
      ?auto_4822 - PLACE
      ?auto_4818 - HOIST
      ?auto_4820 - SURFACE
      ?auto_4833 - PLACE
      ?auto_4825 - HOIST
      ?auto_4831 - SURFACE
      ?auto_4832 - SURFACE
      ?auto_4828 - PLACE
      ?auto_4826 - HOIST
      ?auto_4824 - SURFACE
      ?auto_4830 - PLACE
      ?auto_4829 - HOIST
      ?auto_4827 - SURFACE
      ?auto_4819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4821 ?auto_4823 ) ( IS-CRATE ?auto_4817 ) ( not ( = ?auto_4822 ?auto_4823 ) ) ( HOIST-AT ?auto_4818 ?auto_4822 ) ( AVAILABLE ?auto_4818 ) ( SURFACE-AT ?auto_4817 ?auto_4822 ) ( ON ?auto_4817 ?auto_4820 ) ( CLEAR ?auto_4817 ) ( not ( = ?auto_4816 ?auto_4817 ) ) ( not ( = ?auto_4816 ?auto_4820 ) ) ( not ( = ?auto_4817 ?auto_4820 ) ) ( not ( = ?auto_4821 ?auto_4818 ) ) ( IS-CRATE ?auto_4816 ) ( not ( = ?auto_4833 ?auto_4823 ) ) ( HOIST-AT ?auto_4825 ?auto_4833 ) ( SURFACE-AT ?auto_4816 ?auto_4833 ) ( ON ?auto_4816 ?auto_4831 ) ( CLEAR ?auto_4816 ) ( not ( = ?auto_4815 ?auto_4816 ) ) ( not ( = ?auto_4815 ?auto_4831 ) ) ( not ( = ?auto_4816 ?auto_4831 ) ) ( not ( = ?auto_4821 ?auto_4825 ) ) ( IS-CRATE ?auto_4815 ) ( AVAILABLE ?auto_4825 ) ( SURFACE-AT ?auto_4815 ?auto_4833 ) ( ON ?auto_4815 ?auto_4832 ) ( CLEAR ?auto_4815 ) ( not ( = ?auto_4814 ?auto_4815 ) ) ( not ( = ?auto_4814 ?auto_4832 ) ) ( not ( = ?auto_4815 ?auto_4832 ) ) ( IS-CRATE ?auto_4814 ) ( not ( = ?auto_4828 ?auto_4823 ) ) ( HOIST-AT ?auto_4826 ?auto_4828 ) ( AVAILABLE ?auto_4826 ) ( SURFACE-AT ?auto_4814 ?auto_4828 ) ( ON ?auto_4814 ?auto_4824 ) ( CLEAR ?auto_4814 ) ( not ( = ?auto_4813 ?auto_4814 ) ) ( not ( = ?auto_4813 ?auto_4824 ) ) ( not ( = ?auto_4814 ?auto_4824 ) ) ( not ( = ?auto_4821 ?auto_4826 ) ) ( SURFACE-AT ?auto_4812 ?auto_4823 ) ( CLEAR ?auto_4812 ) ( IS-CRATE ?auto_4813 ) ( AVAILABLE ?auto_4821 ) ( not ( = ?auto_4830 ?auto_4823 ) ) ( HOIST-AT ?auto_4829 ?auto_4830 ) ( AVAILABLE ?auto_4829 ) ( SURFACE-AT ?auto_4813 ?auto_4830 ) ( ON ?auto_4813 ?auto_4827 ) ( CLEAR ?auto_4813 ) ( TRUCK-AT ?auto_4819 ?auto_4823 ) ( not ( = ?auto_4812 ?auto_4813 ) ) ( not ( = ?auto_4812 ?auto_4827 ) ) ( not ( = ?auto_4813 ?auto_4827 ) ) ( not ( = ?auto_4821 ?auto_4829 ) ) ( not ( = ?auto_4812 ?auto_4814 ) ) ( not ( = ?auto_4812 ?auto_4824 ) ) ( not ( = ?auto_4814 ?auto_4827 ) ) ( not ( = ?auto_4828 ?auto_4830 ) ) ( not ( = ?auto_4826 ?auto_4829 ) ) ( not ( = ?auto_4824 ?auto_4827 ) ) ( not ( = ?auto_4812 ?auto_4815 ) ) ( not ( = ?auto_4812 ?auto_4832 ) ) ( not ( = ?auto_4813 ?auto_4815 ) ) ( not ( = ?auto_4813 ?auto_4832 ) ) ( not ( = ?auto_4815 ?auto_4824 ) ) ( not ( = ?auto_4815 ?auto_4827 ) ) ( not ( = ?auto_4833 ?auto_4828 ) ) ( not ( = ?auto_4833 ?auto_4830 ) ) ( not ( = ?auto_4825 ?auto_4826 ) ) ( not ( = ?auto_4825 ?auto_4829 ) ) ( not ( = ?auto_4832 ?auto_4824 ) ) ( not ( = ?auto_4832 ?auto_4827 ) ) ( not ( = ?auto_4812 ?auto_4816 ) ) ( not ( = ?auto_4812 ?auto_4831 ) ) ( not ( = ?auto_4813 ?auto_4816 ) ) ( not ( = ?auto_4813 ?auto_4831 ) ) ( not ( = ?auto_4814 ?auto_4816 ) ) ( not ( = ?auto_4814 ?auto_4831 ) ) ( not ( = ?auto_4816 ?auto_4832 ) ) ( not ( = ?auto_4816 ?auto_4824 ) ) ( not ( = ?auto_4816 ?auto_4827 ) ) ( not ( = ?auto_4831 ?auto_4832 ) ) ( not ( = ?auto_4831 ?auto_4824 ) ) ( not ( = ?auto_4831 ?auto_4827 ) ) ( not ( = ?auto_4812 ?auto_4817 ) ) ( not ( = ?auto_4812 ?auto_4820 ) ) ( not ( = ?auto_4813 ?auto_4817 ) ) ( not ( = ?auto_4813 ?auto_4820 ) ) ( not ( = ?auto_4814 ?auto_4817 ) ) ( not ( = ?auto_4814 ?auto_4820 ) ) ( not ( = ?auto_4815 ?auto_4817 ) ) ( not ( = ?auto_4815 ?auto_4820 ) ) ( not ( = ?auto_4817 ?auto_4831 ) ) ( not ( = ?auto_4817 ?auto_4832 ) ) ( not ( = ?auto_4817 ?auto_4824 ) ) ( not ( = ?auto_4817 ?auto_4827 ) ) ( not ( = ?auto_4822 ?auto_4833 ) ) ( not ( = ?auto_4822 ?auto_4828 ) ) ( not ( = ?auto_4822 ?auto_4830 ) ) ( not ( = ?auto_4818 ?auto_4825 ) ) ( not ( = ?auto_4818 ?auto_4826 ) ) ( not ( = ?auto_4818 ?auto_4829 ) ) ( not ( = ?auto_4820 ?auto_4831 ) ) ( not ( = ?auto_4820 ?auto_4832 ) ) ( not ( = ?auto_4820 ?auto_4824 ) ) ( not ( = ?auto_4820 ?auto_4827 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4812 ?auto_4813 ?auto_4814 ?auto_4815 ?auto_4816 )
      ( MAKE-1CRATE ?auto_4816 ?auto_4817 )
      ( MAKE-5CRATE-VERIFY ?auto_4812 ?auto_4813 ?auto_4814 ?auto_4815 ?auto_4816 ?auto_4817 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4836 - SURFACE
      ?auto_4837 - SURFACE
    )
    :vars
    (
      ?auto_4838 - HOIST
      ?auto_4839 - PLACE
      ?auto_4841 - PLACE
      ?auto_4842 - HOIST
      ?auto_4843 - SURFACE
      ?auto_4840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4838 ?auto_4839 ) ( SURFACE-AT ?auto_4836 ?auto_4839 ) ( CLEAR ?auto_4836 ) ( IS-CRATE ?auto_4837 ) ( AVAILABLE ?auto_4838 ) ( not ( = ?auto_4841 ?auto_4839 ) ) ( HOIST-AT ?auto_4842 ?auto_4841 ) ( AVAILABLE ?auto_4842 ) ( SURFACE-AT ?auto_4837 ?auto_4841 ) ( ON ?auto_4837 ?auto_4843 ) ( CLEAR ?auto_4837 ) ( TRUCK-AT ?auto_4840 ?auto_4839 ) ( not ( = ?auto_4836 ?auto_4837 ) ) ( not ( = ?auto_4836 ?auto_4843 ) ) ( not ( = ?auto_4837 ?auto_4843 ) ) ( not ( = ?auto_4838 ?auto_4842 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4840 ?auto_4839 ?auto_4841 )
      ( !LIFT ?auto_4842 ?auto_4837 ?auto_4843 ?auto_4841 )
      ( !LOAD ?auto_4842 ?auto_4837 ?auto_4840 ?auto_4841 )
      ( !DRIVE ?auto_4840 ?auto_4841 ?auto_4839 )
      ( !UNLOAD ?auto_4838 ?auto_4837 ?auto_4840 ?auto_4839 )
      ( !DROP ?auto_4838 ?auto_4837 ?auto_4836 ?auto_4839 )
      ( MAKE-1CRATE-VERIFY ?auto_4836 ?auto_4837 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4851 - SURFACE
      ?auto_4852 - SURFACE
      ?auto_4853 - SURFACE
      ?auto_4854 - SURFACE
      ?auto_4855 - SURFACE
      ?auto_4857 - SURFACE
      ?auto_4856 - SURFACE
    )
    :vars
    (
      ?auto_4861 - HOIST
      ?auto_4860 - PLACE
      ?auto_4862 - PLACE
      ?auto_4858 - HOIST
      ?auto_4859 - SURFACE
      ?auto_4875 - PLACE
      ?auto_4876 - HOIST
      ?auto_4864 - SURFACE
      ?auto_4872 - PLACE
      ?auto_4871 - HOIST
      ?auto_4873 - SURFACE
      ?auto_4874 - SURFACE
      ?auto_4865 - PLACE
      ?auto_4866 - HOIST
      ?auto_4870 - SURFACE
      ?auto_4869 - PLACE
      ?auto_4868 - HOIST
      ?auto_4867 - SURFACE
      ?auto_4863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4861 ?auto_4860 ) ( IS-CRATE ?auto_4856 ) ( not ( = ?auto_4862 ?auto_4860 ) ) ( HOIST-AT ?auto_4858 ?auto_4862 ) ( AVAILABLE ?auto_4858 ) ( SURFACE-AT ?auto_4856 ?auto_4862 ) ( ON ?auto_4856 ?auto_4859 ) ( CLEAR ?auto_4856 ) ( not ( = ?auto_4857 ?auto_4856 ) ) ( not ( = ?auto_4857 ?auto_4859 ) ) ( not ( = ?auto_4856 ?auto_4859 ) ) ( not ( = ?auto_4861 ?auto_4858 ) ) ( IS-CRATE ?auto_4857 ) ( not ( = ?auto_4875 ?auto_4860 ) ) ( HOIST-AT ?auto_4876 ?auto_4875 ) ( AVAILABLE ?auto_4876 ) ( SURFACE-AT ?auto_4857 ?auto_4875 ) ( ON ?auto_4857 ?auto_4864 ) ( CLEAR ?auto_4857 ) ( not ( = ?auto_4855 ?auto_4857 ) ) ( not ( = ?auto_4855 ?auto_4864 ) ) ( not ( = ?auto_4857 ?auto_4864 ) ) ( not ( = ?auto_4861 ?auto_4876 ) ) ( IS-CRATE ?auto_4855 ) ( not ( = ?auto_4872 ?auto_4860 ) ) ( HOIST-AT ?auto_4871 ?auto_4872 ) ( SURFACE-AT ?auto_4855 ?auto_4872 ) ( ON ?auto_4855 ?auto_4873 ) ( CLEAR ?auto_4855 ) ( not ( = ?auto_4854 ?auto_4855 ) ) ( not ( = ?auto_4854 ?auto_4873 ) ) ( not ( = ?auto_4855 ?auto_4873 ) ) ( not ( = ?auto_4861 ?auto_4871 ) ) ( IS-CRATE ?auto_4854 ) ( AVAILABLE ?auto_4871 ) ( SURFACE-AT ?auto_4854 ?auto_4872 ) ( ON ?auto_4854 ?auto_4874 ) ( CLEAR ?auto_4854 ) ( not ( = ?auto_4853 ?auto_4854 ) ) ( not ( = ?auto_4853 ?auto_4874 ) ) ( not ( = ?auto_4854 ?auto_4874 ) ) ( IS-CRATE ?auto_4853 ) ( not ( = ?auto_4865 ?auto_4860 ) ) ( HOIST-AT ?auto_4866 ?auto_4865 ) ( AVAILABLE ?auto_4866 ) ( SURFACE-AT ?auto_4853 ?auto_4865 ) ( ON ?auto_4853 ?auto_4870 ) ( CLEAR ?auto_4853 ) ( not ( = ?auto_4852 ?auto_4853 ) ) ( not ( = ?auto_4852 ?auto_4870 ) ) ( not ( = ?auto_4853 ?auto_4870 ) ) ( not ( = ?auto_4861 ?auto_4866 ) ) ( SURFACE-AT ?auto_4851 ?auto_4860 ) ( CLEAR ?auto_4851 ) ( IS-CRATE ?auto_4852 ) ( AVAILABLE ?auto_4861 ) ( not ( = ?auto_4869 ?auto_4860 ) ) ( HOIST-AT ?auto_4868 ?auto_4869 ) ( AVAILABLE ?auto_4868 ) ( SURFACE-AT ?auto_4852 ?auto_4869 ) ( ON ?auto_4852 ?auto_4867 ) ( CLEAR ?auto_4852 ) ( TRUCK-AT ?auto_4863 ?auto_4860 ) ( not ( = ?auto_4851 ?auto_4852 ) ) ( not ( = ?auto_4851 ?auto_4867 ) ) ( not ( = ?auto_4852 ?auto_4867 ) ) ( not ( = ?auto_4861 ?auto_4868 ) ) ( not ( = ?auto_4851 ?auto_4853 ) ) ( not ( = ?auto_4851 ?auto_4870 ) ) ( not ( = ?auto_4853 ?auto_4867 ) ) ( not ( = ?auto_4865 ?auto_4869 ) ) ( not ( = ?auto_4866 ?auto_4868 ) ) ( not ( = ?auto_4870 ?auto_4867 ) ) ( not ( = ?auto_4851 ?auto_4854 ) ) ( not ( = ?auto_4851 ?auto_4874 ) ) ( not ( = ?auto_4852 ?auto_4854 ) ) ( not ( = ?auto_4852 ?auto_4874 ) ) ( not ( = ?auto_4854 ?auto_4870 ) ) ( not ( = ?auto_4854 ?auto_4867 ) ) ( not ( = ?auto_4872 ?auto_4865 ) ) ( not ( = ?auto_4872 ?auto_4869 ) ) ( not ( = ?auto_4871 ?auto_4866 ) ) ( not ( = ?auto_4871 ?auto_4868 ) ) ( not ( = ?auto_4874 ?auto_4870 ) ) ( not ( = ?auto_4874 ?auto_4867 ) ) ( not ( = ?auto_4851 ?auto_4855 ) ) ( not ( = ?auto_4851 ?auto_4873 ) ) ( not ( = ?auto_4852 ?auto_4855 ) ) ( not ( = ?auto_4852 ?auto_4873 ) ) ( not ( = ?auto_4853 ?auto_4855 ) ) ( not ( = ?auto_4853 ?auto_4873 ) ) ( not ( = ?auto_4855 ?auto_4874 ) ) ( not ( = ?auto_4855 ?auto_4870 ) ) ( not ( = ?auto_4855 ?auto_4867 ) ) ( not ( = ?auto_4873 ?auto_4874 ) ) ( not ( = ?auto_4873 ?auto_4870 ) ) ( not ( = ?auto_4873 ?auto_4867 ) ) ( not ( = ?auto_4851 ?auto_4857 ) ) ( not ( = ?auto_4851 ?auto_4864 ) ) ( not ( = ?auto_4852 ?auto_4857 ) ) ( not ( = ?auto_4852 ?auto_4864 ) ) ( not ( = ?auto_4853 ?auto_4857 ) ) ( not ( = ?auto_4853 ?auto_4864 ) ) ( not ( = ?auto_4854 ?auto_4857 ) ) ( not ( = ?auto_4854 ?auto_4864 ) ) ( not ( = ?auto_4857 ?auto_4873 ) ) ( not ( = ?auto_4857 ?auto_4874 ) ) ( not ( = ?auto_4857 ?auto_4870 ) ) ( not ( = ?auto_4857 ?auto_4867 ) ) ( not ( = ?auto_4875 ?auto_4872 ) ) ( not ( = ?auto_4875 ?auto_4865 ) ) ( not ( = ?auto_4875 ?auto_4869 ) ) ( not ( = ?auto_4876 ?auto_4871 ) ) ( not ( = ?auto_4876 ?auto_4866 ) ) ( not ( = ?auto_4876 ?auto_4868 ) ) ( not ( = ?auto_4864 ?auto_4873 ) ) ( not ( = ?auto_4864 ?auto_4874 ) ) ( not ( = ?auto_4864 ?auto_4870 ) ) ( not ( = ?auto_4864 ?auto_4867 ) ) ( not ( = ?auto_4851 ?auto_4856 ) ) ( not ( = ?auto_4851 ?auto_4859 ) ) ( not ( = ?auto_4852 ?auto_4856 ) ) ( not ( = ?auto_4852 ?auto_4859 ) ) ( not ( = ?auto_4853 ?auto_4856 ) ) ( not ( = ?auto_4853 ?auto_4859 ) ) ( not ( = ?auto_4854 ?auto_4856 ) ) ( not ( = ?auto_4854 ?auto_4859 ) ) ( not ( = ?auto_4855 ?auto_4856 ) ) ( not ( = ?auto_4855 ?auto_4859 ) ) ( not ( = ?auto_4856 ?auto_4864 ) ) ( not ( = ?auto_4856 ?auto_4873 ) ) ( not ( = ?auto_4856 ?auto_4874 ) ) ( not ( = ?auto_4856 ?auto_4870 ) ) ( not ( = ?auto_4856 ?auto_4867 ) ) ( not ( = ?auto_4862 ?auto_4875 ) ) ( not ( = ?auto_4862 ?auto_4872 ) ) ( not ( = ?auto_4862 ?auto_4865 ) ) ( not ( = ?auto_4862 ?auto_4869 ) ) ( not ( = ?auto_4858 ?auto_4876 ) ) ( not ( = ?auto_4858 ?auto_4871 ) ) ( not ( = ?auto_4858 ?auto_4866 ) ) ( not ( = ?auto_4858 ?auto_4868 ) ) ( not ( = ?auto_4859 ?auto_4864 ) ) ( not ( = ?auto_4859 ?auto_4873 ) ) ( not ( = ?auto_4859 ?auto_4874 ) ) ( not ( = ?auto_4859 ?auto_4870 ) ) ( not ( = ?auto_4859 ?auto_4867 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4851 ?auto_4852 ?auto_4853 ?auto_4854 ?auto_4855 ?auto_4857 )
      ( MAKE-1CRATE ?auto_4857 ?auto_4856 )
      ( MAKE-6CRATE-VERIFY ?auto_4851 ?auto_4852 ?auto_4853 ?auto_4854 ?auto_4855 ?auto_4857 ?auto_4856 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4879 - SURFACE
      ?auto_4880 - SURFACE
    )
    :vars
    (
      ?auto_4881 - HOIST
      ?auto_4882 - PLACE
      ?auto_4884 - PLACE
      ?auto_4885 - HOIST
      ?auto_4886 - SURFACE
      ?auto_4883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4881 ?auto_4882 ) ( SURFACE-AT ?auto_4879 ?auto_4882 ) ( CLEAR ?auto_4879 ) ( IS-CRATE ?auto_4880 ) ( AVAILABLE ?auto_4881 ) ( not ( = ?auto_4884 ?auto_4882 ) ) ( HOIST-AT ?auto_4885 ?auto_4884 ) ( AVAILABLE ?auto_4885 ) ( SURFACE-AT ?auto_4880 ?auto_4884 ) ( ON ?auto_4880 ?auto_4886 ) ( CLEAR ?auto_4880 ) ( TRUCK-AT ?auto_4883 ?auto_4882 ) ( not ( = ?auto_4879 ?auto_4880 ) ) ( not ( = ?auto_4879 ?auto_4886 ) ) ( not ( = ?auto_4880 ?auto_4886 ) ) ( not ( = ?auto_4881 ?auto_4885 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4883 ?auto_4882 ?auto_4884 )
      ( !LIFT ?auto_4885 ?auto_4880 ?auto_4886 ?auto_4884 )
      ( !LOAD ?auto_4885 ?auto_4880 ?auto_4883 ?auto_4884 )
      ( !DRIVE ?auto_4883 ?auto_4884 ?auto_4882 )
      ( !UNLOAD ?auto_4881 ?auto_4880 ?auto_4883 ?auto_4882 )
      ( !DROP ?auto_4881 ?auto_4880 ?auto_4879 ?auto_4882 )
      ( MAKE-1CRATE-VERIFY ?auto_4879 ?auto_4880 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4895 - SURFACE
      ?auto_4896 - SURFACE
      ?auto_4897 - SURFACE
      ?auto_4898 - SURFACE
      ?auto_4899 - SURFACE
      ?auto_4901 - SURFACE
      ?auto_4900 - SURFACE
      ?auto_4902 - SURFACE
    )
    :vars
    (
      ?auto_4908 - HOIST
      ?auto_4906 - PLACE
      ?auto_4907 - PLACE
      ?auto_4905 - HOIST
      ?auto_4904 - SURFACE
      ?auto_4919 - PLACE
      ?auto_4918 - HOIST
      ?auto_4922 - SURFACE
      ?auto_4912 - PLACE
      ?auto_4913 - HOIST
      ?auto_4909 - SURFACE
      ?auto_4924 - PLACE
      ?auto_4914 - HOIST
      ?auto_4911 - SURFACE
      ?auto_4910 - SURFACE
      ?auto_4920 - PLACE
      ?auto_4923 - HOIST
      ?auto_4915 - SURFACE
      ?auto_4916 - PLACE
      ?auto_4917 - HOIST
      ?auto_4921 - SURFACE
      ?auto_4903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4908 ?auto_4906 ) ( IS-CRATE ?auto_4902 ) ( not ( = ?auto_4907 ?auto_4906 ) ) ( HOIST-AT ?auto_4905 ?auto_4907 ) ( AVAILABLE ?auto_4905 ) ( SURFACE-AT ?auto_4902 ?auto_4907 ) ( ON ?auto_4902 ?auto_4904 ) ( CLEAR ?auto_4902 ) ( not ( = ?auto_4900 ?auto_4902 ) ) ( not ( = ?auto_4900 ?auto_4904 ) ) ( not ( = ?auto_4902 ?auto_4904 ) ) ( not ( = ?auto_4908 ?auto_4905 ) ) ( IS-CRATE ?auto_4900 ) ( not ( = ?auto_4919 ?auto_4906 ) ) ( HOIST-AT ?auto_4918 ?auto_4919 ) ( AVAILABLE ?auto_4918 ) ( SURFACE-AT ?auto_4900 ?auto_4919 ) ( ON ?auto_4900 ?auto_4922 ) ( CLEAR ?auto_4900 ) ( not ( = ?auto_4901 ?auto_4900 ) ) ( not ( = ?auto_4901 ?auto_4922 ) ) ( not ( = ?auto_4900 ?auto_4922 ) ) ( not ( = ?auto_4908 ?auto_4918 ) ) ( IS-CRATE ?auto_4901 ) ( not ( = ?auto_4912 ?auto_4906 ) ) ( HOIST-AT ?auto_4913 ?auto_4912 ) ( AVAILABLE ?auto_4913 ) ( SURFACE-AT ?auto_4901 ?auto_4912 ) ( ON ?auto_4901 ?auto_4909 ) ( CLEAR ?auto_4901 ) ( not ( = ?auto_4899 ?auto_4901 ) ) ( not ( = ?auto_4899 ?auto_4909 ) ) ( not ( = ?auto_4901 ?auto_4909 ) ) ( not ( = ?auto_4908 ?auto_4913 ) ) ( IS-CRATE ?auto_4899 ) ( not ( = ?auto_4924 ?auto_4906 ) ) ( HOIST-AT ?auto_4914 ?auto_4924 ) ( SURFACE-AT ?auto_4899 ?auto_4924 ) ( ON ?auto_4899 ?auto_4911 ) ( CLEAR ?auto_4899 ) ( not ( = ?auto_4898 ?auto_4899 ) ) ( not ( = ?auto_4898 ?auto_4911 ) ) ( not ( = ?auto_4899 ?auto_4911 ) ) ( not ( = ?auto_4908 ?auto_4914 ) ) ( IS-CRATE ?auto_4898 ) ( AVAILABLE ?auto_4914 ) ( SURFACE-AT ?auto_4898 ?auto_4924 ) ( ON ?auto_4898 ?auto_4910 ) ( CLEAR ?auto_4898 ) ( not ( = ?auto_4897 ?auto_4898 ) ) ( not ( = ?auto_4897 ?auto_4910 ) ) ( not ( = ?auto_4898 ?auto_4910 ) ) ( IS-CRATE ?auto_4897 ) ( not ( = ?auto_4920 ?auto_4906 ) ) ( HOIST-AT ?auto_4923 ?auto_4920 ) ( AVAILABLE ?auto_4923 ) ( SURFACE-AT ?auto_4897 ?auto_4920 ) ( ON ?auto_4897 ?auto_4915 ) ( CLEAR ?auto_4897 ) ( not ( = ?auto_4896 ?auto_4897 ) ) ( not ( = ?auto_4896 ?auto_4915 ) ) ( not ( = ?auto_4897 ?auto_4915 ) ) ( not ( = ?auto_4908 ?auto_4923 ) ) ( SURFACE-AT ?auto_4895 ?auto_4906 ) ( CLEAR ?auto_4895 ) ( IS-CRATE ?auto_4896 ) ( AVAILABLE ?auto_4908 ) ( not ( = ?auto_4916 ?auto_4906 ) ) ( HOIST-AT ?auto_4917 ?auto_4916 ) ( AVAILABLE ?auto_4917 ) ( SURFACE-AT ?auto_4896 ?auto_4916 ) ( ON ?auto_4896 ?auto_4921 ) ( CLEAR ?auto_4896 ) ( TRUCK-AT ?auto_4903 ?auto_4906 ) ( not ( = ?auto_4895 ?auto_4896 ) ) ( not ( = ?auto_4895 ?auto_4921 ) ) ( not ( = ?auto_4896 ?auto_4921 ) ) ( not ( = ?auto_4908 ?auto_4917 ) ) ( not ( = ?auto_4895 ?auto_4897 ) ) ( not ( = ?auto_4895 ?auto_4915 ) ) ( not ( = ?auto_4897 ?auto_4921 ) ) ( not ( = ?auto_4920 ?auto_4916 ) ) ( not ( = ?auto_4923 ?auto_4917 ) ) ( not ( = ?auto_4915 ?auto_4921 ) ) ( not ( = ?auto_4895 ?auto_4898 ) ) ( not ( = ?auto_4895 ?auto_4910 ) ) ( not ( = ?auto_4896 ?auto_4898 ) ) ( not ( = ?auto_4896 ?auto_4910 ) ) ( not ( = ?auto_4898 ?auto_4915 ) ) ( not ( = ?auto_4898 ?auto_4921 ) ) ( not ( = ?auto_4924 ?auto_4920 ) ) ( not ( = ?auto_4924 ?auto_4916 ) ) ( not ( = ?auto_4914 ?auto_4923 ) ) ( not ( = ?auto_4914 ?auto_4917 ) ) ( not ( = ?auto_4910 ?auto_4915 ) ) ( not ( = ?auto_4910 ?auto_4921 ) ) ( not ( = ?auto_4895 ?auto_4899 ) ) ( not ( = ?auto_4895 ?auto_4911 ) ) ( not ( = ?auto_4896 ?auto_4899 ) ) ( not ( = ?auto_4896 ?auto_4911 ) ) ( not ( = ?auto_4897 ?auto_4899 ) ) ( not ( = ?auto_4897 ?auto_4911 ) ) ( not ( = ?auto_4899 ?auto_4910 ) ) ( not ( = ?auto_4899 ?auto_4915 ) ) ( not ( = ?auto_4899 ?auto_4921 ) ) ( not ( = ?auto_4911 ?auto_4910 ) ) ( not ( = ?auto_4911 ?auto_4915 ) ) ( not ( = ?auto_4911 ?auto_4921 ) ) ( not ( = ?auto_4895 ?auto_4901 ) ) ( not ( = ?auto_4895 ?auto_4909 ) ) ( not ( = ?auto_4896 ?auto_4901 ) ) ( not ( = ?auto_4896 ?auto_4909 ) ) ( not ( = ?auto_4897 ?auto_4901 ) ) ( not ( = ?auto_4897 ?auto_4909 ) ) ( not ( = ?auto_4898 ?auto_4901 ) ) ( not ( = ?auto_4898 ?auto_4909 ) ) ( not ( = ?auto_4901 ?auto_4911 ) ) ( not ( = ?auto_4901 ?auto_4910 ) ) ( not ( = ?auto_4901 ?auto_4915 ) ) ( not ( = ?auto_4901 ?auto_4921 ) ) ( not ( = ?auto_4912 ?auto_4924 ) ) ( not ( = ?auto_4912 ?auto_4920 ) ) ( not ( = ?auto_4912 ?auto_4916 ) ) ( not ( = ?auto_4913 ?auto_4914 ) ) ( not ( = ?auto_4913 ?auto_4923 ) ) ( not ( = ?auto_4913 ?auto_4917 ) ) ( not ( = ?auto_4909 ?auto_4911 ) ) ( not ( = ?auto_4909 ?auto_4910 ) ) ( not ( = ?auto_4909 ?auto_4915 ) ) ( not ( = ?auto_4909 ?auto_4921 ) ) ( not ( = ?auto_4895 ?auto_4900 ) ) ( not ( = ?auto_4895 ?auto_4922 ) ) ( not ( = ?auto_4896 ?auto_4900 ) ) ( not ( = ?auto_4896 ?auto_4922 ) ) ( not ( = ?auto_4897 ?auto_4900 ) ) ( not ( = ?auto_4897 ?auto_4922 ) ) ( not ( = ?auto_4898 ?auto_4900 ) ) ( not ( = ?auto_4898 ?auto_4922 ) ) ( not ( = ?auto_4899 ?auto_4900 ) ) ( not ( = ?auto_4899 ?auto_4922 ) ) ( not ( = ?auto_4900 ?auto_4909 ) ) ( not ( = ?auto_4900 ?auto_4911 ) ) ( not ( = ?auto_4900 ?auto_4910 ) ) ( not ( = ?auto_4900 ?auto_4915 ) ) ( not ( = ?auto_4900 ?auto_4921 ) ) ( not ( = ?auto_4919 ?auto_4912 ) ) ( not ( = ?auto_4919 ?auto_4924 ) ) ( not ( = ?auto_4919 ?auto_4920 ) ) ( not ( = ?auto_4919 ?auto_4916 ) ) ( not ( = ?auto_4918 ?auto_4913 ) ) ( not ( = ?auto_4918 ?auto_4914 ) ) ( not ( = ?auto_4918 ?auto_4923 ) ) ( not ( = ?auto_4918 ?auto_4917 ) ) ( not ( = ?auto_4922 ?auto_4909 ) ) ( not ( = ?auto_4922 ?auto_4911 ) ) ( not ( = ?auto_4922 ?auto_4910 ) ) ( not ( = ?auto_4922 ?auto_4915 ) ) ( not ( = ?auto_4922 ?auto_4921 ) ) ( not ( = ?auto_4895 ?auto_4902 ) ) ( not ( = ?auto_4895 ?auto_4904 ) ) ( not ( = ?auto_4896 ?auto_4902 ) ) ( not ( = ?auto_4896 ?auto_4904 ) ) ( not ( = ?auto_4897 ?auto_4902 ) ) ( not ( = ?auto_4897 ?auto_4904 ) ) ( not ( = ?auto_4898 ?auto_4902 ) ) ( not ( = ?auto_4898 ?auto_4904 ) ) ( not ( = ?auto_4899 ?auto_4902 ) ) ( not ( = ?auto_4899 ?auto_4904 ) ) ( not ( = ?auto_4901 ?auto_4902 ) ) ( not ( = ?auto_4901 ?auto_4904 ) ) ( not ( = ?auto_4902 ?auto_4922 ) ) ( not ( = ?auto_4902 ?auto_4909 ) ) ( not ( = ?auto_4902 ?auto_4911 ) ) ( not ( = ?auto_4902 ?auto_4910 ) ) ( not ( = ?auto_4902 ?auto_4915 ) ) ( not ( = ?auto_4902 ?auto_4921 ) ) ( not ( = ?auto_4907 ?auto_4919 ) ) ( not ( = ?auto_4907 ?auto_4912 ) ) ( not ( = ?auto_4907 ?auto_4924 ) ) ( not ( = ?auto_4907 ?auto_4920 ) ) ( not ( = ?auto_4907 ?auto_4916 ) ) ( not ( = ?auto_4905 ?auto_4918 ) ) ( not ( = ?auto_4905 ?auto_4913 ) ) ( not ( = ?auto_4905 ?auto_4914 ) ) ( not ( = ?auto_4905 ?auto_4923 ) ) ( not ( = ?auto_4905 ?auto_4917 ) ) ( not ( = ?auto_4904 ?auto_4922 ) ) ( not ( = ?auto_4904 ?auto_4909 ) ) ( not ( = ?auto_4904 ?auto_4911 ) ) ( not ( = ?auto_4904 ?auto_4910 ) ) ( not ( = ?auto_4904 ?auto_4915 ) ) ( not ( = ?auto_4904 ?auto_4921 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4895 ?auto_4896 ?auto_4897 ?auto_4898 ?auto_4899 ?auto_4901 ?auto_4900 )
      ( MAKE-1CRATE ?auto_4900 ?auto_4902 )
      ( MAKE-7CRATE-VERIFY ?auto_4895 ?auto_4896 ?auto_4897 ?auto_4898 ?auto_4899 ?auto_4901 ?auto_4900 ?auto_4902 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4927 - SURFACE
      ?auto_4928 - SURFACE
    )
    :vars
    (
      ?auto_4929 - HOIST
      ?auto_4930 - PLACE
      ?auto_4932 - PLACE
      ?auto_4933 - HOIST
      ?auto_4934 - SURFACE
      ?auto_4931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4929 ?auto_4930 ) ( SURFACE-AT ?auto_4927 ?auto_4930 ) ( CLEAR ?auto_4927 ) ( IS-CRATE ?auto_4928 ) ( AVAILABLE ?auto_4929 ) ( not ( = ?auto_4932 ?auto_4930 ) ) ( HOIST-AT ?auto_4933 ?auto_4932 ) ( AVAILABLE ?auto_4933 ) ( SURFACE-AT ?auto_4928 ?auto_4932 ) ( ON ?auto_4928 ?auto_4934 ) ( CLEAR ?auto_4928 ) ( TRUCK-AT ?auto_4931 ?auto_4930 ) ( not ( = ?auto_4927 ?auto_4928 ) ) ( not ( = ?auto_4927 ?auto_4934 ) ) ( not ( = ?auto_4928 ?auto_4934 ) ) ( not ( = ?auto_4929 ?auto_4933 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4931 ?auto_4930 ?auto_4932 )
      ( !LIFT ?auto_4933 ?auto_4928 ?auto_4934 ?auto_4932 )
      ( !LOAD ?auto_4933 ?auto_4928 ?auto_4931 ?auto_4932 )
      ( !DRIVE ?auto_4931 ?auto_4932 ?auto_4930 )
      ( !UNLOAD ?auto_4929 ?auto_4928 ?auto_4931 ?auto_4930 )
      ( !DROP ?auto_4929 ?auto_4928 ?auto_4927 ?auto_4930 )
      ( MAKE-1CRATE-VERIFY ?auto_4927 ?auto_4928 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4944 - SURFACE
      ?auto_4945 - SURFACE
      ?auto_4946 - SURFACE
      ?auto_4947 - SURFACE
      ?auto_4948 - SURFACE
      ?auto_4950 - SURFACE
      ?auto_4949 - SURFACE
      ?auto_4952 - SURFACE
      ?auto_4951 - SURFACE
    )
    :vars
    (
      ?auto_4953 - HOIST
      ?auto_4955 - PLACE
      ?auto_4957 - PLACE
      ?auto_4958 - HOIST
      ?auto_4956 - SURFACE
      ?auto_4971 - SURFACE
      ?auto_4960 - PLACE
      ?auto_4963 - HOIST
      ?auto_4966 - SURFACE
      ?auto_4972 - PLACE
      ?auto_4970 - HOIST
      ?auto_4962 - SURFACE
      ?auto_4961 - PLACE
      ?auto_4969 - HOIST
      ?auto_4974 - SURFACE
      ?auto_4973 - SURFACE
      ?auto_4964 - PLACE
      ?auto_4975 - HOIST
      ?auto_4968 - SURFACE
      ?auto_4967 - PLACE
      ?auto_4959 - HOIST
      ?auto_4965 - SURFACE
      ?auto_4954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4953 ?auto_4955 ) ( IS-CRATE ?auto_4951 ) ( not ( = ?auto_4957 ?auto_4955 ) ) ( HOIST-AT ?auto_4958 ?auto_4957 ) ( SURFACE-AT ?auto_4951 ?auto_4957 ) ( ON ?auto_4951 ?auto_4956 ) ( CLEAR ?auto_4951 ) ( not ( = ?auto_4952 ?auto_4951 ) ) ( not ( = ?auto_4952 ?auto_4956 ) ) ( not ( = ?auto_4951 ?auto_4956 ) ) ( not ( = ?auto_4953 ?auto_4958 ) ) ( IS-CRATE ?auto_4952 ) ( AVAILABLE ?auto_4958 ) ( SURFACE-AT ?auto_4952 ?auto_4957 ) ( ON ?auto_4952 ?auto_4971 ) ( CLEAR ?auto_4952 ) ( not ( = ?auto_4949 ?auto_4952 ) ) ( not ( = ?auto_4949 ?auto_4971 ) ) ( not ( = ?auto_4952 ?auto_4971 ) ) ( IS-CRATE ?auto_4949 ) ( not ( = ?auto_4960 ?auto_4955 ) ) ( HOIST-AT ?auto_4963 ?auto_4960 ) ( AVAILABLE ?auto_4963 ) ( SURFACE-AT ?auto_4949 ?auto_4960 ) ( ON ?auto_4949 ?auto_4966 ) ( CLEAR ?auto_4949 ) ( not ( = ?auto_4950 ?auto_4949 ) ) ( not ( = ?auto_4950 ?auto_4966 ) ) ( not ( = ?auto_4949 ?auto_4966 ) ) ( not ( = ?auto_4953 ?auto_4963 ) ) ( IS-CRATE ?auto_4950 ) ( not ( = ?auto_4972 ?auto_4955 ) ) ( HOIST-AT ?auto_4970 ?auto_4972 ) ( AVAILABLE ?auto_4970 ) ( SURFACE-AT ?auto_4950 ?auto_4972 ) ( ON ?auto_4950 ?auto_4962 ) ( CLEAR ?auto_4950 ) ( not ( = ?auto_4948 ?auto_4950 ) ) ( not ( = ?auto_4948 ?auto_4962 ) ) ( not ( = ?auto_4950 ?auto_4962 ) ) ( not ( = ?auto_4953 ?auto_4970 ) ) ( IS-CRATE ?auto_4948 ) ( not ( = ?auto_4961 ?auto_4955 ) ) ( HOIST-AT ?auto_4969 ?auto_4961 ) ( SURFACE-AT ?auto_4948 ?auto_4961 ) ( ON ?auto_4948 ?auto_4974 ) ( CLEAR ?auto_4948 ) ( not ( = ?auto_4947 ?auto_4948 ) ) ( not ( = ?auto_4947 ?auto_4974 ) ) ( not ( = ?auto_4948 ?auto_4974 ) ) ( not ( = ?auto_4953 ?auto_4969 ) ) ( IS-CRATE ?auto_4947 ) ( AVAILABLE ?auto_4969 ) ( SURFACE-AT ?auto_4947 ?auto_4961 ) ( ON ?auto_4947 ?auto_4973 ) ( CLEAR ?auto_4947 ) ( not ( = ?auto_4946 ?auto_4947 ) ) ( not ( = ?auto_4946 ?auto_4973 ) ) ( not ( = ?auto_4947 ?auto_4973 ) ) ( IS-CRATE ?auto_4946 ) ( not ( = ?auto_4964 ?auto_4955 ) ) ( HOIST-AT ?auto_4975 ?auto_4964 ) ( AVAILABLE ?auto_4975 ) ( SURFACE-AT ?auto_4946 ?auto_4964 ) ( ON ?auto_4946 ?auto_4968 ) ( CLEAR ?auto_4946 ) ( not ( = ?auto_4945 ?auto_4946 ) ) ( not ( = ?auto_4945 ?auto_4968 ) ) ( not ( = ?auto_4946 ?auto_4968 ) ) ( not ( = ?auto_4953 ?auto_4975 ) ) ( SURFACE-AT ?auto_4944 ?auto_4955 ) ( CLEAR ?auto_4944 ) ( IS-CRATE ?auto_4945 ) ( AVAILABLE ?auto_4953 ) ( not ( = ?auto_4967 ?auto_4955 ) ) ( HOIST-AT ?auto_4959 ?auto_4967 ) ( AVAILABLE ?auto_4959 ) ( SURFACE-AT ?auto_4945 ?auto_4967 ) ( ON ?auto_4945 ?auto_4965 ) ( CLEAR ?auto_4945 ) ( TRUCK-AT ?auto_4954 ?auto_4955 ) ( not ( = ?auto_4944 ?auto_4945 ) ) ( not ( = ?auto_4944 ?auto_4965 ) ) ( not ( = ?auto_4945 ?auto_4965 ) ) ( not ( = ?auto_4953 ?auto_4959 ) ) ( not ( = ?auto_4944 ?auto_4946 ) ) ( not ( = ?auto_4944 ?auto_4968 ) ) ( not ( = ?auto_4946 ?auto_4965 ) ) ( not ( = ?auto_4964 ?auto_4967 ) ) ( not ( = ?auto_4975 ?auto_4959 ) ) ( not ( = ?auto_4968 ?auto_4965 ) ) ( not ( = ?auto_4944 ?auto_4947 ) ) ( not ( = ?auto_4944 ?auto_4973 ) ) ( not ( = ?auto_4945 ?auto_4947 ) ) ( not ( = ?auto_4945 ?auto_4973 ) ) ( not ( = ?auto_4947 ?auto_4968 ) ) ( not ( = ?auto_4947 ?auto_4965 ) ) ( not ( = ?auto_4961 ?auto_4964 ) ) ( not ( = ?auto_4961 ?auto_4967 ) ) ( not ( = ?auto_4969 ?auto_4975 ) ) ( not ( = ?auto_4969 ?auto_4959 ) ) ( not ( = ?auto_4973 ?auto_4968 ) ) ( not ( = ?auto_4973 ?auto_4965 ) ) ( not ( = ?auto_4944 ?auto_4948 ) ) ( not ( = ?auto_4944 ?auto_4974 ) ) ( not ( = ?auto_4945 ?auto_4948 ) ) ( not ( = ?auto_4945 ?auto_4974 ) ) ( not ( = ?auto_4946 ?auto_4948 ) ) ( not ( = ?auto_4946 ?auto_4974 ) ) ( not ( = ?auto_4948 ?auto_4973 ) ) ( not ( = ?auto_4948 ?auto_4968 ) ) ( not ( = ?auto_4948 ?auto_4965 ) ) ( not ( = ?auto_4974 ?auto_4973 ) ) ( not ( = ?auto_4974 ?auto_4968 ) ) ( not ( = ?auto_4974 ?auto_4965 ) ) ( not ( = ?auto_4944 ?auto_4950 ) ) ( not ( = ?auto_4944 ?auto_4962 ) ) ( not ( = ?auto_4945 ?auto_4950 ) ) ( not ( = ?auto_4945 ?auto_4962 ) ) ( not ( = ?auto_4946 ?auto_4950 ) ) ( not ( = ?auto_4946 ?auto_4962 ) ) ( not ( = ?auto_4947 ?auto_4950 ) ) ( not ( = ?auto_4947 ?auto_4962 ) ) ( not ( = ?auto_4950 ?auto_4974 ) ) ( not ( = ?auto_4950 ?auto_4973 ) ) ( not ( = ?auto_4950 ?auto_4968 ) ) ( not ( = ?auto_4950 ?auto_4965 ) ) ( not ( = ?auto_4972 ?auto_4961 ) ) ( not ( = ?auto_4972 ?auto_4964 ) ) ( not ( = ?auto_4972 ?auto_4967 ) ) ( not ( = ?auto_4970 ?auto_4969 ) ) ( not ( = ?auto_4970 ?auto_4975 ) ) ( not ( = ?auto_4970 ?auto_4959 ) ) ( not ( = ?auto_4962 ?auto_4974 ) ) ( not ( = ?auto_4962 ?auto_4973 ) ) ( not ( = ?auto_4962 ?auto_4968 ) ) ( not ( = ?auto_4962 ?auto_4965 ) ) ( not ( = ?auto_4944 ?auto_4949 ) ) ( not ( = ?auto_4944 ?auto_4966 ) ) ( not ( = ?auto_4945 ?auto_4949 ) ) ( not ( = ?auto_4945 ?auto_4966 ) ) ( not ( = ?auto_4946 ?auto_4949 ) ) ( not ( = ?auto_4946 ?auto_4966 ) ) ( not ( = ?auto_4947 ?auto_4949 ) ) ( not ( = ?auto_4947 ?auto_4966 ) ) ( not ( = ?auto_4948 ?auto_4949 ) ) ( not ( = ?auto_4948 ?auto_4966 ) ) ( not ( = ?auto_4949 ?auto_4962 ) ) ( not ( = ?auto_4949 ?auto_4974 ) ) ( not ( = ?auto_4949 ?auto_4973 ) ) ( not ( = ?auto_4949 ?auto_4968 ) ) ( not ( = ?auto_4949 ?auto_4965 ) ) ( not ( = ?auto_4960 ?auto_4972 ) ) ( not ( = ?auto_4960 ?auto_4961 ) ) ( not ( = ?auto_4960 ?auto_4964 ) ) ( not ( = ?auto_4960 ?auto_4967 ) ) ( not ( = ?auto_4963 ?auto_4970 ) ) ( not ( = ?auto_4963 ?auto_4969 ) ) ( not ( = ?auto_4963 ?auto_4975 ) ) ( not ( = ?auto_4963 ?auto_4959 ) ) ( not ( = ?auto_4966 ?auto_4962 ) ) ( not ( = ?auto_4966 ?auto_4974 ) ) ( not ( = ?auto_4966 ?auto_4973 ) ) ( not ( = ?auto_4966 ?auto_4968 ) ) ( not ( = ?auto_4966 ?auto_4965 ) ) ( not ( = ?auto_4944 ?auto_4952 ) ) ( not ( = ?auto_4944 ?auto_4971 ) ) ( not ( = ?auto_4945 ?auto_4952 ) ) ( not ( = ?auto_4945 ?auto_4971 ) ) ( not ( = ?auto_4946 ?auto_4952 ) ) ( not ( = ?auto_4946 ?auto_4971 ) ) ( not ( = ?auto_4947 ?auto_4952 ) ) ( not ( = ?auto_4947 ?auto_4971 ) ) ( not ( = ?auto_4948 ?auto_4952 ) ) ( not ( = ?auto_4948 ?auto_4971 ) ) ( not ( = ?auto_4950 ?auto_4952 ) ) ( not ( = ?auto_4950 ?auto_4971 ) ) ( not ( = ?auto_4952 ?auto_4966 ) ) ( not ( = ?auto_4952 ?auto_4962 ) ) ( not ( = ?auto_4952 ?auto_4974 ) ) ( not ( = ?auto_4952 ?auto_4973 ) ) ( not ( = ?auto_4952 ?auto_4968 ) ) ( not ( = ?auto_4952 ?auto_4965 ) ) ( not ( = ?auto_4957 ?auto_4960 ) ) ( not ( = ?auto_4957 ?auto_4972 ) ) ( not ( = ?auto_4957 ?auto_4961 ) ) ( not ( = ?auto_4957 ?auto_4964 ) ) ( not ( = ?auto_4957 ?auto_4967 ) ) ( not ( = ?auto_4958 ?auto_4963 ) ) ( not ( = ?auto_4958 ?auto_4970 ) ) ( not ( = ?auto_4958 ?auto_4969 ) ) ( not ( = ?auto_4958 ?auto_4975 ) ) ( not ( = ?auto_4958 ?auto_4959 ) ) ( not ( = ?auto_4971 ?auto_4966 ) ) ( not ( = ?auto_4971 ?auto_4962 ) ) ( not ( = ?auto_4971 ?auto_4974 ) ) ( not ( = ?auto_4971 ?auto_4973 ) ) ( not ( = ?auto_4971 ?auto_4968 ) ) ( not ( = ?auto_4971 ?auto_4965 ) ) ( not ( = ?auto_4944 ?auto_4951 ) ) ( not ( = ?auto_4944 ?auto_4956 ) ) ( not ( = ?auto_4945 ?auto_4951 ) ) ( not ( = ?auto_4945 ?auto_4956 ) ) ( not ( = ?auto_4946 ?auto_4951 ) ) ( not ( = ?auto_4946 ?auto_4956 ) ) ( not ( = ?auto_4947 ?auto_4951 ) ) ( not ( = ?auto_4947 ?auto_4956 ) ) ( not ( = ?auto_4948 ?auto_4951 ) ) ( not ( = ?auto_4948 ?auto_4956 ) ) ( not ( = ?auto_4950 ?auto_4951 ) ) ( not ( = ?auto_4950 ?auto_4956 ) ) ( not ( = ?auto_4949 ?auto_4951 ) ) ( not ( = ?auto_4949 ?auto_4956 ) ) ( not ( = ?auto_4951 ?auto_4971 ) ) ( not ( = ?auto_4951 ?auto_4966 ) ) ( not ( = ?auto_4951 ?auto_4962 ) ) ( not ( = ?auto_4951 ?auto_4974 ) ) ( not ( = ?auto_4951 ?auto_4973 ) ) ( not ( = ?auto_4951 ?auto_4968 ) ) ( not ( = ?auto_4951 ?auto_4965 ) ) ( not ( = ?auto_4956 ?auto_4971 ) ) ( not ( = ?auto_4956 ?auto_4966 ) ) ( not ( = ?auto_4956 ?auto_4962 ) ) ( not ( = ?auto_4956 ?auto_4974 ) ) ( not ( = ?auto_4956 ?auto_4973 ) ) ( not ( = ?auto_4956 ?auto_4968 ) ) ( not ( = ?auto_4956 ?auto_4965 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4944 ?auto_4945 ?auto_4946 ?auto_4947 ?auto_4948 ?auto_4950 ?auto_4949 ?auto_4952 )
      ( MAKE-1CRATE ?auto_4952 ?auto_4951 )
      ( MAKE-8CRATE-VERIFY ?auto_4944 ?auto_4945 ?auto_4946 ?auto_4947 ?auto_4948 ?auto_4950 ?auto_4949 ?auto_4952 ?auto_4951 ) )
  )

)

