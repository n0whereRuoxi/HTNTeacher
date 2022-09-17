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
      ?auto_282 - OBJ
      ?auto_283 - LOCATION
    )
    :vars
    (
      ?auto_292 - LOCATION
      ?auto_289 - CITY
      ?auto_284 - TRUCK
      ?auto_295 - LOCATION
      ?auto_296 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_292 ?auto_289 ) ( IN-CITY ?auto_283 ?auto_289 ) ( not ( = ?auto_283 ?auto_292 ) ) ( OBJ-AT ?auto_282 ?auto_292 ) ( TRUCK-AT ?auto_284 ?auto_295 ) ( IN-CITY ?auto_295 ?auto_296 ) ( IN-CITY ?auto_292 ?auto_296 ) ( not ( = ?auto_292 ?auto_295 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_284 ?auto_295 ?auto_292 ?auto_296 )
      ( !LOAD-TRUCK ?auto_282 ?auto_284 ?auto_292 )
      ( !DRIVE-TRUCK ?auto_284 ?auto_292 ?auto_283 ?auto_289 )
      ( !UNLOAD-TRUCK ?auto_282 ?auto_284 ?auto_283 )
      ( DELIVER-1PKG-VERIFY ?auto_282 ?auto_283 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_319 - OBJ
      ?auto_321 - OBJ
      ?auto_326 - LOCATION
    )
    :vars
    (
      ?auto_328 - LOCATION
      ?auto_322 - CITY
      ?auto_323 - CITY
      ?auto_335 - LOCATION
      ?auto_332 - CITY
      ?auto_325 - TRUCK
      ?auto_329 - LOCATION
      ?auto_330 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_321 ?auto_319 ) ( IN-CITY ?auto_328 ?auto_322 ) ( IN-CITY ?auto_326 ?auto_322 ) ( not ( = ?auto_326 ?auto_328 ) ) ( OBJ-AT ?auto_321 ?auto_328 ) ( IN-CITY ?auto_326 ?auto_323 ) ( IN-CITY ?auto_328 ?auto_323 ) ( IN-CITY ?auto_335 ?auto_332 ) ( IN-CITY ?auto_326 ?auto_332 ) ( not ( = ?auto_326 ?auto_335 ) ) ( OBJ-AT ?auto_319 ?auto_335 ) ( TRUCK-AT ?auto_325 ?auto_329 ) ( IN-CITY ?auto_329 ?auto_330 ) ( IN-CITY ?auto_335 ?auto_330 ) ( not ( = ?auto_335 ?auto_329 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_319 ?auto_326 )
      ( DELIVER-1PKG ?auto_321 ?auto_326 )
      ( DELIVER-2PKG-VERIFY ?auto_319 ?auto_321 ?auto_326 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_358 - OBJ
      ?auto_360 - OBJ
      ?auto_361 - OBJ
      ?auto_364 - LOCATION
    )
    :vars
    (
      ?auto_368 - LOCATION
      ?auto_365 - CITY
      ?auto_366 - CITY
      ?auto_378 - LOCATION
      ?auto_377 - CITY
      ?auto_379 - CITY
      ?auto_374 - LOCATION
      ?auto_375 - CITY
      ?auto_363 - TRUCK
      ?auto_373 - LOCATION
      ?auto_371 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_360 ?auto_358 ) ( GREATER-THAN ?auto_361 ?auto_358 ) ( GREATER-THAN ?auto_361 ?auto_360 ) ( IN-CITY ?auto_368 ?auto_365 ) ( IN-CITY ?auto_364 ?auto_365 ) ( not ( = ?auto_364 ?auto_368 ) ) ( OBJ-AT ?auto_361 ?auto_368 ) ( IN-CITY ?auto_364 ?auto_366 ) ( IN-CITY ?auto_368 ?auto_366 ) ( IN-CITY ?auto_378 ?auto_377 ) ( IN-CITY ?auto_364 ?auto_377 ) ( not ( = ?auto_364 ?auto_378 ) ) ( OBJ-AT ?auto_360 ?auto_378 ) ( IN-CITY ?auto_364 ?auto_379 ) ( IN-CITY ?auto_378 ?auto_379 ) ( IN-CITY ?auto_374 ?auto_375 ) ( IN-CITY ?auto_364 ?auto_375 ) ( not ( = ?auto_364 ?auto_374 ) ) ( OBJ-AT ?auto_358 ?auto_374 ) ( TRUCK-AT ?auto_363 ?auto_373 ) ( IN-CITY ?auto_373 ?auto_371 ) ( IN-CITY ?auto_374 ?auto_371 ) ( not ( = ?auto_374 ?auto_373 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_358 ?auto_360 ?auto_364 )
      ( DELIVER-1PKG ?auto_361 ?auto_364 )
      ( DELIVER-3PKG-VERIFY ?auto_358 ?auto_360 ?auto_361 ?auto_364 ) )
  )

)

