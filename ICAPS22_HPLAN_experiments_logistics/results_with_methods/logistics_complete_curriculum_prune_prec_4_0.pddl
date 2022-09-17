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
      ?auto_3527 - OBJ
      ?auto_3528 - LOCATION
    )
    :vars
    (
      ?auto_3529 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3529 ?auto_3528 ) ( IN-TRUCK ?auto_3527 ?auto_3529 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_3527 ?auto_3529 ?auto_3528 )
      ( DELIVER-1PKG-VERIFY ?auto_3527 ?auto_3528 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3534 - OBJ
      ?auto_3535 - LOCATION
    )
    :vars
    (
      ?auto_3538 - TRUCK
      ?auto_3540 - LOCATION
      ?auto_3541 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_3534 ?auto_3538 ) ( TRUCK-AT ?auto_3538 ?auto_3540 ) ( IN-CITY ?auto_3540 ?auto_3541 ) ( IN-CITY ?auto_3535 ?auto_3541 ) ( not ( = ?auto_3535 ?auto_3540 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3538 ?auto_3540 ?auto_3535 ?auto_3541 )
      ( DELIVER-1PKG ?auto_3534 ?auto_3535 )
      ( DELIVER-1PKG-VERIFY ?auto_3534 ?auto_3535 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3545 - OBJ
      ?auto_3546 - LOCATION
    )
    :vars
    (
      ?auto_3547 - TRUCK
      ?auto_3550 - LOCATION
      ?auto_3551 - CITY
      ?auto_3553 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3547 ?auto_3550 ) ( IN-CITY ?auto_3550 ?auto_3551 ) ( IN-CITY ?auto_3546 ?auto_3551 ) ( not ( = ?auto_3546 ?auto_3550 ) ) ( TRUCK-AT ?auto_3547 ?auto_3553 ) ( OBJ-AT ?auto_3545 ?auto_3553 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3545 ?auto_3547 ?auto_3553 )
      ( DELIVER-1PKG ?auto_3545 ?auto_3546 )
      ( DELIVER-1PKG-VERIFY ?auto_3545 ?auto_3546 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3557 - OBJ
      ?auto_3558 - LOCATION
    )
    :vars
    (
      ?auto_3562 - LOCATION
      ?auto_3563 - CITY
      ?auto_3560 - TRUCK
      ?auto_3566 - LOCATION
      ?auto_3567 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_3562 ?auto_3563 ) ( IN-CITY ?auto_3558 ?auto_3563 ) ( not ( = ?auto_3558 ?auto_3562 ) ) ( OBJ-AT ?auto_3557 ?auto_3562 ) ( TRUCK-AT ?auto_3560 ?auto_3566 ) ( IN-CITY ?auto_3566 ?auto_3567 ) ( IN-CITY ?auto_3562 ?auto_3567 ) ( not ( = ?auto_3562 ?auto_3566 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3560 ?auto_3566 ?auto_3562 ?auto_3567 )
      ( DELIVER-1PKG ?auto_3557 ?auto_3558 )
      ( DELIVER-1PKG-VERIFY ?auto_3557 ?auto_3558 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3616 - OBJ
      ?auto_3618 - OBJ
      ?auto_3617 - LOCATION
    )
    :vars
    (
      ?auto_3619 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3618 ?auto_3616 ) ( TRUCK-AT ?auto_3619 ?auto_3617 ) ( IN-TRUCK ?auto_3618 ?auto_3619 ) ( OBJ-AT ?auto_3616 ?auto_3617 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3618 ?auto_3617 )
      ( DELIVER-2PKG-VERIFY ?auto_3616 ?auto_3618 ?auto_3617 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3625 - OBJ
      ?auto_3627 - OBJ
      ?auto_3626 - LOCATION
    )
    :vars
    (
      ?auto_3628 - TRUCK
      ?auto_3631 - LOCATION
      ?auto_3629 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3627 ?auto_3625 ) ( IN-TRUCK ?auto_3627 ?auto_3628 ) ( TRUCK-AT ?auto_3628 ?auto_3631 ) ( IN-CITY ?auto_3631 ?auto_3629 ) ( IN-CITY ?auto_3626 ?auto_3629 ) ( not ( = ?auto_3626 ?auto_3631 ) ) ( OBJ-AT ?auto_3625 ?auto_3626 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3627 ?auto_3626 )
      ( DELIVER-2PKG-VERIFY ?auto_3625 ?auto_3627 ?auto_3626 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3636 - OBJ
      ?auto_3638 - OBJ
      ?auto_3637 - LOCATION
    )
    :vars
    (
      ?auto_3643 - TRUCK
      ?auto_3639 - LOCATION
      ?auto_3644 - CITY
      ?auto_3641 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3638 ?auto_3636 ) ( TRUCK-AT ?auto_3643 ?auto_3639 ) ( IN-CITY ?auto_3639 ?auto_3644 ) ( IN-CITY ?auto_3637 ?auto_3644 ) ( not ( = ?auto_3637 ?auto_3639 ) ) ( TRUCK-AT ?auto_3643 ?auto_3641 ) ( OBJ-AT ?auto_3638 ?auto_3641 ) ( OBJ-AT ?auto_3636 ?auto_3637 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3638 ?auto_3637 )
      ( DELIVER-2PKG-VERIFY ?auto_3636 ?auto_3638 ?auto_3637 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3648 - OBJ
      ?auto_3650 - OBJ
      ?auto_3649 - LOCATION
    )
    :vars
    (
      ?auto_3652 - LOCATION
      ?auto_3651 - CITY
      ?auto_3653 - TRUCK
      ?auto_3655 - LOCATION
      ?auto_3656 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3650 ?auto_3648 ) ( IN-CITY ?auto_3652 ?auto_3651 ) ( IN-CITY ?auto_3649 ?auto_3651 ) ( not ( = ?auto_3649 ?auto_3652 ) ) ( OBJ-AT ?auto_3650 ?auto_3652 ) ( TRUCK-AT ?auto_3653 ?auto_3655 ) ( IN-CITY ?auto_3655 ?auto_3656 ) ( IN-CITY ?auto_3652 ?auto_3656 ) ( not ( = ?auto_3652 ?auto_3655 ) ) ( OBJ-AT ?auto_3648 ?auto_3649 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3650 ?auto_3649 )
      ( DELIVER-2PKG-VERIFY ?auto_3648 ?auto_3650 ?auto_3649 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3664 - OBJ
      ?auto_3663 - OBJ
      ?auto_3662 - LOCATION
    )
    :vars
    (
      ?auto_3668 - LOCATION
      ?auto_3669 - CITY
      ?auto_3670 - TRUCK
      ?auto_3671 - LOCATION
      ?auto_3666 - CITY
      ?auto_3674 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3663 ?auto_3664 ) ( IN-CITY ?auto_3668 ?auto_3669 ) ( IN-CITY ?auto_3662 ?auto_3669 ) ( not ( = ?auto_3662 ?auto_3668 ) ) ( OBJ-AT ?auto_3663 ?auto_3668 ) ( TRUCK-AT ?auto_3670 ?auto_3671 ) ( IN-CITY ?auto_3671 ?auto_3666 ) ( IN-CITY ?auto_3668 ?auto_3666 ) ( not ( = ?auto_3668 ?auto_3671 ) ) ( TRUCK-AT ?auto_3674 ?auto_3662 ) ( IN-TRUCK ?auto_3664 ?auto_3674 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3664 ?auto_3662 )
      ( DELIVER-2PKG ?auto_3664 ?auto_3663 ?auto_3662 )
      ( DELIVER-2PKG-VERIFY ?auto_3664 ?auto_3663 ?auto_3662 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3678 - OBJ
      ?auto_3680 - OBJ
      ?auto_3679 - LOCATION
    )
    :vars
    (
      ?auto_3689 - LOCATION
      ?auto_3686 - CITY
      ?auto_3684 - CITY
      ?auto_3685 - TRUCK
      ?auto_3691 - LOCATION
      ?auto_3692 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3680 ?auto_3678 ) ( IN-CITY ?auto_3689 ?auto_3686 ) ( IN-CITY ?auto_3679 ?auto_3686 ) ( not ( = ?auto_3679 ?auto_3689 ) ) ( OBJ-AT ?auto_3680 ?auto_3689 ) ( IN-CITY ?auto_3679 ?auto_3684 ) ( IN-CITY ?auto_3689 ?auto_3684 ) ( IN-TRUCK ?auto_3678 ?auto_3685 ) ( TRUCK-AT ?auto_3685 ?auto_3691 ) ( IN-CITY ?auto_3691 ?auto_3692 ) ( IN-CITY ?auto_3679 ?auto_3692 ) ( not ( = ?auto_3679 ?auto_3691 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3685 ?auto_3691 ?auto_3679 ?auto_3692 )
      ( DELIVER-2PKG ?auto_3678 ?auto_3680 ?auto_3679 )
      ( DELIVER-2PKG-VERIFY ?auto_3678 ?auto_3680 ?auto_3679 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3697 - OBJ
      ?auto_3699 - OBJ
      ?auto_3698 - LOCATION
    )
    :vars
    (
      ?auto_3707 - LOCATION
      ?auto_3702 - CITY
      ?auto_3703 - CITY
      ?auto_3706 - TRUCK
      ?auto_3701 - LOCATION
      ?auto_3700 - CITY
      ?auto_3710 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3699 ?auto_3697 ) ( IN-CITY ?auto_3707 ?auto_3702 ) ( IN-CITY ?auto_3698 ?auto_3702 ) ( not ( = ?auto_3698 ?auto_3707 ) ) ( OBJ-AT ?auto_3699 ?auto_3707 ) ( IN-CITY ?auto_3698 ?auto_3703 ) ( IN-CITY ?auto_3707 ?auto_3703 ) ( TRUCK-AT ?auto_3706 ?auto_3701 ) ( IN-CITY ?auto_3701 ?auto_3700 ) ( IN-CITY ?auto_3698 ?auto_3700 ) ( not ( = ?auto_3698 ?auto_3701 ) ) ( TRUCK-AT ?auto_3706 ?auto_3710 ) ( OBJ-AT ?auto_3697 ?auto_3710 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3697 ?auto_3706 ?auto_3710 )
      ( DELIVER-2PKG ?auto_3697 ?auto_3699 ?auto_3698 )
      ( DELIVER-2PKG-VERIFY ?auto_3697 ?auto_3699 ?auto_3698 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3715 - OBJ
      ?auto_3717 - OBJ
      ?auto_3716 - LOCATION
    )
    :vars
    (
      ?auto_3721 - LOCATION
      ?auto_3726 - CITY
      ?auto_3719 - CITY
      ?auto_3725 - LOCATION
      ?auto_3720 - CITY
      ?auto_3727 - TRUCK
      ?auto_3729 - LOCATION
      ?auto_3730 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3717 ?auto_3715 ) ( IN-CITY ?auto_3721 ?auto_3726 ) ( IN-CITY ?auto_3716 ?auto_3726 ) ( not ( = ?auto_3716 ?auto_3721 ) ) ( OBJ-AT ?auto_3717 ?auto_3721 ) ( IN-CITY ?auto_3716 ?auto_3719 ) ( IN-CITY ?auto_3721 ?auto_3719 ) ( IN-CITY ?auto_3725 ?auto_3720 ) ( IN-CITY ?auto_3716 ?auto_3720 ) ( not ( = ?auto_3716 ?auto_3725 ) ) ( OBJ-AT ?auto_3715 ?auto_3725 ) ( TRUCK-AT ?auto_3727 ?auto_3729 ) ( IN-CITY ?auto_3729 ?auto_3730 ) ( IN-CITY ?auto_3725 ?auto_3730 ) ( not ( = ?auto_3725 ?auto_3729 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3727 ?auto_3729 ?auto_3725 ?auto_3730 )
      ( DELIVER-2PKG ?auto_3715 ?auto_3717 ?auto_3716 )
      ( DELIVER-2PKG-VERIFY ?auto_3715 ?auto_3717 ?auto_3716 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3780 - OBJ
      ?auto_3782 - OBJ
      ?auto_3783 - OBJ
      ?auto_3781 - LOCATION
    )
    :vars
    (
      ?auto_3785 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3782 ?auto_3780 ) ( GREATER-THAN ?auto_3783 ?auto_3780 ) ( GREATER-THAN ?auto_3783 ?auto_3782 ) ( TRUCK-AT ?auto_3785 ?auto_3781 ) ( IN-TRUCK ?auto_3783 ?auto_3785 ) ( OBJ-AT ?auto_3780 ?auto_3781 ) ( OBJ-AT ?auto_3782 ?auto_3781 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3783 ?auto_3781 )
      ( DELIVER-3PKG-VERIFY ?auto_3780 ?auto_3782 ?auto_3783 ?auto_3781 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3791 - OBJ
      ?auto_3793 - OBJ
      ?auto_3794 - OBJ
      ?auto_3792 - LOCATION
    )
    :vars
    (
      ?auto_3799 - TRUCK
      ?auto_3797 - LOCATION
      ?auto_3795 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3793 ?auto_3791 ) ( GREATER-THAN ?auto_3794 ?auto_3791 ) ( GREATER-THAN ?auto_3794 ?auto_3793 ) ( IN-TRUCK ?auto_3794 ?auto_3799 ) ( TRUCK-AT ?auto_3799 ?auto_3797 ) ( IN-CITY ?auto_3797 ?auto_3795 ) ( IN-CITY ?auto_3792 ?auto_3795 ) ( not ( = ?auto_3792 ?auto_3797 ) ) ( OBJ-AT ?auto_3791 ?auto_3792 ) ( OBJ-AT ?auto_3793 ?auto_3792 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3794 ?auto_3792 )
      ( DELIVER-3PKG-VERIFY ?auto_3791 ?auto_3793 ?auto_3794 ?auto_3792 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3804 - OBJ
      ?auto_3806 - OBJ
      ?auto_3807 - OBJ
      ?auto_3805 - LOCATION
    )
    :vars
    (
      ?auto_3812 - TRUCK
      ?auto_3808 - LOCATION
      ?auto_3810 - CITY
      ?auto_3813 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3806 ?auto_3804 ) ( GREATER-THAN ?auto_3807 ?auto_3804 ) ( GREATER-THAN ?auto_3807 ?auto_3806 ) ( TRUCK-AT ?auto_3812 ?auto_3808 ) ( IN-CITY ?auto_3808 ?auto_3810 ) ( IN-CITY ?auto_3805 ?auto_3810 ) ( not ( = ?auto_3805 ?auto_3808 ) ) ( TRUCK-AT ?auto_3812 ?auto_3813 ) ( OBJ-AT ?auto_3807 ?auto_3813 ) ( OBJ-AT ?auto_3804 ?auto_3805 ) ( OBJ-AT ?auto_3806 ?auto_3805 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3807 ?auto_3805 )
      ( DELIVER-3PKG-VERIFY ?auto_3804 ?auto_3806 ?auto_3807 ?auto_3805 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3818 - OBJ
      ?auto_3820 - OBJ
      ?auto_3821 - OBJ
      ?auto_3819 - LOCATION
    )
    :vars
    (
      ?auto_3828 - LOCATION
      ?auto_3826 - CITY
      ?auto_3824 - TRUCK
      ?auto_3822 - LOCATION
      ?auto_3827 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3820 ?auto_3818 ) ( GREATER-THAN ?auto_3821 ?auto_3818 ) ( GREATER-THAN ?auto_3821 ?auto_3820 ) ( IN-CITY ?auto_3828 ?auto_3826 ) ( IN-CITY ?auto_3819 ?auto_3826 ) ( not ( = ?auto_3819 ?auto_3828 ) ) ( OBJ-AT ?auto_3821 ?auto_3828 ) ( TRUCK-AT ?auto_3824 ?auto_3822 ) ( IN-CITY ?auto_3822 ?auto_3827 ) ( IN-CITY ?auto_3828 ?auto_3827 ) ( not ( = ?auto_3828 ?auto_3822 ) ) ( OBJ-AT ?auto_3818 ?auto_3819 ) ( OBJ-AT ?auto_3820 ?auto_3819 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3821 ?auto_3819 )
      ( DELIVER-3PKG-VERIFY ?auto_3818 ?auto_3820 ?auto_3821 ?auto_3819 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3833 - OBJ
      ?auto_3844 - OBJ
      ?auto_3836 - OBJ
      ?auto_3834 - LOCATION
    )
    :vars
    (
      ?auto_3845 - OBJ
      ?auto_3843 - LOCATION
      ?auto_3837 - CITY
      ?auto_3840 - TRUCK
      ?auto_3839 - LOCATION
      ?auto_3841 - CITY
      ?auto_3846 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3844 ?auto_3833 ) ( GREATER-THAN ?auto_3836 ?auto_3833 ) ( GREATER-THAN ?auto_3836 ?auto_3844 ) ( GREATER-THAN ?auto_3844 ?auto_3845 ) ( GREATER-THAN ?auto_3836 ?auto_3845 ) ( IN-CITY ?auto_3843 ?auto_3837 ) ( IN-CITY ?auto_3834 ?auto_3837 ) ( not ( = ?auto_3834 ?auto_3843 ) ) ( OBJ-AT ?auto_3836 ?auto_3843 ) ( TRUCK-AT ?auto_3840 ?auto_3839 ) ( IN-CITY ?auto_3839 ?auto_3841 ) ( IN-CITY ?auto_3843 ?auto_3841 ) ( not ( = ?auto_3843 ?auto_3839 ) ) ( OBJ-AT ?auto_3845 ?auto_3834 ) ( TRUCK-AT ?auto_3846 ?auto_3834 ) ( IN-TRUCK ?auto_3844 ?auto_3846 ) ( OBJ-AT ?auto_3833 ?auto_3834 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3844 ?auto_3834 )
      ( DELIVER-3PKG ?auto_3845 ?auto_3844 ?auto_3836 ?auto_3834 )
      ( DELIVER-3PKG-VERIFY ?auto_3833 ?auto_3844 ?auto_3836 ?auto_3834 ) )
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
      ?auto_3860 - OBJ
      ?auto_3859 - OBJ
      ?auto_3862 - LOCATION
      ?auto_3857 - CITY
      ?auto_3864 - CITY
      ?auto_3865 - TRUCK
      ?auto_3869 - LOCATION
      ?auto_3870 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3855 ?auto_3853 ) ( GREATER-THAN ?auto_3856 ?auto_3853 ) ( GREATER-THAN ?auto_3856 ?auto_3855 ) ( GREATER-THAN ?auto_3855 ?auto_3860 ) ( GREATER-THAN ?auto_3856 ?auto_3860 ) ( GREATER-THAN ?auto_3855 ?auto_3859 ) ( GREATER-THAN ?auto_3856 ?auto_3859 ) ( IN-CITY ?auto_3862 ?auto_3857 ) ( IN-CITY ?auto_3854 ?auto_3857 ) ( not ( = ?auto_3854 ?auto_3862 ) ) ( OBJ-AT ?auto_3856 ?auto_3862 ) ( IN-CITY ?auto_3854 ?auto_3864 ) ( IN-CITY ?auto_3862 ?auto_3864 ) ( OBJ-AT ?auto_3859 ?auto_3854 ) ( IN-TRUCK ?auto_3855 ?auto_3865 ) ( OBJ-AT ?auto_3860 ?auto_3854 ) ( TRUCK-AT ?auto_3865 ?auto_3869 ) ( IN-CITY ?auto_3869 ?auto_3870 ) ( IN-CITY ?auto_3854 ?auto_3870 ) ( not ( = ?auto_3854 ?auto_3869 ) ) ( OBJ-AT ?auto_3853 ?auto_3854 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3865 ?auto_3869 ?auto_3854 ?auto_3870 )
      ( DELIVER-3PKG ?auto_3860 ?auto_3855 ?auto_3856 ?auto_3854 )
      ( DELIVER-3PKG-VERIFY ?auto_3853 ?auto_3855 ?auto_3856 ?auto_3854 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3876 - OBJ
      ?auto_3878 - OBJ
      ?auto_3879 - OBJ
      ?auto_3877 - LOCATION
    )
    :vars
    (
      ?auto_3885 - OBJ
      ?auto_3882 - OBJ
      ?auto_3886 - OBJ
      ?auto_3881 - LOCATION
      ?auto_3887 - CITY
      ?auto_3889 - CITY
      ?auto_3880 - TRUCK
      ?auto_3891 - LOCATION
      ?auto_3888 - CITY
      ?auto_3893 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3878 ?auto_3876 ) ( GREATER-THAN ?auto_3879 ?auto_3876 ) ( GREATER-THAN ?auto_3879 ?auto_3878 ) ( GREATER-THAN ?auto_3878 ?auto_3885 ) ( GREATER-THAN ?auto_3879 ?auto_3885 ) ( GREATER-THAN ?auto_3878 ?auto_3882 ) ( GREATER-THAN ?auto_3879 ?auto_3882 ) ( GREATER-THAN ?auto_3878 ?auto_3886 ) ( GREATER-THAN ?auto_3879 ?auto_3886 ) ( IN-CITY ?auto_3881 ?auto_3887 ) ( IN-CITY ?auto_3877 ?auto_3887 ) ( not ( = ?auto_3877 ?auto_3881 ) ) ( OBJ-AT ?auto_3879 ?auto_3881 ) ( IN-CITY ?auto_3877 ?auto_3889 ) ( IN-CITY ?auto_3881 ?auto_3889 ) ( OBJ-AT ?auto_3886 ?auto_3877 ) ( OBJ-AT ?auto_3882 ?auto_3877 ) ( TRUCK-AT ?auto_3880 ?auto_3891 ) ( IN-CITY ?auto_3891 ?auto_3888 ) ( IN-CITY ?auto_3877 ?auto_3888 ) ( not ( = ?auto_3877 ?auto_3891 ) ) ( OBJ-AT ?auto_3885 ?auto_3877 ) ( TRUCK-AT ?auto_3880 ?auto_3893 ) ( OBJ-AT ?auto_3878 ?auto_3893 ) ( OBJ-AT ?auto_3876 ?auto_3877 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3878 ?auto_3880 ?auto_3893 )
      ( DELIVER-3PKG ?auto_3885 ?auto_3878 ?auto_3879 ?auto_3877 )
      ( DELIVER-3PKG-VERIFY ?auto_3876 ?auto_3878 ?auto_3879 ?auto_3877 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3899 - OBJ
      ?auto_3901 - OBJ
      ?auto_3902 - OBJ
      ?auto_3900 - LOCATION
    )
    :vars
    (
      ?auto_3911 - OBJ
      ?auto_3910 - OBJ
      ?auto_3912 - OBJ
      ?auto_3913 - OBJ
      ?auto_3904 - LOCATION
      ?auto_3909 - CITY
      ?auto_3908 - CITY
      ?auto_3915 - LOCATION
      ?auto_3903 - CITY
      ?auto_3906 - TRUCK
      ?auto_3918 - LOCATION
      ?auto_3919 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3901 ?auto_3899 ) ( GREATER-THAN ?auto_3902 ?auto_3899 ) ( GREATER-THAN ?auto_3902 ?auto_3901 ) ( GREATER-THAN ?auto_3901 ?auto_3911 ) ( GREATER-THAN ?auto_3902 ?auto_3911 ) ( GREATER-THAN ?auto_3901 ?auto_3910 ) ( GREATER-THAN ?auto_3902 ?auto_3910 ) ( GREATER-THAN ?auto_3901 ?auto_3912 ) ( GREATER-THAN ?auto_3902 ?auto_3912 ) ( GREATER-THAN ?auto_3901 ?auto_3913 ) ( GREATER-THAN ?auto_3902 ?auto_3913 ) ( IN-CITY ?auto_3904 ?auto_3909 ) ( IN-CITY ?auto_3900 ?auto_3909 ) ( not ( = ?auto_3900 ?auto_3904 ) ) ( OBJ-AT ?auto_3902 ?auto_3904 ) ( IN-CITY ?auto_3900 ?auto_3908 ) ( IN-CITY ?auto_3904 ?auto_3908 ) ( OBJ-AT ?auto_3913 ?auto_3900 ) ( OBJ-AT ?auto_3912 ?auto_3900 ) ( IN-CITY ?auto_3915 ?auto_3903 ) ( IN-CITY ?auto_3900 ?auto_3903 ) ( not ( = ?auto_3900 ?auto_3915 ) ) ( OBJ-AT ?auto_3910 ?auto_3900 ) ( OBJ-AT ?auto_3901 ?auto_3915 ) ( OBJ-AT ?auto_3911 ?auto_3900 ) ( TRUCK-AT ?auto_3906 ?auto_3918 ) ( IN-CITY ?auto_3918 ?auto_3919 ) ( IN-CITY ?auto_3915 ?auto_3919 ) ( not ( = ?auto_3915 ?auto_3918 ) ) ( OBJ-AT ?auto_3899 ?auto_3900 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3906 ?auto_3918 ?auto_3915 ?auto_3919 )
      ( DELIVER-3PKG ?auto_3911 ?auto_3901 ?auto_3902 ?auto_3900 )
      ( DELIVER-3PKG-VERIFY ?auto_3899 ?auto_3901 ?auto_3902 ?auto_3900 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3930 - OBJ
      ?auto_3927 - OBJ
      ?auto_3928 - OBJ
      ?auto_3926 - LOCATION
    )
    :vars
    (
      ?auto_3929 - LOCATION
      ?auto_3938 - CITY
      ?auto_3937 - CITY
      ?auto_3935 - LOCATION
      ?auto_3941 - CITY
      ?auto_3936 - TRUCK
      ?auto_3934 - LOCATION
      ?auto_3932 - CITY
      ?auto_3947 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3927 ?auto_3930 ) ( GREATER-THAN ?auto_3928 ?auto_3930 ) ( GREATER-THAN ?auto_3928 ?auto_3927 ) ( IN-CITY ?auto_3929 ?auto_3938 ) ( IN-CITY ?auto_3926 ?auto_3938 ) ( not ( = ?auto_3926 ?auto_3929 ) ) ( OBJ-AT ?auto_3928 ?auto_3929 ) ( IN-CITY ?auto_3926 ?auto_3937 ) ( IN-CITY ?auto_3929 ?auto_3937 ) ( IN-CITY ?auto_3935 ?auto_3941 ) ( IN-CITY ?auto_3926 ?auto_3941 ) ( not ( = ?auto_3926 ?auto_3935 ) ) ( OBJ-AT ?auto_3927 ?auto_3935 ) ( TRUCK-AT ?auto_3936 ?auto_3934 ) ( IN-CITY ?auto_3934 ?auto_3932 ) ( IN-CITY ?auto_3935 ?auto_3932 ) ( not ( = ?auto_3935 ?auto_3934 ) ) ( TRUCK-AT ?auto_3947 ?auto_3926 ) ( IN-TRUCK ?auto_3930 ?auto_3947 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3930 ?auto_3926 )
      ( DELIVER-3PKG ?auto_3930 ?auto_3927 ?auto_3928 ?auto_3926 )
      ( DELIVER-3PKG-VERIFY ?auto_3930 ?auto_3927 ?auto_3928 ?auto_3926 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3952 - OBJ
      ?auto_3954 - OBJ
      ?auto_3955 - OBJ
      ?auto_3953 - LOCATION
    )
    :vars
    (
      ?auto_3967 - LOCATION
      ?auto_3958 - CITY
      ?auto_3960 - CITY
      ?auto_3968 - LOCATION
      ?auto_3959 - CITY
      ?auto_3962 - CITY
      ?auto_3963 - TRUCK
      ?auto_3970 - LOCATION
      ?auto_3971 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3954 ?auto_3952 ) ( GREATER-THAN ?auto_3955 ?auto_3952 ) ( GREATER-THAN ?auto_3955 ?auto_3954 ) ( IN-CITY ?auto_3967 ?auto_3958 ) ( IN-CITY ?auto_3953 ?auto_3958 ) ( not ( = ?auto_3953 ?auto_3967 ) ) ( OBJ-AT ?auto_3955 ?auto_3967 ) ( IN-CITY ?auto_3953 ?auto_3960 ) ( IN-CITY ?auto_3967 ?auto_3960 ) ( IN-CITY ?auto_3968 ?auto_3959 ) ( IN-CITY ?auto_3953 ?auto_3959 ) ( not ( = ?auto_3953 ?auto_3968 ) ) ( OBJ-AT ?auto_3954 ?auto_3968 ) ( IN-CITY ?auto_3953 ?auto_3962 ) ( IN-CITY ?auto_3968 ?auto_3962 ) ( IN-TRUCK ?auto_3952 ?auto_3963 ) ( TRUCK-AT ?auto_3963 ?auto_3970 ) ( IN-CITY ?auto_3970 ?auto_3971 ) ( IN-CITY ?auto_3953 ?auto_3971 ) ( not ( = ?auto_3953 ?auto_3970 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3963 ?auto_3970 ?auto_3953 ?auto_3971 )
      ( DELIVER-3PKG ?auto_3952 ?auto_3954 ?auto_3955 ?auto_3953 )
      ( DELIVER-3PKG-VERIFY ?auto_3952 ?auto_3954 ?auto_3955 ?auto_3953 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3977 - OBJ
      ?auto_3979 - OBJ
      ?auto_3980 - OBJ
      ?auto_3978 - LOCATION
    )
    :vars
    (
      ?auto_3988 - LOCATION
      ?auto_3981 - CITY
      ?auto_3990 - CITY
      ?auto_3987 - LOCATION
      ?auto_3991 - CITY
      ?auto_3983 - CITY
      ?auto_3982 - TRUCK
      ?auto_3993 - LOCATION
      ?auto_3985 - CITY
      ?auto_3995 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3979 ?auto_3977 ) ( GREATER-THAN ?auto_3980 ?auto_3977 ) ( GREATER-THAN ?auto_3980 ?auto_3979 ) ( IN-CITY ?auto_3988 ?auto_3981 ) ( IN-CITY ?auto_3978 ?auto_3981 ) ( not ( = ?auto_3978 ?auto_3988 ) ) ( OBJ-AT ?auto_3980 ?auto_3988 ) ( IN-CITY ?auto_3978 ?auto_3990 ) ( IN-CITY ?auto_3988 ?auto_3990 ) ( IN-CITY ?auto_3987 ?auto_3991 ) ( IN-CITY ?auto_3978 ?auto_3991 ) ( not ( = ?auto_3978 ?auto_3987 ) ) ( OBJ-AT ?auto_3979 ?auto_3987 ) ( IN-CITY ?auto_3978 ?auto_3983 ) ( IN-CITY ?auto_3987 ?auto_3983 ) ( TRUCK-AT ?auto_3982 ?auto_3993 ) ( IN-CITY ?auto_3993 ?auto_3985 ) ( IN-CITY ?auto_3978 ?auto_3985 ) ( not ( = ?auto_3978 ?auto_3993 ) ) ( TRUCK-AT ?auto_3982 ?auto_3995 ) ( OBJ-AT ?auto_3977 ?auto_3995 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3977 ?auto_3982 ?auto_3995 )
      ( DELIVER-3PKG ?auto_3977 ?auto_3979 ?auto_3980 ?auto_3978 )
      ( DELIVER-3PKG-VERIFY ?auto_3977 ?auto_3979 ?auto_3980 ?auto_3978 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4001 - OBJ
      ?auto_4003 - OBJ
      ?auto_4004 - OBJ
      ?auto_4002 - LOCATION
    )
    :vars
    (
      ?auto_4013 - LOCATION
      ?auto_4014 - CITY
      ?auto_4008 - CITY
      ?auto_4007 - LOCATION
      ?auto_4017 - CITY
      ?auto_4015 - CITY
      ?auto_4010 - LOCATION
      ?auto_4006 - CITY
      ?auto_4012 - TRUCK
      ?auto_4020 - LOCATION
      ?auto_4021 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4003 ?auto_4001 ) ( GREATER-THAN ?auto_4004 ?auto_4001 ) ( GREATER-THAN ?auto_4004 ?auto_4003 ) ( IN-CITY ?auto_4013 ?auto_4014 ) ( IN-CITY ?auto_4002 ?auto_4014 ) ( not ( = ?auto_4002 ?auto_4013 ) ) ( OBJ-AT ?auto_4004 ?auto_4013 ) ( IN-CITY ?auto_4002 ?auto_4008 ) ( IN-CITY ?auto_4013 ?auto_4008 ) ( IN-CITY ?auto_4007 ?auto_4017 ) ( IN-CITY ?auto_4002 ?auto_4017 ) ( not ( = ?auto_4002 ?auto_4007 ) ) ( OBJ-AT ?auto_4003 ?auto_4007 ) ( IN-CITY ?auto_4002 ?auto_4015 ) ( IN-CITY ?auto_4007 ?auto_4015 ) ( IN-CITY ?auto_4010 ?auto_4006 ) ( IN-CITY ?auto_4002 ?auto_4006 ) ( not ( = ?auto_4002 ?auto_4010 ) ) ( OBJ-AT ?auto_4001 ?auto_4010 ) ( TRUCK-AT ?auto_4012 ?auto_4020 ) ( IN-CITY ?auto_4020 ?auto_4021 ) ( IN-CITY ?auto_4010 ?auto_4021 ) ( not ( = ?auto_4010 ?auto_4020 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4012 ?auto_4020 ?auto_4010 ?auto_4021 )
      ( DELIVER-3PKG ?auto_4001 ?auto_4003 ?auto_4004 ?auto_4002 )
      ( DELIVER-3PKG-VERIFY ?auto_4001 ?auto_4003 ?auto_4004 ?auto_4002 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4072 - OBJ
      ?auto_4074 - OBJ
      ?auto_4075 - OBJ
      ?auto_4076 - OBJ
      ?auto_4073 - LOCATION
    )
    :vars
    (
      ?auto_4077 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4074 ?auto_4072 ) ( GREATER-THAN ?auto_4075 ?auto_4072 ) ( GREATER-THAN ?auto_4075 ?auto_4074 ) ( GREATER-THAN ?auto_4076 ?auto_4072 ) ( GREATER-THAN ?auto_4076 ?auto_4074 ) ( GREATER-THAN ?auto_4076 ?auto_4075 ) ( TRUCK-AT ?auto_4077 ?auto_4073 ) ( IN-TRUCK ?auto_4076 ?auto_4077 ) ( OBJ-AT ?auto_4072 ?auto_4073 ) ( OBJ-AT ?auto_4074 ?auto_4073 ) ( OBJ-AT ?auto_4075 ?auto_4073 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4076 ?auto_4073 )
      ( DELIVER-4PKG-VERIFY ?auto_4072 ?auto_4074 ?auto_4075 ?auto_4076 ?auto_4073 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4085 - OBJ
      ?auto_4087 - OBJ
      ?auto_4088 - OBJ
      ?auto_4089 - OBJ
      ?auto_4086 - LOCATION
    )
    :vars
    (
      ?auto_4094 - TRUCK
      ?auto_4090 - LOCATION
      ?auto_4091 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4087 ?auto_4085 ) ( GREATER-THAN ?auto_4088 ?auto_4085 ) ( GREATER-THAN ?auto_4088 ?auto_4087 ) ( GREATER-THAN ?auto_4089 ?auto_4085 ) ( GREATER-THAN ?auto_4089 ?auto_4087 ) ( GREATER-THAN ?auto_4089 ?auto_4088 ) ( IN-TRUCK ?auto_4089 ?auto_4094 ) ( TRUCK-AT ?auto_4094 ?auto_4090 ) ( IN-CITY ?auto_4090 ?auto_4091 ) ( IN-CITY ?auto_4086 ?auto_4091 ) ( not ( = ?auto_4086 ?auto_4090 ) ) ( OBJ-AT ?auto_4085 ?auto_4086 ) ( OBJ-AT ?auto_4087 ?auto_4086 ) ( OBJ-AT ?auto_4088 ?auto_4086 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4089 ?auto_4086 )
      ( DELIVER-4PKG-VERIFY ?auto_4085 ?auto_4087 ?auto_4088 ?auto_4089 ?auto_4086 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4100 - OBJ
      ?auto_4102 - OBJ
      ?auto_4103 - OBJ
      ?auto_4104 - OBJ
      ?auto_4101 - LOCATION
    )
    :vars
    (
      ?auto_4110 - TRUCK
      ?auto_4109 - LOCATION
      ?auto_4107 - CITY
      ?auto_4105 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4102 ?auto_4100 ) ( GREATER-THAN ?auto_4103 ?auto_4100 ) ( GREATER-THAN ?auto_4103 ?auto_4102 ) ( GREATER-THAN ?auto_4104 ?auto_4100 ) ( GREATER-THAN ?auto_4104 ?auto_4102 ) ( GREATER-THAN ?auto_4104 ?auto_4103 ) ( TRUCK-AT ?auto_4110 ?auto_4109 ) ( IN-CITY ?auto_4109 ?auto_4107 ) ( IN-CITY ?auto_4101 ?auto_4107 ) ( not ( = ?auto_4101 ?auto_4109 ) ) ( TRUCK-AT ?auto_4110 ?auto_4105 ) ( OBJ-AT ?auto_4104 ?auto_4105 ) ( OBJ-AT ?auto_4100 ?auto_4101 ) ( OBJ-AT ?auto_4102 ?auto_4101 ) ( OBJ-AT ?auto_4103 ?auto_4101 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4104 ?auto_4101 )
      ( DELIVER-4PKG-VERIFY ?auto_4100 ?auto_4102 ?auto_4103 ?auto_4104 ?auto_4101 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4116 - OBJ
      ?auto_4118 - OBJ
      ?auto_4119 - OBJ
      ?auto_4120 - OBJ
      ?auto_4117 - LOCATION
    )
    :vars
    (
      ?auto_4121 - LOCATION
      ?auto_4125 - CITY
      ?auto_4123 - TRUCK
      ?auto_4124 - LOCATION
      ?auto_4126 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4118 ?auto_4116 ) ( GREATER-THAN ?auto_4119 ?auto_4116 ) ( GREATER-THAN ?auto_4119 ?auto_4118 ) ( GREATER-THAN ?auto_4120 ?auto_4116 ) ( GREATER-THAN ?auto_4120 ?auto_4118 ) ( GREATER-THAN ?auto_4120 ?auto_4119 ) ( IN-CITY ?auto_4121 ?auto_4125 ) ( IN-CITY ?auto_4117 ?auto_4125 ) ( not ( = ?auto_4117 ?auto_4121 ) ) ( OBJ-AT ?auto_4120 ?auto_4121 ) ( TRUCK-AT ?auto_4123 ?auto_4124 ) ( IN-CITY ?auto_4124 ?auto_4126 ) ( IN-CITY ?auto_4121 ?auto_4126 ) ( not ( = ?auto_4121 ?auto_4124 ) ) ( OBJ-AT ?auto_4116 ?auto_4117 ) ( OBJ-AT ?auto_4118 ?auto_4117 ) ( OBJ-AT ?auto_4119 ?auto_4117 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4120 ?auto_4117 )
      ( DELIVER-4PKG-VERIFY ?auto_4116 ?auto_4118 ?auto_4119 ?auto_4120 ?auto_4117 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4133 - OBJ
      ?auto_4135 - OBJ
      ?auto_4144 - OBJ
      ?auto_4137 - OBJ
      ?auto_4134 - LOCATION
    )
    :vars
    (
      ?auto_4139 - OBJ
      ?auto_4140 - OBJ
      ?auto_4138 - LOCATION
      ?auto_4147 - CITY
      ?auto_4146 - TRUCK
      ?auto_4142 - LOCATION
      ?auto_4143 - CITY
      ?auto_4149 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4135 ?auto_4133 ) ( GREATER-THAN ?auto_4144 ?auto_4133 ) ( GREATER-THAN ?auto_4144 ?auto_4135 ) ( GREATER-THAN ?auto_4137 ?auto_4133 ) ( GREATER-THAN ?auto_4137 ?auto_4135 ) ( GREATER-THAN ?auto_4137 ?auto_4144 ) ( GREATER-THAN ?auto_4139 ?auto_4140 ) ( GREATER-THAN ?auto_4144 ?auto_4140 ) ( GREATER-THAN ?auto_4144 ?auto_4139 ) ( GREATER-THAN ?auto_4137 ?auto_4140 ) ( GREATER-THAN ?auto_4137 ?auto_4139 ) ( IN-CITY ?auto_4138 ?auto_4147 ) ( IN-CITY ?auto_4134 ?auto_4147 ) ( not ( = ?auto_4134 ?auto_4138 ) ) ( OBJ-AT ?auto_4137 ?auto_4138 ) ( TRUCK-AT ?auto_4146 ?auto_4142 ) ( IN-CITY ?auto_4142 ?auto_4143 ) ( IN-CITY ?auto_4138 ?auto_4143 ) ( not ( = ?auto_4138 ?auto_4142 ) ) ( OBJ-AT ?auto_4140 ?auto_4134 ) ( OBJ-AT ?auto_4139 ?auto_4134 ) ( TRUCK-AT ?auto_4149 ?auto_4134 ) ( IN-TRUCK ?auto_4144 ?auto_4149 ) ( OBJ-AT ?auto_4133 ?auto_4134 ) ( OBJ-AT ?auto_4135 ?auto_4134 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4144 ?auto_4134 )
      ( DELIVER-4PKG ?auto_4140 ?auto_4139 ?auto_4144 ?auto_4137 ?auto_4134 )
      ( DELIVER-4PKG-VERIFY ?auto_4133 ?auto_4135 ?auto_4144 ?auto_4137 ?auto_4134 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4156 - OBJ
      ?auto_4158 - OBJ
      ?auto_4159 - OBJ
      ?auto_4160 - OBJ
      ?auto_4157 - LOCATION
    )
    :vars
    (
      ?auto_4164 - OBJ
      ?auto_4170 - OBJ
      ?auto_4169 - OBJ
      ?auto_4173 - OBJ
      ?auto_4163 - LOCATION
      ?auto_4161 - CITY
      ?auto_4162 - CITY
      ?auto_4168 - TRUCK
      ?auto_4175 - LOCATION
      ?auto_4176 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4158 ?auto_4156 ) ( GREATER-THAN ?auto_4159 ?auto_4156 ) ( GREATER-THAN ?auto_4159 ?auto_4158 ) ( GREATER-THAN ?auto_4160 ?auto_4156 ) ( GREATER-THAN ?auto_4160 ?auto_4158 ) ( GREATER-THAN ?auto_4160 ?auto_4159 ) ( GREATER-THAN ?auto_4164 ?auto_4170 ) ( GREATER-THAN ?auto_4159 ?auto_4170 ) ( GREATER-THAN ?auto_4159 ?auto_4164 ) ( GREATER-THAN ?auto_4160 ?auto_4170 ) ( GREATER-THAN ?auto_4160 ?auto_4164 ) ( GREATER-THAN ?auto_4169 ?auto_4173 ) ( GREATER-THAN ?auto_4159 ?auto_4173 ) ( GREATER-THAN ?auto_4159 ?auto_4169 ) ( GREATER-THAN ?auto_4160 ?auto_4173 ) ( GREATER-THAN ?auto_4160 ?auto_4169 ) ( IN-CITY ?auto_4163 ?auto_4161 ) ( IN-CITY ?auto_4157 ?auto_4161 ) ( not ( = ?auto_4157 ?auto_4163 ) ) ( OBJ-AT ?auto_4160 ?auto_4163 ) ( IN-CITY ?auto_4157 ?auto_4162 ) ( IN-CITY ?auto_4163 ?auto_4162 ) ( OBJ-AT ?auto_4173 ?auto_4157 ) ( OBJ-AT ?auto_4169 ?auto_4157 ) ( IN-TRUCK ?auto_4159 ?auto_4168 ) ( OBJ-AT ?auto_4170 ?auto_4157 ) ( OBJ-AT ?auto_4164 ?auto_4157 ) ( TRUCK-AT ?auto_4168 ?auto_4175 ) ( IN-CITY ?auto_4175 ?auto_4176 ) ( IN-CITY ?auto_4157 ?auto_4176 ) ( not ( = ?auto_4157 ?auto_4175 ) ) ( OBJ-AT ?auto_4156 ?auto_4157 ) ( OBJ-AT ?auto_4158 ?auto_4157 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4168 ?auto_4175 ?auto_4157 ?auto_4176 )
      ( DELIVER-4PKG ?auto_4170 ?auto_4164 ?auto_4159 ?auto_4160 ?auto_4157 )
      ( DELIVER-4PKG-VERIFY ?auto_4156 ?auto_4158 ?auto_4159 ?auto_4160 ?auto_4157 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4183 - OBJ
      ?auto_4185 - OBJ
      ?auto_4186 - OBJ
      ?auto_4187 - OBJ
      ?auto_4184 - LOCATION
    )
    :vars
    (
      ?auto_4192 - OBJ
      ?auto_4200 - OBJ
      ?auto_4188 - OBJ
      ?auto_4190 - OBJ
      ?auto_4191 - OBJ
      ?auto_4194 - OBJ
      ?auto_4199 - LOCATION
      ?auto_4193 - CITY
      ?auto_4198 - CITY
      ?auto_4197 - TRUCK
      ?auto_4196 - LOCATION
      ?auto_4195 - CITY
      ?auto_4204 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4185 ?auto_4183 ) ( GREATER-THAN ?auto_4186 ?auto_4183 ) ( GREATER-THAN ?auto_4186 ?auto_4185 ) ( GREATER-THAN ?auto_4187 ?auto_4183 ) ( GREATER-THAN ?auto_4187 ?auto_4185 ) ( GREATER-THAN ?auto_4187 ?auto_4186 ) ( GREATER-THAN ?auto_4192 ?auto_4200 ) ( GREATER-THAN ?auto_4186 ?auto_4200 ) ( GREATER-THAN ?auto_4186 ?auto_4192 ) ( GREATER-THAN ?auto_4187 ?auto_4200 ) ( GREATER-THAN ?auto_4187 ?auto_4192 ) ( GREATER-THAN ?auto_4188 ?auto_4190 ) ( GREATER-THAN ?auto_4186 ?auto_4190 ) ( GREATER-THAN ?auto_4186 ?auto_4188 ) ( GREATER-THAN ?auto_4187 ?auto_4190 ) ( GREATER-THAN ?auto_4187 ?auto_4188 ) ( GREATER-THAN ?auto_4191 ?auto_4194 ) ( GREATER-THAN ?auto_4186 ?auto_4194 ) ( GREATER-THAN ?auto_4186 ?auto_4191 ) ( GREATER-THAN ?auto_4187 ?auto_4194 ) ( GREATER-THAN ?auto_4187 ?auto_4191 ) ( IN-CITY ?auto_4199 ?auto_4193 ) ( IN-CITY ?auto_4184 ?auto_4193 ) ( not ( = ?auto_4184 ?auto_4199 ) ) ( OBJ-AT ?auto_4187 ?auto_4199 ) ( IN-CITY ?auto_4184 ?auto_4198 ) ( IN-CITY ?auto_4199 ?auto_4198 ) ( OBJ-AT ?auto_4194 ?auto_4184 ) ( OBJ-AT ?auto_4191 ?auto_4184 ) ( OBJ-AT ?auto_4190 ?auto_4184 ) ( OBJ-AT ?auto_4188 ?auto_4184 ) ( TRUCK-AT ?auto_4197 ?auto_4196 ) ( IN-CITY ?auto_4196 ?auto_4195 ) ( IN-CITY ?auto_4184 ?auto_4195 ) ( not ( = ?auto_4184 ?auto_4196 ) ) ( OBJ-AT ?auto_4200 ?auto_4184 ) ( OBJ-AT ?auto_4192 ?auto_4184 ) ( TRUCK-AT ?auto_4197 ?auto_4204 ) ( OBJ-AT ?auto_4186 ?auto_4204 ) ( OBJ-AT ?auto_4183 ?auto_4184 ) ( OBJ-AT ?auto_4185 ?auto_4184 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4186 ?auto_4197 ?auto_4204 )
      ( DELIVER-4PKG ?auto_4200 ?auto_4192 ?auto_4186 ?auto_4187 ?auto_4184 )
      ( DELIVER-4PKG-VERIFY ?auto_4183 ?auto_4185 ?auto_4186 ?auto_4187 ?auto_4184 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4211 - OBJ
      ?auto_4213 - OBJ
      ?auto_4214 - OBJ
      ?auto_4215 - OBJ
      ?auto_4212 - LOCATION
    )
    :vars
    (
      ?auto_4222 - OBJ
      ?auto_4225 - OBJ
      ?auto_4229 - OBJ
      ?auto_4226 - OBJ
      ?auto_4233 - OBJ
      ?auto_4216 - OBJ
      ?auto_4221 - OBJ
      ?auto_4227 - OBJ
      ?auto_4228 - LOCATION
      ?auto_4231 - CITY
      ?auto_4223 - CITY
      ?auto_4230 - LOCATION
      ?auto_4232 - CITY
      ?auto_4217 - TRUCK
      ?auto_4235 - LOCATION
      ?auto_4236 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4213 ?auto_4211 ) ( GREATER-THAN ?auto_4214 ?auto_4211 ) ( GREATER-THAN ?auto_4214 ?auto_4213 ) ( GREATER-THAN ?auto_4215 ?auto_4211 ) ( GREATER-THAN ?auto_4215 ?auto_4213 ) ( GREATER-THAN ?auto_4215 ?auto_4214 ) ( GREATER-THAN ?auto_4222 ?auto_4225 ) ( GREATER-THAN ?auto_4214 ?auto_4225 ) ( GREATER-THAN ?auto_4214 ?auto_4222 ) ( GREATER-THAN ?auto_4215 ?auto_4225 ) ( GREATER-THAN ?auto_4215 ?auto_4222 ) ( GREATER-THAN ?auto_4229 ?auto_4226 ) ( GREATER-THAN ?auto_4214 ?auto_4226 ) ( GREATER-THAN ?auto_4214 ?auto_4229 ) ( GREATER-THAN ?auto_4215 ?auto_4226 ) ( GREATER-THAN ?auto_4215 ?auto_4229 ) ( GREATER-THAN ?auto_4233 ?auto_4216 ) ( GREATER-THAN ?auto_4214 ?auto_4216 ) ( GREATER-THAN ?auto_4214 ?auto_4233 ) ( GREATER-THAN ?auto_4215 ?auto_4216 ) ( GREATER-THAN ?auto_4215 ?auto_4233 ) ( GREATER-THAN ?auto_4221 ?auto_4227 ) ( GREATER-THAN ?auto_4214 ?auto_4227 ) ( GREATER-THAN ?auto_4214 ?auto_4221 ) ( GREATER-THAN ?auto_4215 ?auto_4227 ) ( GREATER-THAN ?auto_4215 ?auto_4221 ) ( IN-CITY ?auto_4228 ?auto_4231 ) ( IN-CITY ?auto_4212 ?auto_4231 ) ( not ( = ?auto_4212 ?auto_4228 ) ) ( OBJ-AT ?auto_4215 ?auto_4228 ) ( IN-CITY ?auto_4212 ?auto_4223 ) ( IN-CITY ?auto_4228 ?auto_4223 ) ( OBJ-AT ?auto_4227 ?auto_4212 ) ( OBJ-AT ?auto_4221 ?auto_4212 ) ( OBJ-AT ?auto_4216 ?auto_4212 ) ( OBJ-AT ?auto_4233 ?auto_4212 ) ( IN-CITY ?auto_4230 ?auto_4232 ) ( IN-CITY ?auto_4212 ?auto_4232 ) ( not ( = ?auto_4212 ?auto_4230 ) ) ( OBJ-AT ?auto_4226 ?auto_4212 ) ( OBJ-AT ?auto_4229 ?auto_4212 ) ( OBJ-AT ?auto_4214 ?auto_4230 ) ( OBJ-AT ?auto_4225 ?auto_4212 ) ( OBJ-AT ?auto_4222 ?auto_4212 ) ( TRUCK-AT ?auto_4217 ?auto_4235 ) ( IN-CITY ?auto_4235 ?auto_4236 ) ( IN-CITY ?auto_4230 ?auto_4236 ) ( not ( = ?auto_4230 ?auto_4235 ) ) ( OBJ-AT ?auto_4211 ?auto_4212 ) ( OBJ-AT ?auto_4213 ?auto_4212 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4217 ?auto_4235 ?auto_4230 ?auto_4236 )
      ( DELIVER-4PKG ?auto_4225 ?auto_4222 ?auto_4214 ?auto_4215 ?auto_4212 )
      ( DELIVER-4PKG-VERIFY ?auto_4211 ?auto_4213 ?auto_4214 ?auto_4215 ?auto_4212 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4243 - OBJ
      ?auto_4248 - OBJ
      ?auto_4246 - OBJ
      ?auto_4247 - OBJ
      ?auto_4244 - LOCATION
    )
    :vars
    (
      ?auto_4250 - OBJ
      ?auto_4265 - OBJ
      ?auto_4249 - OBJ
      ?auto_4267 - OBJ
      ?auto_4258 - OBJ
      ?auto_4264 - LOCATION
      ?auto_4261 - CITY
      ?auto_4268 - CITY
      ?auto_4262 - LOCATION
      ?auto_4260 - CITY
      ?auto_4255 - TRUCK
      ?auto_4253 - LOCATION
      ?auto_4254 - CITY
      ?auto_4269 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4248 ?auto_4243 ) ( GREATER-THAN ?auto_4246 ?auto_4243 ) ( GREATER-THAN ?auto_4246 ?auto_4248 ) ( GREATER-THAN ?auto_4247 ?auto_4243 ) ( GREATER-THAN ?auto_4247 ?auto_4248 ) ( GREATER-THAN ?auto_4247 ?auto_4246 ) ( GREATER-THAN ?auto_4248 ?auto_4250 ) ( GREATER-THAN ?auto_4246 ?auto_4250 ) ( GREATER-THAN ?auto_4247 ?auto_4250 ) ( GREATER-THAN ?auto_4248 ?auto_4265 ) ( GREATER-THAN ?auto_4246 ?auto_4265 ) ( GREATER-THAN ?auto_4247 ?auto_4265 ) ( GREATER-THAN ?auto_4248 ?auto_4249 ) ( GREATER-THAN ?auto_4246 ?auto_4249 ) ( GREATER-THAN ?auto_4247 ?auto_4249 ) ( GREATER-THAN ?auto_4248 ?auto_4267 ) ( GREATER-THAN ?auto_4246 ?auto_4267 ) ( GREATER-THAN ?auto_4247 ?auto_4267 ) ( GREATER-THAN ?auto_4248 ?auto_4258 ) ( GREATER-THAN ?auto_4246 ?auto_4258 ) ( GREATER-THAN ?auto_4247 ?auto_4258 ) ( IN-CITY ?auto_4264 ?auto_4261 ) ( IN-CITY ?auto_4244 ?auto_4261 ) ( not ( = ?auto_4244 ?auto_4264 ) ) ( OBJ-AT ?auto_4247 ?auto_4264 ) ( IN-CITY ?auto_4244 ?auto_4268 ) ( IN-CITY ?auto_4264 ?auto_4268 ) ( OBJ-AT ?auto_4258 ?auto_4244 ) ( OBJ-AT ?auto_4267 ?auto_4244 ) ( IN-CITY ?auto_4262 ?auto_4260 ) ( IN-CITY ?auto_4244 ?auto_4260 ) ( not ( = ?auto_4244 ?auto_4262 ) ) ( OBJ-AT ?auto_4249 ?auto_4244 ) ( OBJ-AT ?auto_4246 ?auto_4262 ) ( OBJ-AT ?auto_4265 ?auto_4244 ) ( TRUCK-AT ?auto_4255 ?auto_4253 ) ( IN-CITY ?auto_4253 ?auto_4254 ) ( IN-CITY ?auto_4262 ?auto_4254 ) ( not ( = ?auto_4262 ?auto_4253 ) ) ( OBJ-AT ?auto_4250 ?auto_4244 ) ( TRUCK-AT ?auto_4269 ?auto_4244 ) ( IN-TRUCK ?auto_4248 ?auto_4269 ) ( OBJ-AT ?auto_4243 ?auto_4244 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4248 ?auto_4244 )
      ( DELIVER-4PKG ?auto_4250 ?auto_4248 ?auto_4246 ?auto_4247 ?auto_4244 )
      ( DELIVER-4PKG-VERIFY ?auto_4243 ?auto_4248 ?auto_4246 ?auto_4247 ?auto_4244 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4277 - OBJ
      ?auto_4279 - OBJ
      ?auto_4280 - OBJ
      ?auto_4281 - OBJ
      ?auto_4278 - LOCATION
    )
    :vars
    (
      ?auto_4296 - OBJ
      ?auto_4290 - OBJ
      ?auto_4299 - OBJ
      ?auto_4282 - OBJ
      ?auto_4298 - OBJ
      ?auto_4283 - OBJ
      ?auto_4284 - LOCATION
      ?auto_4285 - CITY
      ?auto_4291 - CITY
      ?auto_4286 - LOCATION
      ?auto_4287 - CITY
      ?auto_4288 - CITY
      ?auto_4293 - TRUCK
      ?auto_4302 - LOCATION
      ?auto_4303 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4279 ?auto_4277 ) ( GREATER-THAN ?auto_4280 ?auto_4277 ) ( GREATER-THAN ?auto_4280 ?auto_4279 ) ( GREATER-THAN ?auto_4281 ?auto_4277 ) ( GREATER-THAN ?auto_4281 ?auto_4279 ) ( GREATER-THAN ?auto_4281 ?auto_4280 ) ( GREATER-THAN ?auto_4279 ?auto_4296 ) ( GREATER-THAN ?auto_4280 ?auto_4296 ) ( GREATER-THAN ?auto_4281 ?auto_4296 ) ( GREATER-THAN ?auto_4279 ?auto_4290 ) ( GREATER-THAN ?auto_4280 ?auto_4290 ) ( GREATER-THAN ?auto_4281 ?auto_4290 ) ( GREATER-THAN ?auto_4279 ?auto_4299 ) ( GREATER-THAN ?auto_4280 ?auto_4299 ) ( GREATER-THAN ?auto_4281 ?auto_4299 ) ( GREATER-THAN ?auto_4279 ?auto_4282 ) ( GREATER-THAN ?auto_4280 ?auto_4282 ) ( GREATER-THAN ?auto_4281 ?auto_4282 ) ( GREATER-THAN ?auto_4279 ?auto_4298 ) ( GREATER-THAN ?auto_4280 ?auto_4298 ) ( GREATER-THAN ?auto_4281 ?auto_4298 ) ( GREATER-THAN ?auto_4279 ?auto_4283 ) ( GREATER-THAN ?auto_4280 ?auto_4283 ) ( GREATER-THAN ?auto_4281 ?auto_4283 ) ( IN-CITY ?auto_4284 ?auto_4285 ) ( IN-CITY ?auto_4278 ?auto_4285 ) ( not ( = ?auto_4278 ?auto_4284 ) ) ( OBJ-AT ?auto_4281 ?auto_4284 ) ( IN-CITY ?auto_4278 ?auto_4291 ) ( IN-CITY ?auto_4284 ?auto_4291 ) ( OBJ-AT ?auto_4283 ?auto_4278 ) ( OBJ-AT ?auto_4298 ?auto_4278 ) ( IN-CITY ?auto_4286 ?auto_4287 ) ( IN-CITY ?auto_4278 ?auto_4287 ) ( not ( = ?auto_4278 ?auto_4286 ) ) ( OBJ-AT ?auto_4282 ?auto_4278 ) ( OBJ-AT ?auto_4280 ?auto_4286 ) ( OBJ-AT ?auto_4299 ?auto_4278 ) ( IN-CITY ?auto_4278 ?auto_4288 ) ( IN-CITY ?auto_4286 ?auto_4288 ) ( OBJ-AT ?auto_4290 ?auto_4278 ) ( IN-TRUCK ?auto_4279 ?auto_4293 ) ( OBJ-AT ?auto_4296 ?auto_4278 ) ( TRUCK-AT ?auto_4293 ?auto_4302 ) ( IN-CITY ?auto_4302 ?auto_4303 ) ( IN-CITY ?auto_4278 ?auto_4303 ) ( not ( = ?auto_4278 ?auto_4302 ) ) ( OBJ-AT ?auto_4277 ?auto_4278 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4293 ?auto_4302 ?auto_4278 ?auto_4303 )
      ( DELIVER-4PKG ?auto_4296 ?auto_4279 ?auto_4280 ?auto_4281 ?auto_4278 )
      ( DELIVER-4PKG-VERIFY ?auto_4277 ?auto_4279 ?auto_4280 ?auto_4281 ?auto_4278 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4310 - OBJ
      ?auto_4312 - OBJ
      ?auto_4313 - OBJ
      ?auto_4314 - OBJ
      ?auto_4311 - LOCATION
    )
    :vars
    (
      ?auto_4317 - OBJ
      ?auto_4330 - OBJ
      ?auto_4325 - OBJ
      ?auto_4320 - OBJ
      ?auto_4333 - OBJ
      ?auto_4319 - OBJ
      ?auto_4326 - OBJ
      ?auto_4332 - LOCATION
      ?auto_4324 - CITY
      ?auto_4334 - CITY
      ?auto_4331 - LOCATION
      ?auto_4323 - CITY
      ?auto_4321 - CITY
      ?auto_4318 - TRUCK
      ?auto_4316 - LOCATION
      ?auto_4315 - CITY
      ?auto_4336 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4312 ?auto_4310 ) ( GREATER-THAN ?auto_4313 ?auto_4310 ) ( GREATER-THAN ?auto_4313 ?auto_4312 ) ( GREATER-THAN ?auto_4314 ?auto_4310 ) ( GREATER-THAN ?auto_4314 ?auto_4312 ) ( GREATER-THAN ?auto_4314 ?auto_4313 ) ( GREATER-THAN ?auto_4312 ?auto_4317 ) ( GREATER-THAN ?auto_4313 ?auto_4317 ) ( GREATER-THAN ?auto_4314 ?auto_4317 ) ( GREATER-THAN ?auto_4312 ?auto_4330 ) ( GREATER-THAN ?auto_4313 ?auto_4330 ) ( GREATER-THAN ?auto_4314 ?auto_4330 ) ( GREATER-THAN ?auto_4312 ?auto_4325 ) ( GREATER-THAN ?auto_4313 ?auto_4325 ) ( GREATER-THAN ?auto_4314 ?auto_4325 ) ( GREATER-THAN ?auto_4312 ?auto_4320 ) ( GREATER-THAN ?auto_4313 ?auto_4320 ) ( GREATER-THAN ?auto_4314 ?auto_4320 ) ( GREATER-THAN ?auto_4312 ?auto_4333 ) ( GREATER-THAN ?auto_4313 ?auto_4333 ) ( GREATER-THAN ?auto_4314 ?auto_4333 ) ( GREATER-THAN ?auto_4312 ?auto_4319 ) ( GREATER-THAN ?auto_4313 ?auto_4319 ) ( GREATER-THAN ?auto_4314 ?auto_4319 ) ( GREATER-THAN ?auto_4312 ?auto_4326 ) ( GREATER-THAN ?auto_4313 ?auto_4326 ) ( GREATER-THAN ?auto_4314 ?auto_4326 ) ( IN-CITY ?auto_4332 ?auto_4324 ) ( IN-CITY ?auto_4311 ?auto_4324 ) ( not ( = ?auto_4311 ?auto_4332 ) ) ( OBJ-AT ?auto_4314 ?auto_4332 ) ( IN-CITY ?auto_4311 ?auto_4334 ) ( IN-CITY ?auto_4332 ?auto_4334 ) ( OBJ-AT ?auto_4326 ?auto_4311 ) ( OBJ-AT ?auto_4319 ?auto_4311 ) ( IN-CITY ?auto_4331 ?auto_4323 ) ( IN-CITY ?auto_4311 ?auto_4323 ) ( not ( = ?auto_4311 ?auto_4331 ) ) ( OBJ-AT ?auto_4333 ?auto_4311 ) ( OBJ-AT ?auto_4313 ?auto_4331 ) ( OBJ-AT ?auto_4320 ?auto_4311 ) ( IN-CITY ?auto_4311 ?auto_4321 ) ( IN-CITY ?auto_4331 ?auto_4321 ) ( OBJ-AT ?auto_4325 ?auto_4311 ) ( OBJ-AT ?auto_4330 ?auto_4311 ) ( TRUCK-AT ?auto_4318 ?auto_4316 ) ( IN-CITY ?auto_4316 ?auto_4315 ) ( IN-CITY ?auto_4311 ?auto_4315 ) ( not ( = ?auto_4311 ?auto_4316 ) ) ( OBJ-AT ?auto_4317 ?auto_4311 ) ( TRUCK-AT ?auto_4318 ?auto_4336 ) ( OBJ-AT ?auto_4312 ?auto_4336 ) ( OBJ-AT ?auto_4310 ?auto_4311 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4312 ?auto_4318 ?auto_4336 )
      ( DELIVER-4PKG ?auto_4317 ?auto_4312 ?auto_4313 ?auto_4314 ?auto_4311 )
      ( DELIVER-4PKG-VERIFY ?auto_4310 ?auto_4312 ?auto_4313 ?auto_4314 ?auto_4311 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4343 - OBJ
      ?auto_4345 - OBJ
      ?auto_4346 - OBJ
      ?auto_4347 - OBJ
      ?auto_4344 - LOCATION
    )
    :vars
    (
      ?auto_4365 - OBJ
      ?auto_4369 - OBJ
      ?auto_4354 - OBJ
      ?auto_4368 - OBJ
      ?auto_4357 - OBJ
      ?auto_4362 - OBJ
      ?auto_4361 - OBJ
      ?auto_4348 - OBJ
      ?auto_4350 - LOCATION
      ?auto_4349 - CITY
      ?auto_4351 - CITY
      ?auto_4363 - LOCATION
      ?auto_4366 - CITY
      ?auto_4355 - CITY
      ?auto_4358 - LOCATION
      ?auto_4360 - CITY
      ?auto_4364 - TRUCK
      ?auto_4371 - LOCATION
      ?auto_4372 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4345 ?auto_4343 ) ( GREATER-THAN ?auto_4346 ?auto_4343 ) ( GREATER-THAN ?auto_4346 ?auto_4345 ) ( GREATER-THAN ?auto_4347 ?auto_4343 ) ( GREATER-THAN ?auto_4347 ?auto_4345 ) ( GREATER-THAN ?auto_4347 ?auto_4346 ) ( GREATER-THAN ?auto_4345 ?auto_4365 ) ( GREATER-THAN ?auto_4346 ?auto_4365 ) ( GREATER-THAN ?auto_4347 ?auto_4365 ) ( GREATER-THAN ?auto_4345 ?auto_4369 ) ( GREATER-THAN ?auto_4346 ?auto_4369 ) ( GREATER-THAN ?auto_4347 ?auto_4369 ) ( GREATER-THAN ?auto_4345 ?auto_4354 ) ( GREATER-THAN ?auto_4346 ?auto_4354 ) ( GREATER-THAN ?auto_4347 ?auto_4354 ) ( GREATER-THAN ?auto_4345 ?auto_4368 ) ( GREATER-THAN ?auto_4346 ?auto_4368 ) ( GREATER-THAN ?auto_4347 ?auto_4368 ) ( GREATER-THAN ?auto_4345 ?auto_4357 ) ( GREATER-THAN ?auto_4346 ?auto_4357 ) ( GREATER-THAN ?auto_4347 ?auto_4357 ) ( GREATER-THAN ?auto_4345 ?auto_4362 ) ( GREATER-THAN ?auto_4346 ?auto_4362 ) ( GREATER-THAN ?auto_4347 ?auto_4362 ) ( GREATER-THAN ?auto_4345 ?auto_4361 ) ( GREATER-THAN ?auto_4346 ?auto_4361 ) ( GREATER-THAN ?auto_4347 ?auto_4361 ) ( GREATER-THAN ?auto_4345 ?auto_4348 ) ( GREATER-THAN ?auto_4346 ?auto_4348 ) ( GREATER-THAN ?auto_4347 ?auto_4348 ) ( IN-CITY ?auto_4350 ?auto_4349 ) ( IN-CITY ?auto_4344 ?auto_4349 ) ( not ( = ?auto_4344 ?auto_4350 ) ) ( OBJ-AT ?auto_4347 ?auto_4350 ) ( IN-CITY ?auto_4344 ?auto_4351 ) ( IN-CITY ?auto_4350 ?auto_4351 ) ( OBJ-AT ?auto_4348 ?auto_4344 ) ( OBJ-AT ?auto_4361 ?auto_4344 ) ( IN-CITY ?auto_4363 ?auto_4366 ) ( IN-CITY ?auto_4344 ?auto_4366 ) ( not ( = ?auto_4344 ?auto_4363 ) ) ( OBJ-AT ?auto_4362 ?auto_4344 ) ( OBJ-AT ?auto_4346 ?auto_4363 ) ( OBJ-AT ?auto_4357 ?auto_4344 ) ( IN-CITY ?auto_4344 ?auto_4355 ) ( IN-CITY ?auto_4363 ?auto_4355 ) ( OBJ-AT ?auto_4368 ?auto_4344 ) ( OBJ-AT ?auto_4354 ?auto_4344 ) ( IN-CITY ?auto_4358 ?auto_4360 ) ( IN-CITY ?auto_4344 ?auto_4360 ) ( not ( = ?auto_4344 ?auto_4358 ) ) ( OBJ-AT ?auto_4369 ?auto_4344 ) ( OBJ-AT ?auto_4345 ?auto_4358 ) ( OBJ-AT ?auto_4365 ?auto_4344 ) ( TRUCK-AT ?auto_4364 ?auto_4371 ) ( IN-CITY ?auto_4371 ?auto_4372 ) ( IN-CITY ?auto_4358 ?auto_4372 ) ( not ( = ?auto_4358 ?auto_4371 ) ) ( OBJ-AT ?auto_4343 ?auto_4344 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4364 ?auto_4371 ?auto_4358 ?auto_4372 )
      ( DELIVER-4PKG ?auto_4365 ?auto_4345 ?auto_4346 ?auto_4347 ?auto_4344 )
      ( DELIVER-4PKG-VERIFY ?auto_4343 ?auto_4345 ?auto_4346 ?auto_4347 ?auto_4344 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4385 - OBJ
      ?auto_4381 - OBJ
      ?auto_4382 - OBJ
      ?auto_4383 - OBJ
      ?auto_4380 - LOCATION
    )
    :vars
    (
      ?auto_4396 - LOCATION
      ?auto_4401 - CITY
      ?auto_4400 - CITY
      ?auto_4393 - LOCATION
      ?auto_4390 - CITY
      ?auto_4397 - CITY
      ?auto_4386 - LOCATION
      ?auto_4387 - CITY
      ?auto_4395 - TRUCK
      ?auto_4403 - LOCATION
      ?auto_4402 - CITY
      ?auto_4410 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4381 ?auto_4385 ) ( GREATER-THAN ?auto_4382 ?auto_4385 ) ( GREATER-THAN ?auto_4382 ?auto_4381 ) ( GREATER-THAN ?auto_4383 ?auto_4385 ) ( GREATER-THAN ?auto_4383 ?auto_4381 ) ( GREATER-THAN ?auto_4383 ?auto_4382 ) ( IN-CITY ?auto_4396 ?auto_4401 ) ( IN-CITY ?auto_4380 ?auto_4401 ) ( not ( = ?auto_4380 ?auto_4396 ) ) ( OBJ-AT ?auto_4383 ?auto_4396 ) ( IN-CITY ?auto_4380 ?auto_4400 ) ( IN-CITY ?auto_4396 ?auto_4400 ) ( IN-CITY ?auto_4393 ?auto_4390 ) ( IN-CITY ?auto_4380 ?auto_4390 ) ( not ( = ?auto_4380 ?auto_4393 ) ) ( OBJ-AT ?auto_4382 ?auto_4393 ) ( IN-CITY ?auto_4380 ?auto_4397 ) ( IN-CITY ?auto_4393 ?auto_4397 ) ( IN-CITY ?auto_4386 ?auto_4387 ) ( IN-CITY ?auto_4380 ?auto_4387 ) ( not ( = ?auto_4380 ?auto_4386 ) ) ( OBJ-AT ?auto_4381 ?auto_4386 ) ( TRUCK-AT ?auto_4395 ?auto_4403 ) ( IN-CITY ?auto_4403 ?auto_4402 ) ( IN-CITY ?auto_4386 ?auto_4402 ) ( not ( = ?auto_4386 ?auto_4403 ) ) ( TRUCK-AT ?auto_4410 ?auto_4380 ) ( IN-TRUCK ?auto_4385 ?auto_4410 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4385 ?auto_4380 )
      ( DELIVER-4PKG ?auto_4385 ?auto_4381 ?auto_4382 ?auto_4383 ?auto_4380 )
      ( DELIVER-4PKG-VERIFY ?auto_4385 ?auto_4381 ?auto_4382 ?auto_4383 ?auto_4380 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4416 - OBJ
      ?auto_4418 - OBJ
      ?auto_4419 - OBJ
      ?auto_4420 - OBJ
      ?auto_4417 - LOCATION
    )
    :vars
    (
      ?auto_4436 - LOCATION
      ?auto_4427 - CITY
      ?auto_4435 - CITY
      ?auto_4422 - LOCATION
      ?auto_4429 - CITY
      ?auto_4428 - CITY
      ?auto_4430 - LOCATION
      ?auto_4431 - CITY
      ?auto_4423 - CITY
      ?auto_4433 - TRUCK
      ?auto_4439 - LOCATION
      ?auto_4440 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4418 ?auto_4416 ) ( GREATER-THAN ?auto_4419 ?auto_4416 ) ( GREATER-THAN ?auto_4419 ?auto_4418 ) ( GREATER-THAN ?auto_4420 ?auto_4416 ) ( GREATER-THAN ?auto_4420 ?auto_4418 ) ( GREATER-THAN ?auto_4420 ?auto_4419 ) ( IN-CITY ?auto_4436 ?auto_4427 ) ( IN-CITY ?auto_4417 ?auto_4427 ) ( not ( = ?auto_4417 ?auto_4436 ) ) ( OBJ-AT ?auto_4420 ?auto_4436 ) ( IN-CITY ?auto_4417 ?auto_4435 ) ( IN-CITY ?auto_4436 ?auto_4435 ) ( IN-CITY ?auto_4422 ?auto_4429 ) ( IN-CITY ?auto_4417 ?auto_4429 ) ( not ( = ?auto_4417 ?auto_4422 ) ) ( OBJ-AT ?auto_4419 ?auto_4422 ) ( IN-CITY ?auto_4417 ?auto_4428 ) ( IN-CITY ?auto_4422 ?auto_4428 ) ( IN-CITY ?auto_4430 ?auto_4431 ) ( IN-CITY ?auto_4417 ?auto_4431 ) ( not ( = ?auto_4417 ?auto_4430 ) ) ( OBJ-AT ?auto_4418 ?auto_4430 ) ( IN-CITY ?auto_4417 ?auto_4423 ) ( IN-CITY ?auto_4430 ?auto_4423 ) ( IN-TRUCK ?auto_4416 ?auto_4433 ) ( TRUCK-AT ?auto_4433 ?auto_4439 ) ( IN-CITY ?auto_4439 ?auto_4440 ) ( IN-CITY ?auto_4417 ?auto_4440 ) ( not ( = ?auto_4417 ?auto_4439 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4433 ?auto_4439 ?auto_4417 ?auto_4440 )
      ( DELIVER-4PKG ?auto_4416 ?auto_4418 ?auto_4419 ?auto_4420 ?auto_4417 )
      ( DELIVER-4PKG-VERIFY ?auto_4416 ?auto_4418 ?auto_4419 ?auto_4420 ?auto_4417 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4447 - OBJ
      ?auto_4449 - OBJ
      ?auto_4450 - OBJ
      ?auto_4451 - OBJ
      ?auto_4448 - LOCATION
    )
    :vars
    (
      ?auto_4468 - LOCATION
      ?auto_4457 - CITY
      ?auto_4455 - CITY
      ?auto_4461 - LOCATION
      ?auto_4463 - CITY
      ?auto_4456 - CITY
      ?auto_4462 - LOCATION
      ?auto_4467 - CITY
      ?auto_4460 - CITY
      ?auto_4459 - TRUCK
      ?auto_4465 - LOCATION
      ?auto_4454 - CITY
      ?auto_4470 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4449 ?auto_4447 ) ( GREATER-THAN ?auto_4450 ?auto_4447 ) ( GREATER-THAN ?auto_4450 ?auto_4449 ) ( GREATER-THAN ?auto_4451 ?auto_4447 ) ( GREATER-THAN ?auto_4451 ?auto_4449 ) ( GREATER-THAN ?auto_4451 ?auto_4450 ) ( IN-CITY ?auto_4468 ?auto_4457 ) ( IN-CITY ?auto_4448 ?auto_4457 ) ( not ( = ?auto_4448 ?auto_4468 ) ) ( OBJ-AT ?auto_4451 ?auto_4468 ) ( IN-CITY ?auto_4448 ?auto_4455 ) ( IN-CITY ?auto_4468 ?auto_4455 ) ( IN-CITY ?auto_4461 ?auto_4463 ) ( IN-CITY ?auto_4448 ?auto_4463 ) ( not ( = ?auto_4448 ?auto_4461 ) ) ( OBJ-AT ?auto_4450 ?auto_4461 ) ( IN-CITY ?auto_4448 ?auto_4456 ) ( IN-CITY ?auto_4461 ?auto_4456 ) ( IN-CITY ?auto_4462 ?auto_4467 ) ( IN-CITY ?auto_4448 ?auto_4467 ) ( not ( = ?auto_4448 ?auto_4462 ) ) ( OBJ-AT ?auto_4449 ?auto_4462 ) ( IN-CITY ?auto_4448 ?auto_4460 ) ( IN-CITY ?auto_4462 ?auto_4460 ) ( TRUCK-AT ?auto_4459 ?auto_4465 ) ( IN-CITY ?auto_4465 ?auto_4454 ) ( IN-CITY ?auto_4448 ?auto_4454 ) ( not ( = ?auto_4448 ?auto_4465 ) ) ( TRUCK-AT ?auto_4459 ?auto_4470 ) ( OBJ-AT ?auto_4447 ?auto_4470 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4447 ?auto_4459 ?auto_4470 )
      ( DELIVER-4PKG ?auto_4447 ?auto_4449 ?auto_4450 ?auto_4451 ?auto_4448 )
      ( DELIVER-4PKG-VERIFY ?auto_4447 ?auto_4449 ?auto_4450 ?auto_4451 ?auto_4448 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4477 - OBJ
      ?auto_4479 - OBJ
      ?auto_4480 - OBJ
      ?auto_4481 - OBJ
      ?auto_4478 - LOCATION
    )
    :vars
    (
      ?auto_4496 - LOCATION
      ?auto_4487 - CITY
      ?auto_4495 - CITY
      ?auto_4484 - LOCATION
      ?auto_4488 - CITY
      ?auto_4498 - CITY
      ?auto_4486 - LOCATION
      ?auto_4499 - CITY
      ?auto_4483 - CITY
      ?auto_4490 - LOCATION
      ?auto_4497 - CITY
      ?auto_4482 - TRUCK
      ?auto_4501 - LOCATION
      ?auto_4502 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4479 ?auto_4477 ) ( GREATER-THAN ?auto_4480 ?auto_4477 ) ( GREATER-THAN ?auto_4480 ?auto_4479 ) ( GREATER-THAN ?auto_4481 ?auto_4477 ) ( GREATER-THAN ?auto_4481 ?auto_4479 ) ( GREATER-THAN ?auto_4481 ?auto_4480 ) ( IN-CITY ?auto_4496 ?auto_4487 ) ( IN-CITY ?auto_4478 ?auto_4487 ) ( not ( = ?auto_4478 ?auto_4496 ) ) ( OBJ-AT ?auto_4481 ?auto_4496 ) ( IN-CITY ?auto_4478 ?auto_4495 ) ( IN-CITY ?auto_4496 ?auto_4495 ) ( IN-CITY ?auto_4484 ?auto_4488 ) ( IN-CITY ?auto_4478 ?auto_4488 ) ( not ( = ?auto_4478 ?auto_4484 ) ) ( OBJ-AT ?auto_4480 ?auto_4484 ) ( IN-CITY ?auto_4478 ?auto_4498 ) ( IN-CITY ?auto_4484 ?auto_4498 ) ( IN-CITY ?auto_4486 ?auto_4499 ) ( IN-CITY ?auto_4478 ?auto_4499 ) ( not ( = ?auto_4478 ?auto_4486 ) ) ( OBJ-AT ?auto_4479 ?auto_4486 ) ( IN-CITY ?auto_4478 ?auto_4483 ) ( IN-CITY ?auto_4486 ?auto_4483 ) ( IN-CITY ?auto_4490 ?auto_4497 ) ( IN-CITY ?auto_4478 ?auto_4497 ) ( not ( = ?auto_4478 ?auto_4490 ) ) ( OBJ-AT ?auto_4477 ?auto_4490 ) ( TRUCK-AT ?auto_4482 ?auto_4501 ) ( IN-CITY ?auto_4501 ?auto_4502 ) ( IN-CITY ?auto_4490 ?auto_4502 ) ( not ( = ?auto_4490 ?auto_4501 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4482 ?auto_4501 ?auto_4490 ?auto_4502 )
      ( DELIVER-4PKG ?auto_4477 ?auto_4479 ?auto_4480 ?auto_4481 ?auto_4478 )
      ( DELIVER-4PKG-VERIFY ?auto_4477 ?auto_4479 ?auto_4480 ?auto_4481 ?auto_4478 ) )
  )

)

