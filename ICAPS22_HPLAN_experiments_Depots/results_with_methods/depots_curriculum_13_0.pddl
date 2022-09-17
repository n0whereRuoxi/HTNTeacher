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
      ?auto_3852 - SURFACE
      ?auto_3853 - SURFACE
    )
    :vars
    (
      ?auto_3854 - HOIST
      ?auto_3855 - PLACE
      ?auto_3857 - PLACE
      ?auto_3858 - HOIST
      ?auto_3859 - SURFACE
      ?auto_3856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3854 ?auto_3855 ) ( SURFACE-AT ?auto_3853 ?auto_3855 ) ( CLEAR ?auto_3853 ) ( IS-CRATE ?auto_3852 ) ( AVAILABLE ?auto_3854 ) ( not ( = ?auto_3857 ?auto_3855 ) ) ( HOIST-AT ?auto_3858 ?auto_3857 ) ( AVAILABLE ?auto_3858 ) ( SURFACE-AT ?auto_3852 ?auto_3857 ) ( ON ?auto_3852 ?auto_3859 ) ( CLEAR ?auto_3852 ) ( TRUCK-AT ?auto_3856 ?auto_3855 ) ( not ( = ?auto_3852 ?auto_3853 ) ) ( not ( = ?auto_3852 ?auto_3859 ) ) ( not ( = ?auto_3853 ?auto_3859 ) ) ( not ( = ?auto_3854 ?auto_3858 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3856 ?auto_3855 ?auto_3857 )
      ( !LIFT ?auto_3858 ?auto_3852 ?auto_3859 ?auto_3857 )
      ( !LOAD ?auto_3858 ?auto_3852 ?auto_3856 ?auto_3857 )
      ( !DRIVE ?auto_3856 ?auto_3857 ?auto_3855 )
      ( !UNLOAD ?auto_3854 ?auto_3852 ?auto_3856 ?auto_3855 )
      ( !DROP ?auto_3854 ?auto_3852 ?auto_3853 ?auto_3855 )
      ( MAKE-ON-VERIFY ?auto_3852 ?auto_3853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3862 - SURFACE
      ?auto_3863 - SURFACE
    )
    :vars
    (
      ?auto_3864 - HOIST
      ?auto_3865 - PLACE
      ?auto_3867 - PLACE
      ?auto_3868 - HOIST
      ?auto_3869 - SURFACE
      ?auto_3866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3864 ?auto_3865 ) ( SURFACE-AT ?auto_3863 ?auto_3865 ) ( CLEAR ?auto_3863 ) ( IS-CRATE ?auto_3862 ) ( AVAILABLE ?auto_3864 ) ( not ( = ?auto_3867 ?auto_3865 ) ) ( HOIST-AT ?auto_3868 ?auto_3867 ) ( AVAILABLE ?auto_3868 ) ( SURFACE-AT ?auto_3862 ?auto_3867 ) ( ON ?auto_3862 ?auto_3869 ) ( CLEAR ?auto_3862 ) ( TRUCK-AT ?auto_3866 ?auto_3865 ) ( not ( = ?auto_3862 ?auto_3863 ) ) ( not ( = ?auto_3862 ?auto_3869 ) ) ( not ( = ?auto_3863 ?auto_3869 ) ) ( not ( = ?auto_3864 ?auto_3868 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3866 ?auto_3865 ?auto_3867 )
      ( !LIFT ?auto_3868 ?auto_3862 ?auto_3869 ?auto_3867 )
      ( !LOAD ?auto_3868 ?auto_3862 ?auto_3866 ?auto_3867 )
      ( !DRIVE ?auto_3866 ?auto_3867 ?auto_3865 )
      ( !UNLOAD ?auto_3864 ?auto_3862 ?auto_3866 ?auto_3865 )
      ( !DROP ?auto_3864 ?auto_3862 ?auto_3863 ?auto_3865 )
      ( MAKE-ON-VERIFY ?auto_3862 ?auto_3863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3872 - SURFACE
      ?auto_3873 - SURFACE
    )
    :vars
    (
      ?auto_3874 - HOIST
      ?auto_3875 - PLACE
      ?auto_3877 - PLACE
      ?auto_3878 - HOIST
      ?auto_3879 - SURFACE
      ?auto_3876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3874 ?auto_3875 ) ( SURFACE-AT ?auto_3873 ?auto_3875 ) ( CLEAR ?auto_3873 ) ( IS-CRATE ?auto_3872 ) ( AVAILABLE ?auto_3874 ) ( not ( = ?auto_3877 ?auto_3875 ) ) ( HOIST-AT ?auto_3878 ?auto_3877 ) ( AVAILABLE ?auto_3878 ) ( SURFACE-AT ?auto_3872 ?auto_3877 ) ( ON ?auto_3872 ?auto_3879 ) ( CLEAR ?auto_3872 ) ( TRUCK-AT ?auto_3876 ?auto_3875 ) ( not ( = ?auto_3872 ?auto_3873 ) ) ( not ( = ?auto_3872 ?auto_3879 ) ) ( not ( = ?auto_3873 ?auto_3879 ) ) ( not ( = ?auto_3874 ?auto_3878 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3876 ?auto_3875 ?auto_3877 )
      ( !LIFT ?auto_3878 ?auto_3872 ?auto_3879 ?auto_3877 )
      ( !LOAD ?auto_3878 ?auto_3872 ?auto_3876 ?auto_3877 )
      ( !DRIVE ?auto_3876 ?auto_3877 ?auto_3875 )
      ( !UNLOAD ?auto_3874 ?auto_3872 ?auto_3876 ?auto_3875 )
      ( !DROP ?auto_3874 ?auto_3872 ?auto_3873 ?auto_3875 )
      ( MAKE-ON-VERIFY ?auto_3872 ?auto_3873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3882 - SURFACE
      ?auto_3883 - SURFACE
    )
    :vars
    (
      ?auto_3884 - HOIST
      ?auto_3885 - PLACE
      ?auto_3887 - PLACE
      ?auto_3888 - HOIST
      ?auto_3889 - SURFACE
      ?auto_3886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3884 ?auto_3885 ) ( SURFACE-AT ?auto_3883 ?auto_3885 ) ( CLEAR ?auto_3883 ) ( IS-CRATE ?auto_3882 ) ( AVAILABLE ?auto_3884 ) ( not ( = ?auto_3887 ?auto_3885 ) ) ( HOIST-AT ?auto_3888 ?auto_3887 ) ( AVAILABLE ?auto_3888 ) ( SURFACE-AT ?auto_3882 ?auto_3887 ) ( ON ?auto_3882 ?auto_3889 ) ( CLEAR ?auto_3882 ) ( TRUCK-AT ?auto_3886 ?auto_3885 ) ( not ( = ?auto_3882 ?auto_3883 ) ) ( not ( = ?auto_3882 ?auto_3889 ) ) ( not ( = ?auto_3883 ?auto_3889 ) ) ( not ( = ?auto_3884 ?auto_3888 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3886 ?auto_3885 ?auto_3887 )
      ( !LIFT ?auto_3888 ?auto_3882 ?auto_3889 ?auto_3887 )
      ( !LOAD ?auto_3888 ?auto_3882 ?auto_3886 ?auto_3887 )
      ( !DRIVE ?auto_3886 ?auto_3887 ?auto_3885 )
      ( !UNLOAD ?auto_3884 ?auto_3882 ?auto_3886 ?auto_3885 )
      ( !DROP ?auto_3884 ?auto_3882 ?auto_3883 ?auto_3885 )
      ( MAKE-ON-VERIFY ?auto_3882 ?auto_3883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3892 - SURFACE
      ?auto_3893 - SURFACE
    )
    :vars
    (
      ?auto_3894 - HOIST
      ?auto_3895 - PLACE
      ?auto_3897 - PLACE
      ?auto_3898 - HOIST
      ?auto_3899 - SURFACE
      ?auto_3896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3894 ?auto_3895 ) ( SURFACE-AT ?auto_3893 ?auto_3895 ) ( CLEAR ?auto_3893 ) ( IS-CRATE ?auto_3892 ) ( AVAILABLE ?auto_3894 ) ( not ( = ?auto_3897 ?auto_3895 ) ) ( HOIST-AT ?auto_3898 ?auto_3897 ) ( AVAILABLE ?auto_3898 ) ( SURFACE-AT ?auto_3892 ?auto_3897 ) ( ON ?auto_3892 ?auto_3899 ) ( CLEAR ?auto_3892 ) ( TRUCK-AT ?auto_3896 ?auto_3895 ) ( not ( = ?auto_3892 ?auto_3893 ) ) ( not ( = ?auto_3892 ?auto_3899 ) ) ( not ( = ?auto_3893 ?auto_3899 ) ) ( not ( = ?auto_3894 ?auto_3898 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3896 ?auto_3895 ?auto_3897 )
      ( !LIFT ?auto_3898 ?auto_3892 ?auto_3899 ?auto_3897 )
      ( !LOAD ?auto_3898 ?auto_3892 ?auto_3896 ?auto_3897 )
      ( !DRIVE ?auto_3896 ?auto_3897 ?auto_3895 )
      ( !UNLOAD ?auto_3894 ?auto_3892 ?auto_3896 ?auto_3895 )
      ( !DROP ?auto_3894 ?auto_3892 ?auto_3893 ?auto_3895 )
      ( MAKE-ON-VERIFY ?auto_3892 ?auto_3893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3902 - SURFACE
      ?auto_3903 - SURFACE
    )
    :vars
    (
      ?auto_3904 - HOIST
      ?auto_3905 - PLACE
      ?auto_3907 - PLACE
      ?auto_3908 - HOIST
      ?auto_3909 - SURFACE
      ?auto_3906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3904 ?auto_3905 ) ( SURFACE-AT ?auto_3903 ?auto_3905 ) ( CLEAR ?auto_3903 ) ( IS-CRATE ?auto_3902 ) ( AVAILABLE ?auto_3904 ) ( not ( = ?auto_3907 ?auto_3905 ) ) ( HOIST-AT ?auto_3908 ?auto_3907 ) ( AVAILABLE ?auto_3908 ) ( SURFACE-AT ?auto_3902 ?auto_3907 ) ( ON ?auto_3902 ?auto_3909 ) ( CLEAR ?auto_3902 ) ( TRUCK-AT ?auto_3906 ?auto_3905 ) ( not ( = ?auto_3902 ?auto_3903 ) ) ( not ( = ?auto_3902 ?auto_3909 ) ) ( not ( = ?auto_3903 ?auto_3909 ) ) ( not ( = ?auto_3904 ?auto_3908 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3906 ?auto_3905 ?auto_3907 )
      ( !LIFT ?auto_3908 ?auto_3902 ?auto_3909 ?auto_3907 )
      ( !LOAD ?auto_3908 ?auto_3902 ?auto_3906 ?auto_3907 )
      ( !DRIVE ?auto_3906 ?auto_3907 ?auto_3905 )
      ( !UNLOAD ?auto_3904 ?auto_3902 ?auto_3906 ?auto_3905 )
      ( !DROP ?auto_3904 ?auto_3902 ?auto_3903 ?auto_3905 )
      ( MAKE-ON-VERIFY ?auto_3902 ?auto_3903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3912 - SURFACE
      ?auto_3913 - SURFACE
    )
    :vars
    (
      ?auto_3914 - HOIST
      ?auto_3915 - PLACE
      ?auto_3917 - PLACE
      ?auto_3918 - HOIST
      ?auto_3919 - SURFACE
      ?auto_3916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3914 ?auto_3915 ) ( SURFACE-AT ?auto_3913 ?auto_3915 ) ( CLEAR ?auto_3913 ) ( IS-CRATE ?auto_3912 ) ( AVAILABLE ?auto_3914 ) ( not ( = ?auto_3917 ?auto_3915 ) ) ( HOIST-AT ?auto_3918 ?auto_3917 ) ( AVAILABLE ?auto_3918 ) ( SURFACE-AT ?auto_3912 ?auto_3917 ) ( ON ?auto_3912 ?auto_3919 ) ( CLEAR ?auto_3912 ) ( TRUCK-AT ?auto_3916 ?auto_3915 ) ( not ( = ?auto_3912 ?auto_3913 ) ) ( not ( = ?auto_3912 ?auto_3919 ) ) ( not ( = ?auto_3913 ?auto_3919 ) ) ( not ( = ?auto_3914 ?auto_3918 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3916 ?auto_3915 ?auto_3917 )
      ( !LIFT ?auto_3918 ?auto_3912 ?auto_3919 ?auto_3917 )
      ( !LOAD ?auto_3918 ?auto_3912 ?auto_3916 ?auto_3917 )
      ( !DRIVE ?auto_3916 ?auto_3917 ?auto_3915 )
      ( !UNLOAD ?auto_3914 ?auto_3912 ?auto_3916 ?auto_3915 )
      ( !DROP ?auto_3914 ?auto_3912 ?auto_3913 ?auto_3915 )
      ( MAKE-ON-VERIFY ?auto_3912 ?auto_3913 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3922 - SURFACE
      ?auto_3923 - SURFACE
    )
    :vars
    (
      ?auto_3924 - HOIST
      ?auto_3925 - PLACE
      ?auto_3927 - PLACE
      ?auto_3928 - HOIST
      ?auto_3929 - SURFACE
      ?auto_3926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3924 ?auto_3925 ) ( SURFACE-AT ?auto_3923 ?auto_3925 ) ( CLEAR ?auto_3923 ) ( IS-CRATE ?auto_3922 ) ( AVAILABLE ?auto_3924 ) ( not ( = ?auto_3927 ?auto_3925 ) ) ( HOIST-AT ?auto_3928 ?auto_3927 ) ( AVAILABLE ?auto_3928 ) ( SURFACE-AT ?auto_3922 ?auto_3927 ) ( ON ?auto_3922 ?auto_3929 ) ( CLEAR ?auto_3922 ) ( TRUCK-AT ?auto_3926 ?auto_3925 ) ( not ( = ?auto_3922 ?auto_3923 ) ) ( not ( = ?auto_3922 ?auto_3929 ) ) ( not ( = ?auto_3923 ?auto_3929 ) ) ( not ( = ?auto_3924 ?auto_3928 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3926 ?auto_3925 ?auto_3927 )
      ( !LIFT ?auto_3928 ?auto_3922 ?auto_3929 ?auto_3927 )
      ( !LOAD ?auto_3928 ?auto_3922 ?auto_3926 ?auto_3927 )
      ( !DRIVE ?auto_3926 ?auto_3927 ?auto_3925 )
      ( !UNLOAD ?auto_3924 ?auto_3922 ?auto_3926 ?auto_3925 )
      ( !DROP ?auto_3924 ?auto_3922 ?auto_3923 ?auto_3925 )
      ( MAKE-ON-VERIFY ?auto_3922 ?auto_3923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3932 - SURFACE
      ?auto_3933 - SURFACE
    )
    :vars
    (
      ?auto_3934 - HOIST
      ?auto_3935 - PLACE
      ?auto_3937 - PLACE
      ?auto_3938 - HOIST
      ?auto_3939 - SURFACE
      ?auto_3936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3934 ?auto_3935 ) ( SURFACE-AT ?auto_3933 ?auto_3935 ) ( CLEAR ?auto_3933 ) ( IS-CRATE ?auto_3932 ) ( AVAILABLE ?auto_3934 ) ( not ( = ?auto_3937 ?auto_3935 ) ) ( HOIST-AT ?auto_3938 ?auto_3937 ) ( AVAILABLE ?auto_3938 ) ( SURFACE-AT ?auto_3932 ?auto_3937 ) ( ON ?auto_3932 ?auto_3939 ) ( CLEAR ?auto_3932 ) ( TRUCK-AT ?auto_3936 ?auto_3935 ) ( not ( = ?auto_3932 ?auto_3933 ) ) ( not ( = ?auto_3932 ?auto_3939 ) ) ( not ( = ?auto_3933 ?auto_3939 ) ) ( not ( = ?auto_3934 ?auto_3938 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3936 ?auto_3935 ?auto_3937 )
      ( !LIFT ?auto_3938 ?auto_3932 ?auto_3939 ?auto_3937 )
      ( !LOAD ?auto_3938 ?auto_3932 ?auto_3936 ?auto_3937 )
      ( !DRIVE ?auto_3936 ?auto_3937 ?auto_3935 )
      ( !UNLOAD ?auto_3934 ?auto_3932 ?auto_3936 ?auto_3935 )
      ( !DROP ?auto_3934 ?auto_3932 ?auto_3933 ?auto_3935 )
      ( MAKE-ON-VERIFY ?auto_3932 ?auto_3933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3942 - SURFACE
      ?auto_3943 - SURFACE
    )
    :vars
    (
      ?auto_3944 - HOIST
      ?auto_3945 - PLACE
      ?auto_3947 - PLACE
      ?auto_3948 - HOIST
      ?auto_3949 - SURFACE
      ?auto_3946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3944 ?auto_3945 ) ( SURFACE-AT ?auto_3943 ?auto_3945 ) ( CLEAR ?auto_3943 ) ( IS-CRATE ?auto_3942 ) ( AVAILABLE ?auto_3944 ) ( not ( = ?auto_3947 ?auto_3945 ) ) ( HOIST-AT ?auto_3948 ?auto_3947 ) ( AVAILABLE ?auto_3948 ) ( SURFACE-AT ?auto_3942 ?auto_3947 ) ( ON ?auto_3942 ?auto_3949 ) ( CLEAR ?auto_3942 ) ( TRUCK-AT ?auto_3946 ?auto_3945 ) ( not ( = ?auto_3942 ?auto_3943 ) ) ( not ( = ?auto_3942 ?auto_3949 ) ) ( not ( = ?auto_3943 ?auto_3949 ) ) ( not ( = ?auto_3944 ?auto_3948 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3946 ?auto_3945 ?auto_3947 )
      ( !LIFT ?auto_3948 ?auto_3942 ?auto_3949 ?auto_3947 )
      ( !LOAD ?auto_3948 ?auto_3942 ?auto_3946 ?auto_3947 )
      ( !DRIVE ?auto_3946 ?auto_3947 ?auto_3945 )
      ( !UNLOAD ?auto_3944 ?auto_3942 ?auto_3946 ?auto_3945 )
      ( !DROP ?auto_3944 ?auto_3942 ?auto_3943 ?auto_3945 )
      ( MAKE-ON-VERIFY ?auto_3942 ?auto_3943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3952 - SURFACE
      ?auto_3953 - SURFACE
    )
    :vars
    (
      ?auto_3954 - HOIST
      ?auto_3955 - PLACE
      ?auto_3957 - PLACE
      ?auto_3958 - HOIST
      ?auto_3959 - SURFACE
      ?auto_3956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3954 ?auto_3955 ) ( SURFACE-AT ?auto_3953 ?auto_3955 ) ( CLEAR ?auto_3953 ) ( IS-CRATE ?auto_3952 ) ( AVAILABLE ?auto_3954 ) ( not ( = ?auto_3957 ?auto_3955 ) ) ( HOIST-AT ?auto_3958 ?auto_3957 ) ( AVAILABLE ?auto_3958 ) ( SURFACE-AT ?auto_3952 ?auto_3957 ) ( ON ?auto_3952 ?auto_3959 ) ( CLEAR ?auto_3952 ) ( TRUCK-AT ?auto_3956 ?auto_3955 ) ( not ( = ?auto_3952 ?auto_3953 ) ) ( not ( = ?auto_3952 ?auto_3959 ) ) ( not ( = ?auto_3953 ?auto_3959 ) ) ( not ( = ?auto_3954 ?auto_3958 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3956 ?auto_3955 ?auto_3957 )
      ( !LIFT ?auto_3958 ?auto_3952 ?auto_3959 ?auto_3957 )
      ( !LOAD ?auto_3958 ?auto_3952 ?auto_3956 ?auto_3957 )
      ( !DRIVE ?auto_3956 ?auto_3957 ?auto_3955 )
      ( !UNLOAD ?auto_3954 ?auto_3952 ?auto_3956 ?auto_3955 )
      ( !DROP ?auto_3954 ?auto_3952 ?auto_3953 ?auto_3955 )
      ( MAKE-ON-VERIFY ?auto_3952 ?auto_3953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3962 - SURFACE
      ?auto_3963 - SURFACE
    )
    :vars
    (
      ?auto_3964 - HOIST
      ?auto_3965 - PLACE
      ?auto_3967 - PLACE
      ?auto_3968 - HOIST
      ?auto_3969 - SURFACE
      ?auto_3966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3964 ?auto_3965 ) ( SURFACE-AT ?auto_3963 ?auto_3965 ) ( CLEAR ?auto_3963 ) ( IS-CRATE ?auto_3962 ) ( AVAILABLE ?auto_3964 ) ( not ( = ?auto_3967 ?auto_3965 ) ) ( HOIST-AT ?auto_3968 ?auto_3967 ) ( AVAILABLE ?auto_3968 ) ( SURFACE-AT ?auto_3962 ?auto_3967 ) ( ON ?auto_3962 ?auto_3969 ) ( CLEAR ?auto_3962 ) ( TRUCK-AT ?auto_3966 ?auto_3965 ) ( not ( = ?auto_3962 ?auto_3963 ) ) ( not ( = ?auto_3962 ?auto_3969 ) ) ( not ( = ?auto_3963 ?auto_3969 ) ) ( not ( = ?auto_3964 ?auto_3968 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3966 ?auto_3965 ?auto_3967 )
      ( !LIFT ?auto_3968 ?auto_3962 ?auto_3969 ?auto_3967 )
      ( !LOAD ?auto_3968 ?auto_3962 ?auto_3966 ?auto_3967 )
      ( !DRIVE ?auto_3966 ?auto_3967 ?auto_3965 )
      ( !UNLOAD ?auto_3964 ?auto_3962 ?auto_3966 ?auto_3965 )
      ( !DROP ?auto_3964 ?auto_3962 ?auto_3963 ?auto_3965 )
      ( MAKE-ON-VERIFY ?auto_3962 ?auto_3963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3972 - SURFACE
      ?auto_3973 - SURFACE
    )
    :vars
    (
      ?auto_3974 - HOIST
      ?auto_3975 - PLACE
      ?auto_3977 - PLACE
      ?auto_3978 - HOIST
      ?auto_3979 - SURFACE
      ?auto_3976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3974 ?auto_3975 ) ( SURFACE-AT ?auto_3973 ?auto_3975 ) ( CLEAR ?auto_3973 ) ( IS-CRATE ?auto_3972 ) ( AVAILABLE ?auto_3974 ) ( not ( = ?auto_3977 ?auto_3975 ) ) ( HOIST-AT ?auto_3978 ?auto_3977 ) ( AVAILABLE ?auto_3978 ) ( SURFACE-AT ?auto_3972 ?auto_3977 ) ( ON ?auto_3972 ?auto_3979 ) ( CLEAR ?auto_3972 ) ( TRUCK-AT ?auto_3976 ?auto_3975 ) ( not ( = ?auto_3972 ?auto_3973 ) ) ( not ( = ?auto_3972 ?auto_3979 ) ) ( not ( = ?auto_3973 ?auto_3979 ) ) ( not ( = ?auto_3974 ?auto_3978 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3976 ?auto_3975 ?auto_3977 )
      ( !LIFT ?auto_3978 ?auto_3972 ?auto_3979 ?auto_3977 )
      ( !LOAD ?auto_3978 ?auto_3972 ?auto_3976 ?auto_3977 )
      ( !DRIVE ?auto_3976 ?auto_3977 ?auto_3975 )
      ( !UNLOAD ?auto_3974 ?auto_3972 ?auto_3976 ?auto_3975 )
      ( !DROP ?auto_3974 ?auto_3972 ?auto_3973 ?auto_3975 )
      ( MAKE-ON-VERIFY ?auto_3972 ?auto_3973 ) )
  )

)

