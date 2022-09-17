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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_899 - OBJ
      ?auto_900 - LOCATION
    )
    :vars
    (
      ?auto_901 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_901 ?auto_900 ) ( IN-TRUCK ?auto_899 ?auto_901 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_899 ?auto_901 ?auto_900 )
      ( DELIVER-1PKG-VERIFY ?auto_899 ?auto_900 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_904 - OBJ
      ?auto_905 - LOCATION
    )
    :vars
    (
      ?auto_906 - TRUCK
      ?auto_907 - LOCATION
      ?auto_908 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_904 ?auto_906 ) ( TRUCK-AT ?auto_906 ?auto_907 ) ( IN-CITY ?auto_907 ?auto_908 ) ( IN-CITY ?auto_905 ?auto_908 ) ( not ( = ?auto_905 ?auto_907 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_906 ?auto_907 ?auto_905 ?auto_908 )
      ( DELIVER-1PKG ?auto_904 ?auto_905 )
      ( DELIVER-1PKG-VERIFY ?auto_904 ?auto_905 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_911 - OBJ
      ?auto_912 - LOCATION
    )
    :vars
    (
      ?auto_913 - TRUCK
      ?auto_914 - LOCATION
      ?auto_915 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_913 ?auto_914 ) ( IN-CITY ?auto_914 ?auto_915 ) ( IN-CITY ?auto_912 ?auto_915 ) ( not ( = ?auto_912 ?auto_914 ) ) ( OBJ-AT ?auto_911 ?auto_914 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_911 ?auto_913 ?auto_914 )
      ( DELIVER-1PKG ?auto_911 ?auto_912 )
      ( DELIVER-1PKG-VERIFY ?auto_911 ?auto_912 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_918 - OBJ
      ?auto_919 - LOCATION
    )
    :vars
    (
      ?auto_921 - LOCATION
      ?auto_920 - CITY
      ?auto_922 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_921 ?auto_920 ) ( IN-CITY ?auto_919 ?auto_920 ) ( not ( = ?auto_919 ?auto_921 ) ) ( OBJ-AT ?auto_918 ?auto_921 ) ( TRUCK-AT ?auto_922 ?auto_919 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_922 ?auto_919 ?auto_921 ?auto_920 )
      ( DELIVER-1PKG ?auto_918 ?auto_919 )
      ( DELIVER-1PKG-VERIFY ?auto_918 ?auto_919 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_925 - OBJ
      ?auto_926 - LOCATION
    )
    :vars
    (
      ?auto_927 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_927 ?auto_926 ) ( IN-TRUCK ?auto_925 ?auto_927 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_925 ?auto_927 ?auto_926 )
      ( DELIVER-1PKG-VERIFY ?auto_925 ?auto_926 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_930 - OBJ
      ?auto_931 - LOCATION
    )
    :vars
    (
      ?auto_932 - TRUCK
      ?auto_933 - LOCATION
      ?auto_934 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_930 ?auto_932 ) ( TRUCK-AT ?auto_932 ?auto_933 ) ( IN-CITY ?auto_933 ?auto_934 ) ( IN-CITY ?auto_931 ?auto_934 ) ( not ( = ?auto_931 ?auto_933 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_932 ?auto_933 ?auto_931 ?auto_934 )
      ( DELIVER-1PKG ?auto_930 ?auto_931 )
      ( DELIVER-1PKG-VERIFY ?auto_930 ?auto_931 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_937 - OBJ
      ?auto_938 - LOCATION
    )
    :vars
    (
      ?auto_941 - TRUCK
      ?auto_940 - LOCATION
      ?auto_939 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_941 ?auto_940 ) ( IN-CITY ?auto_940 ?auto_939 ) ( IN-CITY ?auto_938 ?auto_939 ) ( not ( = ?auto_938 ?auto_940 ) ) ( OBJ-AT ?auto_937 ?auto_940 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_937 ?auto_941 ?auto_940 )
      ( DELIVER-1PKG ?auto_937 ?auto_938 )
      ( DELIVER-1PKG-VERIFY ?auto_937 ?auto_938 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_944 - OBJ
      ?auto_945 - LOCATION
    )
    :vars
    (
      ?auto_946 - LOCATION
      ?auto_948 - CITY
      ?auto_947 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_946 ?auto_948 ) ( IN-CITY ?auto_945 ?auto_948 ) ( not ( = ?auto_945 ?auto_946 ) ) ( OBJ-AT ?auto_944 ?auto_946 ) ( TRUCK-AT ?auto_947 ?auto_945 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_947 ?auto_945 ?auto_946 ?auto_948 )
      ( DELIVER-1PKG ?auto_944 ?auto_945 )
      ( DELIVER-1PKG-VERIFY ?auto_944 ?auto_945 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_952 - OBJ
      ?auto_954 - OBJ
      ?auto_953 - LOCATION
    )
    :vars
    (
      ?auto_955 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_954 ?auto_952 ) ( TRUCK-AT ?auto_955 ?auto_953 ) ( IN-TRUCK ?auto_954 ?auto_955 ) ( OBJ-AT ?auto_952 ?auto_953 ) ( not ( = ?auto_952 ?auto_954 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_954 ?auto_953 )
      ( DELIVER-2PKG-VERIFY ?auto_952 ?auto_954 ?auto_953 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_959 - OBJ
      ?auto_961 - OBJ
      ?auto_960 - LOCATION
    )
    :vars
    (
      ?auto_964 - TRUCK
      ?auto_963 - LOCATION
      ?auto_962 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_961 ?auto_959 ) ( IN-TRUCK ?auto_961 ?auto_964 ) ( TRUCK-AT ?auto_964 ?auto_963 ) ( IN-CITY ?auto_963 ?auto_962 ) ( IN-CITY ?auto_960 ?auto_962 ) ( not ( = ?auto_960 ?auto_963 ) ) ( OBJ-AT ?auto_959 ?auto_960 ) ( not ( = ?auto_959 ?auto_961 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_961 ?auto_960 )
      ( DELIVER-2PKG-VERIFY ?auto_959 ?auto_961 ?auto_960 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_968 - OBJ
      ?auto_970 - OBJ
      ?auto_969 - LOCATION
    )
    :vars
    (
      ?auto_972 - TRUCK
      ?auto_971 - LOCATION
      ?auto_973 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_970 ?auto_968 ) ( TRUCK-AT ?auto_972 ?auto_971 ) ( IN-CITY ?auto_971 ?auto_973 ) ( IN-CITY ?auto_969 ?auto_973 ) ( not ( = ?auto_969 ?auto_971 ) ) ( OBJ-AT ?auto_970 ?auto_971 ) ( OBJ-AT ?auto_968 ?auto_969 ) ( not ( = ?auto_968 ?auto_970 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_970 ?auto_969 )
      ( DELIVER-2PKG-VERIFY ?auto_968 ?auto_970 ?auto_969 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_977 - OBJ
      ?auto_979 - OBJ
      ?auto_978 - LOCATION
    )
    :vars
    (
      ?auto_981 - LOCATION
      ?auto_980 - CITY
      ?auto_982 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_979 ?auto_977 ) ( IN-CITY ?auto_981 ?auto_980 ) ( IN-CITY ?auto_978 ?auto_980 ) ( not ( = ?auto_978 ?auto_981 ) ) ( OBJ-AT ?auto_979 ?auto_981 ) ( TRUCK-AT ?auto_982 ?auto_978 ) ( OBJ-AT ?auto_977 ?auto_978 ) ( not ( = ?auto_977 ?auto_979 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_979 ?auto_978 )
      ( DELIVER-2PKG-VERIFY ?auto_977 ?auto_979 ?auto_978 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_986 - OBJ
      ?auto_988 - OBJ
      ?auto_987 - LOCATION
    )
    :vars
    (
      ?auto_990 - LOCATION
      ?auto_989 - CITY
      ?auto_991 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_988 ?auto_986 ) ( IN-CITY ?auto_990 ?auto_989 ) ( IN-CITY ?auto_987 ?auto_989 ) ( not ( = ?auto_987 ?auto_990 ) ) ( OBJ-AT ?auto_988 ?auto_990 ) ( TRUCK-AT ?auto_991 ?auto_987 ) ( not ( = ?auto_986 ?auto_988 ) ) ( IN-TRUCK ?auto_986 ?auto_991 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_986 ?auto_987 )
      ( DELIVER-2PKG ?auto_986 ?auto_988 ?auto_987 )
      ( DELIVER-2PKG-VERIFY ?auto_986 ?auto_988 ?auto_987 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_995 - OBJ
      ?auto_997 - OBJ
      ?auto_996 - LOCATION
    )
    :vars
    (
      ?auto_998 - LOCATION
      ?auto_1000 - CITY
      ?auto_999 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_997 ?auto_995 ) ( IN-CITY ?auto_998 ?auto_1000 ) ( IN-CITY ?auto_996 ?auto_1000 ) ( not ( = ?auto_996 ?auto_998 ) ) ( OBJ-AT ?auto_997 ?auto_998 ) ( not ( = ?auto_995 ?auto_997 ) ) ( IN-TRUCK ?auto_995 ?auto_999 ) ( TRUCK-AT ?auto_999 ?auto_998 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_999 ?auto_998 ?auto_996 ?auto_1000 )
      ( DELIVER-2PKG ?auto_995 ?auto_997 ?auto_996 )
      ( DELIVER-2PKG-VERIFY ?auto_995 ?auto_997 ?auto_996 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1004 - OBJ
      ?auto_1006 - OBJ
      ?auto_1005 - LOCATION
    )
    :vars
    (
      ?auto_1007 - LOCATION
      ?auto_1008 - CITY
      ?auto_1009 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1006 ?auto_1004 ) ( IN-CITY ?auto_1007 ?auto_1008 ) ( IN-CITY ?auto_1005 ?auto_1008 ) ( not ( = ?auto_1005 ?auto_1007 ) ) ( OBJ-AT ?auto_1006 ?auto_1007 ) ( not ( = ?auto_1004 ?auto_1006 ) ) ( TRUCK-AT ?auto_1009 ?auto_1007 ) ( OBJ-AT ?auto_1004 ?auto_1007 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1004 ?auto_1009 ?auto_1007 )
      ( DELIVER-2PKG ?auto_1004 ?auto_1006 ?auto_1005 )
      ( DELIVER-2PKG-VERIFY ?auto_1004 ?auto_1006 ?auto_1005 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1013 - OBJ
      ?auto_1015 - OBJ
      ?auto_1014 - LOCATION
    )
    :vars
    (
      ?auto_1017 - LOCATION
      ?auto_1016 - CITY
      ?auto_1018 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1015 ?auto_1013 ) ( IN-CITY ?auto_1017 ?auto_1016 ) ( IN-CITY ?auto_1014 ?auto_1016 ) ( not ( = ?auto_1014 ?auto_1017 ) ) ( OBJ-AT ?auto_1015 ?auto_1017 ) ( not ( = ?auto_1013 ?auto_1015 ) ) ( OBJ-AT ?auto_1013 ?auto_1017 ) ( TRUCK-AT ?auto_1018 ?auto_1014 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1018 ?auto_1014 ?auto_1017 ?auto_1016 )
      ( DELIVER-2PKG ?auto_1013 ?auto_1015 ?auto_1014 )
      ( DELIVER-2PKG-VERIFY ?auto_1013 ?auto_1015 ?auto_1014 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1021 - OBJ
      ?auto_1022 - LOCATION
    )
    :vars
    (
      ?auto_1023 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1023 ?auto_1022 ) ( IN-TRUCK ?auto_1021 ?auto_1023 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1021 ?auto_1023 ?auto_1022 )
      ( DELIVER-1PKG-VERIFY ?auto_1021 ?auto_1022 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1026 - OBJ
      ?auto_1027 - LOCATION
    )
    :vars
    (
      ?auto_1028 - TRUCK
      ?auto_1029 - LOCATION
      ?auto_1030 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1026 ?auto_1028 ) ( TRUCK-AT ?auto_1028 ?auto_1029 ) ( IN-CITY ?auto_1029 ?auto_1030 ) ( IN-CITY ?auto_1027 ?auto_1030 ) ( not ( = ?auto_1027 ?auto_1029 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1028 ?auto_1029 ?auto_1027 ?auto_1030 )
      ( DELIVER-1PKG ?auto_1026 ?auto_1027 )
      ( DELIVER-1PKG-VERIFY ?auto_1026 ?auto_1027 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1033 - OBJ
      ?auto_1034 - LOCATION
    )
    :vars
    (
      ?auto_1035 - TRUCK
      ?auto_1036 - LOCATION
      ?auto_1037 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1035 ?auto_1036 ) ( IN-CITY ?auto_1036 ?auto_1037 ) ( IN-CITY ?auto_1034 ?auto_1037 ) ( not ( = ?auto_1034 ?auto_1036 ) ) ( OBJ-AT ?auto_1033 ?auto_1036 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1033 ?auto_1035 ?auto_1036 )
      ( DELIVER-1PKG ?auto_1033 ?auto_1034 )
      ( DELIVER-1PKG-VERIFY ?auto_1033 ?auto_1034 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1040 - OBJ
      ?auto_1041 - LOCATION
    )
    :vars
    (
      ?auto_1042 - LOCATION
      ?auto_1044 - CITY
      ?auto_1043 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1042 ?auto_1044 ) ( IN-CITY ?auto_1041 ?auto_1044 ) ( not ( = ?auto_1041 ?auto_1042 ) ) ( OBJ-AT ?auto_1040 ?auto_1042 ) ( TRUCK-AT ?auto_1043 ?auto_1041 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1043 ?auto_1041 ?auto_1042 ?auto_1044 )
      ( DELIVER-1PKG ?auto_1040 ?auto_1041 )
      ( DELIVER-1PKG-VERIFY ?auto_1040 ?auto_1041 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1049 - OBJ
      ?auto_1051 - OBJ
      ?auto_1052 - OBJ
      ?auto_1050 - LOCATION
    )
    :vars
    (
      ?auto_1053 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1051 ?auto_1049 ) ( GREATER-THAN ?auto_1052 ?auto_1049 ) ( GREATER-THAN ?auto_1052 ?auto_1051 ) ( TRUCK-AT ?auto_1053 ?auto_1050 ) ( IN-TRUCK ?auto_1052 ?auto_1053 ) ( OBJ-AT ?auto_1049 ?auto_1050 ) ( OBJ-AT ?auto_1051 ?auto_1050 ) ( not ( = ?auto_1049 ?auto_1051 ) ) ( not ( = ?auto_1049 ?auto_1052 ) ) ( not ( = ?auto_1051 ?auto_1052 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1052 ?auto_1050 )
      ( DELIVER-3PKG-VERIFY ?auto_1049 ?auto_1051 ?auto_1052 ?auto_1050 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1058 - OBJ
      ?auto_1060 - OBJ
      ?auto_1061 - OBJ
      ?auto_1059 - LOCATION
    )
    :vars
    (
      ?auto_1062 - TRUCK
      ?auto_1063 - LOCATION
      ?auto_1064 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1060 ?auto_1058 ) ( GREATER-THAN ?auto_1061 ?auto_1058 ) ( GREATER-THAN ?auto_1061 ?auto_1060 ) ( IN-TRUCK ?auto_1061 ?auto_1062 ) ( TRUCK-AT ?auto_1062 ?auto_1063 ) ( IN-CITY ?auto_1063 ?auto_1064 ) ( IN-CITY ?auto_1059 ?auto_1064 ) ( not ( = ?auto_1059 ?auto_1063 ) ) ( OBJ-AT ?auto_1058 ?auto_1059 ) ( OBJ-AT ?auto_1060 ?auto_1059 ) ( not ( = ?auto_1058 ?auto_1060 ) ) ( not ( = ?auto_1058 ?auto_1061 ) ) ( not ( = ?auto_1060 ?auto_1061 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1061 ?auto_1059 )
      ( DELIVER-3PKG-VERIFY ?auto_1058 ?auto_1060 ?auto_1061 ?auto_1059 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1069 - OBJ
      ?auto_1071 - OBJ
      ?auto_1072 - OBJ
      ?auto_1070 - LOCATION
    )
    :vars
    (
      ?auto_1074 - TRUCK
      ?auto_1073 - LOCATION
      ?auto_1075 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1071 ?auto_1069 ) ( GREATER-THAN ?auto_1072 ?auto_1069 ) ( GREATER-THAN ?auto_1072 ?auto_1071 ) ( TRUCK-AT ?auto_1074 ?auto_1073 ) ( IN-CITY ?auto_1073 ?auto_1075 ) ( IN-CITY ?auto_1070 ?auto_1075 ) ( not ( = ?auto_1070 ?auto_1073 ) ) ( OBJ-AT ?auto_1072 ?auto_1073 ) ( OBJ-AT ?auto_1069 ?auto_1070 ) ( OBJ-AT ?auto_1071 ?auto_1070 ) ( not ( = ?auto_1069 ?auto_1071 ) ) ( not ( = ?auto_1069 ?auto_1072 ) ) ( not ( = ?auto_1071 ?auto_1072 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1072 ?auto_1070 )
      ( DELIVER-3PKG-VERIFY ?auto_1069 ?auto_1071 ?auto_1072 ?auto_1070 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1080 - OBJ
      ?auto_1082 - OBJ
      ?auto_1083 - OBJ
      ?auto_1081 - LOCATION
    )
    :vars
    (
      ?auto_1084 - LOCATION
      ?auto_1085 - CITY
      ?auto_1086 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1082 ?auto_1080 ) ( GREATER-THAN ?auto_1083 ?auto_1080 ) ( GREATER-THAN ?auto_1083 ?auto_1082 ) ( IN-CITY ?auto_1084 ?auto_1085 ) ( IN-CITY ?auto_1081 ?auto_1085 ) ( not ( = ?auto_1081 ?auto_1084 ) ) ( OBJ-AT ?auto_1083 ?auto_1084 ) ( TRUCK-AT ?auto_1086 ?auto_1081 ) ( OBJ-AT ?auto_1080 ?auto_1081 ) ( OBJ-AT ?auto_1082 ?auto_1081 ) ( not ( = ?auto_1080 ?auto_1082 ) ) ( not ( = ?auto_1080 ?auto_1083 ) ) ( not ( = ?auto_1082 ?auto_1083 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1083 ?auto_1081 )
      ( DELIVER-3PKG-VERIFY ?auto_1080 ?auto_1082 ?auto_1083 ?auto_1081 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1091 - OBJ
      ?auto_1093 - OBJ
      ?auto_1094 - OBJ
      ?auto_1092 - LOCATION
    )
    :vars
    (
      ?auto_1096 - LOCATION
      ?auto_1097 - CITY
      ?auto_1095 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1093 ?auto_1091 ) ( GREATER-THAN ?auto_1094 ?auto_1091 ) ( GREATER-THAN ?auto_1094 ?auto_1093 ) ( IN-CITY ?auto_1096 ?auto_1097 ) ( IN-CITY ?auto_1092 ?auto_1097 ) ( not ( = ?auto_1092 ?auto_1096 ) ) ( OBJ-AT ?auto_1094 ?auto_1096 ) ( TRUCK-AT ?auto_1095 ?auto_1092 ) ( OBJ-AT ?auto_1091 ?auto_1092 ) ( not ( = ?auto_1091 ?auto_1093 ) ) ( not ( = ?auto_1091 ?auto_1094 ) ) ( not ( = ?auto_1093 ?auto_1094 ) ) ( IN-TRUCK ?auto_1093 ?auto_1095 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1093 ?auto_1092 )
      ( DELIVER-3PKG ?auto_1091 ?auto_1093 ?auto_1094 ?auto_1092 )
      ( DELIVER-3PKG-VERIFY ?auto_1091 ?auto_1093 ?auto_1094 ?auto_1092 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1102 - OBJ
      ?auto_1104 - OBJ
      ?auto_1105 - OBJ
      ?auto_1103 - LOCATION
    )
    :vars
    (
      ?auto_1107 - LOCATION
      ?auto_1108 - CITY
      ?auto_1106 - TRUCK
      ?auto_1109 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1104 ?auto_1102 ) ( GREATER-THAN ?auto_1105 ?auto_1102 ) ( GREATER-THAN ?auto_1105 ?auto_1104 ) ( IN-CITY ?auto_1107 ?auto_1108 ) ( IN-CITY ?auto_1103 ?auto_1108 ) ( not ( = ?auto_1103 ?auto_1107 ) ) ( OBJ-AT ?auto_1105 ?auto_1107 ) ( OBJ-AT ?auto_1102 ?auto_1103 ) ( not ( = ?auto_1102 ?auto_1104 ) ) ( not ( = ?auto_1102 ?auto_1105 ) ) ( not ( = ?auto_1104 ?auto_1105 ) ) ( IN-TRUCK ?auto_1104 ?auto_1106 ) ( TRUCK-AT ?auto_1106 ?auto_1109 ) ( IN-CITY ?auto_1109 ?auto_1108 ) ( not ( = ?auto_1103 ?auto_1109 ) ) ( not ( = ?auto_1107 ?auto_1109 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1106 ?auto_1109 ?auto_1103 ?auto_1108 )
      ( DELIVER-3PKG ?auto_1102 ?auto_1104 ?auto_1105 ?auto_1103 )
      ( DELIVER-3PKG-VERIFY ?auto_1102 ?auto_1104 ?auto_1105 ?auto_1103 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1114 - OBJ
      ?auto_1116 - OBJ
      ?auto_1117 - OBJ
      ?auto_1115 - LOCATION
    )
    :vars
    (
      ?auto_1118 - LOCATION
      ?auto_1121 - CITY
      ?auto_1119 - TRUCK
      ?auto_1120 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1116 ?auto_1114 ) ( GREATER-THAN ?auto_1117 ?auto_1114 ) ( GREATER-THAN ?auto_1117 ?auto_1116 ) ( IN-CITY ?auto_1118 ?auto_1121 ) ( IN-CITY ?auto_1115 ?auto_1121 ) ( not ( = ?auto_1115 ?auto_1118 ) ) ( OBJ-AT ?auto_1117 ?auto_1118 ) ( OBJ-AT ?auto_1114 ?auto_1115 ) ( not ( = ?auto_1114 ?auto_1116 ) ) ( not ( = ?auto_1114 ?auto_1117 ) ) ( not ( = ?auto_1116 ?auto_1117 ) ) ( TRUCK-AT ?auto_1119 ?auto_1120 ) ( IN-CITY ?auto_1120 ?auto_1121 ) ( not ( = ?auto_1115 ?auto_1120 ) ) ( not ( = ?auto_1118 ?auto_1120 ) ) ( OBJ-AT ?auto_1116 ?auto_1120 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1116 ?auto_1119 ?auto_1120 )
      ( DELIVER-3PKG ?auto_1114 ?auto_1116 ?auto_1117 ?auto_1115 )
      ( DELIVER-3PKG-VERIFY ?auto_1114 ?auto_1116 ?auto_1117 ?auto_1115 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1126 - OBJ
      ?auto_1128 - OBJ
      ?auto_1129 - OBJ
      ?auto_1127 - LOCATION
    )
    :vars
    (
      ?auto_1132 - LOCATION
      ?auto_1130 - CITY
      ?auto_1133 - LOCATION
      ?auto_1131 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1128 ?auto_1126 ) ( GREATER-THAN ?auto_1129 ?auto_1126 ) ( GREATER-THAN ?auto_1129 ?auto_1128 ) ( IN-CITY ?auto_1132 ?auto_1130 ) ( IN-CITY ?auto_1127 ?auto_1130 ) ( not ( = ?auto_1127 ?auto_1132 ) ) ( OBJ-AT ?auto_1129 ?auto_1132 ) ( OBJ-AT ?auto_1126 ?auto_1127 ) ( not ( = ?auto_1126 ?auto_1128 ) ) ( not ( = ?auto_1126 ?auto_1129 ) ) ( not ( = ?auto_1128 ?auto_1129 ) ) ( IN-CITY ?auto_1133 ?auto_1130 ) ( not ( = ?auto_1127 ?auto_1133 ) ) ( not ( = ?auto_1132 ?auto_1133 ) ) ( OBJ-AT ?auto_1128 ?auto_1133 ) ( TRUCK-AT ?auto_1131 ?auto_1127 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1131 ?auto_1127 ?auto_1133 ?auto_1130 )
      ( DELIVER-3PKG ?auto_1126 ?auto_1128 ?auto_1129 ?auto_1127 )
      ( DELIVER-3PKG-VERIFY ?auto_1126 ?auto_1128 ?auto_1129 ?auto_1127 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1138 - OBJ
      ?auto_1140 - OBJ
      ?auto_1141 - OBJ
      ?auto_1139 - LOCATION
    )
    :vars
    (
      ?auto_1142 - LOCATION
      ?auto_1145 - CITY
      ?auto_1143 - LOCATION
      ?auto_1144 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1140 ?auto_1138 ) ( GREATER-THAN ?auto_1141 ?auto_1138 ) ( GREATER-THAN ?auto_1141 ?auto_1140 ) ( IN-CITY ?auto_1142 ?auto_1145 ) ( IN-CITY ?auto_1139 ?auto_1145 ) ( not ( = ?auto_1139 ?auto_1142 ) ) ( OBJ-AT ?auto_1141 ?auto_1142 ) ( not ( = ?auto_1138 ?auto_1140 ) ) ( not ( = ?auto_1138 ?auto_1141 ) ) ( not ( = ?auto_1140 ?auto_1141 ) ) ( IN-CITY ?auto_1143 ?auto_1145 ) ( not ( = ?auto_1139 ?auto_1143 ) ) ( not ( = ?auto_1142 ?auto_1143 ) ) ( OBJ-AT ?auto_1140 ?auto_1143 ) ( TRUCK-AT ?auto_1144 ?auto_1139 ) ( IN-TRUCK ?auto_1138 ?auto_1144 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1138 ?auto_1139 )
      ( DELIVER-3PKG ?auto_1138 ?auto_1140 ?auto_1141 ?auto_1139 )
      ( DELIVER-3PKG-VERIFY ?auto_1138 ?auto_1140 ?auto_1141 ?auto_1139 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1150 - OBJ
      ?auto_1152 - OBJ
      ?auto_1153 - OBJ
      ?auto_1151 - LOCATION
    )
    :vars
    (
      ?auto_1156 - LOCATION
      ?auto_1154 - CITY
      ?auto_1157 - LOCATION
      ?auto_1155 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1152 ?auto_1150 ) ( GREATER-THAN ?auto_1153 ?auto_1150 ) ( GREATER-THAN ?auto_1153 ?auto_1152 ) ( IN-CITY ?auto_1156 ?auto_1154 ) ( IN-CITY ?auto_1151 ?auto_1154 ) ( not ( = ?auto_1151 ?auto_1156 ) ) ( OBJ-AT ?auto_1153 ?auto_1156 ) ( not ( = ?auto_1150 ?auto_1152 ) ) ( not ( = ?auto_1150 ?auto_1153 ) ) ( not ( = ?auto_1152 ?auto_1153 ) ) ( IN-CITY ?auto_1157 ?auto_1154 ) ( not ( = ?auto_1151 ?auto_1157 ) ) ( not ( = ?auto_1156 ?auto_1157 ) ) ( OBJ-AT ?auto_1152 ?auto_1157 ) ( IN-TRUCK ?auto_1150 ?auto_1155 ) ( TRUCK-AT ?auto_1155 ?auto_1157 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1155 ?auto_1157 ?auto_1151 ?auto_1154 )
      ( DELIVER-3PKG ?auto_1150 ?auto_1152 ?auto_1153 ?auto_1151 )
      ( DELIVER-3PKG-VERIFY ?auto_1150 ?auto_1152 ?auto_1153 ?auto_1151 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1162 - OBJ
      ?auto_1164 - OBJ
      ?auto_1165 - OBJ
      ?auto_1163 - LOCATION
    )
    :vars
    (
      ?auto_1168 - LOCATION
      ?auto_1166 - CITY
      ?auto_1167 - LOCATION
      ?auto_1169 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1164 ?auto_1162 ) ( GREATER-THAN ?auto_1165 ?auto_1162 ) ( GREATER-THAN ?auto_1165 ?auto_1164 ) ( IN-CITY ?auto_1168 ?auto_1166 ) ( IN-CITY ?auto_1163 ?auto_1166 ) ( not ( = ?auto_1163 ?auto_1168 ) ) ( OBJ-AT ?auto_1165 ?auto_1168 ) ( not ( = ?auto_1162 ?auto_1164 ) ) ( not ( = ?auto_1162 ?auto_1165 ) ) ( not ( = ?auto_1164 ?auto_1165 ) ) ( IN-CITY ?auto_1167 ?auto_1166 ) ( not ( = ?auto_1163 ?auto_1167 ) ) ( not ( = ?auto_1168 ?auto_1167 ) ) ( OBJ-AT ?auto_1164 ?auto_1167 ) ( TRUCK-AT ?auto_1169 ?auto_1167 ) ( OBJ-AT ?auto_1162 ?auto_1167 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1162 ?auto_1169 ?auto_1167 )
      ( DELIVER-3PKG ?auto_1162 ?auto_1164 ?auto_1165 ?auto_1163 )
      ( DELIVER-3PKG-VERIFY ?auto_1162 ?auto_1164 ?auto_1165 ?auto_1163 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1174 - OBJ
      ?auto_1176 - OBJ
      ?auto_1177 - OBJ
      ?auto_1175 - LOCATION
    )
    :vars
    (
      ?auto_1178 - LOCATION
      ?auto_1181 - CITY
      ?auto_1180 - LOCATION
      ?auto_1179 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1176 ?auto_1174 ) ( GREATER-THAN ?auto_1177 ?auto_1174 ) ( GREATER-THAN ?auto_1177 ?auto_1176 ) ( IN-CITY ?auto_1178 ?auto_1181 ) ( IN-CITY ?auto_1175 ?auto_1181 ) ( not ( = ?auto_1175 ?auto_1178 ) ) ( OBJ-AT ?auto_1177 ?auto_1178 ) ( not ( = ?auto_1174 ?auto_1176 ) ) ( not ( = ?auto_1174 ?auto_1177 ) ) ( not ( = ?auto_1176 ?auto_1177 ) ) ( IN-CITY ?auto_1180 ?auto_1181 ) ( not ( = ?auto_1175 ?auto_1180 ) ) ( not ( = ?auto_1178 ?auto_1180 ) ) ( OBJ-AT ?auto_1176 ?auto_1180 ) ( OBJ-AT ?auto_1174 ?auto_1180 ) ( TRUCK-AT ?auto_1179 ?auto_1175 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1179 ?auto_1175 ?auto_1180 ?auto_1181 )
      ( DELIVER-3PKG ?auto_1174 ?auto_1176 ?auto_1177 ?auto_1175 )
      ( DELIVER-3PKG-VERIFY ?auto_1174 ?auto_1176 ?auto_1177 ?auto_1175 ) )
  )

)

