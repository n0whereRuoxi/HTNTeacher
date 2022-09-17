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
      ?auto_83 - OBJ
      ?auto_82 - LOCATION
    )
    :vars
    (
      ?auto_85 - LOCATION
      ?auto_86 - CITY
      ?auto_84 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85 ?auto_86 ) ( IN-CITY ?auto_82 ?auto_86 ) ( not ( = ?auto_82 ?auto_85 ) ) ( OBJ-AT ?auto_83 ?auto_85 ) ( TRUCK-AT ?auto_84 ?auto_82 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_84 ?auto_82 ?auto_85 ?auto_86 )
      ( !LOAD-TRUCK ?auto_83 ?auto_84 ?auto_85 )
      ( !DRIVE-TRUCK ?auto_84 ?auto_85 ?auto_82 ?auto_86 )
      ( !UNLOAD-TRUCK ?auto_83 ?auto_84 ?auto_82 )
      ( DELIVER-1PKG-VERIFY ?auto_83 ?auto_82 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_104 - OBJ
      ?auto_105 - OBJ
      ?auto_103 - LOCATION
    )
    :vars
    (
      ?auto_107 - LOCATION
      ?auto_108 - CITY
      ?auto_109 - LOCATION
      ?auto_106 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107 ?auto_108 ) ( IN-CITY ?auto_103 ?auto_108 ) ( not ( = ?auto_103 ?auto_107 ) ) ( OBJ-AT ?auto_105 ?auto_107 ) ( IN-CITY ?auto_109 ?auto_108 ) ( not ( = ?auto_103 ?auto_109 ) ) ( OBJ-AT ?auto_104 ?auto_109 ) ( TRUCK-AT ?auto_106 ?auto_103 ) ( not ( = ?auto_104 ?auto_105 ) ) ( not ( = ?auto_107 ?auto_109 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_104 ?auto_103 )
      ( DELIVER-1PKG ?auto_105 ?auto_103 )
      ( DELIVER-2PKG-VERIFY ?auto_104 ?auto_105 ?auto_103 ) )
  )

)

