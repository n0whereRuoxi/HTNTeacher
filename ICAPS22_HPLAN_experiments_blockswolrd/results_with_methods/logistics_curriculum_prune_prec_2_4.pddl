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
      ?auto_163 - OBJ
      ?auto_162 - LOCATION
    )
    :vars
    (
      ?auto_165 - LOCATION
      ?auto_166 - CITY
      ?auto_164 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165 ?auto_166 ) ( IN-CITY ?auto_162 ?auto_166 ) ( not ( = ?auto_162 ?auto_165 ) ) ( OBJ-AT ?auto_163 ?auto_165 ) ( TRUCK-AT ?auto_164 ?auto_162 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_164 ?auto_162 ?auto_165 ?auto_166 )
      ( !LOAD-TRUCK ?auto_163 ?auto_164 ?auto_165 )
      ( !DRIVE-TRUCK ?auto_164 ?auto_165 ?auto_162 ?auto_166 )
      ( !UNLOAD-TRUCK ?auto_163 ?auto_164 ?auto_162 )
      ( DELIVER-1PKG-VERIFY ?auto_163 ?auto_162 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_184 - OBJ
      ?auto_185 - OBJ
      ?auto_183 - LOCATION
    )
    :vars
    (
      ?auto_188 - LOCATION
      ?auto_187 - CITY
      ?auto_189 - LOCATION
      ?auto_186 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_188 ?auto_187 ) ( IN-CITY ?auto_183 ?auto_187 ) ( not ( = ?auto_183 ?auto_188 ) ) ( OBJ-AT ?auto_185 ?auto_188 ) ( IN-CITY ?auto_189 ?auto_187 ) ( not ( = ?auto_183 ?auto_189 ) ) ( OBJ-AT ?auto_184 ?auto_189 ) ( TRUCK-AT ?auto_186 ?auto_183 ) ( not ( = ?auto_184 ?auto_185 ) ) ( not ( = ?auto_188 ?auto_189 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_184 ?auto_183 )
      ( DELIVER-1PKG ?auto_185 ?auto_183 )
      ( DELIVER-2PKG-VERIFY ?auto_184 ?auto_185 ?auto_183 ) )
  )

)

