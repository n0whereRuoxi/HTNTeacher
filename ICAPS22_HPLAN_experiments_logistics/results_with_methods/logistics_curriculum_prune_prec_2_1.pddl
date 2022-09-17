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
      ?auto_58 - OBJ
      ?auto_59 - LOCATION
    )
    :vars
    (
      ?auto_68 - LOCATION
      ?auto_65 - CITY
      ?auto_60 - TRUCK
      ?auto_71 - LOCATION
      ?auto_72 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_68 ?auto_65 ) ( IN-CITY ?auto_59 ?auto_65 ) ( not ( = ?auto_59 ?auto_68 ) ) ( OBJ-AT ?auto_58 ?auto_68 ) ( TRUCK-AT ?auto_60 ?auto_71 ) ( IN-CITY ?auto_71 ?auto_72 ) ( IN-CITY ?auto_68 ?auto_72 ) ( not ( = ?auto_68 ?auto_71 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_60 ?auto_71 ?auto_68 ?auto_72 )
      ( !LOAD-TRUCK ?auto_58 ?auto_60 ?auto_68 )
      ( !DRIVE-TRUCK ?auto_60 ?auto_68 ?auto_59 ?auto_65 )
      ( !UNLOAD-TRUCK ?auto_58 ?auto_60 ?auto_59 )
      ( DELIVER-1PKG-VERIFY ?auto_58 ?auto_59 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95 - OBJ
      ?auto_97 - OBJ
      ?auto_100 - LOCATION
    )
    :vars
    (
      ?auto_101 - LOCATION
      ?auto_104 - CITY
      ?auto_99 - CITY
      ?auto_111 - LOCATION
      ?auto_110 - CITY
      ?auto_102 - TRUCK
      ?auto_109 - LOCATION
      ?auto_106 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_97 ?auto_95 ) ( IN-CITY ?auto_101 ?auto_104 ) ( IN-CITY ?auto_100 ?auto_104 ) ( not ( = ?auto_100 ?auto_101 ) ) ( OBJ-AT ?auto_97 ?auto_101 ) ( IN-CITY ?auto_100 ?auto_99 ) ( IN-CITY ?auto_101 ?auto_99 ) ( IN-CITY ?auto_111 ?auto_110 ) ( IN-CITY ?auto_100 ?auto_110 ) ( not ( = ?auto_100 ?auto_111 ) ) ( OBJ-AT ?auto_95 ?auto_111 ) ( TRUCK-AT ?auto_102 ?auto_109 ) ( IN-CITY ?auto_109 ?auto_106 ) ( IN-CITY ?auto_111 ?auto_106 ) ( not ( = ?auto_111 ?auto_109 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95 ?auto_100 )
      ( DELIVER-1PKG ?auto_97 ?auto_100 )
      ( DELIVER-2PKG-VERIFY ?auto_95 ?auto_97 ?auto_100 ) )
  )

)

