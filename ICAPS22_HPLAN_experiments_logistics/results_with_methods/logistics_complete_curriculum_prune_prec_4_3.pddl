( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3635 - OBJ
      ?auto_3636 - LOCATION
    )
    :vars
    (
      ?auto_3637 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3637 ?auto_3636 ) ( IN-TRUCK ?auto_3635 ?auto_3637 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_3635 ?auto_3637 ?auto_3636 )
      ( DELIVER-1PKG-VERIFY ?auto_3635 ?auto_3636 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3640 - OBJ
      ?auto_3641 - LOCATION
    )
    :vars
    (
      ?auto_3642 - TRUCK
      ?auto_3643 - LOCATION
      ?auto_3644 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_3640 ?auto_3642 ) ( TRUCK-AT ?auto_3642 ?auto_3643 ) ( IN-CITY ?auto_3643 ?auto_3644 ) ( IN-CITY ?auto_3641 ?auto_3644 ) ( not ( = ?auto_3641 ?auto_3643 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3642 ?auto_3643 ?auto_3641 ?auto_3644 )
      ( DELIVER-1PKG ?auto_3640 ?auto_3641 )
      ( DELIVER-1PKG-VERIFY ?auto_3640 ?auto_3641 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3647 - OBJ
      ?auto_3648 - LOCATION
    )
    :vars
    (
      ?auto_3649 - TRUCK
      ?auto_3651 - LOCATION
      ?auto_3650 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3649 ?auto_3651 ) ( IN-CITY ?auto_3651 ?auto_3650 ) ( IN-CITY ?auto_3648 ?auto_3650 ) ( not ( = ?auto_3648 ?auto_3651 ) ) ( OBJ-AT ?auto_3647 ?auto_3651 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3647 ?auto_3649 ?auto_3651 )
      ( DELIVER-1PKG ?auto_3647 ?auto_3648 )
      ( DELIVER-1PKG-VERIFY ?auto_3647 ?auto_3648 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3654 - OBJ
      ?auto_3655 - LOCATION
    )
    :vars
    (
      ?auto_3657 - LOCATION
      ?auto_3658 - CITY
      ?auto_3656 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3657 ?auto_3658 ) ( IN-CITY ?auto_3655 ?auto_3658 ) ( not ( = ?auto_3655 ?auto_3657 ) ) ( OBJ-AT ?auto_3654 ?auto_3657 ) ( TRUCK-AT ?auto_3656 ?auto_3655 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3656 ?auto_3655 ?auto_3657 ?auto_3658 )
      ( DELIVER-1PKG ?auto_3654 ?auto_3655 )
      ( DELIVER-1PKG-VERIFY ?auto_3654 ?auto_3655 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3688 - OBJ
      ?auto_3690 - OBJ
      ?auto_3689 - LOCATION
    )
    :vars
    (
      ?auto_3691 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3690 ?auto_3688 ) ( TRUCK-AT ?auto_3691 ?auto_3689 ) ( IN-TRUCK ?auto_3690 ?auto_3691 ) ( OBJ-AT ?auto_3688 ?auto_3689 ) ( not ( = ?auto_3688 ?auto_3690 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3690 ?auto_3689 )
      ( DELIVER-2PKG-VERIFY ?auto_3688 ?auto_3690 ?auto_3689 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3695 - OBJ
      ?auto_3697 - OBJ
      ?auto_3696 - LOCATION
    )
    :vars
    (
      ?auto_3700 - TRUCK
      ?auto_3699 - LOCATION
      ?auto_3698 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3697 ?auto_3695 ) ( IN-TRUCK ?auto_3697 ?auto_3700 ) ( TRUCK-AT ?auto_3700 ?auto_3699 ) ( IN-CITY ?auto_3699 ?auto_3698 ) ( IN-CITY ?auto_3696 ?auto_3698 ) ( not ( = ?auto_3696 ?auto_3699 ) ) ( OBJ-AT ?auto_3695 ?auto_3696 ) ( not ( = ?auto_3695 ?auto_3697 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3697 ?auto_3696 )
      ( DELIVER-2PKG-VERIFY ?auto_3695 ?auto_3697 ?auto_3696 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3704 - OBJ
      ?auto_3706 - OBJ
      ?auto_3705 - LOCATION
    )
    :vars
    (
      ?auto_3707 - TRUCK
      ?auto_3709 - LOCATION
      ?auto_3708 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3706 ?auto_3704 ) ( TRUCK-AT ?auto_3707 ?auto_3709 ) ( IN-CITY ?auto_3709 ?auto_3708 ) ( IN-CITY ?auto_3705 ?auto_3708 ) ( not ( = ?auto_3705 ?auto_3709 ) ) ( OBJ-AT ?auto_3706 ?auto_3709 ) ( OBJ-AT ?auto_3704 ?auto_3705 ) ( not ( = ?auto_3704 ?auto_3706 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3706 ?auto_3705 )
      ( DELIVER-2PKG-VERIFY ?auto_3704 ?auto_3706 ?auto_3705 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3713 - OBJ
      ?auto_3715 - OBJ
      ?auto_3714 - LOCATION
    )
    :vars
    (
      ?auto_3718 - LOCATION
      ?auto_3716 - CITY
      ?auto_3717 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3715 ?auto_3713 ) ( IN-CITY ?auto_3718 ?auto_3716 ) ( IN-CITY ?auto_3714 ?auto_3716 ) ( not ( = ?auto_3714 ?auto_3718 ) ) ( OBJ-AT ?auto_3715 ?auto_3718 ) ( TRUCK-AT ?auto_3717 ?auto_3714 ) ( OBJ-AT ?auto_3713 ?auto_3714 ) ( not ( = ?auto_3713 ?auto_3715 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3715 ?auto_3714 )
      ( DELIVER-2PKG-VERIFY ?auto_3713 ?auto_3715 ?auto_3714 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3722 - OBJ
      ?auto_3724 - OBJ
      ?auto_3723 - LOCATION
    )
    :vars
    (
      ?auto_3726 - LOCATION
      ?auto_3727 - CITY
      ?auto_3725 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3724 ?auto_3722 ) ( IN-CITY ?auto_3726 ?auto_3727 ) ( IN-CITY ?auto_3723 ?auto_3727 ) ( not ( = ?auto_3723 ?auto_3726 ) ) ( OBJ-AT ?auto_3724 ?auto_3726 ) ( TRUCK-AT ?auto_3725 ?auto_3723 ) ( not ( = ?auto_3722 ?auto_3724 ) ) ( IN-TRUCK ?auto_3722 ?auto_3725 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3722 ?auto_3723 )
      ( DELIVER-2PKG ?auto_3722 ?auto_3724 ?auto_3723 )
      ( DELIVER-2PKG-VERIFY ?auto_3722 ?auto_3724 ?auto_3723 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3731 - OBJ
      ?auto_3733 - OBJ
      ?auto_3732 - LOCATION
    )
    :vars
    (
      ?auto_3735 - LOCATION
      ?auto_3734 - CITY
      ?auto_3736 - TRUCK
      ?auto_3737 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3733 ?auto_3731 ) ( IN-CITY ?auto_3735 ?auto_3734 ) ( IN-CITY ?auto_3732 ?auto_3734 ) ( not ( = ?auto_3732 ?auto_3735 ) ) ( OBJ-AT ?auto_3733 ?auto_3735 ) ( not ( = ?auto_3731 ?auto_3733 ) ) ( IN-TRUCK ?auto_3731 ?auto_3736 ) ( TRUCK-AT ?auto_3736 ?auto_3737 ) ( IN-CITY ?auto_3737 ?auto_3734 ) ( not ( = ?auto_3732 ?auto_3737 ) ) ( not ( = ?auto_3735 ?auto_3737 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3736 ?auto_3737 ?auto_3732 ?auto_3734 )
      ( DELIVER-2PKG ?auto_3731 ?auto_3733 ?auto_3732 )
      ( DELIVER-2PKG-VERIFY ?auto_3731 ?auto_3733 ?auto_3732 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3741 - OBJ
      ?auto_3743 - OBJ
      ?auto_3742 - LOCATION
    )
    :vars
    (
      ?auto_3747 - LOCATION
      ?auto_3746 - CITY
      ?auto_3745 - TRUCK
      ?auto_3744 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3743 ?auto_3741 ) ( IN-CITY ?auto_3747 ?auto_3746 ) ( IN-CITY ?auto_3742 ?auto_3746 ) ( not ( = ?auto_3742 ?auto_3747 ) ) ( OBJ-AT ?auto_3743 ?auto_3747 ) ( not ( = ?auto_3741 ?auto_3743 ) ) ( TRUCK-AT ?auto_3745 ?auto_3744 ) ( IN-CITY ?auto_3744 ?auto_3746 ) ( not ( = ?auto_3742 ?auto_3744 ) ) ( not ( = ?auto_3747 ?auto_3744 ) ) ( OBJ-AT ?auto_3741 ?auto_3744 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3741 ?auto_3745 ?auto_3744 )
      ( DELIVER-2PKG ?auto_3741 ?auto_3743 ?auto_3742 )
      ( DELIVER-2PKG-VERIFY ?auto_3741 ?auto_3743 ?auto_3742 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3751 - OBJ
      ?auto_3753 - OBJ
      ?auto_3752 - LOCATION
    )
    :vars
    (
      ?auto_3756 - LOCATION
      ?auto_3757 - CITY
      ?auto_3755 - LOCATION
      ?auto_3754 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3753 ?auto_3751 ) ( IN-CITY ?auto_3756 ?auto_3757 ) ( IN-CITY ?auto_3752 ?auto_3757 ) ( not ( = ?auto_3752 ?auto_3756 ) ) ( OBJ-AT ?auto_3753 ?auto_3756 ) ( not ( = ?auto_3751 ?auto_3753 ) ) ( IN-CITY ?auto_3755 ?auto_3757 ) ( not ( = ?auto_3752 ?auto_3755 ) ) ( not ( = ?auto_3756 ?auto_3755 ) ) ( OBJ-AT ?auto_3751 ?auto_3755 ) ( TRUCK-AT ?auto_3754 ?auto_3752 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3754 ?auto_3752 ?auto_3755 ?auto_3757 )
      ( DELIVER-2PKG ?auto_3751 ?auto_3753 ?auto_3752 )
      ( DELIVER-2PKG-VERIFY ?auto_3751 ?auto_3753 ?auto_3752 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3788 - OBJ
      ?auto_3790 - OBJ
      ?auto_3791 - OBJ
      ?auto_3789 - LOCATION
    )
    :vars
    (
      ?auto_3792 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3790 ?auto_3788 ) ( GREATER-THAN ?auto_3791 ?auto_3788 ) ( GREATER-THAN ?auto_3791 ?auto_3790 ) ( TRUCK-AT ?auto_3792 ?auto_3789 ) ( IN-TRUCK ?auto_3791 ?auto_3792 ) ( OBJ-AT ?auto_3788 ?auto_3789 ) ( OBJ-AT ?auto_3790 ?auto_3789 ) ( not ( = ?auto_3788 ?auto_3790 ) ) ( not ( = ?auto_3788 ?auto_3791 ) ) ( not ( = ?auto_3790 ?auto_3791 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3791 ?auto_3789 )
      ( DELIVER-3PKG-VERIFY ?auto_3788 ?auto_3790 ?auto_3791 ?auto_3789 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3797 - OBJ
      ?auto_3799 - OBJ
      ?auto_3800 - OBJ
      ?auto_3798 - LOCATION
    )
    :vars
    (
      ?auto_3801 - TRUCK
      ?auto_3802 - LOCATION
      ?auto_3803 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3799 ?auto_3797 ) ( GREATER-THAN ?auto_3800 ?auto_3797 ) ( GREATER-THAN ?auto_3800 ?auto_3799 ) ( IN-TRUCK ?auto_3800 ?auto_3801 ) ( TRUCK-AT ?auto_3801 ?auto_3802 ) ( IN-CITY ?auto_3802 ?auto_3803 ) ( IN-CITY ?auto_3798 ?auto_3803 ) ( not ( = ?auto_3798 ?auto_3802 ) ) ( OBJ-AT ?auto_3797 ?auto_3798 ) ( OBJ-AT ?auto_3799 ?auto_3798 ) ( not ( = ?auto_3797 ?auto_3799 ) ) ( not ( = ?auto_3797 ?auto_3800 ) ) ( not ( = ?auto_3799 ?auto_3800 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3800 ?auto_3798 )
      ( DELIVER-3PKG-VERIFY ?auto_3797 ?auto_3799 ?auto_3800 ?auto_3798 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3808 - OBJ
      ?auto_3810 - OBJ
      ?auto_3811 - OBJ
      ?auto_3809 - LOCATION
    )
    :vars
    (
      ?auto_3814 - TRUCK
      ?auto_3813 - LOCATION
      ?auto_3812 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3810 ?auto_3808 ) ( GREATER-THAN ?auto_3811 ?auto_3808 ) ( GREATER-THAN ?auto_3811 ?auto_3810 ) ( TRUCK-AT ?auto_3814 ?auto_3813 ) ( IN-CITY ?auto_3813 ?auto_3812 ) ( IN-CITY ?auto_3809 ?auto_3812 ) ( not ( = ?auto_3809 ?auto_3813 ) ) ( OBJ-AT ?auto_3811 ?auto_3813 ) ( OBJ-AT ?auto_3808 ?auto_3809 ) ( OBJ-AT ?auto_3810 ?auto_3809 ) ( not ( = ?auto_3808 ?auto_3810 ) ) ( not ( = ?auto_3808 ?auto_3811 ) ) ( not ( = ?auto_3810 ?auto_3811 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3811 ?auto_3809 )
      ( DELIVER-3PKG-VERIFY ?auto_3808 ?auto_3810 ?auto_3811 ?auto_3809 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3819 - OBJ
      ?auto_3821 - OBJ
      ?auto_3822 - OBJ
      ?auto_3820 - LOCATION
    )
    :vars
    (
      ?auto_3824 - LOCATION
      ?auto_3823 - CITY
      ?auto_3825 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3821 ?auto_3819 ) ( GREATER-THAN ?auto_3822 ?auto_3819 ) ( GREATER-THAN ?auto_3822 ?auto_3821 ) ( IN-CITY ?auto_3824 ?auto_3823 ) ( IN-CITY ?auto_3820 ?auto_3823 ) ( not ( = ?auto_3820 ?auto_3824 ) ) ( OBJ-AT ?auto_3822 ?auto_3824 ) ( TRUCK-AT ?auto_3825 ?auto_3820 ) ( OBJ-AT ?auto_3819 ?auto_3820 ) ( OBJ-AT ?auto_3821 ?auto_3820 ) ( not ( = ?auto_3819 ?auto_3821 ) ) ( not ( = ?auto_3819 ?auto_3822 ) ) ( not ( = ?auto_3821 ?auto_3822 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3822 ?auto_3820 )
      ( DELIVER-3PKG-VERIFY ?auto_3819 ?auto_3821 ?auto_3822 ?auto_3820 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3830 - OBJ
      ?auto_3832 - OBJ
      ?auto_3833 - OBJ
      ?auto_3831 - LOCATION
    )
    :vars
    (
      ?auto_3836 - LOCATION
      ?auto_3835 - CITY
      ?auto_3834 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3832 ?auto_3830 ) ( GREATER-THAN ?auto_3833 ?auto_3830 ) ( GREATER-THAN ?auto_3833 ?auto_3832 ) ( IN-CITY ?auto_3836 ?auto_3835 ) ( IN-CITY ?auto_3831 ?auto_3835 ) ( not ( = ?auto_3831 ?auto_3836 ) ) ( OBJ-AT ?auto_3833 ?auto_3836 ) ( TRUCK-AT ?auto_3834 ?auto_3831 ) ( OBJ-AT ?auto_3830 ?auto_3831 ) ( not ( = ?auto_3830 ?auto_3832 ) ) ( not ( = ?auto_3830 ?auto_3833 ) ) ( not ( = ?auto_3832 ?auto_3833 ) ) ( IN-TRUCK ?auto_3832 ?auto_3834 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3832 ?auto_3831 )
      ( DELIVER-3PKG ?auto_3830 ?auto_3832 ?auto_3833 ?auto_3831 )
      ( DELIVER-3PKG-VERIFY ?auto_3830 ?auto_3832 ?auto_3833 ?auto_3831 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3841 - OBJ
      ?auto_3843 - OBJ
      ?auto_3844 - OBJ
      ?auto_3842 - LOCATION
    )
    :vars
    (
      ?auto_3847 - LOCATION
      ?auto_3846 - CITY
      ?auto_3845 - TRUCK
      ?auto_3848 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3843 ?auto_3841 ) ( GREATER-THAN ?auto_3844 ?auto_3841 ) ( GREATER-THAN ?auto_3844 ?auto_3843 ) ( IN-CITY ?auto_3847 ?auto_3846 ) ( IN-CITY ?auto_3842 ?auto_3846 ) ( not ( = ?auto_3842 ?auto_3847 ) ) ( OBJ-AT ?auto_3844 ?auto_3847 ) ( OBJ-AT ?auto_3841 ?auto_3842 ) ( not ( = ?auto_3841 ?auto_3843 ) ) ( not ( = ?auto_3841 ?auto_3844 ) ) ( not ( = ?auto_3843 ?auto_3844 ) ) ( IN-TRUCK ?auto_3843 ?auto_3845 ) ( TRUCK-AT ?auto_3845 ?auto_3848 ) ( IN-CITY ?auto_3848 ?auto_3846 ) ( not ( = ?auto_3842 ?auto_3848 ) ) ( not ( = ?auto_3847 ?auto_3848 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3845 ?auto_3848 ?auto_3842 ?auto_3846 )
      ( DELIVER-3PKG ?auto_3841 ?auto_3843 ?auto_3844 ?auto_3842 )
      ( DELIVER-3PKG-VERIFY ?auto_3841 ?auto_3843 ?auto_3844 ?auto_3842 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3853 - OBJ
      ?auto_3855 - OBJ
      ?auto_3856 - OBJ
      ?auto_3854 - LOCATION
    )
    :vars
    (
      ?auto_3858 - LOCATION
      ?auto_3857 - CITY
      ?auto_3860 - TRUCK
      ?auto_3859 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3855 ?auto_3853 ) ( GREATER-THAN ?auto_3856 ?auto_3853 ) ( GREATER-THAN ?auto_3856 ?auto_3855 ) ( IN-CITY ?auto_3858 ?auto_3857 ) ( IN-CITY ?auto_3854 ?auto_3857 ) ( not ( = ?auto_3854 ?auto_3858 ) ) ( OBJ-AT ?auto_3856 ?auto_3858 ) ( OBJ-AT ?auto_3853 ?auto_3854 ) ( not ( = ?auto_3853 ?auto_3855 ) ) ( not ( = ?auto_3853 ?auto_3856 ) ) ( not ( = ?auto_3855 ?auto_3856 ) ) ( TRUCK-AT ?auto_3860 ?auto_3859 ) ( IN-CITY ?auto_3859 ?auto_3857 ) ( not ( = ?auto_3854 ?auto_3859 ) ) ( not ( = ?auto_3858 ?auto_3859 ) ) ( OBJ-AT ?auto_3855 ?auto_3859 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3855 ?auto_3860 ?auto_3859 )
      ( DELIVER-3PKG ?auto_3853 ?auto_3855 ?auto_3856 ?auto_3854 )
      ( DELIVER-3PKG-VERIFY ?auto_3853 ?auto_3855 ?auto_3856 ?auto_3854 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3865 - OBJ
      ?auto_3867 - OBJ
      ?auto_3868 - OBJ
      ?auto_3866 - LOCATION
    )
    :vars
    (
      ?auto_3869 - LOCATION
      ?auto_3872 - CITY
      ?auto_3870 - LOCATION
      ?auto_3871 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3867 ?auto_3865 ) ( GREATER-THAN ?auto_3868 ?auto_3865 ) ( GREATER-THAN ?auto_3868 ?auto_3867 ) ( IN-CITY ?auto_3869 ?auto_3872 ) ( IN-CITY ?auto_3866 ?auto_3872 ) ( not ( = ?auto_3866 ?auto_3869 ) ) ( OBJ-AT ?auto_3868 ?auto_3869 ) ( OBJ-AT ?auto_3865 ?auto_3866 ) ( not ( = ?auto_3865 ?auto_3867 ) ) ( not ( = ?auto_3865 ?auto_3868 ) ) ( not ( = ?auto_3867 ?auto_3868 ) ) ( IN-CITY ?auto_3870 ?auto_3872 ) ( not ( = ?auto_3866 ?auto_3870 ) ) ( not ( = ?auto_3869 ?auto_3870 ) ) ( OBJ-AT ?auto_3867 ?auto_3870 ) ( TRUCK-AT ?auto_3871 ?auto_3866 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3871 ?auto_3866 ?auto_3870 ?auto_3872 )
      ( DELIVER-3PKG ?auto_3865 ?auto_3867 ?auto_3868 ?auto_3866 )
      ( DELIVER-3PKG-VERIFY ?auto_3865 ?auto_3867 ?auto_3868 ?auto_3866 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3877 - OBJ
      ?auto_3879 - OBJ
      ?auto_3880 - OBJ
      ?auto_3878 - LOCATION
    )
    :vars
    (
      ?auto_3883 - LOCATION
      ?auto_3884 - CITY
      ?auto_3882 - LOCATION
      ?auto_3881 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3879 ?auto_3877 ) ( GREATER-THAN ?auto_3880 ?auto_3877 ) ( GREATER-THAN ?auto_3880 ?auto_3879 ) ( IN-CITY ?auto_3883 ?auto_3884 ) ( IN-CITY ?auto_3878 ?auto_3884 ) ( not ( = ?auto_3878 ?auto_3883 ) ) ( OBJ-AT ?auto_3880 ?auto_3883 ) ( not ( = ?auto_3877 ?auto_3879 ) ) ( not ( = ?auto_3877 ?auto_3880 ) ) ( not ( = ?auto_3879 ?auto_3880 ) ) ( IN-CITY ?auto_3882 ?auto_3884 ) ( not ( = ?auto_3878 ?auto_3882 ) ) ( not ( = ?auto_3883 ?auto_3882 ) ) ( OBJ-AT ?auto_3879 ?auto_3882 ) ( TRUCK-AT ?auto_3881 ?auto_3878 ) ( IN-TRUCK ?auto_3877 ?auto_3881 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3877 ?auto_3878 )
      ( DELIVER-3PKG ?auto_3877 ?auto_3879 ?auto_3880 ?auto_3878 )
      ( DELIVER-3PKG-VERIFY ?auto_3877 ?auto_3879 ?auto_3880 ?auto_3878 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3889 - OBJ
      ?auto_3891 - OBJ
      ?auto_3892 - OBJ
      ?auto_3890 - LOCATION
    )
    :vars
    (
      ?auto_3894 - LOCATION
      ?auto_3895 - CITY
      ?auto_3896 - LOCATION
      ?auto_3893 - TRUCK
      ?auto_3897 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3891 ?auto_3889 ) ( GREATER-THAN ?auto_3892 ?auto_3889 ) ( GREATER-THAN ?auto_3892 ?auto_3891 ) ( IN-CITY ?auto_3894 ?auto_3895 ) ( IN-CITY ?auto_3890 ?auto_3895 ) ( not ( = ?auto_3890 ?auto_3894 ) ) ( OBJ-AT ?auto_3892 ?auto_3894 ) ( not ( = ?auto_3889 ?auto_3891 ) ) ( not ( = ?auto_3889 ?auto_3892 ) ) ( not ( = ?auto_3891 ?auto_3892 ) ) ( IN-CITY ?auto_3896 ?auto_3895 ) ( not ( = ?auto_3890 ?auto_3896 ) ) ( not ( = ?auto_3894 ?auto_3896 ) ) ( OBJ-AT ?auto_3891 ?auto_3896 ) ( IN-TRUCK ?auto_3889 ?auto_3893 ) ( TRUCK-AT ?auto_3893 ?auto_3897 ) ( IN-CITY ?auto_3897 ?auto_3895 ) ( not ( = ?auto_3890 ?auto_3897 ) ) ( not ( = ?auto_3894 ?auto_3897 ) ) ( not ( = ?auto_3896 ?auto_3897 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3893 ?auto_3897 ?auto_3890 ?auto_3895 )
      ( DELIVER-3PKG ?auto_3889 ?auto_3891 ?auto_3892 ?auto_3890 )
      ( DELIVER-3PKG-VERIFY ?auto_3889 ?auto_3891 ?auto_3892 ?auto_3890 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3902 - OBJ
      ?auto_3904 - OBJ
      ?auto_3905 - OBJ
      ?auto_3903 - LOCATION
    )
    :vars
    (
      ?auto_3907 - LOCATION
      ?auto_3909 - CITY
      ?auto_3908 - LOCATION
      ?auto_3906 - TRUCK
      ?auto_3910 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3904 ?auto_3902 ) ( GREATER-THAN ?auto_3905 ?auto_3902 ) ( GREATER-THAN ?auto_3905 ?auto_3904 ) ( IN-CITY ?auto_3907 ?auto_3909 ) ( IN-CITY ?auto_3903 ?auto_3909 ) ( not ( = ?auto_3903 ?auto_3907 ) ) ( OBJ-AT ?auto_3905 ?auto_3907 ) ( not ( = ?auto_3902 ?auto_3904 ) ) ( not ( = ?auto_3902 ?auto_3905 ) ) ( not ( = ?auto_3904 ?auto_3905 ) ) ( IN-CITY ?auto_3908 ?auto_3909 ) ( not ( = ?auto_3903 ?auto_3908 ) ) ( not ( = ?auto_3907 ?auto_3908 ) ) ( OBJ-AT ?auto_3904 ?auto_3908 ) ( TRUCK-AT ?auto_3906 ?auto_3910 ) ( IN-CITY ?auto_3910 ?auto_3909 ) ( not ( = ?auto_3903 ?auto_3910 ) ) ( not ( = ?auto_3907 ?auto_3910 ) ) ( not ( = ?auto_3908 ?auto_3910 ) ) ( OBJ-AT ?auto_3902 ?auto_3910 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3902 ?auto_3906 ?auto_3910 )
      ( DELIVER-3PKG ?auto_3902 ?auto_3904 ?auto_3905 ?auto_3903 )
      ( DELIVER-3PKG-VERIFY ?auto_3902 ?auto_3904 ?auto_3905 ?auto_3903 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3915 - OBJ
      ?auto_3917 - OBJ
      ?auto_3918 - OBJ
      ?auto_3916 - LOCATION
    )
    :vars
    (
      ?auto_3920 - LOCATION
      ?auto_3919 - CITY
      ?auto_3923 - LOCATION
      ?auto_3921 - LOCATION
      ?auto_3922 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3917 ?auto_3915 ) ( GREATER-THAN ?auto_3918 ?auto_3915 ) ( GREATER-THAN ?auto_3918 ?auto_3917 ) ( IN-CITY ?auto_3920 ?auto_3919 ) ( IN-CITY ?auto_3916 ?auto_3919 ) ( not ( = ?auto_3916 ?auto_3920 ) ) ( OBJ-AT ?auto_3918 ?auto_3920 ) ( not ( = ?auto_3915 ?auto_3917 ) ) ( not ( = ?auto_3915 ?auto_3918 ) ) ( not ( = ?auto_3917 ?auto_3918 ) ) ( IN-CITY ?auto_3923 ?auto_3919 ) ( not ( = ?auto_3916 ?auto_3923 ) ) ( not ( = ?auto_3920 ?auto_3923 ) ) ( OBJ-AT ?auto_3917 ?auto_3923 ) ( IN-CITY ?auto_3921 ?auto_3919 ) ( not ( = ?auto_3916 ?auto_3921 ) ) ( not ( = ?auto_3920 ?auto_3921 ) ) ( not ( = ?auto_3923 ?auto_3921 ) ) ( OBJ-AT ?auto_3915 ?auto_3921 ) ( TRUCK-AT ?auto_3922 ?auto_3916 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3922 ?auto_3916 ?auto_3921 ?auto_3919 )
      ( DELIVER-3PKG ?auto_3915 ?auto_3917 ?auto_3918 ?auto_3916 )
      ( DELIVER-3PKG-VERIFY ?auto_3915 ?auto_3917 ?auto_3918 ?auto_3916 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3955 - OBJ
      ?auto_3957 - OBJ
      ?auto_3958 - OBJ
      ?auto_3959 - OBJ
      ?auto_3956 - LOCATION
    )
    :vars
    (
      ?auto_3960 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3957 ?auto_3955 ) ( GREATER-THAN ?auto_3958 ?auto_3955 ) ( GREATER-THAN ?auto_3958 ?auto_3957 ) ( GREATER-THAN ?auto_3959 ?auto_3955 ) ( GREATER-THAN ?auto_3959 ?auto_3957 ) ( GREATER-THAN ?auto_3959 ?auto_3958 ) ( TRUCK-AT ?auto_3960 ?auto_3956 ) ( IN-TRUCK ?auto_3959 ?auto_3960 ) ( OBJ-AT ?auto_3955 ?auto_3956 ) ( OBJ-AT ?auto_3957 ?auto_3956 ) ( OBJ-AT ?auto_3958 ?auto_3956 ) ( not ( = ?auto_3955 ?auto_3957 ) ) ( not ( = ?auto_3955 ?auto_3958 ) ) ( not ( = ?auto_3955 ?auto_3959 ) ) ( not ( = ?auto_3957 ?auto_3958 ) ) ( not ( = ?auto_3957 ?auto_3959 ) ) ( not ( = ?auto_3958 ?auto_3959 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3959 ?auto_3956 )
      ( DELIVER-4PKG-VERIFY ?auto_3955 ?auto_3957 ?auto_3958 ?auto_3959 ?auto_3956 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3966 - OBJ
      ?auto_3968 - OBJ
      ?auto_3969 - OBJ
      ?auto_3970 - OBJ
      ?auto_3967 - LOCATION
    )
    :vars
    (
      ?auto_3973 - TRUCK
      ?auto_3972 - LOCATION
      ?auto_3971 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3968 ?auto_3966 ) ( GREATER-THAN ?auto_3969 ?auto_3966 ) ( GREATER-THAN ?auto_3969 ?auto_3968 ) ( GREATER-THAN ?auto_3970 ?auto_3966 ) ( GREATER-THAN ?auto_3970 ?auto_3968 ) ( GREATER-THAN ?auto_3970 ?auto_3969 ) ( IN-TRUCK ?auto_3970 ?auto_3973 ) ( TRUCK-AT ?auto_3973 ?auto_3972 ) ( IN-CITY ?auto_3972 ?auto_3971 ) ( IN-CITY ?auto_3967 ?auto_3971 ) ( not ( = ?auto_3967 ?auto_3972 ) ) ( OBJ-AT ?auto_3966 ?auto_3967 ) ( OBJ-AT ?auto_3968 ?auto_3967 ) ( OBJ-AT ?auto_3969 ?auto_3967 ) ( not ( = ?auto_3966 ?auto_3968 ) ) ( not ( = ?auto_3966 ?auto_3969 ) ) ( not ( = ?auto_3966 ?auto_3970 ) ) ( not ( = ?auto_3968 ?auto_3969 ) ) ( not ( = ?auto_3968 ?auto_3970 ) ) ( not ( = ?auto_3969 ?auto_3970 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3970 ?auto_3967 )
      ( DELIVER-4PKG-VERIFY ?auto_3966 ?auto_3968 ?auto_3969 ?auto_3970 ?auto_3967 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3979 - OBJ
      ?auto_3981 - OBJ
      ?auto_3982 - OBJ
      ?auto_3983 - OBJ
      ?auto_3980 - LOCATION
    )
    :vars
    (
      ?auto_3986 - TRUCK
      ?auto_3984 - LOCATION
      ?auto_3985 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3981 ?auto_3979 ) ( GREATER-THAN ?auto_3982 ?auto_3979 ) ( GREATER-THAN ?auto_3982 ?auto_3981 ) ( GREATER-THAN ?auto_3983 ?auto_3979 ) ( GREATER-THAN ?auto_3983 ?auto_3981 ) ( GREATER-THAN ?auto_3983 ?auto_3982 ) ( TRUCK-AT ?auto_3986 ?auto_3984 ) ( IN-CITY ?auto_3984 ?auto_3985 ) ( IN-CITY ?auto_3980 ?auto_3985 ) ( not ( = ?auto_3980 ?auto_3984 ) ) ( OBJ-AT ?auto_3983 ?auto_3984 ) ( OBJ-AT ?auto_3979 ?auto_3980 ) ( OBJ-AT ?auto_3981 ?auto_3980 ) ( OBJ-AT ?auto_3982 ?auto_3980 ) ( not ( = ?auto_3979 ?auto_3981 ) ) ( not ( = ?auto_3979 ?auto_3982 ) ) ( not ( = ?auto_3979 ?auto_3983 ) ) ( not ( = ?auto_3981 ?auto_3982 ) ) ( not ( = ?auto_3981 ?auto_3983 ) ) ( not ( = ?auto_3982 ?auto_3983 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3983 ?auto_3980 )
      ( DELIVER-4PKG-VERIFY ?auto_3979 ?auto_3981 ?auto_3982 ?auto_3983 ?auto_3980 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3992 - OBJ
      ?auto_3994 - OBJ
      ?auto_3995 - OBJ
      ?auto_3996 - OBJ
      ?auto_3993 - LOCATION
    )
    :vars
    (
      ?auto_3999 - LOCATION
      ?auto_3998 - CITY
      ?auto_3997 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3994 ?auto_3992 ) ( GREATER-THAN ?auto_3995 ?auto_3992 ) ( GREATER-THAN ?auto_3995 ?auto_3994 ) ( GREATER-THAN ?auto_3996 ?auto_3992 ) ( GREATER-THAN ?auto_3996 ?auto_3994 ) ( GREATER-THAN ?auto_3996 ?auto_3995 ) ( IN-CITY ?auto_3999 ?auto_3998 ) ( IN-CITY ?auto_3993 ?auto_3998 ) ( not ( = ?auto_3993 ?auto_3999 ) ) ( OBJ-AT ?auto_3996 ?auto_3999 ) ( TRUCK-AT ?auto_3997 ?auto_3993 ) ( OBJ-AT ?auto_3992 ?auto_3993 ) ( OBJ-AT ?auto_3994 ?auto_3993 ) ( OBJ-AT ?auto_3995 ?auto_3993 ) ( not ( = ?auto_3992 ?auto_3994 ) ) ( not ( = ?auto_3992 ?auto_3995 ) ) ( not ( = ?auto_3992 ?auto_3996 ) ) ( not ( = ?auto_3994 ?auto_3995 ) ) ( not ( = ?auto_3994 ?auto_3996 ) ) ( not ( = ?auto_3995 ?auto_3996 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3996 ?auto_3993 )
      ( DELIVER-4PKG-VERIFY ?auto_3992 ?auto_3994 ?auto_3995 ?auto_3996 ?auto_3993 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4005 - OBJ
      ?auto_4007 - OBJ
      ?auto_4008 - OBJ
      ?auto_4009 - OBJ
      ?auto_4006 - LOCATION
    )
    :vars
    (
      ?auto_4010 - LOCATION
      ?auto_4011 - CITY
      ?auto_4012 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4007 ?auto_4005 ) ( GREATER-THAN ?auto_4008 ?auto_4005 ) ( GREATER-THAN ?auto_4008 ?auto_4007 ) ( GREATER-THAN ?auto_4009 ?auto_4005 ) ( GREATER-THAN ?auto_4009 ?auto_4007 ) ( GREATER-THAN ?auto_4009 ?auto_4008 ) ( IN-CITY ?auto_4010 ?auto_4011 ) ( IN-CITY ?auto_4006 ?auto_4011 ) ( not ( = ?auto_4006 ?auto_4010 ) ) ( OBJ-AT ?auto_4009 ?auto_4010 ) ( TRUCK-AT ?auto_4012 ?auto_4006 ) ( OBJ-AT ?auto_4005 ?auto_4006 ) ( OBJ-AT ?auto_4007 ?auto_4006 ) ( not ( = ?auto_4005 ?auto_4007 ) ) ( not ( = ?auto_4005 ?auto_4008 ) ) ( not ( = ?auto_4005 ?auto_4009 ) ) ( not ( = ?auto_4007 ?auto_4008 ) ) ( not ( = ?auto_4007 ?auto_4009 ) ) ( not ( = ?auto_4008 ?auto_4009 ) ) ( IN-TRUCK ?auto_4008 ?auto_4012 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4008 ?auto_4006 )
      ( DELIVER-4PKG ?auto_4005 ?auto_4007 ?auto_4008 ?auto_4009 ?auto_4006 )
      ( DELIVER-4PKG-VERIFY ?auto_4005 ?auto_4007 ?auto_4008 ?auto_4009 ?auto_4006 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4018 - OBJ
      ?auto_4020 - OBJ
      ?auto_4021 - OBJ
      ?auto_4022 - OBJ
      ?auto_4019 - LOCATION
    )
    :vars
    (
      ?auto_4024 - LOCATION
      ?auto_4023 - CITY
      ?auto_4025 - TRUCK
      ?auto_4026 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4020 ?auto_4018 ) ( GREATER-THAN ?auto_4021 ?auto_4018 ) ( GREATER-THAN ?auto_4021 ?auto_4020 ) ( GREATER-THAN ?auto_4022 ?auto_4018 ) ( GREATER-THAN ?auto_4022 ?auto_4020 ) ( GREATER-THAN ?auto_4022 ?auto_4021 ) ( IN-CITY ?auto_4024 ?auto_4023 ) ( IN-CITY ?auto_4019 ?auto_4023 ) ( not ( = ?auto_4019 ?auto_4024 ) ) ( OBJ-AT ?auto_4022 ?auto_4024 ) ( OBJ-AT ?auto_4018 ?auto_4019 ) ( OBJ-AT ?auto_4020 ?auto_4019 ) ( not ( = ?auto_4018 ?auto_4020 ) ) ( not ( = ?auto_4018 ?auto_4021 ) ) ( not ( = ?auto_4018 ?auto_4022 ) ) ( not ( = ?auto_4020 ?auto_4021 ) ) ( not ( = ?auto_4020 ?auto_4022 ) ) ( not ( = ?auto_4021 ?auto_4022 ) ) ( IN-TRUCK ?auto_4021 ?auto_4025 ) ( TRUCK-AT ?auto_4025 ?auto_4026 ) ( IN-CITY ?auto_4026 ?auto_4023 ) ( not ( = ?auto_4019 ?auto_4026 ) ) ( not ( = ?auto_4024 ?auto_4026 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4025 ?auto_4026 ?auto_4019 ?auto_4023 )
      ( DELIVER-4PKG ?auto_4018 ?auto_4020 ?auto_4021 ?auto_4022 ?auto_4019 )
      ( DELIVER-4PKG-VERIFY ?auto_4018 ?auto_4020 ?auto_4021 ?auto_4022 ?auto_4019 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4032 - OBJ
      ?auto_4034 - OBJ
      ?auto_4035 - OBJ
      ?auto_4036 - OBJ
      ?auto_4033 - LOCATION
    )
    :vars
    (
      ?auto_4037 - LOCATION
      ?auto_4039 - CITY
      ?auto_4038 - TRUCK
      ?auto_4040 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4034 ?auto_4032 ) ( GREATER-THAN ?auto_4035 ?auto_4032 ) ( GREATER-THAN ?auto_4035 ?auto_4034 ) ( GREATER-THAN ?auto_4036 ?auto_4032 ) ( GREATER-THAN ?auto_4036 ?auto_4034 ) ( GREATER-THAN ?auto_4036 ?auto_4035 ) ( IN-CITY ?auto_4037 ?auto_4039 ) ( IN-CITY ?auto_4033 ?auto_4039 ) ( not ( = ?auto_4033 ?auto_4037 ) ) ( OBJ-AT ?auto_4036 ?auto_4037 ) ( OBJ-AT ?auto_4032 ?auto_4033 ) ( OBJ-AT ?auto_4034 ?auto_4033 ) ( not ( = ?auto_4032 ?auto_4034 ) ) ( not ( = ?auto_4032 ?auto_4035 ) ) ( not ( = ?auto_4032 ?auto_4036 ) ) ( not ( = ?auto_4034 ?auto_4035 ) ) ( not ( = ?auto_4034 ?auto_4036 ) ) ( not ( = ?auto_4035 ?auto_4036 ) ) ( TRUCK-AT ?auto_4038 ?auto_4040 ) ( IN-CITY ?auto_4040 ?auto_4039 ) ( not ( = ?auto_4033 ?auto_4040 ) ) ( not ( = ?auto_4037 ?auto_4040 ) ) ( OBJ-AT ?auto_4035 ?auto_4040 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4035 ?auto_4038 ?auto_4040 )
      ( DELIVER-4PKG ?auto_4032 ?auto_4034 ?auto_4035 ?auto_4036 ?auto_4033 )
      ( DELIVER-4PKG-VERIFY ?auto_4032 ?auto_4034 ?auto_4035 ?auto_4036 ?auto_4033 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4046 - OBJ
      ?auto_4048 - OBJ
      ?auto_4049 - OBJ
      ?auto_4050 - OBJ
      ?auto_4047 - LOCATION
    )
    :vars
    (
      ?auto_4052 - LOCATION
      ?auto_4054 - CITY
      ?auto_4051 - LOCATION
      ?auto_4053 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4048 ?auto_4046 ) ( GREATER-THAN ?auto_4049 ?auto_4046 ) ( GREATER-THAN ?auto_4049 ?auto_4048 ) ( GREATER-THAN ?auto_4050 ?auto_4046 ) ( GREATER-THAN ?auto_4050 ?auto_4048 ) ( GREATER-THAN ?auto_4050 ?auto_4049 ) ( IN-CITY ?auto_4052 ?auto_4054 ) ( IN-CITY ?auto_4047 ?auto_4054 ) ( not ( = ?auto_4047 ?auto_4052 ) ) ( OBJ-AT ?auto_4050 ?auto_4052 ) ( OBJ-AT ?auto_4046 ?auto_4047 ) ( OBJ-AT ?auto_4048 ?auto_4047 ) ( not ( = ?auto_4046 ?auto_4048 ) ) ( not ( = ?auto_4046 ?auto_4049 ) ) ( not ( = ?auto_4046 ?auto_4050 ) ) ( not ( = ?auto_4048 ?auto_4049 ) ) ( not ( = ?auto_4048 ?auto_4050 ) ) ( not ( = ?auto_4049 ?auto_4050 ) ) ( IN-CITY ?auto_4051 ?auto_4054 ) ( not ( = ?auto_4047 ?auto_4051 ) ) ( not ( = ?auto_4052 ?auto_4051 ) ) ( OBJ-AT ?auto_4049 ?auto_4051 ) ( TRUCK-AT ?auto_4053 ?auto_4047 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4053 ?auto_4047 ?auto_4051 ?auto_4054 )
      ( DELIVER-4PKG ?auto_4046 ?auto_4048 ?auto_4049 ?auto_4050 ?auto_4047 )
      ( DELIVER-4PKG-VERIFY ?auto_4046 ?auto_4048 ?auto_4049 ?auto_4050 ?auto_4047 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4060 - OBJ
      ?auto_4062 - OBJ
      ?auto_4063 - OBJ
      ?auto_4064 - OBJ
      ?auto_4061 - LOCATION
    )
    :vars
    (
      ?auto_4065 - LOCATION
      ?auto_4068 - CITY
      ?auto_4067 - LOCATION
      ?auto_4066 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4062 ?auto_4060 ) ( GREATER-THAN ?auto_4063 ?auto_4060 ) ( GREATER-THAN ?auto_4063 ?auto_4062 ) ( GREATER-THAN ?auto_4064 ?auto_4060 ) ( GREATER-THAN ?auto_4064 ?auto_4062 ) ( GREATER-THAN ?auto_4064 ?auto_4063 ) ( IN-CITY ?auto_4065 ?auto_4068 ) ( IN-CITY ?auto_4061 ?auto_4068 ) ( not ( = ?auto_4061 ?auto_4065 ) ) ( OBJ-AT ?auto_4064 ?auto_4065 ) ( OBJ-AT ?auto_4060 ?auto_4061 ) ( not ( = ?auto_4060 ?auto_4062 ) ) ( not ( = ?auto_4060 ?auto_4063 ) ) ( not ( = ?auto_4060 ?auto_4064 ) ) ( not ( = ?auto_4062 ?auto_4063 ) ) ( not ( = ?auto_4062 ?auto_4064 ) ) ( not ( = ?auto_4063 ?auto_4064 ) ) ( IN-CITY ?auto_4067 ?auto_4068 ) ( not ( = ?auto_4061 ?auto_4067 ) ) ( not ( = ?auto_4065 ?auto_4067 ) ) ( OBJ-AT ?auto_4063 ?auto_4067 ) ( TRUCK-AT ?auto_4066 ?auto_4061 ) ( IN-TRUCK ?auto_4062 ?auto_4066 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4062 ?auto_4061 )
      ( DELIVER-4PKG ?auto_4060 ?auto_4062 ?auto_4063 ?auto_4064 ?auto_4061 )
      ( DELIVER-4PKG-VERIFY ?auto_4060 ?auto_4062 ?auto_4063 ?auto_4064 ?auto_4061 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4074 - OBJ
      ?auto_4076 - OBJ
      ?auto_4077 - OBJ
      ?auto_4078 - OBJ
      ?auto_4075 - LOCATION
    )
    :vars
    (
      ?auto_4079 - LOCATION
      ?auto_4082 - CITY
      ?auto_4080 - LOCATION
      ?auto_4081 - TRUCK
      ?auto_4083 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4076 ?auto_4074 ) ( GREATER-THAN ?auto_4077 ?auto_4074 ) ( GREATER-THAN ?auto_4077 ?auto_4076 ) ( GREATER-THAN ?auto_4078 ?auto_4074 ) ( GREATER-THAN ?auto_4078 ?auto_4076 ) ( GREATER-THAN ?auto_4078 ?auto_4077 ) ( IN-CITY ?auto_4079 ?auto_4082 ) ( IN-CITY ?auto_4075 ?auto_4082 ) ( not ( = ?auto_4075 ?auto_4079 ) ) ( OBJ-AT ?auto_4078 ?auto_4079 ) ( OBJ-AT ?auto_4074 ?auto_4075 ) ( not ( = ?auto_4074 ?auto_4076 ) ) ( not ( = ?auto_4074 ?auto_4077 ) ) ( not ( = ?auto_4074 ?auto_4078 ) ) ( not ( = ?auto_4076 ?auto_4077 ) ) ( not ( = ?auto_4076 ?auto_4078 ) ) ( not ( = ?auto_4077 ?auto_4078 ) ) ( IN-CITY ?auto_4080 ?auto_4082 ) ( not ( = ?auto_4075 ?auto_4080 ) ) ( not ( = ?auto_4079 ?auto_4080 ) ) ( OBJ-AT ?auto_4077 ?auto_4080 ) ( IN-TRUCK ?auto_4076 ?auto_4081 ) ( TRUCK-AT ?auto_4081 ?auto_4083 ) ( IN-CITY ?auto_4083 ?auto_4082 ) ( not ( = ?auto_4075 ?auto_4083 ) ) ( not ( = ?auto_4079 ?auto_4083 ) ) ( not ( = ?auto_4080 ?auto_4083 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4081 ?auto_4083 ?auto_4075 ?auto_4082 )
      ( DELIVER-4PKG ?auto_4074 ?auto_4076 ?auto_4077 ?auto_4078 ?auto_4075 )
      ( DELIVER-4PKG-VERIFY ?auto_4074 ?auto_4076 ?auto_4077 ?auto_4078 ?auto_4075 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4089 - OBJ
      ?auto_4091 - OBJ
      ?auto_4092 - OBJ
      ?auto_4093 - OBJ
      ?auto_4090 - LOCATION
    )
    :vars
    (
      ?auto_4095 - LOCATION
      ?auto_4094 - CITY
      ?auto_4096 - LOCATION
      ?auto_4097 - TRUCK
      ?auto_4098 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4091 ?auto_4089 ) ( GREATER-THAN ?auto_4092 ?auto_4089 ) ( GREATER-THAN ?auto_4092 ?auto_4091 ) ( GREATER-THAN ?auto_4093 ?auto_4089 ) ( GREATER-THAN ?auto_4093 ?auto_4091 ) ( GREATER-THAN ?auto_4093 ?auto_4092 ) ( IN-CITY ?auto_4095 ?auto_4094 ) ( IN-CITY ?auto_4090 ?auto_4094 ) ( not ( = ?auto_4090 ?auto_4095 ) ) ( OBJ-AT ?auto_4093 ?auto_4095 ) ( OBJ-AT ?auto_4089 ?auto_4090 ) ( not ( = ?auto_4089 ?auto_4091 ) ) ( not ( = ?auto_4089 ?auto_4092 ) ) ( not ( = ?auto_4089 ?auto_4093 ) ) ( not ( = ?auto_4091 ?auto_4092 ) ) ( not ( = ?auto_4091 ?auto_4093 ) ) ( not ( = ?auto_4092 ?auto_4093 ) ) ( IN-CITY ?auto_4096 ?auto_4094 ) ( not ( = ?auto_4090 ?auto_4096 ) ) ( not ( = ?auto_4095 ?auto_4096 ) ) ( OBJ-AT ?auto_4092 ?auto_4096 ) ( TRUCK-AT ?auto_4097 ?auto_4098 ) ( IN-CITY ?auto_4098 ?auto_4094 ) ( not ( = ?auto_4090 ?auto_4098 ) ) ( not ( = ?auto_4095 ?auto_4098 ) ) ( not ( = ?auto_4096 ?auto_4098 ) ) ( OBJ-AT ?auto_4091 ?auto_4098 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4091 ?auto_4097 ?auto_4098 )
      ( DELIVER-4PKG ?auto_4089 ?auto_4091 ?auto_4092 ?auto_4093 ?auto_4090 )
      ( DELIVER-4PKG-VERIFY ?auto_4089 ?auto_4091 ?auto_4092 ?auto_4093 ?auto_4090 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4104 - OBJ
      ?auto_4106 - OBJ
      ?auto_4107 - OBJ
      ?auto_4108 - OBJ
      ?auto_4105 - LOCATION
    )
    :vars
    (
      ?auto_4110 - LOCATION
      ?auto_4111 - CITY
      ?auto_4113 - LOCATION
      ?auto_4109 - LOCATION
      ?auto_4112 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4106 ?auto_4104 ) ( GREATER-THAN ?auto_4107 ?auto_4104 ) ( GREATER-THAN ?auto_4107 ?auto_4106 ) ( GREATER-THAN ?auto_4108 ?auto_4104 ) ( GREATER-THAN ?auto_4108 ?auto_4106 ) ( GREATER-THAN ?auto_4108 ?auto_4107 ) ( IN-CITY ?auto_4110 ?auto_4111 ) ( IN-CITY ?auto_4105 ?auto_4111 ) ( not ( = ?auto_4105 ?auto_4110 ) ) ( OBJ-AT ?auto_4108 ?auto_4110 ) ( OBJ-AT ?auto_4104 ?auto_4105 ) ( not ( = ?auto_4104 ?auto_4106 ) ) ( not ( = ?auto_4104 ?auto_4107 ) ) ( not ( = ?auto_4104 ?auto_4108 ) ) ( not ( = ?auto_4106 ?auto_4107 ) ) ( not ( = ?auto_4106 ?auto_4108 ) ) ( not ( = ?auto_4107 ?auto_4108 ) ) ( IN-CITY ?auto_4113 ?auto_4111 ) ( not ( = ?auto_4105 ?auto_4113 ) ) ( not ( = ?auto_4110 ?auto_4113 ) ) ( OBJ-AT ?auto_4107 ?auto_4113 ) ( IN-CITY ?auto_4109 ?auto_4111 ) ( not ( = ?auto_4105 ?auto_4109 ) ) ( not ( = ?auto_4110 ?auto_4109 ) ) ( not ( = ?auto_4113 ?auto_4109 ) ) ( OBJ-AT ?auto_4106 ?auto_4109 ) ( TRUCK-AT ?auto_4112 ?auto_4105 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4112 ?auto_4105 ?auto_4109 ?auto_4111 )
      ( DELIVER-4PKG ?auto_4104 ?auto_4106 ?auto_4107 ?auto_4108 ?auto_4105 )
      ( DELIVER-4PKG-VERIFY ?auto_4104 ?auto_4106 ?auto_4107 ?auto_4108 ?auto_4105 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4119 - OBJ
      ?auto_4121 - OBJ
      ?auto_4122 - OBJ
      ?auto_4123 - OBJ
      ?auto_4120 - LOCATION
    )
    :vars
    (
      ?auto_4126 - LOCATION
      ?auto_4124 - CITY
      ?auto_4128 - LOCATION
      ?auto_4125 - LOCATION
      ?auto_4127 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4121 ?auto_4119 ) ( GREATER-THAN ?auto_4122 ?auto_4119 ) ( GREATER-THAN ?auto_4122 ?auto_4121 ) ( GREATER-THAN ?auto_4123 ?auto_4119 ) ( GREATER-THAN ?auto_4123 ?auto_4121 ) ( GREATER-THAN ?auto_4123 ?auto_4122 ) ( IN-CITY ?auto_4126 ?auto_4124 ) ( IN-CITY ?auto_4120 ?auto_4124 ) ( not ( = ?auto_4120 ?auto_4126 ) ) ( OBJ-AT ?auto_4123 ?auto_4126 ) ( not ( = ?auto_4119 ?auto_4121 ) ) ( not ( = ?auto_4119 ?auto_4122 ) ) ( not ( = ?auto_4119 ?auto_4123 ) ) ( not ( = ?auto_4121 ?auto_4122 ) ) ( not ( = ?auto_4121 ?auto_4123 ) ) ( not ( = ?auto_4122 ?auto_4123 ) ) ( IN-CITY ?auto_4128 ?auto_4124 ) ( not ( = ?auto_4120 ?auto_4128 ) ) ( not ( = ?auto_4126 ?auto_4128 ) ) ( OBJ-AT ?auto_4122 ?auto_4128 ) ( IN-CITY ?auto_4125 ?auto_4124 ) ( not ( = ?auto_4120 ?auto_4125 ) ) ( not ( = ?auto_4126 ?auto_4125 ) ) ( not ( = ?auto_4128 ?auto_4125 ) ) ( OBJ-AT ?auto_4121 ?auto_4125 ) ( TRUCK-AT ?auto_4127 ?auto_4120 ) ( IN-TRUCK ?auto_4119 ?auto_4127 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4119 ?auto_4120 )
      ( DELIVER-4PKG ?auto_4119 ?auto_4121 ?auto_4122 ?auto_4123 ?auto_4120 )
      ( DELIVER-4PKG-VERIFY ?auto_4119 ?auto_4121 ?auto_4122 ?auto_4123 ?auto_4120 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4134 - OBJ
      ?auto_4136 - OBJ
      ?auto_4137 - OBJ
      ?auto_4138 - OBJ
      ?auto_4135 - LOCATION
    )
    :vars
    (
      ?auto_4141 - LOCATION
      ?auto_4139 - CITY
      ?auto_4142 - LOCATION
      ?auto_4143 - LOCATION
      ?auto_4140 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4136 ?auto_4134 ) ( GREATER-THAN ?auto_4137 ?auto_4134 ) ( GREATER-THAN ?auto_4137 ?auto_4136 ) ( GREATER-THAN ?auto_4138 ?auto_4134 ) ( GREATER-THAN ?auto_4138 ?auto_4136 ) ( GREATER-THAN ?auto_4138 ?auto_4137 ) ( IN-CITY ?auto_4141 ?auto_4139 ) ( IN-CITY ?auto_4135 ?auto_4139 ) ( not ( = ?auto_4135 ?auto_4141 ) ) ( OBJ-AT ?auto_4138 ?auto_4141 ) ( not ( = ?auto_4134 ?auto_4136 ) ) ( not ( = ?auto_4134 ?auto_4137 ) ) ( not ( = ?auto_4134 ?auto_4138 ) ) ( not ( = ?auto_4136 ?auto_4137 ) ) ( not ( = ?auto_4136 ?auto_4138 ) ) ( not ( = ?auto_4137 ?auto_4138 ) ) ( IN-CITY ?auto_4142 ?auto_4139 ) ( not ( = ?auto_4135 ?auto_4142 ) ) ( not ( = ?auto_4141 ?auto_4142 ) ) ( OBJ-AT ?auto_4137 ?auto_4142 ) ( IN-CITY ?auto_4143 ?auto_4139 ) ( not ( = ?auto_4135 ?auto_4143 ) ) ( not ( = ?auto_4141 ?auto_4143 ) ) ( not ( = ?auto_4142 ?auto_4143 ) ) ( OBJ-AT ?auto_4136 ?auto_4143 ) ( IN-TRUCK ?auto_4134 ?auto_4140 ) ( TRUCK-AT ?auto_4140 ?auto_4141 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4140 ?auto_4141 ?auto_4135 ?auto_4139 )
      ( DELIVER-4PKG ?auto_4134 ?auto_4136 ?auto_4137 ?auto_4138 ?auto_4135 )
      ( DELIVER-4PKG-VERIFY ?auto_4134 ?auto_4136 ?auto_4137 ?auto_4138 ?auto_4135 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4149 - OBJ
      ?auto_4151 - OBJ
      ?auto_4152 - OBJ
      ?auto_4153 - OBJ
      ?auto_4150 - LOCATION
    )
    :vars
    (
      ?auto_4155 - LOCATION
      ?auto_4157 - CITY
      ?auto_4158 - LOCATION
      ?auto_4156 - LOCATION
      ?auto_4154 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4151 ?auto_4149 ) ( GREATER-THAN ?auto_4152 ?auto_4149 ) ( GREATER-THAN ?auto_4152 ?auto_4151 ) ( GREATER-THAN ?auto_4153 ?auto_4149 ) ( GREATER-THAN ?auto_4153 ?auto_4151 ) ( GREATER-THAN ?auto_4153 ?auto_4152 ) ( IN-CITY ?auto_4155 ?auto_4157 ) ( IN-CITY ?auto_4150 ?auto_4157 ) ( not ( = ?auto_4150 ?auto_4155 ) ) ( OBJ-AT ?auto_4153 ?auto_4155 ) ( not ( = ?auto_4149 ?auto_4151 ) ) ( not ( = ?auto_4149 ?auto_4152 ) ) ( not ( = ?auto_4149 ?auto_4153 ) ) ( not ( = ?auto_4151 ?auto_4152 ) ) ( not ( = ?auto_4151 ?auto_4153 ) ) ( not ( = ?auto_4152 ?auto_4153 ) ) ( IN-CITY ?auto_4158 ?auto_4157 ) ( not ( = ?auto_4150 ?auto_4158 ) ) ( not ( = ?auto_4155 ?auto_4158 ) ) ( OBJ-AT ?auto_4152 ?auto_4158 ) ( IN-CITY ?auto_4156 ?auto_4157 ) ( not ( = ?auto_4150 ?auto_4156 ) ) ( not ( = ?auto_4155 ?auto_4156 ) ) ( not ( = ?auto_4158 ?auto_4156 ) ) ( OBJ-AT ?auto_4151 ?auto_4156 ) ( TRUCK-AT ?auto_4154 ?auto_4155 ) ( OBJ-AT ?auto_4149 ?auto_4155 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4149 ?auto_4154 ?auto_4155 )
      ( DELIVER-4PKG ?auto_4149 ?auto_4151 ?auto_4152 ?auto_4153 ?auto_4150 )
      ( DELIVER-4PKG-VERIFY ?auto_4149 ?auto_4151 ?auto_4152 ?auto_4153 ?auto_4150 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4164 - OBJ
      ?auto_4166 - OBJ
      ?auto_4167 - OBJ
      ?auto_4168 - OBJ
      ?auto_4165 - LOCATION
    )
    :vars
    (
      ?auto_4169 - LOCATION
      ?auto_4170 - CITY
      ?auto_4171 - LOCATION
      ?auto_4173 - LOCATION
      ?auto_4172 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4166 ?auto_4164 ) ( GREATER-THAN ?auto_4167 ?auto_4164 ) ( GREATER-THAN ?auto_4167 ?auto_4166 ) ( GREATER-THAN ?auto_4168 ?auto_4164 ) ( GREATER-THAN ?auto_4168 ?auto_4166 ) ( GREATER-THAN ?auto_4168 ?auto_4167 ) ( IN-CITY ?auto_4169 ?auto_4170 ) ( IN-CITY ?auto_4165 ?auto_4170 ) ( not ( = ?auto_4165 ?auto_4169 ) ) ( OBJ-AT ?auto_4168 ?auto_4169 ) ( not ( = ?auto_4164 ?auto_4166 ) ) ( not ( = ?auto_4164 ?auto_4167 ) ) ( not ( = ?auto_4164 ?auto_4168 ) ) ( not ( = ?auto_4166 ?auto_4167 ) ) ( not ( = ?auto_4166 ?auto_4168 ) ) ( not ( = ?auto_4167 ?auto_4168 ) ) ( IN-CITY ?auto_4171 ?auto_4170 ) ( not ( = ?auto_4165 ?auto_4171 ) ) ( not ( = ?auto_4169 ?auto_4171 ) ) ( OBJ-AT ?auto_4167 ?auto_4171 ) ( IN-CITY ?auto_4173 ?auto_4170 ) ( not ( = ?auto_4165 ?auto_4173 ) ) ( not ( = ?auto_4169 ?auto_4173 ) ) ( not ( = ?auto_4171 ?auto_4173 ) ) ( OBJ-AT ?auto_4166 ?auto_4173 ) ( OBJ-AT ?auto_4164 ?auto_4169 ) ( TRUCK-AT ?auto_4172 ?auto_4165 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4172 ?auto_4165 ?auto_4169 ?auto_4170 )
      ( DELIVER-4PKG ?auto_4164 ?auto_4166 ?auto_4167 ?auto_4168 ?auto_4165 )
      ( DELIVER-4PKG-VERIFY ?auto_4164 ?auto_4166 ?auto_4167 ?auto_4168 ?auto_4165 ) )
  )

)

