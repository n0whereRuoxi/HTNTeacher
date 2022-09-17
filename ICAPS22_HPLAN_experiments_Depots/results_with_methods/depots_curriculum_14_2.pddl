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
      ?auto_4782 - SURFACE
      ?auto_4783 - SURFACE
    )
    :vars
    (
      ?auto_4784 - HOIST
      ?auto_4785 - PLACE
      ?auto_4787 - PLACE
      ?auto_4788 - HOIST
      ?auto_4789 - SURFACE
      ?auto_4786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4784 ?auto_4785 ) ( SURFACE-AT ?auto_4783 ?auto_4785 ) ( CLEAR ?auto_4783 ) ( IS-CRATE ?auto_4782 ) ( AVAILABLE ?auto_4784 ) ( not ( = ?auto_4787 ?auto_4785 ) ) ( HOIST-AT ?auto_4788 ?auto_4787 ) ( AVAILABLE ?auto_4788 ) ( SURFACE-AT ?auto_4782 ?auto_4787 ) ( ON ?auto_4782 ?auto_4789 ) ( CLEAR ?auto_4782 ) ( TRUCK-AT ?auto_4786 ?auto_4785 ) ( not ( = ?auto_4782 ?auto_4783 ) ) ( not ( = ?auto_4782 ?auto_4789 ) ) ( not ( = ?auto_4783 ?auto_4789 ) ) ( not ( = ?auto_4784 ?auto_4788 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4786 ?auto_4785 ?auto_4787 )
      ( !LIFT ?auto_4788 ?auto_4782 ?auto_4789 ?auto_4787 )
      ( !LOAD ?auto_4788 ?auto_4782 ?auto_4786 ?auto_4787 )
      ( !DRIVE ?auto_4786 ?auto_4787 ?auto_4785 )
      ( !UNLOAD ?auto_4784 ?auto_4782 ?auto_4786 ?auto_4785 )
      ( !DROP ?auto_4784 ?auto_4782 ?auto_4783 ?auto_4785 )
      ( MAKE-ON-VERIFY ?auto_4782 ?auto_4783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4792 - SURFACE
      ?auto_4793 - SURFACE
    )
    :vars
    (
      ?auto_4794 - HOIST
      ?auto_4795 - PLACE
      ?auto_4797 - PLACE
      ?auto_4798 - HOIST
      ?auto_4799 - SURFACE
      ?auto_4796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4794 ?auto_4795 ) ( SURFACE-AT ?auto_4793 ?auto_4795 ) ( CLEAR ?auto_4793 ) ( IS-CRATE ?auto_4792 ) ( AVAILABLE ?auto_4794 ) ( not ( = ?auto_4797 ?auto_4795 ) ) ( HOIST-AT ?auto_4798 ?auto_4797 ) ( AVAILABLE ?auto_4798 ) ( SURFACE-AT ?auto_4792 ?auto_4797 ) ( ON ?auto_4792 ?auto_4799 ) ( CLEAR ?auto_4792 ) ( TRUCK-AT ?auto_4796 ?auto_4795 ) ( not ( = ?auto_4792 ?auto_4793 ) ) ( not ( = ?auto_4792 ?auto_4799 ) ) ( not ( = ?auto_4793 ?auto_4799 ) ) ( not ( = ?auto_4794 ?auto_4798 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4796 ?auto_4795 ?auto_4797 )
      ( !LIFT ?auto_4798 ?auto_4792 ?auto_4799 ?auto_4797 )
      ( !LOAD ?auto_4798 ?auto_4792 ?auto_4796 ?auto_4797 )
      ( !DRIVE ?auto_4796 ?auto_4797 ?auto_4795 )
      ( !UNLOAD ?auto_4794 ?auto_4792 ?auto_4796 ?auto_4795 )
      ( !DROP ?auto_4794 ?auto_4792 ?auto_4793 ?auto_4795 )
      ( MAKE-ON-VERIFY ?auto_4792 ?auto_4793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4802 - SURFACE
      ?auto_4803 - SURFACE
    )
    :vars
    (
      ?auto_4804 - HOIST
      ?auto_4805 - PLACE
      ?auto_4807 - PLACE
      ?auto_4808 - HOIST
      ?auto_4809 - SURFACE
      ?auto_4806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4804 ?auto_4805 ) ( SURFACE-AT ?auto_4803 ?auto_4805 ) ( CLEAR ?auto_4803 ) ( IS-CRATE ?auto_4802 ) ( AVAILABLE ?auto_4804 ) ( not ( = ?auto_4807 ?auto_4805 ) ) ( HOIST-AT ?auto_4808 ?auto_4807 ) ( AVAILABLE ?auto_4808 ) ( SURFACE-AT ?auto_4802 ?auto_4807 ) ( ON ?auto_4802 ?auto_4809 ) ( CLEAR ?auto_4802 ) ( TRUCK-AT ?auto_4806 ?auto_4805 ) ( not ( = ?auto_4802 ?auto_4803 ) ) ( not ( = ?auto_4802 ?auto_4809 ) ) ( not ( = ?auto_4803 ?auto_4809 ) ) ( not ( = ?auto_4804 ?auto_4808 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4806 ?auto_4805 ?auto_4807 )
      ( !LIFT ?auto_4808 ?auto_4802 ?auto_4809 ?auto_4807 )
      ( !LOAD ?auto_4808 ?auto_4802 ?auto_4806 ?auto_4807 )
      ( !DRIVE ?auto_4806 ?auto_4807 ?auto_4805 )
      ( !UNLOAD ?auto_4804 ?auto_4802 ?auto_4806 ?auto_4805 )
      ( !DROP ?auto_4804 ?auto_4802 ?auto_4803 ?auto_4805 )
      ( MAKE-ON-VERIFY ?auto_4802 ?auto_4803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4812 - SURFACE
      ?auto_4813 - SURFACE
    )
    :vars
    (
      ?auto_4814 - HOIST
      ?auto_4815 - PLACE
      ?auto_4817 - PLACE
      ?auto_4818 - HOIST
      ?auto_4819 - SURFACE
      ?auto_4816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4814 ?auto_4815 ) ( SURFACE-AT ?auto_4813 ?auto_4815 ) ( CLEAR ?auto_4813 ) ( IS-CRATE ?auto_4812 ) ( AVAILABLE ?auto_4814 ) ( not ( = ?auto_4817 ?auto_4815 ) ) ( HOIST-AT ?auto_4818 ?auto_4817 ) ( AVAILABLE ?auto_4818 ) ( SURFACE-AT ?auto_4812 ?auto_4817 ) ( ON ?auto_4812 ?auto_4819 ) ( CLEAR ?auto_4812 ) ( TRUCK-AT ?auto_4816 ?auto_4815 ) ( not ( = ?auto_4812 ?auto_4813 ) ) ( not ( = ?auto_4812 ?auto_4819 ) ) ( not ( = ?auto_4813 ?auto_4819 ) ) ( not ( = ?auto_4814 ?auto_4818 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4816 ?auto_4815 ?auto_4817 )
      ( !LIFT ?auto_4818 ?auto_4812 ?auto_4819 ?auto_4817 )
      ( !LOAD ?auto_4818 ?auto_4812 ?auto_4816 ?auto_4817 )
      ( !DRIVE ?auto_4816 ?auto_4817 ?auto_4815 )
      ( !UNLOAD ?auto_4814 ?auto_4812 ?auto_4816 ?auto_4815 )
      ( !DROP ?auto_4814 ?auto_4812 ?auto_4813 ?auto_4815 )
      ( MAKE-ON-VERIFY ?auto_4812 ?auto_4813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4822 - SURFACE
      ?auto_4823 - SURFACE
    )
    :vars
    (
      ?auto_4824 - HOIST
      ?auto_4825 - PLACE
      ?auto_4827 - PLACE
      ?auto_4828 - HOIST
      ?auto_4829 - SURFACE
      ?auto_4826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4824 ?auto_4825 ) ( SURFACE-AT ?auto_4823 ?auto_4825 ) ( CLEAR ?auto_4823 ) ( IS-CRATE ?auto_4822 ) ( AVAILABLE ?auto_4824 ) ( not ( = ?auto_4827 ?auto_4825 ) ) ( HOIST-AT ?auto_4828 ?auto_4827 ) ( AVAILABLE ?auto_4828 ) ( SURFACE-AT ?auto_4822 ?auto_4827 ) ( ON ?auto_4822 ?auto_4829 ) ( CLEAR ?auto_4822 ) ( TRUCK-AT ?auto_4826 ?auto_4825 ) ( not ( = ?auto_4822 ?auto_4823 ) ) ( not ( = ?auto_4822 ?auto_4829 ) ) ( not ( = ?auto_4823 ?auto_4829 ) ) ( not ( = ?auto_4824 ?auto_4828 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4826 ?auto_4825 ?auto_4827 )
      ( !LIFT ?auto_4828 ?auto_4822 ?auto_4829 ?auto_4827 )
      ( !LOAD ?auto_4828 ?auto_4822 ?auto_4826 ?auto_4827 )
      ( !DRIVE ?auto_4826 ?auto_4827 ?auto_4825 )
      ( !UNLOAD ?auto_4824 ?auto_4822 ?auto_4826 ?auto_4825 )
      ( !DROP ?auto_4824 ?auto_4822 ?auto_4823 ?auto_4825 )
      ( MAKE-ON-VERIFY ?auto_4822 ?auto_4823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4832 - SURFACE
      ?auto_4833 - SURFACE
    )
    :vars
    (
      ?auto_4834 - HOIST
      ?auto_4835 - PLACE
      ?auto_4837 - PLACE
      ?auto_4838 - HOIST
      ?auto_4839 - SURFACE
      ?auto_4836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4834 ?auto_4835 ) ( SURFACE-AT ?auto_4833 ?auto_4835 ) ( CLEAR ?auto_4833 ) ( IS-CRATE ?auto_4832 ) ( AVAILABLE ?auto_4834 ) ( not ( = ?auto_4837 ?auto_4835 ) ) ( HOIST-AT ?auto_4838 ?auto_4837 ) ( AVAILABLE ?auto_4838 ) ( SURFACE-AT ?auto_4832 ?auto_4837 ) ( ON ?auto_4832 ?auto_4839 ) ( CLEAR ?auto_4832 ) ( TRUCK-AT ?auto_4836 ?auto_4835 ) ( not ( = ?auto_4832 ?auto_4833 ) ) ( not ( = ?auto_4832 ?auto_4839 ) ) ( not ( = ?auto_4833 ?auto_4839 ) ) ( not ( = ?auto_4834 ?auto_4838 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4836 ?auto_4835 ?auto_4837 )
      ( !LIFT ?auto_4838 ?auto_4832 ?auto_4839 ?auto_4837 )
      ( !LOAD ?auto_4838 ?auto_4832 ?auto_4836 ?auto_4837 )
      ( !DRIVE ?auto_4836 ?auto_4837 ?auto_4835 )
      ( !UNLOAD ?auto_4834 ?auto_4832 ?auto_4836 ?auto_4835 )
      ( !DROP ?auto_4834 ?auto_4832 ?auto_4833 ?auto_4835 )
      ( MAKE-ON-VERIFY ?auto_4832 ?auto_4833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4842 - SURFACE
      ?auto_4843 - SURFACE
    )
    :vars
    (
      ?auto_4844 - HOIST
      ?auto_4845 - PLACE
      ?auto_4847 - PLACE
      ?auto_4848 - HOIST
      ?auto_4849 - SURFACE
      ?auto_4846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4844 ?auto_4845 ) ( SURFACE-AT ?auto_4843 ?auto_4845 ) ( CLEAR ?auto_4843 ) ( IS-CRATE ?auto_4842 ) ( AVAILABLE ?auto_4844 ) ( not ( = ?auto_4847 ?auto_4845 ) ) ( HOIST-AT ?auto_4848 ?auto_4847 ) ( AVAILABLE ?auto_4848 ) ( SURFACE-AT ?auto_4842 ?auto_4847 ) ( ON ?auto_4842 ?auto_4849 ) ( CLEAR ?auto_4842 ) ( TRUCK-AT ?auto_4846 ?auto_4845 ) ( not ( = ?auto_4842 ?auto_4843 ) ) ( not ( = ?auto_4842 ?auto_4849 ) ) ( not ( = ?auto_4843 ?auto_4849 ) ) ( not ( = ?auto_4844 ?auto_4848 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4846 ?auto_4845 ?auto_4847 )
      ( !LIFT ?auto_4848 ?auto_4842 ?auto_4849 ?auto_4847 )
      ( !LOAD ?auto_4848 ?auto_4842 ?auto_4846 ?auto_4847 )
      ( !DRIVE ?auto_4846 ?auto_4847 ?auto_4845 )
      ( !UNLOAD ?auto_4844 ?auto_4842 ?auto_4846 ?auto_4845 )
      ( !DROP ?auto_4844 ?auto_4842 ?auto_4843 ?auto_4845 )
      ( MAKE-ON-VERIFY ?auto_4842 ?auto_4843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4852 - SURFACE
      ?auto_4853 - SURFACE
    )
    :vars
    (
      ?auto_4854 - HOIST
      ?auto_4855 - PLACE
      ?auto_4857 - PLACE
      ?auto_4858 - HOIST
      ?auto_4859 - SURFACE
      ?auto_4856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4854 ?auto_4855 ) ( SURFACE-AT ?auto_4853 ?auto_4855 ) ( CLEAR ?auto_4853 ) ( IS-CRATE ?auto_4852 ) ( AVAILABLE ?auto_4854 ) ( not ( = ?auto_4857 ?auto_4855 ) ) ( HOIST-AT ?auto_4858 ?auto_4857 ) ( AVAILABLE ?auto_4858 ) ( SURFACE-AT ?auto_4852 ?auto_4857 ) ( ON ?auto_4852 ?auto_4859 ) ( CLEAR ?auto_4852 ) ( TRUCK-AT ?auto_4856 ?auto_4855 ) ( not ( = ?auto_4852 ?auto_4853 ) ) ( not ( = ?auto_4852 ?auto_4859 ) ) ( not ( = ?auto_4853 ?auto_4859 ) ) ( not ( = ?auto_4854 ?auto_4858 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4856 ?auto_4855 ?auto_4857 )
      ( !LIFT ?auto_4858 ?auto_4852 ?auto_4859 ?auto_4857 )
      ( !LOAD ?auto_4858 ?auto_4852 ?auto_4856 ?auto_4857 )
      ( !DRIVE ?auto_4856 ?auto_4857 ?auto_4855 )
      ( !UNLOAD ?auto_4854 ?auto_4852 ?auto_4856 ?auto_4855 )
      ( !DROP ?auto_4854 ?auto_4852 ?auto_4853 ?auto_4855 )
      ( MAKE-ON-VERIFY ?auto_4852 ?auto_4853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4862 - SURFACE
      ?auto_4863 - SURFACE
    )
    :vars
    (
      ?auto_4864 - HOIST
      ?auto_4865 - PLACE
      ?auto_4867 - PLACE
      ?auto_4868 - HOIST
      ?auto_4869 - SURFACE
      ?auto_4866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4864 ?auto_4865 ) ( SURFACE-AT ?auto_4863 ?auto_4865 ) ( CLEAR ?auto_4863 ) ( IS-CRATE ?auto_4862 ) ( AVAILABLE ?auto_4864 ) ( not ( = ?auto_4867 ?auto_4865 ) ) ( HOIST-AT ?auto_4868 ?auto_4867 ) ( AVAILABLE ?auto_4868 ) ( SURFACE-AT ?auto_4862 ?auto_4867 ) ( ON ?auto_4862 ?auto_4869 ) ( CLEAR ?auto_4862 ) ( TRUCK-AT ?auto_4866 ?auto_4865 ) ( not ( = ?auto_4862 ?auto_4863 ) ) ( not ( = ?auto_4862 ?auto_4869 ) ) ( not ( = ?auto_4863 ?auto_4869 ) ) ( not ( = ?auto_4864 ?auto_4868 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4866 ?auto_4865 ?auto_4867 )
      ( !LIFT ?auto_4868 ?auto_4862 ?auto_4869 ?auto_4867 )
      ( !LOAD ?auto_4868 ?auto_4862 ?auto_4866 ?auto_4867 )
      ( !DRIVE ?auto_4866 ?auto_4867 ?auto_4865 )
      ( !UNLOAD ?auto_4864 ?auto_4862 ?auto_4866 ?auto_4865 )
      ( !DROP ?auto_4864 ?auto_4862 ?auto_4863 ?auto_4865 )
      ( MAKE-ON-VERIFY ?auto_4862 ?auto_4863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4872 - SURFACE
      ?auto_4873 - SURFACE
    )
    :vars
    (
      ?auto_4874 - HOIST
      ?auto_4875 - PLACE
      ?auto_4877 - PLACE
      ?auto_4878 - HOIST
      ?auto_4879 - SURFACE
      ?auto_4876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4874 ?auto_4875 ) ( SURFACE-AT ?auto_4873 ?auto_4875 ) ( CLEAR ?auto_4873 ) ( IS-CRATE ?auto_4872 ) ( AVAILABLE ?auto_4874 ) ( not ( = ?auto_4877 ?auto_4875 ) ) ( HOIST-AT ?auto_4878 ?auto_4877 ) ( AVAILABLE ?auto_4878 ) ( SURFACE-AT ?auto_4872 ?auto_4877 ) ( ON ?auto_4872 ?auto_4879 ) ( CLEAR ?auto_4872 ) ( TRUCK-AT ?auto_4876 ?auto_4875 ) ( not ( = ?auto_4872 ?auto_4873 ) ) ( not ( = ?auto_4872 ?auto_4879 ) ) ( not ( = ?auto_4873 ?auto_4879 ) ) ( not ( = ?auto_4874 ?auto_4878 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4876 ?auto_4875 ?auto_4877 )
      ( !LIFT ?auto_4878 ?auto_4872 ?auto_4879 ?auto_4877 )
      ( !LOAD ?auto_4878 ?auto_4872 ?auto_4876 ?auto_4877 )
      ( !DRIVE ?auto_4876 ?auto_4877 ?auto_4875 )
      ( !UNLOAD ?auto_4874 ?auto_4872 ?auto_4876 ?auto_4875 )
      ( !DROP ?auto_4874 ?auto_4872 ?auto_4873 ?auto_4875 )
      ( MAKE-ON-VERIFY ?auto_4872 ?auto_4873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4882 - SURFACE
      ?auto_4883 - SURFACE
    )
    :vars
    (
      ?auto_4884 - HOIST
      ?auto_4885 - PLACE
      ?auto_4887 - PLACE
      ?auto_4888 - HOIST
      ?auto_4889 - SURFACE
      ?auto_4886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4884 ?auto_4885 ) ( SURFACE-AT ?auto_4883 ?auto_4885 ) ( CLEAR ?auto_4883 ) ( IS-CRATE ?auto_4882 ) ( AVAILABLE ?auto_4884 ) ( not ( = ?auto_4887 ?auto_4885 ) ) ( HOIST-AT ?auto_4888 ?auto_4887 ) ( AVAILABLE ?auto_4888 ) ( SURFACE-AT ?auto_4882 ?auto_4887 ) ( ON ?auto_4882 ?auto_4889 ) ( CLEAR ?auto_4882 ) ( TRUCK-AT ?auto_4886 ?auto_4885 ) ( not ( = ?auto_4882 ?auto_4883 ) ) ( not ( = ?auto_4882 ?auto_4889 ) ) ( not ( = ?auto_4883 ?auto_4889 ) ) ( not ( = ?auto_4884 ?auto_4888 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4886 ?auto_4885 ?auto_4887 )
      ( !LIFT ?auto_4888 ?auto_4882 ?auto_4889 ?auto_4887 )
      ( !LOAD ?auto_4888 ?auto_4882 ?auto_4886 ?auto_4887 )
      ( !DRIVE ?auto_4886 ?auto_4887 ?auto_4885 )
      ( !UNLOAD ?auto_4884 ?auto_4882 ?auto_4886 ?auto_4885 )
      ( !DROP ?auto_4884 ?auto_4882 ?auto_4883 ?auto_4885 )
      ( MAKE-ON-VERIFY ?auto_4882 ?auto_4883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4892 - SURFACE
      ?auto_4893 - SURFACE
    )
    :vars
    (
      ?auto_4894 - HOIST
      ?auto_4895 - PLACE
      ?auto_4897 - PLACE
      ?auto_4898 - HOIST
      ?auto_4899 - SURFACE
      ?auto_4896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4894 ?auto_4895 ) ( SURFACE-AT ?auto_4893 ?auto_4895 ) ( CLEAR ?auto_4893 ) ( IS-CRATE ?auto_4892 ) ( AVAILABLE ?auto_4894 ) ( not ( = ?auto_4897 ?auto_4895 ) ) ( HOIST-AT ?auto_4898 ?auto_4897 ) ( AVAILABLE ?auto_4898 ) ( SURFACE-AT ?auto_4892 ?auto_4897 ) ( ON ?auto_4892 ?auto_4899 ) ( CLEAR ?auto_4892 ) ( TRUCK-AT ?auto_4896 ?auto_4895 ) ( not ( = ?auto_4892 ?auto_4893 ) ) ( not ( = ?auto_4892 ?auto_4899 ) ) ( not ( = ?auto_4893 ?auto_4899 ) ) ( not ( = ?auto_4894 ?auto_4898 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4896 ?auto_4895 ?auto_4897 )
      ( !LIFT ?auto_4898 ?auto_4892 ?auto_4899 ?auto_4897 )
      ( !LOAD ?auto_4898 ?auto_4892 ?auto_4896 ?auto_4897 )
      ( !DRIVE ?auto_4896 ?auto_4897 ?auto_4895 )
      ( !UNLOAD ?auto_4894 ?auto_4892 ?auto_4896 ?auto_4895 )
      ( !DROP ?auto_4894 ?auto_4892 ?auto_4893 ?auto_4895 )
      ( MAKE-ON-VERIFY ?auto_4892 ?auto_4893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4902 - SURFACE
      ?auto_4903 - SURFACE
    )
    :vars
    (
      ?auto_4904 - HOIST
      ?auto_4905 - PLACE
      ?auto_4907 - PLACE
      ?auto_4908 - HOIST
      ?auto_4909 - SURFACE
      ?auto_4906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4904 ?auto_4905 ) ( SURFACE-AT ?auto_4903 ?auto_4905 ) ( CLEAR ?auto_4903 ) ( IS-CRATE ?auto_4902 ) ( AVAILABLE ?auto_4904 ) ( not ( = ?auto_4907 ?auto_4905 ) ) ( HOIST-AT ?auto_4908 ?auto_4907 ) ( AVAILABLE ?auto_4908 ) ( SURFACE-AT ?auto_4902 ?auto_4907 ) ( ON ?auto_4902 ?auto_4909 ) ( CLEAR ?auto_4902 ) ( TRUCK-AT ?auto_4906 ?auto_4905 ) ( not ( = ?auto_4902 ?auto_4903 ) ) ( not ( = ?auto_4902 ?auto_4909 ) ) ( not ( = ?auto_4903 ?auto_4909 ) ) ( not ( = ?auto_4904 ?auto_4908 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4906 ?auto_4905 ?auto_4907 )
      ( !LIFT ?auto_4908 ?auto_4902 ?auto_4909 ?auto_4907 )
      ( !LOAD ?auto_4908 ?auto_4902 ?auto_4906 ?auto_4907 )
      ( !DRIVE ?auto_4906 ?auto_4907 ?auto_4905 )
      ( !UNLOAD ?auto_4904 ?auto_4902 ?auto_4906 ?auto_4905 )
      ( !DROP ?auto_4904 ?auto_4902 ?auto_4903 ?auto_4905 )
      ( MAKE-ON-VERIFY ?auto_4902 ?auto_4903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4912 - SURFACE
      ?auto_4913 - SURFACE
    )
    :vars
    (
      ?auto_4914 - HOIST
      ?auto_4915 - PLACE
      ?auto_4917 - PLACE
      ?auto_4918 - HOIST
      ?auto_4919 - SURFACE
      ?auto_4916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4914 ?auto_4915 ) ( SURFACE-AT ?auto_4913 ?auto_4915 ) ( CLEAR ?auto_4913 ) ( IS-CRATE ?auto_4912 ) ( AVAILABLE ?auto_4914 ) ( not ( = ?auto_4917 ?auto_4915 ) ) ( HOIST-AT ?auto_4918 ?auto_4917 ) ( AVAILABLE ?auto_4918 ) ( SURFACE-AT ?auto_4912 ?auto_4917 ) ( ON ?auto_4912 ?auto_4919 ) ( CLEAR ?auto_4912 ) ( TRUCK-AT ?auto_4916 ?auto_4915 ) ( not ( = ?auto_4912 ?auto_4913 ) ) ( not ( = ?auto_4912 ?auto_4919 ) ) ( not ( = ?auto_4913 ?auto_4919 ) ) ( not ( = ?auto_4914 ?auto_4918 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4916 ?auto_4915 ?auto_4917 )
      ( !LIFT ?auto_4918 ?auto_4912 ?auto_4919 ?auto_4917 )
      ( !LOAD ?auto_4918 ?auto_4912 ?auto_4916 ?auto_4917 )
      ( !DRIVE ?auto_4916 ?auto_4917 ?auto_4915 )
      ( !UNLOAD ?auto_4914 ?auto_4912 ?auto_4916 ?auto_4915 )
      ( !DROP ?auto_4914 ?auto_4912 ?auto_4913 ?auto_4915 )
      ( MAKE-ON-VERIFY ?auto_4912 ?auto_4913 ) )
  )

)

