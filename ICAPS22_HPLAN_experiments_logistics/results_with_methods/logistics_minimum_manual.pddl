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
      ?auto_2 - OBJ
      ?auto_3 - LOCATION
    )
    :vars
    (
      ?auto_4 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4 ?auto_3 ) ( IN-TRUCK ?auto_2 ?auto_4 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2 ?auto_4 ?auto_3 )
      ( DELIVER-1PKG-VERIFY ?auto_2 ?auto_3 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7 - OBJ
      ?auto_8 - LOCATION
    )
    :vars
    (
      ?auto_9 - TRUCK
      ?auto_10 - LOCATION
      ?auto_11 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7 ?auto_9 ) ( TRUCK-AT ?auto_9 ?auto_10 ) ( IN-CITY ?auto_10 ?auto_11 ) ( IN-CITY ?auto_8 ?auto_11 ) ( not ( = ?auto_8 ?auto_10 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9 ?auto_10 ?auto_8 ?auto_11 )
      ( DELIVER-1PKG ?auto_7 ?auto_8 )
      ( DELIVER-1PKG-VERIFY ?auto_7 ?auto_8 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14 - OBJ
      ?auto_15 - LOCATION
    )
    :vars
    (
      ?auto_18 - TRUCK
      ?auto_17 - LOCATION
      ?auto_16 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18 ?auto_17 ) ( IN-CITY ?auto_17 ?auto_16 ) ( IN-CITY ?auto_15 ?auto_16 ) ( not ( = ?auto_15 ?auto_17 ) ) ( OBJ-AT ?auto_14 ?auto_17 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14 ?auto_18 ?auto_17 )
      ( DELIVER-1PKG ?auto_14 ?auto_15 )
      ( DELIVER-1PKG-VERIFY ?auto_14 ?auto_15 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_32 - OBJ
      ?auto_33 - LOCATION
    )
    :vars
    (
      ?auto_35 - LOCATION
      ?auto_38 - CITY
      ?auto_39 - TRUCK
      ?auto_41 - LOCATION
      ?auto_42 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_35 ?auto_38 ) ( IN-CITY ?auto_33 ?auto_38 ) ( not ( = ?auto_33 ?auto_35 ) ) ( OBJ-AT ?auto_32 ?auto_35 ) ( TRUCK-AT ?auto_39 ?auto_41 ) ( IN-CITY ?auto_41 ?auto_42 ) ( IN-CITY ?auto_35 ?auto_42 ) ( not ( = ?auto_35 ?auto_41 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_39 ?auto_41 ?auto_35 ?auto_42 )
      ( DELIVER-1PKG ?auto_32 ?auto_33 )
      ( DELIVER-1PKG-VERIFY ?auto_32 ?auto_33 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_89 - OBJ
      ?auto_91 - OBJ
      ?auto_90 - LOCATION
    )
    :vars
    (
    )
    :precondition
    ( and ( GREATER-THAN ?auto_91 ?auto_89 ) ( not ( = ?auto_89 ?auto_91 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_89 ?auto_90 )
      ( DELIVER-1PKG ?auto_91 ?auto_90 )
      ( DELIVER-2PKG-VERIFY ?auto_89 ?auto_91 ?auto_90 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54 - OBJ
      ?auto_55 - OBJ
      ?auto_57 - OBJ
      ?auto_56 - LOCATION
    )
    :vars
    (
    )
    :precondition
    ( and ( GREATER-THAN ?auto_55 ?auto_54 ) ( GREATER-THAN ?auto_57 ?auto_54 ) ( GREATER-THAN ?auto_57 ?auto_55 ) ( not ( = ?auto_55 ?auto_57 ) ) ( not ( = ?auto_54 ?auto_57 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54 ?auto_55 ?auto_56 )
      ( DELIVER-1PKG ?auto_57 ?auto_56 )
      ( DELIVER-3PKG-VERIFY ?auto_54 ?auto_55 ?auto_57 ?auto_56 ) )
  )

)

