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
      ?auto_215936 - OBJ
      ?auto_215935 - LOCATION
    )
    :vars
    (
      ?auto_215937 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_215937 ?auto_215935 ) ( IN-TRUCK ?auto_215936 ?auto_215937 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_215936 ?auto_215937 ?auto_215935 )
      ( DELIVER-1PKG-VERIFY ?auto_215936 ?auto_215935 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_215961 - OBJ
      ?auto_215960 - LOCATION
    )
    :vars
    (
      ?auto_215962 - TRUCK
      ?auto_215963 - LOCATION
      ?auto_215964 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_215961 ?auto_215962 ) ( TRUCK-AT ?auto_215962 ?auto_215963 ) ( IN-CITY ?auto_215963 ?auto_215964 ) ( IN-CITY ?auto_215960 ?auto_215964 ) ( not ( = ?auto_215960 ?auto_215963 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_215962 ?auto_215963 ?auto_215960 ?auto_215964 )
      ( DELIVER-1PKG ?auto_215961 ?auto_215960 )
      ( DELIVER-1PKG-VERIFY ?auto_215961 ?auto_215960 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_215996 - OBJ
      ?auto_215995 - LOCATION
    )
    :vars
    (
      ?auto_215998 - TRUCK
      ?auto_215999 - LOCATION
      ?auto_215997 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_215998 ?auto_215999 ) ( IN-CITY ?auto_215999 ?auto_215997 ) ( IN-CITY ?auto_215995 ?auto_215997 ) ( not ( = ?auto_215995 ?auto_215999 ) ) ( OBJ-AT ?auto_215996 ?auto_215999 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_215996 ?auto_215998 ?auto_215999 )
      ( DELIVER-1PKG ?auto_215996 ?auto_215995 )
      ( DELIVER-1PKG-VERIFY ?auto_215996 ?auto_215995 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_216031 - OBJ
      ?auto_216030 - LOCATION
    )
    :vars
    (
      ?auto_216034 - LOCATION
      ?auto_216033 - CITY
      ?auto_216032 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216034 ?auto_216033 ) ( IN-CITY ?auto_216030 ?auto_216033 ) ( not ( = ?auto_216030 ?auto_216034 ) ) ( OBJ-AT ?auto_216031 ?auto_216034 ) ( TRUCK-AT ?auto_216032 ?auto_216030 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_216032 ?auto_216030 ?auto_216034 ?auto_216033 )
      ( DELIVER-1PKG ?auto_216031 ?auto_216030 )
      ( DELIVER-1PKG-VERIFY ?auto_216031 ?auto_216030 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216369 - OBJ
      ?auto_216370 - OBJ
      ?auto_216368 - LOCATION
    )
    :vars
    (
      ?auto_216371 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216371 ?auto_216368 ) ( IN-TRUCK ?auto_216370 ?auto_216371 ) ( OBJ-AT ?auto_216369 ?auto_216368 ) ( not ( = ?auto_216369 ?auto_216370 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216370 ?auto_216368 )
      ( DELIVER-2PKG-VERIFY ?auto_216369 ?auto_216370 ?auto_216368 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216373 - OBJ
      ?auto_216374 - OBJ
      ?auto_216372 - LOCATION
    )
    :vars
    (
      ?auto_216375 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216375 ?auto_216372 ) ( IN-TRUCK ?auto_216373 ?auto_216375 ) ( OBJ-AT ?auto_216374 ?auto_216372 ) ( not ( = ?auto_216373 ?auto_216374 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216373 ?auto_216372 )
      ( DELIVER-2PKG-VERIFY ?auto_216373 ?auto_216374 ?auto_216372 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216381 - OBJ
      ?auto_216382 - OBJ
      ?auto_216383 - OBJ
      ?auto_216380 - LOCATION
    )
    :vars
    (
      ?auto_216384 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216384 ?auto_216380 ) ( IN-TRUCK ?auto_216383 ?auto_216384 ) ( OBJ-AT ?auto_216381 ?auto_216380 ) ( OBJ-AT ?auto_216382 ?auto_216380 ) ( not ( = ?auto_216381 ?auto_216382 ) ) ( not ( = ?auto_216381 ?auto_216383 ) ) ( not ( = ?auto_216382 ?auto_216383 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216383 ?auto_216380 )
      ( DELIVER-3PKG-VERIFY ?auto_216381 ?auto_216382 ?auto_216383 ?auto_216380 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216386 - OBJ
      ?auto_216387 - OBJ
      ?auto_216388 - OBJ
      ?auto_216385 - LOCATION
    )
    :vars
    (
      ?auto_216389 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216389 ?auto_216385 ) ( IN-TRUCK ?auto_216387 ?auto_216389 ) ( OBJ-AT ?auto_216386 ?auto_216385 ) ( OBJ-AT ?auto_216388 ?auto_216385 ) ( not ( = ?auto_216386 ?auto_216387 ) ) ( not ( = ?auto_216386 ?auto_216388 ) ) ( not ( = ?auto_216387 ?auto_216388 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216387 ?auto_216385 )
      ( DELIVER-3PKG-VERIFY ?auto_216386 ?auto_216387 ?auto_216388 ?auto_216385 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216396 - OBJ
      ?auto_216397 - OBJ
      ?auto_216398 - OBJ
      ?auto_216395 - LOCATION
    )
    :vars
    (
      ?auto_216399 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216399 ?auto_216395 ) ( IN-TRUCK ?auto_216396 ?auto_216399 ) ( OBJ-AT ?auto_216397 ?auto_216395 ) ( OBJ-AT ?auto_216398 ?auto_216395 ) ( not ( = ?auto_216396 ?auto_216397 ) ) ( not ( = ?auto_216396 ?auto_216398 ) ) ( not ( = ?auto_216397 ?auto_216398 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216396 ?auto_216395 )
      ( DELIVER-3PKG-VERIFY ?auto_216396 ?auto_216397 ?auto_216398 ?auto_216395 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216416 - OBJ
      ?auto_216417 - OBJ
      ?auto_216419 - OBJ
      ?auto_216418 - OBJ
      ?auto_216415 - LOCATION
    )
    :vars
    (
      ?auto_216420 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216420 ?auto_216415 ) ( IN-TRUCK ?auto_216418 ?auto_216420 ) ( OBJ-AT ?auto_216416 ?auto_216415 ) ( OBJ-AT ?auto_216417 ?auto_216415 ) ( OBJ-AT ?auto_216419 ?auto_216415 ) ( not ( = ?auto_216416 ?auto_216417 ) ) ( not ( = ?auto_216416 ?auto_216419 ) ) ( not ( = ?auto_216416 ?auto_216418 ) ) ( not ( = ?auto_216417 ?auto_216419 ) ) ( not ( = ?auto_216417 ?auto_216418 ) ) ( not ( = ?auto_216419 ?auto_216418 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216418 ?auto_216415 )
      ( DELIVER-4PKG-VERIFY ?auto_216416 ?auto_216417 ?auto_216419 ?auto_216418 ?auto_216415 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216422 - OBJ
      ?auto_216423 - OBJ
      ?auto_216425 - OBJ
      ?auto_216424 - OBJ
      ?auto_216421 - LOCATION
    )
    :vars
    (
      ?auto_216426 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216426 ?auto_216421 ) ( IN-TRUCK ?auto_216425 ?auto_216426 ) ( OBJ-AT ?auto_216422 ?auto_216421 ) ( OBJ-AT ?auto_216423 ?auto_216421 ) ( OBJ-AT ?auto_216424 ?auto_216421 ) ( not ( = ?auto_216422 ?auto_216423 ) ) ( not ( = ?auto_216422 ?auto_216425 ) ) ( not ( = ?auto_216422 ?auto_216424 ) ) ( not ( = ?auto_216423 ?auto_216425 ) ) ( not ( = ?auto_216423 ?auto_216424 ) ) ( not ( = ?auto_216425 ?auto_216424 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216425 ?auto_216421 )
      ( DELIVER-4PKG-VERIFY ?auto_216422 ?auto_216423 ?auto_216425 ?auto_216424 ?auto_216421 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216434 - OBJ
      ?auto_216435 - OBJ
      ?auto_216437 - OBJ
      ?auto_216436 - OBJ
      ?auto_216433 - LOCATION
    )
    :vars
    (
      ?auto_216438 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216438 ?auto_216433 ) ( IN-TRUCK ?auto_216435 ?auto_216438 ) ( OBJ-AT ?auto_216434 ?auto_216433 ) ( OBJ-AT ?auto_216437 ?auto_216433 ) ( OBJ-AT ?auto_216436 ?auto_216433 ) ( not ( = ?auto_216434 ?auto_216435 ) ) ( not ( = ?auto_216434 ?auto_216437 ) ) ( not ( = ?auto_216434 ?auto_216436 ) ) ( not ( = ?auto_216435 ?auto_216437 ) ) ( not ( = ?auto_216435 ?auto_216436 ) ) ( not ( = ?auto_216437 ?auto_216436 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216435 ?auto_216433 )
      ( DELIVER-4PKG-VERIFY ?auto_216434 ?auto_216435 ?auto_216437 ?auto_216436 ?auto_216433 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216458 - OBJ
      ?auto_216459 - OBJ
      ?auto_216461 - OBJ
      ?auto_216460 - OBJ
      ?auto_216457 - LOCATION
    )
    :vars
    (
      ?auto_216462 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216462 ?auto_216457 ) ( IN-TRUCK ?auto_216458 ?auto_216462 ) ( OBJ-AT ?auto_216459 ?auto_216457 ) ( OBJ-AT ?auto_216461 ?auto_216457 ) ( OBJ-AT ?auto_216460 ?auto_216457 ) ( not ( = ?auto_216458 ?auto_216459 ) ) ( not ( = ?auto_216458 ?auto_216461 ) ) ( not ( = ?auto_216458 ?auto_216460 ) ) ( not ( = ?auto_216459 ?auto_216461 ) ) ( not ( = ?auto_216459 ?auto_216460 ) ) ( not ( = ?auto_216461 ?auto_216460 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216458 ?auto_216457 )
      ( DELIVER-4PKG-VERIFY ?auto_216458 ?auto_216459 ?auto_216461 ?auto_216460 ?auto_216457 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216506 - OBJ
      ?auto_216507 - OBJ
      ?auto_216509 - OBJ
      ?auto_216508 - OBJ
      ?auto_216510 - OBJ
      ?auto_216505 - LOCATION
    )
    :vars
    (
      ?auto_216511 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216511 ?auto_216505 ) ( IN-TRUCK ?auto_216510 ?auto_216511 ) ( OBJ-AT ?auto_216506 ?auto_216505 ) ( OBJ-AT ?auto_216507 ?auto_216505 ) ( OBJ-AT ?auto_216509 ?auto_216505 ) ( OBJ-AT ?auto_216508 ?auto_216505 ) ( not ( = ?auto_216506 ?auto_216507 ) ) ( not ( = ?auto_216506 ?auto_216509 ) ) ( not ( = ?auto_216506 ?auto_216508 ) ) ( not ( = ?auto_216506 ?auto_216510 ) ) ( not ( = ?auto_216507 ?auto_216509 ) ) ( not ( = ?auto_216507 ?auto_216508 ) ) ( not ( = ?auto_216507 ?auto_216510 ) ) ( not ( = ?auto_216509 ?auto_216508 ) ) ( not ( = ?auto_216509 ?auto_216510 ) ) ( not ( = ?auto_216508 ?auto_216510 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216510 ?auto_216505 )
      ( DELIVER-5PKG-VERIFY ?auto_216506 ?auto_216507 ?auto_216509 ?auto_216508 ?auto_216510 ?auto_216505 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216513 - OBJ
      ?auto_216514 - OBJ
      ?auto_216516 - OBJ
      ?auto_216515 - OBJ
      ?auto_216517 - OBJ
      ?auto_216512 - LOCATION
    )
    :vars
    (
      ?auto_216518 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216518 ?auto_216512 ) ( IN-TRUCK ?auto_216515 ?auto_216518 ) ( OBJ-AT ?auto_216513 ?auto_216512 ) ( OBJ-AT ?auto_216514 ?auto_216512 ) ( OBJ-AT ?auto_216516 ?auto_216512 ) ( OBJ-AT ?auto_216517 ?auto_216512 ) ( not ( = ?auto_216513 ?auto_216514 ) ) ( not ( = ?auto_216513 ?auto_216516 ) ) ( not ( = ?auto_216513 ?auto_216515 ) ) ( not ( = ?auto_216513 ?auto_216517 ) ) ( not ( = ?auto_216514 ?auto_216516 ) ) ( not ( = ?auto_216514 ?auto_216515 ) ) ( not ( = ?auto_216514 ?auto_216517 ) ) ( not ( = ?auto_216516 ?auto_216515 ) ) ( not ( = ?auto_216516 ?auto_216517 ) ) ( not ( = ?auto_216515 ?auto_216517 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216515 ?auto_216512 )
      ( DELIVER-5PKG-VERIFY ?auto_216513 ?auto_216514 ?auto_216516 ?auto_216515 ?auto_216517 ?auto_216512 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216527 - OBJ
      ?auto_216528 - OBJ
      ?auto_216530 - OBJ
      ?auto_216529 - OBJ
      ?auto_216531 - OBJ
      ?auto_216526 - LOCATION
    )
    :vars
    (
      ?auto_216532 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216532 ?auto_216526 ) ( IN-TRUCK ?auto_216530 ?auto_216532 ) ( OBJ-AT ?auto_216527 ?auto_216526 ) ( OBJ-AT ?auto_216528 ?auto_216526 ) ( OBJ-AT ?auto_216529 ?auto_216526 ) ( OBJ-AT ?auto_216531 ?auto_216526 ) ( not ( = ?auto_216527 ?auto_216528 ) ) ( not ( = ?auto_216527 ?auto_216530 ) ) ( not ( = ?auto_216527 ?auto_216529 ) ) ( not ( = ?auto_216527 ?auto_216531 ) ) ( not ( = ?auto_216528 ?auto_216530 ) ) ( not ( = ?auto_216528 ?auto_216529 ) ) ( not ( = ?auto_216528 ?auto_216531 ) ) ( not ( = ?auto_216530 ?auto_216529 ) ) ( not ( = ?auto_216530 ?auto_216531 ) ) ( not ( = ?auto_216529 ?auto_216531 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216530 ?auto_216526 )
      ( DELIVER-5PKG-VERIFY ?auto_216527 ?auto_216528 ?auto_216530 ?auto_216529 ?auto_216531 ?auto_216526 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216555 - OBJ
      ?auto_216556 - OBJ
      ?auto_216558 - OBJ
      ?auto_216557 - OBJ
      ?auto_216559 - OBJ
      ?auto_216554 - LOCATION
    )
    :vars
    (
      ?auto_216560 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216560 ?auto_216554 ) ( IN-TRUCK ?auto_216556 ?auto_216560 ) ( OBJ-AT ?auto_216555 ?auto_216554 ) ( OBJ-AT ?auto_216558 ?auto_216554 ) ( OBJ-AT ?auto_216557 ?auto_216554 ) ( OBJ-AT ?auto_216559 ?auto_216554 ) ( not ( = ?auto_216555 ?auto_216556 ) ) ( not ( = ?auto_216555 ?auto_216558 ) ) ( not ( = ?auto_216555 ?auto_216557 ) ) ( not ( = ?auto_216555 ?auto_216559 ) ) ( not ( = ?auto_216556 ?auto_216558 ) ) ( not ( = ?auto_216556 ?auto_216557 ) ) ( not ( = ?auto_216556 ?auto_216559 ) ) ( not ( = ?auto_216558 ?auto_216557 ) ) ( not ( = ?auto_216558 ?auto_216559 ) ) ( not ( = ?auto_216557 ?auto_216559 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216556 ?auto_216554 )
      ( DELIVER-5PKG-VERIFY ?auto_216555 ?auto_216556 ?auto_216558 ?auto_216557 ?auto_216559 ?auto_216554 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216611 - OBJ
      ?auto_216612 - OBJ
      ?auto_216614 - OBJ
      ?auto_216613 - OBJ
      ?auto_216615 - OBJ
      ?auto_216610 - LOCATION
    )
    :vars
    (
      ?auto_216616 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216616 ?auto_216610 ) ( IN-TRUCK ?auto_216611 ?auto_216616 ) ( OBJ-AT ?auto_216612 ?auto_216610 ) ( OBJ-AT ?auto_216614 ?auto_216610 ) ( OBJ-AT ?auto_216613 ?auto_216610 ) ( OBJ-AT ?auto_216615 ?auto_216610 ) ( not ( = ?auto_216611 ?auto_216612 ) ) ( not ( = ?auto_216611 ?auto_216614 ) ) ( not ( = ?auto_216611 ?auto_216613 ) ) ( not ( = ?auto_216611 ?auto_216615 ) ) ( not ( = ?auto_216612 ?auto_216614 ) ) ( not ( = ?auto_216612 ?auto_216613 ) ) ( not ( = ?auto_216612 ?auto_216615 ) ) ( not ( = ?auto_216614 ?auto_216613 ) ) ( not ( = ?auto_216614 ?auto_216615 ) ) ( not ( = ?auto_216613 ?auto_216615 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216611 ?auto_216610 )
      ( DELIVER-5PKG-VERIFY ?auto_216611 ?auto_216612 ?auto_216614 ?auto_216613 ?auto_216615 ?auto_216610 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216728 - OBJ
      ?auto_216729 - OBJ
      ?auto_216727 - LOCATION
    )
    :vars
    (
      ?auto_216732 - TRUCK
      ?auto_216730 - LOCATION
      ?auto_216731 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216729 ?auto_216732 ) ( TRUCK-AT ?auto_216732 ?auto_216730 ) ( IN-CITY ?auto_216730 ?auto_216731 ) ( IN-CITY ?auto_216727 ?auto_216731 ) ( not ( = ?auto_216727 ?auto_216730 ) ) ( OBJ-AT ?auto_216728 ?auto_216727 ) ( not ( = ?auto_216728 ?auto_216729 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216729 ?auto_216727 )
      ( DELIVER-2PKG-VERIFY ?auto_216728 ?auto_216729 ?auto_216727 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216734 - OBJ
      ?auto_216735 - OBJ
      ?auto_216733 - LOCATION
    )
    :vars
    (
      ?auto_216737 - TRUCK
      ?auto_216738 - LOCATION
      ?auto_216736 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216734 ?auto_216737 ) ( TRUCK-AT ?auto_216737 ?auto_216738 ) ( IN-CITY ?auto_216738 ?auto_216736 ) ( IN-CITY ?auto_216733 ?auto_216736 ) ( not ( = ?auto_216733 ?auto_216738 ) ) ( OBJ-AT ?auto_216735 ?auto_216733 ) ( not ( = ?auto_216735 ?auto_216734 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216735 ?auto_216734 ?auto_216733 )
      ( DELIVER-2PKG-VERIFY ?auto_216734 ?auto_216735 ?auto_216733 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216747 - OBJ
      ?auto_216748 - OBJ
      ?auto_216749 - OBJ
      ?auto_216746 - LOCATION
    )
    :vars
    (
      ?auto_216751 - TRUCK
      ?auto_216752 - LOCATION
      ?auto_216750 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216749 ?auto_216751 ) ( TRUCK-AT ?auto_216751 ?auto_216752 ) ( IN-CITY ?auto_216752 ?auto_216750 ) ( IN-CITY ?auto_216746 ?auto_216750 ) ( not ( = ?auto_216746 ?auto_216752 ) ) ( OBJ-AT ?auto_216747 ?auto_216746 ) ( not ( = ?auto_216747 ?auto_216749 ) ) ( OBJ-AT ?auto_216748 ?auto_216746 ) ( not ( = ?auto_216747 ?auto_216748 ) ) ( not ( = ?auto_216748 ?auto_216749 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216747 ?auto_216749 ?auto_216746 )
      ( DELIVER-3PKG-VERIFY ?auto_216747 ?auto_216748 ?auto_216749 ?auto_216746 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216754 - OBJ
      ?auto_216755 - OBJ
      ?auto_216756 - OBJ
      ?auto_216753 - LOCATION
    )
    :vars
    (
      ?auto_216758 - TRUCK
      ?auto_216759 - LOCATION
      ?auto_216757 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216755 ?auto_216758 ) ( TRUCK-AT ?auto_216758 ?auto_216759 ) ( IN-CITY ?auto_216759 ?auto_216757 ) ( IN-CITY ?auto_216753 ?auto_216757 ) ( not ( = ?auto_216753 ?auto_216759 ) ) ( OBJ-AT ?auto_216756 ?auto_216753 ) ( not ( = ?auto_216756 ?auto_216755 ) ) ( OBJ-AT ?auto_216754 ?auto_216753 ) ( not ( = ?auto_216754 ?auto_216755 ) ) ( not ( = ?auto_216754 ?auto_216756 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216756 ?auto_216755 ?auto_216753 )
      ( DELIVER-3PKG-VERIFY ?auto_216754 ?auto_216755 ?auto_216756 ?auto_216753 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216768 - OBJ
      ?auto_216769 - OBJ
      ?auto_216770 - OBJ
      ?auto_216767 - LOCATION
    )
    :vars
    (
      ?auto_216772 - TRUCK
      ?auto_216773 - LOCATION
      ?auto_216771 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216768 ?auto_216772 ) ( TRUCK-AT ?auto_216772 ?auto_216773 ) ( IN-CITY ?auto_216773 ?auto_216771 ) ( IN-CITY ?auto_216767 ?auto_216771 ) ( not ( = ?auto_216767 ?auto_216773 ) ) ( OBJ-AT ?auto_216769 ?auto_216767 ) ( not ( = ?auto_216769 ?auto_216768 ) ) ( OBJ-AT ?auto_216770 ?auto_216767 ) ( not ( = ?auto_216768 ?auto_216770 ) ) ( not ( = ?auto_216769 ?auto_216770 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216769 ?auto_216768 ?auto_216767 )
      ( DELIVER-3PKG-VERIFY ?auto_216768 ?auto_216769 ?auto_216770 ?auto_216767 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216797 - OBJ
      ?auto_216798 - OBJ
      ?auto_216800 - OBJ
      ?auto_216799 - OBJ
      ?auto_216796 - LOCATION
    )
    :vars
    (
      ?auto_216802 - TRUCK
      ?auto_216803 - LOCATION
      ?auto_216801 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216799 ?auto_216802 ) ( TRUCK-AT ?auto_216802 ?auto_216803 ) ( IN-CITY ?auto_216803 ?auto_216801 ) ( IN-CITY ?auto_216796 ?auto_216801 ) ( not ( = ?auto_216796 ?auto_216803 ) ) ( OBJ-AT ?auto_216797 ?auto_216796 ) ( not ( = ?auto_216797 ?auto_216799 ) ) ( OBJ-AT ?auto_216798 ?auto_216796 ) ( OBJ-AT ?auto_216800 ?auto_216796 ) ( not ( = ?auto_216797 ?auto_216798 ) ) ( not ( = ?auto_216797 ?auto_216800 ) ) ( not ( = ?auto_216798 ?auto_216800 ) ) ( not ( = ?auto_216798 ?auto_216799 ) ) ( not ( = ?auto_216800 ?auto_216799 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216797 ?auto_216799 ?auto_216796 )
      ( DELIVER-4PKG-VERIFY ?auto_216797 ?auto_216798 ?auto_216800 ?auto_216799 ?auto_216796 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216805 - OBJ
      ?auto_216806 - OBJ
      ?auto_216808 - OBJ
      ?auto_216807 - OBJ
      ?auto_216804 - LOCATION
    )
    :vars
    (
      ?auto_216810 - TRUCK
      ?auto_216811 - LOCATION
      ?auto_216809 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216808 ?auto_216810 ) ( TRUCK-AT ?auto_216810 ?auto_216811 ) ( IN-CITY ?auto_216811 ?auto_216809 ) ( IN-CITY ?auto_216804 ?auto_216809 ) ( not ( = ?auto_216804 ?auto_216811 ) ) ( OBJ-AT ?auto_216806 ?auto_216804 ) ( not ( = ?auto_216806 ?auto_216808 ) ) ( OBJ-AT ?auto_216805 ?auto_216804 ) ( OBJ-AT ?auto_216807 ?auto_216804 ) ( not ( = ?auto_216805 ?auto_216806 ) ) ( not ( = ?auto_216805 ?auto_216808 ) ) ( not ( = ?auto_216805 ?auto_216807 ) ) ( not ( = ?auto_216806 ?auto_216807 ) ) ( not ( = ?auto_216808 ?auto_216807 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216806 ?auto_216808 ?auto_216804 )
      ( DELIVER-4PKG-VERIFY ?auto_216805 ?auto_216806 ?auto_216808 ?auto_216807 ?auto_216804 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216821 - OBJ
      ?auto_216822 - OBJ
      ?auto_216824 - OBJ
      ?auto_216823 - OBJ
      ?auto_216820 - LOCATION
    )
    :vars
    (
      ?auto_216826 - TRUCK
      ?auto_216827 - LOCATION
      ?auto_216825 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216822 ?auto_216826 ) ( TRUCK-AT ?auto_216826 ?auto_216827 ) ( IN-CITY ?auto_216827 ?auto_216825 ) ( IN-CITY ?auto_216820 ?auto_216825 ) ( not ( = ?auto_216820 ?auto_216827 ) ) ( OBJ-AT ?auto_216821 ?auto_216820 ) ( not ( = ?auto_216821 ?auto_216822 ) ) ( OBJ-AT ?auto_216824 ?auto_216820 ) ( OBJ-AT ?auto_216823 ?auto_216820 ) ( not ( = ?auto_216821 ?auto_216824 ) ) ( not ( = ?auto_216821 ?auto_216823 ) ) ( not ( = ?auto_216822 ?auto_216824 ) ) ( not ( = ?auto_216822 ?auto_216823 ) ) ( not ( = ?auto_216824 ?auto_216823 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216821 ?auto_216822 ?auto_216820 )
      ( DELIVER-4PKG-VERIFY ?auto_216821 ?auto_216822 ?auto_216824 ?auto_216823 ?auto_216820 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216853 - OBJ
      ?auto_216854 - OBJ
      ?auto_216856 - OBJ
      ?auto_216855 - OBJ
      ?auto_216852 - LOCATION
    )
    :vars
    (
      ?auto_216858 - TRUCK
      ?auto_216859 - LOCATION
      ?auto_216857 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216853 ?auto_216858 ) ( TRUCK-AT ?auto_216858 ?auto_216859 ) ( IN-CITY ?auto_216859 ?auto_216857 ) ( IN-CITY ?auto_216852 ?auto_216857 ) ( not ( = ?auto_216852 ?auto_216859 ) ) ( OBJ-AT ?auto_216855 ?auto_216852 ) ( not ( = ?auto_216855 ?auto_216853 ) ) ( OBJ-AT ?auto_216854 ?auto_216852 ) ( OBJ-AT ?auto_216856 ?auto_216852 ) ( not ( = ?auto_216853 ?auto_216854 ) ) ( not ( = ?auto_216853 ?auto_216856 ) ) ( not ( = ?auto_216854 ?auto_216856 ) ) ( not ( = ?auto_216854 ?auto_216855 ) ) ( not ( = ?auto_216856 ?auto_216855 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216855 ?auto_216853 ?auto_216852 )
      ( DELIVER-4PKG-VERIFY ?auto_216853 ?auto_216854 ?auto_216856 ?auto_216855 ?auto_216852 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216918 - OBJ
      ?auto_216919 - OBJ
      ?auto_216921 - OBJ
      ?auto_216920 - OBJ
      ?auto_216922 - OBJ
      ?auto_216917 - LOCATION
    )
    :vars
    (
      ?auto_216924 - TRUCK
      ?auto_216925 - LOCATION
      ?auto_216923 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216922 ?auto_216924 ) ( TRUCK-AT ?auto_216924 ?auto_216925 ) ( IN-CITY ?auto_216925 ?auto_216923 ) ( IN-CITY ?auto_216917 ?auto_216923 ) ( not ( = ?auto_216917 ?auto_216925 ) ) ( OBJ-AT ?auto_216919 ?auto_216917 ) ( not ( = ?auto_216919 ?auto_216922 ) ) ( OBJ-AT ?auto_216918 ?auto_216917 ) ( OBJ-AT ?auto_216921 ?auto_216917 ) ( OBJ-AT ?auto_216920 ?auto_216917 ) ( not ( = ?auto_216918 ?auto_216919 ) ) ( not ( = ?auto_216918 ?auto_216921 ) ) ( not ( = ?auto_216918 ?auto_216920 ) ) ( not ( = ?auto_216918 ?auto_216922 ) ) ( not ( = ?auto_216919 ?auto_216921 ) ) ( not ( = ?auto_216919 ?auto_216920 ) ) ( not ( = ?auto_216921 ?auto_216920 ) ) ( not ( = ?auto_216921 ?auto_216922 ) ) ( not ( = ?auto_216920 ?auto_216922 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216919 ?auto_216922 ?auto_216917 )
      ( DELIVER-5PKG-VERIFY ?auto_216918 ?auto_216919 ?auto_216921 ?auto_216920 ?auto_216922 ?auto_216917 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216927 - OBJ
      ?auto_216928 - OBJ
      ?auto_216930 - OBJ
      ?auto_216929 - OBJ
      ?auto_216931 - OBJ
      ?auto_216926 - LOCATION
    )
    :vars
    (
      ?auto_216933 - TRUCK
      ?auto_216934 - LOCATION
      ?auto_216932 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216929 ?auto_216933 ) ( TRUCK-AT ?auto_216933 ?auto_216934 ) ( IN-CITY ?auto_216934 ?auto_216932 ) ( IN-CITY ?auto_216926 ?auto_216932 ) ( not ( = ?auto_216926 ?auto_216934 ) ) ( OBJ-AT ?auto_216930 ?auto_216926 ) ( not ( = ?auto_216930 ?auto_216929 ) ) ( OBJ-AT ?auto_216927 ?auto_216926 ) ( OBJ-AT ?auto_216928 ?auto_216926 ) ( OBJ-AT ?auto_216931 ?auto_216926 ) ( not ( = ?auto_216927 ?auto_216928 ) ) ( not ( = ?auto_216927 ?auto_216930 ) ) ( not ( = ?auto_216927 ?auto_216929 ) ) ( not ( = ?auto_216927 ?auto_216931 ) ) ( not ( = ?auto_216928 ?auto_216930 ) ) ( not ( = ?auto_216928 ?auto_216929 ) ) ( not ( = ?auto_216928 ?auto_216931 ) ) ( not ( = ?auto_216930 ?auto_216931 ) ) ( not ( = ?auto_216929 ?auto_216931 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216930 ?auto_216929 ?auto_216926 )
      ( DELIVER-5PKG-VERIFY ?auto_216927 ?auto_216928 ?auto_216930 ?auto_216929 ?auto_216931 ?auto_216926 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216945 - OBJ
      ?auto_216946 - OBJ
      ?auto_216948 - OBJ
      ?auto_216947 - OBJ
      ?auto_216949 - OBJ
      ?auto_216944 - LOCATION
    )
    :vars
    (
      ?auto_216951 - TRUCK
      ?auto_216952 - LOCATION
      ?auto_216950 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216948 ?auto_216951 ) ( TRUCK-AT ?auto_216951 ?auto_216952 ) ( IN-CITY ?auto_216952 ?auto_216950 ) ( IN-CITY ?auto_216944 ?auto_216950 ) ( not ( = ?auto_216944 ?auto_216952 ) ) ( OBJ-AT ?auto_216945 ?auto_216944 ) ( not ( = ?auto_216945 ?auto_216948 ) ) ( OBJ-AT ?auto_216946 ?auto_216944 ) ( OBJ-AT ?auto_216947 ?auto_216944 ) ( OBJ-AT ?auto_216949 ?auto_216944 ) ( not ( = ?auto_216945 ?auto_216946 ) ) ( not ( = ?auto_216945 ?auto_216947 ) ) ( not ( = ?auto_216945 ?auto_216949 ) ) ( not ( = ?auto_216946 ?auto_216948 ) ) ( not ( = ?auto_216946 ?auto_216947 ) ) ( not ( = ?auto_216946 ?auto_216949 ) ) ( not ( = ?auto_216948 ?auto_216947 ) ) ( not ( = ?auto_216948 ?auto_216949 ) ) ( not ( = ?auto_216947 ?auto_216949 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216945 ?auto_216948 ?auto_216944 )
      ( DELIVER-5PKG-VERIFY ?auto_216945 ?auto_216946 ?auto_216948 ?auto_216947 ?auto_216949 ?auto_216944 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216981 - OBJ
      ?auto_216982 - OBJ
      ?auto_216984 - OBJ
      ?auto_216983 - OBJ
      ?auto_216985 - OBJ
      ?auto_216980 - LOCATION
    )
    :vars
    (
      ?auto_216987 - TRUCK
      ?auto_216988 - LOCATION
      ?auto_216986 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216982 ?auto_216987 ) ( TRUCK-AT ?auto_216987 ?auto_216988 ) ( IN-CITY ?auto_216988 ?auto_216986 ) ( IN-CITY ?auto_216980 ?auto_216986 ) ( not ( = ?auto_216980 ?auto_216988 ) ) ( OBJ-AT ?auto_216985 ?auto_216980 ) ( not ( = ?auto_216985 ?auto_216982 ) ) ( OBJ-AT ?auto_216981 ?auto_216980 ) ( OBJ-AT ?auto_216984 ?auto_216980 ) ( OBJ-AT ?auto_216983 ?auto_216980 ) ( not ( = ?auto_216981 ?auto_216982 ) ) ( not ( = ?auto_216981 ?auto_216984 ) ) ( not ( = ?auto_216981 ?auto_216983 ) ) ( not ( = ?auto_216981 ?auto_216985 ) ) ( not ( = ?auto_216982 ?auto_216984 ) ) ( not ( = ?auto_216982 ?auto_216983 ) ) ( not ( = ?auto_216984 ?auto_216983 ) ) ( not ( = ?auto_216984 ?auto_216985 ) ) ( not ( = ?auto_216983 ?auto_216985 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216985 ?auto_216982 ?auto_216980 )
      ( DELIVER-5PKG-VERIFY ?auto_216981 ?auto_216982 ?auto_216984 ?auto_216983 ?auto_216985 ?auto_216980 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217053 - OBJ
      ?auto_217054 - OBJ
      ?auto_217056 - OBJ
      ?auto_217055 - OBJ
      ?auto_217057 - OBJ
      ?auto_217052 - LOCATION
    )
    :vars
    (
      ?auto_217059 - TRUCK
      ?auto_217060 - LOCATION
      ?auto_217058 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_217053 ?auto_217059 ) ( TRUCK-AT ?auto_217059 ?auto_217060 ) ( IN-CITY ?auto_217060 ?auto_217058 ) ( IN-CITY ?auto_217052 ?auto_217058 ) ( not ( = ?auto_217052 ?auto_217060 ) ) ( OBJ-AT ?auto_217054 ?auto_217052 ) ( not ( = ?auto_217054 ?auto_217053 ) ) ( OBJ-AT ?auto_217056 ?auto_217052 ) ( OBJ-AT ?auto_217055 ?auto_217052 ) ( OBJ-AT ?auto_217057 ?auto_217052 ) ( not ( = ?auto_217053 ?auto_217056 ) ) ( not ( = ?auto_217053 ?auto_217055 ) ) ( not ( = ?auto_217053 ?auto_217057 ) ) ( not ( = ?auto_217054 ?auto_217056 ) ) ( not ( = ?auto_217054 ?auto_217055 ) ) ( not ( = ?auto_217054 ?auto_217057 ) ) ( not ( = ?auto_217056 ?auto_217055 ) ) ( not ( = ?auto_217056 ?auto_217057 ) ) ( not ( = ?auto_217055 ?auto_217057 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217054 ?auto_217053 ?auto_217052 )
      ( DELIVER-5PKG-VERIFY ?auto_217053 ?auto_217054 ?auto_217056 ?auto_217055 ?auto_217057 ?auto_217052 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_217198 - OBJ
      ?auto_217197 - LOCATION
    )
    :vars
    (
      ?auto_217200 - TRUCK
      ?auto_217201 - LOCATION
      ?auto_217199 - CITY
      ?auto_217202 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217200 ?auto_217201 ) ( IN-CITY ?auto_217201 ?auto_217199 ) ( IN-CITY ?auto_217197 ?auto_217199 ) ( not ( = ?auto_217197 ?auto_217201 ) ) ( OBJ-AT ?auto_217202 ?auto_217197 ) ( not ( = ?auto_217202 ?auto_217198 ) ) ( OBJ-AT ?auto_217198 ?auto_217201 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_217198 ?auto_217200 ?auto_217201 )
      ( DELIVER-2PKG ?auto_217202 ?auto_217198 ?auto_217197 )
      ( DELIVER-1PKG-VERIFY ?auto_217198 ?auto_217197 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217204 - OBJ
      ?auto_217205 - OBJ
      ?auto_217203 - LOCATION
    )
    :vars
    (
      ?auto_217206 - TRUCK
      ?auto_217207 - LOCATION
      ?auto_217208 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217206 ?auto_217207 ) ( IN-CITY ?auto_217207 ?auto_217208 ) ( IN-CITY ?auto_217203 ?auto_217208 ) ( not ( = ?auto_217203 ?auto_217207 ) ) ( OBJ-AT ?auto_217204 ?auto_217203 ) ( not ( = ?auto_217204 ?auto_217205 ) ) ( OBJ-AT ?auto_217205 ?auto_217207 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_217205 ?auto_217203 )
      ( DELIVER-2PKG-VERIFY ?auto_217204 ?auto_217205 ?auto_217203 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217210 - OBJ
      ?auto_217211 - OBJ
      ?auto_217209 - LOCATION
    )
    :vars
    (
      ?auto_217214 - TRUCK
      ?auto_217212 - LOCATION
      ?auto_217213 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217214 ?auto_217212 ) ( IN-CITY ?auto_217212 ?auto_217213 ) ( IN-CITY ?auto_217209 ?auto_217213 ) ( not ( = ?auto_217209 ?auto_217212 ) ) ( OBJ-AT ?auto_217211 ?auto_217209 ) ( not ( = ?auto_217211 ?auto_217210 ) ) ( OBJ-AT ?auto_217210 ?auto_217212 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217211 ?auto_217210 ?auto_217209 )
      ( DELIVER-2PKG-VERIFY ?auto_217210 ?auto_217211 ?auto_217209 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_217223 - OBJ
      ?auto_217224 - OBJ
      ?auto_217225 - OBJ
      ?auto_217222 - LOCATION
    )
    :vars
    (
      ?auto_217228 - TRUCK
      ?auto_217226 - LOCATION
      ?auto_217227 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217228 ?auto_217226 ) ( IN-CITY ?auto_217226 ?auto_217227 ) ( IN-CITY ?auto_217222 ?auto_217227 ) ( not ( = ?auto_217222 ?auto_217226 ) ) ( OBJ-AT ?auto_217224 ?auto_217222 ) ( not ( = ?auto_217224 ?auto_217225 ) ) ( OBJ-AT ?auto_217225 ?auto_217226 ) ( OBJ-AT ?auto_217223 ?auto_217222 ) ( not ( = ?auto_217223 ?auto_217224 ) ) ( not ( = ?auto_217223 ?auto_217225 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217224 ?auto_217225 ?auto_217222 )
      ( DELIVER-3PKG-VERIFY ?auto_217223 ?auto_217224 ?auto_217225 ?auto_217222 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_217230 - OBJ
      ?auto_217231 - OBJ
      ?auto_217232 - OBJ
      ?auto_217229 - LOCATION
    )
    :vars
    (
      ?auto_217235 - TRUCK
      ?auto_217233 - LOCATION
      ?auto_217234 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217235 ?auto_217233 ) ( IN-CITY ?auto_217233 ?auto_217234 ) ( IN-CITY ?auto_217229 ?auto_217234 ) ( not ( = ?auto_217229 ?auto_217233 ) ) ( OBJ-AT ?auto_217232 ?auto_217229 ) ( not ( = ?auto_217232 ?auto_217231 ) ) ( OBJ-AT ?auto_217231 ?auto_217233 ) ( OBJ-AT ?auto_217230 ?auto_217229 ) ( not ( = ?auto_217230 ?auto_217231 ) ) ( not ( = ?auto_217230 ?auto_217232 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217232 ?auto_217231 ?auto_217229 )
      ( DELIVER-3PKG-VERIFY ?auto_217230 ?auto_217231 ?auto_217232 ?auto_217229 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_217244 - OBJ
      ?auto_217245 - OBJ
      ?auto_217246 - OBJ
      ?auto_217243 - LOCATION
    )
    :vars
    (
      ?auto_217249 - TRUCK
      ?auto_217247 - LOCATION
      ?auto_217248 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217249 ?auto_217247 ) ( IN-CITY ?auto_217247 ?auto_217248 ) ( IN-CITY ?auto_217243 ?auto_217248 ) ( not ( = ?auto_217243 ?auto_217247 ) ) ( OBJ-AT ?auto_217245 ?auto_217243 ) ( not ( = ?auto_217245 ?auto_217244 ) ) ( OBJ-AT ?auto_217244 ?auto_217247 ) ( OBJ-AT ?auto_217246 ?auto_217243 ) ( not ( = ?auto_217244 ?auto_217246 ) ) ( not ( = ?auto_217245 ?auto_217246 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217245 ?auto_217244 ?auto_217243 )
      ( DELIVER-3PKG-VERIFY ?auto_217244 ?auto_217245 ?auto_217246 ?auto_217243 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217273 - OBJ
      ?auto_217274 - OBJ
      ?auto_217276 - OBJ
      ?auto_217275 - OBJ
      ?auto_217272 - LOCATION
    )
    :vars
    (
      ?auto_217279 - TRUCK
      ?auto_217277 - LOCATION
      ?auto_217278 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217279 ?auto_217277 ) ( IN-CITY ?auto_217277 ?auto_217278 ) ( IN-CITY ?auto_217272 ?auto_217278 ) ( not ( = ?auto_217272 ?auto_217277 ) ) ( OBJ-AT ?auto_217274 ?auto_217272 ) ( not ( = ?auto_217274 ?auto_217275 ) ) ( OBJ-AT ?auto_217275 ?auto_217277 ) ( OBJ-AT ?auto_217273 ?auto_217272 ) ( OBJ-AT ?auto_217276 ?auto_217272 ) ( not ( = ?auto_217273 ?auto_217274 ) ) ( not ( = ?auto_217273 ?auto_217276 ) ) ( not ( = ?auto_217273 ?auto_217275 ) ) ( not ( = ?auto_217274 ?auto_217276 ) ) ( not ( = ?auto_217276 ?auto_217275 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217274 ?auto_217275 ?auto_217272 )
      ( DELIVER-4PKG-VERIFY ?auto_217273 ?auto_217274 ?auto_217276 ?auto_217275 ?auto_217272 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217281 - OBJ
      ?auto_217282 - OBJ
      ?auto_217284 - OBJ
      ?auto_217283 - OBJ
      ?auto_217280 - LOCATION
    )
    :vars
    (
      ?auto_217287 - TRUCK
      ?auto_217285 - LOCATION
      ?auto_217286 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217287 ?auto_217285 ) ( IN-CITY ?auto_217285 ?auto_217286 ) ( IN-CITY ?auto_217280 ?auto_217286 ) ( not ( = ?auto_217280 ?auto_217285 ) ) ( OBJ-AT ?auto_217281 ?auto_217280 ) ( not ( = ?auto_217281 ?auto_217284 ) ) ( OBJ-AT ?auto_217284 ?auto_217285 ) ( OBJ-AT ?auto_217282 ?auto_217280 ) ( OBJ-AT ?auto_217283 ?auto_217280 ) ( not ( = ?auto_217281 ?auto_217282 ) ) ( not ( = ?auto_217281 ?auto_217283 ) ) ( not ( = ?auto_217282 ?auto_217284 ) ) ( not ( = ?auto_217282 ?auto_217283 ) ) ( not ( = ?auto_217284 ?auto_217283 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217281 ?auto_217284 ?auto_217280 )
      ( DELIVER-4PKG-VERIFY ?auto_217281 ?auto_217282 ?auto_217284 ?auto_217283 ?auto_217280 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217297 - OBJ
      ?auto_217298 - OBJ
      ?auto_217300 - OBJ
      ?auto_217299 - OBJ
      ?auto_217296 - LOCATION
    )
    :vars
    (
      ?auto_217303 - TRUCK
      ?auto_217301 - LOCATION
      ?auto_217302 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217303 ?auto_217301 ) ( IN-CITY ?auto_217301 ?auto_217302 ) ( IN-CITY ?auto_217296 ?auto_217302 ) ( not ( = ?auto_217296 ?auto_217301 ) ) ( OBJ-AT ?auto_217299 ?auto_217296 ) ( not ( = ?auto_217299 ?auto_217298 ) ) ( OBJ-AT ?auto_217298 ?auto_217301 ) ( OBJ-AT ?auto_217297 ?auto_217296 ) ( OBJ-AT ?auto_217300 ?auto_217296 ) ( not ( = ?auto_217297 ?auto_217298 ) ) ( not ( = ?auto_217297 ?auto_217300 ) ) ( not ( = ?auto_217297 ?auto_217299 ) ) ( not ( = ?auto_217298 ?auto_217300 ) ) ( not ( = ?auto_217300 ?auto_217299 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217299 ?auto_217298 ?auto_217296 )
      ( DELIVER-4PKG-VERIFY ?auto_217297 ?auto_217298 ?auto_217300 ?auto_217299 ?auto_217296 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217329 - OBJ
      ?auto_217330 - OBJ
      ?auto_217332 - OBJ
      ?auto_217331 - OBJ
      ?auto_217328 - LOCATION
    )
    :vars
    (
      ?auto_217335 - TRUCK
      ?auto_217333 - LOCATION
      ?auto_217334 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217335 ?auto_217333 ) ( IN-CITY ?auto_217333 ?auto_217334 ) ( IN-CITY ?auto_217328 ?auto_217334 ) ( not ( = ?auto_217328 ?auto_217333 ) ) ( OBJ-AT ?auto_217331 ?auto_217328 ) ( not ( = ?auto_217331 ?auto_217329 ) ) ( OBJ-AT ?auto_217329 ?auto_217333 ) ( OBJ-AT ?auto_217330 ?auto_217328 ) ( OBJ-AT ?auto_217332 ?auto_217328 ) ( not ( = ?auto_217329 ?auto_217330 ) ) ( not ( = ?auto_217329 ?auto_217332 ) ) ( not ( = ?auto_217330 ?auto_217332 ) ) ( not ( = ?auto_217330 ?auto_217331 ) ) ( not ( = ?auto_217332 ?auto_217331 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217331 ?auto_217329 ?auto_217328 )
      ( DELIVER-4PKG-VERIFY ?auto_217329 ?auto_217330 ?auto_217332 ?auto_217331 ?auto_217328 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217394 - OBJ
      ?auto_217395 - OBJ
      ?auto_217397 - OBJ
      ?auto_217396 - OBJ
      ?auto_217398 - OBJ
      ?auto_217393 - LOCATION
    )
    :vars
    (
      ?auto_217401 - TRUCK
      ?auto_217399 - LOCATION
      ?auto_217400 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217401 ?auto_217399 ) ( IN-CITY ?auto_217399 ?auto_217400 ) ( IN-CITY ?auto_217393 ?auto_217400 ) ( not ( = ?auto_217393 ?auto_217399 ) ) ( OBJ-AT ?auto_217395 ?auto_217393 ) ( not ( = ?auto_217395 ?auto_217398 ) ) ( OBJ-AT ?auto_217398 ?auto_217399 ) ( OBJ-AT ?auto_217394 ?auto_217393 ) ( OBJ-AT ?auto_217397 ?auto_217393 ) ( OBJ-AT ?auto_217396 ?auto_217393 ) ( not ( = ?auto_217394 ?auto_217395 ) ) ( not ( = ?auto_217394 ?auto_217397 ) ) ( not ( = ?auto_217394 ?auto_217396 ) ) ( not ( = ?auto_217394 ?auto_217398 ) ) ( not ( = ?auto_217395 ?auto_217397 ) ) ( not ( = ?auto_217395 ?auto_217396 ) ) ( not ( = ?auto_217397 ?auto_217396 ) ) ( not ( = ?auto_217397 ?auto_217398 ) ) ( not ( = ?auto_217396 ?auto_217398 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217395 ?auto_217398 ?auto_217393 )
      ( DELIVER-5PKG-VERIFY ?auto_217394 ?auto_217395 ?auto_217397 ?auto_217396 ?auto_217398 ?auto_217393 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217403 - OBJ
      ?auto_217404 - OBJ
      ?auto_217406 - OBJ
      ?auto_217405 - OBJ
      ?auto_217407 - OBJ
      ?auto_217402 - LOCATION
    )
    :vars
    (
      ?auto_217410 - TRUCK
      ?auto_217408 - LOCATION
      ?auto_217409 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217410 ?auto_217408 ) ( IN-CITY ?auto_217408 ?auto_217409 ) ( IN-CITY ?auto_217402 ?auto_217409 ) ( not ( = ?auto_217402 ?auto_217408 ) ) ( OBJ-AT ?auto_217407 ?auto_217402 ) ( not ( = ?auto_217407 ?auto_217405 ) ) ( OBJ-AT ?auto_217405 ?auto_217408 ) ( OBJ-AT ?auto_217403 ?auto_217402 ) ( OBJ-AT ?auto_217404 ?auto_217402 ) ( OBJ-AT ?auto_217406 ?auto_217402 ) ( not ( = ?auto_217403 ?auto_217404 ) ) ( not ( = ?auto_217403 ?auto_217406 ) ) ( not ( = ?auto_217403 ?auto_217405 ) ) ( not ( = ?auto_217403 ?auto_217407 ) ) ( not ( = ?auto_217404 ?auto_217406 ) ) ( not ( = ?auto_217404 ?auto_217405 ) ) ( not ( = ?auto_217404 ?auto_217407 ) ) ( not ( = ?auto_217406 ?auto_217405 ) ) ( not ( = ?auto_217406 ?auto_217407 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217407 ?auto_217405 ?auto_217402 )
      ( DELIVER-5PKG-VERIFY ?auto_217403 ?auto_217404 ?auto_217406 ?auto_217405 ?auto_217407 ?auto_217402 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217421 - OBJ
      ?auto_217422 - OBJ
      ?auto_217424 - OBJ
      ?auto_217423 - OBJ
      ?auto_217425 - OBJ
      ?auto_217420 - LOCATION
    )
    :vars
    (
      ?auto_217428 - TRUCK
      ?auto_217426 - LOCATION
      ?auto_217427 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217428 ?auto_217426 ) ( IN-CITY ?auto_217426 ?auto_217427 ) ( IN-CITY ?auto_217420 ?auto_217427 ) ( not ( = ?auto_217420 ?auto_217426 ) ) ( OBJ-AT ?auto_217423 ?auto_217420 ) ( not ( = ?auto_217423 ?auto_217424 ) ) ( OBJ-AT ?auto_217424 ?auto_217426 ) ( OBJ-AT ?auto_217421 ?auto_217420 ) ( OBJ-AT ?auto_217422 ?auto_217420 ) ( OBJ-AT ?auto_217425 ?auto_217420 ) ( not ( = ?auto_217421 ?auto_217422 ) ) ( not ( = ?auto_217421 ?auto_217424 ) ) ( not ( = ?auto_217421 ?auto_217423 ) ) ( not ( = ?auto_217421 ?auto_217425 ) ) ( not ( = ?auto_217422 ?auto_217424 ) ) ( not ( = ?auto_217422 ?auto_217423 ) ) ( not ( = ?auto_217422 ?auto_217425 ) ) ( not ( = ?auto_217424 ?auto_217425 ) ) ( not ( = ?auto_217423 ?auto_217425 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217423 ?auto_217424 ?auto_217420 )
      ( DELIVER-5PKG-VERIFY ?auto_217421 ?auto_217422 ?auto_217424 ?auto_217423 ?auto_217425 ?auto_217420 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217457 - OBJ
      ?auto_217458 - OBJ
      ?auto_217460 - OBJ
      ?auto_217459 - OBJ
      ?auto_217461 - OBJ
      ?auto_217456 - LOCATION
    )
    :vars
    (
      ?auto_217464 - TRUCK
      ?auto_217462 - LOCATION
      ?auto_217463 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217464 ?auto_217462 ) ( IN-CITY ?auto_217462 ?auto_217463 ) ( IN-CITY ?auto_217456 ?auto_217463 ) ( not ( = ?auto_217456 ?auto_217462 ) ) ( OBJ-AT ?auto_217461 ?auto_217456 ) ( not ( = ?auto_217461 ?auto_217458 ) ) ( OBJ-AT ?auto_217458 ?auto_217462 ) ( OBJ-AT ?auto_217457 ?auto_217456 ) ( OBJ-AT ?auto_217460 ?auto_217456 ) ( OBJ-AT ?auto_217459 ?auto_217456 ) ( not ( = ?auto_217457 ?auto_217458 ) ) ( not ( = ?auto_217457 ?auto_217460 ) ) ( not ( = ?auto_217457 ?auto_217459 ) ) ( not ( = ?auto_217457 ?auto_217461 ) ) ( not ( = ?auto_217458 ?auto_217460 ) ) ( not ( = ?auto_217458 ?auto_217459 ) ) ( not ( = ?auto_217460 ?auto_217459 ) ) ( not ( = ?auto_217460 ?auto_217461 ) ) ( not ( = ?auto_217459 ?auto_217461 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217461 ?auto_217458 ?auto_217456 )
      ( DELIVER-5PKG-VERIFY ?auto_217457 ?auto_217458 ?auto_217460 ?auto_217459 ?auto_217461 ?auto_217456 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217529 - OBJ
      ?auto_217530 - OBJ
      ?auto_217532 - OBJ
      ?auto_217531 - OBJ
      ?auto_217533 - OBJ
      ?auto_217528 - LOCATION
    )
    :vars
    (
      ?auto_217536 - TRUCK
      ?auto_217534 - LOCATION
      ?auto_217535 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217536 ?auto_217534 ) ( IN-CITY ?auto_217534 ?auto_217535 ) ( IN-CITY ?auto_217528 ?auto_217535 ) ( not ( = ?auto_217528 ?auto_217534 ) ) ( OBJ-AT ?auto_217530 ?auto_217528 ) ( not ( = ?auto_217530 ?auto_217529 ) ) ( OBJ-AT ?auto_217529 ?auto_217534 ) ( OBJ-AT ?auto_217532 ?auto_217528 ) ( OBJ-AT ?auto_217531 ?auto_217528 ) ( OBJ-AT ?auto_217533 ?auto_217528 ) ( not ( = ?auto_217529 ?auto_217532 ) ) ( not ( = ?auto_217529 ?auto_217531 ) ) ( not ( = ?auto_217529 ?auto_217533 ) ) ( not ( = ?auto_217530 ?auto_217532 ) ) ( not ( = ?auto_217530 ?auto_217531 ) ) ( not ( = ?auto_217530 ?auto_217533 ) ) ( not ( = ?auto_217532 ?auto_217531 ) ) ( not ( = ?auto_217532 ?auto_217533 ) ) ( not ( = ?auto_217531 ?auto_217533 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217530 ?auto_217529 ?auto_217528 )
      ( DELIVER-5PKG-VERIFY ?auto_217529 ?auto_217530 ?auto_217532 ?auto_217531 ?auto_217533 ?auto_217528 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_217674 - OBJ
      ?auto_217673 - LOCATION
    )
    :vars
    (
      ?auto_217675 - LOCATION
      ?auto_217677 - CITY
      ?auto_217676 - OBJ
      ?auto_217678 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217675 ?auto_217677 ) ( IN-CITY ?auto_217673 ?auto_217677 ) ( not ( = ?auto_217673 ?auto_217675 ) ) ( OBJ-AT ?auto_217676 ?auto_217673 ) ( not ( = ?auto_217676 ?auto_217674 ) ) ( OBJ-AT ?auto_217674 ?auto_217675 ) ( TRUCK-AT ?auto_217678 ?auto_217673 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_217678 ?auto_217673 ?auto_217675 ?auto_217677 )
      ( DELIVER-2PKG ?auto_217676 ?auto_217674 ?auto_217673 )
      ( DELIVER-1PKG-VERIFY ?auto_217674 ?auto_217673 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217680 - OBJ
      ?auto_217681 - OBJ
      ?auto_217679 - LOCATION
    )
    :vars
    (
      ?auto_217682 - LOCATION
      ?auto_217684 - CITY
      ?auto_217683 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217682 ?auto_217684 ) ( IN-CITY ?auto_217679 ?auto_217684 ) ( not ( = ?auto_217679 ?auto_217682 ) ) ( OBJ-AT ?auto_217680 ?auto_217679 ) ( not ( = ?auto_217680 ?auto_217681 ) ) ( OBJ-AT ?auto_217681 ?auto_217682 ) ( TRUCK-AT ?auto_217683 ?auto_217679 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_217681 ?auto_217679 )
      ( DELIVER-2PKG-VERIFY ?auto_217680 ?auto_217681 ?auto_217679 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217686 - OBJ
      ?auto_217687 - OBJ
      ?auto_217685 - LOCATION
    )
    :vars
    (
      ?auto_217688 - LOCATION
      ?auto_217690 - CITY
      ?auto_217689 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217688 ?auto_217690 ) ( IN-CITY ?auto_217685 ?auto_217690 ) ( not ( = ?auto_217685 ?auto_217688 ) ) ( OBJ-AT ?auto_217687 ?auto_217685 ) ( not ( = ?auto_217687 ?auto_217686 ) ) ( OBJ-AT ?auto_217686 ?auto_217688 ) ( TRUCK-AT ?auto_217689 ?auto_217685 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217687 ?auto_217686 ?auto_217685 )
      ( DELIVER-2PKG-VERIFY ?auto_217686 ?auto_217687 ?auto_217685 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_217699 - OBJ
      ?auto_217700 - OBJ
      ?auto_217701 - OBJ
      ?auto_217698 - LOCATION
    )
    :vars
    (
      ?auto_217702 - LOCATION
      ?auto_217704 - CITY
      ?auto_217703 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217702 ?auto_217704 ) ( IN-CITY ?auto_217698 ?auto_217704 ) ( not ( = ?auto_217698 ?auto_217702 ) ) ( OBJ-AT ?auto_217700 ?auto_217698 ) ( not ( = ?auto_217700 ?auto_217701 ) ) ( OBJ-AT ?auto_217701 ?auto_217702 ) ( TRUCK-AT ?auto_217703 ?auto_217698 ) ( OBJ-AT ?auto_217699 ?auto_217698 ) ( not ( = ?auto_217699 ?auto_217700 ) ) ( not ( = ?auto_217699 ?auto_217701 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217700 ?auto_217701 ?auto_217698 )
      ( DELIVER-3PKG-VERIFY ?auto_217699 ?auto_217700 ?auto_217701 ?auto_217698 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_217706 - OBJ
      ?auto_217707 - OBJ
      ?auto_217708 - OBJ
      ?auto_217705 - LOCATION
    )
    :vars
    (
      ?auto_217709 - LOCATION
      ?auto_217711 - CITY
      ?auto_217710 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217709 ?auto_217711 ) ( IN-CITY ?auto_217705 ?auto_217711 ) ( not ( = ?auto_217705 ?auto_217709 ) ) ( OBJ-AT ?auto_217706 ?auto_217705 ) ( not ( = ?auto_217706 ?auto_217707 ) ) ( OBJ-AT ?auto_217707 ?auto_217709 ) ( TRUCK-AT ?auto_217710 ?auto_217705 ) ( OBJ-AT ?auto_217708 ?auto_217705 ) ( not ( = ?auto_217706 ?auto_217708 ) ) ( not ( = ?auto_217707 ?auto_217708 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217706 ?auto_217707 ?auto_217705 )
      ( DELIVER-3PKG-VERIFY ?auto_217706 ?auto_217707 ?auto_217708 ?auto_217705 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_217720 - OBJ
      ?auto_217721 - OBJ
      ?auto_217722 - OBJ
      ?auto_217719 - LOCATION
    )
    :vars
    (
      ?auto_217723 - LOCATION
      ?auto_217725 - CITY
      ?auto_217724 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217723 ?auto_217725 ) ( IN-CITY ?auto_217719 ?auto_217725 ) ( not ( = ?auto_217719 ?auto_217723 ) ) ( OBJ-AT ?auto_217721 ?auto_217719 ) ( not ( = ?auto_217721 ?auto_217720 ) ) ( OBJ-AT ?auto_217720 ?auto_217723 ) ( TRUCK-AT ?auto_217724 ?auto_217719 ) ( OBJ-AT ?auto_217722 ?auto_217719 ) ( not ( = ?auto_217720 ?auto_217722 ) ) ( not ( = ?auto_217721 ?auto_217722 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217721 ?auto_217720 ?auto_217719 )
      ( DELIVER-3PKG-VERIFY ?auto_217720 ?auto_217721 ?auto_217722 ?auto_217719 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217749 - OBJ
      ?auto_217750 - OBJ
      ?auto_217752 - OBJ
      ?auto_217751 - OBJ
      ?auto_217748 - LOCATION
    )
    :vars
    (
      ?auto_217753 - LOCATION
      ?auto_217755 - CITY
      ?auto_217754 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217753 ?auto_217755 ) ( IN-CITY ?auto_217748 ?auto_217755 ) ( not ( = ?auto_217748 ?auto_217753 ) ) ( OBJ-AT ?auto_217749 ?auto_217748 ) ( not ( = ?auto_217749 ?auto_217751 ) ) ( OBJ-AT ?auto_217751 ?auto_217753 ) ( TRUCK-AT ?auto_217754 ?auto_217748 ) ( OBJ-AT ?auto_217750 ?auto_217748 ) ( OBJ-AT ?auto_217752 ?auto_217748 ) ( not ( = ?auto_217749 ?auto_217750 ) ) ( not ( = ?auto_217749 ?auto_217752 ) ) ( not ( = ?auto_217750 ?auto_217752 ) ) ( not ( = ?auto_217750 ?auto_217751 ) ) ( not ( = ?auto_217752 ?auto_217751 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217749 ?auto_217751 ?auto_217748 )
      ( DELIVER-4PKG-VERIFY ?auto_217749 ?auto_217750 ?auto_217752 ?auto_217751 ?auto_217748 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217757 - OBJ
      ?auto_217758 - OBJ
      ?auto_217760 - OBJ
      ?auto_217759 - OBJ
      ?auto_217756 - LOCATION
    )
    :vars
    (
      ?auto_217761 - LOCATION
      ?auto_217763 - CITY
      ?auto_217762 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217761 ?auto_217763 ) ( IN-CITY ?auto_217756 ?auto_217763 ) ( not ( = ?auto_217756 ?auto_217761 ) ) ( OBJ-AT ?auto_217757 ?auto_217756 ) ( not ( = ?auto_217757 ?auto_217760 ) ) ( OBJ-AT ?auto_217760 ?auto_217761 ) ( TRUCK-AT ?auto_217762 ?auto_217756 ) ( OBJ-AT ?auto_217758 ?auto_217756 ) ( OBJ-AT ?auto_217759 ?auto_217756 ) ( not ( = ?auto_217757 ?auto_217758 ) ) ( not ( = ?auto_217757 ?auto_217759 ) ) ( not ( = ?auto_217758 ?auto_217760 ) ) ( not ( = ?auto_217758 ?auto_217759 ) ) ( not ( = ?auto_217760 ?auto_217759 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217757 ?auto_217760 ?auto_217756 )
      ( DELIVER-4PKG-VERIFY ?auto_217757 ?auto_217758 ?auto_217760 ?auto_217759 ?auto_217756 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217773 - OBJ
      ?auto_217774 - OBJ
      ?auto_217776 - OBJ
      ?auto_217775 - OBJ
      ?auto_217772 - LOCATION
    )
    :vars
    (
      ?auto_217777 - LOCATION
      ?auto_217779 - CITY
      ?auto_217778 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217777 ?auto_217779 ) ( IN-CITY ?auto_217772 ?auto_217779 ) ( not ( = ?auto_217772 ?auto_217777 ) ) ( OBJ-AT ?auto_217776 ?auto_217772 ) ( not ( = ?auto_217776 ?auto_217774 ) ) ( OBJ-AT ?auto_217774 ?auto_217777 ) ( TRUCK-AT ?auto_217778 ?auto_217772 ) ( OBJ-AT ?auto_217773 ?auto_217772 ) ( OBJ-AT ?auto_217775 ?auto_217772 ) ( not ( = ?auto_217773 ?auto_217774 ) ) ( not ( = ?auto_217773 ?auto_217776 ) ) ( not ( = ?auto_217773 ?auto_217775 ) ) ( not ( = ?auto_217774 ?auto_217775 ) ) ( not ( = ?auto_217776 ?auto_217775 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217776 ?auto_217774 ?auto_217772 )
      ( DELIVER-4PKG-VERIFY ?auto_217773 ?auto_217774 ?auto_217776 ?auto_217775 ?auto_217772 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217805 - OBJ
      ?auto_217806 - OBJ
      ?auto_217808 - OBJ
      ?auto_217807 - OBJ
      ?auto_217804 - LOCATION
    )
    :vars
    (
      ?auto_217809 - LOCATION
      ?auto_217811 - CITY
      ?auto_217810 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217809 ?auto_217811 ) ( IN-CITY ?auto_217804 ?auto_217811 ) ( not ( = ?auto_217804 ?auto_217809 ) ) ( OBJ-AT ?auto_217808 ?auto_217804 ) ( not ( = ?auto_217808 ?auto_217805 ) ) ( OBJ-AT ?auto_217805 ?auto_217809 ) ( TRUCK-AT ?auto_217810 ?auto_217804 ) ( OBJ-AT ?auto_217806 ?auto_217804 ) ( OBJ-AT ?auto_217807 ?auto_217804 ) ( not ( = ?auto_217805 ?auto_217806 ) ) ( not ( = ?auto_217805 ?auto_217807 ) ) ( not ( = ?auto_217806 ?auto_217808 ) ) ( not ( = ?auto_217806 ?auto_217807 ) ) ( not ( = ?auto_217808 ?auto_217807 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217808 ?auto_217805 ?auto_217804 )
      ( DELIVER-4PKG-VERIFY ?auto_217805 ?auto_217806 ?auto_217808 ?auto_217807 ?auto_217804 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217870 - OBJ
      ?auto_217871 - OBJ
      ?auto_217873 - OBJ
      ?auto_217872 - OBJ
      ?auto_217874 - OBJ
      ?auto_217869 - LOCATION
    )
    :vars
    (
      ?auto_217875 - LOCATION
      ?auto_217877 - CITY
      ?auto_217876 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217875 ?auto_217877 ) ( IN-CITY ?auto_217869 ?auto_217877 ) ( not ( = ?auto_217869 ?auto_217875 ) ) ( OBJ-AT ?auto_217870 ?auto_217869 ) ( not ( = ?auto_217870 ?auto_217874 ) ) ( OBJ-AT ?auto_217874 ?auto_217875 ) ( TRUCK-AT ?auto_217876 ?auto_217869 ) ( OBJ-AT ?auto_217871 ?auto_217869 ) ( OBJ-AT ?auto_217873 ?auto_217869 ) ( OBJ-AT ?auto_217872 ?auto_217869 ) ( not ( = ?auto_217870 ?auto_217871 ) ) ( not ( = ?auto_217870 ?auto_217873 ) ) ( not ( = ?auto_217870 ?auto_217872 ) ) ( not ( = ?auto_217871 ?auto_217873 ) ) ( not ( = ?auto_217871 ?auto_217872 ) ) ( not ( = ?auto_217871 ?auto_217874 ) ) ( not ( = ?auto_217873 ?auto_217872 ) ) ( not ( = ?auto_217873 ?auto_217874 ) ) ( not ( = ?auto_217872 ?auto_217874 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217870 ?auto_217874 ?auto_217869 )
      ( DELIVER-5PKG-VERIFY ?auto_217870 ?auto_217871 ?auto_217873 ?auto_217872 ?auto_217874 ?auto_217869 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217879 - OBJ
      ?auto_217880 - OBJ
      ?auto_217882 - OBJ
      ?auto_217881 - OBJ
      ?auto_217883 - OBJ
      ?auto_217878 - LOCATION
    )
    :vars
    (
      ?auto_217884 - LOCATION
      ?auto_217886 - CITY
      ?auto_217885 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217884 ?auto_217886 ) ( IN-CITY ?auto_217878 ?auto_217886 ) ( not ( = ?auto_217878 ?auto_217884 ) ) ( OBJ-AT ?auto_217879 ?auto_217878 ) ( not ( = ?auto_217879 ?auto_217881 ) ) ( OBJ-AT ?auto_217881 ?auto_217884 ) ( TRUCK-AT ?auto_217885 ?auto_217878 ) ( OBJ-AT ?auto_217880 ?auto_217878 ) ( OBJ-AT ?auto_217882 ?auto_217878 ) ( OBJ-AT ?auto_217883 ?auto_217878 ) ( not ( = ?auto_217879 ?auto_217880 ) ) ( not ( = ?auto_217879 ?auto_217882 ) ) ( not ( = ?auto_217879 ?auto_217883 ) ) ( not ( = ?auto_217880 ?auto_217882 ) ) ( not ( = ?auto_217880 ?auto_217881 ) ) ( not ( = ?auto_217880 ?auto_217883 ) ) ( not ( = ?auto_217882 ?auto_217881 ) ) ( not ( = ?auto_217882 ?auto_217883 ) ) ( not ( = ?auto_217881 ?auto_217883 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217879 ?auto_217881 ?auto_217878 )
      ( DELIVER-5PKG-VERIFY ?auto_217879 ?auto_217880 ?auto_217882 ?auto_217881 ?auto_217883 ?auto_217878 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217897 - OBJ
      ?auto_217898 - OBJ
      ?auto_217900 - OBJ
      ?auto_217899 - OBJ
      ?auto_217901 - OBJ
      ?auto_217896 - LOCATION
    )
    :vars
    (
      ?auto_217902 - LOCATION
      ?auto_217904 - CITY
      ?auto_217903 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217902 ?auto_217904 ) ( IN-CITY ?auto_217896 ?auto_217904 ) ( not ( = ?auto_217896 ?auto_217902 ) ) ( OBJ-AT ?auto_217897 ?auto_217896 ) ( not ( = ?auto_217897 ?auto_217900 ) ) ( OBJ-AT ?auto_217900 ?auto_217902 ) ( TRUCK-AT ?auto_217903 ?auto_217896 ) ( OBJ-AT ?auto_217898 ?auto_217896 ) ( OBJ-AT ?auto_217899 ?auto_217896 ) ( OBJ-AT ?auto_217901 ?auto_217896 ) ( not ( = ?auto_217897 ?auto_217898 ) ) ( not ( = ?auto_217897 ?auto_217899 ) ) ( not ( = ?auto_217897 ?auto_217901 ) ) ( not ( = ?auto_217898 ?auto_217900 ) ) ( not ( = ?auto_217898 ?auto_217899 ) ) ( not ( = ?auto_217898 ?auto_217901 ) ) ( not ( = ?auto_217900 ?auto_217899 ) ) ( not ( = ?auto_217900 ?auto_217901 ) ) ( not ( = ?auto_217899 ?auto_217901 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217897 ?auto_217900 ?auto_217896 )
      ( DELIVER-5PKG-VERIFY ?auto_217897 ?auto_217898 ?auto_217900 ?auto_217899 ?auto_217901 ?auto_217896 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217933 - OBJ
      ?auto_217934 - OBJ
      ?auto_217936 - OBJ
      ?auto_217935 - OBJ
      ?auto_217937 - OBJ
      ?auto_217932 - LOCATION
    )
    :vars
    (
      ?auto_217938 - LOCATION
      ?auto_217940 - CITY
      ?auto_217939 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217938 ?auto_217940 ) ( IN-CITY ?auto_217932 ?auto_217940 ) ( not ( = ?auto_217932 ?auto_217938 ) ) ( OBJ-AT ?auto_217936 ?auto_217932 ) ( not ( = ?auto_217936 ?auto_217934 ) ) ( OBJ-AT ?auto_217934 ?auto_217938 ) ( TRUCK-AT ?auto_217939 ?auto_217932 ) ( OBJ-AT ?auto_217933 ?auto_217932 ) ( OBJ-AT ?auto_217935 ?auto_217932 ) ( OBJ-AT ?auto_217937 ?auto_217932 ) ( not ( = ?auto_217933 ?auto_217934 ) ) ( not ( = ?auto_217933 ?auto_217936 ) ) ( not ( = ?auto_217933 ?auto_217935 ) ) ( not ( = ?auto_217933 ?auto_217937 ) ) ( not ( = ?auto_217934 ?auto_217935 ) ) ( not ( = ?auto_217934 ?auto_217937 ) ) ( not ( = ?auto_217936 ?auto_217935 ) ) ( not ( = ?auto_217936 ?auto_217937 ) ) ( not ( = ?auto_217935 ?auto_217937 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217936 ?auto_217934 ?auto_217932 )
      ( DELIVER-5PKG-VERIFY ?auto_217933 ?auto_217934 ?auto_217936 ?auto_217935 ?auto_217937 ?auto_217932 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218005 - OBJ
      ?auto_218006 - OBJ
      ?auto_218008 - OBJ
      ?auto_218007 - OBJ
      ?auto_218009 - OBJ
      ?auto_218004 - LOCATION
    )
    :vars
    (
      ?auto_218010 - LOCATION
      ?auto_218012 - CITY
      ?auto_218011 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218010 ?auto_218012 ) ( IN-CITY ?auto_218004 ?auto_218012 ) ( not ( = ?auto_218004 ?auto_218010 ) ) ( OBJ-AT ?auto_218009 ?auto_218004 ) ( not ( = ?auto_218009 ?auto_218005 ) ) ( OBJ-AT ?auto_218005 ?auto_218010 ) ( TRUCK-AT ?auto_218011 ?auto_218004 ) ( OBJ-AT ?auto_218006 ?auto_218004 ) ( OBJ-AT ?auto_218008 ?auto_218004 ) ( OBJ-AT ?auto_218007 ?auto_218004 ) ( not ( = ?auto_218005 ?auto_218006 ) ) ( not ( = ?auto_218005 ?auto_218008 ) ) ( not ( = ?auto_218005 ?auto_218007 ) ) ( not ( = ?auto_218006 ?auto_218008 ) ) ( not ( = ?auto_218006 ?auto_218007 ) ) ( not ( = ?auto_218006 ?auto_218009 ) ) ( not ( = ?auto_218008 ?auto_218007 ) ) ( not ( = ?auto_218008 ?auto_218009 ) ) ( not ( = ?auto_218007 ?auto_218009 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_218009 ?auto_218005 ?auto_218004 )
      ( DELIVER-5PKG-VERIFY ?auto_218005 ?auto_218006 ?auto_218008 ?auto_218007 ?auto_218009 ?auto_218004 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_218150 - OBJ
      ?auto_218149 - LOCATION
    )
    :vars
    (
      ?auto_218152 - LOCATION
      ?auto_218154 - CITY
      ?auto_218151 - OBJ
      ?auto_218153 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218152 ?auto_218154 ) ( IN-CITY ?auto_218149 ?auto_218154 ) ( not ( = ?auto_218149 ?auto_218152 ) ) ( not ( = ?auto_218151 ?auto_218150 ) ) ( OBJ-AT ?auto_218150 ?auto_218152 ) ( TRUCK-AT ?auto_218153 ?auto_218149 ) ( IN-TRUCK ?auto_218151 ?auto_218153 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_218151 ?auto_218149 )
      ( DELIVER-2PKG ?auto_218151 ?auto_218150 ?auto_218149 )
      ( DELIVER-1PKG-VERIFY ?auto_218150 ?auto_218149 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_218156 - OBJ
      ?auto_218157 - OBJ
      ?auto_218155 - LOCATION
    )
    :vars
    (
      ?auto_218159 - LOCATION
      ?auto_218158 - CITY
      ?auto_218160 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218159 ?auto_218158 ) ( IN-CITY ?auto_218155 ?auto_218158 ) ( not ( = ?auto_218155 ?auto_218159 ) ) ( not ( = ?auto_218156 ?auto_218157 ) ) ( OBJ-AT ?auto_218157 ?auto_218159 ) ( TRUCK-AT ?auto_218160 ?auto_218155 ) ( IN-TRUCK ?auto_218156 ?auto_218160 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_218157 ?auto_218155 )
      ( DELIVER-2PKG-VERIFY ?auto_218156 ?auto_218157 ?auto_218155 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_218162 - OBJ
      ?auto_218163 - OBJ
      ?auto_218161 - LOCATION
    )
    :vars
    (
      ?auto_218166 - LOCATION
      ?auto_218165 - CITY
      ?auto_218164 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218166 ?auto_218165 ) ( IN-CITY ?auto_218161 ?auto_218165 ) ( not ( = ?auto_218161 ?auto_218166 ) ) ( not ( = ?auto_218163 ?auto_218162 ) ) ( OBJ-AT ?auto_218162 ?auto_218166 ) ( TRUCK-AT ?auto_218164 ?auto_218161 ) ( IN-TRUCK ?auto_218163 ?auto_218164 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_218163 ?auto_218162 ?auto_218161 )
      ( DELIVER-2PKG-VERIFY ?auto_218162 ?auto_218163 ?auto_218161 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_218626 - OBJ
      ?auto_218625 - LOCATION
    )
    :vars
    (
      ?auto_218629 - LOCATION
      ?auto_218628 - CITY
      ?auto_218630 - OBJ
      ?auto_218627 - TRUCK
      ?auto_218631 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_218629 ?auto_218628 ) ( IN-CITY ?auto_218625 ?auto_218628 ) ( not ( = ?auto_218625 ?auto_218629 ) ) ( not ( = ?auto_218630 ?auto_218626 ) ) ( OBJ-AT ?auto_218626 ?auto_218629 ) ( IN-TRUCK ?auto_218630 ?auto_218627 ) ( TRUCK-AT ?auto_218627 ?auto_218631 ) ( IN-CITY ?auto_218631 ?auto_218628 ) ( not ( = ?auto_218625 ?auto_218631 ) ) ( not ( = ?auto_218629 ?auto_218631 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_218627 ?auto_218631 ?auto_218625 ?auto_218628 )
      ( DELIVER-2PKG ?auto_218630 ?auto_218626 ?auto_218625 )
      ( DELIVER-1PKG-VERIFY ?auto_218626 ?auto_218625 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_218633 - OBJ
      ?auto_218634 - OBJ
      ?auto_218632 - LOCATION
    )
    :vars
    (
      ?auto_218636 - LOCATION
      ?auto_218635 - CITY
      ?auto_218638 - TRUCK
      ?auto_218637 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_218636 ?auto_218635 ) ( IN-CITY ?auto_218632 ?auto_218635 ) ( not ( = ?auto_218632 ?auto_218636 ) ) ( not ( = ?auto_218633 ?auto_218634 ) ) ( OBJ-AT ?auto_218634 ?auto_218636 ) ( IN-TRUCK ?auto_218633 ?auto_218638 ) ( TRUCK-AT ?auto_218638 ?auto_218637 ) ( IN-CITY ?auto_218637 ?auto_218635 ) ( not ( = ?auto_218632 ?auto_218637 ) ) ( not ( = ?auto_218636 ?auto_218637 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_218634 ?auto_218632 )
      ( DELIVER-2PKG-VERIFY ?auto_218633 ?auto_218634 ?auto_218632 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_218640 - OBJ
      ?auto_218641 - OBJ
      ?auto_218639 - LOCATION
    )
    :vars
    (
      ?auto_218644 - LOCATION
      ?auto_218645 - CITY
      ?auto_218643 - TRUCK
      ?auto_218642 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_218644 ?auto_218645 ) ( IN-CITY ?auto_218639 ?auto_218645 ) ( not ( = ?auto_218639 ?auto_218644 ) ) ( not ( = ?auto_218641 ?auto_218640 ) ) ( OBJ-AT ?auto_218640 ?auto_218644 ) ( IN-TRUCK ?auto_218641 ?auto_218643 ) ( TRUCK-AT ?auto_218643 ?auto_218642 ) ( IN-CITY ?auto_218642 ?auto_218645 ) ( not ( = ?auto_218639 ?auto_218642 ) ) ( not ( = ?auto_218644 ?auto_218642 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_218641 ?auto_218640 ?auto_218639 )
      ( DELIVER-2PKG-VERIFY ?auto_218640 ?auto_218641 ?auto_218639 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_219159 - OBJ
      ?auto_219158 - LOCATION
    )
    :vars
    (
      ?auto_219162 - LOCATION
      ?auto_219164 - CITY
      ?auto_219163 - OBJ
      ?auto_219161 - TRUCK
      ?auto_219160 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_219162 ?auto_219164 ) ( IN-CITY ?auto_219158 ?auto_219164 ) ( not ( = ?auto_219158 ?auto_219162 ) ) ( not ( = ?auto_219163 ?auto_219159 ) ) ( OBJ-AT ?auto_219159 ?auto_219162 ) ( TRUCK-AT ?auto_219161 ?auto_219160 ) ( IN-CITY ?auto_219160 ?auto_219164 ) ( not ( = ?auto_219158 ?auto_219160 ) ) ( not ( = ?auto_219162 ?auto_219160 ) ) ( OBJ-AT ?auto_219163 ?auto_219160 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_219163 ?auto_219161 ?auto_219160 )
      ( DELIVER-2PKG ?auto_219163 ?auto_219159 ?auto_219158 )
      ( DELIVER-1PKG-VERIFY ?auto_219159 ?auto_219158 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_219166 - OBJ
      ?auto_219167 - OBJ
      ?auto_219165 - LOCATION
    )
    :vars
    (
      ?auto_219169 - LOCATION
      ?auto_219171 - CITY
      ?auto_219170 - TRUCK
      ?auto_219168 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_219169 ?auto_219171 ) ( IN-CITY ?auto_219165 ?auto_219171 ) ( not ( = ?auto_219165 ?auto_219169 ) ) ( not ( = ?auto_219166 ?auto_219167 ) ) ( OBJ-AT ?auto_219167 ?auto_219169 ) ( TRUCK-AT ?auto_219170 ?auto_219168 ) ( IN-CITY ?auto_219168 ?auto_219171 ) ( not ( = ?auto_219165 ?auto_219168 ) ) ( not ( = ?auto_219169 ?auto_219168 ) ) ( OBJ-AT ?auto_219166 ?auto_219168 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_219167 ?auto_219165 )
      ( DELIVER-2PKG-VERIFY ?auto_219166 ?auto_219167 ?auto_219165 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_219173 - OBJ
      ?auto_219174 - OBJ
      ?auto_219172 - LOCATION
    )
    :vars
    (
      ?auto_219178 - LOCATION
      ?auto_219176 - CITY
      ?auto_219175 - TRUCK
      ?auto_219177 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_219178 ?auto_219176 ) ( IN-CITY ?auto_219172 ?auto_219176 ) ( not ( = ?auto_219172 ?auto_219178 ) ) ( not ( = ?auto_219174 ?auto_219173 ) ) ( OBJ-AT ?auto_219173 ?auto_219178 ) ( TRUCK-AT ?auto_219175 ?auto_219177 ) ( IN-CITY ?auto_219177 ?auto_219176 ) ( not ( = ?auto_219172 ?auto_219177 ) ) ( not ( = ?auto_219178 ?auto_219177 ) ) ( OBJ-AT ?auto_219174 ?auto_219177 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_219174 ?auto_219173 ?auto_219172 )
      ( DELIVER-2PKG-VERIFY ?auto_219173 ?auto_219174 ?auto_219172 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223851 - OBJ
      ?auto_223852 - OBJ
      ?auto_223853 - OBJ
      ?auto_223850 - LOCATION
    )
    :vars
    (
      ?auto_223854 - TRUCK
      ?auto_223855 - LOCATION
      ?auto_223856 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223853 ?auto_223854 ) ( TRUCK-AT ?auto_223854 ?auto_223855 ) ( IN-CITY ?auto_223855 ?auto_223856 ) ( IN-CITY ?auto_223850 ?auto_223856 ) ( not ( = ?auto_223850 ?auto_223855 ) ) ( OBJ-AT ?auto_223852 ?auto_223850 ) ( not ( = ?auto_223852 ?auto_223853 ) ) ( OBJ-AT ?auto_223851 ?auto_223850 ) ( not ( = ?auto_223851 ?auto_223852 ) ) ( not ( = ?auto_223851 ?auto_223853 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223852 ?auto_223853 ?auto_223850 )
      ( DELIVER-3PKG-VERIFY ?auto_223851 ?auto_223852 ?auto_223853 ?auto_223850 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223862 - OBJ
      ?auto_223863 - OBJ
      ?auto_223864 - OBJ
      ?auto_223861 - LOCATION
    )
    :vars
    (
      ?auto_223865 - TRUCK
      ?auto_223866 - LOCATION
      ?auto_223867 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223863 ?auto_223865 ) ( TRUCK-AT ?auto_223865 ?auto_223866 ) ( IN-CITY ?auto_223866 ?auto_223867 ) ( IN-CITY ?auto_223861 ?auto_223867 ) ( not ( = ?auto_223861 ?auto_223866 ) ) ( OBJ-AT ?auto_223862 ?auto_223861 ) ( not ( = ?auto_223862 ?auto_223863 ) ) ( OBJ-AT ?auto_223864 ?auto_223861 ) ( not ( = ?auto_223862 ?auto_223864 ) ) ( not ( = ?auto_223863 ?auto_223864 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223862 ?auto_223863 ?auto_223861 )
      ( DELIVER-3PKG-VERIFY ?auto_223862 ?auto_223863 ?auto_223864 ?auto_223861 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223884 - OBJ
      ?auto_223885 - OBJ
      ?auto_223886 - OBJ
      ?auto_223883 - LOCATION
    )
    :vars
    (
      ?auto_223888 - TRUCK
      ?auto_223889 - LOCATION
      ?auto_223890 - CITY
      ?auto_223887 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223886 ?auto_223888 ) ( TRUCK-AT ?auto_223888 ?auto_223889 ) ( IN-CITY ?auto_223889 ?auto_223890 ) ( IN-CITY ?auto_223883 ?auto_223890 ) ( not ( = ?auto_223883 ?auto_223889 ) ) ( OBJ-AT ?auto_223887 ?auto_223883 ) ( not ( = ?auto_223887 ?auto_223886 ) ) ( OBJ-AT ?auto_223884 ?auto_223883 ) ( OBJ-AT ?auto_223885 ?auto_223883 ) ( not ( = ?auto_223884 ?auto_223885 ) ) ( not ( = ?auto_223884 ?auto_223886 ) ) ( not ( = ?auto_223884 ?auto_223887 ) ) ( not ( = ?auto_223885 ?auto_223886 ) ) ( not ( = ?auto_223885 ?auto_223887 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223887 ?auto_223886 ?auto_223883 )
      ( DELIVER-3PKG-VERIFY ?auto_223884 ?auto_223885 ?auto_223886 ?auto_223883 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223896 - OBJ
      ?auto_223897 - OBJ
      ?auto_223898 - OBJ
      ?auto_223895 - LOCATION
    )
    :vars
    (
      ?auto_223900 - TRUCK
      ?auto_223901 - LOCATION
      ?auto_223902 - CITY
      ?auto_223899 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223897 ?auto_223900 ) ( TRUCK-AT ?auto_223900 ?auto_223901 ) ( IN-CITY ?auto_223901 ?auto_223902 ) ( IN-CITY ?auto_223895 ?auto_223902 ) ( not ( = ?auto_223895 ?auto_223901 ) ) ( OBJ-AT ?auto_223899 ?auto_223895 ) ( not ( = ?auto_223899 ?auto_223897 ) ) ( OBJ-AT ?auto_223896 ?auto_223895 ) ( OBJ-AT ?auto_223898 ?auto_223895 ) ( not ( = ?auto_223896 ?auto_223897 ) ) ( not ( = ?auto_223896 ?auto_223898 ) ) ( not ( = ?auto_223896 ?auto_223899 ) ) ( not ( = ?auto_223897 ?auto_223898 ) ) ( not ( = ?auto_223898 ?auto_223899 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223899 ?auto_223897 ?auto_223895 )
      ( DELIVER-3PKG-VERIFY ?auto_223896 ?auto_223897 ?auto_223898 ?auto_223895 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223934 - OBJ
      ?auto_223935 - OBJ
      ?auto_223936 - OBJ
      ?auto_223933 - LOCATION
    )
    :vars
    (
      ?auto_223938 - TRUCK
      ?auto_223939 - LOCATION
      ?auto_223940 - CITY
      ?auto_223937 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223934 ?auto_223938 ) ( TRUCK-AT ?auto_223938 ?auto_223939 ) ( IN-CITY ?auto_223939 ?auto_223940 ) ( IN-CITY ?auto_223933 ?auto_223940 ) ( not ( = ?auto_223933 ?auto_223939 ) ) ( OBJ-AT ?auto_223937 ?auto_223933 ) ( not ( = ?auto_223937 ?auto_223934 ) ) ( OBJ-AT ?auto_223935 ?auto_223933 ) ( OBJ-AT ?auto_223936 ?auto_223933 ) ( not ( = ?auto_223934 ?auto_223935 ) ) ( not ( = ?auto_223934 ?auto_223936 ) ) ( not ( = ?auto_223935 ?auto_223936 ) ) ( not ( = ?auto_223935 ?auto_223937 ) ) ( not ( = ?auto_223936 ?auto_223937 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223937 ?auto_223934 ?auto_223933 )
      ( DELIVER-3PKG-VERIFY ?auto_223934 ?auto_223935 ?auto_223936 ?auto_223933 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223973 - OBJ
      ?auto_223974 - OBJ
      ?auto_223976 - OBJ
      ?auto_223975 - OBJ
      ?auto_223972 - LOCATION
    )
    :vars
    (
      ?auto_223977 - TRUCK
      ?auto_223978 - LOCATION
      ?auto_223979 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223975 ?auto_223977 ) ( TRUCK-AT ?auto_223977 ?auto_223978 ) ( IN-CITY ?auto_223978 ?auto_223979 ) ( IN-CITY ?auto_223972 ?auto_223979 ) ( not ( = ?auto_223972 ?auto_223978 ) ) ( OBJ-AT ?auto_223976 ?auto_223972 ) ( not ( = ?auto_223976 ?auto_223975 ) ) ( OBJ-AT ?auto_223973 ?auto_223972 ) ( OBJ-AT ?auto_223974 ?auto_223972 ) ( not ( = ?auto_223973 ?auto_223974 ) ) ( not ( = ?auto_223973 ?auto_223976 ) ) ( not ( = ?auto_223973 ?auto_223975 ) ) ( not ( = ?auto_223974 ?auto_223976 ) ) ( not ( = ?auto_223974 ?auto_223975 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223976 ?auto_223975 ?auto_223972 )
      ( DELIVER-4PKG-VERIFY ?auto_223973 ?auto_223974 ?auto_223976 ?auto_223975 ?auto_223972 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_224029 - OBJ
      ?auto_224030 - OBJ
      ?auto_224032 - OBJ
      ?auto_224031 - OBJ
      ?auto_224028 - LOCATION
    )
    :vars
    (
      ?auto_224033 - TRUCK
      ?auto_224034 - LOCATION
      ?auto_224035 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224032 ?auto_224033 ) ( TRUCK-AT ?auto_224033 ?auto_224034 ) ( IN-CITY ?auto_224034 ?auto_224035 ) ( IN-CITY ?auto_224028 ?auto_224035 ) ( not ( = ?auto_224028 ?auto_224034 ) ) ( OBJ-AT ?auto_224029 ?auto_224028 ) ( not ( = ?auto_224029 ?auto_224032 ) ) ( OBJ-AT ?auto_224030 ?auto_224028 ) ( OBJ-AT ?auto_224031 ?auto_224028 ) ( not ( = ?auto_224029 ?auto_224030 ) ) ( not ( = ?auto_224029 ?auto_224031 ) ) ( not ( = ?auto_224030 ?auto_224032 ) ) ( not ( = ?auto_224030 ?auto_224031 ) ) ( not ( = ?auto_224032 ?auto_224031 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224029 ?auto_224032 ?auto_224028 )
      ( DELIVER-4PKG-VERIFY ?auto_224029 ?auto_224030 ?auto_224032 ?auto_224031 ?auto_224028 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_224053 - OBJ
      ?auto_224054 - OBJ
      ?auto_224056 - OBJ
      ?auto_224055 - OBJ
      ?auto_224052 - LOCATION
    )
    :vars
    (
      ?auto_224057 - TRUCK
      ?auto_224058 - LOCATION
      ?auto_224059 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224054 ?auto_224057 ) ( TRUCK-AT ?auto_224057 ?auto_224058 ) ( IN-CITY ?auto_224058 ?auto_224059 ) ( IN-CITY ?auto_224052 ?auto_224059 ) ( not ( = ?auto_224052 ?auto_224058 ) ) ( OBJ-AT ?auto_224056 ?auto_224052 ) ( not ( = ?auto_224056 ?auto_224054 ) ) ( OBJ-AT ?auto_224053 ?auto_224052 ) ( OBJ-AT ?auto_224055 ?auto_224052 ) ( not ( = ?auto_224053 ?auto_224054 ) ) ( not ( = ?auto_224053 ?auto_224056 ) ) ( not ( = ?auto_224053 ?auto_224055 ) ) ( not ( = ?auto_224054 ?auto_224055 ) ) ( not ( = ?auto_224056 ?auto_224055 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224056 ?auto_224054 ?auto_224052 )
      ( DELIVER-4PKG-VERIFY ?auto_224053 ?auto_224054 ?auto_224056 ?auto_224055 ?auto_224052 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_224133 - OBJ
      ?auto_224134 - OBJ
      ?auto_224136 - OBJ
      ?auto_224135 - OBJ
      ?auto_224132 - LOCATION
    )
    :vars
    (
      ?auto_224137 - TRUCK
      ?auto_224138 - LOCATION
      ?auto_224139 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224135 ?auto_224137 ) ( TRUCK-AT ?auto_224137 ?auto_224138 ) ( IN-CITY ?auto_224138 ?auto_224139 ) ( IN-CITY ?auto_224132 ?auto_224139 ) ( not ( = ?auto_224132 ?auto_224138 ) ) ( OBJ-AT ?auto_224134 ?auto_224132 ) ( not ( = ?auto_224134 ?auto_224135 ) ) ( OBJ-AT ?auto_224133 ?auto_224132 ) ( OBJ-AT ?auto_224136 ?auto_224132 ) ( not ( = ?auto_224133 ?auto_224134 ) ) ( not ( = ?auto_224133 ?auto_224136 ) ) ( not ( = ?auto_224133 ?auto_224135 ) ) ( not ( = ?auto_224134 ?auto_224136 ) ) ( not ( = ?auto_224136 ?auto_224135 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224134 ?auto_224135 ?auto_224132 )
      ( DELIVER-4PKG-VERIFY ?auto_224133 ?auto_224134 ?auto_224136 ?auto_224135 ?auto_224132 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_224141 - OBJ
      ?auto_224142 - OBJ
      ?auto_224144 - OBJ
      ?auto_224143 - OBJ
      ?auto_224140 - LOCATION
    )
    :vars
    (
      ?auto_224145 - TRUCK
      ?auto_224146 - LOCATION
      ?auto_224147 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224144 ?auto_224145 ) ( TRUCK-AT ?auto_224145 ?auto_224146 ) ( IN-CITY ?auto_224146 ?auto_224147 ) ( IN-CITY ?auto_224140 ?auto_224147 ) ( not ( = ?auto_224140 ?auto_224146 ) ) ( OBJ-AT ?auto_224143 ?auto_224140 ) ( not ( = ?auto_224143 ?auto_224144 ) ) ( OBJ-AT ?auto_224141 ?auto_224140 ) ( OBJ-AT ?auto_224142 ?auto_224140 ) ( not ( = ?auto_224141 ?auto_224142 ) ) ( not ( = ?auto_224141 ?auto_224144 ) ) ( not ( = ?auto_224141 ?auto_224143 ) ) ( not ( = ?auto_224142 ?auto_224144 ) ) ( not ( = ?auto_224142 ?auto_224143 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224143 ?auto_224144 ?auto_224140 )
      ( DELIVER-4PKG-VERIFY ?auto_224141 ?auto_224142 ?auto_224144 ?auto_224143 ?auto_224140 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_224173 - OBJ
      ?auto_224174 - OBJ
      ?auto_224176 - OBJ
      ?auto_224175 - OBJ
      ?auto_224172 - LOCATION
    )
    :vars
    (
      ?auto_224178 - TRUCK
      ?auto_224179 - LOCATION
      ?auto_224180 - CITY
      ?auto_224177 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224175 ?auto_224178 ) ( TRUCK-AT ?auto_224178 ?auto_224179 ) ( IN-CITY ?auto_224179 ?auto_224180 ) ( IN-CITY ?auto_224172 ?auto_224180 ) ( not ( = ?auto_224172 ?auto_224179 ) ) ( OBJ-AT ?auto_224177 ?auto_224172 ) ( not ( = ?auto_224177 ?auto_224175 ) ) ( OBJ-AT ?auto_224173 ?auto_224172 ) ( OBJ-AT ?auto_224174 ?auto_224172 ) ( OBJ-AT ?auto_224176 ?auto_224172 ) ( not ( = ?auto_224173 ?auto_224174 ) ) ( not ( = ?auto_224173 ?auto_224176 ) ) ( not ( = ?auto_224173 ?auto_224175 ) ) ( not ( = ?auto_224173 ?auto_224177 ) ) ( not ( = ?auto_224174 ?auto_224176 ) ) ( not ( = ?auto_224174 ?auto_224175 ) ) ( not ( = ?auto_224174 ?auto_224177 ) ) ( not ( = ?auto_224176 ?auto_224175 ) ) ( not ( = ?auto_224176 ?auto_224177 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224177 ?auto_224175 ?auto_224172 )
      ( DELIVER-4PKG-VERIFY ?auto_224173 ?auto_224174 ?auto_224176 ?auto_224175 ?auto_224172 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_224190 - OBJ
      ?auto_224191 - OBJ
      ?auto_224193 - OBJ
      ?auto_224192 - OBJ
      ?auto_224189 - LOCATION
    )
    :vars
    (
      ?auto_224195 - TRUCK
      ?auto_224196 - LOCATION
      ?auto_224197 - CITY
      ?auto_224194 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224193 ?auto_224195 ) ( TRUCK-AT ?auto_224195 ?auto_224196 ) ( IN-CITY ?auto_224196 ?auto_224197 ) ( IN-CITY ?auto_224189 ?auto_224197 ) ( not ( = ?auto_224189 ?auto_224196 ) ) ( OBJ-AT ?auto_224194 ?auto_224189 ) ( not ( = ?auto_224194 ?auto_224193 ) ) ( OBJ-AT ?auto_224190 ?auto_224189 ) ( OBJ-AT ?auto_224191 ?auto_224189 ) ( OBJ-AT ?auto_224192 ?auto_224189 ) ( not ( = ?auto_224190 ?auto_224191 ) ) ( not ( = ?auto_224190 ?auto_224193 ) ) ( not ( = ?auto_224190 ?auto_224192 ) ) ( not ( = ?auto_224190 ?auto_224194 ) ) ( not ( = ?auto_224191 ?auto_224193 ) ) ( not ( = ?auto_224191 ?auto_224192 ) ) ( not ( = ?auto_224191 ?auto_224194 ) ) ( not ( = ?auto_224193 ?auto_224192 ) ) ( not ( = ?auto_224192 ?auto_224194 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224194 ?auto_224193 ?auto_224189 )
      ( DELIVER-4PKG-VERIFY ?auto_224190 ?auto_224191 ?auto_224193 ?auto_224192 ?auto_224189 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_224232 - OBJ
      ?auto_224233 - OBJ
      ?auto_224235 - OBJ
      ?auto_224234 - OBJ
      ?auto_224231 - LOCATION
    )
    :vars
    (
      ?auto_224236 - TRUCK
      ?auto_224237 - LOCATION
      ?auto_224238 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224233 ?auto_224236 ) ( TRUCK-AT ?auto_224236 ?auto_224237 ) ( IN-CITY ?auto_224237 ?auto_224238 ) ( IN-CITY ?auto_224231 ?auto_224238 ) ( not ( = ?auto_224231 ?auto_224237 ) ) ( OBJ-AT ?auto_224234 ?auto_224231 ) ( not ( = ?auto_224234 ?auto_224233 ) ) ( OBJ-AT ?auto_224232 ?auto_224231 ) ( OBJ-AT ?auto_224235 ?auto_224231 ) ( not ( = ?auto_224232 ?auto_224233 ) ) ( not ( = ?auto_224232 ?auto_224235 ) ) ( not ( = ?auto_224232 ?auto_224234 ) ) ( not ( = ?auto_224233 ?auto_224235 ) ) ( not ( = ?auto_224235 ?auto_224234 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224234 ?auto_224233 ?auto_224231 )
      ( DELIVER-4PKG-VERIFY ?auto_224232 ?auto_224233 ?auto_224235 ?auto_224234 ?auto_224231 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_224240 - OBJ
      ?auto_224241 - OBJ
      ?auto_224243 - OBJ
      ?auto_224242 - OBJ
      ?auto_224239 - LOCATION
    )
    :vars
    (
      ?auto_224245 - TRUCK
      ?auto_224246 - LOCATION
      ?auto_224247 - CITY
      ?auto_224244 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224241 ?auto_224245 ) ( TRUCK-AT ?auto_224245 ?auto_224246 ) ( IN-CITY ?auto_224246 ?auto_224247 ) ( IN-CITY ?auto_224239 ?auto_224247 ) ( not ( = ?auto_224239 ?auto_224246 ) ) ( OBJ-AT ?auto_224244 ?auto_224239 ) ( not ( = ?auto_224244 ?auto_224241 ) ) ( OBJ-AT ?auto_224240 ?auto_224239 ) ( OBJ-AT ?auto_224243 ?auto_224239 ) ( OBJ-AT ?auto_224242 ?auto_224239 ) ( not ( = ?auto_224240 ?auto_224241 ) ) ( not ( = ?auto_224240 ?auto_224243 ) ) ( not ( = ?auto_224240 ?auto_224242 ) ) ( not ( = ?auto_224240 ?auto_224244 ) ) ( not ( = ?auto_224241 ?auto_224243 ) ) ( not ( = ?auto_224241 ?auto_224242 ) ) ( not ( = ?auto_224243 ?auto_224242 ) ) ( not ( = ?auto_224243 ?auto_224244 ) ) ( not ( = ?auto_224242 ?auto_224244 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224244 ?auto_224241 ?auto_224239 )
      ( DELIVER-4PKG-VERIFY ?auto_224240 ?auto_224241 ?auto_224243 ?auto_224242 ?auto_224239 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_224292 - OBJ
      ?auto_224293 - OBJ
      ?auto_224295 - OBJ
      ?auto_224294 - OBJ
      ?auto_224291 - LOCATION
    )
    :vars
    (
      ?auto_224296 - TRUCK
      ?auto_224297 - LOCATION
      ?auto_224298 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224292 ?auto_224296 ) ( TRUCK-AT ?auto_224296 ?auto_224297 ) ( IN-CITY ?auto_224297 ?auto_224298 ) ( IN-CITY ?auto_224291 ?auto_224298 ) ( not ( = ?auto_224291 ?auto_224297 ) ) ( OBJ-AT ?auto_224293 ?auto_224291 ) ( not ( = ?auto_224293 ?auto_224292 ) ) ( OBJ-AT ?auto_224295 ?auto_224291 ) ( OBJ-AT ?auto_224294 ?auto_224291 ) ( not ( = ?auto_224292 ?auto_224295 ) ) ( not ( = ?auto_224292 ?auto_224294 ) ) ( not ( = ?auto_224293 ?auto_224295 ) ) ( not ( = ?auto_224293 ?auto_224294 ) ) ( not ( = ?auto_224295 ?auto_224294 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224293 ?auto_224292 ?auto_224291 )
      ( DELIVER-4PKG-VERIFY ?auto_224292 ?auto_224293 ?auto_224295 ?auto_224294 ?auto_224291 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_224356 - OBJ
      ?auto_224357 - OBJ
      ?auto_224359 - OBJ
      ?auto_224358 - OBJ
      ?auto_224355 - LOCATION
    )
    :vars
    (
      ?auto_224360 - TRUCK
      ?auto_224361 - LOCATION
      ?auto_224362 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224356 ?auto_224360 ) ( TRUCK-AT ?auto_224360 ?auto_224361 ) ( IN-CITY ?auto_224361 ?auto_224362 ) ( IN-CITY ?auto_224355 ?auto_224362 ) ( not ( = ?auto_224355 ?auto_224361 ) ) ( OBJ-AT ?auto_224359 ?auto_224355 ) ( not ( = ?auto_224359 ?auto_224356 ) ) ( OBJ-AT ?auto_224357 ?auto_224355 ) ( OBJ-AT ?auto_224358 ?auto_224355 ) ( not ( = ?auto_224356 ?auto_224357 ) ) ( not ( = ?auto_224356 ?auto_224358 ) ) ( not ( = ?auto_224357 ?auto_224359 ) ) ( not ( = ?auto_224357 ?auto_224358 ) ) ( not ( = ?auto_224359 ?auto_224358 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224359 ?auto_224356 ?auto_224355 )
      ( DELIVER-4PKG-VERIFY ?auto_224356 ?auto_224357 ?auto_224359 ?auto_224358 ?auto_224355 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_224388 - OBJ
      ?auto_224389 - OBJ
      ?auto_224391 - OBJ
      ?auto_224390 - OBJ
      ?auto_224387 - LOCATION
    )
    :vars
    (
      ?auto_224393 - TRUCK
      ?auto_224394 - LOCATION
      ?auto_224395 - CITY
      ?auto_224392 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224388 ?auto_224393 ) ( TRUCK-AT ?auto_224393 ?auto_224394 ) ( IN-CITY ?auto_224394 ?auto_224395 ) ( IN-CITY ?auto_224387 ?auto_224395 ) ( not ( = ?auto_224387 ?auto_224394 ) ) ( OBJ-AT ?auto_224392 ?auto_224387 ) ( not ( = ?auto_224392 ?auto_224388 ) ) ( OBJ-AT ?auto_224389 ?auto_224387 ) ( OBJ-AT ?auto_224391 ?auto_224387 ) ( OBJ-AT ?auto_224390 ?auto_224387 ) ( not ( = ?auto_224388 ?auto_224389 ) ) ( not ( = ?auto_224388 ?auto_224391 ) ) ( not ( = ?auto_224388 ?auto_224390 ) ) ( not ( = ?auto_224389 ?auto_224391 ) ) ( not ( = ?auto_224389 ?auto_224390 ) ) ( not ( = ?auto_224389 ?auto_224392 ) ) ( not ( = ?auto_224391 ?auto_224390 ) ) ( not ( = ?auto_224391 ?auto_224392 ) ) ( not ( = ?auto_224390 ?auto_224392 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224392 ?auto_224388 ?auto_224387 )
      ( DELIVER-4PKG-VERIFY ?auto_224388 ?auto_224389 ?auto_224391 ?auto_224390 ?auto_224387 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224508 - OBJ
      ?auto_224509 - OBJ
      ?auto_224511 - OBJ
      ?auto_224510 - OBJ
      ?auto_224512 - OBJ
      ?auto_224507 - LOCATION
    )
    :vars
    (
      ?auto_224513 - TRUCK
      ?auto_224514 - LOCATION
      ?auto_224515 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224512 ?auto_224513 ) ( TRUCK-AT ?auto_224513 ?auto_224514 ) ( IN-CITY ?auto_224514 ?auto_224515 ) ( IN-CITY ?auto_224507 ?auto_224515 ) ( not ( = ?auto_224507 ?auto_224514 ) ) ( OBJ-AT ?auto_224508 ?auto_224507 ) ( not ( = ?auto_224508 ?auto_224512 ) ) ( OBJ-AT ?auto_224509 ?auto_224507 ) ( OBJ-AT ?auto_224511 ?auto_224507 ) ( OBJ-AT ?auto_224510 ?auto_224507 ) ( not ( = ?auto_224508 ?auto_224509 ) ) ( not ( = ?auto_224508 ?auto_224511 ) ) ( not ( = ?auto_224508 ?auto_224510 ) ) ( not ( = ?auto_224509 ?auto_224511 ) ) ( not ( = ?auto_224509 ?auto_224510 ) ) ( not ( = ?auto_224509 ?auto_224512 ) ) ( not ( = ?auto_224511 ?auto_224510 ) ) ( not ( = ?auto_224511 ?auto_224512 ) ) ( not ( = ?auto_224510 ?auto_224512 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224508 ?auto_224512 ?auto_224507 )
      ( DELIVER-5PKG-VERIFY ?auto_224508 ?auto_224509 ?auto_224511 ?auto_224510 ?auto_224512 ?auto_224507 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224526 - OBJ
      ?auto_224527 - OBJ
      ?auto_224529 - OBJ
      ?auto_224528 - OBJ
      ?auto_224530 - OBJ
      ?auto_224525 - LOCATION
    )
    :vars
    (
      ?auto_224531 - TRUCK
      ?auto_224532 - LOCATION
      ?auto_224533 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224528 ?auto_224531 ) ( TRUCK-AT ?auto_224531 ?auto_224532 ) ( IN-CITY ?auto_224532 ?auto_224533 ) ( IN-CITY ?auto_224525 ?auto_224533 ) ( not ( = ?auto_224525 ?auto_224532 ) ) ( OBJ-AT ?auto_224527 ?auto_224525 ) ( not ( = ?auto_224527 ?auto_224528 ) ) ( OBJ-AT ?auto_224526 ?auto_224525 ) ( OBJ-AT ?auto_224529 ?auto_224525 ) ( OBJ-AT ?auto_224530 ?auto_224525 ) ( not ( = ?auto_224526 ?auto_224527 ) ) ( not ( = ?auto_224526 ?auto_224529 ) ) ( not ( = ?auto_224526 ?auto_224528 ) ) ( not ( = ?auto_224526 ?auto_224530 ) ) ( not ( = ?auto_224527 ?auto_224529 ) ) ( not ( = ?auto_224527 ?auto_224530 ) ) ( not ( = ?auto_224529 ?auto_224528 ) ) ( not ( = ?auto_224529 ?auto_224530 ) ) ( not ( = ?auto_224528 ?auto_224530 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224527 ?auto_224528 ?auto_224525 )
      ( DELIVER-5PKG-VERIFY ?auto_224526 ?auto_224527 ?auto_224529 ?auto_224528 ?auto_224530 ?auto_224525 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224598 - OBJ
      ?auto_224599 - OBJ
      ?auto_224601 - OBJ
      ?auto_224600 - OBJ
      ?auto_224602 - OBJ
      ?auto_224597 - LOCATION
    )
    :vars
    (
      ?auto_224603 - TRUCK
      ?auto_224604 - LOCATION
      ?auto_224605 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224601 ?auto_224603 ) ( TRUCK-AT ?auto_224603 ?auto_224604 ) ( IN-CITY ?auto_224604 ?auto_224605 ) ( IN-CITY ?auto_224597 ?auto_224605 ) ( not ( = ?auto_224597 ?auto_224604 ) ) ( OBJ-AT ?auto_224600 ?auto_224597 ) ( not ( = ?auto_224600 ?auto_224601 ) ) ( OBJ-AT ?auto_224598 ?auto_224597 ) ( OBJ-AT ?auto_224599 ?auto_224597 ) ( OBJ-AT ?auto_224602 ?auto_224597 ) ( not ( = ?auto_224598 ?auto_224599 ) ) ( not ( = ?auto_224598 ?auto_224601 ) ) ( not ( = ?auto_224598 ?auto_224600 ) ) ( not ( = ?auto_224598 ?auto_224602 ) ) ( not ( = ?auto_224599 ?auto_224601 ) ) ( not ( = ?auto_224599 ?auto_224600 ) ) ( not ( = ?auto_224599 ?auto_224602 ) ) ( not ( = ?auto_224601 ?auto_224602 ) ) ( not ( = ?auto_224600 ?auto_224602 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224600 ?auto_224601 ?auto_224597 )
      ( DELIVER-5PKG-VERIFY ?auto_224598 ?auto_224599 ?auto_224601 ?auto_224600 ?auto_224602 ?auto_224597 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224634 - OBJ
      ?auto_224635 - OBJ
      ?auto_224637 - OBJ
      ?auto_224636 - OBJ
      ?auto_224638 - OBJ
      ?auto_224633 - LOCATION
    )
    :vars
    (
      ?auto_224639 - TRUCK
      ?auto_224640 - LOCATION
      ?auto_224641 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224637 ?auto_224639 ) ( TRUCK-AT ?auto_224639 ?auto_224640 ) ( IN-CITY ?auto_224640 ?auto_224641 ) ( IN-CITY ?auto_224633 ?auto_224641 ) ( not ( = ?auto_224633 ?auto_224640 ) ) ( OBJ-AT ?auto_224635 ?auto_224633 ) ( not ( = ?auto_224635 ?auto_224637 ) ) ( OBJ-AT ?auto_224634 ?auto_224633 ) ( OBJ-AT ?auto_224636 ?auto_224633 ) ( OBJ-AT ?auto_224638 ?auto_224633 ) ( not ( = ?auto_224634 ?auto_224635 ) ) ( not ( = ?auto_224634 ?auto_224637 ) ) ( not ( = ?auto_224634 ?auto_224636 ) ) ( not ( = ?auto_224634 ?auto_224638 ) ) ( not ( = ?auto_224635 ?auto_224636 ) ) ( not ( = ?auto_224635 ?auto_224638 ) ) ( not ( = ?auto_224637 ?auto_224636 ) ) ( not ( = ?auto_224637 ?auto_224638 ) ) ( not ( = ?auto_224636 ?auto_224638 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224635 ?auto_224637 ?auto_224633 )
      ( DELIVER-5PKG-VERIFY ?auto_224634 ?auto_224635 ?auto_224637 ?auto_224636 ?auto_224638 ?auto_224633 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224679 - OBJ
      ?auto_224680 - OBJ
      ?auto_224682 - OBJ
      ?auto_224681 - OBJ
      ?auto_224683 - OBJ
      ?auto_224678 - LOCATION
    )
    :vars
    (
      ?auto_224684 - TRUCK
      ?auto_224685 - LOCATION
      ?auto_224686 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224683 ?auto_224684 ) ( TRUCK-AT ?auto_224684 ?auto_224685 ) ( IN-CITY ?auto_224685 ?auto_224686 ) ( IN-CITY ?auto_224678 ?auto_224686 ) ( not ( = ?auto_224678 ?auto_224685 ) ) ( OBJ-AT ?auto_224681 ?auto_224678 ) ( not ( = ?auto_224681 ?auto_224683 ) ) ( OBJ-AT ?auto_224679 ?auto_224678 ) ( OBJ-AT ?auto_224680 ?auto_224678 ) ( OBJ-AT ?auto_224682 ?auto_224678 ) ( not ( = ?auto_224679 ?auto_224680 ) ) ( not ( = ?auto_224679 ?auto_224682 ) ) ( not ( = ?auto_224679 ?auto_224681 ) ) ( not ( = ?auto_224679 ?auto_224683 ) ) ( not ( = ?auto_224680 ?auto_224682 ) ) ( not ( = ?auto_224680 ?auto_224681 ) ) ( not ( = ?auto_224680 ?auto_224683 ) ) ( not ( = ?auto_224682 ?auto_224681 ) ) ( not ( = ?auto_224682 ?auto_224683 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224681 ?auto_224683 ?auto_224678 )
      ( DELIVER-5PKG-VERIFY ?auto_224679 ?auto_224680 ?auto_224682 ?auto_224681 ?auto_224683 ?auto_224678 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224688 - OBJ
      ?auto_224689 - OBJ
      ?auto_224691 - OBJ
      ?auto_224690 - OBJ
      ?auto_224692 - OBJ
      ?auto_224687 - LOCATION
    )
    :vars
    (
      ?auto_224693 - TRUCK
      ?auto_224694 - LOCATION
      ?auto_224695 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224692 ?auto_224693 ) ( TRUCK-AT ?auto_224693 ?auto_224694 ) ( IN-CITY ?auto_224694 ?auto_224695 ) ( IN-CITY ?auto_224687 ?auto_224695 ) ( not ( = ?auto_224687 ?auto_224694 ) ) ( OBJ-AT ?auto_224691 ?auto_224687 ) ( not ( = ?auto_224691 ?auto_224692 ) ) ( OBJ-AT ?auto_224688 ?auto_224687 ) ( OBJ-AT ?auto_224689 ?auto_224687 ) ( OBJ-AT ?auto_224690 ?auto_224687 ) ( not ( = ?auto_224688 ?auto_224689 ) ) ( not ( = ?auto_224688 ?auto_224691 ) ) ( not ( = ?auto_224688 ?auto_224690 ) ) ( not ( = ?auto_224688 ?auto_224692 ) ) ( not ( = ?auto_224689 ?auto_224691 ) ) ( not ( = ?auto_224689 ?auto_224690 ) ) ( not ( = ?auto_224689 ?auto_224692 ) ) ( not ( = ?auto_224691 ?auto_224690 ) ) ( not ( = ?auto_224690 ?auto_224692 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224691 ?auto_224692 ?auto_224687 )
      ( DELIVER-5PKG-VERIFY ?auto_224688 ?auto_224689 ?auto_224691 ?auto_224690 ?auto_224692 ?auto_224687 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224706 - OBJ
      ?auto_224707 - OBJ
      ?auto_224709 - OBJ
      ?auto_224708 - OBJ
      ?auto_224710 - OBJ
      ?auto_224705 - LOCATION
    )
    :vars
    (
      ?auto_224711 - TRUCK
      ?auto_224712 - LOCATION
      ?auto_224713 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224708 ?auto_224711 ) ( TRUCK-AT ?auto_224711 ?auto_224712 ) ( IN-CITY ?auto_224712 ?auto_224713 ) ( IN-CITY ?auto_224705 ?auto_224713 ) ( not ( = ?auto_224705 ?auto_224712 ) ) ( OBJ-AT ?auto_224706 ?auto_224705 ) ( not ( = ?auto_224706 ?auto_224708 ) ) ( OBJ-AT ?auto_224707 ?auto_224705 ) ( OBJ-AT ?auto_224709 ?auto_224705 ) ( OBJ-AT ?auto_224710 ?auto_224705 ) ( not ( = ?auto_224706 ?auto_224707 ) ) ( not ( = ?auto_224706 ?auto_224709 ) ) ( not ( = ?auto_224706 ?auto_224710 ) ) ( not ( = ?auto_224707 ?auto_224709 ) ) ( not ( = ?auto_224707 ?auto_224708 ) ) ( not ( = ?auto_224707 ?auto_224710 ) ) ( not ( = ?auto_224709 ?auto_224708 ) ) ( not ( = ?auto_224709 ?auto_224710 ) ) ( not ( = ?auto_224708 ?auto_224710 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224706 ?auto_224708 ?auto_224705 )
      ( DELIVER-5PKG-VERIFY ?auto_224706 ?auto_224707 ?auto_224709 ?auto_224708 ?auto_224710 ?auto_224705 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224796 - OBJ
      ?auto_224797 - OBJ
      ?auto_224799 - OBJ
      ?auto_224798 - OBJ
      ?auto_224800 - OBJ
      ?auto_224795 - LOCATION
    )
    :vars
    (
      ?auto_224801 - TRUCK
      ?auto_224802 - LOCATION
      ?auto_224803 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224799 ?auto_224801 ) ( TRUCK-AT ?auto_224801 ?auto_224802 ) ( IN-CITY ?auto_224802 ?auto_224803 ) ( IN-CITY ?auto_224795 ?auto_224803 ) ( not ( = ?auto_224795 ?auto_224802 ) ) ( OBJ-AT ?auto_224800 ?auto_224795 ) ( not ( = ?auto_224800 ?auto_224799 ) ) ( OBJ-AT ?auto_224796 ?auto_224795 ) ( OBJ-AT ?auto_224797 ?auto_224795 ) ( OBJ-AT ?auto_224798 ?auto_224795 ) ( not ( = ?auto_224796 ?auto_224797 ) ) ( not ( = ?auto_224796 ?auto_224799 ) ) ( not ( = ?auto_224796 ?auto_224798 ) ) ( not ( = ?auto_224796 ?auto_224800 ) ) ( not ( = ?auto_224797 ?auto_224799 ) ) ( not ( = ?auto_224797 ?auto_224798 ) ) ( not ( = ?auto_224797 ?auto_224800 ) ) ( not ( = ?auto_224799 ?auto_224798 ) ) ( not ( = ?auto_224798 ?auto_224800 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224800 ?auto_224799 ?auto_224795 )
      ( DELIVER-5PKG-VERIFY ?auto_224796 ?auto_224797 ?auto_224799 ?auto_224798 ?auto_224800 ?auto_224795 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224850 - OBJ
      ?auto_224851 - OBJ
      ?auto_224853 - OBJ
      ?auto_224852 - OBJ
      ?auto_224854 - OBJ
      ?auto_224849 - LOCATION
    )
    :vars
    (
      ?auto_224855 - TRUCK
      ?auto_224856 - LOCATION
      ?auto_224857 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224851 ?auto_224855 ) ( TRUCK-AT ?auto_224855 ?auto_224856 ) ( IN-CITY ?auto_224856 ?auto_224857 ) ( IN-CITY ?auto_224849 ?auto_224857 ) ( not ( = ?auto_224849 ?auto_224856 ) ) ( OBJ-AT ?auto_224850 ?auto_224849 ) ( not ( = ?auto_224850 ?auto_224851 ) ) ( OBJ-AT ?auto_224853 ?auto_224849 ) ( OBJ-AT ?auto_224852 ?auto_224849 ) ( OBJ-AT ?auto_224854 ?auto_224849 ) ( not ( = ?auto_224850 ?auto_224853 ) ) ( not ( = ?auto_224850 ?auto_224852 ) ) ( not ( = ?auto_224850 ?auto_224854 ) ) ( not ( = ?auto_224851 ?auto_224853 ) ) ( not ( = ?auto_224851 ?auto_224852 ) ) ( not ( = ?auto_224851 ?auto_224854 ) ) ( not ( = ?auto_224853 ?auto_224852 ) ) ( not ( = ?auto_224853 ?auto_224854 ) ) ( not ( = ?auto_224852 ?auto_224854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224850 ?auto_224851 ?auto_224849 )
      ( DELIVER-5PKG-VERIFY ?auto_224850 ?auto_224851 ?auto_224853 ?auto_224852 ?auto_224854 ?auto_224849 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224859 - OBJ
      ?auto_224860 - OBJ
      ?auto_224862 - OBJ
      ?auto_224861 - OBJ
      ?auto_224863 - OBJ
      ?auto_224858 - LOCATION
    )
    :vars
    (
      ?auto_224864 - TRUCK
      ?auto_224865 - LOCATION
      ?auto_224866 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224860 ?auto_224864 ) ( TRUCK-AT ?auto_224864 ?auto_224865 ) ( IN-CITY ?auto_224865 ?auto_224866 ) ( IN-CITY ?auto_224858 ?auto_224866 ) ( not ( = ?auto_224858 ?auto_224865 ) ) ( OBJ-AT ?auto_224862 ?auto_224858 ) ( not ( = ?auto_224862 ?auto_224860 ) ) ( OBJ-AT ?auto_224859 ?auto_224858 ) ( OBJ-AT ?auto_224861 ?auto_224858 ) ( OBJ-AT ?auto_224863 ?auto_224858 ) ( not ( = ?auto_224859 ?auto_224860 ) ) ( not ( = ?auto_224859 ?auto_224862 ) ) ( not ( = ?auto_224859 ?auto_224861 ) ) ( not ( = ?auto_224859 ?auto_224863 ) ) ( not ( = ?auto_224860 ?auto_224861 ) ) ( not ( = ?auto_224860 ?auto_224863 ) ) ( not ( = ?auto_224862 ?auto_224861 ) ) ( not ( = ?auto_224862 ?auto_224863 ) ) ( not ( = ?auto_224861 ?auto_224863 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224862 ?auto_224860 ?auto_224858 )
      ( DELIVER-5PKG-VERIFY ?auto_224859 ?auto_224860 ?auto_224862 ?auto_224861 ?auto_224863 ?auto_224858 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225318 - OBJ
      ?auto_225319 - OBJ
      ?auto_225321 - OBJ
      ?auto_225320 - OBJ
      ?auto_225322 - OBJ
      ?auto_225317 - LOCATION
    )
    :vars
    (
      ?auto_225324 - TRUCK
      ?auto_225325 - LOCATION
      ?auto_225326 - CITY
      ?auto_225323 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225322 ?auto_225324 ) ( TRUCK-AT ?auto_225324 ?auto_225325 ) ( IN-CITY ?auto_225325 ?auto_225326 ) ( IN-CITY ?auto_225317 ?auto_225326 ) ( not ( = ?auto_225317 ?auto_225325 ) ) ( OBJ-AT ?auto_225323 ?auto_225317 ) ( not ( = ?auto_225323 ?auto_225322 ) ) ( OBJ-AT ?auto_225318 ?auto_225317 ) ( OBJ-AT ?auto_225319 ?auto_225317 ) ( OBJ-AT ?auto_225321 ?auto_225317 ) ( OBJ-AT ?auto_225320 ?auto_225317 ) ( not ( = ?auto_225318 ?auto_225319 ) ) ( not ( = ?auto_225318 ?auto_225321 ) ) ( not ( = ?auto_225318 ?auto_225320 ) ) ( not ( = ?auto_225318 ?auto_225322 ) ) ( not ( = ?auto_225318 ?auto_225323 ) ) ( not ( = ?auto_225319 ?auto_225321 ) ) ( not ( = ?auto_225319 ?auto_225320 ) ) ( not ( = ?auto_225319 ?auto_225322 ) ) ( not ( = ?auto_225319 ?auto_225323 ) ) ( not ( = ?auto_225321 ?auto_225320 ) ) ( not ( = ?auto_225321 ?auto_225322 ) ) ( not ( = ?auto_225321 ?auto_225323 ) ) ( not ( = ?auto_225320 ?auto_225322 ) ) ( not ( = ?auto_225320 ?auto_225323 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225323 ?auto_225322 ?auto_225317 )
      ( DELIVER-5PKG-VERIFY ?auto_225318 ?auto_225319 ?auto_225321 ?auto_225320 ?auto_225322 ?auto_225317 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225328 - OBJ
      ?auto_225329 - OBJ
      ?auto_225331 - OBJ
      ?auto_225330 - OBJ
      ?auto_225332 - OBJ
      ?auto_225327 - LOCATION
    )
    :vars
    (
      ?auto_225333 - TRUCK
      ?auto_225334 - LOCATION
      ?auto_225335 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225330 ?auto_225333 ) ( TRUCK-AT ?auto_225333 ?auto_225334 ) ( IN-CITY ?auto_225334 ?auto_225335 ) ( IN-CITY ?auto_225327 ?auto_225335 ) ( not ( = ?auto_225327 ?auto_225334 ) ) ( OBJ-AT ?auto_225332 ?auto_225327 ) ( not ( = ?auto_225332 ?auto_225330 ) ) ( OBJ-AT ?auto_225328 ?auto_225327 ) ( OBJ-AT ?auto_225329 ?auto_225327 ) ( OBJ-AT ?auto_225331 ?auto_225327 ) ( not ( = ?auto_225328 ?auto_225329 ) ) ( not ( = ?auto_225328 ?auto_225331 ) ) ( not ( = ?auto_225328 ?auto_225330 ) ) ( not ( = ?auto_225328 ?auto_225332 ) ) ( not ( = ?auto_225329 ?auto_225331 ) ) ( not ( = ?auto_225329 ?auto_225330 ) ) ( not ( = ?auto_225329 ?auto_225332 ) ) ( not ( = ?auto_225331 ?auto_225330 ) ) ( not ( = ?auto_225331 ?auto_225332 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225332 ?auto_225330 ?auto_225327 )
      ( DELIVER-5PKG-VERIFY ?auto_225328 ?auto_225329 ?auto_225331 ?auto_225330 ?auto_225332 ?auto_225327 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225337 - OBJ
      ?auto_225338 - OBJ
      ?auto_225340 - OBJ
      ?auto_225339 - OBJ
      ?auto_225341 - OBJ
      ?auto_225336 - LOCATION
    )
    :vars
    (
      ?auto_225343 - TRUCK
      ?auto_225344 - LOCATION
      ?auto_225345 - CITY
      ?auto_225342 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225339 ?auto_225343 ) ( TRUCK-AT ?auto_225343 ?auto_225344 ) ( IN-CITY ?auto_225344 ?auto_225345 ) ( IN-CITY ?auto_225336 ?auto_225345 ) ( not ( = ?auto_225336 ?auto_225344 ) ) ( OBJ-AT ?auto_225342 ?auto_225336 ) ( not ( = ?auto_225342 ?auto_225339 ) ) ( OBJ-AT ?auto_225337 ?auto_225336 ) ( OBJ-AT ?auto_225338 ?auto_225336 ) ( OBJ-AT ?auto_225340 ?auto_225336 ) ( OBJ-AT ?auto_225341 ?auto_225336 ) ( not ( = ?auto_225337 ?auto_225338 ) ) ( not ( = ?auto_225337 ?auto_225340 ) ) ( not ( = ?auto_225337 ?auto_225339 ) ) ( not ( = ?auto_225337 ?auto_225341 ) ) ( not ( = ?auto_225337 ?auto_225342 ) ) ( not ( = ?auto_225338 ?auto_225340 ) ) ( not ( = ?auto_225338 ?auto_225339 ) ) ( not ( = ?auto_225338 ?auto_225341 ) ) ( not ( = ?auto_225338 ?auto_225342 ) ) ( not ( = ?auto_225340 ?auto_225339 ) ) ( not ( = ?auto_225340 ?auto_225341 ) ) ( not ( = ?auto_225340 ?auto_225342 ) ) ( not ( = ?auto_225339 ?auto_225341 ) ) ( not ( = ?auto_225341 ?auto_225342 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225342 ?auto_225339 ?auto_225336 )
      ( DELIVER-5PKG-VERIFY ?auto_225337 ?auto_225338 ?auto_225340 ?auto_225339 ?auto_225341 ?auto_225336 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225393 - OBJ
      ?auto_225394 - OBJ
      ?auto_225396 - OBJ
      ?auto_225395 - OBJ
      ?auto_225397 - OBJ
      ?auto_225392 - LOCATION
    )
    :vars
    (
      ?auto_225399 - TRUCK
      ?auto_225400 - LOCATION
      ?auto_225401 - CITY
      ?auto_225398 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225396 ?auto_225399 ) ( TRUCK-AT ?auto_225399 ?auto_225400 ) ( IN-CITY ?auto_225400 ?auto_225401 ) ( IN-CITY ?auto_225392 ?auto_225401 ) ( not ( = ?auto_225392 ?auto_225400 ) ) ( OBJ-AT ?auto_225398 ?auto_225392 ) ( not ( = ?auto_225398 ?auto_225396 ) ) ( OBJ-AT ?auto_225393 ?auto_225392 ) ( OBJ-AT ?auto_225394 ?auto_225392 ) ( OBJ-AT ?auto_225395 ?auto_225392 ) ( OBJ-AT ?auto_225397 ?auto_225392 ) ( not ( = ?auto_225393 ?auto_225394 ) ) ( not ( = ?auto_225393 ?auto_225396 ) ) ( not ( = ?auto_225393 ?auto_225395 ) ) ( not ( = ?auto_225393 ?auto_225397 ) ) ( not ( = ?auto_225393 ?auto_225398 ) ) ( not ( = ?auto_225394 ?auto_225396 ) ) ( not ( = ?auto_225394 ?auto_225395 ) ) ( not ( = ?auto_225394 ?auto_225397 ) ) ( not ( = ?auto_225394 ?auto_225398 ) ) ( not ( = ?auto_225396 ?auto_225395 ) ) ( not ( = ?auto_225396 ?auto_225397 ) ) ( not ( = ?auto_225395 ?auto_225397 ) ) ( not ( = ?auto_225395 ?auto_225398 ) ) ( not ( = ?auto_225397 ?auto_225398 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225398 ?auto_225396 ?auto_225392 )
      ( DELIVER-5PKG-VERIFY ?auto_225393 ?auto_225394 ?auto_225396 ?auto_225395 ?auto_225397 ?auto_225392 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225451 - OBJ
      ?auto_225452 - OBJ
      ?auto_225454 - OBJ
      ?auto_225453 - OBJ
      ?auto_225455 - OBJ
      ?auto_225450 - LOCATION
    )
    :vars
    (
      ?auto_225456 - TRUCK
      ?auto_225457 - LOCATION
      ?auto_225458 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225452 ?auto_225456 ) ( TRUCK-AT ?auto_225456 ?auto_225457 ) ( IN-CITY ?auto_225457 ?auto_225458 ) ( IN-CITY ?auto_225450 ?auto_225458 ) ( not ( = ?auto_225450 ?auto_225457 ) ) ( OBJ-AT ?auto_225453 ?auto_225450 ) ( not ( = ?auto_225453 ?auto_225452 ) ) ( OBJ-AT ?auto_225451 ?auto_225450 ) ( OBJ-AT ?auto_225454 ?auto_225450 ) ( OBJ-AT ?auto_225455 ?auto_225450 ) ( not ( = ?auto_225451 ?auto_225452 ) ) ( not ( = ?auto_225451 ?auto_225454 ) ) ( not ( = ?auto_225451 ?auto_225453 ) ) ( not ( = ?auto_225451 ?auto_225455 ) ) ( not ( = ?auto_225452 ?auto_225454 ) ) ( not ( = ?auto_225452 ?auto_225455 ) ) ( not ( = ?auto_225454 ?auto_225453 ) ) ( not ( = ?auto_225454 ?auto_225455 ) ) ( not ( = ?auto_225453 ?auto_225455 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225453 ?auto_225452 ?auto_225450 )
      ( DELIVER-5PKG-VERIFY ?auto_225451 ?auto_225452 ?auto_225454 ?auto_225453 ?auto_225455 ?auto_225450 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225559 - OBJ
      ?auto_225560 - OBJ
      ?auto_225562 - OBJ
      ?auto_225561 - OBJ
      ?auto_225563 - OBJ
      ?auto_225558 - LOCATION
    )
    :vars
    (
      ?auto_225565 - TRUCK
      ?auto_225566 - LOCATION
      ?auto_225567 - CITY
      ?auto_225564 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225560 ?auto_225565 ) ( TRUCK-AT ?auto_225565 ?auto_225566 ) ( IN-CITY ?auto_225566 ?auto_225567 ) ( IN-CITY ?auto_225558 ?auto_225567 ) ( not ( = ?auto_225558 ?auto_225566 ) ) ( OBJ-AT ?auto_225564 ?auto_225558 ) ( not ( = ?auto_225564 ?auto_225560 ) ) ( OBJ-AT ?auto_225559 ?auto_225558 ) ( OBJ-AT ?auto_225562 ?auto_225558 ) ( OBJ-AT ?auto_225561 ?auto_225558 ) ( OBJ-AT ?auto_225563 ?auto_225558 ) ( not ( = ?auto_225559 ?auto_225560 ) ) ( not ( = ?auto_225559 ?auto_225562 ) ) ( not ( = ?auto_225559 ?auto_225561 ) ) ( not ( = ?auto_225559 ?auto_225563 ) ) ( not ( = ?auto_225559 ?auto_225564 ) ) ( not ( = ?auto_225560 ?auto_225562 ) ) ( not ( = ?auto_225560 ?auto_225561 ) ) ( not ( = ?auto_225560 ?auto_225563 ) ) ( not ( = ?auto_225562 ?auto_225561 ) ) ( not ( = ?auto_225562 ?auto_225563 ) ) ( not ( = ?auto_225562 ?auto_225564 ) ) ( not ( = ?auto_225561 ?auto_225563 ) ) ( not ( = ?auto_225561 ?auto_225564 ) ) ( not ( = ?auto_225563 ?auto_225564 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225564 ?auto_225560 ?auto_225558 )
      ( DELIVER-5PKG-VERIFY ?auto_225559 ?auto_225560 ?auto_225562 ?auto_225561 ?auto_225563 ?auto_225558 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225720 - OBJ
      ?auto_225721 - OBJ
      ?auto_225723 - OBJ
      ?auto_225722 - OBJ
      ?auto_225724 - OBJ
      ?auto_225719 - LOCATION
    )
    :vars
    (
      ?auto_225725 - TRUCK
      ?auto_225726 - LOCATION
      ?auto_225727 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225720 ?auto_225725 ) ( TRUCK-AT ?auto_225725 ?auto_225726 ) ( IN-CITY ?auto_225726 ?auto_225727 ) ( IN-CITY ?auto_225719 ?auto_225727 ) ( not ( = ?auto_225719 ?auto_225726 ) ) ( OBJ-AT ?auto_225724 ?auto_225719 ) ( not ( = ?auto_225724 ?auto_225720 ) ) ( OBJ-AT ?auto_225721 ?auto_225719 ) ( OBJ-AT ?auto_225723 ?auto_225719 ) ( OBJ-AT ?auto_225722 ?auto_225719 ) ( not ( = ?auto_225720 ?auto_225721 ) ) ( not ( = ?auto_225720 ?auto_225723 ) ) ( not ( = ?auto_225720 ?auto_225722 ) ) ( not ( = ?auto_225721 ?auto_225723 ) ) ( not ( = ?auto_225721 ?auto_225722 ) ) ( not ( = ?auto_225721 ?auto_225724 ) ) ( not ( = ?auto_225723 ?auto_225722 ) ) ( not ( = ?auto_225723 ?auto_225724 ) ) ( not ( = ?auto_225722 ?auto_225724 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225724 ?auto_225720 ?auto_225719 )
      ( DELIVER-5PKG-VERIFY ?auto_225720 ?auto_225721 ?auto_225723 ?auto_225722 ?auto_225724 ?auto_225719 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225729 - OBJ
      ?auto_225730 - OBJ
      ?auto_225732 - OBJ
      ?auto_225731 - OBJ
      ?auto_225733 - OBJ
      ?auto_225728 - LOCATION
    )
    :vars
    (
      ?auto_225734 - TRUCK
      ?auto_225735 - LOCATION
      ?auto_225736 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225729 ?auto_225734 ) ( TRUCK-AT ?auto_225734 ?auto_225735 ) ( IN-CITY ?auto_225735 ?auto_225736 ) ( IN-CITY ?auto_225728 ?auto_225736 ) ( not ( = ?auto_225728 ?auto_225735 ) ) ( OBJ-AT ?auto_225732 ?auto_225728 ) ( not ( = ?auto_225732 ?auto_225729 ) ) ( OBJ-AT ?auto_225730 ?auto_225728 ) ( OBJ-AT ?auto_225731 ?auto_225728 ) ( OBJ-AT ?auto_225733 ?auto_225728 ) ( not ( = ?auto_225729 ?auto_225730 ) ) ( not ( = ?auto_225729 ?auto_225731 ) ) ( not ( = ?auto_225729 ?auto_225733 ) ) ( not ( = ?auto_225730 ?auto_225732 ) ) ( not ( = ?auto_225730 ?auto_225731 ) ) ( not ( = ?auto_225730 ?auto_225733 ) ) ( not ( = ?auto_225732 ?auto_225731 ) ) ( not ( = ?auto_225732 ?auto_225733 ) ) ( not ( = ?auto_225731 ?auto_225733 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225732 ?auto_225729 ?auto_225728 )
      ( DELIVER-5PKG-VERIFY ?auto_225729 ?auto_225730 ?auto_225732 ?auto_225731 ?auto_225733 ?auto_225728 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225774 - OBJ
      ?auto_225775 - OBJ
      ?auto_225777 - OBJ
      ?auto_225776 - OBJ
      ?auto_225778 - OBJ
      ?auto_225773 - LOCATION
    )
    :vars
    (
      ?auto_225779 - TRUCK
      ?auto_225780 - LOCATION
      ?auto_225781 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225774 ?auto_225779 ) ( TRUCK-AT ?auto_225779 ?auto_225780 ) ( IN-CITY ?auto_225780 ?auto_225781 ) ( IN-CITY ?auto_225773 ?auto_225781 ) ( not ( = ?auto_225773 ?auto_225780 ) ) ( OBJ-AT ?auto_225776 ?auto_225773 ) ( not ( = ?auto_225776 ?auto_225774 ) ) ( OBJ-AT ?auto_225775 ?auto_225773 ) ( OBJ-AT ?auto_225777 ?auto_225773 ) ( OBJ-AT ?auto_225778 ?auto_225773 ) ( not ( = ?auto_225774 ?auto_225775 ) ) ( not ( = ?auto_225774 ?auto_225777 ) ) ( not ( = ?auto_225774 ?auto_225778 ) ) ( not ( = ?auto_225775 ?auto_225777 ) ) ( not ( = ?auto_225775 ?auto_225776 ) ) ( not ( = ?auto_225775 ?auto_225778 ) ) ( not ( = ?auto_225777 ?auto_225776 ) ) ( not ( = ?auto_225777 ?auto_225778 ) ) ( not ( = ?auto_225776 ?auto_225778 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225776 ?auto_225774 ?auto_225773 )
      ( DELIVER-5PKG-VERIFY ?auto_225774 ?auto_225775 ?auto_225777 ?auto_225776 ?auto_225778 ?auto_225773 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226053 - OBJ
      ?auto_226054 - OBJ
      ?auto_226056 - OBJ
      ?auto_226055 - OBJ
      ?auto_226057 - OBJ
      ?auto_226052 - LOCATION
    )
    :vars
    (
      ?auto_226059 - TRUCK
      ?auto_226060 - LOCATION
      ?auto_226061 - CITY
      ?auto_226058 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_226053 ?auto_226059 ) ( TRUCK-AT ?auto_226059 ?auto_226060 ) ( IN-CITY ?auto_226060 ?auto_226061 ) ( IN-CITY ?auto_226052 ?auto_226061 ) ( not ( = ?auto_226052 ?auto_226060 ) ) ( OBJ-AT ?auto_226058 ?auto_226052 ) ( not ( = ?auto_226058 ?auto_226053 ) ) ( OBJ-AT ?auto_226054 ?auto_226052 ) ( OBJ-AT ?auto_226056 ?auto_226052 ) ( OBJ-AT ?auto_226055 ?auto_226052 ) ( OBJ-AT ?auto_226057 ?auto_226052 ) ( not ( = ?auto_226053 ?auto_226054 ) ) ( not ( = ?auto_226053 ?auto_226056 ) ) ( not ( = ?auto_226053 ?auto_226055 ) ) ( not ( = ?auto_226053 ?auto_226057 ) ) ( not ( = ?auto_226054 ?auto_226056 ) ) ( not ( = ?auto_226054 ?auto_226055 ) ) ( not ( = ?auto_226054 ?auto_226057 ) ) ( not ( = ?auto_226054 ?auto_226058 ) ) ( not ( = ?auto_226056 ?auto_226055 ) ) ( not ( = ?auto_226056 ?auto_226057 ) ) ( not ( = ?auto_226056 ?auto_226058 ) ) ( not ( = ?auto_226055 ?auto_226057 ) ) ( not ( = ?auto_226055 ?auto_226058 ) ) ( not ( = ?auto_226057 ?auto_226058 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226058 ?auto_226053 ?auto_226052 )
      ( DELIVER-5PKG-VERIFY ?auto_226053 ?auto_226054 ?auto_226056 ?auto_226055 ?auto_226057 ?auto_226052 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226480 - OBJ
      ?auto_226481 - OBJ
      ?auto_226482 - OBJ
      ?auto_226479 - LOCATION
    )
    :vars
    (
      ?auto_226484 - TRUCK
      ?auto_226485 - LOCATION
      ?auto_226483 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226484 ?auto_226485 ) ( IN-CITY ?auto_226485 ?auto_226483 ) ( IN-CITY ?auto_226479 ?auto_226483 ) ( not ( = ?auto_226479 ?auto_226485 ) ) ( OBJ-AT ?auto_226480 ?auto_226479 ) ( not ( = ?auto_226480 ?auto_226481 ) ) ( OBJ-AT ?auto_226481 ?auto_226485 ) ( OBJ-AT ?auto_226482 ?auto_226479 ) ( not ( = ?auto_226480 ?auto_226482 ) ) ( not ( = ?auto_226481 ?auto_226482 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226480 ?auto_226481 ?auto_226479 )
      ( DELIVER-3PKG-VERIFY ?auto_226480 ?auto_226481 ?auto_226482 ?auto_226479 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226502 - OBJ
      ?auto_226503 - OBJ
      ?auto_226504 - OBJ
      ?auto_226501 - LOCATION
    )
    :vars
    (
      ?auto_226507 - TRUCK
      ?auto_226508 - LOCATION
      ?auto_226505 - CITY
      ?auto_226506 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226507 ?auto_226508 ) ( IN-CITY ?auto_226508 ?auto_226505 ) ( IN-CITY ?auto_226501 ?auto_226505 ) ( not ( = ?auto_226501 ?auto_226508 ) ) ( OBJ-AT ?auto_226506 ?auto_226501 ) ( not ( = ?auto_226506 ?auto_226504 ) ) ( OBJ-AT ?auto_226504 ?auto_226508 ) ( OBJ-AT ?auto_226502 ?auto_226501 ) ( OBJ-AT ?auto_226503 ?auto_226501 ) ( not ( = ?auto_226502 ?auto_226503 ) ) ( not ( = ?auto_226502 ?auto_226504 ) ) ( not ( = ?auto_226502 ?auto_226506 ) ) ( not ( = ?auto_226503 ?auto_226504 ) ) ( not ( = ?auto_226503 ?auto_226506 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226506 ?auto_226504 ?auto_226501 )
      ( DELIVER-3PKG-VERIFY ?auto_226502 ?auto_226503 ?auto_226504 ?auto_226501 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226514 - OBJ
      ?auto_226515 - OBJ
      ?auto_226516 - OBJ
      ?auto_226513 - LOCATION
    )
    :vars
    (
      ?auto_226519 - TRUCK
      ?auto_226520 - LOCATION
      ?auto_226517 - CITY
      ?auto_226518 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226519 ?auto_226520 ) ( IN-CITY ?auto_226520 ?auto_226517 ) ( IN-CITY ?auto_226513 ?auto_226517 ) ( not ( = ?auto_226513 ?auto_226520 ) ) ( OBJ-AT ?auto_226518 ?auto_226513 ) ( not ( = ?auto_226518 ?auto_226515 ) ) ( OBJ-AT ?auto_226515 ?auto_226520 ) ( OBJ-AT ?auto_226514 ?auto_226513 ) ( OBJ-AT ?auto_226516 ?auto_226513 ) ( not ( = ?auto_226514 ?auto_226515 ) ) ( not ( = ?auto_226514 ?auto_226516 ) ) ( not ( = ?auto_226514 ?auto_226518 ) ) ( not ( = ?auto_226515 ?auto_226516 ) ) ( not ( = ?auto_226516 ?auto_226518 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226518 ?auto_226515 ?auto_226513 )
      ( DELIVER-3PKG-VERIFY ?auto_226514 ?auto_226515 ?auto_226516 ?auto_226513 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226552 - OBJ
      ?auto_226553 - OBJ
      ?auto_226554 - OBJ
      ?auto_226551 - LOCATION
    )
    :vars
    (
      ?auto_226557 - TRUCK
      ?auto_226558 - LOCATION
      ?auto_226555 - CITY
      ?auto_226556 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226557 ?auto_226558 ) ( IN-CITY ?auto_226558 ?auto_226555 ) ( IN-CITY ?auto_226551 ?auto_226555 ) ( not ( = ?auto_226551 ?auto_226558 ) ) ( OBJ-AT ?auto_226556 ?auto_226551 ) ( not ( = ?auto_226556 ?auto_226552 ) ) ( OBJ-AT ?auto_226552 ?auto_226558 ) ( OBJ-AT ?auto_226553 ?auto_226551 ) ( OBJ-AT ?auto_226554 ?auto_226551 ) ( not ( = ?auto_226552 ?auto_226553 ) ) ( not ( = ?auto_226552 ?auto_226554 ) ) ( not ( = ?auto_226553 ?auto_226554 ) ) ( not ( = ?auto_226553 ?auto_226556 ) ) ( not ( = ?auto_226554 ?auto_226556 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226556 ?auto_226552 ?auto_226551 )
      ( DELIVER-3PKG-VERIFY ?auto_226552 ?auto_226553 ?auto_226554 ?auto_226551 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226599 - OBJ
      ?auto_226600 - OBJ
      ?auto_226602 - OBJ
      ?auto_226601 - OBJ
      ?auto_226598 - LOCATION
    )
    :vars
    (
      ?auto_226604 - TRUCK
      ?auto_226605 - LOCATION
      ?auto_226603 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226604 ?auto_226605 ) ( IN-CITY ?auto_226605 ?auto_226603 ) ( IN-CITY ?auto_226598 ?auto_226603 ) ( not ( = ?auto_226598 ?auto_226605 ) ) ( OBJ-AT ?auto_226599 ?auto_226598 ) ( not ( = ?auto_226599 ?auto_226601 ) ) ( OBJ-AT ?auto_226601 ?auto_226605 ) ( OBJ-AT ?auto_226600 ?auto_226598 ) ( OBJ-AT ?auto_226602 ?auto_226598 ) ( not ( = ?auto_226599 ?auto_226600 ) ) ( not ( = ?auto_226599 ?auto_226602 ) ) ( not ( = ?auto_226600 ?auto_226602 ) ) ( not ( = ?auto_226600 ?auto_226601 ) ) ( not ( = ?auto_226602 ?auto_226601 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226599 ?auto_226601 ?auto_226598 )
      ( DELIVER-4PKG-VERIFY ?auto_226599 ?auto_226600 ?auto_226602 ?auto_226601 ?auto_226598 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226607 - OBJ
      ?auto_226608 - OBJ
      ?auto_226610 - OBJ
      ?auto_226609 - OBJ
      ?auto_226606 - LOCATION
    )
    :vars
    (
      ?auto_226612 - TRUCK
      ?auto_226613 - LOCATION
      ?auto_226611 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226612 ?auto_226613 ) ( IN-CITY ?auto_226613 ?auto_226611 ) ( IN-CITY ?auto_226606 ?auto_226611 ) ( not ( = ?auto_226606 ?auto_226613 ) ) ( OBJ-AT ?auto_226609 ?auto_226606 ) ( not ( = ?auto_226609 ?auto_226610 ) ) ( OBJ-AT ?auto_226610 ?auto_226613 ) ( OBJ-AT ?auto_226607 ?auto_226606 ) ( OBJ-AT ?auto_226608 ?auto_226606 ) ( not ( = ?auto_226607 ?auto_226608 ) ) ( not ( = ?auto_226607 ?auto_226610 ) ) ( not ( = ?auto_226607 ?auto_226609 ) ) ( not ( = ?auto_226608 ?auto_226610 ) ) ( not ( = ?auto_226608 ?auto_226609 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226609 ?auto_226610 ?auto_226606 )
      ( DELIVER-4PKG-VERIFY ?auto_226607 ?auto_226608 ?auto_226610 ?auto_226609 ?auto_226606 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226679 - OBJ
      ?auto_226680 - OBJ
      ?auto_226682 - OBJ
      ?auto_226681 - OBJ
      ?auto_226678 - LOCATION
    )
    :vars
    (
      ?auto_226684 - TRUCK
      ?auto_226685 - LOCATION
      ?auto_226683 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226684 ?auto_226685 ) ( IN-CITY ?auto_226685 ?auto_226683 ) ( IN-CITY ?auto_226678 ?auto_226683 ) ( not ( = ?auto_226678 ?auto_226685 ) ) ( OBJ-AT ?auto_226679 ?auto_226678 ) ( not ( = ?auto_226679 ?auto_226680 ) ) ( OBJ-AT ?auto_226680 ?auto_226685 ) ( OBJ-AT ?auto_226682 ?auto_226678 ) ( OBJ-AT ?auto_226681 ?auto_226678 ) ( not ( = ?auto_226679 ?auto_226682 ) ) ( not ( = ?auto_226679 ?auto_226681 ) ) ( not ( = ?auto_226680 ?auto_226682 ) ) ( not ( = ?auto_226680 ?auto_226681 ) ) ( not ( = ?auto_226682 ?auto_226681 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226679 ?auto_226680 ?auto_226678 )
      ( DELIVER-4PKG-VERIFY ?auto_226679 ?auto_226680 ?auto_226682 ?auto_226681 ?auto_226678 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226743 - OBJ
      ?auto_226744 - OBJ
      ?auto_226746 - OBJ
      ?auto_226745 - OBJ
      ?auto_226742 - LOCATION
    )
    :vars
    (
      ?auto_226748 - TRUCK
      ?auto_226749 - LOCATION
      ?auto_226747 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226748 ?auto_226749 ) ( IN-CITY ?auto_226749 ?auto_226747 ) ( IN-CITY ?auto_226742 ?auto_226747 ) ( not ( = ?auto_226742 ?auto_226749 ) ) ( OBJ-AT ?auto_226746 ?auto_226742 ) ( not ( = ?auto_226746 ?auto_226745 ) ) ( OBJ-AT ?auto_226745 ?auto_226749 ) ( OBJ-AT ?auto_226743 ?auto_226742 ) ( OBJ-AT ?auto_226744 ?auto_226742 ) ( not ( = ?auto_226743 ?auto_226744 ) ) ( not ( = ?auto_226743 ?auto_226746 ) ) ( not ( = ?auto_226743 ?auto_226745 ) ) ( not ( = ?auto_226744 ?auto_226746 ) ) ( not ( = ?auto_226744 ?auto_226745 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226746 ?auto_226745 ?auto_226742 )
      ( DELIVER-4PKG-VERIFY ?auto_226743 ?auto_226744 ?auto_226746 ?auto_226745 ?auto_226742 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226759 - OBJ
      ?auto_226760 - OBJ
      ?auto_226762 - OBJ
      ?auto_226761 - OBJ
      ?auto_226758 - LOCATION
    )
    :vars
    (
      ?auto_226764 - TRUCK
      ?auto_226765 - LOCATION
      ?auto_226763 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226764 ?auto_226765 ) ( IN-CITY ?auto_226765 ?auto_226763 ) ( IN-CITY ?auto_226758 ?auto_226763 ) ( not ( = ?auto_226758 ?auto_226765 ) ) ( OBJ-AT ?auto_226760 ?auto_226758 ) ( not ( = ?auto_226760 ?auto_226762 ) ) ( OBJ-AT ?auto_226762 ?auto_226765 ) ( OBJ-AT ?auto_226759 ?auto_226758 ) ( OBJ-AT ?auto_226761 ?auto_226758 ) ( not ( = ?auto_226759 ?auto_226760 ) ) ( not ( = ?auto_226759 ?auto_226762 ) ) ( not ( = ?auto_226759 ?auto_226761 ) ) ( not ( = ?auto_226760 ?auto_226761 ) ) ( not ( = ?auto_226762 ?auto_226761 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226760 ?auto_226762 ?auto_226758 )
      ( DELIVER-4PKG-VERIFY ?auto_226759 ?auto_226760 ?auto_226762 ?auto_226761 ?auto_226758 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226791 - OBJ
      ?auto_226792 - OBJ
      ?auto_226794 - OBJ
      ?auto_226793 - OBJ
      ?auto_226790 - LOCATION
    )
    :vars
    (
      ?auto_226797 - TRUCK
      ?auto_226798 - LOCATION
      ?auto_226795 - CITY
      ?auto_226796 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226797 ?auto_226798 ) ( IN-CITY ?auto_226798 ?auto_226795 ) ( IN-CITY ?auto_226790 ?auto_226795 ) ( not ( = ?auto_226790 ?auto_226798 ) ) ( OBJ-AT ?auto_226796 ?auto_226790 ) ( not ( = ?auto_226796 ?auto_226793 ) ) ( OBJ-AT ?auto_226793 ?auto_226798 ) ( OBJ-AT ?auto_226791 ?auto_226790 ) ( OBJ-AT ?auto_226792 ?auto_226790 ) ( OBJ-AT ?auto_226794 ?auto_226790 ) ( not ( = ?auto_226791 ?auto_226792 ) ) ( not ( = ?auto_226791 ?auto_226794 ) ) ( not ( = ?auto_226791 ?auto_226793 ) ) ( not ( = ?auto_226791 ?auto_226796 ) ) ( not ( = ?auto_226792 ?auto_226794 ) ) ( not ( = ?auto_226792 ?auto_226793 ) ) ( not ( = ?auto_226792 ?auto_226796 ) ) ( not ( = ?auto_226794 ?auto_226793 ) ) ( not ( = ?auto_226794 ?auto_226796 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226796 ?auto_226793 ?auto_226790 )
      ( DELIVER-4PKG-VERIFY ?auto_226791 ?auto_226792 ?auto_226794 ?auto_226793 ?auto_226790 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226808 - OBJ
      ?auto_226809 - OBJ
      ?auto_226811 - OBJ
      ?auto_226810 - OBJ
      ?auto_226807 - LOCATION
    )
    :vars
    (
      ?auto_226814 - TRUCK
      ?auto_226815 - LOCATION
      ?auto_226812 - CITY
      ?auto_226813 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226814 ?auto_226815 ) ( IN-CITY ?auto_226815 ?auto_226812 ) ( IN-CITY ?auto_226807 ?auto_226812 ) ( not ( = ?auto_226807 ?auto_226815 ) ) ( OBJ-AT ?auto_226813 ?auto_226807 ) ( not ( = ?auto_226813 ?auto_226811 ) ) ( OBJ-AT ?auto_226811 ?auto_226815 ) ( OBJ-AT ?auto_226808 ?auto_226807 ) ( OBJ-AT ?auto_226809 ?auto_226807 ) ( OBJ-AT ?auto_226810 ?auto_226807 ) ( not ( = ?auto_226808 ?auto_226809 ) ) ( not ( = ?auto_226808 ?auto_226811 ) ) ( not ( = ?auto_226808 ?auto_226810 ) ) ( not ( = ?auto_226808 ?auto_226813 ) ) ( not ( = ?auto_226809 ?auto_226811 ) ) ( not ( = ?auto_226809 ?auto_226810 ) ) ( not ( = ?auto_226809 ?auto_226813 ) ) ( not ( = ?auto_226811 ?auto_226810 ) ) ( not ( = ?auto_226810 ?auto_226813 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226813 ?auto_226811 ?auto_226807 )
      ( DELIVER-4PKG-VERIFY ?auto_226808 ?auto_226809 ?auto_226811 ?auto_226810 ?auto_226807 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226826 - OBJ
      ?auto_226827 - OBJ
      ?auto_226829 - OBJ
      ?auto_226828 - OBJ
      ?auto_226825 - LOCATION
    )
    :vars
    (
      ?auto_226831 - TRUCK
      ?auto_226832 - LOCATION
      ?auto_226830 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226831 ?auto_226832 ) ( IN-CITY ?auto_226832 ?auto_226830 ) ( IN-CITY ?auto_226825 ?auto_226830 ) ( not ( = ?auto_226825 ?auto_226832 ) ) ( OBJ-AT ?auto_226829 ?auto_226825 ) ( not ( = ?auto_226829 ?auto_226827 ) ) ( OBJ-AT ?auto_226827 ?auto_226832 ) ( OBJ-AT ?auto_226826 ?auto_226825 ) ( OBJ-AT ?auto_226828 ?auto_226825 ) ( not ( = ?auto_226826 ?auto_226827 ) ) ( not ( = ?auto_226826 ?auto_226829 ) ) ( not ( = ?auto_226826 ?auto_226828 ) ) ( not ( = ?auto_226827 ?auto_226828 ) ) ( not ( = ?auto_226829 ?auto_226828 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226829 ?auto_226827 ?auto_226825 )
      ( DELIVER-4PKG-VERIFY ?auto_226826 ?auto_226827 ?auto_226829 ?auto_226828 ?auto_226825 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226858 - OBJ
      ?auto_226859 - OBJ
      ?auto_226861 - OBJ
      ?auto_226860 - OBJ
      ?auto_226857 - LOCATION
    )
    :vars
    (
      ?auto_226864 - TRUCK
      ?auto_226865 - LOCATION
      ?auto_226862 - CITY
      ?auto_226863 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226864 ?auto_226865 ) ( IN-CITY ?auto_226865 ?auto_226862 ) ( IN-CITY ?auto_226857 ?auto_226862 ) ( not ( = ?auto_226857 ?auto_226865 ) ) ( OBJ-AT ?auto_226863 ?auto_226857 ) ( not ( = ?auto_226863 ?auto_226859 ) ) ( OBJ-AT ?auto_226859 ?auto_226865 ) ( OBJ-AT ?auto_226858 ?auto_226857 ) ( OBJ-AT ?auto_226861 ?auto_226857 ) ( OBJ-AT ?auto_226860 ?auto_226857 ) ( not ( = ?auto_226858 ?auto_226859 ) ) ( not ( = ?auto_226858 ?auto_226861 ) ) ( not ( = ?auto_226858 ?auto_226860 ) ) ( not ( = ?auto_226858 ?auto_226863 ) ) ( not ( = ?auto_226859 ?auto_226861 ) ) ( not ( = ?auto_226859 ?auto_226860 ) ) ( not ( = ?auto_226861 ?auto_226860 ) ) ( not ( = ?auto_226861 ?auto_226863 ) ) ( not ( = ?auto_226860 ?auto_226863 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226863 ?auto_226859 ?auto_226857 )
      ( DELIVER-4PKG-VERIFY ?auto_226858 ?auto_226859 ?auto_226861 ?auto_226860 ?auto_226857 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226910 - OBJ
      ?auto_226911 - OBJ
      ?auto_226913 - OBJ
      ?auto_226912 - OBJ
      ?auto_226909 - LOCATION
    )
    :vars
    (
      ?auto_226915 - TRUCK
      ?auto_226916 - LOCATION
      ?auto_226914 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226915 ?auto_226916 ) ( IN-CITY ?auto_226916 ?auto_226914 ) ( IN-CITY ?auto_226909 ?auto_226914 ) ( not ( = ?auto_226909 ?auto_226916 ) ) ( OBJ-AT ?auto_226911 ?auto_226909 ) ( not ( = ?auto_226911 ?auto_226910 ) ) ( OBJ-AT ?auto_226910 ?auto_226916 ) ( OBJ-AT ?auto_226913 ?auto_226909 ) ( OBJ-AT ?auto_226912 ?auto_226909 ) ( not ( = ?auto_226910 ?auto_226913 ) ) ( not ( = ?auto_226910 ?auto_226912 ) ) ( not ( = ?auto_226911 ?auto_226913 ) ) ( not ( = ?auto_226911 ?auto_226912 ) ) ( not ( = ?auto_226913 ?auto_226912 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226911 ?auto_226910 ?auto_226909 )
      ( DELIVER-4PKG-VERIFY ?auto_226910 ?auto_226911 ?auto_226913 ?auto_226912 ?auto_226909 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226974 - OBJ
      ?auto_226975 - OBJ
      ?auto_226977 - OBJ
      ?auto_226976 - OBJ
      ?auto_226973 - LOCATION
    )
    :vars
    (
      ?auto_226979 - TRUCK
      ?auto_226980 - LOCATION
      ?auto_226978 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226979 ?auto_226980 ) ( IN-CITY ?auto_226980 ?auto_226978 ) ( IN-CITY ?auto_226973 ?auto_226978 ) ( not ( = ?auto_226973 ?auto_226980 ) ) ( OBJ-AT ?auto_226977 ?auto_226973 ) ( not ( = ?auto_226977 ?auto_226974 ) ) ( OBJ-AT ?auto_226974 ?auto_226980 ) ( OBJ-AT ?auto_226975 ?auto_226973 ) ( OBJ-AT ?auto_226976 ?auto_226973 ) ( not ( = ?auto_226974 ?auto_226975 ) ) ( not ( = ?auto_226974 ?auto_226976 ) ) ( not ( = ?auto_226975 ?auto_226977 ) ) ( not ( = ?auto_226975 ?auto_226976 ) ) ( not ( = ?auto_226977 ?auto_226976 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226977 ?auto_226974 ?auto_226973 )
      ( DELIVER-4PKG-VERIFY ?auto_226974 ?auto_226975 ?auto_226977 ?auto_226976 ?auto_226973 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_227006 - OBJ
      ?auto_227007 - OBJ
      ?auto_227009 - OBJ
      ?auto_227008 - OBJ
      ?auto_227005 - LOCATION
    )
    :vars
    (
      ?auto_227012 - TRUCK
      ?auto_227013 - LOCATION
      ?auto_227010 - CITY
      ?auto_227011 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227012 ?auto_227013 ) ( IN-CITY ?auto_227013 ?auto_227010 ) ( IN-CITY ?auto_227005 ?auto_227010 ) ( not ( = ?auto_227005 ?auto_227013 ) ) ( OBJ-AT ?auto_227011 ?auto_227005 ) ( not ( = ?auto_227011 ?auto_227006 ) ) ( OBJ-AT ?auto_227006 ?auto_227013 ) ( OBJ-AT ?auto_227007 ?auto_227005 ) ( OBJ-AT ?auto_227009 ?auto_227005 ) ( OBJ-AT ?auto_227008 ?auto_227005 ) ( not ( = ?auto_227006 ?auto_227007 ) ) ( not ( = ?auto_227006 ?auto_227009 ) ) ( not ( = ?auto_227006 ?auto_227008 ) ) ( not ( = ?auto_227007 ?auto_227009 ) ) ( not ( = ?auto_227007 ?auto_227008 ) ) ( not ( = ?auto_227007 ?auto_227011 ) ) ( not ( = ?auto_227009 ?auto_227008 ) ) ( not ( = ?auto_227009 ?auto_227011 ) ) ( not ( = ?auto_227008 ?auto_227011 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227011 ?auto_227006 ?auto_227005 )
      ( DELIVER-4PKG-VERIFY ?auto_227006 ?auto_227007 ?auto_227009 ?auto_227008 ?auto_227005 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227126 - OBJ
      ?auto_227127 - OBJ
      ?auto_227129 - OBJ
      ?auto_227128 - OBJ
      ?auto_227130 - OBJ
      ?auto_227125 - LOCATION
    )
    :vars
    (
      ?auto_227132 - TRUCK
      ?auto_227133 - LOCATION
      ?auto_227131 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227132 ?auto_227133 ) ( IN-CITY ?auto_227133 ?auto_227131 ) ( IN-CITY ?auto_227125 ?auto_227131 ) ( not ( = ?auto_227125 ?auto_227133 ) ) ( OBJ-AT ?auto_227128 ?auto_227125 ) ( not ( = ?auto_227128 ?auto_227130 ) ) ( OBJ-AT ?auto_227130 ?auto_227133 ) ( OBJ-AT ?auto_227126 ?auto_227125 ) ( OBJ-AT ?auto_227127 ?auto_227125 ) ( OBJ-AT ?auto_227129 ?auto_227125 ) ( not ( = ?auto_227126 ?auto_227127 ) ) ( not ( = ?auto_227126 ?auto_227129 ) ) ( not ( = ?auto_227126 ?auto_227128 ) ) ( not ( = ?auto_227126 ?auto_227130 ) ) ( not ( = ?auto_227127 ?auto_227129 ) ) ( not ( = ?auto_227127 ?auto_227128 ) ) ( not ( = ?auto_227127 ?auto_227130 ) ) ( not ( = ?auto_227129 ?auto_227128 ) ) ( not ( = ?auto_227129 ?auto_227130 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227128 ?auto_227130 ?auto_227125 )
      ( DELIVER-5PKG-VERIFY ?auto_227126 ?auto_227127 ?auto_227129 ?auto_227128 ?auto_227130 ?auto_227125 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227135 - OBJ
      ?auto_227136 - OBJ
      ?auto_227138 - OBJ
      ?auto_227137 - OBJ
      ?auto_227139 - OBJ
      ?auto_227134 - LOCATION
    )
    :vars
    (
      ?auto_227141 - TRUCK
      ?auto_227142 - LOCATION
      ?auto_227140 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227141 ?auto_227142 ) ( IN-CITY ?auto_227142 ?auto_227140 ) ( IN-CITY ?auto_227134 ?auto_227140 ) ( not ( = ?auto_227134 ?auto_227142 ) ) ( OBJ-AT ?auto_227138 ?auto_227134 ) ( not ( = ?auto_227138 ?auto_227139 ) ) ( OBJ-AT ?auto_227139 ?auto_227142 ) ( OBJ-AT ?auto_227135 ?auto_227134 ) ( OBJ-AT ?auto_227136 ?auto_227134 ) ( OBJ-AT ?auto_227137 ?auto_227134 ) ( not ( = ?auto_227135 ?auto_227136 ) ) ( not ( = ?auto_227135 ?auto_227138 ) ) ( not ( = ?auto_227135 ?auto_227137 ) ) ( not ( = ?auto_227135 ?auto_227139 ) ) ( not ( = ?auto_227136 ?auto_227138 ) ) ( not ( = ?auto_227136 ?auto_227137 ) ) ( not ( = ?auto_227136 ?auto_227139 ) ) ( not ( = ?auto_227138 ?auto_227137 ) ) ( not ( = ?auto_227137 ?auto_227139 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227138 ?auto_227139 ?auto_227134 )
      ( DELIVER-5PKG-VERIFY ?auto_227135 ?auto_227136 ?auto_227138 ?auto_227137 ?auto_227139 ?auto_227134 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227144 - OBJ
      ?auto_227145 - OBJ
      ?auto_227147 - OBJ
      ?auto_227146 - OBJ
      ?auto_227148 - OBJ
      ?auto_227143 - LOCATION
    )
    :vars
    (
      ?auto_227150 - TRUCK
      ?auto_227151 - LOCATION
      ?auto_227149 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227150 ?auto_227151 ) ( IN-CITY ?auto_227151 ?auto_227149 ) ( IN-CITY ?auto_227143 ?auto_227149 ) ( not ( = ?auto_227143 ?auto_227151 ) ) ( OBJ-AT ?auto_227147 ?auto_227143 ) ( not ( = ?auto_227147 ?auto_227146 ) ) ( OBJ-AT ?auto_227146 ?auto_227151 ) ( OBJ-AT ?auto_227144 ?auto_227143 ) ( OBJ-AT ?auto_227145 ?auto_227143 ) ( OBJ-AT ?auto_227148 ?auto_227143 ) ( not ( = ?auto_227144 ?auto_227145 ) ) ( not ( = ?auto_227144 ?auto_227147 ) ) ( not ( = ?auto_227144 ?auto_227146 ) ) ( not ( = ?auto_227144 ?auto_227148 ) ) ( not ( = ?auto_227145 ?auto_227147 ) ) ( not ( = ?auto_227145 ?auto_227146 ) ) ( not ( = ?auto_227145 ?auto_227148 ) ) ( not ( = ?auto_227147 ?auto_227148 ) ) ( not ( = ?auto_227146 ?auto_227148 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227147 ?auto_227146 ?auto_227143 )
      ( DELIVER-5PKG-VERIFY ?auto_227144 ?auto_227145 ?auto_227147 ?auto_227146 ?auto_227148 ?auto_227143 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227180 - OBJ
      ?auto_227181 - OBJ
      ?auto_227183 - OBJ
      ?auto_227182 - OBJ
      ?auto_227184 - OBJ
      ?auto_227179 - LOCATION
    )
    :vars
    (
      ?auto_227186 - TRUCK
      ?auto_227187 - LOCATION
      ?auto_227185 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227186 ?auto_227187 ) ( IN-CITY ?auto_227187 ?auto_227185 ) ( IN-CITY ?auto_227179 ?auto_227185 ) ( not ( = ?auto_227179 ?auto_227187 ) ) ( OBJ-AT ?auto_227180 ?auto_227179 ) ( not ( = ?auto_227180 ?auto_227184 ) ) ( OBJ-AT ?auto_227184 ?auto_227187 ) ( OBJ-AT ?auto_227181 ?auto_227179 ) ( OBJ-AT ?auto_227183 ?auto_227179 ) ( OBJ-AT ?auto_227182 ?auto_227179 ) ( not ( = ?auto_227180 ?auto_227181 ) ) ( not ( = ?auto_227180 ?auto_227183 ) ) ( not ( = ?auto_227180 ?auto_227182 ) ) ( not ( = ?auto_227181 ?auto_227183 ) ) ( not ( = ?auto_227181 ?auto_227182 ) ) ( not ( = ?auto_227181 ?auto_227184 ) ) ( not ( = ?auto_227183 ?auto_227182 ) ) ( not ( = ?auto_227183 ?auto_227184 ) ) ( not ( = ?auto_227182 ?auto_227184 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227180 ?auto_227184 ?auto_227179 )
      ( DELIVER-5PKG-VERIFY ?auto_227180 ?auto_227181 ?auto_227183 ?auto_227182 ?auto_227184 ?auto_227179 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227198 - OBJ
      ?auto_227199 - OBJ
      ?auto_227201 - OBJ
      ?auto_227200 - OBJ
      ?auto_227202 - OBJ
      ?auto_227197 - LOCATION
    )
    :vars
    (
      ?auto_227204 - TRUCK
      ?auto_227205 - LOCATION
      ?auto_227203 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227204 ?auto_227205 ) ( IN-CITY ?auto_227205 ?auto_227203 ) ( IN-CITY ?auto_227197 ?auto_227203 ) ( not ( = ?auto_227197 ?auto_227205 ) ) ( OBJ-AT ?auto_227198 ?auto_227197 ) ( not ( = ?auto_227198 ?auto_227200 ) ) ( OBJ-AT ?auto_227200 ?auto_227205 ) ( OBJ-AT ?auto_227199 ?auto_227197 ) ( OBJ-AT ?auto_227201 ?auto_227197 ) ( OBJ-AT ?auto_227202 ?auto_227197 ) ( not ( = ?auto_227198 ?auto_227199 ) ) ( not ( = ?auto_227198 ?auto_227201 ) ) ( not ( = ?auto_227198 ?auto_227202 ) ) ( not ( = ?auto_227199 ?auto_227201 ) ) ( not ( = ?auto_227199 ?auto_227200 ) ) ( not ( = ?auto_227199 ?auto_227202 ) ) ( not ( = ?auto_227201 ?auto_227200 ) ) ( not ( = ?auto_227201 ?auto_227202 ) ) ( not ( = ?auto_227200 ?auto_227202 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227198 ?auto_227200 ?auto_227197 )
      ( DELIVER-5PKG-VERIFY ?auto_227198 ?auto_227199 ?auto_227201 ?auto_227200 ?auto_227202 ?auto_227197 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227216 - OBJ
      ?auto_227217 - OBJ
      ?auto_227219 - OBJ
      ?auto_227218 - OBJ
      ?auto_227220 - OBJ
      ?auto_227215 - LOCATION
    )
    :vars
    (
      ?auto_227222 - TRUCK
      ?auto_227223 - LOCATION
      ?auto_227221 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227222 ?auto_227223 ) ( IN-CITY ?auto_227223 ?auto_227221 ) ( IN-CITY ?auto_227215 ?auto_227221 ) ( not ( = ?auto_227215 ?auto_227223 ) ) ( OBJ-AT ?auto_227216 ?auto_227215 ) ( not ( = ?auto_227216 ?auto_227219 ) ) ( OBJ-AT ?auto_227219 ?auto_227223 ) ( OBJ-AT ?auto_227217 ?auto_227215 ) ( OBJ-AT ?auto_227218 ?auto_227215 ) ( OBJ-AT ?auto_227220 ?auto_227215 ) ( not ( = ?auto_227216 ?auto_227217 ) ) ( not ( = ?auto_227216 ?auto_227218 ) ) ( not ( = ?auto_227216 ?auto_227220 ) ) ( not ( = ?auto_227217 ?auto_227219 ) ) ( not ( = ?auto_227217 ?auto_227218 ) ) ( not ( = ?auto_227217 ?auto_227220 ) ) ( not ( = ?auto_227219 ?auto_227218 ) ) ( not ( = ?auto_227219 ?auto_227220 ) ) ( not ( = ?auto_227218 ?auto_227220 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227216 ?auto_227219 ?auto_227215 )
      ( DELIVER-5PKG-VERIFY ?auto_227216 ?auto_227217 ?auto_227219 ?auto_227218 ?auto_227220 ?auto_227215 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227243 - OBJ
      ?auto_227244 - OBJ
      ?auto_227246 - OBJ
      ?auto_227245 - OBJ
      ?auto_227247 - OBJ
      ?auto_227242 - LOCATION
    )
    :vars
    (
      ?auto_227249 - TRUCK
      ?auto_227250 - LOCATION
      ?auto_227248 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227249 ?auto_227250 ) ( IN-CITY ?auto_227250 ?auto_227248 ) ( IN-CITY ?auto_227242 ?auto_227248 ) ( not ( = ?auto_227242 ?auto_227250 ) ) ( OBJ-AT ?auto_227244 ?auto_227242 ) ( not ( = ?auto_227244 ?auto_227246 ) ) ( OBJ-AT ?auto_227246 ?auto_227250 ) ( OBJ-AT ?auto_227243 ?auto_227242 ) ( OBJ-AT ?auto_227245 ?auto_227242 ) ( OBJ-AT ?auto_227247 ?auto_227242 ) ( not ( = ?auto_227243 ?auto_227244 ) ) ( not ( = ?auto_227243 ?auto_227246 ) ) ( not ( = ?auto_227243 ?auto_227245 ) ) ( not ( = ?auto_227243 ?auto_227247 ) ) ( not ( = ?auto_227244 ?auto_227245 ) ) ( not ( = ?auto_227244 ?auto_227247 ) ) ( not ( = ?auto_227246 ?auto_227245 ) ) ( not ( = ?auto_227246 ?auto_227247 ) ) ( not ( = ?auto_227245 ?auto_227247 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227244 ?auto_227246 ?auto_227242 )
      ( DELIVER-5PKG-VERIFY ?auto_227243 ?auto_227244 ?auto_227246 ?auto_227245 ?auto_227247 ?auto_227242 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227468 - OBJ
      ?auto_227469 - OBJ
      ?auto_227471 - OBJ
      ?auto_227470 - OBJ
      ?auto_227472 - OBJ
      ?auto_227467 - LOCATION
    )
    :vars
    (
      ?auto_227474 - TRUCK
      ?auto_227475 - LOCATION
      ?auto_227473 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227474 ?auto_227475 ) ( IN-CITY ?auto_227475 ?auto_227473 ) ( IN-CITY ?auto_227467 ?auto_227473 ) ( not ( = ?auto_227467 ?auto_227475 ) ) ( OBJ-AT ?auto_227471 ?auto_227467 ) ( not ( = ?auto_227471 ?auto_227469 ) ) ( OBJ-AT ?auto_227469 ?auto_227475 ) ( OBJ-AT ?auto_227468 ?auto_227467 ) ( OBJ-AT ?auto_227470 ?auto_227467 ) ( OBJ-AT ?auto_227472 ?auto_227467 ) ( not ( = ?auto_227468 ?auto_227469 ) ) ( not ( = ?auto_227468 ?auto_227471 ) ) ( not ( = ?auto_227468 ?auto_227470 ) ) ( not ( = ?auto_227468 ?auto_227472 ) ) ( not ( = ?auto_227469 ?auto_227470 ) ) ( not ( = ?auto_227469 ?auto_227472 ) ) ( not ( = ?auto_227471 ?auto_227470 ) ) ( not ( = ?auto_227471 ?auto_227472 ) ) ( not ( = ?auto_227470 ?auto_227472 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227471 ?auto_227469 ?auto_227467 )
      ( DELIVER-5PKG-VERIFY ?auto_227468 ?auto_227469 ?auto_227471 ?auto_227470 ?auto_227472 ?auto_227467 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227477 - OBJ
      ?auto_227478 - OBJ
      ?auto_227480 - OBJ
      ?auto_227479 - OBJ
      ?auto_227481 - OBJ
      ?auto_227476 - LOCATION
    )
    :vars
    (
      ?auto_227483 - TRUCK
      ?auto_227484 - LOCATION
      ?auto_227482 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227483 ?auto_227484 ) ( IN-CITY ?auto_227484 ?auto_227482 ) ( IN-CITY ?auto_227476 ?auto_227482 ) ( not ( = ?auto_227476 ?auto_227484 ) ) ( OBJ-AT ?auto_227479 ?auto_227476 ) ( not ( = ?auto_227479 ?auto_227478 ) ) ( OBJ-AT ?auto_227478 ?auto_227484 ) ( OBJ-AT ?auto_227477 ?auto_227476 ) ( OBJ-AT ?auto_227480 ?auto_227476 ) ( OBJ-AT ?auto_227481 ?auto_227476 ) ( not ( = ?auto_227477 ?auto_227478 ) ) ( not ( = ?auto_227477 ?auto_227480 ) ) ( not ( = ?auto_227477 ?auto_227479 ) ) ( not ( = ?auto_227477 ?auto_227481 ) ) ( not ( = ?auto_227478 ?auto_227480 ) ) ( not ( = ?auto_227478 ?auto_227481 ) ) ( not ( = ?auto_227480 ?auto_227479 ) ) ( not ( = ?auto_227480 ?auto_227481 ) ) ( not ( = ?auto_227479 ?auto_227481 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227479 ?auto_227478 ?auto_227476 )
      ( DELIVER-5PKG-VERIFY ?auto_227477 ?auto_227478 ?auto_227480 ?auto_227479 ?auto_227481 ?auto_227476 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227504 - OBJ
      ?auto_227505 - OBJ
      ?auto_227507 - OBJ
      ?auto_227506 - OBJ
      ?auto_227508 - OBJ
      ?auto_227503 - LOCATION
    )
    :vars
    (
      ?auto_227510 - TRUCK
      ?auto_227511 - LOCATION
      ?auto_227509 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227510 ?auto_227511 ) ( IN-CITY ?auto_227511 ?auto_227509 ) ( IN-CITY ?auto_227503 ?auto_227509 ) ( not ( = ?auto_227503 ?auto_227511 ) ) ( OBJ-AT ?auto_227504 ?auto_227503 ) ( not ( = ?auto_227504 ?auto_227505 ) ) ( OBJ-AT ?auto_227505 ?auto_227511 ) ( OBJ-AT ?auto_227507 ?auto_227503 ) ( OBJ-AT ?auto_227506 ?auto_227503 ) ( OBJ-AT ?auto_227508 ?auto_227503 ) ( not ( = ?auto_227504 ?auto_227507 ) ) ( not ( = ?auto_227504 ?auto_227506 ) ) ( not ( = ?auto_227504 ?auto_227508 ) ) ( not ( = ?auto_227505 ?auto_227507 ) ) ( not ( = ?auto_227505 ?auto_227506 ) ) ( not ( = ?auto_227505 ?auto_227508 ) ) ( not ( = ?auto_227507 ?auto_227506 ) ) ( not ( = ?auto_227507 ?auto_227508 ) ) ( not ( = ?auto_227506 ?auto_227508 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227504 ?auto_227505 ?auto_227503 )
      ( DELIVER-5PKG-VERIFY ?auto_227504 ?auto_227505 ?auto_227507 ?auto_227506 ?auto_227508 ?auto_227503 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227729 - OBJ
      ?auto_227730 - OBJ
      ?auto_227732 - OBJ
      ?auto_227731 - OBJ
      ?auto_227733 - OBJ
      ?auto_227728 - LOCATION
    )
    :vars
    (
      ?auto_227735 - TRUCK
      ?auto_227736 - LOCATION
      ?auto_227734 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227735 ?auto_227736 ) ( IN-CITY ?auto_227736 ?auto_227734 ) ( IN-CITY ?auto_227728 ?auto_227734 ) ( not ( = ?auto_227728 ?auto_227736 ) ) ( OBJ-AT ?auto_227730 ?auto_227728 ) ( not ( = ?auto_227730 ?auto_227731 ) ) ( OBJ-AT ?auto_227731 ?auto_227736 ) ( OBJ-AT ?auto_227729 ?auto_227728 ) ( OBJ-AT ?auto_227732 ?auto_227728 ) ( OBJ-AT ?auto_227733 ?auto_227728 ) ( not ( = ?auto_227729 ?auto_227730 ) ) ( not ( = ?auto_227729 ?auto_227732 ) ) ( not ( = ?auto_227729 ?auto_227731 ) ) ( not ( = ?auto_227729 ?auto_227733 ) ) ( not ( = ?auto_227730 ?auto_227732 ) ) ( not ( = ?auto_227730 ?auto_227733 ) ) ( not ( = ?auto_227732 ?auto_227731 ) ) ( not ( = ?auto_227732 ?auto_227733 ) ) ( not ( = ?auto_227731 ?auto_227733 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227730 ?auto_227731 ?auto_227728 )
      ( DELIVER-5PKG-VERIFY ?auto_227729 ?auto_227730 ?auto_227732 ?auto_227731 ?auto_227733 ?auto_227728 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227801 - OBJ
      ?auto_227802 - OBJ
      ?auto_227804 - OBJ
      ?auto_227803 - OBJ
      ?auto_227805 - OBJ
      ?auto_227800 - LOCATION
    )
    :vars
    (
      ?auto_227807 - TRUCK
      ?auto_227808 - LOCATION
      ?auto_227806 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227807 ?auto_227808 ) ( IN-CITY ?auto_227808 ?auto_227806 ) ( IN-CITY ?auto_227800 ?auto_227806 ) ( not ( = ?auto_227800 ?auto_227808 ) ) ( OBJ-AT ?auto_227805 ?auto_227800 ) ( not ( = ?auto_227805 ?auto_227804 ) ) ( OBJ-AT ?auto_227804 ?auto_227808 ) ( OBJ-AT ?auto_227801 ?auto_227800 ) ( OBJ-AT ?auto_227802 ?auto_227800 ) ( OBJ-AT ?auto_227803 ?auto_227800 ) ( not ( = ?auto_227801 ?auto_227802 ) ) ( not ( = ?auto_227801 ?auto_227804 ) ) ( not ( = ?auto_227801 ?auto_227803 ) ) ( not ( = ?auto_227801 ?auto_227805 ) ) ( not ( = ?auto_227802 ?auto_227804 ) ) ( not ( = ?auto_227802 ?auto_227803 ) ) ( not ( = ?auto_227802 ?auto_227805 ) ) ( not ( = ?auto_227804 ?auto_227803 ) ) ( not ( = ?auto_227803 ?auto_227805 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227805 ?auto_227804 ?auto_227800 )
      ( DELIVER-5PKG-VERIFY ?auto_227801 ?auto_227802 ?auto_227804 ?auto_227803 ?auto_227805 ?auto_227800 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227936 - OBJ
      ?auto_227937 - OBJ
      ?auto_227939 - OBJ
      ?auto_227938 - OBJ
      ?auto_227940 - OBJ
      ?auto_227935 - LOCATION
    )
    :vars
    (
      ?auto_227943 - TRUCK
      ?auto_227944 - LOCATION
      ?auto_227941 - CITY
      ?auto_227942 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227943 ?auto_227944 ) ( IN-CITY ?auto_227944 ?auto_227941 ) ( IN-CITY ?auto_227935 ?auto_227941 ) ( not ( = ?auto_227935 ?auto_227944 ) ) ( OBJ-AT ?auto_227942 ?auto_227935 ) ( not ( = ?auto_227942 ?auto_227940 ) ) ( OBJ-AT ?auto_227940 ?auto_227944 ) ( OBJ-AT ?auto_227936 ?auto_227935 ) ( OBJ-AT ?auto_227937 ?auto_227935 ) ( OBJ-AT ?auto_227939 ?auto_227935 ) ( OBJ-AT ?auto_227938 ?auto_227935 ) ( not ( = ?auto_227936 ?auto_227937 ) ) ( not ( = ?auto_227936 ?auto_227939 ) ) ( not ( = ?auto_227936 ?auto_227938 ) ) ( not ( = ?auto_227936 ?auto_227940 ) ) ( not ( = ?auto_227936 ?auto_227942 ) ) ( not ( = ?auto_227937 ?auto_227939 ) ) ( not ( = ?auto_227937 ?auto_227938 ) ) ( not ( = ?auto_227937 ?auto_227940 ) ) ( not ( = ?auto_227937 ?auto_227942 ) ) ( not ( = ?auto_227939 ?auto_227938 ) ) ( not ( = ?auto_227939 ?auto_227940 ) ) ( not ( = ?auto_227939 ?auto_227942 ) ) ( not ( = ?auto_227938 ?auto_227940 ) ) ( not ( = ?auto_227938 ?auto_227942 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227942 ?auto_227940 ?auto_227935 )
      ( DELIVER-5PKG-VERIFY ?auto_227936 ?auto_227937 ?auto_227939 ?auto_227938 ?auto_227940 ?auto_227935 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227955 - OBJ
      ?auto_227956 - OBJ
      ?auto_227958 - OBJ
      ?auto_227957 - OBJ
      ?auto_227959 - OBJ
      ?auto_227954 - LOCATION
    )
    :vars
    (
      ?auto_227962 - TRUCK
      ?auto_227963 - LOCATION
      ?auto_227960 - CITY
      ?auto_227961 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227962 ?auto_227963 ) ( IN-CITY ?auto_227963 ?auto_227960 ) ( IN-CITY ?auto_227954 ?auto_227960 ) ( not ( = ?auto_227954 ?auto_227963 ) ) ( OBJ-AT ?auto_227961 ?auto_227954 ) ( not ( = ?auto_227961 ?auto_227957 ) ) ( OBJ-AT ?auto_227957 ?auto_227963 ) ( OBJ-AT ?auto_227955 ?auto_227954 ) ( OBJ-AT ?auto_227956 ?auto_227954 ) ( OBJ-AT ?auto_227958 ?auto_227954 ) ( OBJ-AT ?auto_227959 ?auto_227954 ) ( not ( = ?auto_227955 ?auto_227956 ) ) ( not ( = ?auto_227955 ?auto_227958 ) ) ( not ( = ?auto_227955 ?auto_227957 ) ) ( not ( = ?auto_227955 ?auto_227959 ) ) ( not ( = ?auto_227955 ?auto_227961 ) ) ( not ( = ?auto_227956 ?auto_227958 ) ) ( not ( = ?auto_227956 ?auto_227957 ) ) ( not ( = ?auto_227956 ?auto_227959 ) ) ( not ( = ?auto_227956 ?auto_227961 ) ) ( not ( = ?auto_227958 ?auto_227957 ) ) ( not ( = ?auto_227958 ?auto_227959 ) ) ( not ( = ?auto_227958 ?auto_227961 ) ) ( not ( = ?auto_227957 ?auto_227959 ) ) ( not ( = ?auto_227959 ?auto_227961 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227961 ?auto_227957 ?auto_227954 )
      ( DELIVER-5PKG-VERIFY ?auto_227955 ?auto_227956 ?auto_227958 ?auto_227957 ?auto_227959 ?auto_227954 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_228011 - OBJ
      ?auto_228012 - OBJ
      ?auto_228014 - OBJ
      ?auto_228013 - OBJ
      ?auto_228015 - OBJ
      ?auto_228010 - LOCATION
    )
    :vars
    (
      ?auto_228018 - TRUCK
      ?auto_228019 - LOCATION
      ?auto_228016 - CITY
      ?auto_228017 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_228018 ?auto_228019 ) ( IN-CITY ?auto_228019 ?auto_228016 ) ( IN-CITY ?auto_228010 ?auto_228016 ) ( not ( = ?auto_228010 ?auto_228019 ) ) ( OBJ-AT ?auto_228017 ?auto_228010 ) ( not ( = ?auto_228017 ?auto_228014 ) ) ( OBJ-AT ?auto_228014 ?auto_228019 ) ( OBJ-AT ?auto_228011 ?auto_228010 ) ( OBJ-AT ?auto_228012 ?auto_228010 ) ( OBJ-AT ?auto_228013 ?auto_228010 ) ( OBJ-AT ?auto_228015 ?auto_228010 ) ( not ( = ?auto_228011 ?auto_228012 ) ) ( not ( = ?auto_228011 ?auto_228014 ) ) ( not ( = ?auto_228011 ?auto_228013 ) ) ( not ( = ?auto_228011 ?auto_228015 ) ) ( not ( = ?auto_228011 ?auto_228017 ) ) ( not ( = ?auto_228012 ?auto_228014 ) ) ( not ( = ?auto_228012 ?auto_228013 ) ) ( not ( = ?auto_228012 ?auto_228015 ) ) ( not ( = ?auto_228012 ?auto_228017 ) ) ( not ( = ?auto_228014 ?auto_228013 ) ) ( not ( = ?auto_228014 ?auto_228015 ) ) ( not ( = ?auto_228013 ?auto_228015 ) ) ( not ( = ?auto_228013 ?auto_228017 ) ) ( not ( = ?auto_228015 ?auto_228017 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228017 ?auto_228014 ?auto_228010 )
      ( DELIVER-5PKG-VERIFY ?auto_228011 ?auto_228012 ?auto_228014 ?auto_228013 ?auto_228015 ?auto_228010 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_228177 - OBJ
      ?auto_228178 - OBJ
      ?auto_228180 - OBJ
      ?auto_228179 - OBJ
      ?auto_228181 - OBJ
      ?auto_228176 - LOCATION
    )
    :vars
    (
      ?auto_228184 - TRUCK
      ?auto_228185 - LOCATION
      ?auto_228182 - CITY
      ?auto_228183 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_228184 ?auto_228185 ) ( IN-CITY ?auto_228185 ?auto_228182 ) ( IN-CITY ?auto_228176 ?auto_228182 ) ( not ( = ?auto_228176 ?auto_228185 ) ) ( OBJ-AT ?auto_228183 ?auto_228176 ) ( not ( = ?auto_228183 ?auto_228178 ) ) ( OBJ-AT ?auto_228178 ?auto_228185 ) ( OBJ-AT ?auto_228177 ?auto_228176 ) ( OBJ-AT ?auto_228180 ?auto_228176 ) ( OBJ-AT ?auto_228179 ?auto_228176 ) ( OBJ-AT ?auto_228181 ?auto_228176 ) ( not ( = ?auto_228177 ?auto_228178 ) ) ( not ( = ?auto_228177 ?auto_228180 ) ) ( not ( = ?auto_228177 ?auto_228179 ) ) ( not ( = ?auto_228177 ?auto_228181 ) ) ( not ( = ?auto_228177 ?auto_228183 ) ) ( not ( = ?auto_228178 ?auto_228180 ) ) ( not ( = ?auto_228178 ?auto_228179 ) ) ( not ( = ?auto_228178 ?auto_228181 ) ) ( not ( = ?auto_228180 ?auto_228179 ) ) ( not ( = ?auto_228180 ?auto_228181 ) ) ( not ( = ?auto_228180 ?auto_228183 ) ) ( not ( = ?auto_228179 ?auto_228181 ) ) ( not ( = ?auto_228179 ?auto_228183 ) ) ( not ( = ?auto_228181 ?auto_228183 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228183 ?auto_228178 ?auto_228176 )
      ( DELIVER-5PKG-VERIFY ?auto_228177 ?auto_228178 ?auto_228180 ?auto_228179 ?auto_228181 ?auto_228176 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_228311 - OBJ
      ?auto_228312 - OBJ
      ?auto_228314 - OBJ
      ?auto_228313 - OBJ
      ?auto_228315 - OBJ
      ?auto_228310 - LOCATION
    )
    :vars
    (
      ?auto_228317 - TRUCK
      ?auto_228318 - LOCATION
      ?auto_228316 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_228317 ?auto_228318 ) ( IN-CITY ?auto_228318 ?auto_228316 ) ( IN-CITY ?auto_228310 ?auto_228316 ) ( not ( = ?auto_228310 ?auto_228318 ) ) ( OBJ-AT ?auto_228313 ?auto_228310 ) ( not ( = ?auto_228313 ?auto_228311 ) ) ( OBJ-AT ?auto_228311 ?auto_228318 ) ( OBJ-AT ?auto_228312 ?auto_228310 ) ( OBJ-AT ?auto_228314 ?auto_228310 ) ( OBJ-AT ?auto_228315 ?auto_228310 ) ( not ( = ?auto_228311 ?auto_228312 ) ) ( not ( = ?auto_228311 ?auto_228314 ) ) ( not ( = ?auto_228311 ?auto_228315 ) ) ( not ( = ?auto_228312 ?auto_228314 ) ) ( not ( = ?auto_228312 ?auto_228313 ) ) ( not ( = ?auto_228312 ?auto_228315 ) ) ( not ( = ?auto_228314 ?auto_228313 ) ) ( not ( = ?auto_228314 ?auto_228315 ) ) ( not ( = ?auto_228313 ?auto_228315 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228313 ?auto_228311 ?auto_228310 )
      ( DELIVER-5PKG-VERIFY ?auto_228311 ?auto_228312 ?auto_228314 ?auto_228313 ?auto_228315 ?auto_228310 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_228320 - OBJ
      ?auto_228321 - OBJ
      ?auto_228323 - OBJ
      ?auto_228322 - OBJ
      ?auto_228324 - OBJ
      ?auto_228319 - LOCATION
    )
    :vars
    (
      ?auto_228326 - TRUCK
      ?auto_228327 - LOCATION
      ?auto_228325 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_228326 ?auto_228327 ) ( IN-CITY ?auto_228327 ?auto_228325 ) ( IN-CITY ?auto_228319 ?auto_228325 ) ( not ( = ?auto_228319 ?auto_228327 ) ) ( OBJ-AT ?auto_228323 ?auto_228319 ) ( not ( = ?auto_228323 ?auto_228320 ) ) ( OBJ-AT ?auto_228320 ?auto_228327 ) ( OBJ-AT ?auto_228321 ?auto_228319 ) ( OBJ-AT ?auto_228322 ?auto_228319 ) ( OBJ-AT ?auto_228324 ?auto_228319 ) ( not ( = ?auto_228320 ?auto_228321 ) ) ( not ( = ?auto_228320 ?auto_228322 ) ) ( not ( = ?auto_228320 ?auto_228324 ) ) ( not ( = ?auto_228321 ?auto_228323 ) ) ( not ( = ?auto_228321 ?auto_228322 ) ) ( not ( = ?auto_228321 ?auto_228324 ) ) ( not ( = ?auto_228323 ?auto_228322 ) ) ( not ( = ?auto_228323 ?auto_228324 ) ) ( not ( = ?auto_228322 ?auto_228324 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228323 ?auto_228320 ?auto_228319 )
      ( DELIVER-5PKG-VERIFY ?auto_228320 ?auto_228321 ?auto_228323 ?auto_228322 ?auto_228324 ?auto_228319 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_228392 - OBJ
      ?auto_228393 - OBJ
      ?auto_228395 - OBJ
      ?auto_228394 - OBJ
      ?auto_228396 - OBJ
      ?auto_228391 - LOCATION
    )
    :vars
    (
      ?auto_228398 - TRUCK
      ?auto_228399 - LOCATION
      ?auto_228397 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_228398 ?auto_228399 ) ( IN-CITY ?auto_228399 ?auto_228397 ) ( IN-CITY ?auto_228391 ?auto_228397 ) ( not ( = ?auto_228391 ?auto_228399 ) ) ( OBJ-AT ?auto_228396 ?auto_228391 ) ( not ( = ?auto_228396 ?auto_228392 ) ) ( OBJ-AT ?auto_228392 ?auto_228399 ) ( OBJ-AT ?auto_228393 ?auto_228391 ) ( OBJ-AT ?auto_228395 ?auto_228391 ) ( OBJ-AT ?auto_228394 ?auto_228391 ) ( not ( = ?auto_228392 ?auto_228393 ) ) ( not ( = ?auto_228392 ?auto_228395 ) ) ( not ( = ?auto_228392 ?auto_228394 ) ) ( not ( = ?auto_228393 ?auto_228395 ) ) ( not ( = ?auto_228393 ?auto_228394 ) ) ( not ( = ?auto_228393 ?auto_228396 ) ) ( not ( = ?auto_228395 ?auto_228394 ) ) ( not ( = ?auto_228395 ?auto_228396 ) ) ( not ( = ?auto_228394 ?auto_228396 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228396 ?auto_228392 ?auto_228391 )
      ( DELIVER-5PKG-VERIFY ?auto_228392 ?auto_228393 ?auto_228395 ?auto_228394 ?auto_228396 ?auto_228391 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_228671 - OBJ
      ?auto_228672 - OBJ
      ?auto_228674 - OBJ
      ?auto_228673 - OBJ
      ?auto_228675 - OBJ
      ?auto_228670 - LOCATION
    )
    :vars
    (
      ?auto_228678 - TRUCK
      ?auto_228679 - LOCATION
      ?auto_228676 - CITY
      ?auto_228677 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_228678 ?auto_228679 ) ( IN-CITY ?auto_228679 ?auto_228676 ) ( IN-CITY ?auto_228670 ?auto_228676 ) ( not ( = ?auto_228670 ?auto_228679 ) ) ( OBJ-AT ?auto_228677 ?auto_228670 ) ( not ( = ?auto_228677 ?auto_228671 ) ) ( OBJ-AT ?auto_228671 ?auto_228679 ) ( OBJ-AT ?auto_228672 ?auto_228670 ) ( OBJ-AT ?auto_228674 ?auto_228670 ) ( OBJ-AT ?auto_228673 ?auto_228670 ) ( OBJ-AT ?auto_228675 ?auto_228670 ) ( not ( = ?auto_228671 ?auto_228672 ) ) ( not ( = ?auto_228671 ?auto_228674 ) ) ( not ( = ?auto_228671 ?auto_228673 ) ) ( not ( = ?auto_228671 ?auto_228675 ) ) ( not ( = ?auto_228672 ?auto_228674 ) ) ( not ( = ?auto_228672 ?auto_228673 ) ) ( not ( = ?auto_228672 ?auto_228675 ) ) ( not ( = ?auto_228672 ?auto_228677 ) ) ( not ( = ?auto_228674 ?auto_228673 ) ) ( not ( = ?auto_228674 ?auto_228675 ) ) ( not ( = ?auto_228674 ?auto_228677 ) ) ( not ( = ?auto_228673 ?auto_228675 ) ) ( not ( = ?auto_228673 ?auto_228677 ) ) ( not ( = ?auto_228675 ?auto_228677 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228677 ?auto_228671 ?auto_228670 )
      ( DELIVER-5PKG-VERIFY ?auto_228671 ?auto_228672 ?auto_228674 ?auto_228673 ?auto_228675 ?auto_228670 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_229120 - OBJ
      ?auto_229121 - OBJ
      ?auto_229122 - OBJ
      ?auto_229119 - LOCATION
    )
    :vars
    (
      ?auto_229124 - LOCATION
      ?auto_229123 - CITY
      ?auto_229126 - OBJ
      ?auto_229125 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229124 ?auto_229123 ) ( IN-CITY ?auto_229119 ?auto_229123 ) ( not ( = ?auto_229119 ?auto_229124 ) ) ( OBJ-AT ?auto_229126 ?auto_229119 ) ( not ( = ?auto_229126 ?auto_229122 ) ) ( OBJ-AT ?auto_229122 ?auto_229124 ) ( TRUCK-AT ?auto_229125 ?auto_229119 ) ( OBJ-AT ?auto_229120 ?auto_229119 ) ( OBJ-AT ?auto_229121 ?auto_229119 ) ( not ( = ?auto_229120 ?auto_229121 ) ) ( not ( = ?auto_229120 ?auto_229122 ) ) ( not ( = ?auto_229120 ?auto_229126 ) ) ( not ( = ?auto_229121 ?auto_229122 ) ) ( not ( = ?auto_229121 ?auto_229126 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229126 ?auto_229122 ?auto_229119 )
      ( DELIVER-3PKG-VERIFY ?auto_229120 ?auto_229121 ?auto_229122 ?auto_229119 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_229132 - OBJ
      ?auto_229133 - OBJ
      ?auto_229134 - OBJ
      ?auto_229131 - LOCATION
    )
    :vars
    (
      ?auto_229136 - LOCATION
      ?auto_229135 - CITY
      ?auto_229138 - OBJ
      ?auto_229137 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229136 ?auto_229135 ) ( IN-CITY ?auto_229131 ?auto_229135 ) ( not ( = ?auto_229131 ?auto_229136 ) ) ( OBJ-AT ?auto_229138 ?auto_229131 ) ( not ( = ?auto_229138 ?auto_229133 ) ) ( OBJ-AT ?auto_229133 ?auto_229136 ) ( TRUCK-AT ?auto_229137 ?auto_229131 ) ( OBJ-AT ?auto_229132 ?auto_229131 ) ( OBJ-AT ?auto_229134 ?auto_229131 ) ( not ( = ?auto_229132 ?auto_229133 ) ) ( not ( = ?auto_229132 ?auto_229134 ) ) ( not ( = ?auto_229132 ?auto_229138 ) ) ( not ( = ?auto_229133 ?auto_229134 ) ) ( not ( = ?auto_229134 ?auto_229138 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229138 ?auto_229133 ?auto_229131 )
      ( DELIVER-3PKG-VERIFY ?auto_229132 ?auto_229133 ?auto_229134 ?auto_229131 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_229148 - OBJ
      ?auto_229149 - OBJ
      ?auto_229150 - OBJ
      ?auto_229147 - LOCATION
    )
    :vars
    (
      ?auto_229152 - LOCATION
      ?auto_229151 - CITY
      ?auto_229153 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229152 ?auto_229151 ) ( IN-CITY ?auto_229147 ?auto_229151 ) ( not ( = ?auto_229147 ?auto_229152 ) ) ( OBJ-AT ?auto_229150 ?auto_229147 ) ( not ( = ?auto_229150 ?auto_229148 ) ) ( OBJ-AT ?auto_229148 ?auto_229152 ) ( TRUCK-AT ?auto_229153 ?auto_229147 ) ( OBJ-AT ?auto_229149 ?auto_229147 ) ( not ( = ?auto_229148 ?auto_229149 ) ) ( not ( = ?auto_229149 ?auto_229150 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229150 ?auto_229148 ?auto_229147 )
      ( DELIVER-3PKG-VERIFY ?auto_229148 ?auto_229149 ?auto_229150 ?auto_229147 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_229170 - OBJ
      ?auto_229171 - OBJ
      ?auto_229172 - OBJ
      ?auto_229169 - LOCATION
    )
    :vars
    (
      ?auto_229174 - LOCATION
      ?auto_229173 - CITY
      ?auto_229176 - OBJ
      ?auto_229175 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229174 ?auto_229173 ) ( IN-CITY ?auto_229169 ?auto_229173 ) ( not ( = ?auto_229169 ?auto_229174 ) ) ( OBJ-AT ?auto_229176 ?auto_229169 ) ( not ( = ?auto_229176 ?auto_229170 ) ) ( OBJ-AT ?auto_229170 ?auto_229174 ) ( TRUCK-AT ?auto_229175 ?auto_229169 ) ( OBJ-AT ?auto_229171 ?auto_229169 ) ( OBJ-AT ?auto_229172 ?auto_229169 ) ( not ( = ?auto_229170 ?auto_229171 ) ) ( not ( = ?auto_229170 ?auto_229172 ) ) ( not ( = ?auto_229171 ?auto_229172 ) ) ( not ( = ?auto_229171 ?auto_229176 ) ) ( not ( = ?auto_229172 ?auto_229176 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229176 ?auto_229170 ?auto_229169 )
      ( DELIVER-3PKG-VERIFY ?auto_229170 ?auto_229171 ?auto_229172 ?auto_229169 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229209 - OBJ
      ?auto_229210 - OBJ
      ?auto_229212 - OBJ
      ?auto_229211 - OBJ
      ?auto_229208 - LOCATION
    )
    :vars
    (
      ?auto_229214 - LOCATION
      ?auto_229213 - CITY
      ?auto_229215 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229214 ?auto_229213 ) ( IN-CITY ?auto_229208 ?auto_229213 ) ( not ( = ?auto_229208 ?auto_229214 ) ) ( OBJ-AT ?auto_229210 ?auto_229208 ) ( not ( = ?auto_229210 ?auto_229211 ) ) ( OBJ-AT ?auto_229211 ?auto_229214 ) ( TRUCK-AT ?auto_229215 ?auto_229208 ) ( OBJ-AT ?auto_229209 ?auto_229208 ) ( OBJ-AT ?auto_229212 ?auto_229208 ) ( not ( = ?auto_229209 ?auto_229210 ) ) ( not ( = ?auto_229209 ?auto_229212 ) ) ( not ( = ?auto_229209 ?auto_229211 ) ) ( not ( = ?auto_229210 ?auto_229212 ) ) ( not ( = ?auto_229212 ?auto_229211 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229210 ?auto_229211 ?auto_229208 )
      ( DELIVER-4PKG-VERIFY ?auto_229209 ?auto_229210 ?auto_229212 ?auto_229211 ?auto_229208 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229249 - OBJ
      ?auto_229250 - OBJ
      ?auto_229252 - OBJ
      ?auto_229251 - OBJ
      ?auto_229248 - LOCATION
    )
    :vars
    (
      ?auto_229254 - LOCATION
      ?auto_229253 - CITY
      ?auto_229255 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229254 ?auto_229253 ) ( IN-CITY ?auto_229248 ?auto_229253 ) ( not ( = ?auto_229248 ?auto_229254 ) ) ( OBJ-AT ?auto_229252 ?auto_229248 ) ( not ( = ?auto_229252 ?auto_229251 ) ) ( OBJ-AT ?auto_229251 ?auto_229254 ) ( TRUCK-AT ?auto_229255 ?auto_229248 ) ( OBJ-AT ?auto_229249 ?auto_229248 ) ( OBJ-AT ?auto_229250 ?auto_229248 ) ( not ( = ?auto_229249 ?auto_229250 ) ) ( not ( = ?auto_229249 ?auto_229252 ) ) ( not ( = ?auto_229249 ?auto_229251 ) ) ( not ( = ?auto_229250 ?auto_229252 ) ) ( not ( = ?auto_229250 ?auto_229251 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229252 ?auto_229251 ?auto_229248 )
      ( DELIVER-4PKG-VERIFY ?auto_229249 ?auto_229250 ?auto_229252 ?auto_229251 ?auto_229248 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229289 - OBJ
      ?auto_229290 - OBJ
      ?auto_229292 - OBJ
      ?auto_229291 - OBJ
      ?auto_229288 - LOCATION
    )
    :vars
    (
      ?auto_229294 - LOCATION
      ?auto_229293 - CITY
      ?auto_229295 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229294 ?auto_229293 ) ( IN-CITY ?auto_229288 ?auto_229293 ) ( not ( = ?auto_229288 ?auto_229294 ) ) ( OBJ-AT ?auto_229291 ?auto_229288 ) ( not ( = ?auto_229291 ?auto_229290 ) ) ( OBJ-AT ?auto_229290 ?auto_229294 ) ( TRUCK-AT ?auto_229295 ?auto_229288 ) ( OBJ-AT ?auto_229289 ?auto_229288 ) ( OBJ-AT ?auto_229292 ?auto_229288 ) ( not ( = ?auto_229289 ?auto_229290 ) ) ( not ( = ?auto_229289 ?auto_229292 ) ) ( not ( = ?auto_229289 ?auto_229291 ) ) ( not ( = ?auto_229290 ?auto_229292 ) ) ( not ( = ?auto_229292 ?auto_229291 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229291 ?auto_229290 ?auto_229288 )
      ( DELIVER-4PKG-VERIFY ?auto_229289 ?auto_229290 ?auto_229292 ?auto_229291 ?auto_229288 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229313 - OBJ
      ?auto_229314 - OBJ
      ?auto_229316 - OBJ
      ?auto_229315 - OBJ
      ?auto_229312 - LOCATION
    )
    :vars
    (
      ?auto_229318 - LOCATION
      ?auto_229317 - CITY
      ?auto_229319 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229318 ?auto_229317 ) ( IN-CITY ?auto_229312 ?auto_229317 ) ( not ( = ?auto_229312 ?auto_229318 ) ) ( OBJ-AT ?auto_229313 ?auto_229312 ) ( not ( = ?auto_229313 ?auto_229314 ) ) ( OBJ-AT ?auto_229314 ?auto_229318 ) ( TRUCK-AT ?auto_229319 ?auto_229312 ) ( OBJ-AT ?auto_229316 ?auto_229312 ) ( OBJ-AT ?auto_229315 ?auto_229312 ) ( not ( = ?auto_229313 ?auto_229316 ) ) ( not ( = ?auto_229313 ?auto_229315 ) ) ( not ( = ?auto_229314 ?auto_229316 ) ) ( not ( = ?auto_229314 ?auto_229315 ) ) ( not ( = ?auto_229316 ?auto_229315 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229313 ?auto_229314 ?auto_229312 )
      ( DELIVER-4PKG-VERIFY ?auto_229313 ?auto_229314 ?auto_229316 ?auto_229315 ?auto_229312 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229377 - OBJ
      ?auto_229378 - OBJ
      ?auto_229380 - OBJ
      ?auto_229379 - OBJ
      ?auto_229376 - LOCATION
    )
    :vars
    (
      ?auto_229382 - LOCATION
      ?auto_229381 - CITY
      ?auto_229383 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229382 ?auto_229381 ) ( IN-CITY ?auto_229376 ?auto_229381 ) ( not ( = ?auto_229376 ?auto_229382 ) ) ( OBJ-AT ?auto_229378 ?auto_229376 ) ( not ( = ?auto_229378 ?auto_229380 ) ) ( OBJ-AT ?auto_229380 ?auto_229382 ) ( TRUCK-AT ?auto_229383 ?auto_229376 ) ( OBJ-AT ?auto_229377 ?auto_229376 ) ( OBJ-AT ?auto_229379 ?auto_229376 ) ( not ( = ?auto_229377 ?auto_229378 ) ) ( not ( = ?auto_229377 ?auto_229380 ) ) ( not ( = ?auto_229377 ?auto_229379 ) ) ( not ( = ?auto_229378 ?auto_229379 ) ) ( not ( = ?auto_229380 ?auto_229379 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229378 ?auto_229380 ?auto_229376 )
      ( DELIVER-4PKG-VERIFY ?auto_229377 ?auto_229378 ?auto_229380 ?auto_229379 ?auto_229376 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229409 - OBJ
      ?auto_229410 - OBJ
      ?auto_229412 - OBJ
      ?auto_229411 - OBJ
      ?auto_229408 - LOCATION
    )
    :vars
    (
      ?auto_229414 - LOCATION
      ?auto_229413 - CITY
      ?auto_229416 - OBJ
      ?auto_229415 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229414 ?auto_229413 ) ( IN-CITY ?auto_229408 ?auto_229413 ) ( not ( = ?auto_229408 ?auto_229414 ) ) ( OBJ-AT ?auto_229416 ?auto_229408 ) ( not ( = ?auto_229416 ?auto_229411 ) ) ( OBJ-AT ?auto_229411 ?auto_229414 ) ( TRUCK-AT ?auto_229415 ?auto_229408 ) ( OBJ-AT ?auto_229409 ?auto_229408 ) ( OBJ-AT ?auto_229410 ?auto_229408 ) ( OBJ-AT ?auto_229412 ?auto_229408 ) ( not ( = ?auto_229409 ?auto_229410 ) ) ( not ( = ?auto_229409 ?auto_229412 ) ) ( not ( = ?auto_229409 ?auto_229411 ) ) ( not ( = ?auto_229409 ?auto_229416 ) ) ( not ( = ?auto_229410 ?auto_229412 ) ) ( not ( = ?auto_229410 ?auto_229411 ) ) ( not ( = ?auto_229410 ?auto_229416 ) ) ( not ( = ?auto_229412 ?auto_229411 ) ) ( not ( = ?auto_229412 ?auto_229416 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229416 ?auto_229411 ?auto_229408 )
      ( DELIVER-4PKG-VERIFY ?auto_229409 ?auto_229410 ?auto_229412 ?auto_229411 ?auto_229408 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229418 - OBJ
      ?auto_229419 - OBJ
      ?auto_229421 - OBJ
      ?auto_229420 - OBJ
      ?auto_229417 - LOCATION
    )
    :vars
    (
      ?auto_229423 - LOCATION
      ?auto_229422 - CITY
      ?auto_229424 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229423 ?auto_229422 ) ( IN-CITY ?auto_229417 ?auto_229422 ) ( not ( = ?auto_229417 ?auto_229423 ) ) ( OBJ-AT ?auto_229420 ?auto_229417 ) ( not ( = ?auto_229420 ?auto_229421 ) ) ( OBJ-AT ?auto_229421 ?auto_229423 ) ( TRUCK-AT ?auto_229424 ?auto_229417 ) ( OBJ-AT ?auto_229418 ?auto_229417 ) ( OBJ-AT ?auto_229419 ?auto_229417 ) ( not ( = ?auto_229418 ?auto_229419 ) ) ( not ( = ?auto_229418 ?auto_229421 ) ) ( not ( = ?auto_229418 ?auto_229420 ) ) ( not ( = ?auto_229419 ?auto_229421 ) ) ( not ( = ?auto_229419 ?auto_229420 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229420 ?auto_229421 ?auto_229417 )
      ( DELIVER-4PKG-VERIFY ?auto_229418 ?auto_229419 ?auto_229421 ?auto_229420 ?auto_229417 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229426 - OBJ
      ?auto_229427 - OBJ
      ?auto_229429 - OBJ
      ?auto_229428 - OBJ
      ?auto_229425 - LOCATION
    )
    :vars
    (
      ?auto_229431 - LOCATION
      ?auto_229430 - CITY
      ?auto_229433 - OBJ
      ?auto_229432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229431 ?auto_229430 ) ( IN-CITY ?auto_229425 ?auto_229430 ) ( not ( = ?auto_229425 ?auto_229431 ) ) ( OBJ-AT ?auto_229433 ?auto_229425 ) ( not ( = ?auto_229433 ?auto_229429 ) ) ( OBJ-AT ?auto_229429 ?auto_229431 ) ( TRUCK-AT ?auto_229432 ?auto_229425 ) ( OBJ-AT ?auto_229426 ?auto_229425 ) ( OBJ-AT ?auto_229427 ?auto_229425 ) ( OBJ-AT ?auto_229428 ?auto_229425 ) ( not ( = ?auto_229426 ?auto_229427 ) ) ( not ( = ?auto_229426 ?auto_229429 ) ) ( not ( = ?auto_229426 ?auto_229428 ) ) ( not ( = ?auto_229426 ?auto_229433 ) ) ( not ( = ?auto_229427 ?auto_229429 ) ) ( not ( = ?auto_229427 ?auto_229428 ) ) ( not ( = ?auto_229427 ?auto_229433 ) ) ( not ( = ?auto_229429 ?auto_229428 ) ) ( not ( = ?auto_229428 ?auto_229433 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229433 ?auto_229429 ?auto_229425 )
      ( DELIVER-4PKG-VERIFY ?auto_229426 ?auto_229427 ?auto_229429 ?auto_229428 ?auto_229425 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229476 - OBJ
      ?auto_229477 - OBJ
      ?auto_229479 - OBJ
      ?auto_229478 - OBJ
      ?auto_229475 - LOCATION
    )
    :vars
    (
      ?auto_229481 - LOCATION
      ?auto_229480 - CITY
      ?auto_229483 - OBJ
      ?auto_229482 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229481 ?auto_229480 ) ( IN-CITY ?auto_229475 ?auto_229480 ) ( not ( = ?auto_229475 ?auto_229481 ) ) ( OBJ-AT ?auto_229483 ?auto_229475 ) ( not ( = ?auto_229483 ?auto_229477 ) ) ( OBJ-AT ?auto_229477 ?auto_229481 ) ( TRUCK-AT ?auto_229482 ?auto_229475 ) ( OBJ-AT ?auto_229476 ?auto_229475 ) ( OBJ-AT ?auto_229479 ?auto_229475 ) ( OBJ-AT ?auto_229478 ?auto_229475 ) ( not ( = ?auto_229476 ?auto_229477 ) ) ( not ( = ?auto_229476 ?auto_229479 ) ) ( not ( = ?auto_229476 ?auto_229478 ) ) ( not ( = ?auto_229476 ?auto_229483 ) ) ( not ( = ?auto_229477 ?auto_229479 ) ) ( not ( = ?auto_229477 ?auto_229478 ) ) ( not ( = ?auto_229479 ?auto_229478 ) ) ( not ( = ?auto_229479 ?auto_229483 ) ) ( not ( = ?auto_229478 ?auto_229483 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229483 ?auto_229477 ?auto_229475 )
      ( DELIVER-4PKG-VERIFY ?auto_229476 ?auto_229477 ?auto_229479 ?auto_229478 ?auto_229475 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229520 - OBJ
      ?auto_229521 - OBJ
      ?auto_229523 - OBJ
      ?auto_229522 - OBJ
      ?auto_229519 - LOCATION
    )
    :vars
    (
      ?auto_229525 - LOCATION
      ?auto_229524 - CITY
      ?auto_229526 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229525 ?auto_229524 ) ( IN-CITY ?auto_229519 ?auto_229524 ) ( not ( = ?auto_229519 ?auto_229525 ) ) ( OBJ-AT ?auto_229522 ?auto_229519 ) ( not ( = ?auto_229522 ?auto_229520 ) ) ( OBJ-AT ?auto_229520 ?auto_229525 ) ( TRUCK-AT ?auto_229526 ?auto_229519 ) ( OBJ-AT ?auto_229521 ?auto_229519 ) ( OBJ-AT ?auto_229523 ?auto_229519 ) ( not ( = ?auto_229520 ?auto_229521 ) ) ( not ( = ?auto_229520 ?auto_229523 ) ) ( not ( = ?auto_229521 ?auto_229523 ) ) ( not ( = ?auto_229521 ?auto_229522 ) ) ( not ( = ?auto_229523 ?auto_229522 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229522 ?auto_229520 ?auto_229519 )
      ( DELIVER-4PKG-VERIFY ?auto_229520 ?auto_229521 ?auto_229523 ?auto_229522 ?auto_229519 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229552 - OBJ
      ?auto_229553 - OBJ
      ?auto_229555 - OBJ
      ?auto_229554 - OBJ
      ?auto_229551 - LOCATION
    )
    :vars
    (
      ?auto_229557 - LOCATION
      ?auto_229556 - CITY
      ?auto_229558 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229557 ?auto_229556 ) ( IN-CITY ?auto_229551 ?auto_229556 ) ( not ( = ?auto_229551 ?auto_229557 ) ) ( OBJ-AT ?auto_229553 ?auto_229551 ) ( not ( = ?auto_229553 ?auto_229552 ) ) ( OBJ-AT ?auto_229552 ?auto_229557 ) ( TRUCK-AT ?auto_229558 ?auto_229551 ) ( OBJ-AT ?auto_229555 ?auto_229551 ) ( OBJ-AT ?auto_229554 ?auto_229551 ) ( not ( = ?auto_229552 ?auto_229555 ) ) ( not ( = ?auto_229552 ?auto_229554 ) ) ( not ( = ?auto_229553 ?auto_229555 ) ) ( not ( = ?auto_229553 ?auto_229554 ) ) ( not ( = ?auto_229555 ?auto_229554 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229553 ?auto_229552 ?auto_229551 )
      ( DELIVER-4PKG-VERIFY ?auto_229552 ?auto_229553 ?auto_229555 ?auto_229554 ?auto_229551 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229624 - OBJ
      ?auto_229625 - OBJ
      ?auto_229627 - OBJ
      ?auto_229626 - OBJ
      ?auto_229623 - LOCATION
    )
    :vars
    (
      ?auto_229629 - LOCATION
      ?auto_229628 - CITY
      ?auto_229631 - OBJ
      ?auto_229630 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229629 ?auto_229628 ) ( IN-CITY ?auto_229623 ?auto_229628 ) ( not ( = ?auto_229623 ?auto_229629 ) ) ( OBJ-AT ?auto_229631 ?auto_229623 ) ( not ( = ?auto_229631 ?auto_229624 ) ) ( OBJ-AT ?auto_229624 ?auto_229629 ) ( TRUCK-AT ?auto_229630 ?auto_229623 ) ( OBJ-AT ?auto_229625 ?auto_229623 ) ( OBJ-AT ?auto_229627 ?auto_229623 ) ( OBJ-AT ?auto_229626 ?auto_229623 ) ( not ( = ?auto_229624 ?auto_229625 ) ) ( not ( = ?auto_229624 ?auto_229627 ) ) ( not ( = ?auto_229624 ?auto_229626 ) ) ( not ( = ?auto_229625 ?auto_229627 ) ) ( not ( = ?auto_229625 ?auto_229626 ) ) ( not ( = ?auto_229625 ?auto_229631 ) ) ( not ( = ?auto_229627 ?auto_229626 ) ) ( not ( = ?auto_229627 ?auto_229631 ) ) ( not ( = ?auto_229626 ?auto_229631 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229631 ?auto_229624 ?auto_229623 )
      ( DELIVER-4PKG-VERIFY ?auto_229624 ?auto_229625 ?auto_229627 ?auto_229626 ?auto_229623 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229744 - OBJ
      ?auto_229745 - OBJ
      ?auto_229747 - OBJ
      ?auto_229746 - OBJ
      ?auto_229748 - OBJ
      ?auto_229743 - LOCATION
    )
    :vars
    (
      ?auto_229750 - LOCATION
      ?auto_229749 - CITY
      ?auto_229751 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229750 ?auto_229749 ) ( IN-CITY ?auto_229743 ?auto_229749 ) ( not ( = ?auto_229743 ?auto_229750 ) ) ( OBJ-AT ?auto_229747 ?auto_229743 ) ( not ( = ?auto_229747 ?auto_229748 ) ) ( OBJ-AT ?auto_229748 ?auto_229750 ) ( TRUCK-AT ?auto_229751 ?auto_229743 ) ( OBJ-AT ?auto_229744 ?auto_229743 ) ( OBJ-AT ?auto_229745 ?auto_229743 ) ( OBJ-AT ?auto_229746 ?auto_229743 ) ( not ( = ?auto_229744 ?auto_229745 ) ) ( not ( = ?auto_229744 ?auto_229747 ) ) ( not ( = ?auto_229744 ?auto_229746 ) ) ( not ( = ?auto_229744 ?auto_229748 ) ) ( not ( = ?auto_229745 ?auto_229747 ) ) ( not ( = ?auto_229745 ?auto_229746 ) ) ( not ( = ?auto_229745 ?auto_229748 ) ) ( not ( = ?auto_229747 ?auto_229746 ) ) ( not ( = ?auto_229746 ?auto_229748 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229747 ?auto_229748 ?auto_229743 )
      ( DELIVER-5PKG-VERIFY ?auto_229744 ?auto_229745 ?auto_229747 ?auto_229746 ?auto_229748 ?auto_229743 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229834 - OBJ
      ?auto_229835 - OBJ
      ?auto_229837 - OBJ
      ?auto_229836 - OBJ
      ?auto_229838 - OBJ
      ?auto_229833 - LOCATION
    )
    :vars
    (
      ?auto_229840 - LOCATION
      ?auto_229839 - CITY
      ?auto_229841 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229840 ?auto_229839 ) ( IN-CITY ?auto_229833 ?auto_229839 ) ( not ( = ?auto_229833 ?auto_229840 ) ) ( OBJ-AT ?auto_229835 ?auto_229833 ) ( not ( = ?auto_229835 ?auto_229837 ) ) ( OBJ-AT ?auto_229837 ?auto_229840 ) ( TRUCK-AT ?auto_229841 ?auto_229833 ) ( OBJ-AT ?auto_229834 ?auto_229833 ) ( OBJ-AT ?auto_229836 ?auto_229833 ) ( OBJ-AT ?auto_229838 ?auto_229833 ) ( not ( = ?auto_229834 ?auto_229835 ) ) ( not ( = ?auto_229834 ?auto_229837 ) ) ( not ( = ?auto_229834 ?auto_229836 ) ) ( not ( = ?auto_229834 ?auto_229838 ) ) ( not ( = ?auto_229835 ?auto_229836 ) ) ( not ( = ?auto_229835 ?auto_229838 ) ) ( not ( = ?auto_229837 ?auto_229836 ) ) ( not ( = ?auto_229837 ?auto_229838 ) ) ( not ( = ?auto_229836 ?auto_229838 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229835 ?auto_229837 ?auto_229833 )
      ( DELIVER-5PKG-VERIFY ?auto_229834 ?auto_229835 ?auto_229837 ?auto_229836 ?auto_229838 ?auto_229833 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229960 - OBJ
      ?auto_229961 - OBJ
      ?auto_229963 - OBJ
      ?auto_229962 - OBJ
      ?auto_229964 - OBJ
      ?auto_229959 - LOCATION
    )
    :vars
    (
      ?auto_229966 - LOCATION
      ?auto_229965 - CITY
      ?auto_229967 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229966 ?auto_229965 ) ( IN-CITY ?auto_229959 ?auto_229965 ) ( not ( = ?auto_229959 ?auto_229966 ) ) ( OBJ-AT ?auto_229962 ?auto_229959 ) ( not ( = ?auto_229962 ?auto_229964 ) ) ( OBJ-AT ?auto_229964 ?auto_229966 ) ( TRUCK-AT ?auto_229967 ?auto_229959 ) ( OBJ-AT ?auto_229960 ?auto_229959 ) ( OBJ-AT ?auto_229961 ?auto_229959 ) ( OBJ-AT ?auto_229963 ?auto_229959 ) ( not ( = ?auto_229960 ?auto_229961 ) ) ( not ( = ?auto_229960 ?auto_229963 ) ) ( not ( = ?auto_229960 ?auto_229962 ) ) ( not ( = ?auto_229960 ?auto_229964 ) ) ( not ( = ?auto_229961 ?auto_229963 ) ) ( not ( = ?auto_229961 ?auto_229962 ) ) ( not ( = ?auto_229961 ?auto_229964 ) ) ( not ( = ?auto_229963 ?auto_229962 ) ) ( not ( = ?auto_229963 ?auto_229964 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229962 ?auto_229964 ?auto_229959 )
      ( DELIVER-5PKG-VERIFY ?auto_229960 ?auto_229961 ?auto_229963 ?auto_229962 ?auto_229964 ?auto_229959 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230005 - OBJ
      ?auto_230006 - OBJ
      ?auto_230008 - OBJ
      ?auto_230007 - OBJ
      ?auto_230009 - OBJ
      ?auto_230004 - LOCATION
    )
    :vars
    (
      ?auto_230011 - LOCATION
      ?auto_230010 - CITY
      ?auto_230012 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230011 ?auto_230010 ) ( IN-CITY ?auto_230004 ?auto_230010 ) ( not ( = ?auto_230004 ?auto_230011 ) ) ( OBJ-AT ?auto_230009 ?auto_230004 ) ( not ( = ?auto_230009 ?auto_230008 ) ) ( OBJ-AT ?auto_230008 ?auto_230011 ) ( TRUCK-AT ?auto_230012 ?auto_230004 ) ( OBJ-AT ?auto_230005 ?auto_230004 ) ( OBJ-AT ?auto_230006 ?auto_230004 ) ( OBJ-AT ?auto_230007 ?auto_230004 ) ( not ( = ?auto_230005 ?auto_230006 ) ) ( not ( = ?auto_230005 ?auto_230008 ) ) ( not ( = ?auto_230005 ?auto_230007 ) ) ( not ( = ?auto_230005 ?auto_230009 ) ) ( not ( = ?auto_230006 ?auto_230008 ) ) ( not ( = ?auto_230006 ?auto_230007 ) ) ( not ( = ?auto_230006 ?auto_230009 ) ) ( not ( = ?auto_230008 ?auto_230007 ) ) ( not ( = ?auto_230007 ?auto_230009 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230009 ?auto_230008 ?auto_230004 )
      ( DELIVER-5PKG-VERIFY ?auto_230005 ?auto_230006 ?auto_230008 ?auto_230007 ?auto_230009 ?auto_230004 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230014 - OBJ
      ?auto_230015 - OBJ
      ?auto_230017 - OBJ
      ?auto_230016 - OBJ
      ?auto_230018 - OBJ
      ?auto_230013 - LOCATION
    )
    :vars
    (
      ?auto_230020 - LOCATION
      ?auto_230019 - CITY
      ?auto_230021 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230020 ?auto_230019 ) ( IN-CITY ?auto_230013 ?auto_230019 ) ( not ( = ?auto_230013 ?auto_230020 ) ) ( OBJ-AT ?auto_230016 ?auto_230013 ) ( not ( = ?auto_230016 ?auto_230017 ) ) ( OBJ-AT ?auto_230017 ?auto_230020 ) ( TRUCK-AT ?auto_230021 ?auto_230013 ) ( OBJ-AT ?auto_230014 ?auto_230013 ) ( OBJ-AT ?auto_230015 ?auto_230013 ) ( OBJ-AT ?auto_230018 ?auto_230013 ) ( not ( = ?auto_230014 ?auto_230015 ) ) ( not ( = ?auto_230014 ?auto_230017 ) ) ( not ( = ?auto_230014 ?auto_230016 ) ) ( not ( = ?auto_230014 ?auto_230018 ) ) ( not ( = ?auto_230015 ?auto_230017 ) ) ( not ( = ?auto_230015 ?auto_230016 ) ) ( not ( = ?auto_230015 ?auto_230018 ) ) ( not ( = ?auto_230017 ?auto_230018 ) ) ( not ( = ?auto_230016 ?auto_230018 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230016 ?auto_230017 ?auto_230013 )
      ( DELIVER-5PKG-VERIFY ?auto_230014 ?auto_230015 ?auto_230017 ?auto_230016 ?auto_230018 ?auto_230013 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230095 - OBJ
      ?auto_230096 - OBJ
      ?auto_230098 - OBJ
      ?auto_230097 - OBJ
      ?auto_230099 - OBJ
      ?auto_230094 - LOCATION
    )
    :vars
    (
      ?auto_230101 - LOCATION
      ?auto_230100 - CITY
      ?auto_230102 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230101 ?auto_230100 ) ( IN-CITY ?auto_230094 ?auto_230100 ) ( not ( = ?auto_230094 ?auto_230101 ) ) ( OBJ-AT ?auto_230095 ?auto_230094 ) ( not ( = ?auto_230095 ?auto_230096 ) ) ( OBJ-AT ?auto_230096 ?auto_230101 ) ( TRUCK-AT ?auto_230102 ?auto_230094 ) ( OBJ-AT ?auto_230098 ?auto_230094 ) ( OBJ-AT ?auto_230097 ?auto_230094 ) ( OBJ-AT ?auto_230099 ?auto_230094 ) ( not ( = ?auto_230095 ?auto_230098 ) ) ( not ( = ?auto_230095 ?auto_230097 ) ) ( not ( = ?auto_230095 ?auto_230099 ) ) ( not ( = ?auto_230096 ?auto_230098 ) ) ( not ( = ?auto_230096 ?auto_230097 ) ) ( not ( = ?auto_230096 ?auto_230099 ) ) ( not ( = ?auto_230098 ?auto_230097 ) ) ( not ( = ?auto_230098 ?auto_230099 ) ) ( not ( = ?auto_230097 ?auto_230099 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230095 ?auto_230096 ?auto_230094 )
      ( DELIVER-5PKG-VERIFY ?auto_230095 ?auto_230096 ?auto_230098 ?auto_230097 ?auto_230099 ?auto_230094 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230113 - OBJ
      ?auto_230114 - OBJ
      ?auto_230116 - OBJ
      ?auto_230115 - OBJ
      ?auto_230117 - OBJ
      ?auto_230112 - LOCATION
    )
    :vars
    (
      ?auto_230119 - LOCATION
      ?auto_230118 - CITY
      ?auto_230120 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230119 ?auto_230118 ) ( IN-CITY ?auto_230112 ?auto_230118 ) ( not ( = ?auto_230112 ?auto_230119 ) ) ( OBJ-AT ?auto_230117 ?auto_230112 ) ( not ( = ?auto_230117 ?auto_230114 ) ) ( OBJ-AT ?auto_230114 ?auto_230119 ) ( TRUCK-AT ?auto_230120 ?auto_230112 ) ( OBJ-AT ?auto_230113 ?auto_230112 ) ( OBJ-AT ?auto_230116 ?auto_230112 ) ( OBJ-AT ?auto_230115 ?auto_230112 ) ( not ( = ?auto_230113 ?auto_230114 ) ) ( not ( = ?auto_230113 ?auto_230116 ) ) ( not ( = ?auto_230113 ?auto_230115 ) ) ( not ( = ?auto_230113 ?auto_230117 ) ) ( not ( = ?auto_230114 ?auto_230116 ) ) ( not ( = ?auto_230114 ?auto_230115 ) ) ( not ( = ?auto_230116 ?auto_230115 ) ) ( not ( = ?auto_230116 ?auto_230117 ) ) ( not ( = ?auto_230115 ?auto_230117 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230117 ?auto_230114 ?auto_230112 )
      ( DELIVER-5PKG-VERIFY ?auto_230113 ?auto_230114 ?auto_230116 ?auto_230115 ?auto_230117 ?auto_230112 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230329 - OBJ
      ?auto_230330 - OBJ
      ?auto_230332 - OBJ
      ?auto_230331 - OBJ
      ?auto_230333 - OBJ
      ?auto_230328 - LOCATION
    )
    :vars
    (
      ?auto_230335 - LOCATION
      ?auto_230334 - CITY
      ?auto_230336 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230335 ?auto_230334 ) ( IN-CITY ?auto_230328 ?auto_230334 ) ( not ( = ?auto_230328 ?auto_230335 ) ) ( OBJ-AT ?auto_230330 ?auto_230328 ) ( not ( = ?auto_230330 ?auto_230333 ) ) ( OBJ-AT ?auto_230333 ?auto_230335 ) ( TRUCK-AT ?auto_230336 ?auto_230328 ) ( OBJ-AT ?auto_230329 ?auto_230328 ) ( OBJ-AT ?auto_230332 ?auto_230328 ) ( OBJ-AT ?auto_230331 ?auto_230328 ) ( not ( = ?auto_230329 ?auto_230330 ) ) ( not ( = ?auto_230329 ?auto_230332 ) ) ( not ( = ?auto_230329 ?auto_230331 ) ) ( not ( = ?auto_230329 ?auto_230333 ) ) ( not ( = ?auto_230330 ?auto_230332 ) ) ( not ( = ?auto_230330 ?auto_230331 ) ) ( not ( = ?auto_230332 ?auto_230331 ) ) ( not ( = ?auto_230332 ?auto_230333 ) ) ( not ( = ?auto_230331 ?auto_230333 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230330 ?auto_230333 ?auto_230328 )
      ( DELIVER-5PKG-VERIFY ?auto_230329 ?auto_230330 ?auto_230332 ?auto_230331 ?auto_230333 ?auto_230328 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230347 - OBJ
      ?auto_230348 - OBJ
      ?auto_230350 - OBJ
      ?auto_230349 - OBJ
      ?auto_230351 - OBJ
      ?auto_230346 - LOCATION
    )
    :vars
    (
      ?auto_230353 - LOCATION
      ?auto_230352 - CITY
      ?auto_230354 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230353 ?auto_230352 ) ( IN-CITY ?auto_230346 ?auto_230352 ) ( not ( = ?auto_230346 ?auto_230353 ) ) ( OBJ-AT ?auto_230348 ?auto_230346 ) ( not ( = ?auto_230348 ?auto_230349 ) ) ( OBJ-AT ?auto_230349 ?auto_230353 ) ( TRUCK-AT ?auto_230354 ?auto_230346 ) ( OBJ-AT ?auto_230347 ?auto_230346 ) ( OBJ-AT ?auto_230350 ?auto_230346 ) ( OBJ-AT ?auto_230351 ?auto_230346 ) ( not ( = ?auto_230347 ?auto_230348 ) ) ( not ( = ?auto_230347 ?auto_230350 ) ) ( not ( = ?auto_230347 ?auto_230349 ) ) ( not ( = ?auto_230347 ?auto_230351 ) ) ( not ( = ?auto_230348 ?auto_230350 ) ) ( not ( = ?auto_230348 ?auto_230351 ) ) ( not ( = ?auto_230350 ?auto_230349 ) ) ( not ( = ?auto_230350 ?auto_230351 ) ) ( not ( = ?auto_230349 ?auto_230351 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230348 ?auto_230349 ?auto_230346 )
      ( DELIVER-5PKG-VERIFY ?auto_230347 ?auto_230348 ?auto_230350 ?auto_230349 ?auto_230351 ?auto_230346 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230518 - OBJ
      ?auto_230519 - OBJ
      ?auto_230521 - OBJ
      ?auto_230520 - OBJ
      ?auto_230522 - OBJ
      ?auto_230517 - LOCATION
    )
    :vars
    (
      ?auto_230524 - LOCATION
      ?auto_230523 - CITY
      ?auto_230525 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230524 ?auto_230523 ) ( IN-CITY ?auto_230517 ?auto_230523 ) ( not ( = ?auto_230517 ?auto_230524 ) ) ( OBJ-AT ?auto_230522 ?auto_230517 ) ( not ( = ?auto_230522 ?auto_230520 ) ) ( OBJ-AT ?auto_230520 ?auto_230524 ) ( TRUCK-AT ?auto_230525 ?auto_230517 ) ( OBJ-AT ?auto_230518 ?auto_230517 ) ( OBJ-AT ?auto_230519 ?auto_230517 ) ( OBJ-AT ?auto_230521 ?auto_230517 ) ( not ( = ?auto_230518 ?auto_230519 ) ) ( not ( = ?auto_230518 ?auto_230521 ) ) ( not ( = ?auto_230518 ?auto_230520 ) ) ( not ( = ?auto_230518 ?auto_230522 ) ) ( not ( = ?auto_230519 ?auto_230521 ) ) ( not ( = ?auto_230519 ?auto_230520 ) ) ( not ( = ?auto_230519 ?auto_230522 ) ) ( not ( = ?auto_230521 ?auto_230520 ) ) ( not ( = ?auto_230521 ?auto_230522 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230522 ?auto_230520 ?auto_230517 )
      ( DELIVER-5PKG-VERIFY ?auto_230518 ?auto_230519 ?auto_230521 ?auto_230520 ?auto_230522 ?auto_230517 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230527 - OBJ
      ?auto_230528 - OBJ
      ?auto_230530 - OBJ
      ?auto_230529 - OBJ
      ?auto_230531 - OBJ
      ?auto_230526 - LOCATION
    )
    :vars
    (
      ?auto_230533 - LOCATION
      ?auto_230532 - CITY
      ?auto_230534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230533 ?auto_230532 ) ( IN-CITY ?auto_230526 ?auto_230532 ) ( not ( = ?auto_230526 ?auto_230533 ) ) ( OBJ-AT ?auto_230530 ?auto_230526 ) ( not ( = ?auto_230530 ?auto_230529 ) ) ( OBJ-AT ?auto_230529 ?auto_230533 ) ( TRUCK-AT ?auto_230534 ?auto_230526 ) ( OBJ-AT ?auto_230527 ?auto_230526 ) ( OBJ-AT ?auto_230528 ?auto_230526 ) ( OBJ-AT ?auto_230531 ?auto_230526 ) ( not ( = ?auto_230527 ?auto_230528 ) ) ( not ( = ?auto_230527 ?auto_230530 ) ) ( not ( = ?auto_230527 ?auto_230529 ) ) ( not ( = ?auto_230527 ?auto_230531 ) ) ( not ( = ?auto_230528 ?auto_230530 ) ) ( not ( = ?auto_230528 ?auto_230529 ) ) ( not ( = ?auto_230528 ?auto_230531 ) ) ( not ( = ?auto_230530 ?auto_230531 ) ) ( not ( = ?auto_230529 ?auto_230531 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230530 ?auto_230529 ?auto_230526 )
      ( DELIVER-5PKG-VERIFY ?auto_230527 ?auto_230528 ?auto_230530 ?auto_230529 ?auto_230531 ?auto_230526 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230554 - OBJ
      ?auto_230555 - OBJ
      ?auto_230557 - OBJ
      ?auto_230556 - OBJ
      ?auto_230558 - OBJ
      ?auto_230553 - LOCATION
    )
    :vars
    (
      ?auto_230560 - LOCATION
      ?auto_230559 - CITY
      ?auto_230562 - OBJ
      ?auto_230561 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230560 ?auto_230559 ) ( IN-CITY ?auto_230553 ?auto_230559 ) ( not ( = ?auto_230553 ?auto_230560 ) ) ( OBJ-AT ?auto_230562 ?auto_230553 ) ( not ( = ?auto_230562 ?auto_230558 ) ) ( OBJ-AT ?auto_230558 ?auto_230560 ) ( TRUCK-AT ?auto_230561 ?auto_230553 ) ( OBJ-AT ?auto_230554 ?auto_230553 ) ( OBJ-AT ?auto_230555 ?auto_230553 ) ( OBJ-AT ?auto_230557 ?auto_230553 ) ( OBJ-AT ?auto_230556 ?auto_230553 ) ( not ( = ?auto_230554 ?auto_230555 ) ) ( not ( = ?auto_230554 ?auto_230557 ) ) ( not ( = ?auto_230554 ?auto_230556 ) ) ( not ( = ?auto_230554 ?auto_230558 ) ) ( not ( = ?auto_230554 ?auto_230562 ) ) ( not ( = ?auto_230555 ?auto_230557 ) ) ( not ( = ?auto_230555 ?auto_230556 ) ) ( not ( = ?auto_230555 ?auto_230558 ) ) ( not ( = ?auto_230555 ?auto_230562 ) ) ( not ( = ?auto_230557 ?auto_230556 ) ) ( not ( = ?auto_230557 ?auto_230558 ) ) ( not ( = ?auto_230557 ?auto_230562 ) ) ( not ( = ?auto_230556 ?auto_230558 ) ) ( not ( = ?auto_230556 ?auto_230562 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230562 ?auto_230558 ?auto_230553 )
      ( DELIVER-5PKG-VERIFY ?auto_230554 ?auto_230555 ?auto_230557 ?auto_230556 ?auto_230558 ?auto_230553 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230573 - OBJ
      ?auto_230574 - OBJ
      ?auto_230576 - OBJ
      ?auto_230575 - OBJ
      ?auto_230577 - OBJ
      ?auto_230572 - LOCATION
    )
    :vars
    (
      ?auto_230579 - LOCATION
      ?auto_230578 - CITY
      ?auto_230581 - OBJ
      ?auto_230580 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230579 ?auto_230578 ) ( IN-CITY ?auto_230572 ?auto_230578 ) ( not ( = ?auto_230572 ?auto_230579 ) ) ( OBJ-AT ?auto_230581 ?auto_230572 ) ( not ( = ?auto_230581 ?auto_230575 ) ) ( OBJ-AT ?auto_230575 ?auto_230579 ) ( TRUCK-AT ?auto_230580 ?auto_230572 ) ( OBJ-AT ?auto_230573 ?auto_230572 ) ( OBJ-AT ?auto_230574 ?auto_230572 ) ( OBJ-AT ?auto_230576 ?auto_230572 ) ( OBJ-AT ?auto_230577 ?auto_230572 ) ( not ( = ?auto_230573 ?auto_230574 ) ) ( not ( = ?auto_230573 ?auto_230576 ) ) ( not ( = ?auto_230573 ?auto_230575 ) ) ( not ( = ?auto_230573 ?auto_230577 ) ) ( not ( = ?auto_230573 ?auto_230581 ) ) ( not ( = ?auto_230574 ?auto_230576 ) ) ( not ( = ?auto_230574 ?auto_230575 ) ) ( not ( = ?auto_230574 ?auto_230577 ) ) ( not ( = ?auto_230574 ?auto_230581 ) ) ( not ( = ?auto_230576 ?auto_230575 ) ) ( not ( = ?auto_230576 ?auto_230577 ) ) ( not ( = ?auto_230576 ?auto_230581 ) ) ( not ( = ?auto_230575 ?auto_230577 ) ) ( not ( = ?auto_230577 ?auto_230581 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230581 ?auto_230575 ?auto_230572 )
      ( DELIVER-5PKG-VERIFY ?auto_230573 ?auto_230574 ?auto_230576 ?auto_230575 ?auto_230577 ?auto_230572 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230629 - OBJ
      ?auto_230630 - OBJ
      ?auto_230632 - OBJ
      ?auto_230631 - OBJ
      ?auto_230633 - OBJ
      ?auto_230628 - LOCATION
    )
    :vars
    (
      ?auto_230635 - LOCATION
      ?auto_230634 - CITY
      ?auto_230637 - OBJ
      ?auto_230636 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230635 ?auto_230634 ) ( IN-CITY ?auto_230628 ?auto_230634 ) ( not ( = ?auto_230628 ?auto_230635 ) ) ( OBJ-AT ?auto_230637 ?auto_230628 ) ( not ( = ?auto_230637 ?auto_230632 ) ) ( OBJ-AT ?auto_230632 ?auto_230635 ) ( TRUCK-AT ?auto_230636 ?auto_230628 ) ( OBJ-AT ?auto_230629 ?auto_230628 ) ( OBJ-AT ?auto_230630 ?auto_230628 ) ( OBJ-AT ?auto_230631 ?auto_230628 ) ( OBJ-AT ?auto_230633 ?auto_230628 ) ( not ( = ?auto_230629 ?auto_230630 ) ) ( not ( = ?auto_230629 ?auto_230632 ) ) ( not ( = ?auto_230629 ?auto_230631 ) ) ( not ( = ?auto_230629 ?auto_230633 ) ) ( not ( = ?auto_230629 ?auto_230637 ) ) ( not ( = ?auto_230630 ?auto_230632 ) ) ( not ( = ?auto_230630 ?auto_230631 ) ) ( not ( = ?auto_230630 ?auto_230633 ) ) ( not ( = ?auto_230630 ?auto_230637 ) ) ( not ( = ?auto_230632 ?auto_230631 ) ) ( not ( = ?auto_230632 ?auto_230633 ) ) ( not ( = ?auto_230631 ?auto_230633 ) ) ( not ( = ?auto_230631 ?auto_230637 ) ) ( not ( = ?auto_230633 ?auto_230637 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230637 ?auto_230632 ?auto_230628 )
      ( DELIVER-5PKG-VERIFY ?auto_230629 ?auto_230630 ?auto_230632 ?auto_230631 ?auto_230633 ?auto_230628 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230687 - OBJ
      ?auto_230688 - OBJ
      ?auto_230690 - OBJ
      ?auto_230689 - OBJ
      ?auto_230691 - OBJ
      ?auto_230686 - LOCATION
    )
    :vars
    (
      ?auto_230693 - LOCATION
      ?auto_230692 - CITY
      ?auto_230694 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230693 ?auto_230692 ) ( IN-CITY ?auto_230686 ?auto_230692 ) ( not ( = ?auto_230686 ?auto_230693 ) ) ( OBJ-AT ?auto_230689 ?auto_230686 ) ( not ( = ?auto_230689 ?auto_230688 ) ) ( OBJ-AT ?auto_230688 ?auto_230693 ) ( TRUCK-AT ?auto_230694 ?auto_230686 ) ( OBJ-AT ?auto_230687 ?auto_230686 ) ( OBJ-AT ?auto_230690 ?auto_230686 ) ( OBJ-AT ?auto_230691 ?auto_230686 ) ( not ( = ?auto_230687 ?auto_230688 ) ) ( not ( = ?auto_230687 ?auto_230690 ) ) ( not ( = ?auto_230687 ?auto_230689 ) ) ( not ( = ?auto_230687 ?auto_230691 ) ) ( not ( = ?auto_230688 ?auto_230690 ) ) ( not ( = ?auto_230688 ?auto_230691 ) ) ( not ( = ?auto_230690 ?auto_230689 ) ) ( not ( = ?auto_230690 ?auto_230691 ) ) ( not ( = ?auto_230689 ?auto_230691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230689 ?auto_230688 ?auto_230686 )
      ( DELIVER-5PKG-VERIFY ?auto_230687 ?auto_230688 ?auto_230690 ?auto_230689 ?auto_230691 ?auto_230686 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230795 - OBJ
      ?auto_230796 - OBJ
      ?auto_230798 - OBJ
      ?auto_230797 - OBJ
      ?auto_230799 - OBJ
      ?auto_230794 - LOCATION
    )
    :vars
    (
      ?auto_230801 - LOCATION
      ?auto_230800 - CITY
      ?auto_230803 - OBJ
      ?auto_230802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230801 ?auto_230800 ) ( IN-CITY ?auto_230794 ?auto_230800 ) ( not ( = ?auto_230794 ?auto_230801 ) ) ( OBJ-AT ?auto_230803 ?auto_230794 ) ( not ( = ?auto_230803 ?auto_230796 ) ) ( OBJ-AT ?auto_230796 ?auto_230801 ) ( TRUCK-AT ?auto_230802 ?auto_230794 ) ( OBJ-AT ?auto_230795 ?auto_230794 ) ( OBJ-AT ?auto_230798 ?auto_230794 ) ( OBJ-AT ?auto_230797 ?auto_230794 ) ( OBJ-AT ?auto_230799 ?auto_230794 ) ( not ( = ?auto_230795 ?auto_230796 ) ) ( not ( = ?auto_230795 ?auto_230798 ) ) ( not ( = ?auto_230795 ?auto_230797 ) ) ( not ( = ?auto_230795 ?auto_230799 ) ) ( not ( = ?auto_230795 ?auto_230803 ) ) ( not ( = ?auto_230796 ?auto_230798 ) ) ( not ( = ?auto_230796 ?auto_230797 ) ) ( not ( = ?auto_230796 ?auto_230799 ) ) ( not ( = ?auto_230798 ?auto_230797 ) ) ( not ( = ?auto_230798 ?auto_230799 ) ) ( not ( = ?auto_230798 ?auto_230803 ) ) ( not ( = ?auto_230797 ?auto_230799 ) ) ( not ( = ?auto_230797 ?auto_230803 ) ) ( not ( = ?auto_230799 ?auto_230803 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230803 ?auto_230796 ?auto_230794 )
      ( DELIVER-5PKG-VERIFY ?auto_230795 ?auto_230796 ?auto_230798 ?auto_230797 ?auto_230799 ?auto_230794 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230929 - OBJ
      ?auto_230930 - OBJ
      ?auto_230932 - OBJ
      ?auto_230931 - OBJ
      ?auto_230933 - OBJ
      ?auto_230928 - LOCATION
    )
    :vars
    (
      ?auto_230935 - LOCATION
      ?auto_230934 - CITY
      ?auto_230936 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230935 ?auto_230934 ) ( IN-CITY ?auto_230928 ?auto_230934 ) ( not ( = ?auto_230928 ?auto_230935 ) ) ( OBJ-AT ?auto_230931 ?auto_230928 ) ( not ( = ?auto_230931 ?auto_230929 ) ) ( OBJ-AT ?auto_230929 ?auto_230935 ) ( TRUCK-AT ?auto_230936 ?auto_230928 ) ( OBJ-AT ?auto_230930 ?auto_230928 ) ( OBJ-AT ?auto_230932 ?auto_230928 ) ( OBJ-AT ?auto_230933 ?auto_230928 ) ( not ( = ?auto_230929 ?auto_230930 ) ) ( not ( = ?auto_230929 ?auto_230932 ) ) ( not ( = ?auto_230929 ?auto_230933 ) ) ( not ( = ?auto_230930 ?auto_230932 ) ) ( not ( = ?auto_230930 ?auto_230931 ) ) ( not ( = ?auto_230930 ?auto_230933 ) ) ( not ( = ?auto_230932 ?auto_230931 ) ) ( not ( = ?auto_230932 ?auto_230933 ) ) ( not ( = ?auto_230931 ?auto_230933 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230931 ?auto_230929 ?auto_230928 )
      ( DELIVER-5PKG-VERIFY ?auto_230929 ?auto_230930 ?auto_230932 ?auto_230931 ?auto_230933 ?auto_230928 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230938 - OBJ
      ?auto_230939 - OBJ
      ?auto_230941 - OBJ
      ?auto_230940 - OBJ
      ?auto_230942 - OBJ
      ?auto_230937 - LOCATION
    )
    :vars
    (
      ?auto_230944 - LOCATION
      ?auto_230943 - CITY
      ?auto_230945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230944 ?auto_230943 ) ( IN-CITY ?auto_230937 ?auto_230943 ) ( not ( = ?auto_230937 ?auto_230944 ) ) ( OBJ-AT ?auto_230941 ?auto_230937 ) ( not ( = ?auto_230941 ?auto_230938 ) ) ( OBJ-AT ?auto_230938 ?auto_230944 ) ( TRUCK-AT ?auto_230945 ?auto_230937 ) ( OBJ-AT ?auto_230939 ?auto_230937 ) ( OBJ-AT ?auto_230940 ?auto_230937 ) ( OBJ-AT ?auto_230942 ?auto_230937 ) ( not ( = ?auto_230938 ?auto_230939 ) ) ( not ( = ?auto_230938 ?auto_230940 ) ) ( not ( = ?auto_230938 ?auto_230942 ) ) ( not ( = ?auto_230939 ?auto_230941 ) ) ( not ( = ?auto_230939 ?auto_230940 ) ) ( not ( = ?auto_230939 ?auto_230942 ) ) ( not ( = ?auto_230941 ?auto_230940 ) ) ( not ( = ?auto_230941 ?auto_230942 ) ) ( not ( = ?auto_230940 ?auto_230942 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230941 ?auto_230938 ?auto_230937 )
      ( DELIVER-5PKG-VERIFY ?auto_230938 ?auto_230939 ?auto_230941 ?auto_230940 ?auto_230942 ?auto_230937 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230965 - OBJ
      ?auto_230966 - OBJ
      ?auto_230968 - OBJ
      ?auto_230967 - OBJ
      ?auto_230969 - OBJ
      ?auto_230964 - LOCATION
    )
    :vars
    (
      ?auto_230971 - LOCATION
      ?auto_230970 - CITY
      ?auto_230972 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230971 ?auto_230970 ) ( IN-CITY ?auto_230964 ?auto_230970 ) ( not ( = ?auto_230964 ?auto_230971 ) ) ( OBJ-AT ?auto_230966 ?auto_230964 ) ( not ( = ?auto_230966 ?auto_230965 ) ) ( OBJ-AT ?auto_230965 ?auto_230971 ) ( TRUCK-AT ?auto_230972 ?auto_230964 ) ( OBJ-AT ?auto_230968 ?auto_230964 ) ( OBJ-AT ?auto_230967 ?auto_230964 ) ( OBJ-AT ?auto_230969 ?auto_230964 ) ( not ( = ?auto_230965 ?auto_230968 ) ) ( not ( = ?auto_230965 ?auto_230967 ) ) ( not ( = ?auto_230965 ?auto_230969 ) ) ( not ( = ?auto_230966 ?auto_230968 ) ) ( not ( = ?auto_230966 ?auto_230967 ) ) ( not ( = ?auto_230966 ?auto_230969 ) ) ( not ( = ?auto_230968 ?auto_230967 ) ) ( not ( = ?auto_230968 ?auto_230969 ) ) ( not ( = ?auto_230967 ?auto_230969 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230966 ?auto_230965 ?auto_230964 )
      ( DELIVER-5PKG-VERIFY ?auto_230965 ?auto_230966 ?auto_230968 ?auto_230967 ?auto_230969 ?auto_230964 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_231289 - OBJ
      ?auto_231290 - OBJ
      ?auto_231292 - OBJ
      ?auto_231291 - OBJ
      ?auto_231293 - OBJ
      ?auto_231288 - LOCATION
    )
    :vars
    (
      ?auto_231295 - LOCATION
      ?auto_231294 - CITY
      ?auto_231297 - OBJ
      ?auto_231296 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_231295 ?auto_231294 ) ( IN-CITY ?auto_231288 ?auto_231294 ) ( not ( = ?auto_231288 ?auto_231295 ) ) ( OBJ-AT ?auto_231297 ?auto_231288 ) ( not ( = ?auto_231297 ?auto_231289 ) ) ( OBJ-AT ?auto_231289 ?auto_231295 ) ( TRUCK-AT ?auto_231296 ?auto_231288 ) ( OBJ-AT ?auto_231290 ?auto_231288 ) ( OBJ-AT ?auto_231292 ?auto_231288 ) ( OBJ-AT ?auto_231291 ?auto_231288 ) ( OBJ-AT ?auto_231293 ?auto_231288 ) ( not ( = ?auto_231289 ?auto_231290 ) ) ( not ( = ?auto_231289 ?auto_231292 ) ) ( not ( = ?auto_231289 ?auto_231291 ) ) ( not ( = ?auto_231289 ?auto_231293 ) ) ( not ( = ?auto_231290 ?auto_231292 ) ) ( not ( = ?auto_231290 ?auto_231291 ) ) ( not ( = ?auto_231290 ?auto_231293 ) ) ( not ( = ?auto_231290 ?auto_231297 ) ) ( not ( = ?auto_231292 ?auto_231291 ) ) ( not ( = ?auto_231292 ?auto_231293 ) ) ( not ( = ?auto_231292 ?auto_231297 ) ) ( not ( = ?auto_231291 ?auto_231293 ) ) ( not ( = ?auto_231291 ?auto_231297 ) ) ( not ( = ?auto_231293 ?auto_231297 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_231297 ?auto_231289 ?auto_231288 )
      ( DELIVER-5PKG-VERIFY ?auto_231289 ?auto_231290 ?auto_231292 ?auto_231291 ?auto_231293 ?auto_231288 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_231703 - OBJ
      ?auto_231704 - OBJ
      ?auto_231705 - OBJ
      ?auto_231702 - LOCATION
    )
    :vars
    (
      ?auto_231706 - LOCATION
      ?auto_231708 - CITY
      ?auto_231707 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_231706 ?auto_231708 ) ( IN-CITY ?auto_231702 ?auto_231708 ) ( not ( = ?auto_231702 ?auto_231706 ) ) ( OBJ-AT ?auto_231703 ?auto_231702 ) ( not ( = ?auto_231703 ?auto_231705 ) ) ( OBJ-AT ?auto_231705 ?auto_231706 ) ( TRUCK-AT ?auto_231707 ?auto_231702 ) ( OBJ-AT ?auto_231704 ?auto_231702 ) ( not ( = ?auto_231703 ?auto_231704 ) ) ( not ( = ?auto_231704 ?auto_231705 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_231703 ?auto_231705 ?auto_231702 )
      ( DELIVER-3PKG-VERIFY ?auto_231703 ?auto_231704 ?auto_231705 ?auto_231702 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_234308 - OBJ
      ?auto_234307 - LOCATION
    )
    :vars
    (
      ?auto_234309 - LOCATION
      ?auto_234311 - CITY
      ?auto_234312 - OBJ
      ?auto_234310 - TRUCK
      ?auto_234313 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234309 ?auto_234311 ) ( IN-CITY ?auto_234307 ?auto_234311 ) ( not ( = ?auto_234307 ?auto_234309 ) ) ( OBJ-AT ?auto_234312 ?auto_234307 ) ( not ( = ?auto_234312 ?auto_234308 ) ) ( OBJ-AT ?auto_234308 ?auto_234309 ) ( TRUCK-AT ?auto_234310 ?auto_234313 ) ( IN-CITY ?auto_234313 ?auto_234311 ) ( not ( = ?auto_234307 ?auto_234313 ) ) ( not ( = ?auto_234309 ?auto_234313 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_234310 ?auto_234313 ?auto_234307 ?auto_234311 )
      ( DELIVER-2PKG ?auto_234312 ?auto_234308 ?auto_234307 )
      ( DELIVER-1PKG-VERIFY ?auto_234308 ?auto_234307 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_234315 - OBJ
      ?auto_234316 - OBJ
      ?auto_234314 - LOCATION
    )
    :vars
    (
      ?auto_234319 - LOCATION
      ?auto_234320 - CITY
      ?auto_234317 - TRUCK
      ?auto_234318 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234319 ?auto_234320 ) ( IN-CITY ?auto_234314 ?auto_234320 ) ( not ( = ?auto_234314 ?auto_234319 ) ) ( OBJ-AT ?auto_234315 ?auto_234314 ) ( not ( = ?auto_234315 ?auto_234316 ) ) ( OBJ-AT ?auto_234316 ?auto_234319 ) ( TRUCK-AT ?auto_234317 ?auto_234318 ) ( IN-CITY ?auto_234318 ?auto_234320 ) ( not ( = ?auto_234314 ?auto_234318 ) ) ( not ( = ?auto_234319 ?auto_234318 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_234316 ?auto_234314 )
      ( DELIVER-2PKG-VERIFY ?auto_234315 ?auto_234316 ?auto_234314 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_234330 - OBJ
      ?auto_234331 - OBJ
      ?auto_234329 - LOCATION
    )
    :vars
    (
      ?auto_234335 - LOCATION
      ?auto_234333 - CITY
      ?auto_234334 - TRUCK
      ?auto_234332 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234335 ?auto_234333 ) ( IN-CITY ?auto_234329 ?auto_234333 ) ( not ( = ?auto_234329 ?auto_234335 ) ) ( OBJ-AT ?auto_234331 ?auto_234329 ) ( not ( = ?auto_234331 ?auto_234330 ) ) ( OBJ-AT ?auto_234330 ?auto_234335 ) ( TRUCK-AT ?auto_234334 ?auto_234332 ) ( IN-CITY ?auto_234332 ?auto_234333 ) ( not ( = ?auto_234329 ?auto_234332 ) ) ( not ( = ?auto_234335 ?auto_234332 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234331 ?auto_234330 ?auto_234329 )
      ( DELIVER-2PKG-VERIFY ?auto_234330 ?auto_234331 ?auto_234329 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_234353 - OBJ
      ?auto_234354 - OBJ
      ?auto_234355 - OBJ
      ?auto_234352 - LOCATION
    )
    :vars
    (
      ?auto_234359 - LOCATION
      ?auto_234357 - CITY
      ?auto_234358 - TRUCK
      ?auto_234356 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234359 ?auto_234357 ) ( IN-CITY ?auto_234352 ?auto_234357 ) ( not ( = ?auto_234352 ?auto_234359 ) ) ( OBJ-AT ?auto_234354 ?auto_234352 ) ( not ( = ?auto_234354 ?auto_234355 ) ) ( OBJ-AT ?auto_234355 ?auto_234359 ) ( TRUCK-AT ?auto_234358 ?auto_234356 ) ( IN-CITY ?auto_234356 ?auto_234357 ) ( not ( = ?auto_234352 ?auto_234356 ) ) ( not ( = ?auto_234359 ?auto_234356 ) ) ( OBJ-AT ?auto_234353 ?auto_234352 ) ( not ( = ?auto_234353 ?auto_234354 ) ) ( not ( = ?auto_234353 ?auto_234355 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234354 ?auto_234355 ?auto_234352 )
      ( DELIVER-3PKG-VERIFY ?auto_234353 ?auto_234354 ?auto_234355 ?auto_234352 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_234369 - OBJ
      ?auto_234370 - OBJ
      ?auto_234371 - OBJ
      ?auto_234368 - LOCATION
    )
    :vars
    (
      ?auto_234375 - LOCATION
      ?auto_234373 - CITY
      ?auto_234374 - TRUCK
      ?auto_234372 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234375 ?auto_234373 ) ( IN-CITY ?auto_234368 ?auto_234373 ) ( not ( = ?auto_234368 ?auto_234375 ) ) ( OBJ-AT ?auto_234371 ?auto_234368 ) ( not ( = ?auto_234371 ?auto_234370 ) ) ( OBJ-AT ?auto_234370 ?auto_234375 ) ( TRUCK-AT ?auto_234374 ?auto_234372 ) ( IN-CITY ?auto_234372 ?auto_234373 ) ( not ( = ?auto_234368 ?auto_234372 ) ) ( not ( = ?auto_234375 ?auto_234372 ) ) ( OBJ-AT ?auto_234369 ?auto_234368 ) ( not ( = ?auto_234369 ?auto_234370 ) ) ( not ( = ?auto_234369 ?auto_234371 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234371 ?auto_234370 ?auto_234368 )
      ( DELIVER-3PKG-VERIFY ?auto_234369 ?auto_234370 ?auto_234371 ?auto_234368 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_234436 - OBJ
      ?auto_234437 - OBJ
      ?auto_234438 - OBJ
      ?auto_234435 - LOCATION
    )
    :vars
    (
      ?auto_234442 - LOCATION
      ?auto_234440 - CITY
      ?auto_234441 - TRUCK
      ?auto_234439 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234442 ?auto_234440 ) ( IN-CITY ?auto_234435 ?auto_234440 ) ( not ( = ?auto_234435 ?auto_234442 ) ) ( OBJ-AT ?auto_234438 ?auto_234435 ) ( not ( = ?auto_234438 ?auto_234436 ) ) ( OBJ-AT ?auto_234436 ?auto_234442 ) ( TRUCK-AT ?auto_234441 ?auto_234439 ) ( IN-CITY ?auto_234439 ?auto_234440 ) ( not ( = ?auto_234435 ?auto_234439 ) ) ( not ( = ?auto_234442 ?auto_234439 ) ) ( OBJ-AT ?auto_234437 ?auto_234435 ) ( not ( = ?auto_234436 ?auto_234437 ) ) ( not ( = ?auto_234437 ?auto_234438 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234438 ?auto_234436 ?auto_234435 )
      ( DELIVER-3PKG-VERIFY ?auto_234436 ?auto_234437 ?auto_234438 ?auto_234435 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234512 - OBJ
      ?auto_234513 - OBJ
      ?auto_234515 - OBJ
      ?auto_234514 - OBJ
      ?auto_234511 - LOCATION
    )
    :vars
    (
      ?auto_234519 - LOCATION
      ?auto_234517 - CITY
      ?auto_234518 - TRUCK
      ?auto_234516 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234519 ?auto_234517 ) ( IN-CITY ?auto_234511 ?auto_234517 ) ( not ( = ?auto_234511 ?auto_234519 ) ) ( OBJ-AT ?auto_234515 ?auto_234511 ) ( not ( = ?auto_234515 ?auto_234514 ) ) ( OBJ-AT ?auto_234514 ?auto_234519 ) ( TRUCK-AT ?auto_234518 ?auto_234516 ) ( IN-CITY ?auto_234516 ?auto_234517 ) ( not ( = ?auto_234511 ?auto_234516 ) ) ( not ( = ?auto_234519 ?auto_234516 ) ) ( OBJ-AT ?auto_234512 ?auto_234511 ) ( OBJ-AT ?auto_234513 ?auto_234511 ) ( not ( = ?auto_234512 ?auto_234513 ) ) ( not ( = ?auto_234512 ?auto_234515 ) ) ( not ( = ?auto_234512 ?auto_234514 ) ) ( not ( = ?auto_234513 ?auto_234515 ) ) ( not ( = ?auto_234513 ?auto_234514 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234515 ?auto_234514 ?auto_234511 )
      ( DELIVER-4PKG-VERIFY ?auto_234512 ?auto_234513 ?auto_234515 ?auto_234514 ?auto_234511 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234530 - OBJ
      ?auto_234531 - OBJ
      ?auto_234533 - OBJ
      ?auto_234532 - OBJ
      ?auto_234529 - LOCATION
    )
    :vars
    (
      ?auto_234537 - LOCATION
      ?auto_234535 - CITY
      ?auto_234536 - TRUCK
      ?auto_234534 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234537 ?auto_234535 ) ( IN-CITY ?auto_234529 ?auto_234535 ) ( not ( = ?auto_234529 ?auto_234537 ) ) ( OBJ-AT ?auto_234532 ?auto_234529 ) ( not ( = ?auto_234532 ?auto_234533 ) ) ( OBJ-AT ?auto_234533 ?auto_234537 ) ( TRUCK-AT ?auto_234536 ?auto_234534 ) ( IN-CITY ?auto_234534 ?auto_234535 ) ( not ( = ?auto_234529 ?auto_234534 ) ) ( not ( = ?auto_234537 ?auto_234534 ) ) ( OBJ-AT ?auto_234530 ?auto_234529 ) ( OBJ-AT ?auto_234531 ?auto_234529 ) ( not ( = ?auto_234530 ?auto_234531 ) ) ( not ( = ?auto_234530 ?auto_234533 ) ) ( not ( = ?auto_234530 ?auto_234532 ) ) ( not ( = ?auto_234531 ?auto_234533 ) ) ( not ( = ?auto_234531 ?auto_234532 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234532 ?auto_234533 ?auto_234529 )
      ( DELIVER-4PKG-VERIFY ?auto_234530 ?auto_234531 ?auto_234533 ?auto_234532 ?auto_234529 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234602 - OBJ
      ?auto_234603 - OBJ
      ?auto_234605 - OBJ
      ?auto_234604 - OBJ
      ?auto_234601 - LOCATION
    )
    :vars
    (
      ?auto_234609 - LOCATION
      ?auto_234607 - CITY
      ?auto_234608 - TRUCK
      ?auto_234606 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234609 ?auto_234607 ) ( IN-CITY ?auto_234601 ?auto_234607 ) ( not ( = ?auto_234601 ?auto_234609 ) ) ( OBJ-AT ?auto_234602 ?auto_234601 ) ( not ( = ?auto_234602 ?auto_234603 ) ) ( OBJ-AT ?auto_234603 ?auto_234609 ) ( TRUCK-AT ?auto_234608 ?auto_234606 ) ( IN-CITY ?auto_234606 ?auto_234607 ) ( not ( = ?auto_234601 ?auto_234606 ) ) ( not ( = ?auto_234609 ?auto_234606 ) ) ( OBJ-AT ?auto_234605 ?auto_234601 ) ( OBJ-AT ?auto_234604 ?auto_234601 ) ( not ( = ?auto_234602 ?auto_234605 ) ) ( not ( = ?auto_234602 ?auto_234604 ) ) ( not ( = ?auto_234603 ?auto_234605 ) ) ( not ( = ?auto_234603 ?auto_234604 ) ) ( not ( = ?auto_234605 ?auto_234604 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234602 ?auto_234603 ?auto_234601 )
      ( DELIVER-4PKG-VERIFY ?auto_234602 ?auto_234603 ?auto_234605 ?auto_234604 ?auto_234601 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234861 - OBJ
      ?auto_234862 - OBJ
      ?auto_234864 - OBJ
      ?auto_234863 - OBJ
      ?auto_234860 - LOCATION
    )
    :vars
    (
      ?auto_234868 - LOCATION
      ?auto_234866 - CITY
      ?auto_234867 - TRUCK
      ?auto_234865 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234868 ?auto_234866 ) ( IN-CITY ?auto_234860 ?auto_234866 ) ( not ( = ?auto_234860 ?auto_234868 ) ) ( OBJ-AT ?auto_234863 ?auto_234860 ) ( not ( = ?auto_234863 ?auto_234861 ) ) ( OBJ-AT ?auto_234861 ?auto_234868 ) ( TRUCK-AT ?auto_234867 ?auto_234865 ) ( IN-CITY ?auto_234865 ?auto_234866 ) ( not ( = ?auto_234860 ?auto_234865 ) ) ( not ( = ?auto_234868 ?auto_234865 ) ) ( OBJ-AT ?auto_234862 ?auto_234860 ) ( OBJ-AT ?auto_234864 ?auto_234860 ) ( not ( = ?auto_234861 ?auto_234862 ) ) ( not ( = ?auto_234861 ?auto_234864 ) ) ( not ( = ?auto_234862 ?auto_234864 ) ) ( not ( = ?auto_234862 ?auto_234863 ) ) ( not ( = ?auto_234864 ?auto_234863 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234863 ?auto_234861 ?auto_234860 )
      ( DELIVER-4PKG-VERIFY ?auto_234861 ?auto_234862 ?auto_234864 ?auto_234863 ?auto_234860 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_235112 - OBJ
      ?auto_235113 - OBJ
      ?auto_235115 - OBJ
      ?auto_235114 - OBJ
      ?auto_235116 - OBJ
      ?auto_235111 - LOCATION
    )
    :vars
    (
      ?auto_235120 - LOCATION
      ?auto_235118 - CITY
      ?auto_235119 - TRUCK
      ?auto_235117 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_235120 ?auto_235118 ) ( IN-CITY ?auto_235111 ?auto_235118 ) ( not ( = ?auto_235111 ?auto_235120 ) ) ( OBJ-AT ?auto_235112 ?auto_235111 ) ( not ( = ?auto_235112 ?auto_235116 ) ) ( OBJ-AT ?auto_235116 ?auto_235120 ) ( TRUCK-AT ?auto_235119 ?auto_235117 ) ( IN-CITY ?auto_235117 ?auto_235118 ) ( not ( = ?auto_235111 ?auto_235117 ) ) ( not ( = ?auto_235120 ?auto_235117 ) ) ( OBJ-AT ?auto_235113 ?auto_235111 ) ( OBJ-AT ?auto_235115 ?auto_235111 ) ( OBJ-AT ?auto_235114 ?auto_235111 ) ( not ( = ?auto_235112 ?auto_235113 ) ) ( not ( = ?auto_235112 ?auto_235115 ) ) ( not ( = ?auto_235112 ?auto_235114 ) ) ( not ( = ?auto_235113 ?auto_235115 ) ) ( not ( = ?auto_235113 ?auto_235114 ) ) ( not ( = ?auto_235113 ?auto_235116 ) ) ( not ( = ?auto_235115 ?auto_235114 ) ) ( not ( = ?auto_235115 ?auto_235116 ) ) ( not ( = ?auto_235114 ?auto_235116 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_235112 ?auto_235116 ?auto_235111 )
      ( DELIVER-5PKG-VERIFY ?auto_235112 ?auto_235113 ?auto_235115 ?auto_235114 ?auto_235116 ?auto_235111 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_235132 - OBJ
      ?auto_235133 - OBJ
      ?auto_235135 - OBJ
      ?auto_235134 - OBJ
      ?auto_235136 - OBJ
      ?auto_235131 - LOCATION
    )
    :vars
    (
      ?auto_235140 - LOCATION
      ?auto_235138 - CITY
      ?auto_235139 - TRUCK
      ?auto_235137 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_235140 ?auto_235138 ) ( IN-CITY ?auto_235131 ?auto_235138 ) ( not ( = ?auto_235131 ?auto_235140 ) ) ( OBJ-AT ?auto_235132 ?auto_235131 ) ( not ( = ?auto_235132 ?auto_235134 ) ) ( OBJ-AT ?auto_235134 ?auto_235140 ) ( TRUCK-AT ?auto_235139 ?auto_235137 ) ( IN-CITY ?auto_235137 ?auto_235138 ) ( not ( = ?auto_235131 ?auto_235137 ) ) ( not ( = ?auto_235140 ?auto_235137 ) ) ( OBJ-AT ?auto_235133 ?auto_235131 ) ( OBJ-AT ?auto_235135 ?auto_235131 ) ( OBJ-AT ?auto_235136 ?auto_235131 ) ( not ( = ?auto_235132 ?auto_235133 ) ) ( not ( = ?auto_235132 ?auto_235135 ) ) ( not ( = ?auto_235132 ?auto_235136 ) ) ( not ( = ?auto_235133 ?auto_235135 ) ) ( not ( = ?auto_235133 ?auto_235134 ) ) ( not ( = ?auto_235133 ?auto_235136 ) ) ( not ( = ?auto_235135 ?auto_235134 ) ) ( not ( = ?auto_235135 ?auto_235136 ) ) ( not ( = ?auto_235134 ?auto_235136 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_235132 ?auto_235134 ?auto_235131 )
      ( DELIVER-5PKG-VERIFY ?auto_235132 ?auto_235133 ?auto_235135 ?auto_235134 ?auto_235136 ?auto_235131 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_235212 - OBJ
      ?auto_235213 - OBJ
      ?auto_235215 - OBJ
      ?auto_235214 - OBJ
      ?auto_235216 - OBJ
      ?auto_235211 - LOCATION
    )
    :vars
    (
      ?auto_235220 - LOCATION
      ?auto_235218 - CITY
      ?auto_235219 - TRUCK
      ?auto_235217 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_235220 ?auto_235218 ) ( IN-CITY ?auto_235211 ?auto_235218 ) ( not ( = ?auto_235211 ?auto_235220 ) ) ( OBJ-AT ?auto_235212 ?auto_235211 ) ( not ( = ?auto_235212 ?auto_235215 ) ) ( OBJ-AT ?auto_235215 ?auto_235220 ) ( TRUCK-AT ?auto_235219 ?auto_235217 ) ( IN-CITY ?auto_235217 ?auto_235218 ) ( not ( = ?auto_235211 ?auto_235217 ) ) ( not ( = ?auto_235220 ?auto_235217 ) ) ( OBJ-AT ?auto_235213 ?auto_235211 ) ( OBJ-AT ?auto_235214 ?auto_235211 ) ( OBJ-AT ?auto_235216 ?auto_235211 ) ( not ( = ?auto_235212 ?auto_235213 ) ) ( not ( = ?auto_235212 ?auto_235214 ) ) ( not ( = ?auto_235212 ?auto_235216 ) ) ( not ( = ?auto_235213 ?auto_235215 ) ) ( not ( = ?auto_235213 ?auto_235214 ) ) ( not ( = ?auto_235213 ?auto_235216 ) ) ( not ( = ?auto_235215 ?auto_235214 ) ) ( not ( = ?auto_235215 ?auto_235216 ) ) ( not ( = ?auto_235214 ?auto_235216 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_235212 ?auto_235215 ?auto_235211 )
      ( DELIVER-5PKG-VERIFY ?auto_235212 ?auto_235213 ?auto_235215 ?auto_235214 ?auto_235216 ?auto_235211 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_235492 - OBJ
      ?auto_235493 - OBJ
      ?auto_235495 - OBJ
      ?auto_235494 - OBJ
      ?auto_235496 - OBJ
      ?auto_235491 - LOCATION
    )
    :vars
    (
      ?auto_235500 - LOCATION
      ?auto_235498 - CITY
      ?auto_235499 - TRUCK
      ?auto_235497 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_235500 ?auto_235498 ) ( IN-CITY ?auto_235491 ?auto_235498 ) ( not ( = ?auto_235491 ?auto_235500 ) ) ( OBJ-AT ?auto_235492 ?auto_235491 ) ( not ( = ?auto_235492 ?auto_235493 ) ) ( OBJ-AT ?auto_235493 ?auto_235500 ) ( TRUCK-AT ?auto_235499 ?auto_235497 ) ( IN-CITY ?auto_235497 ?auto_235498 ) ( not ( = ?auto_235491 ?auto_235497 ) ) ( not ( = ?auto_235500 ?auto_235497 ) ) ( OBJ-AT ?auto_235495 ?auto_235491 ) ( OBJ-AT ?auto_235494 ?auto_235491 ) ( OBJ-AT ?auto_235496 ?auto_235491 ) ( not ( = ?auto_235492 ?auto_235495 ) ) ( not ( = ?auto_235492 ?auto_235494 ) ) ( not ( = ?auto_235492 ?auto_235496 ) ) ( not ( = ?auto_235493 ?auto_235495 ) ) ( not ( = ?auto_235493 ?auto_235494 ) ) ( not ( = ?auto_235493 ?auto_235496 ) ) ( not ( = ?auto_235495 ?auto_235494 ) ) ( not ( = ?auto_235495 ?auto_235496 ) ) ( not ( = ?auto_235494 ?auto_235496 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_235492 ?auto_235493 ?auto_235491 )
      ( DELIVER-5PKG-VERIFY ?auto_235492 ?auto_235493 ?auto_235495 ?auto_235494 ?auto_235496 ?auto_235491 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_236427 - OBJ
      ?auto_236428 - OBJ
      ?auto_236430 - OBJ
      ?auto_236429 - OBJ
      ?auto_236431 - OBJ
      ?auto_236426 - LOCATION
    )
    :vars
    (
      ?auto_236435 - LOCATION
      ?auto_236433 - CITY
      ?auto_236434 - TRUCK
      ?auto_236432 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_236435 ?auto_236433 ) ( IN-CITY ?auto_236426 ?auto_236433 ) ( not ( = ?auto_236426 ?auto_236435 ) ) ( OBJ-AT ?auto_236429 ?auto_236426 ) ( not ( = ?auto_236429 ?auto_236427 ) ) ( OBJ-AT ?auto_236427 ?auto_236435 ) ( TRUCK-AT ?auto_236434 ?auto_236432 ) ( IN-CITY ?auto_236432 ?auto_236433 ) ( not ( = ?auto_236426 ?auto_236432 ) ) ( not ( = ?auto_236435 ?auto_236432 ) ) ( OBJ-AT ?auto_236428 ?auto_236426 ) ( OBJ-AT ?auto_236430 ?auto_236426 ) ( OBJ-AT ?auto_236431 ?auto_236426 ) ( not ( = ?auto_236427 ?auto_236428 ) ) ( not ( = ?auto_236427 ?auto_236430 ) ) ( not ( = ?auto_236427 ?auto_236431 ) ) ( not ( = ?auto_236428 ?auto_236430 ) ) ( not ( = ?auto_236428 ?auto_236429 ) ) ( not ( = ?auto_236428 ?auto_236431 ) ) ( not ( = ?auto_236430 ?auto_236429 ) ) ( not ( = ?auto_236430 ?auto_236431 ) ) ( not ( = ?auto_236429 ?auto_236431 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_236429 ?auto_236427 ?auto_236426 )
      ( DELIVER-5PKG-VERIFY ?auto_236427 ?auto_236428 ?auto_236430 ?auto_236429 ?auto_236431 ?auto_236426 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_237285 - OBJ
      ?auto_237286 - OBJ
      ?auto_237287 - OBJ
      ?auto_237284 - LOCATION
    )
    :vars
    (
      ?auto_237291 - LOCATION
      ?auto_237289 - CITY
      ?auto_237288 - TRUCK
      ?auto_237290 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_237291 ?auto_237289 ) ( IN-CITY ?auto_237284 ?auto_237289 ) ( not ( = ?auto_237284 ?auto_237291 ) ) ( OBJ-AT ?auto_237285 ?auto_237284 ) ( not ( = ?auto_237285 ?auto_237287 ) ) ( OBJ-AT ?auto_237287 ?auto_237291 ) ( TRUCK-AT ?auto_237288 ?auto_237290 ) ( IN-CITY ?auto_237290 ?auto_237289 ) ( not ( = ?auto_237284 ?auto_237290 ) ) ( not ( = ?auto_237291 ?auto_237290 ) ) ( OBJ-AT ?auto_237286 ?auto_237284 ) ( not ( = ?auto_237285 ?auto_237286 ) ) ( not ( = ?auto_237286 ?auto_237287 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_237285 ?auto_237287 ?auto_237284 )
      ( DELIVER-3PKG-VERIFY ?auto_237285 ?auto_237286 ?auto_237287 ?auto_237284 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_237444 - OBJ
      ?auto_237445 - OBJ
      ?auto_237447 - OBJ
      ?auto_237446 - OBJ
      ?auto_237443 - LOCATION
    )
    :vars
    (
      ?auto_237451 - LOCATION
      ?auto_237449 - CITY
      ?auto_237448 - TRUCK
      ?auto_237450 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_237451 ?auto_237449 ) ( IN-CITY ?auto_237443 ?auto_237449 ) ( not ( = ?auto_237443 ?auto_237451 ) ) ( OBJ-AT ?auto_237445 ?auto_237443 ) ( not ( = ?auto_237445 ?auto_237446 ) ) ( OBJ-AT ?auto_237446 ?auto_237451 ) ( TRUCK-AT ?auto_237448 ?auto_237450 ) ( IN-CITY ?auto_237450 ?auto_237449 ) ( not ( = ?auto_237443 ?auto_237450 ) ) ( not ( = ?auto_237451 ?auto_237450 ) ) ( OBJ-AT ?auto_237444 ?auto_237443 ) ( OBJ-AT ?auto_237447 ?auto_237443 ) ( not ( = ?auto_237444 ?auto_237445 ) ) ( not ( = ?auto_237444 ?auto_237447 ) ) ( not ( = ?auto_237444 ?auto_237446 ) ) ( not ( = ?auto_237445 ?auto_237447 ) ) ( not ( = ?auto_237447 ?auto_237446 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_237445 ?auto_237446 ?auto_237443 )
      ( DELIVER-4PKG-VERIFY ?auto_237444 ?auto_237445 ?auto_237447 ?auto_237446 ?auto_237443 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_237462 - OBJ
      ?auto_237463 - OBJ
      ?auto_237465 - OBJ
      ?auto_237464 - OBJ
      ?auto_237461 - LOCATION
    )
    :vars
    (
      ?auto_237469 - LOCATION
      ?auto_237467 - CITY
      ?auto_237466 - TRUCK
      ?auto_237468 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_237469 ?auto_237467 ) ( IN-CITY ?auto_237461 ?auto_237467 ) ( not ( = ?auto_237461 ?auto_237469 ) ) ( OBJ-AT ?auto_237463 ?auto_237461 ) ( not ( = ?auto_237463 ?auto_237465 ) ) ( OBJ-AT ?auto_237465 ?auto_237469 ) ( TRUCK-AT ?auto_237466 ?auto_237468 ) ( IN-CITY ?auto_237468 ?auto_237467 ) ( not ( = ?auto_237461 ?auto_237468 ) ) ( not ( = ?auto_237469 ?auto_237468 ) ) ( OBJ-AT ?auto_237462 ?auto_237461 ) ( OBJ-AT ?auto_237464 ?auto_237461 ) ( not ( = ?auto_237462 ?auto_237463 ) ) ( not ( = ?auto_237462 ?auto_237465 ) ) ( not ( = ?auto_237462 ?auto_237464 ) ) ( not ( = ?auto_237463 ?auto_237464 ) ) ( not ( = ?auto_237465 ?auto_237464 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_237463 ?auto_237465 ?auto_237461 )
      ( DELIVER-4PKG-VERIFY ?auto_237462 ?auto_237463 ?auto_237465 ?auto_237464 ?auto_237461 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_237793 - OBJ
      ?auto_237794 - OBJ
      ?auto_237796 - OBJ
      ?auto_237795 - OBJ
      ?auto_237792 - LOCATION
    )
    :vars
    (
      ?auto_237800 - LOCATION
      ?auto_237798 - CITY
      ?auto_237797 - TRUCK
      ?auto_237799 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_237800 ?auto_237798 ) ( IN-CITY ?auto_237792 ?auto_237798 ) ( not ( = ?auto_237792 ?auto_237800 ) ) ( OBJ-AT ?auto_237794 ?auto_237792 ) ( not ( = ?auto_237794 ?auto_237793 ) ) ( OBJ-AT ?auto_237793 ?auto_237800 ) ( TRUCK-AT ?auto_237797 ?auto_237799 ) ( IN-CITY ?auto_237799 ?auto_237798 ) ( not ( = ?auto_237792 ?auto_237799 ) ) ( not ( = ?auto_237800 ?auto_237799 ) ) ( OBJ-AT ?auto_237796 ?auto_237792 ) ( OBJ-AT ?auto_237795 ?auto_237792 ) ( not ( = ?auto_237793 ?auto_237796 ) ) ( not ( = ?auto_237793 ?auto_237795 ) ) ( not ( = ?auto_237794 ?auto_237796 ) ) ( not ( = ?auto_237794 ?auto_237795 ) ) ( not ( = ?auto_237796 ?auto_237795 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_237794 ?auto_237793 ?auto_237792 )
      ( DELIVER-4PKG-VERIFY ?auto_237793 ?auto_237794 ?auto_237796 ?auto_237795 ?auto_237792 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_238144 - OBJ
      ?auto_238145 - OBJ
      ?auto_238147 - OBJ
      ?auto_238146 - OBJ
      ?auto_238148 - OBJ
      ?auto_238143 - LOCATION
    )
    :vars
    (
      ?auto_238152 - LOCATION
      ?auto_238150 - CITY
      ?auto_238149 - TRUCK
      ?auto_238151 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_238152 ?auto_238150 ) ( IN-CITY ?auto_238143 ?auto_238150 ) ( not ( = ?auto_238143 ?auto_238152 ) ) ( OBJ-AT ?auto_238148 ?auto_238143 ) ( not ( = ?auto_238148 ?auto_238147 ) ) ( OBJ-AT ?auto_238147 ?auto_238152 ) ( TRUCK-AT ?auto_238149 ?auto_238151 ) ( IN-CITY ?auto_238151 ?auto_238150 ) ( not ( = ?auto_238143 ?auto_238151 ) ) ( not ( = ?auto_238152 ?auto_238151 ) ) ( OBJ-AT ?auto_238144 ?auto_238143 ) ( OBJ-AT ?auto_238145 ?auto_238143 ) ( OBJ-AT ?auto_238146 ?auto_238143 ) ( not ( = ?auto_238144 ?auto_238145 ) ) ( not ( = ?auto_238144 ?auto_238147 ) ) ( not ( = ?auto_238144 ?auto_238146 ) ) ( not ( = ?auto_238144 ?auto_238148 ) ) ( not ( = ?auto_238145 ?auto_238147 ) ) ( not ( = ?auto_238145 ?auto_238146 ) ) ( not ( = ?auto_238145 ?auto_238148 ) ) ( not ( = ?auto_238147 ?auto_238146 ) ) ( not ( = ?auto_238146 ?auto_238148 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_238148 ?auto_238147 ?auto_238143 )
      ( DELIVER-5PKG-VERIFY ?auto_238144 ?auto_238145 ?auto_238147 ?auto_238146 ?auto_238148 ?auto_238143 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_266473 - OBJ
      ?auto_266474 - OBJ
      ?auto_266475 - OBJ
      ?auto_266472 - LOCATION
    )
    :vars
    (
      ?auto_266477 - TRUCK
      ?auto_266478 - LOCATION
      ?auto_266476 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_266473 ?auto_266477 ) ( TRUCK-AT ?auto_266477 ?auto_266478 ) ( IN-CITY ?auto_266478 ?auto_266476 ) ( IN-CITY ?auto_266472 ?auto_266476 ) ( not ( = ?auto_266472 ?auto_266478 ) ) ( OBJ-AT ?auto_266475 ?auto_266472 ) ( not ( = ?auto_266475 ?auto_266473 ) ) ( OBJ-AT ?auto_266474 ?auto_266472 ) ( not ( = ?auto_266473 ?auto_266474 ) ) ( not ( = ?auto_266474 ?auto_266475 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_266475 ?auto_266473 ?auto_266472 )
      ( DELIVER-3PKG-VERIFY ?auto_266473 ?auto_266474 ?auto_266475 ?auto_266472 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_275244 - OBJ
      ?auto_275245 - OBJ
      ?auto_275246 - OBJ
      ?auto_275243 - LOCATION
    )
    :vars
    (
      ?auto_275247 - TRUCK
      ?auto_275248 - LOCATION
      ?auto_275249 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_275247 ?auto_275248 ) ( IN-CITY ?auto_275248 ?auto_275249 ) ( IN-CITY ?auto_275243 ?auto_275249 ) ( not ( = ?auto_275243 ?auto_275248 ) ) ( OBJ-AT ?auto_275244 ?auto_275243 ) ( not ( = ?auto_275244 ?auto_275246 ) ) ( OBJ-AT ?auto_275246 ?auto_275248 ) ( OBJ-AT ?auto_275245 ?auto_275243 ) ( not ( = ?auto_275244 ?auto_275245 ) ) ( not ( = ?auto_275245 ?auto_275246 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_275244 ?auto_275246 ?auto_275243 )
      ( DELIVER-3PKG-VERIFY ?auto_275244 ?auto_275245 ?auto_275246 ?auto_275243 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_275361 - OBJ
      ?auto_275362 - OBJ
      ?auto_275363 - OBJ
      ?auto_275360 - LOCATION
    )
    :vars
    (
      ?auto_275364 - TRUCK
      ?auto_275365 - LOCATION
      ?auto_275366 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_275364 ?auto_275365 ) ( IN-CITY ?auto_275365 ?auto_275366 ) ( IN-CITY ?auto_275360 ?auto_275366 ) ( not ( = ?auto_275360 ?auto_275365 ) ) ( OBJ-AT ?auto_275363 ?auto_275360 ) ( not ( = ?auto_275363 ?auto_275361 ) ) ( OBJ-AT ?auto_275361 ?auto_275365 ) ( OBJ-AT ?auto_275362 ?auto_275360 ) ( not ( = ?auto_275361 ?auto_275362 ) ) ( not ( = ?auto_275362 ?auto_275363 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_275363 ?auto_275361 ?auto_275360 )
      ( DELIVER-3PKG-VERIFY ?auto_275361 ?auto_275362 ?auto_275363 ?auto_275360 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_284147 - OBJ
      ?auto_284148 - OBJ
      ?auto_284149 - OBJ
      ?auto_284146 - LOCATION
    )
    :vars
    (
      ?auto_284150 - LOCATION
      ?auto_284151 - CITY
      ?auto_284152 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_284150 ?auto_284151 ) ( IN-CITY ?auto_284146 ?auto_284151 ) ( not ( = ?auto_284146 ?auto_284150 ) ) ( OBJ-AT ?auto_284149 ?auto_284146 ) ( not ( = ?auto_284149 ?auto_284148 ) ) ( OBJ-AT ?auto_284148 ?auto_284150 ) ( TRUCK-AT ?auto_284152 ?auto_284146 ) ( OBJ-AT ?auto_284147 ?auto_284146 ) ( not ( = ?auto_284147 ?auto_284148 ) ) ( not ( = ?auto_284147 ?auto_284149 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_284149 ?auto_284148 ?auto_284146 )
      ( DELIVER-3PKG-VERIFY ?auto_284147 ?auto_284148 ?auto_284149 ?auto_284146 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_302054 - OBJ
      ?auto_302055 - OBJ
      ?auto_302056 - OBJ
      ?auto_302053 - LOCATION
    )
    :vars
    (
      ?auto_302058 - LOCATION
      ?auto_302057 - CITY
      ?auto_302060 - TRUCK
      ?auto_302059 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302058 ?auto_302057 ) ( IN-CITY ?auto_302053 ?auto_302057 ) ( not ( = ?auto_302053 ?auto_302058 ) ) ( OBJ-AT ?auto_302054 ?auto_302053 ) ( not ( = ?auto_302054 ?auto_302055 ) ) ( OBJ-AT ?auto_302055 ?auto_302058 ) ( TRUCK-AT ?auto_302060 ?auto_302059 ) ( IN-CITY ?auto_302059 ?auto_302057 ) ( not ( = ?auto_302053 ?auto_302059 ) ) ( not ( = ?auto_302058 ?auto_302059 ) ) ( OBJ-AT ?auto_302056 ?auto_302053 ) ( not ( = ?auto_302054 ?auto_302056 ) ) ( not ( = ?auto_302055 ?auto_302056 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302054 ?auto_302055 ?auto_302053 )
      ( DELIVER-3PKG-VERIFY ?auto_302054 ?auto_302055 ?auto_302056 ?auto_302053 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_302086 - OBJ
      ?auto_302087 - OBJ
      ?auto_302088 - OBJ
      ?auto_302085 - LOCATION
    )
    :vars
    (
      ?auto_302091 - LOCATION
      ?auto_302089 - CITY
      ?auto_302090 - OBJ
      ?auto_302093 - TRUCK
      ?auto_302092 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302091 ?auto_302089 ) ( IN-CITY ?auto_302085 ?auto_302089 ) ( not ( = ?auto_302085 ?auto_302091 ) ) ( OBJ-AT ?auto_302090 ?auto_302085 ) ( not ( = ?auto_302090 ?auto_302088 ) ) ( OBJ-AT ?auto_302088 ?auto_302091 ) ( TRUCK-AT ?auto_302093 ?auto_302092 ) ( IN-CITY ?auto_302092 ?auto_302089 ) ( not ( = ?auto_302085 ?auto_302092 ) ) ( not ( = ?auto_302091 ?auto_302092 ) ) ( OBJ-AT ?auto_302086 ?auto_302085 ) ( OBJ-AT ?auto_302087 ?auto_302085 ) ( not ( = ?auto_302086 ?auto_302087 ) ) ( not ( = ?auto_302086 ?auto_302088 ) ) ( not ( = ?auto_302086 ?auto_302090 ) ) ( not ( = ?auto_302087 ?auto_302088 ) ) ( not ( = ?auto_302087 ?auto_302090 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302090 ?auto_302088 ?auto_302085 )
      ( DELIVER-3PKG-VERIFY ?auto_302086 ?auto_302087 ?auto_302088 ?auto_302085 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_302108 - OBJ
      ?auto_302109 - OBJ
      ?auto_302110 - OBJ
      ?auto_302107 - LOCATION
    )
    :vars
    (
      ?auto_302113 - LOCATION
      ?auto_302111 - CITY
      ?auto_302112 - OBJ
      ?auto_302115 - TRUCK
      ?auto_302114 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302113 ?auto_302111 ) ( IN-CITY ?auto_302107 ?auto_302111 ) ( not ( = ?auto_302107 ?auto_302113 ) ) ( OBJ-AT ?auto_302112 ?auto_302107 ) ( not ( = ?auto_302112 ?auto_302109 ) ) ( OBJ-AT ?auto_302109 ?auto_302113 ) ( TRUCK-AT ?auto_302115 ?auto_302114 ) ( IN-CITY ?auto_302114 ?auto_302111 ) ( not ( = ?auto_302107 ?auto_302114 ) ) ( not ( = ?auto_302113 ?auto_302114 ) ) ( OBJ-AT ?auto_302108 ?auto_302107 ) ( OBJ-AT ?auto_302110 ?auto_302107 ) ( not ( = ?auto_302108 ?auto_302109 ) ) ( not ( = ?auto_302108 ?auto_302110 ) ) ( not ( = ?auto_302108 ?auto_302112 ) ) ( not ( = ?auto_302109 ?auto_302110 ) ) ( not ( = ?auto_302110 ?auto_302112 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302112 ?auto_302109 ?auto_302107 )
      ( DELIVER-3PKG-VERIFY ?auto_302108 ?auto_302109 ?auto_302110 ?auto_302107 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_302228 - OBJ
      ?auto_302229 - OBJ
      ?auto_302230 - OBJ
      ?auto_302227 - LOCATION
    )
    :vars
    (
      ?auto_302233 - LOCATION
      ?auto_302231 - CITY
      ?auto_302232 - OBJ
      ?auto_302235 - TRUCK
      ?auto_302234 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302233 ?auto_302231 ) ( IN-CITY ?auto_302227 ?auto_302231 ) ( not ( = ?auto_302227 ?auto_302233 ) ) ( OBJ-AT ?auto_302232 ?auto_302227 ) ( not ( = ?auto_302232 ?auto_302228 ) ) ( OBJ-AT ?auto_302228 ?auto_302233 ) ( TRUCK-AT ?auto_302235 ?auto_302234 ) ( IN-CITY ?auto_302234 ?auto_302231 ) ( not ( = ?auto_302227 ?auto_302234 ) ) ( not ( = ?auto_302233 ?auto_302234 ) ) ( OBJ-AT ?auto_302229 ?auto_302227 ) ( OBJ-AT ?auto_302230 ?auto_302227 ) ( not ( = ?auto_302228 ?auto_302229 ) ) ( not ( = ?auto_302228 ?auto_302230 ) ) ( not ( = ?auto_302229 ?auto_302230 ) ) ( not ( = ?auto_302229 ?auto_302232 ) ) ( not ( = ?auto_302230 ?auto_302232 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302232 ?auto_302228 ?auto_302227 )
      ( DELIVER-3PKG-VERIFY ?auto_302228 ?auto_302229 ?auto_302230 ?auto_302227 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302325 - OBJ
      ?auto_302326 - OBJ
      ?auto_302328 - OBJ
      ?auto_302327 - OBJ
      ?auto_302324 - LOCATION
    )
    :vars
    (
      ?auto_302330 - LOCATION
      ?auto_302329 - CITY
      ?auto_302332 - TRUCK
      ?auto_302331 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302330 ?auto_302329 ) ( IN-CITY ?auto_302324 ?auto_302329 ) ( not ( = ?auto_302324 ?auto_302330 ) ) ( OBJ-AT ?auto_302325 ?auto_302324 ) ( not ( = ?auto_302325 ?auto_302327 ) ) ( OBJ-AT ?auto_302327 ?auto_302330 ) ( TRUCK-AT ?auto_302332 ?auto_302331 ) ( IN-CITY ?auto_302331 ?auto_302329 ) ( not ( = ?auto_302324 ?auto_302331 ) ) ( not ( = ?auto_302330 ?auto_302331 ) ) ( OBJ-AT ?auto_302326 ?auto_302324 ) ( OBJ-AT ?auto_302328 ?auto_302324 ) ( not ( = ?auto_302325 ?auto_302326 ) ) ( not ( = ?auto_302325 ?auto_302328 ) ) ( not ( = ?auto_302326 ?auto_302328 ) ) ( not ( = ?auto_302326 ?auto_302327 ) ) ( not ( = ?auto_302328 ?auto_302327 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302325 ?auto_302327 ?auto_302324 )
      ( DELIVER-4PKG-VERIFY ?auto_302325 ?auto_302326 ?auto_302328 ?auto_302327 ?auto_302324 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302415 - OBJ
      ?auto_302416 - OBJ
      ?auto_302418 - OBJ
      ?auto_302417 - OBJ
      ?auto_302414 - LOCATION
    )
    :vars
    (
      ?auto_302420 - LOCATION
      ?auto_302419 - CITY
      ?auto_302422 - TRUCK
      ?auto_302421 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302420 ?auto_302419 ) ( IN-CITY ?auto_302414 ?auto_302419 ) ( not ( = ?auto_302414 ?auto_302420 ) ) ( OBJ-AT ?auto_302415 ?auto_302414 ) ( not ( = ?auto_302415 ?auto_302418 ) ) ( OBJ-AT ?auto_302418 ?auto_302420 ) ( TRUCK-AT ?auto_302422 ?auto_302421 ) ( IN-CITY ?auto_302421 ?auto_302419 ) ( not ( = ?auto_302414 ?auto_302421 ) ) ( not ( = ?auto_302420 ?auto_302421 ) ) ( OBJ-AT ?auto_302416 ?auto_302414 ) ( OBJ-AT ?auto_302417 ?auto_302414 ) ( not ( = ?auto_302415 ?auto_302416 ) ) ( not ( = ?auto_302415 ?auto_302417 ) ) ( not ( = ?auto_302416 ?auto_302418 ) ) ( not ( = ?auto_302416 ?auto_302417 ) ) ( not ( = ?auto_302418 ?auto_302417 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302415 ?auto_302418 ?auto_302414 )
      ( DELIVER-4PKG-VERIFY ?auto_302415 ?auto_302416 ?auto_302418 ?auto_302417 ?auto_302414 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302523 - OBJ
      ?auto_302524 - OBJ
      ?auto_302526 - OBJ
      ?auto_302525 - OBJ
      ?auto_302522 - LOCATION
    )
    :vars
    (
      ?auto_302528 - LOCATION
      ?auto_302527 - CITY
      ?auto_302530 - TRUCK
      ?auto_302529 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302528 ?auto_302527 ) ( IN-CITY ?auto_302522 ?auto_302527 ) ( not ( = ?auto_302522 ?auto_302528 ) ) ( OBJ-AT ?auto_302526 ?auto_302522 ) ( not ( = ?auto_302526 ?auto_302524 ) ) ( OBJ-AT ?auto_302524 ?auto_302528 ) ( TRUCK-AT ?auto_302530 ?auto_302529 ) ( IN-CITY ?auto_302529 ?auto_302527 ) ( not ( = ?auto_302522 ?auto_302529 ) ) ( not ( = ?auto_302528 ?auto_302529 ) ) ( OBJ-AT ?auto_302523 ?auto_302522 ) ( OBJ-AT ?auto_302525 ?auto_302522 ) ( not ( = ?auto_302523 ?auto_302524 ) ) ( not ( = ?auto_302523 ?auto_302526 ) ) ( not ( = ?auto_302523 ?auto_302525 ) ) ( not ( = ?auto_302524 ?auto_302525 ) ) ( not ( = ?auto_302526 ?auto_302525 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302526 ?auto_302524 ?auto_302522 )
      ( DELIVER-4PKG-VERIFY ?auto_302523 ?auto_302524 ?auto_302526 ?auto_302525 ?auto_302522 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302550 - OBJ
      ?auto_302551 - OBJ
      ?auto_302553 - OBJ
      ?auto_302552 - OBJ
      ?auto_302549 - LOCATION
    )
    :vars
    (
      ?auto_302555 - LOCATION
      ?auto_302554 - CITY
      ?auto_302557 - TRUCK
      ?auto_302556 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302555 ?auto_302554 ) ( IN-CITY ?auto_302549 ?auto_302554 ) ( not ( = ?auto_302549 ?auto_302555 ) ) ( OBJ-AT ?auto_302552 ?auto_302549 ) ( not ( = ?auto_302552 ?auto_302551 ) ) ( OBJ-AT ?auto_302551 ?auto_302555 ) ( TRUCK-AT ?auto_302557 ?auto_302556 ) ( IN-CITY ?auto_302556 ?auto_302554 ) ( not ( = ?auto_302549 ?auto_302556 ) ) ( not ( = ?auto_302555 ?auto_302556 ) ) ( OBJ-AT ?auto_302550 ?auto_302549 ) ( OBJ-AT ?auto_302553 ?auto_302549 ) ( not ( = ?auto_302550 ?auto_302551 ) ) ( not ( = ?auto_302550 ?auto_302553 ) ) ( not ( = ?auto_302550 ?auto_302552 ) ) ( not ( = ?auto_302551 ?auto_302553 ) ) ( not ( = ?auto_302553 ?auto_302552 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302552 ?auto_302551 ?auto_302549 )
      ( DELIVER-4PKG-VERIFY ?auto_302550 ?auto_302551 ?auto_302553 ?auto_302552 ?auto_302549 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302730 - OBJ
      ?auto_302731 - OBJ
      ?auto_302733 - OBJ
      ?auto_302732 - OBJ
      ?auto_302729 - LOCATION
    )
    :vars
    (
      ?auto_302736 - LOCATION
      ?auto_302734 - CITY
      ?auto_302735 - OBJ
      ?auto_302738 - TRUCK
      ?auto_302737 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302736 ?auto_302734 ) ( IN-CITY ?auto_302729 ?auto_302734 ) ( not ( = ?auto_302729 ?auto_302736 ) ) ( OBJ-AT ?auto_302735 ?auto_302729 ) ( not ( = ?auto_302735 ?auto_302732 ) ) ( OBJ-AT ?auto_302732 ?auto_302736 ) ( TRUCK-AT ?auto_302738 ?auto_302737 ) ( IN-CITY ?auto_302737 ?auto_302734 ) ( not ( = ?auto_302729 ?auto_302737 ) ) ( not ( = ?auto_302736 ?auto_302737 ) ) ( OBJ-AT ?auto_302730 ?auto_302729 ) ( OBJ-AT ?auto_302731 ?auto_302729 ) ( OBJ-AT ?auto_302733 ?auto_302729 ) ( not ( = ?auto_302730 ?auto_302731 ) ) ( not ( = ?auto_302730 ?auto_302733 ) ) ( not ( = ?auto_302730 ?auto_302732 ) ) ( not ( = ?auto_302730 ?auto_302735 ) ) ( not ( = ?auto_302731 ?auto_302733 ) ) ( not ( = ?auto_302731 ?auto_302732 ) ) ( not ( = ?auto_302731 ?auto_302735 ) ) ( not ( = ?auto_302733 ?auto_302732 ) ) ( not ( = ?auto_302733 ?auto_302735 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302735 ?auto_302732 ?auto_302729 )
      ( DELIVER-4PKG-VERIFY ?auto_302730 ?auto_302731 ?auto_302733 ?auto_302732 ?auto_302729 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302759 - OBJ
      ?auto_302760 - OBJ
      ?auto_302762 - OBJ
      ?auto_302761 - OBJ
      ?auto_302758 - LOCATION
    )
    :vars
    (
      ?auto_302765 - LOCATION
      ?auto_302763 - CITY
      ?auto_302764 - OBJ
      ?auto_302767 - TRUCK
      ?auto_302766 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302765 ?auto_302763 ) ( IN-CITY ?auto_302758 ?auto_302763 ) ( not ( = ?auto_302758 ?auto_302765 ) ) ( OBJ-AT ?auto_302764 ?auto_302758 ) ( not ( = ?auto_302764 ?auto_302762 ) ) ( OBJ-AT ?auto_302762 ?auto_302765 ) ( TRUCK-AT ?auto_302767 ?auto_302766 ) ( IN-CITY ?auto_302766 ?auto_302763 ) ( not ( = ?auto_302758 ?auto_302766 ) ) ( not ( = ?auto_302765 ?auto_302766 ) ) ( OBJ-AT ?auto_302759 ?auto_302758 ) ( OBJ-AT ?auto_302760 ?auto_302758 ) ( OBJ-AT ?auto_302761 ?auto_302758 ) ( not ( = ?auto_302759 ?auto_302760 ) ) ( not ( = ?auto_302759 ?auto_302762 ) ) ( not ( = ?auto_302759 ?auto_302761 ) ) ( not ( = ?auto_302759 ?auto_302764 ) ) ( not ( = ?auto_302760 ?auto_302762 ) ) ( not ( = ?auto_302760 ?auto_302761 ) ) ( not ( = ?auto_302760 ?auto_302764 ) ) ( not ( = ?auto_302762 ?auto_302761 ) ) ( not ( = ?auto_302761 ?auto_302764 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302764 ?auto_302762 ?auto_302758 )
      ( DELIVER-4PKG-VERIFY ?auto_302759 ?auto_302760 ?auto_302762 ?auto_302761 ?auto_302758 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302902 - OBJ
      ?auto_302903 - OBJ
      ?auto_302905 - OBJ
      ?auto_302904 - OBJ
      ?auto_302901 - LOCATION
    )
    :vars
    (
      ?auto_302908 - LOCATION
      ?auto_302906 - CITY
      ?auto_302907 - OBJ
      ?auto_302910 - TRUCK
      ?auto_302909 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302908 ?auto_302906 ) ( IN-CITY ?auto_302901 ?auto_302906 ) ( not ( = ?auto_302901 ?auto_302908 ) ) ( OBJ-AT ?auto_302907 ?auto_302901 ) ( not ( = ?auto_302907 ?auto_302903 ) ) ( OBJ-AT ?auto_302903 ?auto_302908 ) ( TRUCK-AT ?auto_302910 ?auto_302909 ) ( IN-CITY ?auto_302909 ?auto_302906 ) ( not ( = ?auto_302901 ?auto_302909 ) ) ( not ( = ?auto_302908 ?auto_302909 ) ) ( OBJ-AT ?auto_302902 ?auto_302901 ) ( OBJ-AT ?auto_302905 ?auto_302901 ) ( OBJ-AT ?auto_302904 ?auto_302901 ) ( not ( = ?auto_302902 ?auto_302903 ) ) ( not ( = ?auto_302902 ?auto_302905 ) ) ( not ( = ?auto_302902 ?auto_302904 ) ) ( not ( = ?auto_302902 ?auto_302907 ) ) ( not ( = ?auto_302903 ?auto_302905 ) ) ( not ( = ?auto_302903 ?auto_302904 ) ) ( not ( = ?auto_302905 ?auto_302904 ) ) ( not ( = ?auto_302905 ?auto_302907 ) ) ( not ( = ?auto_302904 ?auto_302907 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302907 ?auto_302903 ?auto_302901 )
      ( DELIVER-4PKG-VERIFY ?auto_302902 ?auto_302903 ?auto_302905 ?auto_302904 ?auto_302901 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_303371 - OBJ
      ?auto_303372 - OBJ
      ?auto_303374 - OBJ
      ?auto_303373 - OBJ
      ?auto_303370 - LOCATION
    )
    :vars
    (
      ?auto_303376 - LOCATION
      ?auto_303375 - CITY
      ?auto_303378 - TRUCK
      ?auto_303377 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303376 ?auto_303375 ) ( IN-CITY ?auto_303370 ?auto_303375 ) ( not ( = ?auto_303370 ?auto_303376 ) ) ( OBJ-AT ?auto_303374 ?auto_303370 ) ( not ( = ?auto_303374 ?auto_303371 ) ) ( OBJ-AT ?auto_303371 ?auto_303376 ) ( TRUCK-AT ?auto_303378 ?auto_303377 ) ( IN-CITY ?auto_303377 ?auto_303375 ) ( not ( = ?auto_303370 ?auto_303377 ) ) ( not ( = ?auto_303376 ?auto_303377 ) ) ( OBJ-AT ?auto_303372 ?auto_303370 ) ( OBJ-AT ?auto_303373 ?auto_303370 ) ( not ( = ?auto_303371 ?auto_303372 ) ) ( not ( = ?auto_303371 ?auto_303373 ) ) ( not ( = ?auto_303372 ?auto_303374 ) ) ( not ( = ?auto_303372 ?auto_303373 ) ) ( not ( = ?auto_303374 ?auto_303373 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303374 ?auto_303371 ?auto_303370 )
      ( DELIVER-4PKG-VERIFY ?auto_303371 ?auto_303372 ?auto_303374 ?auto_303373 ?auto_303370 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_303551 - OBJ
      ?auto_303552 - OBJ
      ?auto_303554 - OBJ
      ?auto_303553 - OBJ
      ?auto_303550 - LOCATION
    )
    :vars
    (
      ?auto_303557 - LOCATION
      ?auto_303555 - CITY
      ?auto_303556 - OBJ
      ?auto_303559 - TRUCK
      ?auto_303558 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303557 ?auto_303555 ) ( IN-CITY ?auto_303550 ?auto_303555 ) ( not ( = ?auto_303550 ?auto_303557 ) ) ( OBJ-AT ?auto_303556 ?auto_303550 ) ( not ( = ?auto_303556 ?auto_303551 ) ) ( OBJ-AT ?auto_303551 ?auto_303557 ) ( TRUCK-AT ?auto_303559 ?auto_303558 ) ( IN-CITY ?auto_303558 ?auto_303555 ) ( not ( = ?auto_303550 ?auto_303558 ) ) ( not ( = ?auto_303557 ?auto_303558 ) ) ( OBJ-AT ?auto_303552 ?auto_303550 ) ( OBJ-AT ?auto_303554 ?auto_303550 ) ( OBJ-AT ?auto_303553 ?auto_303550 ) ( not ( = ?auto_303551 ?auto_303552 ) ) ( not ( = ?auto_303551 ?auto_303554 ) ) ( not ( = ?auto_303551 ?auto_303553 ) ) ( not ( = ?auto_303552 ?auto_303554 ) ) ( not ( = ?auto_303552 ?auto_303553 ) ) ( not ( = ?auto_303552 ?auto_303556 ) ) ( not ( = ?auto_303554 ?auto_303553 ) ) ( not ( = ?auto_303554 ?auto_303556 ) ) ( not ( = ?auto_303553 ?auto_303556 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303556 ?auto_303551 ?auto_303550 )
      ( DELIVER-4PKG-VERIFY ?auto_303551 ?auto_303552 ?auto_303554 ?auto_303553 ?auto_303550 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_303975 - OBJ
      ?auto_303976 - OBJ
      ?auto_303978 - OBJ
      ?auto_303977 - OBJ
      ?auto_303979 - OBJ
      ?auto_303974 - LOCATION
    )
    :vars
    (
      ?auto_303981 - LOCATION
      ?auto_303980 - CITY
      ?auto_303983 - TRUCK
      ?auto_303982 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303981 ?auto_303980 ) ( IN-CITY ?auto_303974 ?auto_303980 ) ( not ( = ?auto_303974 ?auto_303981 ) ) ( OBJ-AT ?auto_303978 ?auto_303974 ) ( not ( = ?auto_303978 ?auto_303979 ) ) ( OBJ-AT ?auto_303979 ?auto_303981 ) ( TRUCK-AT ?auto_303983 ?auto_303982 ) ( IN-CITY ?auto_303982 ?auto_303980 ) ( not ( = ?auto_303974 ?auto_303982 ) ) ( not ( = ?auto_303981 ?auto_303982 ) ) ( OBJ-AT ?auto_303975 ?auto_303974 ) ( OBJ-AT ?auto_303976 ?auto_303974 ) ( OBJ-AT ?auto_303977 ?auto_303974 ) ( not ( = ?auto_303975 ?auto_303976 ) ) ( not ( = ?auto_303975 ?auto_303978 ) ) ( not ( = ?auto_303975 ?auto_303977 ) ) ( not ( = ?auto_303975 ?auto_303979 ) ) ( not ( = ?auto_303976 ?auto_303978 ) ) ( not ( = ?auto_303976 ?auto_303977 ) ) ( not ( = ?auto_303976 ?auto_303979 ) ) ( not ( = ?auto_303978 ?auto_303977 ) ) ( not ( = ?auto_303977 ?auto_303979 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303978 ?auto_303979 ?auto_303974 )
      ( DELIVER-5PKG-VERIFY ?auto_303975 ?auto_303976 ?auto_303978 ?auto_303977 ?auto_303979 ?auto_303974 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_304005 - OBJ
      ?auto_304006 - OBJ
      ?auto_304008 - OBJ
      ?auto_304007 - OBJ
      ?auto_304009 - OBJ
      ?auto_304004 - LOCATION
    )
    :vars
    (
      ?auto_304011 - LOCATION
      ?auto_304010 - CITY
      ?auto_304013 - TRUCK
      ?auto_304012 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_304011 ?auto_304010 ) ( IN-CITY ?auto_304004 ?auto_304010 ) ( not ( = ?auto_304004 ?auto_304011 ) ) ( OBJ-AT ?auto_304008 ?auto_304004 ) ( not ( = ?auto_304008 ?auto_304007 ) ) ( OBJ-AT ?auto_304007 ?auto_304011 ) ( TRUCK-AT ?auto_304013 ?auto_304012 ) ( IN-CITY ?auto_304012 ?auto_304010 ) ( not ( = ?auto_304004 ?auto_304012 ) ) ( not ( = ?auto_304011 ?auto_304012 ) ) ( OBJ-AT ?auto_304005 ?auto_304004 ) ( OBJ-AT ?auto_304006 ?auto_304004 ) ( OBJ-AT ?auto_304009 ?auto_304004 ) ( not ( = ?auto_304005 ?auto_304006 ) ) ( not ( = ?auto_304005 ?auto_304008 ) ) ( not ( = ?auto_304005 ?auto_304007 ) ) ( not ( = ?auto_304005 ?auto_304009 ) ) ( not ( = ?auto_304006 ?auto_304008 ) ) ( not ( = ?auto_304006 ?auto_304007 ) ) ( not ( = ?auto_304006 ?auto_304009 ) ) ( not ( = ?auto_304008 ?auto_304009 ) ) ( not ( = ?auto_304007 ?auto_304009 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_304008 ?auto_304007 ?auto_304004 )
      ( DELIVER-5PKG-VERIFY ?auto_304005 ?auto_304006 ?auto_304008 ?auto_304007 ?auto_304009 ?auto_304004 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_304035 - OBJ
      ?auto_304036 - OBJ
      ?auto_304038 - OBJ
      ?auto_304037 - OBJ
      ?auto_304039 - OBJ
      ?auto_304034 - LOCATION
    )
    :vars
    (
      ?auto_304041 - LOCATION
      ?auto_304040 - CITY
      ?auto_304043 - TRUCK
      ?auto_304042 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_304041 ?auto_304040 ) ( IN-CITY ?auto_304034 ?auto_304040 ) ( not ( = ?auto_304034 ?auto_304041 ) ) ( OBJ-AT ?auto_304036 ?auto_304034 ) ( not ( = ?auto_304036 ?auto_304039 ) ) ( OBJ-AT ?auto_304039 ?auto_304041 ) ( TRUCK-AT ?auto_304043 ?auto_304042 ) ( IN-CITY ?auto_304042 ?auto_304040 ) ( not ( = ?auto_304034 ?auto_304042 ) ) ( not ( = ?auto_304041 ?auto_304042 ) ) ( OBJ-AT ?auto_304035 ?auto_304034 ) ( OBJ-AT ?auto_304038 ?auto_304034 ) ( OBJ-AT ?auto_304037 ?auto_304034 ) ( not ( = ?auto_304035 ?auto_304036 ) ) ( not ( = ?auto_304035 ?auto_304038 ) ) ( not ( = ?auto_304035 ?auto_304037 ) ) ( not ( = ?auto_304035 ?auto_304039 ) ) ( not ( = ?auto_304036 ?auto_304038 ) ) ( not ( = ?auto_304036 ?auto_304037 ) ) ( not ( = ?auto_304038 ?auto_304037 ) ) ( not ( = ?auto_304038 ?auto_304039 ) ) ( not ( = ?auto_304037 ?auto_304039 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_304036 ?auto_304039 ?auto_304034 )
      ( DELIVER-5PKG-VERIFY ?auto_304035 ?auto_304036 ?auto_304038 ?auto_304037 ?auto_304039 ?auto_304034 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_304075 - OBJ
      ?auto_304076 - OBJ
      ?auto_304078 - OBJ
      ?auto_304077 - OBJ
      ?auto_304079 - OBJ
      ?auto_304074 - LOCATION
    )
    :vars
    (
      ?auto_304081 - LOCATION
      ?auto_304080 - CITY
      ?auto_304083 - TRUCK
      ?auto_304082 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_304081 ?auto_304080 ) ( IN-CITY ?auto_304074 ?auto_304080 ) ( not ( = ?auto_304074 ?auto_304081 ) ) ( OBJ-AT ?auto_304076 ?auto_304074 ) ( not ( = ?auto_304076 ?auto_304077 ) ) ( OBJ-AT ?auto_304077 ?auto_304081 ) ( TRUCK-AT ?auto_304083 ?auto_304082 ) ( IN-CITY ?auto_304082 ?auto_304080 ) ( not ( = ?auto_304074 ?auto_304082 ) ) ( not ( = ?auto_304081 ?auto_304082 ) ) ( OBJ-AT ?auto_304075 ?auto_304074 ) ( OBJ-AT ?auto_304078 ?auto_304074 ) ( OBJ-AT ?auto_304079 ?auto_304074 ) ( not ( = ?auto_304075 ?auto_304076 ) ) ( not ( = ?auto_304075 ?auto_304078 ) ) ( not ( = ?auto_304075 ?auto_304077 ) ) ( not ( = ?auto_304075 ?auto_304079 ) ) ( not ( = ?auto_304076 ?auto_304078 ) ) ( not ( = ?auto_304076 ?auto_304079 ) ) ( not ( = ?auto_304078 ?auto_304077 ) ) ( not ( = ?auto_304078 ?auto_304079 ) ) ( not ( = ?auto_304077 ?auto_304079 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_304076 ?auto_304077 ?auto_304074 )
      ( DELIVER-5PKG-VERIFY ?auto_304075 ?auto_304076 ?auto_304078 ?auto_304077 ?auto_304079 ?auto_304074 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_304185 - OBJ
      ?auto_304186 - OBJ
      ?auto_304188 - OBJ
      ?auto_304187 - OBJ
      ?auto_304189 - OBJ
      ?auto_304184 - LOCATION
    )
    :vars
    (
      ?auto_304191 - LOCATION
      ?auto_304190 - CITY
      ?auto_304193 - TRUCK
      ?auto_304192 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_304191 ?auto_304190 ) ( IN-CITY ?auto_304184 ?auto_304190 ) ( not ( = ?auto_304184 ?auto_304191 ) ) ( OBJ-AT ?auto_304187 ?auto_304184 ) ( not ( = ?auto_304187 ?auto_304188 ) ) ( OBJ-AT ?auto_304188 ?auto_304191 ) ( TRUCK-AT ?auto_304193 ?auto_304192 ) ( IN-CITY ?auto_304192 ?auto_304190 ) ( not ( = ?auto_304184 ?auto_304192 ) ) ( not ( = ?auto_304191 ?auto_304192 ) ) ( OBJ-AT ?auto_304185 ?auto_304184 ) ( OBJ-AT ?auto_304186 ?auto_304184 ) ( OBJ-AT ?auto_304189 ?auto_304184 ) ( not ( = ?auto_304185 ?auto_304186 ) ) ( not ( = ?auto_304185 ?auto_304188 ) ) ( not ( = ?auto_304185 ?auto_304187 ) ) ( not ( = ?auto_304185 ?auto_304189 ) ) ( not ( = ?auto_304186 ?auto_304188 ) ) ( not ( = ?auto_304186 ?auto_304187 ) ) ( not ( = ?auto_304186 ?auto_304189 ) ) ( not ( = ?auto_304188 ?auto_304189 ) ) ( not ( = ?auto_304187 ?auto_304189 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_304187 ?auto_304188 ?auto_304184 )
      ( DELIVER-5PKG-VERIFY ?auto_304185 ?auto_304186 ?auto_304188 ?auto_304187 ?auto_304189 ?auto_304184 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_304225 - OBJ
      ?auto_304226 - OBJ
      ?auto_304228 - OBJ
      ?auto_304227 - OBJ
      ?auto_304229 - OBJ
      ?auto_304224 - LOCATION
    )
    :vars
    (
      ?auto_304231 - LOCATION
      ?auto_304230 - CITY
      ?auto_304233 - TRUCK
      ?auto_304232 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_304231 ?auto_304230 ) ( IN-CITY ?auto_304224 ?auto_304230 ) ( not ( = ?auto_304224 ?auto_304231 ) ) ( OBJ-AT ?auto_304226 ?auto_304224 ) ( not ( = ?auto_304226 ?auto_304228 ) ) ( OBJ-AT ?auto_304228 ?auto_304231 ) ( TRUCK-AT ?auto_304233 ?auto_304232 ) ( IN-CITY ?auto_304232 ?auto_304230 ) ( not ( = ?auto_304224 ?auto_304232 ) ) ( not ( = ?auto_304231 ?auto_304232 ) ) ( OBJ-AT ?auto_304225 ?auto_304224 ) ( OBJ-AT ?auto_304227 ?auto_304224 ) ( OBJ-AT ?auto_304229 ?auto_304224 ) ( not ( = ?auto_304225 ?auto_304226 ) ) ( not ( = ?auto_304225 ?auto_304228 ) ) ( not ( = ?auto_304225 ?auto_304227 ) ) ( not ( = ?auto_304225 ?auto_304229 ) ) ( not ( = ?auto_304226 ?auto_304227 ) ) ( not ( = ?auto_304226 ?auto_304229 ) ) ( not ( = ?auto_304228 ?auto_304227 ) ) ( not ( = ?auto_304228 ?auto_304229 ) ) ( not ( = ?auto_304227 ?auto_304229 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_304226 ?auto_304228 ?auto_304224 )
      ( DELIVER-5PKG-VERIFY ?auto_304225 ?auto_304226 ?auto_304228 ?auto_304227 ?auto_304229 ?auto_304224 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_304435 - OBJ
      ?auto_304436 - OBJ
      ?auto_304438 - OBJ
      ?auto_304437 - OBJ
      ?auto_304439 - OBJ
      ?auto_304434 - LOCATION
    )
    :vars
    (
      ?auto_304441 - LOCATION
      ?auto_304440 - CITY
      ?auto_304443 - TRUCK
      ?auto_304442 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_304441 ?auto_304440 ) ( IN-CITY ?auto_304434 ?auto_304440 ) ( not ( = ?auto_304434 ?auto_304441 ) ) ( OBJ-AT ?auto_304439 ?auto_304434 ) ( not ( = ?auto_304439 ?auto_304437 ) ) ( OBJ-AT ?auto_304437 ?auto_304441 ) ( TRUCK-AT ?auto_304443 ?auto_304442 ) ( IN-CITY ?auto_304442 ?auto_304440 ) ( not ( = ?auto_304434 ?auto_304442 ) ) ( not ( = ?auto_304441 ?auto_304442 ) ) ( OBJ-AT ?auto_304435 ?auto_304434 ) ( OBJ-AT ?auto_304436 ?auto_304434 ) ( OBJ-AT ?auto_304438 ?auto_304434 ) ( not ( = ?auto_304435 ?auto_304436 ) ) ( not ( = ?auto_304435 ?auto_304438 ) ) ( not ( = ?auto_304435 ?auto_304437 ) ) ( not ( = ?auto_304435 ?auto_304439 ) ) ( not ( = ?auto_304436 ?auto_304438 ) ) ( not ( = ?auto_304436 ?auto_304437 ) ) ( not ( = ?auto_304436 ?auto_304439 ) ) ( not ( = ?auto_304438 ?auto_304437 ) ) ( not ( = ?auto_304438 ?auto_304439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_304439 ?auto_304437 ?auto_304434 )
      ( DELIVER-5PKG-VERIFY ?auto_304435 ?auto_304436 ?auto_304438 ?auto_304437 ?auto_304439 ?auto_304434 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_305085 - OBJ
      ?auto_305086 - OBJ
      ?auto_305088 - OBJ
      ?auto_305087 - OBJ
      ?auto_305089 - OBJ
      ?auto_305084 - LOCATION
    )
    :vars
    (
      ?auto_305091 - LOCATION
      ?auto_305090 - CITY
      ?auto_305093 - TRUCK
      ?auto_305092 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_305091 ?auto_305090 ) ( IN-CITY ?auto_305084 ?auto_305090 ) ( not ( = ?auto_305084 ?auto_305091 ) ) ( OBJ-AT ?auto_305087 ?auto_305084 ) ( not ( = ?auto_305087 ?auto_305086 ) ) ( OBJ-AT ?auto_305086 ?auto_305091 ) ( TRUCK-AT ?auto_305093 ?auto_305092 ) ( IN-CITY ?auto_305092 ?auto_305090 ) ( not ( = ?auto_305084 ?auto_305092 ) ) ( not ( = ?auto_305091 ?auto_305092 ) ) ( OBJ-AT ?auto_305085 ?auto_305084 ) ( OBJ-AT ?auto_305088 ?auto_305084 ) ( OBJ-AT ?auto_305089 ?auto_305084 ) ( not ( = ?auto_305085 ?auto_305086 ) ) ( not ( = ?auto_305085 ?auto_305088 ) ) ( not ( = ?auto_305085 ?auto_305087 ) ) ( not ( = ?auto_305085 ?auto_305089 ) ) ( not ( = ?auto_305086 ?auto_305088 ) ) ( not ( = ?auto_305086 ?auto_305089 ) ) ( not ( = ?auto_305088 ?auto_305087 ) ) ( not ( = ?auto_305088 ?auto_305089 ) ) ( not ( = ?auto_305087 ?auto_305089 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_305087 ?auto_305086 ?auto_305084 )
      ( DELIVER-5PKG-VERIFY ?auto_305085 ?auto_305086 ?auto_305088 ?auto_305087 ?auto_305089 ?auto_305084 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_305115 - OBJ
      ?auto_305116 - OBJ
      ?auto_305118 - OBJ
      ?auto_305117 - OBJ
      ?auto_305119 - OBJ
      ?auto_305114 - LOCATION
    )
    :vars
    (
      ?auto_305121 - LOCATION
      ?auto_305120 - CITY
      ?auto_305123 - TRUCK
      ?auto_305122 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_305121 ?auto_305120 ) ( IN-CITY ?auto_305114 ?auto_305120 ) ( not ( = ?auto_305114 ?auto_305121 ) ) ( OBJ-AT ?auto_305118 ?auto_305114 ) ( not ( = ?auto_305118 ?auto_305116 ) ) ( OBJ-AT ?auto_305116 ?auto_305121 ) ( TRUCK-AT ?auto_305123 ?auto_305122 ) ( IN-CITY ?auto_305122 ?auto_305120 ) ( not ( = ?auto_305114 ?auto_305122 ) ) ( not ( = ?auto_305121 ?auto_305122 ) ) ( OBJ-AT ?auto_305115 ?auto_305114 ) ( OBJ-AT ?auto_305117 ?auto_305114 ) ( OBJ-AT ?auto_305119 ?auto_305114 ) ( not ( = ?auto_305115 ?auto_305116 ) ) ( not ( = ?auto_305115 ?auto_305118 ) ) ( not ( = ?auto_305115 ?auto_305117 ) ) ( not ( = ?auto_305115 ?auto_305119 ) ) ( not ( = ?auto_305116 ?auto_305117 ) ) ( not ( = ?auto_305116 ?auto_305119 ) ) ( not ( = ?auto_305118 ?auto_305117 ) ) ( not ( = ?auto_305118 ?auto_305119 ) ) ( not ( = ?auto_305117 ?auto_305119 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_305118 ?auto_305116 ?auto_305114 )
      ( DELIVER-5PKG-VERIFY ?auto_305115 ?auto_305116 ?auto_305118 ?auto_305117 ?auto_305119 ?auto_305114 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_305715 - OBJ
      ?auto_305716 - OBJ
      ?auto_305718 - OBJ
      ?auto_305717 - OBJ
      ?auto_305719 - OBJ
      ?auto_305714 - LOCATION
    )
    :vars
    (
      ?auto_305721 - LOCATION
      ?auto_305720 - CITY
      ?auto_305723 - TRUCK
      ?auto_305722 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_305721 ?auto_305720 ) ( IN-CITY ?auto_305714 ?auto_305720 ) ( not ( = ?auto_305714 ?auto_305721 ) ) ( OBJ-AT ?auto_305717 ?auto_305714 ) ( not ( = ?auto_305717 ?auto_305719 ) ) ( OBJ-AT ?auto_305719 ?auto_305721 ) ( TRUCK-AT ?auto_305723 ?auto_305722 ) ( IN-CITY ?auto_305722 ?auto_305720 ) ( not ( = ?auto_305714 ?auto_305722 ) ) ( not ( = ?auto_305721 ?auto_305722 ) ) ( OBJ-AT ?auto_305715 ?auto_305714 ) ( OBJ-AT ?auto_305716 ?auto_305714 ) ( OBJ-AT ?auto_305718 ?auto_305714 ) ( not ( = ?auto_305715 ?auto_305716 ) ) ( not ( = ?auto_305715 ?auto_305718 ) ) ( not ( = ?auto_305715 ?auto_305717 ) ) ( not ( = ?auto_305715 ?auto_305719 ) ) ( not ( = ?auto_305716 ?auto_305718 ) ) ( not ( = ?auto_305716 ?auto_305717 ) ) ( not ( = ?auto_305716 ?auto_305719 ) ) ( not ( = ?auto_305718 ?auto_305717 ) ) ( not ( = ?auto_305718 ?auto_305719 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_305717 ?auto_305719 ?auto_305714 )
      ( DELIVER-5PKG-VERIFY ?auto_305715 ?auto_305716 ?auto_305718 ?auto_305717 ?auto_305719 ?auto_305714 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_306165 - OBJ
      ?auto_306166 - OBJ
      ?auto_306168 - OBJ
      ?auto_306167 - OBJ
      ?auto_306169 - OBJ
      ?auto_306164 - LOCATION
    )
    :vars
    (
      ?auto_306172 - LOCATION
      ?auto_306170 - CITY
      ?auto_306171 - OBJ
      ?auto_306174 - TRUCK
      ?auto_306173 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_306172 ?auto_306170 ) ( IN-CITY ?auto_306164 ?auto_306170 ) ( not ( = ?auto_306164 ?auto_306172 ) ) ( OBJ-AT ?auto_306171 ?auto_306164 ) ( not ( = ?auto_306171 ?auto_306169 ) ) ( OBJ-AT ?auto_306169 ?auto_306172 ) ( TRUCK-AT ?auto_306174 ?auto_306173 ) ( IN-CITY ?auto_306173 ?auto_306170 ) ( not ( = ?auto_306164 ?auto_306173 ) ) ( not ( = ?auto_306172 ?auto_306173 ) ) ( OBJ-AT ?auto_306165 ?auto_306164 ) ( OBJ-AT ?auto_306166 ?auto_306164 ) ( OBJ-AT ?auto_306168 ?auto_306164 ) ( OBJ-AT ?auto_306167 ?auto_306164 ) ( not ( = ?auto_306165 ?auto_306166 ) ) ( not ( = ?auto_306165 ?auto_306168 ) ) ( not ( = ?auto_306165 ?auto_306167 ) ) ( not ( = ?auto_306165 ?auto_306169 ) ) ( not ( = ?auto_306165 ?auto_306171 ) ) ( not ( = ?auto_306166 ?auto_306168 ) ) ( not ( = ?auto_306166 ?auto_306167 ) ) ( not ( = ?auto_306166 ?auto_306169 ) ) ( not ( = ?auto_306166 ?auto_306171 ) ) ( not ( = ?auto_306168 ?auto_306167 ) ) ( not ( = ?auto_306168 ?auto_306169 ) ) ( not ( = ?auto_306168 ?auto_306171 ) ) ( not ( = ?auto_306167 ?auto_306169 ) ) ( not ( = ?auto_306167 ?auto_306171 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_306171 ?auto_306169 ?auto_306164 )
      ( DELIVER-5PKG-VERIFY ?auto_306165 ?auto_306166 ?auto_306168 ?auto_306167 ?auto_306169 ?auto_306164 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_306197 - OBJ
      ?auto_306198 - OBJ
      ?auto_306200 - OBJ
      ?auto_306199 - OBJ
      ?auto_306201 - OBJ
      ?auto_306196 - LOCATION
    )
    :vars
    (
      ?auto_306204 - LOCATION
      ?auto_306202 - CITY
      ?auto_306203 - OBJ
      ?auto_306206 - TRUCK
      ?auto_306205 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_306204 ?auto_306202 ) ( IN-CITY ?auto_306196 ?auto_306202 ) ( not ( = ?auto_306196 ?auto_306204 ) ) ( OBJ-AT ?auto_306203 ?auto_306196 ) ( not ( = ?auto_306203 ?auto_306199 ) ) ( OBJ-AT ?auto_306199 ?auto_306204 ) ( TRUCK-AT ?auto_306206 ?auto_306205 ) ( IN-CITY ?auto_306205 ?auto_306202 ) ( not ( = ?auto_306196 ?auto_306205 ) ) ( not ( = ?auto_306204 ?auto_306205 ) ) ( OBJ-AT ?auto_306197 ?auto_306196 ) ( OBJ-AT ?auto_306198 ?auto_306196 ) ( OBJ-AT ?auto_306200 ?auto_306196 ) ( OBJ-AT ?auto_306201 ?auto_306196 ) ( not ( = ?auto_306197 ?auto_306198 ) ) ( not ( = ?auto_306197 ?auto_306200 ) ) ( not ( = ?auto_306197 ?auto_306199 ) ) ( not ( = ?auto_306197 ?auto_306201 ) ) ( not ( = ?auto_306197 ?auto_306203 ) ) ( not ( = ?auto_306198 ?auto_306200 ) ) ( not ( = ?auto_306198 ?auto_306199 ) ) ( not ( = ?auto_306198 ?auto_306201 ) ) ( not ( = ?auto_306198 ?auto_306203 ) ) ( not ( = ?auto_306200 ?auto_306199 ) ) ( not ( = ?auto_306200 ?auto_306201 ) ) ( not ( = ?auto_306200 ?auto_306203 ) ) ( not ( = ?auto_306199 ?auto_306201 ) ) ( not ( = ?auto_306201 ?auto_306203 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_306203 ?auto_306199 ?auto_306196 )
      ( DELIVER-5PKG-VERIFY ?auto_306197 ?auto_306198 ?auto_306200 ?auto_306199 ?auto_306201 ?auto_306196 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_306355 - OBJ
      ?auto_306356 - OBJ
      ?auto_306358 - OBJ
      ?auto_306357 - OBJ
      ?auto_306359 - OBJ
      ?auto_306354 - LOCATION
    )
    :vars
    (
      ?auto_306362 - LOCATION
      ?auto_306360 - CITY
      ?auto_306361 - OBJ
      ?auto_306364 - TRUCK
      ?auto_306363 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_306362 ?auto_306360 ) ( IN-CITY ?auto_306354 ?auto_306360 ) ( not ( = ?auto_306354 ?auto_306362 ) ) ( OBJ-AT ?auto_306361 ?auto_306354 ) ( not ( = ?auto_306361 ?auto_306358 ) ) ( OBJ-AT ?auto_306358 ?auto_306362 ) ( TRUCK-AT ?auto_306364 ?auto_306363 ) ( IN-CITY ?auto_306363 ?auto_306360 ) ( not ( = ?auto_306354 ?auto_306363 ) ) ( not ( = ?auto_306362 ?auto_306363 ) ) ( OBJ-AT ?auto_306355 ?auto_306354 ) ( OBJ-AT ?auto_306356 ?auto_306354 ) ( OBJ-AT ?auto_306357 ?auto_306354 ) ( OBJ-AT ?auto_306359 ?auto_306354 ) ( not ( = ?auto_306355 ?auto_306356 ) ) ( not ( = ?auto_306355 ?auto_306358 ) ) ( not ( = ?auto_306355 ?auto_306357 ) ) ( not ( = ?auto_306355 ?auto_306359 ) ) ( not ( = ?auto_306355 ?auto_306361 ) ) ( not ( = ?auto_306356 ?auto_306358 ) ) ( not ( = ?auto_306356 ?auto_306357 ) ) ( not ( = ?auto_306356 ?auto_306359 ) ) ( not ( = ?auto_306356 ?auto_306361 ) ) ( not ( = ?auto_306358 ?auto_306357 ) ) ( not ( = ?auto_306358 ?auto_306359 ) ) ( not ( = ?auto_306357 ?auto_306359 ) ) ( not ( = ?auto_306357 ?auto_306361 ) ) ( not ( = ?auto_306359 ?auto_306361 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_306361 ?auto_306358 ?auto_306354 )
      ( DELIVER-5PKG-VERIFY ?auto_306355 ?auto_306356 ?auto_306358 ?auto_306357 ?auto_306359 ?auto_306354 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_306903 - OBJ
      ?auto_306904 - OBJ
      ?auto_306906 - OBJ
      ?auto_306905 - OBJ
      ?auto_306907 - OBJ
      ?auto_306902 - LOCATION
    )
    :vars
    (
      ?auto_306909 - LOCATION
      ?auto_306908 - CITY
      ?auto_306911 - TRUCK
      ?auto_306910 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_306909 ?auto_306908 ) ( IN-CITY ?auto_306902 ?auto_306908 ) ( not ( = ?auto_306902 ?auto_306909 ) ) ( OBJ-AT ?auto_306907 ?auto_306902 ) ( not ( = ?auto_306907 ?auto_306904 ) ) ( OBJ-AT ?auto_306904 ?auto_306909 ) ( TRUCK-AT ?auto_306911 ?auto_306910 ) ( IN-CITY ?auto_306910 ?auto_306908 ) ( not ( = ?auto_306902 ?auto_306910 ) ) ( not ( = ?auto_306909 ?auto_306910 ) ) ( OBJ-AT ?auto_306903 ?auto_306902 ) ( OBJ-AT ?auto_306906 ?auto_306902 ) ( OBJ-AT ?auto_306905 ?auto_306902 ) ( not ( = ?auto_306903 ?auto_306904 ) ) ( not ( = ?auto_306903 ?auto_306906 ) ) ( not ( = ?auto_306903 ?auto_306905 ) ) ( not ( = ?auto_306903 ?auto_306907 ) ) ( not ( = ?auto_306904 ?auto_306906 ) ) ( not ( = ?auto_306904 ?auto_306905 ) ) ( not ( = ?auto_306906 ?auto_306905 ) ) ( not ( = ?auto_306906 ?auto_306907 ) ) ( not ( = ?auto_306905 ?auto_306907 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_306907 ?auto_306904 ?auto_306902 )
      ( DELIVER-5PKG-VERIFY ?auto_306903 ?auto_306904 ?auto_306906 ?auto_306905 ?auto_306907 ?auto_306902 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_307073 - OBJ
      ?auto_307074 - OBJ
      ?auto_307076 - OBJ
      ?auto_307075 - OBJ
      ?auto_307077 - OBJ
      ?auto_307072 - LOCATION
    )
    :vars
    (
      ?auto_307080 - LOCATION
      ?auto_307078 - CITY
      ?auto_307079 - OBJ
      ?auto_307082 - TRUCK
      ?auto_307081 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_307080 ?auto_307078 ) ( IN-CITY ?auto_307072 ?auto_307078 ) ( not ( = ?auto_307072 ?auto_307080 ) ) ( OBJ-AT ?auto_307079 ?auto_307072 ) ( not ( = ?auto_307079 ?auto_307074 ) ) ( OBJ-AT ?auto_307074 ?auto_307080 ) ( TRUCK-AT ?auto_307082 ?auto_307081 ) ( IN-CITY ?auto_307081 ?auto_307078 ) ( not ( = ?auto_307072 ?auto_307081 ) ) ( not ( = ?auto_307080 ?auto_307081 ) ) ( OBJ-AT ?auto_307073 ?auto_307072 ) ( OBJ-AT ?auto_307076 ?auto_307072 ) ( OBJ-AT ?auto_307075 ?auto_307072 ) ( OBJ-AT ?auto_307077 ?auto_307072 ) ( not ( = ?auto_307073 ?auto_307074 ) ) ( not ( = ?auto_307073 ?auto_307076 ) ) ( not ( = ?auto_307073 ?auto_307075 ) ) ( not ( = ?auto_307073 ?auto_307077 ) ) ( not ( = ?auto_307073 ?auto_307079 ) ) ( not ( = ?auto_307074 ?auto_307076 ) ) ( not ( = ?auto_307074 ?auto_307075 ) ) ( not ( = ?auto_307074 ?auto_307077 ) ) ( not ( = ?auto_307076 ?auto_307075 ) ) ( not ( = ?auto_307076 ?auto_307077 ) ) ( not ( = ?auto_307076 ?auto_307079 ) ) ( not ( = ?auto_307075 ?auto_307077 ) ) ( not ( = ?auto_307075 ?auto_307079 ) ) ( not ( = ?auto_307077 ?auto_307079 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_307079 ?auto_307074 ?auto_307072 )
      ( DELIVER-5PKG-VERIFY ?auto_307073 ?auto_307074 ?auto_307076 ?auto_307075 ?auto_307077 ?auto_307072 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_309385 - OBJ
      ?auto_309386 - OBJ
      ?auto_309388 - OBJ
      ?auto_309387 - OBJ
      ?auto_309389 - OBJ
      ?auto_309384 - LOCATION
    )
    :vars
    (
      ?auto_309391 - LOCATION
      ?auto_309390 - CITY
      ?auto_309393 - TRUCK
      ?auto_309392 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_309391 ?auto_309390 ) ( IN-CITY ?auto_309384 ?auto_309390 ) ( not ( = ?auto_309384 ?auto_309391 ) ) ( OBJ-AT ?auto_309388 ?auto_309384 ) ( not ( = ?auto_309388 ?auto_309385 ) ) ( OBJ-AT ?auto_309385 ?auto_309391 ) ( TRUCK-AT ?auto_309393 ?auto_309392 ) ( IN-CITY ?auto_309392 ?auto_309390 ) ( not ( = ?auto_309384 ?auto_309392 ) ) ( not ( = ?auto_309391 ?auto_309392 ) ) ( OBJ-AT ?auto_309386 ?auto_309384 ) ( OBJ-AT ?auto_309387 ?auto_309384 ) ( OBJ-AT ?auto_309389 ?auto_309384 ) ( not ( = ?auto_309385 ?auto_309386 ) ) ( not ( = ?auto_309385 ?auto_309387 ) ) ( not ( = ?auto_309385 ?auto_309389 ) ) ( not ( = ?auto_309386 ?auto_309388 ) ) ( not ( = ?auto_309386 ?auto_309387 ) ) ( not ( = ?auto_309386 ?auto_309389 ) ) ( not ( = ?auto_309388 ?auto_309387 ) ) ( not ( = ?auto_309388 ?auto_309389 ) ) ( not ( = ?auto_309387 ?auto_309389 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_309388 ?auto_309385 ?auto_309384 )
      ( DELIVER-5PKG-VERIFY ?auto_309385 ?auto_309386 ?auto_309388 ?auto_309387 ?auto_309389 ?auto_309384 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_309545 - OBJ
      ?auto_309546 - OBJ
      ?auto_309548 - OBJ
      ?auto_309547 - OBJ
      ?auto_309549 - OBJ
      ?auto_309544 - LOCATION
    )
    :vars
    (
      ?auto_309551 - LOCATION
      ?auto_309550 - CITY
      ?auto_309553 - TRUCK
      ?auto_309552 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_309551 ?auto_309550 ) ( IN-CITY ?auto_309544 ?auto_309550 ) ( not ( = ?auto_309544 ?auto_309551 ) ) ( OBJ-AT ?auto_309546 ?auto_309544 ) ( not ( = ?auto_309546 ?auto_309545 ) ) ( OBJ-AT ?auto_309545 ?auto_309551 ) ( TRUCK-AT ?auto_309553 ?auto_309552 ) ( IN-CITY ?auto_309552 ?auto_309550 ) ( not ( = ?auto_309544 ?auto_309552 ) ) ( not ( = ?auto_309551 ?auto_309552 ) ) ( OBJ-AT ?auto_309548 ?auto_309544 ) ( OBJ-AT ?auto_309547 ?auto_309544 ) ( OBJ-AT ?auto_309549 ?auto_309544 ) ( not ( = ?auto_309545 ?auto_309548 ) ) ( not ( = ?auto_309545 ?auto_309547 ) ) ( not ( = ?auto_309545 ?auto_309549 ) ) ( not ( = ?auto_309546 ?auto_309548 ) ) ( not ( = ?auto_309546 ?auto_309547 ) ) ( not ( = ?auto_309546 ?auto_309549 ) ) ( not ( = ?auto_309548 ?auto_309547 ) ) ( not ( = ?auto_309548 ?auto_309549 ) ) ( not ( = ?auto_309547 ?auto_309549 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_309546 ?auto_309545 ?auto_309544 )
      ( DELIVER-5PKG-VERIFY ?auto_309545 ?auto_309546 ?auto_309548 ?auto_309547 ?auto_309549 ?auto_309544 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_310025 - OBJ
      ?auto_310026 - OBJ
      ?auto_310028 - OBJ
      ?auto_310027 - OBJ
      ?auto_310029 - OBJ
      ?auto_310024 - LOCATION
    )
    :vars
    (
      ?auto_310031 - LOCATION
      ?auto_310030 - CITY
      ?auto_310033 - TRUCK
      ?auto_310032 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_310031 ?auto_310030 ) ( IN-CITY ?auto_310024 ?auto_310030 ) ( not ( = ?auto_310024 ?auto_310031 ) ) ( OBJ-AT ?auto_310029 ?auto_310024 ) ( not ( = ?auto_310029 ?auto_310025 ) ) ( OBJ-AT ?auto_310025 ?auto_310031 ) ( TRUCK-AT ?auto_310033 ?auto_310032 ) ( IN-CITY ?auto_310032 ?auto_310030 ) ( not ( = ?auto_310024 ?auto_310032 ) ) ( not ( = ?auto_310031 ?auto_310032 ) ) ( OBJ-AT ?auto_310026 ?auto_310024 ) ( OBJ-AT ?auto_310028 ?auto_310024 ) ( OBJ-AT ?auto_310027 ?auto_310024 ) ( not ( = ?auto_310025 ?auto_310026 ) ) ( not ( = ?auto_310025 ?auto_310028 ) ) ( not ( = ?auto_310025 ?auto_310027 ) ) ( not ( = ?auto_310026 ?auto_310028 ) ) ( not ( = ?auto_310026 ?auto_310027 ) ) ( not ( = ?auto_310026 ?auto_310029 ) ) ( not ( = ?auto_310028 ?auto_310027 ) ) ( not ( = ?auto_310028 ?auto_310029 ) ) ( not ( = ?auto_310027 ?auto_310029 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_310029 ?auto_310025 ?auto_310024 )
      ( DELIVER-5PKG-VERIFY ?auto_310025 ?auto_310026 ?auto_310028 ?auto_310027 ?auto_310029 ?auto_310024 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_310195 - OBJ
      ?auto_310196 - OBJ
      ?auto_310198 - OBJ
      ?auto_310197 - OBJ
      ?auto_310199 - OBJ
      ?auto_310194 - LOCATION
    )
    :vars
    (
      ?auto_310202 - LOCATION
      ?auto_310200 - CITY
      ?auto_310201 - OBJ
      ?auto_310204 - TRUCK
      ?auto_310203 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_310202 ?auto_310200 ) ( IN-CITY ?auto_310194 ?auto_310200 ) ( not ( = ?auto_310194 ?auto_310202 ) ) ( OBJ-AT ?auto_310201 ?auto_310194 ) ( not ( = ?auto_310201 ?auto_310195 ) ) ( OBJ-AT ?auto_310195 ?auto_310202 ) ( TRUCK-AT ?auto_310204 ?auto_310203 ) ( IN-CITY ?auto_310203 ?auto_310200 ) ( not ( = ?auto_310194 ?auto_310203 ) ) ( not ( = ?auto_310202 ?auto_310203 ) ) ( OBJ-AT ?auto_310196 ?auto_310194 ) ( OBJ-AT ?auto_310198 ?auto_310194 ) ( OBJ-AT ?auto_310197 ?auto_310194 ) ( OBJ-AT ?auto_310199 ?auto_310194 ) ( not ( = ?auto_310195 ?auto_310196 ) ) ( not ( = ?auto_310195 ?auto_310198 ) ) ( not ( = ?auto_310195 ?auto_310197 ) ) ( not ( = ?auto_310195 ?auto_310199 ) ) ( not ( = ?auto_310196 ?auto_310198 ) ) ( not ( = ?auto_310196 ?auto_310197 ) ) ( not ( = ?auto_310196 ?auto_310199 ) ) ( not ( = ?auto_310196 ?auto_310201 ) ) ( not ( = ?auto_310198 ?auto_310197 ) ) ( not ( = ?auto_310198 ?auto_310199 ) ) ( not ( = ?auto_310198 ?auto_310201 ) ) ( not ( = ?auto_310197 ?auto_310199 ) ) ( not ( = ?auto_310197 ?auto_310201 ) ) ( not ( = ?auto_310199 ?auto_310201 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_310201 ?auto_310195 ?auto_310194 )
      ( DELIVER-5PKG-VERIFY ?auto_310195 ?auto_310196 ?auto_310198 ?auto_310197 ?auto_310199 ?auto_310194 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_312186 - OBJ
      ?auto_312187 - OBJ
      ?auto_312188 - OBJ
      ?auto_312185 - LOCATION
    )
    :vars
    (
      ?auto_312192 - LOCATION
      ?auto_312190 - CITY
      ?auto_312191 - TRUCK
      ?auto_312189 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_312192 ?auto_312190 ) ( IN-CITY ?auto_312185 ?auto_312190 ) ( not ( = ?auto_312185 ?auto_312192 ) ) ( OBJ-AT ?auto_312187 ?auto_312185 ) ( not ( = ?auto_312187 ?auto_312186 ) ) ( OBJ-AT ?auto_312186 ?auto_312192 ) ( TRUCK-AT ?auto_312191 ?auto_312189 ) ( IN-CITY ?auto_312189 ?auto_312190 ) ( not ( = ?auto_312185 ?auto_312189 ) ) ( not ( = ?auto_312192 ?auto_312189 ) ) ( OBJ-AT ?auto_312188 ?auto_312185 ) ( not ( = ?auto_312186 ?auto_312188 ) ) ( not ( = ?auto_312187 ?auto_312188 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_312187 ?auto_312186 ?auto_312185 )
      ( DELIVER-3PKG-VERIFY ?auto_312186 ?auto_312187 ?auto_312188 ?auto_312185 ) )
  )

)

