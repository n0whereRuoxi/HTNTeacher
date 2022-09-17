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
      ?auto_4659 - SURFACE
      ?auto_4660 - SURFACE
    )
    :vars
    (
      ?auto_4661 - HOIST
      ?auto_4662 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4661 ?auto_4662 ) ( SURFACE-AT ?auto_4660 ?auto_4662 ) ( CLEAR ?auto_4660 ) ( LIFTING ?auto_4661 ?auto_4659 ) ( IS-CRATE ?auto_4659 ) ( not ( = ?auto_4659 ?auto_4660 ) ) )
    :subtasks
    ( ( !DROP ?auto_4661 ?auto_4659 ?auto_4660 ?auto_4662 )
      ( MAKE-ON-VERIFY ?auto_4659 ?auto_4660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4663 - SURFACE
      ?auto_4664 - SURFACE
    )
    :vars
    (
      ?auto_4665 - HOIST
      ?auto_4666 - PLACE
      ?auto_4667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4665 ?auto_4666 ) ( SURFACE-AT ?auto_4664 ?auto_4666 ) ( CLEAR ?auto_4664 ) ( IS-CRATE ?auto_4663 ) ( not ( = ?auto_4663 ?auto_4664 ) ) ( TRUCK-AT ?auto_4667 ?auto_4666 ) ( AVAILABLE ?auto_4665 ) ( IN ?auto_4663 ?auto_4667 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4665 ?auto_4663 ?auto_4667 ?auto_4666 )
      ( MAKE-ON ?auto_4663 ?auto_4664 )
      ( MAKE-ON-VERIFY ?auto_4663 ?auto_4664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4668 - SURFACE
      ?auto_4669 - SURFACE
    )
    :vars
    (
      ?auto_4672 - HOIST
      ?auto_4671 - PLACE
      ?auto_4670 - TRUCK
      ?auto_4673 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4672 ?auto_4671 ) ( SURFACE-AT ?auto_4669 ?auto_4671 ) ( CLEAR ?auto_4669 ) ( IS-CRATE ?auto_4668 ) ( not ( = ?auto_4668 ?auto_4669 ) ) ( AVAILABLE ?auto_4672 ) ( IN ?auto_4668 ?auto_4670 ) ( TRUCK-AT ?auto_4670 ?auto_4673 ) ( not ( = ?auto_4673 ?auto_4671 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4670 ?auto_4673 ?auto_4671 )
      ( MAKE-ON ?auto_4668 ?auto_4669 )
      ( MAKE-ON-VERIFY ?auto_4668 ?auto_4669 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4674 - SURFACE
      ?auto_4675 - SURFACE
    )
    :vars
    (
      ?auto_4677 - HOIST
      ?auto_4679 - PLACE
      ?auto_4678 - TRUCK
      ?auto_4676 - PLACE
      ?auto_4680 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4677 ?auto_4679 ) ( SURFACE-AT ?auto_4675 ?auto_4679 ) ( CLEAR ?auto_4675 ) ( IS-CRATE ?auto_4674 ) ( not ( = ?auto_4674 ?auto_4675 ) ) ( AVAILABLE ?auto_4677 ) ( TRUCK-AT ?auto_4678 ?auto_4676 ) ( not ( = ?auto_4676 ?auto_4679 ) ) ( HOIST-AT ?auto_4680 ?auto_4676 ) ( LIFTING ?auto_4680 ?auto_4674 ) ( not ( = ?auto_4677 ?auto_4680 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4680 ?auto_4674 ?auto_4678 ?auto_4676 )
      ( MAKE-ON ?auto_4674 ?auto_4675 )
      ( MAKE-ON-VERIFY ?auto_4674 ?auto_4675 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4681 - SURFACE
      ?auto_4682 - SURFACE
    )
    :vars
    (
      ?auto_4686 - HOIST
      ?auto_4683 - PLACE
      ?auto_4684 - TRUCK
      ?auto_4685 - PLACE
      ?auto_4687 - HOIST
      ?auto_4688 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4686 ?auto_4683 ) ( SURFACE-AT ?auto_4682 ?auto_4683 ) ( CLEAR ?auto_4682 ) ( IS-CRATE ?auto_4681 ) ( not ( = ?auto_4681 ?auto_4682 ) ) ( AVAILABLE ?auto_4686 ) ( TRUCK-AT ?auto_4684 ?auto_4685 ) ( not ( = ?auto_4685 ?auto_4683 ) ) ( HOIST-AT ?auto_4687 ?auto_4685 ) ( not ( = ?auto_4686 ?auto_4687 ) ) ( AVAILABLE ?auto_4687 ) ( SURFACE-AT ?auto_4681 ?auto_4685 ) ( ON ?auto_4681 ?auto_4688 ) ( CLEAR ?auto_4681 ) ( not ( = ?auto_4681 ?auto_4688 ) ) ( not ( = ?auto_4682 ?auto_4688 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4687 ?auto_4681 ?auto_4688 ?auto_4685 )
      ( MAKE-ON ?auto_4681 ?auto_4682 )
      ( MAKE-ON-VERIFY ?auto_4681 ?auto_4682 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4689 - SURFACE
      ?auto_4690 - SURFACE
    )
    :vars
    (
      ?auto_4696 - HOIST
      ?auto_4695 - PLACE
      ?auto_4694 - PLACE
      ?auto_4693 - HOIST
      ?auto_4692 - SURFACE
      ?auto_4691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4696 ?auto_4695 ) ( SURFACE-AT ?auto_4690 ?auto_4695 ) ( CLEAR ?auto_4690 ) ( IS-CRATE ?auto_4689 ) ( not ( = ?auto_4689 ?auto_4690 ) ) ( AVAILABLE ?auto_4696 ) ( not ( = ?auto_4694 ?auto_4695 ) ) ( HOIST-AT ?auto_4693 ?auto_4694 ) ( not ( = ?auto_4696 ?auto_4693 ) ) ( AVAILABLE ?auto_4693 ) ( SURFACE-AT ?auto_4689 ?auto_4694 ) ( ON ?auto_4689 ?auto_4692 ) ( CLEAR ?auto_4689 ) ( not ( = ?auto_4689 ?auto_4692 ) ) ( not ( = ?auto_4690 ?auto_4692 ) ) ( TRUCK-AT ?auto_4691 ?auto_4695 ) )
    :subtasks
    ( ( !DRIVE ?auto_4691 ?auto_4695 ?auto_4694 )
      ( MAKE-ON ?auto_4689 ?auto_4690 )
      ( MAKE-ON-VERIFY ?auto_4689 ?auto_4690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4737 - SURFACE
      ?auto_4738 - SURFACE
    )
    :vars
    (
      ?auto_4742 - HOIST
      ?auto_4743 - PLACE
      ?auto_4739 - PLACE
      ?auto_4744 - HOIST
      ?auto_4740 - SURFACE
      ?auto_4741 - TRUCK
      ?auto_4745 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4742 ?auto_4743 ) ( IS-CRATE ?auto_4737 ) ( not ( = ?auto_4737 ?auto_4738 ) ) ( not ( = ?auto_4739 ?auto_4743 ) ) ( HOIST-AT ?auto_4744 ?auto_4739 ) ( not ( = ?auto_4742 ?auto_4744 ) ) ( AVAILABLE ?auto_4744 ) ( SURFACE-AT ?auto_4737 ?auto_4739 ) ( ON ?auto_4737 ?auto_4740 ) ( CLEAR ?auto_4737 ) ( not ( = ?auto_4737 ?auto_4740 ) ) ( not ( = ?auto_4738 ?auto_4740 ) ) ( TRUCK-AT ?auto_4741 ?auto_4743 ) ( SURFACE-AT ?auto_4745 ?auto_4743 ) ( CLEAR ?auto_4745 ) ( LIFTING ?auto_4742 ?auto_4738 ) ( IS-CRATE ?auto_4738 ) ( not ( = ?auto_4737 ?auto_4745 ) ) ( not ( = ?auto_4738 ?auto_4745 ) ) ( not ( = ?auto_4740 ?auto_4745 ) ) )
    :subtasks
    ( ( !DROP ?auto_4742 ?auto_4738 ?auto_4745 ?auto_4743 )
      ( MAKE-ON ?auto_4737 ?auto_4738 )
      ( MAKE-ON-VERIFY ?auto_4737 ?auto_4738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4746 - SURFACE
      ?auto_4747 - SURFACE
    )
    :vars
    (
      ?auto_4751 - HOIST
      ?auto_4749 - PLACE
      ?auto_4752 - PLACE
      ?auto_4753 - HOIST
      ?auto_4750 - SURFACE
      ?auto_4748 - TRUCK
      ?auto_4754 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4751 ?auto_4749 ) ( IS-CRATE ?auto_4746 ) ( not ( = ?auto_4746 ?auto_4747 ) ) ( not ( = ?auto_4752 ?auto_4749 ) ) ( HOIST-AT ?auto_4753 ?auto_4752 ) ( not ( = ?auto_4751 ?auto_4753 ) ) ( AVAILABLE ?auto_4753 ) ( SURFACE-AT ?auto_4746 ?auto_4752 ) ( ON ?auto_4746 ?auto_4750 ) ( CLEAR ?auto_4746 ) ( not ( = ?auto_4746 ?auto_4750 ) ) ( not ( = ?auto_4747 ?auto_4750 ) ) ( TRUCK-AT ?auto_4748 ?auto_4749 ) ( SURFACE-AT ?auto_4754 ?auto_4749 ) ( CLEAR ?auto_4754 ) ( IS-CRATE ?auto_4747 ) ( not ( = ?auto_4746 ?auto_4754 ) ) ( not ( = ?auto_4747 ?auto_4754 ) ) ( not ( = ?auto_4750 ?auto_4754 ) ) ( AVAILABLE ?auto_4751 ) ( IN ?auto_4747 ?auto_4748 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4751 ?auto_4747 ?auto_4748 ?auto_4749 )
      ( MAKE-ON ?auto_4746 ?auto_4747 )
      ( MAKE-ON-VERIFY ?auto_4746 ?auto_4747 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4761 - SURFACE
      ?auto_4762 - SURFACE
    )
    :vars
    (
      ?auto_4766 - HOIST
      ?auto_4767 - PLACE
      ?auto_4765 - PLACE
      ?auto_4768 - HOIST
      ?auto_4764 - SURFACE
      ?auto_4763 - TRUCK
      ?auto_4769 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4766 ?auto_4767 ) ( SURFACE-AT ?auto_4762 ?auto_4767 ) ( CLEAR ?auto_4762 ) ( IS-CRATE ?auto_4761 ) ( not ( = ?auto_4761 ?auto_4762 ) ) ( AVAILABLE ?auto_4766 ) ( not ( = ?auto_4765 ?auto_4767 ) ) ( HOIST-AT ?auto_4768 ?auto_4765 ) ( not ( = ?auto_4766 ?auto_4768 ) ) ( AVAILABLE ?auto_4768 ) ( SURFACE-AT ?auto_4761 ?auto_4765 ) ( ON ?auto_4761 ?auto_4764 ) ( CLEAR ?auto_4761 ) ( not ( = ?auto_4761 ?auto_4764 ) ) ( not ( = ?auto_4762 ?auto_4764 ) ) ( TRUCK-AT ?auto_4763 ?auto_4769 ) ( not ( = ?auto_4769 ?auto_4767 ) ) ( not ( = ?auto_4765 ?auto_4769 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4763 ?auto_4769 ?auto_4767 )
      ( MAKE-ON ?auto_4761 ?auto_4762 )
      ( MAKE-ON-VERIFY ?auto_4761 ?auto_4762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4946 - SURFACE
      ?auto_4947 - SURFACE
    )
    :vars
    (
      ?auto_4949 - HOIST
      ?auto_4948 - PLACE
      ?auto_4952 - TRUCK
      ?auto_4953 - PLACE
      ?auto_4950 - HOIST
      ?auto_4951 - SURFACE
      ?auto_4954 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4949 ?auto_4948 ) ( SURFACE-AT ?auto_4947 ?auto_4948 ) ( CLEAR ?auto_4947 ) ( IS-CRATE ?auto_4946 ) ( not ( = ?auto_4946 ?auto_4947 ) ) ( AVAILABLE ?auto_4949 ) ( TRUCK-AT ?auto_4952 ?auto_4953 ) ( not ( = ?auto_4953 ?auto_4948 ) ) ( HOIST-AT ?auto_4950 ?auto_4953 ) ( not ( = ?auto_4949 ?auto_4950 ) ) ( SURFACE-AT ?auto_4946 ?auto_4953 ) ( ON ?auto_4946 ?auto_4951 ) ( CLEAR ?auto_4946 ) ( not ( = ?auto_4946 ?auto_4951 ) ) ( not ( = ?auto_4947 ?auto_4951 ) ) ( LIFTING ?auto_4950 ?auto_4954 ) ( IS-CRATE ?auto_4954 ) ( not ( = ?auto_4946 ?auto_4954 ) ) ( not ( = ?auto_4947 ?auto_4954 ) ) ( not ( = ?auto_4951 ?auto_4954 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4950 ?auto_4954 ?auto_4952 ?auto_4953 )
      ( MAKE-ON ?auto_4946 ?auto_4947 )
      ( MAKE-ON-VERIFY ?auto_4946 ?auto_4947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5069 - SURFACE
      ?auto_5070 - SURFACE
    )
    :vars
    (
      ?auto_5076 - HOIST
      ?auto_5073 - PLACE
      ?auto_5071 - PLACE
      ?auto_5072 - HOIST
      ?auto_5074 - SURFACE
      ?auto_5075 - TRUCK
      ?auto_5077 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5076 ?auto_5073 ) ( SURFACE-AT ?auto_5070 ?auto_5073 ) ( CLEAR ?auto_5070 ) ( IS-CRATE ?auto_5069 ) ( not ( = ?auto_5069 ?auto_5070 ) ) ( not ( = ?auto_5071 ?auto_5073 ) ) ( HOIST-AT ?auto_5072 ?auto_5071 ) ( not ( = ?auto_5076 ?auto_5072 ) ) ( AVAILABLE ?auto_5072 ) ( SURFACE-AT ?auto_5069 ?auto_5071 ) ( ON ?auto_5069 ?auto_5074 ) ( CLEAR ?auto_5069 ) ( not ( = ?auto_5069 ?auto_5074 ) ) ( not ( = ?auto_5070 ?auto_5074 ) ) ( TRUCK-AT ?auto_5075 ?auto_5073 ) ( LIFTING ?auto_5076 ?auto_5077 ) ( IS-CRATE ?auto_5077 ) ( not ( = ?auto_5069 ?auto_5077 ) ) ( not ( = ?auto_5070 ?auto_5077 ) ) ( not ( = ?auto_5074 ?auto_5077 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5076 ?auto_5077 ?auto_5075 ?auto_5073 )
      ( MAKE-ON ?auto_5069 ?auto_5070 )
      ( MAKE-ON-VERIFY ?auto_5069 ?auto_5070 ) )
  )

)

