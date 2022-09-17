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
      ?auto_1308 - OBJ
      ?auto_1307 - LOCATION
    )
    :vars
    (
      ?auto_1310 - LOCATION
      ?auto_1311 - CITY
      ?auto_1309 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1310 ?auto_1311 ) ( IN-CITY ?auto_1307 ?auto_1311 ) ( not ( = ?auto_1307 ?auto_1310 ) ) ( OBJ-AT ?auto_1308 ?auto_1310 ) ( TRUCK-AT ?auto_1309 ?auto_1307 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1309 ?auto_1307 ?auto_1310 ?auto_1311 )
      ( !LOAD-TRUCK ?auto_1308 ?auto_1309 ?auto_1310 )
      ( !DRIVE-TRUCK ?auto_1309 ?auto_1310 ?auto_1307 ?auto_1311 )
      ( !UNLOAD-TRUCK ?auto_1308 ?auto_1309 ?auto_1307 )
      ( DELIVER-1PKG-VERIFY ?auto_1308 ?auto_1307 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1329 - OBJ
      ?auto_1330 - OBJ
      ?auto_1328 - LOCATION
    )
    :vars
    (
      ?auto_1332 - LOCATION
      ?auto_1331 - CITY
      ?auto_1334 - LOCATION
      ?auto_1333 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1332 ?auto_1331 ) ( IN-CITY ?auto_1328 ?auto_1331 ) ( not ( = ?auto_1328 ?auto_1332 ) ) ( OBJ-AT ?auto_1330 ?auto_1332 ) ( IN-CITY ?auto_1334 ?auto_1331 ) ( not ( = ?auto_1328 ?auto_1334 ) ) ( OBJ-AT ?auto_1329 ?auto_1334 ) ( TRUCK-AT ?auto_1333 ?auto_1328 ) ( not ( = ?auto_1329 ?auto_1330 ) ) ( not ( = ?auto_1332 ?auto_1334 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1329 ?auto_1328 )
      ( DELIVER-1PKG ?auto_1330 ?auto_1328 )
      ( DELIVER-2PKG-VERIFY ?auto_1329 ?auto_1330 ?auto_1328 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1439 - OBJ
      ?auto_1440 - OBJ
      ?auto_1441 - OBJ
      ?auto_1438 - LOCATION
    )
    :vars
    (
      ?auto_1444 - LOCATION
      ?auto_1443 - CITY
      ?auto_1445 - LOCATION
      ?auto_1442 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1444 ?auto_1443 ) ( IN-CITY ?auto_1438 ?auto_1443 ) ( not ( = ?auto_1438 ?auto_1444 ) ) ( OBJ-AT ?auto_1441 ?auto_1444 ) ( OBJ-AT ?auto_1440 ?auto_1444 ) ( IN-CITY ?auto_1445 ?auto_1443 ) ( not ( = ?auto_1438 ?auto_1445 ) ) ( OBJ-AT ?auto_1439 ?auto_1445 ) ( TRUCK-AT ?auto_1442 ?auto_1438 ) ( not ( = ?auto_1439 ?auto_1440 ) ) ( not ( = ?auto_1444 ?auto_1445 ) ) ( not ( = ?auto_1439 ?auto_1441 ) ) ( not ( = ?auto_1440 ?auto_1441 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1439 ?auto_1440 ?auto_1438 )
      ( DELIVER-1PKG ?auto_1441 ?auto_1438 )
      ( DELIVER-3PKG-VERIFY ?auto_1439 ?auto_1440 ?auto_1441 ?auto_1438 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1469 - OBJ
      ?auto_1470 - OBJ
      ?auto_1471 - OBJ
      ?auto_1468 - LOCATION
    )
    :vars
    (
      ?auto_1473 - LOCATION
      ?auto_1472 - CITY
      ?auto_1474 - LOCATION
      ?auto_1475 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1473 ?auto_1472 ) ( IN-CITY ?auto_1468 ?auto_1472 ) ( not ( = ?auto_1468 ?auto_1473 ) ) ( OBJ-AT ?auto_1471 ?auto_1473 ) ( OBJ-AT ?auto_1469 ?auto_1473 ) ( IN-CITY ?auto_1474 ?auto_1472 ) ( not ( = ?auto_1468 ?auto_1474 ) ) ( OBJ-AT ?auto_1470 ?auto_1474 ) ( TRUCK-AT ?auto_1475 ?auto_1468 ) ( not ( = ?auto_1470 ?auto_1469 ) ) ( not ( = ?auto_1473 ?auto_1474 ) ) ( not ( = ?auto_1470 ?auto_1471 ) ) ( not ( = ?auto_1469 ?auto_1471 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1470 ?auto_1469 ?auto_1471 ?auto_1468 )
      ( DELIVER-3PKG-VERIFY ?auto_1469 ?auto_1470 ?auto_1471 ?auto_1468 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1486 - OBJ
      ?auto_1487 - OBJ
      ?auto_1488 - OBJ
      ?auto_1485 - LOCATION
    )
    :vars
    (
      ?auto_1489 - LOCATION
      ?auto_1492 - CITY
      ?auto_1491 - LOCATION
      ?auto_1490 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1489 ?auto_1492 ) ( IN-CITY ?auto_1485 ?auto_1492 ) ( not ( = ?auto_1485 ?auto_1489 ) ) ( OBJ-AT ?auto_1487 ?auto_1489 ) ( OBJ-AT ?auto_1486 ?auto_1489 ) ( IN-CITY ?auto_1491 ?auto_1492 ) ( not ( = ?auto_1485 ?auto_1491 ) ) ( OBJ-AT ?auto_1488 ?auto_1491 ) ( TRUCK-AT ?auto_1490 ?auto_1485 ) ( not ( = ?auto_1488 ?auto_1486 ) ) ( not ( = ?auto_1489 ?auto_1491 ) ) ( not ( = ?auto_1488 ?auto_1487 ) ) ( not ( = ?auto_1486 ?auto_1487 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1486 ?auto_1488 ?auto_1487 ?auto_1485 )
      ( DELIVER-3PKG-VERIFY ?auto_1486 ?auto_1487 ?auto_1488 ?auto_1485 ) )
  )

)

