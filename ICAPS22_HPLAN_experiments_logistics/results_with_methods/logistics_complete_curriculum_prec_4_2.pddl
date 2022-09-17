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
      ?auto_920 - OBJ
      ?auto_921 - LOCATION
    )
    :vars
    (
      ?auto_922 - TRUCK
      ?auto_923 - LOCATION
      ?auto_924 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_922 ?auto_923 ) ( IN-CITY ?auto_923 ?auto_924 ) ( IN-CITY ?auto_921 ?auto_924 ) ( not ( = ?auto_921 ?auto_923 ) ) ( OBJ-AT ?auto_920 ?auto_923 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_920 ?auto_922 ?auto_923 )
      ( !DRIVE-TRUCK ?auto_922 ?auto_923 ?auto_921 ?auto_924 )
      ( !UNLOAD-TRUCK ?auto_920 ?auto_922 ?auto_921 )
      ( DELIVER-1PKG-VERIFY ?auto_920 ?auto_921 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_927 - OBJ
      ?auto_928 - LOCATION
    )
    :vars
    (
      ?auto_929 - LOCATION
      ?auto_930 - CITY
      ?auto_931 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_929 ?auto_930 ) ( IN-CITY ?auto_928 ?auto_930 ) ( not ( = ?auto_928 ?auto_929 ) ) ( OBJ-AT ?auto_927 ?auto_929 ) ( TRUCK-AT ?auto_931 ?auto_928 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_931 ?auto_928 ?auto_929 ?auto_930 )
      ( DELIVER-1PKG ?auto_927 ?auto_928 )
      ( DELIVER-1PKG-VERIFY ?auto_927 ?auto_928 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_934 - OBJ
      ?auto_935 - LOCATION
    )
    :vars
    (
      ?auto_936 - TRUCK
      ?auto_937 - LOCATION
      ?auto_938 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_936 ?auto_937 ) ( IN-CITY ?auto_937 ?auto_938 ) ( IN-CITY ?auto_935 ?auto_938 ) ( not ( = ?auto_935 ?auto_937 ) ) ( OBJ-AT ?auto_934 ?auto_937 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_934 ?auto_936 ?auto_937 )
      ( !DRIVE-TRUCK ?auto_936 ?auto_937 ?auto_935 ?auto_938 )
      ( !UNLOAD-TRUCK ?auto_934 ?auto_936 ?auto_935 )
      ( DELIVER-1PKG-VERIFY ?auto_934 ?auto_935 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_941 - OBJ
      ?auto_942 - LOCATION
    )
    :vars
    (
      ?auto_944 - LOCATION
      ?auto_943 - CITY
      ?auto_945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_944 ?auto_943 ) ( IN-CITY ?auto_942 ?auto_943 ) ( not ( = ?auto_942 ?auto_944 ) ) ( OBJ-AT ?auto_941 ?auto_944 ) ( TRUCK-AT ?auto_945 ?auto_942 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_945 ?auto_942 ?auto_944 ?auto_943 )
      ( DELIVER-1PKG ?auto_941 ?auto_942 )
      ( DELIVER-1PKG-VERIFY ?auto_941 ?auto_942 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_949 - OBJ
      ?auto_951 - OBJ
      ?auto_950 - LOCATION
    )
    :vars
    (
      ?auto_952 - LOCATION
      ?auto_953 - CITY
      ?auto_954 - TRUCK
      ?auto_955 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_951 ?auto_949 ) ( IN-CITY ?auto_952 ?auto_953 ) ( IN-CITY ?auto_950 ?auto_953 ) ( not ( = ?auto_950 ?auto_952 ) ) ( OBJ-AT ?auto_951 ?auto_952 ) ( TRUCK-AT ?auto_954 ?auto_955 ) ( IN-CITY ?auto_955 ?auto_953 ) ( not ( = ?auto_950 ?auto_955 ) ) ( OBJ-AT ?auto_949 ?auto_955 ) ( not ( = ?auto_949 ?auto_951 ) ) ( not ( = ?auto_952 ?auto_955 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_949 ?auto_950 )
      ( DELIVER-1PKG ?auto_951 ?auto_950 )
      ( DELIVER-2PKG-VERIFY ?auto_949 ?auto_951 ?auto_950 ) )
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
      ?auto_965 - LOCATION
      ?auto_962 - CITY
      ?auto_963 - LOCATION
      ?auto_964 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_961 ?auto_959 ) ( IN-CITY ?auto_965 ?auto_962 ) ( IN-CITY ?auto_960 ?auto_962 ) ( not ( = ?auto_960 ?auto_965 ) ) ( OBJ-AT ?auto_961 ?auto_965 ) ( IN-CITY ?auto_963 ?auto_962 ) ( not ( = ?auto_960 ?auto_963 ) ) ( OBJ-AT ?auto_959 ?auto_963 ) ( not ( = ?auto_959 ?auto_961 ) ) ( not ( = ?auto_965 ?auto_963 ) ) ( TRUCK-AT ?auto_964 ?auto_960 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_964 ?auto_960 ?auto_963 ?auto_962 )
      ( DELIVER-2PKG ?auto_959 ?auto_961 ?auto_960 )
      ( DELIVER-2PKG-VERIFY ?auto_959 ?auto_961 ?auto_960 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_968 - OBJ
      ?auto_969 - LOCATION
    )
    :vars
    (
      ?auto_970 - TRUCK
      ?auto_971 - LOCATION
      ?auto_972 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_970 ?auto_971 ) ( IN-CITY ?auto_971 ?auto_972 ) ( IN-CITY ?auto_969 ?auto_972 ) ( not ( = ?auto_969 ?auto_971 ) ) ( OBJ-AT ?auto_968 ?auto_971 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_968 ?auto_970 ?auto_971 )
      ( !DRIVE-TRUCK ?auto_970 ?auto_971 ?auto_969 ?auto_972 )
      ( !UNLOAD-TRUCK ?auto_968 ?auto_970 ?auto_969 )
      ( DELIVER-1PKG-VERIFY ?auto_968 ?auto_969 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_975 - OBJ
      ?auto_976 - LOCATION
    )
    :vars
    (
      ?auto_977 - LOCATION
      ?auto_979 - CITY
      ?auto_978 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_977 ?auto_979 ) ( IN-CITY ?auto_976 ?auto_979 ) ( not ( = ?auto_976 ?auto_977 ) ) ( OBJ-AT ?auto_975 ?auto_977 ) ( TRUCK-AT ?auto_978 ?auto_976 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_978 ?auto_976 ?auto_977 ?auto_979 )
      ( DELIVER-1PKG ?auto_975 ?auto_976 )
      ( DELIVER-1PKG-VERIFY ?auto_975 ?auto_976 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_984 - OBJ
      ?auto_986 - OBJ
      ?auto_987 - OBJ
      ?auto_985 - LOCATION
    )
    :vars
    (
      ?auto_988 - LOCATION
      ?auto_989 - CITY
      ?auto_990 - TRUCK
      ?auto_991 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_986 ?auto_984 ) ( GREATER-THAN ?auto_987 ?auto_984 ) ( GREATER-THAN ?auto_987 ?auto_986 ) ( IN-CITY ?auto_988 ?auto_989 ) ( IN-CITY ?auto_985 ?auto_989 ) ( not ( = ?auto_985 ?auto_988 ) ) ( OBJ-AT ?auto_987 ?auto_988 ) ( OBJ-AT ?auto_986 ?auto_988 ) ( TRUCK-AT ?auto_990 ?auto_991 ) ( IN-CITY ?auto_991 ?auto_989 ) ( not ( = ?auto_985 ?auto_991 ) ) ( OBJ-AT ?auto_984 ?auto_991 ) ( not ( = ?auto_984 ?auto_986 ) ) ( not ( = ?auto_988 ?auto_991 ) ) ( not ( = ?auto_984 ?auto_987 ) ) ( not ( = ?auto_986 ?auto_987 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_984 ?auto_986 ?auto_985 )
      ( DELIVER-1PKG ?auto_987 ?auto_985 )
      ( DELIVER-3PKG-VERIFY ?auto_984 ?auto_986 ?auto_987 ?auto_985 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_996 - OBJ
      ?auto_998 - OBJ
      ?auto_999 - OBJ
      ?auto_997 - LOCATION
    )
    :vars
    (
      ?auto_1001 - LOCATION
      ?auto_1003 - CITY
      ?auto_1002 - LOCATION
      ?auto_1000 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_998 ?auto_996 ) ( GREATER-THAN ?auto_999 ?auto_996 ) ( GREATER-THAN ?auto_999 ?auto_998 ) ( IN-CITY ?auto_1001 ?auto_1003 ) ( IN-CITY ?auto_997 ?auto_1003 ) ( not ( = ?auto_997 ?auto_1001 ) ) ( OBJ-AT ?auto_999 ?auto_1001 ) ( OBJ-AT ?auto_998 ?auto_1001 ) ( IN-CITY ?auto_1002 ?auto_1003 ) ( not ( = ?auto_997 ?auto_1002 ) ) ( OBJ-AT ?auto_996 ?auto_1002 ) ( not ( = ?auto_996 ?auto_998 ) ) ( not ( = ?auto_1001 ?auto_1002 ) ) ( not ( = ?auto_996 ?auto_999 ) ) ( not ( = ?auto_998 ?auto_999 ) ) ( TRUCK-AT ?auto_1000 ?auto_997 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1000 ?auto_997 ?auto_1002 ?auto_1003 )
      ( DELIVER-3PKG ?auto_996 ?auto_998 ?auto_999 ?auto_997 )
      ( DELIVER-3PKG-VERIFY ?auto_996 ?auto_998 ?auto_999 ?auto_997 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1006 - OBJ
      ?auto_1007 - LOCATION
    )
    :vars
    (
      ?auto_1008 - TRUCK
      ?auto_1009 - LOCATION
      ?auto_1010 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1008 ?auto_1009 ) ( IN-CITY ?auto_1009 ?auto_1010 ) ( IN-CITY ?auto_1007 ?auto_1010 ) ( not ( = ?auto_1007 ?auto_1009 ) ) ( OBJ-AT ?auto_1006 ?auto_1009 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1006 ?auto_1008 ?auto_1009 )
      ( !DRIVE-TRUCK ?auto_1008 ?auto_1009 ?auto_1007 ?auto_1010 )
      ( !UNLOAD-TRUCK ?auto_1006 ?auto_1008 ?auto_1007 )
      ( DELIVER-1PKG-VERIFY ?auto_1006 ?auto_1007 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1013 - OBJ
      ?auto_1014 - LOCATION
    )
    :vars
    (
      ?auto_1016 - LOCATION
      ?auto_1015 - CITY
      ?auto_1017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1016 ?auto_1015 ) ( IN-CITY ?auto_1014 ?auto_1015 ) ( not ( = ?auto_1014 ?auto_1016 ) ) ( OBJ-AT ?auto_1013 ?auto_1016 ) ( TRUCK-AT ?auto_1017 ?auto_1014 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1017 ?auto_1014 ?auto_1016 ?auto_1015 )
      ( DELIVER-1PKG ?auto_1013 ?auto_1014 )
      ( DELIVER-1PKG-VERIFY ?auto_1013 ?auto_1014 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1023 - OBJ
      ?auto_1025 - OBJ
      ?auto_1026 - OBJ
      ?auto_1027 - OBJ
      ?auto_1024 - LOCATION
    )
    :vars
    (
      ?auto_1028 - LOCATION
      ?auto_1029 - CITY
      ?auto_1031 - LOCATION
      ?auto_1030 - TRUCK
      ?auto_1032 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1025 ?auto_1023 ) ( GREATER-THAN ?auto_1026 ?auto_1023 ) ( GREATER-THAN ?auto_1026 ?auto_1025 ) ( GREATER-THAN ?auto_1027 ?auto_1023 ) ( GREATER-THAN ?auto_1027 ?auto_1025 ) ( GREATER-THAN ?auto_1027 ?auto_1026 ) ( IN-CITY ?auto_1028 ?auto_1029 ) ( IN-CITY ?auto_1024 ?auto_1029 ) ( not ( = ?auto_1024 ?auto_1028 ) ) ( OBJ-AT ?auto_1027 ?auto_1028 ) ( IN-CITY ?auto_1031 ?auto_1029 ) ( not ( = ?auto_1024 ?auto_1031 ) ) ( OBJ-AT ?auto_1026 ?auto_1031 ) ( OBJ-AT ?auto_1025 ?auto_1031 ) ( TRUCK-AT ?auto_1030 ?auto_1032 ) ( IN-CITY ?auto_1032 ?auto_1029 ) ( not ( = ?auto_1024 ?auto_1032 ) ) ( OBJ-AT ?auto_1023 ?auto_1032 ) ( not ( = ?auto_1023 ?auto_1025 ) ) ( not ( = ?auto_1031 ?auto_1032 ) ) ( not ( = ?auto_1023 ?auto_1026 ) ) ( not ( = ?auto_1025 ?auto_1026 ) ) ( not ( = ?auto_1023 ?auto_1027 ) ) ( not ( = ?auto_1025 ?auto_1027 ) ) ( not ( = ?auto_1026 ?auto_1027 ) ) ( not ( = ?auto_1028 ?auto_1031 ) ) ( not ( = ?auto_1028 ?auto_1032 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1023 ?auto_1025 ?auto_1026 ?auto_1024 )
      ( DELIVER-1PKG ?auto_1027 ?auto_1024 )
      ( DELIVER-4PKG-VERIFY ?auto_1023 ?auto_1025 ?auto_1026 ?auto_1027 ?auto_1024 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1038 - OBJ
      ?auto_1040 - OBJ
      ?auto_1041 - OBJ
      ?auto_1042 - OBJ
      ?auto_1039 - LOCATION
    )
    :vars
    (
      ?auto_1047 - LOCATION
      ?auto_1043 - CITY
      ?auto_1046 - LOCATION
      ?auto_1045 - LOCATION
      ?auto_1044 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1040 ?auto_1038 ) ( GREATER-THAN ?auto_1041 ?auto_1038 ) ( GREATER-THAN ?auto_1041 ?auto_1040 ) ( GREATER-THAN ?auto_1042 ?auto_1038 ) ( GREATER-THAN ?auto_1042 ?auto_1040 ) ( GREATER-THAN ?auto_1042 ?auto_1041 ) ( IN-CITY ?auto_1047 ?auto_1043 ) ( IN-CITY ?auto_1039 ?auto_1043 ) ( not ( = ?auto_1039 ?auto_1047 ) ) ( OBJ-AT ?auto_1042 ?auto_1047 ) ( IN-CITY ?auto_1046 ?auto_1043 ) ( not ( = ?auto_1039 ?auto_1046 ) ) ( OBJ-AT ?auto_1041 ?auto_1046 ) ( OBJ-AT ?auto_1040 ?auto_1046 ) ( IN-CITY ?auto_1045 ?auto_1043 ) ( not ( = ?auto_1039 ?auto_1045 ) ) ( OBJ-AT ?auto_1038 ?auto_1045 ) ( not ( = ?auto_1038 ?auto_1040 ) ) ( not ( = ?auto_1046 ?auto_1045 ) ) ( not ( = ?auto_1038 ?auto_1041 ) ) ( not ( = ?auto_1040 ?auto_1041 ) ) ( not ( = ?auto_1038 ?auto_1042 ) ) ( not ( = ?auto_1040 ?auto_1042 ) ) ( not ( = ?auto_1041 ?auto_1042 ) ) ( not ( = ?auto_1047 ?auto_1046 ) ) ( not ( = ?auto_1047 ?auto_1045 ) ) ( TRUCK-AT ?auto_1044 ?auto_1039 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1044 ?auto_1039 ?auto_1045 ?auto_1043 )
      ( DELIVER-4PKG ?auto_1038 ?auto_1040 ?auto_1041 ?auto_1042 ?auto_1039 )
      ( DELIVER-4PKG-VERIFY ?auto_1038 ?auto_1040 ?auto_1041 ?auto_1042 ?auto_1039 ) )
  )

)

