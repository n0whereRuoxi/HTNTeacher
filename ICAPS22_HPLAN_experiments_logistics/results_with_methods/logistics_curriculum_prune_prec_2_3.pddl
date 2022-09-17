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
      ?auto_170 - OBJ
      ?auto_171 - LOCATION
    )
    :vars
    (
      ?auto_180 - LOCATION
      ?auto_177 - CITY
      ?auto_172 - TRUCK
      ?auto_183 - LOCATION
      ?auto_184 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_180 ?auto_177 ) ( IN-CITY ?auto_171 ?auto_177 ) ( not ( = ?auto_171 ?auto_180 ) ) ( OBJ-AT ?auto_170 ?auto_180 ) ( TRUCK-AT ?auto_172 ?auto_183 ) ( IN-CITY ?auto_183 ?auto_184 ) ( IN-CITY ?auto_180 ?auto_184 ) ( not ( = ?auto_180 ?auto_183 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_172 ?auto_183 ?auto_180 ?auto_184 )
      ( !LOAD-TRUCK ?auto_170 ?auto_172 ?auto_180 )
      ( !DRIVE-TRUCK ?auto_172 ?auto_180 ?auto_171 ?auto_177 )
      ( !UNLOAD-TRUCK ?auto_170 ?auto_172 ?auto_171 )
      ( DELIVER-1PKG-VERIFY ?auto_170 ?auto_171 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_207 - OBJ
      ?auto_209 - OBJ
      ?auto_213 - LOCATION
    )
    :vars
    (
      ?auto_214 - LOCATION
      ?auto_211 - CITY
      ?auto_212 - CITY
      ?auto_219 - LOCATION
      ?auto_220 - CITY
      ?auto_216 - TRUCK
      ?auto_222 - LOCATION
      ?auto_217 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_209 ?auto_207 ) ( IN-CITY ?auto_214 ?auto_211 ) ( IN-CITY ?auto_213 ?auto_211 ) ( not ( = ?auto_213 ?auto_214 ) ) ( OBJ-AT ?auto_209 ?auto_214 ) ( IN-CITY ?auto_213 ?auto_212 ) ( IN-CITY ?auto_214 ?auto_212 ) ( IN-CITY ?auto_219 ?auto_220 ) ( IN-CITY ?auto_213 ?auto_220 ) ( not ( = ?auto_213 ?auto_219 ) ) ( OBJ-AT ?auto_207 ?auto_219 ) ( TRUCK-AT ?auto_216 ?auto_222 ) ( IN-CITY ?auto_222 ?auto_217 ) ( IN-CITY ?auto_219 ?auto_217 ) ( not ( = ?auto_219 ?auto_222 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_207 ?auto_213 )
      ( DELIVER-1PKG ?auto_209 ?auto_213 )
      ( DELIVER-2PKG-VERIFY ?auto_207 ?auto_209 ?auto_213 ) )
  )

)

