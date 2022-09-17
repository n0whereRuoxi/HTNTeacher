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
      ?auto_4430 - OBJ
      ?auto_4429 - LOCATION
    )
    :vars
    (
      ?auto_4432 - LOCATION
      ?auto_4433 - CITY
      ?auto_4431 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4432 ?auto_4433 ) ( IN-CITY ?auto_4429 ?auto_4433 ) ( not ( = ?auto_4429 ?auto_4432 ) ) ( OBJ-AT ?auto_4430 ?auto_4432 ) ( TRUCK-AT ?auto_4431 ?auto_4429 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4431 ?auto_4429 ?auto_4432 ?auto_4433 )
      ( !LOAD-TRUCK ?auto_4430 ?auto_4431 ?auto_4432 )
      ( !DRIVE-TRUCK ?auto_4431 ?auto_4432 ?auto_4429 ?auto_4433 )
      ( !UNLOAD-TRUCK ?auto_4430 ?auto_4431 ?auto_4429 )
      ( DELIVER-1PKG-VERIFY ?auto_4430 ?auto_4429 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4451 - OBJ
      ?auto_4452 - OBJ
      ?auto_4450 - LOCATION
    )
    :vars
    (
      ?auto_4455 - LOCATION
      ?auto_4454 - CITY
      ?auto_4456 - LOCATION
      ?auto_4453 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4455 ?auto_4454 ) ( IN-CITY ?auto_4450 ?auto_4454 ) ( not ( = ?auto_4450 ?auto_4455 ) ) ( OBJ-AT ?auto_4452 ?auto_4455 ) ( IN-CITY ?auto_4456 ?auto_4454 ) ( not ( = ?auto_4450 ?auto_4456 ) ) ( OBJ-AT ?auto_4451 ?auto_4456 ) ( TRUCK-AT ?auto_4453 ?auto_4450 ) ( not ( = ?auto_4451 ?auto_4452 ) ) ( not ( = ?auto_4455 ?auto_4456 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4451 ?auto_4450 )
      ( DELIVER-1PKG ?auto_4452 ?auto_4450 )
      ( DELIVER-2PKG-VERIFY ?auto_4451 ?auto_4452 ?auto_4450 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4562 - OBJ
      ?auto_4563 - OBJ
      ?auto_4564 - OBJ
      ?auto_4561 - LOCATION
    )
    :vars
    (
      ?auto_4566 - LOCATION
      ?auto_4567 - CITY
      ?auto_4568 - LOCATION
      ?auto_4569 - LOCATION
      ?auto_4565 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4566 ?auto_4567 ) ( IN-CITY ?auto_4561 ?auto_4567 ) ( not ( = ?auto_4561 ?auto_4566 ) ) ( OBJ-AT ?auto_4564 ?auto_4566 ) ( IN-CITY ?auto_4568 ?auto_4567 ) ( not ( = ?auto_4561 ?auto_4568 ) ) ( OBJ-AT ?auto_4563 ?auto_4568 ) ( IN-CITY ?auto_4569 ?auto_4567 ) ( not ( = ?auto_4561 ?auto_4569 ) ) ( OBJ-AT ?auto_4562 ?auto_4569 ) ( TRUCK-AT ?auto_4565 ?auto_4561 ) ( not ( = ?auto_4562 ?auto_4563 ) ) ( not ( = ?auto_4568 ?auto_4569 ) ) ( not ( = ?auto_4562 ?auto_4564 ) ) ( not ( = ?auto_4563 ?auto_4564 ) ) ( not ( = ?auto_4566 ?auto_4568 ) ) ( not ( = ?auto_4566 ?auto_4569 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4562 ?auto_4563 ?auto_4561 )
      ( DELIVER-1PKG ?auto_4564 ?auto_4561 )
      ( DELIVER-3PKG-VERIFY ?auto_4562 ?auto_4563 ?auto_4564 ?auto_4561 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5705 - OBJ
      ?auto_5706 - OBJ
      ?auto_5707 - OBJ
      ?auto_5708 - OBJ
      ?auto_5704 - LOCATION
    )
    :vars
    (
      ?auto_5710 - LOCATION
      ?auto_5709 - CITY
      ?auto_5714 - LOCATION
      ?auto_5713 - LOCATION
      ?auto_5712 - LOCATION
      ?auto_5711 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5710 ?auto_5709 ) ( IN-CITY ?auto_5704 ?auto_5709 ) ( not ( = ?auto_5704 ?auto_5710 ) ) ( OBJ-AT ?auto_5708 ?auto_5710 ) ( IN-CITY ?auto_5714 ?auto_5709 ) ( not ( = ?auto_5704 ?auto_5714 ) ) ( OBJ-AT ?auto_5707 ?auto_5714 ) ( IN-CITY ?auto_5713 ?auto_5709 ) ( not ( = ?auto_5704 ?auto_5713 ) ) ( OBJ-AT ?auto_5706 ?auto_5713 ) ( IN-CITY ?auto_5712 ?auto_5709 ) ( not ( = ?auto_5704 ?auto_5712 ) ) ( OBJ-AT ?auto_5705 ?auto_5712 ) ( TRUCK-AT ?auto_5711 ?auto_5704 ) ( not ( = ?auto_5705 ?auto_5706 ) ) ( not ( = ?auto_5713 ?auto_5712 ) ) ( not ( = ?auto_5705 ?auto_5707 ) ) ( not ( = ?auto_5706 ?auto_5707 ) ) ( not ( = ?auto_5714 ?auto_5713 ) ) ( not ( = ?auto_5714 ?auto_5712 ) ) ( not ( = ?auto_5705 ?auto_5708 ) ) ( not ( = ?auto_5706 ?auto_5708 ) ) ( not ( = ?auto_5707 ?auto_5708 ) ) ( not ( = ?auto_5710 ?auto_5714 ) ) ( not ( = ?auto_5710 ?auto_5713 ) ) ( not ( = ?auto_5710 ?auto_5712 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_5705 ?auto_5706 ?auto_5707 ?auto_5704 )
      ( DELIVER-1PKG ?auto_5708 ?auto_5704 )
      ( DELIVER-4PKG-VERIFY ?auto_5705 ?auto_5706 ?auto_5707 ?auto_5708 ?auto_5704 ) )
  )

)

