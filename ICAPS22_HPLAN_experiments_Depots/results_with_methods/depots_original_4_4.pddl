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
      ?auto_4805 - SURFACE
      ?auto_4806 - SURFACE
    )
    :vars
    (
      ?auto_4807 - HOIST
      ?auto_4808 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4807 ?auto_4808 ) ( SURFACE-AT ?auto_4806 ?auto_4808 ) ( CLEAR ?auto_4806 ) ( LIFTING ?auto_4807 ?auto_4805 ) ( IS-CRATE ?auto_4805 ) ( not ( = ?auto_4805 ?auto_4806 ) ) )
    :subtasks
    ( ( !DROP ?auto_4807 ?auto_4805 ?auto_4806 ?auto_4808 )
      ( MAKE-ON-VERIFY ?auto_4805 ?auto_4806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4809 - SURFACE
      ?auto_4810 - SURFACE
    )
    :vars
    (
      ?auto_4812 - HOIST
      ?auto_4811 - PLACE
      ?auto_4813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4812 ?auto_4811 ) ( SURFACE-AT ?auto_4810 ?auto_4811 ) ( CLEAR ?auto_4810 ) ( IS-CRATE ?auto_4809 ) ( not ( = ?auto_4809 ?auto_4810 ) ) ( TRUCK-AT ?auto_4813 ?auto_4811 ) ( AVAILABLE ?auto_4812 ) ( IN ?auto_4809 ?auto_4813 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4812 ?auto_4809 ?auto_4813 ?auto_4811 )
      ( MAKE-ON ?auto_4809 ?auto_4810 )
      ( MAKE-ON-VERIFY ?auto_4809 ?auto_4810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4814 - SURFACE
      ?auto_4815 - SURFACE
    )
    :vars
    (
      ?auto_4817 - HOIST
      ?auto_4816 - PLACE
      ?auto_4818 - TRUCK
      ?auto_4819 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4817 ?auto_4816 ) ( SURFACE-AT ?auto_4815 ?auto_4816 ) ( CLEAR ?auto_4815 ) ( IS-CRATE ?auto_4814 ) ( not ( = ?auto_4814 ?auto_4815 ) ) ( AVAILABLE ?auto_4817 ) ( IN ?auto_4814 ?auto_4818 ) ( TRUCK-AT ?auto_4818 ?auto_4819 ) ( not ( = ?auto_4819 ?auto_4816 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4818 ?auto_4819 ?auto_4816 )
      ( MAKE-ON ?auto_4814 ?auto_4815 )
      ( MAKE-ON-VERIFY ?auto_4814 ?auto_4815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4820 - SURFACE
      ?auto_4821 - SURFACE
    )
    :vars
    (
      ?auto_4823 - HOIST
      ?auto_4824 - PLACE
      ?auto_4825 - TRUCK
      ?auto_4822 - PLACE
      ?auto_4826 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4823 ?auto_4824 ) ( SURFACE-AT ?auto_4821 ?auto_4824 ) ( CLEAR ?auto_4821 ) ( IS-CRATE ?auto_4820 ) ( not ( = ?auto_4820 ?auto_4821 ) ) ( AVAILABLE ?auto_4823 ) ( TRUCK-AT ?auto_4825 ?auto_4822 ) ( not ( = ?auto_4822 ?auto_4824 ) ) ( HOIST-AT ?auto_4826 ?auto_4822 ) ( LIFTING ?auto_4826 ?auto_4820 ) ( not ( = ?auto_4823 ?auto_4826 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4826 ?auto_4820 ?auto_4825 ?auto_4822 )
      ( MAKE-ON ?auto_4820 ?auto_4821 )
      ( MAKE-ON-VERIFY ?auto_4820 ?auto_4821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4827 - SURFACE
      ?auto_4828 - SURFACE
    )
    :vars
    (
      ?auto_4832 - HOIST
      ?auto_4829 - PLACE
      ?auto_4833 - TRUCK
      ?auto_4830 - PLACE
      ?auto_4831 - HOIST
      ?auto_4834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4832 ?auto_4829 ) ( SURFACE-AT ?auto_4828 ?auto_4829 ) ( CLEAR ?auto_4828 ) ( IS-CRATE ?auto_4827 ) ( not ( = ?auto_4827 ?auto_4828 ) ) ( AVAILABLE ?auto_4832 ) ( TRUCK-AT ?auto_4833 ?auto_4830 ) ( not ( = ?auto_4830 ?auto_4829 ) ) ( HOIST-AT ?auto_4831 ?auto_4830 ) ( not ( = ?auto_4832 ?auto_4831 ) ) ( AVAILABLE ?auto_4831 ) ( SURFACE-AT ?auto_4827 ?auto_4830 ) ( ON ?auto_4827 ?auto_4834 ) ( CLEAR ?auto_4827 ) ( not ( = ?auto_4827 ?auto_4834 ) ) ( not ( = ?auto_4828 ?auto_4834 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4831 ?auto_4827 ?auto_4834 ?auto_4830 )
      ( MAKE-ON ?auto_4827 ?auto_4828 )
      ( MAKE-ON-VERIFY ?auto_4827 ?auto_4828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4835 - SURFACE
      ?auto_4836 - SURFACE
    )
    :vars
    (
      ?auto_4842 - HOIST
      ?auto_4841 - PLACE
      ?auto_4840 - PLACE
      ?auto_4837 - HOIST
      ?auto_4839 - SURFACE
      ?auto_4838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4842 ?auto_4841 ) ( SURFACE-AT ?auto_4836 ?auto_4841 ) ( CLEAR ?auto_4836 ) ( IS-CRATE ?auto_4835 ) ( not ( = ?auto_4835 ?auto_4836 ) ) ( AVAILABLE ?auto_4842 ) ( not ( = ?auto_4840 ?auto_4841 ) ) ( HOIST-AT ?auto_4837 ?auto_4840 ) ( not ( = ?auto_4842 ?auto_4837 ) ) ( AVAILABLE ?auto_4837 ) ( SURFACE-AT ?auto_4835 ?auto_4840 ) ( ON ?auto_4835 ?auto_4839 ) ( CLEAR ?auto_4835 ) ( not ( = ?auto_4835 ?auto_4839 ) ) ( not ( = ?auto_4836 ?auto_4839 ) ) ( TRUCK-AT ?auto_4838 ?auto_4841 ) )
    :subtasks
    ( ( !DRIVE ?auto_4838 ?auto_4841 ?auto_4840 )
      ( MAKE-ON ?auto_4835 ?auto_4836 )
      ( MAKE-ON-VERIFY ?auto_4835 ?auto_4836 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4845 - SURFACE
      ?auto_4846 - SURFACE
    )
    :vars
    (
      ?auto_4847 - HOIST
      ?auto_4848 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4847 ?auto_4848 ) ( SURFACE-AT ?auto_4846 ?auto_4848 ) ( CLEAR ?auto_4846 ) ( LIFTING ?auto_4847 ?auto_4845 ) ( IS-CRATE ?auto_4845 ) ( not ( = ?auto_4845 ?auto_4846 ) ) )
    :subtasks
    ( ( !DROP ?auto_4847 ?auto_4845 ?auto_4846 ?auto_4848 )
      ( MAKE-ON-VERIFY ?auto_4845 ?auto_4846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4849 - SURFACE
      ?auto_4850 - SURFACE
    )
    :vars
    (
      ?auto_4852 - HOIST
      ?auto_4851 - PLACE
      ?auto_4853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4852 ?auto_4851 ) ( SURFACE-AT ?auto_4850 ?auto_4851 ) ( CLEAR ?auto_4850 ) ( IS-CRATE ?auto_4849 ) ( not ( = ?auto_4849 ?auto_4850 ) ) ( TRUCK-AT ?auto_4853 ?auto_4851 ) ( AVAILABLE ?auto_4852 ) ( IN ?auto_4849 ?auto_4853 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4852 ?auto_4849 ?auto_4853 ?auto_4851 )
      ( MAKE-ON ?auto_4849 ?auto_4850 )
      ( MAKE-ON-VERIFY ?auto_4849 ?auto_4850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4854 - SURFACE
      ?auto_4855 - SURFACE
    )
    :vars
    (
      ?auto_4857 - HOIST
      ?auto_4858 - PLACE
      ?auto_4856 - TRUCK
      ?auto_4859 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4857 ?auto_4858 ) ( SURFACE-AT ?auto_4855 ?auto_4858 ) ( CLEAR ?auto_4855 ) ( IS-CRATE ?auto_4854 ) ( not ( = ?auto_4854 ?auto_4855 ) ) ( AVAILABLE ?auto_4857 ) ( IN ?auto_4854 ?auto_4856 ) ( TRUCK-AT ?auto_4856 ?auto_4859 ) ( not ( = ?auto_4859 ?auto_4858 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4856 ?auto_4859 ?auto_4858 )
      ( MAKE-ON ?auto_4854 ?auto_4855 )
      ( MAKE-ON-VERIFY ?auto_4854 ?auto_4855 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4860 - SURFACE
      ?auto_4861 - SURFACE
    )
    :vars
    (
      ?auto_4864 - HOIST
      ?auto_4863 - PLACE
      ?auto_4862 - TRUCK
      ?auto_4865 - PLACE
      ?auto_4866 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4864 ?auto_4863 ) ( SURFACE-AT ?auto_4861 ?auto_4863 ) ( CLEAR ?auto_4861 ) ( IS-CRATE ?auto_4860 ) ( not ( = ?auto_4860 ?auto_4861 ) ) ( AVAILABLE ?auto_4864 ) ( TRUCK-AT ?auto_4862 ?auto_4865 ) ( not ( = ?auto_4865 ?auto_4863 ) ) ( HOIST-AT ?auto_4866 ?auto_4865 ) ( LIFTING ?auto_4866 ?auto_4860 ) ( not ( = ?auto_4864 ?auto_4866 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4866 ?auto_4860 ?auto_4862 ?auto_4865 )
      ( MAKE-ON ?auto_4860 ?auto_4861 )
      ( MAKE-ON-VERIFY ?auto_4860 ?auto_4861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4867 - SURFACE
      ?auto_4868 - SURFACE
    )
    :vars
    (
      ?auto_4873 - HOIST
      ?auto_4871 - PLACE
      ?auto_4869 - TRUCK
      ?auto_4870 - PLACE
      ?auto_4872 - HOIST
      ?auto_4874 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4873 ?auto_4871 ) ( SURFACE-AT ?auto_4868 ?auto_4871 ) ( CLEAR ?auto_4868 ) ( IS-CRATE ?auto_4867 ) ( not ( = ?auto_4867 ?auto_4868 ) ) ( AVAILABLE ?auto_4873 ) ( TRUCK-AT ?auto_4869 ?auto_4870 ) ( not ( = ?auto_4870 ?auto_4871 ) ) ( HOIST-AT ?auto_4872 ?auto_4870 ) ( not ( = ?auto_4873 ?auto_4872 ) ) ( AVAILABLE ?auto_4872 ) ( SURFACE-AT ?auto_4867 ?auto_4870 ) ( ON ?auto_4867 ?auto_4874 ) ( CLEAR ?auto_4867 ) ( not ( = ?auto_4867 ?auto_4874 ) ) ( not ( = ?auto_4868 ?auto_4874 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4872 ?auto_4867 ?auto_4874 ?auto_4870 )
      ( MAKE-ON ?auto_4867 ?auto_4868 )
      ( MAKE-ON-VERIFY ?auto_4867 ?auto_4868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4875 - SURFACE
      ?auto_4876 - SURFACE
    )
    :vars
    (
      ?auto_4879 - HOIST
      ?auto_4880 - PLACE
      ?auto_4877 - PLACE
      ?auto_4878 - HOIST
      ?auto_4881 - SURFACE
      ?auto_4882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4879 ?auto_4880 ) ( SURFACE-AT ?auto_4876 ?auto_4880 ) ( CLEAR ?auto_4876 ) ( IS-CRATE ?auto_4875 ) ( not ( = ?auto_4875 ?auto_4876 ) ) ( AVAILABLE ?auto_4879 ) ( not ( = ?auto_4877 ?auto_4880 ) ) ( HOIST-AT ?auto_4878 ?auto_4877 ) ( not ( = ?auto_4879 ?auto_4878 ) ) ( AVAILABLE ?auto_4878 ) ( SURFACE-AT ?auto_4875 ?auto_4877 ) ( ON ?auto_4875 ?auto_4881 ) ( CLEAR ?auto_4875 ) ( not ( = ?auto_4875 ?auto_4881 ) ) ( not ( = ?auto_4876 ?auto_4881 ) ) ( TRUCK-AT ?auto_4882 ?auto_4880 ) )
    :subtasks
    ( ( !DRIVE ?auto_4882 ?auto_4880 ?auto_4877 )
      ( MAKE-ON ?auto_4875 ?auto_4876 )
      ( MAKE-ON-VERIFY ?auto_4875 ?auto_4876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4883 - SURFACE
      ?auto_4884 - SURFACE
    )
    :vars
    (
      ?auto_4887 - HOIST
      ?auto_4889 - PLACE
      ?auto_4886 - PLACE
      ?auto_4885 - HOIST
      ?auto_4890 - SURFACE
      ?auto_4888 - TRUCK
      ?auto_4891 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4887 ?auto_4889 ) ( IS-CRATE ?auto_4883 ) ( not ( = ?auto_4883 ?auto_4884 ) ) ( not ( = ?auto_4886 ?auto_4889 ) ) ( HOIST-AT ?auto_4885 ?auto_4886 ) ( not ( = ?auto_4887 ?auto_4885 ) ) ( AVAILABLE ?auto_4885 ) ( SURFACE-AT ?auto_4883 ?auto_4886 ) ( ON ?auto_4883 ?auto_4890 ) ( CLEAR ?auto_4883 ) ( not ( = ?auto_4883 ?auto_4890 ) ) ( not ( = ?auto_4884 ?auto_4890 ) ) ( TRUCK-AT ?auto_4888 ?auto_4889 ) ( SURFACE-AT ?auto_4891 ?auto_4889 ) ( CLEAR ?auto_4891 ) ( LIFTING ?auto_4887 ?auto_4884 ) ( IS-CRATE ?auto_4884 ) ( not ( = ?auto_4883 ?auto_4891 ) ) ( not ( = ?auto_4884 ?auto_4891 ) ) ( not ( = ?auto_4890 ?auto_4891 ) ) )
    :subtasks
    ( ( !DROP ?auto_4887 ?auto_4884 ?auto_4891 ?auto_4889 )
      ( MAKE-ON ?auto_4883 ?auto_4884 )
      ( MAKE-ON-VERIFY ?auto_4883 ?auto_4884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4892 - SURFACE
      ?auto_4893 - SURFACE
    )
    :vars
    (
      ?auto_4899 - HOIST
      ?auto_4894 - PLACE
      ?auto_4896 - PLACE
      ?auto_4900 - HOIST
      ?auto_4898 - SURFACE
      ?auto_4895 - TRUCK
      ?auto_4897 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4899 ?auto_4894 ) ( IS-CRATE ?auto_4892 ) ( not ( = ?auto_4892 ?auto_4893 ) ) ( not ( = ?auto_4896 ?auto_4894 ) ) ( HOIST-AT ?auto_4900 ?auto_4896 ) ( not ( = ?auto_4899 ?auto_4900 ) ) ( AVAILABLE ?auto_4900 ) ( SURFACE-AT ?auto_4892 ?auto_4896 ) ( ON ?auto_4892 ?auto_4898 ) ( CLEAR ?auto_4892 ) ( not ( = ?auto_4892 ?auto_4898 ) ) ( not ( = ?auto_4893 ?auto_4898 ) ) ( TRUCK-AT ?auto_4895 ?auto_4894 ) ( SURFACE-AT ?auto_4897 ?auto_4894 ) ( CLEAR ?auto_4897 ) ( IS-CRATE ?auto_4893 ) ( not ( = ?auto_4892 ?auto_4897 ) ) ( not ( = ?auto_4893 ?auto_4897 ) ) ( not ( = ?auto_4898 ?auto_4897 ) ) ( AVAILABLE ?auto_4899 ) ( IN ?auto_4893 ?auto_4895 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4899 ?auto_4893 ?auto_4895 ?auto_4894 )
      ( MAKE-ON ?auto_4892 ?auto_4893 )
      ( MAKE-ON-VERIFY ?auto_4892 ?auto_4893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4901 - SURFACE
      ?auto_4902 - SURFACE
    )
    :vars
    (
      ?auto_4907 - HOIST
      ?auto_4905 - PLACE
      ?auto_4908 - PLACE
      ?auto_4903 - HOIST
      ?auto_4909 - SURFACE
      ?auto_4904 - SURFACE
      ?auto_4906 - TRUCK
      ?auto_4910 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4907 ?auto_4905 ) ( IS-CRATE ?auto_4901 ) ( not ( = ?auto_4901 ?auto_4902 ) ) ( not ( = ?auto_4908 ?auto_4905 ) ) ( HOIST-AT ?auto_4903 ?auto_4908 ) ( not ( = ?auto_4907 ?auto_4903 ) ) ( AVAILABLE ?auto_4903 ) ( SURFACE-AT ?auto_4901 ?auto_4908 ) ( ON ?auto_4901 ?auto_4909 ) ( CLEAR ?auto_4901 ) ( not ( = ?auto_4901 ?auto_4909 ) ) ( not ( = ?auto_4902 ?auto_4909 ) ) ( SURFACE-AT ?auto_4904 ?auto_4905 ) ( CLEAR ?auto_4904 ) ( IS-CRATE ?auto_4902 ) ( not ( = ?auto_4901 ?auto_4904 ) ) ( not ( = ?auto_4902 ?auto_4904 ) ) ( not ( = ?auto_4909 ?auto_4904 ) ) ( AVAILABLE ?auto_4907 ) ( IN ?auto_4902 ?auto_4906 ) ( TRUCK-AT ?auto_4906 ?auto_4910 ) ( not ( = ?auto_4910 ?auto_4905 ) ) ( not ( = ?auto_4908 ?auto_4910 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4906 ?auto_4910 ?auto_4905 )
      ( MAKE-ON ?auto_4901 ?auto_4902 )
      ( MAKE-ON-VERIFY ?auto_4901 ?auto_4902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4911 - SURFACE
      ?auto_4912 - SURFACE
    )
    :vars
    (
      ?auto_4913 - HOIST
      ?auto_4920 - PLACE
      ?auto_4916 - PLACE
      ?auto_4917 - HOIST
      ?auto_4918 - SURFACE
      ?auto_4915 - SURFACE
      ?auto_4919 - TRUCK
      ?auto_4914 - PLACE
      ?auto_4921 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4913 ?auto_4920 ) ( IS-CRATE ?auto_4911 ) ( not ( = ?auto_4911 ?auto_4912 ) ) ( not ( = ?auto_4916 ?auto_4920 ) ) ( HOIST-AT ?auto_4917 ?auto_4916 ) ( not ( = ?auto_4913 ?auto_4917 ) ) ( AVAILABLE ?auto_4917 ) ( SURFACE-AT ?auto_4911 ?auto_4916 ) ( ON ?auto_4911 ?auto_4918 ) ( CLEAR ?auto_4911 ) ( not ( = ?auto_4911 ?auto_4918 ) ) ( not ( = ?auto_4912 ?auto_4918 ) ) ( SURFACE-AT ?auto_4915 ?auto_4920 ) ( CLEAR ?auto_4915 ) ( IS-CRATE ?auto_4912 ) ( not ( = ?auto_4911 ?auto_4915 ) ) ( not ( = ?auto_4912 ?auto_4915 ) ) ( not ( = ?auto_4918 ?auto_4915 ) ) ( AVAILABLE ?auto_4913 ) ( TRUCK-AT ?auto_4919 ?auto_4914 ) ( not ( = ?auto_4914 ?auto_4920 ) ) ( not ( = ?auto_4916 ?auto_4914 ) ) ( HOIST-AT ?auto_4921 ?auto_4914 ) ( LIFTING ?auto_4921 ?auto_4912 ) ( not ( = ?auto_4913 ?auto_4921 ) ) ( not ( = ?auto_4917 ?auto_4921 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4921 ?auto_4912 ?auto_4919 ?auto_4914 )
      ( MAKE-ON ?auto_4911 ?auto_4912 )
      ( MAKE-ON-VERIFY ?auto_4911 ?auto_4912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4922 - SURFACE
      ?auto_4923 - SURFACE
    )
    :vars
    (
      ?auto_4926 - HOIST
      ?auto_4924 - PLACE
      ?auto_4929 - PLACE
      ?auto_4931 - HOIST
      ?auto_4932 - SURFACE
      ?auto_4928 - SURFACE
      ?auto_4930 - TRUCK
      ?auto_4927 - PLACE
      ?auto_4925 - HOIST
      ?auto_4933 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4926 ?auto_4924 ) ( IS-CRATE ?auto_4922 ) ( not ( = ?auto_4922 ?auto_4923 ) ) ( not ( = ?auto_4929 ?auto_4924 ) ) ( HOIST-AT ?auto_4931 ?auto_4929 ) ( not ( = ?auto_4926 ?auto_4931 ) ) ( AVAILABLE ?auto_4931 ) ( SURFACE-AT ?auto_4922 ?auto_4929 ) ( ON ?auto_4922 ?auto_4932 ) ( CLEAR ?auto_4922 ) ( not ( = ?auto_4922 ?auto_4932 ) ) ( not ( = ?auto_4923 ?auto_4932 ) ) ( SURFACE-AT ?auto_4928 ?auto_4924 ) ( CLEAR ?auto_4928 ) ( IS-CRATE ?auto_4923 ) ( not ( = ?auto_4922 ?auto_4928 ) ) ( not ( = ?auto_4923 ?auto_4928 ) ) ( not ( = ?auto_4932 ?auto_4928 ) ) ( AVAILABLE ?auto_4926 ) ( TRUCK-AT ?auto_4930 ?auto_4927 ) ( not ( = ?auto_4927 ?auto_4924 ) ) ( not ( = ?auto_4929 ?auto_4927 ) ) ( HOIST-AT ?auto_4925 ?auto_4927 ) ( not ( = ?auto_4926 ?auto_4925 ) ) ( not ( = ?auto_4931 ?auto_4925 ) ) ( AVAILABLE ?auto_4925 ) ( SURFACE-AT ?auto_4923 ?auto_4927 ) ( ON ?auto_4923 ?auto_4933 ) ( CLEAR ?auto_4923 ) ( not ( = ?auto_4922 ?auto_4933 ) ) ( not ( = ?auto_4923 ?auto_4933 ) ) ( not ( = ?auto_4932 ?auto_4933 ) ) ( not ( = ?auto_4928 ?auto_4933 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4925 ?auto_4923 ?auto_4933 ?auto_4927 )
      ( MAKE-ON ?auto_4922 ?auto_4923 )
      ( MAKE-ON-VERIFY ?auto_4922 ?auto_4923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4934 - SURFACE
      ?auto_4935 - SURFACE
    )
    :vars
    (
      ?auto_4940 - HOIST
      ?auto_4944 - PLACE
      ?auto_4943 - PLACE
      ?auto_4936 - HOIST
      ?auto_4945 - SURFACE
      ?auto_4942 - SURFACE
      ?auto_4941 - PLACE
      ?auto_4939 - HOIST
      ?auto_4937 - SURFACE
      ?auto_4938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4940 ?auto_4944 ) ( IS-CRATE ?auto_4934 ) ( not ( = ?auto_4934 ?auto_4935 ) ) ( not ( = ?auto_4943 ?auto_4944 ) ) ( HOIST-AT ?auto_4936 ?auto_4943 ) ( not ( = ?auto_4940 ?auto_4936 ) ) ( AVAILABLE ?auto_4936 ) ( SURFACE-AT ?auto_4934 ?auto_4943 ) ( ON ?auto_4934 ?auto_4945 ) ( CLEAR ?auto_4934 ) ( not ( = ?auto_4934 ?auto_4945 ) ) ( not ( = ?auto_4935 ?auto_4945 ) ) ( SURFACE-AT ?auto_4942 ?auto_4944 ) ( CLEAR ?auto_4942 ) ( IS-CRATE ?auto_4935 ) ( not ( = ?auto_4934 ?auto_4942 ) ) ( not ( = ?auto_4935 ?auto_4942 ) ) ( not ( = ?auto_4945 ?auto_4942 ) ) ( AVAILABLE ?auto_4940 ) ( not ( = ?auto_4941 ?auto_4944 ) ) ( not ( = ?auto_4943 ?auto_4941 ) ) ( HOIST-AT ?auto_4939 ?auto_4941 ) ( not ( = ?auto_4940 ?auto_4939 ) ) ( not ( = ?auto_4936 ?auto_4939 ) ) ( AVAILABLE ?auto_4939 ) ( SURFACE-AT ?auto_4935 ?auto_4941 ) ( ON ?auto_4935 ?auto_4937 ) ( CLEAR ?auto_4935 ) ( not ( = ?auto_4934 ?auto_4937 ) ) ( not ( = ?auto_4935 ?auto_4937 ) ) ( not ( = ?auto_4945 ?auto_4937 ) ) ( not ( = ?auto_4942 ?auto_4937 ) ) ( TRUCK-AT ?auto_4938 ?auto_4944 ) )
    :subtasks
    ( ( !DRIVE ?auto_4938 ?auto_4944 ?auto_4941 )
      ( MAKE-ON ?auto_4934 ?auto_4935 )
      ( MAKE-ON-VERIFY ?auto_4934 ?auto_4935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4948 - SURFACE
      ?auto_4949 - SURFACE
    )
    :vars
    (
      ?auto_4950 - HOIST
      ?auto_4951 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4950 ?auto_4951 ) ( SURFACE-AT ?auto_4949 ?auto_4951 ) ( CLEAR ?auto_4949 ) ( LIFTING ?auto_4950 ?auto_4948 ) ( IS-CRATE ?auto_4948 ) ( not ( = ?auto_4948 ?auto_4949 ) ) )
    :subtasks
    ( ( !DROP ?auto_4950 ?auto_4948 ?auto_4949 ?auto_4951 )
      ( MAKE-ON-VERIFY ?auto_4948 ?auto_4949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4952 - SURFACE
      ?auto_4953 - SURFACE
    )
    :vars
    (
      ?auto_4954 - HOIST
      ?auto_4955 - PLACE
      ?auto_4956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4954 ?auto_4955 ) ( SURFACE-AT ?auto_4953 ?auto_4955 ) ( CLEAR ?auto_4953 ) ( IS-CRATE ?auto_4952 ) ( not ( = ?auto_4952 ?auto_4953 ) ) ( TRUCK-AT ?auto_4956 ?auto_4955 ) ( AVAILABLE ?auto_4954 ) ( IN ?auto_4952 ?auto_4956 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4954 ?auto_4952 ?auto_4956 ?auto_4955 )
      ( MAKE-ON ?auto_4952 ?auto_4953 )
      ( MAKE-ON-VERIFY ?auto_4952 ?auto_4953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4957 - SURFACE
      ?auto_4958 - SURFACE
    )
    :vars
    (
      ?auto_4961 - HOIST
      ?auto_4959 - PLACE
      ?auto_4960 - TRUCK
      ?auto_4962 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4961 ?auto_4959 ) ( SURFACE-AT ?auto_4958 ?auto_4959 ) ( CLEAR ?auto_4958 ) ( IS-CRATE ?auto_4957 ) ( not ( = ?auto_4957 ?auto_4958 ) ) ( AVAILABLE ?auto_4961 ) ( IN ?auto_4957 ?auto_4960 ) ( TRUCK-AT ?auto_4960 ?auto_4962 ) ( not ( = ?auto_4962 ?auto_4959 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4960 ?auto_4962 ?auto_4959 )
      ( MAKE-ON ?auto_4957 ?auto_4958 )
      ( MAKE-ON-VERIFY ?auto_4957 ?auto_4958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4963 - SURFACE
      ?auto_4964 - SURFACE
    )
    :vars
    (
      ?auto_4967 - HOIST
      ?auto_4965 - PLACE
      ?auto_4968 - TRUCK
      ?auto_4966 - PLACE
      ?auto_4969 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4967 ?auto_4965 ) ( SURFACE-AT ?auto_4964 ?auto_4965 ) ( CLEAR ?auto_4964 ) ( IS-CRATE ?auto_4963 ) ( not ( = ?auto_4963 ?auto_4964 ) ) ( AVAILABLE ?auto_4967 ) ( TRUCK-AT ?auto_4968 ?auto_4966 ) ( not ( = ?auto_4966 ?auto_4965 ) ) ( HOIST-AT ?auto_4969 ?auto_4966 ) ( LIFTING ?auto_4969 ?auto_4963 ) ( not ( = ?auto_4967 ?auto_4969 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4969 ?auto_4963 ?auto_4968 ?auto_4966 )
      ( MAKE-ON ?auto_4963 ?auto_4964 )
      ( MAKE-ON-VERIFY ?auto_4963 ?auto_4964 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4970 - SURFACE
      ?auto_4971 - SURFACE
    )
    :vars
    (
      ?auto_4975 - HOIST
      ?auto_4972 - PLACE
      ?auto_4973 - TRUCK
      ?auto_4974 - PLACE
      ?auto_4976 - HOIST
      ?auto_4977 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4975 ?auto_4972 ) ( SURFACE-AT ?auto_4971 ?auto_4972 ) ( CLEAR ?auto_4971 ) ( IS-CRATE ?auto_4970 ) ( not ( = ?auto_4970 ?auto_4971 ) ) ( AVAILABLE ?auto_4975 ) ( TRUCK-AT ?auto_4973 ?auto_4974 ) ( not ( = ?auto_4974 ?auto_4972 ) ) ( HOIST-AT ?auto_4976 ?auto_4974 ) ( not ( = ?auto_4975 ?auto_4976 ) ) ( AVAILABLE ?auto_4976 ) ( SURFACE-AT ?auto_4970 ?auto_4974 ) ( ON ?auto_4970 ?auto_4977 ) ( CLEAR ?auto_4970 ) ( not ( = ?auto_4970 ?auto_4977 ) ) ( not ( = ?auto_4971 ?auto_4977 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4976 ?auto_4970 ?auto_4977 ?auto_4974 )
      ( MAKE-ON ?auto_4970 ?auto_4971 )
      ( MAKE-ON-VERIFY ?auto_4970 ?auto_4971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4978 - SURFACE
      ?auto_4979 - SURFACE
    )
    :vars
    (
      ?auto_4985 - HOIST
      ?auto_4984 - PLACE
      ?auto_4982 - PLACE
      ?auto_4980 - HOIST
      ?auto_4981 - SURFACE
      ?auto_4983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4985 ?auto_4984 ) ( SURFACE-AT ?auto_4979 ?auto_4984 ) ( CLEAR ?auto_4979 ) ( IS-CRATE ?auto_4978 ) ( not ( = ?auto_4978 ?auto_4979 ) ) ( AVAILABLE ?auto_4985 ) ( not ( = ?auto_4982 ?auto_4984 ) ) ( HOIST-AT ?auto_4980 ?auto_4982 ) ( not ( = ?auto_4985 ?auto_4980 ) ) ( AVAILABLE ?auto_4980 ) ( SURFACE-AT ?auto_4978 ?auto_4982 ) ( ON ?auto_4978 ?auto_4981 ) ( CLEAR ?auto_4978 ) ( not ( = ?auto_4978 ?auto_4981 ) ) ( not ( = ?auto_4979 ?auto_4981 ) ) ( TRUCK-AT ?auto_4983 ?auto_4984 ) )
    :subtasks
    ( ( !DRIVE ?auto_4983 ?auto_4984 ?auto_4982 )
      ( MAKE-ON ?auto_4978 ?auto_4979 )
      ( MAKE-ON-VERIFY ?auto_4978 ?auto_4979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4986 - SURFACE
      ?auto_4987 - SURFACE
    )
    :vars
    (
      ?auto_4988 - HOIST
      ?auto_4989 - PLACE
      ?auto_4991 - PLACE
      ?auto_4993 - HOIST
      ?auto_4992 - SURFACE
      ?auto_4990 - TRUCK
      ?auto_4994 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4988 ?auto_4989 ) ( IS-CRATE ?auto_4986 ) ( not ( = ?auto_4986 ?auto_4987 ) ) ( not ( = ?auto_4991 ?auto_4989 ) ) ( HOIST-AT ?auto_4993 ?auto_4991 ) ( not ( = ?auto_4988 ?auto_4993 ) ) ( AVAILABLE ?auto_4993 ) ( SURFACE-AT ?auto_4986 ?auto_4991 ) ( ON ?auto_4986 ?auto_4992 ) ( CLEAR ?auto_4986 ) ( not ( = ?auto_4986 ?auto_4992 ) ) ( not ( = ?auto_4987 ?auto_4992 ) ) ( TRUCK-AT ?auto_4990 ?auto_4989 ) ( SURFACE-AT ?auto_4994 ?auto_4989 ) ( CLEAR ?auto_4994 ) ( LIFTING ?auto_4988 ?auto_4987 ) ( IS-CRATE ?auto_4987 ) ( not ( = ?auto_4986 ?auto_4994 ) ) ( not ( = ?auto_4987 ?auto_4994 ) ) ( not ( = ?auto_4992 ?auto_4994 ) ) )
    :subtasks
    ( ( !DROP ?auto_4988 ?auto_4987 ?auto_4994 ?auto_4989 )
      ( MAKE-ON ?auto_4986 ?auto_4987 )
      ( MAKE-ON-VERIFY ?auto_4986 ?auto_4987 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4995 - SURFACE
      ?auto_4996 - SURFACE
    )
    :vars
    (
      ?auto_5003 - HOIST
      ?auto_4999 - PLACE
      ?auto_5001 - PLACE
      ?auto_5000 - HOIST
      ?auto_5002 - SURFACE
      ?auto_4997 - TRUCK
      ?auto_4998 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5003 ?auto_4999 ) ( IS-CRATE ?auto_4995 ) ( not ( = ?auto_4995 ?auto_4996 ) ) ( not ( = ?auto_5001 ?auto_4999 ) ) ( HOIST-AT ?auto_5000 ?auto_5001 ) ( not ( = ?auto_5003 ?auto_5000 ) ) ( AVAILABLE ?auto_5000 ) ( SURFACE-AT ?auto_4995 ?auto_5001 ) ( ON ?auto_4995 ?auto_5002 ) ( CLEAR ?auto_4995 ) ( not ( = ?auto_4995 ?auto_5002 ) ) ( not ( = ?auto_4996 ?auto_5002 ) ) ( TRUCK-AT ?auto_4997 ?auto_4999 ) ( SURFACE-AT ?auto_4998 ?auto_4999 ) ( CLEAR ?auto_4998 ) ( IS-CRATE ?auto_4996 ) ( not ( = ?auto_4995 ?auto_4998 ) ) ( not ( = ?auto_4996 ?auto_4998 ) ) ( not ( = ?auto_5002 ?auto_4998 ) ) ( AVAILABLE ?auto_5003 ) ( IN ?auto_4996 ?auto_4997 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5003 ?auto_4996 ?auto_4997 ?auto_4999 )
      ( MAKE-ON ?auto_4995 ?auto_4996 )
      ( MAKE-ON-VERIFY ?auto_4995 ?auto_4996 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5004 - SURFACE
      ?auto_5005 - SURFACE
    )
    :vars
    (
      ?auto_5008 - HOIST
      ?auto_5009 - PLACE
      ?auto_5010 - PLACE
      ?auto_5011 - HOIST
      ?auto_5006 - SURFACE
      ?auto_5012 - SURFACE
      ?auto_5007 - TRUCK
      ?auto_5013 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5008 ?auto_5009 ) ( IS-CRATE ?auto_5004 ) ( not ( = ?auto_5004 ?auto_5005 ) ) ( not ( = ?auto_5010 ?auto_5009 ) ) ( HOIST-AT ?auto_5011 ?auto_5010 ) ( not ( = ?auto_5008 ?auto_5011 ) ) ( AVAILABLE ?auto_5011 ) ( SURFACE-AT ?auto_5004 ?auto_5010 ) ( ON ?auto_5004 ?auto_5006 ) ( CLEAR ?auto_5004 ) ( not ( = ?auto_5004 ?auto_5006 ) ) ( not ( = ?auto_5005 ?auto_5006 ) ) ( SURFACE-AT ?auto_5012 ?auto_5009 ) ( CLEAR ?auto_5012 ) ( IS-CRATE ?auto_5005 ) ( not ( = ?auto_5004 ?auto_5012 ) ) ( not ( = ?auto_5005 ?auto_5012 ) ) ( not ( = ?auto_5006 ?auto_5012 ) ) ( AVAILABLE ?auto_5008 ) ( IN ?auto_5005 ?auto_5007 ) ( TRUCK-AT ?auto_5007 ?auto_5013 ) ( not ( = ?auto_5013 ?auto_5009 ) ) ( not ( = ?auto_5010 ?auto_5013 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5007 ?auto_5013 ?auto_5009 )
      ( MAKE-ON ?auto_5004 ?auto_5005 )
      ( MAKE-ON-VERIFY ?auto_5004 ?auto_5005 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5014 - SURFACE
      ?auto_5015 - SURFACE
    )
    :vars
    (
      ?auto_5023 - HOIST
      ?auto_5018 - PLACE
      ?auto_5022 - PLACE
      ?auto_5021 - HOIST
      ?auto_5020 - SURFACE
      ?auto_5017 - SURFACE
      ?auto_5019 - TRUCK
      ?auto_5016 - PLACE
      ?auto_5024 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5023 ?auto_5018 ) ( IS-CRATE ?auto_5014 ) ( not ( = ?auto_5014 ?auto_5015 ) ) ( not ( = ?auto_5022 ?auto_5018 ) ) ( HOIST-AT ?auto_5021 ?auto_5022 ) ( not ( = ?auto_5023 ?auto_5021 ) ) ( AVAILABLE ?auto_5021 ) ( SURFACE-AT ?auto_5014 ?auto_5022 ) ( ON ?auto_5014 ?auto_5020 ) ( CLEAR ?auto_5014 ) ( not ( = ?auto_5014 ?auto_5020 ) ) ( not ( = ?auto_5015 ?auto_5020 ) ) ( SURFACE-AT ?auto_5017 ?auto_5018 ) ( CLEAR ?auto_5017 ) ( IS-CRATE ?auto_5015 ) ( not ( = ?auto_5014 ?auto_5017 ) ) ( not ( = ?auto_5015 ?auto_5017 ) ) ( not ( = ?auto_5020 ?auto_5017 ) ) ( AVAILABLE ?auto_5023 ) ( TRUCK-AT ?auto_5019 ?auto_5016 ) ( not ( = ?auto_5016 ?auto_5018 ) ) ( not ( = ?auto_5022 ?auto_5016 ) ) ( HOIST-AT ?auto_5024 ?auto_5016 ) ( LIFTING ?auto_5024 ?auto_5015 ) ( not ( = ?auto_5023 ?auto_5024 ) ) ( not ( = ?auto_5021 ?auto_5024 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5024 ?auto_5015 ?auto_5019 ?auto_5016 )
      ( MAKE-ON ?auto_5014 ?auto_5015 )
      ( MAKE-ON-VERIFY ?auto_5014 ?auto_5015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5025 - SURFACE
      ?auto_5026 - SURFACE
    )
    :vars
    (
      ?auto_5030 - HOIST
      ?auto_5029 - PLACE
      ?auto_5032 - PLACE
      ?auto_5033 - HOIST
      ?auto_5035 - SURFACE
      ?auto_5034 - SURFACE
      ?auto_5031 - TRUCK
      ?auto_5028 - PLACE
      ?auto_5027 - HOIST
      ?auto_5036 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5030 ?auto_5029 ) ( IS-CRATE ?auto_5025 ) ( not ( = ?auto_5025 ?auto_5026 ) ) ( not ( = ?auto_5032 ?auto_5029 ) ) ( HOIST-AT ?auto_5033 ?auto_5032 ) ( not ( = ?auto_5030 ?auto_5033 ) ) ( AVAILABLE ?auto_5033 ) ( SURFACE-AT ?auto_5025 ?auto_5032 ) ( ON ?auto_5025 ?auto_5035 ) ( CLEAR ?auto_5025 ) ( not ( = ?auto_5025 ?auto_5035 ) ) ( not ( = ?auto_5026 ?auto_5035 ) ) ( SURFACE-AT ?auto_5034 ?auto_5029 ) ( CLEAR ?auto_5034 ) ( IS-CRATE ?auto_5026 ) ( not ( = ?auto_5025 ?auto_5034 ) ) ( not ( = ?auto_5026 ?auto_5034 ) ) ( not ( = ?auto_5035 ?auto_5034 ) ) ( AVAILABLE ?auto_5030 ) ( TRUCK-AT ?auto_5031 ?auto_5028 ) ( not ( = ?auto_5028 ?auto_5029 ) ) ( not ( = ?auto_5032 ?auto_5028 ) ) ( HOIST-AT ?auto_5027 ?auto_5028 ) ( not ( = ?auto_5030 ?auto_5027 ) ) ( not ( = ?auto_5033 ?auto_5027 ) ) ( AVAILABLE ?auto_5027 ) ( SURFACE-AT ?auto_5026 ?auto_5028 ) ( ON ?auto_5026 ?auto_5036 ) ( CLEAR ?auto_5026 ) ( not ( = ?auto_5025 ?auto_5036 ) ) ( not ( = ?auto_5026 ?auto_5036 ) ) ( not ( = ?auto_5035 ?auto_5036 ) ) ( not ( = ?auto_5034 ?auto_5036 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5027 ?auto_5026 ?auto_5036 ?auto_5028 )
      ( MAKE-ON ?auto_5025 ?auto_5026 )
      ( MAKE-ON-VERIFY ?auto_5025 ?auto_5026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5037 - SURFACE
      ?auto_5038 - SURFACE
    )
    :vars
    (
      ?auto_5045 - HOIST
      ?auto_5041 - PLACE
      ?auto_5047 - PLACE
      ?auto_5043 - HOIST
      ?auto_5040 - SURFACE
      ?auto_5044 - SURFACE
      ?auto_5046 - PLACE
      ?auto_5042 - HOIST
      ?auto_5048 - SURFACE
      ?auto_5039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5045 ?auto_5041 ) ( IS-CRATE ?auto_5037 ) ( not ( = ?auto_5037 ?auto_5038 ) ) ( not ( = ?auto_5047 ?auto_5041 ) ) ( HOIST-AT ?auto_5043 ?auto_5047 ) ( not ( = ?auto_5045 ?auto_5043 ) ) ( AVAILABLE ?auto_5043 ) ( SURFACE-AT ?auto_5037 ?auto_5047 ) ( ON ?auto_5037 ?auto_5040 ) ( CLEAR ?auto_5037 ) ( not ( = ?auto_5037 ?auto_5040 ) ) ( not ( = ?auto_5038 ?auto_5040 ) ) ( SURFACE-AT ?auto_5044 ?auto_5041 ) ( CLEAR ?auto_5044 ) ( IS-CRATE ?auto_5038 ) ( not ( = ?auto_5037 ?auto_5044 ) ) ( not ( = ?auto_5038 ?auto_5044 ) ) ( not ( = ?auto_5040 ?auto_5044 ) ) ( AVAILABLE ?auto_5045 ) ( not ( = ?auto_5046 ?auto_5041 ) ) ( not ( = ?auto_5047 ?auto_5046 ) ) ( HOIST-AT ?auto_5042 ?auto_5046 ) ( not ( = ?auto_5045 ?auto_5042 ) ) ( not ( = ?auto_5043 ?auto_5042 ) ) ( AVAILABLE ?auto_5042 ) ( SURFACE-AT ?auto_5038 ?auto_5046 ) ( ON ?auto_5038 ?auto_5048 ) ( CLEAR ?auto_5038 ) ( not ( = ?auto_5037 ?auto_5048 ) ) ( not ( = ?auto_5038 ?auto_5048 ) ) ( not ( = ?auto_5040 ?auto_5048 ) ) ( not ( = ?auto_5044 ?auto_5048 ) ) ( TRUCK-AT ?auto_5039 ?auto_5041 ) )
    :subtasks
    ( ( !DRIVE ?auto_5039 ?auto_5041 ?auto_5046 )
      ( MAKE-ON ?auto_5037 ?auto_5038 )
      ( MAKE-ON-VERIFY ?auto_5037 ?auto_5038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5049 - SURFACE
      ?auto_5050 - SURFACE
    )
    :vars
    (
      ?auto_5055 - HOIST
      ?auto_5052 - PLACE
      ?auto_5051 - PLACE
      ?auto_5056 - HOIST
      ?auto_5053 - SURFACE
      ?auto_5060 - SURFACE
      ?auto_5058 - PLACE
      ?auto_5057 - HOIST
      ?auto_5059 - SURFACE
      ?auto_5054 - TRUCK
      ?auto_5061 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5055 ?auto_5052 ) ( IS-CRATE ?auto_5049 ) ( not ( = ?auto_5049 ?auto_5050 ) ) ( not ( = ?auto_5051 ?auto_5052 ) ) ( HOIST-AT ?auto_5056 ?auto_5051 ) ( not ( = ?auto_5055 ?auto_5056 ) ) ( AVAILABLE ?auto_5056 ) ( SURFACE-AT ?auto_5049 ?auto_5051 ) ( ON ?auto_5049 ?auto_5053 ) ( CLEAR ?auto_5049 ) ( not ( = ?auto_5049 ?auto_5053 ) ) ( not ( = ?auto_5050 ?auto_5053 ) ) ( IS-CRATE ?auto_5050 ) ( not ( = ?auto_5049 ?auto_5060 ) ) ( not ( = ?auto_5050 ?auto_5060 ) ) ( not ( = ?auto_5053 ?auto_5060 ) ) ( not ( = ?auto_5058 ?auto_5052 ) ) ( not ( = ?auto_5051 ?auto_5058 ) ) ( HOIST-AT ?auto_5057 ?auto_5058 ) ( not ( = ?auto_5055 ?auto_5057 ) ) ( not ( = ?auto_5056 ?auto_5057 ) ) ( AVAILABLE ?auto_5057 ) ( SURFACE-AT ?auto_5050 ?auto_5058 ) ( ON ?auto_5050 ?auto_5059 ) ( CLEAR ?auto_5050 ) ( not ( = ?auto_5049 ?auto_5059 ) ) ( not ( = ?auto_5050 ?auto_5059 ) ) ( not ( = ?auto_5053 ?auto_5059 ) ) ( not ( = ?auto_5060 ?auto_5059 ) ) ( TRUCK-AT ?auto_5054 ?auto_5052 ) ( SURFACE-AT ?auto_5061 ?auto_5052 ) ( CLEAR ?auto_5061 ) ( LIFTING ?auto_5055 ?auto_5060 ) ( IS-CRATE ?auto_5060 ) ( not ( = ?auto_5049 ?auto_5061 ) ) ( not ( = ?auto_5050 ?auto_5061 ) ) ( not ( = ?auto_5053 ?auto_5061 ) ) ( not ( = ?auto_5060 ?auto_5061 ) ) ( not ( = ?auto_5059 ?auto_5061 ) ) )
    :subtasks
    ( ( !DROP ?auto_5055 ?auto_5060 ?auto_5061 ?auto_5052 )
      ( MAKE-ON ?auto_5049 ?auto_5050 )
      ( MAKE-ON-VERIFY ?auto_5049 ?auto_5050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5062 - SURFACE
      ?auto_5063 - SURFACE
    )
    :vars
    (
      ?auto_5071 - HOIST
      ?auto_5072 - PLACE
      ?auto_5074 - PLACE
      ?auto_5064 - HOIST
      ?auto_5066 - SURFACE
      ?auto_5068 - SURFACE
      ?auto_5067 - PLACE
      ?auto_5069 - HOIST
      ?auto_5065 - SURFACE
      ?auto_5070 - TRUCK
      ?auto_5073 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5071 ?auto_5072 ) ( IS-CRATE ?auto_5062 ) ( not ( = ?auto_5062 ?auto_5063 ) ) ( not ( = ?auto_5074 ?auto_5072 ) ) ( HOIST-AT ?auto_5064 ?auto_5074 ) ( not ( = ?auto_5071 ?auto_5064 ) ) ( AVAILABLE ?auto_5064 ) ( SURFACE-AT ?auto_5062 ?auto_5074 ) ( ON ?auto_5062 ?auto_5066 ) ( CLEAR ?auto_5062 ) ( not ( = ?auto_5062 ?auto_5066 ) ) ( not ( = ?auto_5063 ?auto_5066 ) ) ( IS-CRATE ?auto_5063 ) ( not ( = ?auto_5062 ?auto_5068 ) ) ( not ( = ?auto_5063 ?auto_5068 ) ) ( not ( = ?auto_5066 ?auto_5068 ) ) ( not ( = ?auto_5067 ?auto_5072 ) ) ( not ( = ?auto_5074 ?auto_5067 ) ) ( HOIST-AT ?auto_5069 ?auto_5067 ) ( not ( = ?auto_5071 ?auto_5069 ) ) ( not ( = ?auto_5064 ?auto_5069 ) ) ( AVAILABLE ?auto_5069 ) ( SURFACE-AT ?auto_5063 ?auto_5067 ) ( ON ?auto_5063 ?auto_5065 ) ( CLEAR ?auto_5063 ) ( not ( = ?auto_5062 ?auto_5065 ) ) ( not ( = ?auto_5063 ?auto_5065 ) ) ( not ( = ?auto_5066 ?auto_5065 ) ) ( not ( = ?auto_5068 ?auto_5065 ) ) ( TRUCK-AT ?auto_5070 ?auto_5072 ) ( SURFACE-AT ?auto_5073 ?auto_5072 ) ( CLEAR ?auto_5073 ) ( IS-CRATE ?auto_5068 ) ( not ( = ?auto_5062 ?auto_5073 ) ) ( not ( = ?auto_5063 ?auto_5073 ) ) ( not ( = ?auto_5066 ?auto_5073 ) ) ( not ( = ?auto_5068 ?auto_5073 ) ) ( not ( = ?auto_5065 ?auto_5073 ) ) ( AVAILABLE ?auto_5071 ) ( IN ?auto_5068 ?auto_5070 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5071 ?auto_5068 ?auto_5070 ?auto_5072 )
      ( MAKE-ON ?auto_5062 ?auto_5063 )
      ( MAKE-ON-VERIFY ?auto_5062 ?auto_5063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5075 - SURFACE
      ?auto_5076 - SURFACE
    )
    :vars
    (
      ?auto_5078 - HOIST
      ?auto_5086 - PLACE
      ?auto_5080 - PLACE
      ?auto_5082 - HOIST
      ?auto_5084 - SURFACE
      ?auto_5079 - SURFACE
      ?auto_5083 - PLACE
      ?auto_5081 - HOIST
      ?auto_5085 - SURFACE
      ?auto_5077 - SURFACE
      ?auto_5087 - TRUCK
      ?auto_5088 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5078 ?auto_5086 ) ( IS-CRATE ?auto_5075 ) ( not ( = ?auto_5075 ?auto_5076 ) ) ( not ( = ?auto_5080 ?auto_5086 ) ) ( HOIST-AT ?auto_5082 ?auto_5080 ) ( not ( = ?auto_5078 ?auto_5082 ) ) ( AVAILABLE ?auto_5082 ) ( SURFACE-AT ?auto_5075 ?auto_5080 ) ( ON ?auto_5075 ?auto_5084 ) ( CLEAR ?auto_5075 ) ( not ( = ?auto_5075 ?auto_5084 ) ) ( not ( = ?auto_5076 ?auto_5084 ) ) ( IS-CRATE ?auto_5076 ) ( not ( = ?auto_5075 ?auto_5079 ) ) ( not ( = ?auto_5076 ?auto_5079 ) ) ( not ( = ?auto_5084 ?auto_5079 ) ) ( not ( = ?auto_5083 ?auto_5086 ) ) ( not ( = ?auto_5080 ?auto_5083 ) ) ( HOIST-AT ?auto_5081 ?auto_5083 ) ( not ( = ?auto_5078 ?auto_5081 ) ) ( not ( = ?auto_5082 ?auto_5081 ) ) ( AVAILABLE ?auto_5081 ) ( SURFACE-AT ?auto_5076 ?auto_5083 ) ( ON ?auto_5076 ?auto_5085 ) ( CLEAR ?auto_5076 ) ( not ( = ?auto_5075 ?auto_5085 ) ) ( not ( = ?auto_5076 ?auto_5085 ) ) ( not ( = ?auto_5084 ?auto_5085 ) ) ( not ( = ?auto_5079 ?auto_5085 ) ) ( SURFACE-AT ?auto_5077 ?auto_5086 ) ( CLEAR ?auto_5077 ) ( IS-CRATE ?auto_5079 ) ( not ( = ?auto_5075 ?auto_5077 ) ) ( not ( = ?auto_5076 ?auto_5077 ) ) ( not ( = ?auto_5084 ?auto_5077 ) ) ( not ( = ?auto_5079 ?auto_5077 ) ) ( not ( = ?auto_5085 ?auto_5077 ) ) ( AVAILABLE ?auto_5078 ) ( IN ?auto_5079 ?auto_5087 ) ( TRUCK-AT ?auto_5087 ?auto_5088 ) ( not ( = ?auto_5088 ?auto_5086 ) ) ( not ( = ?auto_5080 ?auto_5088 ) ) ( not ( = ?auto_5083 ?auto_5088 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5087 ?auto_5088 ?auto_5086 )
      ( MAKE-ON ?auto_5075 ?auto_5076 )
      ( MAKE-ON-VERIFY ?auto_5075 ?auto_5076 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5089 - SURFACE
      ?auto_5090 - SURFACE
    )
    :vars
    (
      ?auto_5092 - HOIST
      ?auto_5101 - PLACE
      ?auto_5091 - PLACE
      ?auto_5099 - HOIST
      ?auto_5100 - SURFACE
      ?auto_5093 - SURFACE
      ?auto_5097 - PLACE
      ?auto_5094 - HOIST
      ?auto_5102 - SURFACE
      ?auto_5095 - SURFACE
      ?auto_5098 - TRUCK
      ?auto_5096 - PLACE
      ?auto_5103 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5092 ?auto_5101 ) ( IS-CRATE ?auto_5089 ) ( not ( = ?auto_5089 ?auto_5090 ) ) ( not ( = ?auto_5091 ?auto_5101 ) ) ( HOIST-AT ?auto_5099 ?auto_5091 ) ( not ( = ?auto_5092 ?auto_5099 ) ) ( AVAILABLE ?auto_5099 ) ( SURFACE-AT ?auto_5089 ?auto_5091 ) ( ON ?auto_5089 ?auto_5100 ) ( CLEAR ?auto_5089 ) ( not ( = ?auto_5089 ?auto_5100 ) ) ( not ( = ?auto_5090 ?auto_5100 ) ) ( IS-CRATE ?auto_5090 ) ( not ( = ?auto_5089 ?auto_5093 ) ) ( not ( = ?auto_5090 ?auto_5093 ) ) ( not ( = ?auto_5100 ?auto_5093 ) ) ( not ( = ?auto_5097 ?auto_5101 ) ) ( not ( = ?auto_5091 ?auto_5097 ) ) ( HOIST-AT ?auto_5094 ?auto_5097 ) ( not ( = ?auto_5092 ?auto_5094 ) ) ( not ( = ?auto_5099 ?auto_5094 ) ) ( AVAILABLE ?auto_5094 ) ( SURFACE-AT ?auto_5090 ?auto_5097 ) ( ON ?auto_5090 ?auto_5102 ) ( CLEAR ?auto_5090 ) ( not ( = ?auto_5089 ?auto_5102 ) ) ( not ( = ?auto_5090 ?auto_5102 ) ) ( not ( = ?auto_5100 ?auto_5102 ) ) ( not ( = ?auto_5093 ?auto_5102 ) ) ( SURFACE-AT ?auto_5095 ?auto_5101 ) ( CLEAR ?auto_5095 ) ( IS-CRATE ?auto_5093 ) ( not ( = ?auto_5089 ?auto_5095 ) ) ( not ( = ?auto_5090 ?auto_5095 ) ) ( not ( = ?auto_5100 ?auto_5095 ) ) ( not ( = ?auto_5093 ?auto_5095 ) ) ( not ( = ?auto_5102 ?auto_5095 ) ) ( AVAILABLE ?auto_5092 ) ( TRUCK-AT ?auto_5098 ?auto_5096 ) ( not ( = ?auto_5096 ?auto_5101 ) ) ( not ( = ?auto_5091 ?auto_5096 ) ) ( not ( = ?auto_5097 ?auto_5096 ) ) ( HOIST-AT ?auto_5103 ?auto_5096 ) ( LIFTING ?auto_5103 ?auto_5093 ) ( not ( = ?auto_5092 ?auto_5103 ) ) ( not ( = ?auto_5099 ?auto_5103 ) ) ( not ( = ?auto_5094 ?auto_5103 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5103 ?auto_5093 ?auto_5098 ?auto_5096 )
      ( MAKE-ON ?auto_5089 ?auto_5090 )
      ( MAKE-ON-VERIFY ?auto_5089 ?auto_5090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5104 - SURFACE
      ?auto_5105 - SURFACE
    )
    :vars
    (
      ?auto_5113 - HOIST
      ?auto_5110 - PLACE
      ?auto_5106 - PLACE
      ?auto_5116 - HOIST
      ?auto_5108 - SURFACE
      ?auto_5109 - SURFACE
      ?auto_5115 - PLACE
      ?auto_5111 - HOIST
      ?auto_5114 - SURFACE
      ?auto_5117 - SURFACE
      ?auto_5112 - TRUCK
      ?auto_5107 - PLACE
      ?auto_5118 - HOIST
      ?auto_5119 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5113 ?auto_5110 ) ( IS-CRATE ?auto_5104 ) ( not ( = ?auto_5104 ?auto_5105 ) ) ( not ( = ?auto_5106 ?auto_5110 ) ) ( HOIST-AT ?auto_5116 ?auto_5106 ) ( not ( = ?auto_5113 ?auto_5116 ) ) ( AVAILABLE ?auto_5116 ) ( SURFACE-AT ?auto_5104 ?auto_5106 ) ( ON ?auto_5104 ?auto_5108 ) ( CLEAR ?auto_5104 ) ( not ( = ?auto_5104 ?auto_5108 ) ) ( not ( = ?auto_5105 ?auto_5108 ) ) ( IS-CRATE ?auto_5105 ) ( not ( = ?auto_5104 ?auto_5109 ) ) ( not ( = ?auto_5105 ?auto_5109 ) ) ( not ( = ?auto_5108 ?auto_5109 ) ) ( not ( = ?auto_5115 ?auto_5110 ) ) ( not ( = ?auto_5106 ?auto_5115 ) ) ( HOIST-AT ?auto_5111 ?auto_5115 ) ( not ( = ?auto_5113 ?auto_5111 ) ) ( not ( = ?auto_5116 ?auto_5111 ) ) ( AVAILABLE ?auto_5111 ) ( SURFACE-AT ?auto_5105 ?auto_5115 ) ( ON ?auto_5105 ?auto_5114 ) ( CLEAR ?auto_5105 ) ( not ( = ?auto_5104 ?auto_5114 ) ) ( not ( = ?auto_5105 ?auto_5114 ) ) ( not ( = ?auto_5108 ?auto_5114 ) ) ( not ( = ?auto_5109 ?auto_5114 ) ) ( SURFACE-AT ?auto_5117 ?auto_5110 ) ( CLEAR ?auto_5117 ) ( IS-CRATE ?auto_5109 ) ( not ( = ?auto_5104 ?auto_5117 ) ) ( not ( = ?auto_5105 ?auto_5117 ) ) ( not ( = ?auto_5108 ?auto_5117 ) ) ( not ( = ?auto_5109 ?auto_5117 ) ) ( not ( = ?auto_5114 ?auto_5117 ) ) ( AVAILABLE ?auto_5113 ) ( TRUCK-AT ?auto_5112 ?auto_5107 ) ( not ( = ?auto_5107 ?auto_5110 ) ) ( not ( = ?auto_5106 ?auto_5107 ) ) ( not ( = ?auto_5115 ?auto_5107 ) ) ( HOIST-AT ?auto_5118 ?auto_5107 ) ( not ( = ?auto_5113 ?auto_5118 ) ) ( not ( = ?auto_5116 ?auto_5118 ) ) ( not ( = ?auto_5111 ?auto_5118 ) ) ( AVAILABLE ?auto_5118 ) ( SURFACE-AT ?auto_5109 ?auto_5107 ) ( ON ?auto_5109 ?auto_5119 ) ( CLEAR ?auto_5109 ) ( not ( = ?auto_5104 ?auto_5119 ) ) ( not ( = ?auto_5105 ?auto_5119 ) ) ( not ( = ?auto_5108 ?auto_5119 ) ) ( not ( = ?auto_5109 ?auto_5119 ) ) ( not ( = ?auto_5114 ?auto_5119 ) ) ( not ( = ?auto_5117 ?auto_5119 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5118 ?auto_5109 ?auto_5119 ?auto_5107 )
      ( MAKE-ON ?auto_5104 ?auto_5105 )
      ( MAKE-ON-VERIFY ?auto_5104 ?auto_5105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5120 - SURFACE
      ?auto_5121 - SURFACE
    )
    :vars
    (
      ?auto_5128 - HOIST
      ?auto_5132 - PLACE
      ?auto_5133 - PLACE
      ?auto_5130 - HOIST
      ?auto_5122 - SURFACE
      ?auto_5134 - SURFACE
      ?auto_5123 - PLACE
      ?auto_5126 - HOIST
      ?auto_5129 - SURFACE
      ?auto_5125 - SURFACE
      ?auto_5127 - PLACE
      ?auto_5131 - HOIST
      ?auto_5135 - SURFACE
      ?auto_5124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5128 ?auto_5132 ) ( IS-CRATE ?auto_5120 ) ( not ( = ?auto_5120 ?auto_5121 ) ) ( not ( = ?auto_5133 ?auto_5132 ) ) ( HOIST-AT ?auto_5130 ?auto_5133 ) ( not ( = ?auto_5128 ?auto_5130 ) ) ( AVAILABLE ?auto_5130 ) ( SURFACE-AT ?auto_5120 ?auto_5133 ) ( ON ?auto_5120 ?auto_5122 ) ( CLEAR ?auto_5120 ) ( not ( = ?auto_5120 ?auto_5122 ) ) ( not ( = ?auto_5121 ?auto_5122 ) ) ( IS-CRATE ?auto_5121 ) ( not ( = ?auto_5120 ?auto_5134 ) ) ( not ( = ?auto_5121 ?auto_5134 ) ) ( not ( = ?auto_5122 ?auto_5134 ) ) ( not ( = ?auto_5123 ?auto_5132 ) ) ( not ( = ?auto_5133 ?auto_5123 ) ) ( HOIST-AT ?auto_5126 ?auto_5123 ) ( not ( = ?auto_5128 ?auto_5126 ) ) ( not ( = ?auto_5130 ?auto_5126 ) ) ( AVAILABLE ?auto_5126 ) ( SURFACE-AT ?auto_5121 ?auto_5123 ) ( ON ?auto_5121 ?auto_5129 ) ( CLEAR ?auto_5121 ) ( not ( = ?auto_5120 ?auto_5129 ) ) ( not ( = ?auto_5121 ?auto_5129 ) ) ( not ( = ?auto_5122 ?auto_5129 ) ) ( not ( = ?auto_5134 ?auto_5129 ) ) ( SURFACE-AT ?auto_5125 ?auto_5132 ) ( CLEAR ?auto_5125 ) ( IS-CRATE ?auto_5134 ) ( not ( = ?auto_5120 ?auto_5125 ) ) ( not ( = ?auto_5121 ?auto_5125 ) ) ( not ( = ?auto_5122 ?auto_5125 ) ) ( not ( = ?auto_5134 ?auto_5125 ) ) ( not ( = ?auto_5129 ?auto_5125 ) ) ( AVAILABLE ?auto_5128 ) ( not ( = ?auto_5127 ?auto_5132 ) ) ( not ( = ?auto_5133 ?auto_5127 ) ) ( not ( = ?auto_5123 ?auto_5127 ) ) ( HOIST-AT ?auto_5131 ?auto_5127 ) ( not ( = ?auto_5128 ?auto_5131 ) ) ( not ( = ?auto_5130 ?auto_5131 ) ) ( not ( = ?auto_5126 ?auto_5131 ) ) ( AVAILABLE ?auto_5131 ) ( SURFACE-AT ?auto_5134 ?auto_5127 ) ( ON ?auto_5134 ?auto_5135 ) ( CLEAR ?auto_5134 ) ( not ( = ?auto_5120 ?auto_5135 ) ) ( not ( = ?auto_5121 ?auto_5135 ) ) ( not ( = ?auto_5122 ?auto_5135 ) ) ( not ( = ?auto_5134 ?auto_5135 ) ) ( not ( = ?auto_5129 ?auto_5135 ) ) ( not ( = ?auto_5125 ?auto_5135 ) ) ( TRUCK-AT ?auto_5124 ?auto_5132 ) )
    :subtasks
    ( ( !DRIVE ?auto_5124 ?auto_5132 ?auto_5127 )
      ( MAKE-ON ?auto_5120 ?auto_5121 )
      ( MAKE-ON-VERIFY ?auto_5120 ?auto_5121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5138 - SURFACE
      ?auto_5139 - SURFACE
    )
    :vars
    (
      ?auto_5140 - HOIST
      ?auto_5141 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5140 ?auto_5141 ) ( SURFACE-AT ?auto_5139 ?auto_5141 ) ( CLEAR ?auto_5139 ) ( LIFTING ?auto_5140 ?auto_5138 ) ( IS-CRATE ?auto_5138 ) ( not ( = ?auto_5138 ?auto_5139 ) ) )
    :subtasks
    ( ( !DROP ?auto_5140 ?auto_5138 ?auto_5139 ?auto_5141 )
      ( MAKE-ON-VERIFY ?auto_5138 ?auto_5139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5142 - SURFACE
      ?auto_5143 - SURFACE
    )
    :vars
    (
      ?auto_5145 - HOIST
      ?auto_5144 - PLACE
      ?auto_5146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5145 ?auto_5144 ) ( SURFACE-AT ?auto_5143 ?auto_5144 ) ( CLEAR ?auto_5143 ) ( IS-CRATE ?auto_5142 ) ( not ( = ?auto_5142 ?auto_5143 ) ) ( TRUCK-AT ?auto_5146 ?auto_5144 ) ( AVAILABLE ?auto_5145 ) ( IN ?auto_5142 ?auto_5146 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5145 ?auto_5142 ?auto_5146 ?auto_5144 )
      ( MAKE-ON ?auto_5142 ?auto_5143 )
      ( MAKE-ON-VERIFY ?auto_5142 ?auto_5143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5147 - SURFACE
      ?auto_5148 - SURFACE
    )
    :vars
    (
      ?auto_5150 - HOIST
      ?auto_5151 - PLACE
      ?auto_5149 - TRUCK
      ?auto_5152 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5150 ?auto_5151 ) ( SURFACE-AT ?auto_5148 ?auto_5151 ) ( CLEAR ?auto_5148 ) ( IS-CRATE ?auto_5147 ) ( not ( = ?auto_5147 ?auto_5148 ) ) ( AVAILABLE ?auto_5150 ) ( IN ?auto_5147 ?auto_5149 ) ( TRUCK-AT ?auto_5149 ?auto_5152 ) ( not ( = ?auto_5152 ?auto_5151 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5149 ?auto_5152 ?auto_5151 )
      ( MAKE-ON ?auto_5147 ?auto_5148 )
      ( MAKE-ON-VERIFY ?auto_5147 ?auto_5148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5153 - SURFACE
      ?auto_5154 - SURFACE
    )
    :vars
    (
      ?auto_5158 - HOIST
      ?auto_5155 - PLACE
      ?auto_5157 - TRUCK
      ?auto_5156 - PLACE
      ?auto_5159 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5158 ?auto_5155 ) ( SURFACE-AT ?auto_5154 ?auto_5155 ) ( CLEAR ?auto_5154 ) ( IS-CRATE ?auto_5153 ) ( not ( = ?auto_5153 ?auto_5154 ) ) ( AVAILABLE ?auto_5158 ) ( TRUCK-AT ?auto_5157 ?auto_5156 ) ( not ( = ?auto_5156 ?auto_5155 ) ) ( HOIST-AT ?auto_5159 ?auto_5156 ) ( LIFTING ?auto_5159 ?auto_5153 ) ( not ( = ?auto_5158 ?auto_5159 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5159 ?auto_5153 ?auto_5157 ?auto_5156 )
      ( MAKE-ON ?auto_5153 ?auto_5154 )
      ( MAKE-ON-VERIFY ?auto_5153 ?auto_5154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5160 - SURFACE
      ?auto_5161 - SURFACE
    )
    :vars
    (
      ?auto_5166 - HOIST
      ?auto_5165 - PLACE
      ?auto_5162 - TRUCK
      ?auto_5163 - PLACE
      ?auto_5164 - HOIST
      ?auto_5167 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5166 ?auto_5165 ) ( SURFACE-AT ?auto_5161 ?auto_5165 ) ( CLEAR ?auto_5161 ) ( IS-CRATE ?auto_5160 ) ( not ( = ?auto_5160 ?auto_5161 ) ) ( AVAILABLE ?auto_5166 ) ( TRUCK-AT ?auto_5162 ?auto_5163 ) ( not ( = ?auto_5163 ?auto_5165 ) ) ( HOIST-AT ?auto_5164 ?auto_5163 ) ( not ( = ?auto_5166 ?auto_5164 ) ) ( AVAILABLE ?auto_5164 ) ( SURFACE-AT ?auto_5160 ?auto_5163 ) ( ON ?auto_5160 ?auto_5167 ) ( CLEAR ?auto_5160 ) ( not ( = ?auto_5160 ?auto_5167 ) ) ( not ( = ?auto_5161 ?auto_5167 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5164 ?auto_5160 ?auto_5167 ?auto_5163 )
      ( MAKE-ON ?auto_5160 ?auto_5161 )
      ( MAKE-ON-VERIFY ?auto_5160 ?auto_5161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5168 - SURFACE
      ?auto_5169 - SURFACE
    )
    :vars
    (
      ?auto_5172 - HOIST
      ?auto_5175 - PLACE
      ?auto_5174 - PLACE
      ?auto_5173 - HOIST
      ?auto_5171 - SURFACE
      ?auto_5170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5172 ?auto_5175 ) ( SURFACE-AT ?auto_5169 ?auto_5175 ) ( CLEAR ?auto_5169 ) ( IS-CRATE ?auto_5168 ) ( not ( = ?auto_5168 ?auto_5169 ) ) ( AVAILABLE ?auto_5172 ) ( not ( = ?auto_5174 ?auto_5175 ) ) ( HOIST-AT ?auto_5173 ?auto_5174 ) ( not ( = ?auto_5172 ?auto_5173 ) ) ( AVAILABLE ?auto_5173 ) ( SURFACE-AT ?auto_5168 ?auto_5174 ) ( ON ?auto_5168 ?auto_5171 ) ( CLEAR ?auto_5168 ) ( not ( = ?auto_5168 ?auto_5171 ) ) ( not ( = ?auto_5169 ?auto_5171 ) ) ( TRUCK-AT ?auto_5170 ?auto_5175 ) )
    :subtasks
    ( ( !DRIVE ?auto_5170 ?auto_5175 ?auto_5174 )
      ( MAKE-ON ?auto_5168 ?auto_5169 )
      ( MAKE-ON-VERIFY ?auto_5168 ?auto_5169 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5176 - SURFACE
      ?auto_5177 - SURFACE
    )
    :vars
    (
      ?auto_5178 - HOIST
      ?auto_5179 - PLACE
      ?auto_5183 - PLACE
      ?auto_5182 - HOIST
      ?auto_5181 - SURFACE
      ?auto_5180 - TRUCK
      ?auto_5184 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5178 ?auto_5179 ) ( IS-CRATE ?auto_5176 ) ( not ( = ?auto_5176 ?auto_5177 ) ) ( not ( = ?auto_5183 ?auto_5179 ) ) ( HOIST-AT ?auto_5182 ?auto_5183 ) ( not ( = ?auto_5178 ?auto_5182 ) ) ( AVAILABLE ?auto_5182 ) ( SURFACE-AT ?auto_5176 ?auto_5183 ) ( ON ?auto_5176 ?auto_5181 ) ( CLEAR ?auto_5176 ) ( not ( = ?auto_5176 ?auto_5181 ) ) ( not ( = ?auto_5177 ?auto_5181 ) ) ( TRUCK-AT ?auto_5180 ?auto_5179 ) ( SURFACE-AT ?auto_5184 ?auto_5179 ) ( CLEAR ?auto_5184 ) ( LIFTING ?auto_5178 ?auto_5177 ) ( IS-CRATE ?auto_5177 ) ( not ( = ?auto_5176 ?auto_5184 ) ) ( not ( = ?auto_5177 ?auto_5184 ) ) ( not ( = ?auto_5181 ?auto_5184 ) ) )
    :subtasks
    ( ( !DROP ?auto_5178 ?auto_5177 ?auto_5184 ?auto_5179 )
      ( MAKE-ON ?auto_5176 ?auto_5177 )
      ( MAKE-ON-VERIFY ?auto_5176 ?auto_5177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5185 - SURFACE
      ?auto_5186 - SURFACE
    )
    :vars
    (
      ?auto_5189 - HOIST
      ?auto_5191 - PLACE
      ?auto_5192 - PLACE
      ?auto_5190 - HOIST
      ?auto_5188 - SURFACE
      ?auto_5187 - TRUCK
      ?auto_5193 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5189 ?auto_5191 ) ( IS-CRATE ?auto_5185 ) ( not ( = ?auto_5185 ?auto_5186 ) ) ( not ( = ?auto_5192 ?auto_5191 ) ) ( HOIST-AT ?auto_5190 ?auto_5192 ) ( not ( = ?auto_5189 ?auto_5190 ) ) ( AVAILABLE ?auto_5190 ) ( SURFACE-AT ?auto_5185 ?auto_5192 ) ( ON ?auto_5185 ?auto_5188 ) ( CLEAR ?auto_5185 ) ( not ( = ?auto_5185 ?auto_5188 ) ) ( not ( = ?auto_5186 ?auto_5188 ) ) ( TRUCK-AT ?auto_5187 ?auto_5191 ) ( SURFACE-AT ?auto_5193 ?auto_5191 ) ( CLEAR ?auto_5193 ) ( IS-CRATE ?auto_5186 ) ( not ( = ?auto_5185 ?auto_5193 ) ) ( not ( = ?auto_5186 ?auto_5193 ) ) ( not ( = ?auto_5188 ?auto_5193 ) ) ( AVAILABLE ?auto_5189 ) ( IN ?auto_5186 ?auto_5187 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5189 ?auto_5186 ?auto_5187 ?auto_5191 )
      ( MAKE-ON ?auto_5185 ?auto_5186 )
      ( MAKE-ON-VERIFY ?auto_5185 ?auto_5186 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5194 - SURFACE
      ?auto_5195 - SURFACE
    )
    :vars
    (
      ?auto_5196 - HOIST
      ?auto_5201 - PLACE
      ?auto_5197 - PLACE
      ?auto_5198 - HOIST
      ?auto_5200 - SURFACE
      ?auto_5202 - SURFACE
      ?auto_5199 - TRUCK
      ?auto_5203 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5196 ?auto_5201 ) ( IS-CRATE ?auto_5194 ) ( not ( = ?auto_5194 ?auto_5195 ) ) ( not ( = ?auto_5197 ?auto_5201 ) ) ( HOIST-AT ?auto_5198 ?auto_5197 ) ( not ( = ?auto_5196 ?auto_5198 ) ) ( AVAILABLE ?auto_5198 ) ( SURFACE-AT ?auto_5194 ?auto_5197 ) ( ON ?auto_5194 ?auto_5200 ) ( CLEAR ?auto_5194 ) ( not ( = ?auto_5194 ?auto_5200 ) ) ( not ( = ?auto_5195 ?auto_5200 ) ) ( SURFACE-AT ?auto_5202 ?auto_5201 ) ( CLEAR ?auto_5202 ) ( IS-CRATE ?auto_5195 ) ( not ( = ?auto_5194 ?auto_5202 ) ) ( not ( = ?auto_5195 ?auto_5202 ) ) ( not ( = ?auto_5200 ?auto_5202 ) ) ( AVAILABLE ?auto_5196 ) ( IN ?auto_5195 ?auto_5199 ) ( TRUCK-AT ?auto_5199 ?auto_5203 ) ( not ( = ?auto_5203 ?auto_5201 ) ) ( not ( = ?auto_5197 ?auto_5203 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5199 ?auto_5203 ?auto_5201 )
      ( MAKE-ON ?auto_5194 ?auto_5195 )
      ( MAKE-ON-VERIFY ?auto_5194 ?auto_5195 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5204 - SURFACE
      ?auto_5205 - SURFACE
    )
    :vars
    (
      ?auto_5212 - HOIST
      ?auto_5206 - PLACE
      ?auto_5210 - PLACE
      ?auto_5208 - HOIST
      ?auto_5211 - SURFACE
      ?auto_5207 - SURFACE
      ?auto_5209 - TRUCK
      ?auto_5213 - PLACE
      ?auto_5214 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5212 ?auto_5206 ) ( IS-CRATE ?auto_5204 ) ( not ( = ?auto_5204 ?auto_5205 ) ) ( not ( = ?auto_5210 ?auto_5206 ) ) ( HOIST-AT ?auto_5208 ?auto_5210 ) ( not ( = ?auto_5212 ?auto_5208 ) ) ( AVAILABLE ?auto_5208 ) ( SURFACE-AT ?auto_5204 ?auto_5210 ) ( ON ?auto_5204 ?auto_5211 ) ( CLEAR ?auto_5204 ) ( not ( = ?auto_5204 ?auto_5211 ) ) ( not ( = ?auto_5205 ?auto_5211 ) ) ( SURFACE-AT ?auto_5207 ?auto_5206 ) ( CLEAR ?auto_5207 ) ( IS-CRATE ?auto_5205 ) ( not ( = ?auto_5204 ?auto_5207 ) ) ( not ( = ?auto_5205 ?auto_5207 ) ) ( not ( = ?auto_5211 ?auto_5207 ) ) ( AVAILABLE ?auto_5212 ) ( TRUCK-AT ?auto_5209 ?auto_5213 ) ( not ( = ?auto_5213 ?auto_5206 ) ) ( not ( = ?auto_5210 ?auto_5213 ) ) ( HOIST-AT ?auto_5214 ?auto_5213 ) ( LIFTING ?auto_5214 ?auto_5205 ) ( not ( = ?auto_5212 ?auto_5214 ) ) ( not ( = ?auto_5208 ?auto_5214 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5214 ?auto_5205 ?auto_5209 ?auto_5213 )
      ( MAKE-ON ?auto_5204 ?auto_5205 )
      ( MAKE-ON-VERIFY ?auto_5204 ?auto_5205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5215 - SURFACE
      ?auto_5216 - SURFACE
    )
    :vars
    (
      ?auto_5222 - HOIST
      ?auto_5218 - PLACE
      ?auto_5224 - PLACE
      ?auto_5219 - HOIST
      ?auto_5220 - SURFACE
      ?auto_5225 - SURFACE
      ?auto_5223 - TRUCK
      ?auto_5221 - PLACE
      ?auto_5217 - HOIST
      ?auto_5226 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5222 ?auto_5218 ) ( IS-CRATE ?auto_5215 ) ( not ( = ?auto_5215 ?auto_5216 ) ) ( not ( = ?auto_5224 ?auto_5218 ) ) ( HOIST-AT ?auto_5219 ?auto_5224 ) ( not ( = ?auto_5222 ?auto_5219 ) ) ( AVAILABLE ?auto_5219 ) ( SURFACE-AT ?auto_5215 ?auto_5224 ) ( ON ?auto_5215 ?auto_5220 ) ( CLEAR ?auto_5215 ) ( not ( = ?auto_5215 ?auto_5220 ) ) ( not ( = ?auto_5216 ?auto_5220 ) ) ( SURFACE-AT ?auto_5225 ?auto_5218 ) ( CLEAR ?auto_5225 ) ( IS-CRATE ?auto_5216 ) ( not ( = ?auto_5215 ?auto_5225 ) ) ( not ( = ?auto_5216 ?auto_5225 ) ) ( not ( = ?auto_5220 ?auto_5225 ) ) ( AVAILABLE ?auto_5222 ) ( TRUCK-AT ?auto_5223 ?auto_5221 ) ( not ( = ?auto_5221 ?auto_5218 ) ) ( not ( = ?auto_5224 ?auto_5221 ) ) ( HOIST-AT ?auto_5217 ?auto_5221 ) ( not ( = ?auto_5222 ?auto_5217 ) ) ( not ( = ?auto_5219 ?auto_5217 ) ) ( AVAILABLE ?auto_5217 ) ( SURFACE-AT ?auto_5216 ?auto_5221 ) ( ON ?auto_5216 ?auto_5226 ) ( CLEAR ?auto_5216 ) ( not ( = ?auto_5215 ?auto_5226 ) ) ( not ( = ?auto_5216 ?auto_5226 ) ) ( not ( = ?auto_5220 ?auto_5226 ) ) ( not ( = ?auto_5225 ?auto_5226 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5217 ?auto_5216 ?auto_5226 ?auto_5221 )
      ( MAKE-ON ?auto_5215 ?auto_5216 )
      ( MAKE-ON-VERIFY ?auto_5215 ?auto_5216 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5227 - SURFACE
      ?auto_5228 - SURFACE
    )
    :vars
    (
      ?auto_5235 - HOIST
      ?auto_5232 - PLACE
      ?auto_5231 - PLACE
      ?auto_5233 - HOIST
      ?auto_5237 - SURFACE
      ?auto_5234 - SURFACE
      ?auto_5238 - PLACE
      ?auto_5229 - HOIST
      ?auto_5230 - SURFACE
      ?auto_5236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5235 ?auto_5232 ) ( IS-CRATE ?auto_5227 ) ( not ( = ?auto_5227 ?auto_5228 ) ) ( not ( = ?auto_5231 ?auto_5232 ) ) ( HOIST-AT ?auto_5233 ?auto_5231 ) ( not ( = ?auto_5235 ?auto_5233 ) ) ( AVAILABLE ?auto_5233 ) ( SURFACE-AT ?auto_5227 ?auto_5231 ) ( ON ?auto_5227 ?auto_5237 ) ( CLEAR ?auto_5227 ) ( not ( = ?auto_5227 ?auto_5237 ) ) ( not ( = ?auto_5228 ?auto_5237 ) ) ( SURFACE-AT ?auto_5234 ?auto_5232 ) ( CLEAR ?auto_5234 ) ( IS-CRATE ?auto_5228 ) ( not ( = ?auto_5227 ?auto_5234 ) ) ( not ( = ?auto_5228 ?auto_5234 ) ) ( not ( = ?auto_5237 ?auto_5234 ) ) ( AVAILABLE ?auto_5235 ) ( not ( = ?auto_5238 ?auto_5232 ) ) ( not ( = ?auto_5231 ?auto_5238 ) ) ( HOIST-AT ?auto_5229 ?auto_5238 ) ( not ( = ?auto_5235 ?auto_5229 ) ) ( not ( = ?auto_5233 ?auto_5229 ) ) ( AVAILABLE ?auto_5229 ) ( SURFACE-AT ?auto_5228 ?auto_5238 ) ( ON ?auto_5228 ?auto_5230 ) ( CLEAR ?auto_5228 ) ( not ( = ?auto_5227 ?auto_5230 ) ) ( not ( = ?auto_5228 ?auto_5230 ) ) ( not ( = ?auto_5237 ?auto_5230 ) ) ( not ( = ?auto_5234 ?auto_5230 ) ) ( TRUCK-AT ?auto_5236 ?auto_5232 ) )
    :subtasks
    ( ( !DRIVE ?auto_5236 ?auto_5232 ?auto_5238 )
      ( MAKE-ON ?auto_5227 ?auto_5228 )
      ( MAKE-ON-VERIFY ?auto_5227 ?auto_5228 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5239 - SURFACE
      ?auto_5240 - SURFACE
    )
    :vars
    (
      ?auto_5250 - HOIST
      ?auto_5247 - PLACE
      ?auto_5241 - PLACE
      ?auto_5248 - HOIST
      ?auto_5245 - SURFACE
      ?auto_5249 - SURFACE
      ?auto_5243 - PLACE
      ?auto_5244 - HOIST
      ?auto_5242 - SURFACE
      ?auto_5246 - TRUCK
      ?auto_5251 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5250 ?auto_5247 ) ( IS-CRATE ?auto_5239 ) ( not ( = ?auto_5239 ?auto_5240 ) ) ( not ( = ?auto_5241 ?auto_5247 ) ) ( HOIST-AT ?auto_5248 ?auto_5241 ) ( not ( = ?auto_5250 ?auto_5248 ) ) ( AVAILABLE ?auto_5248 ) ( SURFACE-AT ?auto_5239 ?auto_5241 ) ( ON ?auto_5239 ?auto_5245 ) ( CLEAR ?auto_5239 ) ( not ( = ?auto_5239 ?auto_5245 ) ) ( not ( = ?auto_5240 ?auto_5245 ) ) ( IS-CRATE ?auto_5240 ) ( not ( = ?auto_5239 ?auto_5249 ) ) ( not ( = ?auto_5240 ?auto_5249 ) ) ( not ( = ?auto_5245 ?auto_5249 ) ) ( not ( = ?auto_5243 ?auto_5247 ) ) ( not ( = ?auto_5241 ?auto_5243 ) ) ( HOIST-AT ?auto_5244 ?auto_5243 ) ( not ( = ?auto_5250 ?auto_5244 ) ) ( not ( = ?auto_5248 ?auto_5244 ) ) ( AVAILABLE ?auto_5244 ) ( SURFACE-AT ?auto_5240 ?auto_5243 ) ( ON ?auto_5240 ?auto_5242 ) ( CLEAR ?auto_5240 ) ( not ( = ?auto_5239 ?auto_5242 ) ) ( not ( = ?auto_5240 ?auto_5242 ) ) ( not ( = ?auto_5245 ?auto_5242 ) ) ( not ( = ?auto_5249 ?auto_5242 ) ) ( TRUCK-AT ?auto_5246 ?auto_5247 ) ( SURFACE-AT ?auto_5251 ?auto_5247 ) ( CLEAR ?auto_5251 ) ( LIFTING ?auto_5250 ?auto_5249 ) ( IS-CRATE ?auto_5249 ) ( not ( = ?auto_5239 ?auto_5251 ) ) ( not ( = ?auto_5240 ?auto_5251 ) ) ( not ( = ?auto_5245 ?auto_5251 ) ) ( not ( = ?auto_5249 ?auto_5251 ) ) ( not ( = ?auto_5242 ?auto_5251 ) ) )
    :subtasks
    ( ( !DROP ?auto_5250 ?auto_5249 ?auto_5251 ?auto_5247 )
      ( MAKE-ON ?auto_5239 ?auto_5240 )
      ( MAKE-ON-VERIFY ?auto_5239 ?auto_5240 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5252 - SURFACE
      ?auto_5253 - SURFACE
    )
    :vars
    (
      ?auto_5255 - HOIST
      ?auto_5256 - PLACE
      ?auto_5264 - PLACE
      ?auto_5254 - HOIST
      ?auto_5262 - SURFACE
      ?auto_5263 - SURFACE
      ?auto_5258 - PLACE
      ?auto_5259 - HOIST
      ?auto_5261 - SURFACE
      ?auto_5260 - TRUCK
      ?auto_5257 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5255 ?auto_5256 ) ( IS-CRATE ?auto_5252 ) ( not ( = ?auto_5252 ?auto_5253 ) ) ( not ( = ?auto_5264 ?auto_5256 ) ) ( HOIST-AT ?auto_5254 ?auto_5264 ) ( not ( = ?auto_5255 ?auto_5254 ) ) ( AVAILABLE ?auto_5254 ) ( SURFACE-AT ?auto_5252 ?auto_5264 ) ( ON ?auto_5252 ?auto_5262 ) ( CLEAR ?auto_5252 ) ( not ( = ?auto_5252 ?auto_5262 ) ) ( not ( = ?auto_5253 ?auto_5262 ) ) ( IS-CRATE ?auto_5253 ) ( not ( = ?auto_5252 ?auto_5263 ) ) ( not ( = ?auto_5253 ?auto_5263 ) ) ( not ( = ?auto_5262 ?auto_5263 ) ) ( not ( = ?auto_5258 ?auto_5256 ) ) ( not ( = ?auto_5264 ?auto_5258 ) ) ( HOIST-AT ?auto_5259 ?auto_5258 ) ( not ( = ?auto_5255 ?auto_5259 ) ) ( not ( = ?auto_5254 ?auto_5259 ) ) ( AVAILABLE ?auto_5259 ) ( SURFACE-AT ?auto_5253 ?auto_5258 ) ( ON ?auto_5253 ?auto_5261 ) ( CLEAR ?auto_5253 ) ( not ( = ?auto_5252 ?auto_5261 ) ) ( not ( = ?auto_5253 ?auto_5261 ) ) ( not ( = ?auto_5262 ?auto_5261 ) ) ( not ( = ?auto_5263 ?auto_5261 ) ) ( TRUCK-AT ?auto_5260 ?auto_5256 ) ( SURFACE-AT ?auto_5257 ?auto_5256 ) ( CLEAR ?auto_5257 ) ( IS-CRATE ?auto_5263 ) ( not ( = ?auto_5252 ?auto_5257 ) ) ( not ( = ?auto_5253 ?auto_5257 ) ) ( not ( = ?auto_5262 ?auto_5257 ) ) ( not ( = ?auto_5263 ?auto_5257 ) ) ( not ( = ?auto_5261 ?auto_5257 ) ) ( AVAILABLE ?auto_5255 ) ( IN ?auto_5263 ?auto_5260 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5255 ?auto_5263 ?auto_5260 ?auto_5256 )
      ( MAKE-ON ?auto_5252 ?auto_5253 )
      ( MAKE-ON-VERIFY ?auto_5252 ?auto_5253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5265 - SURFACE
      ?auto_5266 - SURFACE
    )
    :vars
    (
      ?auto_5268 - HOIST
      ?auto_5272 - PLACE
      ?auto_5275 - PLACE
      ?auto_5270 - HOIST
      ?auto_5269 - SURFACE
      ?auto_5274 - SURFACE
      ?auto_5276 - PLACE
      ?auto_5271 - HOIST
      ?auto_5273 - SURFACE
      ?auto_5267 - SURFACE
      ?auto_5277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5268 ?auto_5272 ) ( IS-CRATE ?auto_5265 ) ( not ( = ?auto_5265 ?auto_5266 ) ) ( not ( = ?auto_5275 ?auto_5272 ) ) ( HOIST-AT ?auto_5270 ?auto_5275 ) ( not ( = ?auto_5268 ?auto_5270 ) ) ( AVAILABLE ?auto_5270 ) ( SURFACE-AT ?auto_5265 ?auto_5275 ) ( ON ?auto_5265 ?auto_5269 ) ( CLEAR ?auto_5265 ) ( not ( = ?auto_5265 ?auto_5269 ) ) ( not ( = ?auto_5266 ?auto_5269 ) ) ( IS-CRATE ?auto_5266 ) ( not ( = ?auto_5265 ?auto_5274 ) ) ( not ( = ?auto_5266 ?auto_5274 ) ) ( not ( = ?auto_5269 ?auto_5274 ) ) ( not ( = ?auto_5276 ?auto_5272 ) ) ( not ( = ?auto_5275 ?auto_5276 ) ) ( HOIST-AT ?auto_5271 ?auto_5276 ) ( not ( = ?auto_5268 ?auto_5271 ) ) ( not ( = ?auto_5270 ?auto_5271 ) ) ( AVAILABLE ?auto_5271 ) ( SURFACE-AT ?auto_5266 ?auto_5276 ) ( ON ?auto_5266 ?auto_5273 ) ( CLEAR ?auto_5266 ) ( not ( = ?auto_5265 ?auto_5273 ) ) ( not ( = ?auto_5266 ?auto_5273 ) ) ( not ( = ?auto_5269 ?auto_5273 ) ) ( not ( = ?auto_5274 ?auto_5273 ) ) ( SURFACE-AT ?auto_5267 ?auto_5272 ) ( CLEAR ?auto_5267 ) ( IS-CRATE ?auto_5274 ) ( not ( = ?auto_5265 ?auto_5267 ) ) ( not ( = ?auto_5266 ?auto_5267 ) ) ( not ( = ?auto_5269 ?auto_5267 ) ) ( not ( = ?auto_5274 ?auto_5267 ) ) ( not ( = ?auto_5273 ?auto_5267 ) ) ( AVAILABLE ?auto_5268 ) ( IN ?auto_5274 ?auto_5277 ) ( TRUCK-AT ?auto_5277 ?auto_5275 ) )
    :subtasks
    ( ( !DRIVE ?auto_5277 ?auto_5275 ?auto_5272 )
      ( MAKE-ON ?auto_5265 ?auto_5266 )
      ( MAKE-ON-VERIFY ?auto_5265 ?auto_5266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5278 - SURFACE
      ?auto_5279 - SURFACE
    )
    :vars
    (
      ?auto_5287 - HOIST
      ?auto_5282 - PLACE
      ?auto_5284 - PLACE
      ?auto_5280 - HOIST
      ?auto_5286 - SURFACE
      ?auto_5290 - SURFACE
      ?auto_5281 - PLACE
      ?auto_5283 - HOIST
      ?auto_5288 - SURFACE
      ?auto_5289 - SURFACE
      ?auto_5285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5287 ?auto_5282 ) ( IS-CRATE ?auto_5278 ) ( not ( = ?auto_5278 ?auto_5279 ) ) ( not ( = ?auto_5284 ?auto_5282 ) ) ( HOIST-AT ?auto_5280 ?auto_5284 ) ( not ( = ?auto_5287 ?auto_5280 ) ) ( SURFACE-AT ?auto_5278 ?auto_5284 ) ( ON ?auto_5278 ?auto_5286 ) ( CLEAR ?auto_5278 ) ( not ( = ?auto_5278 ?auto_5286 ) ) ( not ( = ?auto_5279 ?auto_5286 ) ) ( IS-CRATE ?auto_5279 ) ( not ( = ?auto_5278 ?auto_5290 ) ) ( not ( = ?auto_5279 ?auto_5290 ) ) ( not ( = ?auto_5286 ?auto_5290 ) ) ( not ( = ?auto_5281 ?auto_5282 ) ) ( not ( = ?auto_5284 ?auto_5281 ) ) ( HOIST-AT ?auto_5283 ?auto_5281 ) ( not ( = ?auto_5287 ?auto_5283 ) ) ( not ( = ?auto_5280 ?auto_5283 ) ) ( AVAILABLE ?auto_5283 ) ( SURFACE-AT ?auto_5279 ?auto_5281 ) ( ON ?auto_5279 ?auto_5288 ) ( CLEAR ?auto_5279 ) ( not ( = ?auto_5278 ?auto_5288 ) ) ( not ( = ?auto_5279 ?auto_5288 ) ) ( not ( = ?auto_5286 ?auto_5288 ) ) ( not ( = ?auto_5290 ?auto_5288 ) ) ( SURFACE-AT ?auto_5289 ?auto_5282 ) ( CLEAR ?auto_5289 ) ( IS-CRATE ?auto_5290 ) ( not ( = ?auto_5278 ?auto_5289 ) ) ( not ( = ?auto_5279 ?auto_5289 ) ) ( not ( = ?auto_5286 ?auto_5289 ) ) ( not ( = ?auto_5290 ?auto_5289 ) ) ( not ( = ?auto_5288 ?auto_5289 ) ) ( AVAILABLE ?auto_5287 ) ( TRUCK-AT ?auto_5285 ?auto_5284 ) ( LIFTING ?auto_5280 ?auto_5290 ) )
    :subtasks
    ( ( !LOAD ?auto_5280 ?auto_5290 ?auto_5285 ?auto_5284 )
      ( MAKE-ON ?auto_5278 ?auto_5279 )
      ( MAKE-ON-VERIFY ?auto_5278 ?auto_5279 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5291 - SURFACE
      ?auto_5292 - SURFACE
    )
    :vars
    (
      ?auto_5298 - HOIST
      ?auto_5293 - PLACE
      ?auto_5301 - PLACE
      ?auto_5300 - HOIST
      ?auto_5302 - SURFACE
      ?auto_5297 - SURFACE
      ?auto_5295 - PLACE
      ?auto_5299 - HOIST
      ?auto_5303 - SURFACE
      ?auto_5296 - SURFACE
      ?auto_5294 - TRUCK
      ?auto_5304 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5298 ?auto_5293 ) ( IS-CRATE ?auto_5291 ) ( not ( = ?auto_5291 ?auto_5292 ) ) ( not ( = ?auto_5301 ?auto_5293 ) ) ( HOIST-AT ?auto_5300 ?auto_5301 ) ( not ( = ?auto_5298 ?auto_5300 ) ) ( SURFACE-AT ?auto_5291 ?auto_5301 ) ( ON ?auto_5291 ?auto_5302 ) ( CLEAR ?auto_5291 ) ( not ( = ?auto_5291 ?auto_5302 ) ) ( not ( = ?auto_5292 ?auto_5302 ) ) ( IS-CRATE ?auto_5292 ) ( not ( = ?auto_5291 ?auto_5297 ) ) ( not ( = ?auto_5292 ?auto_5297 ) ) ( not ( = ?auto_5302 ?auto_5297 ) ) ( not ( = ?auto_5295 ?auto_5293 ) ) ( not ( = ?auto_5301 ?auto_5295 ) ) ( HOIST-AT ?auto_5299 ?auto_5295 ) ( not ( = ?auto_5298 ?auto_5299 ) ) ( not ( = ?auto_5300 ?auto_5299 ) ) ( AVAILABLE ?auto_5299 ) ( SURFACE-AT ?auto_5292 ?auto_5295 ) ( ON ?auto_5292 ?auto_5303 ) ( CLEAR ?auto_5292 ) ( not ( = ?auto_5291 ?auto_5303 ) ) ( not ( = ?auto_5292 ?auto_5303 ) ) ( not ( = ?auto_5302 ?auto_5303 ) ) ( not ( = ?auto_5297 ?auto_5303 ) ) ( SURFACE-AT ?auto_5296 ?auto_5293 ) ( CLEAR ?auto_5296 ) ( IS-CRATE ?auto_5297 ) ( not ( = ?auto_5291 ?auto_5296 ) ) ( not ( = ?auto_5292 ?auto_5296 ) ) ( not ( = ?auto_5302 ?auto_5296 ) ) ( not ( = ?auto_5297 ?auto_5296 ) ) ( not ( = ?auto_5303 ?auto_5296 ) ) ( AVAILABLE ?auto_5298 ) ( TRUCK-AT ?auto_5294 ?auto_5301 ) ( AVAILABLE ?auto_5300 ) ( SURFACE-AT ?auto_5297 ?auto_5301 ) ( ON ?auto_5297 ?auto_5304 ) ( CLEAR ?auto_5297 ) ( not ( = ?auto_5291 ?auto_5304 ) ) ( not ( = ?auto_5292 ?auto_5304 ) ) ( not ( = ?auto_5302 ?auto_5304 ) ) ( not ( = ?auto_5297 ?auto_5304 ) ) ( not ( = ?auto_5303 ?auto_5304 ) ) ( not ( = ?auto_5296 ?auto_5304 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5300 ?auto_5297 ?auto_5304 ?auto_5301 )
      ( MAKE-ON ?auto_5291 ?auto_5292 )
      ( MAKE-ON-VERIFY ?auto_5291 ?auto_5292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5305 - SURFACE
      ?auto_5306 - SURFACE
    )
    :vars
    (
      ?auto_5311 - HOIST
      ?auto_5315 - PLACE
      ?auto_5313 - PLACE
      ?auto_5307 - HOIST
      ?auto_5316 - SURFACE
      ?auto_5317 - SURFACE
      ?auto_5312 - PLACE
      ?auto_5314 - HOIST
      ?auto_5309 - SURFACE
      ?auto_5310 - SURFACE
      ?auto_5318 - SURFACE
      ?auto_5308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5311 ?auto_5315 ) ( IS-CRATE ?auto_5305 ) ( not ( = ?auto_5305 ?auto_5306 ) ) ( not ( = ?auto_5313 ?auto_5315 ) ) ( HOIST-AT ?auto_5307 ?auto_5313 ) ( not ( = ?auto_5311 ?auto_5307 ) ) ( SURFACE-AT ?auto_5305 ?auto_5313 ) ( ON ?auto_5305 ?auto_5316 ) ( CLEAR ?auto_5305 ) ( not ( = ?auto_5305 ?auto_5316 ) ) ( not ( = ?auto_5306 ?auto_5316 ) ) ( IS-CRATE ?auto_5306 ) ( not ( = ?auto_5305 ?auto_5317 ) ) ( not ( = ?auto_5306 ?auto_5317 ) ) ( not ( = ?auto_5316 ?auto_5317 ) ) ( not ( = ?auto_5312 ?auto_5315 ) ) ( not ( = ?auto_5313 ?auto_5312 ) ) ( HOIST-AT ?auto_5314 ?auto_5312 ) ( not ( = ?auto_5311 ?auto_5314 ) ) ( not ( = ?auto_5307 ?auto_5314 ) ) ( AVAILABLE ?auto_5314 ) ( SURFACE-AT ?auto_5306 ?auto_5312 ) ( ON ?auto_5306 ?auto_5309 ) ( CLEAR ?auto_5306 ) ( not ( = ?auto_5305 ?auto_5309 ) ) ( not ( = ?auto_5306 ?auto_5309 ) ) ( not ( = ?auto_5316 ?auto_5309 ) ) ( not ( = ?auto_5317 ?auto_5309 ) ) ( SURFACE-AT ?auto_5310 ?auto_5315 ) ( CLEAR ?auto_5310 ) ( IS-CRATE ?auto_5317 ) ( not ( = ?auto_5305 ?auto_5310 ) ) ( not ( = ?auto_5306 ?auto_5310 ) ) ( not ( = ?auto_5316 ?auto_5310 ) ) ( not ( = ?auto_5317 ?auto_5310 ) ) ( not ( = ?auto_5309 ?auto_5310 ) ) ( AVAILABLE ?auto_5311 ) ( AVAILABLE ?auto_5307 ) ( SURFACE-AT ?auto_5317 ?auto_5313 ) ( ON ?auto_5317 ?auto_5318 ) ( CLEAR ?auto_5317 ) ( not ( = ?auto_5305 ?auto_5318 ) ) ( not ( = ?auto_5306 ?auto_5318 ) ) ( not ( = ?auto_5316 ?auto_5318 ) ) ( not ( = ?auto_5317 ?auto_5318 ) ) ( not ( = ?auto_5309 ?auto_5318 ) ) ( not ( = ?auto_5310 ?auto_5318 ) ) ( TRUCK-AT ?auto_5308 ?auto_5315 ) )
    :subtasks
    ( ( !DRIVE ?auto_5308 ?auto_5315 ?auto_5313 )
      ( MAKE-ON ?auto_5305 ?auto_5306 )
      ( MAKE-ON-VERIFY ?auto_5305 ?auto_5306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5319 - SURFACE
      ?auto_5320 - SURFACE
    )
    :vars
    (
      ?auto_5326 - HOIST
      ?auto_5324 - PLACE
      ?auto_5328 - PLACE
      ?auto_5321 - HOIST
      ?auto_5322 - SURFACE
      ?auto_5327 - SURFACE
      ?auto_5325 - PLACE
      ?auto_5330 - HOIST
      ?auto_5329 - SURFACE
      ?auto_5332 - SURFACE
      ?auto_5331 - SURFACE
      ?auto_5323 - TRUCK
      ?auto_5333 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5326 ?auto_5324 ) ( IS-CRATE ?auto_5319 ) ( not ( = ?auto_5319 ?auto_5320 ) ) ( not ( = ?auto_5328 ?auto_5324 ) ) ( HOIST-AT ?auto_5321 ?auto_5328 ) ( not ( = ?auto_5326 ?auto_5321 ) ) ( SURFACE-AT ?auto_5319 ?auto_5328 ) ( ON ?auto_5319 ?auto_5322 ) ( CLEAR ?auto_5319 ) ( not ( = ?auto_5319 ?auto_5322 ) ) ( not ( = ?auto_5320 ?auto_5322 ) ) ( IS-CRATE ?auto_5320 ) ( not ( = ?auto_5319 ?auto_5327 ) ) ( not ( = ?auto_5320 ?auto_5327 ) ) ( not ( = ?auto_5322 ?auto_5327 ) ) ( not ( = ?auto_5325 ?auto_5324 ) ) ( not ( = ?auto_5328 ?auto_5325 ) ) ( HOIST-AT ?auto_5330 ?auto_5325 ) ( not ( = ?auto_5326 ?auto_5330 ) ) ( not ( = ?auto_5321 ?auto_5330 ) ) ( AVAILABLE ?auto_5330 ) ( SURFACE-AT ?auto_5320 ?auto_5325 ) ( ON ?auto_5320 ?auto_5329 ) ( CLEAR ?auto_5320 ) ( not ( = ?auto_5319 ?auto_5329 ) ) ( not ( = ?auto_5320 ?auto_5329 ) ) ( not ( = ?auto_5322 ?auto_5329 ) ) ( not ( = ?auto_5327 ?auto_5329 ) ) ( IS-CRATE ?auto_5327 ) ( not ( = ?auto_5319 ?auto_5332 ) ) ( not ( = ?auto_5320 ?auto_5332 ) ) ( not ( = ?auto_5322 ?auto_5332 ) ) ( not ( = ?auto_5327 ?auto_5332 ) ) ( not ( = ?auto_5329 ?auto_5332 ) ) ( AVAILABLE ?auto_5321 ) ( SURFACE-AT ?auto_5327 ?auto_5328 ) ( ON ?auto_5327 ?auto_5331 ) ( CLEAR ?auto_5327 ) ( not ( = ?auto_5319 ?auto_5331 ) ) ( not ( = ?auto_5320 ?auto_5331 ) ) ( not ( = ?auto_5322 ?auto_5331 ) ) ( not ( = ?auto_5327 ?auto_5331 ) ) ( not ( = ?auto_5329 ?auto_5331 ) ) ( not ( = ?auto_5332 ?auto_5331 ) ) ( TRUCK-AT ?auto_5323 ?auto_5324 ) ( SURFACE-AT ?auto_5333 ?auto_5324 ) ( CLEAR ?auto_5333 ) ( LIFTING ?auto_5326 ?auto_5332 ) ( IS-CRATE ?auto_5332 ) ( not ( = ?auto_5319 ?auto_5333 ) ) ( not ( = ?auto_5320 ?auto_5333 ) ) ( not ( = ?auto_5322 ?auto_5333 ) ) ( not ( = ?auto_5327 ?auto_5333 ) ) ( not ( = ?auto_5329 ?auto_5333 ) ) ( not ( = ?auto_5332 ?auto_5333 ) ) ( not ( = ?auto_5331 ?auto_5333 ) ) )
    :subtasks
    ( ( !DROP ?auto_5326 ?auto_5332 ?auto_5333 ?auto_5324 )
      ( MAKE-ON ?auto_5319 ?auto_5320 )
      ( MAKE-ON-VERIFY ?auto_5319 ?auto_5320 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5334 - SURFACE
      ?auto_5335 - SURFACE
    )
    :vars
    (
      ?auto_5345 - HOIST
      ?auto_5344 - PLACE
      ?auto_5342 - PLACE
      ?auto_5336 - HOIST
      ?auto_5343 - SURFACE
      ?auto_5347 - SURFACE
      ?auto_5346 - PLACE
      ?auto_5341 - HOIST
      ?auto_5337 - SURFACE
      ?auto_5339 - SURFACE
      ?auto_5338 - SURFACE
      ?auto_5340 - TRUCK
      ?auto_5348 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5345 ?auto_5344 ) ( IS-CRATE ?auto_5334 ) ( not ( = ?auto_5334 ?auto_5335 ) ) ( not ( = ?auto_5342 ?auto_5344 ) ) ( HOIST-AT ?auto_5336 ?auto_5342 ) ( not ( = ?auto_5345 ?auto_5336 ) ) ( SURFACE-AT ?auto_5334 ?auto_5342 ) ( ON ?auto_5334 ?auto_5343 ) ( CLEAR ?auto_5334 ) ( not ( = ?auto_5334 ?auto_5343 ) ) ( not ( = ?auto_5335 ?auto_5343 ) ) ( IS-CRATE ?auto_5335 ) ( not ( = ?auto_5334 ?auto_5347 ) ) ( not ( = ?auto_5335 ?auto_5347 ) ) ( not ( = ?auto_5343 ?auto_5347 ) ) ( not ( = ?auto_5346 ?auto_5344 ) ) ( not ( = ?auto_5342 ?auto_5346 ) ) ( HOIST-AT ?auto_5341 ?auto_5346 ) ( not ( = ?auto_5345 ?auto_5341 ) ) ( not ( = ?auto_5336 ?auto_5341 ) ) ( AVAILABLE ?auto_5341 ) ( SURFACE-AT ?auto_5335 ?auto_5346 ) ( ON ?auto_5335 ?auto_5337 ) ( CLEAR ?auto_5335 ) ( not ( = ?auto_5334 ?auto_5337 ) ) ( not ( = ?auto_5335 ?auto_5337 ) ) ( not ( = ?auto_5343 ?auto_5337 ) ) ( not ( = ?auto_5347 ?auto_5337 ) ) ( IS-CRATE ?auto_5347 ) ( not ( = ?auto_5334 ?auto_5339 ) ) ( not ( = ?auto_5335 ?auto_5339 ) ) ( not ( = ?auto_5343 ?auto_5339 ) ) ( not ( = ?auto_5347 ?auto_5339 ) ) ( not ( = ?auto_5337 ?auto_5339 ) ) ( AVAILABLE ?auto_5336 ) ( SURFACE-AT ?auto_5347 ?auto_5342 ) ( ON ?auto_5347 ?auto_5338 ) ( CLEAR ?auto_5347 ) ( not ( = ?auto_5334 ?auto_5338 ) ) ( not ( = ?auto_5335 ?auto_5338 ) ) ( not ( = ?auto_5343 ?auto_5338 ) ) ( not ( = ?auto_5347 ?auto_5338 ) ) ( not ( = ?auto_5337 ?auto_5338 ) ) ( not ( = ?auto_5339 ?auto_5338 ) ) ( TRUCK-AT ?auto_5340 ?auto_5344 ) ( SURFACE-AT ?auto_5348 ?auto_5344 ) ( CLEAR ?auto_5348 ) ( IS-CRATE ?auto_5339 ) ( not ( = ?auto_5334 ?auto_5348 ) ) ( not ( = ?auto_5335 ?auto_5348 ) ) ( not ( = ?auto_5343 ?auto_5348 ) ) ( not ( = ?auto_5347 ?auto_5348 ) ) ( not ( = ?auto_5337 ?auto_5348 ) ) ( not ( = ?auto_5339 ?auto_5348 ) ) ( not ( = ?auto_5338 ?auto_5348 ) ) ( AVAILABLE ?auto_5345 ) ( IN ?auto_5339 ?auto_5340 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5345 ?auto_5339 ?auto_5340 ?auto_5344 )
      ( MAKE-ON ?auto_5334 ?auto_5335 )
      ( MAKE-ON-VERIFY ?auto_5334 ?auto_5335 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5349 - SURFACE
      ?auto_5350 - SURFACE
    )
    :vars
    (
      ?auto_5355 - HOIST
      ?auto_5357 - PLACE
      ?auto_5354 - PLACE
      ?auto_5358 - HOIST
      ?auto_5352 - SURFACE
      ?auto_5361 - SURFACE
      ?auto_5353 - PLACE
      ?auto_5363 - HOIST
      ?auto_5351 - SURFACE
      ?auto_5359 - SURFACE
      ?auto_5362 - SURFACE
      ?auto_5360 - SURFACE
      ?auto_5356 - TRUCK
      ?auto_5364 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5355 ?auto_5357 ) ( IS-CRATE ?auto_5349 ) ( not ( = ?auto_5349 ?auto_5350 ) ) ( not ( = ?auto_5354 ?auto_5357 ) ) ( HOIST-AT ?auto_5358 ?auto_5354 ) ( not ( = ?auto_5355 ?auto_5358 ) ) ( SURFACE-AT ?auto_5349 ?auto_5354 ) ( ON ?auto_5349 ?auto_5352 ) ( CLEAR ?auto_5349 ) ( not ( = ?auto_5349 ?auto_5352 ) ) ( not ( = ?auto_5350 ?auto_5352 ) ) ( IS-CRATE ?auto_5350 ) ( not ( = ?auto_5349 ?auto_5361 ) ) ( not ( = ?auto_5350 ?auto_5361 ) ) ( not ( = ?auto_5352 ?auto_5361 ) ) ( not ( = ?auto_5353 ?auto_5357 ) ) ( not ( = ?auto_5354 ?auto_5353 ) ) ( HOIST-AT ?auto_5363 ?auto_5353 ) ( not ( = ?auto_5355 ?auto_5363 ) ) ( not ( = ?auto_5358 ?auto_5363 ) ) ( AVAILABLE ?auto_5363 ) ( SURFACE-AT ?auto_5350 ?auto_5353 ) ( ON ?auto_5350 ?auto_5351 ) ( CLEAR ?auto_5350 ) ( not ( = ?auto_5349 ?auto_5351 ) ) ( not ( = ?auto_5350 ?auto_5351 ) ) ( not ( = ?auto_5352 ?auto_5351 ) ) ( not ( = ?auto_5361 ?auto_5351 ) ) ( IS-CRATE ?auto_5361 ) ( not ( = ?auto_5349 ?auto_5359 ) ) ( not ( = ?auto_5350 ?auto_5359 ) ) ( not ( = ?auto_5352 ?auto_5359 ) ) ( not ( = ?auto_5361 ?auto_5359 ) ) ( not ( = ?auto_5351 ?auto_5359 ) ) ( AVAILABLE ?auto_5358 ) ( SURFACE-AT ?auto_5361 ?auto_5354 ) ( ON ?auto_5361 ?auto_5362 ) ( CLEAR ?auto_5361 ) ( not ( = ?auto_5349 ?auto_5362 ) ) ( not ( = ?auto_5350 ?auto_5362 ) ) ( not ( = ?auto_5352 ?auto_5362 ) ) ( not ( = ?auto_5361 ?auto_5362 ) ) ( not ( = ?auto_5351 ?auto_5362 ) ) ( not ( = ?auto_5359 ?auto_5362 ) ) ( SURFACE-AT ?auto_5360 ?auto_5357 ) ( CLEAR ?auto_5360 ) ( IS-CRATE ?auto_5359 ) ( not ( = ?auto_5349 ?auto_5360 ) ) ( not ( = ?auto_5350 ?auto_5360 ) ) ( not ( = ?auto_5352 ?auto_5360 ) ) ( not ( = ?auto_5361 ?auto_5360 ) ) ( not ( = ?auto_5351 ?auto_5360 ) ) ( not ( = ?auto_5359 ?auto_5360 ) ) ( not ( = ?auto_5362 ?auto_5360 ) ) ( AVAILABLE ?auto_5355 ) ( IN ?auto_5359 ?auto_5356 ) ( TRUCK-AT ?auto_5356 ?auto_5364 ) ( not ( = ?auto_5364 ?auto_5357 ) ) ( not ( = ?auto_5354 ?auto_5364 ) ) ( not ( = ?auto_5353 ?auto_5364 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5356 ?auto_5364 ?auto_5357 )
      ( MAKE-ON ?auto_5349 ?auto_5350 )
      ( MAKE-ON-VERIFY ?auto_5349 ?auto_5350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5365 - SURFACE
      ?auto_5366 - SURFACE
    )
    :vars
    (
      ?auto_5370 - HOIST
      ?auto_5369 - PLACE
      ?auto_5376 - PLACE
      ?auto_5372 - HOIST
      ?auto_5367 - SURFACE
      ?auto_5375 - SURFACE
      ?auto_5374 - PLACE
      ?auto_5371 - HOIST
      ?auto_5379 - SURFACE
      ?auto_5378 - SURFACE
      ?auto_5377 - SURFACE
      ?auto_5368 - SURFACE
      ?auto_5373 - TRUCK
      ?auto_5380 - PLACE
      ?auto_5381 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5370 ?auto_5369 ) ( IS-CRATE ?auto_5365 ) ( not ( = ?auto_5365 ?auto_5366 ) ) ( not ( = ?auto_5376 ?auto_5369 ) ) ( HOIST-AT ?auto_5372 ?auto_5376 ) ( not ( = ?auto_5370 ?auto_5372 ) ) ( SURFACE-AT ?auto_5365 ?auto_5376 ) ( ON ?auto_5365 ?auto_5367 ) ( CLEAR ?auto_5365 ) ( not ( = ?auto_5365 ?auto_5367 ) ) ( not ( = ?auto_5366 ?auto_5367 ) ) ( IS-CRATE ?auto_5366 ) ( not ( = ?auto_5365 ?auto_5375 ) ) ( not ( = ?auto_5366 ?auto_5375 ) ) ( not ( = ?auto_5367 ?auto_5375 ) ) ( not ( = ?auto_5374 ?auto_5369 ) ) ( not ( = ?auto_5376 ?auto_5374 ) ) ( HOIST-AT ?auto_5371 ?auto_5374 ) ( not ( = ?auto_5370 ?auto_5371 ) ) ( not ( = ?auto_5372 ?auto_5371 ) ) ( AVAILABLE ?auto_5371 ) ( SURFACE-AT ?auto_5366 ?auto_5374 ) ( ON ?auto_5366 ?auto_5379 ) ( CLEAR ?auto_5366 ) ( not ( = ?auto_5365 ?auto_5379 ) ) ( not ( = ?auto_5366 ?auto_5379 ) ) ( not ( = ?auto_5367 ?auto_5379 ) ) ( not ( = ?auto_5375 ?auto_5379 ) ) ( IS-CRATE ?auto_5375 ) ( not ( = ?auto_5365 ?auto_5378 ) ) ( not ( = ?auto_5366 ?auto_5378 ) ) ( not ( = ?auto_5367 ?auto_5378 ) ) ( not ( = ?auto_5375 ?auto_5378 ) ) ( not ( = ?auto_5379 ?auto_5378 ) ) ( AVAILABLE ?auto_5372 ) ( SURFACE-AT ?auto_5375 ?auto_5376 ) ( ON ?auto_5375 ?auto_5377 ) ( CLEAR ?auto_5375 ) ( not ( = ?auto_5365 ?auto_5377 ) ) ( not ( = ?auto_5366 ?auto_5377 ) ) ( not ( = ?auto_5367 ?auto_5377 ) ) ( not ( = ?auto_5375 ?auto_5377 ) ) ( not ( = ?auto_5379 ?auto_5377 ) ) ( not ( = ?auto_5378 ?auto_5377 ) ) ( SURFACE-AT ?auto_5368 ?auto_5369 ) ( CLEAR ?auto_5368 ) ( IS-CRATE ?auto_5378 ) ( not ( = ?auto_5365 ?auto_5368 ) ) ( not ( = ?auto_5366 ?auto_5368 ) ) ( not ( = ?auto_5367 ?auto_5368 ) ) ( not ( = ?auto_5375 ?auto_5368 ) ) ( not ( = ?auto_5379 ?auto_5368 ) ) ( not ( = ?auto_5378 ?auto_5368 ) ) ( not ( = ?auto_5377 ?auto_5368 ) ) ( AVAILABLE ?auto_5370 ) ( TRUCK-AT ?auto_5373 ?auto_5380 ) ( not ( = ?auto_5380 ?auto_5369 ) ) ( not ( = ?auto_5376 ?auto_5380 ) ) ( not ( = ?auto_5374 ?auto_5380 ) ) ( HOIST-AT ?auto_5381 ?auto_5380 ) ( LIFTING ?auto_5381 ?auto_5378 ) ( not ( = ?auto_5370 ?auto_5381 ) ) ( not ( = ?auto_5372 ?auto_5381 ) ) ( not ( = ?auto_5371 ?auto_5381 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5381 ?auto_5378 ?auto_5373 ?auto_5380 )
      ( MAKE-ON ?auto_5365 ?auto_5366 )
      ( MAKE-ON-VERIFY ?auto_5365 ?auto_5366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5382 - SURFACE
      ?auto_5383 - SURFACE
    )
    :vars
    (
      ?auto_5386 - HOIST
      ?auto_5396 - PLACE
      ?auto_5389 - PLACE
      ?auto_5384 - HOIST
      ?auto_5394 - SURFACE
      ?auto_5387 - SURFACE
      ?auto_5397 - PLACE
      ?auto_5388 - HOIST
      ?auto_5393 - SURFACE
      ?auto_5390 - SURFACE
      ?auto_5395 - SURFACE
      ?auto_5392 - SURFACE
      ?auto_5391 - TRUCK
      ?auto_5385 - PLACE
      ?auto_5398 - HOIST
      ?auto_5399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5386 ?auto_5396 ) ( IS-CRATE ?auto_5382 ) ( not ( = ?auto_5382 ?auto_5383 ) ) ( not ( = ?auto_5389 ?auto_5396 ) ) ( HOIST-AT ?auto_5384 ?auto_5389 ) ( not ( = ?auto_5386 ?auto_5384 ) ) ( SURFACE-AT ?auto_5382 ?auto_5389 ) ( ON ?auto_5382 ?auto_5394 ) ( CLEAR ?auto_5382 ) ( not ( = ?auto_5382 ?auto_5394 ) ) ( not ( = ?auto_5383 ?auto_5394 ) ) ( IS-CRATE ?auto_5383 ) ( not ( = ?auto_5382 ?auto_5387 ) ) ( not ( = ?auto_5383 ?auto_5387 ) ) ( not ( = ?auto_5394 ?auto_5387 ) ) ( not ( = ?auto_5397 ?auto_5396 ) ) ( not ( = ?auto_5389 ?auto_5397 ) ) ( HOIST-AT ?auto_5388 ?auto_5397 ) ( not ( = ?auto_5386 ?auto_5388 ) ) ( not ( = ?auto_5384 ?auto_5388 ) ) ( AVAILABLE ?auto_5388 ) ( SURFACE-AT ?auto_5383 ?auto_5397 ) ( ON ?auto_5383 ?auto_5393 ) ( CLEAR ?auto_5383 ) ( not ( = ?auto_5382 ?auto_5393 ) ) ( not ( = ?auto_5383 ?auto_5393 ) ) ( not ( = ?auto_5394 ?auto_5393 ) ) ( not ( = ?auto_5387 ?auto_5393 ) ) ( IS-CRATE ?auto_5387 ) ( not ( = ?auto_5382 ?auto_5390 ) ) ( not ( = ?auto_5383 ?auto_5390 ) ) ( not ( = ?auto_5394 ?auto_5390 ) ) ( not ( = ?auto_5387 ?auto_5390 ) ) ( not ( = ?auto_5393 ?auto_5390 ) ) ( AVAILABLE ?auto_5384 ) ( SURFACE-AT ?auto_5387 ?auto_5389 ) ( ON ?auto_5387 ?auto_5395 ) ( CLEAR ?auto_5387 ) ( not ( = ?auto_5382 ?auto_5395 ) ) ( not ( = ?auto_5383 ?auto_5395 ) ) ( not ( = ?auto_5394 ?auto_5395 ) ) ( not ( = ?auto_5387 ?auto_5395 ) ) ( not ( = ?auto_5393 ?auto_5395 ) ) ( not ( = ?auto_5390 ?auto_5395 ) ) ( SURFACE-AT ?auto_5392 ?auto_5396 ) ( CLEAR ?auto_5392 ) ( IS-CRATE ?auto_5390 ) ( not ( = ?auto_5382 ?auto_5392 ) ) ( not ( = ?auto_5383 ?auto_5392 ) ) ( not ( = ?auto_5394 ?auto_5392 ) ) ( not ( = ?auto_5387 ?auto_5392 ) ) ( not ( = ?auto_5393 ?auto_5392 ) ) ( not ( = ?auto_5390 ?auto_5392 ) ) ( not ( = ?auto_5395 ?auto_5392 ) ) ( AVAILABLE ?auto_5386 ) ( TRUCK-AT ?auto_5391 ?auto_5385 ) ( not ( = ?auto_5385 ?auto_5396 ) ) ( not ( = ?auto_5389 ?auto_5385 ) ) ( not ( = ?auto_5397 ?auto_5385 ) ) ( HOIST-AT ?auto_5398 ?auto_5385 ) ( not ( = ?auto_5386 ?auto_5398 ) ) ( not ( = ?auto_5384 ?auto_5398 ) ) ( not ( = ?auto_5388 ?auto_5398 ) ) ( AVAILABLE ?auto_5398 ) ( SURFACE-AT ?auto_5390 ?auto_5385 ) ( ON ?auto_5390 ?auto_5399 ) ( CLEAR ?auto_5390 ) ( not ( = ?auto_5382 ?auto_5399 ) ) ( not ( = ?auto_5383 ?auto_5399 ) ) ( not ( = ?auto_5394 ?auto_5399 ) ) ( not ( = ?auto_5387 ?auto_5399 ) ) ( not ( = ?auto_5393 ?auto_5399 ) ) ( not ( = ?auto_5390 ?auto_5399 ) ) ( not ( = ?auto_5395 ?auto_5399 ) ) ( not ( = ?auto_5392 ?auto_5399 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5398 ?auto_5390 ?auto_5399 ?auto_5385 )
      ( MAKE-ON ?auto_5382 ?auto_5383 )
      ( MAKE-ON-VERIFY ?auto_5382 ?auto_5383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5400 - SURFACE
      ?auto_5401 - SURFACE
    )
    :vars
    (
      ?auto_5410 - HOIST
      ?auto_5409 - PLACE
      ?auto_5406 - PLACE
      ?auto_5405 - HOIST
      ?auto_5411 - SURFACE
      ?auto_5403 - SURFACE
      ?auto_5402 - PLACE
      ?auto_5414 - HOIST
      ?auto_5412 - SURFACE
      ?auto_5416 - SURFACE
      ?auto_5408 - SURFACE
      ?auto_5413 - SURFACE
      ?auto_5407 - PLACE
      ?auto_5415 - HOIST
      ?auto_5417 - SURFACE
      ?auto_5404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5410 ?auto_5409 ) ( IS-CRATE ?auto_5400 ) ( not ( = ?auto_5400 ?auto_5401 ) ) ( not ( = ?auto_5406 ?auto_5409 ) ) ( HOIST-AT ?auto_5405 ?auto_5406 ) ( not ( = ?auto_5410 ?auto_5405 ) ) ( SURFACE-AT ?auto_5400 ?auto_5406 ) ( ON ?auto_5400 ?auto_5411 ) ( CLEAR ?auto_5400 ) ( not ( = ?auto_5400 ?auto_5411 ) ) ( not ( = ?auto_5401 ?auto_5411 ) ) ( IS-CRATE ?auto_5401 ) ( not ( = ?auto_5400 ?auto_5403 ) ) ( not ( = ?auto_5401 ?auto_5403 ) ) ( not ( = ?auto_5411 ?auto_5403 ) ) ( not ( = ?auto_5402 ?auto_5409 ) ) ( not ( = ?auto_5406 ?auto_5402 ) ) ( HOIST-AT ?auto_5414 ?auto_5402 ) ( not ( = ?auto_5410 ?auto_5414 ) ) ( not ( = ?auto_5405 ?auto_5414 ) ) ( AVAILABLE ?auto_5414 ) ( SURFACE-AT ?auto_5401 ?auto_5402 ) ( ON ?auto_5401 ?auto_5412 ) ( CLEAR ?auto_5401 ) ( not ( = ?auto_5400 ?auto_5412 ) ) ( not ( = ?auto_5401 ?auto_5412 ) ) ( not ( = ?auto_5411 ?auto_5412 ) ) ( not ( = ?auto_5403 ?auto_5412 ) ) ( IS-CRATE ?auto_5403 ) ( not ( = ?auto_5400 ?auto_5416 ) ) ( not ( = ?auto_5401 ?auto_5416 ) ) ( not ( = ?auto_5411 ?auto_5416 ) ) ( not ( = ?auto_5403 ?auto_5416 ) ) ( not ( = ?auto_5412 ?auto_5416 ) ) ( AVAILABLE ?auto_5405 ) ( SURFACE-AT ?auto_5403 ?auto_5406 ) ( ON ?auto_5403 ?auto_5408 ) ( CLEAR ?auto_5403 ) ( not ( = ?auto_5400 ?auto_5408 ) ) ( not ( = ?auto_5401 ?auto_5408 ) ) ( not ( = ?auto_5411 ?auto_5408 ) ) ( not ( = ?auto_5403 ?auto_5408 ) ) ( not ( = ?auto_5412 ?auto_5408 ) ) ( not ( = ?auto_5416 ?auto_5408 ) ) ( SURFACE-AT ?auto_5413 ?auto_5409 ) ( CLEAR ?auto_5413 ) ( IS-CRATE ?auto_5416 ) ( not ( = ?auto_5400 ?auto_5413 ) ) ( not ( = ?auto_5401 ?auto_5413 ) ) ( not ( = ?auto_5411 ?auto_5413 ) ) ( not ( = ?auto_5403 ?auto_5413 ) ) ( not ( = ?auto_5412 ?auto_5413 ) ) ( not ( = ?auto_5416 ?auto_5413 ) ) ( not ( = ?auto_5408 ?auto_5413 ) ) ( AVAILABLE ?auto_5410 ) ( not ( = ?auto_5407 ?auto_5409 ) ) ( not ( = ?auto_5406 ?auto_5407 ) ) ( not ( = ?auto_5402 ?auto_5407 ) ) ( HOIST-AT ?auto_5415 ?auto_5407 ) ( not ( = ?auto_5410 ?auto_5415 ) ) ( not ( = ?auto_5405 ?auto_5415 ) ) ( not ( = ?auto_5414 ?auto_5415 ) ) ( AVAILABLE ?auto_5415 ) ( SURFACE-AT ?auto_5416 ?auto_5407 ) ( ON ?auto_5416 ?auto_5417 ) ( CLEAR ?auto_5416 ) ( not ( = ?auto_5400 ?auto_5417 ) ) ( not ( = ?auto_5401 ?auto_5417 ) ) ( not ( = ?auto_5411 ?auto_5417 ) ) ( not ( = ?auto_5403 ?auto_5417 ) ) ( not ( = ?auto_5412 ?auto_5417 ) ) ( not ( = ?auto_5416 ?auto_5417 ) ) ( not ( = ?auto_5408 ?auto_5417 ) ) ( not ( = ?auto_5413 ?auto_5417 ) ) ( TRUCK-AT ?auto_5404 ?auto_5409 ) )
    :subtasks
    ( ( !DRIVE ?auto_5404 ?auto_5409 ?auto_5407 )
      ( MAKE-ON ?auto_5400 ?auto_5401 )
      ( MAKE-ON-VERIFY ?auto_5400 ?auto_5401 ) )
  )

)

