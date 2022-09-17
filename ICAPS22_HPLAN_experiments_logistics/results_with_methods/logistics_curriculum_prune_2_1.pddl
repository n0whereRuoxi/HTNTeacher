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
      ?auto_42 - OBJ
      ?auto_41 - LOCATION
    )
    :vars
    (
      ?auto_44 - LOCATION
      ?auto_45 - CITY
      ?auto_43 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44 ?auto_45 ) ( IN-CITY ?auto_41 ?auto_45 ) ( not ( = ?auto_41 ?auto_44 ) ) ( OBJ-AT ?auto_42 ?auto_44 ) ( TRUCK-AT ?auto_43 ?auto_41 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_43 ?auto_41 ?auto_44 ?auto_45 )
      ( !LOAD-TRUCK ?auto_42 ?auto_43 ?auto_44 )
      ( !DRIVE-TRUCK ?auto_43 ?auto_44 ?auto_41 ?auto_45 )
      ( !UNLOAD-TRUCK ?auto_42 ?auto_43 ?auto_41 )
      ( DELIVER-1PKG-VERIFY ?auto_42 ?auto_41 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_63 - OBJ
      ?auto_64 - OBJ
      ?auto_62 - LOCATION
    )
    :vars
    (
      ?auto_65 - LOCATION
      ?auto_66 - CITY
      ?auto_67 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_65 ?auto_66 ) ( IN-CITY ?auto_62 ?auto_66 ) ( not ( = ?auto_62 ?auto_65 ) ) ( OBJ-AT ?auto_64 ?auto_65 ) ( OBJ-AT ?auto_63 ?auto_65 ) ( TRUCK-AT ?auto_67 ?auto_62 ) ( not ( = ?auto_63 ?auto_64 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63 ?auto_62 )
      ( DELIVER-1PKG ?auto_64 ?auto_62 )
      ( DELIVER-2PKG-VERIFY ?auto_63 ?auto_64 ?auto_62 ) )
  )

)

