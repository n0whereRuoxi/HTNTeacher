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
      ?auto_482 - OBJ
      ?auto_483 - LOCATION
    )
    :vars
    (
      ?auto_492 - LOCATION
      ?auto_489 - CITY
      ?auto_484 - TRUCK
      ?auto_495 - LOCATION
      ?auto_496 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_492 ?auto_489 ) ( IN-CITY ?auto_483 ?auto_489 ) ( not ( = ?auto_483 ?auto_492 ) ) ( OBJ-AT ?auto_482 ?auto_492 ) ( TRUCK-AT ?auto_484 ?auto_495 ) ( IN-CITY ?auto_495 ?auto_496 ) ( IN-CITY ?auto_492 ?auto_496 ) ( not ( = ?auto_492 ?auto_495 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_484 ?auto_495 ?auto_492 ?auto_496 )
      ( !LOAD-TRUCK ?auto_482 ?auto_484 ?auto_492 )
      ( !DRIVE-TRUCK ?auto_484 ?auto_492 ?auto_483 ?auto_489 )
      ( !UNLOAD-TRUCK ?auto_482 ?auto_484 ?auto_483 )
      ( DELIVER-1PKG-VERIFY ?auto_482 ?auto_483 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_519 - OBJ
      ?auto_521 - OBJ
      ?auto_523 - LOCATION
    )
    :vars
    (
      ?auto_528 - LOCATION
      ?auto_524 - CITY
      ?auto_522 - CITY
      ?auto_535 - LOCATION
      ?auto_530 - CITY
      ?auto_525 - TRUCK
      ?auto_529 - LOCATION
      ?auto_532 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_521 ?auto_519 ) ( IN-CITY ?auto_528 ?auto_524 ) ( IN-CITY ?auto_523 ?auto_524 ) ( not ( = ?auto_523 ?auto_528 ) ) ( OBJ-AT ?auto_521 ?auto_528 ) ( IN-CITY ?auto_523 ?auto_522 ) ( IN-CITY ?auto_528 ?auto_522 ) ( IN-CITY ?auto_535 ?auto_530 ) ( IN-CITY ?auto_523 ?auto_530 ) ( not ( = ?auto_523 ?auto_535 ) ) ( OBJ-AT ?auto_519 ?auto_535 ) ( TRUCK-AT ?auto_525 ?auto_529 ) ( IN-CITY ?auto_529 ?auto_532 ) ( IN-CITY ?auto_535 ?auto_532 ) ( not ( = ?auto_535 ?auto_529 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_519 ?auto_523 )
      ( DELIVER-1PKG ?auto_521 ?auto_523 )
      ( DELIVER-2PKG-VERIFY ?auto_519 ?auto_521 ?auto_523 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_558 - OBJ
      ?auto_560 - OBJ
      ?auto_561 - OBJ
      ?auto_566 - LOCATION
    )
    :vars
    (
      ?auto_568 - LOCATION
      ?auto_563 - CITY
      ?auto_562 - CITY
      ?auto_578 - LOCATION
      ?auto_576 - CITY
      ?auto_577 - CITY
      ?auto_573 - LOCATION
      ?auto_570 - CITY
      ?auto_567 - TRUCK
      ?auto_571 - LOCATION
      ?auto_574 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_560 ?auto_558 ) ( GREATER-THAN ?auto_561 ?auto_558 ) ( GREATER-THAN ?auto_561 ?auto_560 ) ( IN-CITY ?auto_568 ?auto_563 ) ( IN-CITY ?auto_566 ?auto_563 ) ( not ( = ?auto_566 ?auto_568 ) ) ( OBJ-AT ?auto_561 ?auto_568 ) ( IN-CITY ?auto_566 ?auto_562 ) ( IN-CITY ?auto_568 ?auto_562 ) ( IN-CITY ?auto_578 ?auto_576 ) ( IN-CITY ?auto_566 ?auto_576 ) ( not ( = ?auto_566 ?auto_578 ) ) ( OBJ-AT ?auto_560 ?auto_578 ) ( IN-CITY ?auto_566 ?auto_577 ) ( IN-CITY ?auto_578 ?auto_577 ) ( IN-CITY ?auto_573 ?auto_570 ) ( IN-CITY ?auto_566 ?auto_570 ) ( not ( = ?auto_566 ?auto_573 ) ) ( OBJ-AT ?auto_558 ?auto_573 ) ( TRUCK-AT ?auto_567 ?auto_571 ) ( IN-CITY ?auto_571 ?auto_574 ) ( IN-CITY ?auto_573 ?auto_574 ) ( not ( = ?auto_573 ?auto_571 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_558 ?auto_560 ?auto_566 )
      ( DELIVER-1PKG ?auto_561 ?auto_566 )
      ( DELIVER-3PKG-VERIFY ?auto_558 ?auto_560 ?auto_561 ?auto_566 ) )
  )

)

