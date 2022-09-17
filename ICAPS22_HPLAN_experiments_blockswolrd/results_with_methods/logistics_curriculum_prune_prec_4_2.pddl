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
      ?auto_7459 - OBJ
      ?auto_7458 - LOCATION
    )
    :vars
    (
      ?auto_7461 - LOCATION
      ?auto_7462 - CITY
      ?auto_7460 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7461 ?auto_7462 ) ( IN-CITY ?auto_7458 ?auto_7462 ) ( not ( = ?auto_7458 ?auto_7461 ) ) ( OBJ-AT ?auto_7459 ?auto_7461 ) ( TRUCK-AT ?auto_7460 ?auto_7458 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7460 ?auto_7458 ?auto_7461 ?auto_7462 )
      ( !LOAD-TRUCK ?auto_7459 ?auto_7460 ?auto_7461 )
      ( !DRIVE-TRUCK ?auto_7460 ?auto_7461 ?auto_7458 ?auto_7462 )
      ( !UNLOAD-TRUCK ?auto_7459 ?auto_7460 ?auto_7458 )
      ( DELIVER-1PKG-VERIFY ?auto_7459 ?auto_7458 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7480 - OBJ
      ?auto_7481 - OBJ
      ?auto_7479 - LOCATION
    )
    :vars
    (
      ?auto_7482 - LOCATION
      ?auto_7484 - CITY
      ?auto_7485 - LOCATION
      ?auto_7483 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7482 ?auto_7484 ) ( IN-CITY ?auto_7479 ?auto_7484 ) ( not ( = ?auto_7479 ?auto_7482 ) ) ( OBJ-AT ?auto_7481 ?auto_7482 ) ( IN-CITY ?auto_7485 ?auto_7484 ) ( not ( = ?auto_7479 ?auto_7485 ) ) ( OBJ-AT ?auto_7480 ?auto_7485 ) ( TRUCK-AT ?auto_7483 ?auto_7479 ) ( not ( = ?auto_7480 ?auto_7481 ) ) ( not ( = ?auto_7482 ?auto_7485 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7480 ?auto_7479 )
      ( DELIVER-1PKG ?auto_7481 ?auto_7479 )
      ( DELIVER-2PKG-VERIFY ?auto_7480 ?auto_7481 ?auto_7479 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7591 - OBJ
      ?auto_7592 - OBJ
      ?auto_7593 - OBJ
      ?auto_7590 - LOCATION
    )
    :vars
    (
      ?auto_7595 - LOCATION
      ?auto_7596 - CITY
      ?auto_7597 - LOCATION
      ?auto_7598 - LOCATION
      ?auto_7594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7595 ?auto_7596 ) ( IN-CITY ?auto_7590 ?auto_7596 ) ( not ( = ?auto_7590 ?auto_7595 ) ) ( OBJ-AT ?auto_7593 ?auto_7595 ) ( IN-CITY ?auto_7597 ?auto_7596 ) ( not ( = ?auto_7590 ?auto_7597 ) ) ( OBJ-AT ?auto_7592 ?auto_7597 ) ( IN-CITY ?auto_7598 ?auto_7596 ) ( not ( = ?auto_7590 ?auto_7598 ) ) ( OBJ-AT ?auto_7591 ?auto_7598 ) ( TRUCK-AT ?auto_7594 ?auto_7590 ) ( not ( = ?auto_7591 ?auto_7592 ) ) ( not ( = ?auto_7597 ?auto_7598 ) ) ( not ( = ?auto_7591 ?auto_7593 ) ) ( not ( = ?auto_7592 ?auto_7593 ) ) ( not ( = ?auto_7595 ?auto_7597 ) ) ( not ( = ?auto_7595 ?auto_7598 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7591 ?auto_7592 ?auto_7590 )
      ( DELIVER-1PKG ?auto_7593 ?auto_7590 )
      ( DELIVER-3PKG-VERIFY ?auto_7591 ?auto_7592 ?auto_7593 ?auto_7590 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8734 - OBJ
      ?auto_8735 - OBJ
      ?auto_8736 - OBJ
      ?auto_8737 - OBJ
      ?auto_8733 - LOCATION
    )
    :vars
    (
      ?auto_8740 - LOCATION
      ?auto_8739 - CITY
      ?auto_8741 - LOCATION
      ?auto_8742 - LOCATION
      ?auto_8743 - LOCATION
      ?auto_8738 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8740 ?auto_8739 ) ( IN-CITY ?auto_8733 ?auto_8739 ) ( not ( = ?auto_8733 ?auto_8740 ) ) ( OBJ-AT ?auto_8737 ?auto_8740 ) ( IN-CITY ?auto_8741 ?auto_8739 ) ( not ( = ?auto_8733 ?auto_8741 ) ) ( OBJ-AT ?auto_8736 ?auto_8741 ) ( IN-CITY ?auto_8742 ?auto_8739 ) ( not ( = ?auto_8733 ?auto_8742 ) ) ( OBJ-AT ?auto_8735 ?auto_8742 ) ( IN-CITY ?auto_8743 ?auto_8739 ) ( not ( = ?auto_8733 ?auto_8743 ) ) ( OBJ-AT ?auto_8734 ?auto_8743 ) ( TRUCK-AT ?auto_8738 ?auto_8733 ) ( not ( = ?auto_8734 ?auto_8735 ) ) ( not ( = ?auto_8742 ?auto_8743 ) ) ( not ( = ?auto_8734 ?auto_8736 ) ) ( not ( = ?auto_8735 ?auto_8736 ) ) ( not ( = ?auto_8741 ?auto_8742 ) ) ( not ( = ?auto_8741 ?auto_8743 ) ) ( not ( = ?auto_8734 ?auto_8737 ) ) ( not ( = ?auto_8735 ?auto_8737 ) ) ( not ( = ?auto_8736 ?auto_8737 ) ) ( not ( = ?auto_8740 ?auto_8741 ) ) ( not ( = ?auto_8740 ?auto_8742 ) ) ( not ( = ?auto_8740 ?auto_8743 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8734 ?auto_8735 ?auto_8736 ?auto_8733 )
      ( DELIVER-1PKG ?auto_8737 ?auto_8733 )
      ( DELIVER-4PKG-VERIFY ?auto_8734 ?auto_8735 ?auto_8736 ?auto_8737 ?auto_8733 ) )
  )

)

