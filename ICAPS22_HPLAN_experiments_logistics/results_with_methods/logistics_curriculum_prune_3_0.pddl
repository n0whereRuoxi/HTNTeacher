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
      ?auto_200 - OBJ
      ?auto_199 - LOCATION
    )
    :vars
    (
      ?auto_202 - LOCATION
      ?auto_203 - CITY
      ?auto_201 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_202 ?auto_203 ) ( IN-CITY ?auto_199 ?auto_203 ) ( not ( = ?auto_199 ?auto_202 ) ) ( OBJ-AT ?auto_200 ?auto_202 ) ( TRUCK-AT ?auto_201 ?auto_199 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_201 ?auto_199 ?auto_202 ?auto_203 )
      ( !LOAD-TRUCK ?auto_200 ?auto_201 ?auto_202 )
      ( !DRIVE-TRUCK ?auto_201 ?auto_202 ?auto_199 ?auto_203 )
      ( !UNLOAD-TRUCK ?auto_200 ?auto_201 ?auto_199 )
      ( DELIVER-1PKG-VERIFY ?auto_200 ?auto_199 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_221 - OBJ
      ?auto_222 - OBJ
      ?auto_220 - LOCATION
    )
    :vars
    (
      ?auto_224 - LOCATION
      ?auto_225 - CITY
      ?auto_226 - LOCATION
      ?auto_223 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224 ?auto_225 ) ( IN-CITY ?auto_220 ?auto_225 ) ( not ( = ?auto_220 ?auto_224 ) ) ( OBJ-AT ?auto_222 ?auto_224 ) ( IN-CITY ?auto_226 ?auto_225 ) ( not ( = ?auto_220 ?auto_226 ) ) ( OBJ-AT ?auto_221 ?auto_226 ) ( TRUCK-AT ?auto_223 ?auto_220 ) ( not ( = ?auto_221 ?auto_222 ) ) ( not ( = ?auto_224 ?auto_226 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_221 ?auto_220 )
      ( DELIVER-1PKG ?auto_222 ?auto_220 )
      ( DELIVER-2PKG-VERIFY ?auto_221 ?auto_222 ?auto_220 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_331 - OBJ
      ?auto_332 - OBJ
      ?auto_333 - OBJ
      ?auto_330 - LOCATION
    )
    :vars
    (
      ?auto_334 - LOCATION
      ?auto_336 - CITY
      ?auto_337 - LOCATION
      ?auto_335 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_334 ?auto_336 ) ( IN-CITY ?auto_330 ?auto_336 ) ( not ( = ?auto_330 ?auto_334 ) ) ( OBJ-AT ?auto_333 ?auto_334 ) ( OBJ-AT ?auto_332 ?auto_334 ) ( IN-CITY ?auto_337 ?auto_336 ) ( not ( = ?auto_330 ?auto_337 ) ) ( OBJ-AT ?auto_331 ?auto_337 ) ( TRUCK-AT ?auto_335 ?auto_330 ) ( not ( = ?auto_331 ?auto_332 ) ) ( not ( = ?auto_334 ?auto_337 ) ) ( not ( = ?auto_331 ?auto_333 ) ) ( not ( = ?auto_332 ?auto_333 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_331 ?auto_332 ?auto_330 )
      ( DELIVER-1PKG ?auto_333 ?auto_330 )
      ( DELIVER-3PKG-VERIFY ?auto_331 ?auto_332 ?auto_333 ?auto_330 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_361 - OBJ
      ?auto_362 - OBJ
      ?auto_363 - OBJ
      ?auto_360 - LOCATION
    )
    :vars
    (
      ?auto_366 - LOCATION
      ?auto_365 - CITY
      ?auto_367 - LOCATION
      ?auto_364 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_366 ?auto_365 ) ( IN-CITY ?auto_360 ?auto_365 ) ( not ( = ?auto_360 ?auto_366 ) ) ( OBJ-AT ?auto_363 ?auto_366 ) ( OBJ-AT ?auto_361 ?auto_366 ) ( IN-CITY ?auto_367 ?auto_365 ) ( not ( = ?auto_360 ?auto_367 ) ) ( OBJ-AT ?auto_362 ?auto_367 ) ( TRUCK-AT ?auto_364 ?auto_360 ) ( not ( = ?auto_362 ?auto_361 ) ) ( not ( = ?auto_366 ?auto_367 ) ) ( not ( = ?auto_362 ?auto_363 ) ) ( not ( = ?auto_361 ?auto_363 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_362 ?auto_361 ?auto_363 ?auto_360 )
      ( DELIVER-3PKG-VERIFY ?auto_361 ?auto_362 ?auto_363 ?auto_360 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_378 - OBJ
      ?auto_379 - OBJ
      ?auto_380 - OBJ
      ?auto_377 - LOCATION
    )
    :vars
    (
      ?auto_383 - LOCATION
      ?auto_381 - CITY
      ?auto_382 - LOCATION
      ?auto_384 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_383 ?auto_381 ) ( IN-CITY ?auto_377 ?auto_381 ) ( not ( = ?auto_377 ?auto_383 ) ) ( OBJ-AT ?auto_379 ?auto_383 ) ( OBJ-AT ?auto_378 ?auto_383 ) ( IN-CITY ?auto_382 ?auto_381 ) ( not ( = ?auto_377 ?auto_382 ) ) ( OBJ-AT ?auto_380 ?auto_382 ) ( TRUCK-AT ?auto_384 ?auto_377 ) ( not ( = ?auto_380 ?auto_378 ) ) ( not ( = ?auto_383 ?auto_382 ) ) ( not ( = ?auto_380 ?auto_379 ) ) ( not ( = ?auto_378 ?auto_379 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_378 ?auto_380 ?auto_379 ?auto_377 )
      ( DELIVER-3PKG-VERIFY ?auto_378 ?auto_379 ?auto_380 ?auto_377 ) )
  )

)

