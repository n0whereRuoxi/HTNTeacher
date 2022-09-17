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
      ?auto_1304 - OBJ
      ?auto_1303 - LOCATION
    )
    :vars
    (
      ?auto_1306 - LOCATION
      ?auto_1307 - CITY
      ?auto_1305 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1306 ?auto_1307 ) ( IN-CITY ?auto_1303 ?auto_1307 ) ( not ( = ?auto_1303 ?auto_1306 ) ) ( OBJ-AT ?auto_1304 ?auto_1306 ) ( TRUCK-AT ?auto_1305 ?auto_1303 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1305 ?auto_1303 ?auto_1306 ?auto_1307 )
      ( !LOAD-TRUCK ?auto_1304 ?auto_1305 ?auto_1306 )
      ( !DRIVE-TRUCK ?auto_1305 ?auto_1306 ?auto_1303 ?auto_1307 )
      ( !UNLOAD-TRUCK ?auto_1304 ?auto_1305 ?auto_1303 )
      ( DELIVER-1PKG-VERIFY ?auto_1304 ?auto_1303 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1325 - OBJ
      ?auto_1326 - OBJ
      ?auto_1324 - LOCATION
    )
    :vars
    (
      ?auto_1327 - LOCATION
      ?auto_1329 - CITY
      ?auto_1330 - LOCATION
      ?auto_1328 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1327 ?auto_1329 ) ( IN-CITY ?auto_1324 ?auto_1329 ) ( not ( = ?auto_1324 ?auto_1327 ) ) ( OBJ-AT ?auto_1326 ?auto_1327 ) ( IN-CITY ?auto_1330 ?auto_1329 ) ( not ( = ?auto_1324 ?auto_1330 ) ) ( OBJ-AT ?auto_1325 ?auto_1330 ) ( TRUCK-AT ?auto_1328 ?auto_1324 ) ( not ( = ?auto_1325 ?auto_1326 ) ) ( not ( = ?auto_1327 ?auto_1330 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1325 ?auto_1324 )
      ( DELIVER-1PKG ?auto_1326 ?auto_1324 )
      ( DELIVER-2PKG-VERIFY ?auto_1325 ?auto_1326 ?auto_1324 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1436 - OBJ
      ?auto_1437 - OBJ
      ?auto_1438 - OBJ
      ?auto_1435 - LOCATION
    )
    :vars
    (
      ?auto_1440 - LOCATION
      ?auto_1439 - CITY
      ?auto_1443 - LOCATION
      ?auto_1442 - LOCATION
      ?auto_1441 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1440 ?auto_1439 ) ( IN-CITY ?auto_1435 ?auto_1439 ) ( not ( = ?auto_1435 ?auto_1440 ) ) ( OBJ-AT ?auto_1438 ?auto_1440 ) ( IN-CITY ?auto_1443 ?auto_1439 ) ( not ( = ?auto_1435 ?auto_1443 ) ) ( OBJ-AT ?auto_1437 ?auto_1443 ) ( IN-CITY ?auto_1442 ?auto_1439 ) ( not ( = ?auto_1435 ?auto_1442 ) ) ( OBJ-AT ?auto_1436 ?auto_1442 ) ( TRUCK-AT ?auto_1441 ?auto_1435 ) ( not ( = ?auto_1436 ?auto_1437 ) ) ( not ( = ?auto_1443 ?auto_1442 ) ) ( not ( = ?auto_1436 ?auto_1438 ) ) ( not ( = ?auto_1437 ?auto_1438 ) ) ( not ( = ?auto_1440 ?auto_1443 ) ) ( not ( = ?auto_1440 ?auto_1442 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1436 ?auto_1437 ?auto_1435 )
      ( DELIVER-1PKG ?auto_1438 ?auto_1435 )
      ( DELIVER-3PKG-VERIFY ?auto_1436 ?auto_1437 ?auto_1438 ?auto_1435 ) )
  )

)

