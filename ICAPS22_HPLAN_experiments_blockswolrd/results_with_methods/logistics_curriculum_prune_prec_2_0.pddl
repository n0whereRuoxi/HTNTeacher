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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3 - OBJ
      ?auto_2 - LOCATION
    )
    :vars
    (
      ?auto_5 - LOCATION
      ?auto_6 - CITY
      ?auto_4 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5 ?auto_6 ) ( IN-CITY ?auto_2 ?auto_6 ) ( not ( = ?auto_2 ?auto_5 ) ) ( OBJ-AT ?auto_3 ?auto_5 ) ( TRUCK-AT ?auto_4 ?auto_2 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4 ?auto_2 ?auto_5 ?auto_6 )
      ( !LOAD-TRUCK ?auto_3 ?auto_4 ?auto_5 )
      ( !DRIVE-TRUCK ?auto_4 ?auto_5 ?auto_2 ?auto_6 )
      ( !UNLOAD-TRUCK ?auto_3 ?auto_4 ?auto_2 )
      ( DELIVER-1PKG-VERIFY ?auto_3 ?auto_2 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_24 - OBJ
      ?auto_25 - OBJ
      ?auto_23 - LOCATION
    )
    :vars
    (
      ?auto_27 - LOCATION
      ?auto_26 - CITY
      ?auto_29 - LOCATION
      ?auto_28 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_27 ?auto_26 ) ( IN-CITY ?auto_23 ?auto_26 ) ( not ( = ?auto_23 ?auto_27 ) ) ( OBJ-AT ?auto_25 ?auto_27 ) ( IN-CITY ?auto_29 ?auto_26 ) ( not ( = ?auto_23 ?auto_29 ) ) ( OBJ-AT ?auto_24 ?auto_29 ) ( TRUCK-AT ?auto_28 ?auto_23 ) ( not ( = ?auto_24 ?auto_25 ) ) ( not ( = ?auto_27 ?auto_29 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_24 ?auto_23 )
      ( DELIVER-1PKG ?auto_25 ?auto_23 )
      ( DELIVER-2PKG-VERIFY ?auto_24 ?auto_25 ?auto_23 ) )
  )

)

