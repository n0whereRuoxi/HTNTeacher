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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3734 - SURFACE
      ?auto_3735 - SURFACE
    )
    :vars
    (
      ?auto_3736 - HOIST
      ?auto_3737 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3736 ?auto_3737 ) ( SURFACE-AT ?auto_3734 ?auto_3737 ) ( CLEAR ?auto_3734 ) ( LIFTING ?auto_3736 ?auto_3735 ) ( IS-CRATE ?auto_3735 ) ( not ( = ?auto_3734 ?auto_3735 ) ) )
    :subtasks
    ( ( !DROP ?auto_3736 ?auto_3735 ?auto_3734 ?auto_3737 )
      ( MAKE-1CRATE-VERIFY ?auto_3734 ?auto_3735 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3738 - SURFACE
      ?auto_3739 - SURFACE
    )
    :vars
    (
      ?auto_3740 - HOIST
      ?auto_3741 - PLACE
      ?auto_3742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3740 ?auto_3741 ) ( SURFACE-AT ?auto_3738 ?auto_3741 ) ( CLEAR ?auto_3738 ) ( IS-CRATE ?auto_3739 ) ( not ( = ?auto_3738 ?auto_3739 ) ) ( TRUCK-AT ?auto_3742 ?auto_3741 ) ( AVAILABLE ?auto_3740 ) ( IN ?auto_3739 ?auto_3742 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3740 ?auto_3739 ?auto_3742 ?auto_3741 )
      ( MAKE-1CRATE ?auto_3738 ?auto_3739 )
      ( MAKE-1CRATE-VERIFY ?auto_3738 ?auto_3739 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3743 - SURFACE
      ?auto_3744 - SURFACE
    )
    :vars
    (
      ?auto_3747 - HOIST
      ?auto_3746 - PLACE
      ?auto_3745 - TRUCK
      ?auto_3748 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3747 ?auto_3746 ) ( SURFACE-AT ?auto_3743 ?auto_3746 ) ( CLEAR ?auto_3743 ) ( IS-CRATE ?auto_3744 ) ( not ( = ?auto_3743 ?auto_3744 ) ) ( AVAILABLE ?auto_3747 ) ( IN ?auto_3744 ?auto_3745 ) ( TRUCK-AT ?auto_3745 ?auto_3748 ) ( not ( = ?auto_3748 ?auto_3746 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3745 ?auto_3748 ?auto_3746 )
      ( MAKE-1CRATE ?auto_3743 ?auto_3744 )
      ( MAKE-1CRATE-VERIFY ?auto_3743 ?auto_3744 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3749 - SURFACE
      ?auto_3750 - SURFACE
    )
    :vars
    (
      ?auto_3752 - HOIST
      ?auto_3751 - PLACE
      ?auto_3754 - TRUCK
      ?auto_3753 - PLACE
      ?auto_3755 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3752 ?auto_3751 ) ( SURFACE-AT ?auto_3749 ?auto_3751 ) ( CLEAR ?auto_3749 ) ( IS-CRATE ?auto_3750 ) ( not ( = ?auto_3749 ?auto_3750 ) ) ( AVAILABLE ?auto_3752 ) ( TRUCK-AT ?auto_3754 ?auto_3753 ) ( not ( = ?auto_3753 ?auto_3751 ) ) ( HOIST-AT ?auto_3755 ?auto_3753 ) ( LIFTING ?auto_3755 ?auto_3750 ) ( not ( = ?auto_3752 ?auto_3755 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3755 ?auto_3750 ?auto_3754 ?auto_3753 )
      ( MAKE-1CRATE ?auto_3749 ?auto_3750 )
      ( MAKE-1CRATE-VERIFY ?auto_3749 ?auto_3750 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3756 - SURFACE
      ?auto_3757 - SURFACE
    )
    :vars
    (
      ?auto_3760 - HOIST
      ?auto_3758 - PLACE
      ?auto_3762 - TRUCK
      ?auto_3761 - PLACE
      ?auto_3759 - HOIST
      ?auto_3763 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3760 ?auto_3758 ) ( SURFACE-AT ?auto_3756 ?auto_3758 ) ( CLEAR ?auto_3756 ) ( IS-CRATE ?auto_3757 ) ( not ( = ?auto_3756 ?auto_3757 ) ) ( AVAILABLE ?auto_3760 ) ( TRUCK-AT ?auto_3762 ?auto_3761 ) ( not ( = ?auto_3761 ?auto_3758 ) ) ( HOIST-AT ?auto_3759 ?auto_3761 ) ( not ( = ?auto_3760 ?auto_3759 ) ) ( AVAILABLE ?auto_3759 ) ( SURFACE-AT ?auto_3757 ?auto_3761 ) ( ON ?auto_3757 ?auto_3763 ) ( CLEAR ?auto_3757 ) ( not ( = ?auto_3756 ?auto_3763 ) ) ( not ( = ?auto_3757 ?auto_3763 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3759 ?auto_3757 ?auto_3763 ?auto_3761 )
      ( MAKE-1CRATE ?auto_3756 ?auto_3757 )
      ( MAKE-1CRATE-VERIFY ?auto_3756 ?auto_3757 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3764 - SURFACE
      ?auto_3765 - SURFACE
    )
    :vars
    (
      ?auto_3769 - HOIST
      ?auto_3770 - PLACE
      ?auto_3766 - PLACE
      ?auto_3767 - HOIST
      ?auto_3768 - SURFACE
      ?auto_3771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3769 ?auto_3770 ) ( SURFACE-AT ?auto_3764 ?auto_3770 ) ( CLEAR ?auto_3764 ) ( IS-CRATE ?auto_3765 ) ( not ( = ?auto_3764 ?auto_3765 ) ) ( AVAILABLE ?auto_3769 ) ( not ( = ?auto_3766 ?auto_3770 ) ) ( HOIST-AT ?auto_3767 ?auto_3766 ) ( not ( = ?auto_3769 ?auto_3767 ) ) ( AVAILABLE ?auto_3767 ) ( SURFACE-AT ?auto_3765 ?auto_3766 ) ( ON ?auto_3765 ?auto_3768 ) ( CLEAR ?auto_3765 ) ( not ( = ?auto_3764 ?auto_3768 ) ) ( not ( = ?auto_3765 ?auto_3768 ) ) ( TRUCK-AT ?auto_3771 ?auto_3770 ) )
    :subtasks
    ( ( !DRIVE ?auto_3771 ?auto_3770 ?auto_3766 )
      ( MAKE-1CRATE ?auto_3764 ?auto_3765 )
      ( MAKE-1CRATE-VERIFY ?auto_3764 ?auto_3765 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3777 - SURFACE
      ?auto_3778 - SURFACE
    )
    :vars
    (
      ?auto_3779 - HOIST
      ?auto_3780 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3779 ?auto_3780 ) ( SURFACE-AT ?auto_3777 ?auto_3780 ) ( CLEAR ?auto_3777 ) ( LIFTING ?auto_3779 ?auto_3778 ) ( IS-CRATE ?auto_3778 ) ( not ( = ?auto_3777 ?auto_3778 ) ) )
    :subtasks
    ( ( !DROP ?auto_3779 ?auto_3778 ?auto_3777 ?auto_3780 )
      ( MAKE-1CRATE-VERIFY ?auto_3777 ?auto_3778 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3781 - SURFACE
      ?auto_3782 - SURFACE
      ?auto_3783 - SURFACE
    )
    :vars
    (
      ?auto_3785 - HOIST
      ?auto_3784 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3785 ?auto_3784 ) ( SURFACE-AT ?auto_3782 ?auto_3784 ) ( CLEAR ?auto_3782 ) ( LIFTING ?auto_3785 ?auto_3783 ) ( IS-CRATE ?auto_3783 ) ( not ( = ?auto_3782 ?auto_3783 ) ) ( ON ?auto_3782 ?auto_3781 ) ( not ( = ?auto_3781 ?auto_3782 ) ) ( not ( = ?auto_3781 ?auto_3783 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3782 ?auto_3783 )
      ( MAKE-2CRATE-VERIFY ?auto_3781 ?auto_3782 ?auto_3783 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3786 - SURFACE
      ?auto_3787 - SURFACE
    )
    :vars
    (
      ?auto_3789 - HOIST
      ?auto_3788 - PLACE
      ?auto_3790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3789 ?auto_3788 ) ( SURFACE-AT ?auto_3786 ?auto_3788 ) ( CLEAR ?auto_3786 ) ( IS-CRATE ?auto_3787 ) ( not ( = ?auto_3786 ?auto_3787 ) ) ( TRUCK-AT ?auto_3790 ?auto_3788 ) ( AVAILABLE ?auto_3789 ) ( IN ?auto_3787 ?auto_3790 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3789 ?auto_3787 ?auto_3790 ?auto_3788 )
      ( MAKE-1CRATE ?auto_3786 ?auto_3787 )
      ( MAKE-1CRATE-VERIFY ?auto_3786 ?auto_3787 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3791 - SURFACE
      ?auto_3792 - SURFACE
      ?auto_3793 - SURFACE
    )
    :vars
    (
      ?auto_3794 - HOIST
      ?auto_3796 - PLACE
      ?auto_3795 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3794 ?auto_3796 ) ( SURFACE-AT ?auto_3792 ?auto_3796 ) ( CLEAR ?auto_3792 ) ( IS-CRATE ?auto_3793 ) ( not ( = ?auto_3792 ?auto_3793 ) ) ( TRUCK-AT ?auto_3795 ?auto_3796 ) ( AVAILABLE ?auto_3794 ) ( IN ?auto_3793 ?auto_3795 ) ( ON ?auto_3792 ?auto_3791 ) ( not ( = ?auto_3791 ?auto_3792 ) ) ( not ( = ?auto_3791 ?auto_3793 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3792 ?auto_3793 )
      ( MAKE-2CRATE-VERIFY ?auto_3791 ?auto_3792 ?auto_3793 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3797 - SURFACE
      ?auto_3798 - SURFACE
    )
    :vars
    (
      ?auto_3799 - HOIST
      ?auto_3800 - PLACE
      ?auto_3801 - TRUCK
      ?auto_3802 - SURFACE
      ?auto_3803 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3799 ?auto_3800 ) ( SURFACE-AT ?auto_3797 ?auto_3800 ) ( CLEAR ?auto_3797 ) ( IS-CRATE ?auto_3798 ) ( not ( = ?auto_3797 ?auto_3798 ) ) ( AVAILABLE ?auto_3799 ) ( IN ?auto_3798 ?auto_3801 ) ( ON ?auto_3797 ?auto_3802 ) ( not ( = ?auto_3802 ?auto_3797 ) ) ( not ( = ?auto_3802 ?auto_3798 ) ) ( TRUCK-AT ?auto_3801 ?auto_3803 ) ( not ( = ?auto_3803 ?auto_3800 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3801 ?auto_3803 ?auto_3800 )
      ( MAKE-2CRATE ?auto_3802 ?auto_3797 ?auto_3798 )
      ( MAKE-1CRATE-VERIFY ?auto_3797 ?auto_3798 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3804 - SURFACE
      ?auto_3805 - SURFACE
      ?auto_3806 - SURFACE
    )
    :vars
    (
      ?auto_3807 - HOIST
      ?auto_3808 - PLACE
      ?auto_3809 - TRUCK
      ?auto_3810 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3807 ?auto_3808 ) ( SURFACE-AT ?auto_3805 ?auto_3808 ) ( CLEAR ?auto_3805 ) ( IS-CRATE ?auto_3806 ) ( not ( = ?auto_3805 ?auto_3806 ) ) ( AVAILABLE ?auto_3807 ) ( IN ?auto_3806 ?auto_3809 ) ( ON ?auto_3805 ?auto_3804 ) ( not ( = ?auto_3804 ?auto_3805 ) ) ( not ( = ?auto_3804 ?auto_3806 ) ) ( TRUCK-AT ?auto_3809 ?auto_3810 ) ( not ( = ?auto_3810 ?auto_3808 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3805 ?auto_3806 )
      ( MAKE-2CRATE-VERIFY ?auto_3804 ?auto_3805 ?auto_3806 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3811 - SURFACE
      ?auto_3812 - SURFACE
    )
    :vars
    (
      ?auto_3817 - HOIST
      ?auto_3816 - PLACE
      ?auto_3814 - SURFACE
      ?auto_3815 - TRUCK
      ?auto_3813 - PLACE
      ?auto_3818 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3817 ?auto_3816 ) ( SURFACE-AT ?auto_3811 ?auto_3816 ) ( CLEAR ?auto_3811 ) ( IS-CRATE ?auto_3812 ) ( not ( = ?auto_3811 ?auto_3812 ) ) ( AVAILABLE ?auto_3817 ) ( ON ?auto_3811 ?auto_3814 ) ( not ( = ?auto_3814 ?auto_3811 ) ) ( not ( = ?auto_3814 ?auto_3812 ) ) ( TRUCK-AT ?auto_3815 ?auto_3813 ) ( not ( = ?auto_3813 ?auto_3816 ) ) ( HOIST-AT ?auto_3818 ?auto_3813 ) ( LIFTING ?auto_3818 ?auto_3812 ) ( not ( = ?auto_3817 ?auto_3818 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3818 ?auto_3812 ?auto_3815 ?auto_3813 )
      ( MAKE-2CRATE ?auto_3814 ?auto_3811 ?auto_3812 )
      ( MAKE-1CRATE-VERIFY ?auto_3811 ?auto_3812 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3819 - SURFACE
      ?auto_3820 - SURFACE
      ?auto_3821 - SURFACE
    )
    :vars
    (
      ?auto_3824 - HOIST
      ?auto_3825 - PLACE
      ?auto_3823 - TRUCK
      ?auto_3822 - PLACE
      ?auto_3826 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3824 ?auto_3825 ) ( SURFACE-AT ?auto_3820 ?auto_3825 ) ( CLEAR ?auto_3820 ) ( IS-CRATE ?auto_3821 ) ( not ( = ?auto_3820 ?auto_3821 ) ) ( AVAILABLE ?auto_3824 ) ( ON ?auto_3820 ?auto_3819 ) ( not ( = ?auto_3819 ?auto_3820 ) ) ( not ( = ?auto_3819 ?auto_3821 ) ) ( TRUCK-AT ?auto_3823 ?auto_3822 ) ( not ( = ?auto_3822 ?auto_3825 ) ) ( HOIST-AT ?auto_3826 ?auto_3822 ) ( LIFTING ?auto_3826 ?auto_3821 ) ( not ( = ?auto_3824 ?auto_3826 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3820 ?auto_3821 )
      ( MAKE-2CRATE-VERIFY ?auto_3819 ?auto_3820 ?auto_3821 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3827 - SURFACE
      ?auto_3828 - SURFACE
    )
    :vars
    (
      ?auto_3831 - HOIST
      ?auto_3830 - PLACE
      ?auto_3834 - SURFACE
      ?auto_3832 - TRUCK
      ?auto_3833 - PLACE
      ?auto_3829 - HOIST
      ?auto_3835 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3831 ?auto_3830 ) ( SURFACE-AT ?auto_3827 ?auto_3830 ) ( CLEAR ?auto_3827 ) ( IS-CRATE ?auto_3828 ) ( not ( = ?auto_3827 ?auto_3828 ) ) ( AVAILABLE ?auto_3831 ) ( ON ?auto_3827 ?auto_3834 ) ( not ( = ?auto_3834 ?auto_3827 ) ) ( not ( = ?auto_3834 ?auto_3828 ) ) ( TRUCK-AT ?auto_3832 ?auto_3833 ) ( not ( = ?auto_3833 ?auto_3830 ) ) ( HOIST-AT ?auto_3829 ?auto_3833 ) ( not ( = ?auto_3831 ?auto_3829 ) ) ( AVAILABLE ?auto_3829 ) ( SURFACE-AT ?auto_3828 ?auto_3833 ) ( ON ?auto_3828 ?auto_3835 ) ( CLEAR ?auto_3828 ) ( not ( = ?auto_3827 ?auto_3835 ) ) ( not ( = ?auto_3828 ?auto_3835 ) ) ( not ( = ?auto_3834 ?auto_3835 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3829 ?auto_3828 ?auto_3835 ?auto_3833 )
      ( MAKE-2CRATE ?auto_3834 ?auto_3827 ?auto_3828 )
      ( MAKE-1CRATE-VERIFY ?auto_3827 ?auto_3828 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3836 - SURFACE
      ?auto_3837 - SURFACE
      ?auto_3838 - SURFACE
    )
    :vars
    (
      ?auto_3839 - HOIST
      ?auto_3843 - PLACE
      ?auto_3840 - TRUCK
      ?auto_3841 - PLACE
      ?auto_3842 - HOIST
      ?auto_3844 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3839 ?auto_3843 ) ( SURFACE-AT ?auto_3837 ?auto_3843 ) ( CLEAR ?auto_3837 ) ( IS-CRATE ?auto_3838 ) ( not ( = ?auto_3837 ?auto_3838 ) ) ( AVAILABLE ?auto_3839 ) ( ON ?auto_3837 ?auto_3836 ) ( not ( = ?auto_3836 ?auto_3837 ) ) ( not ( = ?auto_3836 ?auto_3838 ) ) ( TRUCK-AT ?auto_3840 ?auto_3841 ) ( not ( = ?auto_3841 ?auto_3843 ) ) ( HOIST-AT ?auto_3842 ?auto_3841 ) ( not ( = ?auto_3839 ?auto_3842 ) ) ( AVAILABLE ?auto_3842 ) ( SURFACE-AT ?auto_3838 ?auto_3841 ) ( ON ?auto_3838 ?auto_3844 ) ( CLEAR ?auto_3838 ) ( not ( = ?auto_3837 ?auto_3844 ) ) ( not ( = ?auto_3838 ?auto_3844 ) ) ( not ( = ?auto_3836 ?auto_3844 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3837 ?auto_3838 )
      ( MAKE-2CRATE-VERIFY ?auto_3836 ?auto_3837 ?auto_3838 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3845 - SURFACE
      ?auto_3846 - SURFACE
    )
    :vars
    (
      ?auto_3851 - HOIST
      ?auto_3849 - PLACE
      ?auto_3847 - SURFACE
      ?auto_3853 - PLACE
      ?auto_3850 - HOIST
      ?auto_3848 - SURFACE
      ?auto_3852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3851 ?auto_3849 ) ( SURFACE-AT ?auto_3845 ?auto_3849 ) ( CLEAR ?auto_3845 ) ( IS-CRATE ?auto_3846 ) ( not ( = ?auto_3845 ?auto_3846 ) ) ( AVAILABLE ?auto_3851 ) ( ON ?auto_3845 ?auto_3847 ) ( not ( = ?auto_3847 ?auto_3845 ) ) ( not ( = ?auto_3847 ?auto_3846 ) ) ( not ( = ?auto_3853 ?auto_3849 ) ) ( HOIST-AT ?auto_3850 ?auto_3853 ) ( not ( = ?auto_3851 ?auto_3850 ) ) ( AVAILABLE ?auto_3850 ) ( SURFACE-AT ?auto_3846 ?auto_3853 ) ( ON ?auto_3846 ?auto_3848 ) ( CLEAR ?auto_3846 ) ( not ( = ?auto_3845 ?auto_3848 ) ) ( not ( = ?auto_3846 ?auto_3848 ) ) ( not ( = ?auto_3847 ?auto_3848 ) ) ( TRUCK-AT ?auto_3852 ?auto_3849 ) )
    :subtasks
    ( ( !DRIVE ?auto_3852 ?auto_3849 ?auto_3853 )
      ( MAKE-2CRATE ?auto_3847 ?auto_3845 ?auto_3846 )
      ( MAKE-1CRATE-VERIFY ?auto_3845 ?auto_3846 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3854 - SURFACE
      ?auto_3855 - SURFACE
      ?auto_3856 - SURFACE
    )
    :vars
    (
      ?auto_3857 - HOIST
      ?auto_3859 - PLACE
      ?auto_3858 - PLACE
      ?auto_3860 - HOIST
      ?auto_3862 - SURFACE
      ?auto_3861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3857 ?auto_3859 ) ( SURFACE-AT ?auto_3855 ?auto_3859 ) ( CLEAR ?auto_3855 ) ( IS-CRATE ?auto_3856 ) ( not ( = ?auto_3855 ?auto_3856 ) ) ( AVAILABLE ?auto_3857 ) ( ON ?auto_3855 ?auto_3854 ) ( not ( = ?auto_3854 ?auto_3855 ) ) ( not ( = ?auto_3854 ?auto_3856 ) ) ( not ( = ?auto_3858 ?auto_3859 ) ) ( HOIST-AT ?auto_3860 ?auto_3858 ) ( not ( = ?auto_3857 ?auto_3860 ) ) ( AVAILABLE ?auto_3860 ) ( SURFACE-AT ?auto_3856 ?auto_3858 ) ( ON ?auto_3856 ?auto_3862 ) ( CLEAR ?auto_3856 ) ( not ( = ?auto_3855 ?auto_3862 ) ) ( not ( = ?auto_3856 ?auto_3862 ) ) ( not ( = ?auto_3854 ?auto_3862 ) ) ( TRUCK-AT ?auto_3861 ?auto_3859 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3855 ?auto_3856 )
      ( MAKE-2CRATE-VERIFY ?auto_3854 ?auto_3855 ?auto_3856 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3863 - SURFACE
      ?auto_3864 - SURFACE
    )
    :vars
    (
      ?auto_3871 - HOIST
      ?auto_3866 - PLACE
      ?auto_3869 - SURFACE
      ?auto_3865 - PLACE
      ?auto_3868 - HOIST
      ?auto_3867 - SURFACE
      ?auto_3870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3871 ?auto_3866 ) ( IS-CRATE ?auto_3864 ) ( not ( = ?auto_3863 ?auto_3864 ) ) ( not ( = ?auto_3869 ?auto_3863 ) ) ( not ( = ?auto_3869 ?auto_3864 ) ) ( not ( = ?auto_3865 ?auto_3866 ) ) ( HOIST-AT ?auto_3868 ?auto_3865 ) ( not ( = ?auto_3871 ?auto_3868 ) ) ( AVAILABLE ?auto_3868 ) ( SURFACE-AT ?auto_3864 ?auto_3865 ) ( ON ?auto_3864 ?auto_3867 ) ( CLEAR ?auto_3864 ) ( not ( = ?auto_3863 ?auto_3867 ) ) ( not ( = ?auto_3864 ?auto_3867 ) ) ( not ( = ?auto_3869 ?auto_3867 ) ) ( TRUCK-AT ?auto_3870 ?auto_3866 ) ( SURFACE-AT ?auto_3869 ?auto_3866 ) ( CLEAR ?auto_3869 ) ( LIFTING ?auto_3871 ?auto_3863 ) ( IS-CRATE ?auto_3863 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3869 ?auto_3863 )
      ( MAKE-2CRATE ?auto_3869 ?auto_3863 ?auto_3864 )
      ( MAKE-1CRATE-VERIFY ?auto_3863 ?auto_3864 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3872 - SURFACE
      ?auto_3873 - SURFACE
      ?auto_3874 - SURFACE
    )
    :vars
    (
      ?auto_3879 - HOIST
      ?auto_3876 - PLACE
      ?auto_3880 - PLACE
      ?auto_3878 - HOIST
      ?auto_3875 - SURFACE
      ?auto_3877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3879 ?auto_3876 ) ( IS-CRATE ?auto_3874 ) ( not ( = ?auto_3873 ?auto_3874 ) ) ( not ( = ?auto_3872 ?auto_3873 ) ) ( not ( = ?auto_3872 ?auto_3874 ) ) ( not ( = ?auto_3880 ?auto_3876 ) ) ( HOIST-AT ?auto_3878 ?auto_3880 ) ( not ( = ?auto_3879 ?auto_3878 ) ) ( AVAILABLE ?auto_3878 ) ( SURFACE-AT ?auto_3874 ?auto_3880 ) ( ON ?auto_3874 ?auto_3875 ) ( CLEAR ?auto_3874 ) ( not ( = ?auto_3873 ?auto_3875 ) ) ( not ( = ?auto_3874 ?auto_3875 ) ) ( not ( = ?auto_3872 ?auto_3875 ) ) ( TRUCK-AT ?auto_3877 ?auto_3876 ) ( SURFACE-AT ?auto_3872 ?auto_3876 ) ( CLEAR ?auto_3872 ) ( LIFTING ?auto_3879 ?auto_3873 ) ( IS-CRATE ?auto_3873 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3873 ?auto_3874 )
      ( MAKE-2CRATE-VERIFY ?auto_3872 ?auto_3873 ?auto_3874 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3881 - SURFACE
      ?auto_3882 - SURFACE
    )
    :vars
    (
      ?auto_3883 - HOIST
      ?auto_3885 - PLACE
      ?auto_3888 - SURFACE
      ?auto_3884 - PLACE
      ?auto_3889 - HOIST
      ?auto_3887 - SURFACE
      ?auto_3886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3883 ?auto_3885 ) ( IS-CRATE ?auto_3882 ) ( not ( = ?auto_3881 ?auto_3882 ) ) ( not ( = ?auto_3888 ?auto_3881 ) ) ( not ( = ?auto_3888 ?auto_3882 ) ) ( not ( = ?auto_3884 ?auto_3885 ) ) ( HOIST-AT ?auto_3889 ?auto_3884 ) ( not ( = ?auto_3883 ?auto_3889 ) ) ( AVAILABLE ?auto_3889 ) ( SURFACE-AT ?auto_3882 ?auto_3884 ) ( ON ?auto_3882 ?auto_3887 ) ( CLEAR ?auto_3882 ) ( not ( = ?auto_3881 ?auto_3887 ) ) ( not ( = ?auto_3882 ?auto_3887 ) ) ( not ( = ?auto_3888 ?auto_3887 ) ) ( TRUCK-AT ?auto_3886 ?auto_3885 ) ( SURFACE-AT ?auto_3888 ?auto_3885 ) ( CLEAR ?auto_3888 ) ( IS-CRATE ?auto_3881 ) ( AVAILABLE ?auto_3883 ) ( IN ?auto_3881 ?auto_3886 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3883 ?auto_3881 ?auto_3886 ?auto_3885 )
      ( MAKE-2CRATE ?auto_3888 ?auto_3881 ?auto_3882 )
      ( MAKE-1CRATE-VERIFY ?auto_3881 ?auto_3882 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3890 - SURFACE
      ?auto_3891 - SURFACE
      ?auto_3892 - SURFACE
    )
    :vars
    (
      ?auto_3894 - HOIST
      ?auto_3897 - PLACE
      ?auto_3896 - PLACE
      ?auto_3898 - HOIST
      ?auto_3893 - SURFACE
      ?auto_3895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3894 ?auto_3897 ) ( IS-CRATE ?auto_3892 ) ( not ( = ?auto_3891 ?auto_3892 ) ) ( not ( = ?auto_3890 ?auto_3891 ) ) ( not ( = ?auto_3890 ?auto_3892 ) ) ( not ( = ?auto_3896 ?auto_3897 ) ) ( HOIST-AT ?auto_3898 ?auto_3896 ) ( not ( = ?auto_3894 ?auto_3898 ) ) ( AVAILABLE ?auto_3898 ) ( SURFACE-AT ?auto_3892 ?auto_3896 ) ( ON ?auto_3892 ?auto_3893 ) ( CLEAR ?auto_3892 ) ( not ( = ?auto_3891 ?auto_3893 ) ) ( not ( = ?auto_3892 ?auto_3893 ) ) ( not ( = ?auto_3890 ?auto_3893 ) ) ( TRUCK-AT ?auto_3895 ?auto_3897 ) ( SURFACE-AT ?auto_3890 ?auto_3897 ) ( CLEAR ?auto_3890 ) ( IS-CRATE ?auto_3891 ) ( AVAILABLE ?auto_3894 ) ( IN ?auto_3891 ?auto_3895 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3891 ?auto_3892 )
      ( MAKE-2CRATE-VERIFY ?auto_3890 ?auto_3891 ?auto_3892 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3899 - SURFACE
      ?auto_3900 - SURFACE
    )
    :vars
    (
      ?auto_3907 - HOIST
      ?auto_3901 - PLACE
      ?auto_3904 - SURFACE
      ?auto_3905 - PLACE
      ?auto_3902 - HOIST
      ?auto_3906 - SURFACE
      ?auto_3903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3907 ?auto_3901 ) ( IS-CRATE ?auto_3900 ) ( not ( = ?auto_3899 ?auto_3900 ) ) ( not ( = ?auto_3904 ?auto_3899 ) ) ( not ( = ?auto_3904 ?auto_3900 ) ) ( not ( = ?auto_3905 ?auto_3901 ) ) ( HOIST-AT ?auto_3902 ?auto_3905 ) ( not ( = ?auto_3907 ?auto_3902 ) ) ( AVAILABLE ?auto_3902 ) ( SURFACE-AT ?auto_3900 ?auto_3905 ) ( ON ?auto_3900 ?auto_3906 ) ( CLEAR ?auto_3900 ) ( not ( = ?auto_3899 ?auto_3906 ) ) ( not ( = ?auto_3900 ?auto_3906 ) ) ( not ( = ?auto_3904 ?auto_3906 ) ) ( SURFACE-AT ?auto_3904 ?auto_3901 ) ( CLEAR ?auto_3904 ) ( IS-CRATE ?auto_3899 ) ( AVAILABLE ?auto_3907 ) ( IN ?auto_3899 ?auto_3903 ) ( TRUCK-AT ?auto_3903 ?auto_3905 ) )
    :subtasks
    ( ( !DRIVE ?auto_3903 ?auto_3905 ?auto_3901 )
      ( MAKE-2CRATE ?auto_3904 ?auto_3899 ?auto_3900 )
      ( MAKE-1CRATE-VERIFY ?auto_3899 ?auto_3900 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3908 - SURFACE
      ?auto_3909 - SURFACE
      ?auto_3910 - SURFACE
    )
    :vars
    (
      ?auto_3913 - HOIST
      ?auto_3916 - PLACE
      ?auto_3912 - PLACE
      ?auto_3914 - HOIST
      ?auto_3915 - SURFACE
      ?auto_3911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3913 ?auto_3916 ) ( IS-CRATE ?auto_3910 ) ( not ( = ?auto_3909 ?auto_3910 ) ) ( not ( = ?auto_3908 ?auto_3909 ) ) ( not ( = ?auto_3908 ?auto_3910 ) ) ( not ( = ?auto_3912 ?auto_3916 ) ) ( HOIST-AT ?auto_3914 ?auto_3912 ) ( not ( = ?auto_3913 ?auto_3914 ) ) ( AVAILABLE ?auto_3914 ) ( SURFACE-AT ?auto_3910 ?auto_3912 ) ( ON ?auto_3910 ?auto_3915 ) ( CLEAR ?auto_3910 ) ( not ( = ?auto_3909 ?auto_3915 ) ) ( not ( = ?auto_3910 ?auto_3915 ) ) ( not ( = ?auto_3908 ?auto_3915 ) ) ( SURFACE-AT ?auto_3908 ?auto_3916 ) ( CLEAR ?auto_3908 ) ( IS-CRATE ?auto_3909 ) ( AVAILABLE ?auto_3913 ) ( IN ?auto_3909 ?auto_3911 ) ( TRUCK-AT ?auto_3911 ?auto_3912 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3909 ?auto_3910 )
      ( MAKE-2CRATE-VERIFY ?auto_3908 ?auto_3909 ?auto_3910 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3917 - SURFACE
      ?auto_3918 - SURFACE
    )
    :vars
    (
      ?auto_3923 - HOIST
      ?auto_3919 - PLACE
      ?auto_3921 - SURFACE
      ?auto_3920 - PLACE
      ?auto_3922 - HOIST
      ?auto_3925 - SURFACE
      ?auto_3924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3923 ?auto_3919 ) ( IS-CRATE ?auto_3918 ) ( not ( = ?auto_3917 ?auto_3918 ) ) ( not ( = ?auto_3921 ?auto_3917 ) ) ( not ( = ?auto_3921 ?auto_3918 ) ) ( not ( = ?auto_3920 ?auto_3919 ) ) ( HOIST-AT ?auto_3922 ?auto_3920 ) ( not ( = ?auto_3923 ?auto_3922 ) ) ( SURFACE-AT ?auto_3918 ?auto_3920 ) ( ON ?auto_3918 ?auto_3925 ) ( CLEAR ?auto_3918 ) ( not ( = ?auto_3917 ?auto_3925 ) ) ( not ( = ?auto_3918 ?auto_3925 ) ) ( not ( = ?auto_3921 ?auto_3925 ) ) ( SURFACE-AT ?auto_3921 ?auto_3919 ) ( CLEAR ?auto_3921 ) ( IS-CRATE ?auto_3917 ) ( AVAILABLE ?auto_3923 ) ( TRUCK-AT ?auto_3924 ?auto_3920 ) ( LIFTING ?auto_3922 ?auto_3917 ) )
    :subtasks
    ( ( !LOAD ?auto_3922 ?auto_3917 ?auto_3924 ?auto_3920 )
      ( MAKE-2CRATE ?auto_3921 ?auto_3917 ?auto_3918 )
      ( MAKE-1CRATE-VERIFY ?auto_3917 ?auto_3918 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3926 - SURFACE
      ?auto_3927 - SURFACE
      ?auto_3928 - SURFACE
    )
    :vars
    (
      ?auto_3929 - HOIST
      ?auto_3933 - PLACE
      ?auto_3930 - PLACE
      ?auto_3934 - HOIST
      ?auto_3932 - SURFACE
      ?auto_3931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3929 ?auto_3933 ) ( IS-CRATE ?auto_3928 ) ( not ( = ?auto_3927 ?auto_3928 ) ) ( not ( = ?auto_3926 ?auto_3927 ) ) ( not ( = ?auto_3926 ?auto_3928 ) ) ( not ( = ?auto_3930 ?auto_3933 ) ) ( HOIST-AT ?auto_3934 ?auto_3930 ) ( not ( = ?auto_3929 ?auto_3934 ) ) ( SURFACE-AT ?auto_3928 ?auto_3930 ) ( ON ?auto_3928 ?auto_3932 ) ( CLEAR ?auto_3928 ) ( not ( = ?auto_3927 ?auto_3932 ) ) ( not ( = ?auto_3928 ?auto_3932 ) ) ( not ( = ?auto_3926 ?auto_3932 ) ) ( SURFACE-AT ?auto_3926 ?auto_3933 ) ( CLEAR ?auto_3926 ) ( IS-CRATE ?auto_3927 ) ( AVAILABLE ?auto_3929 ) ( TRUCK-AT ?auto_3931 ?auto_3930 ) ( LIFTING ?auto_3934 ?auto_3927 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3927 ?auto_3928 )
      ( MAKE-2CRATE-VERIFY ?auto_3926 ?auto_3927 ?auto_3928 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3935 - SURFACE
      ?auto_3936 - SURFACE
    )
    :vars
    (
      ?auto_3940 - HOIST
      ?auto_3942 - PLACE
      ?auto_3941 - SURFACE
      ?auto_3939 - PLACE
      ?auto_3937 - HOIST
      ?auto_3938 - SURFACE
      ?auto_3943 - TRUCK
      ?auto_3944 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3940 ?auto_3942 ) ( IS-CRATE ?auto_3936 ) ( not ( = ?auto_3935 ?auto_3936 ) ) ( not ( = ?auto_3941 ?auto_3935 ) ) ( not ( = ?auto_3941 ?auto_3936 ) ) ( not ( = ?auto_3939 ?auto_3942 ) ) ( HOIST-AT ?auto_3937 ?auto_3939 ) ( not ( = ?auto_3940 ?auto_3937 ) ) ( SURFACE-AT ?auto_3936 ?auto_3939 ) ( ON ?auto_3936 ?auto_3938 ) ( CLEAR ?auto_3936 ) ( not ( = ?auto_3935 ?auto_3938 ) ) ( not ( = ?auto_3936 ?auto_3938 ) ) ( not ( = ?auto_3941 ?auto_3938 ) ) ( SURFACE-AT ?auto_3941 ?auto_3942 ) ( CLEAR ?auto_3941 ) ( IS-CRATE ?auto_3935 ) ( AVAILABLE ?auto_3940 ) ( TRUCK-AT ?auto_3943 ?auto_3939 ) ( AVAILABLE ?auto_3937 ) ( SURFACE-AT ?auto_3935 ?auto_3939 ) ( ON ?auto_3935 ?auto_3944 ) ( CLEAR ?auto_3935 ) ( not ( = ?auto_3935 ?auto_3944 ) ) ( not ( = ?auto_3936 ?auto_3944 ) ) ( not ( = ?auto_3941 ?auto_3944 ) ) ( not ( = ?auto_3938 ?auto_3944 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3937 ?auto_3935 ?auto_3944 ?auto_3939 )
      ( MAKE-2CRATE ?auto_3941 ?auto_3935 ?auto_3936 )
      ( MAKE-1CRATE-VERIFY ?auto_3935 ?auto_3936 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3945 - SURFACE
      ?auto_3946 - SURFACE
      ?auto_3947 - SURFACE
    )
    :vars
    (
      ?auto_3951 - HOIST
      ?auto_3948 - PLACE
      ?auto_3952 - PLACE
      ?auto_3953 - HOIST
      ?auto_3950 - SURFACE
      ?auto_3954 - TRUCK
      ?auto_3949 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3951 ?auto_3948 ) ( IS-CRATE ?auto_3947 ) ( not ( = ?auto_3946 ?auto_3947 ) ) ( not ( = ?auto_3945 ?auto_3946 ) ) ( not ( = ?auto_3945 ?auto_3947 ) ) ( not ( = ?auto_3952 ?auto_3948 ) ) ( HOIST-AT ?auto_3953 ?auto_3952 ) ( not ( = ?auto_3951 ?auto_3953 ) ) ( SURFACE-AT ?auto_3947 ?auto_3952 ) ( ON ?auto_3947 ?auto_3950 ) ( CLEAR ?auto_3947 ) ( not ( = ?auto_3946 ?auto_3950 ) ) ( not ( = ?auto_3947 ?auto_3950 ) ) ( not ( = ?auto_3945 ?auto_3950 ) ) ( SURFACE-AT ?auto_3945 ?auto_3948 ) ( CLEAR ?auto_3945 ) ( IS-CRATE ?auto_3946 ) ( AVAILABLE ?auto_3951 ) ( TRUCK-AT ?auto_3954 ?auto_3952 ) ( AVAILABLE ?auto_3953 ) ( SURFACE-AT ?auto_3946 ?auto_3952 ) ( ON ?auto_3946 ?auto_3949 ) ( CLEAR ?auto_3946 ) ( not ( = ?auto_3946 ?auto_3949 ) ) ( not ( = ?auto_3947 ?auto_3949 ) ) ( not ( = ?auto_3945 ?auto_3949 ) ) ( not ( = ?auto_3950 ?auto_3949 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3946 ?auto_3947 )
      ( MAKE-2CRATE-VERIFY ?auto_3945 ?auto_3946 ?auto_3947 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3955 - SURFACE
      ?auto_3956 - SURFACE
    )
    :vars
    (
      ?auto_3964 - HOIST
      ?auto_3959 - PLACE
      ?auto_3962 - SURFACE
      ?auto_3958 - PLACE
      ?auto_3961 - HOIST
      ?auto_3960 - SURFACE
      ?auto_3963 - SURFACE
      ?auto_3957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3964 ?auto_3959 ) ( IS-CRATE ?auto_3956 ) ( not ( = ?auto_3955 ?auto_3956 ) ) ( not ( = ?auto_3962 ?auto_3955 ) ) ( not ( = ?auto_3962 ?auto_3956 ) ) ( not ( = ?auto_3958 ?auto_3959 ) ) ( HOIST-AT ?auto_3961 ?auto_3958 ) ( not ( = ?auto_3964 ?auto_3961 ) ) ( SURFACE-AT ?auto_3956 ?auto_3958 ) ( ON ?auto_3956 ?auto_3960 ) ( CLEAR ?auto_3956 ) ( not ( = ?auto_3955 ?auto_3960 ) ) ( not ( = ?auto_3956 ?auto_3960 ) ) ( not ( = ?auto_3962 ?auto_3960 ) ) ( SURFACE-AT ?auto_3962 ?auto_3959 ) ( CLEAR ?auto_3962 ) ( IS-CRATE ?auto_3955 ) ( AVAILABLE ?auto_3964 ) ( AVAILABLE ?auto_3961 ) ( SURFACE-AT ?auto_3955 ?auto_3958 ) ( ON ?auto_3955 ?auto_3963 ) ( CLEAR ?auto_3955 ) ( not ( = ?auto_3955 ?auto_3963 ) ) ( not ( = ?auto_3956 ?auto_3963 ) ) ( not ( = ?auto_3962 ?auto_3963 ) ) ( not ( = ?auto_3960 ?auto_3963 ) ) ( TRUCK-AT ?auto_3957 ?auto_3959 ) )
    :subtasks
    ( ( !DRIVE ?auto_3957 ?auto_3959 ?auto_3958 )
      ( MAKE-2CRATE ?auto_3962 ?auto_3955 ?auto_3956 )
      ( MAKE-1CRATE-VERIFY ?auto_3955 ?auto_3956 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3965 - SURFACE
      ?auto_3966 - SURFACE
      ?auto_3967 - SURFACE
    )
    :vars
    (
      ?auto_3972 - HOIST
      ?auto_3968 - PLACE
      ?auto_3973 - PLACE
      ?auto_3971 - HOIST
      ?auto_3974 - SURFACE
      ?auto_3969 - SURFACE
      ?auto_3970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3972 ?auto_3968 ) ( IS-CRATE ?auto_3967 ) ( not ( = ?auto_3966 ?auto_3967 ) ) ( not ( = ?auto_3965 ?auto_3966 ) ) ( not ( = ?auto_3965 ?auto_3967 ) ) ( not ( = ?auto_3973 ?auto_3968 ) ) ( HOIST-AT ?auto_3971 ?auto_3973 ) ( not ( = ?auto_3972 ?auto_3971 ) ) ( SURFACE-AT ?auto_3967 ?auto_3973 ) ( ON ?auto_3967 ?auto_3974 ) ( CLEAR ?auto_3967 ) ( not ( = ?auto_3966 ?auto_3974 ) ) ( not ( = ?auto_3967 ?auto_3974 ) ) ( not ( = ?auto_3965 ?auto_3974 ) ) ( SURFACE-AT ?auto_3965 ?auto_3968 ) ( CLEAR ?auto_3965 ) ( IS-CRATE ?auto_3966 ) ( AVAILABLE ?auto_3972 ) ( AVAILABLE ?auto_3971 ) ( SURFACE-AT ?auto_3966 ?auto_3973 ) ( ON ?auto_3966 ?auto_3969 ) ( CLEAR ?auto_3966 ) ( not ( = ?auto_3966 ?auto_3969 ) ) ( not ( = ?auto_3967 ?auto_3969 ) ) ( not ( = ?auto_3965 ?auto_3969 ) ) ( not ( = ?auto_3974 ?auto_3969 ) ) ( TRUCK-AT ?auto_3970 ?auto_3968 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3966 ?auto_3967 )
      ( MAKE-2CRATE-VERIFY ?auto_3965 ?auto_3966 ?auto_3967 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3984 - SURFACE
      ?auto_3985 - SURFACE
    )
    :vars
    (
      ?auto_3986 - HOIST
      ?auto_3987 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3986 ?auto_3987 ) ( SURFACE-AT ?auto_3984 ?auto_3987 ) ( CLEAR ?auto_3984 ) ( LIFTING ?auto_3986 ?auto_3985 ) ( IS-CRATE ?auto_3985 ) ( not ( = ?auto_3984 ?auto_3985 ) ) )
    :subtasks
    ( ( !DROP ?auto_3986 ?auto_3985 ?auto_3984 ?auto_3987 )
      ( MAKE-1CRATE-VERIFY ?auto_3984 ?auto_3985 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3988 - SURFACE
      ?auto_3989 - SURFACE
      ?auto_3990 - SURFACE
    )
    :vars
    (
      ?auto_3992 - HOIST
      ?auto_3991 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3992 ?auto_3991 ) ( SURFACE-AT ?auto_3989 ?auto_3991 ) ( CLEAR ?auto_3989 ) ( LIFTING ?auto_3992 ?auto_3990 ) ( IS-CRATE ?auto_3990 ) ( not ( = ?auto_3989 ?auto_3990 ) ) ( ON ?auto_3989 ?auto_3988 ) ( not ( = ?auto_3988 ?auto_3989 ) ) ( not ( = ?auto_3988 ?auto_3990 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3989 ?auto_3990 )
      ( MAKE-2CRATE-VERIFY ?auto_3988 ?auto_3989 ?auto_3990 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3993 - SURFACE
      ?auto_3994 - SURFACE
      ?auto_3995 - SURFACE
      ?auto_3996 - SURFACE
    )
    :vars
    (
      ?auto_3998 - HOIST
      ?auto_3997 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3998 ?auto_3997 ) ( SURFACE-AT ?auto_3995 ?auto_3997 ) ( CLEAR ?auto_3995 ) ( LIFTING ?auto_3998 ?auto_3996 ) ( IS-CRATE ?auto_3996 ) ( not ( = ?auto_3995 ?auto_3996 ) ) ( ON ?auto_3994 ?auto_3993 ) ( ON ?auto_3995 ?auto_3994 ) ( not ( = ?auto_3993 ?auto_3994 ) ) ( not ( = ?auto_3993 ?auto_3995 ) ) ( not ( = ?auto_3993 ?auto_3996 ) ) ( not ( = ?auto_3994 ?auto_3995 ) ) ( not ( = ?auto_3994 ?auto_3996 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3995 ?auto_3996 )
      ( MAKE-3CRATE-VERIFY ?auto_3993 ?auto_3994 ?auto_3995 ?auto_3996 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3999 - SURFACE
      ?auto_4000 - SURFACE
    )
    :vars
    (
      ?auto_4002 - HOIST
      ?auto_4001 - PLACE
      ?auto_4003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4002 ?auto_4001 ) ( SURFACE-AT ?auto_3999 ?auto_4001 ) ( CLEAR ?auto_3999 ) ( IS-CRATE ?auto_4000 ) ( not ( = ?auto_3999 ?auto_4000 ) ) ( TRUCK-AT ?auto_4003 ?auto_4001 ) ( AVAILABLE ?auto_4002 ) ( IN ?auto_4000 ?auto_4003 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4002 ?auto_4000 ?auto_4003 ?auto_4001 )
      ( MAKE-1CRATE ?auto_3999 ?auto_4000 )
      ( MAKE-1CRATE-VERIFY ?auto_3999 ?auto_4000 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4004 - SURFACE
      ?auto_4005 - SURFACE
      ?auto_4006 - SURFACE
    )
    :vars
    (
      ?auto_4009 - HOIST
      ?auto_4007 - PLACE
      ?auto_4008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4009 ?auto_4007 ) ( SURFACE-AT ?auto_4005 ?auto_4007 ) ( CLEAR ?auto_4005 ) ( IS-CRATE ?auto_4006 ) ( not ( = ?auto_4005 ?auto_4006 ) ) ( TRUCK-AT ?auto_4008 ?auto_4007 ) ( AVAILABLE ?auto_4009 ) ( IN ?auto_4006 ?auto_4008 ) ( ON ?auto_4005 ?auto_4004 ) ( not ( = ?auto_4004 ?auto_4005 ) ) ( not ( = ?auto_4004 ?auto_4006 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4005 ?auto_4006 )
      ( MAKE-2CRATE-VERIFY ?auto_4004 ?auto_4005 ?auto_4006 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4010 - SURFACE
      ?auto_4011 - SURFACE
      ?auto_4012 - SURFACE
      ?auto_4013 - SURFACE
    )
    :vars
    (
      ?auto_4015 - HOIST
      ?auto_4014 - PLACE
      ?auto_4016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4015 ?auto_4014 ) ( SURFACE-AT ?auto_4012 ?auto_4014 ) ( CLEAR ?auto_4012 ) ( IS-CRATE ?auto_4013 ) ( not ( = ?auto_4012 ?auto_4013 ) ) ( TRUCK-AT ?auto_4016 ?auto_4014 ) ( AVAILABLE ?auto_4015 ) ( IN ?auto_4013 ?auto_4016 ) ( ON ?auto_4012 ?auto_4011 ) ( not ( = ?auto_4011 ?auto_4012 ) ) ( not ( = ?auto_4011 ?auto_4013 ) ) ( ON ?auto_4011 ?auto_4010 ) ( not ( = ?auto_4010 ?auto_4011 ) ) ( not ( = ?auto_4010 ?auto_4012 ) ) ( not ( = ?auto_4010 ?auto_4013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4011 ?auto_4012 ?auto_4013 )
      ( MAKE-3CRATE-VERIFY ?auto_4010 ?auto_4011 ?auto_4012 ?auto_4013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4017 - SURFACE
      ?auto_4018 - SURFACE
    )
    :vars
    (
      ?auto_4021 - HOIST
      ?auto_4020 - PLACE
      ?auto_4022 - TRUCK
      ?auto_4019 - SURFACE
      ?auto_4023 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4021 ?auto_4020 ) ( SURFACE-AT ?auto_4017 ?auto_4020 ) ( CLEAR ?auto_4017 ) ( IS-CRATE ?auto_4018 ) ( not ( = ?auto_4017 ?auto_4018 ) ) ( AVAILABLE ?auto_4021 ) ( IN ?auto_4018 ?auto_4022 ) ( ON ?auto_4017 ?auto_4019 ) ( not ( = ?auto_4019 ?auto_4017 ) ) ( not ( = ?auto_4019 ?auto_4018 ) ) ( TRUCK-AT ?auto_4022 ?auto_4023 ) ( not ( = ?auto_4023 ?auto_4020 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4022 ?auto_4023 ?auto_4020 )
      ( MAKE-2CRATE ?auto_4019 ?auto_4017 ?auto_4018 )
      ( MAKE-1CRATE-VERIFY ?auto_4017 ?auto_4018 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4024 - SURFACE
      ?auto_4025 - SURFACE
      ?auto_4026 - SURFACE
    )
    :vars
    (
      ?auto_4029 - HOIST
      ?auto_4030 - PLACE
      ?auto_4028 - TRUCK
      ?auto_4027 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4029 ?auto_4030 ) ( SURFACE-AT ?auto_4025 ?auto_4030 ) ( CLEAR ?auto_4025 ) ( IS-CRATE ?auto_4026 ) ( not ( = ?auto_4025 ?auto_4026 ) ) ( AVAILABLE ?auto_4029 ) ( IN ?auto_4026 ?auto_4028 ) ( ON ?auto_4025 ?auto_4024 ) ( not ( = ?auto_4024 ?auto_4025 ) ) ( not ( = ?auto_4024 ?auto_4026 ) ) ( TRUCK-AT ?auto_4028 ?auto_4027 ) ( not ( = ?auto_4027 ?auto_4030 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4025 ?auto_4026 )
      ( MAKE-2CRATE-VERIFY ?auto_4024 ?auto_4025 ?auto_4026 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4031 - SURFACE
      ?auto_4032 - SURFACE
      ?auto_4033 - SURFACE
      ?auto_4034 - SURFACE
    )
    :vars
    (
      ?auto_4035 - HOIST
      ?auto_4038 - PLACE
      ?auto_4036 - TRUCK
      ?auto_4037 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4035 ?auto_4038 ) ( SURFACE-AT ?auto_4033 ?auto_4038 ) ( CLEAR ?auto_4033 ) ( IS-CRATE ?auto_4034 ) ( not ( = ?auto_4033 ?auto_4034 ) ) ( AVAILABLE ?auto_4035 ) ( IN ?auto_4034 ?auto_4036 ) ( ON ?auto_4033 ?auto_4032 ) ( not ( = ?auto_4032 ?auto_4033 ) ) ( not ( = ?auto_4032 ?auto_4034 ) ) ( TRUCK-AT ?auto_4036 ?auto_4037 ) ( not ( = ?auto_4037 ?auto_4038 ) ) ( ON ?auto_4032 ?auto_4031 ) ( not ( = ?auto_4031 ?auto_4032 ) ) ( not ( = ?auto_4031 ?auto_4033 ) ) ( not ( = ?auto_4031 ?auto_4034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4032 ?auto_4033 ?auto_4034 )
      ( MAKE-3CRATE-VERIFY ?auto_4031 ?auto_4032 ?auto_4033 ?auto_4034 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4039 - SURFACE
      ?auto_4040 - SURFACE
    )
    :vars
    (
      ?auto_4042 - HOIST
      ?auto_4045 - PLACE
      ?auto_4041 - SURFACE
      ?auto_4043 - TRUCK
      ?auto_4044 - PLACE
      ?auto_4046 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4042 ?auto_4045 ) ( SURFACE-AT ?auto_4039 ?auto_4045 ) ( CLEAR ?auto_4039 ) ( IS-CRATE ?auto_4040 ) ( not ( = ?auto_4039 ?auto_4040 ) ) ( AVAILABLE ?auto_4042 ) ( ON ?auto_4039 ?auto_4041 ) ( not ( = ?auto_4041 ?auto_4039 ) ) ( not ( = ?auto_4041 ?auto_4040 ) ) ( TRUCK-AT ?auto_4043 ?auto_4044 ) ( not ( = ?auto_4044 ?auto_4045 ) ) ( HOIST-AT ?auto_4046 ?auto_4044 ) ( LIFTING ?auto_4046 ?auto_4040 ) ( not ( = ?auto_4042 ?auto_4046 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4046 ?auto_4040 ?auto_4043 ?auto_4044 )
      ( MAKE-2CRATE ?auto_4041 ?auto_4039 ?auto_4040 )
      ( MAKE-1CRATE-VERIFY ?auto_4039 ?auto_4040 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4047 - SURFACE
      ?auto_4048 - SURFACE
      ?auto_4049 - SURFACE
    )
    :vars
    (
      ?auto_4050 - HOIST
      ?auto_4054 - PLACE
      ?auto_4052 - TRUCK
      ?auto_4051 - PLACE
      ?auto_4053 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4050 ?auto_4054 ) ( SURFACE-AT ?auto_4048 ?auto_4054 ) ( CLEAR ?auto_4048 ) ( IS-CRATE ?auto_4049 ) ( not ( = ?auto_4048 ?auto_4049 ) ) ( AVAILABLE ?auto_4050 ) ( ON ?auto_4048 ?auto_4047 ) ( not ( = ?auto_4047 ?auto_4048 ) ) ( not ( = ?auto_4047 ?auto_4049 ) ) ( TRUCK-AT ?auto_4052 ?auto_4051 ) ( not ( = ?auto_4051 ?auto_4054 ) ) ( HOIST-AT ?auto_4053 ?auto_4051 ) ( LIFTING ?auto_4053 ?auto_4049 ) ( not ( = ?auto_4050 ?auto_4053 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4048 ?auto_4049 )
      ( MAKE-2CRATE-VERIFY ?auto_4047 ?auto_4048 ?auto_4049 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4055 - SURFACE
      ?auto_4056 - SURFACE
      ?auto_4057 - SURFACE
      ?auto_4058 - SURFACE
    )
    :vars
    (
      ?auto_4063 - HOIST
      ?auto_4062 - PLACE
      ?auto_4060 - TRUCK
      ?auto_4059 - PLACE
      ?auto_4061 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4063 ?auto_4062 ) ( SURFACE-AT ?auto_4057 ?auto_4062 ) ( CLEAR ?auto_4057 ) ( IS-CRATE ?auto_4058 ) ( not ( = ?auto_4057 ?auto_4058 ) ) ( AVAILABLE ?auto_4063 ) ( ON ?auto_4057 ?auto_4056 ) ( not ( = ?auto_4056 ?auto_4057 ) ) ( not ( = ?auto_4056 ?auto_4058 ) ) ( TRUCK-AT ?auto_4060 ?auto_4059 ) ( not ( = ?auto_4059 ?auto_4062 ) ) ( HOIST-AT ?auto_4061 ?auto_4059 ) ( LIFTING ?auto_4061 ?auto_4058 ) ( not ( = ?auto_4063 ?auto_4061 ) ) ( ON ?auto_4056 ?auto_4055 ) ( not ( = ?auto_4055 ?auto_4056 ) ) ( not ( = ?auto_4055 ?auto_4057 ) ) ( not ( = ?auto_4055 ?auto_4058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4056 ?auto_4057 ?auto_4058 )
      ( MAKE-3CRATE-VERIFY ?auto_4055 ?auto_4056 ?auto_4057 ?auto_4058 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4064 - SURFACE
      ?auto_4065 - SURFACE
    )
    :vars
    (
      ?auto_4071 - HOIST
      ?auto_4069 - PLACE
      ?auto_4070 - SURFACE
      ?auto_4067 - TRUCK
      ?auto_4066 - PLACE
      ?auto_4068 - HOIST
      ?auto_4072 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4071 ?auto_4069 ) ( SURFACE-AT ?auto_4064 ?auto_4069 ) ( CLEAR ?auto_4064 ) ( IS-CRATE ?auto_4065 ) ( not ( = ?auto_4064 ?auto_4065 ) ) ( AVAILABLE ?auto_4071 ) ( ON ?auto_4064 ?auto_4070 ) ( not ( = ?auto_4070 ?auto_4064 ) ) ( not ( = ?auto_4070 ?auto_4065 ) ) ( TRUCK-AT ?auto_4067 ?auto_4066 ) ( not ( = ?auto_4066 ?auto_4069 ) ) ( HOIST-AT ?auto_4068 ?auto_4066 ) ( not ( = ?auto_4071 ?auto_4068 ) ) ( AVAILABLE ?auto_4068 ) ( SURFACE-AT ?auto_4065 ?auto_4066 ) ( ON ?auto_4065 ?auto_4072 ) ( CLEAR ?auto_4065 ) ( not ( = ?auto_4064 ?auto_4072 ) ) ( not ( = ?auto_4065 ?auto_4072 ) ) ( not ( = ?auto_4070 ?auto_4072 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4068 ?auto_4065 ?auto_4072 ?auto_4066 )
      ( MAKE-2CRATE ?auto_4070 ?auto_4064 ?auto_4065 )
      ( MAKE-1CRATE-VERIFY ?auto_4064 ?auto_4065 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4073 - SURFACE
      ?auto_4074 - SURFACE
      ?auto_4075 - SURFACE
    )
    :vars
    (
      ?auto_4076 - HOIST
      ?auto_4080 - PLACE
      ?auto_4077 - TRUCK
      ?auto_4081 - PLACE
      ?auto_4079 - HOIST
      ?auto_4078 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4076 ?auto_4080 ) ( SURFACE-AT ?auto_4074 ?auto_4080 ) ( CLEAR ?auto_4074 ) ( IS-CRATE ?auto_4075 ) ( not ( = ?auto_4074 ?auto_4075 ) ) ( AVAILABLE ?auto_4076 ) ( ON ?auto_4074 ?auto_4073 ) ( not ( = ?auto_4073 ?auto_4074 ) ) ( not ( = ?auto_4073 ?auto_4075 ) ) ( TRUCK-AT ?auto_4077 ?auto_4081 ) ( not ( = ?auto_4081 ?auto_4080 ) ) ( HOIST-AT ?auto_4079 ?auto_4081 ) ( not ( = ?auto_4076 ?auto_4079 ) ) ( AVAILABLE ?auto_4079 ) ( SURFACE-AT ?auto_4075 ?auto_4081 ) ( ON ?auto_4075 ?auto_4078 ) ( CLEAR ?auto_4075 ) ( not ( = ?auto_4074 ?auto_4078 ) ) ( not ( = ?auto_4075 ?auto_4078 ) ) ( not ( = ?auto_4073 ?auto_4078 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4074 ?auto_4075 )
      ( MAKE-2CRATE-VERIFY ?auto_4073 ?auto_4074 ?auto_4075 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4082 - SURFACE
      ?auto_4083 - SURFACE
      ?auto_4084 - SURFACE
      ?auto_4085 - SURFACE
    )
    :vars
    (
      ?auto_4091 - HOIST
      ?auto_4086 - PLACE
      ?auto_4089 - TRUCK
      ?auto_4088 - PLACE
      ?auto_4090 - HOIST
      ?auto_4087 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4091 ?auto_4086 ) ( SURFACE-AT ?auto_4084 ?auto_4086 ) ( CLEAR ?auto_4084 ) ( IS-CRATE ?auto_4085 ) ( not ( = ?auto_4084 ?auto_4085 ) ) ( AVAILABLE ?auto_4091 ) ( ON ?auto_4084 ?auto_4083 ) ( not ( = ?auto_4083 ?auto_4084 ) ) ( not ( = ?auto_4083 ?auto_4085 ) ) ( TRUCK-AT ?auto_4089 ?auto_4088 ) ( not ( = ?auto_4088 ?auto_4086 ) ) ( HOIST-AT ?auto_4090 ?auto_4088 ) ( not ( = ?auto_4091 ?auto_4090 ) ) ( AVAILABLE ?auto_4090 ) ( SURFACE-AT ?auto_4085 ?auto_4088 ) ( ON ?auto_4085 ?auto_4087 ) ( CLEAR ?auto_4085 ) ( not ( = ?auto_4084 ?auto_4087 ) ) ( not ( = ?auto_4085 ?auto_4087 ) ) ( not ( = ?auto_4083 ?auto_4087 ) ) ( ON ?auto_4083 ?auto_4082 ) ( not ( = ?auto_4082 ?auto_4083 ) ) ( not ( = ?auto_4082 ?auto_4084 ) ) ( not ( = ?auto_4082 ?auto_4085 ) ) ( not ( = ?auto_4082 ?auto_4087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4083 ?auto_4084 ?auto_4085 )
      ( MAKE-3CRATE-VERIFY ?auto_4082 ?auto_4083 ?auto_4084 ?auto_4085 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4092 - SURFACE
      ?auto_4093 - SURFACE
    )
    :vars
    (
      ?auto_4100 - HOIST
      ?auto_4095 - PLACE
      ?auto_4094 - SURFACE
      ?auto_4097 - PLACE
      ?auto_4099 - HOIST
      ?auto_4096 - SURFACE
      ?auto_4098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4100 ?auto_4095 ) ( SURFACE-AT ?auto_4092 ?auto_4095 ) ( CLEAR ?auto_4092 ) ( IS-CRATE ?auto_4093 ) ( not ( = ?auto_4092 ?auto_4093 ) ) ( AVAILABLE ?auto_4100 ) ( ON ?auto_4092 ?auto_4094 ) ( not ( = ?auto_4094 ?auto_4092 ) ) ( not ( = ?auto_4094 ?auto_4093 ) ) ( not ( = ?auto_4097 ?auto_4095 ) ) ( HOIST-AT ?auto_4099 ?auto_4097 ) ( not ( = ?auto_4100 ?auto_4099 ) ) ( AVAILABLE ?auto_4099 ) ( SURFACE-AT ?auto_4093 ?auto_4097 ) ( ON ?auto_4093 ?auto_4096 ) ( CLEAR ?auto_4093 ) ( not ( = ?auto_4092 ?auto_4096 ) ) ( not ( = ?auto_4093 ?auto_4096 ) ) ( not ( = ?auto_4094 ?auto_4096 ) ) ( TRUCK-AT ?auto_4098 ?auto_4095 ) )
    :subtasks
    ( ( !DRIVE ?auto_4098 ?auto_4095 ?auto_4097 )
      ( MAKE-2CRATE ?auto_4094 ?auto_4092 ?auto_4093 )
      ( MAKE-1CRATE-VERIFY ?auto_4092 ?auto_4093 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4101 - SURFACE
      ?auto_4102 - SURFACE
      ?auto_4103 - SURFACE
    )
    :vars
    (
      ?auto_4108 - HOIST
      ?auto_4104 - PLACE
      ?auto_4107 - PLACE
      ?auto_4105 - HOIST
      ?auto_4106 - SURFACE
      ?auto_4109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4108 ?auto_4104 ) ( SURFACE-AT ?auto_4102 ?auto_4104 ) ( CLEAR ?auto_4102 ) ( IS-CRATE ?auto_4103 ) ( not ( = ?auto_4102 ?auto_4103 ) ) ( AVAILABLE ?auto_4108 ) ( ON ?auto_4102 ?auto_4101 ) ( not ( = ?auto_4101 ?auto_4102 ) ) ( not ( = ?auto_4101 ?auto_4103 ) ) ( not ( = ?auto_4107 ?auto_4104 ) ) ( HOIST-AT ?auto_4105 ?auto_4107 ) ( not ( = ?auto_4108 ?auto_4105 ) ) ( AVAILABLE ?auto_4105 ) ( SURFACE-AT ?auto_4103 ?auto_4107 ) ( ON ?auto_4103 ?auto_4106 ) ( CLEAR ?auto_4103 ) ( not ( = ?auto_4102 ?auto_4106 ) ) ( not ( = ?auto_4103 ?auto_4106 ) ) ( not ( = ?auto_4101 ?auto_4106 ) ) ( TRUCK-AT ?auto_4109 ?auto_4104 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4102 ?auto_4103 )
      ( MAKE-2CRATE-VERIFY ?auto_4101 ?auto_4102 ?auto_4103 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4110 - SURFACE
      ?auto_4111 - SURFACE
      ?auto_4112 - SURFACE
      ?auto_4113 - SURFACE
    )
    :vars
    (
      ?auto_4118 - HOIST
      ?auto_4114 - PLACE
      ?auto_4117 - PLACE
      ?auto_4119 - HOIST
      ?auto_4116 - SURFACE
      ?auto_4115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4118 ?auto_4114 ) ( SURFACE-AT ?auto_4112 ?auto_4114 ) ( CLEAR ?auto_4112 ) ( IS-CRATE ?auto_4113 ) ( not ( = ?auto_4112 ?auto_4113 ) ) ( AVAILABLE ?auto_4118 ) ( ON ?auto_4112 ?auto_4111 ) ( not ( = ?auto_4111 ?auto_4112 ) ) ( not ( = ?auto_4111 ?auto_4113 ) ) ( not ( = ?auto_4117 ?auto_4114 ) ) ( HOIST-AT ?auto_4119 ?auto_4117 ) ( not ( = ?auto_4118 ?auto_4119 ) ) ( AVAILABLE ?auto_4119 ) ( SURFACE-AT ?auto_4113 ?auto_4117 ) ( ON ?auto_4113 ?auto_4116 ) ( CLEAR ?auto_4113 ) ( not ( = ?auto_4112 ?auto_4116 ) ) ( not ( = ?auto_4113 ?auto_4116 ) ) ( not ( = ?auto_4111 ?auto_4116 ) ) ( TRUCK-AT ?auto_4115 ?auto_4114 ) ( ON ?auto_4111 ?auto_4110 ) ( not ( = ?auto_4110 ?auto_4111 ) ) ( not ( = ?auto_4110 ?auto_4112 ) ) ( not ( = ?auto_4110 ?auto_4113 ) ) ( not ( = ?auto_4110 ?auto_4116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4111 ?auto_4112 ?auto_4113 )
      ( MAKE-3CRATE-VERIFY ?auto_4110 ?auto_4111 ?auto_4112 ?auto_4113 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4120 - SURFACE
      ?auto_4121 - SURFACE
    )
    :vars
    (
      ?auto_4126 - HOIST
      ?auto_4122 - PLACE
      ?auto_4128 - SURFACE
      ?auto_4125 - PLACE
      ?auto_4127 - HOIST
      ?auto_4124 - SURFACE
      ?auto_4123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4126 ?auto_4122 ) ( IS-CRATE ?auto_4121 ) ( not ( = ?auto_4120 ?auto_4121 ) ) ( not ( = ?auto_4128 ?auto_4120 ) ) ( not ( = ?auto_4128 ?auto_4121 ) ) ( not ( = ?auto_4125 ?auto_4122 ) ) ( HOIST-AT ?auto_4127 ?auto_4125 ) ( not ( = ?auto_4126 ?auto_4127 ) ) ( AVAILABLE ?auto_4127 ) ( SURFACE-AT ?auto_4121 ?auto_4125 ) ( ON ?auto_4121 ?auto_4124 ) ( CLEAR ?auto_4121 ) ( not ( = ?auto_4120 ?auto_4124 ) ) ( not ( = ?auto_4121 ?auto_4124 ) ) ( not ( = ?auto_4128 ?auto_4124 ) ) ( TRUCK-AT ?auto_4123 ?auto_4122 ) ( SURFACE-AT ?auto_4128 ?auto_4122 ) ( CLEAR ?auto_4128 ) ( LIFTING ?auto_4126 ?auto_4120 ) ( IS-CRATE ?auto_4120 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4128 ?auto_4120 )
      ( MAKE-2CRATE ?auto_4128 ?auto_4120 ?auto_4121 )
      ( MAKE-1CRATE-VERIFY ?auto_4120 ?auto_4121 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4129 - SURFACE
      ?auto_4130 - SURFACE
      ?auto_4131 - SURFACE
    )
    :vars
    (
      ?auto_4135 - HOIST
      ?auto_4136 - PLACE
      ?auto_4132 - PLACE
      ?auto_4137 - HOIST
      ?auto_4134 - SURFACE
      ?auto_4133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4135 ?auto_4136 ) ( IS-CRATE ?auto_4131 ) ( not ( = ?auto_4130 ?auto_4131 ) ) ( not ( = ?auto_4129 ?auto_4130 ) ) ( not ( = ?auto_4129 ?auto_4131 ) ) ( not ( = ?auto_4132 ?auto_4136 ) ) ( HOIST-AT ?auto_4137 ?auto_4132 ) ( not ( = ?auto_4135 ?auto_4137 ) ) ( AVAILABLE ?auto_4137 ) ( SURFACE-AT ?auto_4131 ?auto_4132 ) ( ON ?auto_4131 ?auto_4134 ) ( CLEAR ?auto_4131 ) ( not ( = ?auto_4130 ?auto_4134 ) ) ( not ( = ?auto_4131 ?auto_4134 ) ) ( not ( = ?auto_4129 ?auto_4134 ) ) ( TRUCK-AT ?auto_4133 ?auto_4136 ) ( SURFACE-AT ?auto_4129 ?auto_4136 ) ( CLEAR ?auto_4129 ) ( LIFTING ?auto_4135 ?auto_4130 ) ( IS-CRATE ?auto_4130 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4130 ?auto_4131 )
      ( MAKE-2CRATE-VERIFY ?auto_4129 ?auto_4130 ?auto_4131 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4138 - SURFACE
      ?auto_4139 - SURFACE
      ?auto_4140 - SURFACE
      ?auto_4141 - SURFACE
    )
    :vars
    (
      ?auto_4142 - HOIST
      ?auto_4143 - PLACE
      ?auto_4147 - PLACE
      ?auto_4145 - HOIST
      ?auto_4146 - SURFACE
      ?auto_4144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4142 ?auto_4143 ) ( IS-CRATE ?auto_4141 ) ( not ( = ?auto_4140 ?auto_4141 ) ) ( not ( = ?auto_4139 ?auto_4140 ) ) ( not ( = ?auto_4139 ?auto_4141 ) ) ( not ( = ?auto_4147 ?auto_4143 ) ) ( HOIST-AT ?auto_4145 ?auto_4147 ) ( not ( = ?auto_4142 ?auto_4145 ) ) ( AVAILABLE ?auto_4145 ) ( SURFACE-AT ?auto_4141 ?auto_4147 ) ( ON ?auto_4141 ?auto_4146 ) ( CLEAR ?auto_4141 ) ( not ( = ?auto_4140 ?auto_4146 ) ) ( not ( = ?auto_4141 ?auto_4146 ) ) ( not ( = ?auto_4139 ?auto_4146 ) ) ( TRUCK-AT ?auto_4144 ?auto_4143 ) ( SURFACE-AT ?auto_4139 ?auto_4143 ) ( CLEAR ?auto_4139 ) ( LIFTING ?auto_4142 ?auto_4140 ) ( IS-CRATE ?auto_4140 ) ( ON ?auto_4139 ?auto_4138 ) ( not ( = ?auto_4138 ?auto_4139 ) ) ( not ( = ?auto_4138 ?auto_4140 ) ) ( not ( = ?auto_4138 ?auto_4141 ) ) ( not ( = ?auto_4138 ?auto_4146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4139 ?auto_4140 ?auto_4141 )
      ( MAKE-3CRATE-VERIFY ?auto_4138 ?auto_4139 ?auto_4140 ?auto_4141 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4148 - SURFACE
      ?auto_4149 - SURFACE
    )
    :vars
    (
      ?auto_4150 - HOIST
      ?auto_4151 - PLACE
      ?auto_4154 - SURFACE
      ?auto_4156 - PLACE
      ?auto_4153 - HOIST
      ?auto_4155 - SURFACE
      ?auto_4152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4150 ?auto_4151 ) ( IS-CRATE ?auto_4149 ) ( not ( = ?auto_4148 ?auto_4149 ) ) ( not ( = ?auto_4154 ?auto_4148 ) ) ( not ( = ?auto_4154 ?auto_4149 ) ) ( not ( = ?auto_4156 ?auto_4151 ) ) ( HOIST-AT ?auto_4153 ?auto_4156 ) ( not ( = ?auto_4150 ?auto_4153 ) ) ( AVAILABLE ?auto_4153 ) ( SURFACE-AT ?auto_4149 ?auto_4156 ) ( ON ?auto_4149 ?auto_4155 ) ( CLEAR ?auto_4149 ) ( not ( = ?auto_4148 ?auto_4155 ) ) ( not ( = ?auto_4149 ?auto_4155 ) ) ( not ( = ?auto_4154 ?auto_4155 ) ) ( TRUCK-AT ?auto_4152 ?auto_4151 ) ( SURFACE-AT ?auto_4154 ?auto_4151 ) ( CLEAR ?auto_4154 ) ( IS-CRATE ?auto_4148 ) ( AVAILABLE ?auto_4150 ) ( IN ?auto_4148 ?auto_4152 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4150 ?auto_4148 ?auto_4152 ?auto_4151 )
      ( MAKE-2CRATE ?auto_4154 ?auto_4148 ?auto_4149 )
      ( MAKE-1CRATE-VERIFY ?auto_4148 ?auto_4149 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4157 - SURFACE
      ?auto_4158 - SURFACE
      ?auto_4159 - SURFACE
    )
    :vars
    (
      ?auto_4163 - HOIST
      ?auto_4162 - PLACE
      ?auto_4164 - PLACE
      ?auto_4160 - HOIST
      ?auto_4161 - SURFACE
      ?auto_4165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4163 ?auto_4162 ) ( IS-CRATE ?auto_4159 ) ( not ( = ?auto_4158 ?auto_4159 ) ) ( not ( = ?auto_4157 ?auto_4158 ) ) ( not ( = ?auto_4157 ?auto_4159 ) ) ( not ( = ?auto_4164 ?auto_4162 ) ) ( HOIST-AT ?auto_4160 ?auto_4164 ) ( not ( = ?auto_4163 ?auto_4160 ) ) ( AVAILABLE ?auto_4160 ) ( SURFACE-AT ?auto_4159 ?auto_4164 ) ( ON ?auto_4159 ?auto_4161 ) ( CLEAR ?auto_4159 ) ( not ( = ?auto_4158 ?auto_4161 ) ) ( not ( = ?auto_4159 ?auto_4161 ) ) ( not ( = ?auto_4157 ?auto_4161 ) ) ( TRUCK-AT ?auto_4165 ?auto_4162 ) ( SURFACE-AT ?auto_4157 ?auto_4162 ) ( CLEAR ?auto_4157 ) ( IS-CRATE ?auto_4158 ) ( AVAILABLE ?auto_4163 ) ( IN ?auto_4158 ?auto_4165 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4158 ?auto_4159 )
      ( MAKE-2CRATE-VERIFY ?auto_4157 ?auto_4158 ?auto_4159 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4166 - SURFACE
      ?auto_4167 - SURFACE
      ?auto_4168 - SURFACE
      ?auto_4169 - SURFACE
    )
    :vars
    (
      ?auto_4174 - HOIST
      ?auto_4175 - PLACE
      ?auto_4172 - PLACE
      ?auto_4171 - HOIST
      ?auto_4170 - SURFACE
      ?auto_4173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4174 ?auto_4175 ) ( IS-CRATE ?auto_4169 ) ( not ( = ?auto_4168 ?auto_4169 ) ) ( not ( = ?auto_4167 ?auto_4168 ) ) ( not ( = ?auto_4167 ?auto_4169 ) ) ( not ( = ?auto_4172 ?auto_4175 ) ) ( HOIST-AT ?auto_4171 ?auto_4172 ) ( not ( = ?auto_4174 ?auto_4171 ) ) ( AVAILABLE ?auto_4171 ) ( SURFACE-AT ?auto_4169 ?auto_4172 ) ( ON ?auto_4169 ?auto_4170 ) ( CLEAR ?auto_4169 ) ( not ( = ?auto_4168 ?auto_4170 ) ) ( not ( = ?auto_4169 ?auto_4170 ) ) ( not ( = ?auto_4167 ?auto_4170 ) ) ( TRUCK-AT ?auto_4173 ?auto_4175 ) ( SURFACE-AT ?auto_4167 ?auto_4175 ) ( CLEAR ?auto_4167 ) ( IS-CRATE ?auto_4168 ) ( AVAILABLE ?auto_4174 ) ( IN ?auto_4168 ?auto_4173 ) ( ON ?auto_4167 ?auto_4166 ) ( not ( = ?auto_4166 ?auto_4167 ) ) ( not ( = ?auto_4166 ?auto_4168 ) ) ( not ( = ?auto_4166 ?auto_4169 ) ) ( not ( = ?auto_4166 ?auto_4170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4167 ?auto_4168 ?auto_4169 )
      ( MAKE-3CRATE-VERIFY ?auto_4166 ?auto_4167 ?auto_4168 ?auto_4169 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4176 - SURFACE
      ?auto_4177 - SURFACE
    )
    :vars
    (
      ?auto_4183 - HOIST
      ?auto_4184 - PLACE
      ?auto_4178 - SURFACE
      ?auto_4181 - PLACE
      ?auto_4180 - HOIST
      ?auto_4179 - SURFACE
      ?auto_4182 - TRUCK
      ?auto_4185 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4183 ?auto_4184 ) ( IS-CRATE ?auto_4177 ) ( not ( = ?auto_4176 ?auto_4177 ) ) ( not ( = ?auto_4178 ?auto_4176 ) ) ( not ( = ?auto_4178 ?auto_4177 ) ) ( not ( = ?auto_4181 ?auto_4184 ) ) ( HOIST-AT ?auto_4180 ?auto_4181 ) ( not ( = ?auto_4183 ?auto_4180 ) ) ( AVAILABLE ?auto_4180 ) ( SURFACE-AT ?auto_4177 ?auto_4181 ) ( ON ?auto_4177 ?auto_4179 ) ( CLEAR ?auto_4177 ) ( not ( = ?auto_4176 ?auto_4179 ) ) ( not ( = ?auto_4177 ?auto_4179 ) ) ( not ( = ?auto_4178 ?auto_4179 ) ) ( SURFACE-AT ?auto_4178 ?auto_4184 ) ( CLEAR ?auto_4178 ) ( IS-CRATE ?auto_4176 ) ( AVAILABLE ?auto_4183 ) ( IN ?auto_4176 ?auto_4182 ) ( TRUCK-AT ?auto_4182 ?auto_4185 ) ( not ( = ?auto_4185 ?auto_4184 ) ) ( not ( = ?auto_4181 ?auto_4185 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4182 ?auto_4185 ?auto_4184 )
      ( MAKE-2CRATE ?auto_4178 ?auto_4176 ?auto_4177 )
      ( MAKE-1CRATE-VERIFY ?auto_4176 ?auto_4177 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4186 - SURFACE
      ?auto_4187 - SURFACE
      ?auto_4188 - SURFACE
    )
    :vars
    (
      ?auto_4190 - HOIST
      ?auto_4193 - PLACE
      ?auto_4189 - PLACE
      ?auto_4194 - HOIST
      ?auto_4195 - SURFACE
      ?auto_4192 - TRUCK
      ?auto_4191 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4190 ?auto_4193 ) ( IS-CRATE ?auto_4188 ) ( not ( = ?auto_4187 ?auto_4188 ) ) ( not ( = ?auto_4186 ?auto_4187 ) ) ( not ( = ?auto_4186 ?auto_4188 ) ) ( not ( = ?auto_4189 ?auto_4193 ) ) ( HOIST-AT ?auto_4194 ?auto_4189 ) ( not ( = ?auto_4190 ?auto_4194 ) ) ( AVAILABLE ?auto_4194 ) ( SURFACE-AT ?auto_4188 ?auto_4189 ) ( ON ?auto_4188 ?auto_4195 ) ( CLEAR ?auto_4188 ) ( not ( = ?auto_4187 ?auto_4195 ) ) ( not ( = ?auto_4188 ?auto_4195 ) ) ( not ( = ?auto_4186 ?auto_4195 ) ) ( SURFACE-AT ?auto_4186 ?auto_4193 ) ( CLEAR ?auto_4186 ) ( IS-CRATE ?auto_4187 ) ( AVAILABLE ?auto_4190 ) ( IN ?auto_4187 ?auto_4192 ) ( TRUCK-AT ?auto_4192 ?auto_4191 ) ( not ( = ?auto_4191 ?auto_4193 ) ) ( not ( = ?auto_4189 ?auto_4191 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4187 ?auto_4188 )
      ( MAKE-2CRATE-VERIFY ?auto_4186 ?auto_4187 ?auto_4188 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4196 - SURFACE
      ?auto_4197 - SURFACE
      ?auto_4198 - SURFACE
      ?auto_4199 - SURFACE
    )
    :vars
    (
      ?auto_4204 - HOIST
      ?auto_4200 - PLACE
      ?auto_4202 - PLACE
      ?auto_4206 - HOIST
      ?auto_4203 - SURFACE
      ?auto_4201 - TRUCK
      ?auto_4205 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4204 ?auto_4200 ) ( IS-CRATE ?auto_4199 ) ( not ( = ?auto_4198 ?auto_4199 ) ) ( not ( = ?auto_4197 ?auto_4198 ) ) ( not ( = ?auto_4197 ?auto_4199 ) ) ( not ( = ?auto_4202 ?auto_4200 ) ) ( HOIST-AT ?auto_4206 ?auto_4202 ) ( not ( = ?auto_4204 ?auto_4206 ) ) ( AVAILABLE ?auto_4206 ) ( SURFACE-AT ?auto_4199 ?auto_4202 ) ( ON ?auto_4199 ?auto_4203 ) ( CLEAR ?auto_4199 ) ( not ( = ?auto_4198 ?auto_4203 ) ) ( not ( = ?auto_4199 ?auto_4203 ) ) ( not ( = ?auto_4197 ?auto_4203 ) ) ( SURFACE-AT ?auto_4197 ?auto_4200 ) ( CLEAR ?auto_4197 ) ( IS-CRATE ?auto_4198 ) ( AVAILABLE ?auto_4204 ) ( IN ?auto_4198 ?auto_4201 ) ( TRUCK-AT ?auto_4201 ?auto_4205 ) ( not ( = ?auto_4205 ?auto_4200 ) ) ( not ( = ?auto_4202 ?auto_4205 ) ) ( ON ?auto_4197 ?auto_4196 ) ( not ( = ?auto_4196 ?auto_4197 ) ) ( not ( = ?auto_4196 ?auto_4198 ) ) ( not ( = ?auto_4196 ?auto_4199 ) ) ( not ( = ?auto_4196 ?auto_4203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4197 ?auto_4198 ?auto_4199 )
      ( MAKE-3CRATE-VERIFY ?auto_4196 ?auto_4197 ?auto_4198 ?auto_4199 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4207 - SURFACE
      ?auto_4208 - SURFACE
    )
    :vars
    (
      ?auto_4213 - HOIST
      ?auto_4209 - PLACE
      ?auto_4216 - SURFACE
      ?auto_4211 - PLACE
      ?auto_4215 - HOIST
      ?auto_4212 - SURFACE
      ?auto_4210 - TRUCK
      ?auto_4214 - PLACE
      ?auto_4217 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4213 ?auto_4209 ) ( IS-CRATE ?auto_4208 ) ( not ( = ?auto_4207 ?auto_4208 ) ) ( not ( = ?auto_4216 ?auto_4207 ) ) ( not ( = ?auto_4216 ?auto_4208 ) ) ( not ( = ?auto_4211 ?auto_4209 ) ) ( HOIST-AT ?auto_4215 ?auto_4211 ) ( not ( = ?auto_4213 ?auto_4215 ) ) ( AVAILABLE ?auto_4215 ) ( SURFACE-AT ?auto_4208 ?auto_4211 ) ( ON ?auto_4208 ?auto_4212 ) ( CLEAR ?auto_4208 ) ( not ( = ?auto_4207 ?auto_4212 ) ) ( not ( = ?auto_4208 ?auto_4212 ) ) ( not ( = ?auto_4216 ?auto_4212 ) ) ( SURFACE-AT ?auto_4216 ?auto_4209 ) ( CLEAR ?auto_4216 ) ( IS-CRATE ?auto_4207 ) ( AVAILABLE ?auto_4213 ) ( TRUCK-AT ?auto_4210 ?auto_4214 ) ( not ( = ?auto_4214 ?auto_4209 ) ) ( not ( = ?auto_4211 ?auto_4214 ) ) ( HOIST-AT ?auto_4217 ?auto_4214 ) ( LIFTING ?auto_4217 ?auto_4207 ) ( not ( = ?auto_4213 ?auto_4217 ) ) ( not ( = ?auto_4215 ?auto_4217 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4217 ?auto_4207 ?auto_4210 ?auto_4214 )
      ( MAKE-2CRATE ?auto_4216 ?auto_4207 ?auto_4208 )
      ( MAKE-1CRATE-VERIFY ?auto_4207 ?auto_4208 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4218 - SURFACE
      ?auto_4219 - SURFACE
      ?auto_4220 - SURFACE
    )
    :vars
    (
      ?auto_4223 - HOIST
      ?auto_4226 - PLACE
      ?auto_4225 - PLACE
      ?auto_4228 - HOIST
      ?auto_4227 - SURFACE
      ?auto_4224 - TRUCK
      ?auto_4221 - PLACE
      ?auto_4222 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4223 ?auto_4226 ) ( IS-CRATE ?auto_4220 ) ( not ( = ?auto_4219 ?auto_4220 ) ) ( not ( = ?auto_4218 ?auto_4219 ) ) ( not ( = ?auto_4218 ?auto_4220 ) ) ( not ( = ?auto_4225 ?auto_4226 ) ) ( HOIST-AT ?auto_4228 ?auto_4225 ) ( not ( = ?auto_4223 ?auto_4228 ) ) ( AVAILABLE ?auto_4228 ) ( SURFACE-AT ?auto_4220 ?auto_4225 ) ( ON ?auto_4220 ?auto_4227 ) ( CLEAR ?auto_4220 ) ( not ( = ?auto_4219 ?auto_4227 ) ) ( not ( = ?auto_4220 ?auto_4227 ) ) ( not ( = ?auto_4218 ?auto_4227 ) ) ( SURFACE-AT ?auto_4218 ?auto_4226 ) ( CLEAR ?auto_4218 ) ( IS-CRATE ?auto_4219 ) ( AVAILABLE ?auto_4223 ) ( TRUCK-AT ?auto_4224 ?auto_4221 ) ( not ( = ?auto_4221 ?auto_4226 ) ) ( not ( = ?auto_4225 ?auto_4221 ) ) ( HOIST-AT ?auto_4222 ?auto_4221 ) ( LIFTING ?auto_4222 ?auto_4219 ) ( not ( = ?auto_4223 ?auto_4222 ) ) ( not ( = ?auto_4228 ?auto_4222 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4219 ?auto_4220 )
      ( MAKE-2CRATE-VERIFY ?auto_4218 ?auto_4219 ?auto_4220 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4229 - SURFACE
      ?auto_4230 - SURFACE
      ?auto_4231 - SURFACE
      ?auto_4232 - SURFACE
    )
    :vars
    (
      ?auto_4240 - HOIST
      ?auto_4235 - PLACE
      ?auto_4238 - PLACE
      ?auto_4236 - HOIST
      ?auto_4237 - SURFACE
      ?auto_4234 - TRUCK
      ?auto_4233 - PLACE
      ?auto_4239 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4240 ?auto_4235 ) ( IS-CRATE ?auto_4232 ) ( not ( = ?auto_4231 ?auto_4232 ) ) ( not ( = ?auto_4230 ?auto_4231 ) ) ( not ( = ?auto_4230 ?auto_4232 ) ) ( not ( = ?auto_4238 ?auto_4235 ) ) ( HOIST-AT ?auto_4236 ?auto_4238 ) ( not ( = ?auto_4240 ?auto_4236 ) ) ( AVAILABLE ?auto_4236 ) ( SURFACE-AT ?auto_4232 ?auto_4238 ) ( ON ?auto_4232 ?auto_4237 ) ( CLEAR ?auto_4232 ) ( not ( = ?auto_4231 ?auto_4237 ) ) ( not ( = ?auto_4232 ?auto_4237 ) ) ( not ( = ?auto_4230 ?auto_4237 ) ) ( SURFACE-AT ?auto_4230 ?auto_4235 ) ( CLEAR ?auto_4230 ) ( IS-CRATE ?auto_4231 ) ( AVAILABLE ?auto_4240 ) ( TRUCK-AT ?auto_4234 ?auto_4233 ) ( not ( = ?auto_4233 ?auto_4235 ) ) ( not ( = ?auto_4238 ?auto_4233 ) ) ( HOIST-AT ?auto_4239 ?auto_4233 ) ( LIFTING ?auto_4239 ?auto_4231 ) ( not ( = ?auto_4240 ?auto_4239 ) ) ( not ( = ?auto_4236 ?auto_4239 ) ) ( ON ?auto_4230 ?auto_4229 ) ( not ( = ?auto_4229 ?auto_4230 ) ) ( not ( = ?auto_4229 ?auto_4231 ) ) ( not ( = ?auto_4229 ?auto_4232 ) ) ( not ( = ?auto_4229 ?auto_4237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4230 ?auto_4231 ?auto_4232 )
      ( MAKE-3CRATE-VERIFY ?auto_4229 ?auto_4230 ?auto_4231 ?auto_4232 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4241 - SURFACE
      ?auto_4242 - SURFACE
    )
    :vars
    (
      ?auto_4251 - HOIST
      ?auto_4245 - PLACE
      ?auto_4249 - SURFACE
      ?auto_4248 - PLACE
      ?auto_4246 - HOIST
      ?auto_4247 - SURFACE
      ?auto_4244 - TRUCK
      ?auto_4243 - PLACE
      ?auto_4250 - HOIST
      ?auto_4252 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4251 ?auto_4245 ) ( IS-CRATE ?auto_4242 ) ( not ( = ?auto_4241 ?auto_4242 ) ) ( not ( = ?auto_4249 ?auto_4241 ) ) ( not ( = ?auto_4249 ?auto_4242 ) ) ( not ( = ?auto_4248 ?auto_4245 ) ) ( HOIST-AT ?auto_4246 ?auto_4248 ) ( not ( = ?auto_4251 ?auto_4246 ) ) ( AVAILABLE ?auto_4246 ) ( SURFACE-AT ?auto_4242 ?auto_4248 ) ( ON ?auto_4242 ?auto_4247 ) ( CLEAR ?auto_4242 ) ( not ( = ?auto_4241 ?auto_4247 ) ) ( not ( = ?auto_4242 ?auto_4247 ) ) ( not ( = ?auto_4249 ?auto_4247 ) ) ( SURFACE-AT ?auto_4249 ?auto_4245 ) ( CLEAR ?auto_4249 ) ( IS-CRATE ?auto_4241 ) ( AVAILABLE ?auto_4251 ) ( TRUCK-AT ?auto_4244 ?auto_4243 ) ( not ( = ?auto_4243 ?auto_4245 ) ) ( not ( = ?auto_4248 ?auto_4243 ) ) ( HOIST-AT ?auto_4250 ?auto_4243 ) ( not ( = ?auto_4251 ?auto_4250 ) ) ( not ( = ?auto_4246 ?auto_4250 ) ) ( AVAILABLE ?auto_4250 ) ( SURFACE-AT ?auto_4241 ?auto_4243 ) ( ON ?auto_4241 ?auto_4252 ) ( CLEAR ?auto_4241 ) ( not ( = ?auto_4241 ?auto_4252 ) ) ( not ( = ?auto_4242 ?auto_4252 ) ) ( not ( = ?auto_4249 ?auto_4252 ) ) ( not ( = ?auto_4247 ?auto_4252 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4250 ?auto_4241 ?auto_4252 ?auto_4243 )
      ( MAKE-2CRATE ?auto_4249 ?auto_4241 ?auto_4242 )
      ( MAKE-1CRATE-VERIFY ?auto_4241 ?auto_4242 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4253 - SURFACE
      ?auto_4254 - SURFACE
      ?auto_4255 - SURFACE
    )
    :vars
    (
      ?auto_4263 - HOIST
      ?auto_4259 - PLACE
      ?auto_4258 - PLACE
      ?auto_4256 - HOIST
      ?auto_4264 - SURFACE
      ?auto_4257 - TRUCK
      ?auto_4260 - PLACE
      ?auto_4262 - HOIST
      ?auto_4261 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4263 ?auto_4259 ) ( IS-CRATE ?auto_4255 ) ( not ( = ?auto_4254 ?auto_4255 ) ) ( not ( = ?auto_4253 ?auto_4254 ) ) ( not ( = ?auto_4253 ?auto_4255 ) ) ( not ( = ?auto_4258 ?auto_4259 ) ) ( HOIST-AT ?auto_4256 ?auto_4258 ) ( not ( = ?auto_4263 ?auto_4256 ) ) ( AVAILABLE ?auto_4256 ) ( SURFACE-AT ?auto_4255 ?auto_4258 ) ( ON ?auto_4255 ?auto_4264 ) ( CLEAR ?auto_4255 ) ( not ( = ?auto_4254 ?auto_4264 ) ) ( not ( = ?auto_4255 ?auto_4264 ) ) ( not ( = ?auto_4253 ?auto_4264 ) ) ( SURFACE-AT ?auto_4253 ?auto_4259 ) ( CLEAR ?auto_4253 ) ( IS-CRATE ?auto_4254 ) ( AVAILABLE ?auto_4263 ) ( TRUCK-AT ?auto_4257 ?auto_4260 ) ( not ( = ?auto_4260 ?auto_4259 ) ) ( not ( = ?auto_4258 ?auto_4260 ) ) ( HOIST-AT ?auto_4262 ?auto_4260 ) ( not ( = ?auto_4263 ?auto_4262 ) ) ( not ( = ?auto_4256 ?auto_4262 ) ) ( AVAILABLE ?auto_4262 ) ( SURFACE-AT ?auto_4254 ?auto_4260 ) ( ON ?auto_4254 ?auto_4261 ) ( CLEAR ?auto_4254 ) ( not ( = ?auto_4254 ?auto_4261 ) ) ( not ( = ?auto_4255 ?auto_4261 ) ) ( not ( = ?auto_4253 ?auto_4261 ) ) ( not ( = ?auto_4264 ?auto_4261 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4254 ?auto_4255 )
      ( MAKE-2CRATE-VERIFY ?auto_4253 ?auto_4254 ?auto_4255 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4265 - SURFACE
      ?auto_4266 - SURFACE
      ?auto_4267 - SURFACE
      ?auto_4268 - SURFACE
    )
    :vars
    (
      ?auto_4274 - HOIST
      ?auto_4271 - PLACE
      ?auto_4269 - PLACE
      ?auto_4277 - HOIST
      ?auto_4272 - SURFACE
      ?auto_4273 - TRUCK
      ?auto_4276 - PLACE
      ?auto_4275 - HOIST
      ?auto_4270 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4274 ?auto_4271 ) ( IS-CRATE ?auto_4268 ) ( not ( = ?auto_4267 ?auto_4268 ) ) ( not ( = ?auto_4266 ?auto_4267 ) ) ( not ( = ?auto_4266 ?auto_4268 ) ) ( not ( = ?auto_4269 ?auto_4271 ) ) ( HOIST-AT ?auto_4277 ?auto_4269 ) ( not ( = ?auto_4274 ?auto_4277 ) ) ( AVAILABLE ?auto_4277 ) ( SURFACE-AT ?auto_4268 ?auto_4269 ) ( ON ?auto_4268 ?auto_4272 ) ( CLEAR ?auto_4268 ) ( not ( = ?auto_4267 ?auto_4272 ) ) ( not ( = ?auto_4268 ?auto_4272 ) ) ( not ( = ?auto_4266 ?auto_4272 ) ) ( SURFACE-AT ?auto_4266 ?auto_4271 ) ( CLEAR ?auto_4266 ) ( IS-CRATE ?auto_4267 ) ( AVAILABLE ?auto_4274 ) ( TRUCK-AT ?auto_4273 ?auto_4276 ) ( not ( = ?auto_4276 ?auto_4271 ) ) ( not ( = ?auto_4269 ?auto_4276 ) ) ( HOIST-AT ?auto_4275 ?auto_4276 ) ( not ( = ?auto_4274 ?auto_4275 ) ) ( not ( = ?auto_4277 ?auto_4275 ) ) ( AVAILABLE ?auto_4275 ) ( SURFACE-AT ?auto_4267 ?auto_4276 ) ( ON ?auto_4267 ?auto_4270 ) ( CLEAR ?auto_4267 ) ( not ( = ?auto_4267 ?auto_4270 ) ) ( not ( = ?auto_4268 ?auto_4270 ) ) ( not ( = ?auto_4266 ?auto_4270 ) ) ( not ( = ?auto_4272 ?auto_4270 ) ) ( ON ?auto_4266 ?auto_4265 ) ( not ( = ?auto_4265 ?auto_4266 ) ) ( not ( = ?auto_4265 ?auto_4267 ) ) ( not ( = ?auto_4265 ?auto_4268 ) ) ( not ( = ?auto_4265 ?auto_4272 ) ) ( not ( = ?auto_4265 ?auto_4270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4266 ?auto_4267 ?auto_4268 )
      ( MAKE-3CRATE-VERIFY ?auto_4265 ?auto_4266 ?auto_4267 ?auto_4268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4278 - SURFACE
      ?auto_4279 - SURFACE
    )
    :vars
    (
      ?auto_4285 - HOIST
      ?auto_4282 - PLACE
      ?auto_4288 - SURFACE
      ?auto_4280 - PLACE
      ?auto_4289 - HOIST
      ?auto_4283 - SURFACE
      ?auto_4287 - PLACE
      ?auto_4286 - HOIST
      ?auto_4281 - SURFACE
      ?auto_4284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4285 ?auto_4282 ) ( IS-CRATE ?auto_4279 ) ( not ( = ?auto_4278 ?auto_4279 ) ) ( not ( = ?auto_4288 ?auto_4278 ) ) ( not ( = ?auto_4288 ?auto_4279 ) ) ( not ( = ?auto_4280 ?auto_4282 ) ) ( HOIST-AT ?auto_4289 ?auto_4280 ) ( not ( = ?auto_4285 ?auto_4289 ) ) ( AVAILABLE ?auto_4289 ) ( SURFACE-AT ?auto_4279 ?auto_4280 ) ( ON ?auto_4279 ?auto_4283 ) ( CLEAR ?auto_4279 ) ( not ( = ?auto_4278 ?auto_4283 ) ) ( not ( = ?auto_4279 ?auto_4283 ) ) ( not ( = ?auto_4288 ?auto_4283 ) ) ( SURFACE-AT ?auto_4288 ?auto_4282 ) ( CLEAR ?auto_4288 ) ( IS-CRATE ?auto_4278 ) ( AVAILABLE ?auto_4285 ) ( not ( = ?auto_4287 ?auto_4282 ) ) ( not ( = ?auto_4280 ?auto_4287 ) ) ( HOIST-AT ?auto_4286 ?auto_4287 ) ( not ( = ?auto_4285 ?auto_4286 ) ) ( not ( = ?auto_4289 ?auto_4286 ) ) ( AVAILABLE ?auto_4286 ) ( SURFACE-AT ?auto_4278 ?auto_4287 ) ( ON ?auto_4278 ?auto_4281 ) ( CLEAR ?auto_4278 ) ( not ( = ?auto_4278 ?auto_4281 ) ) ( not ( = ?auto_4279 ?auto_4281 ) ) ( not ( = ?auto_4288 ?auto_4281 ) ) ( not ( = ?auto_4283 ?auto_4281 ) ) ( TRUCK-AT ?auto_4284 ?auto_4282 ) )
    :subtasks
    ( ( !DRIVE ?auto_4284 ?auto_4282 ?auto_4287 )
      ( MAKE-2CRATE ?auto_4288 ?auto_4278 ?auto_4279 )
      ( MAKE-1CRATE-VERIFY ?auto_4278 ?auto_4279 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4290 - SURFACE
      ?auto_4291 - SURFACE
      ?auto_4292 - SURFACE
    )
    :vars
    (
      ?auto_4293 - HOIST
      ?auto_4297 - PLACE
      ?auto_4295 - PLACE
      ?auto_4300 - HOIST
      ?auto_4298 - SURFACE
      ?auto_4301 - PLACE
      ?auto_4296 - HOIST
      ?auto_4299 - SURFACE
      ?auto_4294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4293 ?auto_4297 ) ( IS-CRATE ?auto_4292 ) ( not ( = ?auto_4291 ?auto_4292 ) ) ( not ( = ?auto_4290 ?auto_4291 ) ) ( not ( = ?auto_4290 ?auto_4292 ) ) ( not ( = ?auto_4295 ?auto_4297 ) ) ( HOIST-AT ?auto_4300 ?auto_4295 ) ( not ( = ?auto_4293 ?auto_4300 ) ) ( AVAILABLE ?auto_4300 ) ( SURFACE-AT ?auto_4292 ?auto_4295 ) ( ON ?auto_4292 ?auto_4298 ) ( CLEAR ?auto_4292 ) ( not ( = ?auto_4291 ?auto_4298 ) ) ( not ( = ?auto_4292 ?auto_4298 ) ) ( not ( = ?auto_4290 ?auto_4298 ) ) ( SURFACE-AT ?auto_4290 ?auto_4297 ) ( CLEAR ?auto_4290 ) ( IS-CRATE ?auto_4291 ) ( AVAILABLE ?auto_4293 ) ( not ( = ?auto_4301 ?auto_4297 ) ) ( not ( = ?auto_4295 ?auto_4301 ) ) ( HOIST-AT ?auto_4296 ?auto_4301 ) ( not ( = ?auto_4293 ?auto_4296 ) ) ( not ( = ?auto_4300 ?auto_4296 ) ) ( AVAILABLE ?auto_4296 ) ( SURFACE-AT ?auto_4291 ?auto_4301 ) ( ON ?auto_4291 ?auto_4299 ) ( CLEAR ?auto_4291 ) ( not ( = ?auto_4291 ?auto_4299 ) ) ( not ( = ?auto_4292 ?auto_4299 ) ) ( not ( = ?auto_4290 ?auto_4299 ) ) ( not ( = ?auto_4298 ?auto_4299 ) ) ( TRUCK-AT ?auto_4294 ?auto_4297 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4291 ?auto_4292 )
      ( MAKE-2CRATE-VERIFY ?auto_4290 ?auto_4291 ?auto_4292 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4302 - SURFACE
      ?auto_4303 - SURFACE
      ?auto_4304 - SURFACE
      ?auto_4305 - SURFACE
    )
    :vars
    (
      ?auto_4308 - HOIST
      ?auto_4312 - PLACE
      ?auto_4314 - PLACE
      ?auto_4313 - HOIST
      ?auto_4306 - SURFACE
      ?auto_4307 - PLACE
      ?auto_4311 - HOIST
      ?auto_4309 - SURFACE
      ?auto_4310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4308 ?auto_4312 ) ( IS-CRATE ?auto_4305 ) ( not ( = ?auto_4304 ?auto_4305 ) ) ( not ( = ?auto_4303 ?auto_4304 ) ) ( not ( = ?auto_4303 ?auto_4305 ) ) ( not ( = ?auto_4314 ?auto_4312 ) ) ( HOIST-AT ?auto_4313 ?auto_4314 ) ( not ( = ?auto_4308 ?auto_4313 ) ) ( AVAILABLE ?auto_4313 ) ( SURFACE-AT ?auto_4305 ?auto_4314 ) ( ON ?auto_4305 ?auto_4306 ) ( CLEAR ?auto_4305 ) ( not ( = ?auto_4304 ?auto_4306 ) ) ( not ( = ?auto_4305 ?auto_4306 ) ) ( not ( = ?auto_4303 ?auto_4306 ) ) ( SURFACE-AT ?auto_4303 ?auto_4312 ) ( CLEAR ?auto_4303 ) ( IS-CRATE ?auto_4304 ) ( AVAILABLE ?auto_4308 ) ( not ( = ?auto_4307 ?auto_4312 ) ) ( not ( = ?auto_4314 ?auto_4307 ) ) ( HOIST-AT ?auto_4311 ?auto_4307 ) ( not ( = ?auto_4308 ?auto_4311 ) ) ( not ( = ?auto_4313 ?auto_4311 ) ) ( AVAILABLE ?auto_4311 ) ( SURFACE-AT ?auto_4304 ?auto_4307 ) ( ON ?auto_4304 ?auto_4309 ) ( CLEAR ?auto_4304 ) ( not ( = ?auto_4304 ?auto_4309 ) ) ( not ( = ?auto_4305 ?auto_4309 ) ) ( not ( = ?auto_4303 ?auto_4309 ) ) ( not ( = ?auto_4306 ?auto_4309 ) ) ( TRUCK-AT ?auto_4310 ?auto_4312 ) ( ON ?auto_4303 ?auto_4302 ) ( not ( = ?auto_4302 ?auto_4303 ) ) ( not ( = ?auto_4302 ?auto_4304 ) ) ( not ( = ?auto_4302 ?auto_4305 ) ) ( not ( = ?auto_4302 ?auto_4306 ) ) ( not ( = ?auto_4302 ?auto_4309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4303 ?auto_4304 ?auto_4305 )
      ( MAKE-3CRATE-VERIFY ?auto_4302 ?auto_4303 ?auto_4304 ?auto_4305 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4315 - SURFACE
      ?auto_4316 - SURFACE
    )
    :vars
    (
      ?auto_4319 - HOIST
      ?auto_4323 - PLACE
      ?auto_4326 - SURFACE
      ?auto_4325 - PLACE
      ?auto_4324 - HOIST
      ?auto_4317 - SURFACE
      ?auto_4318 - PLACE
      ?auto_4322 - HOIST
      ?auto_4320 - SURFACE
      ?auto_4321 - TRUCK
      ?auto_4327 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4319 ?auto_4323 ) ( IS-CRATE ?auto_4316 ) ( not ( = ?auto_4315 ?auto_4316 ) ) ( not ( = ?auto_4326 ?auto_4315 ) ) ( not ( = ?auto_4326 ?auto_4316 ) ) ( not ( = ?auto_4325 ?auto_4323 ) ) ( HOIST-AT ?auto_4324 ?auto_4325 ) ( not ( = ?auto_4319 ?auto_4324 ) ) ( AVAILABLE ?auto_4324 ) ( SURFACE-AT ?auto_4316 ?auto_4325 ) ( ON ?auto_4316 ?auto_4317 ) ( CLEAR ?auto_4316 ) ( not ( = ?auto_4315 ?auto_4317 ) ) ( not ( = ?auto_4316 ?auto_4317 ) ) ( not ( = ?auto_4326 ?auto_4317 ) ) ( IS-CRATE ?auto_4315 ) ( not ( = ?auto_4318 ?auto_4323 ) ) ( not ( = ?auto_4325 ?auto_4318 ) ) ( HOIST-AT ?auto_4322 ?auto_4318 ) ( not ( = ?auto_4319 ?auto_4322 ) ) ( not ( = ?auto_4324 ?auto_4322 ) ) ( AVAILABLE ?auto_4322 ) ( SURFACE-AT ?auto_4315 ?auto_4318 ) ( ON ?auto_4315 ?auto_4320 ) ( CLEAR ?auto_4315 ) ( not ( = ?auto_4315 ?auto_4320 ) ) ( not ( = ?auto_4316 ?auto_4320 ) ) ( not ( = ?auto_4326 ?auto_4320 ) ) ( not ( = ?auto_4317 ?auto_4320 ) ) ( TRUCK-AT ?auto_4321 ?auto_4323 ) ( SURFACE-AT ?auto_4327 ?auto_4323 ) ( CLEAR ?auto_4327 ) ( LIFTING ?auto_4319 ?auto_4326 ) ( IS-CRATE ?auto_4326 ) ( not ( = ?auto_4327 ?auto_4326 ) ) ( not ( = ?auto_4315 ?auto_4327 ) ) ( not ( = ?auto_4316 ?auto_4327 ) ) ( not ( = ?auto_4317 ?auto_4327 ) ) ( not ( = ?auto_4320 ?auto_4327 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4327 ?auto_4326 )
      ( MAKE-2CRATE ?auto_4326 ?auto_4315 ?auto_4316 )
      ( MAKE-1CRATE-VERIFY ?auto_4315 ?auto_4316 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4328 - SURFACE
      ?auto_4329 - SURFACE
      ?auto_4330 - SURFACE
    )
    :vars
    (
      ?auto_4332 - HOIST
      ?auto_4337 - PLACE
      ?auto_4339 - PLACE
      ?auto_4331 - HOIST
      ?auto_4333 - SURFACE
      ?auto_4340 - PLACE
      ?auto_4336 - HOIST
      ?auto_4335 - SURFACE
      ?auto_4338 - TRUCK
      ?auto_4334 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4332 ?auto_4337 ) ( IS-CRATE ?auto_4330 ) ( not ( = ?auto_4329 ?auto_4330 ) ) ( not ( = ?auto_4328 ?auto_4329 ) ) ( not ( = ?auto_4328 ?auto_4330 ) ) ( not ( = ?auto_4339 ?auto_4337 ) ) ( HOIST-AT ?auto_4331 ?auto_4339 ) ( not ( = ?auto_4332 ?auto_4331 ) ) ( AVAILABLE ?auto_4331 ) ( SURFACE-AT ?auto_4330 ?auto_4339 ) ( ON ?auto_4330 ?auto_4333 ) ( CLEAR ?auto_4330 ) ( not ( = ?auto_4329 ?auto_4333 ) ) ( not ( = ?auto_4330 ?auto_4333 ) ) ( not ( = ?auto_4328 ?auto_4333 ) ) ( IS-CRATE ?auto_4329 ) ( not ( = ?auto_4340 ?auto_4337 ) ) ( not ( = ?auto_4339 ?auto_4340 ) ) ( HOIST-AT ?auto_4336 ?auto_4340 ) ( not ( = ?auto_4332 ?auto_4336 ) ) ( not ( = ?auto_4331 ?auto_4336 ) ) ( AVAILABLE ?auto_4336 ) ( SURFACE-AT ?auto_4329 ?auto_4340 ) ( ON ?auto_4329 ?auto_4335 ) ( CLEAR ?auto_4329 ) ( not ( = ?auto_4329 ?auto_4335 ) ) ( not ( = ?auto_4330 ?auto_4335 ) ) ( not ( = ?auto_4328 ?auto_4335 ) ) ( not ( = ?auto_4333 ?auto_4335 ) ) ( TRUCK-AT ?auto_4338 ?auto_4337 ) ( SURFACE-AT ?auto_4334 ?auto_4337 ) ( CLEAR ?auto_4334 ) ( LIFTING ?auto_4332 ?auto_4328 ) ( IS-CRATE ?auto_4328 ) ( not ( = ?auto_4334 ?auto_4328 ) ) ( not ( = ?auto_4329 ?auto_4334 ) ) ( not ( = ?auto_4330 ?auto_4334 ) ) ( not ( = ?auto_4333 ?auto_4334 ) ) ( not ( = ?auto_4335 ?auto_4334 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4329 ?auto_4330 )
      ( MAKE-2CRATE-VERIFY ?auto_4328 ?auto_4329 ?auto_4330 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4341 - SURFACE
      ?auto_4342 - SURFACE
      ?auto_4343 - SURFACE
      ?auto_4344 - SURFACE
    )
    :vars
    (
      ?auto_4353 - HOIST
      ?auto_4348 - PLACE
      ?auto_4345 - PLACE
      ?auto_4346 - HOIST
      ?auto_4347 - SURFACE
      ?auto_4350 - PLACE
      ?auto_4351 - HOIST
      ?auto_4352 - SURFACE
      ?auto_4349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4353 ?auto_4348 ) ( IS-CRATE ?auto_4344 ) ( not ( = ?auto_4343 ?auto_4344 ) ) ( not ( = ?auto_4342 ?auto_4343 ) ) ( not ( = ?auto_4342 ?auto_4344 ) ) ( not ( = ?auto_4345 ?auto_4348 ) ) ( HOIST-AT ?auto_4346 ?auto_4345 ) ( not ( = ?auto_4353 ?auto_4346 ) ) ( AVAILABLE ?auto_4346 ) ( SURFACE-AT ?auto_4344 ?auto_4345 ) ( ON ?auto_4344 ?auto_4347 ) ( CLEAR ?auto_4344 ) ( not ( = ?auto_4343 ?auto_4347 ) ) ( not ( = ?auto_4344 ?auto_4347 ) ) ( not ( = ?auto_4342 ?auto_4347 ) ) ( IS-CRATE ?auto_4343 ) ( not ( = ?auto_4350 ?auto_4348 ) ) ( not ( = ?auto_4345 ?auto_4350 ) ) ( HOIST-AT ?auto_4351 ?auto_4350 ) ( not ( = ?auto_4353 ?auto_4351 ) ) ( not ( = ?auto_4346 ?auto_4351 ) ) ( AVAILABLE ?auto_4351 ) ( SURFACE-AT ?auto_4343 ?auto_4350 ) ( ON ?auto_4343 ?auto_4352 ) ( CLEAR ?auto_4343 ) ( not ( = ?auto_4343 ?auto_4352 ) ) ( not ( = ?auto_4344 ?auto_4352 ) ) ( not ( = ?auto_4342 ?auto_4352 ) ) ( not ( = ?auto_4347 ?auto_4352 ) ) ( TRUCK-AT ?auto_4349 ?auto_4348 ) ( SURFACE-AT ?auto_4341 ?auto_4348 ) ( CLEAR ?auto_4341 ) ( LIFTING ?auto_4353 ?auto_4342 ) ( IS-CRATE ?auto_4342 ) ( not ( = ?auto_4341 ?auto_4342 ) ) ( not ( = ?auto_4343 ?auto_4341 ) ) ( not ( = ?auto_4344 ?auto_4341 ) ) ( not ( = ?auto_4347 ?auto_4341 ) ) ( not ( = ?auto_4352 ?auto_4341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4342 ?auto_4343 ?auto_4344 )
      ( MAKE-3CRATE-VERIFY ?auto_4341 ?auto_4342 ?auto_4343 ?auto_4344 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4354 - SURFACE
      ?auto_4355 - SURFACE
    )
    :vars
    (
      ?auto_4366 - HOIST
      ?auto_4361 - PLACE
      ?auto_4357 - SURFACE
      ?auto_4358 - PLACE
      ?auto_4359 - HOIST
      ?auto_4360 - SURFACE
      ?auto_4363 - PLACE
      ?auto_4364 - HOIST
      ?auto_4365 - SURFACE
      ?auto_4362 - TRUCK
      ?auto_4356 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4366 ?auto_4361 ) ( IS-CRATE ?auto_4355 ) ( not ( = ?auto_4354 ?auto_4355 ) ) ( not ( = ?auto_4357 ?auto_4354 ) ) ( not ( = ?auto_4357 ?auto_4355 ) ) ( not ( = ?auto_4358 ?auto_4361 ) ) ( HOIST-AT ?auto_4359 ?auto_4358 ) ( not ( = ?auto_4366 ?auto_4359 ) ) ( AVAILABLE ?auto_4359 ) ( SURFACE-AT ?auto_4355 ?auto_4358 ) ( ON ?auto_4355 ?auto_4360 ) ( CLEAR ?auto_4355 ) ( not ( = ?auto_4354 ?auto_4360 ) ) ( not ( = ?auto_4355 ?auto_4360 ) ) ( not ( = ?auto_4357 ?auto_4360 ) ) ( IS-CRATE ?auto_4354 ) ( not ( = ?auto_4363 ?auto_4361 ) ) ( not ( = ?auto_4358 ?auto_4363 ) ) ( HOIST-AT ?auto_4364 ?auto_4363 ) ( not ( = ?auto_4366 ?auto_4364 ) ) ( not ( = ?auto_4359 ?auto_4364 ) ) ( AVAILABLE ?auto_4364 ) ( SURFACE-AT ?auto_4354 ?auto_4363 ) ( ON ?auto_4354 ?auto_4365 ) ( CLEAR ?auto_4354 ) ( not ( = ?auto_4354 ?auto_4365 ) ) ( not ( = ?auto_4355 ?auto_4365 ) ) ( not ( = ?auto_4357 ?auto_4365 ) ) ( not ( = ?auto_4360 ?auto_4365 ) ) ( TRUCK-AT ?auto_4362 ?auto_4361 ) ( SURFACE-AT ?auto_4356 ?auto_4361 ) ( CLEAR ?auto_4356 ) ( IS-CRATE ?auto_4357 ) ( not ( = ?auto_4356 ?auto_4357 ) ) ( not ( = ?auto_4354 ?auto_4356 ) ) ( not ( = ?auto_4355 ?auto_4356 ) ) ( not ( = ?auto_4360 ?auto_4356 ) ) ( not ( = ?auto_4365 ?auto_4356 ) ) ( AVAILABLE ?auto_4366 ) ( IN ?auto_4357 ?auto_4362 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4366 ?auto_4357 ?auto_4362 ?auto_4361 )
      ( MAKE-2CRATE ?auto_4357 ?auto_4354 ?auto_4355 )
      ( MAKE-1CRATE-VERIFY ?auto_4354 ?auto_4355 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4367 - SURFACE
      ?auto_4368 - SURFACE
      ?auto_4369 - SURFACE
    )
    :vars
    (
      ?auto_4379 - HOIST
      ?auto_4374 - PLACE
      ?auto_4372 - PLACE
      ?auto_4377 - HOIST
      ?auto_4373 - SURFACE
      ?auto_4371 - PLACE
      ?auto_4375 - HOIST
      ?auto_4378 - SURFACE
      ?auto_4376 - TRUCK
      ?auto_4370 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4379 ?auto_4374 ) ( IS-CRATE ?auto_4369 ) ( not ( = ?auto_4368 ?auto_4369 ) ) ( not ( = ?auto_4367 ?auto_4368 ) ) ( not ( = ?auto_4367 ?auto_4369 ) ) ( not ( = ?auto_4372 ?auto_4374 ) ) ( HOIST-AT ?auto_4377 ?auto_4372 ) ( not ( = ?auto_4379 ?auto_4377 ) ) ( AVAILABLE ?auto_4377 ) ( SURFACE-AT ?auto_4369 ?auto_4372 ) ( ON ?auto_4369 ?auto_4373 ) ( CLEAR ?auto_4369 ) ( not ( = ?auto_4368 ?auto_4373 ) ) ( not ( = ?auto_4369 ?auto_4373 ) ) ( not ( = ?auto_4367 ?auto_4373 ) ) ( IS-CRATE ?auto_4368 ) ( not ( = ?auto_4371 ?auto_4374 ) ) ( not ( = ?auto_4372 ?auto_4371 ) ) ( HOIST-AT ?auto_4375 ?auto_4371 ) ( not ( = ?auto_4379 ?auto_4375 ) ) ( not ( = ?auto_4377 ?auto_4375 ) ) ( AVAILABLE ?auto_4375 ) ( SURFACE-AT ?auto_4368 ?auto_4371 ) ( ON ?auto_4368 ?auto_4378 ) ( CLEAR ?auto_4368 ) ( not ( = ?auto_4368 ?auto_4378 ) ) ( not ( = ?auto_4369 ?auto_4378 ) ) ( not ( = ?auto_4367 ?auto_4378 ) ) ( not ( = ?auto_4373 ?auto_4378 ) ) ( TRUCK-AT ?auto_4376 ?auto_4374 ) ( SURFACE-AT ?auto_4370 ?auto_4374 ) ( CLEAR ?auto_4370 ) ( IS-CRATE ?auto_4367 ) ( not ( = ?auto_4370 ?auto_4367 ) ) ( not ( = ?auto_4368 ?auto_4370 ) ) ( not ( = ?auto_4369 ?auto_4370 ) ) ( not ( = ?auto_4373 ?auto_4370 ) ) ( not ( = ?auto_4378 ?auto_4370 ) ) ( AVAILABLE ?auto_4379 ) ( IN ?auto_4367 ?auto_4376 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4368 ?auto_4369 )
      ( MAKE-2CRATE-VERIFY ?auto_4367 ?auto_4368 ?auto_4369 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4380 - SURFACE
      ?auto_4381 - SURFACE
      ?auto_4382 - SURFACE
      ?auto_4383 - SURFACE
    )
    :vars
    (
      ?auto_4388 - HOIST
      ?auto_4389 - PLACE
      ?auto_4390 - PLACE
      ?auto_4387 - HOIST
      ?auto_4392 - SURFACE
      ?auto_4386 - PLACE
      ?auto_4385 - HOIST
      ?auto_4391 - SURFACE
      ?auto_4384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4388 ?auto_4389 ) ( IS-CRATE ?auto_4383 ) ( not ( = ?auto_4382 ?auto_4383 ) ) ( not ( = ?auto_4381 ?auto_4382 ) ) ( not ( = ?auto_4381 ?auto_4383 ) ) ( not ( = ?auto_4390 ?auto_4389 ) ) ( HOIST-AT ?auto_4387 ?auto_4390 ) ( not ( = ?auto_4388 ?auto_4387 ) ) ( AVAILABLE ?auto_4387 ) ( SURFACE-AT ?auto_4383 ?auto_4390 ) ( ON ?auto_4383 ?auto_4392 ) ( CLEAR ?auto_4383 ) ( not ( = ?auto_4382 ?auto_4392 ) ) ( not ( = ?auto_4383 ?auto_4392 ) ) ( not ( = ?auto_4381 ?auto_4392 ) ) ( IS-CRATE ?auto_4382 ) ( not ( = ?auto_4386 ?auto_4389 ) ) ( not ( = ?auto_4390 ?auto_4386 ) ) ( HOIST-AT ?auto_4385 ?auto_4386 ) ( not ( = ?auto_4388 ?auto_4385 ) ) ( not ( = ?auto_4387 ?auto_4385 ) ) ( AVAILABLE ?auto_4385 ) ( SURFACE-AT ?auto_4382 ?auto_4386 ) ( ON ?auto_4382 ?auto_4391 ) ( CLEAR ?auto_4382 ) ( not ( = ?auto_4382 ?auto_4391 ) ) ( not ( = ?auto_4383 ?auto_4391 ) ) ( not ( = ?auto_4381 ?auto_4391 ) ) ( not ( = ?auto_4392 ?auto_4391 ) ) ( TRUCK-AT ?auto_4384 ?auto_4389 ) ( SURFACE-AT ?auto_4380 ?auto_4389 ) ( CLEAR ?auto_4380 ) ( IS-CRATE ?auto_4381 ) ( not ( = ?auto_4380 ?auto_4381 ) ) ( not ( = ?auto_4382 ?auto_4380 ) ) ( not ( = ?auto_4383 ?auto_4380 ) ) ( not ( = ?auto_4392 ?auto_4380 ) ) ( not ( = ?auto_4391 ?auto_4380 ) ) ( AVAILABLE ?auto_4388 ) ( IN ?auto_4381 ?auto_4384 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4381 ?auto_4382 ?auto_4383 )
      ( MAKE-3CRATE-VERIFY ?auto_4380 ?auto_4381 ?auto_4382 ?auto_4383 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4393 - SURFACE
      ?auto_4394 - SURFACE
    )
    :vars
    (
      ?auto_4401 - HOIST
      ?auto_4402 - PLACE
      ?auto_4400 - SURFACE
      ?auto_4403 - PLACE
      ?auto_4399 - HOIST
      ?auto_4405 - SURFACE
      ?auto_4398 - PLACE
      ?auto_4397 - HOIST
      ?auto_4404 - SURFACE
      ?auto_4395 - SURFACE
      ?auto_4396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4401 ?auto_4402 ) ( IS-CRATE ?auto_4394 ) ( not ( = ?auto_4393 ?auto_4394 ) ) ( not ( = ?auto_4400 ?auto_4393 ) ) ( not ( = ?auto_4400 ?auto_4394 ) ) ( not ( = ?auto_4403 ?auto_4402 ) ) ( HOIST-AT ?auto_4399 ?auto_4403 ) ( not ( = ?auto_4401 ?auto_4399 ) ) ( AVAILABLE ?auto_4399 ) ( SURFACE-AT ?auto_4394 ?auto_4403 ) ( ON ?auto_4394 ?auto_4405 ) ( CLEAR ?auto_4394 ) ( not ( = ?auto_4393 ?auto_4405 ) ) ( not ( = ?auto_4394 ?auto_4405 ) ) ( not ( = ?auto_4400 ?auto_4405 ) ) ( IS-CRATE ?auto_4393 ) ( not ( = ?auto_4398 ?auto_4402 ) ) ( not ( = ?auto_4403 ?auto_4398 ) ) ( HOIST-AT ?auto_4397 ?auto_4398 ) ( not ( = ?auto_4401 ?auto_4397 ) ) ( not ( = ?auto_4399 ?auto_4397 ) ) ( AVAILABLE ?auto_4397 ) ( SURFACE-AT ?auto_4393 ?auto_4398 ) ( ON ?auto_4393 ?auto_4404 ) ( CLEAR ?auto_4393 ) ( not ( = ?auto_4393 ?auto_4404 ) ) ( not ( = ?auto_4394 ?auto_4404 ) ) ( not ( = ?auto_4400 ?auto_4404 ) ) ( not ( = ?auto_4405 ?auto_4404 ) ) ( SURFACE-AT ?auto_4395 ?auto_4402 ) ( CLEAR ?auto_4395 ) ( IS-CRATE ?auto_4400 ) ( not ( = ?auto_4395 ?auto_4400 ) ) ( not ( = ?auto_4393 ?auto_4395 ) ) ( not ( = ?auto_4394 ?auto_4395 ) ) ( not ( = ?auto_4405 ?auto_4395 ) ) ( not ( = ?auto_4404 ?auto_4395 ) ) ( AVAILABLE ?auto_4401 ) ( IN ?auto_4400 ?auto_4396 ) ( TRUCK-AT ?auto_4396 ?auto_4398 ) )
    :subtasks
    ( ( !DRIVE ?auto_4396 ?auto_4398 ?auto_4402 )
      ( MAKE-2CRATE ?auto_4400 ?auto_4393 ?auto_4394 )
      ( MAKE-1CRATE-VERIFY ?auto_4393 ?auto_4394 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4406 - SURFACE
      ?auto_4407 - SURFACE
      ?auto_4408 - SURFACE
    )
    :vars
    (
      ?auto_4413 - HOIST
      ?auto_4415 - PLACE
      ?auto_4411 - PLACE
      ?auto_4409 - HOIST
      ?auto_4416 - SURFACE
      ?auto_4412 - PLACE
      ?auto_4414 - HOIST
      ?auto_4417 - SURFACE
      ?auto_4410 - SURFACE
      ?auto_4418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4413 ?auto_4415 ) ( IS-CRATE ?auto_4408 ) ( not ( = ?auto_4407 ?auto_4408 ) ) ( not ( = ?auto_4406 ?auto_4407 ) ) ( not ( = ?auto_4406 ?auto_4408 ) ) ( not ( = ?auto_4411 ?auto_4415 ) ) ( HOIST-AT ?auto_4409 ?auto_4411 ) ( not ( = ?auto_4413 ?auto_4409 ) ) ( AVAILABLE ?auto_4409 ) ( SURFACE-AT ?auto_4408 ?auto_4411 ) ( ON ?auto_4408 ?auto_4416 ) ( CLEAR ?auto_4408 ) ( not ( = ?auto_4407 ?auto_4416 ) ) ( not ( = ?auto_4408 ?auto_4416 ) ) ( not ( = ?auto_4406 ?auto_4416 ) ) ( IS-CRATE ?auto_4407 ) ( not ( = ?auto_4412 ?auto_4415 ) ) ( not ( = ?auto_4411 ?auto_4412 ) ) ( HOIST-AT ?auto_4414 ?auto_4412 ) ( not ( = ?auto_4413 ?auto_4414 ) ) ( not ( = ?auto_4409 ?auto_4414 ) ) ( AVAILABLE ?auto_4414 ) ( SURFACE-AT ?auto_4407 ?auto_4412 ) ( ON ?auto_4407 ?auto_4417 ) ( CLEAR ?auto_4407 ) ( not ( = ?auto_4407 ?auto_4417 ) ) ( not ( = ?auto_4408 ?auto_4417 ) ) ( not ( = ?auto_4406 ?auto_4417 ) ) ( not ( = ?auto_4416 ?auto_4417 ) ) ( SURFACE-AT ?auto_4410 ?auto_4415 ) ( CLEAR ?auto_4410 ) ( IS-CRATE ?auto_4406 ) ( not ( = ?auto_4410 ?auto_4406 ) ) ( not ( = ?auto_4407 ?auto_4410 ) ) ( not ( = ?auto_4408 ?auto_4410 ) ) ( not ( = ?auto_4416 ?auto_4410 ) ) ( not ( = ?auto_4417 ?auto_4410 ) ) ( AVAILABLE ?auto_4413 ) ( IN ?auto_4406 ?auto_4418 ) ( TRUCK-AT ?auto_4418 ?auto_4412 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4407 ?auto_4408 )
      ( MAKE-2CRATE-VERIFY ?auto_4406 ?auto_4407 ?auto_4408 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4419 - SURFACE
      ?auto_4420 - SURFACE
      ?auto_4421 - SURFACE
      ?auto_4422 - SURFACE
    )
    :vars
    (
      ?auto_4428 - HOIST
      ?auto_4424 - PLACE
      ?auto_4430 - PLACE
      ?auto_4431 - HOIST
      ?auto_4425 - SURFACE
      ?auto_4426 - PLACE
      ?auto_4429 - HOIST
      ?auto_4423 - SURFACE
      ?auto_4427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4428 ?auto_4424 ) ( IS-CRATE ?auto_4422 ) ( not ( = ?auto_4421 ?auto_4422 ) ) ( not ( = ?auto_4420 ?auto_4421 ) ) ( not ( = ?auto_4420 ?auto_4422 ) ) ( not ( = ?auto_4430 ?auto_4424 ) ) ( HOIST-AT ?auto_4431 ?auto_4430 ) ( not ( = ?auto_4428 ?auto_4431 ) ) ( AVAILABLE ?auto_4431 ) ( SURFACE-AT ?auto_4422 ?auto_4430 ) ( ON ?auto_4422 ?auto_4425 ) ( CLEAR ?auto_4422 ) ( not ( = ?auto_4421 ?auto_4425 ) ) ( not ( = ?auto_4422 ?auto_4425 ) ) ( not ( = ?auto_4420 ?auto_4425 ) ) ( IS-CRATE ?auto_4421 ) ( not ( = ?auto_4426 ?auto_4424 ) ) ( not ( = ?auto_4430 ?auto_4426 ) ) ( HOIST-AT ?auto_4429 ?auto_4426 ) ( not ( = ?auto_4428 ?auto_4429 ) ) ( not ( = ?auto_4431 ?auto_4429 ) ) ( AVAILABLE ?auto_4429 ) ( SURFACE-AT ?auto_4421 ?auto_4426 ) ( ON ?auto_4421 ?auto_4423 ) ( CLEAR ?auto_4421 ) ( not ( = ?auto_4421 ?auto_4423 ) ) ( not ( = ?auto_4422 ?auto_4423 ) ) ( not ( = ?auto_4420 ?auto_4423 ) ) ( not ( = ?auto_4425 ?auto_4423 ) ) ( SURFACE-AT ?auto_4419 ?auto_4424 ) ( CLEAR ?auto_4419 ) ( IS-CRATE ?auto_4420 ) ( not ( = ?auto_4419 ?auto_4420 ) ) ( not ( = ?auto_4421 ?auto_4419 ) ) ( not ( = ?auto_4422 ?auto_4419 ) ) ( not ( = ?auto_4425 ?auto_4419 ) ) ( not ( = ?auto_4423 ?auto_4419 ) ) ( AVAILABLE ?auto_4428 ) ( IN ?auto_4420 ?auto_4427 ) ( TRUCK-AT ?auto_4427 ?auto_4426 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4420 ?auto_4421 ?auto_4422 )
      ( MAKE-3CRATE-VERIFY ?auto_4419 ?auto_4420 ?auto_4421 ?auto_4422 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4432 - SURFACE
      ?auto_4433 - SURFACE
    )
    :vars
    (
      ?auto_4440 - HOIST
      ?auto_4435 - PLACE
      ?auto_4444 - SURFACE
      ?auto_4442 - PLACE
      ?auto_4443 - HOIST
      ?auto_4436 - SURFACE
      ?auto_4438 - PLACE
      ?auto_4441 - HOIST
      ?auto_4434 - SURFACE
      ?auto_4437 - SURFACE
      ?auto_4439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4440 ?auto_4435 ) ( IS-CRATE ?auto_4433 ) ( not ( = ?auto_4432 ?auto_4433 ) ) ( not ( = ?auto_4444 ?auto_4432 ) ) ( not ( = ?auto_4444 ?auto_4433 ) ) ( not ( = ?auto_4442 ?auto_4435 ) ) ( HOIST-AT ?auto_4443 ?auto_4442 ) ( not ( = ?auto_4440 ?auto_4443 ) ) ( AVAILABLE ?auto_4443 ) ( SURFACE-AT ?auto_4433 ?auto_4442 ) ( ON ?auto_4433 ?auto_4436 ) ( CLEAR ?auto_4433 ) ( not ( = ?auto_4432 ?auto_4436 ) ) ( not ( = ?auto_4433 ?auto_4436 ) ) ( not ( = ?auto_4444 ?auto_4436 ) ) ( IS-CRATE ?auto_4432 ) ( not ( = ?auto_4438 ?auto_4435 ) ) ( not ( = ?auto_4442 ?auto_4438 ) ) ( HOIST-AT ?auto_4441 ?auto_4438 ) ( not ( = ?auto_4440 ?auto_4441 ) ) ( not ( = ?auto_4443 ?auto_4441 ) ) ( SURFACE-AT ?auto_4432 ?auto_4438 ) ( ON ?auto_4432 ?auto_4434 ) ( CLEAR ?auto_4432 ) ( not ( = ?auto_4432 ?auto_4434 ) ) ( not ( = ?auto_4433 ?auto_4434 ) ) ( not ( = ?auto_4444 ?auto_4434 ) ) ( not ( = ?auto_4436 ?auto_4434 ) ) ( SURFACE-AT ?auto_4437 ?auto_4435 ) ( CLEAR ?auto_4437 ) ( IS-CRATE ?auto_4444 ) ( not ( = ?auto_4437 ?auto_4444 ) ) ( not ( = ?auto_4432 ?auto_4437 ) ) ( not ( = ?auto_4433 ?auto_4437 ) ) ( not ( = ?auto_4436 ?auto_4437 ) ) ( not ( = ?auto_4434 ?auto_4437 ) ) ( AVAILABLE ?auto_4440 ) ( TRUCK-AT ?auto_4439 ?auto_4438 ) ( LIFTING ?auto_4441 ?auto_4444 ) )
    :subtasks
    ( ( !LOAD ?auto_4441 ?auto_4444 ?auto_4439 ?auto_4438 )
      ( MAKE-2CRATE ?auto_4444 ?auto_4432 ?auto_4433 )
      ( MAKE-1CRATE-VERIFY ?auto_4432 ?auto_4433 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4445 - SURFACE
      ?auto_4446 - SURFACE
      ?auto_4447 - SURFACE
    )
    :vars
    (
      ?auto_4450 - HOIST
      ?auto_4452 - PLACE
      ?auto_4449 - PLACE
      ?auto_4456 - HOIST
      ?auto_4453 - SURFACE
      ?auto_4457 - PLACE
      ?auto_4451 - HOIST
      ?auto_4454 - SURFACE
      ?auto_4455 - SURFACE
      ?auto_4448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4450 ?auto_4452 ) ( IS-CRATE ?auto_4447 ) ( not ( = ?auto_4446 ?auto_4447 ) ) ( not ( = ?auto_4445 ?auto_4446 ) ) ( not ( = ?auto_4445 ?auto_4447 ) ) ( not ( = ?auto_4449 ?auto_4452 ) ) ( HOIST-AT ?auto_4456 ?auto_4449 ) ( not ( = ?auto_4450 ?auto_4456 ) ) ( AVAILABLE ?auto_4456 ) ( SURFACE-AT ?auto_4447 ?auto_4449 ) ( ON ?auto_4447 ?auto_4453 ) ( CLEAR ?auto_4447 ) ( not ( = ?auto_4446 ?auto_4453 ) ) ( not ( = ?auto_4447 ?auto_4453 ) ) ( not ( = ?auto_4445 ?auto_4453 ) ) ( IS-CRATE ?auto_4446 ) ( not ( = ?auto_4457 ?auto_4452 ) ) ( not ( = ?auto_4449 ?auto_4457 ) ) ( HOIST-AT ?auto_4451 ?auto_4457 ) ( not ( = ?auto_4450 ?auto_4451 ) ) ( not ( = ?auto_4456 ?auto_4451 ) ) ( SURFACE-AT ?auto_4446 ?auto_4457 ) ( ON ?auto_4446 ?auto_4454 ) ( CLEAR ?auto_4446 ) ( not ( = ?auto_4446 ?auto_4454 ) ) ( not ( = ?auto_4447 ?auto_4454 ) ) ( not ( = ?auto_4445 ?auto_4454 ) ) ( not ( = ?auto_4453 ?auto_4454 ) ) ( SURFACE-AT ?auto_4455 ?auto_4452 ) ( CLEAR ?auto_4455 ) ( IS-CRATE ?auto_4445 ) ( not ( = ?auto_4455 ?auto_4445 ) ) ( not ( = ?auto_4446 ?auto_4455 ) ) ( not ( = ?auto_4447 ?auto_4455 ) ) ( not ( = ?auto_4453 ?auto_4455 ) ) ( not ( = ?auto_4454 ?auto_4455 ) ) ( AVAILABLE ?auto_4450 ) ( TRUCK-AT ?auto_4448 ?auto_4457 ) ( LIFTING ?auto_4451 ?auto_4445 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4446 ?auto_4447 )
      ( MAKE-2CRATE-VERIFY ?auto_4445 ?auto_4446 ?auto_4447 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4458 - SURFACE
      ?auto_4459 - SURFACE
      ?auto_4460 - SURFACE
      ?auto_4461 - SURFACE
    )
    :vars
    (
      ?auto_4468 - HOIST
      ?auto_4467 - PLACE
      ?auto_4470 - PLACE
      ?auto_4465 - HOIST
      ?auto_4466 - SURFACE
      ?auto_4469 - PLACE
      ?auto_4464 - HOIST
      ?auto_4462 - SURFACE
      ?auto_4463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4468 ?auto_4467 ) ( IS-CRATE ?auto_4461 ) ( not ( = ?auto_4460 ?auto_4461 ) ) ( not ( = ?auto_4459 ?auto_4460 ) ) ( not ( = ?auto_4459 ?auto_4461 ) ) ( not ( = ?auto_4470 ?auto_4467 ) ) ( HOIST-AT ?auto_4465 ?auto_4470 ) ( not ( = ?auto_4468 ?auto_4465 ) ) ( AVAILABLE ?auto_4465 ) ( SURFACE-AT ?auto_4461 ?auto_4470 ) ( ON ?auto_4461 ?auto_4466 ) ( CLEAR ?auto_4461 ) ( not ( = ?auto_4460 ?auto_4466 ) ) ( not ( = ?auto_4461 ?auto_4466 ) ) ( not ( = ?auto_4459 ?auto_4466 ) ) ( IS-CRATE ?auto_4460 ) ( not ( = ?auto_4469 ?auto_4467 ) ) ( not ( = ?auto_4470 ?auto_4469 ) ) ( HOIST-AT ?auto_4464 ?auto_4469 ) ( not ( = ?auto_4468 ?auto_4464 ) ) ( not ( = ?auto_4465 ?auto_4464 ) ) ( SURFACE-AT ?auto_4460 ?auto_4469 ) ( ON ?auto_4460 ?auto_4462 ) ( CLEAR ?auto_4460 ) ( not ( = ?auto_4460 ?auto_4462 ) ) ( not ( = ?auto_4461 ?auto_4462 ) ) ( not ( = ?auto_4459 ?auto_4462 ) ) ( not ( = ?auto_4466 ?auto_4462 ) ) ( SURFACE-AT ?auto_4458 ?auto_4467 ) ( CLEAR ?auto_4458 ) ( IS-CRATE ?auto_4459 ) ( not ( = ?auto_4458 ?auto_4459 ) ) ( not ( = ?auto_4460 ?auto_4458 ) ) ( not ( = ?auto_4461 ?auto_4458 ) ) ( not ( = ?auto_4466 ?auto_4458 ) ) ( not ( = ?auto_4462 ?auto_4458 ) ) ( AVAILABLE ?auto_4468 ) ( TRUCK-AT ?auto_4463 ?auto_4469 ) ( LIFTING ?auto_4464 ?auto_4459 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4459 ?auto_4460 ?auto_4461 )
      ( MAKE-3CRATE-VERIFY ?auto_4458 ?auto_4459 ?auto_4460 ?auto_4461 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4471 - SURFACE
      ?auto_4472 - SURFACE
    )
    :vars
    (
      ?auto_4481 - HOIST
      ?auto_4480 - PLACE
      ?auto_4475 - SURFACE
      ?auto_4483 - PLACE
      ?auto_4478 - HOIST
      ?auto_4479 - SURFACE
      ?auto_4482 - PLACE
      ?auto_4476 - HOIST
      ?auto_4473 - SURFACE
      ?auto_4477 - SURFACE
      ?auto_4474 - TRUCK
      ?auto_4484 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4481 ?auto_4480 ) ( IS-CRATE ?auto_4472 ) ( not ( = ?auto_4471 ?auto_4472 ) ) ( not ( = ?auto_4475 ?auto_4471 ) ) ( not ( = ?auto_4475 ?auto_4472 ) ) ( not ( = ?auto_4483 ?auto_4480 ) ) ( HOIST-AT ?auto_4478 ?auto_4483 ) ( not ( = ?auto_4481 ?auto_4478 ) ) ( AVAILABLE ?auto_4478 ) ( SURFACE-AT ?auto_4472 ?auto_4483 ) ( ON ?auto_4472 ?auto_4479 ) ( CLEAR ?auto_4472 ) ( not ( = ?auto_4471 ?auto_4479 ) ) ( not ( = ?auto_4472 ?auto_4479 ) ) ( not ( = ?auto_4475 ?auto_4479 ) ) ( IS-CRATE ?auto_4471 ) ( not ( = ?auto_4482 ?auto_4480 ) ) ( not ( = ?auto_4483 ?auto_4482 ) ) ( HOIST-AT ?auto_4476 ?auto_4482 ) ( not ( = ?auto_4481 ?auto_4476 ) ) ( not ( = ?auto_4478 ?auto_4476 ) ) ( SURFACE-AT ?auto_4471 ?auto_4482 ) ( ON ?auto_4471 ?auto_4473 ) ( CLEAR ?auto_4471 ) ( not ( = ?auto_4471 ?auto_4473 ) ) ( not ( = ?auto_4472 ?auto_4473 ) ) ( not ( = ?auto_4475 ?auto_4473 ) ) ( not ( = ?auto_4479 ?auto_4473 ) ) ( SURFACE-AT ?auto_4477 ?auto_4480 ) ( CLEAR ?auto_4477 ) ( IS-CRATE ?auto_4475 ) ( not ( = ?auto_4477 ?auto_4475 ) ) ( not ( = ?auto_4471 ?auto_4477 ) ) ( not ( = ?auto_4472 ?auto_4477 ) ) ( not ( = ?auto_4479 ?auto_4477 ) ) ( not ( = ?auto_4473 ?auto_4477 ) ) ( AVAILABLE ?auto_4481 ) ( TRUCK-AT ?auto_4474 ?auto_4482 ) ( AVAILABLE ?auto_4476 ) ( SURFACE-AT ?auto_4475 ?auto_4482 ) ( ON ?auto_4475 ?auto_4484 ) ( CLEAR ?auto_4475 ) ( not ( = ?auto_4471 ?auto_4484 ) ) ( not ( = ?auto_4472 ?auto_4484 ) ) ( not ( = ?auto_4475 ?auto_4484 ) ) ( not ( = ?auto_4479 ?auto_4484 ) ) ( not ( = ?auto_4473 ?auto_4484 ) ) ( not ( = ?auto_4477 ?auto_4484 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4476 ?auto_4475 ?auto_4484 ?auto_4482 )
      ( MAKE-2CRATE ?auto_4475 ?auto_4471 ?auto_4472 )
      ( MAKE-1CRATE-VERIFY ?auto_4471 ?auto_4472 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4485 - SURFACE
      ?auto_4486 - SURFACE
      ?auto_4487 - SURFACE
    )
    :vars
    (
      ?auto_4493 - HOIST
      ?auto_4496 - PLACE
      ?auto_4491 - PLACE
      ?auto_4498 - HOIST
      ?auto_4497 - SURFACE
      ?auto_4492 - PLACE
      ?auto_4495 - HOIST
      ?auto_4488 - SURFACE
      ?auto_4494 - SURFACE
      ?auto_4489 - TRUCK
      ?auto_4490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4493 ?auto_4496 ) ( IS-CRATE ?auto_4487 ) ( not ( = ?auto_4486 ?auto_4487 ) ) ( not ( = ?auto_4485 ?auto_4486 ) ) ( not ( = ?auto_4485 ?auto_4487 ) ) ( not ( = ?auto_4491 ?auto_4496 ) ) ( HOIST-AT ?auto_4498 ?auto_4491 ) ( not ( = ?auto_4493 ?auto_4498 ) ) ( AVAILABLE ?auto_4498 ) ( SURFACE-AT ?auto_4487 ?auto_4491 ) ( ON ?auto_4487 ?auto_4497 ) ( CLEAR ?auto_4487 ) ( not ( = ?auto_4486 ?auto_4497 ) ) ( not ( = ?auto_4487 ?auto_4497 ) ) ( not ( = ?auto_4485 ?auto_4497 ) ) ( IS-CRATE ?auto_4486 ) ( not ( = ?auto_4492 ?auto_4496 ) ) ( not ( = ?auto_4491 ?auto_4492 ) ) ( HOIST-AT ?auto_4495 ?auto_4492 ) ( not ( = ?auto_4493 ?auto_4495 ) ) ( not ( = ?auto_4498 ?auto_4495 ) ) ( SURFACE-AT ?auto_4486 ?auto_4492 ) ( ON ?auto_4486 ?auto_4488 ) ( CLEAR ?auto_4486 ) ( not ( = ?auto_4486 ?auto_4488 ) ) ( not ( = ?auto_4487 ?auto_4488 ) ) ( not ( = ?auto_4485 ?auto_4488 ) ) ( not ( = ?auto_4497 ?auto_4488 ) ) ( SURFACE-AT ?auto_4494 ?auto_4496 ) ( CLEAR ?auto_4494 ) ( IS-CRATE ?auto_4485 ) ( not ( = ?auto_4494 ?auto_4485 ) ) ( not ( = ?auto_4486 ?auto_4494 ) ) ( not ( = ?auto_4487 ?auto_4494 ) ) ( not ( = ?auto_4497 ?auto_4494 ) ) ( not ( = ?auto_4488 ?auto_4494 ) ) ( AVAILABLE ?auto_4493 ) ( TRUCK-AT ?auto_4489 ?auto_4492 ) ( AVAILABLE ?auto_4495 ) ( SURFACE-AT ?auto_4485 ?auto_4492 ) ( ON ?auto_4485 ?auto_4490 ) ( CLEAR ?auto_4485 ) ( not ( = ?auto_4486 ?auto_4490 ) ) ( not ( = ?auto_4487 ?auto_4490 ) ) ( not ( = ?auto_4485 ?auto_4490 ) ) ( not ( = ?auto_4497 ?auto_4490 ) ) ( not ( = ?auto_4488 ?auto_4490 ) ) ( not ( = ?auto_4494 ?auto_4490 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4486 ?auto_4487 )
      ( MAKE-2CRATE-VERIFY ?auto_4485 ?auto_4486 ?auto_4487 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4499 - SURFACE
      ?auto_4500 - SURFACE
      ?auto_4501 - SURFACE
      ?auto_4502 - SURFACE
    )
    :vars
    (
      ?auto_4508 - HOIST
      ?auto_4503 - PLACE
      ?auto_4507 - PLACE
      ?auto_4509 - HOIST
      ?auto_4512 - SURFACE
      ?auto_4504 - PLACE
      ?auto_4511 - HOIST
      ?auto_4510 - SURFACE
      ?auto_4505 - TRUCK
      ?auto_4506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4508 ?auto_4503 ) ( IS-CRATE ?auto_4502 ) ( not ( = ?auto_4501 ?auto_4502 ) ) ( not ( = ?auto_4500 ?auto_4501 ) ) ( not ( = ?auto_4500 ?auto_4502 ) ) ( not ( = ?auto_4507 ?auto_4503 ) ) ( HOIST-AT ?auto_4509 ?auto_4507 ) ( not ( = ?auto_4508 ?auto_4509 ) ) ( AVAILABLE ?auto_4509 ) ( SURFACE-AT ?auto_4502 ?auto_4507 ) ( ON ?auto_4502 ?auto_4512 ) ( CLEAR ?auto_4502 ) ( not ( = ?auto_4501 ?auto_4512 ) ) ( not ( = ?auto_4502 ?auto_4512 ) ) ( not ( = ?auto_4500 ?auto_4512 ) ) ( IS-CRATE ?auto_4501 ) ( not ( = ?auto_4504 ?auto_4503 ) ) ( not ( = ?auto_4507 ?auto_4504 ) ) ( HOIST-AT ?auto_4511 ?auto_4504 ) ( not ( = ?auto_4508 ?auto_4511 ) ) ( not ( = ?auto_4509 ?auto_4511 ) ) ( SURFACE-AT ?auto_4501 ?auto_4504 ) ( ON ?auto_4501 ?auto_4510 ) ( CLEAR ?auto_4501 ) ( not ( = ?auto_4501 ?auto_4510 ) ) ( not ( = ?auto_4502 ?auto_4510 ) ) ( not ( = ?auto_4500 ?auto_4510 ) ) ( not ( = ?auto_4512 ?auto_4510 ) ) ( SURFACE-AT ?auto_4499 ?auto_4503 ) ( CLEAR ?auto_4499 ) ( IS-CRATE ?auto_4500 ) ( not ( = ?auto_4499 ?auto_4500 ) ) ( not ( = ?auto_4501 ?auto_4499 ) ) ( not ( = ?auto_4502 ?auto_4499 ) ) ( not ( = ?auto_4512 ?auto_4499 ) ) ( not ( = ?auto_4510 ?auto_4499 ) ) ( AVAILABLE ?auto_4508 ) ( TRUCK-AT ?auto_4505 ?auto_4504 ) ( AVAILABLE ?auto_4511 ) ( SURFACE-AT ?auto_4500 ?auto_4504 ) ( ON ?auto_4500 ?auto_4506 ) ( CLEAR ?auto_4500 ) ( not ( = ?auto_4501 ?auto_4506 ) ) ( not ( = ?auto_4502 ?auto_4506 ) ) ( not ( = ?auto_4500 ?auto_4506 ) ) ( not ( = ?auto_4512 ?auto_4506 ) ) ( not ( = ?auto_4510 ?auto_4506 ) ) ( not ( = ?auto_4499 ?auto_4506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4500 ?auto_4501 ?auto_4502 )
      ( MAKE-3CRATE-VERIFY ?auto_4499 ?auto_4500 ?auto_4501 ?auto_4502 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4513 - SURFACE
      ?auto_4514 - SURFACE
    )
    :vars
    (
      ?auto_4520 - HOIST
      ?auto_4515 - PLACE
      ?auto_4526 - SURFACE
      ?auto_4519 - PLACE
      ?auto_4521 - HOIST
      ?auto_4524 - SURFACE
      ?auto_4516 - PLACE
      ?auto_4523 - HOIST
      ?auto_4522 - SURFACE
      ?auto_4525 - SURFACE
      ?auto_4518 - SURFACE
      ?auto_4517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4520 ?auto_4515 ) ( IS-CRATE ?auto_4514 ) ( not ( = ?auto_4513 ?auto_4514 ) ) ( not ( = ?auto_4526 ?auto_4513 ) ) ( not ( = ?auto_4526 ?auto_4514 ) ) ( not ( = ?auto_4519 ?auto_4515 ) ) ( HOIST-AT ?auto_4521 ?auto_4519 ) ( not ( = ?auto_4520 ?auto_4521 ) ) ( AVAILABLE ?auto_4521 ) ( SURFACE-AT ?auto_4514 ?auto_4519 ) ( ON ?auto_4514 ?auto_4524 ) ( CLEAR ?auto_4514 ) ( not ( = ?auto_4513 ?auto_4524 ) ) ( not ( = ?auto_4514 ?auto_4524 ) ) ( not ( = ?auto_4526 ?auto_4524 ) ) ( IS-CRATE ?auto_4513 ) ( not ( = ?auto_4516 ?auto_4515 ) ) ( not ( = ?auto_4519 ?auto_4516 ) ) ( HOIST-AT ?auto_4523 ?auto_4516 ) ( not ( = ?auto_4520 ?auto_4523 ) ) ( not ( = ?auto_4521 ?auto_4523 ) ) ( SURFACE-AT ?auto_4513 ?auto_4516 ) ( ON ?auto_4513 ?auto_4522 ) ( CLEAR ?auto_4513 ) ( not ( = ?auto_4513 ?auto_4522 ) ) ( not ( = ?auto_4514 ?auto_4522 ) ) ( not ( = ?auto_4526 ?auto_4522 ) ) ( not ( = ?auto_4524 ?auto_4522 ) ) ( SURFACE-AT ?auto_4525 ?auto_4515 ) ( CLEAR ?auto_4525 ) ( IS-CRATE ?auto_4526 ) ( not ( = ?auto_4525 ?auto_4526 ) ) ( not ( = ?auto_4513 ?auto_4525 ) ) ( not ( = ?auto_4514 ?auto_4525 ) ) ( not ( = ?auto_4524 ?auto_4525 ) ) ( not ( = ?auto_4522 ?auto_4525 ) ) ( AVAILABLE ?auto_4520 ) ( AVAILABLE ?auto_4523 ) ( SURFACE-AT ?auto_4526 ?auto_4516 ) ( ON ?auto_4526 ?auto_4518 ) ( CLEAR ?auto_4526 ) ( not ( = ?auto_4513 ?auto_4518 ) ) ( not ( = ?auto_4514 ?auto_4518 ) ) ( not ( = ?auto_4526 ?auto_4518 ) ) ( not ( = ?auto_4524 ?auto_4518 ) ) ( not ( = ?auto_4522 ?auto_4518 ) ) ( not ( = ?auto_4525 ?auto_4518 ) ) ( TRUCK-AT ?auto_4517 ?auto_4515 ) )
    :subtasks
    ( ( !DRIVE ?auto_4517 ?auto_4515 ?auto_4516 )
      ( MAKE-2CRATE ?auto_4526 ?auto_4513 ?auto_4514 )
      ( MAKE-1CRATE-VERIFY ?auto_4513 ?auto_4514 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4527 - SURFACE
      ?auto_4528 - SURFACE
      ?auto_4529 - SURFACE
    )
    :vars
    (
      ?auto_4536 - HOIST
      ?auto_4540 - PLACE
      ?auto_4535 - PLACE
      ?auto_4530 - HOIST
      ?auto_4533 - SURFACE
      ?auto_4532 - PLACE
      ?auto_4534 - HOIST
      ?auto_4537 - SURFACE
      ?auto_4539 - SURFACE
      ?auto_4531 - SURFACE
      ?auto_4538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4536 ?auto_4540 ) ( IS-CRATE ?auto_4529 ) ( not ( = ?auto_4528 ?auto_4529 ) ) ( not ( = ?auto_4527 ?auto_4528 ) ) ( not ( = ?auto_4527 ?auto_4529 ) ) ( not ( = ?auto_4535 ?auto_4540 ) ) ( HOIST-AT ?auto_4530 ?auto_4535 ) ( not ( = ?auto_4536 ?auto_4530 ) ) ( AVAILABLE ?auto_4530 ) ( SURFACE-AT ?auto_4529 ?auto_4535 ) ( ON ?auto_4529 ?auto_4533 ) ( CLEAR ?auto_4529 ) ( not ( = ?auto_4528 ?auto_4533 ) ) ( not ( = ?auto_4529 ?auto_4533 ) ) ( not ( = ?auto_4527 ?auto_4533 ) ) ( IS-CRATE ?auto_4528 ) ( not ( = ?auto_4532 ?auto_4540 ) ) ( not ( = ?auto_4535 ?auto_4532 ) ) ( HOIST-AT ?auto_4534 ?auto_4532 ) ( not ( = ?auto_4536 ?auto_4534 ) ) ( not ( = ?auto_4530 ?auto_4534 ) ) ( SURFACE-AT ?auto_4528 ?auto_4532 ) ( ON ?auto_4528 ?auto_4537 ) ( CLEAR ?auto_4528 ) ( not ( = ?auto_4528 ?auto_4537 ) ) ( not ( = ?auto_4529 ?auto_4537 ) ) ( not ( = ?auto_4527 ?auto_4537 ) ) ( not ( = ?auto_4533 ?auto_4537 ) ) ( SURFACE-AT ?auto_4539 ?auto_4540 ) ( CLEAR ?auto_4539 ) ( IS-CRATE ?auto_4527 ) ( not ( = ?auto_4539 ?auto_4527 ) ) ( not ( = ?auto_4528 ?auto_4539 ) ) ( not ( = ?auto_4529 ?auto_4539 ) ) ( not ( = ?auto_4533 ?auto_4539 ) ) ( not ( = ?auto_4537 ?auto_4539 ) ) ( AVAILABLE ?auto_4536 ) ( AVAILABLE ?auto_4534 ) ( SURFACE-AT ?auto_4527 ?auto_4532 ) ( ON ?auto_4527 ?auto_4531 ) ( CLEAR ?auto_4527 ) ( not ( = ?auto_4528 ?auto_4531 ) ) ( not ( = ?auto_4529 ?auto_4531 ) ) ( not ( = ?auto_4527 ?auto_4531 ) ) ( not ( = ?auto_4533 ?auto_4531 ) ) ( not ( = ?auto_4537 ?auto_4531 ) ) ( not ( = ?auto_4539 ?auto_4531 ) ) ( TRUCK-AT ?auto_4538 ?auto_4540 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4528 ?auto_4529 )
      ( MAKE-2CRATE-VERIFY ?auto_4527 ?auto_4528 ?auto_4529 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4541 - SURFACE
      ?auto_4542 - SURFACE
      ?auto_4543 - SURFACE
      ?auto_4544 - SURFACE
    )
    :vars
    (
      ?auto_4552 - HOIST
      ?auto_4549 - PLACE
      ?auto_4547 - PLACE
      ?auto_4554 - HOIST
      ?auto_4548 - SURFACE
      ?auto_4546 - PLACE
      ?auto_4550 - HOIST
      ?auto_4545 - SURFACE
      ?auto_4553 - SURFACE
      ?auto_4551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4552 ?auto_4549 ) ( IS-CRATE ?auto_4544 ) ( not ( = ?auto_4543 ?auto_4544 ) ) ( not ( = ?auto_4542 ?auto_4543 ) ) ( not ( = ?auto_4542 ?auto_4544 ) ) ( not ( = ?auto_4547 ?auto_4549 ) ) ( HOIST-AT ?auto_4554 ?auto_4547 ) ( not ( = ?auto_4552 ?auto_4554 ) ) ( AVAILABLE ?auto_4554 ) ( SURFACE-AT ?auto_4544 ?auto_4547 ) ( ON ?auto_4544 ?auto_4548 ) ( CLEAR ?auto_4544 ) ( not ( = ?auto_4543 ?auto_4548 ) ) ( not ( = ?auto_4544 ?auto_4548 ) ) ( not ( = ?auto_4542 ?auto_4548 ) ) ( IS-CRATE ?auto_4543 ) ( not ( = ?auto_4546 ?auto_4549 ) ) ( not ( = ?auto_4547 ?auto_4546 ) ) ( HOIST-AT ?auto_4550 ?auto_4546 ) ( not ( = ?auto_4552 ?auto_4550 ) ) ( not ( = ?auto_4554 ?auto_4550 ) ) ( SURFACE-AT ?auto_4543 ?auto_4546 ) ( ON ?auto_4543 ?auto_4545 ) ( CLEAR ?auto_4543 ) ( not ( = ?auto_4543 ?auto_4545 ) ) ( not ( = ?auto_4544 ?auto_4545 ) ) ( not ( = ?auto_4542 ?auto_4545 ) ) ( not ( = ?auto_4548 ?auto_4545 ) ) ( SURFACE-AT ?auto_4541 ?auto_4549 ) ( CLEAR ?auto_4541 ) ( IS-CRATE ?auto_4542 ) ( not ( = ?auto_4541 ?auto_4542 ) ) ( not ( = ?auto_4543 ?auto_4541 ) ) ( not ( = ?auto_4544 ?auto_4541 ) ) ( not ( = ?auto_4548 ?auto_4541 ) ) ( not ( = ?auto_4545 ?auto_4541 ) ) ( AVAILABLE ?auto_4552 ) ( AVAILABLE ?auto_4550 ) ( SURFACE-AT ?auto_4542 ?auto_4546 ) ( ON ?auto_4542 ?auto_4553 ) ( CLEAR ?auto_4542 ) ( not ( = ?auto_4543 ?auto_4553 ) ) ( not ( = ?auto_4544 ?auto_4553 ) ) ( not ( = ?auto_4542 ?auto_4553 ) ) ( not ( = ?auto_4548 ?auto_4553 ) ) ( not ( = ?auto_4545 ?auto_4553 ) ) ( not ( = ?auto_4541 ?auto_4553 ) ) ( TRUCK-AT ?auto_4551 ?auto_4549 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4542 ?auto_4543 ?auto_4544 )
      ( MAKE-3CRATE-VERIFY ?auto_4541 ?auto_4542 ?auto_4543 ?auto_4544 ) )
  )

)

