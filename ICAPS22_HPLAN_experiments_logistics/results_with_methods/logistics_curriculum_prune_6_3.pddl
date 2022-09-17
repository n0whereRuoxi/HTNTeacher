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

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2353379 - OBJ
      ?auto_2353378 - LOCATION
    )
    :vars
    (
      ?auto_2353381 - LOCATION
      ?auto_2353382 - CITY
      ?auto_2353380 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2353381 ?auto_2353382 ) ( IN-CITY ?auto_2353378 ?auto_2353382 ) ( not ( = ?auto_2353378 ?auto_2353381 ) ) ( OBJ-AT ?auto_2353379 ?auto_2353381 ) ( TRUCK-AT ?auto_2353380 ?auto_2353378 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2353380 ?auto_2353378 ?auto_2353381 ?auto_2353382 )
      ( !LOAD-TRUCK ?auto_2353379 ?auto_2353380 ?auto_2353381 )
      ( !DRIVE-TRUCK ?auto_2353380 ?auto_2353381 ?auto_2353378 ?auto_2353382 )
      ( !UNLOAD-TRUCK ?auto_2353379 ?auto_2353380 ?auto_2353378 )
      ( DELIVER-1PKG-VERIFY ?auto_2353379 ?auto_2353378 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2353400 - OBJ
      ?auto_2353401 - OBJ
      ?auto_2353399 - LOCATION
    )
    :vars
    (
      ?auto_2353403 - LOCATION
      ?auto_2353402 - CITY
      ?auto_2353404 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2353403 ?auto_2353402 ) ( IN-CITY ?auto_2353399 ?auto_2353402 ) ( not ( = ?auto_2353399 ?auto_2353403 ) ) ( OBJ-AT ?auto_2353401 ?auto_2353403 ) ( OBJ-AT ?auto_2353400 ?auto_2353403 ) ( TRUCK-AT ?auto_2353404 ?auto_2353399 ) ( not ( = ?auto_2353400 ?auto_2353401 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2353400 ?auto_2353399 )
      ( DELIVER-1PKG ?auto_2353401 ?auto_2353399 )
      ( DELIVER-2PKG-VERIFY ?auto_2353400 ?auto_2353401 ?auto_2353399 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2353508 - OBJ
      ?auto_2353509 - OBJ
      ?auto_2353510 - OBJ
      ?auto_2353507 - LOCATION
    )
    :vars
    (
      ?auto_2353511 - LOCATION
      ?auto_2353513 - CITY
      ?auto_2353514 - LOCATION
      ?auto_2353512 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2353511 ?auto_2353513 ) ( IN-CITY ?auto_2353507 ?auto_2353513 ) ( not ( = ?auto_2353507 ?auto_2353511 ) ) ( OBJ-AT ?auto_2353510 ?auto_2353511 ) ( IN-CITY ?auto_2353514 ?auto_2353513 ) ( not ( = ?auto_2353507 ?auto_2353514 ) ) ( OBJ-AT ?auto_2353509 ?auto_2353514 ) ( OBJ-AT ?auto_2353508 ?auto_2353514 ) ( TRUCK-AT ?auto_2353512 ?auto_2353507 ) ( not ( = ?auto_2353508 ?auto_2353509 ) ) ( not ( = ?auto_2353508 ?auto_2353510 ) ) ( not ( = ?auto_2353509 ?auto_2353510 ) ) ( not ( = ?auto_2353511 ?auto_2353514 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2353508 ?auto_2353509 ?auto_2353507 )
      ( DELIVER-1PKG ?auto_2353510 ?auto_2353507 )
      ( DELIVER-3PKG-VERIFY ?auto_2353508 ?auto_2353509 ?auto_2353510 ?auto_2353507 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2353525 - OBJ
      ?auto_2353526 - OBJ
      ?auto_2353527 - OBJ
      ?auto_2353524 - LOCATION
    )
    :vars
    (
      ?auto_2353530 - LOCATION
      ?auto_2353531 - CITY
      ?auto_2353529 - LOCATION
      ?auto_2353528 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2353530 ?auto_2353531 ) ( IN-CITY ?auto_2353524 ?auto_2353531 ) ( not ( = ?auto_2353524 ?auto_2353530 ) ) ( OBJ-AT ?auto_2353526 ?auto_2353530 ) ( IN-CITY ?auto_2353529 ?auto_2353531 ) ( not ( = ?auto_2353524 ?auto_2353529 ) ) ( OBJ-AT ?auto_2353527 ?auto_2353529 ) ( OBJ-AT ?auto_2353525 ?auto_2353529 ) ( TRUCK-AT ?auto_2353528 ?auto_2353524 ) ( not ( = ?auto_2353525 ?auto_2353527 ) ) ( not ( = ?auto_2353525 ?auto_2353526 ) ) ( not ( = ?auto_2353527 ?auto_2353526 ) ) ( not ( = ?auto_2353530 ?auto_2353529 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2353525 ?auto_2353527 ?auto_2353526 ?auto_2353524 )
      ( DELIVER-3PKG-VERIFY ?auto_2353525 ?auto_2353526 ?auto_2353527 ?auto_2353524 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2353586 - OBJ
      ?auto_2353587 - OBJ
      ?auto_2353588 - OBJ
      ?auto_2353585 - LOCATION
    )
    :vars
    (
      ?auto_2353589 - LOCATION
      ?auto_2353591 - CITY
      ?auto_2353590 - LOCATION
      ?auto_2353592 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2353589 ?auto_2353591 ) ( IN-CITY ?auto_2353585 ?auto_2353591 ) ( not ( = ?auto_2353585 ?auto_2353589 ) ) ( OBJ-AT ?auto_2353586 ?auto_2353589 ) ( IN-CITY ?auto_2353590 ?auto_2353591 ) ( not ( = ?auto_2353585 ?auto_2353590 ) ) ( OBJ-AT ?auto_2353588 ?auto_2353590 ) ( OBJ-AT ?auto_2353587 ?auto_2353590 ) ( TRUCK-AT ?auto_2353592 ?auto_2353585 ) ( not ( = ?auto_2353587 ?auto_2353588 ) ) ( not ( = ?auto_2353587 ?auto_2353586 ) ) ( not ( = ?auto_2353588 ?auto_2353586 ) ) ( not ( = ?auto_2353589 ?auto_2353590 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2353587 ?auto_2353586 ?auto_2353588 ?auto_2353585 )
      ( DELIVER-3PKG-VERIFY ?auto_2353586 ?auto_2353587 ?auto_2353588 ?auto_2353585 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2354637 - OBJ
      ?auto_2354638 - OBJ
      ?auto_2354639 - OBJ
      ?auto_2354640 - OBJ
      ?auto_2354636 - LOCATION
    )
    :vars
    (
      ?auto_2354642 - LOCATION
      ?auto_2354643 - CITY
      ?auto_2354644 - LOCATION
      ?auto_2354645 - LOCATION
      ?auto_2354641 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2354642 ?auto_2354643 ) ( IN-CITY ?auto_2354636 ?auto_2354643 ) ( not ( = ?auto_2354636 ?auto_2354642 ) ) ( OBJ-AT ?auto_2354640 ?auto_2354642 ) ( IN-CITY ?auto_2354644 ?auto_2354643 ) ( not ( = ?auto_2354636 ?auto_2354644 ) ) ( OBJ-AT ?auto_2354639 ?auto_2354644 ) ( IN-CITY ?auto_2354645 ?auto_2354643 ) ( not ( = ?auto_2354636 ?auto_2354645 ) ) ( OBJ-AT ?auto_2354638 ?auto_2354645 ) ( OBJ-AT ?auto_2354637 ?auto_2354645 ) ( TRUCK-AT ?auto_2354641 ?auto_2354636 ) ( not ( = ?auto_2354637 ?auto_2354638 ) ) ( not ( = ?auto_2354637 ?auto_2354639 ) ) ( not ( = ?auto_2354638 ?auto_2354639 ) ) ( not ( = ?auto_2354644 ?auto_2354645 ) ) ( not ( = ?auto_2354637 ?auto_2354640 ) ) ( not ( = ?auto_2354638 ?auto_2354640 ) ) ( not ( = ?auto_2354639 ?auto_2354640 ) ) ( not ( = ?auto_2354642 ?auto_2354644 ) ) ( not ( = ?auto_2354642 ?auto_2354645 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2354637 ?auto_2354639 ?auto_2354638 ?auto_2354636 )
      ( DELIVER-1PKG ?auto_2354640 ?auto_2354636 )
      ( DELIVER-4PKG-VERIFY ?auto_2354637 ?auto_2354638 ?auto_2354639 ?auto_2354640 ?auto_2354636 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2354696 - OBJ
      ?auto_2354697 - OBJ
      ?auto_2354698 - OBJ
      ?auto_2354699 - OBJ
      ?auto_2354695 - LOCATION
    )
    :vars
    (
      ?auto_2354704 - LOCATION
      ?auto_2354700 - CITY
      ?auto_2354703 - LOCATION
      ?auto_2354701 - LOCATION
      ?auto_2354702 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2354704 ?auto_2354700 ) ( IN-CITY ?auto_2354695 ?auto_2354700 ) ( not ( = ?auto_2354695 ?auto_2354704 ) ) ( OBJ-AT ?auto_2354699 ?auto_2354704 ) ( IN-CITY ?auto_2354703 ?auto_2354700 ) ( not ( = ?auto_2354695 ?auto_2354703 ) ) ( OBJ-AT ?auto_2354697 ?auto_2354703 ) ( IN-CITY ?auto_2354701 ?auto_2354700 ) ( not ( = ?auto_2354695 ?auto_2354701 ) ) ( OBJ-AT ?auto_2354698 ?auto_2354701 ) ( OBJ-AT ?auto_2354696 ?auto_2354701 ) ( TRUCK-AT ?auto_2354702 ?auto_2354695 ) ( not ( = ?auto_2354696 ?auto_2354698 ) ) ( not ( = ?auto_2354696 ?auto_2354697 ) ) ( not ( = ?auto_2354698 ?auto_2354697 ) ) ( not ( = ?auto_2354703 ?auto_2354701 ) ) ( not ( = ?auto_2354696 ?auto_2354699 ) ) ( not ( = ?auto_2354698 ?auto_2354699 ) ) ( not ( = ?auto_2354697 ?auto_2354699 ) ) ( not ( = ?auto_2354704 ?auto_2354703 ) ) ( not ( = ?auto_2354704 ?auto_2354701 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2354696 ?auto_2354698 ?auto_2354697 ?auto_2354699 ?auto_2354695 )
      ( DELIVER-4PKG-VERIFY ?auto_2354696 ?auto_2354697 ?auto_2354698 ?auto_2354699 ?auto_2354695 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2354728 - OBJ
      ?auto_2354729 - OBJ
      ?auto_2354730 - OBJ
      ?auto_2354731 - OBJ
      ?auto_2354727 - LOCATION
    )
    :vars
    (
      ?auto_2354736 - LOCATION
      ?auto_2354734 - CITY
      ?auto_2354732 - LOCATION
      ?auto_2354733 - LOCATION
      ?auto_2354735 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2354736 ?auto_2354734 ) ( IN-CITY ?auto_2354727 ?auto_2354734 ) ( not ( = ?auto_2354727 ?auto_2354736 ) ) ( OBJ-AT ?auto_2354730 ?auto_2354736 ) ( IN-CITY ?auto_2354732 ?auto_2354734 ) ( not ( = ?auto_2354727 ?auto_2354732 ) ) ( OBJ-AT ?auto_2354729 ?auto_2354732 ) ( IN-CITY ?auto_2354733 ?auto_2354734 ) ( not ( = ?auto_2354727 ?auto_2354733 ) ) ( OBJ-AT ?auto_2354731 ?auto_2354733 ) ( OBJ-AT ?auto_2354728 ?auto_2354733 ) ( TRUCK-AT ?auto_2354735 ?auto_2354727 ) ( not ( = ?auto_2354728 ?auto_2354731 ) ) ( not ( = ?auto_2354728 ?auto_2354729 ) ) ( not ( = ?auto_2354731 ?auto_2354729 ) ) ( not ( = ?auto_2354732 ?auto_2354733 ) ) ( not ( = ?auto_2354728 ?auto_2354730 ) ) ( not ( = ?auto_2354731 ?auto_2354730 ) ) ( not ( = ?auto_2354729 ?auto_2354730 ) ) ( not ( = ?auto_2354736 ?auto_2354732 ) ) ( not ( = ?auto_2354736 ?auto_2354733 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2354728 ?auto_2354729 ?auto_2354731 ?auto_2354730 ?auto_2354727 )
      ( DELIVER-4PKG-VERIFY ?auto_2354728 ?auto_2354729 ?auto_2354730 ?auto_2354731 ?auto_2354727 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2355317 - OBJ
      ?auto_2355318 - OBJ
      ?auto_2355319 - OBJ
      ?auto_2355320 - OBJ
      ?auto_2355316 - LOCATION
    )
    :vars
    (
      ?auto_2355325 - LOCATION
      ?auto_2355323 - CITY
      ?auto_2355321 - LOCATION
      ?auto_2355322 - LOCATION
      ?auto_2355324 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2355325 ?auto_2355323 ) ( IN-CITY ?auto_2355316 ?auto_2355323 ) ( not ( = ?auto_2355316 ?auto_2355325 ) ) ( OBJ-AT ?auto_2355320 ?auto_2355325 ) ( IN-CITY ?auto_2355321 ?auto_2355323 ) ( not ( = ?auto_2355316 ?auto_2355321 ) ) ( OBJ-AT ?auto_2355317 ?auto_2355321 ) ( IN-CITY ?auto_2355322 ?auto_2355323 ) ( not ( = ?auto_2355316 ?auto_2355322 ) ) ( OBJ-AT ?auto_2355319 ?auto_2355322 ) ( OBJ-AT ?auto_2355318 ?auto_2355322 ) ( TRUCK-AT ?auto_2355324 ?auto_2355316 ) ( not ( = ?auto_2355318 ?auto_2355319 ) ) ( not ( = ?auto_2355318 ?auto_2355317 ) ) ( not ( = ?auto_2355319 ?auto_2355317 ) ) ( not ( = ?auto_2355321 ?auto_2355322 ) ) ( not ( = ?auto_2355318 ?auto_2355320 ) ) ( not ( = ?auto_2355319 ?auto_2355320 ) ) ( not ( = ?auto_2355317 ?auto_2355320 ) ) ( not ( = ?auto_2355325 ?auto_2355321 ) ) ( not ( = ?auto_2355325 ?auto_2355322 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2355318 ?auto_2355317 ?auto_2355319 ?auto_2355320 ?auto_2355316 )
      ( DELIVER-4PKG-VERIFY ?auto_2355317 ?auto_2355318 ?auto_2355319 ?auto_2355320 ?auto_2355316 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2355349 - OBJ
      ?auto_2355350 - OBJ
      ?auto_2355351 - OBJ
      ?auto_2355352 - OBJ
      ?auto_2355348 - LOCATION
    )
    :vars
    (
      ?auto_2355357 - LOCATION
      ?auto_2355355 - CITY
      ?auto_2355353 - LOCATION
      ?auto_2355354 - LOCATION
      ?auto_2355356 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2355357 ?auto_2355355 ) ( IN-CITY ?auto_2355348 ?auto_2355355 ) ( not ( = ?auto_2355348 ?auto_2355357 ) ) ( OBJ-AT ?auto_2355351 ?auto_2355357 ) ( IN-CITY ?auto_2355353 ?auto_2355355 ) ( not ( = ?auto_2355348 ?auto_2355353 ) ) ( OBJ-AT ?auto_2355349 ?auto_2355353 ) ( IN-CITY ?auto_2355354 ?auto_2355355 ) ( not ( = ?auto_2355348 ?auto_2355354 ) ) ( OBJ-AT ?auto_2355352 ?auto_2355354 ) ( OBJ-AT ?auto_2355350 ?auto_2355354 ) ( TRUCK-AT ?auto_2355356 ?auto_2355348 ) ( not ( = ?auto_2355350 ?auto_2355352 ) ) ( not ( = ?auto_2355350 ?auto_2355349 ) ) ( not ( = ?auto_2355352 ?auto_2355349 ) ) ( not ( = ?auto_2355353 ?auto_2355354 ) ) ( not ( = ?auto_2355350 ?auto_2355351 ) ) ( not ( = ?auto_2355352 ?auto_2355351 ) ) ( not ( = ?auto_2355349 ?auto_2355351 ) ) ( not ( = ?auto_2355357 ?auto_2355353 ) ) ( not ( = ?auto_2355357 ?auto_2355354 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2355350 ?auto_2355349 ?auto_2355352 ?auto_2355351 ?auto_2355348 )
      ( DELIVER-4PKG-VERIFY ?auto_2355349 ?auto_2355350 ?auto_2355351 ?auto_2355352 ?auto_2355348 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2355537 - OBJ
      ?auto_2355538 - OBJ
      ?auto_2355539 - OBJ
      ?auto_2355540 - OBJ
      ?auto_2355536 - LOCATION
    )
    :vars
    (
      ?auto_2355545 - LOCATION
      ?auto_2355543 - CITY
      ?auto_2355541 - LOCATION
      ?auto_2355542 - LOCATION
      ?auto_2355544 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2355545 ?auto_2355543 ) ( IN-CITY ?auto_2355536 ?auto_2355543 ) ( not ( = ?auto_2355536 ?auto_2355545 ) ) ( OBJ-AT ?auto_2355538 ?auto_2355545 ) ( IN-CITY ?auto_2355541 ?auto_2355543 ) ( not ( = ?auto_2355536 ?auto_2355541 ) ) ( OBJ-AT ?auto_2355537 ?auto_2355541 ) ( IN-CITY ?auto_2355542 ?auto_2355543 ) ( not ( = ?auto_2355536 ?auto_2355542 ) ) ( OBJ-AT ?auto_2355540 ?auto_2355542 ) ( OBJ-AT ?auto_2355539 ?auto_2355542 ) ( TRUCK-AT ?auto_2355544 ?auto_2355536 ) ( not ( = ?auto_2355539 ?auto_2355540 ) ) ( not ( = ?auto_2355539 ?auto_2355537 ) ) ( not ( = ?auto_2355540 ?auto_2355537 ) ) ( not ( = ?auto_2355541 ?auto_2355542 ) ) ( not ( = ?auto_2355539 ?auto_2355538 ) ) ( not ( = ?auto_2355540 ?auto_2355538 ) ) ( not ( = ?auto_2355537 ?auto_2355538 ) ) ( not ( = ?auto_2355545 ?auto_2355541 ) ) ( not ( = ?auto_2355545 ?auto_2355542 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2355539 ?auto_2355537 ?auto_2355540 ?auto_2355538 ?auto_2355536 )
      ( DELIVER-4PKG-VERIFY ?auto_2355537 ?auto_2355538 ?auto_2355539 ?auto_2355540 ?auto_2355536 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2370047 - OBJ
      ?auto_2370048 - OBJ
      ?auto_2370049 - OBJ
      ?auto_2370050 - OBJ
      ?auto_2370051 - OBJ
      ?auto_2370046 - LOCATION
    )
    :vars
    (
      ?auto_2370054 - LOCATION
      ?auto_2370052 - CITY
      ?auto_2370055 - LOCATION
      ?auto_2370056 - LOCATION
      ?auto_2370053 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2370054 ?auto_2370052 ) ( IN-CITY ?auto_2370046 ?auto_2370052 ) ( not ( = ?auto_2370046 ?auto_2370054 ) ) ( OBJ-AT ?auto_2370051 ?auto_2370054 ) ( OBJ-AT ?auto_2370050 ?auto_2370054 ) ( IN-CITY ?auto_2370055 ?auto_2370052 ) ( not ( = ?auto_2370046 ?auto_2370055 ) ) ( OBJ-AT ?auto_2370049 ?auto_2370055 ) ( IN-CITY ?auto_2370056 ?auto_2370052 ) ( not ( = ?auto_2370046 ?auto_2370056 ) ) ( OBJ-AT ?auto_2370048 ?auto_2370056 ) ( OBJ-AT ?auto_2370047 ?auto_2370056 ) ( TRUCK-AT ?auto_2370053 ?auto_2370046 ) ( not ( = ?auto_2370047 ?auto_2370048 ) ) ( not ( = ?auto_2370047 ?auto_2370049 ) ) ( not ( = ?auto_2370048 ?auto_2370049 ) ) ( not ( = ?auto_2370055 ?auto_2370056 ) ) ( not ( = ?auto_2370047 ?auto_2370050 ) ) ( not ( = ?auto_2370048 ?auto_2370050 ) ) ( not ( = ?auto_2370049 ?auto_2370050 ) ) ( not ( = ?auto_2370054 ?auto_2370055 ) ) ( not ( = ?auto_2370054 ?auto_2370056 ) ) ( not ( = ?auto_2370047 ?auto_2370051 ) ) ( not ( = ?auto_2370048 ?auto_2370051 ) ) ( not ( = ?auto_2370049 ?auto_2370051 ) ) ( not ( = ?auto_2370050 ?auto_2370051 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2370047 ?auto_2370049 ?auto_2370048 ?auto_2370050 ?auto_2370046 )
      ( DELIVER-1PKG ?auto_2370051 ?auto_2370046 )
      ( DELIVER-5PKG-VERIFY ?auto_2370047 ?auto_2370048 ?auto_2370049 ?auto_2370050 ?auto_2370051 ?auto_2370046 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2370136 - OBJ
      ?auto_2370137 - OBJ
      ?auto_2370138 - OBJ
      ?auto_2370139 - OBJ
      ?auto_2370140 - OBJ
      ?auto_2370135 - LOCATION
    )
    :vars
    (
      ?auto_2370145 - LOCATION
      ?auto_2370141 - CITY
      ?auto_2370144 - LOCATION
      ?auto_2370143 - LOCATION
      ?auto_2370142 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2370145 ?auto_2370141 ) ( IN-CITY ?auto_2370135 ?auto_2370141 ) ( not ( = ?auto_2370135 ?auto_2370145 ) ) ( OBJ-AT ?auto_2370140 ?auto_2370145 ) ( OBJ-AT ?auto_2370138 ?auto_2370145 ) ( IN-CITY ?auto_2370144 ?auto_2370141 ) ( not ( = ?auto_2370135 ?auto_2370144 ) ) ( OBJ-AT ?auto_2370139 ?auto_2370144 ) ( IN-CITY ?auto_2370143 ?auto_2370141 ) ( not ( = ?auto_2370135 ?auto_2370143 ) ) ( OBJ-AT ?auto_2370137 ?auto_2370143 ) ( OBJ-AT ?auto_2370136 ?auto_2370143 ) ( TRUCK-AT ?auto_2370142 ?auto_2370135 ) ( not ( = ?auto_2370136 ?auto_2370137 ) ) ( not ( = ?auto_2370136 ?auto_2370139 ) ) ( not ( = ?auto_2370137 ?auto_2370139 ) ) ( not ( = ?auto_2370144 ?auto_2370143 ) ) ( not ( = ?auto_2370136 ?auto_2370138 ) ) ( not ( = ?auto_2370137 ?auto_2370138 ) ) ( not ( = ?auto_2370139 ?auto_2370138 ) ) ( not ( = ?auto_2370145 ?auto_2370144 ) ) ( not ( = ?auto_2370145 ?auto_2370143 ) ) ( not ( = ?auto_2370136 ?auto_2370140 ) ) ( not ( = ?auto_2370137 ?auto_2370140 ) ) ( not ( = ?auto_2370139 ?auto_2370140 ) ) ( not ( = ?auto_2370138 ?auto_2370140 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2370136 ?auto_2370137 ?auto_2370139 ?auto_2370138 ?auto_2370140 ?auto_2370135 )
      ( DELIVER-5PKG-VERIFY ?auto_2370136 ?auto_2370137 ?auto_2370138 ?auto_2370139 ?auto_2370140 ?auto_2370135 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2370183 - OBJ
      ?auto_2370184 - OBJ
      ?auto_2370185 - OBJ
      ?auto_2370186 - OBJ
      ?auto_2370187 - OBJ
      ?auto_2370182 - LOCATION
    )
    :vars
    (
      ?auto_2370188 - LOCATION
      ?auto_2370192 - CITY
      ?auto_2370191 - LOCATION
      ?auto_2370190 - LOCATION
      ?auto_2370189 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2370188 ?auto_2370192 ) ( IN-CITY ?auto_2370182 ?auto_2370192 ) ( not ( = ?auto_2370182 ?auto_2370188 ) ) ( OBJ-AT ?auto_2370186 ?auto_2370188 ) ( OBJ-AT ?auto_2370185 ?auto_2370188 ) ( IN-CITY ?auto_2370191 ?auto_2370192 ) ( not ( = ?auto_2370182 ?auto_2370191 ) ) ( OBJ-AT ?auto_2370187 ?auto_2370191 ) ( IN-CITY ?auto_2370190 ?auto_2370192 ) ( not ( = ?auto_2370182 ?auto_2370190 ) ) ( OBJ-AT ?auto_2370184 ?auto_2370190 ) ( OBJ-AT ?auto_2370183 ?auto_2370190 ) ( TRUCK-AT ?auto_2370189 ?auto_2370182 ) ( not ( = ?auto_2370183 ?auto_2370184 ) ) ( not ( = ?auto_2370183 ?auto_2370187 ) ) ( not ( = ?auto_2370184 ?auto_2370187 ) ) ( not ( = ?auto_2370191 ?auto_2370190 ) ) ( not ( = ?auto_2370183 ?auto_2370185 ) ) ( not ( = ?auto_2370184 ?auto_2370185 ) ) ( not ( = ?auto_2370187 ?auto_2370185 ) ) ( not ( = ?auto_2370188 ?auto_2370191 ) ) ( not ( = ?auto_2370188 ?auto_2370190 ) ) ( not ( = ?auto_2370183 ?auto_2370186 ) ) ( not ( = ?auto_2370184 ?auto_2370186 ) ) ( not ( = ?auto_2370187 ?auto_2370186 ) ) ( not ( = ?auto_2370185 ?auto_2370186 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2370183 ?auto_2370184 ?auto_2370185 ?auto_2370187 ?auto_2370186 ?auto_2370182 )
      ( DELIVER-5PKG-VERIFY ?auto_2370183 ?auto_2370184 ?auto_2370185 ?auto_2370186 ?auto_2370187 ?auto_2370182 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2370664 - OBJ
      ?auto_2370665 - OBJ
      ?auto_2370666 - OBJ
      ?auto_2370667 - OBJ
      ?auto_2370668 - OBJ
      ?auto_2370663 - LOCATION
    )
    :vars
    (
      ?auto_2370669 - LOCATION
      ?auto_2370673 - CITY
      ?auto_2370672 - LOCATION
      ?auto_2370671 - LOCATION
      ?auto_2370670 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2370669 ?auto_2370673 ) ( IN-CITY ?auto_2370663 ?auto_2370673 ) ( not ( = ?auto_2370663 ?auto_2370669 ) ) ( OBJ-AT ?auto_2370668 ?auto_2370669 ) ( OBJ-AT ?auto_2370667 ?auto_2370669 ) ( IN-CITY ?auto_2370672 ?auto_2370673 ) ( not ( = ?auto_2370663 ?auto_2370672 ) ) ( OBJ-AT ?auto_2370665 ?auto_2370672 ) ( IN-CITY ?auto_2370671 ?auto_2370673 ) ( not ( = ?auto_2370663 ?auto_2370671 ) ) ( OBJ-AT ?auto_2370666 ?auto_2370671 ) ( OBJ-AT ?auto_2370664 ?auto_2370671 ) ( TRUCK-AT ?auto_2370670 ?auto_2370663 ) ( not ( = ?auto_2370664 ?auto_2370666 ) ) ( not ( = ?auto_2370664 ?auto_2370665 ) ) ( not ( = ?auto_2370666 ?auto_2370665 ) ) ( not ( = ?auto_2370672 ?auto_2370671 ) ) ( not ( = ?auto_2370664 ?auto_2370667 ) ) ( not ( = ?auto_2370666 ?auto_2370667 ) ) ( not ( = ?auto_2370665 ?auto_2370667 ) ) ( not ( = ?auto_2370669 ?auto_2370672 ) ) ( not ( = ?auto_2370669 ?auto_2370671 ) ) ( not ( = ?auto_2370664 ?auto_2370668 ) ) ( not ( = ?auto_2370666 ?auto_2370668 ) ) ( not ( = ?auto_2370665 ?auto_2370668 ) ) ( not ( = ?auto_2370667 ?auto_2370668 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2370664 ?auto_2370666 ?auto_2370667 ?auto_2370665 ?auto_2370668 ?auto_2370663 )
      ( DELIVER-5PKG-VERIFY ?auto_2370664 ?auto_2370665 ?auto_2370666 ?auto_2370667 ?auto_2370668 ?auto_2370663 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2370854 - OBJ
      ?auto_2370855 - OBJ
      ?auto_2370856 - OBJ
      ?auto_2370857 - OBJ
      ?auto_2370858 - OBJ
      ?auto_2370853 - LOCATION
    )
    :vars
    (
      ?auto_2370859 - LOCATION
      ?auto_2370863 - CITY
      ?auto_2370862 - LOCATION
      ?auto_2370861 - LOCATION
      ?auto_2370860 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2370859 ?auto_2370863 ) ( IN-CITY ?auto_2370853 ?auto_2370863 ) ( not ( = ?auto_2370853 ?auto_2370859 ) ) ( OBJ-AT ?auto_2370858 ?auto_2370859 ) ( OBJ-AT ?auto_2370856 ?auto_2370859 ) ( IN-CITY ?auto_2370862 ?auto_2370863 ) ( not ( = ?auto_2370853 ?auto_2370862 ) ) ( OBJ-AT ?auto_2370855 ?auto_2370862 ) ( IN-CITY ?auto_2370861 ?auto_2370863 ) ( not ( = ?auto_2370853 ?auto_2370861 ) ) ( OBJ-AT ?auto_2370857 ?auto_2370861 ) ( OBJ-AT ?auto_2370854 ?auto_2370861 ) ( TRUCK-AT ?auto_2370860 ?auto_2370853 ) ( not ( = ?auto_2370854 ?auto_2370857 ) ) ( not ( = ?auto_2370854 ?auto_2370855 ) ) ( not ( = ?auto_2370857 ?auto_2370855 ) ) ( not ( = ?auto_2370862 ?auto_2370861 ) ) ( not ( = ?auto_2370854 ?auto_2370856 ) ) ( not ( = ?auto_2370857 ?auto_2370856 ) ) ( not ( = ?auto_2370855 ?auto_2370856 ) ) ( not ( = ?auto_2370859 ?auto_2370862 ) ) ( not ( = ?auto_2370859 ?auto_2370861 ) ) ( not ( = ?auto_2370854 ?auto_2370858 ) ) ( not ( = ?auto_2370857 ?auto_2370858 ) ) ( not ( = ?auto_2370855 ?auto_2370858 ) ) ( not ( = ?auto_2370856 ?auto_2370858 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2370854 ?auto_2370857 ?auto_2370856 ?auto_2370855 ?auto_2370858 ?auto_2370853 )
      ( DELIVER-5PKG-VERIFY ?auto_2370854 ?auto_2370855 ?auto_2370856 ?auto_2370857 ?auto_2370858 ?auto_2370853 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2370901 - OBJ
      ?auto_2370902 - OBJ
      ?auto_2370903 - OBJ
      ?auto_2370904 - OBJ
      ?auto_2370905 - OBJ
      ?auto_2370900 - LOCATION
    )
    :vars
    (
      ?auto_2370906 - LOCATION
      ?auto_2370910 - CITY
      ?auto_2370909 - LOCATION
      ?auto_2370908 - LOCATION
      ?auto_2370907 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2370906 ?auto_2370910 ) ( IN-CITY ?auto_2370900 ?auto_2370910 ) ( not ( = ?auto_2370900 ?auto_2370906 ) ) ( OBJ-AT ?auto_2370904 ?auto_2370906 ) ( OBJ-AT ?auto_2370903 ?auto_2370906 ) ( IN-CITY ?auto_2370909 ?auto_2370910 ) ( not ( = ?auto_2370900 ?auto_2370909 ) ) ( OBJ-AT ?auto_2370902 ?auto_2370909 ) ( IN-CITY ?auto_2370908 ?auto_2370910 ) ( not ( = ?auto_2370900 ?auto_2370908 ) ) ( OBJ-AT ?auto_2370905 ?auto_2370908 ) ( OBJ-AT ?auto_2370901 ?auto_2370908 ) ( TRUCK-AT ?auto_2370907 ?auto_2370900 ) ( not ( = ?auto_2370901 ?auto_2370905 ) ) ( not ( = ?auto_2370901 ?auto_2370902 ) ) ( not ( = ?auto_2370905 ?auto_2370902 ) ) ( not ( = ?auto_2370909 ?auto_2370908 ) ) ( not ( = ?auto_2370901 ?auto_2370903 ) ) ( not ( = ?auto_2370905 ?auto_2370903 ) ) ( not ( = ?auto_2370902 ?auto_2370903 ) ) ( not ( = ?auto_2370906 ?auto_2370909 ) ) ( not ( = ?auto_2370906 ?auto_2370908 ) ) ( not ( = ?auto_2370901 ?auto_2370904 ) ) ( not ( = ?auto_2370905 ?auto_2370904 ) ) ( not ( = ?auto_2370902 ?auto_2370904 ) ) ( not ( = ?auto_2370903 ?auto_2370904 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2370901 ?auto_2370905 ?auto_2370903 ?auto_2370902 ?auto_2370904 ?auto_2370900 )
      ( DELIVER-5PKG-VERIFY ?auto_2370901 ?auto_2370902 ?auto_2370903 ?auto_2370904 ?auto_2370905 ?auto_2370900 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2371382 - OBJ
      ?auto_2371383 - OBJ
      ?auto_2371384 - OBJ
      ?auto_2371385 - OBJ
      ?auto_2371386 - OBJ
      ?auto_2371381 - LOCATION
    )
    :vars
    (
      ?auto_2371387 - LOCATION
      ?auto_2371391 - CITY
      ?auto_2371390 - LOCATION
      ?auto_2371389 - LOCATION
      ?auto_2371388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2371387 ?auto_2371391 ) ( IN-CITY ?auto_2371381 ?auto_2371391 ) ( not ( = ?auto_2371381 ?auto_2371387 ) ) ( OBJ-AT ?auto_2371386 ?auto_2371387 ) ( OBJ-AT ?auto_2371383 ?auto_2371387 ) ( IN-CITY ?auto_2371390 ?auto_2371391 ) ( not ( = ?auto_2371381 ?auto_2371390 ) ) ( OBJ-AT ?auto_2371385 ?auto_2371390 ) ( IN-CITY ?auto_2371389 ?auto_2371391 ) ( not ( = ?auto_2371381 ?auto_2371389 ) ) ( OBJ-AT ?auto_2371384 ?auto_2371389 ) ( OBJ-AT ?auto_2371382 ?auto_2371389 ) ( TRUCK-AT ?auto_2371388 ?auto_2371381 ) ( not ( = ?auto_2371382 ?auto_2371384 ) ) ( not ( = ?auto_2371382 ?auto_2371385 ) ) ( not ( = ?auto_2371384 ?auto_2371385 ) ) ( not ( = ?auto_2371390 ?auto_2371389 ) ) ( not ( = ?auto_2371382 ?auto_2371383 ) ) ( not ( = ?auto_2371384 ?auto_2371383 ) ) ( not ( = ?auto_2371385 ?auto_2371383 ) ) ( not ( = ?auto_2371387 ?auto_2371390 ) ) ( not ( = ?auto_2371387 ?auto_2371389 ) ) ( not ( = ?auto_2371382 ?auto_2371386 ) ) ( not ( = ?auto_2371384 ?auto_2371386 ) ) ( not ( = ?auto_2371385 ?auto_2371386 ) ) ( not ( = ?auto_2371383 ?auto_2371386 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2371382 ?auto_2371384 ?auto_2371383 ?auto_2371385 ?auto_2371386 ?auto_2371381 )
      ( DELIVER-5PKG-VERIFY ?auto_2371382 ?auto_2371383 ?auto_2371384 ?auto_2371385 ?auto_2371386 ?auto_2371381 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2371429 - OBJ
      ?auto_2371430 - OBJ
      ?auto_2371431 - OBJ
      ?auto_2371432 - OBJ
      ?auto_2371433 - OBJ
      ?auto_2371428 - LOCATION
    )
    :vars
    (
      ?auto_2371434 - LOCATION
      ?auto_2371438 - CITY
      ?auto_2371437 - LOCATION
      ?auto_2371436 - LOCATION
      ?auto_2371435 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2371434 ?auto_2371438 ) ( IN-CITY ?auto_2371428 ?auto_2371438 ) ( not ( = ?auto_2371428 ?auto_2371434 ) ) ( OBJ-AT ?auto_2371432 ?auto_2371434 ) ( OBJ-AT ?auto_2371430 ?auto_2371434 ) ( IN-CITY ?auto_2371437 ?auto_2371438 ) ( not ( = ?auto_2371428 ?auto_2371437 ) ) ( OBJ-AT ?auto_2371433 ?auto_2371437 ) ( IN-CITY ?auto_2371436 ?auto_2371438 ) ( not ( = ?auto_2371428 ?auto_2371436 ) ) ( OBJ-AT ?auto_2371431 ?auto_2371436 ) ( OBJ-AT ?auto_2371429 ?auto_2371436 ) ( TRUCK-AT ?auto_2371435 ?auto_2371428 ) ( not ( = ?auto_2371429 ?auto_2371431 ) ) ( not ( = ?auto_2371429 ?auto_2371433 ) ) ( not ( = ?auto_2371431 ?auto_2371433 ) ) ( not ( = ?auto_2371437 ?auto_2371436 ) ) ( not ( = ?auto_2371429 ?auto_2371430 ) ) ( not ( = ?auto_2371431 ?auto_2371430 ) ) ( not ( = ?auto_2371433 ?auto_2371430 ) ) ( not ( = ?auto_2371434 ?auto_2371437 ) ) ( not ( = ?auto_2371434 ?auto_2371436 ) ) ( not ( = ?auto_2371429 ?auto_2371432 ) ) ( not ( = ?auto_2371431 ?auto_2371432 ) ) ( not ( = ?auto_2371433 ?auto_2371432 ) ) ( not ( = ?auto_2371430 ?auto_2371432 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2371429 ?auto_2371431 ?auto_2371430 ?auto_2371433 ?auto_2371432 ?auto_2371428 )
      ( DELIVER-5PKG-VERIFY ?auto_2371429 ?auto_2371430 ?auto_2371431 ?auto_2371432 ?auto_2371433 ?auto_2371428 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2371476 - OBJ
      ?auto_2371477 - OBJ
      ?auto_2371478 - OBJ
      ?auto_2371479 - OBJ
      ?auto_2371480 - OBJ
      ?auto_2371475 - LOCATION
    )
    :vars
    (
      ?auto_2371481 - LOCATION
      ?auto_2371485 - CITY
      ?auto_2371484 - LOCATION
      ?auto_2371483 - LOCATION
      ?auto_2371482 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2371481 ?auto_2371485 ) ( IN-CITY ?auto_2371475 ?auto_2371485 ) ( not ( = ?auto_2371475 ?auto_2371481 ) ) ( OBJ-AT ?auto_2371480 ?auto_2371481 ) ( OBJ-AT ?auto_2371477 ?auto_2371481 ) ( IN-CITY ?auto_2371484 ?auto_2371485 ) ( not ( = ?auto_2371475 ?auto_2371484 ) ) ( OBJ-AT ?auto_2371478 ?auto_2371484 ) ( IN-CITY ?auto_2371483 ?auto_2371485 ) ( not ( = ?auto_2371475 ?auto_2371483 ) ) ( OBJ-AT ?auto_2371479 ?auto_2371483 ) ( OBJ-AT ?auto_2371476 ?auto_2371483 ) ( TRUCK-AT ?auto_2371482 ?auto_2371475 ) ( not ( = ?auto_2371476 ?auto_2371479 ) ) ( not ( = ?auto_2371476 ?auto_2371478 ) ) ( not ( = ?auto_2371479 ?auto_2371478 ) ) ( not ( = ?auto_2371484 ?auto_2371483 ) ) ( not ( = ?auto_2371476 ?auto_2371477 ) ) ( not ( = ?auto_2371479 ?auto_2371477 ) ) ( not ( = ?auto_2371478 ?auto_2371477 ) ) ( not ( = ?auto_2371481 ?auto_2371484 ) ) ( not ( = ?auto_2371481 ?auto_2371483 ) ) ( not ( = ?auto_2371476 ?auto_2371480 ) ) ( not ( = ?auto_2371479 ?auto_2371480 ) ) ( not ( = ?auto_2371478 ?auto_2371480 ) ) ( not ( = ?auto_2371477 ?auto_2371480 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2371476 ?auto_2371479 ?auto_2371477 ?auto_2371478 ?auto_2371480 ?auto_2371475 )
      ( DELIVER-5PKG-VERIFY ?auto_2371476 ?auto_2371477 ?auto_2371478 ?auto_2371479 ?auto_2371480 ?auto_2371475 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2371523 - OBJ
      ?auto_2371524 - OBJ
      ?auto_2371525 - OBJ
      ?auto_2371526 - OBJ
      ?auto_2371527 - OBJ
      ?auto_2371522 - LOCATION
    )
    :vars
    (
      ?auto_2371528 - LOCATION
      ?auto_2371532 - CITY
      ?auto_2371531 - LOCATION
      ?auto_2371530 - LOCATION
      ?auto_2371529 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2371528 ?auto_2371532 ) ( IN-CITY ?auto_2371522 ?auto_2371532 ) ( not ( = ?auto_2371522 ?auto_2371528 ) ) ( OBJ-AT ?auto_2371526 ?auto_2371528 ) ( OBJ-AT ?auto_2371524 ?auto_2371528 ) ( IN-CITY ?auto_2371531 ?auto_2371532 ) ( not ( = ?auto_2371522 ?auto_2371531 ) ) ( OBJ-AT ?auto_2371525 ?auto_2371531 ) ( IN-CITY ?auto_2371530 ?auto_2371532 ) ( not ( = ?auto_2371522 ?auto_2371530 ) ) ( OBJ-AT ?auto_2371527 ?auto_2371530 ) ( OBJ-AT ?auto_2371523 ?auto_2371530 ) ( TRUCK-AT ?auto_2371529 ?auto_2371522 ) ( not ( = ?auto_2371523 ?auto_2371527 ) ) ( not ( = ?auto_2371523 ?auto_2371525 ) ) ( not ( = ?auto_2371527 ?auto_2371525 ) ) ( not ( = ?auto_2371531 ?auto_2371530 ) ) ( not ( = ?auto_2371523 ?auto_2371524 ) ) ( not ( = ?auto_2371527 ?auto_2371524 ) ) ( not ( = ?auto_2371525 ?auto_2371524 ) ) ( not ( = ?auto_2371528 ?auto_2371531 ) ) ( not ( = ?auto_2371528 ?auto_2371530 ) ) ( not ( = ?auto_2371523 ?auto_2371526 ) ) ( not ( = ?auto_2371527 ?auto_2371526 ) ) ( not ( = ?auto_2371525 ?auto_2371526 ) ) ( not ( = ?auto_2371524 ?auto_2371526 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2371523 ?auto_2371527 ?auto_2371524 ?auto_2371525 ?auto_2371526 ?auto_2371522 )
      ( DELIVER-5PKG-VERIFY ?auto_2371523 ?auto_2371524 ?auto_2371525 ?auto_2371526 ?auto_2371527 ?auto_2371522 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2371770 - OBJ
      ?auto_2371771 - OBJ
      ?auto_2371772 - OBJ
      ?auto_2371773 - OBJ
      ?auto_2371774 - OBJ
      ?auto_2371769 - LOCATION
    )
    :vars
    (
      ?auto_2371775 - LOCATION
      ?auto_2371779 - CITY
      ?auto_2371778 - LOCATION
      ?auto_2371777 - LOCATION
      ?auto_2371776 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2371775 ?auto_2371779 ) ( IN-CITY ?auto_2371769 ?auto_2371779 ) ( not ( = ?auto_2371769 ?auto_2371775 ) ) ( OBJ-AT ?auto_2371772 ?auto_2371775 ) ( OBJ-AT ?auto_2371771 ?auto_2371775 ) ( IN-CITY ?auto_2371778 ?auto_2371779 ) ( not ( = ?auto_2371769 ?auto_2371778 ) ) ( OBJ-AT ?auto_2371774 ?auto_2371778 ) ( IN-CITY ?auto_2371777 ?auto_2371779 ) ( not ( = ?auto_2371769 ?auto_2371777 ) ) ( OBJ-AT ?auto_2371773 ?auto_2371777 ) ( OBJ-AT ?auto_2371770 ?auto_2371777 ) ( TRUCK-AT ?auto_2371776 ?auto_2371769 ) ( not ( = ?auto_2371770 ?auto_2371773 ) ) ( not ( = ?auto_2371770 ?auto_2371774 ) ) ( not ( = ?auto_2371773 ?auto_2371774 ) ) ( not ( = ?auto_2371778 ?auto_2371777 ) ) ( not ( = ?auto_2371770 ?auto_2371771 ) ) ( not ( = ?auto_2371773 ?auto_2371771 ) ) ( not ( = ?auto_2371774 ?auto_2371771 ) ) ( not ( = ?auto_2371775 ?auto_2371778 ) ) ( not ( = ?auto_2371775 ?auto_2371777 ) ) ( not ( = ?auto_2371770 ?auto_2371772 ) ) ( not ( = ?auto_2371773 ?auto_2371772 ) ) ( not ( = ?auto_2371774 ?auto_2371772 ) ) ( not ( = ?auto_2371771 ?auto_2371772 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2371770 ?auto_2371773 ?auto_2371771 ?auto_2371774 ?auto_2371772 ?auto_2371769 )
      ( DELIVER-5PKG-VERIFY ?auto_2371770 ?auto_2371771 ?auto_2371772 ?auto_2371773 ?auto_2371774 ?auto_2371769 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2371817 - OBJ
      ?auto_2371818 - OBJ
      ?auto_2371819 - OBJ
      ?auto_2371820 - OBJ
      ?auto_2371821 - OBJ
      ?auto_2371816 - LOCATION
    )
    :vars
    (
      ?auto_2371822 - LOCATION
      ?auto_2371826 - CITY
      ?auto_2371825 - LOCATION
      ?auto_2371824 - LOCATION
      ?auto_2371823 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2371822 ?auto_2371826 ) ( IN-CITY ?auto_2371816 ?auto_2371826 ) ( not ( = ?auto_2371816 ?auto_2371822 ) ) ( OBJ-AT ?auto_2371819 ?auto_2371822 ) ( OBJ-AT ?auto_2371818 ?auto_2371822 ) ( IN-CITY ?auto_2371825 ?auto_2371826 ) ( not ( = ?auto_2371816 ?auto_2371825 ) ) ( OBJ-AT ?auto_2371820 ?auto_2371825 ) ( IN-CITY ?auto_2371824 ?auto_2371826 ) ( not ( = ?auto_2371816 ?auto_2371824 ) ) ( OBJ-AT ?auto_2371821 ?auto_2371824 ) ( OBJ-AT ?auto_2371817 ?auto_2371824 ) ( TRUCK-AT ?auto_2371823 ?auto_2371816 ) ( not ( = ?auto_2371817 ?auto_2371821 ) ) ( not ( = ?auto_2371817 ?auto_2371820 ) ) ( not ( = ?auto_2371821 ?auto_2371820 ) ) ( not ( = ?auto_2371825 ?auto_2371824 ) ) ( not ( = ?auto_2371817 ?auto_2371818 ) ) ( not ( = ?auto_2371821 ?auto_2371818 ) ) ( not ( = ?auto_2371820 ?auto_2371818 ) ) ( not ( = ?auto_2371822 ?auto_2371825 ) ) ( not ( = ?auto_2371822 ?auto_2371824 ) ) ( not ( = ?auto_2371817 ?auto_2371819 ) ) ( not ( = ?auto_2371821 ?auto_2371819 ) ) ( not ( = ?auto_2371820 ?auto_2371819 ) ) ( not ( = ?auto_2371818 ?auto_2371819 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2371817 ?auto_2371821 ?auto_2371818 ?auto_2371820 ?auto_2371819 ?auto_2371816 )
      ( DELIVER-5PKG-VERIFY ?auto_2371817 ?auto_2371818 ?auto_2371819 ?auto_2371820 ?auto_2371821 ?auto_2371816 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2378140 - OBJ
      ?auto_2378141 - OBJ
      ?auto_2378142 - OBJ
      ?auto_2378143 - OBJ
      ?auto_2378144 - OBJ
      ?auto_2378139 - LOCATION
    )
    :vars
    (
      ?auto_2378145 - LOCATION
      ?auto_2378149 - CITY
      ?auto_2378148 - LOCATION
      ?auto_2378147 - LOCATION
      ?auto_2378146 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2378145 ?auto_2378149 ) ( IN-CITY ?auto_2378139 ?auto_2378149 ) ( not ( = ?auto_2378139 ?auto_2378145 ) ) ( OBJ-AT ?auto_2378144 ?auto_2378145 ) ( OBJ-AT ?auto_2378143 ?auto_2378145 ) ( IN-CITY ?auto_2378148 ?auto_2378149 ) ( not ( = ?auto_2378139 ?auto_2378148 ) ) ( OBJ-AT ?auto_2378140 ?auto_2378148 ) ( IN-CITY ?auto_2378147 ?auto_2378149 ) ( not ( = ?auto_2378139 ?auto_2378147 ) ) ( OBJ-AT ?auto_2378142 ?auto_2378147 ) ( OBJ-AT ?auto_2378141 ?auto_2378147 ) ( TRUCK-AT ?auto_2378146 ?auto_2378139 ) ( not ( = ?auto_2378141 ?auto_2378142 ) ) ( not ( = ?auto_2378141 ?auto_2378140 ) ) ( not ( = ?auto_2378142 ?auto_2378140 ) ) ( not ( = ?auto_2378148 ?auto_2378147 ) ) ( not ( = ?auto_2378141 ?auto_2378143 ) ) ( not ( = ?auto_2378142 ?auto_2378143 ) ) ( not ( = ?auto_2378140 ?auto_2378143 ) ) ( not ( = ?auto_2378145 ?auto_2378148 ) ) ( not ( = ?auto_2378145 ?auto_2378147 ) ) ( not ( = ?auto_2378141 ?auto_2378144 ) ) ( not ( = ?auto_2378142 ?auto_2378144 ) ) ( not ( = ?auto_2378140 ?auto_2378144 ) ) ( not ( = ?auto_2378143 ?auto_2378144 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2378141 ?auto_2378142 ?auto_2378143 ?auto_2378140 ?auto_2378144 ?auto_2378139 )
      ( DELIVER-5PKG-VERIFY ?auto_2378140 ?auto_2378141 ?auto_2378142 ?auto_2378143 ?auto_2378144 ?auto_2378139 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2378330 - OBJ
      ?auto_2378331 - OBJ
      ?auto_2378332 - OBJ
      ?auto_2378333 - OBJ
      ?auto_2378334 - OBJ
      ?auto_2378329 - LOCATION
    )
    :vars
    (
      ?auto_2378335 - LOCATION
      ?auto_2378339 - CITY
      ?auto_2378338 - LOCATION
      ?auto_2378337 - LOCATION
      ?auto_2378336 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2378335 ?auto_2378339 ) ( IN-CITY ?auto_2378329 ?auto_2378339 ) ( not ( = ?auto_2378329 ?auto_2378335 ) ) ( OBJ-AT ?auto_2378334 ?auto_2378335 ) ( OBJ-AT ?auto_2378332 ?auto_2378335 ) ( IN-CITY ?auto_2378338 ?auto_2378339 ) ( not ( = ?auto_2378329 ?auto_2378338 ) ) ( OBJ-AT ?auto_2378330 ?auto_2378338 ) ( IN-CITY ?auto_2378337 ?auto_2378339 ) ( not ( = ?auto_2378329 ?auto_2378337 ) ) ( OBJ-AT ?auto_2378333 ?auto_2378337 ) ( OBJ-AT ?auto_2378331 ?auto_2378337 ) ( TRUCK-AT ?auto_2378336 ?auto_2378329 ) ( not ( = ?auto_2378331 ?auto_2378333 ) ) ( not ( = ?auto_2378331 ?auto_2378330 ) ) ( not ( = ?auto_2378333 ?auto_2378330 ) ) ( not ( = ?auto_2378338 ?auto_2378337 ) ) ( not ( = ?auto_2378331 ?auto_2378332 ) ) ( not ( = ?auto_2378333 ?auto_2378332 ) ) ( not ( = ?auto_2378330 ?auto_2378332 ) ) ( not ( = ?auto_2378335 ?auto_2378338 ) ) ( not ( = ?auto_2378335 ?auto_2378337 ) ) ( not ( = ?auto_2378331 ?auto_2378334 ) ) ( not ( = ?auto_2378333 ?auto_2378334 ) ) ( not ( = ?auto_2378330 ?auto_2378334 ) ) ( not ( = ?auto_2378332 ?auto_2378334 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2378331 ?auto_2378333 ?auto_2378332 ?auto_2378330 ?auto_2378334 ?auto_2378329 )
      ( DELIVER-5PKG-VERIFY ?auto_2378330 ?auto_2378331 ?auto_2378332 ?auto_2378333 ?auto_2378334 ?auto_2378329 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2378377 - OBJ
      ?auto_2378378 - OBJ
      ?auto_2378379 - OBJ
      ?auto_2378380 - OBJ
      ?auto_2378381 - OBJ
      ?auto_2378376 - LOCATION
    )
    :vars
    (
      ?auto_2378382 - LOCATION
      ?auto_2378386 - CITY
      ?auto_2378385 - LOCATION
      ?auto_2378384 - LOCATION
      ?auto_2378383 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2378382 ?auto_2378386 ) ( IN-CITY ?auto_2378376 ?auto_2378386 ) ( not ( = ?auto_2378376 ?auto_2378382 ) ) ( OBJ-AT ?auto_2378380 ?auto_2378382 ) ( OBJ-AT ?auto_2378379 ?auto_2378382 ) ( IN-CITY ?auto_2378385 ?auto_2378386 ) ( not ( = ?auto_2378376 ?auto_2378385 ) ) ( OBJ-AT ?auto_2378377 ?auto_2378385 ) ( IN-CITY ?auto_2378384 ?auto_2378386 ) ( not ( = ?auto_2378376 ?auto_2378384 ) ) ( OBJ-AT ?auto_2378381 ?auto_2378384 ) ( OBJ-AT ?auto_2378378 ?auto_2378384 ) ( TRUCK-AT ?auto_2378383 ?auto_2378376 ) ( not ( = ?auto_2378378 ?auto_2378381 ) ) ( not ( = ?auto_2378378 ?auto_2378377 ) ) ( not ( = ?auto_2378381 ?auto_2378377 ) ) ( not ( = ?auto_2378385 ?auto_2378384 ) ) ( not ( = ?auto_2378378 ?auto_2378379 ) ) ( not ( = ?auto_2378381 ?auto_2378379 ) ) ( not ( = ?auto_2378377 ?auto_2378379 ) ) ( not ( = ?auto_2378382 ?auto_2378385 ) ) ( not ( = ?auto_2378382 ?auto_2378384 ) ) ( not ( = ?auto_2378378 ?auto_2378380 ) ) ( not ( = ?auto_2378381 ?auto_2378380 ) ) ( not ( = ?auto_2378377 ?auto_2378380 ) ) ( not ( = ?auto_2378379 ?auto_2378380 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2378378 ?auto_2378381 ?auto_2378379 ?auto_2378377 ?auto_2378380 ?auto_2378376 )
      ( DELIVER-5PKG-VERIFY ?auto_2378377 ?auto_2378378 ?auto_2378379 ?auto_2378380 ?auto_2378381 ?auto_2378376 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2624517 - OBJ
      ?auto_2624518 - OBJ
      ?auto_2624519 - OBJ
      ?auto_2624520 - OBJ
      ?auto_2624521 - OBJ
      ?auto_2624522 - OBJ
      ?auto_2624516 - LOCATION
    )
    :vars
    (
      ?auto_2624523 - LOCATION
      ?auto_2624525 - CITY
      ?auto_2624526 - LOCATION
      ?auto_2624527 - LOCATION
      ?auto_2624524 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2624523 ?auto_2624525 ) ( IN-CITY ?auto_2624516 ?auto_2624525 ) ( not ( = ?auto_2624516 ?auto_2624523 ) ) ( OBJ-AT ?auto_2624522 ?auto_2624523 ) ( IN-CITY ?auto_2624526 ?auto_2624525 ) ( not ( = ?auto_2624516 ?auto_2624526 ) ) ( OBJ-AT ?auto_2624521 ?auto_2624526 ) ( OBJ-AT ?auto_2624520 ?auto_2624526 ) ( OBJ-AT ?auto_2624519 ?auto_2624523 ) ( IN-CITY ?auto_2624527 ?auto_2624525 ) ( not ( = ?auto_2624516 ?auto_2624527 ) ) ( OBJ-AT ?auto_2624518 ?auto_2624527 ) ( OBJ-AT ?auto_2624517 ?auto_2624527 ) ( TRUCK-AT ?auto_2624524 ?auto_2624516 ) ( not ( = ?auto_2624517 ?auto_2624518 ) ) ( not ( = ?auto_2624517 ?auto_2624519 ) ) ( not ( = ?auto_2624518 ?auto_2624519 ) ) ( not ( = ?auto_2624523 ?auto_2624527 ) ) ( not ( = ?auto_2624517 ?auto_2624520 ) ) ( not ( = ?auto_2624518 ?auto_2624520 ) ) ( not ( = ?auto_2624519 ?auto_2624520 ) ) ( not ( = ?auto_2624526 ?auto_2624523 ) ) ( not ( = ?auto_2624526 ?auto_2624527 ) ) ( not ( = ?auto_2624517 ?auto_2624521 ) ) ( not ( = ?auto_2624518 ?auto_2624521 ) ) ( not ( = ?auto_2624519 ?auto_2624521 ) ) ( not ( = ?auto_2624520 ?auto_2624521 ) ) ( not ( = ?auto_2624517 ?auto_2624522 ) ) ( not ( = ?auto_2624518 ?auto_2624522 ) ) ( not ( = ?auto_2624519 ?auto_2624522 ) ) ( not ( = ?auto_2624520 ?auto_2624522 ) ) ( not ( = ?auto_2624521 ?auto_2624522 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2624517 ?auto_2624518 ?auto_2624520 ?auto_2624519 ?auto_2624521 ?auto_2624516 )
      ( DELIVER-1PKG ?auto_2624522 ?auto_2624516 )
      ( DELIVER-6PKG-VERIFY ?auto_2624517 ?auto_2624518 ?auto_2624519 ?auto_2624520 ?auto_2624521 ?auto_2624522 ?auto_2624516 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2624581 - OBJ
      ?auto_2624582 - OBJ
      ?auto_2624583 - OBJ
      ?auto_2624584 - OBJ
      ?auto_2624585 - OBJ
      ?auto_2624586 - OBJ
      ?auto_2624580 - LOCATION
    )
    :vars
    (
      ?auto_2624587 - LOCATION
      ?auto_2624588 - CITY
      ?auto_2624590 - LOCATION
      ?auto_2624589 - LOCATION
      ?auto_2624591 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2624587 ?auto_2624588 ) ( IN-CITY ?auto_2624580 ?auto_2624588 ) ( not ( = ?auto_2624580 ?auto_2624587 ) ) ( OBJ-AT ?auto_2624585 ?auto_2624587 ) ( IN-CITY ?auto_2624590 ?auto_2624588 ) ( not ( = ?auto_2624580 ?auto_2624590 ) ) ( OBJ-AT ?auto_2624586 ?auto_2624590 ) ( OBJ-AT ?auto_2624584 ?auto_2624590 ) ( OBJ-AT ?auto_2624583 ?auto_2624587 ) ( IN-CITY ?auto_2624589 ?auto_2624588 ) ( not ( = ?auto_2624580 ?auto_2624589 ) ) ( OBJ-AT ?auto_2624582 ?auto_2624589 ) ( OBJ-AT ?auto_2624581 ?auto_2624589 ) ( TRUCK-AT ?auto_2624591 ?auto_2624580 ) ( not ( = ?auto_2624581 ?auto_2624582 ) ) ( not ( = ?auto_2624581 ?auto_2624583 ) ) ( not ( = ?auto_2624582 ?auto_2624583 ) ) ( not ( = ?auto_2624587 ?auto_2624589 ) ) ( not ( = ?auto_2624581 ?auto_2624584 ) ) ( not ( = ?auto_2624582 ?auto_2624584 ) ) ( not ( = ?auto_2624583 ?auto_2624584 ) ) ( not ( = ?auto_2624590 ?auto_2624587 ) ) ( not ( = ?auto_2624590 ?auto_2624589 ) ) ( not ( = ?auto_2624581 ?auto_2624586 ) ) ( not ( = ?auto_2624582 ?auto_2624586 ) ) ( not ( = ?auto_2624583 ?auto_2624586 ) ) ( not ( = ?auto_2624584 ?auto_2624586 ) ) ( not ( = ?auto_2624581 ?auto_2624585 ) ) ( not ( = ?auto_2624582 ?auto_2624585 ) ) ( not ( = ?auto_2624583 ?auto_2624585 ) ) ( not ( = ?auto_2624584 ?auto_2624585 ) ) ( not ( = ?auto_2624586 ?auto_2624585 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2624581 ?auto_2624582 ?auto_2624583 ?auto_2624584 ?auto_2624586 ?auto_2624585 ?auto_2624580 )
      ( DELIVER-6PKG-VERIFY ?auto_2624581 ?auto_2624582 ?auto_2624583 ?auto_2624584 ?auto_2624585 ?auto_2624586 ?auto_2624580 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2625035 - OBJ
      ?auto_2625036 - OBJ
      ?auto_2625037 - OBJ
      ?auto_2625038 - OBJ
      ?auto_2625039 - OBJ
      ?auto_2625040 - OBJ
      ?auto_2625034 - LOCATION
    )
    :vars
    (
      ?auto_2625041 - LOCATION
      ?auto_2625042 - CITY
      ?auto_2625045 - LOCATION
      ?auto_2625044 - LOCATION
      ?auto_2625043 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2625041 ?auto_2625042 ) ( IN-CITY ?auto_2625034 ?auto_2625042 ) ( not ( = ?auto_2625034 ?auto_2625041 ) ) ( OBJ-AT ?auto_2625038 ?auto_2625041 ) ( IN-CITY ?auto_2625045 ?auto_2625042 ) ( not ( = ?auto_2625034 ?auto_2625045 ) ) ( OBJ-AT ?auto_2625040 ?auto_2625045 ) ( OBJ-AT ?auto_2625039 ?auto_2625045 ) ( OBJ-AT ?auto_2625037 ?auto_2625041 ) ( IN-CITY ?auto_2625044 ?auto_2625042 ) ( not ( = ?auto_2625034 ?auto_2625044 ) ) ( OBJ-AT ?auto_2625036 ?auto_2625044 ) ( OBJ-AT ?auto_2625035 ?auto_2625044 ) ( TRUCK-AT ?auto_2625043 ?auto_2625034 ) ( not ( = ?auto_2625035 ?auto_2625036 ) ) ( not ( = ?auto_2625035 ?auto_2625037 ) ) ( not ( = ?auto_2625036 ?auto_2625037 ) ) ( not ( = ?auto_2625041 ?auto_2625044 ) ) ( not ( = ?auto_2625035 ?auto_2625039 ) ) ( not ( = ?auto_2625036 ?auto_2625039 ) ) ( not ( = ?auto_2625037 ?auto_2625039 ) ) ( not ( = ?auto_2625045 ?auto_2625041 ) ) ( not ( = ?auto_2625045 ?auto_2625044 ) ) ( not ( = ?auto_2625035 ?auto_2625040 ) ) ( not ( = ?auto_2625036 ?auto_2625040 ) ) ( not ( = ?auto_2625037 ?auto_2625040 ) ) ( not ( = ?auto_2625039 ?auto_2625040 ) ) ( not ( = ?auto_2625035 ?auto_2625038 ) ) ( not ( = ?auto_2625036 ?auto_2625038 ) ) ( not ( = ?auto_2625037 ?auto_2625038 ) ) ( not ( = ?auto_2625039 ?auto_2625038 ) ) ( not ( = ?auto_2625040 ?auto_2625038 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2625035 ?auto_2625036 ?auto_2625037 ?auto_2625039 ?auto_2625038 ?auto_2625040 ?auto_2625034 )
      ( DELIVER-6PKG-VERIFY ?auto_2625035 ?auto_2625036 ?auto_2625037 ?auto_2625038 ?auto_2625039 ?auto_2625040 ?auto_2625034 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2632296 - OBJ
      ?auto_2632297 - OBJ
      ?auto_2632298 - OBJ
      ?auto_2632299 - OBJ
      ?auto_2632300 - OBJ
      ?auto_2632301 - OBJ
      ?auto_2632295 - LOCATION
    )
    :vars
    (
      ?auto_2632302 - LOCATION
      ?auto_2632303 - CITY
      ?auto_2632306 - LOCATION
      ?auto_2632305 - LOCATION
      ?auto_2632304 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2632302 ?auto_2632303 ) ( IN-CITY ?auto_2632295 ?auto_2632303 ) ( not ( = ?auto_2632295 ?auto_2632302 ) ) ( OBJ-AT ?auto_2632301 ?auto_2632302 ) ( IN-CITY ?auto_2632306 ?auto_2632303 ) ( not ( = ?auto_2632295 ?auto_2632306 ) ) ( OBJ-AT ?auto_2632300 ?auto_2632306 ) ( OBJ-AT ?auto_2632299 ?auto_2632306 ) ( OBJ-AT ?auto_2632297 ?auto_2632302 ) ( IN-CITY ?auto_2632305 ?auto_2632303 ) ( not ( = ?auto_2632295 ?auto_2632305 ) ) ( OBJ-AT ?auto_2632298 ?auto_2632305 ) ( OBJ-AT ?auto_2632296 ?auto_2632305 ) ( TRUCK-AT ?auto_2632304 ?auto_2632295 ) ( not ( = ?auto_2632296 ?auto_2632298 ) ) ( not ( = ?auto_2632296 ?auto_2632297 ) ) ( not ( = ?auto_2632298 ?auto_2632297 ) ) ( not ( = ?auto_2632302 ?auto_2632305 ) ) ( not ( = ?auto_2632296 ?auto_2632299 ) ) ( not ( = ?auto_2632298 ?auto_2632299 ) ) ( not ( = ?auto_2632297 ?auto_2632299 ) ) ( not ( = ?auto_2632306 ?auto_2632302 ) ) ( not ( = ?auto_2632306 ?auto_2632305 ) ) ( not ( = ?auto_2632296 ?auto_2632300 ) ) ( not ( = ?auto_2632298 ?auto_2632300 ) ) ( not ( = ?auto_2632297 ?auto_2632300 ) ) ( not ( = ?auto_2632299 ?auto_2632300 ) ) ( not ( = ?auto_2632296 ?auto_2632301 ) ) ( not ( = ?auto_2632298 ?auto_2632301 ) ) ( not ( = ?auto_2632297 ?auto_2632301 ) ) ( not ( = ?auto_2632299 ?auto_2632301 ) ) ( not ( = ?auto_2632300 ?auto_2632301 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2632296 ?auto_2632298 ?auto_2632297 ?auto_2632299 ?auto_2632301 ?auto_2632300 ?auto_2632295 )
      ( DELIVER-6PKG-VERIFY ?auto_2632296 ?auto_2632297 ?auto_2632298 ?auto_2632299 ?auto_2632300 ?auto_2632301 ?auto_2632295 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2632360 - OBJ
      ?auto_2632361 - OBJ
      ?auto_2632362 - OBJ
      ?auto_2632363 - OBJ
      ?auto_2632364 - OBJ
      ?auto_2632365 - OBJ
      ?auto_2632359 - LOCATION
    )
    :vars
    (
      ?auto_2632366 - LOCATION
      ?auto_2632367 - CITY
      ?auto_2632370 - LOCATION
      ?auto_2632369 - LOCATION
      ?auto_2632368 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2632366 ?auto_2632367 ) ( IN-CITY ?auto_2632359 ?auto_2632367 ) ( not ( = ?auto_2632359 ?auto_2632366 ) ) ( OBJ-AT ?auto_2632364 ?auto_2632366 ) ( IN-CITY ?auto_2632370 ?auto_2632367 ) ( not ( = ?auto_2632359 ?auto_2632370 ) ) ( OBJ-AT ?auto_2632365 ?auto_2632370 ) ( OBJ-AT ?auto_2632363 ?auto_2632370 ) ( OBJ-AT ?auto_2632361 ?auto_2632366 ) ( IN-CITY ?auto_2632369 ?auto_2632367 ) ( not ( = ?auto_2632359 ?auto_2632369 ) ) ( OBJ-AT ?auto_2632362 ?auto_2632369 ) ( OBJ-AT ?auto_2632360 ?auto_2632369 ) ( TRUCK-AT ?auto_2632368 ?auto_2632359 ) ( not ( = ?auto_2632360 ?auto_2632362 ) ) ( not ( = ?auto_2632360 ?auto_2632361 ) ) ( not ( = ?auto_2632362 ?auto_2632361 ) ) ( not ( = ?auto_2632366 ?auto_2632369 ) ) ( not ( = ?auto_2632360 ?auto_2632363 ) ) ( not ( = ?auto_2632362 ?auto_2632363 ) ) ( not ( = ?auto_2632361 ?auto_2632363 ) ) ( not ( = ?auto_2632370 ?auto_2632366 ) ) ( not ( = ?auto_2632370 ?auto_2632369 ) ) ( not ( = ?auto_2632360 ?auto_2632365 ) ) ( not ( = ?auto_2632362 ?auto_2632365 ) ) ( not ( = ?auto_2632361 ?auto_2632365 ) ) ( not ( = ?auto_2632363 ?auto_2632365 ) ) ( not ( = ?auto_2632360 ?auto_2632364 ) ) ( not ( = ?auto_2632362 ?auto_2632364 ) ) ( not ( = ?auto_2632361 ?auto_2632364 ) ) ( not ( = ?auto_2632363 ?auto_2632364 ) ) ( not ( = ?auto_2632365 ?auto_2632364 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2632360 ?auto_2632362 ?auto_2632361 ?auto_2632363 ?auto_2632364 ?auto_2632365 ?auto_2632359 )
      ( DELIVER-6PKG-VERIFY ?auto_2632360 ?auto_2632361 ?auto_2632362 ?auto_2632363 ?auto_2632364 ?auto_2632365 ?auto_2632359 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2632814 - OBJ
      ?auto_2632815 - OBJ
      ?auto_2632816 - OBJ
      ?auto_2632817 - OBJ
      ?auto_2632818 - OBJ
      ?auto_2632819 - OBJ
      ?auto_2632813 - LOCATION
    )
    :vars
    (
      ?auto_2632820 - LOCATION
      ?auto_2632821 - CITY
      ?auto_2632824 - LOCATION
      ?auto_2632823 - LOCATION
      ?auto_2632822 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2632820 ?auto_2632821 ) ( IN-CITY ?auto_2632813 ?auto_2632821 ) ( not ( = ?auto_2632813 ?auto_2632820 ) ) ( OBJ-AT ?auto_2632817 ?auto_2632820 ) ( IN-CITY ?auto_2632824 ?auto_2632821 ) ( not ( = ?auto_2632813 ?auto_2632824 ) ) ( OBJ-AT ?auto_2632819 ?auto_2632824 ) ( OBJ-AT ?auto_2632818 ?auto_2632824 ) ( OBJ-AT ?auto_2632815 ?auto_2632820 ) ( IN-CITY ?auto_2632823 ?auto_2632821 ) ( not ( = ?auto_2632813 ?auto_2632823 ) ) ( OBJ-AT ?auto_2632816 ?auto_2632823 ) ( OBJ-AT ?auto_2632814 ?auto_2632823 ) ( TRUCK-AT ?auto_2632822 ?auto_2632813 ) ( not ( = ?auto_2632814 ?auto_2632816 ) ) ( not ( = ?auto_2632814 ?auto_2632815 ) ) ( not ( = ?auto_2632816 ?auto_2632815 ) ) ( not ( = ?auto_2632820 ?auto_2632823 ) ) ( not ( = ?auto_2632814 ?auto_2632818 ) ) ( not ( = ?auto_2632816 ?auto_2632818 ) ) ( not ( = ?auto_2632815 ?auto_2632818 ) ) ( not ( = ?auto_2632824 ?auto_2632820 ) ) ( not ( = ?auto_2632824 ?auto_2632823 ) ) ( not ( = ?auto_2632814 ?auto_2632819 ) ) ( not ( = ?auto_2632816 ?auto_2632819 ) ) ( not ( = ?auto_2632815 ?auto_2632819 ) ) ( not ( = ?auto_2632818 ?auto_2632819 ) ) ( not ( = ?auto_2632814 ?auto_2632817 ) ) ( not ( = ?auto_2632816 ?auto_2632817 ) ) ( not ( = ?auto_2632815 ?auto_2632817 ) ) ( not ( = ?auto_2632818 ?auto_2632817 ) ) ( not ( = ?auto_2632819 ?auto_2632817 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2632814 ?auto_2632816 ?auto_2632815 ?auto_2632818 ?auto_2632817 ?auto_2632819 ?auto_2632813 )
      ( DELIVER-6PKG-VERIFY ?auto_2632814 ?auto_2632815 ?auto_2632816 ?auto_2632817 ?auto_2632818 ?auto_2632819 ?auto_2632813 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2634470 - OBJ
      ?auto_2634471 - OBJ
      ?auto_2634472 - OBJ
      ?auto_2634473 - OBJ
      ?auto_2634474 - OBJ
      ?auto_2634475 - OBJ
      ?auto_2634469 - LOCATION
    )
    :vars
    (
      ?auto_2634476 - LOCATION
      ?auto_2634477 - CITY
      ?auto_2634480 - LOCATION
      ?auto_2634479 - LOCATION
      ?auto_2634478 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2634476 ?auto_2634477 ) ( IN-CITY ?auto_2634469 ?auto_2634477 ) ( not ( = ?auto_2634469 ?auto_2634476 ) ) ( OBJ-AT ?auto_2634475 ?auto_2634476 ) ( IN-CITY ?auto_2634480 ?auto_2634477 ) ( not ( = ?auto_2634469 ?auto_2634480 ) ) ( OBJ-AT ?auto_2634474 ?auto_2634480 ) ( OBJ-AT ?auto_2634472 ?auto_2634480 ) ( OBJ-AT ?auto_2634471 ?auto_2634476 ) ( IN-CITY ?auto_2634479 ?auto_2634477 ) ( not ( = ?auto_2634469 ?auto_2634479 ) ) ( OBJ-AT ?auto_2634473 ?auto_2634479 ) ( OBJ-AT ?auto_2634470 ?auto_2634479 ) ( TRUCK-AT ?auto_2634478 ?auto_2634469 ) ( not ( = ?auto_2634470 ?auto_2634473 ) ) ( not ( = ?auto_2634470 ?auto_2634471 ) ) ( not ( = ?auto_2634473 ?auto_2634471 ) ) ( not ( = ?auto_2634476 ?auto_2634479 ) ) ( not ( = ?auto_2634470 ?auto_2634472 ) ) ( not ( = ?auto_2634473 ?auto_2634472 ) ) ( not ( = ?auto_2634471 ?auto_2634472 ) ) ( not ( = ?auto_2634480 ?auto_2634476 ) ) ( not ( = ?auto_2634480 ?auto_2634479 ) ) ( not ( = ?auto_2634470 ?auto_2634474 ) ) ( not ( = ?auto_2634473 ?auto_2634474 ) ) ( not ( = ?auto_2634471 ?auto_2634474 ) ) ( not ( = ?auto_2634472 ?auto_2634474 ) ) ( not ( = ?auto_2634470 ?auto_2634475 ) ) ( not ( = ?auto_2634473 ?auto_2634475 ) ) ( not ( = ?auto_2634471 ?auto_2634475 ) ) ( not ( = ?auto_2634472 ?auto_2634475 ) ) ( not ( = ?auto_2634474 ?auto_2634475 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2634470 ?auto_2634473 ?auto_2634471 ?auto_2634472 ?auto_2634475 ?auto_2634474 ?auto_2634469 )
      ( DELIVER-6PKG-VERIFY ?auto_2634470 ?auto_2634471 ?auto_2634472 ?auto_2634473 ?auto_2634474 ?auto_2634475 ?auto_2634469 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2634534 - OBJ
      ?auto_2634535 - OBJ
      ?auto_2634536 - OBJ
      ?auto_2634537 - OBJ
      ?auto_2634538 - OBJ
      ?auto_2634539 - OBJ
      ?auto_2634533 - LOCATION
    )
    :vars
    (
      ?auto_2634540 - LOCATION
      ?auto_2634541 - CITY
      ?auto_2634544 - LOCATION
      ?auto_2634543 - LOCATION
      ?auto_2634542 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2634540 ?auto_2634541 ) ( IN-CITY ?auto_2634533 ?auto_2634541 ) ( not ( = ?auto_2634533 ?auto_2634540 ) ) ( OBJ-AT ?auto_2634538 ?auto_2634540 ) ( IN-CITY ?auto_2634544 ?auto_2634541 ) ( not ( = ?auto_2634533 ?auto_2634544 ) ) ( OBJ-AT ?auto_2634539 ?auto_2634544 ) ( OBJ-AT ?auto_2634536 ?auto_2634544 ) ( OBJ-AT ?auto_2634535 ?auto_2634540 ) ( IN-CITY ?auto_2634543 ?auto_2634541 ) ( not ( = ?auto_2634533 ?auto_2634543 ) ) ( OBJ-AT ?auto_2634537 ?auto_2634543 ) ( OBJ-AT ?auto_2634534 ?auto_2634543 ) ( TRUCK-AT ?auto_2634542 ?auto_2634533 ) ( not ( = ?auto_2634534 ?auto_2634537 ) ) ( not ( = ?auto_2634534 ?auto_2634535 ) ) ( not ( = ?auto_2634537 ?auto_2634535 ) ) ( not ( = ?auto_2634540 ?auto_2634543 ) ) ( not ( = ?auto_2634534 ?auto_2634536 ) ) ( not ( = ?auto_2634537 ?auto_2634536 ) ) ( not ( = ?auto_2634535 ?auto_2634536 ) ) ( not ( = ?auto_2634544 ?auto_2634540 ) ) ( not ( = ?auto_2634544 ?auto_2634543 ) ) ( not ( = ?auto_2634534 ?auto_2634539 ) ) ( not ( = ?auto_2634537 ?auto_2634539 ) ) ( not ( = ?auto_2634535 ?auto_2634539 ) ) ( not ( = ?auto_2634536 ?auto_2634539 ) ) ( not ( = ?auto_2634534 ?auto_2634538 ) ) ( not ( = ?auto_2634537 ?auto_2634538 ) ) ( not ( = ?auto_2634535 ?auto_2634538 ) ) ( not ( = ?auto_2634536 ?auto_2634538 ) ) ( not ( = ?auto_2634539 ?auto_2634538 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2634534 ?auto_2634537 ?auto_2634535 ?auto_2634536 ?auto_2634538 ?auto_2634539 ?auto_2634533 )
      ( DELIVER-6PKG-VERIFY ?auto_2634534 ?auto_2634535 ?auto_2634536 ?auto_2634537 ?auto_2634538 ?auto_2634539 ?auto_2634533 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2634872 - OBJ
      ?auto_2634873 - OBJ
      ?auto_2634874 - OBJ
      ?auto_2634875 - OBJ
      ?auto_2634876 - OBJ
      ?auto_2634877 - OBJ
      ?auto_2634871 - LOCATION
    )
    :vars
    (
      ?auto_2634878 - LOCATION
      ?auto_2634879 - CITY
      ?auto_2634882 - LOCATION
      ?auto_2634881 - LOCATION
      ?auto_2634880 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2634878 ?auto_2634879 ) ( IN-CITY ?auto_2634871 ?auto_2634879 ) ( not ( = ?auto_2634871 ?auto_2634878 ) ) ( OBJ-AT ?auto_2634877 ?auto_2634878 ) ( IN-CITY ?auto_2634882 ?auto_2634879 ) ( not ( = ?auto_2634871 ?auto_2634882 ) ) ( OBJ-AT ?auto_2634875 ?auto_2634882 ) ( OBJ-AT ?auto_2634874 ?auto_2634882 ) ( OBJ-AT ?auto_2634873 ?auto_2634878 ) ( IN-CITY ?auto_2634881 ?auto_2634879 ) ( not ( = ?auto_2634871 ?auto_2634881 ) ) ( OBJ-AT ?auto_2634876 ?auto_2634881 ) ( OBJ-AT ?auto_2634872 ?auto_2634881 ) ( TRUCK-AT ?auto_2634880 ?auto_2634871 ) ( not ( = ?auto_2634872 ?auto_2634876 ) ) ( not ( = ?auto_2634872 ?auto_2634873 ) ) ( not ( = ?auto_2634876 ?auto_2634873 ) ) ( not ( = ?auto_2634878 ?auto_2634881 ) ) ( not ( = ?auto_2634872 ?auto_2634874 ) ) ( not ( = ?auto_2634876 ?auto_2634874 ) ) ( not ( = ?auto_2634873 ?auto_2634874 ) ) ( not ( = ?auto_2634882 ?auto_2634878 ) ) ( not ( = ?auto_2634882 ?auto_2634881 ) ) ( not ( = ?auto_2634872 ?auto_2634875 ) ) ( not ( = ?auto_2634876 ?auto_2634875 ) ) ( not ( = ?auto_2634873 ?auto_2634875 ) ) ( not ( = ?auto_2634874 ?auto_2634875 ) ) ( not ( = ?auto_2634872 ?auto_2634877 ) ) ( not ( = ?auto_2634876 ?auto_2634877 ) ) ( not ( = ?auto_2634873 ?auto_2634877 ) ) ( not ( = ?auto_2634874 ?auto_2634877 ) ) ( not ( = ?auto_2634875 ?auto_2634877 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2634872 ?auto_2634876 ?auto_2634873 ?auto_2634874 ?auto_2634877 ?auto_2634875 ?auto_2634871 )
      ( DELIVER-6PKG-VERIFY ?auto_2634872 ?auto_2634873 ?auto_2634874 ?auto_2634875 ?auto_2634876 ?auto_2634877 ?auto_2634871 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2634936 - OBJ
      ?auto_2634937 - OBJ
      ?auto_2634938 - OBJ
      ?auto_2634939 - OBJ
      ?auto_2634940 - OBJ
      ?auto_2634941 - OBJ
      ?auto_2634935 - LOCATION
    )
    :vars
    (
      ?auto_2634942 - LOCATION
      ?auto_2634943 - CITY
      ?auto_2634946 - LOCATION
      ?auto_2634945 - LOCATION
      ?auto_2634944 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2634942 ?auto_2634943 ) ( IN-CITY ?auto_2634935 ?auto_2634943 ) ( not ( = ?auto_2634935 ?auto_2634942 ) ) ( OBJ-AT ?auto_2634940 ?auto_2634942 ) ( IN-CITY ?auto_2634946 ?auto_2634943 ) ( not ( = ?auto_2634935 ?auto_2634946 ) ) ( OBJ-AT ?auto_2634939 ?auto_2634946 ) ( OBJ-AT ?auto_2634938 ?auto_2634946 ) ( OBJ-AT ?auto_2634937 ?auto_2634942 ) ( IN-CITY ?auto_2634945 ?auto_2634943 ) ( not ( = ?auto_2634935 ?auto_2634945 ) ) ( OBJ-AT ?auto_2634941 ?auto_2634945 ) ( OBJ-AT ?auto_2634936 ?auto_2634945 ) ( TRUCK-AT ?auto_2634944 ?auto_2634935 ) ( not ( = ?auto_2634936 ?auto_2634941 ) ) ( not ( = ?auto_2634936 ?auto_2634937 ) ) ( not ( = ?auto_2634941 ?auto_2634937 ) ) ( not ( = ?auto_2634942 ?auto_2634945 ) ) ( not ( = ?auto_2634936 ?auto_2634938 ) ) ( not ( = ?auto_2634941 ?auto_2634938 ) ) ( not ( = ?auto_2634937 ?auto_2634938 ) ) ( not ( = ?auto_2634946 ?auto_2634942 ) ) ( not ( = ?auto_2634946 ?auto_2634945 ) ) ( not ( = ?auto_2634936 ?auto_2634939 ) ) ( not ( = ?auto_2634941 ?auto_2634939 ) ) ( not ( = ?auto_2634937 ?auto_2634939 ) ) ( not ( = ?auto_2634938 ?auto_2634939 ) ) ( not ( = ?auto_2634936 ?auto_2634940 ) ) ( not ( = ?auto_2634941 ?auto_2634940 ) ) ( not ( = ?auto_2634937 ?auto_2634940 ) ) ( not ( = ?auto_2634938 ?auto_2634940 ) ) ( not ( = ?auto_2634939 ?auto_2634940 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2634936 ?auto_2634941 ?auto_2634937 ?auto_2634938 ?auto_2634940 ?auto_2634939 ?auto_2634935 )
      ( DELIVER-6PKG-VERIFY ?auto_2634936 ?auto_2634937 ?auto_2634938 ?auto_2634939 ?auto_2634940 ?auto_2634941 ?auto_2634935 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2635134 - OBJ
      ?auto_2635135 - OBJ
      ?auto_2635136 - OBJ
      ?auto_2635137 - OBJ
      ?auto_2635138 - OBJ
      ?auto_2635139 - OBJ
      ?auto_2635133 - LOCATION
    )
    :vars
    (
      ?auto_2635140 - LOCATION
      ?auto_2635141 - CITY
      ?auto_2635144 - LOCATION
      ?auto_2635143 - LOCATION
      ?auto_2635142 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2635140 ?auto_2635141 ) ( IN-CITY ?auto_2635133 ?auto_2635141 ) ( not ( = ?auto_2635133 ?auto_2635140 ) ) ( OBJ-AT ?auto_2635137 ?auto_2635140 ) ( IN-CITY ?auto_2635144 ?auto_2635141 ) ( not ( = ?auto_2635133 ?auto_2635144 ) ) ( OBJ-AT ?auto_2635139 ?auto_2635144 ) ( OBJ-AT ?auto_2635136 ?auto_2635144 ) ( OBJ-AT ?auto_2635135 ?auto_2635140 ) ( IN-CITY ?auto_2635143 ?auto_2635141 ) ( not ( = ?auto_2635133 ?auto_2635143 ) ) ( OBJ-AT ?auto_2635138 ?auto_2635143 ) ( OBJ-AT ?auto_2635134 ?auto_2635143 ) ( TRUCK-AT ?auto_2635142 ?auto_2635133 ) ( not ( = ?auto_2635134 ?auto_2635138 ) ) ( not ( = ?auto_2635134 ?auto_2635135 ) ) ( not ( = ?auto_2635138 ?auto_2635135 ) ) ( not ( = ?auto_2635140 ?auto_2635143 ) ) ( not ( = ?auto_2635134 ?auto_2635136 ) ) ( not ( = ?auto_2635138 ?auto_2635136 ) ) ( not ( = ?auto_2635135 ?auto_2635136 ) ) ( not ( = ?auto_2635144 ?auto_2635140 ) ) ( not ( = ?auto_2635144 ?auto_2635143 ) ) ( not ( = ?auto_2635134 ?auto_2635139 ) ) ( not ( = ?auto_2635138 ?auto_2635139 ) ) ( not ( = ?auto_2635135 ?auto_2635139 ) ) ( not ( = ?auto_2635136 ?auto_2635139 ) ) ( not ( = ?auto_2635134 ?auto_2635137 ) ) ( not ( = ?auto_2635138 ?auto_2635137 ) ) ( not ( = ?auto_2635135 ?auto_2635137 ) ) ( not ( = ?auto_2635136 ?auto_2635137 ) ) ( not ( = ?auto_2635139 ?auto_2635137 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2635134 ?auto_2635138 ?auto_2635135 ?auto_2635136 ?auto_2635137 ?auto_2635139 ?auto_2635133 )
      ( DELIVER-6PKG-VERIFY ?auto_2635134 ?auto_2635135 ?auto_2635136 ?auto_2635137 ?auto_2635138 ?auto_2635139 ?auto_2635133 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2635336 - OBJ
      ?auto_2635337 - OBJ
      ?auto_2635338 - OBJ
      ?auto_2635339 - OBJ
      ?auto_2635340 - OBJ
      ?auto_2635341 - OBJ
      ?auto_2635335 - LOCATION
    )
    :vars
    (
      ?auto_2635342 - LOCATION
      ?auto_2635343 - CITY
      ?auto_2635346 - LOCATION
      ?auto_2635345 - LOCATION
      ?auto_2635344 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2635342 ?auto_2635343 ) ( IN-CITY ?auto_2635335 ?auto_2635343 ) ( not ( = ?auto_2635335 ?auto_2635342 ) ) ( OBJ-AT ?auto_2635339 ?auto_2635342 ) ( IN-CITY ?auto_2635346 ?auto_2635343 ) ( not ( = ?auto_2635335 ?auto_2635346 ) ) ( OBJ-AT ?auto_2635340 ?auto_2635346 ) ( OBJ-AT ?auto_2635338 ?auto_2635346 ) ( OBJ-AT ?auto_2635337 ?auto_2635342 ) ( IN-CITY ?auto_2635345 ?auto_2635343 ) ( not ( = ?auto_2635335 ?auto_2635345 ) ) ( OBJ-AT ?auto_2635341 ?auto_2635345 ) ( OBJ-AT ?auto_2635336 ?auto_2635345 ) ( TRUCK-AT ?auto_2635344 ?auto_2635335 ) ( not ( = ?auto_2635336 ?auto_2635341 ) ) ( not ( = ?auto_2635336 ?auto_2635337 ) ) ( not ( = ?auto_2635341 ?auto_2635337 ) ) ( not ( = ?auto_2635342 ?auto_2635345 ) ) ( not ( = ?auto_2635336 ?auto_2635338 ) ) ( not ( = ?auto_2635341 ?auto_2635338 ) ) ( not ( = ?auto_2635337 ?auto_2635338 ) ) ( not ( = ?auto_2635346 ?auto_2635342 ) ) ( not ( = ?auto_2635346 ?auto_2635345 ) ) ( not ( = ?auto_2635336 ?auto_2635340 ) ) ( not ( = ?auto_2635341 ?auto_2635340 ) ) ( not ( = ?auto_2635337 ?auto_2635340 ) ) ( not ( = ?auto_2635338 ?auto_2635340 ) ) ( not ( = ?auto_2635336 ?auto_2635339 ) ) ( not ( = ?auto_2635341 ?auto_2635339 ) ) ( not ( = ?auto_2635337 ?auto_2635339 ) ) ( not ( = ?auto_2635338 ?auto_2635339 ) ) ( not ( = ?auto_2635340 ?auto_2635339 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2635336 ?auto_2635341 ?auto_2635337 ?auto_2635338 ?auto_2635339 ?auto_2635340 ?auto_2635335 )
      ( DELIVER-6PKG-VERIFY ?auto_2635336 ?auto_2635337 ?auto_2635338 ?auto_2635339 ?auto_2635340 ?auto_2635341 ?auto_2635335 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2637471 - OBJ
      ?auto_2637472 - OBJ
      ?auto_2637473 - OBJ
      ?auto_2637474 - OBJ
      ?auto_2637475 - OBJ
      ?auto_2637476 - OBJ
      ?auto_2637470 - LOCATION
    )
    :vars
    (
      ?auto_2637477 - LOCATION
      ?auto_2637478 - CITY
      ?auto_2637481 - LOCATION
      ?auto_2637480 - LOCATION
      ?auto_2637479 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2637477 ?auto_2637478 ) ( IN-CITY ?auto_2637470 ?auto_2637478 ) ( not ( = ?auto_2637470 ?auto_2637477 ) ) ( OBJ-AT ?auto_2637473 ?auto_2637477 ) ( IN-CITY ?auto_2637481 ?auto_2637478 ) ( not ( = ?auto_2637470 ?auto_2637481 ) ) ( OBJ-AT ?auto_2637476 ?auto_2637481 ) ( OBJ-AT ?auto_2637475 ?auto_2637481 ) ( OBJ-AT ?auto_2637472 ?auto_2637477 ) ( IN-CITY ?auto_2637480 ?auto_2637478 ) ( not ( = ?auto_2637470 ?auto_2637480 ) ) ( OBJ-AT ?auto_2637474 ?auto_2637480 ) ( OBJ-AT ?auto_2637471 ?auto_2637480 ) ( TRUCK-AT ?auto_2637479 ?auto_2637470 ) ( not ( = ?auto_2637471 ?auto_2637474 ) ) ( not ( = ?auto_2637471 ?auto_2637472 ) ) ( not ( = ?auto_2637474 ?auto_2637472 ) ) ( not ( = ?auto_2637477 ?auto_2637480 ) ) ( not ( = ?auto_2637471 ?auto_2637475 ) ) ( not ( = ?auto_2637474 ?auto_2637475 ) ) ( not ( = ?auto_2637472 ?auto_2637475 ) ) ( not ( = ?auto_2637481 ?auto_2637477 ) ) ( not ( = ?auto_2637481 ?auto_2637480 ) ) ( not ( = ?auto_2637471 ?auto_2637476 ) ) ( not ( = ?auto_2637474 ?auto_2637476 ) ) ( not ( = ?auto_2637472 ?auto_2637476 ) ) ( not ( = ?auto_2637475 ?auto_2637476 ) ) ( not ( = ?auto_2637471 ?auto_2637473 ) ) ( not ( = ?auto_2637474 ?auto_2637473 ) ) ( not ( = ?auto_2637472 ?auto_2637473 ) ) ( not ( = ?auto_2637475 ?auto_2637473 ) ) ( not ( = ?auto_2637476 ?auto_2637473 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2637471 ?auto_2637474 ?auto_2637472 ?auto_2637475 ?auto_2637473 ?auto_2637476 ?auto_2637470 )
      ( DELIVER-6PKG-VERIFY ?auto_2637471 ?auto_2637472 ?auto_2637473 ?auto_2637474 ?auto_2637475 ?auto_2637476 ?auto_2637470 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2638291 - OBJ
      ?auto_2638292 - OBJ
      ?auto_2638293 - OBJ
      ?auto_2638294 - OBJ
      ?auto_2638295 - OBJ
      ?auto_2638296 - OBJ
      ?auto_2638290 - LOCATION
    )
    :vars
    (
      ?auto_2638297 - LOCATION
      ?auto_2638298 - CITY
      ?auto_2638301 - LOCATION
      ?auto_2638300 - LOCATION
      ?auto_2638299 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2638297 ?auto_2638298 ) ( IN-CITY ?auto_2638290 ?auto_2638298 ) ( not ( = ?auto_2638290 ?auto_2638297 ) ) ( OBJ-AT ?auto_2638293 ?auto_2638297 ) ( IN-CITY ?auto_2638301 ?auto_2638298 ) ( not ( = ?auto_2638290 ?auto_2638301 ) ) ( OBJ-AT ?auto_2638296 ?auto_2638301 ) ( OBJ-AT ?auto_2638294 ?auto_2638301 ) ( OBJ-AT ?auto_2638292 ?auto_2638297 ) ( IN-CITY ?auto_2638300 ?auto_2638298 ) ( not ( = ?auto_2638290 ?auto_2638300 ) ) ( OBJ-AT ?auto_2638295 ?auto_2638300 ) ( OBJ-AT ?auto_2638291 ?auto_2638300 ) ( TRUCK-AT ?auto_2638299 ?auto_2638290 ) ( not ( = ?auto_2638291 ?auto_2638295 ) ) ( not ( = ?auto_2638291 ?auto_2638292 ) ) ( not ( = ?auto_2638295 ?auto_2638292 ) ) ( not ( = ?auto_2638297 ?auto_2638300 ) ) ( not ( = ?auto_2638291 ?auto_2638294 ) ) ( not ( = ?auto_2638295 ?auto_2638294 ) ) ( not ( = ?auto_2638292 ?auto_2638294 ) ) ( not ( = ?auto_2638301 ?auto_2638297 ) ) ( not ( = ?auto_2638301 ?auto_2638300 ) ) ( not ( = ?auto_2638291 ?auto_2638296 ) ) ( not ( = ?auto_2638295 ?auto_2638296 ) ) ( not ( = ?auto_2638292 ?auto_2638296 ) ) ( not ( = ?auto_2638294 ?auto_2638296 ) ) ( not ( = ?auto_2638291 ?auto_2638293 ) ) ( not ( = ?auto_2638295 ?auto_2638293 ) ) ( not ( = ?auto_2638292 ?auto_2638293 ) ) ( not ( = ?auto_2638294 ?auto_2638293 ) ) ( not ( = ?auto_2638296 ?auto_2638293 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2638291 ?auto_2638295 ?auto_2638292 ?auto_2638294 ?auto_2638293 ?auto_2638296 ?auto_2638290 )
      ( DELIVER-6PKG-VERIFY ?auto_2638291 ?auto_2638292 ?auto_2638293 ?auto_2638294 ?auto_2638295 ?auto_2638296 ?auto_2638290 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2638493 - OBJ
      ?auto_2638494 - OBJ
      ?auto_2638495 - OBJ
      ?auto_2638496 - OBJ
      ?auto_2638497 - OBJ
      ?auto_2638498 - OBJ
      ?auto_2638492 - LOCATION
    )
    :vars
    (
      ?auto_2638499 - LOCATION
      ?auto_2638500 - CITY
      ?auto_2638503 - LOCATION
      ?auto_2638502 - LOCATION
      ?auto_2638501 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2638499 ?auto_2638500 ) ( IN-CITY ?auto_2638492 ?auto_2638500 ) ( not ( = ?auto_2638492 ?auto_2638499 ) ) ( OBJ-AT ?auto_2638495 ?auto_2638499 ) ( IN-CITY ?auto_2638503 ?auto_2638500 ) ( not ( = ?auto_2638492 ?auto_2638503 ) ) ( OBJ-AT ?auto_2638497 ?auto_2638503 ) ( OBJ-AT ?auto_2638496 ?auto_2638503 ) ( OBJ-AT ?auto_2638494 ?auto_2638499 ) ( IN-CITY ?auto_2638502 ?auto_2638500 ) ( not ( = ?auto_2638492 ?auto_2638502 ) ) ( OBJ-AT ?auto_2638498 ?auto_2638502 ) ( OBJ-AT ?auto_2638493 ?auto_2638502 ) ( TRUCK-AT ?auto_2638501 ?auto_2638492 ) ( not ( = ?auto_2638493 ?auto_2638498 ) ) ( not ( = ?auto_2638493 ?auto_2638494 ) ) ( not ( = ?auto_2638498 ?auto_2638494 ) ) ( not ( = ?auto_2638499 ?auto_2638502 ) ) ( not ( = ?auto_2638493 ?auto_2638496 ) ) ( not ( = ?auto_2638498 ?auto_2638496 ) ) ( not ( = ?auto_2638494 ?auto_2638496 ) ) ( not ( = ?auto_2638503 ?auto_2638499 ) ) ( not ( = ?auto_2638503 ?auto_2638502 ) ) ( not ( = ?auto_2638493 ?auto_2638497 ) ) ( not ( = ?auto_2638498 ?auto_2638497 ) ) ( not ( = ?auto_2638494 ?auto_2638497 ) ) ( not ( = ?auto_2638496 ?auto_2638497 ) ) ( not ( = ?auto_2638493 ?auto_2638495 ) ) ( not ( = ?auto_2638498 ?auto_2638495 ) ) ( not ( = ?auto_2638494 ?auto_2638495 ) ) ( not ( = ?auto_2638496 ?auto_2638495 ) ) ( not ( = ?auto_2638497 ?auto_2638495 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2638493 ?auto_2638498 ?auto_2638494 ?auto_2638496 ?auto_2638495 ?auto_2638497 ?auto_2638492 )
      ( DELIVER-6PKG-VERIFY ?auto_2638493 ?auto_2638494 ?auto_2638495 ?auto_2638496 ?auto_2638497 ?auto_2638498 ?auto_2638492 ) )
  )

)

