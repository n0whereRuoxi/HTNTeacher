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
      ?auto_382 - OBJ
      ?auto_383 - LOCATION
    )
    :vars
    (
      ?auto_392 - LOCATION
      ?auto_389 - CITY
      ?auto_384 - TRUCK
      ?auto_395 - LOCATION
      ?auto_396 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_392 ?auto_389 ) ( IN-CITY ?auto_383 ?auto_389 ) ( not ( = ?auto_383 ?auto_392 ) ) ( OBJ-AT ?auto_382 ?auto_392 ) ( TRUCK-AT ?auto_384 ?auto_395 ) ( IN-CITY ?auto_395 ?auto_396 ) ( IN-CITY ?auto_392 ?auto_396 ) ( not ( = ?auto_392 ?auto_395 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_384 ?auto_395 ?auto_392 ?auto_396 )
      ( !LOAD-TRUCK ?auto_382 ?auto_384 ?auto_392 )
      ( !DRIVE-TRUCK ?auto_384 ?auto_392 ?auto_383 ?auto_389 )
      ( !UNLOAD-TRUCK ?auto_382 ?auto_384 ?auto_383 )
      ( DELIVER-1PKG-VERIFY ?auto_382 ?auto_383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_419 - OBJ
      ?auto_421 - OBJ
      ?auto_425 - LOCATION
    )
    :vars
    (
      ?auto_428 - LOCATION
      ?auto_423 - CITY
      ?auto_427 - CITY
      ?auto_435 - LOCATION
      ?auto_434 - CITY
      ?auto_422 - TRUCK
      ?auto_432 - LOCATION
      ?auto_433 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_421 ?auto_419 ) ( IN-CITY ?auto_428 ?auto_423 ) ( IN-CITY ?auto_425 ?auto_423 ) ( not ( = ?auto_425 ?auto_428 ) ) ( OBJ-AT ?auto_421 ?auto_428 ) ( IN-CITY ?auto_425 ?auto_427 ) ( IN-CITY ?auto_428 ?auto_427 ) ( IN-CITY ?auto_435 ?auto_434 ) ( IN-CITY ?auto_425 ?auto_434 ) ( not ( = ?auto_425 ?auto_435 ) ) ( OBJ-AT ?auto_419 ?auto_435 ) ( TRUCK-AT ?auto_422 ?auto_432 ) ( IN-CITY ?auto_432 ?auto_433 ) ( IN-CITY ?auto_435 ?auto_433 ) ( not ( = ?auto_435 ?auto_432 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_419 ?auto_425 )
      ( DELIVER-1PKG ?auto_421 ?auto_425 )
      ( DELIVER-2PKG-VERIFY ?auto_419 ?auto_421 ?auto_425 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_458 - OBJ
      ?auto_460 - OBJ
      ?auto_461 - OBJ
      ?auto_466 - LOCATION
    )
    :vars
    (
      ?auto_468 - LOCATION
      ?auto_463 - CITY
      ?auto_467 - CITY
      ?auto_477 - LOCATION
      ?auto_479 - CITY
      ?auto_478 - CITY
      ?auto_469 - LOCATION
      ?auto_470 - CITY
      ?auto_462 - TRUCK
      ?auto_471 - LOCATION
      ?auto_472 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_460 ?auto_458 ) ( GREATER-THAN ?auto_461 ?auto_458 ) ( GREATER-THAN ?auto_461 ?auto_460 ) ( IN-CITY ?auto_468 ?auto_463 ) ( IN-CITY ?auto_466 ?auto_463 ) ( not ( = ?auto_466 ?auto_468 ) ) ( OBJ-AT ?auto_461 ?auto_468 ) ( IN-CITY ?auto_466 ?auto_467 ) ( IN-CITY ?auto_468 ?auto_467 ) ( IN-CITY ?auto_477 ?auto_479 ) ( IN-CITY ?auto_466 ?auto_479 ) ( not ( = ?auto_466 ?auto_477 ) ) ( OBJ-AT ?auto_460 ?auto_477 ) ( IN-CITY ?auto_466 ?auto_478 ) ( IN-CITY ?auto_477 ?auto_478 ) ( IN-CITY ?auto_469 ?auto_470 ) ( IN-CITY ?auto_466 ?auto_470 ) ( not ( = ?auto_466 ?auto_469 ) ) ( OBJ-AT ?auto_458 ?auto_469 ) ( TRUCK-AT ?auto_462 ?auto_471 ) ( IN-CITY ?auto_471 ?auto_472 ) ( IN-CITY ?auto_469 ?auto_472 ) ( not ( = ?auto_469 ?auto_471 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_458 ?auto_460 ?auto_466 )
      ( DELIVER-1PKG ?auto_461 ?auto_466 )
      ( DELIVER-3PKG-VERIFY ?auto_458 ?auto_460 ?auto_461 ?auto_466 ) )
  )

)

