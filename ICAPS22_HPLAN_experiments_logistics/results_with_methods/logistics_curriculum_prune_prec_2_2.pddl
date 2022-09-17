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
      ?auto_114 - OBJ
      ?auto_115 - LOCATION
    )
    :vars
    (
      ?auto_124 - LOCATION
      ?auto_121 - CITY
      ?auto_116 - TRUCK
      ?auto_127 - LOCATION
      ?auto_128 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_124 ?auto_121 ) ( IN-CITY ?auto_115 ?auto_121 ) ( not ( = ?auto_115 ?auto_124 ) ) ( OBJ-AT ?auto_114 ?auto_124 ) ( TRUCK-AT ?auto_116 ?auto_127 ) ( IN-CITY ?auto_127 ?auto_128 ) ( IN-CITY ?auto_124 ?auto_128 ) ( not ( = ?auto_124 ?auto_127 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_116 ?auto_127 ?auto_124 ?auto_128 )
      ( !LOAD-TRUCK ?auto_114 ?auto_116 ?auto_124 )
      ( !DRIVE-TRUCK ?auto_116 ?auto_124 ?auto_115 ?auto_121 )
      ( !UNLOAD-TRUCK ?auto_114 ?auto_116 ?auto_115 )
      ( DELIVER-1PKG-VERIFY ?auto_114 ?auto_115 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_151 - OBJ
      ?auto_153 - OBJ
      ?auto_160 - LOCATION
    )
    :vars
    (
      ?auto_156 - LOCATION
      ?auto_155 - CITY
      ?auto_158 - CITY
      ?auto_165 - LOCATION
      ?auto_162 - CITY
      ?auto_157 - TRUCK
      ?auto_166 - LOCATION
      ?auto_161 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_153 ?auto_151 ) ( IN-CITY ?auto_156 ?auto_155 ) ( IN-CITY ?auto_160 ?auto_155 ) ( not ( = ?auto_160 ?auto_156 ) ) ( OBJ-AT ?auto_153 ?auto_156 ) ( IN-CITY ?auto_160 ?auto_158 ) ( IN-CITY ?auto_156 ?auto_158 ) ( IN-CITY ?auto_165 ?auto_162 ) ( IN-CITY ?auto_160 ?auto_162 ) ( not ( = ?auto_160 ?auto_165 ) ) ( OBJ-AT ?auto_151 ?auto_165 ) ( TRUCK-AT ?auto_157 ?auto_166 ) ( IN-CITY ?auto_166 ?auto_161 ) ( IN-CITY ?auto_165 ?auto_161 ) ( not ( = ?auto_165 ?auto_166 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_151 ?auto_160 )
      ( DELIVER-1PKG ?auto_153 ?auto_160 )
      ( DELIVER-2PKG-VERIFY ?auto_151 ?auto_153 ?auto_160 ) )
  )

)

