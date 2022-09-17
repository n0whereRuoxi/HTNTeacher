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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3634 - OBJ
      ?auto_3635 - LOCATION
    )
    :vars
    (
      ?auto_3644 - LOCATION
      ?auto_3641 - CITY
      ?auto_3636 - TRUCK
      ?auto_3647 - LOCATION
      ?auto_3648 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_3644 ?auto_3641 ) ( IN-CITY ?auto_3635 ?auto_3641 ) ( not ( = ?auto_3635 ?auto_3644 ) ) ( OBJ-AT ?auto_3634 ?auto_3644 ) ( TRUCK-AT ?auto_3636 ?auto_3647 ) ( IN-CITY ?auto_3647 ?auto_3648 ) ( IN-CITY ?auto_3644 ?auto_3648 ) ( not ( = ?auto_3644 ?auto_3647 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3636 ?auto_3647 ?auto_3644 ?auto_3648 )
      ( !LOAD-TRUCK ?auto_3634 ?auto_3636 ?auto_3644 )
      ( !DRIVE-TRUCK ?auto_3636 ?auto_3644 ?auto_3635 ?auto_3641 )
      ( !UNLOAD-TRUCK ?auto_3634 ?auto_3636 ?auto_3635 )
      ( DELIVER-1PKG-VERIFY ?auto_3634 ?auto_3635 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3671 - OBJ
      ?auto_3673 - OBJ
      ?auto_3676 - LOCATION
    )
    :vars
    (
      ?auto_3678 - LOCATION
      ?auto_3680 - CITY
      ?auto_3675 - CITY
      ?auto_3682 - LOCATION
      ?auto_3681 - CITY
      ?auto_3679 - TRUCK
      ?auto_3683 - LOCATION
      ?auto_3687 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3673 ?auto_3671 ) ( IN-CITY ?auto_3678 ?auto_3680 ) ( IN-CITY ?auto_3676 ?auto_3680 ) ( not ( = ?auto_3676 ?auto_3678 ) ) ( OBJ-AT ?auto_3673 ?auto_3678 ) ( IN-CITY ?auto_3676 ?auto_3675 ) ( IN-CITY ?auto_3678 ?auto_3675 ) ( IN-CITY ?auto_3682 ?auto_3681 ) ( IN-CITY ?auto_3676 ?auto_3681 ) ( not ( = ?auto_3676 ?auto_3682 ) ) ( OBJ-AT ?auto_3671 ?auto_3682 ) ( TRUCK-AT ?auto_3679 ?auto_3683 ) ( IN-CITY ?auto_3683 ?auto_3687 ) ( IN-CITY ?auto_3682 ?auto_3687 ) ( not ( = ?auto_3682 ?auto_3683 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3671 ?auto_3676 )
      ( DELIVER-1PKG ?auto_3673 ?auto_3676 )
      ( DELIVER-2PKG-VERIFY ?auto_3671 ?auto_3673 ?auto_3676 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3710 - OBJ
      ?auto_3712 - OBJ
      ?auto_3713 - OBJ
      ?auto_3716 - LOCATION
    )
    :vars
    (
      ?auto_3718 - LOCATION
      ?auto_3714 - CITY
      ?auto_3717 - CITY
      ?auto_3726 - LOCATION
      ?auto_3728 - CITY
      ?auto_3730 - CITY
      ?auto_3722 - LOCATION
      ?auto_3731 - CITY
      ?auto_3715 - TRUCK
      ?auto_3723 - LOCATION
      ?auto_3721 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3712 ?auto_3710 ) ( GREATER-THAN ?auto_3713 ?auto_3710 ) ( GREATER-THAN ?auto_3713 ?auto_3712 ) ( IN-CITY ?auto_3718 ?auto_3714 ) ( IN-CITY ?auto_3716 ?auto_3714 ) ( not ( = ?auto_3716 ?auto_3718 ) ) ( OBJ-AT ?auto_3713 ?auto_3718 ) ( IN-CITY ?auto_3716 ?auto_3717 ) ( IN-CITY ?auto_3718 ?auto_3717 ) ( IN-CITY ?auto_3726 ?auto_3728 ) ( IN-CITY ?auto_3716 ?auto_3728 ) ( not ( = ?auto_3716 ?auto_3726 ) ) ( OBJ-AT ?auto_3712 ?auto_3726 ) ( IN-CITY ?auto_3716 ?auto_3730 ) ( IN-CITY ?auto_3726 ?auto_3730 ) ( IN-CITY ?auto_3722 ?auto_3731 ) ( IN-CITY ?auto_3716 ?auto_3731 ) ( not ( = ?auto_3716 ?auto_3722 ) ) ( OBJ-AT ?auto_3710 ?auto_3722 ) ( TRUCK-AT ?auto_3715 ?auto_3723 ) ( IN-CITY ?auto_3723 ?auto_3721 ) ( IN-CITY ?auto_3722 ?auto_3721 ) ( not ( = ?auto_3722 ?auto_3723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3710 ?auto_3712 ?auto_3716 )
      ( DELIVER-1PKG ?auto_3713 ?auto_3716 )
      ( DELIVER-3PKG-VERIFY ?auto_3710 ?auto_3712 ?auto_3713 ?auto_3716 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3755 - OBJ
      ?auto_3757 - OBJ
      ?auto_3758 - OBJ
      ?auto_3759 - OBJ
      ?auto_3764 - LOCATION
    )
    :vars
    (
      ?auto_3765 - LOCATION
      ?auto_3762 - CITY
      ?auto_3763 - CITY
      ?auto_3768 - LOCATION
      ?auto_3767 - CITY
      ?auto_3771 - CITY
      ?auto_3773 - LOCATION
      ?auto_3774 - CITY
      ?auto_3779 - CITY
      ?auto_3772 - LOCATION
      ?auto_3777 - CITY
      ?auto_3761 - TRUCK
      ?auto_3775 - LOCATION
      ?auto_3780 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3757 ?auto_3755 ) ( GREATER-THAN ?auto_3758 ?auto_3755 ) ( GREATER-THAN ?auto_3758 ?auto_3757 ) ( GREATER-THAN ?auto_3759 ?auto_3755 ) ( GREATER-THAN ?auto_3759 ?auto_3757 ) ( GREATER-THAN ?auto_3759 ?auto_3758 ) ( IN-CITY ?auto_3765 ?auto_3762 ) ( IN-CITY ?auto_3764 ?auto_3762 ) ( not ( = ?auto_3764 ?auto_3765 ) ) ( OBJ-AT ?auto_3759 ?auto_3765 ) ( IN-CITY ?auto_3764 ?auto_3763 ) ( IN-CITY ?auto_3765 ?auto_3763 ) ( IN-CITY ?auto_3768 ?auto_3767 ) ( IN-CITY ?auto_3764 ?auto_3767 ) ( not ( = ?auto_3764 ?auto_3768 ) ) ( OBJ-AT ?auto_3758 ?auto_3768 ) ( IN-CITY ?auto_3764 ?auto_3771 ) ( IN-CITY ?auto_3768 ?auto_3771 ) ( IN-CITY ?auto_3773 ?auto_3774 ) ( IN-CITY ?auto_3764 ?auto_3774 ) ( not ( = ?auto_3764 ?auto_3773 ) ) ( OBJ-AT ?auto_3757 ?auto_3773 ) ( IN-CITY ?auto_3764 ?auto_3779 ) ( IN-CITY ?auto_3773 ?auto_3779 ) ( IN-CITY ?auto_3772 ?auto_3777 ) ( IN-CITY ?auto_3764 ?auto_3777 ) ( not ( = ?auto_3764 ?auto_3772 ) ) ( OBJ-AT ?auto_3755 ?auto_3772 ) ( TRUCK-AT ?auto_3761 ?auto_3775 ) ( IN-CITY ?auto_3775 ?auto_3780 ) ( IN-CITY ?auto_3772 ?auto_3780 ) ( not ( = ?auto_3772 ?auto_3775 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3755 ?auto_3757 ?auto_3758 ?auto_3764 )
      ( DELIVER-1PKG ?auto_3759 ?auto_3764 )
      ( DELIVER-4PKG-VERIFY ?auto_3755 ?auto_3757 ?auto_3758 ?auto_3759 ?auto_3764 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3806 - OBJ
      ?auto_3808 - OBJ
      ?auto_3809 - OBJ
      ?auto_3810 - OBJ
      ?auto_3811 - OBJ
      ?auto_3814 - LOCATION
    )
    :vars
    (
      ?auto_3816 - LOCATION
      ?auto_3817 - CITY
      ?auto_3813 - CITY
      ?auto_3831 - LOCATION
      ?auto_3830 - CITY
      ?auto_3822 - CITY
      ?auto_3824 - LOCATION
      ?auto_3819 - CITY
      ?auto_3837 - CITY
      ?auto_3829 - LOCATION
      ?auto_3836 - CITY
      ?auto_3828 - CITY
      ?auto_3833 - LOCATION
      ?auto_3820 - CITY
      ?auto_3818 - TRUCK
      ?auto_3834 - LOCATION
      ?auto_3823 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3808 ?auto_3806 ) ( GREATER-THAN ?auto_3809 ?auto_3806 ) ( GREATER-THAN ?auto_3809 ?auto_3808 ) ( GREATER-THAN ?auto_3810 ?auto_3806 ) ( GREATER-THAN ?auto_3810 ?auto_3808 ) ( GREATER-THAN ?auto_3810 ?auto_3809 ) ( GREATER-THAN ?auto_3811 ?auto_3806 ) ( GREATER-THAN ?auto_3811 ?auto_3808 ) ( GREATER-THAN ?auto_3811 ?auto_3809 ) ( GREATER-THAN ?auto_3811 ?auto_3810 ) ( IN-CITY ?auto_3816 ?auto_3817 ) ( IN-CITY ?auto_3814 ?auto_3817 ) ( not ( = ?auto_3814 ?auto_3816 ) ) ( OBJ-AT ?auto_3811 ?auto_3816 ) ( IN-CITY ?auto_3814 ?auto_3813 ) ( IN-CITY ?auto_3816 ?auto_3813 ) ( IN-CITY ?auto_3831 ?auto_3830 ) ( IN-CITY ?auto_3814 ?auto_3830 ) ( not ( = ?auto_3814 ?auto_3831 ) ) ( OBJ-AT ?auto_3810 ?auto_3831 ) ( IN-CITY ?auto_3814 ?auto_3822 ) ( IN-CITY ?auto_3831 ?auto_3822 ) ( IN-CITY ?auto_3824 ?auto_3819 ) ( IN-CITY ?auto_3814 ?auto_3819 ) ( not ( = ?auto_3814 ?auto_3824 ) ) ( OBJ-AT ?auto_3809 ?auto_3824 ) ( IN-CITY ?auto_3814 ?auto_3837 ) ( IN-CITY ?auto_3824 ?auto_3837 ) ( IN-CITY ?auto_3829 ?auto_3836 ) ( IN-CITY ?auto_3814 ?auto_3836 ) ( not ( = ?auto_3814 ?auto_3829 ) ) ( OBJ-AT ?auto_3808 ?auto_3829 ) ( IN-CITY ?auto_3814 ?auto_3828 ) ( IN-CITY ?auto_3829 ?auto_3828 ) ( IN-CITY ?auto_3833 ?auto_3820 ) ( IN-CITY ?auto_3814 ?auto_3820 ) ( not ( = ?auto_3814 ?auto_3833 ) ) ( OBJ-AT ?auto_3806 ?auto_3833 ) ( TRUCK-AT ?auto_3818 ?auto_3834 ) ( IN-CITY ?auto_3834 ?auto_3823 ) ( IN-CITY ?auto_3833 ?auto_3823 ) ( not ( = ?auto_3833 ?auto_3834 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3806 ?auto_3808 ?auto_3809 ?auto_3810 ?auto_3814 )
      ( DELIVER-1PKG ?auto_3811 ?auto_3814 )
      ( DELIVER-5PKG-VERIFY ?auto_3806 ?auto_3808 ?auto_3809 ?auto_3810 ?auto_3811 ?auto_3814 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3863 - OBJ
      ?auto_3865 - OBJ
      ?auto_3866 - OBJ
      ?auto_3867 - OBJ
      ?auto_3868 - OBJ
      ?auto_3869 - OBJ
      ?auto_3874 - LOCATION
    )
    :vars
    (
      ?auto_3872 - LOCATION
      ?auto_3875 - CITY
      ?auto_3871 - CITY
      ?auto_3893 - LOCATION
      ?auto_3896 - CITY
      ?auto_3880 - CITY
      ?auto_3894 - LOCATION
      ?auto_3890 - CITY
      ?auto_3877 - CITY
      ?auto_3879 - LOCATION
      ?auto_3897 - CITY
      ?auto_3888 - CITY
      ?auto_3889 - LOCATION
      ?auto_3881 - CITY
      ?auto_3898 - CITY
      ?auto_3886 - LOCATION
      ?auto_3884 - CITY
      ?auto_3870 - TRUCK
      ?auto_3895 - LOCATION
      ?auto_3891 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3865 ?auto_3863 ) ( GREATER-THAN ?auto_3866 ?auto_3863 ) ( GREATER-THAN ?auto_3866 ?auto_3865 ) ( GREATER-THAN ?auto_3867 ?auto_3863 ) ( GREATER-THAN ?auto_3867 ?auto_3865 ) ( GREATER-THAN ?auto_3867 ?auto_3866 ) ( GREATER-THAN ?auto_3868 ?auto_3863 ) ( GREATER-THAN ?auto_3868 ?auto_3865 ) ( GREATER-THAN ?auto_3868 ?auto_3866 ) ( GREATER-THAN ?auto_3868 ?auto_3867 ) ( GREATER-THAN ?auto_3869 ?auto_3863 ) ( GREATER-THAN ?auto_3869 ?auto_3865 ) ( GREATER-THAN ?auto_3869 ?auto_3866 ) ( GREATER-THAN ?auto_3869 ?auto_3867 ) ( GREATER-THAN ?auto_3869 ?auto_3868 ) ( IN-CITY ?auto_3872 ?auto_3875 ) ( IN-CITY ?auto_3874 ?auto_3875 ) ( not ( = ?auto_3874 ?auto_3872 ) ) ( OBJ-AT ?auto_3869 ?auto_3872 ) ( IN-CITY ?auto_3874 ?auto_3871 ) ( IN-CITY ?auto_3872 ?auto_3871 ) ( IN-CITY ?auto_3893 ?auto_3896 ) ( IN-CITY ?auto_3874 ?auto_3896 ) ( not ( = ?auto_3874 ?auto_3893 ) ) ( OBJ-AT ?auto_3868 ?auto_3893 ) ( IN-CITY ?auto_3874 ?auto_3880 ) ( IN-CITY ?auto_3893 ?auto_3880 ) ( IN-CITY ?auto_3894 ?auto_3890 ) ( IN-CITY ?auto_3874 ?auto_3890 ) ( not ( = ?auto_3874 ?auto_3894 ) ) ( OBJ-AT ?auto_3867 ?auto_3894 ) ( IN-CITY ?auto_3874 ?auto_3877 ) ( IN-CITY ?auto_3894 ?auto_3877 ) ( IN-CITY ?auto_3879 ?auto_3897 ) ( IN-CITY ?auto_3874 ?auto_3897 ) ( not ( = ?auto_3874 ?auto_3879 ) ) ( OBJ-AT ?auto_3866 ?auto_3879 ) ( IN-CITY ?auto_3874 ?auto_3888 ) ( IN-CITY ?auto_3879 ?auto_3888 ) ( IN-CITY ?auto_3889 ?auto_3881 ) ( IN-CITY ?auto_3874 ?auto_3881 ) ( not ( = ?auto_3874 ?auto_3889 ) ) ( OBJ-AT ?auto_3865 ?auto_3889 ) ( IN-CITY ?auto_3874 ?auto_3898 ) ( IN-CITY ?auto_3889 ?auto_3898 ) ( IN-CITY ?auto_3886 ?auto_3884 ) ( IN-CITY ?auto_3874 ?auto_3884 ) ( not ( = ?auto_3874 ?auto_3886 ) ) ( OBJ-AT ?auto_3863 ?auto_3886 ) ( TRUCK-AT ?auto_3870 ?auto_3895 ) ( IN-CITY ?auto_3895 ?auto_3891 ) ( IN-CITY ?auto_3886 ?auto_3891 ) ( not ( = ?auto_3886 ?auto_3895 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3863 ?auto_3865 ?auto_3866 ?auto_3867 ?auto_3868 ?auto_3874 )
      ( DELIVER-1PKG ?auto_3869 ?auto_3874 )
      ( DELIVER-6PKG-VERIFY ?auto_3863 ?auto_3865 ?auto_3866 ?auto_3867 ?auto_3868 ?auto_3869 ?auto_3874 ) )
  )

)

