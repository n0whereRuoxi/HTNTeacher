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
      ?auto_48 - OBJ
      ?auto_47 - LOCATION
    )
    :vars
    (
      ?auto_50 - LOCATION
      ?auto_51 - CITY
      ?auto_49 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_50 ?auto_51 ) ( IN-CITY ?auto_47 ?auto_51 ) ( not ( = ?auto_47 ?auto_50 ) ) ( OBJ-AT ?auto_48 ?auto_50 ) ( TRUCK-AT ?auto_49 ?auto_47 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_49 ?auto_47 ?auto_50 ?auto_51 )
      ( !LOAD-TRUCK ?auto_48 ?auto_49 ?auto_50 )
      ( !DRIVE-TRUCK ?auto_49 ?auto_50 ?auto_47 ?auto_51 )
      ( !UNLOAD-TRUCK ?auto_48 ?auto_49 ?auto_47 )
      ( DELIVER-1PKG-VERIFY ?auto_48 ?auto_47 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55 - OBJ
      ?auto_54 - LOCATION
    )
    :vars
    (
      ?auto_57 - LOCATION
      ?auto_58 - CITY
      ?auto_56 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_57 ?auto_58 ) ( IN-CITY ?auto_54 ?auto_58 ) ( not ( = ?auto_54 ?auto_57 ) ) ( OBJ-AT ?auto_55 ?auto_57 ) ( TRUCK-AT ?auto_56 ?auto_54 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56 ?auto_54 ?auto_57 ?auto_58 )
      ( !LOAD-TRUCK ?auto_55 ?auto_56 ?auto_57 )
      ( !DRIVE-TRUCK ?auto_56 ?auto_57 ?auto_54 ?auto_58 )
      ( !UNLOAD-TRUCK ?auto_55 ?auto_56 ?auto_54 )
      ( DELIVER-1PKG-VERIFY ?auto_55 ?auto_54 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_69 - OBJ
      ?auto_70 - OBJ
      ?auto_68 - LOCATION
    )
    :vars
    (
      ?auto_72 - LOCATION
      ?auto_73 - CITY
      ?auto_71 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_72 ?auto_73 ) ( IN-CITY ?auto_68 ?auto_73 ) ( not ( = ?auto_68 ?auto_72 ) ) ( OBJ-AT ?auto_70 ?auto_72 ) ( OBJ-AT ?auto_69 ?auto_72 ) ( TRUCK-AT ?auto_71 ?auto_68 ) ( not ( = ?auto_69 ?auto_70 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_69 ?auto_68 )
      ( DELIVER-1PKG ?auto_70 ?auto_68 )
      ( DELIVER-2PKG-VERIFY ?auto_69 ?auto_70 ?auto_68 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_75 - OBJ
      ?auto_76 - OBJ
      ?auto_74 - LOCATION
    )
    :vars
    (
      ?auto_79 - LOCATION
      ?auto_78 - CITY
      ?auto_77 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79 ?auto_78 ) ( IN-CITY ?auto_74 ?auto_78 ) ( not ( = ?auto_74 ?auto_79 ) ) ( OBJ-AT ?auto_75 ?auto_79 ) ( OBJ-AT ?auto_76 ?auto_79 ) ( TRUCK-AT ?auto_77 ?auto_74 ) ( not ( = ?auto_76 ?auto_75 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76 ?auto_75 ?auto_74 )
      ( DELIVER-2PKG-VERIFY ?auto_75 ?auto_76 ?auto_74 ) )
  )

)

