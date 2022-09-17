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
      ?auto_782 - OBJ
      ?auto_783 - LOCATION
    )
    :vars
    (
      ?auto_792 - LOCATION
      ?auto_789 - CITY
      ?auto_784 - TRUCK
      ?auto_795 - LOCATION
      ?auto_796 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_792 ?auto_789 ) ( IN-CITY ?auto_783 ?auto_789 ) ( not ( = ?auto_783 ?auto_792 ) ) ( OBJ-AT ?auto_782 ?auto_792 ) ( TRUCK-AT ?auto_784 ?auto_795 ) ( IN-CITY ?auto_795 ?auto_796 ) ( IN-CITY ?auto_792 ?auto_796 ) ( not ( = ?auto_792 ?auto_795 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_784 ?auto_795 ?auto_792 ?auto_796 )
      ( !LOAD-TRUCK ?auto_782 ?auto_784 ?auto_792 )
      ( !DRIVE-TRUCK ?auto_784 ?auto_792 ?auto_783 ?auto_789 )
      ( !UNLOAD-TRUCK ?auto_782 ?auto_784 ?auto_783 )
      ( DELIVER-1PKG-VERIFY ?auto_782 ?auto_783 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_819 - OBJ
      ?auto_821 - OBJ
      ?auto_827 - LOCATION
    )
    :vars
    (
      ?auto_825 - LOCATION
      ?auto_826 - CITY
      ?auto_824 - CITY
      ?auto_830 - LOCATION
      ?auto_833 - CITY
      ?auto_823 - TRUCK
      ?auto_829 - LOCATION
      ?auto_832 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_821 ?auto_819 ) ( IN-CITY ?auto_825 ?auto_826 ) ( IN-CITY ?auto_827 ?auto_826 ) ( not ( = ?auto_827 ?auto_825 ) ) ( OBJ-AT ?auto_821 ?auto_825 ) ( IN-CITY ?auto_827 ?auto_824 ) ( IN-CITY ?auto_825 ?auto_824 ) ( IN-CITY ?auto_830 ?auto_833 ) ( IN-CITY ?auto_827 ?auto_833 ) ( not ( = ?auto_827 ?auto_830 ) ) ( OBJ-AT ?auto_819 ?auto_830 ) ( TRUCK-AT ?auto_823 ?auto_829 ) ( IN-CITY ?auto_829 ?auto_832 ) ( IN-CITY ?auto_830 ?auto_832 ) ( not ( = ?auto_830 ?auto_829 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_819 ?auto_827 )
      ( DELIVER-1PKG ?auto_821 ?auto_827 )
      ( DELIVER-2PKG-VERIFY ?auto_819 ?auto_821 ?auto_827 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_858 - OBJ
      ?auto_860 - OBJ
      ?auto_861 - OBJ
      ?auto_866 - LOCATION
    )
    :vars
    (
      ?auto_868 - LOCATION
      ?auto_862 - CITY
      ?auto_864 - CITY
      ?auto_870 - LOCATION
      ?auto_879 - CITY
      ?auto_871 - CITY
      ?auto_874 - LOCATION
      ?auto_875 - CITY
      ?auto_867 - TRUCK
      ?auto_876 - LOCATION
      ?auto_877 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_860 ?auto_858 ) ( GREATER-THAN ?auto_861 ?auto_858 ) ( GREATER-THAN ?auto_861 ?auto_860 ) ( IN-CITY ?auto_868 ?auto_862 ) ( IN-CITY ?auto_866 ?auto_862 ) ( not ( = ?auto_866 ?auto_868 ) ) ( OBJ-AT ?auto_861 ?auto_868 ) ( IN-CITY ?auto_866 ?auto_864 ) ( IN-CITY ?auto_868 ?auto_864 ) ( IN-CITY ?auto_870 ?auto_879 ) ( IN-CITY ?auto_866 ?auto_879 ) ( not ( = ?auto_866 ?auto_870 ) ) ( OBJ-AT ?auto_860 ?auto_870 ) ( IN-CITY ?auto_866 ?auto_871 ) ( IN-CITY ?auto_870 ?auto_871 ) ( IN-CITY ?auto_874 ?auto_875 ) ( IN-CITY ?auto_866 ?auto_875 ) ( not ( = ?auto_866 ?auto_874 ) ) ( OBJ-AT ?auto_858 ?auto_874 ) ( TRUCK-AT ?auto_867 ?auto_876 ) ( IN-CITY ?auto_876 ?auto_877 ) ( IN-CITY ?auto_874 ?auto_877 ) ( not ( = ?auto_874 ?auto_876 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_858 ?auto_860 ?auto_866 )
      ( DELIVER-1PKG ?auto_861 ?auto_866 )
      ( DELIVER-3PKG-VERIFY ?auto_858 ?auto_860 ?auto_861 ?auto_866 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_903 - OBJ
      ?auto_905 - OBJ
      ?auto_906 - OBJ
      ?auto_907 - OBJ
      ?auto_912 - LOCATION
    )
    :vars
    (
      ?auto_910 - LOCATION
      ?auto_913 - CITY
      ?auto_908 - CITY
      ?auto_915 - LOCATION
      ?auto_928 - CITY
      ?auto_918 - CITY
      ?auto_924 - LOCATION
      ?auto_919 - CITY
      ?auto_923 - CITY
      ?auto_926 - LOCATION
      ?auto_925 - CITY
      ?auto_914 - TRUCK
      ?auto_927 - LOCATION
      ?auto_921 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_905 ?auto_903 ) ( GREATER-THAN ?auto_906 ?auto_903 ) ( GREATER-THAN ?auto_906 ?auto_905 ) ( GREATER-THAN ?auto_907 ?auto_903 ) ( GREATER-THAN ?auto_907 ?auto_905 ) ( GREATER-THAN ?auto_907 ?auto_906 ) ( IN-CITY ?auto_910 ?auto_913 ) ( IN-CITY ?auto_912 ?auto_913 ) ( not ( = ?auto_912 ?auto_910 ) ) ( OBJ-AT ?auto_907 ?auto_910 ) ( IN-CITY ?auto_912 ?auto_908 ) ( IN-CITY ?auto_910 ?auto_908 ) ( IN-CITY ?auto_915 ?auto_928 ) ( IN-CITY ?auto_912 ?auto_928 ) ( not ( = ?auto_912 ?auto_915 ) ) ( OBJ-AT ?auto_906 ?auto_915 ) ( IN-CITY ?auto_912 ?auto_918 ) ( IN-CITY ?auto_915 ?auto_918 ) ( IN-CITY ?auto_924 ?auto_919 ) ( IN-CITY ?auto_912 ?auto_919 ) ( not ( = ?auto_912 ?auto_924 ) ) ( OBJ-AT ?auto_905 ?auto_924 ) ( IN-CITY ?auto_912 ?auto_923 ) ( IN-CITY ?auto_924 ?auto_923 ) ( IN-CITY ?auto_926 ?auto_925 ) ( IN-CITY ?auto_912 ?auto_925 ) ( not ( = ?auto_912 ?auto_926 ) ) ( OBJ-AT ?auto_903 ?auto_926 ) ( TRUCK-AT ?auto_914 ?auto_927 ) ( IN-CITY ?auto_927 ?auto_921 ) ( IN-CITY ?auto_926 ?auto_921 ) ( not ( = ?auto_926 ?auto_927 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_903 ?auto_905 ?auto_906 ?auto_912 )
      ( DELIVER-1PKG ?auto_907 ?auto_912 )
      ( DELIVER-4PKG-VERIFY ?auto_903 ?auto_905 ?auto_906 ?auto_907 ?auto_912 ) )
  )

)

