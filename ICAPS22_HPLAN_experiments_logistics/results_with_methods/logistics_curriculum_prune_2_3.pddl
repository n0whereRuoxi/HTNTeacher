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
      ?auto_120 - OBJ
      ?auto_119 - LOCATION
    )
    :vars
    (
      ?auto_122 - LOCATION
      ?auto_123 - CITY
      ?auto_121 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122 ?auto_123 ) ( IN-CITY ?auto_119 ?auto_123 ) ( not ( = ?auto_119 ?auto_122 ) ) ( OBJ-AT ?auto_120 ?auto_122 ) ( TRUCK-AT ?auto_121 ?auto_119 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_121 ?auto_119 ?auto_122 ?auto_123 )
      ( !LOAD-TRUCK ?auto_120 ?auto_121 ?auto_122 )
      ( !DRIVE-TRUCK ?auto_121 ?auto_122 ?auto_119 ?auto_123 )
      ( !UNLOAD-TRUCK ?auto_120 ?auto_121 ?auto_119 )
      ( DELIVER-1PKG-VERIFY ?auto_120 ?auto_119 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_141 - OBJ
      ?auto_142 - OBJ
      ?auto_140 - LOCATION
    )
    :vars
    (
      ?auto_145 - LOCATION
      ?auto_144 - CITY
      ?auto_143 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_145 ?auto_144 ) ( IN-CITY ?auto_140 ?auto_144 ) ( not ( = ?auto_140 ?auto_145 ) ) ( OBJ-AT ?auto_142 ?auto_145 ) ( OBJ-AT ?auto_141 ?auto_145 ) ( TRUCK-AT ?auto_143 ?auto_140 ) ( not ( = ?auto_141 ?auto_142 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_141 ?auto_140 )
      ( DELIVER-1PKG ?auto_142 ?auto_140 )
      ( DELIVER-2PKG-VERIFY ?auto_141 ?auto_142 ?auto_140 ) )
  )

)

