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
      ?auto_177 - OBJ
      ?auto_176 - LOCATION
    )
    :vars
    (
      ?auto_179 - LOCATION
      ?auto_180 - CITY
      ?auto_178 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179 ?auto_180 ) ( IN-CITY ?auto_176 ?auto_180 ) ( not ( = ?auto_176 ?auto_179 ) ) ( OBJ-AT ?auto_177 ?auto_179 ) ( TRUCK-AT ?auto_178 ?auto_176 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_178 ?auto_176 ?auto_179 ?auto_180 )
      ( !LOAD-TRUCK ?auto_177 ?auto_178 ?auto_179 )
      ( !DRIVE-TRUCK ?auto_178 ?auto_179 ?auto_176 ?auto_180 )
      ( !UNLOAD-TRUCK ?auto_177 ?auto_178 ?auto_176 )
      ( DELIVER-1PKG-VERIFY ?auto_177 ?auto_176 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_184 - OBJ
      ?auto_183 - LOCATION
    )
    :vars
    (
      ?auto_186 - LOCATION
      ?auto_187 - CITY
      ?auto_185 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186 ?auto_187 ) ( IN-CITY ?auto_183 ?auto_187 ) ( not ( = ?auto_183 ?auto_186 ) ) ( OBJ-AT ?auto_184 ?auto_186 ) ( TRUCK-AT ?auto_185 ?auto_183 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_185 ?auto_183 ?auto_186 ?auto_187 )
      ( !LOAD-TRUCK ?auto_184 ?auto_185 ?auto_186 )
      ( !DRIVE-TRUCK ?auto_185 ?auto_186 ?auto_183 ?auto_187 )
      ( !UNLOAD-TRUCK ?auto_184 ?auto_185 ?auto_183 )
      ( DELIVER-1PKG-VERIFY ?auto_184 ?auto_183 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_198 - OBJ
      ?auto_199 - OBJ
      ?auto_197 - LOCATION
    )
    :vars
    (
      ?auto_202 - LOCATION
      ?auto_201 - CITY
      ?auto_203 - LOCATION
      ?auto_200 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_202 ?auto_201 ) ( IN-CITY ?auto_197 ?auto_201 ) ( not ( = ?auto_197 ?auto_202 ) ) ( OBJ-AT ?auto_199 ?auto_202 ) ( IN-CITY ?auto_203 ?auto_201 ) ( not ( = ?auto_197 ?auto_203 ) ) ( OBJ-AT ?auto_198 ?auto_203 ) ( TRUCK-AT ?auto_200 ?auto_197 ) ( not ( = ?auto_198 ?auto_199 ) ) ( not ( = ?auto_202 ?auto_203 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_198 ?auto_197 )
      ( DELIVER-1PKG ?auto_199 ?auto_197 )
      ( DELIVER-2PKG-VERIFY ?auto_198 ?auto_199 ?auto_197 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_205 - OBJ
      ?auto_206 - OBJ
      ?auto_204 - LOCATION
    )
    :vars
    (
      ?auto_207 - LOCATION
      ?auto_208 - CITY
      ?auto_210 - LOCATION
      ?auto_209 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_207 ?auto_208 ) ( IN-CITY ?auto_204 ?auto_208 ) ( not ( = ?auto_204 ?auto_207 ) ) ( OBJ-AT ?auto_205 ?auto_207 ) ( IN-CITY ?auto_210 ?auto_208 ) ( not ( = ?auto_204 ?auto_210 ) ) ( OBJ-AT ?auto_206 ?auto_210 ) ( TRUCK-AT ?auto_209 ?auto_204 ) ( not ( = ?auto_206 ?auto_205 ) ) ( not ( = ?auto_207 ?auto_210 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_206 ?auto_205 ?auto_204 )
      ( DELIVER-2PKG-VERIFY ?auto_205 ?auto_206 ?auto_204 ) )
  )

)

