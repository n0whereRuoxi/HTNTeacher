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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_829 - OBJ
      ?auto_828 - LOCATION
    )
    :vars
    (
      ?auto_831 - LOCATION
      ?auto_832 - CITY
      ?auto_830 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_831 ?auto_832 ) ( IN-CITY ?auto_828 ?auto_832 ) ( not ( = ?auto_828 ?auto_831 ) ) ( OBJ-AT ?auto_829 ?auto_831 ) ( TRUCK-AT ?auto_830 ?auto_828 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_830 ?auto_828 ?auto_831 ?auto_832 )
      ( !LOAD-TRUCK ?auto_829 ?auto_830 ?auto_831 )
      ( !DRIVE-TRUCK ?auto_830 ?auto_831 ?auto_828 ?auto_832 )
      ( !UNLOAD-TRUCK ?auto_829 ?auto_830 ?auto_828 )
      ( DELIVER-1PKG-VERIFY ?auto_829 ?auto_828 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_836 - OBJ
      ?auto_835 - LOCATION
    )
    :vars
    (
      ?auto_838 - LOCATION
      ?auto_839 - CITY
      ?auto_837 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_838 ?auto_839 ) ( IN-CITY ?auto_835 ?auto_839 ) ( not ( = ?auto_835 ?auto_838 ) ) ( OBJ-AT ?auto_836 ?auto_838 ) ( TRUCK-AT ?auto_837 ?auto_835 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_837 ?auto_835 ?auto_838 ?auto_839 )
      ( !LOAD-TRUCK ?auto_836 ?auto_837 ?auto_838 )
      ( !DRIVE-TRUCK ?auto_837 ?auto_838 ?auto_835 ?auto_839 )
      ( !UNLOAD-TRUCK ?auto_836 ?auto_837 ?auto_835 )
      ( DELIVER-1PKG-VERIFY ?auto_836 ?auto_835 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_850 - OBJ
      ?auto_851 - OBJ
      ?auto_849 - LOCATION
    )
    :vars
    (
      ?auto_852 - LOCATION
      ?auto_853 - CITY
      ?auto_855 - LOCATION
      ?auto_854 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_852 ?auto_853 ) ( IN-CITY ?auto_849 ?auto_853 ) ( not ( = ?auto_849 ?auto_852 ) ) ( OBJ-AT ?auto_851 ?auto_852 ) ( IN-CITY ?auto_855 ?auto_853 ) ( not ( = ?auto_849 ?auto_855 ) ) ( OBJ-AT ?auto_850 ?auto_855 ) ( TRUCK-AT ?auto_854 ?auto_849 ) ( not ( = ?auto_850 ?auto_851 ) ) ( not ( = ?auto_852 ?auto_855 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_850 ?auto_849 )
      ( DELIVER-1PKG ?auto_851 ?auto_849 )
      ( DELIVER-2PKG-VERIFY ?auto_850 ?auto_851 ?auto_849 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_857 - OBJ
      ?auto_858 - OBJ
      ?auto_856 - LOCATION
    )
    :vars
    (
      ?auto_862 - LOCATION
      ?auto_860 - CITY
      ?auto_859 - LOCATION
      ?auto_861 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_862 ?auto_860 ) ( IN-CITY ?auto_856 ?auto_860 ) ( not ( = ?auto_856 ?auto_862 ) ) ( OBJ-AT ?auto_857 ?auto_862 ) ( IN-CITY ?auto_859 ?auto_860 ) ( not ( = ?auto_856 ?auto_859 ) ) ( OBJ-AT ?auto_858 ?auto_859 ) ( TRUCK-AT ?auto_861 ?auto_856 ) ( not ( = ?auto_858 ?auto_857 ) ) ( not ( = ?auto_862 ?auto_859 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_858 ?auto_857 ?auto_856 )
      ( DELIVER-2PKG-VERIFY ?auto_857 ?auto_858 ?auto_856 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_874 - OBJ
      ?auto_873 - LOCATION
    )
    :vars
    (
      ?auto_876 - LOCATION
      ?auto_877 - CITY
      ?auto_875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_876 ?auto_877 ) ( IN-CITY ?auto_873 ?auto_877 ) ( not ( = ?auto_873 ?auto_876 ) ) ( OBJ-AT ?auto_874 ?auto_876 ) ( TRUCK-AT ?auto_875 ?auto_873 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_875 ?auto_873 ?auto_876 ?auto_877 )
      ( !LOAD-TRUCK ?auto_874 ?auto_875 ?auto_876 )
      ( !DRIVE-TRUCK ?auto_875 ?auto_876 ?auto_873 ?auto_877 )
      ( !UNLOAD-TRUCK ?auto_874 ?auto_875 ?auto_873 )
      ( DELIVER-1PKG-VERIFY ?auto_874 ?auto_873 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_965 - OBJ
      ?auto_966 - OBJ
      ?auto_967 - OBJ
      ?auto_964 - LOCATION
    )
    :vars
    (
      ?auto_970 - LOCATION
      ?auto_969 - CITY
      ?auto_971 - LOCATION
      ?auto_972 - LOCATION
      ?auto_968 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_970 ?auto_969 ) ( IN-CITY ?auto_964 ?auto_969 ) ( not ( = ?auto_964 ?auto_970 ) ) ( OBJ-AT ?auto_967 ?auto_970 ) ( IN-CITY ?auto_971 ?auto_969 ) ( not ( = ?auto_964 ?auto_971 ) ) ( OBJ-AT ?auto_966 ?auto_971 ) ( IN-CITY ?auto_972 ?auto_969 ) ( not ( = ?auto_964 ?auto_972 ) ) ( OBJ-AT ?auto_965 ?auto_972 ) ( TRUCK-AT ?auto_968 ?auto_964 ) ( not ( = ?auto_965 ?auto_966 ) ) ( not ( = ?auto_971 ?auto_972 ) ) ( not ( = ?auto_965 ?auto_967 ) ) ( not ( = ?auto_966 ?auto_967 ) ) ( not ( = ?auto_970 ?auto_971 ) ) ( not ( = ?auto_970 ?auto_972 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_966 ?auto_965 ?auto_964 )
      ( DELIVER-1PKG ?auto_967 ?auto_964 )
      ( DELIVER-3PKG-VERIFY ?auto_965 ?auto_966 ?auto_967 ?auto_964 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_984 - OBJ
      ?auto_985 - OBJ
      ?auto_986 - OBJ
      ?auto_983 - LOCATION
    )
    :vars
    (
      ?auto_987 - LOCATION
      ?auto_991 - CITY
      ?auto_989 - LOCATION
      ?auto_988 - LOCATION
      ?auto_990 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_987 ?auto_991 ) ( IN-CITY ?auto_983 ?auto_991 ) ( not ( = ?auto_983 ?auto_987 ) ) ( OBJ-AT ?auto_985 ?auto_987 ) ( IN-CITY ?auto_989 ?auto_991 ) ( not ( = ?auto_983 ?auto_989 ) ) ( OBJ-AT ?auto_986 ?auto_989 ) ( IN-CITY ?auto_988 ?auto_991 ) ( not ( = ?auto_983 ?auto_988 ) ) ( OBJ-AT ?auto_984 ?auto_988 ) ( TRUCK-AT ?auto_990 ?auto_983 ) ( not ( = ?auto_984 ?auto_986 ) ) ( not ( = ?auto_989 ?auto_988 ) ) ( not ( = ?auto_984 ?auto_985 ) ) ( not ( = ?auto_986 ?auto_985 ) ) ( not ( = ?auto_987 ?auto_989 ) ) ( not ( = ?auto_987 ?auto_988 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_984 ?auto_986 ?auto_985 ?auto_983 )
      ( DELIVER-3PKG-VERIFY ?auto_984 ?auto_985 ?auto_986 ?auto_983 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1003 - OBJ
      ?auto_1004 - OBJ
      ?auto_1005 - OBJ
      ?auto_1002 - LOCATION
    )
    :vars
    (
      ?auto_1007 - LOCATION
      ?auto_1010 - CITY
      ?auto_1006 - LOCATION
      ?auto_1008 - LOCATION
      ?auto_1009 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1007 ?auto_1010 ) ( IN-CITY ?auto_1002 ?auto_1010 ) ( not ( = ?auto_1002 ?auto_1007 ) ) ( OBJ-AT ?auto_1005 ?auto_1007 ) ( IN-CITY ?auto_1006 ?auto_1010 ) ( not ( = ?auto_1002 ?auto_1006 ) ) ( OBJ-AT ?auto_1003 ?auto_1006 ) ( IN-CITY ?auto_1008 ?auto_1010 ) ( not ( = ?auto_1002 ?auto_1008 ) ) ( OBJ-AT ?auto_1004 ?auto_1008 ) ( TRUCK-AT ?auto_1009 ?auto_1002 ) ( not ( = ?auto_1004 ?auto_1003 ) ) ( not ( = ?auto_1006 ?auto_1008 ) ) ( not ( = ?auto_1004 ?auto_1005 ) ) ( not ( = ?auto_1003 ?auto_1005 ) ) ( not ( = ?auto_1007 ?auto_1006 ) ) ( not ( = ?auto_1007 ?auto_1008 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1004 ?auto_1005 ?auto_1003 ?auto_1002 )
      ( DELIVER-3PKG-VERIFY ?auto_1003 ?auto_1004 ?auto_1005 ?auto_1002 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1022 - OBJ
      ?auto_1023 - OBJ
      ?auto_1024 - OBJ
      ?auto_1021 - LOCATION
    )
    :vars
    (
      ?auto_1026 - LOCATION
      ?auto_1029 - CITY
      ?auto_1025 - LOCATION
      ?auto_1027 - LOCATION
      ?auto_1028 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1026 ?auto_1029 ) ( IN-CITY ?auto_1021 ?auto_1029 ) ( not ( = ?auto_1021 ?auto_1026 ) ) ( OBJ-AT ?auto_1023 ?auto_1026 ) ( IN-CITY ?auto_1025 ?auto_1029 ) ( not ( = ?auto_1021 ?auto_1025 ) ) ( OBJ-AT ?auto_1022 ?auto_1025 ) ( IN-CITY ?auto_1027 ?auto_1029 ) ( not ( = ?auto_1021 ?auto_1027 ) ) ( OBJ-AT ?auto_1024 ?auto_1027 ) ( TRUCK-AT ?auto_1028 ?auto_1021 ) ( not ( = ?auto_1024 ?auto_1022 ) ) ( not ( = ?auto_1025 ?auto_1027 ) ) ( not ( = ?auto_1024 ?auto_1023 ) ) ( not ( = ?auto_1022 ?auto_1023 ) ) ( not ( = ?auto_1026 ?auto_1025 ) ) ( not ( = ?auto_1026 ?auto_1027 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1024 ?auto_1023 ?auto_1022 ?auto_1021 )
      ( DELIVER-3PKG-VERIFY ?auto_1022 ?auto_1023 ?auto_1024 ?auto_1021 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1061 - OBJ
      ?auto_1062 - OBJ
      ?auto_1063 - OBJ
      ?auto_1060 - LOCATION
    )
    :vars
    (
      ?auto_1065 - LOCATION
      ?auto_1068 - CITY
      ?auto_1064 - LOCATION
      ?auto_1066 - LOCATION
      ?auto_1067 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1065 ?auto_1068 ) ( IN-CITY ?auto_1060 ?auto_1068 ) ( not ( = ?auto_1060 ?auto_1065 ) ) ( OBJ-AT ?auto_1061 ?auto_1065 ) ( IN-CITY ?auto_1064 ?auto_1068 ) ( not ( = ?auto_1060 ?auto_1064 ) ) ( OBJ-AT ?auto_1063 ?auto_1064 ) ( IN-CITY ?auto_1066 ?auto_1068 ) ( not ( = ?auto_1060 ?auto_1066 ) ) ( OBJ-AT ?auto_1062 ?auto_1066 ) ( TRUCK-AT ?auto_1067 ?auto_1060 ) ( not ( = ?auto_1062 ?auto_1063 ) ) ( not ( = ?auto_1064 ?auto_1066 ) ) ( not ( = ?auto_1062 ?auto_1061 ) ) ( not ( = ?auto_1063 ?auto_1061 ) ) ( not ( = ?auto_1065 ?auto_1064 ) ) ( not ( = ?auto_1065 ?auto_1066 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1062 ?auto_1061 ?auto_1063 ?auto_1060 )
      ( DELIVER-3PKG-VERIFY ?auto_1061 ?auto_1062 ?auto_1063 ?auto_1060 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1080 - OBJ
      ?auto_1081 - OBJ
      ?auto_1082 - OBJ
      ?auto_1079 - LOCATION
    )
    :vars
    (
      ?auto_1084 - LOCATION
      ?auto_1087 - CITY
      ?auto_1083 - LOCATION
      ?auto_1085 - LOCATION
      ?auto_1086 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1084 ?auto_1087 ) ( IN-CITY ?auto_1079 ?auto_1087 ) ( not ( = ?auto_1079 ?auto_1084 ) ) ( OBJ-AT ?auto_1080 ?auto_1084 ) ( IN-CITY ?auto_1083 ?auto_1087 ) ( not ( = ?auto_1079 ?auto_1083 ) ) ( OBJ-AT ?auto_1081 ?auto_1083 ) ( IN-CITY ?auto_1085 ?auto_1087 ) ( not ( = ?auto_1079 ?auto_1085 ) ) ( OBJ-AT ?auto_1082 ?auto_1085 ) ( TRUCK-AT ?auto_1086 ?auto_1079 ) ( not ( = ?auto_1082 ?auto_1081 ) ) ( not ( = ?auto_1083 ?auto_1085 ) ) ( not ( = ?auto_1082 ?auto_1080 ) ) ( not ( = ?auto_1081 ?auto_1080 ) ) ( not ( = ?auto_1084 ?auto_1083 ) ) ( not ( = ?auto_1084 ?auto_1085 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1082 ?auto_1080 ?auto_1081 ?auto_1079 )
      ( DELIVER-3PKG-VERIFY ?auto_1080 ?auto_1081 ?auto_1082 ?auto_1079 ) )
  )

)

