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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2 - OBJ
      ?auto_3 - LOCATION
    )
    :vars
    (
      ?auto_12 - LOCATION
      ?auto_9 - CITY
      ?auto_4 - TRUCK
      ?auto_15 - LOCATION
      ?auto_16 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_12 ?auto_9 ) ( IN-CITY ?auto_3 ?auto_9 ) ( not ( = ?auto_3 ?auto_12 ) ) ( OBJ-AT ?auto_2 ?auto_12 ) ( TRUCK-AT ?auto_4 ?auto_15 ) ( IN-CITY ?auto_15 ?auto_16 ) ( IN-CITY ?auto_12 ?auto_16 ) ( not ( = ?auto_12 ?auto_15 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4 ?auto_15 ?auto_12 ?auto_16 )
      ( !LOAD-TRUCK ?auto_2 ?auto_4 ?auto_12 )
      ( !DRIVE-TRUCK ?auto_4 ?auto_12 ?auto_3 ?auto_9 )
      ( !UNLOAD-TRUCK ?auto_2 ?auto_4 ?auto_3 )
      ( DELIVER-1PKG-VERIFY ?auto_2 ?auto_3 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_39 - OBJ
      ?auto_41 - OBJ
      ?auto_47 - LOCATION
    )
    :vars
    (
      ?auto_48 - LOCATION
      ?auto_42 - CITY
      ?auto_43 - CITY
      ?auto_55 - LOCATION
      ?auto_52 - CITY
      ?auto_46 - TRUCK
      ?auto_49 - LOCATION
      ?auto_51 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_41 ?auto_39 ) ( IN-CITY ?auto_48 ?auto_42 ) ( IN-CITY ?auto_47 ?auto_42 ) ( not ( = ?auto_47 ?auto_48 ) ) ( OBJ-AT ?auto_41 ?auto_48 ) ( IN-CITY ?auto_47 ?auto_43 ) ( IN-CITY ?auto_48 ?auto_43 ) ( IN-CITY ?auto_55 ?auto_52 ) ( IN-CITY ?auto_47 ?auto_52 ) ( not ( = ?auto_47 ?auto_55 ) ) ( OBJ-AT ?auto_39 ?auto_55 ) ( TRUCK-AT ?auto_46 ?auto_49 ) ( IN-CITY ?auto_49 ?auto_51 ) ( IN-CITY ?auto_55 ?auto_51 ) ( not ( = ?auto_55 ?auto_49 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_39 ?auto_47 )
      ( DELIVER-1PKG ?auto_41 ?auto_47 )
      ( DELIVER-2PKG-VERIFY ?auto_39 ?auto_41 ?auto_47 ) )
  )

)

