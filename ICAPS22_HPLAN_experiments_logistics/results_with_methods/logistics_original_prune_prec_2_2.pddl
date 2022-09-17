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
      ?auto_807 - OBJ
      ?auto_808 - LOCATION
    )
    :vars
    (
      ?auto_809 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_809 ?auto_808 ) ( IN-TRUCK ?auto_807 ?auto_809 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_807 ?auto_809 ?auto_808 )
      ( DELIVER-1PKG-VERIFY ?auto_807 ?auto_808 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_818 - OBJ
      ?auto_819 - LOCATION
    )
    :vars
    (
      ?auto_822 - TRUCK
      ?auto_824 - LOCATION
      ?auto_825 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_818 ?auto_822 ) ( TRUCK-AT ?auto_822 ?auto_824 ) ( IN-CITY ?auto_824 ?auto_825 ) ( IN-CITY ?auto_819 ?auto_825 ) ( not ( = ?auto_819 ?auto_824 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_822 ?auto_824 ?auto_819 ?auto_825 )
      ( DELIVER-1PKG ?auto_818 ?auto_819 )
      ( DELIVER-1PKG-VERIFY ?auto_818 ?auto_819 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_835 - OBJ
      ?auto_836 - LOCATION
    )
    :vars
    (
      ?auto_839 - TRUCK
      ?auto_840 - LOCATION
      ?auto_837 - CITY
      ?auto_843 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_839 ?auto_840 ) ( IN-CITY ?auto_840 ?auto_837 ) ( IN-CITY ?auto_836 ?auto_837 ) ( not ( = ?auto_836 ?auto_840 ) ) ( TRUCK-AT ?auto_839 ?auto_843 ) ( OBJ-AT ?auto_835 ?auto_843 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_835 ?auto_839 ?auto_843 )
      ( DELIVER-1PKG ?auto_835 ?auto_836 )
      ( DELIVER-1PKG-VERIFY ?auto_835 ?auto_836 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_854 - OBJ
      ?auto_855 - LOCATION
    )
    :vars
    (
      ?auto_861 - LOCATION
      ?auto_859 - CITY
      ?auto_860 - TRUCK
      ?auto_863 - LOCATION
      ?auto_864 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_861 ?auto_859 ) ( IN-CITY ?auto_855 ?auto_859 ) ( not ( = ?auto_855 ?auto_861 ) ) ( OBJ-AT ?auto_854 ?auto_861 ) ( TRUCK-AT ?auto_860 ?auto_863 ) ( IN-CITY ?auto_863 ?auto_864 ) ( IN-CITY ?auto_861 ?auto_864 ) ( not ( = ?auto_861 ?auto_863 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_860 ?auto_863 ?auto_861 ?auto_864 )
      ( DELIVER-1PKG ?auto_854 ?auto_855 )
      ( DELIVER-1PKG-VERIFY ?auto_854 ?auto_855 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_892 - OBJ
      ?auto_894 - OBJ
      ?auto_893 - LOCATION
    )
    :vars
    (
      ?auto_897 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_894 ?auto_892 ) ( TRUCK-AT ?auto_897 ?auto_893 ) ( IN-TRUCK ?auto_894 ?auto_897 ) ( OBJ-AT ?auto_892 ?auto_893 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_894 ?auto_893 )
      ( DELIVER-2PKG-VERIFY ?auto_892 ?auto_894 ?auto_893 ) )
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
      ?auto_923 - LOCATION
      ?auto_925 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_921 ?auto_919 ) ( IN-TRUCK ?auto_921 ?auto_922 ) ( TRUCK-AT ?auto_922 ?auto_923 ) ( IN-CITY ?auto_923 ?auto_925 ) ( IN-CITY ?auto_920 ?auto_925 ) ( not ( = ?auto_920 ?auto_923 ) ) ( OBJ-AT ?auto_919 ?auto_920 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_921 ?auto_920 )
      ( DELIVER-2PKG-VERIFY ?auto_919 ?auto_921 ?auto_920 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_945 - OBJ
      ?auto_946 - LOCATION
    )
    :vars
    (
      ?auto_947 - OBJ
      ?auto_951 - TRUCK
      ?auto_952 - LOCATION
      ?auto_949 - CITY
      ?auto_954 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_945 ?auto_947 ) ( TRUCK-AT ?auto_951 ?auto_952 ) ( IN-CITY ?auto_952 ?auto_949 ) ( IN-CITY ?auto_946 ?auto_949 ) ( not ( = ?auto_946 ?auto_952 ) ) ( OBJ-AT ?auto_947 ?auto_946 ) ( TRUCK-AT ?auto_951 ?auto_954 ) ( OBJ-AT ?auto_945 ?auto_954 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_945 ?auto_951 ?auto_954 )
      ( DELIVER-2PKG ?auto_947 ?auto_945 ?auto_946 )
      ( DELIVER-1PKG-VERIFY ?auto_945 ?auto_946 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_956 - OBJ
      ?auto_958 - OBJ
      ?auto_957 - LOCATION
    )
    :vars
    (
      ?auto_960 - OBJ
      ?auto_965 - TRUCK
      ?auto_959 - LOCATION
      ?auto_961 - CITY
      ?auto_963 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_958 ?auto_956 ) ( GREATER-THAN ?auto_958 ?auto_960 ) ( TRUCK-AT ?auto_965 ?auto_959 ) ( IN-CITY ?auto_959 ?auto_961 ) ( IN-CITY ?auto_957 ?auto_961 ) ( not ( = ?auto_957 ?auto_959 ) ) ( OBJ-AT ?auto_960 ?auto_957 ) ( TRUCK-AT ?auto_965 ?auto_963 ) ( OBJ-AT ?auto_958 ?auto_963 ) ( OBJ-AT ?auto_956 ?auto_957 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_958 ?auto_957 )
      ( DELIVER-2PKG-VERIFY ?auto_956 ?auto_958 ?auto_957 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_988 - OBJ
      ?auto_989 - LOCATION
    )
    :vars
    (
      ?auto_992 - OBJ
      ?auto_995 - OBJ
      ?auto_990 - LOCATION
      ?auto_997 - CITY
      ?auto_991 - TRUCK
      ?auto_999 - LOCATION
      ?auto_1000 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_988 ?auto_992 ) ( GREATER-THAN ?auto_988 ?auto_995 ) ( IN-CITY ?auto_990 ?auto_997 ) ( IN-CITY ?auto_989 ?auto_997 ) ( not ( = ?auto_989 ?auto_990 ) ) ( OBJ-AT ?auto_995 ?auto_989 ) ( OBJ-AT ?auto_988 ?auto_990 ) ( OBJ-AT ?auto_992 ?auto_989 ) ( TRUCK-AT ?auto_991 ?auto_999 ) ( IN-CITY ?auto_999 ?auto_1000 ) ( IN-CITY ?auto_990 ?auto_1000 ) ( not ( = ?auto_990 ?auto_999 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_991 ?auto_999 ?auto_990 ?auto_1000 )
      ( DELIVER-2PKG ?auto_992 ?auto_988 ?auto_989 )
      ( DELIVER-1PKG-VERIFY ?auto_988 ?auto_989 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1002 - OBJ
      ?auto_1004 - OBJ
      ?auto_1003 - LOCATION
    )
    :vars
    (
      ?auto_1006 - OBJ
      ?auto_1010 - OBJ
      ?auto_1009 - LOCATION
      ?auto_1012 - CITY
      ?auto_1007 - TRUCK
      ?auto_1008 - LOCATION
      ?auto_1013 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1004 ?auto_1002 ) ( GREATER-THAN ?auto_1004 ?auto_1006 ) ( GREATER-THAN ?auto_1004 ?auto_1010 ) ( IN-CITY ?auto_1009 ?auto_1012 ) ( IN-CITY ?auto_1003 ?auto_1012 ) ( not ( = ?auto_1003 ?auto_1009 ) ) ( OBJ-AT ?auto_1010 ?auto_1003 ) ( OBJ-AT ?auto_1004 ?auto_1009 ) ( OBJ-AT ?auto_1006 ?auto_1003 ) ( TRUCK-AT ?auto_1007 ?auto_1008 ) ( IN-CITY ?auto_1008 ?auto_1013 ) ( IN-CITY ?auto_1009 ?auto_1013 ) ( not ( = ?auto_1009 ?auto_1008 ) ) ( OBJ-AT ?auto_1002 ?auto_1003 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1004 ?auto_1003 )
      ( DELIVER-2PKG-VERIFY ?auto_1002 ?auto_1004 ?auto_1003 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1040 - OBJ
      ?auto_1041 - LOCATION
    )
    :vars
    (
      ?auto_1046 - OBJ
      ?auto_1050 - LOCATION
      ?auto_1042 - CITY
      ?auto_1049 - TRUCK
      ?auto_1047 - LOCATION
      ?auto_1048 - CITY
      ?auto_1054 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1040 ?auto_1046 ) ( IN-CITY ?auto_1050 ?auto_1042 ) ( IN-CITY ?auto_1041 ?auto_1042 ) ( not ( = ?auto_1041 ?auto_1050 ) ) ( OBJ-AT ?auto_1040 ?auto_1050 ) ( TRUCK-AT ?auto_1049 ?auto_1047 ) ( IN-CITY ?auto_1047 ?auto_1048 ) ( IN-CITY ?auto_1050 ?auto_1048 ) ( not ( = ?auto_1050 ?auto_1047 ) ) ( TRUCK-AT ?auto_1054 ?auto_1041 ) ( IN-TRUCK ?auto_1046 ?auto_1054 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1046 ?auto_1041 )
      ( DELIVER-2PKG ?auto_1046 ?auto_1040 ?auto_1041 )
      ( DELIVER-1PKG-VERIFY ?auto_1040 ?auto_1041 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1055 - OBJ
      ?auto_1057 - OBJ
      ?auto_1056 - LOCATION
    )
    :vars
    (
      ?auto_1063 - LOCATION
      ?auto_1061 - CITY
      ?auto_1064 - TRUCK
      ?auto_1065 - LOCATION
      ?auto_1058 - CITY
      ?auto_1066 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1057 ?auto_1055 ) ( IN-CITY ?auto_1063 ?auto_1061 ) ( IN-CITY ?auto_1056 ?auto_1061 ) ( not ( = ?auto_1056 ?auto_1063 ) ) ( OBJ-AT ?auto_1057 ?auto_1063 ) ( TRUCK-AT ?auto_1064 ?auto_1065 ) ( IN-CITY ?auto_1065 ?auto_1058 ) ( IN-CITY ?auto_1063 ?auto_1058 ) ( not ( = ?auto_1063 ?auto_1065 ) ) ( TRUCK-AT ?auto_1066 ?auto_1056 ) ( IN-TRUCK ?auto_1055 ?auto_1066 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1057 ?auto_1056 )
      ( DELIVER-2PKG-VERIFY ?auto_1055 ?auto_1057 ?auto_1056 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1091 - OBJ
      ?auto_1092 - LOCATION
    )
    :vars
    (
      ?auto_1101 - OBJ
      ?auto_1097 - LOCATION
      ?auto_1093 - CITY
      ?auto_1095 - CITY
      ?auto_1094 - TRUCK
      ?auto_1103 - LOCATION
      ?auto_1104 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1091 ?auto_1101 ) ( IN-CITY ?auto_1097 ?auto_1093 ) ( IN-CITY ?auto_1092 ?auto_1093 ) ( not ( = ?auto_1092 ?auto_1097 ) ) ( OBJ-AT ?auto_1091 ?auto_1097 ) ( IN-CITY ?auto_1092 ?auto_1095 ) ( IN-CITY ?auto_1097 ?auto_1095 ) ( IN-TRUCK ?auto_1101 ?auto_1094 ) ( TRUCK-AT ?auto_1094 ?auto_1103 ) ( IN-CITY ?auto_1103 ?auto_1104 ) ( IN-CITY ?auto_1092 ?auto_1104 ) ( not ( = ?auto_1092 ?auto_1103 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1094 ?auto_1103 ?auto_1092 ?auto_1104 )
      ( DELIVER-2PKG ?auto_1101 ?auto_1091 ?auto_1092 )
      ( DELIVER-1PKG-VERIFY ?auto_1091 ?auto_1092 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1106 - OBJ
      ?auto_1108 - OBJ
      ?auto_1107 - LOCATION
    )
    :vars
    (
      ?auto_1112 - LOCATION
      ?auto_1113 - CITY
      ?auto_1114 - CITY
      ?auto_1111 - TRUCK
      ?auto_1116 - LOCATION
      ?auto_1117 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1108 ?auto_1106 ) ( IN-CITY ?auto_1112 ?auto_1113 ) ( IN-CITY ?auto_1107 ?auto_1113 ) ( not ( = ?auto_1107 ?auto_1112 ) ) ( OBJ-AT ?auto_1108 ?auto_1112 ) ( IN-CITY ?auto_1107 ?auto_1114 ) ( IN-CITY ?auto_1112 ?auto_1114 ) ( IN-TRUCK ?auto_1106 ?auto_1111 ) ( TRUCK-AT ?auto_1111 ?auto_1116 ) ( IN-CITY ?auto_1116 ?auto_1117 ) ( IN-CITY ?auto_1107 ?auto_1117 ) ( not ( = ?auto_1107 ?auto_1116 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1108 ?auto_1107 )
      ( DELIVER-2PKG-VERIFY ?auto_1106 ?auto_1108 ?auto_1107 ) )
  )

)

