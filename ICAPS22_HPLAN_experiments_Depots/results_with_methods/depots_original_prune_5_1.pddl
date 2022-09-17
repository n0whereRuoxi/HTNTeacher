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
      ?auto_3705 - SURFACE
      ?auto_3706 - SURFACE
    )
    :vars
    (
      ?auto_3707 - HOIST
      ?auto_3708 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3707 ?auto_3708 ) ( SURFACE-AT ?auto_3706 ?auto_3708 ) ( CLEAR ?auto_3706 ) ( LIFTING ?auto_3707 ?auto_3705 ) ( IS-CRATE ?auto_3705 ) ( not ( = ?auto_3705 ?auto_3706 ) ) )
    :subtasks
    ( ( !DROP ?auto_3707 ?auto_3705 ?auto_3706 ?auto_3708 )
      ( MAKE-ON-VERIFY ?auto_3705 ?auto_3706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3709 - SURFACE
      ?auto_3710 - SURFACE
    )
    :vars
    (
      ?auto_3711 - HOIST
      ?auto_3712 - PLACE
      ?auto_3713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3711 ?auto_3712 ) ( SURFACE-AT ?auto_3710 ?auto_3712 ) ( CLEAR ?auto_3710 ) ( IS-CRATE ?auto_3709 ) ( not ( = ?auto_3709 ?auto_3710 ) ) ( TRUCK-AT ?auto_3713 ?auto_3712 ) ( AVAILABLE ?auto_3711 ) ( IN ?auto_3709 ?auto_3713 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3711 ?auto_3709 ?auto_3713 ?auto_3712 )
      ( MAKE-ON ?auto_3709 ?auto_3710 )
      ( MAKE-ON-VERIFY ?auto_3709 ?auto_3710 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3714 - SURFACE
      ?auto_3715 - SURFACE
    )
    :vars
    (
      ?auto_3716 - HOIST
      ?auto_3717 - PLACE
      ?auto_3718 - TRUCK
      ?auto_3719 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3716 ?auto_3717 ) ( SURFACE-AT ?auto_3715 ?auto_3717 ) ( CLEAR ?auto_3715 ) ( IS-CRATE ?auto_3714 ) ( not ( = ?auto_3714 ?auto_3715 ) ) ( AVAILABLE ?auto_3716 ) ( IN ?auto_3714 ?auto_3718 ) ( TRUCK-AT ?auto_3718 ?auto_3719 ) ( not ( = ?auto_3719 ?auto_3717 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3718 ?auto_3719 ?auto_3717 )
      ( MAKE-ON ?auto_3714 ?auto_3715 )
      ( MAKE-ON-VERIFY ?auto_3714 ?auto_3715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3720 - SURFACE
      ?auto_3721 - SURFACE
    )
    :vars
    (
      ?auto_3724 - HOIST
      ?auto_3723 - PLACE
      ?auto_3722 - TRUCK
      ?auto_3725 - PLACE
      ?auto_3726 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3724 ?auto_3723 ) ( SURFACE-AT ?auto_3721 ?auto_3723 ) ( CLEAR ?auto_3721 ) ( IS-CRATE ?auto_3720 ) ( not ( = ?auto_3720 ?auto_3721 ) ) ( AVAILABLE ?auto_3724 ) ( TRUCK-AT ?auto_3722 ?auto_3725 ) ( not ( = ?auto_3725 ?auto_3723 ) ) ( HOIST-AT ?auto_3726 ?auto_3725 ) ( LIFTING ?auto_3726 ?auto_3720 ) ( not ( = ?auto_3724 ?auto_3726 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3726 ?auto_3720 ?auto_3722 ?auto_3725 )
      ( MAKE-ON ?auto_3720 ?auto_3721 )
      ( MAKE-ON-VERIFY ?auto_3720 ?auto_3721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3727 - SURFACE
      ?auto_3728 - SURFACE
    )
    :vars
    (
      ?auto_3730 - HOIST
      ?auto_3729 - PLACE
      ?auto_3731 - TRUCK
      ?auto_3732 - PLACE
      ?auto_3733 - HOIST
      ?auto_3734 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3730 ?auto_3729 ) ( SURFACE-AT ?auto_3728 ?auto_3729 ) ( CLEAR ?auto_3728 ) ( IS-CRATE ?auto_3727 ) ( not ( = ?auto_3727 ?auto_3728 ) ) ( AVAILABLE ?auto_3730 ) ( TRUCK-AT ?auto_3731 ?auto_3732 ) ( not ( = ?auto_3732 ?auto_3729 ) ) ( HOIST-AT ?auto_3733 ?auto_3732 ) ( not ( = ?auto_3730 ?auto_3733 ) ) ( AVAILABLE ?auto_3733 ) ( SURFACE-AT ?auto_3727 ?auto_3732 ) ( ON ?auto_3727 ?auto_3734 ) ( CLEAR ?auto_3727 ) ( not ( = ?auto_3727 ?auto_3734 ) ) ( not ( = ?auto_3728 ?auto_3734 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3733 ?auto_3727 ?auto_3734 ?auto_3732 )
      ( MAKE-ON ?auto_3727 ?auto_3728 )
      ( MAKE-ON-VERIFY ?auto_3727 ?auto_3728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3735 - SURFACE
      ?auto_3736 - SURFACE
    )
    :vars
    (
      ?auto_3742 - HOIST
      ?auto_3741 - PLACE
      ?auto_3739 - PLACE
      ?auto_3737 - HOIST
      ?auto_3740 - SURFACE
      ?auto_3738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3742 ?auto_3741 ) ( SURFACE-AT ?auto_3736 ?auto_3741 ) ( CLEAR ?auto_3736 ) ( IS-CRATE ?auto_3735 ) ( not ( = ?auto_3735 ?auto_3736 ) ) ( AVAILABLE ?auto_3742 ) ( not ( = ?auto_3739 ?auto_3741 ) ) ( HOIST-AT ?auto_3737 ?auto_3739 ) ( not ( = ?auto_3742 ?auto_3737 ) ) ( AVAILABLE ?auto_3737 ) ( SURFACE-AT ?auto_3735 ?auto_3739 ) ( ON ?auto_3735 ?auto_3740 ) ( CLEAR ?auto_3735 ) ( not ( = ?auto_3735 ?auto_3740 ) ) ( not ( = ?auto_3736 ?auto_3740 ) ) ( TRUCK-AT ?auto_3738 ?auto_3741 ) )
    :subtasks
    ( ( !DRIVE ?auto_3738 ?auto_3741 ?auto_3739 )
      ( MAKE-ON ?auto_3735 ?auto_3736 )
      ( MAKE-ON-VERIFY ?auto_3735 ?auto_3736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3783 - SURFACE
      ?auto_3784 - SURFACE
    )
    :vars
    (
      ?auto_3787 - HOIST
      ?auto_3788 - PLACE
      ?auto_3789 - PLACE
      ?auto_3785 - HOIST
      ?auto_3790 - SURFACE
      ?auto_3786 - TRUCK
      ?auto_3791 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3787 ?auto_3788 ) ( IS-CRATE ?auto_3783 ) ( not ( = ?auto_3783 ?auto_3784 ) ) ( not ( = ?auto_3789 ?auto_3788 ) ) ( HOIST-AT ?auto_3785 ?auto_3789 ) ( not ( = ?auto_3787 ?auto_3785 ) ) ( AVAILABLE ?auto_3785 ) ( SURFACE-AT ?auto_3783 ?auto_3789 ) ( ON ?auto_3783 ?auto_3790 ) ( CLEAR ?auto_3783 ) ( not ( = ?auto_3783 ?auto_3790 ) ) ( not ( = ?auto_3784 ?auto_3790 ) ) ( TRUCK-AT ?auto_3786 ?auto_3788 ) ( SURFACE-AT ?auto_3791 ?auto_3788 ) ( CLEAR ?auto_3791 ) ( LIFTING ?auto_3787 ?auto_3784 ) ( IS-CRATE ?auto_3784 ) ( not ( = ?auto_3783 ?auto_3791 ) ) ( not ( = ?auto_3784 ?auto_3791 ) ) ( not ( = ?auto_3790 ?auto_3791 ) ) )
    :subtasks
    ( ( !DROP ?auto_3787 ?auto_3784 ?auto_3791 ?auto_3788 )
      ( MAKE-ON ?auto_3783 ?auto_3784 )
      ( MAKE-ON-VERIFY ?auto_3783 ?auto_3784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3792 - SURFACE
      ?auto_3793 - SURFACE
    )
    :vars
    (
      ?auto_3795 - HOIST
      ?auto_3794 - PLACE
      ?auto_3799 - PLACE
      ?auto_3796 - HOIST
      ?auto_3797 - SURFACE
      ?auto_3800 - TRUCK
      ?auto_3798 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3795 ?auto_3794 ) ( IS-CRATE ?auto_3792 ) ( not ( = ?auto_3792 ?auto_3793 ) ) ( not ( = ?auto_3799 ?auto_3794 ) ) ( HOIST-AT ?auto_3796 ?auto_3799 ) ( not ( = ?auto_3795 ?auto_3796 ) ) ( AVAILABLE ?auto_3796 ) ( SURFACE-AT ?auto_3792 ?auto_3799 ) ( ON ?auto_3792 ?auto_3797 ) ( CLEAR ?auto_3792 ) ( not ( = ?auto_3792 ?auto_3797 ) ) ( not ( = ?auto_3793 ?auto_3797 ) ) ( TRUCK-AT ?auto_3800 ?auto_3794 ) ( SURFACE-AT ?auto_3798 ?auto_3794 ) ( CLEAR ?auto_3798 ) ( IS-CRATE ?auto_3793 ) ( not ( = ?auto_3792 ?auto_3798 ) ) ( not ( = ?auto_3793 ?auto_3798 ) ) ( not ( = ?auto_3797 ?auto_3798 ) ) ( AVAILABLE ?auto_3795 ) ( IN ?auto_3793 ?auto_3800 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3795 ?auto_3793 ?auto_3800 ?auto_3794 )
      ( MAKE-ON ?auto_3792 ?auto_3793 )
      ( MAKE-ON-VERIFY ?auto_3792 ?auto_3793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3807 - SURFACE
      ?auto_3808 - SURFACE
    )
    :vars
    (
      ?auto_3812 - HOIST
      ?auto_3814 - PLACE
      ?auto_3813 - PLACE
      ?auto_3810 - HOIST
      ?auto_3811 - SURFACE
      ?auto_3809 - TRUCK
      ?auto_3815 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3812 ?auto_3814 ) ( SURFACE-AT ?auto_3808 ?auto_3814 ) ( CLEAR ?auto_3808 ) ( IS-CRATE ?auto_3807 ) ( not ( = ?auto_3807 ?auto_3808 ) ) ( AVAILABLE ?auto_3812 ) ( not ( = ?auto_3813 ?auto_3814 ) ) ( HOIST-AT ?auto_3810 ?auto_3813 ) ( not ( = ?auto_3812 ?auto_3810 ) ) ( AVAILABLE ?auto_3810 ) ( SURFACE-AT ?auto_3807 ?auto_3813 ) ( ON ?auto_3807 ?auto_3811 ) ( CLEAR ?auto_3807 ) ( not ( = ?auto_3807 ?auto_3811 ) ) ( not ( = ?auto_3808 ?auto_3811 ) ) ( TRUCK-AT ?auto_3809 ?auto_3815 ) ( not ( = ?auto_3815 ?auto_3814 ) ) ( not ( = ?auto_3813 ?auto_3815 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3809 ?auto_3815 ?auto_3814 )
      ( MAKE-ON ?auto_3807 ?auto_3808 )
      ( MAKE-ON-VERIFY ?auto_3807 ?auto_3808 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3874 - SURFACE
      ?auto_3875 - SURFACE
    )
    :vars
    (
      ?auto_3882 - HOIST
      ?auto_3880 - PLACE
      ?auto_3876 - PLACE
      ?auto_3878 - HOIST
      ?auto_3877 - SURFACE
      ?auto_3879 - SURFACE
      ?auto_3881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3882 ?auto_3880 ) ( IS-CRATE ?auto_3874 ) ( not ( = ?auto_3874 ?auto_3875 ) ) ( not ( = ?auto_3876 ?auto_3880 ) ) ( HOIST-AT ?auto_3878 ?auto_3876 ) ( not ( = ?auto_3882 ?auto_3878 ) ) ( AVAILABLE ?auto_3878 ) ( SURFACE-AT ?auto_3874 ?auto_3876 ) ( ON ?auto_3874 ?auto_3877 ) ( CLEAR ?auto_3874 ) ( not ( = ?auto_3874 ?auto_3877 ) ) ( not ( = ?auto_3875 ?auto_3877 ) ) ( SURFACE-AT ?auto_3879 ?auto_3880 ) ( CLEAR ?auto_3879 ) ( IS-CRATE ?auto_3875 ) ( not ( = ?auto_3874 ?auto_3879 ) ) ( not ( = ?auto_3875 ?auto_3879 ) ) ( not ( = ?auto_3877 ?auto_3879 ) ) ( AVAILABLE ?auto_3882 ) ( IN ?auto_3875 ?auto_3881 ) ( TRUCK-AT ?auto_3881 ?auto_3876 ) )
    :subtasks
    ( ( !DRIVE ?auto_3881 ?auto_3876 ?auto_3880 )
      ( MAKE-ON ?auto_3874 ?auto_3875 )
      ( MAKE-ON-VERIFY ?auto_3874 ?auto_3875 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3883 - SURFACE
      ?auto_3884 - SURFACE
    )
    :vars
    (
      ?auto_3889 - HOIST
      ?auto_3887 - PLACE
      ?auto_3888 - PLACE
      ?auto_3885 - HOIST
      ?auto_3886 - SURFACE
      ?auto_3890 - SURFACE
      ?auto_3891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3889 ?auto_3887 ) ( IS-CRATE ?auto_3883 ) ( not ( = ?auto_3883 ?auto_3884 ) ) ( not ( = ?auto_3888 ?auto_3887 ) ) ( HOIST-AT ?auto_3885 ?auto_3888 ) ( not ( = ?auto_3889 ?auto_3885 ) ) ( SURFACE-AT ?auto_3883 ?auto_3888 ) ( ON ?auto_3883 ?auto_3886 ) ( CLEAR ?auto_3883 ) ( not ( = ?auto_3883 ?auto_3886 ) ) ( not ( = ?auto_3884 ?auto_3886 ) ) ( SURFACE-AT ?auto_3890 ?auto_3887 ) ( CLEAR ?auto_3890 ) ( IS-CRATE ?auto_3884 ) ( not ( = ?auto_3883 ?auto_3890 ) ) ( not ( = ?auto_3884 ?auto_3890 ) ) ( not ( = ?auto_3886 ?auto_3890 ) ) ( AVAILABLE ?auto_3889 ) ( TRUCK-AT ?auto_3891 ?auto_3888 ) ( LIFTING ?auto_3885 ?auto_3884 ) )
    :subtasks
    ( ( !LOAD ?auto_3885 ?auto_3884 ?auto_3891 ?auto_3888 )
      ( MAKE-ON ?auto_3883 ?auto_3884 )
      ( MAKE-ON-VERIFY ?auto_3883 ?auto_3884 ) )
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
      ?auto_3900 - PLACE
      ?auto_3898 - PLACE
      ?auto_3896 - HOIST
      ?auto_3899 - SURFACE
      ?auto_3895 - SURFACE
      ?auto_3897 - TRUCK
      ?auto_3901 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3894 ?auto_3900 ) ( IS-CRATE ?auto_3892 ) ( not ( = ?auto_3892 ?auto_3893 ) ) ( not ( = ?auto_3898 ?auto_3900 ) ) ( HOIST-AT ?auto_3896 ?auto_3898 ) ( not ( = ?auto_3894 ?auto_3896 ) ) ( SURFACE-AT ?auto_3892 ?auto_3898 ) ( ON ?auto_3892 ?auto_3899 ) ( CLEAR ?auto_3892 ) ( not ( = ?auto_3892 ?auto_3899 ) ) ( not ( = ?auto_3893 ?auto_3899 ) ) ( SURFACE-AT ?auto_3895 ?auto_3900 ) ( CLEAR ?auto_3895 ) ( IS-CRATE ?auto_3893 ) ( not ( = ?auto_3892 ?auto_3895 ) ) ( not ( = ?auto_3893 ?auto_3895 ) ) ( not ( = ?auto_3899 ?auto_3895 ) ) ( AVAILABLE ?auto_3894 ) ( TRUCK-AT ?auto_3897 ?auto_3898 ) ( AVAILABLE ?auto_3896 ) ( SURFACE-AT ?auto_3893 ?auto_3898 ) ( ON ?auto_3893 ?auto_3901 ) ( CLEAR ?auto_3893 ) ( not ( = ?auto_3892 ?auto_3901 ) ) ( not ( = ?auto_3893 ?auto_3901 ) ) ( not ( = ?auto_3899 ?auto_3901 ) ) ( not ( = ?auto_3895 ?auto_3901 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3896 ?auto_3893 ?auto_3901 ?auto_3898 )
      ( MAKE-ON ?auto_3892 ?auto_3893 )
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
      ?auto_3907 - PLACE
      ?auto_3908 - PLACE
      ?auto_3909 - HOIST
      ?auto_3905 - SURFACE
      ?auto_3910 - SURFACE
      ?auto_3906 - SURFACE
      ?auto_3911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3904 ?auto_3907 ) ( IS-CRATE ?auto_3902 ) ( not ( = ?auto_3902 ?auto_3903 ) ) ( not ( = ?auto_3908 ?auto_3907 ) ) ( HOIST-AT ?auto_3909 ?auto_3908 ) ( not ( = ?auto_3904 ?auto_3909 ) ) ( SURFACE-AT ?auto_3902 ?auto_3908 ) ( ON ?auto_3902 ?auto_3905 ) ( CLEAR ?auto_3902 ) ( not ( = ?auto_3902 ?auto_3905 ) ) ( not ( = ?auto_3903 ?auto_3905 ) ) ( SURFACE-AT ?auto_3910 ?auto_3907 ) ( CLEAR ?auto_3910 ) ( IS-CRATE ?auto_3903 ) ( not ( = ?auto_3902 ?auto_3910 ) ) ( not ( = ?auto_3903 ?auto_3910 ) ) ( not ( = ?auto_3905 ?auto_3910 ) ) ( AVAILABLE ?auto_3904 ) ( AVAILABLE ?auto_3909 ) ( SURFACE-AT ?auto_3903 ?auto_3908 ) ( ON ?auto_3903 ?auto_3906 ) ( CLEAR ?auto_3903 ) ( not ( = ?auto_3902 ?auto_3906 ) ) ( not ( = ?auto_3903 ?auto_3906 ) ) ( not ( = ?auto_3905 ?auto_3906 ) ) ( not ( = ?auto_3910 ?auto_3906 ) ) ( TRUCK-AT ?auto_3911 ?auto_3907 ) )
    :subtasks
    ( ( !DRIVE ?auto_3911 ?auto_3907 ?auto_3908 )
      ( MAKE-ON ?auto_3902 ?auto_3903 )
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
      ?auto_3921 - HOIST
      ?auto_3919 - PLACE
      ?auto_3917 - PLACE
      ?auto_3914 - HOIST
      ?auto_3918 - SURFACE
      ?auto_3915 - SURFACE
      ?auto_3916 - SURFACE
      ?auto_3920 - TRUCK
      ?auto_3922 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3921 ?auto_3919 ) ( IS-CRATE ?auto_3912 ) ( not ( = ?auto_3912 ?auto_3913 ) ) ( not ( = ?auto_3917 ?auto_3919 ) ) ( HOIST-AT ?auto_3914 ?auto_3917 ) ( not ( = ?auto_3921 ?auto_3914 ) ) ( SURFACE-AT ?auto_3912 ?auto_3917 ) ( ON ?auto_3912 ?auto_3918 ) ( CLEAR ?auto_3912 ) ( not ( = ?auto_3912 ?auto_3918 ) ) ( not ( = ?auto_3913 ?auto_3918 ) ) ( IS-CRATE ?auto_3913 ) ( not ( = ?auto_3912 ?auto_3915 ) ) ( not ( = ?auto_3913 ?auto_3915 ) ) ( not ( = ?auto_3918 ?auto_3915 ) ) ( AVAILABLE ?auto_3914 ) ( SURFACE-AT ?auto_3913 ?auto_3917 ) ( ON ?auto_3913 ?auto_3916 ) ( CLEAR ?auto_3913 ) ( not ( = ?auto_3912 ?auto_3916 ) ) ( not ( = ?auto_3913 ?auto_3916 ) ) ( not ( = ?auto_3918 ?auto_3916 ) ) ( not ( = ?auto_3915 ?auto_3916 ) ) ( TRUCK-AT ?auto_3920 ?auto_3919 ) ( SURFACE-AT ?auto_3922 ?auto_3919 ) ( CLEAR ?auto_3922 ) ( LIFTING ?auto_3921 ?auto_3915 ) ( IS-CRATE ?auto_3915 ) ( not ( = ?auto_3912 ?auto_3922 ) ) ( not ( = ?auto_3913 ?auto_3922 ) ) ( not ( = ?auto_3918 ?auto_3922 ) ) ( not ( = ?auto_3915 ?auto_3922 ) ) ( not ( = ?auto_3916 ?auto_3922 ) ) )
    :subtasks
    ( ( !DROP ?auto_3921 ?auto_3915 ?auto_3922 ?auto_3919 )
      ( MAKE-ON ?auto_3912 ?auto_3913 )
      ( MAKE-ON-VERIFY ?auto_3912 ?auto_3913 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4044 - SURFACE
      ?auto_4045 - SURFACE
    )
    :vars
    (
      ?auto_4048 - HOIST
      ?auto_4051 - PLACE
      ?auto_4047 - PLACE
      ?auto_4050 - HOIST
      ?auto_4046 - SURFACE
      ?auto_4052 - SURFACE
      ?auto_4053 - TRUCK
      ?auto_4049 - SURFACE
      ?auto_4054 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4048 ?auto_4051 ) ( IS-CRATE ?auto_4044 ) ( not ( = ?auto_4044 ?auto_4045 ) ) ( not ( = ?auto_4047 ?auto_4051 ) ) ( HOIST-AT ?auto_4050 ?auto_4047 ) ( not ( = ?auto_4048 ?auto_4050 ) ) ( SURFACE-AT ?auto_4044 ?auto_4047 ) ( ON ?auto_4044 ?auto_4046 ) ( CLEAR ?auto_4044 ) ( not ( = ?auto_4044 ?auto_4046 ) ) ( not ( = ?auto_4045 ?auto_4046 ) ) ( SURFACE-AT ?auto_4052 ?auto_4051 ) ( CLEAR ?auto_4052 ) ( IS-CRATE ?auto_4045 ) ( not ( = ?auto_4044 ?auto_4052 ) ) ( not ( = ?auto_4045 ?auto_4052 ) ) ( not ( = ?auto_4046 ?auto_4052 ) ) ( AVAILABLE ?auto_4048 ) ( TRUCK-AT ?auto_4053 ?auto_4047 ) ( SURFACE-AT ?auto_4045 ?auto_4047 ) ( ON ?auto_4045 ?auto_4049 ) ( CLEAR ?auto_4045 ) ( not ( = ?auto_4044 ?auto_4049 ) ) ( not ( = ?auto_4045 ?auto_4049 ) ) ( not ( = ?auto_4046 ?auto_4049 ) ) ( not ( = ?auto_4052 ?auto_4049 ) ) ( LIFTING ?auto_4050 ?auto_4054 ) ( IS-CRATE ?auto_4054 ) ( not ( = ?auto_4044 ?auto_4054 ) ) ( not ( = ?auto_4045 ?auto_4054 ) ) ( not ( = ?auto_4046 ?auto_4054 ) ) ( not ( = ?auto_4052 ?auto_4054 ) ) ( not ( = ?auto_4049 ?auto_4054 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4050 ?auto_4054 ?auto_4053 ?auto_4047 )
      ( MAKE-ON ?auto_4044 ?auto_4045 )
      ( MAKE-ON-VERIFY ?auto_4044 ?auto_4045 ) )
  )

)

