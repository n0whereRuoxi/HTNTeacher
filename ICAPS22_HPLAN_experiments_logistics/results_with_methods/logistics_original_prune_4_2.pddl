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
      ?auto_95570 - OBJ
      ?auto_95569 - LOCATION
    )
    :vars
    (
      ?auto_95571 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95571 ?auto_95569 ) ( IN-TRUCK ?auto_95570 ?auto_95571 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_95570 ?auto_95571 ?auto_95569 )
      ( DELIVER-1PKG-VERIFY ?auto_95570 ?auto_95569 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95588 - OBJ
      ?auto_95587 - LOCATION
    )
    :vars
    (
      ?auto_95589 - TRUCK
      ?auto_95590 - LOCATION
      ?auto_95591 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95588 ?auto_95589 ) ( TRUCK-AT ?auto_95589 ?auto_95590 ) ( IN-CITY ?auto_95590 ?auto_95591 ) ( IN-CITY ?auto_95587 ?auto_95591 ) ( not ( = ?auto_95587 ?auto_95590 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95589 ?auto_95590 ?auto_95587 ?auto_95591 )
      ( DELIVER-1PKG ?auto_95588 ?auto_95587 )
      ( DELIVER-1PKG-VERIFY ?auto_95588 ?auto_95587 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95614 - OBJ
      ?auto_95613 - LOCATION
    )
    :vars
    (
      ?auto_95615 - TRUCK
      ?auto_95616 - LOCATION
      ?auto_95617 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95615 ?auto_95616 ) ( IN-CITY ?auto_95616 ?auto_95617 ) ( IN-CITY ?auto_95613 ?auto_95617 ) ( not ( = ?auto_95613 ?auto_95616 ) ) ( OBJ-AT ?auto_95614 ?auto_95616 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_95614 ?auto_95615 ?auto_95616 )
      ( DELIVER-1PKG ?auto_95614 ?auto_95613 )
      ( DELIVER-1PKG-VERIFY ?auto_95614 ?auto_95613 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95640 - OBJ
      ?auto_95639 - LOCATION
    )
    :vars
    (
      ?auto_95643 - LOCATION
      ?auto_95641 - CITY
      ?auto_95642 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95643 ?auto_95641 ) ( IN-CITY ?auto_95639 ?auto_95641 ) ( not ( = ?auto_95639 ?auto_95643 ) ) ( OBJ-AT ?auto_95640 ?auto_95643 ) ( TRUCK-AT ?auto_95642 ?auto_95639 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95642 ?auto_95639 ?auto_95643 ?auto_95641 )
      ( DELIVER-1PKG ?auto_95640 ?auto_95639 )
      ( DELIVER-1PKG-VERIFY ?auto_95640 ?auto_95639 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95783 - OBJ
      ?auto_95784 - OBJ
      ?auto_95782 - LOCATION
    )
    :vars
    (
      ?auto_95785 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95785 ?auto_95782 ) ( IN-TRUCK ?auto_95784 ?auto_95785 ) ( OBJ-AT ?auto_95783 ?auto_95782 ) ( not ( = ?auto_95783 ?auto_95784 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95784 ?auto_95782 )
      ( DELIVER-2PKG-VERIFY ?auto_95783 ?auto_95784 ?auto_95782 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95787 - OBJ
      ?auto_95788 - OBJ
      ?auto_95786 - LOCATION
    )
    :vars
    (
      ?auto_95789 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95789 ?auto_95786 ) ( IN-TRUCK ?auto_95787 ?auto_95789 ) ( OBJ-AT ?auto_95788 ?auto_95786 ) ( not ( = ?auto_95787 ?auto_95788 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95787 ?auto_95786 )
      ( DELIVER-2PKG-VERIFY ?auto_95787 ?auto_95788 ?auto_95786 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95795 - OBJ
      ?auto_95796 - OBJ
      ?auto_95797 - OBJ
      ?auto_95794 - LOCATION
    )
    :vars
    (
      ?auto_95798 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95798 ?auto_95794 ) ( IN-TRUCK ?auto_95797 ?auto_95798 ) ( OBJ-AT ?auto_95795 ?auto_95794 ) ( OBJ-AT ?auto_95796 ?auto_95794 ) ( not ( = ?auto_95795 ?auto_95796 ) ) ( not ( = ?auto_95795 ?auto_95797 ) ) ( not ( = ?auto_95796 ?auto_95797 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95797 ?auto_95794 )
      ( DELIVER-3PKG-VERIFY ?auto_95795 ?auto_95796 ?auto_95797 ?auto_95794 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95800 - OBJ
      ?auto_95801 - OBJ
      ?auto_95802 - OBJ
      ?auto_95799 - LOCATION
    )
    :vars
    (
      ?auto_95803 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95803 ?auto_95799 ) ( IN-TRUCK ?auto_95801 ?auto_95803 ) ( OBJ-AT ?auto_95800 ?auto_95799 ) ( OBJ-AT ?auto_95802 ?auto_95799 ) ( not ( = ?auto_95800 ?auto_95801 ) ) ( not ( = ?auto_95800 ?auto_95802 ) ) ( not ( = ?auto_95801 ?auto_95802 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95801 ?auto_95799 )
      ( DELIVER-3PKG-VERIFY ?auto_95800 ?auto_95801 ?auto_95802 ?auto_95799 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95810 - OBJ
      ?auto_95811 - OBJ
      ?auto_95812 - OBJ
      ?auto_95809 - LOCATION
    )
    :vars
    (
      ?auto_95813 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95813 ?auto_95809 ) ( IN-TRUCK ?auto_95810 ?auto_95813 ) ( OBJ-AT ?auto_95811 ?auto_95809 ) ( OBJ-AT ?auto_95812 ?auto_95809 ) ( not ( = ?auto_95810 ?auto_95811 ) ) ( not ( = ?auto_95810 ?auto_95812 ) ) ( not ( = ?auto_95811 ?auto_95812 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95810 ?auto_95809 )
      ( DELIVER-3PKG-VERIFY ?auto_95810 ?auto_95811 ?auto_95812 ?auto_95809 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95830 - OBJ
      ?auto_95831 - OBJ
      ?auto_95833 - OBJ
      ?auto_95832 - OBJ
      ?auto_95829 - LOCATION
    )
    :vars
    (
      ?auto_95834 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95834 ?auto_95829 ) ( IN-TRUCK ?auto_95832 ?auto_95834 ) ( OBJ-AT ?auto_95830 ?auto_95829 ) ( OBJ-AT ?auto_95831 ?auto_95829 ) ( OBJ-AT ?auto_95833 ?auto_95829 ) ( not ( = ?auto_95830 ?auto_95831 ) ) ( not ( = ?auto_95830 ?auto_95833 ) ) ( not ( = ?auto_95830 ?auto_95832 ) ) ( not ( = ?auto_95831 ?auto_95833 ) ) ( not ( = ?auto_95831 ?auto_95832 ) ) ( not ( = ?auto_95833 ?auto_95832 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95832 ?auto_95829 )
      ( DELIVER-4PKG-VERIFY ?auto_95830 ?auto_95831 ?auto_95833 ?auto_95832 ?auto_95829 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95836 - OBJ
      ?auto_95837 - OBJ
      ?auto_95839 - OBJ
      ?auto_95838 - OBJ
      ?auto_95835 - LOCATION
    )
    :vars
    (
      ?auto_95840 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95840 ?auto_95835 ) ( IN-TRUCK ?auto_95839 ?auto_95840 ) ( OBJ-AT ?auto_95836 ?auto_95835 ) ( OBJ-AT ?auto_95837 ?auto_95835 ) ( OBJ-AT ?auto_95838 ?auto_95835 ) ( not ( = ?auto_95836 ?auto_95837 ) ) ( not ( = ?auto_95836 ?auto_95839 ) ) ( not ( = ?auto_95836 ?auto_95838 ) ) ( not ( = ?auto_95837 ?auto_95839 ) ) ( not ( = ?auto_95837 ?auto_95838 ) ) ( not ( = ?auto_95839 ?auto_95838 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95839 ?auto_95835 )
      ( DELIVER-4PKG-VERIFY ?auto_95836 ?auto_95837 ?auto_95839 ?auto_95838 ?auto_95835 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95848 - OBJ
      ?auto_95849 - OBJ
      ?auto_95851 - OBJ
      ?auto_95850 - OBJ
      ?auto_95847 - LOCATION
    )
    :vars
    (
      ?auto_95852 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95852 ?auto_95847 ) ( IN-TRUCK ?auto_95849 ?auto_95852 ) ( OBJ-AT ?auto_95848 ?auto_95847 ) ( OBJ-AT ?auto_95851 ?auto_95847 ) ( OBJ-AT ?auto_95850 ?auto_95847 ) ( not ( = ?auto_95848 ?auto_95849 ) ) ( not ( = ?auto_95848 ?auto_95851 ) ) ( not ( = ?auto_95848 ?auto_95850 ) ) ( not ( = ?auto_95849 ?auto_95851 ) ) ( not ( = ?auto_95849 ?auto_95850 ) ) ( not ( = ?auto_95851 ?auto_95850 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95849 ?auto_95847 )
      ( DELIVER-4PKG-VERIFY ?auto_95848 ?auto_95849 ?auto_95851 ?auto_95850 ?auto_95847 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95872 - OBJ
      ?auto_95873 - OBJ
      ?auto_95875 - OBJ
      ?auto_95874 - OBJ
      ?auto_95871 - LOCATION
    )
    :vars
    (
      ?auto_95876 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95876 ?auto_95871 ) ( IN-TRUCK ?auto_95872 ?auto_95876 ) ( OBJ-AT ?auto_95873 ?auto_95871 ) ( OBJ-AT ?auto_95875 ?auto_95871 ) ( OBJ-AT ?auto_95874 ?auto_95871 ) ( not ( = ?auto_95872 ?auto_95873 ) ) ( not ( = ?auto_95872 ?auto_95875 ) ) ( not ( = ?auto_95872 ?auto_95874 ) ) ( not ( = ?auto_95873 ?auto_95875 ) ) ( not ( = ?auto_95873 ?auto_95874 ) ) ( not ( = ?auto_95875 ?auto_95874 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95872 ?auto_95871 )
      ( DELIVER-4PKG-VERIFY ?auto_95872 ?auto_95873 ?auto_95875 ?auto_95874 ?auto_95871 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95925 - OBJ
      ?auto_95926 - OBJ
      ?auto_95924 - LOCATION
    )
    :vars
    (
      ?auto_95927 - TRUCK
      ?auto_95928 - LOCATION
      ?auto_95929 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95926 ?auto_95927 ) ( TRUCK-AT ?auto_95927 ?auto_95928 ) ( IN-CITY ?auto_95928 ?auto_95929 ) ( IN-CITY ?auto_95924 ?auto_95929 ) ( not ( = ?auto_95924 ?auto_95928 ) ) ( OBJ-AT ?auto_95925 ?auto_95924 ) ( not ( = ?auto_95925 ?auto_95926 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95926 ?auto_95924 )
      ( DELIVER-2PKG-VERIFY ?auto_95925 ?auto_95926 ?auto_95924 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95931 - OBJ
      ?auto_95932 - OBJ
      ?auto_95930 - LOCATION
    )
    :vars
    (
      ?auto_95935 - TRUCK
      ?auto_95934 - LOCATION
      ?auto_95933 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95931 ?auto_95935 ) ( TRUCK-AT ?auto_95935 ?auto_95934 ) ( IN-CITY ?auto_95934 ?auto_95933 ) ( IN-CITY ?auto_95930 ?auto_95933 ) ( not ( = ?auto_95930 ?auto_95934 ) ) ( OBJ-AT ?auto_95932 ?auto_95930 ) ( not ( = ?auto_95932 ?auto_95931 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95932 ?auto_95931 ?auto_95930 )
      ( DELIVER-2PKG-VERIFY ?auto_95931 ?auto_95932 ?auto_95930 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95944 - OBJ
      ?auto_95945 - OBJ
      ?auto_95946 - OBJ
      ?auto_95943 - LOCATION
    )
    :vars
    (
      ?auto_95949 - TRUCK
      ?auto_95948 - LOCATION
      ?auto_95947 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95946 ?auto_95949 ) ( TRUCK-AT ?auto_95949 ?auto_95948 ) ( IN-CITY ?auto_95948 ?auto_95947 ) ( IN-CITY ?auto_95943 ?auto_95947 ) ( not ( = ?auto_95943 ?auto_95948 ) ) ( OBJ-AT ?auto_95944 ?auto_95943 ) ( not ( = ?auto_95944 ?auto_95946 ) ) ( OBJ-AT ?auto_95945 ?auto_95943 ) ( not ( = ?auto_95944 ?auto_95945 ) ) ( not ( = ?auto_95945 ?auto_95946 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95944 ?auto_95946 ?auto_95943 )
      ( DELIVER-3PKG-VERIFY ?auto_95944 ?auto_95945 ?auto_95946 ?auto_95943 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95951 - OBJ
      ?auto_95952 - OBJ
      ?auto_95953 - OBJ
      ?auto_95950 - LOCATION
    )
    :vars
    (
      ?auto_95956 - TRUCK
      ?auto_95955 - LOCATION
      ?auto_95954 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95952 ?auto_95956 ) ( TRUCK-AT ?auto_95956 ?auto_95955 ) ( IN-CITY ?auto_95955 ?auto_95954 ) ( IN-CITY ?auto_95950 ?auto_95954 ) ( not ( = ?auto_95950 ?auto_95955 ) ) ( OBJ-AT ?auto_95951 ?auto_95950 ) ( not ( = ?auto_95951 ?auto_95952 ) ) ( OBJ-AT ?auto_95953 ?auto_95950 ) ( not ( = ?auto_95951 ?auto_95953 ) ) ( not ( = ?auto_95952 ?auto_95953 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95951 ?auto_95952 ?auto_95950 )
      ( DELIVER-3PKG-VERIFY ?auto_95951 ?auto_95952 ?auto_95953 ?auto_95950 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95965 - OBJ
      ?auto_95966 - OBJ
      ?auto_95967 - OBJ
      ?auto_95964 - LOCATION
    )
    :vars
    (
      ?auto_95970 - TRUCK
      ?auto_95969 - LOCATION
      ?auto_95968 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95965 ?auto_95970 ) ( TRUCK-AT ?auto_95970 ?auto_95969 ) ( IN-CITY ?auto_95969 ?auto_95968 ) ( IN-CITY ?auto_95964 ?auto_95968 ) ( not ( = ?auto_95964 ?auto_95969 ) ) ( OBJ-AT ?auto_95967 ?auto_95964 ) ( not ( = ?auto_95967 ?auto_95965 ) ) ( OBJ-AT ?auto_95966 ?auto_95964 ) ( not ( = ?auto_95965 ?auto_95966 ) ) ( not ( = ?auto_95966 ?auto_95967 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95967 ?auto_95965 ?auto_95964 )
      ( DELIVER-3PKG-VERIFY ?auto_95965 ?auto_95966 ?auto_95967 ?auto_95964 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95994 - OBJ
      ?auto_95995 - OBJ
      ?auto_95997 - OBJ
      ?auto_95996 - OBJ
      ?auto_95993 - LOCATION
    )
    :vars
    (
      ?auto_96000 - TRUCK
      ?auto_95999 - LOCATION
      ?auto_95998 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95996 ?auto_96000 ) ( TRUCK-AT ?auto_96000 ?auto_95999 ) ( IN-CITY ?auto_95999 ?auto_95998 ) ( IN-CITY ?auto_95993 ?auto_95998 ) ( not ( = ?auto_95993 ?auto_95999 ) ) ( OBJ-AT ?auto_95995 ?auto_95993 ) ( not ( = ?auto_95995 ?auto_95996 ) ) ( OBJ-AT ?auto_95994 ?auto_95993 ) ( OBJ-AT ?auto_95997 ?auto_95993 ) ( not ( = ?auto_95994 ?auto_95995 ) ) ( not ( = ?auto_95994 ?auto_95997 ) ) ( not ( = ?auto_95994 ?auto_95996 ) ) ( not ( = ?auto_95995 ?auto_95997 ) ) ( not ( = ?auto_95997 ?auto_95996 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95995 ?auto_95996 ?auto_95993 )
      ( DELIVER-4PKG-VERIFY ?auto_95994 ?auto_95995 ?auto_95997 ?auto_95996 ?auto_95993 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96002 - OBJ
      ?auto_96003 - OBJ
      ?auto_96005 - OBJ
      ?auto_96004 - OBJ
      ?auto_96001 - LOCATION
    )
    :vars
    (
      ?auto_96008 - TRUCK
      ?auto_96007 - LOCATION
      ?auto_96006 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96005 ?auto_96008 ) ( TRUCK-AT ?auto_96008 ?auto_96007 ) ( IN-CITY ?auto_96007 ?auto_96006 ) ( IN-CITY ?auto_96001 ?auto_96006 ) ( not ( = ?auto_96001 ?auto_96007 ) ) ( OBJ-AT ?auto_96003 ?auto_96001 ) ( not ( = ?auto_96003 ?auto_96005 ) ) ( OBJ-AT ?auto_96002 ?auto_96001 ) ( OBJ-AT ?auto_96004 ?auto_96001 ) ( not ( = ?auto_96002 ?auto_96003 ) ) ( not ( = ?auto_96002 ?auto_96005 ) ) ( not ( = ?auto_96002 ?auto_96004 ) ) ( not ( = ?auto_96003 ?auto_96004 ) ) ( not ( = ?auto_96005 ?auto_96004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96003 ?auto_96005 ?auto_96001 )
      ( DELIVER-4PKG-VERIFY ?auto_96002 ?auto_96003 ?auto_96005 ?auto_96004 ?auto_96001 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96018 - OBJ
      ?auto_96019 - OBJ
      ?auto_96021 - OBJ
      ?auto_96020 - OBJ
      ?auto_96017 - LOCATION
    )
    :vars
    (
      ?auto_96024 - TRUCK
      ?auto_96023 - LOCATION
      ?auto_96022 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96019 ?auto_96024 ) ( TRUCK-AT ?auto_96024 ?auto_96023 ) ( IN-CITY ?auto_96023 ?auto_96022 ) ( IN-CITY ?auto_96017 ?auto_96022 ) ( not ( = ?auto_96017 ?auto_96023 ) ) ( OBJ-AT ?auto_96020 ?auto_96017 ) ( not ( = ?auto_96020 ?auto_96019 ) ) ( OBJ-AT ?auto_96018 ?auto_96017 ) ( OBJ-AT ?auto_96021 ?auto_96017 ) ( not ( = ?auto_96018 ?auto_96019 ) ) ( not ( = ?auto_96018 ?auto_96021 ) ) ( not ( = ?auto_96018 ?auto_96020 ) ) ( not ( = ?auto_96019 ?auto_96021 ) ) ( not ( = ?auto_96021 ?auto_96020 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96020 ?auto_96019 ?auto_96017 )
      ( DELIVER-4PKG-VERIFY ?auto_96018 ?auto_96019 ?auto_96021 ?auto_96020 ?auto_96017 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96050 - OBJ
      ?auto_96051 - OBJ
      ?auto_96053 - OBJ
      ?auto_96052 - OBJ
      ?auto_96049 - LOCATION
    )
    :vars
    (
      ?auto_96056 - TRUCK
      ?auto_96055 - LOCATION
      ?auto_96054 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96050 ?auto_96056 ) ( TRUCK-AT ?auto_96056 ?auto_96055 ) ( IN-CITY ?auto_96055 ?auto_96054 ) ( IN-CITY ?auto_96049 ?auto_96054 ) ( not ( = ?auto_96049 ?auto_96055 ) ) ( OBJ-AT ?auto_96052 ?auto_96049 ) ( not ( = ?auto_96052 ?auto_96050 ) ) ( OBJ-AT ?auto_96051 ?auto_96049 ) ( OBJ-AT ?auto_96053 ?auto_96049 ) ( not ( = ?auto_96050 ?auto_96051 ) ) ( not ( = ?auto_96050 ?auto_96053 ) ) ( not ( = ?auto_96051 ?auto_96053 ) ) ( not ( = ?auto_96051 ?auto_96052 ) ) ( not ( = ?auto_96053 ?auto_96052 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96052 ?auto_96050 ?auto_96049 )
      ( DELIVER-4PKG-VERIFY ?auto_96050 ?auto_96051 ?auto_96053 ?auto_96052 ?auto_96049 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96115 - OBJ
      ?auto_96114 - LOCATION
    )
    :vars
    (
      ?auto_96119 - TRUCK
      ?auto_96118 - LOCATION
      ?auto_96117 - CITY
      ?auto_96116 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96119 ?auto_96118 ) ( IN-CITY ?auto_96118 ?auto_96117 ) ( IN-CITY ?auto_96114 ?auto_96117 ) ( not ( = ?auto_96114 ?auto_96118 ) ) ( OBJ-AT ?auto_96116 ?auto_96114 ) ( not ( = ?auto_96116 ?auto_96115 ) ) ( OBJ-AT ?auto_96115 ?auto_96118 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_96115 ?auto_96119 ?auto_96118 )
      ( DELIVER-2PKG ?auto_96116 ?auto_96115 ?auto_96114 )
      ( DELIVER-1PKG-VERIFY ?auto_96115 ?auto_96114 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96121 - OBJ
      ?auto_96122 - OBJ
      ?auto_96120 - LOCATION
    )
    :vars
    (
      ?auto_96124 - TRUCK
      ?auto_96123 - LOCATION
      ?auto_96125 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96124 ?auto_96123 ) ( IN-CITY ?auto_96123 ?auto_96125 ) ( IN-CITY ?auto_96120 ?auto_96125 ) ( not ( = ?auto_96120 ?auto_96123 ) ) ( OBJ-AT ?auto_96121 ?auto_96120 ) ( not ( = ?auto_96121 ?auto_96122 ) ) ( OBJ-AT ?auto_96122 ?auto_96123 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96122 ?auto_96120 )
      ( DELIVER-2PKG-VERIFY ?auto_96121 ?auto_96122 ?auto_96120 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96127 - OBJ
      ?auto_96128 - OBJ
      ?auto_96126 - LOCATION
    )
    :vars
    (
      ?auto_96130 - TRUCK
      ?auto_96131 - LOCATION
      ?auto_96129 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96130 ?auto_96131 ) ( IN-CITY ?auto_96131 ?auto_96129 ) ( IN-CITY ?auto_96126 ?auto_96129 ) ( not ( = ?auto_96126 ?auto_96131 ) ) ( OBJ-AT ?auto_96128 ?auto_96126 ) ( not ( = ?auto_96128 ?auto_96127 ) ) ( OBJ-AT ?auto_96127 ?auto_96131 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96128 ?auto_96127 ?auto_96126 )
      ( DELIVER-2PKG-VERIFY ?auto_96127 ?auto_96128 ?auto_96126 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96140 - OBJ
      ?auto_96141 - OBJ
      ?auto_96142 - OBJ
      ?auto_96139 - LOCATION
    )
    :vars
    (
      ?auto_96144 - TRUCK
      ?auto_96145 - LOCATION
      ?auto_96143 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96144 ?auto_96145 ) ( IN-CITY ?auto_96145 ?auto_96143 ) ( IN-CITY ?auto_96139 ?auto_96143 ) ( not ( = ?auto_96139 ?auto_96145 ) ) ( OBJ-AT ?auto_96140 ?auto_96139 ) ( not ( = ?auto_96140 ?auto_96142 ) ) ( OBJ-AT ?auto_96142 ?auto_96145 ) ( OBJ-AT ?auto_96141 ?auto_96139 ) ( not ( = ?auto_96140 ?auto_96141 ) ) ( not ( = ?auto_96141 ?auto_96142 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96140 ?auto_96142 ?auto_96139 )
      ( DELIVER-3PKG-VERIFY ?auto_96140 ?auto_96141 ?auto_96142 ?auto_96139 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96147 - OBJ
      ?auto_96148 - OBJ
      ?auto_96149 - OBJ
      ?auto_96146 - LOCATION
    )
    :vars
    (
      ?auto_96151 - TRUCK
      ?auto_96152 - LOCATION
      ?auto_96150 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96151 ?auto_96152 ) ( IN-CITY ?auto_96152 ?auto_96150 ) ( IN-CITY ?auto_96146 ?auto_96150 ) ( not ( = ?auto_96146 ?auto_96152 ) ) ( OBJ-AT ?auto_96147 ?auto_96146 ) ( not ( = ?auto_96147 ?auto_96148 ) ) ( OBJ-AT ?auto_96148 ?auto_96152 ) ( OBJ-AT ?auto_96149 ?auto_96146 ) ( not ( = ?auto_96147 ?auto_96149 ) ) ( not ( = ?auto_96148 ?auto_96149 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96147 ?auto_96148 ?auto_96146 )
      ( DELIVER-3PKG-VERIFY ?auto_96147 ?auto_96148 ?auto_96149 ?auto_96146 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96161 - OBJ
      ?auto_96162 - OBJ
      ?auto_96163 - OBJ
      ?auto_96160 - LOCATION
    )
    :vars
    (
      ?auto_96165 - TRUCK
      ?auto_96166 - LOCATION
      ?auto_96164 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96165 ?auto_96166 ) ( IN-CITY ?auto_96166 ?auto_96164 ) ( IN-CITY ?auto_96160 ?auto_96164 ) ( not ( = ?auto_96160 ?auto_96166 ) ) ( OBJ-AT ?auto_96163 ?auto_96160 ) ( not ( = ?auto_96163 ?auto_96161 ) ) ( OBJ-AT ?auto_96161 ?auto_96166 ) ( OBJ-AT ?auto_96162 ?auto_96160 ) ( not ( = ?auto_96161 ?auto_96162 ) ) ( not ( = ?auto_96162 ?auto_96163 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96163 ?auto_96161 ?auto_96160 )
      ( DELIVER-3PKG-VERIFY ?auto_96161 ?auto_96162 ?auto_96163 ?auto_96160 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96190 - OBJ
      ?auto_96191 - OBJ
      ?auto_96193 - OBJ
      ?auto_96192 - OBJ
      ?auto_96189 - LOCATION
    )
    :vars
    (
      ?auto_96195 - TRUCK
      ?auto_96196 - LOCATION
      ?auto_96194 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96195 ?auto_96196 ) ( IN-CITY ?auto_96196 ?auto_96194 ) ( IN-CITY ?auto_96189 ?auto_96194 ) ( not ( = ?auto_96189 ?auto_96196 ) ) ( OBJ-AT ?auto_96191 ?auto_96189 ) ( not ( = ?auto_96191 ?auto_96192 ) ) ( OBJ-AT ?auto_96192 ?auto_96196 ) ( OBJ-AT ?auto_96190 ?auto_96189 ) ( OBJ-AT ?auto_96193 ?auto_96189 ) ( not ( = ?auto_96190 ?auto_96191 ) ) ( not ( = ?auto_96190 ?auto_96193 ) ) ( not ( = ?auto_96190 ?auto_96192 ) ) ( not ( = ?auto_96191 ?auto_96193 ) ) ( not ( = ?auto_96193 ?auto_96192 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96191 ?auto_96192 ?auto_96189 )
      ( DELIVER-4PKG-VERIFY ?auto_96190 ?auto_96191 ?auto_96193 ?auto_96192 ?auto_96189 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96198 - OBJ
      ?auto_96199 - OBJ
      ?auto_96201 - OBJ
      ?auto_96200 - OBJ
      ?auto_96197 - LOCATION
    )
    :vars
    (
      ?auto_96203 - TRUCK
      ?auto_96204 - LOCATION
      ?auto_96202 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96203 ?auto_96204 ) ( IN-CITY ?auto_96204 ?auto_96202 ) ( IN-CITY ?auto_96197 ?auto_96202 ) ( not ( = ?auto_96197 ?auto_96204 ) ) ( OBJ-AT ?auto_96200 ?auto_96197 ) ( not ( = ?auto_96200 ?auto_96201 ) ) ( OBJ-AT ?auto_96201 ?auto_96204 ) ( OBJ-AT ?auto_96198 ?auto_96197 ) ( OBJ-AT ?auto_96199 ?auto_96197 ) ( not ( = ?auto_96198 ?auto_96199 ) ) ( not ( = ?auto_96198 ?auto_96201 ) ) ( not ( = ?auto_96198 ?auto_96200 ) ) ( not ( = ?auto_96199 ?auto_96201 ) ) ( not ( = ?auto_96199 ?auto_96200 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96200 ?auto_96201 ?auto_96197 )
      ( DELIVER-4PKG-VERIFY ?auto_96198 ?auto_96199 ?auto_96201 ?auto_96200 ?auto_96197 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96214 - OBJ
      ?auto_96215 - OBJ
      ?auto_96217 - OBJ
      ?auto_96216 - OBJ
      ?auto_96213 - LOCATION
    )
    :vars
    (
      ?auto_96219 - TRUCK
      ?auto_96220 - LOCATION
      ?auto_96218 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96219 ?auto_96220 ) ( IN-CITY ?auto_96220 ?auto_96218 ) ( IN-CITY ?auto_96213 ?auto_96218 ) ( not ( = ?auto_96213 ?auto_96220 ) ) ( OBJ-AT ?auto_96217 ?auto_96213 ) ( not ( = ?auto_96217 ?auto_96215 ) ) ( OBJ-AT ?auto_96215 ?auto_96220 ) ( OBJ-AT ?auto_96214 ?auto_96213 ) ( OBJ-AT ?auto_96216 ?auto_96213 ) ( not ( = ?auto_96214 ?auto_96215 ) ) ( not ( = ?auto_96214 ?auto_96217 ) ) ( not ( = ?auto_96214 ?auto_96216 ) ) ( not ( = ?auto_96215 ?auto_96216 ) ) ( not ( = ?auto_96217 ?auto_96216 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96217 ?auto_96215 ?auto_96213 )
      ( DELIVER-4PKG-VERIFY ?auto_96214 ?auto_96215 ?auto_96217 ?auto_96216 ?auto_96213 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96246 - OBJ
      ?auto_96247 - OBJ
      ?auto_96249 - OBJ
      ?auto_96248 - OBJ
      ?auto_96245 - LOCATION
    )
    :vars
    (
      ?auto_96251 - TRUCK
      ?auto_96252 - LOCATION
      ?auto_96250 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96251 ?auto_96252 ) ( IN-CITY ?auto_96252 ?auto_96250 ) ( IN-CITY ?auto_96245 ?auto_96250 ) ( not ( = ?auto_96245 ?auto_96252 ) ) ( OBJ-AT ?auto_96248 ?auto_96245 ) ( not ( = ?auto_96248 ?auto_96246 ) ) ( OBJ-AT ?auto_96246 ?auto_96252 ) ( OBJ-AT ?auto_96247 ?auto_96245 ) ( OBJ-AT ?auto_96249 ?auto_96245 ) ( not ( = ?auto_96246 ?auto_96247 ) ) ( not ( = ?auto_96246 ?auto_96249 ) ) ( not ( = ?auto_96247 ?auto_96249 ) ) ( not ( = ?auto_96247 ?auto_96248 ) ) ( not ( = ?auto_96249 ?auto_96248 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96248 ?auto_96246 ?auto_96245 )
      ( DELIVER-4PKG-VERIFY ?auto_96246 ?auto_96247 ?auto_96249 ?auto_96248 ?auto_96245 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96311 - OBJ
      ?auto_96310 - LOCATION
    )
    :vars
    (
      ?auto_96315 - LOCATION
      ?auto_96312 - CITY
      ?auto_96313 - OBJ
      ?auto_96314 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96315 ?auto_96312 ) ( IN-CITY ?auto_96310 ?auto_96312 ) ( not ( = ?auto_96310 ?auto_96315 ) ) ( OBJ-AT ?auto_96313 ?auto_96310 ) ( not ( = ?auto_96313 ?auto_96311 ) ) ( OBJ-AT ?auto_96311 ?auto_96315 ) ( TRUCK-AT ?auto_96314 ?auto_96310 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_96314 ?auto_96310 ?auto_96315 ?auto_96312 )
      ( DELIVER-2PKG ?auto_96313 ?auto_96311 ?auto_96310 )
      ( DELIVER-1PKG-VERIFY ?auto_96311 ?auto_96310 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96317 - OBJ
      ?auto_96318 - OBJ
      ?auto_96316 - LOCATION
    )
    :vars
    (
      ?auto_96319 - LOCATION
      ?auto_96321 - CITY
      ?auto_96320 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96319 ?auto_96321 ) ( IN-CITY ?auto_96316 ?auto_96321 ) ( not ( = ?auto_96316 ?auto_96319 ) ) ( OBJ-AT ?auto_96317 ?auto_96316 ) ( not ( = ?auto_96317 ?auto_96318 ) ) ( OBJ-AT ?auto_96318 ?auto_96319 ) ( TRUCK-AT ?auto_96320 ?auto_96316 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96318 ?auto_96316 )
      ( DELIVER-2PKG-VERIFY ?auto_96317 ?auto_96318 ?auto_96316 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96323 - OBJ
      ?auto_96324 - OBJ
      ?auto_96322 - LOCATION
    )
    :vars
    (
      ?auto_96327 - LOCATION
      ?auto_96325 - CITY
      ?auto_96326 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96327 ?auto_96325 ) ( IN-CITY ?auto_96322 ?auto_96325 ) ( not ( = ?auto_96322 ?auto_96327 ) ) ( OBJ-AT ?auto_96324 ?auto_96322 ) ( not ( = ?auto_96324 ?auto_96323 ) ) ( OBJ-AT ?auto_96323 ?auto_96327 ) ( TRUCK-AT ?auto_96326 ?auto_96322 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96324 ?auto_96323 ?auto_96322 )
      ( DELIVER-2PKG-VERIFY ?auto_96323 ?auto_96324 ?auto_96322 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96336 - OBJ
      ?auto_96337 - OBJ
      ?auto_96338 - OBJ
      ?auto_96335 - LOCATION
    )
    :vars
    (
      ?auto_96341 - LOCATION
      ?auto_96339 - CITY
      ?auto_96340 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96341 ?auto_96339 ) ( IN-CITY ?auto_96335 ?auto_96339 ) ( not ( = ?auto_96335 ?auto_96341 ) ) ( OBJ-AT ?auto_96337 ?auto_96335 ) ( not ( = ?auto_96337 ?auto_96338 ) ) ( OBJ-AT ?auto_96338 ?auto_96341 ) ( TRUCK-AT ?auto_96340 ?auto_96335 ) ( OBJ-AT ?auto_96336 ?auto_96335 ) ( not ( = ?auto_96336 ?auto_96337 ) ) ( not ( = ?auto_96336 ?auto_96338 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96337 ?auto_96338 ?auto_96335 )
      ( DELIVER-3PKG-VERIFY ?auto_96336 ?auto_96337 ?auto_96338 ?auto_96335 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96343 - OBJ
      ?auto_96344 - OBJ
      ?auto_96345 - OBJ
      ?auto_96342 - LOCATION
    )
    :vars
    (
      ?auto_96348 - LOCATION
      ?auto_96346 - CITY
      ?auto_96347 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96348 ?auto_96346 ) ( IN-CITY ?auto_96342 ?auto_96346 ) ( not ( = ?auto_96342 ?auto_96348 ) ) ( OBJ-AT ?auto_96343 ?auto_96342 ) ( not ( = ?auto_96343 ?auto_96344 ) ) ( OBJ-AT ?auto_96344 ?auto_96348 ) ( TRUCK-AT ?auto_96347 ?auto_96342 ) ( OBJ-AT ?auto_96345 ?auto_96342 ) ( not ( = ?auto_96343 ?auto_96345 ) ) ( not ( = ?auto_96344 ?auto_96345 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96343 ?auto_96344 ?auto_96342 )
      ( DELIVER-3PKG-VERIFY ?auto_96343 ?auto_96344 ?auto_96345 ?auto_96342 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96357 - OBJ
      ?auto_96358 - OBJ
      ?auto_96359 - OBJ
      ?auto_96356 - LOCATION
    )
    :vars
    (
      ?auto_96362 - LOCATION
      ?auto_96360 - CITY
      ?auto_96361 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96362 ?auto_96360 ) ( IN-CITY ?auto_96356 ?auto_96360 ) ( not ( = ?auto_96356 ?auto_96362 ) ) ( OBJ-AT ?auto_96358 ?auto_96356 ) ( not ( = ?auto_96358 ?auto_96357 ) ) ( OBJ-AT ?auto_96357 ?auto_96362 ) ( TRUCK-AT ?auto_96361 ?auto_96356 ) ( OBJ-AT ?auto_96359 ?auto_96356 ) ( not ( = ?auto_96357 ?auto_96359 ) ) ( not ( = ?auto_96358 ?auto_96359 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96358 ?auto_96357 ?auto_96356 )
      ( DELIVER-3PKG-VERIFY ?auto_96357 ?auto_96358 ?auto_96359 ?auto_96356 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96386 - OBJ
      ?auto_96387 - OBJ
      ?auto_96389 - OBJ
      ?auto_96388 - OBJ
      ?auto_96385 - LOCATION
    )
    :vars
    (
      ?auto_96392 - LOCATION
      ?auto_96390 - CITY
      ?auto_96391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96392 ?auto_96390 ) ( IN-CITY ?auto_96385 ?auto_96390 ) ( not ( = ?auto_96385 ?auto_96392 ) ) ( OBJ-AT ?auto_96389 ?auto_96385 ) ( not ( = ?auto_96389 ?auto_96388 ) ) ( OBJ-AT ?auto_96388 ?auto_96392 ) ( TRUCK-AT ?auto_96391 ?auto_96385 ) ( OBJ-AT ?auto_96386 ?auto_96385 ) ( OBJ-AT ?auto_96387 ?auto_96385 ) ( not ( = ?auto_96386 ?auto_96387 ) ) ( not ( = ?auto_96386 ?auto_96389 ) ) ( not ( = ?auto_96386 ?auto_96388 ) ) ( not ( = ?auto_96387 ?auto_96389 ) ) ( not ( = ?auto_96387 ?auto_96388 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96389 ?auto_96388 ?auto_96385 )
      ( DELIVER-4PKG-VERIFY ?auto_96386 ?auto_96387 ?auto_96389 ?auto_96388 ?auto_96385 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96394 - OBJ
      ?auto_96395 - OBJ
      ?auto_96397 - OBJ
      ?auto_96396 - OBJ
      ?auto_96393 - LOCATION
    )
    :vars
    (
      ?auto_96400 - LOCATION
      ?auto_96398 - CITY
      ?auto_96399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96400 ?auto_96398 ) ( IN-CITY ?auto_96393 ?auto_96398 ) ( not ( = ?auto_96393 ?auto_96400 ) ) ( OBJ-AT ?auto_96395 ?auto_96393 ) ( not ( = ?auto_96395 ?auto_96397 ) ) ( OBJ-AT ?auto_96397 ?auto_96400 ) ( TRUCK-AT ?auto_96399 ?auto_96393 ) ( OBJ-AT ?auto_96394 ?auto_96393 ) ( OBJ-AT ?auto_96396 ?auto_96393 ) ( not ( = ?auto_96394 ?auto_96395 ) ) ( not ( = ?auto_96394 ?auto_96397 ) ) ( not ( = ?auto_96394 ?auto_96396 ) ) ( not ( = ?auto_96395 ?auto_96396 ) ) ( not ( = ?auto_96397 ?auto_96396 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96395 ?auto_96397 ?auto_96393 )
      ( DELIVER-4PKG-VERIFY ?auto_96394 ?auto_96395 ?auto_96397 ?auto_96396 ?auto_96393 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96410 - OBJ
      ?auto_96411 - OBJ
      ?auto_96413 - OBJ
      ?auto_96412 - OBJ
      ?auto_96409 - LOCATION
    )
    :vars
    (
      ?auto_96416 - LOCATION
      ?auto_96414 - CITY
      ?auto_96415 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96416 ?auto_96414 ) ( IN-CITY ?auto_96409 ?auto_96414 ) ( not ( = ?auto_96409 ?auto_96416 ) ) ( OBJ-AT ?auto_96413 ?auto_96409 ) ( not ( = ?auto_96413 ?auto_96411 ) ) ( OBJ-AT ?auto_96411 ?auto_96416 ) ( TRUCK-AT ?auto_96415 ?auto_96409 ) ( OBJ-AT ?auto_96410 ?auto_96409 ) ( OBJ-AT ?auto_96412 ?auto_96409 ) ( not ( = ?auto_96410 ?auto_96411 ) ) ( not ( = ?auto_96410 ?auto_96413 ) ) ( not ( = ?auto_96410 ?auto_96412 ) ) ( not ( = ?auto_96411 ?auto_96412 ) ) ( not ( = ?auto_96413 ?auto_96412 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96413 ?auto_96411 ?auto_96409 )
      ( DELIVER-4PKG-VERIFY ?auto_96410 ?auto_96411 ?auto_96413 ?auto_96412 ?auto_96409 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96442 - OBJ
      ?auto_96443 - OBJ
      ?auto_96445 - OBJ
      ?auto_96444 - OBJ
      ?auto_96441 - LOCATION
    )
    :vars
    (
      ?auto_96448 - LOCATION
      ?auto_96446 - CITY
      ?auto_96447 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96448 ?auto_96446 ) ( IN-CITY ?auto_96441 ?auto_96446 ) ( not ( = ?auto_96441 ?auto_96448 ) ) ( OBJ-AT ?auto_96445 ?auto_96441 ) ( not ( = ?auto_96445 ?auto_96442 ) ) ( OBJ-AT ?auto_96442 ?auto_96448 ) ( TRUCK-AT ?auto_96447 ?auto_96441 ) ( OBJ-AT ?auto_96443 ?auto_96441 ) ( OBJ-AT ?auto_96444 ?auto_96441 ) ( not ( = ?auto_96442 ?auto_96443 ) ) ( not ( = ?auto_96442 ?auto_96444 ) ) ( not ( = ?auto_96443 ?auto_96445 ) ) ( not ( = ?auto_96443 ?auto_96444 ) ) ( not ( = ?auto_96445 ?auto_96444 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96445 ?auto_96442 ?auto_96441 )
      ( DELIVER-4PKG-VERIFY ?auto_96442 ?auto_96443 ?auto_96445 ?auto_96444 ?auto_96441 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96507 - OBJ
      ?auto_96506 - LOCATION
    )
    :vars
    (
      ?auto_96511 - LOCATION
      ?auto_96508 - CITY
      ?auto_96509 - OBJ
      ?auto_96510 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96511 ?auto_96508 ) ( IN-CITY ?auto_96506 ?auto_96508 ) ( not ( = ?auto_96506 ?auto_96511 ) ) ( not ( = ?auto_96509 ?auto_96507 ) ) ( OBJ-AT ?auto_96507 ?auto_96511 ) ( TRUCK-AT ?auto_96510 ?auto_96506 ) ( IN-TRUCK ?auto_96509 ?auto_96510 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96509 ?auto_96506 )
      ( DELIVER-2PKG ?auto_96509 ?auto_96507 ?auto_96506 )
      ( DELIVER-1PKG-VERIFY ?auto_96507 ?auto_96506 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96513 - OBJ
      ?auto_96514 - OBJ
      ?auto_96512 - LOCATION
    )
    :vars
    (
      ?auto_96517 - LOCATION
      ?auto_96515 - CITY
      ?auto_96516 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96517 ?auto_96515 ) ( IN-CITY ?auto_96512 ?auto_96515 ) ( not ( = ?auto_96512 ?auto_96517 ) ) ( not ( = ?auto_96513 ?auto_96514 ) ) ( OBJ-AT ?auto_96514 ?auto_96517 ) ( TRUCK-AT ?auto_96516 ?auto_96512 ) ( IN-TRUCK ?auto_96513 ?auto_96516 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96514 ?auto_96512 )
      ( DELIVER-2PKG-VERIFY ?auto_96513 ?auto_96514 ?auto_96512 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96519 - OBJ
      ?auto_96520 - OBJ
      ?auto_96518 - LOCATION
    )
    :vars
    (
      ?auto_96522 - LOCATION
      ?auto_96523 - CITY
      ?auto_96521 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96522 ?auto_96523 ) ( IN-CITY ?auto_96518 ?auto_96523 ) ( not ( = ?auto_96518 ?auto_96522 ) ) ( not ( = ?auto_96520 ?auto_96519 ) ) ( OBJ-AT ?auto_96519 ?auto_96522 ) ( TRUCK-AT ?auto_96521 ?auto_96518 ) ( IN-TRUCK ?auto_96520 ?auto_96521 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96520 ?auto_96519 ?auto_96518 )
      ( DELIVER-2PKG-VERIFY ?auto_96519 ?auto_96520 ?auto_96518 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96703 - OBJ
      ?auto_96702 - LOCATION
    )
    :vars
    (
      ?auto_96706 - LOCATION
      ?auto_96707 - CITY
      ?auto_96705 - OBJ
      ?auto_96704 - TRUCK
      ?auto_96708 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96706 ?auto_96707 ) ( IN-CITY ?auto_96702 ?auto_96707 ) ( not ( = ?auto_96702 ?auto_96706 ) ) ( not ( = ?auto_96705 ?auto_96703 ) ) ( OBJ-AT ?auto_96703 ?auto_96706 ) ( IN-TRUCK ?auto_96705 ?auto_96704 ) ( TRUCK-AT ?auto_96704 ?auto_96708 ) ( IN-CITY ?auto_96708 ?auto_96707 ) ( not ( = ?auto_96702 ?auto_96708 ) ) ( not ( = ?auto_96706 ?auto_96708 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_96704 ?auto_96708 ?auto_96702 ?auto_96707 )
      ( DELIVER-2PKG ?auto_96705 ?auto_96703 ?auto_96702 )
      ( DELIVER-1PKG-VERIFY ?auto_96703 ?auto_96702 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96710 - OBJ
      ?auto_96711 - OBJ
      ?auto_96709 - LOCATION
    )
    :vars
    (
      ?auto_96713 - LOCATION
      ?auto_96715 - CITY
      ?auto_96714 - TRUCK
      ?auto_96712 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96713 ?auto_96715 ) ( IN-CITY ?auto_96709 ?auto_96715 ) ( not ( = ?auto_96709 ?auto_96713 ) ) ( not ( = ?auto_96710 ?auto_96711 ) ) ( OBJ-AT ?auto_96711 ?auto_96713 ) ( IN-TRUCK ?auto_96710 ?auto_96714 ) ( TRUCK-AT ?auto_96714 ?auto_96712 ) ( IN-CITY ?auto_96712 ?auto_96715 ) ( not ( = ?auto_96709 ?auto_96712 ) ) ( not ( = ?auto_96713 ?auto_96712 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96711 ?auto_96709 )
      ( DELIVER-2PKG-VERIFY ?auto_96710 ?auto_96711 ?auto_96709 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96717 - OBJ
      ?auto_96718 - OBJ
      ?auto_96716 - LOCATION
    )
    :vars
    (
      ?auto_96719 - LOCATION
      ?auto_96721 - CITY
      ?auto_96720 - TRUCK
      ?auto_96722 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96719 ?auto_96721 ) ( IN-CITY ?auto_96716 ?auto_96721 ) ( not ( = ?auto_96716 ?auto_96719 ) ) ( not ( = ?auto_96718 ?auto_96717 ) ) ( OBJ-AT ?auto_96717 ?auto_96719 ) ( IN-TRUCK ?auto_96718 ?auto_96720 ) ( TRUCK-AT ?auto_96720 ?auto_96722 ) ( IN-CITY ?auto_96722 ?auto_96721 ) ( not ( = ?auto_96716 ?auto_96722 ) ) ( not ( = ?auto_96719 ?auto_96722 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96718 ?auto_96717 ?auto_96716 )
      ( DELIVER-2PKG-VERIFY ?auto_96717 ?auto_96718 ?auto_96716 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96925 - OBJ
      ?auto_96924 - LOCATION
    )
    :vars
    (
      ?auto_96926 - LOCATION
      ?auto_96928 - CITY
      ?auto_96929 - OBJ
      ?auto_96927 - TRUCK
      ?auto_96930 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96926 ?auto_96928 ) ( IN-CITY ?auto_96924 ?auto_96928 ) ( not ( = ?auto_96924 ?auto_96926 ) ) ( not ( = ?auto_96929 ?auto_96925 ) ) ( OBJ-AT ?auto_96925 ?auto_96926 ) ( TRUCK-AT ?auto_96927 ?auto_96930 ) ( IN-CITY ?auto_96930 ?auto_96928 ) ( not ( = ?auto_96924 ?auto_96930 ) ) ( not ( = ?auto_96926 ?auto_96930 ) ) ( OBJ-AT ?auto_96929 ?auto_96930 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_96929 ?auto_96927 ?auto_96930 )
      ( DELIVER-2PKG ?auto_96929 ?auto_96925 ?auto_96924 )
      ( DELIVER-1PKG-VERIFY ?auto_96925 ?auto_96924 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96932 - OBJ
      ?auto_96933 - OBJ
      ?auto_96931 - LOCATION
    )
    :vars
    (
      ?auto_96936 - LOCATION
      ?auto_96934 - CITY
      ?auto_96935 - TRUCK
      ?auto_96937 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96936 ?auto_96934 ) ( IN-CITY ?auto_96931 ?auto_96934 ) ( not ( = ?auto_96931 ?auto_96936 ) ) ( not ( = ?auto_96932 ?auto_96933 ) ) ( OBJ-AT ?auto_96933 ?auto_96936 ) ( TRUCK-AT ?auto_96935 ?auto_96937 ) ( IN-CITY ?auto_96937 ?auto_96934 ) ( not ( = ?auto_96931 ?auto_96937 ) ) ( not ( = ?auto_96936 ?auto_96937 ) ) ( OBJ-AT ?auto_96932 ?auto_96937 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96933 ?auto_96931 )
      ( DELIVER-2PKG-VERIFY ?auto_96932 ?auto_96933 ?auto_96931 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96939 - OBJ
      ?auto_96940 - OBJ
      ?auto_96938 - LOCATION
    )
    :vars
    (
      ?auto_96941 - LOCATION
      ?auto_96942 - CITY
      ?auto_96943 - TRUCK
      ?auto_96944 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96941 ?auto_96942 ) ( IN-CITY ?auto_96938 ?auto_96942 ) ( not ( = ?auto_96938 ?auto_96941 ) ) ( not ( = ?auto_96940 ?auto_96939 ) ) ( OBJ-AT ?auto_96939 ?auto_96941 ) ( TRUCK-AT ?auto_96943 ?auto_96944 ) ( IN-CITY ?auto_96944 ?auto_96942 ) ( not ( = ?auto_96938 ?auto_96944 ) ) ( not ( = ?auto_96941 ?auto_96944 ) ) ( OBJ-AT ?auto_96940 ?auto_96944 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96940 ?auto_96939 ?auto_96938 )
      ( DELIVER-2PKG-VERIFY ?auto_96939 ?auto_96940 ?auto_96938 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98284 - OBJ
      ?auto_98285 - OBJ
      ?auto_98286 - OBJ
      ?auto_98283 - LOCATION
    )
    :vars
    (
      ?auto_98289 - TRUCK
      ?auto_98288 - LOCATION
      ?auto_98287 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98286 ?auto_98289 ) ( TRUCK-AT ?auto_98289 ?auto_98288 ) ( IN-CITY ?auto_98288 ?auto_98287 ) ( IN-CITY ?auto_98283 ?auto_98287 ) ( not ( = ?auto_98283 ?auto_98288 ) ) ( OBJ-AT ?auto_98285 ?auto_98283 ) ( not ( = ?auto_98285 ?auto_98286 ) ) ( OBJ-AT ?auto_98284 ?auto_98283 ) ( not ( = ?auto_98284 ?auto_98285 ) ) ( not ( = ?auto_98284 ?auto_98286 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98285 ?auto_98286 ?auto_98283 )
      ( DELIVER-3PKG-VERIFY ?auto_98284 ?auto_98285 ?auto_98286 ?auto_98283 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98317 - OBJ
      ?auto_98318 - OBJ
      ?auto_98319 - OBJ
      ?auto_98316 - LOCATION
    )
    :vars
    (
      ?auto_98323 - TRUCK
      ?auto_98321 - LOCATION
      ?auto_98320 - CITY
      ?auto_98322 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98319 ?auto_98323 ) ( TRUCK-AT ?auto_98323 ?auto_98321 ) ( IN-CITY ?auto_98321 ?auto_98320 ) ( IN-CITY ?auto_98316 ?auto_98320 ) ( not ( = ?auto_98316 ?auto_98321 ) ) ( OBJ-AT ?auto_98322 ?auto_98316 ) ( not ( = ?auto_98322 ?auto_98319 ) ) ( OBJ-AT ?auto_98317 ?auto_98316 ) ( OBJ-AT ?auto_98318 ?auto_98316 ) ( not ( = ?auto_98317 ?auto_98318 ) ) ( not ( = ?auto_98317 ?auto_98319 ) ) ( not ( = ?auto_98317 ?auto_98322 ) ) ( not ( = ?auto_98318 ?auto_98319 ) ) ( not ( = ?auto_98318 ?auto_98322 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98322 ?auto_98319 ?auto_98316 )
      ( DELIVER-3PKG-VERIFY ?auto_98317 ?auto_98318 ?auto_98319 ?auto_98316 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98329 - OBJ
      ?auto_98330 - OBJ
      ?auto_98331 - OBJ
      ?auto_98328 - LOCATION
    )
    :vars
    (
      ?auto_98335 - TRUCK
      ?auto_98333 - LOCATION
      ?auto_98332 - CITY
      ?auto_98334 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98330 ?auto_98335 ) ( TRUCK-AT ?auto_98335 ?auto_98333 ) ( IN-CITY ?auto_98333 ?auto_98332 ) ( IN-CITY ?auto_98328 ?auto_98332 ) ( not ( = ?auto_98328 ?auto_98333 ) ) ( OBJ-AT ?auto_98334 ?auto_98328 ) ( not ( = ?auto_98334 ?auto_98330 ) ) ( OBJ-AT ?auto_98329 ?auto_98328 ) ( OBJ-AT ?auto_98331 ?auto_98328 ) ( not ( = ?auto_98329 ?auto_98330 ) ) ( not ( = ?auto_98329 ?auto_98331 ) ) ( not ( = ?auto_98329 ?auto_98334 ) ) ( not ( = ?auto_98330 ?auto_98331 ) ) ( not ( = ?auto_98331 ?auto_98334 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98334 ?auto_98330 ?auto_98328 )
      ( DELIVER-3PKG-VERIFY ?auto_98329 ?auto_98330 ?auto_98331 ?auto_98328 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98345 - OBJ
      ?auto_98346 - OBJ
      ?auto_98347 - OBJ
      ?auto_98344 - LOCATION
    )
    :vars
    (
      ?auto_98350 - TRUCK
      ?auto_98349 - LOCATION
      ?auto_98348 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98345 ?auto_98350 ) ( TRUCK-AT ?auto_98350 ?auto_98349 ) ( IN-CITY ?auto_98349 ?auto_98348 ) ( IN-CITY ?auto_98344 ?auto_98348 ) ( not ( = ?auto_98344 ?auto_98349 ) ) ( OBJ-AT ?auto_98346 ?auto_98344 ) ( not ( = ?auto_98346 ?auto_98345 ) ) ( OBJ-AT ?auto_98347 ?auto_98344 ) ( not ( = ?auto_98345 ?auto_98347 ) ) ( not ( = ?auto_98346 ?auto_98347 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98346 ?auto_98345 ?auto_98344 )
      ( DELIVER-3PKG-VERIFY ?auto_98345 ?auto_98346 ?auto_98347 ?auto_98344 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98367 - OBJ
      ?auto_98368 - OBJ
      ?auto_98369 - OBJ
      ?auto_98366 - LOCATION
    )
    :vars
    (
      ?auto_98373 - TRUCK
      ?auto_98371 - LOCATION
      ?auto_98370 - CITY
      ?auto_98372 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98367 ?auto_98373 ) ( TRUCK-AT ?auto_98373 ?auto_98371 ) ( IN-CITY ?auto_98371 ?auto_98370 ) ( IN-CITY ?auto_98366 ?auto_98370 ) ( not ( = ?auto_98366 ?auto_98371 ) ) ( OBJ-AT ?auto_98372 ?auto_98366 ) ( not ( = ?auto_98372 ?auto_98367 ) ) ( OBJ-AT ?auto_98368 ?auto_98366 ) ( OBJ-AT ?auto_98369 ?auto_98366 ) ( not ( = ?auto_98367 ?auto_98368 ) ) ( not ( = ?auto_98367 ?auto_98369 ) ) ( not ( = ?auto_98368 ?auto_98369 ) ) ( not ( = ?auto_98368 ?auto_98372 ) ) ( not ( = ?auto_98369 ?auto_98372 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98372 ?auto_98367 ?auto_98366 )
      ( DELIVER-3PKG-VERIFY ?auto_98367 ?auto_98368 ?auto_98369 ?auto_98366 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98406 - OBJ
      ?auto_98407 - OBJ
      ?auto_98409 - OBJ
      ?auto_98408 - OBJ
      ?auto_98405 - LOCATION
    )
    :vars
    (
      ?auto_98412 - TRUCK
      ?auto_98411 - LOCATION
      ?auto_98410 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98408 ?auto_98412 ) ( TRUCK-AT ?auto_98412 ?auto_98411 ) ( IN-CITY ?auto_98411 ?auto_98410 ) ( IN-CITY ?auto_98405 ?auto_98410 ) ( not ( = ?auto_98405 ?auto_98411 ) ) ( OBJ-AT ?auto_98409 ?auto_98405 ) ( not ( = ?auto_98409 ?auto_98408 ) ) ( OBJ-AT ?auto_98406 ?auto_98405 ) ( OBJ-AT ?auto_98407 ?auto_98405 ) ( not ( = ?auto_98406 ?auto_98407 ) ) ( not ( = ?auto_98406 ?auto_98409 ) ) ( not ( = ?auto_98406 ?auto_98408 ) ) ( not ( = ?auto_98407 ?auto_98409 ) ) ( not ( = ?auto_98407 ?auto_98408 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98409 ?auto_98408 ?auto_98405 )
      ( DELIVER-4PKG-VERIFY ?auto_98406 ?auto_98407 ?auto_98409 ?auto_98408 ?auto_98405 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98414 - OBJ
      ?auto_98415 - OBJ
      ?auto_98417 - OBJ
      ?auto_98416 - OBJ
      ?auto_98413 - LOCATION
    )
    :vars
    (
      ?auto_98420 - TRUCK
      ?auto_98419 - LOCATION
      ?auto_98418 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98416 ?auto_98420 ) ( TRUCK-AT ?auto_98420 ?auto_98419 ) ( IN-CITY ?auto_98419 ?auto_98418 ) ( IN-CITY ?auto_98413 ?auto_98418 ) ( not ( = ?auto_98413 ?auto_98419 ) ) ( OBJ-AT ?auto_98414 ?auto_98413 ) ( not ( = ?auto_98414 ?auto_98416 ) ) ( OBJ-AT ?auto_98415 ?auto_98413 ) ( OBJ-AT ?auto_98417 ?auto_98413 ) ( not ( = ?auto_98414 ?auto_98415 ) ) ( not ( = ?auto_98414 ?auto_98417 ) ) ( not ( = ?auto_98415 ?auto_98417 ) ) ( not ( = ?auto_98415 ?auto_98416 ) ) ( not ( = ?auto_98417 ?auto_98416 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98414 ?auto_98416 ?auto_98413 )
      ( DELIVER-4PKG-VERIFY ?auto_98414 ?auto_98415 ?auto_98417 ?auto_98416 ?auto_98413 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98422 - OBJ
      ?auto_98423 - OBJ
      ?auto_98425 - OBJ
      ?auto_98424 - OBJ
      ?auto_98421 - LOCATION
    )
    :vars
    (
      ?auto_98428 - TRUCK
      ?auto_98427 - LOCATION
      ?auto_98426 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98425 ?auto_98428 ) ( TRUCK-AT ?auto_98428 ?auto_98427 ) ( IN-CITY ?auto_98427 ?auto_98426 ) ( IN-CITY ?auto_98421 ?auto_98426 ) ( not ( = ?auto_98421 ?auto_98427 ) ) ( OBJ-AT ?auto_98424 ?auto_98421 ) ( not ( = ?auto_98424 ?auto_98425 ) ) ( OBJ-AT ?auto_98422 ?auto_98421 ) ( OBJ-AT ?auto_98423 ?auto_98421 ) ( not ( = ?auto_98422 ?auto_98423 ) ) ( not ( = ?auto_98422 ?auto_98425 ) ) ( not ( = ?auto_98422 ?auto_98424 ) ) ( not ( = ?auto_98423 ?auto_98425 ) ) ( not ( = ?auto_98423 ?auto_98424 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98424 ?auto_98425 ?auto_98421 )
      ( DELIVER-4PKG-VERIFY ?auto_98422 ?auto_98423 ?auto_98425 ?auto_98424 ?auto_98421 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98430 - OBJ
      ?auto_98431 - OBJ
      ?auto_98433 - OBJ
      ?auto_98432 - OBJ
      ?auto_98429 - LOCATION
    )
    :vars
    (
      ?auto_98436 - TRUCK
      ?auto_98435 - LOCATION
      ?auto_98434 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98433 ?auto_98436 ) ( TRUCK-AT ?auto_98436 ?auto_98435 ) ( IN-CITY ?auto_98435 ?auto_98434 ) ( IN-CITY ?auto_98429 ?auto_98434 ) ( not ( = ?auto_98429 ?auto_98435 ) ) ( OBJ-AT ?auto_98430 ?auto_98429 ) ( not ( = ?auto_98430 ?auto_98433 ) ) ( OBJ-AT ?auto_98431 ?auto_98429 ) ( OBJ-AT ?auto_98432 ?auto_98429 ) ( not ( = ?auto_98430 ?auto_98431 ) ) ( not ( = ?auto_98430 ?auto_98432 ) ) ( not ( = ?auto_98431 ?auto_98433 ) ) ( not ( = ?auto_98431 ?auto_98432 ) ) ( not ( = ?auto_98433 ?auto_98432 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98430 ?auto_98433 ?auto_98429 )
      ( DELIVER-4PKG-VERIFY ?auto_98430 ?auto_98431 ?auto_98433 ?auto_98432 ?auto_98429 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98486 - OBJ
      ?auto_98487 - OBJ
      ?auto_98489 - OBJ
      ?auto_98488 - OBJ
      ?auto_98485 - LOCATION
    )
    :vars
    (
      ?auto_98492 - TRUCK
      ?auto_98491 - LOCATION
      ?auto_98490 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98487 ?auto_98492 ) ( TRUCK-AT ?auto_98492 ?auto_98491 ) ( IN-CITY ?auto_98491 ?auto_98490 ) ( IN-CITY ?auto_98485 ?auto_98490 ) ( not ( = ?auto_98485 ?auto_98491 ) ) ( OBJ-AT ?auto_98489 ?auto_98485 ) ( not ( = ?auto_98489 ?auto_98487 ) ) ( OBJ-AT ?auto_98486 ?auto_98485 ) ( OBJ-AT ?auto_98488 ?auto_98485 ) ( not ( = ?auto_98486 ?auto_98487 ) ) ( not ( = ?auto_98486 ?auto_98489 ) ) ( not ( = ?auto_98486 ?auto_98488 ) ) ( not ( = ?auto_98487 ?auto_98488 ) ) ( not ( = ?auto_98489 ?auto_98488 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98489 ?auto_98487 ?auto_98485 )
      ( DELIVER-4PKG-VERIFY ?auto_98486 ?auto_98487 ?auto_98489 ?auto_98488 ?auto_98485 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98510 - OBJ
      ?auto_98511 - OBJ
      ?auto_98513 - OBJ
      ?auto_98512 - OBJ
      ?auto_98509 - LOCATION
    )
    :vars
    (
      ?auto_98516 - TRUCK
      ?auto_98515 - LOCATION
      ?auto_98514 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98511 ?auto_98516 ) ( TRUCK-AT ?auto_98516 ?auto_98515 ) ( IN-CITY ?auto_98515 ?auto_98514 ) ( IN-CITY ?auto_98509 ?auto_98514 ) ( not ( = ?auto_98509 ?auto_98515 ) ) ( OBJ-AT ?auto_98510 ?auto_98509 ) ( not ( = ?auto_98510 ?auto_98511 ) ) ( OBJ-AT ?auto_98513 ?auto_98509 ) ( OBJ-AT ?auto_98512 ?auto_98509 ) ( not ( = ?auto_98510 ?auto_98513 ) ) ( not ( = ?auto_98510 ?auto_98512 ) ) ( not ( = ?auto_98511 ?auto_98513 ) ) ( not ( = ?auto_98511 ?auto_98512 ) ) ( not ( = ?auto_98513 ?auto_98512 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98510 ?auto_98511 ?auto_98509 )
      ( DELIVER-4PKG-VERIFY ?auto_98510 ?auto_98511 ?auto_98513 ?auto_98512 ?auto_98509 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98606 - OBJ
      ?auto_98607 - OBJ
      ?auto_98609 - OBJ
      ?auto_98608 - OBJ
      ?auto_98605 - LOCATION
    )
    :vars
    (
      ?auto_98613 - TRUCK
      ?auto_98611 - LOCATION
      ?auto_98610 - CITY
      ?auto_98612 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98608 ?auto_98613 ) ( TRUCK-AT ?auto_98613 ?auto_98611 ) ( IN-CITY ?auto_98611 ?auto_98610 ) ( IN-CITY ?auto_98605 ?auto_98610 ) ( not ( = ?auto_98605 ?auto_98611 ) ) ( OBJ-AT ?auto_98612 ?auto_98605 ) ( not ( = ?auto_98612 ?auto_98608 ) ) ( OBJ-AT ?auto_98606 ?auto_98605 ) ( OBJ-AT ?auto_98607 ?auto_98605 ) ( OBJ-AT ?auto_98609 ?auto_98605 ) ( not ( = ?auto_98606 ?auto_98607 ) ) ( not ( = ?auto_98606 ?auto_98609 ) ) ( not ( = ?auto_98606 ?auto_98608 ) ) ( not ( = ?auto_98606 ?auto_98612 ) ) ( not ( = ?auto_98607 ?auto_98609 ) ) ( not ( = ?auto_98607 ?auto_98608 ) ) ( not ( = ?auto_98607 ?auto_98612 ) ) ( not ( = ?auto_98609 ?auto_98608 ) ) ( not ( = ?auto_98609 ?auto_98612 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98612 ?auto_98608 ?auto_98605 )
      ( DELIVER-4PKG-VERIFY ?auto_98606 ?auto_98607 ?auto_98609 ?auto_98608 ?auto_98605 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98623 - OBJ
      ?auto_98624 - OBJ
      ?auto_98626 - OBJ
      ?auto_98625 - OBJ
      ?auto_98622 - LOCATION
    )
    :vars
    (
      ?auto_98630 - TRUCK
      ?auto_98628 - LOCATION
      ?auto_98627 - CITY
      ?auto_98629 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98626 ?auto_98630 ) ( TRUCK-AT ?auto_98630 ?auto_98628 ) ( IN-CITY ?auto_98628 ?auto_98627 ) ( IN-CITY ?auto_98622 ?auto_98627 ) ( not ( = ?auto_98622 ?auto_98628 ) ) ( OBJ-AT ?auto_98629 ?auto_98622 ) ( not ( = ?auto_98629 ?auto_98626 ) ) ( OBJ-AT ?auto_98623 ?auto_98622 ) ( OBJ-AT ?auto_98624 ?auto_98622 ) ( OBJ-AT ?auto_98625 ?auto_98622 ) ( not ( = ?auto_98623 ?auto_98624 ) ) ( not ( = ?auto_98623 ?auto_98626 ) ) ( not ( = ?auto_98623 ?auto_98625 ) ) ( not ( = ?auto_98623 ?auto_98629 ) ) ( not ( = ?auto_98624 ?auto_98626 ) ) ( not ( = ?auto_98624 ?auto_98625 ) ) ( not ( = ?auto_98624 ?auto_98629 ) ) ( not ( = ?auto_98626 ?auto_98625 ) ) ( not ( = ?auto_98625 ?auto_98629 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98629 ?auto_98626 ?auto_98622 )
      ( DELIVER-4PKG-VERIFY ?auto_98623 ?auto_98624 ?auto_98626 ?auto_98625 ?auto_98622 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98673 - OBJ
      ?auto_98674 - OBJ
      ?auto_98676 - OBJ
      ?auto_98675 - OBJ
      ?auto_98672 - LOCATION
    )
    :vars
    (
      ?auto_98680 - TRUCK
      ?auto_98678 - LOCATION
      ?auto_98677 - CITY
      ?auto_98679 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98674 ?auto_98680 ) ( TRUCK-AT ?auto_98680 ?auto_98678 ) ( IN-CITY ?auto_98678 ?auto_98677 ) ( IN-CITY ?auto_98672 ?auto_98677 ) ( not ( = ?auto_98672 ?auto_98678 ) ) ( OBJ-AT ?auto_98679 ?auto_98672 ) ( not ( = ?auto_98679 ?auto_98674 ) ) ( OBJ-AT ?auto_98673 ?auto_98672 ) ( OBJ-AT ?auto_98676 ?auto_98672 ) ( OBJ-AT ?auto_98675 ?auto_98672 ) ( not ( = ?auto_98673 ?auto_98674 ) ) ( not ( = ?auto_98673 ?auto_98676 ) ) ( not ( = ?auto_98673 ?auto_98675 ) ) ( not ( = ?auto_98673 ?auto_98679 ) ) ( not ( = ?auto_98674 ?auto_98676 ) ) ( not ( = ?auto_98674 ?auto_98675 ) ) ( not ( = ?auto_98676 ?auto_98675 ) ) ( not ( = ?auto_98676 ?auto_98679 ) ) ( not ( = ?auto_98675 ?auto_98679 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98679 ?auto_98674 ?auto_98672 )
      ( DELIVER-4PKG-VERIFY ?auto_98673 ?auto_98674 ?auto_98676 ?auto_98675 ?auto_98672 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98717 - OBJ
      ?auto_98718 - OBJ
      ?auto_98720 - OBJ
      ?auto_98719 - OBJ
      ?auto_98716 - LOCATION
    )
    :vars
    (
      ?auto_98723 - TRUCK
      ?auto_98722 - LOCATION
      ?auto_98721 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98717 ?auto_98723 ) ( TRUCK-AT ?auto_98723 ?auto_98722 ) ( IN-CITY ?auto_98722 ?auto_98721 ) ( IN-CITY ?auto_98716 ?auto_98721 ) ( not ( = ?auto_98716 ?auto_98722 ) ) ( OBJ-AT ?auto_98720 ?auto_98716 ) ( not ( = ?auto_98720 ?auto_98717 ) ) ( OBJ-AT ?auto_98718 ?auto_98716 ) ( OBJ-AT ?auto_98719 ?auto_98716 ) ( not ( = ?auto_98717 ?auto_98718 ) ) ( not ( = ?auto_98717 ?auto_98719 ) ) ( not ( = ?auto_98718 ?auto_98720 ) ) ( not ( = ?auto_98718 ?auto_98719 ) ) ( not ( = ?auto_98720 ?auto_98719 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98720 ?auto_98717 ?auto_98716 )
      ( DELIVER-4PKG-VERIFY ?auto_98717 ?auto_98718 ?auto_98720 ?auto_98719 ?auto_98716 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98741 - OBJ
      ?auto_98742 - OBJ
      ?auto_98744 - OBJ
      ?auto_98743 - OBJ
      ?auto_98740 - LOCATION
    )
    :vars
    (
      ?auto_98747 - TRUCK
      ?auto_98746 - LOCATION
      ?auto_98745 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98741 ?auto_98747 ) ( TRUCK-AT ?auto_98747 ?auto_98746 ) ( IN-CITY ?auto_98746 ?auto_98745 ) ( IN-CITY ?auto_98740 ?auto_98745 ) ( not ( = ?auto_98740 ?auto_98746 ) ) ( OBJ-AT ?auto_98742 ?auto_98740 ) ( not ( = ?auto_98742 ?auto_98741 ) ) ( OBJ-AT ?auto_98744 ?auto_98740 ) ( OBJ-AT ?auto_98743 ?auto_98740 ) ( not ( = ?auto_98741 ?auto_98744 ) ) ( not ( = ?auto_98741 ?auto_98743 ) ) ( not ( = ?auto_98742 ?auto_98744 ) ) ( not ( = ?auto_98742 ?auto_98743 ) ) ( not ( = ?auto_98744 ?auto_98743 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98742 ?auto_98741 ?auto_98740 )
      ( DELIVER-4PKG-VERIFY ?auto_98741 ?auto_98742 ?auto_98744 ?auto_98743 ?auto_98740 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98821 - OBJ
      ?auto_98822 - OBJ
      ?auto_98824 - OBJ
      ?auto_98823 - OBJ
      ?auto_98820 - LOCATION
    )
    :vars
    (
      ?auto_98828 - TRUCK
      ?auto_98826 - LOCATION
      ?auto_98825 - CITY
      ?auto_98827 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98821 ?auto_98828 ) ( TRUCK-AT ?auto_98828 ?auto_98826 ) ( IN-CITY ?auto_98826 ?auto_98825 ) ( IN-CITY ?auto_98820 ?auto_98825 ) ( not ( = ?auto_98820 ?auto_98826 ) ) ( OBJ-AT ?auto_98827 ?auto_98820 ) ( not ( = ?auto_98827 ?auto_98821 ) ) ( OBJ-AT ?auto_98822 ?auto_98820 ) ( OBJ-AT ?auto_98824 ?auto_98820 ) ( OBJ-AT ?auto_98823 ?auto_98820 ) ( not ( = ?auto_98821 ?auto_98822 ) ) ( not ( = ?auto_98821 ?auto_98824 ) ) ( not ( = ?auto_98821 ?auto_98823 ) ) ( not ( = ?auto_98822 ?auto_98824 ) ) ( not ( = ?auto_98822 ?auto_98823 ) ) ( not ( = ?auto_98822 ?auto_98827 ) ) ( not ( = ?auto_98824 ?auto_98823 ) ) ( not ( = ?auto_98824 ?auto_98827 ) ) ( not ( = ?auto_98823 ?auto_98827 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98827 ?auto_98821 ?auto_98820 )
      ( DELIVER-4PKG-VERIFY ?auto_98821 ?auto_98822 ?auto_98824 ?auto_98823 ?auto_98820 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98972 - OBJ
      ?auto_98973 - OBJ
      ?auto_98974 - OBJ
      ?auto_98971 - LOCATION
    )
    :vars
    (
      ?auto_98975 - TRUCK
      ?auto_98976 - LOCATION
      ?auto_98977 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98975 ?auto_98976 ) ( IN-CITY ?auto_98976 ?auto_98977 ) ( IN-CITY ?auto_98971 ?auto_98977 ) ( not ( = ?auto_98971 ?auto_98976 ) ) ( OBJ-AT ?auto_98973 ?auto_98971 ) ( not ( = ?auto_98973 ?auto_98974 ) ) ( OBJ-AT ?auto_98974 ?auto_98976 ) ( OBJ-AT ?auto_98972 ?auto_98971 ) ( not ( = ?auto_98972 ?auto_98973 ) ) ( not ( = ?auto_98972 ?auto_98974 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98973 ?auto_98974 ?auto_98971 )
      ( DELIVER-3PKG-VERIFY ?auto_98972 ?auto_98973 ?auto_98974 ?auto_98971 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99005 - OBJ
      ?auto_99006 - OBJ
      ?auto_99007 - OBJ
      ?auto_99004 - LOCATION
    )
    :vars
    (
      ?auto_99008 - TRUCK
      ?auto_99010 - LOCATION
      ?auto_99011 - CITY
      ?auto_99009 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99008 ?auto_99010 ) ( IN-CITY ?auto_99010 ?auto_99011 ) ( IN-CITY ?auto_99004 ?auto_99011 ) ( not ( = ?auto_99004 ?auto_99010 ) ) ( OBJ-AT ?auto_99009 ?auto_99004 ) ( not ( = ?auto_99009 ?auto_99007 ) ) ( OBJ-AT ?auto_99007 ?auto_99010 ) ( OBJ-AT ?auto_99005 ?auto_99004 ) ( OBJ-AT ?auto_99006 ?auto_99004 ) ( not ( = ?auto_99005 ?auto_99006 ) ) ( not ( = ?auto_99005 ?auto_99007 ) ) ( not ( = ?auto_99005 ?auto_99009 ) ) ( not ( = ?auto_99006 ?auto_99007 ) ) ( not ( = ?auto_99006 ?auto_99009 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99009 ?auto_99007 ?auto_99004 )
      ( DELIVER-3PKG-VERIFY ?auto_99005 ?auto_99006 ?auto_99007 ?auto_99004 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99017 - OBJ
      ?auto_99018 - OBJ
      ?auto_99019 - OBJ
      ?auto_99016 - LOCATION
    )
    :vars
    (
      ?auto_99020 - TRUCK
      ?auto_99022 - LOCATION
      ?auto_99023 - CITY
      ?auto_99021 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99020 ?auto_99022 ) ( IN-CITY ?auto_99022 ?auto_99023 ) ( IN-CITY ?auto_99016 ?auto_99023 ) ( not ( = ?auto_99016 ?auto_99022 ) ) ( OBJ-AT ?auto_99021 ?auto_99016 ) ( not ( = ?auto_99021 ?auto_99018 ) ) ( OBJ-AT ?auto_99018 ?auto_99022 ) ( OBJ-AT ?auto_99017 ?auto_99016 ) ( OBJ-AT ?auto_99019 ?auto_99016 ) ( not ( = ?auto_99017 ?auto_99018 ) ) ( not ( = ?auto_99017 ?auto_99019 ) ) ( not ( = ?auto_99017 ?auto_99021 ) ) ( not ( = ?auto_99018 ?auto_99019 ) ) ( not ( = ?auto_99019 ?auto_99021 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99021 ?auto_99018 ?auto_99016 )
      ( DELIVER-3PKG-VERIFY ?auto_99017 ?auto_99018 ?auto_99019 ?auto_99016 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99055 - OBJ
      ?auto_99056 - OBJ
      ?auto_99057 - OBJ
      ?auto_99054 - LOCATION
    )
    :vars
    (
      ?auto_99058 - TRUCK
      ?auto_99060 - LOCATION
      ?auto_99061 - CITY
      ?auto_99059 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99058 ?auto_99060 ) ( IN-CITY ?auto_99060 ?auto_99061 ) ( IN-CITY ?auto_99054 ?auto_99061 ) ( not ( = ?auto_99054 ?auto_99060 ) ) ( OBJ-AT ?auto_99059 ?auto_99054 ) ( not ( = ?auto_99059 ?auto_99055 ) ) ( OBJ-AT ?auto_99055 ?auto_99060 ) ( OBJ-AT ?auto_99056 ?auto_99054 ) ( OBJ-AT ?auto_99057 ?auto_99054 ) ( not ( = ?auto_99055 ?auto_99056 ) ) ( not ( = ?auto_99055 ?auto_99057 ) ) ( not ( = ?auto_99056 ?auto_99057 ) ) ( not ( = ?auto_99056 ?auto_99059 ) ) ( not ( = ?auto_99057 ?auto_99059 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99059 ?auto_99055 ?auto_99054 )
      ( DELIVER-3PKG-VERIFY ?auto_99055 ?auto_99056 ?auto_99057 ?auto_99054 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99102 - OBJ
      ?auto_99103 - OBJ
      ?auto_99105 - OBJ
      ?auto_99104 - OBJ
      ?auto_99101 - LOCATION
    )
    :vars
    (
      ?auto_99106 - TRUCK
      ?auto_99107 - LOCATION
      ?auto_99108 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99106 ?auto_99107 ) ( IN-CITY ?auto_99107 ?auto_99108 ) ( IN-CITY ?auto_99101 ?auto_99108 ) ( not ( = ?auto_99101 ?auto_99107 ) ) ( OBJ-AT ?auto_99102 ?auto_99101 ) ( not ( = ?auto_99102 ?auto_99104 ) ) ( OBJ-AT ?auto_99104 ?auto_99107 ) ( OBJ-AT ?auto_99103 ?auto_99101 ) ( OBJ-AT ?auto_99105 ?auto_99101 ) ( not ( = ?auto_99102 ?auto_99103 ) ) ( not ( = ?auto_99102 ?auto_99105 ) ) ( not ( = ?auto_99103 ?auto_99105 ) ) ( not ( = ?auto_99103 ?auto_99104 ) ) ( not ( = ?auto_99105 ?auto_99104 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99102 ?auto_99104 ?auto_99101 )
      ( DELIVER-4PKG-VERIFY ?auto_99102 ?auto_99103 ?auto_99105 ?auto_99104 ?auto_99101 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99118 - OBJ
      ?auto_99119 - OBJ
      ?auto_99121 - OBJ
      ?auto_99120 - OBJ
      ?auto_99117 - LOCATION
    )
    :vars
    (
      ?auto_99122 - TRUCK
      ?auto_99123 - LOCATION
      ?auto_99124 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99122 ?auto_99123 ) ( IN-CITY ?auto_99123 ?auto_99124 ) ( IN-CITY ?auto_99117 ?auto_99124 ) ( not ( = ?auto_99117 ?auto_99123 ) ) ( OBJ-AT ?auto_99118 ?auto_99117 ) ( not ( = ?auto_99118 ?auto_99121 ) ) ( OBJ-AT ?auto_99121 ?auto_99123 ) ( OBJ-AT ?auto_99119 ?auto_99117 ) ( OBJ-AT ?auto_99120 ?auto_99117 ) ( not ( = ?auto_99118 ?auto_99119 ) ) ( not ( = ?auto_99118 ?auto_99120 ) ) ( not ( = ?auto_99119 ?auto_99121 ) ) ( not ( = ?auto_99119 ?auto_99120 ) ) ( not ( = ?auto_99121 ?auto_99120 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99118 ?auto_99121 ?auto_99117 )
      ( DELIVER-4PKG-VERIFY ?auto_99118 ?auto_99119 ?auto_99121 ?auto_99120 ?auto_99117 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99134 - OBJ
      ?auto_99135 - OBJ
      ?auto_99137 - OBJ
      ?auto_99136 - OBJ
      ?auto_99133 - LOCATION
    )
    :vars
    (
      ?auto_99138 - TRUCK
      ?auto_99139 - LOCATION
      ?auto_99140 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99138 ?auto_99139 ) ( IN-CITY ?auto_99139 ?auto_99140 ) ( IN-CITY ?auto_99133 ?auto_99140 ) ( not ( = ?auto_99133 ?auto_99139 ) ) ( OBJ-AT ?auto_99137 ?auto_99133 ) ( not ( = ?auto_99137 ?auto_99136 ) ) ( OBJ-AT ?auto_99136 ?auto_99139 ) ( OBJ-AT ?auto_99134 ?auto_99133 ) ( OBJ-AT ?auto_99135 ?auto_99133 ) ( not ( = ?auto_99134 ?auto_99135 ) ) ( not ( = ?auto_99134 ?auto_99137 ) ) ( not ( = ?auto_99134 ?auto_99136 ) ) ( not ( = ?auto_99135 ?auto_99137 ) ) ( not ( = ?auto_99135 ?auto_99136 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99137 ?auto_99136 ?auto_99133 )
      ( DELIVER-4PKG-VERIFY ?auto_99134 ?auto_99135 ?auto_99137 ?auto_99136 ?auto_99133 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99182 - OBJ
      ?auto_99183 - OBJ
      ?auto_99185 - OBJ
      ?auto_99184 - OBJ
      ?auto_99181 - LOCATION
    )
    :vars
    (
      ?auto_99186 - TRUCK
      ?auto_99187 - LOCATION
      ?auto_99188 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99186 ?auto_99187 ) ( IN-CITY ?auto_99187 ?auto_99188 ) ( IN-CITY ?auto_99181 ?auto_99188 ) ( not ( = ?auto_99181 ?auto_99187 ) ) ( OBJ-AT ?auto_99182 ?auto_99181 ) ( not ( = ?auto_99182 ?auto_99183 ) ) ( OBJ-AT ?auto_99183 ?auto_99187 ) ( OBJ-AT ?auto_99185 ?auto_99181 ) ( OBJ-AT ?auto_99184 ?auto_99181 ) ( not ( = ?auto_99182 ?auto_99185 ) ) ( not ( = ?auto_99182 ?auto_99184 ) ) ( not ( = ?auto_99183 ?auto_99185 ) ) ( not ( = ?auto_99183 ?auto_99184 ) ) ( not ( = ?auto_99185 ?auto_99184 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99182 ?auto_99183 ?auto_99181 )
      ( DELIVER-4PKG-VERIFY ?auto_99182 ?auto_99183 ?auto_99185 ?auto_99184 ?auto_99181 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99198 - OBJ
      ?auto_99199 - OBJ
      ?auto_99201 - OBJ
      ?auto_99200 - OBJ
      ?auto_99197 - LOCATION
    )
    :vars
    (
      ?auto_99202 - TRUCK
      ?auto_99203 - LOCATION
      ?auto_99204 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99202 ?auto_99203 ) ( IN-CITY ?auto_99203 ?auto_99204 ) ( IN-CITY ?auto_99197 ?auto_99204 ) ( not ( = ?auto_99197 ?auto_99203 ) ) ( OBJ-AT ?auto_99200 ?auto_99197 ) ( not ( = ?auto_99200 ?auto_99199 ) ) ( OBJ-AT ?auto_99199 ?auto_99203 ) ( OBJ-AT ?auto_99198 ?auto_99197 ) ( OBJ-AT ?auto_99201 ?auto_99197 ) ( not ( = ?auto_99198 ?auto_99199 ) ) ( not ( = ?auto_99198 ?auto_99201 ) ) ( not ( = ?auto_99198 ?auto_99200 ) ) ( not ( = ?auto_99199 ?auto_99201 ) ) ( not ( = ?auto_99201 ?auto_99200 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99200 ?auto_99199 ?auto_99197 )
      ( DELIVER-4PKG-VERIFY ?auto_99198 ?auto_99199 ?auto_99201 ?auto_99200 ?auto_99197 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99262 - OBJ
      ?auto_99263 - OBJ
      ?auto_99265 - OBJ
      ?auto_99264 - OBJ
      ?auto_99261 - LOCATION
    )
    :vars
    (
      ?auto_99266 - TRUCK
      ?auto_99267 - LOCATION
      ?auto_99268 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99266 ?auto_99267 ) ( IN-CITY ?auto_99267 ?auto_99268 ) ( IN-CITY ?auto_99261 ?auto_99268 ) ( not ( = ?auto_99261 ?auto_99267 ) ) ( OBJ-AT ?auto_99263 ?auto_99261 ) ( not ( = ?auto_99263 ?auto_99265 ) ) ( OBJ-AT ?auto_99265 ?auto_99267 ) ( OBJ-AT ?auto_99262 ?auto_99261 ) ( OBJ-AT ?auto_99264 ?auto_99261 ) ( not ( = ?auto_99262 ?auto_99263 ) ) ( not ( = ?auto_99262 ?auto_99265 ) ) ( not ( = ?auto_99262 ?auto_99264 ) ) ( not ( = ?auto_99263 ?auto_99264 ) ) ( not ( = ?auto_99265 ?auto_99264 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99263 ?auto_99265 ?auto_99261 )
      ( DELIVER-4PKG-VERIFY ?auto_99262 ?auto_99263 ?auto_99265 ?auto_99264 ?auto_99261 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99294 - OBJ
      ?auto_99295 - OBJ
      ?auto_99297 - OBJ
      ?auto_99296 - OBJ
      ?auto_99293 - LOCATION
    )
    :vars
    (
      ?auto_99298 - TRUCK
      ?auto_99300 - LOCATION
      ?auto_99301 - CITY
      ?auto_99299 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99298 ?auto_99300 ) ( IN-CITY ?auto_99300 ?auto_99301 ) ( IN-CITY ?auto_99293 ?auto_99301 ) ( not ( = ?auto_99293 ?auto_99300 ) ) ( OBJ-AT ?auto_99299 ?auto_99293 ) ( not ( = ?auto_99299 ?auto_99296 ) ) ( OBJ-AT ?auto_99296 ?auto_99300 ) ( OBJ-AT ?auto_99294 ?auto_99293 ) ( OBJ-AT ?auto_99295 ?auto_99293 ) ( OBJ-AT ?auto_99297 ?auto_99293 ) ( not ( = ?auto_99294 ?auto_99295 ) ) ( not ( = ?auto_99294 ?auto_99297 ) ) ( not ( = ?auto_99294 ?auto_99296 ) ) ( not ( = ?auto_99294 ?auto_99299 ) ) ( not ( = ?auto_99295 ?auto_99297 ) ) ( not ( = ?auto_99295 ?auto_99296 ) ) ( not ( = ?auto_99295 ?auto_99299 ) ) ( not ( = ?auto_99297 ?auto_99296 ) ) ( not ( = ?auto_99297 ?auto_99299 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99299 ?auto_99296 ?auto_99293 )
      ( DELIVER-4PKG-VERIFY ?auto_99294 ?auto_99295 ?auto_99297 ?auto_99296 ?auto_99293 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99311 - OBJ
      ?auto_99312 - OBJ
      ?auto_99314 - OBJ
      ?auto_99313 - OBJ
      ?auto_99310 - LOCATION
    )
    :vars
    (
      ?auto_99315 - TRUCK
      ?auto_99317 - LOCATION
      ?auto_99318 - CITY
      ?auto_99316 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99315 ?auto_99317 ) ( IN-CITY ?auto_99317 ?auto_99318 ) ( IN-CITY ?auto_99310 ?auto_99318 ) ( not ( = ?auto_99310 ?auto_99317 ) ) ( OBJ-AT ?auto_99316 ?auto_99310 ) ( not ( = ?auto_99316 ?auto_99314 ) ) ( OBJ-AT ?auto_99314 ?auto_99317 ) ( OBJ-AT ?auto_99311 ?auto_99310 ) ( OBJ-AT ?auto_99312 ?auto_99310 ) ( OBJ-AT ?auto_99313 ?auto_99310 ) ( not ( = ?auto_99311 ?auto_99312 ) ) ( not ( = ?auto_99311 ?auto_99314 ) ) ( not ( = ?auto_99311 ?auto_99313 ) ) ( not ( = ?auto_99311 ?auto_99316 ) ) ( not ( = ?auto_99312 ?auto_99314 ) ) ( not ( = ?auto_99312 ?auto_99313 ) ) ( not ( = ?auto_99312 ?auto_99316 ) ) ( not ( = ?auto_99314 ?auto_99313 ) ) ( not ( = ?auto_99313 ?auto_99316 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99316 ?auto_99314 ?auto_99310 )
      ( DELIVER-4PKG-VERIFY ?auto_99311 ?auto_99312 ?auto_99314 ?auto_99313 ?auto_99310 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99361 - OBJ
      ?auto_99362 - OBJ
      ?auto_99364 - OBJ
      ?auto_99363 - OBJ
      ?auto_99360 - LOCATION
    )
    :vars
    (
      ?auto_99365 - TRUCK
      ?auto_99367 - LOCATION
      ?auto_99368 - CITY
      ?auto_99366 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99365 ?auto_99367 ) ( IN-CITY ?auto_99367 ?auto_99368 ) ( IN-CITY ?auto_99360 ?auto_99368 ) ( not ( = ?auto_99360 ?auto_99367 ) ) ( OBJ-AT ?auto_99366 ?auto_99360 ) ( not ( = ?auto_99366 ?auto_99362 ) ) ( OBJ-AT ?auto_99362 ?auto_99367 ) ( OBJ-AT ?auto_99361 ?auto_99360 ) ( OBJ-AT ?auto_99364 ?auto_99360 ) ( OBJ-AT ?auto_99363 ?auto_99360 ) ( not ( = ?auto_99361 ?auto_99362 ) ) ( not ( = ?auto_99361 ?auto_99364 ) ) ( not ( = ?auto_99361 ?auto_99363 ) ) ( not ( = ?auto_99361 ?auto_99366 ) ) ( not ( = ?auto_99362 ?auto_99364 ) ) ( not ( = ?auto_99362 ?auto_99363 ) ) ( not ( = ?auto_99364 ?auto_99363 ) ) ( not ( = ?auto_99364 ?auto_99366 ) ) ( not ( = ?auto_99363 ?auto_99366 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99366 ?auto_99362 ?auto_99360 )
      ( DELIVER-4PKG-VERIFY ?auto_99361 ?auto_99362 ?auto_99364 ?auto_99363 ?auto_99360 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99405 - OBJ
      ?auto_99406 - OBJ
      ?auto_99408 - OBJ
      ?auto_99407 - OBJ
      ?auto_99404 - LOCATION
    )
    :vars
    (
      ?auto_99409 - TRUCK
      ?auto_99410 - LOCATION
      ?auto_99411 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99409 ?auto_99410 ) ( IN-CITY ?auto_99410 ?auto_99411 ) ( IN-CITY ?auto_99404 ?auto_99411 ) ( not ( = ?auto_99404 ?auto_99410 ) ) ( OBJ-AT ?auto_99408 ?auto_99404 ) ( not ( = ?auto_99408 ?auto_99405 ) ) ( OBJ-AT ?auto_99405 ?auto_99410 ) ( OBJ-AT ?auto_99406 ?auto_99404 ) ( OBJ-AT ?auto_99407 ?auto_99404 ) ( not ( = ?auto_99405 ?auto_99406 ) ) ( not ( = ?auto_99405 ?auto_99407 ) ) ( not ( = ?auto_99406 ?auto_99408 ) ) ( not ( = ?auto_99406 ?auto_99407 ) ) ( not ( = ?auto_99408 ?auto_99407 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99408 ?auto_99405 ?auto_99404 )
      ( DELIVER-4PKG-VERIFY ?auto_99405 ?auto_99406 ?auto_99408 ?auto_99407 ?auto_99404 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99437 - OBJ
      ?auto_99438 - OBJ
      ?auto_99440 - OBJ
      ?auto_99439 - OBJ
      ?auto_99436 - LOCATION
    )
    :vars
    (
      ?auto_99441 - TRUCK
      ?auto_99442 - LOCATION
      ?auto_99443 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99441 ?auto_99442 ) ( IN-CITY ?auto_99442 ?auto_99443 ) ( IN-CITY ?auto_99436 ?auto_99443 ) ( not ( = ?auto_99436 ?auto_99442 ) ) ( OBJ-AT ?auto_99438 ?auto_99436 ) ( not ( = ?auto_99438 ?auto_99437 ) ) ( OBJ-AT ?auto_99437 ?auto_99442 ) ( OBJ-AT ?auto_99440 ?auto_99436 ) ( OBJ-AT ?auto_99439 ?auto_99436 ) ( not ( = ?auto_99437 ?auto_99440 ) ) ( not ( = ?auto_99437 ?auto_99439 ) ) ( not ( = ?auto_99438 ?auto_99440 ) ) ( not ( = ?auto_99438 ?auto_99439 ) ) ( not ( = ?auto_99440 ?auto_99439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99438 ?auto_99437 ?auto_99436 )
      ( DELIVER-4PKG-VERIFY ?auto_99437 ?auto_99438 ?auto_99440 ?auto_99439 ?auto_99436 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99509 - OBJ
      ?auto_99510 - OBJ
      ?auto_99512 - OBJ
      ?auto_99511 - OBJ
      ?auto_99508 - LOCATION
    )
    :vars
    (
      ?auto_99513 - TRUCK
      ?auto_99515 - LOCATION
      ?auto_99516 - CITY
      ?auto_99514 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99513 ?auto_99515 ) ( IN-CITY ?auto_99515 ?auto_99516 ) ( IN-CITY ?auto_99508 ?auto_99516 ) ( not ( = ?auto_99508 ?auto_99515 ) ) ( OBJ-AT ?auto_99514 ?auto_99508 ) ( not ( = ?auto_99514 ?auto_99509 ) ) ( OBJ-AT ?auto_99509 ?auto_99515 ) ( OBJ-AT ?auto_99510 ?auto_99508 ) ( OBJ-AT ?auto_99512 ?auto_99508 ) ( OBJ-AT ?auto_99511 ?auto_99508 ) ( not ( = ?auto_99509 ?auto_99510 ) ) ( not ( = ?auto_99509 ?auto_99512 ) ) ( not ( = ?auto_99509 ?auto_99511 ) ) ( not ( = ?auto_99510 ?auto_99512 ) ) ( not ( = ?auto_99510 ?auto_99511 ) ) ( not ( = ?auto_99510 ?auto_99514 ) ) ( not ( = ?auto_99512 ?auto_99511 ) ) ( not ( = ?auto_99512 ?auto_99514 ) ) ( not ( = ?auto_99511 ?auto_99514 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99514 ?auto_99509 ?auto_99508 )
      ( DELIVER-4PKG-VERIFY ?auto_99509 ?auto_99510 ?auto_99512 ?auto_99511 ?auto_99508 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99693 - OBJ
      ?auto_99694 - OBJ
      ?auto_99695 - OBJ
      ?auto_99692 - LOCATION
    )
    :vars
    (
      ?auto_99698 - LOCATION
      ?auto_99699 - CITY
      ?auto_99697 - OBJ
      ?auto_99696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99698 ?auto_99699 ) ( IN-CITY ?auto_99692 ?auto_99699 ) ( not ( = ?auto_99692 ?auto_99698 ) ) ( OBJ-AT ?auto_99697 ?auto_99692 ) ( not ( = ?auto_99697 ?auto_99695 ) ) ( OBJ-AT ?auto_99695 ?auto_99698 ) ( TRUCK-AT ?auto_99696 ?auto_99692 ) ( OBJ-AT ?auto_99693 ?auto_99692 ) ( OBJ-AT ?auto_99694 ?auto_99692 ) ( not ( = ?auto_99693 ?auto_99694 ) ) ( not ( = ?auto_99693 ?auto_99695 ) ) ( not ( = ?auto_99693 ?auto_99697 ) ) ( not ( = ?auto_99694 ?auto_99695 ) ) ( not ( = ?auto_99694 ?auto_99697 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99697 ?auto_99695 ?auto_99692 )
      ( DELIVER-3PKG-VERIFY ?auto_99693 ?auto_99694 ?auto_99695 ?auto_99692 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99705 - OBJ
      ?auto_99706 - OBJ
      ?auto_99707 - OBJ
      ?auto_99704 - LOCATION
    )
    :vars
    (
      ?auto_99710 - LOCATION
      ?auto_99711 - CITY
      ?auto_99709 - OBJ
      ?auto_99708 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99710 ?auto_99711 ) ( IN-CITY ?auto_99704 ?auto_99711 ) ( not ( = ?auto_99704 ?auto_99710 ) ) ( OBJ-AT ?auto_99709 ?auto_99704 ) ( not ( = ?auto_99709 ?auto_99706 ) ) ( OBJ-AT ?auto_99706 ?auto_99710 ) ( TRUCK-AT ?auto_99708 ?auto_99704 ) ( OBJ-AT ?auto_99705 ?auto_99704 ) ( OBJ-AT ?auto_99707 ?auto_99704 ) ( not ( = ?auto_99705 ?auto_99706 ) ) ( not ( = ?auto_99705 ?auto_99707 ) ) ( not ( = ?auto_99705 ?auto_99709 ) ) ( not ( = ?auto_99706 ?auto_99707 ) ) ( not ( = ?auto_99707 ?auto_99709 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99709 ?auto_99706 ?auto_99704 )
      ( DELIVER-3PKG-VERIFY ?auto_99705 ?auto_99706 ?auto_99707 ?auto_99704 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99721 - OBJ
      ?auto_99722 - OBJ
      ?auto_99723 - OBJ
      ?auto_99720 - LOCATION
    )
    :vars
    (
      ?auto_99725 - LOCATION
      ?auto_99726 - CITY
      ?auto_99724 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99725 ?auto_99726 ) ( IN-CITY ?auto_99720 ?auto_99726 ) ( not ( = ?auto_99720 ?auto_99725 ) ) ( OBJ-AT ?auto_99723 ?auto_99720 ) ( not ( = ?auto_99723 ?auto_99721 ) ) ( OBJ-AT ?auto_99721 ?auto_99725 ) ( TRUCK-AT ?auto_99724 ?auto_99720 ) ( OBJ-AT ?auto_99722 ?auto_99720 ) ( not ( = ?auto_99721 ?auto_99722 ) ) ( not ( = ?auto_99722 ?auto_99723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99723 ?auto_99721 ?auto_99720 )
      ( DELIVER-3PKG-VERIFY ?auto_99721 ?auto_99722 ?auto_99723 ?auto_99720 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99743 - OBJ
      ?auto_99744 - OBJ
      ?auto_99745 - OBJ
      ?auto_99742 - LOCATION
    )
    :vars
    (
      ?auto_99748 - LOCATION
      ?auto_99749 - CITY
      ?auto_99747 - OBJ
      ?auto_99746 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99748 ?auto_99749 ) ( IN-CITY ?auto_99742 ?auto_99749 ) ( not ( = ?auto_99742 ?auto_99748 ) ) ( OBJ-AT ?auto_99747 ?auto_99742 ) ( not ( = ?auto_99747 ?auto_99743 ) ) ( OBJ-AT ?auto_99743 ?auto_99748 ) ( TRUCK-AT ?auto_99746 ?auto_99742 ) ( OBJ-AT ?auto_99744 ?auto_99742 ) ( OBJ-AT ?auto_99745 ?auto_99742 ) ( not ( = ?auto_99743 ?auto_99744 ) ) ( not ( = ?auto_99743 ?auto_99745 ) ) ( not ( = ?auto_99744 ?auto_99745 ) ) ( not ( = ?auto_99744 ?auto_99747 ) ) ( not ( = ?auto_99745 ?auto_99747 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99747 ?auto_99743 ?auto_99742 )
      ( DELIVER-3PKG-VERIFY ?auto_99743 ?auto_99744 ?auto_99745 ?auto_99742 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99782 - OBJ
      ?auto_99783 - OBJ
      ?auto_99785 - OBJ
      ?auto_99784 - OBJ
      ?auto_99781 - LOCATION
    )
    :vars
    (
      ?auto_99787 - LOCATION
      ?auto_99788 - CITY
      ?auto_99786 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99787 ?auto_99788 ) ( IN-CITY ?auto_99781 ?auto_99788 ) ( not ( = ?auto_99781 ?auto_99787 ) ) ( OBJ-AT ?auto_99782 ?auto_99781 ) ( not ( = ?auto_99782 ?auto_99784 ) ) ( OBJ-AT ?auto_99784 ?auto_99787 ) ( TRUCK-AT ?auto_99786 ?auto_99781 ) ( OBJ-AT ?auto_99783 ?auto_99781 ) ( OBJ-AT ?auto_99785 ?auto_99781 ) ( not ( = ?auto_99782 ?auto_99783 ) ) ( not ( = ?auto_99782 ?auto_99785 ) ) ( not ( = ?auto_99783 ?auto_99785 ) ) ( not ( = ?auto_99783 ?auto_99784 ) ) ( not ( = ?auto_99785 ?auto_99784 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99782 ?auto_99784 ?auto_99781 )
      ( DELIVER-4PKG-VERIFY ?auto_99782 ?auto_99783 ?auto_99785 ?auto_99784 ?auto_99781 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99798 - OBJ
      ?auto_99799 - OBJ
      ?auto_99801 - OBJ
      ?auto_99800 - OBJ
      ?auto_99797 - LOCATION
    )
    :vars
    (
      ?auto_99803 - LOCATION
      ?auto_99804 - CITY
      ?auto_99802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99803 ?auto_99804 ) ( IN-CITY ?auto_99797 ?auto_99804 ) ( not ( = ?auto_99797 ?auto_99803 ) ) ( OBJ-AT ?auto_99798 ?auto_99797 ) ( not ( = ?auto_99798 ?auto_99801 ) ) ( OBJ-AT ?auto_99801 ?auto_99803 ) ( TRUCK-AT ?auto_99802 ?auto_99797 ) ( OBJ-AT ?auto_99799 ?auto_99797 ) ( OBJ-AT ?auto_99800 ?auto_99797 ) ( not ( = ?auto_99798 ?auto_99799 ) ) ( not ( = ?auto_99798 ?auto_99800 ) ) ( not ( = ?auto_99799 ?auto_99801 ) ) ( not ( = ?auto_99799 ?auto_99800 ) ) ( not ( = ?auto_99801 ?auto_99800 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99798 ?auto_99801 ?auto_99797 )
      ( DELIVER-4PKG-VERIFY ?auto_99798 ?auto_99799 ?auto_99801 ?auto_99800 ?auto_99797 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99862 - OBJ
      ?auto_99863 - OBJ
      ?auto_99865 - OBJ
      ?auto_99864 - OBJ
      ?auto_99861 - LOCATION
    )
    :vars
    (
      ?auto_99867 - LOCATION
      ?auto_99868 - CITY
      ?auto_99866 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99867 ?auto_99868 ) ( IN-CITY ?auto_99861 ?auto_99868 ) ( not ( = ?auto_99861 ?auto_99867 ) ) ( OBJ-AT ?auto_99864 ?auto_99861 ) ( not ( = ?auto_99864 ?auto_99863 ) ) ( OBJ-AT ?auto_99863 ?auto_99867 ) ( TRUCK-AT ?auto_99866 ?auto_99861 ) ( OBJ-AT ?auto_99862 ?auto_99861 ) ( OBJ-AT ?auto_99865 ?auto_99861 ) ( not ( = ?auto_99862 ?auto_99863 ) ) ( not ( = ?auto_99862 ?auto_99865 ) ) ( not ( = ?auto_99862 ?auto_99864 ) ) ( not ( = ?auto_99863 ?auto_99865 ) ) ( not ( = ?auto_99865 ?auto_99864 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99864 ?auto_99863 ?auto_99861 )
      ( DELIVER-4PKG-VERIFY ?auto_99862 ?auto_99863 ?auto_99865 ?auto_99864 ?auto_99861 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99870 - OBJ
      ?auto_99871 - OBJ
      ?auto_99873 - OBJ
      ?auto_99872 - OBJ
      ?auto_99869 - LOCATION
    )
    :vars
    (
      ?auto_99875 - LOCATION
      ?auto_99876 - CITY
      ?auto_99874 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99875 ?auto_99876 ) ( IN-CITY ?auto_99869 ?auto_99876 ) ( not ( = ?auto_99869 ?auto_99875 ) ) ( OBJ-AT ?auto_99870 ?auto_99869 ) ( not ( = ?auto_99870 ?auto_99871 ) ) ( OBJ-AT ?auto_99871 ?auto_99875 ) ( TRUCK-AT ?auto_99874 ?auto_99869 ) ( OBJ-AT ?auto_99873 ?auto_99869 ) ( OBJ-AT ?auto_99872 ?auto_99869 ) ( not ( = ?auto_99870 ?auto_99873 ) ) ( not ( = ?auto_99870 ?auto_99872 ) ) ( not ( = ?auto_99871 ?auto_99873 ) ) ( not ( = ?auto_99871 ?auto_99872 ) ) ( not ( = ?auto_99873 ?auto_99872 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99870 ?auto_99871 ?auto_99869 )
      ( DELIVER-4PKG-VERIFY ?auto_99870 ?auto_99871 ?auto_99873 ?auto_99872 ?auto_99869 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99934 - OBJ
      ?auto_99935 - OBJ
      ?auto_99937 - OBJ
      ?auto_99936 - OBJ
      ?auto_99933 - LOCATION
    )
    :vars
    (
      ?auto_99939 - LOCATION
      ?auto_99940 - CITY
      ?auto_99938 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99939 ?auto_99940 ) ( IN-CITY ?auto_99933 ?auto_99940 ) ( not ( = ?auto_99933 ?auto_99939 ) ) ( OBJ-AT ?auto_99935 ?auto_99933 ) ( not ( = ?auto_99935 ?auto_99936 ) ) ( OBJ-AT ?auto_99936 ?auto_99939 ) ( TRUCK-AT ?auto_99938 ?auto_99933 ) ( OBJ-AT ?auto_99934 ?auto_99933 ) ( OBJ-AT ?auto_99937 ?auto_99933 ) ( not ( = ?auto_99934 ?auto_99935 ) ) ( not ( = ?auto_99934 ?auto_99937 ) ) ( not ( = ?auto_99934 ?auto_99936 ) ) ( not ( = ?auto_99935 ?auto_99937 ) ) ( not ( = ?auto_99937 ?auto_99936 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99935 ?auto_99936 ?auto_99933 )
      ( DELIVER-4PKG-VERIFY ?auto_99934 ?auto_99935 ?auto_99937 ?auto_99936 ?auto_99933 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99982 - OBJ
      ?auto_99983 - OBJ
      ?auto_99985 - OBJ
      ?auto_99984 - OBJ
      ?auto_99981 - LOCATION
    )
    :vars
    (
      ?auto_99988 - LOCATION
      ?auto_99989 - CITY
      ?auto_99987 - OBJ
      ?auto_99986 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99988 ?auto_99989 ) ( IN-CITY ?auto_99981 ?auto_99989 ) ( not ( = ?auto_99981 ?auto_99988 ) ) ( OBJ-AT ?auto_99987 ?auto_99981 ) ( not ( = ?auto_99987 ?auto_99984 ) ) ( OBJ-AT ?auto_99984 ?auto_99988 ) ( TRUCK-AT ?auto_99986 ?auto_99981 ) ( OBJ-AT ?auto_99982 ?auto_99981 ) ( OBJ-AT ?auto_99983 ?auto_99981 ) ( OBJ-AT ?auto_99985 ?auto_99981 ) ( not ( = ?auto_99982 ?auto_99983 ) ) ( not ( = ?auto_99982 ?auto_99985 ) ) ( not ( = ?auto_99982 ?auto_99984 ) ) ( not ( = ?auto_99982 ?auto_99987 ) ) ( not ( = ?auto_99983 ?auto_99985 ) ) ( not ( = ?auto_99983 ?auto_99984 ) ) ( not ( = ?auto_99983 ?auto_99987 ) ) ( not ( = ?auto_99985 ?auto_99984 ) ) ( not ( = ?auto_99985 ?auto_99987 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99987 ?auto_99984 ?auto_99981 )
      ( DELIVER-4PKG-VERIFY ?auto_99982 ?auto_99983 ?auto_99985 ?auto_99984 ?auto_99981 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99991 - OBJ
      ?auto_99992 - OBJ
      ?auto_99994 - OBJ
      ?auto_99993 - OBJ
      ?auto_99990 - LOCATION
    )
    :vars
    (
      ?auto_99996 - LOCATION
      ?auto_99997 - CITY
      ?auto_99995 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99996 ?auto_99997 ) ( IN-CITY ?auto_99990 ?auto_99997 ) ( not ( = ?auto_99990 ?auto_99996 ) ) ( OBJ-AT ?auto_99993 ?auto_99990 ) ( not ( = ?auto_99993 ?auto_99994 ) ) ( OBJ-AT ?auto_99994 ?auto_99996 ) ( TRUCK-AT ?auto_99995 ?auto_99990 ) ( OBJ-AT ?auto_99991 ?auto_99990 ) ( OBJ-AT ?auto_99992 ?auto_99990 ) ( not ( = ?auto_99991 ?auto_99992 ) ) ( not ( = ?auto_99991 ?auto_99994 ) ) ( not ( = ?auto_99991 ?auto_99993 ) ) ( not ( = ?auto_99992 ?auto_99994 ) ) ( not ( = ?auto_99992 ?auto_99993 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99993 ?auto_99994 ?auto_99990 )
      ( DELIVER-4PKG-VERIFY ?auto_99991 ?auto_99992 ?auto_99994 ?auto_99993 ?auto_99990 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99999 - OBJ
      ?auto_100000 - OBJ
      ?auto_100002 - OBJ
      ?auto_100001 - OBJ
      ?auto_99998 - LOCATION
    )
    :vars
    (
      ?auto_100005 - LOCATION
      ?auto_100006 - CITY
      ?auto_100004 - OBJ
      ?auto_100003 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100005 ?auto_100006 ) ( IN-CITY ?auto_99998 ?auto_100006 ) ( not ( = ?auto_99998 ?auto_100005 ) ) ( OBJ-AT ?auto_100004 ?auto_99998 ) ( not ( = ?auto_100004 ?auto_100002 ) ) ( OBJ-AT ?auto_100002 ?auto_100005 ) ( TRUCK-AT ?auto_100003 ?auto_99998 ) ( OBJ-AT ?auto_99999 ?auto_99998 ) ( OBJ-AT ?auto_100000 ?auto_99998 ) ( OBJ-AT ?auto_100001 ?auto_99998 ) ( not ( = ?auto_99999 ?auto_100000 ) ) ( not ( = ?auto_99999 ?auto_100002 ) ) ( not ( = ?auto_99999 ?auto_100001 ) ) ( not ( = ?auto_99999 ?auto_100004 ) ) ( not ( = ?auto_100000 ?auto_100002 ) ) ( not ( = ?auto_100000 ?auto_100001 ) ) ( not ( = ?auto_100000 ?auto_100004 ) ) ( not ( = ?auto_100002 ?auto_100001 ) ) ( not ( = ?auto_100001 ?auto_100004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100004 ?auto_100002 ?auto_99998 )
      ( DELIVER-4PKG-VERIFY ?auto_99999 ?auto_100000 ?auto_100002 ?auto_100001 ?auto_99998 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100049 - OBJ
      ?auto_100050 - OBJ
      ?auto_100052 - OBJ
      ?auto_100051 - OBJ
      ?auto_100048 - LOCATION
    )
    :vars
    (
      ?auto_100055 - LOCATION
      ?auto_100056 - CITY
      ?auto_100054 - OBJ
      ?auto_100053 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100055 ?auto_100056 ) ( IN-CITY ?auto_100048 ?auto_100056 ) ( not ( = ?auto_100048 ?auto_100055 ) ) ( OBJ-AT ?auto_100054 ?auto_100048 ) ( not ( = ?auto_100054 ?auto_100050 ) ) ( OBJ-AT ?auto_100050 ?auto_100055 ) ( TRUCK-AT ?auto_100053 ?auto_100048 ) ( OBJ-AT ?auto_100049 ?auto_100048 ) ( OBJ-AT ?auto_100052 ?auto_100048 ) ( OBJ-AT ?auto_100051 ?auto_100048 ) ( not ( = ?auto_100049 ?auto_100050 ) ) ( not ( = ?auto_100049 ?auto_100052 ) ) ( not ( = ?auto_100049 ?auto_100051 ) ) ( not ( = ?auto_100049 ?auto_100054 ) ) ( not ( = ?auto_100050 ?auto_100052 ) ) ( not ( = ?auto_100050 ?auto_100051 ) ) ( not ( = ?auto_100052 ?auto_100051 ) ) ( not ( = ?auto_100052 ?auto_100054 ) ) ( not ( = ?auto_100051 ?auto_100054 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100054 ?auto_100050 ?auto_100048 )
      ( DELIVER-4PKG-VERIFY ?auto_100049 ?auto_100050 ?auto_100052 ?auto_100051 ?auto_100048 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100093 - OBJ
      ?auto_100094 - OBJ
      ?auto_100096 - OBJ
      ?auto_100095 - OBJ
      ?auto_100092 - LOCATION
    )
    :vars
    (
      ?auto_100098 - LOCATION
      ?auto_100099 - CITY
      ?auto_100097 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100098 ?auto_100099 ) ( IN-CITY ?auto_100092 ?auto_100099 ) ( not ( = ?auto_100092 ?auto_100098 ) ) ( OBJ-AT ?auto_100095 ?auto_100092 ) ( not ( = ?auto_100095 ?auto_100093 ) ) ( OBJ-AT ?auto_100093 ?auto_100098 ) ( TRUCK-AT ?auto_100097 ?auto_100092 ) ( OBJ-AT ?auto_100094 ?auto_100092 ) ( OBJ-AT ?auto_100096 ?auto_100092 ) ( not ( = ?auto_100093 ?auto_100094 ) ) ( not ( = ?auto_100093 ?auto_100096 ) ) ( not ( = ?auto_100094 ?auto_100096 ) ) ( not ( = ?auto_100094 ?auto_100095 ) ) ( not ( = ?auto_100096 ?auto_100095 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100095 ?auto_100093 ?auto_100092 )
      ( DELIVER-4PKG-VERIFY ?auto_100093 ?auto_100094 ?auto_100096 ?auto_100095 ?auto_100092 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100125 - OBJ
      ?auto_100126 - OBJ
      ?auto_100128 - OBJ
      ?auto_100127 - OBJ
      ?auto_100124 - LOCATION
    )
    :vars
    (
      ?auto_100130 - LOCATION
      ?auto_100131 - CITY
      ?auto_100129 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100130 ?auto_100131 ) ( IN-CITY ?auto_100124 ?auto_100131 ) ( not ( = ?auto_100124 ?auto_100130 ) ) ( OBJ-AT ?auto_100126 ?auto_100124 ) ( not ( = ?auto_100126 ?auto_100125 ) ) ( OBJ-AT ?auto_100125 ?auto_100130 ) ( TRUCK-AT ?auto_100129 ?auto_100124 ) ( OBJ-AT ?auto_100128 ?auto_100124 ) ( OBJ-AT ?auto_100127 ?auto_100124 ) ( not ( = ?auto_100125 ?auto_100128 ) ) ( not ( = ?auto_100125 ?auto_100127 ) ) ( not ( = ?auto_100126 ?auto_100128 ) ) ( not ( = ?auto_100126 ?auto_100127 ) ) ( not ( = ?auto_100128 ?auto_100127 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100126 ?auto_100125 ?auto_100124 )
      ( DELIVER-4PKG-VERIFY ?auto_100125 ?auto_100126 ?auto_100128 ?auto_100127 ?auto_100124 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100197 - OBJ
      ?auto_100198 - OBJ
      ?auto_100200 - OBJ
      ?auto_100199 - OBJ
      ?auto_100196 - LOCATION
    )
    :vars
    (
      ?auto_100203 - LOCATION
      ?auto_100204 - CITY
      ?auto_100202 - OBJ
      ?auto_100201 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100203 ?auto_100204 ) ( IN-CITY ?auto_100196 ?auto_100204 ) ( not ( = ?auto_100196 ?auto_100203 ) ) ( OBJ-AT ?auto_100202 ?auto_100196 ) ( not ( = ?auto_100202 ?auto_100197 ) ) ( OBJ-AT ?auto_100197 ?auto_100203 ) ( TRUCK-AT ?auto_100201 ?auto_100196 ) ( OBJ-AT ?auto_100198 ?auto_100196 ) ( OBJ-AT ?auto_100200 ?auto_100196 ) ( OBJ-AT ?auto_100199 ?auto_100196 ) ( not ( = ?auto_100197 ?auto_100198 ) ) ( not ( = ?auto_100197 ?auto_100200 ) ) ( not ( = ?auto_100197 ?auto_100199 ) ) ( not ( = ?auto_100198 ?auto_100200 ) ) ( not ( = ?auto_100198 ?auto_100199 ) ) ( not ( = ?auto_100198 ?auto_100202 ) ) ( not ( = ?auto_100200 ?auto_100199 ) ) ( not ( = ?auto_100200 ?auto_100202 ) ) ( not ( = ?auto_100199 ?auto_100202 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100202 ?auto_100197 ?auto_100196 )
      ( DELIVER-4PKG-VERIFY ?auto_100197 ?auto_100198 ?auto_100200 ?auto_100199 ?auto_100196 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_100346 - OBJ
      ?auto_100347 - OBJ
      ?auto_100348 - OBJ
      ?auto_100345 - LOCATION
    )
    :vars
    (
      ?auto_100349 - LOCATION
      ?auto_100350 - CITY
      ?auto_100351 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100349 ?auto_100350 ) ( IN-CITY ?auto_100345 ?auto_100350 ) ( not ( = ?auto_100345 ?auto_100349 ) ) ( OBJ-AT ?auto_100346 ?auto_100345 ) ( not ( = ?auto_100346 ?auto_100348 ) ) ( OBJ-AT ?auto_100348 ?auto_100349 ) ( TRUCK-AT ?auto_100351 ?auto_100345 ) ( OBJ-AT ?auto_100347 ?auto_100345 ) ( not ( = ?auto_100346 ?auto_100347 ) ) ( not ( = ?auto_100347 ?auto_100348 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100346 ?auto_100348 ?auto_100345 )
      ( DELIVER-3PKG-VERIFY ?auto_100346 ?auto_100347 ?auto_100348 ?auto_100345 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_101768 - OBJ
      ?auto_101769 - OBJ
      ?auto_101770 - OBJ
      ?auto_101767 - LOCATION
    )
    :vars
    (
      ?auto_101771 - TRUCK
      ?auto_101773 - LOCATION
      ?auto_101772 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_101771 ?auto_101773 ) ( IN-CITY ?auto_101773 ?auto_101772 ) ( IN-CITY ?auto_101767 ?auto_101772 ) ( not ( = ?auto_101767 ?auto_101773 ) ) ( OBJ-AT ?auto_101770 ?auto_101767 ) ( not ( = ?auto_101770 ?auto_101769 ) ) ( OBJ-AT ?auto_101769 ?auto_101773 ) ( OBJ-AT ?auto_101768 ?auto_101767 ) ( not ( = ?auto_101768 ?auto_101769 ) ) ( not ( = ?auto_101768 ?auto_101770 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101770 ?auto_101769 ?auto_101767 )
      ( DELIVER-3PKG-VERIFY ?auto_101768 ?auto_101769 ?auto_101770 ?auto_101767 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102472 - OBJ
      ?auto_102473 - OBJ
      ?auto_102474 - OBJ
      ?auto_102471 - LOCATION
    )
    :vars
    (
      ?auto_102476 - LOCATION
      ?auto_102475 - CITY
      ?auto_102477 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_102476 ?auto_102475 ) ( IN-CITY ?auto_102471 ?auto_102475 ) ( not ( = ?auto_102471 ?auto_102476 ) ) ( OBJ-AT ?auto_102474 ?auto_102471 ) ( not ( = ?auto_102474 ?auto_102473 ) ) ( OBJ-AT ?auto_102473 ?auto_102476 ) ( TRUCK-AT ?auto_102477 ?auto_102471 ) ( OBJ-AT ?auto_102472 ?auto_102471 ) ( not ( = ?auto_102472 ?auto_102473 ) ) ( not ( = ?auto_102472 ?auto_102474 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102474 ?auto_102473 ?auto_102471 )
      ( DELIVER-3PKG-VERIFY ?auto_102472 ?auto_102473 ?auto_102474 ?auto_102471 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_115073 - OBJ
      ?auto_115072 - LOCATION
    )
    :vars
    (
      ?auto_115074 - LOCATION
      ?auto_115077 - CITY
      ?auto_115075 - OBJ
      ?auto_115076 - TRUCK
      ?auto_115078 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115074 ?auto_115077 ) ( IN-CITY ?auto_115072 ?auto_115077 ) ( not ( = ?auto_115072 ?auto_115074 ) ) ( OBJ-AT ?auto_115075 ?auto_115072 ) ( not ( = ?auto_115075 ?auto_115073 ) ) ( OBJ-AT ?auto_115073 ?auto_115074 ) ( TRUCK-AT ?auto_115076 ?auto_115078 ) ( IN-CITY ?auto_115078 ?auto_115077 ) ( not ( = ?auto_115072 ?auto_115078 ) ) ( not ( = ?auto_115074 ?auto_115078 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_115076 ?auto_115078 ?auto_115072 ?auto_115077 )
      ( DELIVER-2PKG ?auto_115075 ?auto_115073 ?auto_115072 )
      ( DELIVER-1PKG-VERIFY ?auto_115073 ?auto_115072 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_115080 - OBJ
      ?auto_115081 - OBJ
      ?auto_115079 - LOCATION
    )
    :vars
    (
      ?auto_115083 - LOCATION
      ?auto_115084 - CITY
      ?auto_115082 - TRUCK
      ?auto_115085 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115083 ?auto_115084 ) ( IN-CITY ?auto_115079 ?auto_115084 ) ( not ( = ?auto_115079 ?auto_115083 ) ) ( OBJ-AT ?auto_115080 ?auto_115079 ) ( not ( = ?auto_115080 ?auto_115081 ) ) ( OBJ-AT ?auto_115081 ?auto_115083 ) ( TRUCK-AT ?auto_115082 ?auto_115085 ) ( IN-CITY ?auto_115085 ?auto_115084 ) ( not ( = ?auto_115079 ?auto_115085 ) ) ( not ( = ?auto_115083 ?auto_115085 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_115081 ?auto_115079 )
      ( DELIVER-2PKG-VERIFY ?auto_115080 ?auto_115081 ?auto_115079 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_115098 - OBJ
      ?auto_115099 - OBJ
      ?auto_115097 - LOCATION
    )
    :vars
    (
      ?auto_115102 - LOCATION
      ?auto_115101 - CITY
      ?auto_115103 - TRUCK
      ?auto_115100 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115102 ?auto_115101 ) ( IN-CITY ?auto_115097 ?auto_115101 ) ( not ( = ?auto_115097 ?auto_115102 ) ) ( OBJ-AT ?auto_115099 ?auto_115097 ) ( not ( = ?auto_115099 ?auto_115098 ) ) ( OBJ-AT ?auto_115098 ?auto_115102 ) ( TRUCK-AT ?auto_115103 ?auto_115100 ) ( IN-CITY ?auto_115100 ?auto_115101 ) ( not ( = ?auto_115097 ?auto_115100 ) ) ( not ( = ?auto_115102 ?auto_115100 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115099 ?auto_115098 ?auto_115097 )
      ( DELIVER-2PKG-VERIFY ?auto_115098 ?auto_115099 ?auto_115097 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115124 - OBJ
      ?auto_115125 - OBJ
      ?auto_115126 - OBJ
      ?auto_115123 - LOCATION
    )
    :vars
    (
      ?auto_115129 - LOCATION
      ?auto_115128 - CITY
      ?auto_115130 - TRUCK
      ?auto_115127 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115129 ?auto_115128 ) ( IN-CITY ?auto_115123 ?auto_115128 ) ( not ( = ?auto_115123 ?auto_115129 ) ) ( OBJ-AT ?auto_115125 ?auto_115123 ) ( not ( = ?auto_115125 ?auto_115126 ) ) ( OBJ-AT ?auto_115126 ?auto_115129 ) ( TRUCK-AT ?auto_115130 ?auto_115127 ) ( IN-CITY ?auto_115127 ?auto_115128 ) ( not ( = ?auto_115123 ?auto_115127 ) ) ( not ( = ?auto_115129 ?auto_115127 ) ) ( OBJ-AT ?auto_115124 ?auto_115123 ) ( not ( = ?auto_115124 ?auto_115125 ) ) ( not ( = ?auto_115124 ?auto_115126 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115125 ?auto_115126 ?auto_115123 )
      ( DELIVER-3PKG-VERIFY ?auto_115124 ?auto_115125 ?auto_115126 ?auto_115123 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115144 - OBJ
      ?auto_115145 - OBJ
      ?auto_115146 - OBJ
      ?auto_115143 - LOCATION
    )
    :vars
    (
      ?auto_115149 - LOCATION
      ?auto_115148 - CITY
      ?auto_115150 - TRUCK
      ?auto_115147 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115149 ?auto_115148 ) ( IN-CITY ?auto_115143 ?auto_115148 ) ( not ( = ?auto_115143 ?auto_115149 ) ) ( OBJ-AT ?auto_115144 ?auto_115143 ) ( not ( = ?auto_115144 ?auto_115145 ) ) ( OBJ-AT ?auto_115145 ?auto_115149 ) ( TRUCK-AT ?auto_115150 ?auto_115147 ) ( IN-CITY ?auto_115147 ?auto_115148 ) ( not ( = ?auto_115143 ?auto_115147 ) ) ( not ( = ?auto_115149 ?auto_115147 ) ) ( OBJ-AT ?auto_115146 ?auto_115143 ) ( not ( = ?auto_115144 ?auto_115146 ) ) ( not ( = ?auto_115145 ?auto_115146 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115144 ?auto_115145 ?auto_115143 )
      ( DELIVER-3PKG-VERIFY ?auto_115144 ?auto_115145 ?auto_115146 ?auto_115143 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115176 - OBJ
      ?auto_115177 - OBJ
      ?auto_115178 - OBJ
      ?auto_115175 - LOCATION
    )
    :vars
    (
      ?auto_115181 - LOCATION
      ?auto_115180 - CITY
      ?auto_115183 - OBJ
      ?auto_115182 - TRUCK
      ?auto_115179 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115181 ?auto_115180 ) ( IN-CITY ?auto_115175 ?auto_115180 ) ( not ( = ?auto_115175 ?auto_115181 ) ) ( OBJ-AT ?auto_115183 ?auto_115175 ) ( not ( = ?auto_115183 ?auto_115178 ) ) ( OBJ-AT ?auto_115178 ?auto_115181 ) ( TRUCK-AT ?auto_115182 ?auto_115179 ) ( IN-CITY ?auto_115179 ?auto_115180 ) ( not ( = ?auto_115175 ?auto_115179 ) ) ( not ( = ?auto_115181 ?auto_115179 ) ) ( OBJ-AT ?auto_115176 ?auto_115175 ) ( OBJ-AT ?auto_115177 ?auto_115175 ) ( not ( = ?auto_115176 ?auto_115177 ) ) ( not ( = ?auto_115176 ?auto_115178 ) ) ( not ( = ?auto_115176 ?auto_115183 ) ) ( not ( = ?auto_115177 ?auto_115178 ) ) ( not ( = ?auto_115177 ?auto_115183 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115183 ?auto_115178 ?auto_115175 )
      ( DELIVER-3PKG-VERIFY ?auto_115176 ?auto_115177 ?auto_115178 ?auto_115175 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115198 - OBJ
      ?auto_115199 - OBJ
      ?auto_115200 - OBJ
      ?auto_115197 - LOCATION
    )
    :vars
    (
      ?auto_115203 - LOCATION
      ?auto_115202 - CITY
      ?auto_115205 - OBJ
      ?auto_115204 - TRUCK
      ?auto_115201 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115203 ?auto_115202 ) ( IN-CITY ?auto_115197 ?auto_115202 ) ( not ( = ?auto_115197 ?auto_115203 ) ) ( OBJ-AT ?auto_115205 ?auto_115197 ) ( not ( = ?auto_115205 ?auto_115199 ) ) ( OBJ-AT ?auto_115199 ?auto_115203 ) ( TRUCK-AT ?auto_115204 ?auto_115201 ) ( IN-CITY ?auto_115201 ?auto_115202 ) ( not ( = ?auto_115197 ?auto_115201 ) ) ( not ( = ?auto_115203 ?auto_115201 ) ) ( OBJ-AT ?auto_115198 ?auto_115197 ) ( OBJ-AT ?auto_115200 ?auto_115197 ) ( not ( = ?auto_115198 ?auto_115199 ) ) ( not ( = ?auto_115198 ?auto_115200 ) ) ( not ( = ?auto_115198 ?auto_115205 ) ) ( not ( = ?auto_115199 ?auto_115200 ) ) ( not ( = ?auto_115200 ?auto_115205 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115205 ?auto_115199 ?auto_115197 )
      ( DELIVER-3PKG-VERIFY ?auto_115198 ?auto_115199 ?auto_115200 ?auto_115197 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115286 - OBJ
      ?auto_115287 - OBJ
      ?auto_115288 - OBJ
      ?auto_115285 - LOCATION
    )
    :vars
    (
      ?auto_115291 - LOCATION
      ?auto_115290 - CITY
      ?auto_115292 - TRUCK
      ?auto_115289 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115291 ?auto_115290 ) ( IN-CITY ?auto_115285 ?auto_115290 ) ( not ( = ?auto_115285 ?auto_115291 ) ) ( OBJ-AT ?auto_115288 ?auto_115285 ) ( not ( = ?auto_115288 ?auto_115286 ) ) ( OBJ-AT ?auto_115286 ?auto_115291 ) ( TRUCK-AT ?auto_115292 ?auto_115289 ) ( IN-CITY ?auto_115289 ?auto_115290 ) ( not ( = ?auto_115285 ?auto_115289 ) ) ( not ( = ?auto_115291 ?auto_115289 ) ) ( OBJ-AT ?auto_115287 ?auto_115285 ) ( not ( = ?auto_115286 ?auto_115287 ) ) ( not ( = ?auto_115287 ?auto_115288 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115288 ?auto_115286 ?auto_115285 )
      ( DELIVER-3PKG-VERIFY ?auto_115286 ?auto_115287 ?auto_115288 ?auto_115285 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115318 - OBJ
      ?auto_115319 - OBJ
      ?auto_115320 - OBJ
      ?auto_115317 - LOCATION
    )
    :vars
    (
      ?auto_115323 - LOCATION
      ?auto_115322 - CITY
      ?auto_115325 - OBJ
      ?auto_115324 - TRUCK
      ?auto_115321 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115323 ?auto_115322 ) ( IN-CITY ?auto_115317 ?auto_115322 ) ( not ( = ?auto_115317 ?auto_115323 ) ) ( OBJ-AT ?auto_115325 ?auto_115317 ) ( not ( = ?auto_115325 ?auto_115318 ) ) ( OBJ-AT ?auto_115318 ?auto_115323 ) ( TRUCK-AT ?auto_115324 ?auto_115321 ) ( IN-CITY ?auto_115321 ?auto_115322 ) ( not ( = ?auto_115317 ?auto_115321 ) ) ( not ( = ?auto_115323 ?auto_115321 ) ) ( OBJ-AT ?auto_115319 ?auto_115317 ) ( OBJ-AT ?auto_115320 ?auto_115317 ) ( not ( = ?auto_115318 ?auto_115319 ) ) ( not ( = ?auto_115318 ?auto_115320 ) ) ( not ( = ?auto_115319 ?auto_115320 ) ) ( not ( = ?auto_115319 ?auto_115325 ) ) ( not ( = ?auto_115320 ?auto_115325 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115325 ?auto_115318 ?auto_115317 )
      ( DELIVER-3PKG-VERIFY ?auto_115318 ?auto_115319 ?auto_115320 ?auto_115317 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115415 - OBJ
      ?auto_115416 - OBJ
      ?auto_115418 - OBJ
      ?auto_115417 - OBJ
      ?auto_115414 - LOCATION
    )
    :vars
    (
      ?auto_115421 - LOCATION
      ?auto_115420 - CITY
      ?auto_115422 - TRUCK
      ?auto_115419 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115421 ?auto_115420 ) ( IN-CITY ?auto_115414 ?auto_115420 ) ( not ( = ?auto_115414 ?auto_115421 ) ) ( OBJ-AT ?auto_115415 ?auto_115414 ) ( not ( = ?auto_115415 ?auto_115417 ) ) ( OBJ-AT ?auto_115417 ?auto_115421 ) ( TRUCK-AT ?auto_115422 ?auto_115419 ) ( IN-CITY ?auto_115419 ?auto_115420 ) ( not ( = ?auto_115414 ?auto_115419 ) ) ( not ( = ?auto_115421 ?auto_115419 ) ) ( OBJ-AT ?auto_115416 ?auto_115414 ) ( OBJ-AT ?auto_115418 ?auto_115414 ) ( not ( = ?auto_115415 ?auto_115416 ) ) ( not ( = ?auto_115415 ?auto_115418 ) ) ( not ( = ?auto_115416 ?auto_115418 ) ) ( not ( = ?auto_115416 ?auto_115417 ) ) ( not ( = ?auto_115418 ?auto_115417 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115415 ?auto_115417 ?auto_115414 )
      ( DELIVER-4PKG-VERIFY ?auto_115415 ?auto_115416 ?auto_115418 ?auto_115417 ?auto_115414 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115442 - OBJ
      ?auto_115443 - OBJ
      ?auto_115445 - OBJ
      ?auto_115444 - OBJ
      ?auto_115441 - LOCATION
    )
    :vars
    (
      ?auto_115448 - LOCATION
      ?auto_115447 - CITY
      ?auto_115449 - TRUCK
      ?auto_115446 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115448 ?auto_115447 ) ( IN-CITY ?auto_115441 ?auto_115447 ) ( not ( = ?auto_115441 ?auto_115448 ) ) ( OBJ-AT ?auto_115444 ?auto_115441 ) ( not ( = ?auto_115444 ?auto_115445 ) ) ( OBJ-AT ?auto_115445 ?auto_115448 ) ( TRUCK-AT ?auto_115449 ?auto_115446 ) ( IN-CITY ?auto_115446 ?auto_115447 ) ( not ( = ?auto_115441 ?auto_115446 ) ) ( not ( = ?auto_115448 ?auto_115446 ) ) ( OBJ-AT ?auto_115442 ?auto_115441 ) ( OBJ-AT ?auto_115443 ?auto_115441 ) ( not ( = ?auto_115442 ?auto_115443 ) ) ( not ( = ?auto_115442 ?auto_115445 ) ) ( not ( = ?auto_115442 ?auto_115444 ) ) ( not ( = ?auto_115443 ?auto_115445 ) ) ( not ( = ?auto_115443 ?auto_115444 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115444 ?auto_115445 ?auto_115441 )
      ( DELIVER-4PKG-VERIFY ?auto_115442 ?auto_115443 ?auto_115445 ?auto_115444 ?auto_115441 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115451 - OBJ
      ?auto_115452 - OBJ
      ?auto_115454 - OBJ
      ?auto_115453 - OBJ
      ?auto_115450 - LOCATION
    )
    :vars
    (
      ?auto_115457 - LOCATION
      ?auto_115456 - CITY
      ?auto_115458 - TRUCK
      ?auto_115455 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115457 ?auto_115456 ) ( IN-CITY ?auto_115450 ?auto_115456 ) ( not ( = ?auto_115450 ?auto_115457 ) ) ( OBJ-AT ?auto_115451 ?auto_115450 ) ( not ( = ?auto_115451 ?auto_115454 ) ) ( OBJ-AT ?auto_115454 ?auto_115457 ) ( TRUCK-AT ?auto_115458 ?auto_115455 ) ( IN-CITY ?auto_115455 ?auto_115456 ) ( not ( = ?auto_115450 ?auto_115455 ) ) ( not ( = ?auto_115457 ?auto_115455 ) ) ( OBJ-AT ?auto_115452 ?auto_115450 ) ( OBJ-AT ?auto_115453 ?auto_115450 ) ( not ( = ?auto_115451 ?auto_115452 ) ) ( not ( = ?auto_115451 ?auto_115453 ) ) ( not ( = ?auto_115452 ?auto_115454 ) ) ( not ( = ?auto_115452 ?auto_115453 ) ) ( not ( = ?auto_115454 ?auto_115453 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115451 ?auto_115454 ?auto_115450 )
      ( DELIVER-4PKG-VERIFY ?auto_115451 ?auto_115452 ?auto_115454 ?auto_115453 ?auto_115450 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115478 - OBJ
      ?auto_115479 - OBJ
      ?auto_115481 - OBJ
      ?auto_115480 - OBJ
      ?auto_115477 - LOCATION
    )
    :vars
    (
      ?auto_115484 - LOCATION
      ?auto_115483 - CITY
      ?auto_115485 - TRUCK
      ?auto_115482 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115484 ?auto_115483 ) ( IN-CITY ?auto_115477 ?auto_115483 ) ( not ( = ?auto_115477 ?auto_115484 ) ) ( OBJ-AT ?auto_115481 ?auto_115477 ) ( not ( = ?auto_115481 ?auto_115480 ) ) ( OBJ-AT ?auto_115480 ?auto_115484 ) ( TRUCK-AT ?auto_115485 ?auto_115482 ) ( IN-CITY ?auto_115482 ?auto_115483 ) ( not ( = ?auto_115477 ?auto_115482 ) ) ( not ( = ?auto_115484 ?auto_115482 ) ) ( OBJ-AT ?auto_115478 ?auto_115477 ) ( OBJ-AT ?auto_115479 ?auto_115477 ) ( not ( = ?auto_115478 ?auto_115479 ) ) ( not ( = ?auto_115478 ?auto_115481 ) ) ( not ( = ?auto_115478 ?auto_115480 ) ) ( not ( = ?auto_115479 ?auto_115481 ) ) ( not ( = ?auto_115479 ?auto_115480 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115481 ?auto_115480 ?auto_115477 )
      ( DELIVER-4PKG-VERIFY ?auto_115478 ?auto_115479 ?auto_115481 ?auto_115480 ?auto_115477 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115604 - OBJ
      ?auto_115605 - OBJ
      ?auto_115607 - OBJ
      ?auto_115606 - OBJ
      ?auto_115603 - LOCATION
    )
    :vars
    (
      ?auto_115610 - LOCATION
      ?auto_115609 - CITY
      ?auto_115611 - TRUCK
      ?auto_115608 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115610 ?auto_115609 ) ( IN-CITY ?auto_115603 ?auto_115609 ) ( not ( = ?auto_115603 ?auto_115610 ) ) ( OBJ-AT ?auto_115604 ?auto_115603 ) ( not ( = ?auto_115604 ?auto_115605 ) ) ( OBJ-AT ?auto_115605 ?auto_115610 ) ( TRUCK-AT ?auto_115611 ?auto_115608 ) ( IN-CITY ?auto_115608 ?auto_115609 ) ( not ( = ?auto_115603 ?auto_115608 ) ) ( not ( = ?auto_115610 ?auto_115608 ) ) ( OBJ-AT ?auto_115607 ?auto_115603 ) ( OBJ-AT ?auto_115606 ?auto_115603 ) ( not ( = ?auto_115604 ?auto_115607 ) ) ( not ( = ?auto_115604 ?auto_115606 ) ) ( not ( = ?auto_115605 ?auto_115607 ) ) ( not ( = ?auto_115605 ?auto_115606 ) ) ( not ( = ?auto_115607 ?auto_115606 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115604 ?auto_115605 ?auto_115603 )
      ( DELIVER-4PKG-VERIFY ?auto_115604 ?auto_115605 ?auto_115607 ?auto_115606 ?auto_115603 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115613 - OBJ
      ?auto_115614 - OBJ
      ?auto_115616 - OBJ
      ?auto_115615 - OBJ
      ?auto_115612 - LOCATION
    )
    :vars
    (
      ?auto_115619 - LOCATION
      ?auto_115618 - CITY
      ?auto_115620 - TRUCK
      ?auto_115617 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115619 ?auto_115618 ) ( IN-CITY ?auto_115612 ?auto_115618 ) ( not ( = ?auto_115612 ?auto_115619 ) ) ( OBJ-AT ?auto_115616 ?auto_115612 ) ( not ( = ?auto_115616 ?auto_115614 ) ) ( OBJ-AT ?auto_115614 ?auto_115619 ) ( TRUCK-AT ?auto_115620 ?auto_115617 ) ( IN-CITY ?auto_115617 ?auto_115618 ) ( not ( = ?auto_115612 ?auto_115617 ) ) ( not ( = ?auto_115619 ?auto_115617 ) ) ( OBJ-AT ?auto_115613 ?auto_115612 ) ( OBJ-AT ?auto_115615 ?auto_115612 ) ( not ( = ?auto_115613 ?auto_115614 ) ) ( not ( = ?auto_115613 ?auto_115616 ) ) ( not ( = ?auto_115613 ?auto_115615 ) ) ( not ( = ?auto_115614 ?auto_115615 ) ) ( not ( = ?auto_115616 ?auto_115615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115616 ?auto_115614 ?auto_115612 )
      ( DELIVER-4PKG-VERIFY ?auto_115613 ?auto_115614 ?auto_115616 ?auto_115615 ?auto_115612 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115640 - OBJ
      ?auto_115641 - OBJ
      ?auto_115643 - OBJ
      ?auto_115642 - OBJ
      ?auto_115639 - LOCATION
    )
    :vars
    (
      ?auto_115646 - LOCATION
      ?auto_115645 - CITY
      ?auto_115647 - TRUCK
      ?auto_115644 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115646 ?auto_115645 ) ( IN-CITY ?auto_115639 ?auto_115645 ) ( not ( = ?auto_115639 ?auto_115646 ) ) ( OBJ-AT ?auto_115642 ?auto_115639 ) ( not ( = ?auto_115642 ?auto_115641 ) ) ( OBJ-AT ?auto_115641 ?auto_115646 ) ( TRUCK-AT ?auto_115647 ?auto_115644 ) ( IN-CITY ?auto_115644 ?auto_115645 ) ( not ( = ?auto_115639 ?auto_115644 ) ) ( not ( = ?auto_115646 ?auto_115644 ) ) ( OBJ-AT ?auto_115640 ?auto_115639 ) ( OBJ-AT ?auto_115643 ?auto_115639 ) ( not ( = ?auto_115640 ?auto_115641 ) ) ( not ( = ?auto_115640 ?auto_115643 ) ) ( not ( = ?auto_115640 ?auto_115642 ) ) ( not ( = ?auto_115641 ?auto_115643 ) ) ( not ( = ?auto_115643 ?auto_115642 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115642 ?auto_115641 ?auto_115639 )
      ( DELIVER-4PKG-VERIFY ?auto_115640 ?auto_115641 ?auto_115643 ?auto_115642 ?auto_115639 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115757 - OBJ
      ?auto_115758 - OBJ
      ?auto_115760 - OBJ
      ?auto_115759 - OBJ
      ?auto_115756 - LOCATION
    )
    :vars
    (
      ?auto_115763 - LOCATION
      ?auto_115762 - CITY
      ?auto_115764 - TRUCK
      ?auto_115761 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115763 ?auto_115762 ) ( IN-CITY ?auto_115756 ?auto_115762 ) ( not ( = ?auto_115756 ?auto_115763 ) ) ( OBJ-AT ?auto_115758 ?auto_115756 ) ( not ( = ?auto_115758 ?auto_115759 ) ) ( OBJ-AT ?auto_115759 ?auto_115763 ) ( TRUCK-AT ?auto_115764 ?auto_115761 ) ( IN-CITY ?auto_115761 ?auto_115762 ) ( not ( = ?auto_115756 ?auto_115761 ) ) ( not ( = ?auto_115763 ?auto_115761 ) ) ( OBJ-AT ?auto_115757 ?auto_115756 ) ( OBJ-AT ?auto_115760 ?auto_115756 ) ( not ( = ?auto_115757 ?auto_115758 ) ) ( not ( = ?auto_115757 ?auto_115760 ) ) ( not ( = ?auto_115757 ?auto_115759 ) ) ( not ( = ?auto_115758 ?auto_115760 ) ) ( not ( = ?auto_115760 ?auto_115759 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115758 ?auto_115759 ?auto_115756 )
      ( DELIVER-4PKG-VERIFY ?auto_115757 ?auto_115758 ?auto_115760 ?auto_115759 ?auto_115756 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115784 - OBJ
      ?auto_115785 - OBJ
      ?auto_115787 - OBJ
      ?auto_115786 - OBJ
      ?auto_115783 - LOCATION
    )
    :vars
    (
      ?auto_115790 - LOCATION
      ?auto_115789 - CITY
      ?auto_115791 - TRUCK
      ?auto_115788 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115790 ?auto_115789 ) ( IN-CITY ?auto_115783 ?auto_115789 ) ( not ( = ?auto_115783 ?auto_115790 ) ) ( OBJ-AT ?auto_115785 ?auto_115783 ) ( not ( = ?auto_115785 ?auto_115787 ) ) ( OBJ-AT ?auto_115787 ?auto_115790 ) ( TRUCK-AT ?auto_115791 ?auto_115788 ) ( IN-CITY ?auto_115788 ?auto_115789 ) ( not ( = ?auto_115783 ?auto_115788 ) ) ( not ( = ?auto_115790 ?auto_115788 ) ) ( OBJ-AT ?auto_115784 ?auto_115783 ) ( OBJ-AT ?auto_115786 ?auto_115783 ) ( not ( = ?auto_115784 ?auto_115785 ) ) ( not ( = ?auto_115784 ?auto_115787 ) ) ( not ( = ?auto_115784 ?auto_115786 ) ) ( not ( = ?auto_115785 ?auto_115786 ) ) ( not ( = ?auto_115787 ?auto_115786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115785 ?auto_115787 ?auto_115783 )
      ( DELIVER-4PKG-VERIFY ?auto_115784 ?auto_115785 ?auto_115787 ?auto_115786 ?auto_115783 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115820 - OBJ
      ?auto_115821 - OBJ
      ?auto_115823 - OBJ
      ?auto_115822 - OBJ
      ?auto_115819 - LOCATION
    )
    :vars
    (
      ?auto_115826 - LOCATION
      ?auto_115825 - CITY
      ?auto_115828 - OBJ
      ?auto_115827 - TRUCK
      ?auto_115824 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115826 ?auto_115825 ) ( IN-CITY ?auto_115819 ?auto_115825 ) ( not ( = ?auto_115819 ?auto_115826 ) ) ( OBJ-AT ?auto_115828 ?auto_115819 ) ( not ( = ?auto_115828 ?auto_115822 ) ) ( OBJ-AT ?auto_115822 ?auto_115826 ) ( TRUCK-AT ?auto_115827 ?auto_115824 ) ( IN-CITY ?auto_115824 ?auto_115825 ) ( not ( = ?auto_115819 ?auto_115824 ) ) ( not ( = ?auto_115826 ?auto_115824 ) ) ( OBJ-AT ?auto_115820 ?auto_115819 ) ( OBJ-AT ?auto_115821 ?auto_115819 ) ( OBJ-AT ?auto_115823 ?auto_115819 ) ( not ( = ?auto_115820 ?auto_115821 ) ) ( not ( = ?auto_115820 ?auto_115823 ) ) ( not ( = ?auto_115820 ?auto_115822 ) ) ( not ( = ?auto_115820 ?auto_115828 ) ) ( not ( = ?auto_115821 ?auto_115823 ) ) ( not ( = ?auto_115821 ?auto_115822 ) ) ( not ( = ?auto_115821 ?auto_115828 ) ) ( not ( = ?auto_115823 ?auto_115822 ) ) ( not ( = ?auto_115823 ?auto_115828 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115828 ?auto_115822 ?auto_115819 )
      ( DELIVER-4PKG-VERIFY ?auto_115820 ?auto_115821 ?auto_115823 ?auto_115822 ?auto_115819 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115849 - OBJ
      ?auto_115850 - OBJ
      ?auto_115852 - OBJ
      ?auto_115851 - OBJ
      ?auto_115848 - LOCATION
    )
    :vars
    (
      ?auto_115855 - LOCATION
      ?auto_115854 - CITY
      ?auto_115857 - OBJ
      ?auto_115856 - TRUCK
      ?auto_115853 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115855 ?auto_115854 ) ( IN-CITY ?auto_115848 ?auto_115854 ) ( not ( = ?auto_115848 ?auto_115855 ) ) ( OBJ-AT ?auto_115857 ?auto_115848 ) ( not ( = ?auto_115857 ?auto_115852 ) ) ( OBJ-AT ?auto_115852 ?auto_115855 ) ( TRUCK-AT ?auto_115856 ?auto_115853 ) ( IN-CITY ?auto_115853 ?auto_115854 ) ( not ( = ?auto_115848 ?auto_115853 ) ) ( not ( = ?auto_115855 ?auto_115853 ) ) ( OBJ-AT ?auto_115849 ?auto_115848 ) ( OBJ-AT ?auto_115850 ?auto_115848 ) ( OBJ-AT ?auto_115851 ?auto_115848 ) ( not ( = ?auto_115849 ?auto_115850 ) ) ( not ( = ?auto_115849 ?auto_115852 ) ) ( not ( = ?auto_115849 ?auto_115851 ) ) ( not ( = ?auto_115849 ?auto_115857 ) ) ( not ( = ?auto_115850 ?auto_115852 ) ) ( not ( = ?auto_115850 ?auto_115851 ) ) ( not ( = ?auto_115850 ?auto_115857 ) ) ( not ( = ?auto_115852 ?auto_115851 ) ) ( not ( = ?auto_115851 ?auto_115857 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115857 ?auto_115852 ?auto_115848 )
      ( DELIVER-4PKG-VERIFY ?auto_115849 ?auto_115850 ?auto_115852 ?auto_115851 ?auto_115848 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115992 - OBJ
      ?auto_115993 - OBJ
      ?auto_115995 - OBJ
      ?auto_115994 - OBJ
      ?auto_115991 - LOCATION
    )
    :vars
    (
      ?auto_115998 - LOCATION
      ?auto_115997 - CITY
      ?auto_116000 - OBJ
      ?auto_115999 - TRUCK
      ?auto_115996 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115998 ?auto_115997 ) ( IN-CITY ?auto_115991 ?auto_115997 ) ( not ( = ?auto_115991 ?auto_115998 ) ) ( OBJ-AT ?auto_116000 ?auto_115991 ) ( not ( = ?auto_116000 ?auto_115993 ) ) ( OBJ-AT ?auto_115993 ?auto_115998 ) ( TRUCK-AT ?auto_115999 ?auto_115996 ) ( IN-CITY ?auto_115996 ?auto_115997 ) ( not ( = ?auto_115991 ?auto_115996 ) ) ( not ( = ?auto_115998 ?auto_115996 ) ) ( OBJ-AT ?auto_115992 ?auto_115991 ) ( OBJ-AT ?auto_115995 ?auto_115991 ) ( OBJ-AT ?auto_115994 ?auto_115991 ) ( not ( = ?auto_115992 ?auto_115993 ) ) ( not ( = ?auto_115992 ?auto_115995 ) ) ( not ( = ?auto_115992 ?auto_115994 ) ) ( not ( = ?auto_115992 ?auto_116000 ) ) ( not ( = ?auto_115993 ?auto_115995 ) ) ( not ( = ?auto_115993 ?auto_115994 ) ) ( not ( = ?auto_115995 ?auto_115994 ) ) ( not ( = ?auto_115995 ?auto_116000 ) ) ( not ( = ?auto_115994 ?auto_116000 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116000 ?auto_115993 ?auto_115991 )
      ( DELIVER-4PKG-VERIFY ?auto_115992 ?auto_115993 ?auto_115995 ?auto_115994 ?auto_115991 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116452 - OBJ
      ?auto_116453 - OBJ
      ?auto_116455 - OBJ
      ?auto_116454 - OBJ
      ?auto_116451 - LOCATION
    )
    :vars
    (
      ?auto_116458 - LOCATION
      ?auto_116457 - CITY
      ?auto_116459 - TRUCK
      ?auto_116456 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116458 ?auto_116457 ) ( IN-CITY ?auto_116451 ?auto_116457 ) ( not ( = ?auto_116451 ?auto_116458 ) ) ( OBJ-AT ?auto_116454 ?auto_116451 ) ( not ( = ?auto_116454 ?auto_116452 ) ) ( OBJ-AT ?auto_116452 ?auto_116458 ) ( TRUCK-AT ?auto_116459 ?auto_116456 ) ( IN-CITY ?auto_116456 ?auto_116457 ) ( not ( = ?auto_116451 ?auto_116456 ) ) ( not ( = ?auto_116458 ?auto_116456 ) ) ( OBJ-AT ?auto_116453 ?auto_116451 ) ( OBJ-AT ?auto_116455 ?auto_116451 ) ( not ( = ?auto_116452 ?auto_116453 ) ) ( not ( = ?auto_116452 ?auto_116455 ) ) ( not ( = ?auto_116453 ?auto_116455 ) ) ( not ( = ?auto_116453 ?auto_116454 ) ) ( not ( = ?auto_116455 ?auto_116454 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116454 ?auto_116452 ?auto_116451 )
      ( DELIVER-4PKG-VERIFY ?auto_116452 ?auto_116453 ?auto_116455 ?auto_116454 ?auto_116451 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116461 - OBJ
      ?auto_116462 - OBJ
      ?auto_116464 - OBJ
      ?auto_116463 - OBJ
      ?auto_116460 - LOCATION
    )
    :vars
    (
      ?auto_116467 - LOCATION
      ?auto_116466 - CITY
      ?auto_116468 - TRUCK
      ?auto_116465 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116467 ?auto_116466 ) ( IN-CITY ?auto_116460 ?auto_116466 ) ( not ( = ?auto_116460 ?auto_116467 ) ) ( OBJ-AT ?auto_116464 ?auto_116460 ) ( not ( = ?auto_116464 ?auto_116461 ) ) ( OBJ-AT ?auto_116461 ?auto_116467 ) ( TRUCK-AT ?auto_116468 ?auto_116465 ) ( IN-CITY ?auto_116465 ?auto_116466 ) ( not ( = ?auto_116460 ?auto_116465 ) ) ( not ( = ?auto_116467 ?auto_116465 ) ) ( OBJ-AT ?auto_116462 ?auto_116460 ) ( OBJ-AT ?auto_116463 ?auto_116460 ) ( not ( = ?auto_116461 ?auto_116462 ) ) ( not ( = ?auto_116461 ?auto_116463 ) ) ( not ( = ?auto_116462 ?auto_116464 ) ) ( not ( = ?auto_116462 ?auto_116463 ) ) ( not ( = ?auto_116464 ?auto_116463 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116464 ?auto_116461 ?auto_116460 )
      ( DELIVER-4PKG-VERIFY ?auto_116461 ?auto_116462 ?auto_116464 ?auto_116463 ?auto_116460 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116488 - OBJ
      ?auto_116489 - OBJ
      ?auto_116491 - OBJ
      ?auto_116490 - OBJ
      ?auto_116487 - LOCATION
    )
    :vars
    (
      ?auto_116494 - LOCATION
      ?auto_116493 - CITY
      ?auto_116495 - TRUCK
      ?auto_116492 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116494 ?auto_116493 ) ( IN-CITY ?auto_116487 ?auto_116493 ) ( not ( = ?auto_116487 ?auto_116494 ) ) ( OBJ-AT ?auto_116489 ?auto_116487 ) ( not ( = ?auto_116489 ?auto_116488 ) ) ( OBJ-AT ?auto_116488 ?auto_116494 ) ( TRUCK-AT ?auto_116495 ?auto_116492 ) ( IN-CITY ?auto_116492 ?auto_116493 ) ( not ( = ?auto_116487 ?auto_116492 ) ) ( not ( = ?auto_116494 ?auto_116492 ) ) ( OBJ-AT ?auto_116491 ?auto_116487 ) ( OBJ-AT ?auto_116490 ?auto_116487 ) ( not ( = ?auto_116488 ?auto_116491 ) ) ( not ( = ?auto_116488 ?auto_116490 ) ) ( not ( = ?auto_116489 ?auto_116491 ) ) ( not ( = ?auto_116489 ?auto_116490 ) ) ( not ( = ?auto_116491 ?auto_116490 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116489 ?auto_116488 ?auto_116487 )
      ( DELIVER-4PKG-VERIFY ?auto_116488 ?auto_116489 ?auto_116491 ?auto_116490 ?auto_116487 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116641 - OBJ
      ?auto_116642 - OBJ
      ?auto_116644 - OBJ
      ?auto_116643 - OBJ
      ?auto_116640 - LOCATION
    )
    :vars
    (
      ?auto_116647 - LOCATION
      ?auto_116646 - CITY
      ?auto_116649 - OBJ
      ?auto_116648 - TRUCK
      ?auto_116645 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116647 ?auto_116646 ) ( IN-CITY ?auto_116640 ?auto_116646 ) ( not ( = ?auto_116640 ?auto_116647 ) ) ( OBJ-AT ?auto_116649 ?auto_116640 ) ( not ( = ?auto_116649 ?auto_116641 ) ) ( OBJ-AT ?auto_116641 ?auto_116647 ) ( TRUCK-AT ?auto_116648 ?auto_116645 ) ( IN-CITY ?auto_116645 ?auto_116646 ) ( not ( = ?auto_116640 ?auto_116645 ) ) ( not ( = ?auto_116647 ?auto_116645 ) ) ( OBJ-AT ?auto_116642 ?auto_116640 ) ( OBJ-AT ?auto_116644 ?auto_116640 ) ( OBJ-AT ?auto_116643 ?auto_116640 ) ( not ( = ?auto_116641 ?auto_116642 ) ) ( not ( = ?auto_116641 ?auto_116644 ) ) ( not ( = ?auto_116641 ?auto_116643 ) ) ( not ( = ?auto_116642 ?auto_116644 ) ) ( not ( = ?auto_116642 ?auto_116643 ) ) ( not ( = ?auto_116642 ?auto_116649 ) ) ( not ( = ?auto_116644 ?auto_116643 ) ) ( not ( = ?auto_116644 ?auto_116649 ) ) ( not ( = ?auto_116643 ?auto_116649 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116649 ?auto_116641 ?auto_116640 )
      ( DELIVER-4PKG-VERIFY ?auto_116641 ?auto_116642 ?auto_116644 ?auto_116643 ?auto_116640 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_117093 - OBJ
      ?auto_117094 - OBJ
      ?auto_117095 - OBJ
      ?auto_117092 - LOCATION
    )
    :vars
    (
      ?auto_117097 - LOCATION
      ?auto_117099 - CITY
      ?auto_117096 - TRUCK
      ?auto_117098 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_117097 ?auto_117099 ) ( IN-CITY ?auto_117092 ?auto_117099 ) ( not ( = ?auto_117092 ?auto_117097 ) ) ( OBJ-AT ?auto_117093 ?auto_117092 ) ( not ( = ?auto_117093 ?auto_117095 ) ) ( OBJ-AT ?auto_117095 ?auto_117097 ) ( TRUCK-AT ?auto_117096 ?auto_117098 ) ( IN-CITY ?auto_117098 ?auto_117099 ) ( not ( = ?auto_117092 ?auto_117098 ) ) ( not ( = ?auto_117097 ?auto_117098 ) ) ( OBJ-AT ?auto_117094 ?auto_117092 ) ( not ( = ?auto_117093 ?auto_117094 ) ) ( not ( = ?auto_117094 ?auto_117095 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_117093 ?auto_117095 ?auto_117092 )
      ( DELIVER-3PKG-VERIFY ?auto_117093 ?auto_117094 ?auto_117095 ?auto_117092 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_117113 - OBJ
      ?auto_117114 - OBJ
      ?auto_117115 - OBJ
      ?auto_117112 - LOCATION
    )
    :vars
    (
      ?auto_117117 - LOCATION
      ?auto_117119 - CITY
      ?auto_117116 - TRUCK
      ?auto_117118 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_117117 ?auto_117119 ) ( IN-CITY ?auto_117112 ?auto_117119 ) ( not ( = ?auto_117112 ?auto_117117 ) ) ( OBJ-AT ?auto_117115 ?auto_117112 ) ( not ( = ?auto_117115 ?auto_117114 ) ) ( OBJ-AT ?auto_117114 ?auto_117117 ) ( TRUCK-AT ?auto_117116 ?auto_117118 ) ( IN-CITY ?auto_117118 ?auto_117119 ) ( not ( = ?auto_117112 ?auto_117118 ) ) ( not ( = ?auto_117117 ?auto_117118 ) ) ( OBJ-AT ?auto_117113 ?auto_117112 ) ( not ( = ?auto_117113 ?auto_117114 ) ) ( not ( = ?auto_117113 ?auto_117115 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_117115 ?auto_117114 ?auto_117112 )
      ( DELIVER-3PKG-VERIFY ?auto_117113 ?auto_117114 ?auto_117115 ?auto_117112 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_117255 - OBJ
      ?auto_117256 - OBJ
      ?auto_117257 - OBJ
      ?auto_117254 - LOCATION
    )
    :vars
    (
      ?auto_117259 - LOCATION
      ?auto_117261 - CITY
      ?auto_117258 - TRUCK
      ?auto_117260 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_117259 ?auto_117261 ) ( IN-CITY ?auto_117254 ?auto_117261 ) ( not ( = ?auto_117254 ?auto_117259 ) ) ( OBJ-AT ?auto_117256 ?auto_117254 ) ( not ( = ?auto_117256 ?auto_117255 ) ) ( OBJ-AT ?auto_117255 ?auto_117259 ) ( TRUCK-AT ?auto_117258 ?auto_117260 ) ( IN-CITY ?auto_117260 ?auto_117261 ) ( not ( = ?auto_117254 ?auto_117260 ) ) ( not ( = ?auto_117259 ?auto_117260 ) ) ( OBJ-AT ?auto_117257 ?auto_117254 ) ( not ( = ?auto_117255 ?auto_117257 ) ) ( not ( = ?auto_117256 ?auto_117257 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_117256 ?auto_117255 ?auto_117254 )
      ( DELIVER-3PKG-VERIFY ?auto_117255 ?auto_117256 ?auto_117257 ?auto_117254 ) )
  )

)

