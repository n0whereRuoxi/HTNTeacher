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

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16462 - OBJ
      ?auto_16461 - LOCATION
    )
    :vars
    (
      ?auto_16464 - LOCATION
      ?auto_16465 - CITY
      ?auto_16463 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16464 ?auto_16465 ) ( IN-CITY ?auto_16461 ?auto_16465 ) ( not ( = ?auto_16461 ?auto_16464 ) ) ( OBJ-AT ?auto_16462 ?auto_16464 ) ( TRUCK-AT ?auto_16463 ?auto_16461 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16463 ?auto_16461 ?auto_16464 ?auto_16465 )
      ( !LOAD-TRUCK ?auto_16462 ?auto_16463 ?auto_16464 )
      ( !DRIVE-TRUCK ?auto_16463 ?auto_16464 ?auto_16461 ?auto_16465 )
      ( !UNLOAD-TRUCK ?auto_16462 ?auto_16463 ?auto_16461 )
      ( DELIVER-1PKG-VERIFY ?auto_16462 ?auto_16461 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16483 - OBJ
      ?auto_16484 - OBJ
      ?auto_16482 - LOCATION
    )
    :vars
    (
      ?auto_16486 - LOCATION
      ?auto_16485 - CITY
      ?auto_16488 - LOCATION
      ?auto_16487 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16486 ?auto_16485 ) ( IN-CITY ?auto_16482 ?auto_16485 ) ( not ( = ?auto_16482 ?auto_16486 ) ) ( OBJ-AT ?auto_16484 ?auto_16486 ) ( IN-CITY ?auto_16488 ?auto_16485 ) ( not ( = ?auto_16482 ?auto_16488 ) ) ( OBJ-AT ?auto_16483 ?auto_16488 ) ( TRUCK-AT ?auto_16487 ?auto_16482 ) ( not ( = ?auto_16483 ?auto_16484 ) ) ( not ( = ?auto_16486 ?auto_16488 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16483 ?auto_16482 )
      ( DELIVER-1PKG ?auto_16484 ?auto_16482 )
      ( DELIVER-2PKG-VERIFY ?auto_16483 ?auto_16484 ?auto_16482 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16594 - OBJ
      ?auto_16595 - OBJ
      ?auto_16596 - OBJ
      ?auto_16593 - LOCATION
    )
    :vars
    (
      ?auto_16597 - LOCATION
      ?auto_16598 - CITY
      ?auto_16600 - LOCATION
      ?auto_16601 - LOCATION
      ?auto_16599 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16597 ?auto_16598 ) ( IN-CITY ?auto_16593 ?auto_16598 ) ( not ( = ?auto_16593 ?auto_16597 ) ) ( OBJ-AT ?auto_16596 ?auto_16597 ) ( IN-CITY ?auto_16600 ?auto_16598 ) ( not ( = ?auto_16593 ?auto_16600 ) ) ( OBJ-AT ?auto_16595 ?auto_16600 ) ( IN-CITY ?auto_16601 ?auto_16598 ) ( not ( = ?auto_16593 ?auto_16601 ) ) ( OBJ-AT ?auto_16594 ?auto_16601 ) ( TRUCK-AT ?auto_16599 ?auto_16593 ) ( not ( = ?auto_16594 ?auto_16595 ) ) ( not ( = ?auto_16600 ?auto_16601 ) ) ( not ( = ?auto_16594 ?auto_16596 ) ) ( not ( = ?auto_16595 ?auto_16596 ) ) ( not ( = ?auto_16597 ?auto_16600 ) ) ( not ( = ?auto_16597 ?auto_16601 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16594 ?auto_16595 ?auto_16593 )
      ( DELIVER-1PKG ?auto_16596 ?auto_16593 )
      ( DELIVER-3PKG-VERIFY ?auto_16594 ?auto_16595 ?auto_16596 ?auto_16593 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17737 - OBJ
      ?auto_17738 - OBJ
      ?auto_17739 - OBJ
      ?auto_17740 - OBJ
      ?auto_17736 - LOCATION
    )
    :vars
    (
      ?auto_17743 - LOCATION
      ?auto_17742 - CITY
      ?auto_17746 - LOCATION
      ?auto_17744 - LOCATION
      ?auto_17745 - LOCATION
      ?auto_17741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17743 ?auto_17742 ) ( IN-CITY ?auto_17736 ?auto_17742 ) ( not ( = ?auto_17736 ?auto_17743 ) ) ( OBJ-AT ?auto_17740 ?auto_17743 ) ( IN-CITY ?auto_17746 ?auto_17742 ) ( not ( = ?auto_17736 ?auto_17746 ) ) ( OBJ-AT ?auto_17739 ?auto_17746 ) ( IN-CITY ?auto_17744 ?auto_17742 ) ( not ( = ?auto_17736 ?auto_17744 ) ) ( OBJ-AT ?auto_17738 ?auto_17744 ) ( IN-CITY ?auto_17745 ?auto_17742 ) ( not ( = ?auto_17736 ?auto_17745 ) ) ( OBJ-AT ?auto_17737 ?auto_17745 ) ( TRUCK-AT ?auto_17741 ?auto_17736 ) ( not ( = ?auto_17737 ?auto_17738 ) ) ( not ( = ?auto_17744 ?auto_17745 ) ) ( not ( = ?auto_17737 ?auto_17739 ) ) ( not ( = ?auto_17738 ?auto_17739 ) ) ( not ( = ?auto_17746 ?auto_17744 ) ) ( not ( = ?auto_17746 ?auto_17745 ) ) ( not ( = ?auto_17737 ?auto_17740 ) ) ( not ( = ?auto_17738 ?auto_17740 ) ) ( not ( = ?auto_17739 ?auto_17740 ) ) ( not ( = ?auto_17743 ?auto_17746 ) ) ( not ( = ?auto_17743 ?auto_17744 ) ) ( not ( = ?auto_17743 ?auto_17745 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_17737 ?auto_17738 ?auto_17739 ?auto_17736 )
      ( DELIVER-1PKG ?auto_17740 ?auto_17736 )
      ( DELIVER-4PKG-VERIFY ?auto_17737 ?auto_17738 ?auto_17739 ?auto_17740 ?auto_17736 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33429 - OBJ
      ?auto_33430 - OBJ
      ?auto_33431 - OBJ
      ?auto_33432 - OBJ
      ?auto_33433 - OBJ
      ?auto_33428 - LOCATION
    )
    :vars
    (
      ?auto_33436 - LOCATION
      ?auto_33435 - CITY
      ?auto_33437 - LOCATION
      ?auto_33438 - LOCATION
      ?auto_33440 - LOCATION
      ?auto_33439 - LOCATION
      ?auto_33434 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33436 ?auto_33435 ) ( IN-CITY ?auto_33428 ?auto_33435 ) ( not ( = ?auto_33428 ?auto_33436 ) ) ( OBJ-AT ?auto_33433 ?auto_33436 ) ( IN-CITY ?auto_33437 ?auto_33435 ) ( not ( = ?auto_33428 ?auto_33437 ) ) ( OBJ-AT ?auto_33432 ?auto_33437 ) ( IN-CITY ?auto_33438 ?auto_33435 ) ( not ( = ?auto_33428 ?auto_33438 ) ) ( OBJ-AT ?auto_33431 ?auto_33438 ) ( IN-CITY ?auto_33440 ?auto_33435 ) ( not ( = ?auto_33428 ?auto_33440 ) ) ( OBJ-AT ?auto_33430 ?auto_33440 ) ( IN-CITY ?auto_33439 ?auto_33435 ) ( not ( = ?auto_33428 ?auto_33439 ) ) ( OBJ-AT ?auto_33429 ?auto_33439 ) ( TRUCK-AT ?auto_33434 ?auto_33428 ) ( not ( = ?auto_33429 ?auto_33430 ) ) ( not ( = ?auto_33440 ?auto_33439 ) ) ( not ( = ?auto_33429 ?auto_33431 ) ) ( not ( = ?auto_33430 ?auto_33431 ) ) ( not ( = ?auto_33438 ?auto_33440 ) ) ( not ( = ?auto_33438 ?auto_33439 ) ) ( not ( = ?auto_33429 ?auto_33432 ) ) ( not ( = ?auto_33430 ?auto_33432 ) ) ( not ( = ?auto_33431 ?auto_33432 ) ) ( not ( = ?auto_33437 ?auto_33438 ) ) ( not ( = ?auto_33437 ?auto_33440 ) ) ( not ( = ?auto_33437 ?auto_33439 ) ) ( not ( = ?auto_33429 ?auto_33433 ) ) ( not ( = ?auto_33430 ?auto_33433 ) ) ( not ( = ?auto_33431 ?auto_33433 ) ) ( not ( = ?auto_33432 ?auto_33433 ) ) ( not ( = ?auto_33436 ?auto_33437 ) ) ( not ( = ?auto_33436 ?auto_33438 ) ) ( not ( = ?auto_33436 ?auto_33440 ) ) ( not ( = ?auto_33436 ?auto_33439 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_33429 ?auto_33430 ?auto_33431 ?auto_33432 ?auto_33428 )
      ( DELIVER-1PKG ?auto_33433 ?auto_33428 )
      ( DELIVER-5PKG-VERIFY ?auto_33429 ?auto_33430 ?auto_33431 ?auto_33432 ?auto_33433 ?auto_33428 ) )
  )

)

