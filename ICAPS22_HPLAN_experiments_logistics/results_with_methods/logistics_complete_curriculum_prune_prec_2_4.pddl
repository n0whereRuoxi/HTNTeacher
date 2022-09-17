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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_830 - OBJ
      ?auto_831 - LOCATION
    )
    :vars
    (
      ?auto_832 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_832 ?auto_831 ) ( IN-TRUCK ?auto_830 ?auto_832 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_830 ?auto_832 ?auto_831 )
      ( DELIVER-1PKG-VERIFY ?auto_830 ?auto_831 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_837 - OBJ
      ?auto_838 - LOCATION
    )
    :vars
    (
      ?auto_840 - TRUCK
      ?auto_843 - LOCATION
      ?auto_844 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_837 ?auto_840 ) ( TRUCK-AT ?auto_840 ?auto_843 ) ( IN-CITY ?auto_843 ?auto_844 ) ( IN-CITY ?auto_838 ?auto_844 ) ( not ( = ?auto_838 ?auto_843 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_840 ?auto_843 ?auto_838 ?auto_844 )
      ( DELIVER-1PKG ?auto_837 ?auto_838 )
      ( DELIVER-1PKG-VERIFY ?auto_837 ?auto_838 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_848 - OBJ
      ?auto_849 - LOCATION
    )
    :vars
    (
      ?auto_850 - TRUCK
      ?auto_852 - LOCATION
      ?auto_851 - CITY
      ?auto_856 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_850 ?auto_852 ) ( IN-CITY ?auto_852 ?auto_851 ) ( IN-CITY ?auto_849 ?auto_851 ) ( not ( = ?auto_849 ?auto_852 ) ) ( TRUCK-AT ?auto_850 ?auto_856 ) ( OBJ-AT ?auto_848 ?auto_856 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_848 ?auto_850 ?auto_856 )
      ( DELIVER-1PKG ?auto_848 ?auto_849 )
      ( DELIVER-1PKG-VERIFY ?auto_848 ?auto_849 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_860 - OBJ
      ?auto_861 - LOCATION
    )
    :vars
    (
      ?auto_867 - LOCATION
      ?auto_862 - CITY
      ?auto_863 - TRUCK
      ?auto_869 - LOCATION
      ?auto_870 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_867 ?auto_862 ) ( IN-CITY ?auto_861 ?auto_862 ) ( not ( = ?auto_861 ?auto_867 ) ) ( OBJ-AT ?auto_860 ?auto_867 ) ( TRUCK-AT ?auto_863 ?auto_869 ) ( IN-CITY ?auto_869 ?auto_870 ) ( IN-CITY ?auto_867 ?auto_870 ) ( not ( = ?auto_867 ?auto_869 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_863 ?auto_869 ?auto_867 ?auto_870 )
      ( DELIVER-1PKG ?auto_860 ?auto_861 )
      ( DELIVER-1PKG-VERIFY ?auto_860 ?auto_861 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_919 - OBJ
      ?auto_921 - OBJ
      ?auto_920 - LOCATION
    )
    :vars
    (
      ?auto_922 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_921 ?auto_919 ) ( TRUCK-AT ?auto_922 ?auto_920 ) ( IN-TRUCK ?auto_921 ?auto_922 ) ( OBJ-AT ?auto_919 ?auto_920 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_921 ?auto_920 )
      ( DELIVER-2PKG-VERIFY ?auto_919 ?auto_921 ?auto_920 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_928 - OBJ
      ?auto_930 - OBJ
      ?auto_929 - LOCATION
    )
    :vars
    (
      ?auto_935 - TRUCK
      ?auto_933 - LOCATION
      ?auto_934 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_930 ?auto_928 ) ( IN-TRUCK ?auto_930 ?auto_935 ) ( TRUCK-AT ?auto_935 ?auto_933 ) ( IN-CITY ?auto_933 ?auto_934 ) ( IN-CITY ?auto_929 ?auto_934 ) ( not ( = ?auto_929 ?auto_933 ) ) ( OBJ-AT ?auto_928 ?auto_929 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_930 ?auto_929 )
      ( DELIVER-2PKG-VERIFY ?auto_928 ?auto_930 ?auto_929 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_939 - OBJ
      ?auto_941 - OBJ
      ?auto_940 - LOCATION
    )
    :vars
    (
      ?auto_944 - TRUCK
      ?auto_942 - LOCATION
      ?auto_945 - CITY
      ?auto_947 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_941 ?auto_939 ) ( TRUCK-AT ?auto_944 ?auto_942 ) ( IN-CITY ?auto_942 ?auto_945 ) ( IN-CITY ?auto_940 ?auto_945 ) ( not ( = ?auto_940 ?auto_942 ) ) ( TRUCK-AT ?auto_944 ?auto_947 ) ( OBJ-AT ?auto_941 ?auto_947 ) ( OBJ-AT ?auto_939 ?auto_940 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_941 ?auto_940 )
      ( DELIVER-2PKG-VERIFY ?auto_939 ?auto_941 ?auto_940 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_951 - OBJ
      ?auto_953 - OBJ
      ?auto_952 - LOCATION
    )
    :vars
    (
      ?auto_954 - LOCATION
      ?auto_956 - CITY
      ?auto_959 - TRUCK
      ?auto_960 - LOCATION
      ?auto_958 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_953 ?auto_951 ) ( IN-CITY ?auto_954 ?auto_956 ) ( IN-CITY ?auto_952 ?auto_956 ) ( not ( = ?auto_952 ?auto_954 ) ) ( OBJ-AT ?auto_953 ?auto_954 ) ( TRUCK-AT ?auto_959 ?auto_960 ) ( IN-CITY ?auto_960 ?auto_958 ) ( IN-CITY ?auto_954 ?auto_958 ) ( not ( = ?auto_954 ?auto_960 ) ) ( OBJ-AT ?auto_951 ?auto_952 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_953 ?auto_952 )
      ( DELIVER-2PKG-VERIFY ?auto_951 ?auto_953 ?auto_952 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_969 - OBJ
      ?auto_966 - OBJ
      ?auto_965 - LOCATION
    )
    :vars
    (
      ?auto_973 - LOCATION
      ?auto_972 - CITY
      ?auto_967 - TRUCK
      ?auto_974 - LOCATION
      ?auto_971 - CITY
      ?auto_976 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_966 ?auto_969 ) ( IN-CITY ?auto_973 ?auto_972 ) ( IN-CITY ?auto_965 ?auto_972 ) ( not ( = ?auto_965 ?auto_973 ) ) ( OBJ-AT ?auto_966 ?auto_973 ) ( TRUCK-AT ?auto_967 ?auto_974 ) ( IN-CITY ?auto_974 ?auto_971 ) ( IN-CITY ?auto_973 ?auto_971 ) ( not ( = ?auto_973 ?auto_974 ) ) ( TRUCK-AT ?auto_976 ?auto_965 ) ( IN-TRUCK ?auto_969 ?auto_976 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_969 ?auto_965 )
      ( DELIVER-2PKG ?auto_969 ?auto_966 ?auto_965 )
      ( DELIVER-2PKG-VERIFY ?auto_969 ?auto_966 ?auto_965 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_981 - OBJ
      ?auto_983 - OBJ
      ?auto_982 - LOCATION
    )
    :vars
    (
      ?auto_990 - LOCATION
      ?auto_987 - CITY
      ?auto_986 - CITY
      ?auto_991 - TRUCK
      ?auto_994 - LOCATION
      ?auto_995 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_983 ?auto_981 ) ( IN-CITY ?auto_990 ?auto_987 ) ( IN-CITY ?auto_982 ?auto_987 ) ( not ( = ?auto_982 ?auto_990 ) ) ( OBJ-AT ?auto_983 ?auto_990 ) ( IN-CITY ?auto_982 ?auto_986 ) ( IN-CITY ?auto_990 ?auto_986 ) ( IN-TRUCK ?auto_981 ?auto_991 ) ( TRUCK-AT ?auto_991 ?auto_994 ) ( IN-CITY ?auto_994 ?auto_995 ) ( IN-CITY ?auto_982 ?auto_995 ) ( not ( = ?auto_982 ?auto_994 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_991 ?auto_994 ?auto_982 ?auto_995 )
      ( DELIVER-2PKG ?auto_981 ?auto_983 ?auto_982 )
      ( DELIVER-2PKG-VERIFY ?auto_981 ?auto_983 ?auto_982 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1000 - OBJ
      ?auto_1002 - OBJ
      ?auto_1001 - LOCATION
    )
    :vars
    (
      ?auto_1007 - LOCATION
      ?auto_1003 - CITY
      ?auto_1006 - CITY
      ?auto_1009 - TRUCK
      ?auto_1010 - LOCATION
      ?auto_1008 - CITY
      ?auto_1013 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1002 ?auto_1000 ) ( IN-CITY ?auto_1007 ?auto_1003 ) ( IN-CITY ?auto_1001 ?auto_1003 ) ( not ( = ?auto_1001 ?auto_1007 ) ) ( OBJ-AT ?auto_1002 ?auto_1007 ) ( IN-CITY ?auto_1001 ?auto_1006 ) ( IN-CITY ?auto_1007 ?auto_1006 ) ( TRUCK-AT ?auto_1009 ?auto_1010 ) ( IN-CITY ?auto_1010 ?auto_1008 ) ( IN-CITY ?auto_1001 ?auto_1008 ) ( not ( = ?auto_1001 ?auto_1010 ) ) ( TRUCK-AT ?auto_1009 ?auto_1013 ) ( OBJ-AT ?auto_1000 ?auto_1013 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1000 ?auto_1009 ?auto_1013 )
      ( DELIVER-2PKG ?auto_1000 ?auto_1002 ?auto_1001 )
      ( DELIVER-2PKG-VERIFY ?auto_1000 ?auto_1002 ?auto_1001 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1018 - OBJ
      ?auto_1020 - OBJ
      ?auto_1019 - LOCATION
    )
    :vars
    (
      ?auto_1025 - LOCATION
      ?auto_1023 - CITY
      ?auto_1029 - CITY
      ?auto_1024 - LOCATION
      ?auto_1030 - CITY
      ?auto_1028 - TRUCK
      ?auto_1032 - LOCATION
      ?auto_1033 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1020 ?auto_1018 ) ( IN-CITY ?auto_1025 ?auto_1023 ) ( IN-CITY ?auto_1019 ?auto_1023 ) ( not ( = ?auto_1019 ?auto_1025 ) ) ( OBJ-AT ?auto_1020 ?auto_1025 ) ( IN-CITY ?auto_1019 ?auto_1029 ) ( IN-CITY ?auto_1025 ?auto_1029 ) ( IN-CITY ?auto_1024 ?auto_1030 ) ( IN-CITY ?auto_1019 ?auto_1030 ) ( not ( = ?auto_1019 ?auto_1024 ) ) ( OBJ-AT ?auto_1018 ?auto_1024 ) ( TRUCK-AT ?auto_1028 ?auto_1032 ) ( IN-CITY ?auto_1032 ?auto_1033 ) ( IN-CITY ?auto_1024 ?auto_1033 ) ( not ( = ?auto_1024 ?auto_1032 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1028 ?auto_1032 ?auto_1024 ?auto_1033 )
      ( DELIVER-2PKG ?auto_1018 ?auto_1020 ?auto_1019 )
      ( DELIVER-2PKG-VERIFY ?auto_1018 ?auto_1020 ?auto_1019 ) )
  )

)

