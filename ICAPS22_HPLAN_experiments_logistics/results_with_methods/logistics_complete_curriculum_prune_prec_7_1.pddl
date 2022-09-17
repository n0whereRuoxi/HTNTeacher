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

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-7PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?obj7 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) ( OBJ-AT ?obj7 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3660 - OBJ
      ?auto_3661 - LOCATION
    )
    :vars
    (
      ?auto_3662 - TRUCK
      ?auto_3663 - LOCATION
      ?auto_3664 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3662 ?auto_3663 ) ( IN-CITY ?auto_3663 ?auto_3664 ) ( IN-CITY ?auto_3661 ?auto_3664 ) ( not ( = ?auto_3661 ?auto_3663 ) ) ( OBJ-AT ?auto_3660 ?auto_3663 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3660 ?auto_3662 ?auto_3663 )
      ( !DRIVE-TRUCK ?auto_3662 ?auto_3663 ?auto_3661 ?auto_3664 )
      ( !UNLOAD-TRUCK ?auto_3660 ?auto_3662 ?auto_3661 )
      ( DELIVER-1PKG-VERIFY ?auto_3660 ?auto_3661 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3667 - OBJ
      ?auto_3668 - LOCATION
    )
    :vars
    (
      ?auto_3669 - LOCATION
      ?auto_3670 - CITY
      ?auto_3671 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3669 ?auto_3670 ) ( IN-CITY ?auto_3668 ?auto_3670 ) ( not ( = ?auto_3668 ?auto_3669 ) ) ( OBJ-AT ?auto_3667 ?auto_3669 ) ( TRUCK-AT ?auto_3671 ?auto_3668 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3671 ?auto_3668 ?auto_3669 ?auto_3670 )
      ( DELIVER-1PKG ?auto_3667 ?auto_3668 )
      ( DELIVER-1PKG-VERIFY ?auto_3667 ?auto_3668 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3689 - OBJ
      ?auto_3691 - OBJ
      ?auto_3690 - LOCATION
    )
    :vars
    (
      ?auto_3694 - LOCATION
      ?auto_3693 - CITY
      ?auto_3692 - TRUCK
      ?auto_3695 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3691 ?auto_3689 ) ( IN-CITY ?auto_3694 ?auto_3693 ) ( IN-CITY ?auto_3690 ?auto_3693 ) ( not ( = ?auto_3690 ?auto_3694 ) ) ( OBJ-AT ?auto_3691 ?auto_3694 ) ( TRUCK-AT ?auto_3692 ?auto_3695 ) ( IN-CITY ?auto_3695 ?auto_3693 ) ( not ( = ?auto_3690 ?auto_3695 ) ) ( OBJ-AT ?auto_3689 ?auto_3695 ) ( not ( = ?auto_3689 ?auto_3691 ) ) ( not ( = ?auto_3694 ?auto_3695 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3689 ?auto_3690 )
      ( DELIVER-1PKG ?auto_3691 ?auto_3690 )
      ( DELIVER-2PKG-VERIFY ?auto_3689 ?auto_3691 ?auto_3690 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3699 - OBJ
      ?auto_3701 - OBJ
      ?auto_3700 - LOCATION
    )
    :vars
    (
      ?auto_3703 - LOCATION
      ?auto_3704 - CITY
      ?auto_3702 - LOCATION
      ?auto_3705 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3701 ?auto_3699 ) ( IN-CITY ?auto_3703 ?auto_3704 ) ( IN-CITY ?auto_3700 ?auto_3704 ) ( not ( = ?auto_3700 ?auto_3703 ) ) ( OBJ-AT ?auto_3701 ?auto_3703 ) ( IN-CITY ?auto_3702 ?auto_3704 ) ( not ( = ?auto_3700 ?auto_3702 ) ) ( OBJ-AT ?auto_3699 ?auto_3702 ) ( not ( = ?auto_3699 ?auto_3701 ) ) ( not ( = ?auto_3703 ?auto_3702 ) ) ( TRUCK-AT ?auto_3705 ?auto_3700 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3705 ?auto_3700 ?auto_3702 ?auto_3704 )
      ( DELIVER-2PKG ?auto_3699 ?auto_3701 ?auto_3700 )
      ( DELIVER-2PKG-VERIFY ?auto_3699 ?auto_3701 ?auto_3700 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3725 - OBJ
      ?auto_3727 - OBJ
      ?auto_3724 - OBJ
      ?auto_3726 - LOCATION
    )
    :vars
    (
      ?auto_3730 - LOCATION
      ?auto_3728 - CITY
      ?auto_3732 - LOCATION
      ?auto_3729 - TRUCK
      ?auto_3731 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3727 ?auto_3725 ) ( GREATER-THAN ?auto_3724 ?auto_3725 ) ( GREATER-THAN ?auto_3724 ?auto_3727 ) ( IN-CITY ?auto_3730 ?auto_3728 ) ( IN-CITY ?auto_3726 ?auto_3728 ) ( not ( = ?auto_3726 ?auto_3730 ) ) ( OBJ-AT ?auto_3724 ?auto_3730 ) ( IN-CITY ?auto_3732 ?auto_3728 ) ( not ( = ?auto_3726 ?auto_3732 ) ) ( OBJ-AT ?auto_3727 ?auto_3732 ) ( TRUCK-AT ?auto_3729 ?auto_3731 ) ( IN-CITY ?auto_3731 ?auto_3728 ) ( not ( = ?auto_3726 ?auto_3731 ) ) ( OBJ-AT ?auto_3725 ?auto_3731 ) ( not ( = ?auto_3725 ?auto_3727 ) ) ( not ( = ?auto_3732 ?auto_3731 ) ) ( not ( = ?auto_3725 ?auto_3724 ) ) ( not ( = ?auto_3727 ?auto_3724 ) ) ( not ( = ?auto_3730 ?auto_3732 ) ) ( not ( = ?auto_3730 ?auto_3731 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3725 ?auto_3727 ?auto_3726 )
      ( DELIVER-1PKG ?auto_3724 ?auto_3726 )
      ( DELIVER-3PKG-VERIFY ?auto_3725 ?auto_3727 ?auto_3724 ?auto_3726 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3738 - OBJ
      ?auto_3740 - OBJ
      ?auto_3737 - OBJ
      ?auto_3739 - LOCATION
    )
    :vars
    (
      ?auto_3745 - LOCATION
      ?auto_3744 - CITY
      ?auto_3743 - LOCATION
      ?auto_3741 - LOCATION
      ?auto_3742 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3740 ?auto_3738 ) ( GREATER-THAN ?auto_3737 ?auto_3738 ) ( GREATER-THAN ?auto_3737 ?auto_3740 ) ( IN-CITY ?auto_3745 ?auto_3744 ) ( IN-CITY ?auto_3739 ?auto_3744 ) ( not ( = ?auto_3739 ?auto_3745 ) ) ( OBJ-AT ?auto_3737 ?auto_3745 ) ( IN-CITY ?auto_3743 ?auto_3744 ) ( not ( = ?auto_3739 ?auto_3743 ) ) ( OBJ-AT ?auto_3740 ?auto_3743 ) ( IN-CITY ?auto_3741 ?auto_3744 ) ( not ( = ?auto_3739 ?auto_3741 ) ) ( OBJ-AT ?auto_3738 ?auto_3741 ) ( not ( = ?auto_3738 ?auto_3740 ) ) ( not ( = ?auto_3743 ?auto_3741 ) ) ( not ( = ?auto_3738 ?auto_3737 ) ) ( not ( = ?auto_3740 ?auto_3737 ) ) ( not ( = ?auto_3745 ?auto_3743 ) ) ( not ( = ?auto_3745 ?auto_3741 ) ) ( TRUCK-AT ?auto_3742 ?auto_3739 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3742 ?auto_3739 ?auto_3741 ?auto_3744 )
      ( DELIVER-3PKG ?auto_3738 ?auto_3740 ?auto_3737 ?auto_3739 )
      ( DELIVER-3PKG-VERIFY ?auto_3738 ?auto_3740 ?auto_3737 ?auto_3739 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3766 - OBJ
      ?auto_3768 - OBJ
      ?auto_3765 - OBJ
      ?auto_3769 - OBJ
      ?auto_3767 - LOCATION
    )
    :vars
    (
      ?auto_3771 - LOCATION
      ?auto_3772 - CITY
      ?auto_3775 - LOCATION
      ?auto_3774 - LOCATION
      ?auto_3770 - TRUCK
      ?auto_3773 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3768 ?auto_3766 ) ( GREATER-THAN ?auto_3765 ?auto_3766 ) ( GREATER-THAN ?auto_3765 ?auto_3768 ) ( GREATER-THAN ?auto_3769 ?auto_3766 ) ( GREATER-THAN ?auto_3769 ?auto_3768 ) ( GREATER-THAN ?auto_3769 ?auto_3765 ) ( IN-CITY ?auto_3771 ?auto_3772 ) ( IN-CITY ?auto_3767 ?auto_3772 ) ( not ( = ?auto_3767 ?auto_3771 ) ) ( OBJ-AT ?auto_3769 ?auto_3771 ) ( IN-CITY ?auto_3775 ?auto_3772 ) ( not ( = ?auto_3767 ?auto_3775 ) ) ( OBJ-AT ?auto_3765 ?auto_3775 ) ( IN-CITY ?auto_3774 ?auto_3772 ) ( not ( = ?auto_3767 ?auto_3774 ) ) ( OBJ-AT ?auto_3768 ?auto_3774 ) ( TRUCK-AT ?auto_3770 ?auto_3773 ) ( IN-CITY ?auto_3773 ?auto_3772 ) ( not ( = ?auto_3767 ?auto_3773 ) ) ( OBJ-AT ?auto_3766 ?auto_3773 ) ( not ( = ?auto_3766 ?auto_3768 ) ) ( not ( = ?auto_3774 ?auto_3773 ) ) ( not ( = ?auto_3766 ?auto_3765 ) ) ( not ( = ?auto_3768 ?auto_3765 ) ) ( not ( = ?auto_3775 ?auto_3774 ) ) ( not ( = ?auto_3775 ?auto_3773 ) ) ( not ( = ?auto_3766 ?auto_3769 ) ) ( not ( = ?auto_3768 ?auto_3769 ) ) ( not ( = ?auto_3765 ?auto_3769 ) ) ( not ( = ?auto_3771 ?auto_3775 ) ) ( not ( = ?auto_3771 ?auto_3774 ) ) ( not ( = ?auto_3771 ?auto_3773 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3766 ?auto_3768 ?auto_3765 ?auto_3767 )
      ( DELIVER-1PKG ?auto_3769 ?auto_3767 )
      ( DELIVER-4PKG-VERIFY ?auto_3766 ?auto_3768 ?auto_3765 ?auto_3769 ?auto_3767 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3782 - OBJ
      ?auto_3784 - OBJ
      ?auto_3781 - OBJ
      ?auto_3785 - OBJ
      ?auto_3783 - LOCATION
    )
    :vars
    (
      ?auto_3787 - LOCATION
      ?auto_3786 - CITY
      ?auto_3791 - LOCATION
      ?auto_3790 - LOCATION
      ?auto_3789 - LOCATION
      ?auto_3788 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3784 ?auto_3782 ) ( GREATER-THAN ?auto_3781 ?auto_3782 ) ( GREATER-THAN ?auto_3781 ?auto_3784 ) ( GREATER-THAN ?auto_3785 ?auto_3782 ) ( GREATER-THAN ?auto_3785 ?auto_3784 ) ( GREATER-THAN ?auto_3785 ?auto_3781 ) ( IN-CITY ?auto_3787 ?auto_3786 ) ( IN-CITY ?auto_3783 ?auto_3786 ) ( not ( = ?auto_3783 ?auto_3787 ) ) ( OBJ-AT ?auto_3785 ?auto_3787 ) ( IN-CITY ?auto_3791 ?auto_3786 ) ( not ( = ?auto_3783 ?auto_3791 ) ) ( OBJ-AT ?auto_3781 ?auto_3791 ) ( IN-CITY ?auto_3790 ?auto_3786 ) ( not ( = ?auto_3783 ?auto_3790 ) ) ( OBJ-AT ?auto_3784 ?auto_3790 ) ( IN-CITY ?auto_3789 ?auto_3786 ) ( not ( = ?auto_3783 ?auto_3789 ) ) ( OBJ-AT ?auto_3782 ?auto_3789 ) ( not ( = ?auto_3782 ?auto_3784 ) ) ( not ( = ?auto_3790 ?auto_3789 ) ) ( not ( = ?auto_3782 ?auto_3781 ) ) ( not ( = ?auto_3784 ?auto_3781 ) ) ( not ( = ?auto_3791 ?auto_3790 ) ) ( not ( = ?auto_3791 ?auto_3789 ) ) ( not ( = ?auto_3782 ?auto_3785 ) ) ( not ( = ?auto_3784 ?auto_3785 ) ) ( not ( = ?auto_3781 ?auto_3785 ) ) ( not ( = ?auto_3787 ?auto_3791 ) ) ( not ( = ?auto_3787 ?auto_3790 ) ) ( not ( = ?auto_3787 ?auto_3789 ) ) ( TRUCK-AT ?auto_3788 ?auto_3783 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3788 ?auto_3783 ?auto_3789 ?auto_3786 )
      ( DELIVER-4PKG ?auto_3782 ?auto_3784 ?auto_3781 ?auto_3785 ?auto_3783 )
      ( DELIVER-4PKG-VERIFY ?auto_3782 ?auto_3784 ?auto_3781 ?auto_3785 ?auto_3783 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3813 - OBJ
      ?auto_3815 - OBJ
      ?auto_3812 - OBJ
      ?auto_3816 - OBJ
      ?auto_3817 - OBJ
      ?auto_3814 - LOCATION
    )
    :vars
    (
      ?auto_3818 - LOCATION
      ?auto_3820 - CITY
      ?auto_3821 - LOCATION
      ?auto_3824 - LOCATION
      ?auto_3823 - LOCATION
      ?auto_3819 - TRUCK
      ?auto_3822 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3815 ?auto_3813 ) ( GREATER-THAN ?auto_3812 ?auto_3813 ) ( GREATER-THAN ?auto_3812 ?auto_3815 ) ( GREATER-THAN ?auto_3816 ?auto_3813 ) ( GREATER-THAN ?auto_3816 ?auto_3815 ) ( GREATER-THAN ?auto_3816 ?auto_3812 ) ( GREATER-THAN ?auto_3817 ?auto_3813 ) ( GREATER-THAN ?auto_3817 ?auto_3815 ) ( GREATER-THAN ?auto_3817 ?auto_3812 ) ( GREATER-THAN ?auto_3817 ?auto_3816 ) ( IN-CITY ?auto_3818 ?auto_3820 ) ( IN-CITY ?auto_3814 ?auto_3820 ) ( not ( = ?auto_3814 ?auto_3818 ) ) ( OBJ-AT ?auto_3817 ?auto_3818 ) ( IN-CITY ?auto_3821 ?auto_3820 ) ( not ( = ?auto_3814 ?auto_3821 ) ) ( OBJ-AT ?auto_3816 ?auto_3821 ) ( IN-CITY ?auto_3824 ?auto_3820 ) ( not ( = ?auto_3814 ?auto_3824 ) ) ( OBJ-AT ?auto_3812 ?auto_3824 ) ( IN-CITY ?auto_3823 ?auto_3820 ) ( not ( = ?auto_3814 ?auto_3823 ) ) ( OBJ-AT ?auto_3815 ?auto_3823 ) ( TRUCK-AT ?auto_3819 ?auto_3822 ) ( IN-CITY ?auto_3822 ?auto_3820 ) ( not ( = ?auto_3814 ?auto_3822 ) ) ( OBJ-AT ?auto_3813 ?auto_3822 ) ( not ( = ?auto_3813 ?auto_3815 ) ) ( not ( = ?auto_3823 ?auto_3822 ) ) ( not ( = ?auto_3813 ?auto_3812 ) ) ( not ( = ?auto_3815 ?auto_3812 ) ) ( not ( = ?auto_3824 ?auto_3823 ) ) ( not ( = ?auto_3824 ?auto_3822 ) ) ( not ( = ?auto_3813 ?auto_3816 ) ) ( not ( = ?auto_3815 ?auto_3816 ) ) ( not ( = ?auto_3812 ?auto_3816 ) ) ( not ( = ?auto_3821 ?auto_3824 ) ) ( not ( = ?auto_3821 ?auto_3823 ) ) ( not ( = ?auto_3821 ?auto_3822 ) ) ( not ( = ?auto_3813 ?auto_3817 ) ) ( not ( = ?auto_3815 ?auto_3817 ) ) ( not ( = ?auto_3812 ?auto_3817 ) ) ( not ( = ?auto_3816 ?auto_3817 ) ) ( not ( = ?auto_3818 ?auto_3821 ) ) ( not ( = ?auto_3818 ?auto_3824 ) ) ( not ( = ?auto_3818 ?auto_3823 ) ) ( not ( = ?auto_3818 ?auto_3822 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3813 ?auto_3815 ?auto_3812 ?auto_3816 ?auto_3814 )
      ( DELIVER-1PKG ?auto_3817 ?auto_3814 )
      ( DELIVER-5PKG-VERIFY ?auto_3813 ?auto_3815 ?auto_3812 ?auto_3816 ?auto_3817 ?auto_3814 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3832 - OBJ
      ?auto_3834 - OBJ
      ?auto_3831 - OBJ
      ?auto_3835 - OBJ
      ?auto_3836 - OBJ
      ?auto_3833 - LOCATION
    )
    :vars
    (
      ?auto_3838 - LOCATION
      ?auto_3837 - CITY
      ?auto_3841 - LOCATION
      ?auto_3842 - LOCATION
      ?auto_3839 - LOCATION
      ?auto_3843 - LOCATION
      ?auto_3840 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3834 ?auto_3832 ) ( GREATER-THAN ?auto_3831 ?auto_3832 ) ( GREATER-THAN ?auto_3831 ?auto_3834 ) ( GREATER-THAN ?auto_3835 ?auto_3832 ) ( GREATER-THAN ?auto_3835 ?auto_3834 ) ( GREATER-THAN ?auto_3835 ?auto_3831 ) ( GREATER-THAN ?auto_3836 ?auto_3832 ) ( GREATER-THAN ?auto_3836 ?auto_3834 ) ( GREATER-THAN ?auto_3836 ?auto_3831 ) ( GREATER-THAN ?auto_3836 ?auto_3835 ) ( IN-CITY ?auto_3838 ?auto_3837 ) ( IN-CITY ?auto_3833 ?auto_3837 ) ( not ( = ?auto_3833 ?auto_3838 ) ) ( OBJ-AT ?auto_3836 ?auto_3838 ) ( IN-CITY ?auto_3841 ?auto_3837 ) ( not ( = ?auto_3833 ?auto_3841 ) ) ( OBJ-AT ?auto_3835 ?auto_3841 ) ( IN-CITY ?auto_3842 ?auto_3837 ) ( not ( = ?auto_3833 ?auto_3842 ) ) ( OBJ-AT ?auto_3831 ?auto_3842 ) ( IN-CITY ?auto_3839 ?auto_3837 ) ( not ( = ?auto_3833 ?auto_3839 ) ) ( OBJ-AT ?auto_3834 ?auto_3839 ) ( IN-CITY ?auto_3843 ?auto_3837 ) ( not ( = ?auto_3833 ?auto_3843 ) ) ( OBJ-AT ?auto_3832 ?auto_3843 ) ( not ( = ?auto_3832 ?auto_3834 ) ) ( not ( = ?auto_3839 ?auto_3843 ) ) ( not ( = ?auto_3832 ?auto_3831 ) ) ( not ( = ?auto_3834 ?auto_3831 ) ) ( not ( = ?auto_3842 ?auto_3839 ) ) ( not ( = ?auto_3842 ?auto_3843 ) ) ( not ( = ?auto_3832 ?auto_3835 ) ) ( not ( = ?auto_3834 ?auto_3835 ) ) ( not ( = ?auto_3831 ?auto_3835 ) ) ( not ( = ?auto_3841 ?auto_3842 ) ) ( not ( = ?auto_3841 ?auto_3839 ) ) ( not ( = ?auto_3841 ?auto_3843 ) ) ( not ( = ?auto_3832 ?auto_3836 ) ) ( not ( = ?auto_3834 ?auto_3836 ) ) ( not ( = ?auto_3831 ?auto_3836 ) ) ( not ( = ?auto_3835 ?auto_3836 ) ) ( not ( = ?auto_3838 ?auto_3841 ) ) ( not ( = ?auto_3838 ?auto_3842 ) ) ( not ( = ?auto_3838 ?auto_3839 ) ) ( not ( = ?auto_3838 ?auto_3843 ) ) ( TRUCK-AT ?auto_3840 ?auto_3833 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3840 ?auto_3833 ?auto_3843 ?auto_3837 )
      ( DELIVER-5PKG ?auto_3832 ?auto_3834 ?auto_3831 ?auto_3835 ?auto_3836 ?auto_3833 )
      ( DELIVER-5PKG-VERIFY ?auto_3832 ?auto_3834 ?auto_3831 ?auto_3835 ?auto_3836 ?auto_3833 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3866 - OBJ
      ?auto_3868 - OBJ
      ?auto_3865 - OBJ
      ?auto_3869 - OBJ
      ?auto_3871 - OBJ
      ?auto_3870 - OBJ
      ?auto_3867 - LOCATION
    )
    :vars
    (
      ?auto_3872 - LOCATION
      ?auto_3873 - CITY
      ?auto_3875 - LOCATION
      ?auto_3877 - LOCATION
      ?auto_3878 - LOCATION
      ?auto_3876 - LOCATION
      ?auto_3874 - TRUCK
      ?auto_3879 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3868 ?auto_3866 ) ( GREATER-THAN ?auto_3865 ?auto_3866 ) ( GREATER-THAN ?auto_3865 ?auto_3868 ) ( GREATER-THAN ?auto_3869 ?auto_3866 ) ( GREATER-THAN ?auto_3869 ?auto_3868 ) ( GREATER-THAN ?auto_3869 ?auto_3865 ) ( GREATER-THAN ?auto_3871 ?auto_3866 ) ( GREATER-THAN ?auto_3871 ?auto_3868 ) ( GREATER-THAN ?auto_3871 ?auto_3865 ) ( GREATER-THAN ?auto_3871 ?auto_3869 ) ( GREATER-THAN ?auto_3870 ?auto_3866 ) ( GREATER-THAN ?auto_3870 ?auto_3868 ) ( GREATER-THAN ?auto_3870 ?auto_3865 ) ( GREATER-THAN ?auto_3870 ?auto_3869 ) ( GREATER-THAN ?auto_3870 ?auto_3871 ) ( IN-CITY ?auto_3872 ?auto_3873 ) ( IN-CITY ?auto_3867 ?auto_3873 ) ( not ( = ?auto_3867 ?auto_3872 ) ) ( OBJ-AT ?auto_3870 ?auto_3872 ) ( IN-CITY ?auto_3875 ?auto_3873 ) ( not ( = ?auto_3867 ?auto_3875 ) ) ( OBJ-AT ?auto_3871 ?auto_3875 ) ( IN-CITY ?auto_3877 ?auto_3873 ) ( not ( = ?auto_3867 ?auto_3877 ) ) ( OBJ-AT ?auto_3869 ?auto_3877 ) ( IN-CITY ?auto_3878 ?auto_3873 ) ( not ( = ?auto_3867 ?auto_3878 ) ) ( OBJ-AT ?auto_3865 ?auto_3878 ) ( IN-CITY ?auto_3876 ?auto_3873 ) ( not ( = ?auto_3867 ?auto_3876 ) ) ( OBJ-AT ?auto_3868 ?auto_3876 ) ( TRUCK-AT ?auto_3874 ?auto_3879 ) ( IN-CITY ?auto_3879 ?auto_3873 ) ( not ( = ?auto_3867 ?auto_3879 ) ) ( OBJ-AT ?auto_3866 ?auto_3879 ) ( not ( = ?auto_3866 ?auto_3868 ) ) ( not ( = ?auto_3876 ?auto_3879 ) ) ( not ( = ?auto_3866 ?auto_3865 ) ) ( not ( = ?auto_3868 ?auto_3865 ) ) ( not ( = ?auto_3878 ?auto_3876 ) ) ( not ( = ?auto_3878 ?auto_3879 ) ) ( not ( = ?auto_3866 ?auto_3869 ) ) ( not ( = ?auto_3868 ?auto_3869 ) ) ( not ( = ?auto_3865 ?auto_3869 ) ) ( not ( = ?auto_3877 ?auto_3878 ) ) ( not ( = ?auto_3877 ?auto_3876 ) ) ( not ( = ?auto_3877 ?auto_3879 ) ) ( not ( = ?auto_3866 ?auto_3871 ) ) ( not ( = ?auto_3868 ?auto_3871 ) ) ( not ( = ?auto_3865 ?auto_3871 ) ) ( not ( = ?auto_3869 ?auto_3871 ) ) ( not ( = ?auto_3875 ?auto_3877 ) ) ( not ( = ?auto_3875 ?auto_3878 ) ) ( not ( = ?auto_3875 ?auto_3876 ) ) ( not ( = ?auto_3875 ?auto_3879 ) ) ( not ( = ?auto_3866 ?auto_3870 ) ) ( not ( = ?auto_3868 ?auto_3870 ) ) ( not ( = ?auto_3865 ?auto_3870 ) ) ( not ( = ?auto_3869 ?auto_3870 ) ) ( not ( = ?auto_3871 ?auto_3870 ) ) ( not ( = ?auto_3872 ?auto_3875 ) ) ( not ( = ?auto_3872 ?auto_3877 ) ) ( not ( = ?auto_3872 ?auto_3878 ) ) ( not ( = ?auto_3872 ?auto_3876 ) ) ( not ( = ?auto_3872 ?auto_3879 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3866 ?auto_3868 ?auto_3865 ?auto_3869 ?auto_3871 ?auto_3867 )
      ( DELIVER-1PKG ?auto_3870 ?auto_3867 )
      ( DELIVER-6PKG-VERIFY ?auto_3866 ?auto_3868 ?auto_3865 ?auto_3869 ?auto_3871 ?auto_3870 ?auto_3867 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3888 - OBJ
      ?auto_3890 - OBJ
      ?auto_3887 - OBJ
      ?auto_3891 - OBJ
      ?auto_3893 - OBJ
      ?auto_3892 - OBJ
      ?auto_3889 - LOCATION
    )
    :vars
    (
      ?auto_3898 - LOCATION
      ?auto_3899 - CITY
      ?auto_3900 - LOCATION
      ?auto_3897 - LOCATION
      ?auto_3896 - LOCATION
      ?auto_3895 - LOCATION
      ?auto_3901 - LOCATION
      ?auto_3894 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3890 ?auto_3888 ) ( GREATER-THAN ?auto_3887 ?auto_3888 ) ( GREATER-THAN ?auto_3887 ?auto_3890 ) ( GREATER-THAN ?auto_3891 ?auto_3888 ) ( GREATER-THAN ?auto_3891 ?auto_3890 ) ( GREATER-THAN ?auto_3891 ?auto_3887 ) ( GREATER-THAN ?auto_3893 ?auto_3888 ) ( GREATER-THAN ?auto_3893 ?auto_3890 ) ( GREATER-THAN ?auto_3893 ?auto_3887 ) ( GREATER-THAN ?auto_3893 ?auto_3891 ) ( GREATER-THAN ?auto_3892 ?auto_3888 ) ( GREATER-THAN ?auto_3892 ?auto_3890 ) ( GREATER-THAN ?auto_3892 ?auto_3887 ) ( GREATER-THAN ?auto_3892 ?auto_3891 ) ( GREATER-THAN ?auto_3892 ?auto_3893 ) ( IN-CITY ?auto_3898 ?auto_3899 ) ( IN-CITY ?auto_3889 ?auto_3899 ) ( not ( = ?auto_3889 ?auto_3898 ) ) ( OBJ-AT ?auto_3892 ?auto_3898 ) ( IN-CITY ?auto_3900 ?auto_3899 ) ( not ( = ?auto_3889 ?auto_3900 ) ) ( OBJ-AT ?auto_3893 ?auto_3900 ) ( IN-CITY ?auto_3897 ?auto_3899 ) ( not ( = ?auto_3889 ?auto_3897 ) ) ( OBJ-AT ?auto_3891 ?auto_3897 ) ( IN-CITY ?auto_3896 ?auto_3899 ) ( not ( = ?auto_3889 ?auto_3896 ) ) ( OBJ-AT ?auto_3887 ?auto_3896 ) ( IN-CITY ?auto_3895 ?auto_3899 ) ( not ( = ?auto_3889 ?auto_3895 ) ) ( OBJ-AT ?auto_3890 ?auto_3895 ) ( IN-CITY ?auto_3901 ?auto_3899 ) ( not ( = ?auto_3889 ?auto_3901 ) ) ( OBJ-AT ?auto_3888 ?auto_3901 ) ( not ( = ?auto_3888 ?auto_3890 ) ) ( not ( = ?auto_3895 ?auto_3901 ) ) ( not ( = ?auto_3888 ?auto_3887 ) ) ( not ( = ?auto_3890 ?auto_3887 ) ) ( not ( = ?auto_3896 ?auto_3895 ) ) ( not ( = ?auto_3896 ?auto_3901 ) ) ( not ( = ?auto_3888 ?auto_3891 ) ) ( not ( = ?auto_3890 ?auto_3891 ) ) ( not ( = ?auto_3887 ?auto_3891 ) ) ( not ( = ?auto_3897 ?auto_3896 ) ) ( not ( = ?auto_3897 ?auto_3895 ) ) ( not ( = ?auto_3897 ?auto_3901 ) ) ( not ( = ?auto_3888 ?auto_3893 ) ) ( not ( = ?auto_3890 ?auto_3893 ) ) ( not ( = ?auto_3887 ?auto_3893 ) ) ( not ( = ?auto_3891 ?auto_3893 ) ) ( not ( = ?auto_3900 ?auto_3897 ) ) ( not ( = ?auto_3900 ?auto_3896 ) ) ( not ( = ?auto_3900 ?auto_3895 ) ) ( not ( = ?auto_3900 ?auto_3901 ) ) ( not ( = ?auto_3888 ?auto_3892 ) ) ( not ( = ?auto_3890 ?auto_3892 ) ) ( not ( = ?auto_3887 ?auto_3892 ) ) ( not ( = ?auto_3891 ?auto_3892 ) ) ( not ( = ?auto_3893 ?auto_3892 ) ) ( not ( = ?auto_3898 ?auto_3900 ) ) ( not ( = ?auto_3898 ?auto_3897 ) ) ( not ( = ?auto_3898 ?auto_3896 ) ) ( not ( = ?auto_3898 ?auto_3895 ) ) ( not ( = ?auto_3898 ?auto_3901 ) ) ( TRUCK-AT ?auto_3894 ?auto_3889 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3894 ?auto_3889 ?auto_3901 ?auto_3899 )
      ( DELIVER-6PKG ?auto_3888 ?auto_3890 ?auto_3887 ?auto_3891 ?auto_3893 ?auto_3892 ?auto_3889 )
      ( DELIVER-6PKG-VERIFY ?auto_3888 ?auto_3890 ?auto_3887 ?auto_3891 ?auto_3893 ?auto_3892 ?auto_3889 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_3925 - OBJ
      ?auto_3927 - OBJ
      ?auto_3924 - OBJ
      ?auto_3928 - OBJ
      ?auto_3930 - OBJ
      ?auto_3929 - OBJ
      ?auto_3931 - OBJ
      ?auto_3926 - LOCATION
    )
    :vars
    (
      ?auto_3932 - LOCATION
      ?auto_3933 - CITY
      ?auto_3938 - LOCATION
      ?auto_3937 - LOCATION
      ?auto_3936 - LOCATION
      ?auto_3935 - LOCATION
      ?auto_3934 - TRUCK
      ?auto_3939 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3927 ?auto_3925 ) ( GREATER-THAN ?auto_3924 ?auto_3925 ) ( GREATER-THAN ?auto_3924 ?auto_3927 ) ( GREATER-THAN ?auto_3928 ?auto_3925 ) ( GREATER-THAN ?auto_3928 ?auto_3927 ) ( GREATER-THAN ?auto_3928 ?auto_3924 ) ( GREATER-THAN ?auto_3930 ?auto_3925 ) ( GREATER-THAN ?auto_3930 ?auto_3927 ) ( GREATER-THAN ?auto_3930 ?auto_3924 ) ( GREATER-THAN ?auto_3930 ?auto_3928 ) ( GREATER-THAN ?auto_3929 ?auto_3925 ) ( GREATER-THAN ?auto_3929 ?auto_3927 ) ( GREATER-THAN ?auto_3929 ?auto_3924 ) ( GREATER-THAN ?auto_3929 ?auto_3928 ) ( GREATER-THAN ?auto_3929 ?auto_3930 ) ( GREATER-THAN ?auto_3931 ?auto_3925 ) ( GREATER-THAN ?auto_3931 ?auto_3927 ) ( GREATER-THAN ?auto_3931 ?auto_3924 ) ( GREATER-THAN ?auto_3931 ?auto_3928 ) ( GREATER-THAN ?auto_3931 ?auto_3930 ) ( GREATER-THAN ?auto_3931 ?auto_3929 ) ( IN-CITY ?auto_3932 ?auto_3933 ) ( IN-CITY ?auto_3926 ?auto_3933 ) ( not ( = ?auto_3926 ?auto_3932 ) ) ( OBJ-AT ?auto_3931 ?auto_3932 ) ( OBJ-AT ?auto_3929 ?auto_3932 ) ( IN-CITY ?auto_3938 ?auto_3933 ) ( not ( = ?auto_3926 ?auto_3938 ) ) ( OBJ-AT ?auto_3930 ?auto_3938 ) ( IN-CITY ?auto_3937 ?auto_3933 ) ( not ( = ?auto_3926 ?auto_3937 ) ) ( OBJ-AT ?auto_3928 ?auto_3937 ) ( IN-CITY ?auto_3936 ?auto_3933 ) ( not ( = ?auto_3926 ?auto_3936 ) ) ( OBJ-AT ?auto_3924 ?auto_3936 ) ( IN-CITY ?auto_3935 ?auto_3933 ) ( not ( = ?auto_3926 ?auto_3935 ) ) ( OBJ-AT ?auto_3927 ?auto_3935 ) ( TRUCK-AT ?auto_3934 ?auto_3939 ) ( IN-CITY ?auto_3939 ?auto_3933 ) ( not ( = ?auto_3926 ?auto_3939 ) ) ( OBJ-AT ?auto_3925 ?auto_3939 ) ( not ( = ?auto_3925 ?auto_3927 ) ) ( not ( = ?auto_3935 ?auto_3939 ) ) ( not ( = ?auto_3925 ?auto_3924 ) ) ( not ( = ?auto_3927 ?auto_3924 ) ) ( not ( = ?auto_3936 ?auto_3935 ) ) ( not ( = ?auto_3936 ?auto_3939 ) ) ( not ( = ?auto_3925 ?auto_3928 ) ) ( not ( = ?auto_3927 ?auto_3928 ) ) ( not ( = ?auto_3924 ?auto_3928 ) ) ( not ( = ?auto_3937 ?auto_3936 ) ) ( not ( = ?auto_3937 ?auto_3935 ) ) ( not ( = ?auto_3937 ?auto_3939 ) ) ( not ( = ?auto_3925 ?auto_3930 ) ) ( not ( = ?auto_3927 ?auto_3930 ) ) ( not ( = ?auto_3924 ?auto_3930 ) ) ( not ( = ?auto_3928 ?auto_3930 ) ) ( not ( = ?auto_3938 ?auto_3937 ) ) ( not ( = ?auto_3938 ?auto_3936 ) ) ( not ( = ?auto_3938 ?auto_3935 ) ) ( not ( = ?auto_3938 ?auto_3939 ) ) ( not ( = ?auto_3925 ?auto_3929 ) ) ( not ( = ?auto_3927 ?auto_3929 ) ) ( not ( = ?auto_3924 ?auto_3929 ) ) ( not ( = ?auto_3928 ?auto_3929 ) ) ( not ( = ?auto_3930 ?auto_3929 ) ) ( not ( = ?auto_3932 ?auto_3938 ) ) ( not ( = ?auto_3932 ?auto_3937 ) ) ( not ( = ?auto_3932 ?auto_3936 ) ) ( not ( = ?auto_3932 ?auto_3935 ) ) ( not ( = ?auto_3932 ?auto_3939 ) ) ( not ( = ?auto_3925 ?auto_3931 ) ) ( not ( = ?auto_3927 ?auto_3931 ) ) ( not ( = ?auto_3924 ?auto_3931 ) ) ( not ( = ?auto_3928 ?auto_3931 ) ) ( not ( = ?auto_3930 ?auto_3931 ) ) ( not ( = ?auto_3929 ?auto_3931 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3925 ?auto_3927 ?auto_3924 ?auto_3928 ?auto_3930 ?auto_3929 ?auto_3926 )
      ( DELIVER-1PKG ?auto_3931 ?auto_3926 )
      ( DELIVER-7PKG-VERIFY ?auto_3925 ?auto_3927 ?auto_3924 ?auto_3928 ?auto_3930 ?auto_3929 ?auto_3931 ?auto_3926 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_3949 - OBJ
      ?auto_3951 - OBJ
      ?auto_3948 - OBJ
      ?auto_3952 - OBJ
      ?auto_3954 - OBJ
      ?auto_3953 - OBJ
      ?auto_3955 - OBJ
      ?auto_3950 - LOCATION
    )
    :vars
    (
      ?auto_3957 - LOCATION
      ?auto_3962 - CITY
      ?auto_3958 - LOCATION
      ?auto_3960 - LOCATION
      ?auto_3959 - LOCATION
      ?auto_3963 - LOCATION
      ?auto_3961 - LOCATION
      ?auto_3956 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3951 ?auto_3949 ) ( GREATER-THAN ?auto_3948 ?auto_3949 ) ( GREATER-THAN ?auto_3948 ?auto_3951 ) ( GREATER-THAN ?auto_3952 ?auto_3949 ) ( GREATER-THAN ?auto_3952 ?auto_3951 ) ( GREATER-THAN ?auto_3952 ?auto_3948 ) ( GREATER-THAN ?auto_3954 ?auto_3949 ) ( GREATER-THAN ?auto_3954 ?auto_3951 ) ( GREATER-THAN ?auto_3954 ?auto_3948 ) ( GREATER-THAN ?auto_3954 ?auto_3952 ) ( GREATER-THAN ?auto_3953 ?auto_3949 ) ( GREATER-THAN ?auto_3953 ?auto_3951 ) ( GREATER-THAN ?auto_3953 ?auto_3948 ) ( GREATER-THAN ?auto_3953 ?auto_3952 ) ( GREATER-THAN ?auto_3953 ?auto_3954 ) ( GREATER-THAN ?auto_3955 ?auto_3949 ) ( GREATER-THAN ?auto_3955 ?auto_3951 ) ( GREATER-THAN ?auto_3955 ?auto_3948 ) ( GREATER-THAN ?auto_3955 ?auto_3952 ) ( GREATER-THAN ?auto_3955 ?auto_3954 ) ( GREATER-THAN ?auto_3955 ?auto_3953 ) ( IN-CITY ?auto_3957 ?auto_3962 ) ( IN-CITY ?auto_3950 ?auto_3962 ) ( not ( = ?auto_3950 ?auto_3957 ) ) ( OBJ-AT ?auto_3955 ?auto_3957 ) ( OBJ-AT ?auto_3953 ?auto_3957 ) ( IN-CITY ?auto_3958 ?auto_3962 ) ( not ( = ?auto_3950 ?auto_3958 ) ) ( OBJ-AT ?auto_3954 ?auto_3958 ) ( IN-CITY ?auto_3960 ?auto_3962 ) ( not ( = ?auto_3950 ?auto_3960 ) ) ( OBJ-AT ?auto_3952 ?auto_3960 ) ( IN-CITY ?auto_3959 ?auto_3962 ) ( not ( = ?auto_3950 ?auto_3959 ) ) ( OBJ-AT ?auto_3948 ?auto_3959 ) ( IN-CITY ?auto_3963 ?auto_3962 ) ( not ( = ?auto_3950 ?auto_3963 ) ) ( OBJ-AT ?auto_3951 ?auto_3963 ) ( IN-CITY ?auto_3961 ?auto_3962 ) ( not ( = ?auto_3950 ?auto_3961 ) ) ( OBJ-AT ?auto_3949 ?auto_3961 ) ( not ( = ?auto_3949 ?auto_3951 ) ) ( not ( = ?auto_3963 ?auto_3961 ) ) ( not ( = ?auto_3949 ?auto_3948 ) ) ( not ( = ?auto_3951 ?auto_3948 ) ) ( not ( = ?auto_3959 ?auto_3963 ) ) ( not ( = ?auto_3959 ?auto_3961 ) ) ( not ( = ?auto_3949 ?auto_3952 ) ) ( not ( = ?auto_3951 ?auto_3952 ) ) ( not ( = ?auto_3948 ?auto_3952 ) ) ( not ( = ?auto_3960 ?auto_3959 ) ) ( not ( = ?auto_3960 ?auto_3963 ) ) ( not ( = ?auto_3960 ?auto_3961 ) ) ( not ( = ?auto_3949 ?auto_3954 ) ) ( not ( = ?auto_3951 ?auto_3954 ) ) ( not ( = ?auto_3948 ?auto_3954 ) ) ( not ( = ?auto_3952 ?auto_3954 ) ) ( not ( = ?auto_3958 ?auto_3960 ) ) ( not ( = ?auto_3958 ?auto_3959 ) ) ( not ( = ?auto_3958 ?auto_3963 ) ) ( not ( = ?auto_3958 ?auto_3961 ) ) ( not ( = ?auto_3949 ?auto_3953 ) ) ( not ( = ?auto_3951 ?auto_3953 ) ) ( not ( = ?auto_3948 ?auto_3953 ) ) ( not ( = ?auto_3952 ?auto_3953 ) ) ( not ( = ?auto_3954 ?auto_3953 ) ) ( not ( = ?auto_3957 ?auto_3958 ) ) ( not ( = ?auto_3957 ?auto_3960 ) ) ( not ( = ?auto_3957 ?auto_3959 ) ) ( not ( = ?auto_3957 ?auto_3963 ) ) ( not ( = ?auto_3957 ?auto_3961 ) ) ( not ( = ?auto_3949 ?auto_3955 ) ) ( not ( = ?auto_3951 ?auto_3955 ) ) ( not ( = ?auto_3948 ?auto_3955 ) ) ( not ( = ?auto_3952 ?auto_3955 ) ) ( not ( = ?auto_3954 ?auto_3955 ) ) ( not ( = ?auto_3953 ?auto_3955 ) ) ( TRUCK-AT ?auto_3956 ?auto_3950 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3956 ?auto_3950 ?auto_3961 ?auto_3962 )
      ( DELIVER-7PKG ?auto_3949 ?auto_3951 ?auto_3948 ?auto_3952 ?auto_3954 ?auto_3953 ?auto_3955 ?auto_3950 )
      ( DELIVER-7PKG-VERIFY ?auto_3949 ?auto_3951 ?auto_3948 ?auto_3952 ?auto_3954 ?auto_3953 ?auto_3955 ?auto_3950 ) )
  )

)

