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
      ?auto_1050 - OBJ
      ?auto_1049 - LOCATION
    )
    :vars
    (
      ?auto_1052 - LOCATION
      ?auto_1053 - CITY
      ?auto_1051 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1052 ?auto_1053 ) ( IN-CITY ?auto_1049 ?auto_1053 ) ( not ( = ?auto_1049 ?auto_1052 ) ) ( OBJ-AT ?auto_1050 ?auto_1052 ) ( TRUCK-AT ?auto_1051 ?auto_1049 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1051 ?auto_1049 ?auto_1052 ?auto_1053 )
      ( !LOAD-TRUCK ?auto_1050 ?auto_1051 ?auto_1052 )
      ( !DRIVE-TRUCK ?auto_1051 ?auto_1052 ?auto_1049 ?auto_1053 )
      ( !UNLOAD-TRUCK ?auto_1050 ?auto_1051 ?auto_1049 )
      ( DELIVER-1PKG-VERIFY ?auto_1050 ?auto_1049 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1071 - OBJ
      ?auto_1072 - OBJ
      ?auto_1070 - LOCATION
    )
    :vars
    (
      ?auto_1074 - LOCATION
      ?auto_1075 - CITY
      ?auto_1073 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1074 ?auto_1075 ) ( IN-CITY ?auto_1070 ?auto_1075 ) ( not ( = ?auto_1070 ?auto_1074 ) ) ( OBJ-AT ?auto_1072 ?auto_1074 ) ( OBJ-AT ?auto_1071 ?auto_1074 ) ( TRUCK-AT ?auto_1073 ?auto_1070 ) ( not ( = ?auto_1071 ?auto_1072 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1071 ?auto_1070 )
      ( DELIVER-1PKG ?auto_1072 ?auto_1070 )
      ( DELIVER-2PKG-VERIFY ?auto_1071 ?auto_1072 ?auto_1070 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1178 - OBJ
      ?auto_1179 - OBJ
      ?auto_1180 - OBJ
      ?auto_1177 - LOCATION
    )
    :vars
    (
      ?auto_1183 - LOCATION
      ?auto_1181 - CITY
      ?auto_1182 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1183 ?auto_1181 ) ( IN-CITY ?auto_1177 ?auto_1181 ) ( not ( = ?auto_1177 ?auto_1183 ) ) ( OBJ-AT ?auto_1180 ?auto_1183 ) ( OBJ-AT ?auto_1179 ?auto_1183 ) ( OBJ-AT ?auto_1178 ?auto_1183 ) ( TRUCK-AT ?auto_1182 ?auto_1177 ) ( not ( = ?auto_1178 ?auto_1179 ) ) ( not ( = ?auto_1178 ?auto_1180 ) ) ( not ( = ?auto_1179 ?auto_1180 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1178 ?auto_1179 ?auto_1177 )
      ( DELIVER-1PKG ?auto_1180 ?auto_1177 )
      ( DELIVER-3PKG-VERIFY ?auto_1178 ?auto_1179 ?auto_1180 ?auto_1177 ) )
  )

)

