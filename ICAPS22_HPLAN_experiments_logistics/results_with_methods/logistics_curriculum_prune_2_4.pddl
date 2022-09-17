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
      ?auto_159 - OBJ
      ?auto_158 - LOCATION
    )
    :vars
    (
      ?auto_161 - LOCATION
      ?auto_162 - CITY
      ?auto_160 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_161 ?auto_162 ) ( IN-CITY ?auto_158 ?auto_162 ) ( not ( = ?auto_158 ?auto_161 ) ) ( OBJ-AT ?auto_159 ?auto_161 ) ( TRUCK-AT ?auto_160 ?auto_158 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_160 ?auto_158 ?auto_161 ?auto_162 )
      ( !LOAD-TRUCK ?auto_159 ?auto_160 ?auto_161 )
      ( !DRIVE-TRUCK ?auto_160 ?auto_161 ?auto_158 ?auto_162 )
      ( !UNLOAD-TRUCK ?auto_159 ?auto_160 ?auto_158 )
      ( DELIVER-1PKG-VERIFY ?auto_159 ?auto_158 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_180 - OBJ
      ?auto_181 - OBJ
      ?auto_179 - LOCATION
    )
    :vars
    (
      ?auto_184 - LOCATION
      ?auto_183 - CITY
      ?auto_185 - LOCATION
      ?auto_182 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_184 ?auto_183 ) ( IN-CITY ?auto_179 ?auto_183 ) ( not ( = ?auto_179 ?auto_184 ) ) ( OBJ-AT ?auto_181 ?auto_184 ) ( IN-CITY ?auto_185 ?auto_183 ) ( not ( = ?auto_179 ?auto_185 ) ) ( OBJ-AT ?auto_180 ?auto_185 ) ( TRUCK-AT ?auto_182 ?auto_179 ) ( not ( = ?auto_180 ?auto_181 ) ) ( not ( = ?auto_184 ?auto_185 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_180 ?auto_179 )
      ( DELIVER-1PKG ?auto_181 ?auto_179 )
      ( DELIVER-2PKG-VERIFY ?auto_180 ?auto_181 ?auto_179 ) )
  )

)

