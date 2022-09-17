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
      ?auto_478 - OBJ
      ?auto_477 - LOCATION
    )
    :vars
    (
      ?auto_480 - LOCATION
      ?auto_481 - CITY
      ?auto_479 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_480 ?auto_481 ) ( IN-CITY ?auto_477 ?auto_481 ) ( not ( = ?auto_477 ?auto_480 ) ) ( OBJ-AT ?auto_478 ?auto_480 ) ( TRUCK-AT ?auto_479 ?auto_477 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_479 ?auto_477 ?auto_480 ?auto_481 )
      ( !LOAD-TRUCK ?auto_478 ?auto_479 ?auto_480 )
      ( !DRIVE-TRUCK ?auto_479 ?auto_480 ?auto_477 ?auto_481 )
      ( !UNLOAD-TRUCK ?auto_478 ?auto_479 ?auto_477 )
      ( DELIVER-1PKG-VERIFY ?auto_478 ?auto_477 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_499 - OBJ
      ?auto_500 - OBJ
      ?auto_498 - LOCATION
    )
    :vars
    (
      ?auto_503 - LOCATION
      ?auto_501 - CITY
      ?auto_502 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_503 ?auto_501 ) ( IN-CITY ?auto_498 ?auto_501 ) ( not ( = ?auto_498 ?auto_503 ) ) ( OBJ-AT ?auto_500 ?auto_503 ) ( OBJ-AT ?auto_499 ?auto_503 ) ( TRUCK-AT ?auto_502 ?auto_498 ) ( not ( = ?auto_499 ?auto_500 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_499 ?auto_498 )
      ( DELIVER-1PKG ?auto_500 ?auto_498 )
      ( DELIVER-2PKG-VERIFY ?auto_499 ?auto_500 ?auto_498 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_607 - OBJ
      ?auto_608 - OBJ
      ?auto_609 - OBJ
      ?auto_606 - LOCATION
    )
    :vars
    (
      ?auto_611 - LOCATION
      ?auto_610 - CITY
      ?auto_613 - LOCATION
      ?auto_612 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_611 ?auto_610 ) ( IN-CITY ?auto_606 ?auto_610 ) ( not ( = ?auto_606 ?auto_611 ) ) ( OBJ-AT ?auto_609 ?auto_611 ) ( IN-CITY ?auto_613 ?auto_610 ) ( not ( = ?auto_606 ?auto_613 ) ) ( OBJ-AT ?auto_608 ?auto_613 ) ( OBJ-AT ?auto_607 ?auto_613 ) ( TRUCK-AT ?auto_612 ?auto_606 ) ( not ( = ?auto_607 ?auto_608 ) ) ( not ( = ?auto_607 ?auto_609 ) ) ( not ( = ?auto_608 ?auto_609 ) ) ( not ( = ?auto_611 ?auto_613 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_607 ?auto_608 ?auto_606 )
      ( DELIVER-1PKG ?auto_609 ?auto_606 )
      ( DELIVER-3PKG-VERIFY ?auto_607 ?auto_608 ?auto_609 ?auto_606 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_624 - OBJ
      ?auto_625 - OBJ
      ?auto_626 - OBJ
      ?auto_623 - LOCATION
    )
    :vars
    (
      ?auto_628 - LOCATION
      ?auto_630 - CITY
      ?auto_629 - LOCATION
      ?auto_627 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_628 ?auto_630 ) ( IN-CITY ?auto_623 ?auto_630 ) ( not ( = ?auto_623 ?auto_628 ) ) ( OBJ-AT ?auto_625 ?auto_628 ) ( IN-CITY ?auto_629 ?auto_630 ) ( not ( = ?auto_623 ?auto_629 ) ) ( OBJ-AT ?auto_626 ?auto_629 ) ( OBJ-AT ?auto_624 ?auto_629 ) ( TRUCK-AT ?auto_627 ?auto_623 ) ( not ( = ?auto_624 ?auto_626 ) ) ( not ( = ?auto_624 ?auto_625 ) ) ( not ( = ?auto_626 ?auto_625 ) ) ( not ( = ?auto_628 ?auto_629 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_624 ?auto_626 ?auto_625 ?auto_623 )
      ( DELIVER-3PKG-VERIFY ?auto_624 ?auto_625 ?auto_626 ?auto_623 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_685 - OBJ
      ?auto_686 - OBJ
      ?auto_687 - OBJ
      ?auto_684 - LOCATION
    )
    :vars
    (
      ?auto_690 - LOCATION
      ?auto_689 - CITY
      ?auto_688 - LOCATION
      ?auto_691 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_690 ?auto_689 ) ( IN-CITY ?auto_684 ?auto_689 ) ( not ( = ?auto_684 ?auto_690 ) ) ( OBJ-AT ?auto_685 ?auto_690 ) ( IN-CITY ?auto_688 ?auto_689 ) ( not ( = ?auto_684 ?auto_688 ) ) ( OBJ-AT ?auto_687 ?auto_688 ) ( OBJ-AT ?auto_686 ?auto_688 ) ( TRUCK-AT ?auto_691 ?auto_684 ) ( not ( = ?auto_686 ?auto_687 ) ) ( not ( = ?auto_686 ?auto_685 ) ) ( not ( = ?auto_687 ?auto_685 ) ) ( not ( = ?auto_690 ?auto_688 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_686 ?auto_685 ?auto_687 ?auto_684 )
      ( DELIVER-3PKG-VERIFY ?auto_685 ?auto_686 ?auto_687 ?auto_684 ) )
  )

)

