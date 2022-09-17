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

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55082 - OBJ
      ?auto_55081 - LOCATION
    )
    :vars
    (
      ?auto_55083 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55083 ?auto_55081 ) ( IN-TRUCK ?auto_55082 ?auto_55083 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_55082 ?auto_55083 ?auto_55081 )
      ( DELIVER-1PKG-VERIFY ?auto_55082 ?auto_55081 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55100 - OBJ
      ?auto_55099 - LOCATION
    )
    :vars
    (
      ?auto_55101 - TRUCK
      ?auto_55102 - LOCATION
      ?auto_55103 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55100 ?auto_55101 ) ( TRUCK-AT ?auto_55101 ?auto_55102 ) ( IN-CITY ?auto_55102 ?auto_55103 ) ( IN-CITY ?auto_55099 ?auto_55103 ) ( not ( = ?auto_55099 ?auto_55102 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55101 ?auto_55102 ?auto_55099 ?auto_55103 )
      ( DELIVER-1PKG ?auto_55100 ?auto_55099 )
      ( DELIVER-1PKG-VERIFY ?auto_55100 ?auto_55099 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55126 - OBJ
      ?auto_55125 - LOCATION
    )
    :vars
    (
      ?auto_55128 - TRUCK
      ?auto_55127 - LOCATION
      ?auto_55129 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55128 ?auto_55127 ) ( IN-CITY ?auto_55127 ?auto_55129 ) ( IN-CITY ?auto_55125 ?auto_55129 ) ( not ( = ?auto_55125 ?auto_55127 ) ) ( OBJ-AT ?auto_55126 ?auto_55127 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_55126 ?auto_55128 ?auto_55127 )
      ( DELIVER-1PKG ?auto_55126 ?auto_55125 )
      ( DELIVER-1PKG-VERIFY ?auto_55126 ?auto_55125 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55152 - OBJ
      ?auto_55151 - LOCATION
    )
    :vars
    (
      ?auto_55155 - LOCATION
      ?auto_55153 - CITY
      ?auto_55154 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55155 ?auto_55153 ) ( IN-CITY ?auto_55151 ?auto_55153 ) ( not ( = ?auto_55151 ?auto_55155 ) ) ( OBJ-AT ?auto_55152 ?auto_55155 ) ( TRUCK-AT ?auto_55154 ?auto_55151 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55154 ?auto_55151 ?auto_55155 ?auto_55153 )
      ( DELIVER-1PKG ?auto_55152 ?auto_55151 )
      ( DELIVER-1PKG-VERIFY ?auto_55152 ?auto_55151 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55295 - OBJ
      ?auto_55296 - OBJ
      ?auto_55294 - LOCATION
    )
    :vars
    (
      ?auto_55297 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55297 ?auto_55294 ) ( IN-TRUCK ?auto_55296 ?auto_55297 ) ( OBJ-AT ?auto_55295 ?auto_55294 ) ( not ( = ?auto_55295 ?auto_55296 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55296 ?auto_55294 )
      ( DELIVER-2PKG-VERIFY ?auto_55295 ?auto_55296 ?auto_55294 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55299 - OBJ
      ?auto_55300 - OBJ
      ?auto_55298 - LOCATION
    )
    :vars
    (
      ?auto_55301 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55301 ?auto_55298 ) ( IN-TRUCK ?auto_55299 ?auto_55301 ) ( OBJ-AT ?auto_55300 ?auto_55298 ) ( not ( = ?auto_55299 ?auto_55300 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55299 ?auto_55298 )
      ( DELIVER-2PKG-VERIFY ?auto_55299 ?auto_55300 ?auto_55298 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55307 - OBJ
      ?auto_55308 - OBJ
      ?auto_55309 - OBJ
      ?auto_55306 - LOCATION
    )
    :vars
    (
      ?auto_55310 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55310 ?auto_55306 ) ( IN-TRUCK ?auto_55309 ?auto_55310 ) ( OBJ-AT ?auto_55307 ?auto_55306 ) ( OBJ-AT ?auto_55308 ?auto_55306 ) ( not ( = ?auto_55307 ?auto_55308 ) ) ( not ( = ?auto_55307 ?auto_55309 ) ) ( not ( = ?auto_55308 ?auto_55309 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55309 ?auto_55306 )
      ( DELIVER-3PKG-VERIFY ?auto_55307 ?auto_55308 ?auto_55309 ?auto_55306 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55312 - OBJ
      ?auto_55313 - OBJ
      ?auto_55314 - OBJ
      ?auto_55311 - LOCATION
    )
    :vars
    (
      ?auto_55315 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55315 ?auto_55311 ) ( IN-TRUCK ?auto_55313 ?auto_55315 ) ( OBJ-AT ?auto_55312 ?auto_55311 ) ( OBJ-AT ?auto_55314 ?auto_55311 ) ( not ( = ?auto_55312 ?auto_55313 ) ) ( not ( = ?auto_55312 ?auto_55314 ) ) ( not ( = ?auto_55313 ?auto_55314 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55313 ?auto_55311 )
      ( DELIVER-3PKG-VERIFY ?auto_55312 ?auto_55313 ?auto_55314 ?auto_55311 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55322 - OBJ
      ?auto_55323 - OBJ
      ?auto_55324 - OBJ
      ?auto_55321 - LOCATION
    )
    :vars
    (
      ?auto_55325 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55325 ?auto_55321 ) ( IN-TRUCK ?auto_55322 ?auto_55325 ) ( OBJ-AT ?auto_55323 ?auto_55321 ) ( OBJ-AT ?auto_55324 ?auto_55321 ) ( not ( = ?auto_55322 ?auto_55323 ) ) ( not ( = ?auto_55322 ?auto_55324 ) ) ( not ( = ?auto_55323 ?auto_55324 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55322 ?auto_55321 )
      ( DELIVER-3PKG-VERIFY ?auto_55322 ?auto_55323 ?auto_55324 ?auto_55321 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55342 - OBJ
      ?auto_55343 - OBJ
      ?auto_55345 - OBJ
      ?auto_55344 - OBJ
      ?auto_55341 - LOCATION
    )
    :vars
    (
      ?auto_55346 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55346 ?auto_55341 ) ( IN-TRUCK ?auto_55344 ?auto_55346 ) ( OBJ-AT ?auto_55342 ?auto_55341 ) ( OBJ-AT ?auto_55343 ?auto_55341 ) ( OBJ-AT ?auto_55345 ?auto_55341 ) ( not ( = ?auto_55342 ?auto_55343 ) ) ( not ( = ?auto_55342 ?auto_55345 ) ) ( not ( = ?auto_55342 ?auto_55344 ) ) ( not ( = ?auto_55343 ?auto_55345 ) ) ( not ( = ?auto_55343 ?auto_55344 ) ) ( not ( = ?auto_55345 ?auto_55344 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55344 ?auto_55341 )
      ( DELIVER-4PKG-VERIFY ?auto_55342 ?auto_55343 ?auto_55345 ?auto_55344 ?auto_55341 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55348 - OBJ
      ?auto_55349 - OBJ
      ?auto_55351 - OBJ
      ?auto_55350 - OBJ
      ?auto_55347 - LOCATION
    )
    :vars
    (
      ?auto_55352 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55352 ?auto_55347 ) ( IN-TRUCK ?auto_55351 ?auto_55352 ) ( OBJ-AT ?auto_55348 ?auto_55347 ) ( OBJ-AT ?auto_55349 ?auto_55347 ) ( OBJ-AT ?auto_55350 ?auto_55347 ) ( not ( = ?auto_55348 ?auto_55349 ) ) ( not ( = ?auto_55348 ?auto_55351 ) ) ( not ( = ?auto_55348 ?auto_55350 ) ) ( not ( = ?auto_55349 ?auto_55351 ) ) ( not ( = ?auto_55349 ?auto_55350 ) ) ( not ( = ?auto_55351 ?auto_55350 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55351 ?auto_55347 )
      ( DELIVER-4PKG-VERIFY ?auto_55348 ?auto_55349 ?auto_55351 ?auto_55350 ?auto_55347 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55360 - OBJ
      ?auto_55361 - OBJ
      ?auto_55363 - OBJ
      ?auto_55362 - OBJ
      ?auto_55359 - LOCATION
    )
    :vars
    (
      ?auto_55364 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55364 ?auto_55359 ) ( IN-TRUCK ?auto_55361 ?auto_55364 ) ( OBJ-AT ?auto_55360 ?auto_55359 ) ( OBJ-AT ?auto_55363 ?auto_55359 ) ( OBJ-AT ?auto_55362 ?auto_55359 ) ( not ( = ?auto_55360 ?auto_55361 ) ) ( not ( = ?auto_55360 ?auto_55363 ) ) ( not ( = ?auto_55360 ?auto_55362 ) ) ( not ( = ?auto_55361 ?auto_55363 ) ) ( not ( = ?auto_55361 ?auto_55362 ) ) ( not ( = ?auto_55363 ?auto_55362 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55361 ?auto_55359 )
      ( DELIVER-4PKG-VERIFY ?auto_55360 ?auto_55361 ?auto_55363 ?auto_55362 ?auto_55359 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55384 - OBJ
      ?auto_55385 - OBJ
      ?auto_55387 - OBJ
      ?auto_55386 - OBJ
      ?auto_55383 - LOCATION
    )
    :vars
    (
      ?auto_55388 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55388 ?auto_55383 ) ( IN-TRUCK ?auto_55384 ?auto_55388 ) ( OBJ-AT ?auto_55385 ?auto_55383 ) ( OBJ-AT ?auto_55387 ?auto_55383 ) ( OBJ-AT ?auto_55386 ?auto_55383 ) ( not ( = ?auto_55384 ?auto_55385 ) ) ( not ( = ?auto_55384 ?auto_55387 ) ) ( not ( = ?auto_55384 ?auto_55386 ) ) ( not ( = ?auto_55385 ?auto_55387 ) ) ( not ( = ?auto_55385 ?auto_55386 ) ) ( not ( = ?auto_55387 ?auto_55386 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55384 ?auto_55383 )
      ( DELIVER-4PKG-VERIFY ?auto_55384 ?auto_55385 ?auto_55387 ?auto_55386 ?auto_55383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55437 - OBJ
      ?auto_55438 - OBJ
      ?auto_55436 - LOCATION
    )
    :vars
    (
      ?auto_55441 - TRUCK
      ?auto_55440 - LOCATION
      ?auto_55439 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55438 ?auto_55441 ) ( TRUCK-AT ?auto_55441 ?auto_55440 ) ( IN-CITY ?auto_55440 ?auto_55439 ) ( IN-CITY ?auto_55436 ?auto_55439 ) ( not ( = ?auto_55436 ?auto_55440 ) ) ( OBJ-AT ?auto_55437 ?auto_55436 ) ( not ( = ?auto_55437 ?auto_55438 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55438 ?auto_55436 )
      ( DELIVER-2PKG-VERIFY ?auto_55437 ?auto_55438 ?auto_55436 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55443 - OBJ
      ?auto_55444 - OBJ
      ?auto_55442 - LOCATION
    )
    :vars
    (
      ?auto_55446 - TRUCK
      ?auto_55447 - LOCATION
      ?auto_55445 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55443 ?auto_55446 ) ( TRUCK-AT ?auto_55446 ?auto_55447 ) ( IN-CITY ?auto_55447 ?auto_55445 ) ( IN-CITY ?auto_55442 ?auto_55445 ) ( not ( = ?auto_55442 ?auto_55447 ) ) ( OBJ-AT ?auto_55444 ?auto_55442 ) ( not ( = ?auto_55444 ?auto_55443 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55444 ?auto_55443 ?auto_55442 )
      ( DELIVER-2PKG-VERIFY ?auto_55443 ?auto_55444 ?auto_55442 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55456 - OBJ
      ?auto_55457 - OBJ
      ?auto_55458 - OBJ
      ?auto_55455 - LOCATION
    )
    :vars
    (
      ?auto_55460 - TRUCK
      ?auto_55461 - LOCATION
      ?auto_55459 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55458 ?auto_55460 ) ( TRUCK-AT ?auto_55460 ?auto_55461 ) ( IN-CITY ?auto_55461 ?auto_55459 ) ( IN-CITY ?auto_55455 ?auto_55459 ) ( not ( = ?auto_55455 ?auto_55461 ) ) ( OBJ-AT ?auto_55456 ?auto_55455 ) ( not ( = ?auto_55456 ?auto_55458 ) ) ( OBJ-AT ?auto_55457 ?auto_55455 ) ( not ( = ?auto_55456 ?auto_55457 ) ) ( not ( = ?auto_55457 ?auto_55458 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55456 ?auto_55458 ?auto_55455 )
      ( DELIVER-3PKG-VERIFY ?auto_55456 ?auto_55457 ?auto_55458 ?auto_55455 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55463 - OBJ
      ?auto_55464 - OBJ
      ?auto_55465 - OBJ
      ?auto_55462 - LOCATION
    )
    :vars
    (
      ?auto_55467 - TRUCK
      ?auto_55468 - LOCATION
      ?auto_55466 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55464 ?auto_55467 ) ( TRUCK-AT ?auto_55467 ?auto_55468 ) ( IN-CITY ?auto_55468 ?auto_55466 ) ( IN-CITY ?auto_55462 ?auto_55466 ) ( not ( = ?auto_55462 ?auto_55468 ) ) ( OBJ-AT ?auto_55463 ?auto_55462 ) ( not ( = ?auto_55463 ?auto_55464 ) ) ( OBJ-AT ?auto_55465 ?auto_55462 ) ( not ( = ?auto_55463 ?auto_55465 ) ) ( not ( = ?auto_55464 ?auto_55465 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55463 ?auto_55464 ?auto_55462 )
      ( DELIVER-3PKG-VERIFY ?auto_55463 ?auto_55464 ?auto_55465 ?auto_55462 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55477 - OBJ
      ?auto_55478 - OBJ
      ?auto_55479 - OBJ
      ?auto_55476 - LOCATION
    )
    :vars
    (
      ?auto_55481 - TRUCK
      ?auto_55482 - LOCATION
      ?auto_55480 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55477 ?auto_55481 ) ( TRUCK-AT ?auto_55481 ?auto_55482 ) ( IN-CITY ?auto_55482 ?auto_55480 ) ( IN-CITY ?auto_55476 ?auto_55480 ) ( not ( = ?auto_55476 ?auto_55482 ) ) ( OBJ-AT ?auto_55479 ?auto_55476 ) ( not ( = ?auto_55479 ?auto_55477 ) ) ( OBJ-AT ?auto_55478 ?auto_55476 ) ( not ( = ?auto_55477 ?auto_55478 ) ) ( not ( = ?auto_55478 ?auto_55479 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55479 ?auto_55477 ?auto_55476 )
      ( DELIVER-3PKG-VERIFY ?auto_55477 ?auto_55478 ?auto_55479 ?auto_55476 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55506 - OBJ
      ?auto_55507 - OBJ
      ?auto_55509 - OBJ
      ?auto_55508 - OBJ
      ?auto_55505 - LOCATION
    )
    :vars
    (
      ?auto_55511 - TRUCK
      ?auto_55512 - LOCATION
      ?auto_55510 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55508 ?auto_55511 ) ( TRUCK-AT ?auto_55511 ?auto_55512 ) ( IN-CITY ?auto_55512 ?auto_55510 ) ( IN-CITY ?auto_55505 ?auto_55510 ) ( not ( = ?auto_55505 ?auto_55512 ) ) ( OBJ-AT ?auto_55509 ?auto_55505 ) ( not ( = ?auto_55509 ?auto_55508 ) ) ( OBJ-AT ?auto_55506 ?auto_55505 ) ( OBJ-AT ?auto_55507 ?auto_55505 ) ( not ( = ?auto_55506 ?auto_55507 ) ) ( not ( = ?auto_55506 ?auto_55509 ) ) ( not ( = ?auto_55506 ?auto_55508 ) ) ( not ( = ?auto_55507 ?auto_55509 ) ) ( not ( = ?auto_55507 ?auto_55508 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55509 ?auto_55508 ?auto_55505 )
      ( DELIVER-4PKG-VERIFY ?auto_55506 ?auto_55507 ?auto_55509 ?auto_55508 ?auto_55505 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55514 - OBJ
      ?auto_55515 - OBJ
      ?auto_55517 - OBJ
      ?auto_55516 - OBJ
      ?auto_55513 - LOCATION
    )
    :vars
    (
      ?auto_55519 - TRUCK
      ?auto_55520 - LOCATION
      ?auto_55518 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55517 ?auto_55519 ) ( TRUCK-AT ?auto_55519 ?auto_55520 ) ( IN-CITY ?auto_55520 ?auto_55518 ) ( IN-CITY ?auto_55513 ?auto_55518 ) ( not ( = ?auto_55513 ?auto_55520 ) ) ( OBJ-AT ?auto_55516 ?auto_55513 ) ( not ( = ?auto_55516 ?auto_55517 ) ) ( OBJ-AT ?auto_55514 ?auto_55513 ) ( OBJ-AT ?auto_55515 ?auto_55513 ) ( not ( = ?auto_55514 ?auto_55515 ) ) ( not ( = ?auto_55514 ?auto_55517 ) ) ( not ( = ?auto_55514 ?auto_55516 ) ) ( not ( = ?auto_55515 ?auto_55517 ) ) ( not ( = ?auto_55515 ?auto_55516 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55516 ?auto_55517 ?auto_55513 )
      ( DELIVER-4PKG-VERIFY ?auto_55514 ?auto_55515 ?auto_55517 ?auto_55516 ?auto_55513 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55530 - OBJ
      ?auto_55531 - OBJ
      ?auto_55533 - OBJ
      ?auto_55532 - OBJ
      ?auto_55529 - LOCATION
    )
    :vars
    (
      ?auto_55535 - TRUCK
      ?auto_55536 - LOCATION
      ?auto_55534 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55531 ?auto_55535 ) ( TRUCK-AT ?auto_55535 ?auto_55536 ) ( IN-CITY ?auto_55536 ?auto_55534 ) ( IN-CITY ?auto_55529 ?auto_55534 ) ( not ( = ?auto_55529 ?auto_55536 ) ) ( OBJ-AT ?auto_55532 ?auto_55529 ) ( not ( = ?auto_55532 ?auto_55531 ) ) ( OBJ-AT ?auto_55530 ?auto_55529 ) ( OBJ-AT ?auto_55533 ?auto_55529 ) ( not ( = ?auto_55530 ?auto_55531 ) ) ( not ( = ?auto_55530 ?auto_55533 ) ) ( not ( = ?auto_55530 ?auto_55532 ) ) ( not ( = ?auto_55531 ?auto_55533 ) ) ( not ( = ?auto_55533 ?auto_55532 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55532 ?auto_55531 ?auto_55529 )
      ( DELIVER-4PKG-VERIFY ?auto_55530 ?auto_55531 ?auto_55533 ?auto_55532 ?auto_55529 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55562 - OBJ
      ?auto_55563 - OBJ
      ?auto_55565 - OBJ
      ?auto_55564 - OBJ
      ?auto_55561 - LOCATION
    )
    :vars
    (
      ?auto_55567 - TRUCK
      ?auto_55568 - LOCATION
      ?auto_55566 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55562 ?auto_55567 ) ( TRUCK-AT ?auto_55567 ?auto_55568 ) ( IN-CITY ?auto_55568 ?auto_55566 ) ( IN-CITY ?auto_55561 ?auto_55566 ) ( not ( = ?auto_55561 ?auto_55568 ) ) ( OBJ-AT ?auto_55564 ?auto_55561 ) ( not ( = ?auto_55564 ?auto_55562 ) ) ( OBJ-AT ?auto_55563 ?auto_55561 ) ( OBJ-AT ?auto_55565 ?auto_55561 ) ( not ( = ?auto_55562 ?auto_55563 ) ) ( not ( = ?auto_55562 ?auto_55565 ) ) ( not ( = ?auto_55563 ?auto_55565 ) ) ( not ( = ?auto_55563 ?auto_55564 ) ) ( not ( = ?auto_55565 ?auto_55564 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55564 ?auto_55562 ?auto_55561 )
      ( DELIVER-4PKG-VERIFY ?auto_55562 ?auto_55563 ?auto_55565 ?auto_55564 ?auto_55561 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55627 - OBJ
      ?auto_55626 - LOCATION
    )
    :vars
    (
      ?auto_55629 - TRUCK
      ?auto_55630 - LOCATION
      ?auto_55628 - CITY
      ?auto_55631 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55629 ?auto_55630 ) ( IN-CITY ?auto_55630 ?auto_55628 ) ( IN-CITY ?auto_55626 ?auto_55628 ) ( not ( = ?auto_55626 ?auto_55630 ) ) ( OBJ-AT ?auto_55631 ?auto_55626 ) ( not ( = ?auto_55631 ?auto_55627 ) ) ( OBJ-AT ?auto_55627 ?auto_55630 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_55627 ?auto_55629 ?auto_55630 )
      ( DELIVER-2PKG ?auto_55631 ?auto_55627 ?auto_55626 )
      ( DELIVER-1PKG-VERIFY ?auto_55627 ?auto_55626 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55633 - OBJ
      ?auto_55634 - OBJ
      ?auto_55632 - LOCATION
    )
    :vars
    (
      ?auto_55637 - TRUCK
      ?auto_55635 - LOCATION
      ?auto_55636 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55637 ?auto_55635 ) ( IN-CITY ?auto_55635 ?auto_55636 ) ( IN-CITY ?auto_55632 ?auto_55636 ) ( not ( = ?auto_55632 ?auto_55635 ) ) ( OBJ-AT ?auto_55633 ?auto_55632 ) ( not ( = ?auto_55633 ?auto_55634 ) ) ( OBJ-AT ?auto_55634 ?auto_55635 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55634 ?auto_55632 )
      ( DELIVER-2PKG-VERIFY ?auto_55633 ?auto_55634 ?auto_55632 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55639 - OBJ
      ?auto_55640 - OBJ
      ?auto_55638 - LOCATION
    )
    :vars
    (
      ?auto_55641 - TRUCK
      ?auto_55643 - LOCATION
      ?auto_55642 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55641 ?auto_55643 ) ( IN-CITY ?auto_55643 ?auto_55642 ) ( IN-CITY ?auto_55638 ?auto_55642 ) ( not ( = ?auto_55638 ?auto_55643 ) ) ( OBJ-AT ?auto_55640 ?auto_55638 ) ( not ( = ?auto_55640 ?auto_55639 ) ) ( OBJ-AT ?auto_55639 ?auto_55643 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55640 ?auto_55639 ?auto_55638 )
      ( DELIVER-2PKG-VERIFY ?auto_55639 ?auto_55640 ?auto_55638 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55652 - OBJ
      ?auto_55653 - OBJ
      ?auto_55654 - OBJ
      ?auto_55651 - LOCATION
    )
    :vars
    (
      ?auto_55655 - TRUCK
      ?auto_55657 - LOCATION
      ?auto_55656 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55655 ?auto_55657 ) ( IN-CITY ?auto_55657 ?auto_55656 ) ( IN-CITY ?auto_55651 ?auto_55656 ) ( not ( = ?auto_55651 ?auto_55657 ) ) ( OBJ-AT ?auto_55653 ?auto_55651 ) ( not ( = ?auto_55653 ?auto_55654 ) ) ( OBJ-AT ?auto_55654 ?auto_55657 ) ( OBJ-AT ?auto_55652 ?auto_55651 ) ( not ( = ?auto_55652 ?auto_55653 ) ) ( not ( = ?auto_55652 ?auto_55654 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55653 ?auto_55654 ?auto_55651 )
      ( DELIVER-3PKG-VERIFY ?auto_55652 ?auto_55653 ?auto_55654 ?auto_55651 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55659 - OBJ
      ?auto_55660 - OBJ
      ?auto_55661 - OBJ
      ?auto_55658 - LOCATION
    )
    :vars
    (
      ?auto_55662 - TRUCK
      ?auto_55664 - LOCATION
      ?auto_55663 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55662 ?auto_55664 ) ( IN-CITY ?auto_55664 ?auto_55663 ) ( IN-CITY ?auto_55658 ?auto_55663 ) ( not ( = ?auto_55658 ?auto_55664 ) ) ( OBJ-AT ?auto_55661 ?auto_55658 ) ( not ( = ?auto_55661 ?auto_55660 ) ) ( OBJ-AT ?auto_55660 ?auto_55664 ) ( OBJ-AT ?auto_55659 ?auto_55658 ) ( not ( = ?auto_55659 ?auto_55660 ) ) ( not ( = ?auto_55659 ?auto_55661 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55661 ?auto_55660 ?auto_55658 )
      ( DELIVER-3PKG-VERIFY ?auto_55659 ?auto_55660 ?auto_55661 ?auto_55658 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55673 - OBJ
      ?auto_55674 - OBJ
      ?auto_55675 - OBJ
      ?auto_55672 - LOCATION
    )
    :vars
    (
      ?auto_55676 - TRUCK
      ?auto_55678 - LOCATION
      ?auto_55677 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55676 ?auto_55678 ) ( IN-CITY ?auto_55678 ?auto_55677 ) ( IN-CITY ?auto_55672 ?auto_55677 ) ( not ( = ?auto_55672 ?auto_55678 ) ) ( OBJ-AT ?auto_55675 ?auto_55672 ) ( not ( = ?auto_55675 ?auto_55673 ) ) ( OBJ-AT ?auto_55673 ?auto_55678 ) ( OBJ-AT ?auto_55674 ?auto_55672 ) ( not ( = ?auto_55673 ?auto_55674 ) ) ( not ( = ?auto_55674 ?auto_55675 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55675 ?auto_55673 ?auto_55672 )
      ( DELIVER-3PKG-VERIFY ?auto_55673 ?auto_55674 ?auto_55675 ?auto_55672 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55702 - OBJ
      ?auto_55703 - OBJ
      ?auto_55705 - OBJ
      ?auto_55704 - OBJ
      ?auto_55701 - LOCATION
    )
    :vars
    (
      ?auto_55706 - TRUCK
      ?auto_55708 - LOCATION
      ?auto_55707 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55706 ?auto_55708 ) ( IN-CITY ?auto_55708 ?auto_55707 ) ( IN-CITY ?auto_55701 ?auto_55707 ) ( not ( = ?auto_55701 ?auto_55708 ) ) ( OBJ-AT ?auto_55705 ?auto_55701 ) ( not ( = ?auto_55705 ?auto_55704 ) ) ( OBJ-AT ?auto_55704 ?auto_55708 ) ( OBJ-AT ?auto_55702 ?auto_55701 ) ( OBJ-AT ?auto_55703 ?auto_55701 ) ( not ( = ?auto_55702 ?auto_55703 ) ) ( not ( = ?auto_55702 ?auto_55705 ) ) ( not ( = ?auto_55702 ?auto_55704 ) ) ( not ( = ?auto_55703 ?auto_55705 ) ) ( not ( = ?auto_55703 ?auto_55704 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55705 ?auto_55704 ?auto_55701 )
      ( DELIVER-4PKG-VERIFY ?auto_55702 ?auto_55703 ?auto_55705 ?auto_55704 ?auto_55701 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55710 - OBJ
      ?auto_55711 - OBJ
      ?auto_55713 - OBJ
      ?auto_55712 - OBJ
      ?auto_55709 - LOCATION
    )
    :vars
    (
      ?auto_55714 - TRUCK
      ?auto_55716 - LOCATION
      ?auto_55715 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55714 ?auto_55716 ) ( IN-CITY ?auto_55716 ?auto_55715 ) ( IN-CITY ?auto_55709 ?auto_55715 ) ( not ( = ?auto_55709 ?auto_55716 ) ) ( OBJ-AT ?auto_55711 ?auto_55709 ) ( not ( = ?auto_55711 ?auto_55713 ) ) ( OBJ-AT ?auto_55713 ?auto_55716 ) ( OBJ-AT ?auto_55710 ?auto_55709 ) ( OBJ-AT ?auto_55712 ?auto_55709 ) ( not ( = ?auto_55710 ?auto_55711 ) ) ( not ( = ?auto_55710 ?auto_55713 ) ) ( not ( = ?auto_55710 ?auto_55712 ) ) ( not ( = ?auto_55711 ?auto_55712 ) ) ( not ( = ?auto_55713 ?auto_55712 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55711 ?auto_55713 ?auto_55709 )
      ( DELIVER-4PKG-VERIFY ?auto_55710 ?auto_55711 ?auto_55713 ?auto_55712 ?auto_55709 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55726 - OBJ
      ?auto_55727 - OBJ
      ?auto_55729 - OBJ
      ?auto_55728 - OBJ
      ?auto_55725 - LOCATION
    )
    :vars
    (
      ?auto_55730 - TRUCK
      ?auto_55732 - LOCATION
      ?auto_55731 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55730 ?auto_55732 ) ( IN-CITY ?auto_55732 ?auto_55731 ) ( IN-CITY ?auto_55725 ?auto_55731 ) ( not ( = ?auto_55725 ?auto_55732 ) ) ( OBJ-AT ?auto_55729 ?auto_55725 ) ( not ( = ?auto_55729 ?auto_55727 ) ) ( OBJ-AT ?auto_55727 ?auto_55732 ) ( OBJ-AT ?auto_55726 ?auto_55725 ) ( OBJ-AT ?auto_55728 ?auto_55725 ) ( not ( = ?auto_55726 ?auto_55727 ) ) ( not ( = ?auto_55726 ?auto_55729 ) ) ( not ( = ?auto_55726 ?auto_55728 ) ) ( not ( = ?auto_55727 ?auto_55728 ) ) ( not ( = ?auto_55729 ?auto_55728 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55729 ?auto_55727 ?auto_55725 )
      ( DELIVER-4PKG-VERIFY ?auto_55726 ?auto_55727 ?auto_55729 ?auto_55728 ?auto_55725 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55758 - OBJ
      ?auto_55759 - OBJ
      ?auto_55761 - OBJ
      ?auto_55760 - OBJ
      ?auto_55757 - LOCATION
    )
    :vars
    (
      ?auto_55762 - TRUCK
      ?auto_55764 - LOCATION
      ?auto_55763 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55762 ?auto_55764 ) ( IN-CITY ?auto_55764 ?auto_55763 ) ( IN-CITY ?auto_55757 ?auto_55763 ) ( not ( = ?auto_55757 ?auto_55764 ) ) ( OBJ-AT ?auto_55759 ?auto_55757 ) ( not ( = ?auto_55759 ?auto_55758 ) ) ( OBJ-AT ?auto_55758 ?auto_55764 ) ( OBJ-AT ?auto_55761 ?auto_55757 ) ( OBJ-AT ?auto_55760 ?auto_55757 ) ( not ( = ?auto_55758 ?auto_55761 ) ) ( not ( = ?auto_55758 ?auto_55760 ) ) ( not ( = ?auto_55759 ?auto_55761 ) ) ( not ( = ?auto_55759 ?auto_55760 ) ) ( not ( = ?auto_55761 ?auto_55760 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55759 ?auto_55758 ?auto_55757 )
      ( DELIVER-4PKG-VERIFY ?auto_55758 ?auto_55759 ?auto_55761 ?auto_55760 ?auto_55757 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55823 - OBJ
      ?auto_55822 - LOCATION
    )
    :vars
    (
      ?auto_55826 - LOCATION
      ?auto_55825 - CITY
      ?auto_55827 - OBJ
      ?auto_55824 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55826 ?auto_55825 ) ( IN-CITY ?auto_55822 ?auto_55825 ) ( not ( = ?auto_55822 ?auto_55826 ) ) ( OBJ-AT ?auto_55827 ?auto_55822 ) ( not ( = ?auto_55827 ?auto_55823 ) ) ( OBJ-AT ?auto_55823 ?auto_55826 ) ( TRUCK-AT ?auto_55824 ?auto_55822 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55824 ?auto_55822 ?auto_55826 ?auto_55825 )
      ( DELIVER-2PKG ?auto_55827 ?auto_55823 ?auto_55822 )
      ( DELIVER-1PKG-VERIFY ?auto_55823 ?auto_55822 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55829 - OBJ
      ?auto_55830 - OBJ
      ?auto_55828 - LOCATION
    )
    :vars
    (
      ?auto_55832 - LOCATION
      ?auto_55831 - CITY
      ?auto_55833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55832 ?auto_55831 ) ( IN-CITY ?auto_55828 ?auto_55831 ) ( not ( = ?auto_55828 ?auto_55832 ) ) ( OBJ-AT ?auto_55829 ?auto_55828 ) ( not ( = ?auto_55829 ?auto_55830 ) ) ( OBJ-AT ?auto_55830 ?auto_55832 ) ( TRUCK-AT ?auto_55833 ?auto_55828 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55830 ?auto_55828 )
      ( DELIVER-2PKG-VERIFY ?auto_55829 ?auto_55830 ?auto_55828 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55835 - OBJ
      ?auto_55836 - OBJ
      ?auto_55834 - LOCATION
    )
    :vars
    (
      ?auto_55837 - LOCATION
      ?auto_55838 - CITY
      ?auto_55839 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55837 ?auto_55838 ) ( IN-CITY ?auto_55834 ?auto_55838 ) ( not ( = ?auto_55834 ?auto_55837 ) ) ( OBJ-AT ?auto_55836 ?auto_55834 ) ( not ( = ?auto_55836 ?auto_55835 ) ) ( OBJ-AT ?auto_55835 ?auto_55837 ) ( TRUCK-AT ?auto_55839 ?auto_55834 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55836 ?auto_55835 ?auto_55834 )
      ( DELIVER-2PKG-VERIFY ?auto_55835 ?auto_55836 ?auto_55834 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55848 - OBJ
      ?auto_55849 - OBJ
      ?auto_55850 - OBJ
      ?auto_55847 - LOCATION
    )
    :vars
    (
      ?auto_55851 - LOCATION
      ?auto_55852 - CITY
      ?auto_55853 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55851 ?auto_55852 ) ( IN-CITY ?auto_55847 ?auto_55852 ) ( not ( = ?auto_55847 ?auto_55851 ) ) ( OBJ-AT ?auto_55849 ?auto_55847 ) ( not ( = ?auto_55849 ?auto_55850 ) ) ( OBJ-AT ?auto_55850 ?auto_55851 ) ( TRUCK-AT ?auto_55853 ?auto_55847 ) ( OBJ-AT ?auto_55848 ?auto_55847 ) ( not ( = ?auto_55848 ?auto_55849 ) ) ( not ( = ?auto_55848 ?auto_55850 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55849 ?auto_55850 ?auto_55847 )
      ( DELIVER-3PKG-VERIFY ?auto_55848 ?auto_55849 ?auto_55850 ?auto_55847 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55855 - OBJ
      ?auto_55856 - OBJ
      ?auto_55857 - OBJ
      ?auto_55854 - LOCATION
    )
    :vars
    (
      ?auto_55858 - LOCATION
      ?auto_55859 - CITY
      ?auto_55860 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55858 ?auto_55859 ) ( IN-CITY ?auto_55854 ?auto_55859 ) ( not ( = ?auto_55854 ?auto_55858 ) ) ( OBJ-AT ?auto_55855 ?auto_55854 ) ( not ( = ?auto_55855 ?auto_55856 ) ) ( OBJ-AT ?auto_55856 ?auto_55858 ) ( TRUCK-AT ?auto_55860 ?auto_55854 ) ( OBJ-AT ?auto_55857 ?auto_55854 ) ( not ( = ?auto_55855 ?auto_55857 ) ) ( not ( = ?auto_55856 ?auto_55857 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55855 ?auto_55856 ?auto_55854 )
      ( DELIVER-3PKG-VERIFY ?auto_55855 ?auto_55856 ?auto_55857 ?auto_55854 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55869 - OBJ
      ?auto_55870 - OBJ
      ?auto_55871 - OBJ
      ?auto_55868 - LOCATION
    )
    :vars
    (
      ?auto_55872 - LOCATION
      ?auto_55873 - CITY
      ?auto_55874 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55872 ?auto_55873 ) ( IN-CITY ?auto_55868 ?auto_55873 ) ( not ( = ?auto_55868 ?auto_55872 ) ) ( OBJ-AT ?auto_55871 ?auto_55868 ) ( not ( = ?auto_55871 ?auto_55869 ) ) ( OBJ-AT ?auto_55869 ?auto_55872 ) ( TRUCK-AT ?auto_55874 ?auto_55868 ) ( OBJ-AT ?auto_55870 ?auto_55868 ) ( not ( = ?auto_55869 ?auto_55870 ) ) ( not ( = ?auto_55870 ?auto_55871 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55871 ?auto_55869 ?auto_55868 )
      ( DELIVER-3PKG-VERIFY ?auto_55869 ?auto_55870 ?auto_55871 ?auto_55868 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55898 - OBJ
      ?auto_55899 - OBJ
      ?auto_55901 - OBJ
      ?auto_55900 - OBJ
      ?auto_55897 - LOCATION
    )
    :vars
    (
      ?auto_55902 - LOCATION
      ?auto_55903 - CITY
      ?auto_55904 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55902 ?auto_55903 ) ( IN-CITY ?auto_55897 ?auto_55903 ) ( not ( = ?auto_55897 ?auto_55902 ) ) ( OBJ-AT ?auto_55898 ?auto_55897 ) ( not ( = ?auto_55898 ?auto_55900 ) ) ( OBJ-AT ?auto_55900 ?auto_55902 ) ( TRUCK-AT ?auto_55904 ?auto_55897 ) ( OBJ-AT ?auto_55899 ?auto_55897 ) ( OBJ-AT ?auto_55901 ?auto_55897 ) ( not ( = ?auto_55898 ?auto_55899 ) ) ( not ( = ?auto_55898 ?auto_55901 ) ) ( not ( = ?auto_55899 ?auto_55901 ) ) ( not ( = ?auto_55899 ?auto_55900 ) ) ( not ( = ?auto_55901 ?auto_55900 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55898 ?auto_55900 ?auto_55897 )
      ( DELIVER-4PKG-VERIFY ?auto_55898 ?auto_55899 ?auto_55901 ?auto_55900 ?auto_55897 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55906 - OBJ
      ?auto_55907 - OBJ
      ?auto_55909 - OBJ
      ?auto_55908 - OBJ
      ?auto_55905 - LOCATION
    )
    :vars
    (
      ?auto_55910 - LOCATION
      ?auto_55911 - CITY
      ?auto_55912 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55910 ?auto_55911 ) ( IN-CITY ?auto_55905 ?auto_55911 ) ( not ( = ?auto_55905 ?auto_55910 ) ) ( OBJ-AT ?auto_55906 ?auto_55905 ) ( not ( = ?auto_55906 ?auto_55909 ) ) ( OBJ-AT ?auto_55909 ?auto_55910 ) ( TRUCK-AT ?auto_55912 ?auto_55905 ) ( OBJ-AT ?auto_55907 ?auto_55905 ) ( OBJ-AT ?auto_55908 ?auto_55905 ) ( not ( = ?auto_55906 ?auto_55907 ) ) ( not ( = ?auto_55906 ?auto_55908 ) ) ( not ( = ?auto_55907 ?auto_55909 ) ) ( not ( = ?auto_55907 ?auto_55908 ) ) ( not ( = ?auto_55909 ?auto_55908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55906 ?auto_55909 ?auto_55905 )
      ( DELIVER-4PKG-VERIFY ?auto_55906 ?auto_55907 ?auto_55909 ?auto_55908 ?auto_55905 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55922 - OBJ
      ?auto_55923 - OBJ
      ?auto_55925 - OBJ
      ?auto_55924 - OBJ
      ?auto_55921 - LOCATION
    )
    :vars
    (
      ?auto_55926 - LOCATION
      ?auto_55927 - CITY
      ?auto_55928 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55926 ?auto_55927 ) ( IN-CITY ?auto_55921 ?auto_55927 ) ( not ( = ?auto_55921 ?auto_55926 ) ) ( OBJ-AT ?auto_55925 ?auto_55921 ) ( not ( = ?auto_55925 ?auto_55923 ) ) ( OBJ-AT ?auto_55923 ?auto_55926 ) ( TRUCK-AT ?auto_55928 ?auto_55921 ) ( OBJ-AT ?auto_55922 ?auto_55921 ) ( OBJ-AT ?auto_55924 ?auto_55921 ) ( not ( = ?auto_55922 ?auto_55923 ) ) ( not ( = ?auto_55922 ?auto_55925 ) ) ( not ( = ?auto_55922 ?auto_55924 ) ) ( not ( = ?auto_55923 ?auto_55924 ) ) ( not ( = ?auto_55925 ?auto_55924 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55925 ?auto_55923 ?auto_55921 )
      ( DELIVER-4PKG-VERIFY ?auto_55922 ?auto_55923 ?auto_55925 ?auto_55924 ?auto_55921 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55954 - OBJ
      ?auto_55955 - OBJ
      ?auto_55957 - OBJ
      ?auto_55956 - OBJ
      ?auto_55953 - LOCATION
    )
    :vars
    (
      ?auto_55958 - LOCATION
      ?auto_55959 - CITY
      ?auto_55960 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55958 ?auto_55959 ) ( IN-CITY ?auto_55953 ?auto_55959 ) ( not ( = ?auto_55953 ?auto_55958 ) ) ( OBJ-AT ?auto_55956 ?auto_55953 ) ( not ( = ?auto_55956 ?auto_55954 ) ) ( OBJ-AT ?auto_55954 ?auto_55958 ) ( TRUCK-AT ?auto_55960 ?auto_55953 ) ( OBJ-AT ?auto_55955 ?auto_55953 ) ( OBJ-AT ?auto_55957 ?auto_55953 ) ( not ( = ?auto_55954 ?auto_55955 ) ) ( not ( = ?auto_55954 ?auto_55957 ) ) ( not ( = ?auto_55955 ?auto_55957 ) ) ( not ( = ?auto_55955 ?auto_55956 ) ) ( not ( = ?auto_55957 ?auto_55956 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55956 ?auto_55954 ?auto_55953 )
      ( DELIVER-4PKG-VERIFY ?auto_55954 ?auto_55955 ?auto_55957 ?auto_55956 ?auto_55953 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56019 - OBJ
      ?auto_56018 - LOCATION
    )
    :vars
    (
      ?auto_56020 - LOCATION
      ?auto_56021 - CITY
      ?auto_56023 - OBJ
      ?auto_56022 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56020 ?auto_56021 ) ( IN-CITY ?auto_56018 ?auto_56021 ) ( not ( = ?auto_56018 ?auto_56020 ) ) ( not ( = ?auto_56023 ?auto_56019 ) ) ( OBJ-AT ?auto_56019 ?auto_56020 ) ( TRUCK-AT ?auto_56022 ?auto_56018 ) ( IN-TRUCK ?auto_56023 ?auto_56022 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56023 ?auto_56018 )
      ( DELIVER-2PKG ?auto_56023 ?auto_56019 ?auto_56018 )
      ( DELIVER-1PKG-VERIFY ?auto_56019 ?auto_56018 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56025 - OBJ
      ?auto_56026 - OBJ
      ?auto_56024 - LOCATION
    )
    :vars
    (
      ?auto_56028 - LOCATION
      ?auto_56029 - CITY
      ?auto_56027 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56028 ?auto_56029 ) ( IN-CITY ?auto_56024 ?auto_56029 ) ( not ( = ?auto_56024 ?auto_56028 ) ) ( not ( = ?auto_56025 ?auto_56026 ) ) ( OBJ-AT ?auto_56026 ?auto_56028 ) ( TRUCK-AT ?auto_56027 ?auto_56024 ) ( IN-TRUCK ?auto_56025 ?auto_56027 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56026 ?auto_56024 )
      ( DELIVER-2PKG-VERIFY ?auto_56025 ?auto_56026 ?auto_56024 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56031 - OBJ
      ?auto_56032 - OBJ
      ?auto_56030 - LOCATION
    )
    :vars
    (
      ?auto_56033 - LOCATION
      ?auto_56034 - CITY
      ?auto_56035 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56033 ?auto_56034 ) ( IN-CITY ?auto_56030 ?auto_56034 ) ( not ( = ?auto_56030 ?auto_56033 ) ) ( not ( = ?auto_56032 ?auto_56031 ) ) ( OBJ-AT ?auto_56031 ?auto_56033 ) ( TRUCK-AT ?auto_56035 ?auto_56030 ) ( IN-TRUCK ?auto_56032 ?auto_56035 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56032 ?auto_56031 ?auto_56030 )
      ( DELIVER-2PKG-VERIFY ?auto_56031 ?auto_56032 ?auto_56030 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56215 - OBJ
      ?auto_56214 - LOCATION
    )
    :vars
    (
      ?auto_56216 - LOCATION
      ?auto_56218 - CITY
      ?auto_56217 - OBJ
      ?auto_56219 - TRUCK
      ?auto_56220 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56216 ?auto_56218 ) ( IN-CITY ?auto_56214 ?auto_56218 ) ( not ( = ?auto_56214 ?auto_56216 ) ) ( not ( = ?auto_56217 ?auto_56215 ) ) ( OBJ-AT ?auto_56215 ?auto_56216 ) ( IN-TRUCK ?auto_56217 ?auto_56219 ) ( TRUCK-AT ?auto_56219 ?auto_56220 ) ( IN-CITY ?auto_56220 ?auto_56218 ) ( not ( = ?auto_56214 ?auto_56220 ) ) ( not ( = ?auto_56216 ?auto_56220 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56219 ?auto_56220 ?auto_56214 ?auto_56218 )
      ( DELIVER-2PKG ?auto_56217 ?auto_56215 ?auto_56214 )
      ( DELIVER-1PKG-VERIFY ?auto_56215 ?auto_56214 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56222 - OBJ
      ?auto_56223 - OBJ
      ?auto_56221 - LOCATION
    )
    :vars
    (
      ?auto_56225 - LOCATION
      ?auto_56227 - CITY
      ?auto_56224 - TRUCK
      ?auto_56226 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56225 ?auto_56227 ) ( IN-CITY ?auto_56221 ?auto_56227 ) ( not ( = ?auto_56221 ?auto_56225 ) ) ( not ( = ?auto_56222 ?auto_56223 ) ) ( OBJ-AT ?auto_56223 ?auto_56225 ) ( IN-TRUCK ?auto_56222 ?auto_56224 ) ( TRUCK-AT ?auto_56224 ?auto_56226 ) ( IN-CITY ?auto_56226 ?auto_56227 ) ( not ( = ?auto_56221 ?auto_56226 ) ) ( not ( = ?auto_56225 ?auto_56226 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56223 ?auto_56221 )
      ( DELIVER-2PKG-VERIFY ?auto_56222 ?auto_56223 ?auto_56221 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56229 - OBJ
      ?auto_56230 - OBJ
      ?auto_56228 - LOCATION
    )
    :vars
    (
      ?auto_56231 - LOCATION
      ?auto_56233 - CITY
      ?auto_56234 - TRUCK
      ?auto_56232 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56231 ?auto_56233 ) ( IN-CITY ?auto_56228 ?auto_56233 ) ( not ( = ?auto_56228 ?auto_56231 ) ) ( not ( = ?auto_56230 ?auto_56229 ) ) ( OBJ-AT ?auto_56229 ?auto_56231 ) ( IN-TRUCK ?auto_56230 ?auto_56234 ) ( TRUCK-AT ?auto_56234 ?auto_56232 ) ( IN-CITY ?auto_56232 ?auto_56233 ) ( not ( = ?auto_56228 ?auto_56232 ) ) ( not ( = ?auto_56231 ?auto_56232 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56230 ?auto_56229 ?auto_56228 )
      ( DELIVER-2PKG-VERIFY ?auto_56229 ?auto_56230 ?auto_56228 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56437 - OBJ
      ?auto_56436 - LOCATION
    )
    :vars
    (
      ?auto_56438 - LOCATION
      ?auto_56441 - CITY
      ?auto_56440 - OBJ
      ?auto_56442 - TRUCK
      ?auto_56439 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56438 ?auto_56441 ) ( IN-CITY ?auto_56436 ?auto_56441 ) ( not ( = ?auto_56436 ?auto_56438 ) ) ( not ( = ?auto_56440 ?auto_56437 ) ) ( OBJ-AT ?auto_56437 ?auto_56438 ) ( TRUCK-AT ?auto_56442 ?auto_56439 ) ( IN-CITY ?auto_56439 ?auto_56441 ) ( not ( = ?auto_56436 ?auto_56439 ) ) ( not ( = ?auto_56438 ?auto_56439 ) ) ( OBJ-AT ?auto_56440 ?auto_56439 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_56440 ?auto_56442 ?auto_56439 )
      ( DELIVER-2PKG ?auto_56440 ?auto_56437 ?auto_56436 )
      ( DELIVER-1PKG-VERIFY ?auto_56437 ?auto_56436 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56444 - OBJ
      ?auto_56445 - OBJ
      ?auto_56443 - LOCATION
    )
    :vars
    (
      ?auto_56447 - LOCATION
      ?auto_56448 - CITY
      ?auto_56449 - TRUCK
      ?auto_56446 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56447 ?auto_56448 ) ( IN-CITY ?auto_56443 ?auto_56448 ) ( not ( = ?auto_56443 ?auto_56447 ) ) ( not ( = ?auto_56444 ?auto_56445 ) ) ( OBJ-AT ?auto_56445 ?auto_56447 ) ( TRUCK-AT ?auto_56449 ?auto_56446 ) ( IN-CITY ?auto_56446 ?auto_56448 ) ( not ( = ?auto_56443 ?auto_56446 ) ) ( not ( = ?auto_56447 ?auto_56446 ) ) ( OBJ-AT ?auto_56444 ?auto_56446 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56445 ?auto_56443 )
      ( DELIVER-2PKG-VERIFY ?auto_56444 ?auto_56445 ?auto_56443 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56451 - OBJ
      ?auto_56452 - OBJ
      ?auto_56450 - LOCATION
    )
    :vars
    (
      ?auto_56453 - LOCATION
      ?auto_56456 - CITY
      ?auto_56455 - TRUCK
      ?auto_56454 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56453 ?auto_56456 ) ( IN-CITY ?auto_56450 ?auto_56456 ) ( not ( = ?auto_56450 ?auto_56453 ) ) ( not ( = ?auto_56452 ?auto_56451 ) ) ( OBJ-AT ?auto_56451 ?auto_56453 ) ( TRUCK-AT ?auto_56455 ?auto_56454 ) ( IN-CITY ?auto_56454 ?auto_56456 ) ( not ( = ?auto_56450 ?auto_56454 ) ) ( not ( = ?auto_56453 ?auto_56454 ) ) ( OBJ-AT ?auto_56452 ?auto_56454 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56452 ?auto_56451 ?auto_56450 )
      ( DELIVER-2PKG-VERIFY ?auto_56451 ?auto_56452 ?auto_56450 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57796 - OBJ
      ?auto_57797 - OBJ
      ?auto_57798 - OBJ
      ?auto_57795 - LOCATION
    )
    :vars
    (
      ?auto_57799 - TRUCK
      ?auto_57800 - LOCATION
      ?auto_57801 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57798 ?auto_57799 ) ( TRUCK-AT ?auto_57799 ?auto_57800 ) ( IN-CITY ?auto_57800 ?auto_57801 ) ( IN-CITY ?auto_57795 ?auto_57801 ) ( not ( = ?auto_57795 ?auto_57800 ) ) ( OBJ-AT ?auto_57797 ?auto_57795 ) ( not ( = ?auto_57797 ?auto_57798 ) ) ( OBJ-AT ?auto_57796 ?auto_57795 ) ( not ( = ?auto_57796 ?auto_57797 ) ) ( not ( = ?auto_57796 ?auto_57798 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57797 ?auto_57798 ?auto_57795 )
      ( DELIVER-3PKG-VERIFY ?auto_57796 ?auto_57797 ?auto_57798 ?auto_57795 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57829 - OBJ
      ?auto_57830 - OBJ
      ?auto_57831 - OBJ
      ?auto_57828 - LOCATION
    )
    :vars
    (
      ?auto_57833 - TRUCK
      ?auto_57834 - LOCATION
      ?auto_57835 - CITY
      ?auto_57832 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57831 ?auto_57833 ) ( TRUCK-AT ?auto_57833 ?auto_57834 ) ( IN-CITY ?auto_57834 ?auto_57835 ) ( IN-CITY ?auto_57828 ?auto_57835 ) ( not ( = ?auto_57828 ?auto_57834 ) ) ( OBJ-AT ?auto_57832 ?auto_57828 ) ( not ( = ?auto_57832 ?auto_57831 ) ) ( OBJ-AT ?auto_57829 ?auto_57828 ) ( OBJ-AT ?auto_57830 ?auto_57828 ) ( not ( = ?auto_57829 ?auto_57830 ) ) ( not ( = ?auto_57829 ?auto_57831 ) ) ( not ( = ?auto_57829 ?auto_57832 ) ) ( not ( = ?auto_57830 ?auto_57831 ) ) ( not ( = ?auto_57830 ?auto_57832 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57832 ?auto_57831 ?auto_57828 )
      ( DELIVER-3PKG-VERIFY ?auto_57829 ?auto_57830 ?auto_57831 ?auto_57828 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57841 - OBJ
      ?auto_57842 - OBJ
      ?auto_57843 - OBJ
      ?auto_57840 - LOCATION
    )
    :vars
    (
      ?auto_57845 - TRUCK
      ?auto_57846 - LOCATION
      ?auto_57847 - CITY
      ?auto_57844 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57842 ?auto_57845 ) ( TRUCK-AT ?auto_57845 ?auto_57846 ) ( IN-CITY ?auto_57846 ?auto_57847 ) ( IN-CITY ?auto_57840 ?auto_57847 ) ( not ( = ?auto_57840 ?auto_57846 ) ) ( OBJ-AT ?auto_57844 ?auto_57840 ) ( not ( = ?auto_57844 ?auto_57842 ) ) ( OBJ-AT ?auto_57841 ?auto_57840 ) ( OBJ-AT ?auto_57843 ?auto_57840 ) ( not ( = ?auto_57841 ?auto_57842 ) ) ( not ( = ?auto_57841 ?auto_57843 ) ) ( not ( = ?auto_57841 ?auto_57844 ) ) ( not ( = ?auto_57842 ?auto_57843 ) ) ( not ( = ?auto_57843 ?auto_57844 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57844 ?auto_57842 ?auto_57840 )
      ( DELIVER-3PKG-VERIFY ?auto_57841 ?auto_57842 ?auto_57843 ?auto_57840 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57857 - OBJ
      ?auto_57858 - OBJ
      ?auto_57859 - OBJ
      ?auto_57856 - LOCATION
    )
    :vars
    (
      ?auto_57860 - TRUCK
      ?auto_57861 - LOCATION
      ?auto_57862 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57857 ?auto_57860 ) ( TRUCK-AT ?auto_57860 ?auto_57861 ) ( IN-CITY ?auto_57861 ?auto_57862 ) ( IN-CITY ?auto_57856 ?auto_57862 ) ( not ( = ?auto_57856 ?auto_57861 ) ) ( OBJ-AT ?auto_57858 ?auto_57856 ) ( not ( = ?auto_57858 ?auto_57857 ) ) ( OBJ-AT ?auto_57859 ?auto_57856 ) ( not ( = ?auto_57857 ?auto_57859 ) ) ( not ( = ?auto_57858 ?auto_57859 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57858 ?auto_57857 ?auto_57856 )
      ( DELIVER-3PKG-VERIFY ?auto_57857 ?auto_57858 ?auto_57859 ?auto_57856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57879 - OBJ
      ?auto_57880 - OBJ
      ?auto_57881 - OBJ
      ?auto_57878 - LOCATION
    )
    :vars
    (
      ?auto_57883 - TRUCK
      ?auto_57884 - LOCATION
      ?auto_57885 - CITY
      ?auto_57882 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57879 ?auto_57883 ) ( TRUCK-AT ?auto_57883 ?auto_57884 ) ( IN-CITY ?auto_57884 ?auto_57885 ) ( IN-CITY ?auto_57878 ?auto_57885 ) ( not ( = ?auto_57878 ?auto_57884 ) ) ( OBJ-AT ?auto_57882 ?auto_57878 ) ( not ( = ?auto_57882 ?auto_57879 ) ) ( OBJ-AT ?auto_57880 ?auto_57878 ) ( OBJ-AT ?auto_57881 ?auto_57878 ) ( not ( = ?auto_57879 ?auto_57880 ) ) ( not ( = ?auto_57879 ?auto_57881 ) ) ( not ( = ?auto_57880 ?auto_57881 ) ) ( not ( = ?auto_57880 ?auto_57882 ) ) ( not ( = ?auto_57881 ?auto_57882 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57882 ?auto_57879 ?auto_57878 )
      ( DELIVER-3PKG-VERIFY ?auto_57879 ?auto_57880 ?auto_57881 ?auto_57878 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57918 - OBJ
      ?auto_57919 - OBJ
      ?auto_57921 - OBJ
      ?auto_57920 - OBJ
      ?auto_57917 - LOCATION
    )
    :vars
    (
      ?auto_57922 - TRUCK
      ?auto_57923 - LOCATION
      ?auto_57924 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57920 ?auto_57922 ) ( TRUCK-AT ?auto_57922 ?auto_57923 ) ( IN-CITY ?auto_57923 ?auto_57924 ) ( IN-CITY ?auto_57917 ?auto_57924 ) ( not ( = ?auto_57917 ?auto_57923 ) ) ( OBJ-AT ?auto_57919 ?auto_57917 ) ( not ( = ?auto_57919 ?auto_57920 ) ) ( OBJ-AT ?auto_57918 ?auto_57917 ) ( OBJ-AT ?auto_57921 ?auto_57917 ) ( not ( = ?auto_57918 ?auto_57919 ) ) ( not ( = ?auto_57918 ?auto_57921 ) ) ( not ( = ?auto_57918 ?auto_57920 ) ) ( not ( = ?auto_57919 ?auto_57921 ) ) ( not ( = ?auto_57921 ?auto_57920 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57919 ?auto_57920 ?auto_57917 )
      ( DELIVER-4PKG-VERIFY ?auto_57918 ?auto_57919 ?auto_57921 ?auto_57920 ?auto_57917 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57942 - OBJ
      ?auto_57943 - OBJ
      ?auto_57945 - OBJ
      ?auto_57944 - OBJ
      ?auto_57941 - LOCATION
    )
    :vars
    (
      ?auto_57946 - TRUCK
      ?auto_57947 - LOCATION
      ?auto_57948 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57945 ?auto_57946 ) ( TRUCK-AT ?auto_57946 ?auto_57947 ) ( IN-CITY ?auto_57947 ?auto_57948 ) ( IN-CITY ?auto_57941 ?auto_57948 ) ( not ( = ?auto_57941 ?auto_57947 ) ) ( OBJ-AT ?auto_57943 ?auto_57941 ) ( not ( = ?auto_57943 ?auto_57945 ) ) ( OBJ-AT ?auto_57942 ?auto_57941 ) ( OBJ-AT ?auto_57944 ?auto_57941 ) ( not ( = ?auto_57942 ?auto_57943 ) ) ( not ( = ?auto_57942 ?auto_57945 ) ) ( not ( = ?auto_57942 ?auto_57944 ) ) ( not ( = ?auto_57943 ?auto_57944 ) ) ( not ( = ?auto_57945 ?auto_57944 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57943 ?auto_57945 ?auto_57941 )
      ( DELIVER-4PKG-VERIFY ?auto_57942 ?auto_57943 ?auto_57945 ?auto_57944 ?auto_57941 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57966 - OBJ
      ?auto_57967 - OBJ
      ?auto_57969 - OBJ
      ?auto_57968 - OBJ
      ?auto_57965 - LOCATION
    )
    :vars
    (
      ?auto_57970 - TRUCK
      ?auto_57971 - LOCATION
      ?auto_57972 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57968 ?auto_57970 ) ( TRUCK-AT ?auto_57970 ?auto_57971 ) ( IN-CITY ?auto_57971 ?auto_57972 ) ( IN-CITY ?auto_57965 ?auto_57972 ) ( not ( = ?auto_57965 ?auto_57971 ) ) ( OBJ-AT ?auto_57966 ?auto_57965 ) ( not ( = ?auto_57966 ?auto_57968 ) ) ( OBJ-AT ?auto_57967 ?auto_57965 ) ( OBJ-AT ?auto_57969 ?auto_57965 ) ( not ( = ?auto_57966 ?auto_57967 ) ) ( not ( = ?auto_57966 ?auto_57969 ) ) ( not ( = ?auto_57967 ?auto_57969 ) ) ( not ( = ?auto_57967 ?auto_57968 ) ) ( not ( = ?auto_57969 ?auto_57968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57966 ?auto_57968 ?auto_57965 )
      ( DELIVER-4PKG-VERIFY ?auto_57966 ?auto_57967 ?auto_57969 ?auto_57968 ?auto_57965 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57982 - OBJ
      ?auto_57983 - OBJ
      ?auto_57985 - OBJ
      ?auto_57984 - OBJ
      ?auto_57981 - LOCATION
    )
    :vars
    (
      ?auto_57986 - TRUCK
      ?auto_57987 - LOCATION
      ?auto_57988 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57985 ?auto_57986 ) ( TRUCK-AT ?auto_57986 ?auto_57987 ) ( IN-CITY ?auto_57987 ?auto_57988 ) ( IN-CITY ?auto_57981 ?auto_57988 ) ( not ( = ?auto_57981 ?auto_57987 ) ) ( OBJ-AT ?auto_57982 ?auto_57981 ) ( not ( = ?auto_57982 ?auto_57985 ) ) ( OBJ-AT ?auto_57983 ?auto_57981 ) ( OBJ-AT ?auto_57984 ?auto_57981 ) ( not ( = ?auto_57982 ?auto_57983 ) ) ( not ( = ?auto_57982 ?auto_57984 ) ) ( not ( = ?auto_57983 ?auto_57985 ) ) ( not ( = ?auto_57983 ?auto_57984 ) ) ( not ( = ?auto_57985 ?auto_57984 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57982 ?auto_57985 ?auto_57981 )
      ( DELIVER-4PKG-VERIFY ?auto_57982 ?auto_57983 ?auto_57985 ?auto_57984 ?auto_57981 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58006 - OBJ
      ?auto_58007 - OBJ
      ?auto_58009 - OBJ
      ?auto_58008 - OBJ
      ?auto_58005 - LOCATION
    )
    :vars
    (
      ?auto_58010 - TRUCK
      ?auto_58011 - LOCATION
      ?auto_58012 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58007 ?auto_58010 ) ( TRUCK-AT ?auto_58010 ?auto_58011 ) ( IN-CITY ?auto_58011 ?auto_58012 ) ( IN-CITY ?auto_58005 ?auto_58012 ) ( not ( = ?auto_58005 ?auto_58011 ) ) ( OBJ-AT ?auto_58009 ?auto_58005 ) ( not ( = ?auto_58009 ?auto_58007 ) ) ( OBJ-AT ?auto_58006 ?auto_58005 ) ( OBJ-AT ?auto_58008 ?auto_58005 ) ( not ( = ?auto_58006 ?auto_58007 ) ) ( not ( = ?auto_58006 ?auto_58009 ) ) ( not ( = ?auto_58006 ?auto_58008 ) ) ( not ( = ?auto_58007 ?auto_58008 ) ) ( not ( = ?auto_58009 ?auto_58008 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58009 ?auto_58007 ?auto_58005 )
      ( DELIVER-4PKG-VERIFY ?auto_58006 ?auto_58007 ?auto_58009 ?auto_58008 ?auto_58005 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58022 - OBJ
      ?auto_58023 - OBJ
      ?auto_58025 - OBJ
      ?auto_58024 - OBJ
      ?auto_58021 - LOCATION
    )
    :vars
    (
      ?auto_58026 - TRUCK
      ?auto_58027 - LOCATION
      ?auto_58028 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58023 ?auto_58026 ) ( TRUCK-AT ?auto_58026 ?auto_58027 ) ( IN-CITY ?auto_58027 ?auto_58028 ) ( IN-CITY ?auto_58021 ?auto_58028 ) ( not ( = ?auto_58021 ?auto_58027 ) ) ( OBJ-AT ?auto_58022 ?auto_58021 ) ( not ( = ?auto_58022 ?auto_58023 ) ) ( OBJ-AT ?auto_58025 ?auto_58021 ) ( OBJ-AT ?auto_58024 ?auto_58021 ) ( not ( = ?auto_58022 ?auto_58025 ) ) ( not ( = ?auto_58022 ?auto_58024 ) ) ( not ( = ?auto_58023 ?auto_58025 ) ) ( not ( = ?auto_58023 ?auto_58024 ) ) ( not ( = ?auto_58025 ?auto_58024 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58022 ?auto_58023 ?auto_58021 )
      ( DELIVER-4PKG-VERIFY ?auto_58022 ?auto_58023 ?auto_58025 ?auto_58024 ?auto_58021 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58118 - OBJ
      ?auto_58119 - OBJ
      ?auto_58121 - OBJ
      ?auto_58120 - OBJ
      ?auto_58117 - LOCATION
    )
    :vars
    (
      ?auto_58123 - TRUCK
      ?auto_58124 - LOCATION
      ?auto_58125 - CITY
      ?auto_58122 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58120 ?auto_58123 ) ( TRUCK-AT ?auto_58123 ?auto_58124 ) ( IN-CITY ?auto_58124 ?auto_58125 ) ( IN-CITY ?auto_58117 ?auto_58125 ) ( not ( = ?auto_58117 ?auto_58124 ) ) ( OBJ-AT ?auto_58122 ?auto_58117 ) ( not ( = ?auto_58122 ?auto_58120 ) ) ( OBJ-AT ?auto_58118 ?auto_58117 ) ( OBJ-AT ?auto_58119 ?auto_58117 ) ( OBJ-AT ?auto_58121 ?auto_58117 ) ( not ( = ?auto_58118 ?auto_58119 ) ) ( not ( = ?auto_58118 ?auto_58121 ) ) ( not ( = ?auto_58118 ?auto_58120 ) ) ( not ( = ?auto_58118 ?auto_58122 ) ) ( not ( = ?auto_58119 ?auto_58121 ) ) ( not ( = ?auto_58119 ?auto_58120 ) ) ( not ( = ?auto_58119 ?auto_58122 ) ) ( not ( = ?auto_58121 ?auto_58120 ) ) ( not ( = ?auto_58121 ?auto_58122 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58122 ?auto_58120 ?auto_58117 )
      ( DELIVER-4PKG-VERIFY ?auto_58118 ?auto_58119 ?auto_58121 ?auto_58120 ?auto_58117 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58135 - OBJ
      ?auto_58136 - OBJ
      ?auto_58138 - OBJ
      ?auto_58137 - OBJ
      ?auto_58134 - LOCATION
    )
    :vars
    (
      ?auto_58140 - TRUCK
      ?auto_58141 - LOCATION
      ?auto_58142 - CITY
      ?auto_58139 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58138 ?auto_58140 ) ( TRUCK-AT ?auto_58140 ?auto_58141 ) ( IN-CITY ?auto_58141 ?auto_58142 ) ( IN-CITY ?auto_58134 ?auto_58142 ) ( not ( = ?auto_58134 ?auto_58141 ) ) ( OBJ-AT ?auto_58139 ?auto_58134 ) ( not ( = ?auto_58139 ?auto_58138 ) ) ( OBJ-AT ?auto_58135 ?auto_58134 ) ( OBJ-AT ?auto_58136 ?auto_58134 ) ( OBJ-AT ?auto_58137 ?auto_58134 ) ( not ( = ?auto_58135 ?auto_58136 ) ) ( not ( = ?auto_58135 ?auto_58138 ) ) ( not ( = ?auto_58135 ?auto_58137 ) ) ( not ( = ?auto_58135 ?auto_58139 ) ) ( not ( = ?auto_58136 ?auto_58138 ) ) ( not ( = ?auto_58136 ?auto_58137 ) ) ( not ( = ?auto_58136 ?auto_58139 ) ) ( not ( = ?auto_58138 ?auto_58137 ) ) ( not ( = ?auto_58137 ?auto_58139 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58139 ?auto_58138 ?auto_58134 )
      ( DELIVER-4PKG-VERIFY ?auto_58135 ?auto_58136 ?auto_58138 ?auto_58137 ?auto_58134 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58185 - OBJ
      ?auto_58186 - OBJ
      ?auto_58188 - OBJ
      ?auto_58187 - OBJ
      ?auto_58184 - LOCATION
    )
    :vars
    (
      ?auto_58190 - TRUCK
      ?auto_58191 - LOCATION
      ?auto_58192 - CITY
      ?auto_58189 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58186 ?auto_58190 ) ( TRUCK-AT ?auto_58190 ?auto_58191 ) ( IN-CITY ?auto_58191 ?auto_58192 ) ( IN-CITY ?auto_58184 ?auto_58192 ) ( not ( = ?auto_58184 ?auto_58191 ) ) ( OBJ-AT ?auto_58189 ?auto_58184 ) ( not ( = ?auto_58189 ?auto_58186 ) ) ( OBJ-AT ?auto_58185 ?auto_58184 ) ( OBJ-AT ?auto_58188 ?auto_58184 ) ( OBJ-AT ?auto_58187 ?auto_58184 ) ( not ( = ?auto_58185 ?auto_58186 ) ) ( not ( = ?auto_58185 ?auto_58188 ) ) ( not ( = ?auto_58185 ?auto_58187 ) ) ( not ( = ?auto_58185 ?auto_58189 ) ) ( not ( = ?auto_58186 ?auto_58188 ) ) ( not ( = ?auto_58186 ?auto_58187 ) ) ( not ( = ?auto_58188 ?auto_58187 ) ) ( not ( = ?auto_58188 ?auto_58189 ) ) ( not ( = ?auto_58187 ?auto_58189 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58189 ?auto_58186 ?auto_58184 )
      ( DELIVER-4PKG-VERIFY ?auto_58185 ?auto_58186 ?auto_58188 ?auto_58187 ?auto_58184 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58229 - OBJ
      ?auto_58230 - OBJ
      ?auto_58232 - OBJ
      ?auto_58231 - OBJ
      ?auto_58228 - LOCATION
    )
    :vars
    (
      ?auto_58233 - TRUCK
      ?auto_58234 - LOCATION
      ?auto_58235 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58229 ?auto_58233 ) ( TRUCK-AT ?auto_58233 ?auto_58234 ) ( IN-CITY ?auto_58234 ?auto_58235 ) ( IN-CITY ?auto_58228 ?auto_58235 ) ( not ( = ?auto_58228 ?auto_58234 ) ) ( OBJ-AT ?auto_58232 ?auto_58228 ) ( not ( = ?auto_58232 ?auto_58229 ) ) ( OBJ-AT ?auto_58230 ?auto_58228 ) ( OBJ-AT ?auto_58231 ?auto_58228 ) ( not ( = ?auto_58229 ?auto_58230 ) ) ( not ( = ?auto_58229 ?auto_58231 ) ) ( not ( = ?auto_58230 ?auto_58232 ) ) ( not ( = ?auto_58230 ?auto_58231 ) ) ( not ( = ?auto_58232 ?auto_58231 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58232 ?auto_58229 ?auto_58228 )
      ( DELIVER-4PKG-VERIFY ?auto_58229 ?auto_58230 ?auto_58232 ?auto_58231 ?auto_58228 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58261 - OBJ
      ?auto_58262 - OBJ
      ?auto_58264 - OBJ
      ?auto_58263 - OBJ
      ?auto_58260 - LOCATION
    )
    :vars
    (
      ?auto_58265 - TRUCK
      ?auto_58266 - LOCATION
      ?auto_58267 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58261 ?auto_58265 ) ( TRUCK-AT ?auto_58265 ?auto_58266 ) ( IN-CITY ?auto_58266 ?auto_58267 ) ( IN-CITY ?auto_58260 ?auto_58267 ) ( not ( = ?auto_58260 ?auto_58266 ) ) ( OBJ-AT ?auto_58262 ?auto_58260 ) ( not ( = ?auto_58262 ?auto_58261 ) ) ( OBJ-AT ?auto_58264 ?auto_58260 ) ( OBJ-AT ?auto_58263 ?auto_58260 ) ( not ( = ?auto_58261 ?auto_58264 ) ) ( not ( = ?auto_58261 ?auto_58263 ) ) ( not ( = ?auto_58262 ?auto_58264 ) ) ( not ( = ?auto_58262 ?auto_58263 ) ) ( not ( = ?auto_58264 ?auto_58263 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58262 ?auto_58261 ?auto_58260 )
      ( DELIVER-4PKG-VERIFY ?auto_58261 ?auto_58262 ?auto_58264 ?auto_58263 ?auto_58260 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58333 - OBJ
      ?auto_58334 - OBJ
      ?auto_58336 - OBJ
      ?auto_58335 - OBJ
      ?auto_58332 - LOCATION
    )
    :vars
    (
      ?auto_58338 - TRUCK
      ?auto_58339 - LOCATION
      ?auto_58340 - CITY
      ?auto_58337 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58333 ?auto_58338 ) ( TRUCK-AT ?auto_58338 ?auto_58339 ) ( IN-CITY ?auto_58339 ?auto_58340 ) ( IN-CITY ?auto_58332 ?auto_58340 ) ( not ( = ?auto_58332 ?auto_58339 ) ) ( OBJ-AT ?auto_58337 ?auto_58332 ) ( not ( = ?auto_58337 ?auto_58333 ) ) ( OBJ-AT ?auto_58334 ?auto_58332 ) ( OBJ-AT ?auto_58336 ?auto_58332 ) ( OBJ-AT ?auto_58335 ?auto_58332 ) ( not ( = ?auto_58333 ?auto_58334 ) ) ( not ( = ?auto_58333 ?auto_58336 ) ) ( not ( = ?auto_58333 ?auto_58335 ) ) ( not ( = ?auto_58334 ?auto_58336 ) ) ( not ( = ?auto_58334 ?auto_58335 ) ) ( not ( = ?auto_58334 ?auto_58337 ) ) ( not ( = ?auto_58336 ?auto_58335 ) ) ( not ( = ?auto_58336 ?auto_58337 ) ) ( not ( = ?auto_58335 ?auto_58337 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58337 ?auto_58333 ?auto_58332 )
      ( DELIVER-4PKG-VERIFY ?auto_58333 ?auto_58334 ?auto_58336 ?auto_58335 ?auto_58332 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58495 - OBJ
      ?auto_58496 - OBJ
      ?auto_58497 - OBJ
      ?auto_58494 - LOCATION
    )
    :vars
    (
      ?auto_58498 - TRUCK
      ?auto_58499 - LOCATION
      ?auto_58500 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58498 ?auto_58499 ) ( IN-CITY ?auto_58499 ?auto_58500 ) ( IN-CITY ?auto_58494 ?auto_58500 ) ( not ( = ?auto_58494 ?auto_58499 ) ) ( OBJ-AT ?auto_58495 ?auto_58494 ) ( not ( = ?auto_58495 ?auto_58496 ) ) ( OBJ-AT ?auto_58496 ?auto_58499 ) ( OBJ-AT ?auto_58497 ?auto_58494 ) ( not ( = ?auto_58495 ?auto_58497 ) ) ( not ( = ?auto_58496 ?auto_58497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58495 ?auto_58496 ?auto_58494 )
      ( DELIVER-3PKG-VERIFY ?auto_58495 ?auto_58496 ?auto_58497 ?auto_58494 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58517 - OBJ
      ?auto_58518 - OBJ
      ?auto_58519 - OBJ
      ?auto_58516 - LOCATION
    )
    :vars
    (
      ?auto_58521 - TRUCK
      ?auto_58522 - LOCATION
      ?auto_58523 - CITY
      ?auto_58520 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58521 ?auto_58522 ) ( IN-CITY ?auto_58522 ?auto_58523 ) ( IN-CITY ?auto_58516 ?auto_58523 ) ( not ( = ?auto_58516 ?auto_58522 ) ) ( OBJ-AT ?auto_58520 ?auto_58516 ) ( not ( = ?auto_58520 ?auto_58519 ) ) ( OBJ-AT ?auto_58519 ?auto_58522 ) ( OBJ-AT ?auto_58517 ?auto_58516 ) ( OBJ-AT ?auto_58518 ?auto_58516 ) ( not ( = ?auto_58517 ?auto_58518 ) ) ( not ( = ?auto_58517 ?auto_58519 ) ) ( not ( = ?auto_58517 ?auto_58520 ) ) ( not ( = ?auto_58518 ?auto_58519 ) ) ( not ( = ?auto_58518 ?auto_58520 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58520 ?auto_58519 ?auto_58516 )
      ( DELIVER-3PKG-VERIFY ?auto_58517 ?auto_58518 ?auto_58519 ?auto_58516 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58529 - OBJ
      ?auto_58530 - OBJ
      ?auto_58531 - OBJ
      ?auto_58528 - LOCATION
    )
    :vars
    (
      ?auto_58533 - TRUCK
      ?auto_58534 - LOCATION
      ?auto_58535 - CITY
      ?auto_58532 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58533 ?auto_58534 ) ( IN-CITY ?auto_58534 ?auto_58535 ) ( IN-CITY ?auto_58528 ?auto_58535 ) ( not ( = ?auto_58528 ?auto_58534 ) ) ( OBJ-AT ?auto_58532 ?auto_58528 ) ( not ( = ?auto_58532 ?auto_58530 ) ) ( OBJ-AT ?auto_58530 ?auto_58534 ) ( OBJ-AT ?auto_58529 ?auto_58528 ) ( OBJ-AT ?auto_58531 ?auto_58528 ) ( not ( = ?auto_58529 ?auto_58530 ) ) ( not ( = ?auto_58529 ?auto_58531 ) ) ( not ( = ?auto_58529 ?auto_58532 ) ) ( not ( = ?auto_58530 ?auto_58531 ) ) ( not ( = ?auto_58531 ?auto_58532 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58532 ?auto_58530 ?auto_58528 )
      ( DELIVER-3PKG-VERIFY ?auto_58529 ?auto_58530 ?auto_58531 ?auto_58528 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58545 - OBJ
      ?auto_58546 - OBJ
      ?auto_58547 - OBJ
      ?auto_58544 - LOCATION
    )
    :vars
    (
      ?auto_58548 - TRUCK
      ?auto_58549 - LOCATION
      ?auto_58550 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58548 ?auto_58549 ) ( IN-CITY ?auto_58549 ?auto_58550 ) ( IN-CITY ?auto_58544 ?auto_58550 ) ( not ( = ?auto_58544 ?auto_58549 ) ) ( OBJ-AT ?auto_58546 ?auto_58544 ) ( not ( = ?auto_58546 ?auto_58545 ) ) ( OBJ-AT ?auto_58545 ?auto_58549 ) ( OBJ-AT ?auto_58547 ?auto_58544 ) ( not ( = ?auto_58545 ?auto_58547 ) ) ( not ( = ?auto_58546 ?auto_58547 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58546 ?auto_58545 ?auto_58544 )
      ( DELIVER-3PKG-VERIFY ?auto_58545 ?auto_58546 ?auto_58547 ?auto_58544 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58567 - OBJ
      ?auto_58568 - OBJ
      ?auto_58569 - OBJ
      ?auto_58566 - LOCATION
    )
    :vars
    (
      ?auto_58571 - TRUCK
      ?auto_58572 - LOCATION
      ?auto_58573 - CITY
      ?auto_58570 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58571 ?auto_58572 ) ( IN-CITY ?auto_58572 ?auto_58573 ) ( IN-CITY ?auto_58566 ?auto_58573 ) ( not ( = ?auto_58566 ?auto_58572 ) ) ( OBJ-AT ?auto_58570 ?auto_58566 ) ( not ( = ?auto_58570 ?auto_58567 ) ) ( OBJ-AT ?auto_58567 ?auto_58572 ) ( OBJ-AT ?auto_58568 ?auto_58566 ) ( OBJ-AT ?auto_58569 ?auto_58566 ) ( not ( = ?auto_58567 ?auto_58568 ) ) ( not ( = ?auto_58567 ?auto_58569 ) ) ( not ( = ?auto_58568 ?auto_58569 ) ) ( not ( = ?auto_58568 ?auto_58570 ) ) ( not ( = ?auto_58569 ?auto_58570 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58570 ?auto_58567 ?auto_58566 )
      ( DELIVER-3PKG-VERIFY ?auto_58567 ?auto_58568 ?auto_58569 ?auto_58566 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58606 - OBJ
      ?auto_58607 - OBJ
      ?auto_58609 - OBJ
      ?auto_58608 - OBJ
      ?auto_58605 - LOCATION
    )
    :vars
    (
      ?auto_58610 - TRUCK
      ?auto_58611 - LOCATION
      ?auto_58612 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58610 ?auto_58611 ) ( IN-CITY ?auto_58611 ?auto_58612 ) ( IN-CITY ?auto_58605 ?auto_58612 ) ( not ( = ?auto_58605 ?auto_58611 ) ) ( OBJ-AT ?auto_58607 ?auto_58605 ) ( not ( = ?auto_58607 ?auto_58608 ) ) ( OBJ-AT ?auto_58608 ?auto_58611 ) ( OBJ-AT ?auto_58606 ?auto_58605 ) ( OBJ-AT ?auto_58609 ?auto_58605 ) ( not ( = ?auto_58606 ?auto_58607 ) ) ( not ( = ?auto_58606 ?auto_58609 ) ) ( not ( = ?auto_58606 ?auto_58608 ) ) ( not ( = ?auto_58607 ?auto_58609 ) ) ( not ( = ?auto_58609 ?auto_58608 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58607 ?auto_58608 ?auto_58605 )
      ( DELIVER-4PKG-VERIFY ?auto_58606 ?auto_58607 ?auto_58609 ?auto_58608 ?auto_58605 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58614 - OBJ
      ?auto_58615 - OBJ
      ?auto_58617 - OBJ
      ?auto_58616 - OBJ
      ?auto_58613 - LOCATION
    )
    :vars
    (
      ?auto_58618 - TRUCK
      ?auto_58619 - LOCATION
      ?auto_58620 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58618 ?auto_58619 ) ( IN-CITY ?auto_58619 ?auto_58620 ) ( IN-CITY ?auto_58613 ?auto_58620 ) ( not ( = ?auto_58613 ?auto_58619 ) ) ( OBJ-AT ?auto_58614 ?auto_58613 ) ( not ( = ?auto_58614 ?auto_58616 ) ) ( OBJ-AT ?auto_58616 ?auto_58619 ) ( OBJ-AT ?auto_58615 ?auto_58613 ) ( OBJ-AT ?auto_58617 ?auto_58613 ) ( not ( = ?auto_58614 ?auto_58615 ) ) ( not ( = ?auto_58614 ?auto_58617 ) ) ( not ( = ?auto_58615 ?auto_58617 ) ) ( not ( = ?auto_58615 ?auto_58616 ) ) ( not ( = ?auto_58617 ?auto_58616 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58614 ?auto_58616 ?auto_58613 )
      ( DELIVER-4PKG-VERIFY ?auto_58614 ?auto_58615 ?auto_58617 ?auto_58616 ?auto_58613 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58622 - OBJ
      ?auto_58623 - OBJ
      ?auto_58625 - OBJ
      ?auto_58624 - OBJ
      ?auto_58621 - LOCATION
    )
    :vars
    (
      ?auto_58626 - TRUCK
      ?auto_58627 - LOCATION
      ?auto_58628 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58626 ?auto_58627 ) ( IN-CITY ?auto_58627 ?auto_58628 ) ( IN-CITY ?auto_58621 ?auto_58628 ) ( not ( = ?auto_58621 ?auto_58627 ) ) ( OBJ-AT ?auto_58624 ?auto_58621 ) ( not ( = ?auto_58624 ?auto_58625 ) ) ( OBJ-AT ?auto_58625 ?auto_58627 ) ( OBJ-AT ?auto_58622 ?auto_58621 ) ( OBJ-AT ?auto_58623 ?auto_58621 ) ( not ( = ?auto_58622 ?auto_58623 ) ) ( not ( = ?auto_58622 ?auto_58625 ) ) ( not ( = ?auto_58622 ?auto_58624 ) ) ( not ( = ?auto_58623 ?auto_58625 ) ) ( not ( = ?auto_58623 ?auto_58624 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58624 ?auto_58625 ?auto_58621 )
      ( DELIVER-4PKG-VERIFY ?auto_58622 ?auto_58623 ?auto_58625 ?auto_58624 ?auto_58621 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58630 - OBJ
      ?auto_58631 - OBJ
      ?auto_58633 - OBJ
      ?auto_58632 - OBJ
      ?auto_58629 - LOCATION
    )
    :vars
    (
      ?auto_58634 - TRUCK
      ?auto_58635 - LOCATION
      ?auto_58636 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58634 ?auto_58635 ) ( IN-CITY ?auto_58635 ?auto_58636 ) ( IN-CITY ?auto_58629 ?auto_58636 ) ( not ( = ?auto_58629 ?auto_58635 ) ) ( OBJ-AT ?auto_58630 ?auto_58629 ) ( not ( = ?auto_58630 ?auto_58633 ) ) ( OBJ-AT ?auto_58633 ?auto_58635 ) ( OBJ-AT ?auto_58631 ?auto_58629 ) ( OBJ-AT ?auto_58632 ?auto_58629 ) ( not ( = ?auto_58630 ?auto_58631 ) ) ( not ( = ?auto_58630 ?auto_58632 ) ) ( not ( = ?auto_58631 ?auto_58633 ) ) ( not ( = ?auto_58631 ?auto_58632 ) ) ( not ( = ?auto_58633 ?auto_58632 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58630 ?auto_58633 ?auto_58629 )
      ( DELIVER-4PKG-VERIFY ?auto_58630 ?auto_58631 ?auto_58633 ?auto_58632 ?auto_58629 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58694 - OBJ
      ?auto_58695 - OBJ
      ?auto_58697 - OBJ
      ?auto_58696 - OBJ
      ?auto_58693 - LOCATION
    )
    :vars
    (
      ?auto_58698 - TRUCK
      ?auto_58699 - LOCATION
      ?auto_58700 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58698 ?auto_58699 ) ( IN-CITY ?auto_58699 ?auto_58700 ) ( IN-CITY ?auto_58693 ?auto_58700 ) ( not ( = ?auto_58693 ?auto_58699 ) ) ( OBJ-AT ?auto_58694 ?auto_58693 ) ( not ( = ?auto_58694 ?auto_58695 ) ) ( OBJ-AT ?auto_58695 ?auto_58699 ) ( OBJ-AT ?auto_58697 ?auto_58693 ) ( OBJ-AT ?auto_58696 ?auto_58693 ) ( not ( = ?auto_58694 ?auto_58697 ) ) ( not ( = ?auto_58694 ?auto_58696 ) ) ( not ( = ?auto_58695 ?auto_58697 ) ) ( not ( = ?auto_58695 ?auto_58696 ) ) ( not ( = ?auto_58697 ?auto_58696 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58694 ?auto_58695 ?auto_58693 )
      ( DELIVER-4PKG-VERIFY ?auto_58694 ?auto_58695 ?auto_58697 ?auto_58696 ?auto_58693 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58806 - OBJ
      ?auto_58807 - OBJ
      ?auto_58809 - OBJ
      ?auto_58808 - OBJ
      ?auto_58805 - LOCATION
    )
    :vars
    (
      ?auto_58811 - TRUCK
      ?auto_58812 - LOCATION
      ?auto_58813 - CITY
      ?auto_58810 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58811 ?auto_58812 ) ( IN-CITY ?auto_58812 ?auto_58813 ) ( IN-CITY ?auto_58805 ?auto_58813 ) ( not ( = ?auto_58805 ?auto_58812 ) ) ( OBJ-AT ?auto_58810 ?auto_58805 ) ( not ( = ?auto_58810 ?auto_58808 ) ) ( OBJ-AT ?auto_58808 ?auto_58812 ) ( OBJ-AT ?auto_58806 ?auto_58805 ) ( OBJ-AT ?auto_58807 ?auto_58805 ) ( OBJ-AT ?auto_58809 ?auto_58805 ) ( not ( = ?auto_58806 ?auto_58807 ) ) ( not ( = ?auto_58806 ?auto_58809 ) ) ( not ( = ?auto_58806 ?auto_58808 ) ) ( not ( = ?auto_58806 ?auto_58810 ) ) ( not ( = ?auto_58807 ?auto_58809 ) ) ( not ( = ?auto_58807 ?auto_58808 ) ) ( not ( = ?auto_58807 ?auto_58810 ) ) ( not ( = ?auto_58809 ?auto_58808 ) ) ( not ( = ?auto_58809 ?auto_58810 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58810 ?auto_58808 ?auto_58805 )
      ( DELIVER-4PKG-VERIFY ?auto_58806 ?auto_58807 ?auto_58809 ?auto_58808 ?auto_58805 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58823 - OBJ
      ?auto_58824 - OBJ
      ?auto_58826 - OBJ
      ?auto_58825 - OBJ
      ?auto_58822 - LOCATION
    )
    :vars
    (
      ?auto_58828 - TRUCK
      ?auto_58829 - LOCATION
      ?auto_58830 - CITY
      ?auto_58827 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58828 ?auto_58829 ) ( IN-CITY ?auto_58829 ?auto_58830 ) ( IN-CITY ?auto_58822 ?auto_58830 ) ( not ( = ?auto_58822 ?auto_58829 ) ) ( OBJ-AT ?auto_58827 ?auto_58822 ) ( not ( = ?auto_58827 ?auto_58826 ) ) ( OBJ-AT ?auto_58826 ?auto_58829 ) ( OBJ-AT ?auto_58823 ?auto_58822 ) ( OBJ-AT ?auto_58824 ?auto_58822 ) ( OBJ-AT ?auto_58825 ?auto_58822 ) ( not ( = ?auto_58823 ?auto_58824 ) ) ( not ( = ?auto_58823 ?auto_58826 ) ) ( not ( = ?auto_58823 ?auto_58825 ) ) ( not ( = ?auto_58823 ?auto_58827 ) ) ( not ( = ?auto_58824 ?auto_58826 ) ) ( not ( = ?auto_58824 ?auto_58825 ) ) ( not ( = ?auto_58824 ?auto_58827 ) ) ( not ( = ?auto_58826 ?auto_58825 ) ) ( not ( = ?auto_58825 ?auto_58827 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58827 ?auto_58826 ?auto_58822 )
      ( DELIVER-4PKG-VERIFY ?auto_58823 ?auto_58824 ?auto_58826 ?auto_58825 ?auto_58822 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58865 - OBJ
      ?auto_58866 - OBJ
      ?auto_58868 - OBJ
      ?auto_58867 - OBJ
      ?auto_58864 - LOCATION
    )
    :vars
    (
      ?auto_58869 - TRUCK
      ?auto_58870 - LOCATION
      ?auto_58871 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58869 ?auto_58870 ) ( IN-CITY ?auto_58870 ?auto_58871 ) ( IN-CITY ?auto_58864 ?auto_58871 ) ( not ( = ?auto_58864 ?auto_58870 ) ) ( OBJ-AT ?auto_58867 ?auto_58864 ) ( not ( = ?auto_58867 ?auto_58866 ) ) ( OBJ-AT ?auto_58866 ?auto_58870 ) ( OBJ-AT ?auto_58865 ?auto_58864 ) ( OBJ-AT ?auto_58868 ?auto_58864 ) ( not ( = ?auto_58865 ?auto_58866 ) ) ( not ( = ?auto_58865 ?auto_58868 ) ) ( not ( = ?auto_58865 ?auto_58867 ) ) ( not ( = ?auto_58866 ?auto_58868 ) ) ( not ( = ?auto_58868 ?auto_58867 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58867 ?auto_58866 ?auto_58864 )
      ( DELIVER-4PKG-VERIFY ?auto_58865 ?auto_58866 ?auto_58868 ?auto_58867 ?auto_58864 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58873 - OBJ
      ?auto_58874 - OBJ
      ?auto_58876 - OBJ
      ?auto_58875 - OBJ
      ?auto_58872 - LOCATION
    )
    :vars
    (
      ?auto_58878 - TRUCK
      ?auto_58879 - LOCATION
      ?auto_58880 - CITY
      ?auto_58877 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58878 ?auto_58879 ) ( IN-CITY ?auto_58879 ?auto_58880 ) ( IN-CITY ?auto_58872 ?auto_58880 ) ( not ( = ?auto_58872 ?auto_58879 ) ) ( OBJ-AT ?auto_58877 ?auto_58872 ) ( not ( = ?auto_58877 ?auto_58874 ) ) ( OBJ-AT ?auto_58874 ?auto_58879 ) ( OBJ-AT ?auto_58873 ?auto_58872 ) ( OBJ-AT ?auto_58876 ?auto_58872 ) ( OBJ-AT ?auto_58875 ?auto_58872 ) ( not ( = ?auto_58873 ?auto_58874 ) ) ( not ( = ?auto_58873 ?auto_58876 ) ) ( not ( = ?auto_58873 ?auto_58875 ) ) ( not ( = ?auto_58873 ?auto_58877 ) ) ( not ( = ?auto_58874 ?auto_58876 ) ) ( not ( = ?auto_58874 ?auto_58875 ) ) ( not ( = ?auto_58876 ?auto_58875 ) ) ( not ( = ?auto_58876 ?auto_58877 ) ) ( not ( = ?auto_58875 ?auto_58877 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58877 ?auto_58874 ?auto_58872 )
      ( DELIVER-4PKG-VERIFY ?auto_58873 ?auto_58874 ?auto_58876 ?auto_58875 ?auto_58872 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58941 - OBJ
      ?auto_58942 - OBJ
      ?auto_58944 - OBJ
      ?auto_58943 - OBJ
      ?auto_58940 - LOCATION
    )
    :vars
    (
      ?auto_58945 - TRUCK
      ?auto_58946 - LOCATION
      ?auto_58947 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58945 ?auto_58946 ) ( IN-CITY ?auto_58946 ?auto_58947 ) ( IN-CITY ?auto_58940 ?auto_58947 ) ( not ( = ?auto_58940 ?auto_58946 ) ) ( OBJ-AT ?auto_58943 ?auto_58940 ) ( not ( = ?auto_58943 ?auto_58941 ) ) ( OBJ-AT ?auto_58941 ?auto_58946 ) ( OBJ-AT ?auto_58942 ?auto_58940 ) ( OBJ-AT ?auto_58944 ?auto_58940 ) ( not ( = ?auto_58941 ?auto_58942 ) ) ( not ( = ?auto_58941 ?auto_58944 ) ) ( not ( = ?auto_58942 ?auto_58944 ) ) ( not ( = ?auto_58942 ?auto_58943 ) ) ( not ( = ?auto_58944 ?auto_58943 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58943 ?auto_58941 ?auto_58940 )
      ( DELIVER-4PKG-VERIFY ?auto_58941 ?auto_58942 ?auto_58944 ?auto_58943 ?auto_58940 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58997 - OBJ
      ?auto_58998 - OBJ
      ?auto_59000 - OBJ
      ?auto_58999 - OBJ
      ?auto_58996 - LOCATION
    )
    :vars
    (
      ?auto_59001 - TRUCK
      ?auto_59002 - LOCATION
      ?auto_59003 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59001 ?auto_59002 ) ( IN-CITY ?auto_59002 ?auto_59003 ) ( IN-CITY ?auto_58996 ?auto_59003 ) ( not ( = ?auto_58996 ?auto_59002 ) ) ( OBJ-AT ?auto_59000 ?auto_58996 ) ( not ( = ?auto_59000 ?auto_58997 ) ) ( OBJ-AT ?auto_58997 ?auto_59002 ) ( OBJ-AT ?auto_58998 ?auto_58996 ) ( OBJ-AT ?auto_58999 ?auto_58996 ) ( not ( = ?auto_58997 ?auto_58998 ) ) ( not ( = ?auto_58997 ?auto_58999 ) ) ( not ( = ?auto_58998 ?auto_59000 ) ) ( not ( = ?auto_58998 ?auto_58999 ) ) ( not ( = ?auto_59000 ?auto_58999 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59000 ?auto_58997 ?auto_58996 )
      ( DELIVER-4PKG-VERIFY ?auto_58997 ?auto_58998 ?auto_59000 ?auto_58999 ?auto_58996 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59021 - OBJ
      ?auto_59022 - OBJ
      ?auto_59024 - OBJ
      ?auto_59023 - OBJ
      ?auto_59020 - LOCATION
    )
    :vars
    (
      ?auto_59026 - TRUCK
      ?auto_59027 - LOCATION
      ?auto_59028 - CITY
      ?auto_59025 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59026 ?auto_59027 ) ( IN-CITY ?auto_59027 ?auto_59028 ) ( IN-CITY ?auto_59020 ?auto_59028 ) ( not ( = ?auto_59020 ?auto_59027 ) ) ( OBJ-AT ?auto_59025 ?auto_59020 ) ( not ( = ?auto_59025 ?auto_59021 ) ) ( OBJ-AT ?auto_59021 ?auto_59027 ) ( OBJ-AT ?auto_59022 ?auto_59020 ) ( OBJ-AT ?auto_59024 ?auto_59020 ) ( OBJ-AT ?auto_59023 ?auto_59020 ) ( not ( = ?auto_59021 ?auto_59022 ) ) ( not ( = ?auto_59021 ?auto_59024 ) ) ( not ( = ?auto_59021 ?auto_59023 ) ) ( not ( = ?auto_59022 ?auto_59024 ) ) ( not ( = ?auto_59022 ?auto_59023 ) ) ( not ( = ?auto_59022 ?auto_59025 ) ) ( not ( = ?auto_59024 ?auto_59023 ) ) ( not ( = ?auto_59024 ?auto_59025 ) ) ( not ( = ?auto_59023 ?auto_59025 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59025 ?auto_59021 ?auto_59020 )
      ( DELIVER-4PKG-VERIFY ?auto_59021 ?auto_59022 ?auto_59024 ?auto_59023 ?auto_59020 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59205 - OBJ
      ?auto_59206 - OBJ
      ?auto_59207 - OBJ
      ?auto_59204 - LOCATION
    )
    :vars
    (
      ?auto_59210 - LOCATION
      ?auto_59211 - CITY
      ?auto_59208 - OBJ
      ?auto_59209 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59210 ?auto_59211 ) ( IN-CITY ?auto_59204 ?auto_59211 ) ( not ( = ?auto_59204 ?auto_59210 ) ) ( OBJ-AT ?auto_59208 ?auto_59204 ) ( not ( = ?auto_59208 ?auto_59207 ) ) ( OBJ-AT ?auto_59207 ?auto_59210 ) ( TRUCK-AT ?auto_59209 ?auto_59204 ) ( OBJ-AT ?auto_59205 ?auto_59204 ) ( OBJ-AT ?auto_59206 ?auto_59204 ) ( not ( = ?auto_59205 ?auto_59206 ) ) ( not ( = ?auto_59205 ?auto_59207 ) ) ( not ( = ?auto_59205 ?auto_59208 ) ) ( not ( = ?auto_59206 ?auto_59207 ) ) ( not ( = ?auto_59206 ?auto_59208 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59208 ?auto_59207 ?auto_59204 )
      ( DELIVER-3PKG-VERIFY ?auto_59205 ?auto_59206 ?auto_59207 ?auto_59204 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59217 - OBJ
      ?auto_59218 - OBJ
      ?auto_59219 - OBJ
      ?auto_59216 - LOCATION
    )
    :vars
    (
      ?auto_59222 - LOCATION
      ?auto_59223 - CITY
      ?auto_59220 - OBJ
      ?auto_59221 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59222 ?auto_59223 ) ( IN-CITY ?auto_59216 ?auto_59223 ) ( not ( = ?auto_59216 ?auto_59222 ) ) ( OBJ-AT ?auto_59220 ?auto_59216 ) ( not ( = ?auto_59220 ?auto_59218 ) ) ( OBJ-AT ?auto_59218 ?auto_59222 ) ( TRUCK-AT ?auto_59221 ?auto_59216 ) ( OBJ-AT ?auto_59217 ?auto_59216 ) ( OBJ-AT ?auto_59219 ?auto_59216 ) ( not ( = ?auto_59217 ?auto_59218 ) ) ( not ( = ?auto_59217 ?auto_59219 ) ) ( not ( = ?auto_59217 ?auto_59220 ) ) ( not ( = ?auto_59218 ?auto_59219 ) ) ( not ( = ?auto_59219 ?auto_59220 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59220 ?auto_59218 ?auto_59216 )
      ( DELIVER-3PKG-VERIFY ?auto_59217 ?auto_59218 ?auto_59219 ?auto_59216 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59233 - OBJ
      ?auto_59234 - OBJ
      ?auto_59235 - OBJ
      ?auto_59232 - LOCATION
    )
    :vars
    (
      ?auto_59237 - LOCATION
      ?auto_59238 - CITY
      ?auto_59236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59237 ?auto_59238 ) ( IN-CITY ?auto_59232 ?auto_59238 ) ( not ( = ?auto_59232 ?auto_59237 ) ) ( OBJ-AT ?auto_59234 ?auto_59232 ) ( not ( = ?auto_59234 ?auto_59233 ) ) ( OBJ-AT ?auto_59233 ?auto_59237 ) ( TRUCK-AT ?auto_59236 ?auto_59232 ) ( OBJ-AT ?auto_59235 ?auto_59232 ) ( not ( = ?auto_59233 ?auto_59235 ) ) ( not ( = ?auto_59234 ?auto_59235 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59234 ?auto_59233 ?auto_59232 )
      ( DELIVER-3PKG-VERIFY ?auto_59233 ?auto_59234 ?auto_59235 ?auto_59232 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59255 - OBJ
      ?auto_59256 - OBJ
      ?auto_59257 - OBJ
      ?auto_59254 - LOCATION
    )
    :vars
    (
      ?auto_59260 - LOCATION
      ?auto_59261 - CITY
      ?auto_59258 - OBJ
      ?auto_59259 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59260 ?auto_59261 ) ( IN-CITY ?auto_59254 ?auto_59261 ) ( not ( = ?auto_59254 ?auto_59260 ) ) ( OBJ-AT ?auto_59258 ?auto_59254 ) ( not ( = ?auto_59258 ?auto_59255 ) ) ( OBJ-AT ?auto_59255 ?auto_59260 ) ( TRUCK-AT ?auto_59259 ?auto_59254 ) ( OBJ-AT ?auto_59256 ?auto_59254 ) ( OBJ-AT ?auto_59257 ?auto_59254 ) ( not ( = ?auto_59255 ?auto_59256 ) ) ( not ( = ?auto_59255 ?auto_59257 ) ) ( not ( = ?auto_59256 ?auto_59257 ) ) ( not ( = ?auto_59256 ?auto_59258 ) ) ( not ( = ?auto_59257 ?auto_59258 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59258 ?auto_59255 ?auto_59254 )
      ( DELIVER-3PKG-VERIFY ?auto_59255 ?auto_59256 ?auto_59257 ?auto_59254 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59374 - OBJ
      ?auto_59375 - OBJ
      ?auto_59377 - OBJ
      ?auto_59376 - OBJ
      ?auto_59373 - LOCATION
    )
    :vars
    (
      ?auto_59379 - LOCATION
      ?auto_59380 - CITY
      ?auto_59378 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59379 ?auto_59380 ) ( IN-CITY ?auto_59373 ?auto_59380 ) ( not ( = ?auto_59373 ?auto_59379 ) ) ( OBJ-AT ?auto_59376 ?auto_59373 ) ( not ( = ?auto_59376 ?auto_59375 ) ) ( OBJ-AT ?auto_59375 ?auto_59379 ) ( TRUCK-AT ?auto_59378 ?auto_59373 ) ( OBJ-AT ?auto_59374 ?auto_59373 ) ( OBJ-AT ?auto_59377 ?auto_59373 ) ( not ( = ?auto_59374 ?auto_59375 ) ) ( not ( = ?auto_59374 ?auto_59377 ) ) ( not ( = ?auto_59374 ?auto_59376 ) ) ( not ( = ?auto_59375 ?auto_59377 ) ) ( not ( = ?auto_59377 ?auto_59376 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59376 ?auto_59375 ?auto_59373 )
      ( DELIVER-4PKG-VERIFY ?auto_59374 ?auto_59375 ?auto_59377 ?auto_59376 ?auto_59373 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59406 - OBJ
      ?auto_59407 - OBJ
      ?auto_59409 - OBJ
      ?auto_59408 - OBJ
      ?auto_59405 - LOCATION
    )
    :vars
    (
      ?auto_59411 - LOCATION
      ?auto_59412 - CITY
      ?auto_59410 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59411 ?auto_59412 ) ( IN-CITY ?auto_59405 ?auto_59412 ) ( not ( = ?auto_59405 ?auto_59411 ) ) ( OBJ-AT ?auto_59406 ?auto_59405 ) ( not ( = ?auto_59406 ?auto_59407 ) ) ( OBJ-AT ?auto_59407 ?auto_59411 ) ( TRUCK-AT ?auto_59410 ?auto_59405 ) ( OBJ-AT ?auto_59409 ?auto_59405 ) ( OBJ-AT ?auto_59408 ?auto_59405 ) ( not ( = ?auto_59406 ?auto_59409 ) ) ( not ( = ?auto_59406 ?auto_59408 ) ) ( not ( = ?auto_59407 ?auto_59409 ) ) ( not ( = ?auto_59407 ?auto_59408 ) ) ( not ( = ?auto_59409 ?auto_59408 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59406 ?auto_59407 ?auto_59405 )
      ( DELIVER-4PKG-VERIFY ?auto_59406 ?auto_59407 ?auto_59409 ?auto_59408 ?auto_59405 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59446 - OBJ
      ?auto_59447 - OBJ
      ?auto_59449 - OBJ
      ?auto_59448 - OBJ
      ?auto_59445 - LOCATION
    )
    :vars
    (
      ?auto_59451 - LOCATION
      ?auto_59452 - CITY
      ?auto_59450 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59451 ?auto_59452 ) ( IN-CITY ?auto_59445 ?auto_59452 ) ( not ( = ?auto_59445 ?auto_59451 ) ) ( OBJ-AT ?auto_59449 ?auto_59445 ) ( not ( = ?auto_59449 ?auto_59448 ) ) ( OBJ-AT ?auto_59448 ?auto_59451 ) ( TRUCK-AT ?auto_59450 ?auto_59445 ) ( OBJ-AT ?auto_59446 ?auto_59445 ) ( OBJ-AT ?auto_59447 ?auto_59445 ) ( not ( = ?auto_59446 ?auto_59447 ) ) ( not ( = ?auto_59446 ?auto_59449 ) ) ( not ( = ?auto_59446 ?auto_59448 ) ) ( not ( = ?auto_59447 ?auto_59449 ) ) ( not ( = ?auto_59447 ?auto_59448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59449 ?auto_59448 ?auto_59445 )
      ( DELIVER-4PKG-VERIFY ?auto_59446 ?auto_59447 ?auto_59449 ?auto_59448 ?auto_59445 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59454 - OBJ
      ?auto_59455 - OBJ
      ?auto_59457 - OBJ
      ?auto_59456 - OBJ
      ?auto_59453 - LOCATION
    )
    :vars
    (
      ?auto_59459 - LOCATION
      ?auto_59460 - CITY
      ?auto_59458 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59459 ?auto_59460 ) ( IN-CITY ?auto_59453 ?auto_59460 ) ( not ( = ?auto_59453 ?auto_59459 ) ) ( OBJ-AT ?auto_59455 ?auto_59453 ) ( not ( = ?auto_59455 ?auto_59456 ) ) ( OBJ-AT ?auto_59456 ?auto_59459 ) ( TRUCK-AT ?auto_59458 ?auto_59453 ) ( OBJ-AT ?auto_59454 ?auto_59453 ) ( OBJ-AT ?auto_59457 ?auto_59453 ) ( not ( = ?auto_59454 ?auto_59455 ) ) ( not ( = ?auto_59454 ?auto_59457 ) ) ( not ( = ?auto_59454 ?auto_59456 ) ) ( not ( = ?auto_59455 ?auto_59457 ) ) ( not ( = ?auto_59457 ?auto_59456 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59455 ?auto_59456 ?auto_59453 )
      ( DELIVER-4PKG-VERIFY ?auto_59454 ?auto_59455 ?auto_59457 ?auto_59456 ?auto_59453 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59462 - OBJ
      ?auto_59463 - OBJ
      ?auto_59465 - OBJ
      ?auto_59464 - OBJ
      ?auto_59461 - LOCATION
    )
    :vars
    (
      ?auto_59467 - LOCATION
      ?auto_59468 - CITY
      ?auto_59466 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59467 ?auto_59468 ) ( IN-CITY ?auto_59461 ?auto_59468 ) ( not ( = ?auto_59461 ?auto_59467 ) ) ( OBJ-AT ?auto_59464 ?auto_59461 ) ( not ( = ?auto_59464 ?auto_59465 ) ) ( OBJ-AT ?auto_59465 ?auto_59467 ) ( TRUCK-AT ?auto_59466 ?auto_59461 ) ( OBJ-AT ?auto_59462 ?auto_59461 ) ( OBJ-AT ?auto_59463 ?auto_59461 ) ( not ( = ?auto_59462 ?auto_59463 ) ) ( not ( = ?auto_59462 ?auto_59465 ) ) ( not ( = ?auto_59462 ?auto_59464 ) ) ( not ( = ?auto_59463 ?auto_59465 ) ) ( not ( = ?auto_59463 ?auto_59464 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59464 ?auto_59465 ?auto_59461 )
      ( DELIVER-4PKG-VERIFY ?auto_59462 ?auto_59463 ?auto_59465 ?auto_59464 ?auto_59461 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59470 - OBJ
      ?auto_59471 - OBJ
      ?auto_59473 - OBJ
      ?auto_59472 - OBJ
      ?auto_59469 - LOCATION
    )
    :vars
    (
      ?auto_59475 - LOCATION
      ?auto_59476 - CITY
      ?auto_59474 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59475 ?auto_59476 ) ( IN-CITY ?auto_59469 ?auto_59476 ) ( not ( = ?auto_59469 ?auto_59475 ) ) ( OBJ-AT ?auto_59471 ?auto_59469 ) ( not ( = ?auto_59471 ?auto_59473 ) ) ( OBJ-AT ?auto_59473 ?auto_59475 ) ( TRUCK-AT ?auto_59474 ?auto_59469 ) ( OBJ-AT ?auto_59470 ?auto_59469 ) ( OBJ-AT ?auto_59472 ?auto_59469 ) ( not ( = ?auto_59470 ?auto_59471 ) ) ( not ( = ?auto_59470 ?auto_59473 ) ) ( not ( = ?auto_59470 ?auto_59472 ) ) ( not ( = ?auto_59471 ?auto_59472 ) ) ( not ( = ?auto_59473 ?auto_59472 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59471 ?auto_59473 ?auto_59469 )
      ( DELIVER-4PKG-VERIFY ?auto_59470 ?auto_59471 ?auto_59473 ?auto_59472 ?auto_59469 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59494 - OBJ
      ?auto_59495 - OBJ
      ?auto_59497 - OBJ
      ?auto_59496 - OBJ
      ?auto_59493 - LOCATION
    )
    :vars
    (
      ?auto_59500 - LOCATION
      ?auto_59501 - CITY
      ?auto_59498 - OBJ
      ?auto_59499 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59500 ?auto_59501 ) ( IN-CITY ?auto_59493 ?auto_59501 ) ( not ( = ?auto_59493 ?auto_59500 ) ) ( OBJ-AT ?auto_59498 ?auto_59493 ) ( not ( = ?auto_59498 ?auto_59496 ) ) ( OBJ-AT ?auto_59496 ?auto_59500 ) ( TRUCK-AT ?auto_59499 ?auto_59493 ) ( OBJ-AT ?auto_59494 ?auto_59493 ) ( OBJ-AT ?auto_59495 ?auto_59493 ) ( OBJ-AT ?auto_59497 ?auto_59493 ) ( not ( = ?auto_59494 ?auto_59495 ) ) ( not ( = ?auto_59494 ?auto_59497 ) ) ( not ( = ?auto_59494 ?auto_59496 ) ) ( not ( = ?auto_59494 ?auto_59498 ) ) ( not ( = ?auto_59495 ?auto_59497 ) ) ( not ( = ?auto_59495 ?auto_59496 ) ) ( not ( = ?auto_59495 ?auto_59498 ) ) ( not ( = ?auto_59497 ?auto_59496 ) ) ( not ( = ?auto_59497 ?auto_59498 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59498 ?auto_59496 ?auto_59493 )
      ( DELIVER-4PKG-VERIFY ?auto_59494 ?auto_59495 ?auto_59497 ?auto_59496 ?auto_59493 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59511 - OBJ
      ?auto_59512 - OBJ
      ?auto_59514 - OBJ
      ?auto_59513 - OBJ
      ?auto_59510 - LOCATION
    )
    :vars
    (
      ?auto_59517 - LOCATION
      ?auto_59518 - CITY
      ?auto_59515 - OBJ
      ?auto_59516 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59517 ?auto_59518 ) ( IN-CITY ?auto_59510 ?auto_59518 ) ( not ( = ?auto_59510 ?auto_59517 ) ) ( OBJ-AT ?auto_59515 ?auto_59510 ) ( not ( = ?auto_59515 ?auto_59514 ) ) ( OBJ-AT ?auto_59514 ?auto_59517 ) ( TRUCK-AT ?auto_59516 ?auto_59510 ) ( OBJ-AT ?auto_59511 ?auto_59510 ) ( OBJ-AT ?auto_59512 ?auto_59510 ) ( OBJ-AT ?auto_59513 ?auto_59510 ) ( not ( = ?auto_59511 ?auto_59512 ) ) ( not ( = ?auto_59511 ?auto_59514 ) ) ( not ( = ?auto_59511 ?auto_59513 ) ) ( not ( = ?auto_59511 ?auto_59515 ) ) ( not ( = ?auto_59512 ?auto_59514 ) ) ( not ( = ?auto_59512 ?auto_59513 ) ) ( not ( = ?auto_59512 ?auto_59515 ) ) ( not ( = ?auto_59514 ?auto_59513 ) ) ( not ( = ?auto_59513 ?auto_59515 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59515 ?auto_59514 ?auto_59510 )
      ( DELIVER-4PKG-VERIFY ?auto_59511 ?auto_59512 ?auto_59514 ?auto_59513 ?auto_59510 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59561 - OBJ
      ?auto_59562 - OBJ
      ?auto_59564 - OBJ
      ?auto_59563 - OBJ
      ?auto_59560 - LOCATION
    )
    :vars
    (
      ?auto_59567 - LOCATION
      ?auto_59568 - CITY
      ?auto_59565 - OBJ
      ?auto_59566 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59567 ?auto_59568 ) ( IN-CITY ?auto_59560 ?auto_59568 ) ( not ( = ?auto_59560 ?auto_59567 ) ) ( OBJ-AT ?auto_59565 ?auto_59560 ) ( not ( = ?auto_59565 ?auto_59562 ) ) ( OBJ-AT ?auto_59562 ?auto_59567 ) ( TRUCK-AT ?auto_59566 ?auto_59560 ) ( OBJ-AT ?auto_59561 ?auto_59560 ) ( OBJ-AT ?auto_59564 ?auto_59560 ) ( OBJ-AT ?auto_59563 ?auto_59560 ) ( not ( = ?auto_59561 ?auto_59562 ) ) ( not ( = ?auto_59561 ?auto_59564 ) ) ( not ( = ?auto_59561 ?auto_59563 ) ) ( not ( = ?auto_59561 ?auto_59565 ) ) ( not ( = ?auto_59562 ?auto_59564 ) ) ( not ( = ?auto_59562 ?auto_59563 ) ) ( not ( = ?auto_59564 ?auto_59563 ) ) ( not ( = ?auto_59564 ?auto_59565 ) ) ( not ( = ?auto_59563 ?auto_59565 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59565 ?auto_59562 ?auto_59560 )
      ( DELIVER-4PKG-VERIFY ?auto_59561 ?auto_59562 ?auto_59564 ?auto_59563 ?auto_59560 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59613 - OBJ
      ?auto_59614 - OBJ
      ?auto_59616 - OBJ
      ?auto_59615 - OBJ
      ?auto_59612 - LOCATION
    )
    :vars
    (
      ?auto_59618 - LOCATION
      ?auto_59619 - CITY
      ?auto_59617 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59618 ?auto_59619 ) ( IN-CITY ?auto_59612 ?auto_59619 ) ( not ( = ?auto_59612 ?auto_59618 ) ) ( OBJ-AT ?auto_59614 ?auto_59612 ) ( not ( = ?auto_59614 ?auto_59613 ) ) ( OBJ-AT ?auto_59613 ?auto_59618 ) ( TRUCK-AT ?auto_59617 ?auto_59612 ) ( OBJ-AT ?auto_59616 ?auto_59612 ) ( OBJ-AT ?auto_59615 ?auto_59612 ) ( not ( = ?auto_59613 ?auto_59616 ) ) ( not ( = ?auto_59613 ?auto_59615 ) ) ( not ( = ?auto_59614 ?auto_59616 ) ) ( not ( = ?auto_59614 ?auto_59615 ) ) ( not ( = ?auto_59616 ?auto_59615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59614 ?auto_59613 ?auto_59612 )
      ( DELIVER-4PKG-VERIFY ?auto_59613 ?auto_59614 ?auto_59616 ?auto_59615 ?auto_59612 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59677 - OBJ
      ?auto_59678 - OBJ
      ?auto_59680 - OBJ
      ?auto_59679 - OBJ
      ?auto_59676 - LOCATION
    )
    :vars
    (
      ?auto_59682 - LOCATION
      ?auto_59683 - CITY
      ?auto_59681 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59682 ?auto_59683 ) ( IN-CITY ?auto_59676 ?auto_59683 ) ( not ( = ?auto_59676 ?auto_59682 ) ) ( OBJ-AT ?auto_59680 ?auto_59676 ) ( not ( = ?auto_59680 ?auto_59677 ) ) ( OBJ-AT ?auto_59677 ?auto_59682 ) ( TRUCK-AT ?auto_59681 ?auto_59676 ) ( OBJ-AT ?auto_59678 ?auto_59676 ) ( OBJ-AT ?auto_59679 ?auto_59676 ) ( not ( = ?auto_59677 ?auto_59678 ) ) ( not ( = ?auto_59677 ?auto_59679 ) ) ( not ( = ?auto_59678 ?auto_59680 ) ) ( not ( = ?auto_59678 ?auto_59679 ) ) ( not ( = ?auto_59680 ?auto_59679 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59680 ?auto_59677 ?auto_59676 )
      ( DELIVER-4PKG-VERIFY ?auto_59677 ?auto_59678 ?auto_59680 ?auto_59679 ?auto_59676 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59709 - OBJ
      ?auto_59710 - OBJ
      ?auto_59712 - OBJ
      ?auto_59711 - OBJ
      ?auto_59708 - LOCATION
    )
    :vars
    (
      ?auto_59715 - LOCATION
      ?auto_59716 - CITY
      ?auto_59713 - OBJ
      ?auto_59714 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59715 ?auto_59716 ) ( IN-CITY ?auto_59708 ?auto_59716 ) ( not ( = ?auto_59708 ?auto_59715 ) ) ( OBJ-AT ?auto_59713 ?auto_59708 ) ( not ( = ?auto_59713 ?auto_59709 ) ) ( OBJ-AT ?auto_59709 ?auto_59715 ) ( TRUCK-AT ?auto_59714 ?auto_59708 ) ( OBJ-AT ?auto_59710 ?auto_59708 ) ( OBJ-AT ?auto_59712 ?auto_59708 ) ( OBJ-AT ?auto_59711 ?auto_59708 ) ( not ( = ?auto_59709 ?auto_59710 ) ) ( not ( = ?auto_59709 ?auto_59712 ) ) ( not ( = ?auto_59709 ?auto_59711 ) ) ( not ( = ?auto_59710 ?auto_59712 ) ) ( not ( = ?auto_59710 ?auto_59711 ) ) ( not ( = ?auto_59710 ?auto_59713 ) ) ( not ( = ?auto_59712 ?auto_59711 ) ) ( not ( = ?auto_59712 ?auto_59713 ) ) ( not ( = ?auto_59711 ?auto_59713 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59713 ?auto_59709 ?auto_59708 )
      ( DELIVER-4PKG-VERIFY ?auto_59709 ?auto_59710 ?auto_59712 ?auto_59711 ?auto_59708 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59858 - OBJ
      ?auto_59859 - OBJ
      ?auto_59860 - OBJ
      ?auto_59857 - LOCATION
    )
    :vars
    (
      ?auto_59863 - LOCATION
      ?auto_59861 - CITY
      ?auto_59862 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59863 ?auto_59861 ) ( IN-CITY ?auto_59857 ?auto_59861 ) ( not ( = ?auto_59857 ?auto_59863 ) ) ( OBJ-AT ?auto_59858 ?auto_59857 ) ( not ( = ?auto_59858 ?auto_59860 ) ) ( OBJ-AT ?auto_59860 ?auto_59863 ) ( TRUCK-AT ?auto_59862 ?auto_59857 ) ( OBJ-AT ?auto_59859 ?auto_59857 ) ( not ( = ?auto_59858 ?auto_59859 ) ) ( not ( = ?auto_59859 ?auto_59860 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59858 ?auto_59860 ?auto_59857 )
      ( DELIVER-3PKG-VERIFY ?auto_59858 ?auto_59859 ?auto_59860 ?auto_59857 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_60533 - OBJ
      ?auto_60532 - LOCATION
    )
    :vars
    (
      ?auto_60536 - LOCATION
      ?auto_60534 - CITY
      ?auto_60537 - OBJ
      ?auto_60535 - TRUCK
      ?auto_60538 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60536 ?auto_60534 ) ( IN-CITY ?auto_60532 ?auto_60534 ) ( not ( = ?auto_60532 ?auto_60536 ) ) ( OBJ-AT ?auto_60537 ?auto_60532 ) ( not ( = ?auto_60537 ?auto_60533 ) ) ( OBJ-AT ?auto_60533 ?auto_60536 ) ( TRUCK-AT ?auto_60535 ?auto_60538 ) ( IN-CITY ?auto_60538 ?auto_60534 ) ( not ( = ?auto_60532 ?auto_60538 ) ) ( not ( = ?auto_60536 ?auto_60538 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_60535 ?auto_60538 ?auto_60532 ?auto_60534 )
      ( DELIVER-2PKG ?auto_60537 ?auto_60533 ?auto_60532 )
      ( DELIVER-1PKG-VERIFY ?auto_60533 ?auto_60532 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_60540 - OBJ
      ?auto_60541 - OBJ
      ?auto_60539 - LOCATION
    )
    :vars
    (
      ?auto_60542 - LOCATION
      ?auto_60545 - CITY
      ?auto_60544 - TRUCK
      ?auto_60543 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60542 ?auto_60545 ) ( IN-CITY ?auto_60539 ?auto_60545 ) ( not ( = ?auto_60539 ?auto_60542 ) ) ( OBJ-AT ?auto_60540 ?auto_60539 ) ( not ( = ?auto_60540 ?auto_60541 ) ) ( OBJ-AT ?auto_60541 ?auto_60542 ) ( TRUCK-AT ?auto_60544 ?auto_60543 ) ( IN-CITY ?auto_60543 ?auto_60545 ) ( not ( = ?auto_60539 ?auto_60543 ) ) ( not ( = ?auto_60542 ?auto_60543 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_60541 ?auto_60539 )
      ( DELIVER-2PKG-VERIFY ?auto_60540 ?auto_60541 ?auto_60539 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_60555 - OBJ
      ?auto_60556 - OBJ
      ?auto_60554 - LOCATION
    )
    :vars
    (
      ?auto_60558 - LOCATION
      ?auto_60560 - CITY
      ?auto_60559 - TRUCK
      ?auto_60557 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60558 ?auto_60560 ) ( IN-CITY ?auto_60554 ?auto_60560 ) ( not ( = ?auto_60554 ?auto_60558 ) ) ( OBJ-AT ?auto_60556 ?auto_60554 ) ( not ( = ?auto_60556 ?auto_60555 ) ) ( OBJ-AT ?auto_60555 ?auto_60558 ) ( TRUCK-AT ?auto_60559 ?auto_60557 ) ( IN-CITY ?auto_60557 ?auto_60560 ) ( not ( = ?auto_60554 ?auto_60557 ) ) ( not ( = ?auto_60558 ?auto_60557 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60556 ?auto_60555 ?auto_60554 )
      ( DELIVER-2PKG-VERIFY ?auto_60555 ?auto_60556 ?auto_60554 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60578 - OBJ
      ?auto_60579 - OBJ
      ?auto_60580 - OBJ
      ?auto_60577 - LOCATION
    )
    :vars
    (
      ?auto_60582 - LOCATION
      ?auto_60584 - CITY
      ?auto_60583 - TRUCK
      ?auto_60581 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60582 ?auto_60584 ) ( IN-CITY ?auto_60577 ?auto_60584 ) ( not ( = ?auto_60577 ?auto_60582 ) ) ( OBJ-AT ?auto_60579 ?auto_60577 ) ( not ( = ?auto_60579 ?auto_60580 ) ) ( OBJ-AT ?auto_60580 ?auto_60582 ) ( TRUCK-AT ?auto_60583 ?auto_60581 ) ( IN-CITY ?auto_60581 ?auto_60584 ) ( not ( = ?auto_60577 ?auto_60581 ) ) ( not ( = ?auto_60582 ?auto_60581 ) ) ( OBJ-AT ?auto_60578 ?auto_60577 ) ( not ( = ?auto_60578 ?auto_60579 ) ) ( not ( = ?auto_60578 ?auto_60580 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60579 ?auto_60580 ?auto_60577 )
      ( DELIVER-3PKG-VERIFY ?auto_60578 ?auto_60579 ?auto_60580 ?auto_60577 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60594 - OBJ
      ?auto_60595 - OBJ
      ?auto_60596 - OBJ
      ?auto_60593 - LOCATION
    )
    :vars
    (
      ?auto_60598 - LOCATION
      ?auto_60600 - CITY
      ?auto_60599 - TRUCK
      ?auto_60597 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60598 ?auto_60600 ) ( IN-CITY ?auto_60593 ?auto_60600 ) ( not ( = ?auto_60593 ?auto_60598 ) ) ( OBJ-AT ?auto_60596 ?auto_60593 ) ( not ( = ?auto_60596 ?auto_60595 ) ) ( OBJ-AT ?auto_60595 ?auto_60598 ) ( TRUCK-AT ?auto_60599 ?auto_60597 ) ( IN-CITY ?auto_60597 ?auto_60600 ) ( not ( = ?auto_60593 ?auto_60597 ) ) ( not ( = ?auto_60598 ?auto_60597 ) ) ( OBJ-AT ?auto_60594 ?auto_60593 ) ( not ( = ?auto_60594 ?auto_60595 ) ) ( not ( = ?auto_60594 ?auto_60596 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60596 ?auto_60595 ?auto_60593 )
      ( DELIVER-3PKG-VERIFY ?auto_60594 ?auto_60595 ?auto_60596 ?auto_60593 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60661 - OBJ
      ?auto_60662 - OBJ
      ?auto_60663 - OBJ
      ?auto_60660 - LOCATION
    )
    :vars
    (
      ?auto_60665 - LOCATION
      ?auto_60667 - CITY
      ?auto_60666 - TRUCK
      ?auto_60664 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60665 ?auto_60667 ) ( IN-CITY ?auto_60660 ?auto_60667 ) ( not ( = ?auto_60660 ?auto_60665 ) ) ( OBJ-AT ?auto_60663 ?auto_60660 ) ( not ( = ?auto_60663 ?auto_60661 ) ) ( OBJ-AT ?auto_60661 ?auto_60665 ) ( TRUCK-AT ?auto_60666 ?auto_60664 ) ( IN-CITY ?auto_60664 ?auto_60667 ) ( not ( = ?auto_60660 ?auto_60664 ) ) ( not ( = ?auto_60665 ?auto_60664 ) ) ( OBJ-AT ?auto_60662 ?auto_60660 ) ( not ( = ?auto_60661 ?auto_60662 ) ) ( not ( = ?auto_60662 ?auto_60663 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60663 ?auto_60661 ?auto_60660 )
      ( DELIVER-3PKG-VERIFY ?auto_60661 ?auto_60662 ?auto_60663 ?auto_60660 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60737 - OBJ
      ?auto_60738 - OBJ
      ?auto_60740 - OBJ
      ?auto_60739 - OBJ
      ?auto_60736 - LOCATION
    )
    :vars
    (
      ?auto_60742 - LOCATION
      ?auto_60744 - CITY
      ?auto_60743 - TRUCK
      ?auto_60741 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60742 ?auto_60744 ) ( IN-CITY ?auto_60736 ?auto_60744 ) ( not ( = ?auto_60736 ?auto_60742 ) ) ( OBJ-AT ?auto_60737 ?auto_60736 ) ( not ( = ?auto_60737 ?auto_60739 ) ) ( OBJ-AT ?auto_60739 ?auto_60742 ) ( TRUCK-AT ?auto_60743 ?auto_60741 ) ( IN-CITY ?auto_60741 ?auto_60744 ) ( not ( = ?auto_60736 ?auto_60741 ) ) ( not ( = ?auto_60742 ?auto_60741 ) ) ( OBJ-AT ?auto_60738 ?auto_60736 ) ( OBJ-AT ?auto_60740 ?auto_60736 ) ( not ( = ?auto_60737 ?auto_60738 ) ) ( not ( = ?auto_60737 ?auto_60740 ) ) ( not ( = ?auto_60738 ?auto_60740 ) ) ( not ( = ?auto_60738 ?auto_60739 ) ) ( not ( = ?auto_60740 ?auto_60739 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60737 ?auto_60739 ?auto_60736 )
      ( DELIVER-4PKG-VERIFY ?auto_60737 ?auto_60738 ?auto_60740 ?auto_60739 ?auto_60736 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60755 - OBJ
      ?auto_60756 - OBJ
      ?auto_60758 - OBJ
      ?auto_60757 - OBJ
      ?auto_60754 - LOCATION
    )
    :vars
    (
      ?auto_60760 - LOCATION
      ?auto_60762 - CITY
      ?auto_60761 - TRUCK
      ?auto_60759 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60760 ?auto_60762 ) ( IN-CITY ?auto_60754 ?auto_60762 ) ( not ( = ?auto_60754 ?auto_60760 ) ) ( OBJ-AT ?auto_60757 ?auto_60754 ) ( not ( = ?auto_60757 ?auto_60758 ) ) ( OBJ-AT ?auto_60758 ?auto_60760 ) ( TRUCK-AT ?auto_60761 ?auto_60759 ) ( IN-CITY ?auto_60759 ?auto_60762 ) ( not ( = ?auto_60754 ?auto_60759 ) ) ( not ( = ?auto_60760 ?auto_60759 ) ) ( OBJ-AT ?auto_60755 ?auto_60754 ) ( OBJ-AT ?auto_60756 ?auto_60754 ) ( not ( = ?auto_60755 ?auto_60756 ) ) ( not ( = ?auto_60755 ?auto_60758 ) ) ( not ( = ?auto_60755 ?auto_60757 ) ) ( not ( = ?auto_60756 ?auto_60758 ) ) ( not ( = ?auto_60756 ?auto_60757 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60757 ?auto_60758 ?auto_60754 )
      ( DELIVER-4PKG-VERIFY ?auto_60755 ?auto_60756 ?auto_60758 ?auto_60757 ?auto_60754 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60827 - OBJ
      ?auto_60828 - OBJ
      ?auto_60830 - OBJ
      ?auto_60829 - OBJ
      ?auto_60826 - LOCATION
    )
    :vars
    (
      ?auto_60832 - LOCATION
      ?auto_60834 - CITY
      ?auto_60833 - TRUCK
      ?auto_60831 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60832 ?auto_60834 ) ( IN-CITY ?auto_60826 ?auto_60834 ) ( not ( = ?auto_60826 ?auto_60832 ) ) ( OBJ-AT ?auto_60827 ?auto_60826 ) ( not ( = ?auto_60827 ?auto_60828 ) ) ( OBJ-AT ?auto_60828 ?auto_60832 ) ( TRUCK-AT ?auto_60833 ?auto_60831 ) ( IN-CITY ?auto_60831 ?auto_60834 ) ( not ( = ?auto_60826 ?auto_60831 ) ) ( not ( = ?auto_60832 ?auto_60831 ) ) ( OBJ-AT ?auto_60830 ?auto_60826 ) ( OBJ-AT ?auto_60829 ?auto_60826 ) ( not ( = ?auto_60827 ?auto_60830 ) ) ( not ( = ?auto_60827 ?auto_60829 ) ) ( not ( = ?auto_60828 ?auto_60830 ) ) ( not ( = ?auto_60828 ?auto_60829 ) ) ( not ( = ?auto_60830 ?auto_60829 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60827 ?auto_60828 ?auto_60826 )
      ( DELIVER-4PKG-VERIFY ?auto_60827 ?auto_60828 ?auto_60830 ?auto_60829 ?auto_60826 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61086 - OBJ
      ?auto_61087 - OBJ
      ?auto_61089 - OBJ
      ?auto_61088 - OBJ
      ?auto_61085 - LOCATION
    )
    :vars
    (
      ?auto_61091 - LOCATION
      ?auto_61093 - CITY
      ?auto_61092 - TRUCK
      ?auto_61090 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61091 ?auto_61093 ) ( IN-CITY ?auto_61085 ?auto_61093 ) ( not ( = ?auto_61085 ?auto_61091 ) ) ( OBJ-AT ?auto_61088 ?auto_61085 ) ( not ( = ?auto_61088 ?auto_61086 ) ) ( OBJ-AT ?auto_61086 ?auto_61091 ) ( TRUCK-AT ?auto_61092 ?auto_61090 ) ( IN-CITY ?auto_61090 ?auto_61093 ) ( not ( = ?auto_61085 ?auto_61090 ) ) ( not ( = ?auto_61091 ?auto_61090 ) ) ( OBJ-AT ?auto_61087 ?auto_61085 ) ( OBJ-AT ?auto_61089 ?auto_61085 ) ( not ( = ?auto_61086 ?auto_61087 ) ) ( not ( = ?auto_61086 ?auto_61089 ) ) ( not ( = ?auto_61087 ?auto_61089 ) ) ( not ( = ?auto_61087 ?auto_61088 ) ) ( not ( = ?auto_61089 ?auto_61088 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61088 ?auto_61086 ?auto_61085 )
      ( DELIVER-4PKG-VERIFY ?auto_61086 ?auto_61087 ?auto_61089 ?auto_61088 ?auto_61085 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_61369 - OBJ
      ?auto_61370 - OBJ
      ?auto_61371 - OBJ
      ?auto_61368 - LOCATION
    )
    :vars
    (
      ?auto_61373 - LOCATION
      ?auto_61375 - CITY
      ?auto_61372 - TRUCK
      ?auto_61374 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61373 ?auto_61375 ) ( IN-CITY ?auto_61368 ?auto_61375 ) ( not ( = ?auto_61368 ?auto_61373 ) ) ( OBJ-AT ?auto_61369 ?auto_61368 ) ( not ( = ?auto_61369 ?auto_61371 ) ) ( OBJ-AT ?auto_61371 ?auto_61373 ) ( TRUCK-AT ?auto_61372 ?auto_61374 ) ( IN-CITY ?auto_61374 ?auto_61375 ) ( not ( = ?auto_61368 ?auto_61374 ) ) ( not ( = ?auto_61373 ?auto_61374 ) ) ( OBJ-AT ?auto_61370 ?auto_61368 ) ( not ( = ?auto_61369 ?auto_61370 ) ) ( not ( = ?auto_61370 ?auto_61371 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61369 ?auto_61371 ?auto_61368 )
      ( DELIVER-3PKG-VERIFY ?auto_61369 ?auto_61370 ?auto_61371 ?auto_61368 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61528 - OBJ
      ?auto_61529 - OBJ
      ?auto_61531 - OBJ
      ?auto_61530 - OBJ
      ?auto_61527 - LOCATION
    )
    :vars
    (
      ?auto_61533 - LOCATION
      ?auto_61535 - CITY
      ?auto_61532 - TRUCK
      ?auto_61534 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61533 ?auto_61535 ) ( IN-CITY ?auto_61527 ?auto_61535 ) ( not ( = ?auto_61527 ?auto_61533 ) ) ( OBJ-AT ?auto_61529 ?auto_61527 ) ( not ( = ?auto_61529 ?auto_61530 ) ) ( OBJ-AT ?auto_61530 ?auto_61533 ) ( TRUCK-AT ?auto_61532 ?auto_61534 ) ( IN-CITY ?auto_61534 ?auto_61535 ) ( not ( = ?auto_61527 ?auto_61534 ) ) ( not ( = ?auto_61533 ?auto_61534 ) ) ( OBJ-AT ?auto_61528 ?auto_61527 ) ( OBJ-AT ?auto_61531 ?auto_61527 ) ( not ( = ?auto_61528 ?auto_61529 ) ) ( not ( = ?auto_61528 ?auto_61531 ) ) ( not ( = ?auto_61528 ?auto_61530 ) ) ( not ( = ?auto_61529 ?auto_61531 ) ) ( not ( = ?auto_61531 ?auto_61530 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61529 ?auto_61530 ?auto_61527 )
      ( DELIVER-4PKG-VERIFY ?auto_61528 ?auto_61529 ?auto_61531 ?auto_61530 ?auto_61527 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61546 - OBJ
      ?auto_61547 - OBJ
      ?auto_61549 - OBJ
      ?auto_61548 - OBJ
      ?auto_61545 - LOCATION
    )
    :vars
    (
      ?auto_61551 - LOCATION
      ?auto_61553 - CITY
      ?auto_61550 - TRUCK
      ?auto_61552 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61551 ?auto_61553 ) ( IN-CITY ?auto_61545 ?auto_61553 ) ( not ( = ?auto_61545 ?auto_61551 ) ) ( OBJ-AT ?auto_61547 ?auto_61545 ) ( not ( = ?auto_61547 ?auto_61549 ) ) ( OBJ-AT ?auto_61549 ?auto_61551 ) ( TRUCK-AT ?auto_61550 ?auto_61552 ) ( IN-CITY ?auto_61552 ?auto_61553 ) ( not ( = ?auto_61545 ?auto_61552 ) ) ( not ( = ?auto_61551 ?auto_61552 ) ) ( OBJ-AT ?auto_61546 ?auto_61545 ) ( OBJ-AT ?auto_61548 ?auto_61545 ) ( not ( = ?auto_61546 ?auto_61547 ) ) ( not ( = ?auto_61546 ?auto_61549 ) ) ( not ( = ?auto_61546 ?auto_61548 ) ) ( not ( = ?auto_61547 ?auto_61548 ) ) ( not ( = ?auto_61549 ?auto_61548 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61547 ?auto_61549 ?auto_61545 )
      ( DELIVER-4PKG-VERIFY ?auto_61546 ?auto_61547 ?auto_61549 ?auto_61548 ?auto_61545 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61877 - OBJ
      ?auto_61878 - OBJ
      ?auto_61880 - OBJ
      ?auto_61879 - OBJ
      ?auto_61876 - LOCATION
    )
    :vars
    (
      ?auto_61882 - LOCATION
      ?auto_61884 - CITY
      ?auto_61881 - TRUCK
      ?auto_61883 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61882 ?auto_61884 ) ( IN-CITY ?auto_61876 ?auto_61884 ) ( not ( = ?auto_61876 ?auto_61882 ) ) ( OBJ-AT ?auto_61878 ?auto_61876 ) ( not ( = ?auto_61878 ?auto_61877 ) ) ( OBJ-AT ?auto_61877 ?auto_61882 ) ( TRUCK-AT ?auto_61881 ?auto_61883 ) ( IN-CITY ?auto_61883 ?auto_61884 ) ( not ( = ?auto_61876 ?auto_61883 ) ) ( not ( = ?auto_61882 ?auto_61883 ) ) ( OBJ-AT ?auto_61880 ?auto_61876 ) ( OBJ-AT ?auto_61879 ?auto_61876 ) ( not ( = ?auto_61877 ?auto_61880 ) ) ( not ( = ?auto_61877 ?auto_61879 ) ) ( not ( = ?auto_61878 ?auto_61880 ) ) ( not ( = ?auto_61878 ?auto_61879 ) ) ( not ( = ?auto_61880 ?auto_61879 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61878 ?auto_61877 ?auto_61876 )
      ( DELIVER-4PKG-VERIFY ?auto_61877 ?auto_61878 ?auto_61880 ?auto_61879 ?auto_61876 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_62171 - OBJ
      ?auto_62172 - OBJ
      ?auto_62173 - OBJ
      ?auto_62170 - LOCATION
    )
    :vars
    (
      ?auto_62175 - LOCATION
      ?auto_62174 - CITY
      ?auto_62176 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62175 ?auto_62174 ) ( IN-CITY ?auto_62170 ?auto_62174 ) ( not ( = ?auto_62170 ?auto_62175 ) ) ( OBJ-AT ?auto_62173 ?auto_62170 ) ( not ( = ?auto_62173 ?auto_62172 ) ) ( OBJ-AT ?auto_62172 ?auto_62175 ) ( TRUCK-AT ?auto_62176 ?auto_62170 ) ( OBJ-AT ?auto_62171 ?auto_62170 ) ( not ( = ?auto_62171 ?auto_62172 ) ) ( not ( = ?auto_62171 ?auto_62173 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_62173 ?auto_62172 ?auto_62170 )
      ( DELIVER-3PKG-VERIFY ?auto_62171 ?auto_62172 ?auto_62173 ?auto_62170 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_69753 - OBJ
      ?auto_69754 - OBJ
      ?auto_69755 - OBJ
      ?auto_69752 - LOCATION
    )
    :vars
    (
      ?auto_69756 - TRUCK
      ?auto_69757 - LOCATION
      ?auto_69758 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_69756 ?auto_69757 ) ( IN-CITY ?auto_69757 ?auto_69758 ) ( IN-CITY ?auto_69752 ?auto_69758 ) ( not ( = ?auto_69752 ?auto_69757 ) ) ( OBJ-AT ?auto_69753 ?auto_69752 ) ( not ( = ?auto_69753 ?auto_69755 ) ) ( OBJ-AT ?auto_69755 ?auto_69757 ) ( OBJ-AT ?auto_69754 ?auto_69752 ) ( not ( = ?auto_69753 ?auto_69754 ) ) ( not ( = ?auto_69754 ?auto_69755 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69753 ?auto_69755 ?auto_69752 )
      ( DELIVER-3PKG-VERIFY ?auto_69753 ?auto_69754 ?auto_69755 ?auto_69752 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74843 - OBJ
      ?auto_74844 - OBJ
      ?auto_74845 - OBJ
      ?auto_74842 - LOCATION
    )
    :vars
    (
      ?auto_74846 - LOCATION
      ?auto_74848 - CITY
      ?auto_74847 - TRUCK
      ?auto_74849 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74846 ?auto_74848 ) ( IN-CITY ?auto_74842 ?auto_74848 ) ( not ( = ?auto_74842 ?auto_74846 ) ) ( OBJ-AT ?auto_74843 ?auto_74842 ) ( not ( = ?auto_74843 ?auto_74844 ) ) ( OBJ-AT ?auto_74844 ?auto_74846 ) ( TRUCK-AT ?auto_74847 ?auto_74849 ) ( IN-CITY ?auto_74849 ?auto_74848 ) ( not ( = ?auto_74842 ?auto_74849 ) ) ( not ( = ?auto_74846 ?auto_74849 ) ) ( OBJ-AT ?auto_74845 ?auto_74842 ) ( not ( = ?auto_74843 ?auto_74845 ) ) ( not ( = ?auto_74844 ?auto_74845 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74843 ?auto_74844 ?auto_74842 )
      ( DELIVER-3PKG-VERIFY ?auto_74843 ?auto_74844 ?auto_74845 ?auto_74842 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74875 - OBJ
      ?auto_74876 - OBJ
      ?auto_74877 - OBJ
      ?auto_74874 - LOCATION
    )
    :vars
    (
      ?auto_74878 - LOCATION
      ?auto_74881 - CITY
      ?auto_74879 - OBJ
      ?auto_74880 - TRUCK
      ?auto_74882 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74878 ?auto_74881 ) ( IN-CITY ?auto_74874 ?auto_74881 ) ( not ( = ?auto_74874 ?auto_74878 ) ) ( OBJ-AT ?auto_74879 ?auto_74874 ) ( not ( = ?auto_74879 ?auto_74877 ) ) ( OBJ-AT ?auto_74877 ?auto_74878 ) ( TRUCK-AT ?auto_74880 ?auto_74882 ) ( IN-CITY ?auto_74882 ?auto_74881 ) ( not ( = ?auto_74874 ?auto_74882 ) ) ( not ( = ?auto_74878 ?auto_74882 ) ) ( OBJ-AT ?auto_74875 ?auto_74874 ) ( OBJ-AT ?auto_74876 ?auto_74874 ) ( not ( = ?auto_74875 ?auto_74876 ) ) ( not ( = ?auto_74875 ?auto_74877 ) ) ( not ( = ?auto_74875 ?auto_74879 ) ) ( not ( = ?auto_74876 ?auto_74877 ) ) ( not ( = ?auto_74876 ?auto_74879 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74879 ?auto_74877 ?auto_74874 )
      ( DELIVER-3PKG-VERIFY ?auto_74875 ?auto_74876 ?auto_74877 ?auto_74874 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74897 - OBJ
      ?auto_74898 - OBJ
      ?auto_74899 - OBJ
      ?auto_74896 - LOCATION
    )
    :vars
    (
      ?auto_74900 - LOCATION
      ?auto_74903 - CITY
      ?auto_74901 - OBJ
      ?auto_74902 - TRUCK
      ?auto_74904 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74900 ?auto_74903 ) ( IN-CITY ?auto_74896 ?auto_74903 ) ( not ( = ?auto_74896 ?auto_74900 ) ) ( OBJ-AT ?auto_74901 ?auto_74896 ) ( not ( = ?auto_74901 ?auto_74898 ) ) ( OBJ-AT ?auto_74898 ?auto_74900 ) ( TRUCK-AT ?auto_74902 ?auto_74904 ) ( IN-CITY ?auto_74904 ?auto_74903 ) ( not ( = ?auto_74896 ?auto_74904 ) ) ( not ( = ?auto_74900 ?auto_74904 ) ) ( OBJ-AT ?auto_74897 ?auto_74896 ) ( OBJ-AT ?auto_74899 ?auto_74896 ) ( not ( = ?auto_74897 ?auto_74898 ) ) ( not ( = ?auto_74897 ?auto_74899 ) ) ( not ( = ?auto_74897 ?auto_74901 ) ) ( not ( = ?auto_74898 ?auto_74899 ) ) ( not ( = ?auto_74899 ?auto_74901 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74901 ?auto_74898 ?auto_74896 )
      ( DELIVER-3PKG-VERIFY ?auto_74897 ?auto_74898 ?auto_74899 ?auto_74896 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75017 - OBJ
      ?auto_75018 - OBJ
      ?auto_75019 - OBJ
      ?auto_75016 - LOCATION
    )
    :vars
    (
      ?auto_75020 - LOCATION
      ?auto_75023 - CITY
      ?auto_75021 - OBJ
      ?auto_75022 - TRUCK
      ?auto_75024 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75020 ?auto_75023 ) ( IN-CITY ?auto_75016 ?auto_75023 ) ( not ( = ?auto_75016 ?auto_75020 ) ) ( OBJ-AT ?auto_75021 ?auto_75016 ) ( not ( = ?auto_75021 ?auto_75017 ) ) ( OBJ-AT ?auto_75017 ?auto_75020 ) ( TRUCK-AT ?auto_75022 ?auto_75024 ) ( IN-CITY ?auto_75024 ?auto_75023 ) ( not ( = ?auto_75016 ?auto_75024 ) ) ( not ( = ?auto_75020 ?auto_75024 ) ) ( OBJ-AT ?auto_75018 ?auto_75016 ) ( OBJ-AT ?auto_75019 ?auto_75016 ) ( not ( = ?auto_75017 ?auto_75018 ) ) ( not ( = ?auto_75017 ?auto_75019 ) ) ( not ( = ?auto_75018 ?auto_75019 ) ) ( not ( = ?auto_75018 ?auto_75021 ) ) ( not ( = ?auto_75019 ?auto_75021 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75021 ?auto_75017 ?auto_75016 )
      ( DELIVER-3PKG-VERIFY ?auto_75017 ?auto_75018 ?auto_75019 ?auto_75016 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75141 - OBJ
      ?auto_75142 - OBJ
      ?auto_75144 - OBJ
      ?auto_75143 - OBJ
      ?auto_75140 - LOCATION
    )
    :vars
    (
      ?auto_75145 - LOCATION
      ?auto_75147 - CITY
      ?auto_75146 - TRUCK
      ?auto_75148 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75145 ?auto_75147 ) ( IN-CITY ?auto_75140 ?auto_75147 ) ( not ( = ?auto_75140 ?auto_75145 ) ) ( OBJ-AT ?auto_75141 ?auto_75140 ) ( not ( = ?auto_75141 ?auto_75144 ) ) ( OBJ-AT ?auto_75144 ?auto_75145 ) ( TRUCK-AT ?auto_75146 ?auto_75148 ) ( IN-CITY ?auto_75148 ?auto_75147 ) ( not ( = ?auto_75140 ?auto_75148 ) ) ( not ( = ?auto_75145 ?auto_75148 ) ) ( OBJ-AT ?auto_75142 ?auto_75140 ) ( OBJ-AT ?auto_75143 ?auto_75140 ) ( not ( = ?auto_75141 ?auto_75142 ) ) ( not ( = ?auto_75141 ?auto_75143 ) ) ( not ( = ?auto_75142 ?auto_75144 ) ) ( not ( = ?auto_75142 ?auto_75143 ) ) ( not ( = ?auto_75144 ?auto_75143 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75141 ?auto_75144 ?auto_75140 )
      ( DELIVER-4PKG-VERIFY ?auto_75141 ?auto_75142 ?auto_75144 ?auto_75143 ?auto_75140 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75177 - OBJ
      ?auto_75178 - OBJ
      ?auto_75180 - OBJ
      ?auto_75179 - OBJ
      ?auto_75176 - LOCATION
    )
    :vars
    (
      ?auto_75181 - LOCATION
      ?auto_75183 - CITY
      ?auto_75182 - TRUCK
      ?auto_75184 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75181 ?auto_75183 ) ( IN-CITY ?auto_75176 ?auto_75183 ) ( not ( = ?auto_75176 ?auto_75181 ) ) ( OBJ-AT ?auto_75180 ?auto_75176 ) ( not ( = ?auto_75180 ?auto_75179 ) ) ( OBJ-AT ?auto_75179 ?auto_75181 ) ( TRUCK-AT ?auto_75182 ?auto_75184 ) ( IN-CITY ?auto_75184 ?auto_75183 ) ( not ( = ?auto_75176 ?auto_75184 ) ) ( not ( = ?auto_75181 ?auto_75184 ) ) ( OBJ-AT ?auto_75177 ?auto_75176 ) ( OBJ-AT ?auto_75178 ?auto_75176 ) ( not ( = ?auto_75177 ?auto_75178 ) ) ( not ( = ?auto_75177 ?auto_75180 ) ) ( not ( = ?auto_75177 ?auto_75179 ) ) ( not ( = ?auto_75178 ?auto_75180 ) ) ( not ( = ?auto_75178 ?auto_75179 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75180 ?auto_75179 ?auto_75176 )
      ( DELIVER-4PKG-VERIFY ?auto_75177 ?auto_75178 ?auto_75180 ?auto_75179 ?auto_75176 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75312 - OBJ
      ?auto_75313 - OBJ
      ?auto_75315 - OBJ
      ?auto_75314 - OBJ
      ?auto_75311 - LOCATION
    )
    :vars
    (
      ?auto_75316 - LOCATION
      ?auto_75318 - CITY
      ?auto_75317 - TRUCK
      ?auto_75319 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75316 ?auto_75318 ) ( IN-CITY ?auto_75311 ?auto_75318 ) ( not ( = ?auto_75311 ?auto_75316 ) ) ( OBJ-AT ?auto_75315 ?auto_75311 ) ( not ( = ?auto_75315 ?auto_75313 ) ) ( OBJ-AT ?auto_75313 ?auto_75316 ) ( TRUCK-AT ?auto_75317 ?auto_75319 ) ( IN-CITY ?auto_75319 ?auto_75318 ) ( not ( = ?auto_75311 ?auto_75319 ) ) ( not ( = ?auto_75316 ?auto_75319 ) ) ( OBJ-AT ?auto_75312 ?auto_75311 ) ( OBJ-AT ?auto_75314 ?auto_75311 ) ( not ( = ?auto_75312 ?auto_75313 ) ) ( not ( = ?auto_75312 ?auto_75315 ) ) ( not ( = ?auto_75312 ?auto_75314 ) ) ( not ( = ?auto_75313 ?auto_75314 ) ) ( not ( = ?auto_75315 ?auto_75314 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75315 ?auto_75313 ?auto_75311 )
      ( DELIVER-4PKG-VERIFY ?auto_75312 ?auto_75313 ?auto_75315 ?auto_75314 ?auto_75311 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75519 - OBJ
      ?auto_75520 - OBJ
      ?auto_75522 - OBJ
      ?auto_75521 - OBJ
      ?auto_75518 - LOCATION
    )
    :vars
    (
      ?auto_75523 - LOCATION
      ?auto_75526 - CITY
      ?auto_75524 - OBJ
      ?auto_75525 - TRUCK
      ?auto_75527 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75523 ?auto_75526 ) ( IN-CITY ?auto_75518 ?auto_75526 ) ( not ( = ?auto_75518 ?auto_75523 ) ) ( OBJ-AT ?auto_75524 ?auto_75518 ) ( not ( = ?auto_75524 ?auto_75521 ) ) ( OBJ-AT ?auto_75521 ?auto_75523 ) ( TRUCK-AT ?auto_75525 ?auto_75527 ) ( IN-CITY ?auto_75527 ?auto_75526 ) ( not ( = ?auto_75518 ?auto_75527 ) ) ( not ( = ?auto_75523 ?auto_75527 ) ) ( OBJ-AT ?auto_75519 ?auto_75518 ) ( OBJ-AT ?auto_75520 ?auto_75518 ) ( OBJ-AT ?auto_75522 ?auto_75518 ) ( not ( = ?auto_75519 ?auto_75520 ) ) ( not ( = ?auto_75519 ?auto_75522 ) ) ( not ( = ?auto_75519 ?auto_75521 ) ) ( not ( = ?auto_75519 ?auto_75524 ) ) ( not ( = ?auto_75520 ?auto_75522 ) ) ( not ( = ?auto_75520 ?auto_75521 ) ) ( not ( = ?auto_75520 ?auto_75524 ) ) ( not ( = ?auto_75522 ?auto_75521 ) ) ( not ( = ?auto_75522 ?auto_75524 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75524 ?auto_75521 ?auto_75518 )
      ( DELIVER-4PKG-VERIFY ?auto_75519 ?auto_75520 ?auto_75522 ?auto_75521 ?auto_75518 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75548 - OBJ
      ?auto_75549 - OBJ
      ?auto_75551 - OBJ
      ?auto_75550 - OBJ
      ?auto_75547 - LOCATION
    )
    :vars
    (
      ?auto_75552 - LOCATION
      ?auto_75555 - CITY
      ?auto_75553 - OBJ
      ?auto_75554 - TRUCK
      ?auto_75556 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75552 ?auto_75555 ) ( IN-CITY ?auto_75547 ?auto_75555 ) ( not ( = ?auto_75547 ?auto_75552 ) ) ( OBJ-AT ?auto_75553 ?auto_75547 ) ( not ( = ?auto_75553 ?auto_75551 ) ) ( OBJ-AT ?auto_75551 ?auto_75552 ) ( TRUCK-AT ?auto_75554 ?auto_75556 ) ( IN-CITY ?auto_75556 ?auto_75555 ) ( not ( = ?auto_75547 ?auto_75556 ) ) ( not ( = ?auto_75552 ?auto_75556 ) ) ( OBJ-AT ?auto_75548 ?auto_75547 ) ( OBJ-AT ?auto_75549 ?auto_75547 ) ( OBJ-AT ?auto_75550 ?auto_75547 ) ( not ( = ?auto_75548 ?auto_75549 ) ) ( not ( = ?auto_75548 ?auto_75551 ) ) ( not ( = ?auto_75548 ?auto_75550 ) ) ( not ( = ?auto_75548 ?auto_75553 ) ) ( not ( = ?auto_75549 ?auto_75551 ) ) ( not ( = ?auto_75549 ?auto_75550 ) ) ( not ( = ?auto_75549 ?auto_75553 ) ) ( not ( = ?auto_75551 ?auto_75550 ) ) ( not ( = ?auto_75550 ?auto_75553 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75553 ?auto_75551 ?auto_75547 )
      ( DELIVER-4PKG-VERIFY ?auto_75548 ?auto_75549 ?auto_75551 ?auto_75550 ?auto_75547 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75682 - OBJ
      ?auto_75683 - OBJ
      ?auto_75685 - OBJ
      ?auto_75684 - OBJ
      ?auto_75681 - LOCATION
    )
    :vars
    (
      ?auto_75686 - LOCATION
      ?auto_75688 - CITY
      ?auto_75687 - TRUCK
      ?auto_75689 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75686 ?auto_75688 ) ( IN-CITY ?auto_75681 ?auto_75688 ) ( not ( = ?auto_75681 ?auto_75686 ) ) ( OBJ-AT ?auto_75684 ?auto_75681 ) ( not ( = ?auto_75684 ?auto_75683 ) ) ( OBJ-AT ?auto_75683 ?auto_75686 ) ( TRUCK-AT ?auto_75687 ?auto_75689 ) ( IN-CITY ?auto_75689 ?auto_75688 ) ( not ( = ?auto_75681 ?auto_75689 ) ) ( not ( = ?auto_75686 ?auto_75689 ) ) ( OBJ-AT ?auto_75682 ?auto_75681 ) ( OBJ-AT ?auto_75685 ?auto_75681 ) ( not ( = ?auto_75682 ?auto_75683 ) ) ( not ( = ?auto_75682 ?auto_75685 ) ) ( not ( = ?auto_75682 ?auto_75684 ) ) ( not ( = ?auto_75683 ?auto_75685 ) ) ( not ( = ?auto_75685 ?auto_75684 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75684 ?auto_75683 ?auto_75681 )
      ( DELIVER-4PKG-VERIFY ?auto_75682 ?auto_75683 ?auto_75685 ?auto_75684 ?auto_75681 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75691 - OBJ
      ?auto_75692 - OBJ
      ?auto_75694 - OBJ
      ?auto_75693 - OBJ
      ?auto_75690 - LOCATION
    )
    :vars
    (
      ?auto_75695 - LOCATION
      ?auto_75698 - CITY
      ?auto_75696 - OBJ
      ?auto_75697 - TRUCK
      ?auto_75699 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75695 ?auto_75698 ) ( IN-CITY ?auto_75690 ?auto_75698 ) ( not ( = ?auto_75690 ?auto_75695 ) ) ( OBJ-AT ?auto_75696 ?auto_75690 ) ( not ( = ?auto_75696 ?auto_75692 ) ) ( OBJ-AT ?auto_75692 ?auto_75695 ) ( TRUCK-AT ?auto_75697 ?auto_75699 ) ( IN-CITY ?auto_75699 ?auto_75698 ) ( not ( = ?auto_75690 ?auto_75699 ) ) ( not ( = ?auto_75695 ?auto_75699 ) ) ( OBJ-AT ?auto_75691 ?auto_75690 ) ( OBJ-AT ?auto_75694 ?auto_75690 ) ( OBJ-AT ?auto_75693 ?auto_75690 ) ( not ( = ?auto_75691 ?auto_75692 ) ) ( not ( = ?auto_75691 ?auto_75694 ) ) ( not ( = ?auto_75691 ?auto_75693 ) ) ( not ( = ?auto_75691 ?auto_75696 ) ) ( not ( = ?auto_75692 ?auto_75694 ) ) ( not ( = ?auto_75692 ?auto_75693 ) ) ( not ( = ?auto_75694 ?auto_75693 ) ) ( not ( = ?auto_75694 ?auto_75696 ) ) ( not ( = ?auto_75693 ?auto_75696 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75696 ?auto_75692 ?auto_75690 )
      ( DELIVER-4PKG-VERIFY ?auto_75691 ?auto_75692 ?auto_75694 ?auto_75693 ?auto_75690 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76160 - OBJ
      ?auto_76161 - OBJ
      ?auto_76163 - OBJ
      ?auto_76162 - OBJ
      ?auto_76159 - LOCATION
    )
    :vars
    (
      ?auto_76164 - LOCATION
      ?auto_76166 - CITY
      ?auto_76165 - TRUCK
      ?auto_76167 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76164 ?auto_76166 ) ( IN-CITY ?auto_76159 ?auto_76166 ) ( not ( = ?auto_76159 ?auto_76164 ) ) ( OBJ-AT ?auto_76163 ?auto_76159 ) ( not ( = ?auto_76163 ?auto_76160 ) ) ( OBJ-AT ?auto_76160 ?auto_76164 ) ( TRUCK-AT ?auto_76165 ?auto_76167 ) ( IN-CITY ?auto_76167 ?auto_76166 ) ( not ( = ?auto_76159 ?auto_76167 ) ) ( not ( = ?auto_76164 ?auto_76167 ) ) ( OBJ-AT ?auto_76161 ?auto_76159 ) ( OBJ-AT ?auto_76162 ?auto_76159 ) ( not ( = ?auto_76160 ?auto_76161 ) ) ( not ( = ?auto_76160 ?auto_76162 ) ) ( not ( = ?auto_76161 ?auto_76163 ) ) ( not ( = ?auto_76161 ?auto_76162 ) ) ( not ( = ?auto_76163 ?auto_76162 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76163 ?auto_76160 ?auto_76159 )
      ( DELIVER-4PKG-VERIFY ?auto_76160 ?auto_76161 ?auto_76163 ?auto_76162 ?auto_76159 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76340 - OBJ
      ?auto_76341 - OBJ
      ?auto_76343 - OBJ
      ?auto_76342 - OBJ
      ?auto_76339 - LOCATION
    )
    :vars
    (
      ?auto_76344 - LOCATION
      ?auto_76347 - CITY
      ?auto_76345 - OBJ
      ?auto_76346 - TRUCK
      ?auto_76348 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76344 ?auto_76347 ) ( IN-CITY ?auto_76339 ?auto_76347 ) ( not ( = ?auto_76339 ?auto_76344 ) ) ( OBJ-AT ?auto_76345 ?auto_76339 ) ( not ( = ?auto_76345 ?auto_76340 ) ) ( OBJ-AT ?auto_76340 ?auto_76344 ) ( TRUCK-AT ?auto_76346 ?auto_76348 ) ( IN-CITY ?auto_76348 ?auto_76347 ) ( not ( = ?auto_76339 ?auto_76348 ) ) ( not ( = ?auto_76344 ?auto_76348 ) ) ( OBJ-AT ?auto_76341 ?auto_76339 ) ( OBJ-AT ?auto_76343 ?auto_76339 ) ( OBJ-AT ?auto_76342 ?auto_76339 ) ( not ( = ?auto_76340 ?auto_76341 ) ) ( not ( = ?auto_76340 ?auto_76343 ) ) ( not ( = ?auto_76340 ?auto_76342 ) ) ( not ( = ?auto_76341 ?auto_76343 ) ) ( not ( = ?auto_76341 ?auto_76342 ) ) ( not ( = ?auto_76341 ?auto_76345 ) ) ( not ( = ?auto_76343 ?auto_76342 ) ) ( not ( = ?auto_76343 ?auto_76345 ) ) ( not ( = ?auto_76342 ?auto_76345 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76345 ?auto_76340 ?auto_76339 )
      ( DELIVER-4PKG-VERIFY ?auto_76340 ?auto_76341 ?auto_76343 ?auto_76342 ?auto_76339 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_76954 - OBJ
      ?auto_76955 - OBJ
      ?auto_76956 - OBJ
      ?auto_76953 - LOCATION
    )
    :vars
    (
      ?auto_76958 - LOCATION
      ?auto_76957 - CITY
      ?auto_76960 - TRUCK
      ?auto_76959 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76958 ?auto_76957 ) ( IN-CITY ?auto_76953 ?auto_76957 ) ( not ( = ?auto_76953 ?auto_76958 ) ) ( OBJ-AT ?auto_76955 ?auto_76953 ) ( not ( = ?auto_76955 ?auto_76954 ) ) ( OBJ-AT ?auto_76954 ?auto_76958 ) ( TRUCK-AT ?auto_76960 ?auto_76959 ) ( IN-CITY ?auto_76959 ?auto_76957 ) ( not ( = ?auto_76953 ?auto_76959 ) ) ( not ( = ?auto_76958 ?auto_76959 ) ) ( OBJ-AT ?auto_76956 ?auto_76953 ) ( not ( = ?auto_76954 ?auto_76956 ) ) ( not ( = ?auto_76955 ?auto_76956 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76955 ?auto_76954 ?auto_76953 )
      ( DELIVER-3PKG-VERIFY ?auto_76954 ?auto_76955 ?auto_76956 ?auto_76953 ) )
  )

)

