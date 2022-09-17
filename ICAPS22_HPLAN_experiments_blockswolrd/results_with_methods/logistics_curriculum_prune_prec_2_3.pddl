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
      ?auto_124 - OBJ
      ?auto_123 - LOCATION
    )
    :vars
    (
      ?auto_126 - LOCATION
      ?auto_127 - CITY
      ?auto_125 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126 ?auto_127 ) ( IN-CITY ?auto_123 ?auto_127 ) ( not ( = ?auto_123 ?auto_126 ) ) ( OBJ-AT ?auto_124 ?auto_126 ) ( TRUCK-AT ?auto_125 ?auto_123 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_125 ?auto_123 ?auto_126 ?auto_127 )
      ( !LOAD-TRUCK ?auto_124 ?auto_125 ?auto_126 )
      ( !DRIVE-TRUCK ?auto_125 ?auto_126 ?auto_123 ?auto_127 )
      ( !UNLOAD-TRUCK ?auto_124 ?auto_125 ?auto_123 )
      ( DELIVER-1PKG-VERIFY ?auto_124 ?auto_123 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_145 - OBJ
      ?auto_146 - OBJ
      ?auto_144 - LOCATION
    )
    :vars
    (
      ?auto_148 - LOCATION
      ?auto_147 - CITY
      ?auto_149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148 ?auto_147 ) ( IN-CITY ?auto_144 ?auto_147 ) ( not ( = ?auto_144 ?auto_148 ) ) ( OBJ-AT ?auto_146 ?auto_148 ) ( OBJ-AT ?auto_145 ?auto_148 ) ( TRUCK-AT ?auto_149 ?auto_144 ) ( not ( = ?auto_145 ?auto_146 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_145 ?auto_144 )
      ( DELIVER-1PKG ?auto_146 ?auto_144 )
      ( DELIVER-2PKG-VERIFY ?auto_145 ?auto_146 ?auto_144 ) )
  )

)

