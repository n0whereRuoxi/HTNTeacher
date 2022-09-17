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
      ?auto_932 - OBJ
      ?auto_933 - LOCATION
    )
    :vars
    (
      ?auto_942 - LOCATION
      ?auto_939 - CITY
      ?auto_934 - TRUCK
      ?auto_945 - LOCATION
      ?auto_946 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_942 ?auto_939 ) ( IN-CITY ?auto_933 ?auto_939 ) ( not ( = ?auto_933 ?auto_942 ) ) ( OBJ-AT ?auto_932 ?auto_942 ) ( TRUCK-AT ?auto_934 ?auto_945 ) ( IN-CITY ?auto_945 ?auto_946 ) ( IN-CITY ?auto_942 ?auto_946 ) ( not ( = ?auto_942 ?auto_945 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_934 ?auto_945 ?auto_942 ?auto_946 )
      ( !LOAD-TRUCK ?auto_932 ?auto_934 ?auto_942 )
      ( !DRIVE-TRUCK ?auto_934 ?auto_942 ?auto_933 ?auto_939 )
      ( !UNLOAD-TRUCK ?auto_932 ?auto_934 ?auto_933 )
      ( DELIVER-1PKG-VERIFY ?auto_932 ?auto_933 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_969 - OBJ
      ?auto_971 - OBJ
      ?auto_977 - LOCATION
    )
    :vars
    (
      ?auto_973 - LOCATION
      ?auto_974 - CITY
      ?auto_972 - CITY
      ?auto_982 - LOCATION
      ?auto_984 - CITY
      ?auto_975 - TRUCK
      ?auto_985 - LOCATION
      ?auto_980 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_971 ?auto_969 ) ( IN-CITY ?auto_973 ?auto_974 ) ( IN-CITY ?auto_977 ?auto_974 ) ( not ( = ?auto_977 ?auto_973 ) ) ( OBJ-AT ?auto_971 ?auto_973 ) ( IN-CITY ?auto_977 ?auto_972 ) ( IN-CITY ?auto_973 ?auto_972 ) ( IN-CITY ?auto_982 ?auto_984 ) ( IN-CITY ?auto_977 ?auto_984 ) ( not ( = ?auto_977 ?auto_982 ) ) ( OBJ-AT ?auto_969 ?auto_982 ) ( TRUCK-AT ?auto_975 ?auto_985 ) ( IN-CITY ?auto_985 ?auto_980 ) ( IN-CITY ?auto_982 ?auto_980 ) ( not ( = ?auto_982 ?auto_985 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_969 ?auto_977 )
      ( DELIVER-1PKG ?auto_971 ?auto_977 )
      ( DELIVER-2PKG-VERIFY ?auto_969 ?auto_971 ?auto_977 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1008 - OBJ
      ?auto_1010 - OBJ
      ?auto_1011 - OBJ
      ?auto_1013 - LOCATION
    )
    :vars
    (
      ?auto_1016 - LOCATION
      ?auto_1015 - CITY
      ?auto_1017 - CITY
      ?auto_1021 - LOCATION
      ?auto_1029 - CITY
      ?auto_1019 - CITY
      ?auto_1026 - LOCATION
      ?auto_1025 - CITY
      ?auto_1014 - TRUCK
      ?auto_1024 - LOCATION
      ?auto_1023 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1010 ?auto_1008 ) ( GREATER-THAN ?auto_1011 ?auto_1008 ) ( GREATER-THAN ?auto_1011 ?auto_1010 ) ( IN-CITY ?auto_1016 ?auto_1015 ) ( IN-CITY ?auto_1013 ?auto_1015 ) ( not ( = ?auto_1013 ?auto_1016 ) ) ( OBJ-AT ?auto_1011 ?auto_1016 ) ( IN-CITY ?auto_1013 ?auto_1017 ) ( IN-CITY ?auto_1016 ?auto_1017 ) ( IN-CITY ?auto_1021 ?auto_1029 ) ( IN-CITY ?auto_1013 ?auto_1029 ) ( not ( = ?auto_1013 ?auto_1021 ) ) ( OBJ-AT ?auto_1010 ?auto_1021 ) ( IN-CITY ?auto_1013 ?auto_1019 ) ( IN-CITY ?auto_1021 ?auto_1019 ) ( IN-CITY ?auto_1026 ?auto_1025 ) ( IN-CITY ?auto_1013 ?auto_1025 ) ( not ( = ?auto_1013 ?auto_1026 ) ) ( OBJ-AT ?auto_1008 ?auto_1026 ) ( TRUCK-AT ?auto_1014 ?auto_1024 ) ( IN-CITY ?auto_1024 ?auto_1023 ) ( IN-CITY ?auto_1026 ?auto_1023 ) ( not ( = ?auto_1026 ?auto_1024 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1008 ?auto_1010 ?auto_1013 )
      ( DELIVER-1PKG ?auto_1011 ?auto_1013 )
      ( DELIVER-3PKG-VERIFY ?auto_1008 ?auto_1010 ?auto_1011 ?auto_1013 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1053 - OBJ
      ?auto_1055 - OBJ
      ?auto_1056 - OBJ
      ?auto_1057 - OBJ
      ?auto_1062 - LOCATION
    )
    :vars
    (
      ?auto_1059 - LOCATION
      ?auto_1061 - CITY
      ?auto_1064 - CITY
      ?auto_1065 - LOCATION
      ?auto_1070 - CITY
      ?auto_1072 - CITY
      ?auto_1074 - LOCATION
      ?auto_1067 - CITY
      ?auto_1071 - CITY
      ?auto_1078 - LOCATION
      ?auto_1075 - CITY
      ?auto_1063 - TRUCK
      ?auto_1076 - LOCATION
      ?auto_1077 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1055 ?auto_1053 ) ( GREATER-THAN ?auto_1056 ?auto_1053 ) ( GREATER-THAN ?auto_1056 ?auto_1055 ) ( GREATER-THAN ?auto_1057 ?auto_1053 ) ( GREATER-THAN ?auto_1057 ?auto_1055 ) ( GREATER-THAN ?auto_1057 ?auto_1056 ) ( IN-CITY ?auto_1059 ?auto_1061 ) ( IN-CITY ?auto_1062 ?auto_1061 ) ( not ( = ?auto_1062 ?auto_1059 ) ) ( OBJ-AT ?auto_1057 ?auto_1059 ) ( IN-CITY ?auto_1062 ?auto_1064 ) ( IN-CITY ?auto_1059 ?auto_1064 ) ( IN-CITY ?auto_1065 ?auto_1070 ) ( IN-CITY ?auto_1062 ?auto_1070 ) ( not ( = ?auto_1062 ?auto_1065 ) ) ( OBJ-AT ?auto_1056 ?auto_1065 ) ( IN-CITY ?auto_1062 ?auto_1072 ) ( IN-CITY ?auto_1065 ?auto_1072 ) ( IN-CITY ?auto_1074 ?auto_1067 ) ( IN-CITY ?auto_1062 ?auto_1067 ) ( not ( = ?auto_1062 ?auto_1074 ) ) ( OBJ-AT ?auto_1055 ?auto_1074 ) ( IN-CITY ?auto_1062 ?auto_1071 ) ( IN-CITY ?auto_1074 ?auto_1071 ) ( IN-CITY ?auto_1078 ?auto_1075 ) ( IN-CITY ?auto_1062 ?auto_1075 ) ( not ( = ?auto_1062 ?auto_1078 ) ) ( OBJ-AT ?auto_1053 ?auto_1078 ) ( TRUCK-AT ?auto_1063 ?auto_1076 ) ( IN-CITY ?auto_1076 ?auto_1077 ) ( IN-CITY ?auto_1078 ?auto_1077 ) ( not ( = ?auto_1078 ?auto_1076 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1053 ?auto_1055 ?auto_1056 ?auto_1062 )
      ( DELIVER-1PKG ?auto_1057 ?auto_1062 )
      ( DELIVER-4PKG-VERIFY ?auto_1053 ?auto_1055 ?auto_1056 ?auto_1057 ?auto_1062 ) )
  )

)

