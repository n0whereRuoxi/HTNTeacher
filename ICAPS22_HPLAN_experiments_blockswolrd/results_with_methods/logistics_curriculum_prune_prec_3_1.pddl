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
      ?auto_488 - OBJ
      ?auto_487 - LOCATION
    )
    :vars
    (
      ?auto_490 - LOCATION
      ?auto_491 - CITY
      ?auto_489 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_490 ?auto_491 ) ( IN-CITY ?auto_487 ?auto_491 ) ( not ( = ?auto_487 ?auto_490 ) ) ( OBJ-AT ?auto_488 ?auto_490 ) ( TRUCK-AT ?auto_489 ?auto_487 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_489 ?auto_487 ?auto_490 ?auto_491 )
      ( !LOAD-TRUCK ?auto_488 ?auto_489 ?auto_490 )
      ( !DRIVE-TRUCK ?auto_489 ?auto_490 ?auto_487 ?auto_491 )
      ( !UNLOAD-TRUCK ?auto_488 ?auto_489 ?auto_487 )
      ( DELIVER-1PKG-VERIFY ?auto_488 ?auto_487 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_509 - OBJ
      ?auto_510 - OBJ
      ?auto_508 - LOCATION
    )
    :vars
    (
      ?auto_511 - LOCATION
      ?auto_513 - CITY
      ?auto_514 - LOCATION
      ?auto_512 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_511 ?auto_513 ) ( IN-CITY ?auto_508 ?auto_513 ) ( not ( = ?auto_508 ?auto_511 ) ) ( OBJ-AT ?auto_510 ?auto_511 ) ( IN-CITY ?auto_514 ?auto_513 ) ( not ( = ?auto_508 ?auto_514 ) ) ( OBJ-AT ?auto_509 ?auto_514 ) ( TRUCK-AT ?auto_512 ?auto_508 ) ( not ( = ?auto_509 ?auto_510 ) ) ( not ( = ?auto_511 ?auto_514 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_509 ?auto_508 )
      ( DELIVER-1PKG ?auto_510 ?auto_508 )
      ( DELIVER-2PKG-VERIFY ?auto_509 ?auto_510 ?auto_508 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_619 - OBJ
      ?auto_620 - OBJ
      ?auto_621 - OBJ
      ?auto_618 - LOCATION
    )
    :vars
    (
      ?auto_623 - LOCATION
      ?auto_624 - CITY
      ?auto_625 - LOCATION
      ?auto_622 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_623 ?auto_624 ) ( IN-CITY ?auto_618 ?auto_624 ) ( not ( = ?auto_618 ?auto_623 ) ) ( OBJ-AT ?auto_621 ?auto_623 ) ( OBJ-AT ?auto_620 ?auto_623 ) ( IN-CITY ?auto_625 ?auto_624 ) ( not ( = ?auto_618 ?auto_625 ) ) ( OBJ-AT ?auto_619 ?auto_625 ) ( TRUCK-AT ?auto_622 ?auto_618 ) ( not ( = ?auto_619 ?auto_620 ) ) ( not ( = ?auto_623 ?auto_625 ) ) ( not ( = ?auto_619 ?auto_621 ) ) ( not ( = ?auto_620 ?auto_621 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_619 ?auto_620 ?auto_618 )
      ( DELIVER-1PKG ?auto_621 ?auto_618 )
      ( DELIVER-3PKG-VERIFY ?auto_619 ?auto_620 ?auto_621 ?auto_618 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_649 - OBJ
      ?auto_650 - OBJ
      ?auto_651 - OBJ
      ?auto_648 - LOCATION
    )
    :vars
    (
      ?auto_654 - LOCATION
      ?auto_653 - CITY
      ?auto_652 - LOCATION
      ?auto_655 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_654 ?auto_653 ) ( IN-CITY ?auto_648 ?auto_653 ) ( not ( = ?auto_648 ?auto_654 ) ) ( OBJ-AT ?auto_651 ?auto_654 ) ( OBJ-AT ?auto_649 ?auto_654 ) ( IN-CITY ?auto_652 ?auto_653 ) ( not ( = ?auto_648 ?auto_652 ) ) ( OBJ-AT ?auto_650 ?auto_652 ) ( TRUCK-AT ?auto_655 ?auto_648 ) ( not ( = ?auto_650 ?auto_649 ) ) ( not ( = ?auto_654 ?auto_652 ) ) ( not ( = ?auto_650 ?auto_651 ) ) ( not ( = ?auto_649 ?auto_651 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_650 ?auto_649 ?auto_651 ?auto_648 )
      ( DELIVER-3PKG-VERIFY ?auto_649 ?auto_650 ?auto_651 ?auto_648 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_666 - OBJ
      ?auto_667 - OBJ
      ?auto_668 - OBJ
      ?auto_665 - LOCATION
    )
    :vars
    (
      ?auto_671 - LOCATION
      ?auto_669 - CITY
      ?auto_672 - LOCATION
      ?auto_670 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_671 ?auto_669 ) ( IN-CITY ?auto_665 ?auto_669 ) ( not ( = ?auto_665 ?auto_671 ) ) ( OBJ-AT ?auto_667 ?auto_671 ) ( OBJ-AT ?auto_666 ?auto_671 ) ( IN-CITY ?auto_672 ?auto_669 ) ( not ( = ?auto_665 ?auto_672 ) ) ( OBJ-AT ?auto_668 ?auto_672 ) ( TRUCK-AT ?auto_670 ?auto_665 ) ( not ( = ?auto_668 ?auto_666 ) ) ( not ( = ?auto_671 ?auto_672 ) ) ( not ( = ?auto_668 ?auto_667 ) ) ( not ( = ?auto_666 ?auto_667 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_666 ?auto_668 ?auto_667 ?auto_665 )
      ( DELIVER-3PKG-VERIFY ?auto_666 ?auto_667 ?auto_668 ?auto_665 ) )
  )

)

