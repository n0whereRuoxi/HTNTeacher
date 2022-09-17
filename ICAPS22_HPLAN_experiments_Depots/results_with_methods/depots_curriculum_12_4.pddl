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
      ?auto_3732 - SURFACE
      ?auto_3733 - SURFACE
    )
    :vars
    (
      ?auto_3734 - HOIST
      ?auto_3735 - PLACE
      ?auto_3737 - PLACE
      ?auto_3738 - HOIST
      ?auto_3739 - SURFACE
      ?auto_3736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3734 ?auto_3735 ) ( SURFACE-AT ?auto_3733 ?auto_3735 ) ( CLEAR ?auto_3733 ) ( IS-CRATE ?auto_3732 ) ( AVAILABLE ?auto_3734 ) ( not ( = ?auto_3737 ?auto_3735 ) ) ( HOIST-AT ?auto_3738 ?auto_3737 ) ( AVAILABLE ?auto_3738 ) ( SURFACE-AT ?auto_3732 ?auto_3737 ) ( ON ?auto_3732 ?auto_3739 ) ( CLEAR ?auto_3732 ) ( TRUCK-AT ?auto_3736 ?auto_3735 ) ( not ( = ?auto_3732 ?auto_3733 ) ) ( not ( = ?auto_3732 ?auto_3739 ) ) ( not ( = ?auto_3733 ?auto_3739 ) ) ( not ( = ?auto_3734 ?auto_3738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3736 ?auto_3735 ?auto_3737 )
      ( !LIFT ?auto_3738 ?auto_3732 ?auto_3739 ?auto_3737 )
      ( !LOAD ?auto_3738 ?auto_3732 ?auto_3736 ?auto_3737 )
      ( !DRIVE ?auto_3736 ?auto_3737 ?auto_3735 )
      ( !UNLOAD ?auto_3734 ?auto_3732 ?auto_3736 ?auto_3735 )
      ( !DROP ?auto_3734 ?auto_3732 ?auto_3733 ?auto_3735 )
      ( MAKE-ON-VERIFY ?auto_3732 ?auto_3733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3742 - SURFACE
      ?auto_3743 - SURFACE
    )
    :vars
    (
      ?auto_3744 - HOIST
      ?auto_3745 - PLACE
      ?auto_3747 - PLACE
      ?auto_3748 - HOIST
      ?auto_3749 - SURFACE
      ?auto_3746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3744 ?auto_3745 ) ( SURFACE-AT ?auto_3743 ?auto_3745 ) ( CLEAR ?auto_3743 ) ( IS-CRATE ?auto_3742 ) ( AVAILABLE ?auto_3744 ) ( not ( = ?auto_3747 ?auto_3745 ) ) ( HOIST-AT ?auto_3748 ?auto_3747 ) ( AVAILABLE ?auto_3748 ) ( SURFACE-AT ?auto_3742 ?auto_3747 ) ( ON ?auto_3742 ?auto_3749 ) ( CLEAR ?auto_3742 ) ( TRUCK-AT ?auto_3746 ?auto_3745 ) ( not ( = ?auto_3742 ?auto_3743 ) ) ( not ( = ?auto_3742 ?auto_3749 ) ) ( not ( = ?auto_3743 ?auto_3749 ) ) ( not ( = ?auto_3744 ?auto_3748 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3746 ?auto_3745 ?auto_3747 )
      ( !LIFT ?auto_3748 ?auto_3742 ?auto_3749 ?auto_3747 )
      ( !LOAD ?auto_3748 ?auto_3742 ?auto_3746 ?auto_3747 )
      ( !DRIVE ?auto_3746 ?auto_3747 ?auto_3745 )
      ( !UNLOAD ?auto_3744 ?auto_3742 ?auto_3746 ?auto_3745 )
      ( !DROP ?auto_3744 ?auto_3742 ?auto_3743 ?auto_3745 )
      ( MAKE-ON-VERIFY ?auto_3742 ?auto_3743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3752 - SURFACE
      ?auto_3753 - SURFACE
    )
    :vars
    (
      ?auto_3754 - HOIST
      ?auto_3755 - PLACE
      ?auto_3757 - PLACE
      ?auto_3758 - HOIST
      ?auto_3759 - SURFACE
      ?auto_3756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3754 ?auto_3755 ) ( SURFACE-AT ?auto_3753 ?auto_3755 ) ( CLEAR ?auto_3753 ) ( IS-CRATE ?auto_3752 ) ( AVAILABLE ?auto_3754 ) ( not ( = ?auto_3757 ?auto_3755 ) ) ( HOIST-AT ?auto_3758 ?auto_3757 ) ( AVAILABLE ?auto_3758 ) ( SURFACE-AT ?auto_3752 ?auto_3757 ) ( ON ?auto_3752 ?auto_3759 ) ( CLEAR ?auto_3752 ) ( TRUCK-AT ?auto_3756 ?auto_3755 ) ( not ( = ?auto_3752 ?auto_3753 ) ) ( not ( = ?auto_3752 ?auto_3759 ) ) ( not ( = ?auto_3753 ?auto_3759 ) ) ( not ( = ?auto_3754 ?auto_3758 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3756 ?auto_3755 ?auto_3757 )
      ( !LIFT ?auto_3758 ?auto_3752 ?auto_3759 ?auto_3757 )
      ( !LOAD ?auto_3758 ?auto_3752 ?auto_3756 ?auto_3757 )
      ( !DRIVE ?auto_3756 ?auto_3757 ?auto_3755 )
      ( !UNLOAD ?auto_3754 ?auto_3752 ?auto_3756 ?auto_3755 )
      ( !DROP ?auto_3754 ?auto_3752 ?auto_3753 ?auto_3755 )
      ( MAKE-ON-VERIFY ?auto_3752 ?auto_3753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3762 - SURFACE
      ?auto_3763 - SURFACE
    )
    :vars
    (
      ?auto_3764 - HOIST
      ?auto_3765 - PLACE
      ?auto_3767 - PLACE
      ?auto_3768 - HOIST
      ?auto_3769 - SURFACE
      ?auto_3766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3764 ?auto_3765 ) ( SURFACE-AT ?auto_3763 ?auto_3765 ) ( CLEAR ?auto_3763 ) ( IS-CRATE ?auto_3762 ) ( AVAILABLE ?auto_3764 ) ( not ( = ?auto_3767 ?auto_3765 ) ) ( HOIST-AT ?auto_3768 ?auto_3767 ) ( AVAILABLE ?auto_3768 ) ( SURFACE-AT ?auto_3762 ?auto_3767 ) ( ON ?auto_3762 ?auto_3769 ) ( CLEAR ?auto_3762 ) ( TRUCK-AT ?auto_3766 ?auto_3765 ) ( not ( = ?auto_3762 ?auto_3763 ) ) ( not ( = ?auto_3762 ?auto_3769 ) ) ( not ( = ?auto_3763 ?auto_3769 ) ) ( not ( = ?auto_3764 ?auto_3768 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3766 ?auto_3765 ?auto_3767 )
      ( !LIFT ?auto_3768 ?auto_3762 ?auto_3769 ?auto_3767 )
      ( !LOAD ?auto_3768 ?auto_3762 ?auto_3766 ?auto_3767 )
      ( !DRIVE ?auto_3766 ?auto_3767 ?auto_3765 )
      ( !UNLOAD ?auto_3764 ?auto_3762 ?auto_3766 ?auto_3765 )
      ( !DROP ?auto_3764 ?auto_3762 ?auto_3763 ?auto_3765 )
      ( MAKE-ON-VERIFY ?auto_3762 ?auto_3763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3772 - SURFACE
      ?auto_3773 - SURFACE
    )
    :vars
    (
      ?auto_3774 - HOIST
      ?auto_3775 - PLACE
      ?auto_3777 - PLACE
      ?auto_3778 - HOIST
      ?auto_3779 - SURFACE
      ?auto_3776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3774 ?auto_3775 ) ( SURFACE-AT ?auto_3773 ?auto_3775 ) ( CLEAR ?auto_3773 ) ( IS-CRATE ?auto_3772 ) ( AVAILABLE ?auto_3774 ) ( not ( = ?auto_3777 ?auto_3775 ) ) ( HOIST-AT ?auto_3778 ?auto_3777 ) ( AVAILABLE ?auto_3778 ) ( SURFACE-AT ?auto_3772 ?auto_3777 ) ( ON ?auto_3772 ?auto_3779 ) ( CLEAR ?auto_3772 ) ( TRUCK-AT ?auto_3776 ?auto_3775 ) ( not ( = ?auto_3772 ?auto_3773 ) ) ( not ( = ?auto_3772 ?auto_3779 ) ) ( not ( = ?auto_3773 ?auto_3779 ) ) ( not ( = ?auto_3774 ?auto_3778 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3776 ?auto_3775 ?auto_3777 )
      ( !LIFT ?auto_3778 ?auto_3772 ?auto_3779 ?auto_3777 )
      ( !LOAD ?auto_3778 ?auto_3772 ?auto_3776 ?auto_3777 )
      ( !DRIVE ?auto_3776 ?auto_3777 ?auto_3775 )
      ( !UNLOAD ?auto_3774 ?auto_3772 ?auto_3776 ?auto_3775 )
      ( !DROP ?auto_3774 ?auto_3772 ?auto_3773 ?auto_3775 )
      ( MAKE-ON-VERIFY ?auto_3772 ?auto_3773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3782 - SURFACE
      ?auto_3783 - SURFACE
    )
    :vars
    (
      ?auto_3784 - HOIST
      ?auto_3785 - PLACE
      ?auto_3787 - PLACE
      ?auto_3788 - HOIST
      ?auto_3789 - SURFACE
      ?auto_3786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3784 ?auto_3785 ) ( SURFACE-AT ?auto_3783 ?auto_3785 ) ( CLEAR ?auto_3783 ) ( IS-CRATE ?auto_3782 ) ( AVAILABLE ?auto_3784 ) ( not ( = ?auto_3787 ?auto_3785 ) ) ( HOIST-AT ?auto_3788 ?auto_3787 ) ( AVAILABLE ?auto_3788 ) ( SURFACE-AT ?auto_3782 ?auto_3787 ) ( ON ?auto_3782 ?auto_3789 ) ( CLEAR ?auto_3782 ) ( TRUCK-AT ?auto_3786 ?auto_3785 ) ( not ( = ?auto_3782 ?auto_3783 ) ) ( not ( = ?auto_3782 ?auto_3789 ) ) ( not ( = ?auto_3783 ?auto_3789 ) ) ( not ( = ?auto_3784 ?auto_3788 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3786 ?auto_3785 ?auto_3787 )
      ( !LIFT ?auto_3788 ?auto_3782 ?auto_3789 ?auto_3787 )
      ( !LOAD ?auto_3788 ?auto_3782 ?auto_3786 ?auto_3787 )
      ( !DRIVE ?auto_3786 ?auto_3787 ?auto_3785 )
      ( !UNLOAD ?auto_3784 ?auto_3782 ?auto_3786 ?auto_3785 )
      ( !DROP ?auto_3784 ?auto_3782 ?auto_3783 ?auto_3785 )
      ( MAKE-ON-VERIFY ?auto_3782 ?auto_3783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3792 - SURFACE
      ?auto_3793 - SURFACE
    )
    :vars
    (
      ?auto_3794 - HOIST
      ?auto_3795 - PLACE
      ?auto_3797 - PLACE
      ?auto_3798 - HOIST
      ?auto_3799 - SURFACE
      ?auto_3796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3794 ?auto_3795 ) ( SURFACE-AT ?auto_3793 ?auto_3795 ) ( CLEAR ?auto_3793 ) ( IS-CRATE ?auto_3792 ) ( AVAILABLE ?auto_3794 ) ( not ( = ?auto_3797 ?auto_3795 ) ) ( HOIST-AT ?auto_3798 ?auto_3797 ) ( AVAILABLE ?auto_3798 ) ( SURFACE-AT ?auto_3792 ?auto_3797 ) ( ON ?auto_3792 ?auto_3799 ) ( CLEAR ?auto_3792 ) ( TRUCK-AT ?auto_3796 ?auto_3795 ) ( not ( = ?auto_3792 ?auto_3793 ) ) ( not ( = ?auto_3792 ?auto_3799 ) ) ( not ( = ?auto_3793 ?auto_3799 ) ) ( not ( = ?auto_3794 ?auto_3798 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3796 ?auto_3795 ?auto_3797 )
      ( !LIFT ?auto_3798 ?auto_3792 ?auto_3799 ?auto_3797 )
      ( !LOAD ?auto_3798 ?auto_3792 ?auto_3796 ?auto_3797 )
      ( !DRIVE ?auto_3796 ?auto_3797 ?auto_3795 )
      ( !UNLOAD ?auto_3794 ?auto_3792 ?auto_3796 ?auto_3795 )
      ( !DROP ?auto_3794 ?auto_3792 ?auto_3793 ?auto_3795 )
      ( MAKE-ON-VERIFY ?auto_3792 ?auto_3793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3802 - SURFACE
      ?auto_3803 - SURFACE
    )
    :vars
    (
      ?auto_3804 - HOIST
      ?auto_3805 - PLACE
      ?auto_3807 - PLACE
      ?auto_3808 - HOIST
      ?auto_3809 - SURFACE
      ?auto_3806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3804 ?auto_3805 ) ( SURFACE-AT ?auto_3803 ?auto_3805 ) ( CLEAR ?auto_3803 ) ( IS-CRATE ?auto_3802 ) ( AVAILABLE ?auto_3804 ) ( not ( = ?auto_3807 ?auto_3805 ) ) ( HOIST-AT ?auto_3808 ?auto_3807 ) ( AVAILABLE ?auto_3808 ) ( SURFACE-AT ?auto_3802 ?auto_3807 ) ( ON ?auto_3802 ?auto_3809 ) ( CLEAR ?auto_3802 ) ( TRUCK-AT ?auto_3806 ?auto_3805 ) ( not ( = ?auto_3802 ?auto_3803 ) ) ( not ( = ?auto_3802 ?auto_3809 ) ) ( not ( = ?auto_3803 ?auto_3809 ) ) ( not ( = ?auto_3804 ?auto_3808 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3806 ?auto_3805 ?auto_3807 )
      ( !LIFT ?auto_3808 ?auto_3802 ?auto_3809 ?auto_3807 )
      ( !LOAD ?auto_3808 ?auto_3802 ?auto_3806 ?auto_3807 )
      ( !DRIVE ?auto_3806 ?auto_3807 ?auto_3805 )
      ( !UNLOAD ?auto_3804 ?auto_3802 ?auto_3806 ?auto_3805 )
      ( !DROP ?auto_3804 ?auto_3802 ?auto_3803 ?auto_3805 )
      ( MAKE-ON-VERIFY ?auto_3802 ?auto_3803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3812 - SURFACE
      ?auto_3813 - SURFACE
    )
    :vars
    (
      ?auto_3814 - HOIST
      ?auto_3815 - PLACE
      ?auto_3817 - PLACE
      ?auto_3818 - HOIST
      ?auto_3819 - SURFACE
      ?auto_3816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3814 ?auto_3815 ) ( SURFACE-AT ?auto_3813 ?auto_3815 ) ( CLEAR ?auto_3813 ) ( IS-CRATE ?auto_3812 ) ( AVAILABLE ?auto_3814 ) ( not ( = ?auto_3817 ?auto_3815 ) ) ( HOIST-AT ?auto_3818 ?auto_3817 ) ( AVAILABLE ?auto_3818 ) ( SURFACE-AT ?auto_3812 ?auto_3817 ) ( ON ?auto_3812 ?auto_3819 ) ( CLEAR ?auto_3812 ) ( TRUCK-AT ?auto_3816 ?auto_3815 ) ( not ( = ?auto_3812 ?auto_3813 ) ) ( not ( = ?auto_3812 ?auto_3819 ) ) ( not ( = ?auto_3813 ?auto_3819 ) ) ( not ( = ?auto_3814 ?auto_3818 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3816 ?auto_3815 ?auto_3817 )
      ( !LIFT ?auto_3818 ?auto_3812 ?auto_3819 ?auto_3817 )
      ( !LOAD ?auto_3818 ?auto_3812 ?auto_3816 ?auto_3817 )
      ( !DRIVE ?auto_3816 ?auto_3817 ?auto_3815 )
      ( !UNLOAD ?auto_3814 ?auto_3812 ?auto_3816 ?auto_3815 )
      ( !DROP ?auto_3814 ?auto_3812 ?auto_3813 ?auto_3815 )
      ( MAKE-ON-VERIFY ?auto_3812 ?auto_3813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3822 - SURFACE
      ?auto_3823 - SURFACE
    )
    :vars
    (
      ?auto_3824 - HOIST
      ?auto_3825 - PLACE
      ?auto_3827 - PLACE
      ?auto_3828 - HOIST
      ?auto_3829 - SURFACE
      ?auto_3826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3824 ?auto_3825 ) ( SURFACE-AT ?auto_3823 ?auto_3825 ) ( CLEAR ?auto_3823 ) ( IS-CRATE ?auto_3822 ) ( AVAILABLE ?auto_3824 ) ( not ( = ?auto_3827 ?auto_3825 ) ) ( HOIST-AT ?auto_3828 ?auto_3827 ) ( AVAILABLE ?auto_3828 ) ( SURFACE-AT ?auto_3822 ?auto_3827 ) ( ON ?auto_3822 ?auto_3829 ) ( CLEAR ?auto_3822 ) ( TRUCK-AT ?auto_3826 ?auto_3825 ) ( not ( = ?auto_3822 ?auto_3823 ) ) ( not ( = ?auto_3822 ?auto_3829 ) ) ( not ( = ?auto_3823 ?auto_3829 ) ) ( not ( = ?auto_3824 ?auto_3828 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3826 ?auto_3825 ?auto_3827 )
      ( !LIFT ?auto_3828 ?auto_3822 ?auto_3829 ?auto_3827 )
      ( !LOAD ?auto_3828 ?auto_3822 ?auto_3826 ?auto_3827 )
      ( !DRIVE ?auto_3826 ?auto_3827 ?auto_3825 )
      ( !UNLOAD ?auto_3824 ?auto_3822 ?auto_3826 ?auto_3825 )
      ( !DROP ?auto_3824 ?auto_3822 ?auto_3823 ?auto_3825 )
      ( MAKE-ON-VERIFY ?auto_3822 ?auto_3823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3832 - SURFACE
      ?auto_3833 - SURFACE
    )
    :vars
    (
      ?auto_3834 - HOIST
      ?auto_3835 - PLACE
      ?auto_3837 - PLACE
      ?auto_3838 - HOIST
      ?auto_3839 - SURFACE
      ?auto_3836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3834 ?auto_3835 ) ( SURFACE-AT ?auto_3833 ?auto_3835 ) ( CLEAR ?auto_3833 ) ( IS-CRATE ?auto_3832 ) ( AVAILABLE ?auto_3834 ) ( not ( = ?auto_3837 ?auto_3835 ) ) ( HOIST-AT ?auto_3838 ?auto_3837 ) ( AVAILABLE ?auto_3838 ) ( SURFACE-AT ?auto_3832 ?auto_3837 ) ( ON ?auto_3832 ?auto_3839 ) ( CLEAR ?auto_3832 ) ( TRUCK-AT ?auto_3836 ?auto_3835 ) ( not ( = ?auto_3832 ?auto_3833 ) ) ( not ( = ?auto_3832 ?auto_3839 ) ) ( not ( = ?auto_3833 ?auto_3839 ) ) ( not ( = ?auto_3834 ?auto_3838 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3836 ?auto_3835 ?auto_3837 )
      ( !LIFT ?auto_3838 ?auto_3832 ?auto_3839 ?auto_3837 )
      ( !LOAD ?auto_3838 ?auto_3832 ?auto_3836 ?auto_3837 )
      ( !DRIVE ?auto_3836 ?auto_3837 ?auto_3835 )
      ( !UNLOAD ?auto_3834 ?auto_3832 ?auto_3836 ?auto_3835 )
      ( !DROP ?auto_3834 ?auto_3832 ?auto_3833 ?auto_3835 )
      ( MAKE-ON-VERIFY ?auto_3832 ?auto_3833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3842 - SURFACE
      ?auto_3843 - SURFACE
    )
    :vars
    (
      ?auto_3844 - HOIST
      ?auto_3845 - PLACE
      ?auto_3847 - PLACE
      ?auto_3848 - HOIST
      ?auto_3849 - SURFACE
      ?auto_3846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3844 ?auto_3845 ) ( SURFACE-AT ?auto_3843 ?auto_3845 ) ( CLEAR ?auto_3843 ) ( IS-CRATE ?auto_3842 ) ( AVAILABLE ?auto_3844 ) ( not ( = ?auto_3847 ?auto_3845 ) ) ( HOIST-AT ?auto_3848 ?auto_3847 ) ( AVAILABLE ?auto_3848 ) ( SURFACE-AT ?auto_3842 ?auto_3847 ) ( ON ?auto_3842 ?auto_3849 ) ( CLEAR ?auto_3842 ) ( TRUCK-AT ?auto_3846 ?auto_3845 ) ( not ( = ?auto_3842 ?auto_3843 ) ) ( not ( = ?auto_3842 ?auto_3849 ) ) ( not ( = ?auto_3843 ?auto_3849 ) ) ( not ( = ?auto_3844 ?auto_3848 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3846 ?auto_3845 ?auto_3847 )
      ( !LIFT ?auto_3848 ?auto_3842 ?auto_3849 ?auto_3847 )
      ( !LOAD ?auto_3848 ?auto_3842 ?auto_3846 ?auto_3847 )
      ( !DRIVE ?auto_3846 ?auto_3847 ?auto_3845 )
      ( !UNLOAD ?auto_3844 ?auto_3842 ?auto_3846 ?auto_3845 )
      ( !DROP ?auto_3844 ?auto_3842 ?auto_3843 ?auto_3845 )
      ( MAKE-ON-VERIFY ?auto_3842 ?auto_3843 ) )
  )

)

