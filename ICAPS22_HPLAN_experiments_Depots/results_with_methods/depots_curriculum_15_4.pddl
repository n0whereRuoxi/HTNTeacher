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
      ?auto_5802 - SURFACE
      ?auto_5803 - SURFACE
    )
    :vars
    (
      ?auto_5804 - HOIST
      ?auto_5805 - PLACE
      ?auto_5807 - PLACE
      ?auto_5808 - HOIST
      ?auto_5809 - SURFACE
      ?auto_5806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5804 ?auto_5805 ) ( SURFACE-AT ?auto_5803 ?auto_5805 ) ( CLEAR ?auto_5803 ) ( IS-CRATE ?auto_5802 ) ( AVAILABLE ?auto_5804 ) ( not ( = ?auto_5807 ?auto_5805 ) ) ( HOIST-AT ?auto_5808 ?auto_5807 ) ( AVAILABLE ?auto_5808 ) ( SURFACE-AT ?auto_5802 ?auto_5807 ) ( ON ?auto_5802 ?auto_5809 ) ( CLEAR ?auto_5802 ) ( TRUCK-AT ?auto_5806 ?auto_5805 ) ( not ( = ?auto_5802 ?auto_5803 ) ) ( not ( = ?auto_5802 ?auto_5809 ) ) ( not ( = ?auto_5803 ?auto_5809 ) ) ( not ( = ?auto_5804 ?auto_5808 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5806 ?auto_5805 ?auto_5807 )
      ( !LIFT ?auto_5808 ?auto_5802 ?auto_5809 ?auto_5807 )
      ( !LOAD ?auto_5808 ?auto_5802 ?auto_5806 ?auto_5807 )
      ( !DRIVE ?auto_5806 ?auto_5807 ?auto_5805 )
      ( !UNLOAD ?auto_5804 ?auto_5802 ?auto_5806 ?auto_5805 )
      ( !DROP ?auto_5804 ?auto_5802 ?auto_5803 ?auto_5805 )
      ( MAKE-ON-VERIFY ?auto_5802 ?auto_5803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5812 - SURFACE
      ?auto_5813 - SURFACE
    )
    :vars
    (
      ?auto_5814 - HOIST
      ?auto_5815 - PLACE
      ?auto_5817 - PLACE
      ?auto_5818 - HOIST
      ?auto_5819 - SURFACE
      ?auto_5816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5814 ?auto_5815 ) ( SURFACE-AT ?auto_5813 ?auto_5815 ) ( CLEAR ?auto_5813 ) ( IS-CRATE ?auto_5812 ) ( AVAILABLE ?auto_5814 ) ( not ( = ?auto_5817 ?auto_5815 ) ) ( HOIST-AT ?auto_5818 ?auto_5817 ) ( AVAILABLE ?auto_5818 ) ( SURFACE-AT ?auto_5812 ?auto_5817 ) ( ON ?auto_5812 ?auto_5819 ) ( CLEAR ?auto_5812 ) ( TRUCK-AT ?auto_5816 ?auto_5815 ) ( not ( = ?auto_5812 ?auto_5813 ) ) ( not ( = ?auto_5812 ?auto_5819 ) ) ( not ( = ?auto_5813 ?auto_5819 ) ) ( not ( = ?auto_5814 ?auto_5818 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5816 ?auto_5815 ?auto_5817 )
      ( !LIFT ?auto_5818 ?auto_5812 ?auto_5819 ?auto_5817 )
      ( !LOAD ?auto_5818 ?auto_5812 ?auto_5816 ?auto_5817 )
      ( !DRIVE ?auto_5816 ?auto_5817 ?auto_5815 )
      ( !UNLOAD ?auto_5814 ?auto_5812 ?auto_5816 ?auto_5815 )
      ( !DROP ?auto_5814 ?auto_5812 ?auto_5813 ?auto_5815 )
      ( MAKE-ON-VERIFY ?auto_5812 ?auto_5813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5822 - SURFACE
      ?auto_5823 - SURFACE
    )
    :vars
    (
      ?auto_5824 - HOIST
      ?auto_5825 - PLACE
      ?auto_5827 - PLACE
      ?auto_5828 - HOIST
      ?auto_5829 - SURFACE
      ?auto_5826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5824 ?auto_5825 ) ( SURFACE-AT ?auto_5823 ?auto_5825 ) ( CLEAR ?auto_5823 ) ( IS-CRATE ?auto_5822 ) ( AVAILABLE ?auto_5824 ) ( not ( = ?auto_5827 ?auto_5825 ) ) ( HOIST-AT ?auto_5828 ?auto_5827 ) ( AVAILABLE ?auto_5828 ) ( SURFACE-AT ?auto_5822 ?auto_5827 ) ( ON ?auto_5822 ?auto_5829 ) ( CLEAR ?auto_5822 ) ( TRUCK-AT ?auto_5826 ?auto_5825 ) ( not ( = ?auto_5822 ?auto_5823 ) ) ( not ( = ?auto_5822 ?auto_5829 ) ) ( not ( = ?auto_5823 ?auto_5829 ) ) ( not ( = ?auto_5824 ?auto_5828 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5826 ?auto_5825 ?auto_5827 )
      ( !LIFT ?auto_5828 ?auto_5822 ?auto_5829 ?auto_5827 )
      ( !LOAD ?auto_5828 ?auto_5822 ?auto_5826 ?auto_5827 )
      ( !DRIVE ?auto_5826 ?auto_5827 ?auto_5825 )
      ( !UNLOAD ?auto_5824 ?auto_5822 ?auto_5826 ?auto_5825 )
      ( !DROP ?auto_5824 ?auto_5822 ?auto_5823 ?auto_5825 )
      ( MAKE-ON-VERIFY ?auto_5822 ?auto_5823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5832 - SURFACE
      ?auto_5833 - SURFACE
    )
    :vars
    (
      ?auto_5834 - HOIST
      ?auto_5835 - PLACE
      ?auto_5837 - PLACE
      ?auto_5838 - HOIST
      ?auto_5839 - SURFACE
      ?auto_5836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5834 ?auto_5835 ) ( SURFACE-AT ?auto_5833 ?auto_5835 ) ( CLEAR ?auto_5833 ) ( IS-CRATE ?auto_5832 ) ( AVAILABLE ?auto_5834 ) ( not ( = ?auto_5837 ?auto_5835 ) ) ( HOIST-AT ?auto_5838 ?auto_5837 ) ( AVAILABLE ?auto_5838 ) ( SURFACE-AT ?auto_5832 ?auto_5837 ) ( ON ?auto_5832 ?auto_5839 ) ( CLEAR ?auto_5832 ) ( TRUCK-AT ?auto_5836 ?auto_5835 ) ( not ( = ?auto_5832 ?auto_5833 ) ) ( not ( = ?auto_5832 ?auto_5839 ) ) ( not ( = ?auto_5833 ?auto_5839 ) ) ( not ( = ?auto_5834 ?auto_5838 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5836 ?auto_5835 ?auto_5837 )
      ( !LIFT ?auto_5838 ?auto_5832 ?auto_5839 ?auto_5837 )
      ( !LOAD ?auto_5838 ?auto_5832 ?auto_5836 ?auto_5837 )
      ( !DRIVE ?auto_5836 ?auto_5837 ?auto_5835 )
      ( !UNLOAD ?auto_5834 ?auto_5832 ?auto_5836 ?auto_5835 )
      ( !DROP ?auto_5834 ?auto_5832 ?auto_5833 ?auto_5835 )
      ( MAKE-ON-VERIFY ?auto_5832 ?auto_5833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5842 - SURFACE
      ?auto_5843 - SURFACE
    )
    :vars
    (
      ?auto_5844 - HOIST
      ?auto_5845 - PLACE
      ?auto_5847 - PLACE
      ?auto_5848 - HOIST
      ?auto_5849 - SURFACE
      ?auto_5846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5844 ?auto_5845 ) ( SURFACE-AT ?auto_5843 ?auto_5845 ) ( CLEAR ?auto_5843 ) ( IS-CRATE ?auto_5842 ) ( AVAILABLE ?auto_5844 ) ( not ( = ?auto_5847 ?auto_5845 ) ) ( HOIST-AT ?auto_5848 ?auto_5847 ) ( AVAILABLE ?auto_5848 ) ( SURFACE-AT ?auto_5842 ?auto_5847 ) ( ON ?auto_5842 ?auto_5849 ) ( CLEAR ?auto_5842 ) ( TRUCK-AT ?auto_5846 ?auto_5845 ) ( not ( = ?auto_5842 ?auto_5843 ) ) ( not ( = ?auto_5842 ?auto_5849 ) ) ( not ( = ?auto_5843 ?auto_5849 ) ) ( not ( = ?auto_5844 ?auto_5848 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5846 ?auto_5845 ?auto_5847 )
      ( !LIFT ?auto_5848 ?auto_5842 ?auto_5849 ?auto_5847 )
      ( !LOAD ?auto_5848 ?auto_5842 ?auto_5846 ?auto_5847 )
      ( !DRIVE ?auto_5846 ?auto_5847 ?auto_5845 )
      ( !UNLOAD ?auto_5844 ?auto_5842 ?auto_5846 ?auto_5845 )
      ( !DROP ?auto_5844 ?auto_5842 ?auto_5843 ?auto_5845 )
      ( MAKE-ON-VERIFY ?auto_5842 ?auto_5843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5852 - SURFACE
      ?auto_5853 - SURFACE
    )
    :vars
    (
      ?auto_5854 - HOIST
      ?auto_5855 - PLACE
      ?auto_5857 - PLACE
      ?auto_5858 - HOIST
      ?auto_5859 - SURFACE
      ?auto_5856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5854 ?auto_5855 ) ( SURFACE-AT ?auto_5853 ?auto_5855 ) ( CLEAR ?auto_5853 ) ( IS-CRATE ?auto_5852 ) ( AVAILABLE ?auto_5854 ) ( not ( = ?auto_5857 ?auto_5855 ) ) ( HOIST-AT ?auto_5858 ?auto_5857 ) ( AVAILABLE ?auto_5858 ) ( SURFACE-AT ?auto_5852 ?auto_5857 ) ( ON ?auto_5852 ?auto_5859 ) ( CLEAR ?auto_5852 ) ( TRUCK-AT ?auto_5856 ?auto_5855 ) ( not ( = ?auto_5852 ?auto_5853 ) ) ( not ( = ?auto_5852 ?auto_5859 ) ) ( not ( = ?auto_5853 ?auto_5859 ) ) ( not ( = ?auto_5854 ?auto_5858 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5856 ?auto_5855 ?auto_5857 )
      ( !LIFT ?auto_5858 ?auto_5852 ?auto_5859 ?auto_5857 )
      ( !LOAD ?auto_5858 ?auto_5852 ?auto_5856 ?auto_5857 )
      ( !DRIVE ?auto_5856 ?auto_5857 ?auto_5855 )
      ( !UNLOAD ?auto_5854 ?auto_5852 ?auto_5856 ?auto_5855 )
      ( !DROP ?auto_5854 ?auto_5852 ?auto_5853 ?auto_5855 )
      ( MAKE-ON-VERIFY ?auto_5852 ?auto_5853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5862 - SURFACE
      ?auto_5863 - SURFACE
    )
    :vars
    (
      ?auto_5864 - HOIST
      ?auto_5865 - PLACE
      ?auto_5867 - PLACE
      ?auto_5868 - HOIST
      ?auto_5869 - SURFACE
      ?auto_5866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5864 ?auto_5865 ) ( SURFACE-AT ?auto_5863 ?auto_5865 ) ( CLEAR ?auto_5863 ) ( IS-CRATE ?auto_5862 ) ( AVAILABLE ?auto_5864 ) ( not ( = ?auto_5867 ?auto_5865 ) ) ( HOIST-AT ?auto_5868 ?auto_5867 ) ( AVAILABLE ?auto_5868 ) ( SURFACE-AT ?auto_5862 ?auto_5867 ) ( ON ?auto_5862 ?auto_5869 ) ( CLEAR ?auto_5862 ) ( TRUCK-AT ?auto_5866 ?auto_5865 ) ( not ( = ?auto_5862 ?auto_5863 ) ) ( not ( = ?auto_5862 ?auto_5869 ) ) ( not ( = ?auto_5863 ?auto_5869 ) ) ( not ( = ?auto_5864 ?auto_5868 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5866 ?auto_5865 ?auto_5867 )
      ( !LIFT ?auto_5868 ?auto_5862 ?auto_5869 ?auto_5867 )
      ( !LOAD ?auto_5868 ?auto_5862 ?auto_5866 ?auto_5867 )
      ( !DRIVE ?auto_5866 ?auto_5867 ?auto_5865 )
      ( !UNLOAD ?auto_5864 ?auto_5862 ?auto_5866 ?auto_5865 )
      ( !DROP ?auto_5864 ?auto_5862 ?auto_5863 ?auto_5865 )
      ( MAKE-ON-VERIFY ?auto_5862 ?auto_5863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5872 - SURFACE
      ?auto_5873 - SURFACE
    )
    :vars
    (
      ?auto_5874 - HOIST
      ?auto_5875 - PLACE
      ?auto_5877 - PLACE
      ?auto_5878 - HOIST
      ?auto_5879 - SURFACE
      ?auto_5876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5874 ?auto_5875 ) ( SURFACE-AT ?auto_5873 ?auto_5875 ) ( CLEAR ?auto_5873 ) ( IS-CRATE ?auto_5872 ) ( AVAILABLE ?auto_5874 ) ( not ( = ?auto_5877 ?auto_5875 ) ) ( HOIST-AT ?auto_5878 ?auto_5877 ) ( AVAILABLE ?auto_5878 ) ( SURFACE-AT ?auto_5872 ?auto_5877 ) ( ON ?auto_5872 ?auto_5879 ) ( CLEAR ?auto_5872 ) ( TRUCK-AT ?auto_5876 ?auto_5875 ) ( not ( = ?auto_5872 ?auto_5873 ) ) ( not ( = ?auto_5872 ?auto_5879 ) ) ( not ( = ?auto_5873 ?auto_5879 ) ) ( not ( = ?auto_5874 ?auto_5878 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5876 ?auto_5875 ?auto_5877 )
      ( !LIFT ?auto_5878 ?auto_5872 ?auto_5879 ?auto_5877 )
      ( !LOAD ?auto_5878 ?auto_5872 ?auto_5876 ?auto_5877 )
      ( !DRIVE ?auto_5876 ?auto_5877 ?auto_5875 )
      ( !UNLOAD ?auto_5874 ?auto_5872 ?auto_5876 ?auto_5875 )
      ( !DROP ?auto_5874 ?auto_5872 ?auto_5873 ?auto_5875 )
      ( MAKE-ON-VERIFY ?auto_5872 ?auto_5873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5882 - SURFACE
      ?auto_5883 - SURFACE
    )
    :vars
    (
      ?auto_5884 - HOIST
      ?auto_5885 - PLACE
      ?auto_5887 - PLACE
      ?auto_5888 - HOIST
      ?auto_5889 - SURFACE
      ?auto_5886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5884 ?auto_5885 ) ( SURFACE-AT ?auto_5883 ?auto_5885 ) ( CLEAR ?auto_5883 ) ( IS-CRATE ?auto_5882 ) ( AVAILABLE ?auto_5884 ) ( not ( = ?auto_5887 ?auto_5885 ) ) ( HOIST-AT ?auto_5888 ?auto_5887 ) ( AVAILABLE ?auto_5888 ) ( SURFACE-AT ?auto_5882 ?auto_5887 ) ( ON ?auto_5882 ?auto_5889 ) ( CLEAR ?auto_5882 ) ( TRUCK-AT ?auto_5886 ?auto_5885 ) ( not ( = ?auto_5882 ?auto_5883 ) ) ( not ( = ?auto_5882 ?auto_5889 ) ) ( not ( = ?auto_5883 ?auto_5889 ) ) ( not ( = ?auto_5884 ?auto_5888 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5886 ?auto_5885 ?auto_5887 )
      ( !LIFT ?auto_5888 ?auto_5882 ?auto_5889 ?auto_5887 )
      ( !LOAD ?auto_5888 ?auto_5882 ?auto_5886 ?auto_5887 )
      ( !DRIVE ?auto_5886 ?auto_5887 ?auto_5885 )
      ( !UNLOAD ?auto_5884 ?auto_5882 ?auto_5886 ?auto_5885 )
      ( !DROP ?auto_5884 ?auto_5882 ?auto_5883 ?auto_5885 )
      ( MAKE-ON-VERIFY ?auto_5882 ?auto_5883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5892 - SURFACE
      ?auto_5893 - SURFACE
    )
    :vars
    (
      ?auto_5894 - HOIST
      ?auto_5895 - PLACE
      ?auto_5897 - PLACE
      ?auto_5898 - HOIST
      ?auto_5899 - SURFACE
      ?auto_5896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5894 ?auto_5895 ) ( SURFACE-AT ?auto_5893 ?auto_5895 ) ( CLEAR ?auto_5893 ) ( IS-CRATE ?auto_5892 ) ( AVAILABLE ?auto_5894 ) ( not ( = ?auto_5897 ?auto_5895 ) ) ( HOIST-AT ?auto_5898 ?auto_5897 ) ( AVAILABLE ?auto_5898 ) ( SURFACE-AT ?auto_5892 ?auto_5897 ) ( ON ?auto_5892 ?auto_5899 ) ( CLEAR ?auto_5892 ) ( TRUCK-AT ?auto_5896 ?auto_5895 ) ( not ( = ?auto_5892 ?auto_5893 ) ) ( not ( = ?auto_5892 ?auto_5899 ) ) ( not ( = ?auto_5893 ?auto_5899 ) ) ( not ( = ?auto_5894 ?auto_5898 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5896 ?auto_5895 ?auto_5897 )
      ( !LIFT ?auto_5898 ?auto_5892 ?auto_5899 ?auto_5897 )
      ( !LOAD ?auto_5898 ?auto_5892 ?auto_5896 ?auto_5897 )
      ( !DRIVE ?auto_5896 ?auto_5897 ?auto_5895 )
      ( !UNLOAD ?auto_5894 ?auto_5892 ?auto_5896 ?auto_5895 )
      ( !DROP ?auto_5894 ?auto_5892 ?auto_5893 ?auto_5895 )
      ( MAKE-ON-VERIFY ?auto_5892 ?auto_5893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5902 - SURFACE
      ?auto_5903 - SURFACE
    )
    :vars
    (
      ?auto_5904 - HOIST
      ?auto_5905 - PLACE
      ?auto_5907 - PLACE
      ?auto_5908 - HOIST
      ?auto_5909 - SURFACE
      ?auto_5906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5904 ?auto_5905 ) ( SURFACE-AT ?auto_5903 ?auto_5905 ) ( CLEAR ?auto_5903 ) ( IS-CRATE ?auto_5902 ) ( AVAILABLE ?auto_5904 ) ( not ( = ?auto_5907 ?auto_5905 ) ) ( HOIST-AT ?auto_5908 ?auto_5907 ) ( AVAILABLE ?auto_5908 ) ( SURFACE-AT ?auto_5902 ?auto_5907 ) ( ON ?auto_5902 ?auto_5909 ) ( CLEAR ?auto_5902 ) ( TRUCK-AT ?auto_5906 ?auto_5905 ) ( not ( = ?auto_5902 ?auto_5903 ) ) ( not ( = ?auto_5902 ?auto_5909 ) ) ( not ( = ?auto_5903 ?auto_5909 ) ) ( not ( = ?auto_5904 ?auto_5908 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5906 ?auto_5905 ?auto_5907 )
      ( !LIFT ?auto_5908 ?auto_5902 ?auto_5909 ?auto_5907 )
      ( !LOAD ?auto_5908 ?auto_5902 ?auto_5906 ?auto_5907 )
      ( !DRIVE ?auto_5906 ?auto_5907 ?auto_5905 )
      ( !UNLOAD ?auto_5904 ?auto_5902 ?auto_5906 ?auto_5905 )
      ( !DROP ?auto_5904 ?auto_5902 ?auto_5903 ?auto_5905 )
      ( MAKE-ON-VERIFY ?auto_5902 ?auto_5903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5912 - SURFACE
      ?auto_5913 - SURFACE
    )
    :vars
    (
      ?auto_5914 - HOIST
      ?auto_5915 - PLACE
      ?auto_5917 - PLACE
      ?auto_5918 - HOIST
      ?auto_5919 - SURFACE
      ?auto_5916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5914 ?auto_5915 ) ( SURFACE-AT ?auto_5913 ?auto_5915 ) ( CLEAR ?auto_5913 ) ( IS-CRATE ?auto_5912 ) ( AVAILABLE ?auto_5914 ) ( not ( = ?auto_5917 ?auto_5915 ) ) ( HOIST-AT ?auto_5918 ?auto_5917 ) ( AVAILABLE ?auto_5918 ) ( SURFACE-AT ?auto_5912 ?auto_5917 ) ( ON ?auto_5912 ?auto_5919 ) ( CLEAR ?auto_5912 ) ( TRUCK-AT ?auto_5916 ?auto_5915 ) ( not ( = ?auto_5912 ?auto_5913 ) ) ( not ( = ?auto_5912 ?auto_5919 ) ) ( not ( = ?auto_5913 ?auto_5919 ) ) ( not ( = ?auto_5914 ?auto_5918 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5916 ?auto_5915 ?auto_5917 )
      ( !LIFT ?auto_5918 ?auto_5912 ?auto_5919 ?auto_5917 )
      ( !LOAD ?auto_5918 ?auto_5912 ?auto_5916 ?auto_5917 )
      ( !DRIVE ?auto_5916 ?auto_5917 ?auto_5915 )
      ( !UNLOAD ?auto_5914 ?auto_5912 ?auto_5916 ?auto_5915 )
      ( !DROP ?auto_5914 ?auto_5912 ?auto_5913 ?auto_5915 )
      ( MAKE-ON-VERIFY ?auto_5912 ?auto_5913 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5922 - SURFACE
      ?auto_5923 - SURFACE
    )
    :vars
    (
      ?auto_5924 - HOIST
      ?auto_5925 - PLACE
      ?auto_5927 - PLACE
      ?auto_5928 - HOIST
      ?auto_5929 - SURFACE
      ?auto_5926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5924 ?auto_5925 ) ( SURFACE-AT ?auto_5923 ?auto_5925 ) ( CLEAR ?auto_5923 ) ( IS-CRATE ?auto_5922 ) ( AVAILABLE ?auto_5924 ) ( not ( = ?auto_5927 ?auto_5925 ) ) ( HOIST-AT ?auto_5928 ?auto_5927 ) ( AVAILABLE ?auto_5928 ) ( SURFACE-AT ?auto_5922 ?auto_5927 ) ( ON ?auto_5922 ?auto_5929 ) ( CLEAR ?auto_5922 ) ( TRUCK-AT ?auto_5926 ?auto_5925 ) ( not ( = ?auto_5922 ?auto_5923 ) ) ( not ( = ?auto_5922 ?auto_5929 ) ) ( not ( = ?auto_5923 ?auto_5929 ) ) ( not ( = ?auto_5924 ?auto_5928 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5926 ?auto_5925 ?auto_5927 )
      ( !LIFT ?auto_5928 ?auto_5922 ?auto_5929 ?auto_5927 )
      ( !LOAD ?auto_5928 ?auto_5922 ?auto_5926 ?auto_5927 )
      ( !DRIVE ?auto_5926 ?auto_5927 ?auto_5925 )
      ( !UNLOAD ?auto_5924 ?auto_5922 ?auto_5926 ?auto_5925 )
      ( !DROP ?auto_5924 ?auto_5922 ?auto_5923 ?auto_5925 )
      ( MAKE-ON-VERIFY ?auto_5922 ?auto_5923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5932 - SURFACE
      ?auto_5933 - SURFACE
    )
    :vars
    (
      ?auto_5934 - HOIST
      ?auto_5935 - PLACE
      ?auto_5937 - PLACE
      ?auto_5938 - HOIST
      ?auto_5939 - SURFACE
      ?auto_5936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5934 ?auto_5935 ) ( SURFACE-AT ?auto_5933 ?auto_5935 ) ( CLEAR ?auto_5933 ) ( IS-CRATE ?auto_5932 ) ( AVAILABLE ?auto_5934 ) ( not ( = ?auto_5937 ?auto_5935 ) ) ( HOIST-AT ?auto_5938 ?auto_5937 ) ( AVAILABLE ?auto_5938 ) ( SURFACE-AT ?auto_5932 ?auto_5937 ) ( ON ?auto_5932 ?auto_5939 ) ( CLEAR ?auto_5932 ) ( TRUCK-AT ?auto_5936 ?auto_5935 ) ( not ( = ?auto_5932 ?auto_5933 ) ) ( not ( = ?auto_5932 ?auto_5939 ) ) ( not ( = ?auto_5933 ?auto_5939 ) ) ( not ( = ?auto_5934 ?auto_5938 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5936 ?auto_5935 ?auto_5937 )
      ( !LIFT ?auto_5938 ?auto_5932 ?auto_5939 ?auto_5937 )
      ( !LOAD ?auto_5938 ?auto_5932 ?auto_5936 ?auto_5937 )
      ( !DRIVE ?auto_5936 ?auto_5937 ?auto_5935 )
      ( !UNLOAD ?auto_5934 ?auto_5932 ?auto_5936 ?auto_5935 )
      ( !DROP ?auto_5934 ?auto_5932 ?auto_5933 ?auto_5935 )
      ( MAKE-ON-VERIFY ?auto_5932 ?auto_5933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5942 - SURFACE
      ?auto_5943 - SURFACE
    )
    :vars
    (
      ?auto_5944 - HOIST
      ?auto_5945 - PLACE
      ?auto_5947 - PLACE
      ?auto_5948 - HOIST
      ?auto_5949 - SURFACE
      ?auto_5946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5944 ?auto_5945 ) ( SURFACE-AT ?auto_5943 ?auto_5945 ) ( CLEAR ?auto_5943 ) ( IS-CRATE ?auto_5942 ) ( AVAILABLE ?auto_5944 ) ( not ( = ?auto_5947 ?auto_5945 ) ) ( HOIST-AT ?auto_5948 ?auto_5947 ) ( AVAILABLE ?auto_5948 ) ( SURFACE-AT ?auto_5942 ?auto_5947 ) ( ON ?auto_5942 ?auto_5949 ) ( CLEAR ?auto_5942 ) ( TRUCK-AT ?auto_5946 ?auto_5945 ) ( not ( = ?auto_5942 ?auto_5943 ) ) ( not ( = ?auto_5942 ?auto_5949 ) ) ( not ( = ?auto_5943 ?auto_5949 ) ) ( not ( = ?auto_5944 ?auto_5948 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5946 ?auto_5945 ?auto_5947 )
      ( !LIFT ?auto_5948 ?auto_5942 ?auto_5949 ?auto_5947 )
      ( !LOAD ?auto_5948 ?auto_5942 ?auto_5946 ?auto_5947 )
      ( !DRIVE ?auto_5946 ?auto_5947 ?auto_5945 )
      ( !UNLOAD ?auto_5944 ?auto_5942 ?auto_5946 ?auto_5945 )
      ( !DROP ?auto_5944 ?auto_5942 ?auto_5943 ?auto_5945 )
      ( MAKE-ON-VERIFY ?auto_5942 ?auto_5943 ) )
  )

)

