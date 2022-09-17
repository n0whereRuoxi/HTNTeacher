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

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2356 - OBJ
      ?auto_2357 - LOCATION
    )
    :vars
    (
      ?auto_2366 - LOCATION
      ?auto_2363 - CITY
      ?auto_2358 - TRUCK
      ?auto_2369 - LOCATION
      ?auto_2370 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_2366 ?auto_2363 ) ( IN-CITY ?auto_2357 ?auto_2363 ) ( not ( = ?auto_2357 ?auto_2366 ) ) ( OBJ-AT ?auto_2356 ?auto_2366 ) ( TRUCK-AT ?auto_2358 ?auto_2369 ) ( IN-CITY ?auto_2369 ?auto_2370 ) ( IN-CITY ?auto_2366 ?auto_2370 ) ( not ( = ?auto_2366 ?auto_2369 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2358 ?auto_2369 ?auto_2366 ?auto_2370 )
      ( !LOAD-TRUCK ?auto_2356 ?auto_2358 ?auto_2366 )
      ( !DRIVE-TRUCK ?auto_2358 ?auto_2366 ?auto_2357 ?auto_2363 )
      ( !UNLOAD-TRUCK ?auto_2356 ?auto_2358 ?auto_2357 )
      ( DELIVER-1PKG-VERIFY ?auto_2356 ?auto_2357 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2393 - OBJ
      ?auto_2395 - OBJ
      ?auto_2397 - LOCATION
    )
    :vars
    (
      ?auto_2396 - LOCATION
      ?auto_2400 - CITY
      ?auto_2401 - CITY
      ?auto_2406 - LOCATION
      ?auto_2403 - CITY
      ?auto_2402 - TRUCK
      ?auto_2405 - LOCATION
      ?auto_2407 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2395 ?auto_2393 ) ( IN-CITY ?auto_2396 ?auto_2400 ) ( IN-CITY ?auto_2397 ?auto_2400 ) ( not ( = ?auto_2397 ?auto_2396 ) ) ( OBJ-AT ?auto_2395 ?auto_2396 ) ( IN-CITY ?auto_2397 ?auto_2401 ) ( IN-CITY ?auto_2396 ?auto_2401 ) ( IN-CITY ?auto_2406 ?auto_2403 ) ( IN-CITY ?auto_2397 ?auto_2403 ) ( not ( = ?auto_2397 ?auto_2406 ) ) ( OBJ-AT ?auto_2393 ?auto_2406 ) ( TRUCK-AT ?auto_2402 ?auto_2405 ) ( IN-CITY ?auto_2405 ?auto_2407 ) ( IN-CITY ?auto_2406 ?auto_2407 ) ( not ( = ?auto_2406 ?auto_2405 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2393 ?auto_2397 )
      ( DELIVER-1PKG ?auto_2395 ?auto_2397 )
      ( DELIVER-2PKG-VERIFY ?auto_2393 ?auto_2395 ?auto_2397 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2432 - OBJ
      ?auto_2434 - OBJ
      ?auto_2435 - OBJ
      ?auto_2438 - LOCATION
    )
    :vars
    (
      ?auto_2436 - LOCATION
      ?auto_2439 - CITY
      ?auto_2440 - CITY
      ?auto_2448 - LOCATION
      ?auto_2451 - CITY
      ?auto_2445 - CITY
      ?auto_2444 - LOCATION
      ?auto_2443 - CITY
      ?auto_2441 - TRUCK
      ?auto_2453 - LOCATION
      ?auto_2452 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2434 ?auto_2432 ) ( GREATER-THAN ?auto_2435 ?auto_2432 ) ( GREATER-THAN ?auto_2435 ?auto_2434 ) ( IN-CITY ?auto_2436 ?auto_2439 ) ( IN-CITY ?auto_2438 ?auto_2439 ) ( not ( = ?auto_2438 ?auto_2436 ) ) ( OBJ-AT ?auto_2435 ?auto_2436 ) ( IN-CITY ?auto_2438 ?auto_2440 ) ( IN-CITY ?auto_2436 ?auto_2440 ) ( IN-CITY ?auto_2448 ?auto_2451 ) ( IN-CITY ?auto_2438 ?auto_2451 ) ( not ( = ?auto_2438 ?auto_2448 ) ) ( OBJ-AT ?auto_2434 ?auto_2448 ) ( IN-CITY ?auto_2438 ?auto_2445 ) ( IN-CITY ?auto_2448 ?auto_2445 ) ( IN-CITY ?auto_2444 ?auto_2443 ) ( IN-CITY ?auto_2438 ?auto_2443 ) ( not ( = ?auto_2438 ?auto_2444 ) ) ( OBJ-AT ?auto_2432 ?auto_2444 ) ( TRUCK-AT ?auto_2441 ?auto_2453 ) ( IN-CITY ?auto_2453 ?auto_2452 ) ( IN-CITY ?auto_2444 ?auto_2452 ) ( not ( = ?auto_2444 ?auto_2453 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2432 ?auto_2434 ?auto_2438 )
      ( DELIVER-1PKG ?auto_2435 ?auto_2438 )
      ( DELIVER-3PKG-VERIFY ?auto_2432 ?auto_2434 ?auto_2435 ?auto_2438 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2477 - OBJ
      ?auto_2479 - OBJ
      ?auto_2480 - OBJ
      ?auto_2481 - OBJ
      ?auto_2488 - LOCATION
    )
    :vars
    (
      ?auto_2482 - LOCATION
      ?auto_2486 - CITY
      ?auto_2483 - CITY
      ?auto_2496 - LOCATION
      ?auto_2499 - CITY
      ?auto_2492 - CITY
      ?auto_2503 - LOCATION
      ?auto_2489 - CITY
      ?auto_2501 - CITY
      ?auto_2502 - LOCATION
      ?auto_2493 - CITY
      ?auto_2485 - TRUCK
      ?auto_2500 - LOCATION
      ?auto_2490 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2479 ?auto_2477 ) ( GREATER-THAN ?auto_2480 ?auto_2477 ) ( GREATER-THAN ?auto_2480 ?auto_2479 ) ( GREATER-THAN ?auto_2481 ?auto_2477 ) ( GREATER-THAN ?auto_2481 ?auto_2479 ) ( GREATER-THAN ?auto_2481 ?auto_2480 ) ( IN-CITY ?auto_2482 ?auto_2486 ) ( IN-CITY ?auto_2488 ?auto_2486 ) ( not ( = ?auto_2488 ?auto_2482 ) ) ( OBJ-AT ?auto_2481 ?auto_2482 ) ( IN-CITY ?auto_2488 ?auto_2483 ) ( IN-CITY ?auto_2482 ?auto_2483 ) ( IN-CITY ?auto_2496 ?auto_2499 ) ( IN-CITY ?auto_2488 ?auto_2499 ) ( not ( = ?auto_2488 ?auto_2496 ) ) ( OBJ-AT ?auto_2480 ?auto_2496 ) ( IN-CITY ?auto_2488 ?auto_2492 ) ( IN-CITY ?auto_2496 ?auto_2492 ) ( IN-CITY ?auto_2503 ?auto_2489 ) ( IN-CITY ?auto_2488 ?auto_2489 ) ( not ( = ?auto_2488 ?auto_2503 ) ) ( OBJ-AT ?auto_2479 ?auto_2503 ) ( IN-CITY ?auto_2488 ?auto_2501 ) ( IN-CITY ?auto_2503 ?auto_2501 ) ( IN-CITY ?auto_2502 ?auto_2493 ) ( IN-CITY ?auto_2488 ?auto_2493 ) ( not ( = ?auto_2488 ?auto_2502 ) ) ( OBJ-AT ?auto_2477 ?auto_2502 ) ( TRUCK-AT ?auto_2485 ?auto_2500 ) ( IN-CITY ?auto_2500 ?auto_2490 ) ( IN-CITY ?auto_2502 ?auto_2490 ) ( not ( = ?auto_2502 ?auto_2500 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2477 ?auto_2479 ?auto_2480 ?auto_2488 )
      ( DELIVER-1PKG ?auto_2481 ?auto_2488 )
      ( DELIVER-4PKG-VERIFY ?auto_2477 ?auto_2479 ?auto_2480 ?auto_2481 ?auto_2488 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2528 - OBJ
      ?auto_2530 - OBJ
      ?auto_2531 - OBJ
      ?auto_2532 - OBJ
      ?auto_2533 - OBJ
      ?auto_2537 - LOCATION
    )
    :vars
    (
      ?auto_2535 - LOCATION
      ?auto_2536 - CITY
      ?auto_2539 - CITY
      ?auto_2556 - LOCATION
      ?auto_2554 - CITY
      ?auto_2558 - CITY
      ?auto_2552 - LOCATION
      ?auto_2547 - CITY
      ?auto_2550 - CITY
      ?auto_2542 - LOCATION
      ?auto_2545 - CITY
      ?auto_2548 - CITY
      ?auto_2549 - LOCATION
      ?auto_2541 - CITY
      ?auto_2538 - TRUCK
      ?auto_2546 - LOCATION
      ?auto_2551 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2530 ?auto_2528 ) ( GREATER-THAN ?auto_2531 ?auto_2528 ) ( GREATER-THAN ?auto_2531 ?auto_2530 ) ( GREATER-THAN ?auto_2532 ?auto_2528 ) ( GREATER-THAN ?auto_2532 ?auto_2530 ) ( GREATER-THAN ?auto_2532 ?auto_2531 ) ( GREATER-THAN ?auto_2533 ?auto_2528 ) ( GREATER-THAN ?auto_2533 ?auto_2530 ) ( GREATER-THAN ?auto_2533 ?auto_2531 ) ( GREATER-THAN ?auto_2533 ?auto_2532 ) ( IN-CITY ?auto_2535 ?auto_2536 ) ( IN-CITY ?auto_2537 ?auto_2536 ) ( not ( = ?auto_2537 ?auto_2535 ) ) ( OBJ-AT ?auto_2533 ?auto_2535 ) ( IN-CITY ?auto_2537 ?auto_2539 ) ( IN-CITY ?auto_2535 ?auto_2539 ) ( IN-CITY ?auto_2556 ?auto_2554 ) ( IN-CITY ?auto_2537 ?auto_2554 ) ( not ( = ?auto_2537 ?auto_2556 ) ) ( OBJ-AT ?auto_2532 ?auto_2556 ) ( IN-CITY ?auto_2537 ?auto_2558 ) ( IN-CITY ?auto_2556 ?auto_2558 ) ( IN-CITY ?auto_2552 ?auto_2547 ) ( IN-CITY ?auto_2537 ?auto_2547 ) ( not ( = ?auto_2537 ?auto_2552 ) ) ( OBJ-AT ?auto_2531 ?auto_2552 ) ( IN-CITY ?auto_2537 ?auto_2550 ) ( IN-CITY ?auto_2552 ?auto_2550 ) ( IN-CITY ?auto_2542 ?auto_2545 ) ( IN-CITY ?auto_2537 ?auto_2545 ) ( not ( = ?auto_2537 ?auto_2542 ) ) ( OBJ-AT ?auto_2530 ?auto_2542 ) ( IN-CITY ?auto_2537 ?auto_2548 ) ( IN-CITY ?auto_2542 ?auto_2548 ) ( IN-CITY ?auto_2549 ?auto_2541 ) ( IN-CITY ?auto_2537 ?auto_2541 ) ( not ( = ?auto_2537 ?auto_2549 ) ) ( OBJ-AT ?auto_2528 ?auto_2549 ) ( TRUCK-AT ?auto_2538 ?auto_2546 ) ( IN-CITY ?auto_2546 ?auto_2551 ) ( IN-CITY ?auto_2549 ?auto_2551 ) ( not ( = ?auto_2549 ?auto_2546 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2528 ?auto_2530 ?auto_2531 ?auto_2532 ?auto_2537 )
      ( DELIVER-1PKG ?auto_2533 ?auto_2537 )
      ( DELIVER-5PKG-VERIFY ?auto_2528 ?auto_2530 ?auto_2531 ?auto_2532 ?auto_2533 ?auto_2537 ) )
  )

)

