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

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_204 - OBJ
      ?auto_203 - LOCATION
    )
    :vars
    (
      ?auto_206 - LOCATION
      ?auto_207 - CITY
      ?auto_205 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_206 ?auto_207 ) ( IN-CITY ?auto_203 ?auto_207 ) ( not ( = ?auto_203 ?auto_206 ) ) ( OBJ-AT ?auto_204 ?auto_206 ) ( TRUCK-AT ?auto_205 ?auto_203 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_205 ?auto_203 ?auto_206 ?auto_207 )
      ( !LOAD-TRUCK ?auto_204 ?auto_205 ?auto_206 )
      ( !DRIVE-TRUCK ?auto_205 ?auto_206 ?auto_203 ?auto_207 )
      ( !UNLOAD-TRUCK ?auto_204 ?auto_205 ?auto_203 )
      ( DELIVER-1PKG-VERIFY ?auto_204 ?auto_203 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_225 - OBJ
      ?auto_226 - OBJ
      ?auto_224 - LOCATION
    )
    :vars
    (
      ?auto_228 - LOCATION
      ?auto_229 - CITY
      ?auto_230 - LOCATION
      ?auto_227 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228 ?auto_229 ) ( IN-CITY ?auto_224 ?auto_229 ) ( not ( = ?auto_224 ?auto_228 ) ) ( OBJ-AT ?auto_226 ?auto_228 ) ( IN-CITY ?auto_230 ?auto_229 ) ( not ( = ?auto_224 ?auto_230 ) ) ( OBJ-AT ?auto_225 ?auto_230 ) ( TRUCK-AT ?auto_227 ?auto_224 ) ( not ( = ?auto_225 ?auto_226 ) ) ( not ( = ?auto_228 ?auto_230 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_225 ?auto_224 )
      ( DELIVER-1PKG ?auto_226 ?auto_224 )
      ( DELIVER-2PKG-VERIFY ?auto_225 ?auto_226 ?auto_224 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_336 - OBJ
      ?auto_337 - OBJ
      ?auto_338 - OBJ
      ?auto_335 - LOCATION
    )
    :vars
    (
      ?auto_340 - LOCATION
      ?auto_339 - CITY
      ?auto_343 - LOCATION
      ?auto_342 - LOCATION
      ?auto_341 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_340 ?auto_339 ) ( IN-CITY ?auto_335 ?auto_339 ) ( not ( = ?auto_335 ?auto_340 ) ) ( OBJ-AT ?auto_338 ?auto_340 ) ( IN-CITY ?auto_343 ?auto_339 ) ( not ( = ?auto_335 ?auto_343 ) ) ( OBJ-AT ?auto_337 ?auto_343 ) ( IN-CITY ?auto_342 ?auto_339 ) ( not ( = ?auto_335 ?auto_342 ) ) ( OBJ-AT ?auto_336 ?auto_342 ) ( TRUCK-AT ?auto_341 ?auto_335 ) ( not ( = ?auto_336 ?auto_337 ) ) ( not ( = ?auto_343 ?auto_342 ) ) ( not ( = ?auto_336 ?auto_338 ) ) ( not ( = ?auto_337 ?auto_338 ) ) ( not ( = ?auto_340 ?auto_343 ) ) ( not ( = ?auto_340 ?auto_342 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_336 ?auto_337 ?auto_335 )
      ( DELIVER-1PKG ?auto_338 ?auto_335 )
      ( DELIVER-3PKG-VERIFY ?auto_336 ?auto_337 ?auto_338 ?auto_335 ) )
  )

)

