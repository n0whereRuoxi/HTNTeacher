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
      ?auto_1382 - OBJ
      ?auto_1383 - LOCATION
    )
    :vars
    (
      ?auto_1392 - LOCATION
      ?auto_1389 - CITY
      ?auto_1384 - TRUCK
      ?auto_1395 - LOCATION
      ?auto_1396 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_1392 ?auto_1389 ) ( IN-CITY ?auto_1383 ?auto_1389 ) ( not ( = ?auto_1383 ?auto_1392 ) ) ( OBJ-AT ?auto_1382 ?auto_1392 ) ( TRUCK-AT ?auto_1384 ?auto_1395 ) ( IN-CITY ?auto_1395 ?auto_1396 ) ( IN-CITY ?auto_1392 ?auto_1396 ) ( not ( = ?auto_1392 ?auto_1395 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1384 ?auto_1395 ?auto_1392 ?auto_1396 )
      ( !LOAD-TRUCK ?auto_1382 ?auto_1384 ?auto_1392 )
      ( !DRIVE-TRUCK ?auto_1384 ?auto_1392 ?auto_1383 ?auto_1389 )
      ( !UNLOAD-TRUCK ?auto_1382 ?auto_1384 ?auto_1383 )
      ( DELIVER-1PKG-VERIFY ?auto_1382 ?auto_1383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1419 - OBJ
      ?auto_1421 - OBJ
      ?auto_1427 - LOCATION
    )
    :vars
    (
      ?auto_1428 - LOCATION
      ?auto_1425 - CITY
      ?auto_1422 - CITY
      ?auto_1431 - LOCATION
      ?auto_1435 - CITY
      ?auto_1424 - TRUCK
      ?auto_1432 - LOCATION
      ?auto_1429 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1421 ?auto_1419 ) ( IN-CITY ?auto_1428 ?auto_1425 ) ( IN-CITY ?auto_1427 ?auto_1425 ) ( not ( = ?auto_1427 ?auto_1428 ) ) ( OBJ-AT ?auto_1421 ?auto_1428 ) ( IN-CITY ?auto_1427 ?auto_1422 ) ( IN-CITY ?auto_1428 ?auto_1422 ) ( IN-CITY ?auto_1431 ?auto_1435 ) ( IN-CITY ?auto_1427 ?auto_1435 ) ( not ( = ?auto_1427 ?auto_1431 ) ) ( OBJ-AT ?auto_1419 ?auto_1431 ) ( TRUCK-AT ?auto_1424 ?auto_1432 ) ( IN-CITY ?auto_1432 ?auto_1429 ) ( IN-CITY ?auto_1431 ?auto_1429 ) ( not ( = ?auto_1431 ?auto_1432 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1419 ?auto_1427 )
      ( DELIVER-1PKG ?auto_1421 ?auto_1427 )
      ( DELIVER-2PKG-VERIFY ?auto_1419 ?auto_1421 ?auto_1427 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1458 - OBJ
      ?auto_1460 - OBJ
      ?auto_1461 - OBJ
      ?auto_1465 - LOCATION
    )
    :vars
    (
      ?auto_1467 - LOCATION
      ?auto_1463 - CITY
      ?auto_1464 - CITY
      ?auto_1469 - LOCATION
      ?auto_1474 - CITY
      ?auto_1473 - CITY
      ?auto_1476 - LOCATION
      ?auto_1478 - CITY
      ?auto_1466 - TRUCK
      ?auto_1479 - LOCATION
      ?auto_1477 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1460 ?auto_1458 ) ( GREATER-THAN ?auto_1461 ?auto_1458 ) ( GREATER-THAN ?auto_1461 ?auto_1460 ) ( IN-CITY ?auto_1467 ?auto_1463 ) ( IN-CITY ?auto_1465 ?auto_1463 ) ( not ( = ?auto_1465 ?auto_1467 ) ) ( OBJ-AT ?auto_1461 ?auto_1467 ) ( IN-CITY ?auto_1465 ?auto_1464 ) ( IN-CITY ?auto_1467 ?auto_1464 ) ( IN-CITY ?auto_1469 ?auto_1474 ) ( IN-CITY ?auto_1465 ?auto_1474 ) ( not ( = ?auto_1465 ?auto_1469 ) ) ( OBJ-AT ?auto_1460 ?auto_1469 ) ( IN-CITY ?auto_1465 ?auto_1473 ) ( IN-CITY ?auto_1469 ?auto_1473 ) ( IN-CITY ?auto_1476 ?auto_1478 ) ( IN-CITY ?auto_1465 ?auto_1478 ) ( not ( = ?auto_1465 ?auto_1476 ) ) ( OBJ-AT ?auto_1458 ?auto_1476 ) ( TRUCK-AT ?auto_1466 ?auto_1479 ) ( IN-CITY ?auto_1479 ?auto_1477 ) ( IN-CITY ?auto_1476 ?auto_1477 ) ( not ( = ?auto_1476 ?auto_1479 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1458 ?auto_1460 ?auto_1465 )
      ( DELIVER-1PKG ?auto_1461 ?auto_1465 )
      ( DELIVER-3PKG-VERIFY ?auto_1458 ?auto_1460 ?auto_1461 ?auto_1465 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1503 - OBJ
      ?auto_1505 - OBJ
      ?auto_1506 - OBJ
      ?auto_1507 - OBJ
      ?auto_1508 - LOCATION
    )
    :vars
    (
      ?auto_1510 - LOCATION
      ?auto_1513 - CITY
      ?auto_1512 - CITY
      ?auto_1520 - LOCATION
      ?auto_1515 - CITY
      ?auto_1518 - CITY
      ?auto_1517 - LOCATION
      ?auto_1526 - CITY
      ?auto_1527 - CITY
      ?auto_1528 - LOCATION
      ?auto_1516 - CITY
      ?auto_1509 - TRUCK
      ?auto_1522 - LOCATION
      ?auto_1519 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1505 ?auto_1503 ) ( GREATER-THAN ?auto_1506 ?auto_1503 ) ( GREATER-THAN ?auto_1506 ?auto_1505 ) ( GREATER-THAN ?auto_1507 ?auto_1503 ) ( GREATER-THAN ?auto_1507 ?auto_1505 ) ( GREATER-THAN ?auto_1507 ?auto_1506 ) ( IN-CITY ?auto_1510 ?auto_1513 ) ( IN-CITY ?auto_1508 ?auto_1513 ) ( not ( = ?auto_1508 ?auto_1510 ) ) ( OBJ-AT ?auto_1507 ?auto_1510 ) ( IN-CITY ?auto_1508 ?auto_1512 ) ( IN-CITY ?auto_1510 ?auto_1512 ) ( IN-CITY ?auto_1520 ?auto_1515 ) ( IN-CITY ?auto_1508 ?auto_1515 ) ( not ( = ?auto_1508 ?auto_1520 ) ) ( OBJ-AT ?auto_1506 ?auto_1520 ) ( IN-CITY ?auto_1508 ?auto_1518 ) ( IN-CITY ?auto_1520 ?auto_1518 ) ( IN-CITY ?auto_1517 ?auto_1526 ) ( IN-CITY ?auto_1508 ?auto_1526 ) ( not ( = ?auto_1508 ?auto_1517 ) ) ( OBJ-AT ?auto_1505 ?auto_1517 ) ( IN-CITY ?auto_1508 ?auto_1527 ) ( IN-CITY ?auto_1517 ?auto_1527 ) ( IN-CITY ?auto_1528 ?auto_1516 ) ( IN-CITY ?auto_1508 ?auto_1516 ) ( not ( = ?auto_1508 ?auto_1528 ) ) ( OBJ-AT ?auto_1503 ?auto_1528 ) ( TRUCK-AT ?auto_1509 ?auto_1522 ) ( IN-CITY ?auto_1522 ?auto_1519 ) ( IN-CITY ?auto_1528 ?auto_1519 ) ( not ( = ?auto_1528 ?auto_1522 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1503 ?auto_1505 ?auto_1506 ?auto_1508 )
      ( DELIVER-1PKG ?auto_1507 ?auto_1508 )
      ( DELIVER-4PKG-VERIFY ?auto_1503 ?auto_1505 ?auto_1506 ?auto_1507 ?auto_1508 ) )
  )

)

