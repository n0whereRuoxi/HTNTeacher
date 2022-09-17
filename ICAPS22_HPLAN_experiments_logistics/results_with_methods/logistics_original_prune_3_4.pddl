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
      ?auto_12316 - OBJ
      ?auto_12315 - LOCATION
    )
    :vars
    (
      ?auto_12317 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12317 ?auto_12315 ) ( IN-TRUCK ?auto_12316 ?auto_12317 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_12316 ?auto_12317 ?auto_12315 )
      ( DELIVER-1PKG-VERIFY ?auto_12316 ?auto_12315 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12328 - OBJ
      ?auto_12327 - LOCATION
    )
    :vars
    (
      ?auto_12329 - TRUCK
      ?auto_12330 - LOCATION
      ?auto_12331 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12328 ?auto_12329 ) ( TRUCK-AT ?auto_12329 ?auto_12330 ) ( IN-CITY ?auto_12330 ?auto_12331 ) ( IN-CITY ?auto_12327 ?auto_12331 ) ( not ( = ?auto_12327 ?auto_12330 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12329 ?auto_12330 ?auto_12327 ?auto_12331 )
      ( DELIVER-1PKG ?auto_12328 ?auto_12327 )
      ( DELIVER-1PKG-VERIFY ?auto_12328 ?auto_12327 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12346 - OBJ
      ?auto_12345 - LOCATION
    )
    :vars
    (
      ?auto_12349 - TRUCK
      ?auto_12348 - LOCATION
      ?auto_12347 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12349 ?auto_12348 ) ( IN-CITY ?auto_12348 ?auto_12347 ) ( IN-CITY ?auto_12345 ?auto_12347 ) ( not ( = ?auto_12345 ?auto_12348 ) ) ( OBJ-AT ?auto_12346 ?auto_12348 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12346 ?auto_12349 ?auto_12348 )
      ( DELIVER-1PKG ?auto_12346 ?auto_12345 )
      ( DELIVER-1PKG-VERIFY ?auto_12346 ?auto_12345 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12364 - OBJ
      ?auto_12363 - LOCATION
    )
    :vars
    (
      ?auto_12366 - LOCATION
      ?auto_12365 - CITY
      ?auto_12367 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12366 ?auto_12365 ) ( IN-CITY ?auto_12363 ?auto_12365 ) ( not ( = ?auto_12363 ?auto_12366 ) ) ( OBJ-AT ?auto_12364 ?auto_12366 ) ( TRUCK-AT ?auto_12367 ?auto_12363 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12367 ?auto_12363 ?auto_12366 ?auto_12365 )
      ( DELIVER-1PKG ?auto_12364 ?auto_12363 )
      ( DELIVER-1PKG-VERIFY ?auto_12364 ?auto_12363 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12424 - OBJ
      ?auto_12425 - OBJ
      ?auto_12423 - LOCATION
    )
    :vars
    (
      ?auto_12426 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12426 ?auto_12423 ) ( IN-TRUCK ?auto_12425 ?auto_12426 ) ( OBJ-AT ?auto_12424 ?auto_12423 ) ( not ( = ?auto_12424 ?auto_12425 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12425 ?auto_12423 )
      ( DELIVER-2PKG-VERIFY ?auto_12424 ?auto_12425 ?auto_12423 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12428 - OBJ
      ?auto_12429 - OBJ
      ?auto_12427 - LOCATION
    )
    :vars
    (
      ?auto_12430 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12430 ?auto_12427 ) ( IN-TRUCK ?auto_12428 ?auto_12430 ) ( OBJ-AT ?auto_12429 ?auto_12427 ) ( not ( = ?auto_12428 ?auto_12429 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12428 ?auto_12427 )
      ( DELIVER-2PKG-VERIFY ?auto_12428 ?auto_12429 ?auto_12427 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12436 - OBJ
      ?auto_12437 - OBJ
      ?auto_12438 - OBJ
      ?auto_12435 - LOCATION
    )
    :vars
    (
      ?auto_12439 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12439 ?auto_12435 ) ( IN-TRUCK ?auto_12438 ?auto_12439 ) ( OBJ-AT ?auto_12436 ?auto_12435 ) ( OBJ-AT ?auto_12437 ?auto_12435 ) ( not ( = ?auto_12436 ?auto_12437 ) ) ( not ( = ?auto_12436 ?auto_12438 ) ) ( not ( = ?auto_12437 ?auto_12438 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12438 ?auto_12435 )
      ( DELIVER-3PKG-VERIFY ?auto_12436 ?auto_12437 ?auto_12438 ?auto_12435 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12441 - OBJ
      ?auto_12442 - OBJ
      ?auto_12443 - OBJ
      ?auto_12440 - LOCATION
    )
    :vars
    (
      ?auto_12444 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12444 ?auto_12440 ) ( IN-TRUCK ?auto_12442 ?auto_12444 ) ( OBJ-AT ?auto_12441 ?auto_12440 ) ( OBJ-AT ?auto_12443 ?auto_12440 ) ( not ( = ?auto_12441 ?auto_12442 ) ) ( not ( = ?auto_12441 ?auto_12443 ) ) ( not ( = ?auto_12442 ?auto_12443 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12442 ?auto_12440 )
      ( DELIVER-3PKG-VERIFY ?auto_12441 ?auto_12442 ?auto_12443 ?auto_12440 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12451 - OBJ
      ?auto_12452 - OBJ
      ?auto_12453 - OBJ
      ?auto_12450 - LOCATION
    )
    :vars
    (
      ?auto_12454 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12454 ?auto_12450 ) ( IN-TRUCK ?auto_12451 ?auto_12454 ) ( OBJ-AT ?auto_12452 ?auto_12450 ) ( OBJ-AT ?auto_12453 ?auto_12450 ) ( not ( = ?auto_12451 ?auto_12452 ) ) ( not ( = ?auto_12451 ?auto_12453 ) ) ( not ( = ?auto_12452 ?auto_12453 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12451 ?auto_12450 )
      ( DELIVER-3PKG-VERIFY ?auto_12451 ?auto_12452 ?auto_12453 ?auto_12450 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12476 - OBJ
      ?auto_12477 - OBJ
      ?auto_12475 - LOCATION
    )
    :vars
    (
      ?auto_12478 - TRUCK
      ?auto_12479 - LOCATION
      ?auto_12480 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12477 ?auto_12478 ) ( TRUCK-AT ?auto_12478 ?auto_12479 ) ( IN-CITY ?auto_12479 ?auto_12480 ) ( IN-CITY ?auto_12475 ?auto_12480 ) ( not ( = ?auto_12475 ?auto_12479 ) ) ( OBJ-AT ?auto_12476 ?auto_12475 ) ( not ( = ?auto_12476 ?auto_12477 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12477 ?auto_12475 )
      ( DELIVER-2PKG-VERIFY ?auto_12476 ?auto_12477 ?auto_12475 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12482 - OBJ
      ?auto_12483 - OBJ
      ?auto_12481 - LOCATION
    )
    :vars
    (
      ?auto_12484 - TRUCK
      ?auto_12485 - LOCATION
      ?auto_12486 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12482 ?auto_12484 ) ( TRUCK-AT ?auto_12484 ?auto_12485 ) ( IN-CITY ?auto_12485 ?auto_12486 ) ( IN-CITY ?auto_12481 ?auto_12486 ) ( not ( = ?auto_12481 ?auto_12485 ) ) ( OBJ-AT ?auto_12483 ?auto_12481 ) ( not ( = ?auto_12483 ?auto_12482 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12483 ?auto_12482 ?auto_12481 )
      ( DELIVER-2PKG-VERIFY ?auto_12482 ?auto_12483 ?auto_12481 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12495 - OBJ
      ?auto_12496 - OBJ
      ?auto_12497 - OBJ
      ?auto_12494 - LOCATION
    )
    :vars
    (
      ?auto_12498 - TRUCK
      ?auto_12499 - LOCATION
      ?auto_12500 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12497 ?auto_12498 ) ( TRUCK-AT ?auto_12498 ?auto_12499 ) ( IN-CITY ?auto_12499 ?auto_12500 ) ( IN-CITY ?auto_12494 ?auto_12500 ) ( not ( = ?auto_12494 ?auto_12499 ) ) ( OBJ-AT ?auto_12496 ?auto_12494 ) ( not ( = ?auto_12496 ?auto_12497 ) ) ( OBJ-AT ?auto_12495 ?auto_12494 ) ( not ( = ?auto_12495 ?auto_12496 ) ) ( not ( = ?auto_12495 ?auto_12497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12496 ?auto_12497 ?auto_12494 )
      ( DELIVER-3PKG-VERIFY ?auto_12495 ?auto_12496 ?auto_12497 ?auto_12494 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12502 - OBJ
      ?auto_12503 - OBJ
      ?auto_12504 - OBJ
      ?auto_12501 - LOCATION
    )
    :vars
    (
      ?auto_12505 - TRUCK
      ?auto_12506 - LOCATION
      ?auto_12507 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12503 ?auto_12505 ) ( TRUCK-AT ?auto_12505 ?auto_12506 ) ( IN-CITY ?auto_12506 ?auto_12507 ) ( IN-CITY ?auto_12501 ?auto_12507 ) ( not ( = ?auto_12501 ?auto_12506 ) ) ( OBJ-AT ?auto_12502 ?auto_12501 ) ( not ( = ?auto_12502 ?auto_12503 ) ) ( OBJ-AT ?auto_12504 ?auto_12501 ) ( not ( = ?auto_12502 ?auto_12504 ) ) ( not ( = ?auto_12503 ?auto_12504 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12502 ?auto_12503 ?auto_12501 )
      ( DELIVER-3PKG-VERIFY ?auto_12502 ?auto_12503 ?auto_12504 ?auto_12501 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12516 - OBJ
      ?auto_12517 - OBJ
      ?auto_12518 - OBJ
      ?auto_12515 - LOCATION
    )
    :vars
    (
      ?auto_12519 - TRUCK
      ?auto_12520 - LOCATION
      ?auto_12521 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12516 ?auto_12519 ) ( TRUCK-AT ?auto_12519 ?auto_12520 ) ( IN-CITY ?auto_12520 ?auto_12521 ) ( IN-CITY ?auto_12515 ?auto_12521 ) ( not ( = ?auto_12515 ?auto_12520 ) ) ( OBJ-AT ?auto_12518 ?auto_12515 ) ( not ( = ?auto_12518 ?auto_12516 ) ) ( OBJ-AT ?auto_12517 ?auto_12515 ) ( not ( = ?auto_12516 ?auto_12517 ) ) ( not ( = ?auto_12517 ?auto_12518 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12518 ?auto_12516 ?auto_12515 )
      ( DELIVER-3PKG-VERIFY ?auto_12516 ?auto_12517 ?auto_12518 ?auto_12515 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12545 - OBJ
      ?auto_12544 - LOCATION
    )
    :vars
    (
      ?auto_12547 - TRUCK
      ?auto_12548 - LOCATION
      ?auto_12549 - CITY
      ?auto_12546 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12547 ?auto_12548 ) ( IN-CITY ?auto_12548 ?auto_12549 ) ( IN-CITY ?auto_12544 ?auto_12549 ) ( not ( = ?auto_12544 ?auto_12548 ) ) ( OBJ-AT ?auto_12546 ?auto_12544 ) ( not ( = ?auto_12546 ?auto_12545 ) ) ( OBJ-AT ?auto_12545 ?auto_12548 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12545 ?auto_12547 ?auto_12548 )
      ( DELIVER-2PKG ?auto_12546 ?auto_12545 ?auto_12544 )
      ( DELIVER-1PKG-VERIFY ?auto_12545 ?auto_12544 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12551 - OBJ
      ?auto_12552 - OBJ
      ?auto_12550 - LOCATION
    )
    :vars
    (
      ?auto_12554 - TRUCK
      ?auto_12553 - LOCATION
      ?auto_12555 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12554 ?auto_12553 ) ( IN-CITY ?auto_12553 ?auto_12555 ) ( IN-CITY ?auto_12550 ?auto_12555 ) ( not ( = ?auto_12550 ?auto_12553 ) ) ( OBJ-AT ?auto_12551 ?auto_12550 ) ( not ( = ?auto_12551 ?auto_12552 ) ) ( OBJ-AT ?auto_12552 ?auto_12553 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12552 ?auto_12550 )
      ( DELIVER-2PKG-VERIFY ?auto_12551 ?auto_12552 ?auto_12550 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12557 - OBJ
      ?auto_12558 - OBJ
      ?auto_12556 - LOCATION
    )
    :vars
    (
      ?auto_12561 - TRUCK
      ?auto_12559 - LOCATION
      ?auto_12560 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12561 ?auto_12559 ) ( IN-CITY ?auto_12559 ?auto_12560 ) ( IN-CITY ?auto_12556 ?auto_12560 ) ( not ( = ?auto_12556 ?auto_12559 ) ) ( OBJ-AT ?auto_12558 ?auto_12556 ) ( not ( = ?auto_12558 ?auto_12557 ) ) ( OBJ-AT ?auto_12557 ?auto_12559 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12558 ?auto_12557 ?auto_12556 )
      ( DELIVER-2PKG-VERIFY ?auto_12557 ?auto_12558 ?auto_12556 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12570 - OBJ
      ?auto_12571 - OBJ
      ?auto_12572 - OBJ
      ?auto_12569 - LOCATION
    )
    :vars
    (
      ?auto_12575 - TRUCK
      ?auto_12573 - LOCATION
      ?auto_12574 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12575 ?auto_12573 ) ( IN-CITY ?auto_12573 ?auto_12574 ) ( IN-CITY ?auto_12569 ?auto_12574 ) ( not ( = ?auto_12569 ?auto_12573 ) ) ( OBJ-AT ?auto_12571 ?auto_12569 ) ( not ( = ?auto_12571 ?auto_12572 ) ) ( OBJ-AT ?auto_12572 ?auto_12573 ) ( OBJ-AT ?auto_12570 ?auto_12569 ) ( not ( = ?auto_12570 ?auto_12571 ) ) ( not ( = ?auto_12570 ?auto_12572 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12571 ?auto_12572 ?auto_12569 )
      ( DELIVER-3PKG-VERIFY ?auto_12570 ?auto_12571 ?auto_12572 ?auto_12569 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12577 - OBJ
      ?auto_12578 - OBJ
      ?auto_12579 - OBJ
      ?auto_12576 - LOCATION
    )
    :vars
    (
      ?auto_12582 - TRUCK
      ?auto_12580 - LOCATION
      ?auto_12581 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12582 ?auto_12580 ) ( IN-CITY ?auto_12580 ?auto_12581 ) ( IN-CITY ?auto_12576 ?auto_12581 ) ( not ( = ?auto_12576 ?auto_12580 ) ) ( OBJ-AT ?auto_12579 ?auto_12576 ) ( not ( = ?auto_12579 ?auto_12578 ) ) ( OBJ-AT ?auto_12578 ?auto_12580 ) ( OBJ-AT ?auto_12577 ?auto_12576 ) ( not ( = ?auto_12577 ?auto_12578 ) ) ( not ( = ?auto_12577 ?auto_12579 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12579 ?auto_12578 ?auto_12576 )
      ( DELIVER-3PKG-VERIFY ?auto_12577 ?auto_12578 ?auto_12579 ?auto_12576 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12591 - OBJ
      ?auto_12592 - OBJ
      ?auto_12593 - OBJ
      ?auto_12590 - LOCATION
    )
    :vars
    (
      ?auto_12596 - TRUCK
      ?auto_12594 - LOCATION
      ?auto_12595 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12596 ?auto_12594 ) ( IN-CITY ?auto_12594 ?auto_12595 ) ( IN-CITY ?auto_12590 ?auto_12595 ) ( not ( = ?auto_12590 ?auto_12594 ) ) ( OBJ-AT ?auto_12593 ?auto_12590 ) ( not ( = ?auto_12593 ?auto_12591 ) ) ( OBJ-AT ?auto_12591 ?auto_12594 ) ( OBJ-AT ?auto_12592 ?auto_12590 ) ( not ( = ?auto_12591 ?auto_12592 ) ) ( not ( = ?auto_12592 ?auto_12593 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12593 ?auto_12591 ?auto_12590 )
      ( DELIVER-3PKG-VERIFY ?auto_12591 ?auto_12592 ?auto_12593 ?auto_12590 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12620 - OBJ
      ?auto_12619 - LOCATION
    )
    :vars
    (
      ?auto_12621 - LOCATION
      ?auto_12622 - CITY
      ?auto_12623 - OBJ
      ?auto_12624 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12621 ?auto_12622 ) ( IN-CITY ?auto_12619 ?auto_12622 ) ( not ( = ?auto_12619 ?auto_12621 ) ) ( OBJ-AT ?auto_12623 ?auto_12619 ) ( not ( = ?auto_12623 ?auto_12620 ) ) ( OBJ-AT ?auto_12620 ?auto_12621 ) ( TRUCK-AT ?auto_12624 ?auto_12619 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12624 ?auto_12619 ?auto_12621 ?auto_12622 )
      ( DELIVER-2PKG ?auto_12623 ?auto_12620 ?auto_12619 )
      ( DELIVER-1PKG-VERIFY ?auto_12620 ?auto_12619 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12626 - OBJ
      ?auto_12627 - OBJ
      ?auto_12625 - LOCATION
    )
    :vars
    (
      ?auto_12629 - LOCATION
      ?auto_12630 - CITY
      ?auto_12628 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12629 ?auto_12630 ) ( IN-CITY ?auto_12625 ?auto_12630 ) ( not ( = ?auto_12625 ?auto_12629 ) ) ( OBJ-AT ?auto_12626 ?auto_12625 ) ( not ( = ?auto_12626 ?auto_12627 ) ) ( OBJ-AT ?auto_12627 ?auto_12629 ) ( TRUCK-AT ?auto_12628 ?auto_12625 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12627 ?auto_12625 )
      ( DELIVER-2PKG-VERIFY ?auto_12626 ?auto_12627 ?auto_12625 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12632 - OBJ
      ?auto_12633 - OBJ
      ?auto_12631 - LOCATION
    )
    :vars
    (
      ?auto_12635 - LOCATION
      ?auto_12634 - CITY
      ?auto_12636 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12635 ?auto_12634 ) ( IN-CITY ?auto_12631 ?auto_12634 ) ( not ( = ?auto_12631 ?auto_12635 ) ) ( OBJ-AT ?auto_12633 ?auto_12631 ) ( not ( = ?auto_12633 ?auto_12632 ) ) ( OBJ-AT ?auto_12632 ?auto_12635 ) ( TRUCK-AT ?auto_12636 ?auto_12631 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12633 ?auto_12632 ?auto_12631 )
      ( DELIVER-2PKG-VERIFY ?auto_12632 ?auto_12633 ?auto_12631 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12645 - OBJ
      ?auto_12646 - OBJ
      ?auto_12647 - OBJ
      ?auto_12644 - LOCATION
    )
    :vars
    (
      ?auto_12649 - LOCATION
      ?auto_12648 - CITY
      ?auto_12650 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12649 ?auto_12648 ) ( IN-CITY ?auto_12644 ?auto_12648 ) ( not ( = ?auto_12644 ?auto_12649 ) ) ( OBJ-AT ?auto_12646 ?auto_12644 ) ( not ( = ?auto_12646 ?auto_12647 ) ) ( OBJ-AT ?auto_12647 ?auto_12649 ) ( TRUCK-AT ?auto_12650 ?auto_12644 ) ( OBJ-AT ?auto_12645 ?auto_12644 ) ( not ( = ?auto_12645 ?auto_12646 ) ) ( not ( = ?auto_12645 ?auto_12647 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12646 ?auto_12647 ?auto_12644 )
      ( DELIVER-3PKG-VERIFY ?auto_12645 ?auto_12646 ?auto_12647 ?auto_12644 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12652 - OBJ
      ?auto_12653 - OBJ
      ?auto_12654 - OBJ
      ?auto_12651 - LOCATION
    )
    :vars
    (
      ?auto_12656 - LOCATION
      ?auto_12655 - CITY
      ?auto_12657 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12656 ?auto_12655 ) ( IN-CITY ?auto_12651 ?auto_12655 ) ( not ( = ?auto_12651 ?auto_12656 ) ) ( OBJ-AT ?auto_12654 ?auto_12651 ) ( not ( = ?auto_12654 ?auto_12653 ) ) ( OBJ-AT ?auto_12653 ?auto_12656 ) ( TRUCK-AT ?auto_12657 ?auto_12651 ) ( OBJ-AT ?auto_12652 ?auto_12651 ) ( not ( = ?auto_12652 ?auto_12653 ) ) ( not ( = ?auto_12652 ?auto_12654 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12654 ?auto_12653 ?auto_12651 )
      ( DELIVER-3PKG-VERIFY ?auto_12652 ?auto_12653 ?auto_12654 ?auto_12651 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12666 - OBJ
      ?auto_12667 - OBJ
      ?auto_12668 - OBJ
      ?auto_12665 - LOCATION
    )
    :vars
    (
      ?auto_12670 - LOCATION
      ?auto_12669 - CITY
      ?auto_12671 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12670 ?auto_12669 ) ( IN-CITY ?auto_12665 ?auto_12669 ) ( not ( = ?auto_12665 ?auto_12670 ) ) ( OBJ-AT ?auto_12668 ?auto_12665 ) ( not ( = ?auto_12668 ?auto_12666 ) ) ( OBJ-AT ?auto_12666 ?auto_12670 ) ( TRUCK-AT ?auto_12671 ?auto_12665 ) ( OBJ-AT ?auto_12667 ?auto_12665 ) ( not ( = ?auto_12666 ?auto_12667 ) ) ( not ( = ?auto_12667 ?auto_12668 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12668 ?auto_12666 ?auto_12665 )
      ( DELIVER-3PKG-VERIFY ?auto_12666 ?auto_12667 ?auto_12668 ?auto_12665 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12695 - OBJ
      ?auto_12694 - LOCATION
    )
    :vars
    (
      ?auto_12698 - LOCATION
      ?auto_12696 - CITY
      ?auto_12697 - OBJ
      ?auto_12699 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12698 ?auto_12696 ) ( IN-CITY ?auto_12694 ?auto_12696 ) ( not ( = ?auto_12694 ?auto_12698 ) ) ( not ( = ?auto_12697 ?auto_12695 ) ) ( OBJ-AT ?auto_12695 ?auto_12698 ) ( TRUCK-AT ?auto_12699 ?auto_12694 ) ( IN-TRUCK ?auto_12697 ?auto_12699 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12697 ?auto_12694 )
      ( DELIVER-2PKG ?auto_12697 ?auto_12695 ?auto_12694 )
      ( DELIVER-1PKG-VERIFY ?auto_12695 ?auto_12694 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12701 - OBJ
      ?auto_12702 - OBJ
      ?auto_12700 - LOCATION
    )
    :vars
    (
      ?auto_12705 - LOCATION
      ?auto_12704 - CITY
      ?auto_12703 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12705 ?auto_12704 ) ( IN-CITY ?auto_12700 ?auto_12704 ) ( not ( = ?auto_12700 ?auto_12705 ) ) ( not ( = ?auto_12701 ?auto_12702 ) ) ( OBJ-AT ?auto_12702 ?auto_12705 ) ( TRUCK-AT ?auto_12703 ?auto_12700 ) ( IN-TRUCK ?auto_12701 ?auto_12703 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12702 ?auto_12700 )
      ( DELIVER-2PKG-VERIFY ?auto_12701 ?auto_12702 ?auto_12700 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12707 - OBJ
      ?auto_12708 - OBJ
      ?auto_12706 - LOCATION
    )
    :vars
    (
      ?auto_12711 - LOCATION
      ?auto_12709 - CITY
      ?auto_12710 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12711 ?auto_12709 ) ( IN-CITY ?auto_12706 ?auto_12709 ) ( not ( = ?auto_12706 ?auto_12711 ) ) ( not ( = ?auto_12708 ?auto_12707 ) ) ( OBJ-AT ?auto_12707 ?auto_12711 ) ( TRUCK-AT ?auto_12710 ?auto_12706 ) ( IN-TRUCK ?auto_12708 ?auto_12710 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12708 ?auto_12707 ?auto_12706 )
      ( DELIVER-2PKG-VERIFY ?auto_12707 ?auto_12708 ?auto_12706 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12770 - OBJ
      ?auto_12769 - LOCATION
    )
    :vars
    (
      ?auto_12774 - LOCATION
      ?auto_12771 - CITY
      ?auto_12773 - OBJ
      ?auto_12772 - TRUCK
      ?auto_12775 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12774 ?auto_12771 ) ( IN-CITY ?auto_12769 ?auto_12771 ) ( not ( = ?auto_12769 ?auto_12774 ) ) ( not ( = ?auto_12773 ?auto_12770 ) ) ( OBJ-AT ?auto_12770 ?auto_12774 ) ( IN-TRUCK ?auto_12773 ?auto_12772 ) ( TRUCK-AT ?auto_12772 ?auto_12775 ) ( IN-CITY ?auto_12775 ?auto_12771 ) ( not ( = ?auto_12769 ?auto_12775 ) ) ( not ( = ?auto_12774 ?auto_12775 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12772 ?auto_12775 ?auto_12769 ?auto_12771 )
      ( DELIVER-2PKG ?auto_12773 ?auto_12770 ?auto_12769 )
      ( DELIVER-1PKG-VERIFY ?auto_12770 ?auto_12769 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12777 - OBJ
      ?auto_12778 - OBJ
      ?auto_12776 - LOCATION
    )
    :vars
    (
      ?auto_12779 - LOCATION
      ?auto_12782 - CITY
      ?auto_12780 - TRUCK
      ?auto_12781 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12779 ?auto_12782 ) ( IN-CITY ?auto_12776 ?auto_12782 ) ( not ( = ?auto_12776 ?auto_12779 ) ) ( not ( = ?auto_12777 ?auto_12778 ) ) ( OBJ-AT ?auto_12778 ?auto_12779 ) ( IN-TRUCK ?auto_12777 ?auto_12780 ) ( TRUCK-AT ?auto_12780 ?auto_12781 ) ( IN-CITY ?auto_12781 ?auto_12782 ) ( not ( = ?auto_12776 ?auto_12781 ) ) ( not ( = ?auto_12779 ?auto_12781 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12778 ?auto_12776 )
      ( DELIVER-2PKG-VERIFY ?auto_12777 ?auto_12778 ?auto_12776 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12784 - OBJ
      ?auto_12785 - OBJ
      ?auto_12783 - LOCATION
    )
    :vars
    (
      ?auto_12788 - LOCATION
      ?auto_12786 - CITY
      ?auto_12787 - TRUCK
      ?auto_12789 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12788 ?auto_12786 ) ( IN-CITY ?auto_12783 ?auto_12786 ) ( not ( = ?auto_12783 ?auto_12788 ) ) ( not ( = ?auto_12785 ?auto_12784 ) ) ( OBJ-AT ?auto_12784 ?auto_12788 ) ( IN-TRUCK ?auto_12785 ?auto_12787 ) ( TRUCK-AT ?auto_12787 ?auto_12789 ) ( IN-CITY ?auto_12789 ?auto_12786 ) ( not ( = ?auto_12783 ?auto_12789 ) ) ( not ( = ?auto_12788 ?auto_12789 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12785 ?auto_12784 ?auto_12783 )
      ( DELIVER-2PKG-VERIFY ?auto_12784 ?auto_12785 ?auto_12783 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12856 - OBJ
      ?auto_12855 - LOCATION
    )
    :vars
    (
      ?auto_12859 - LOCATION
      ?auto_12857 - CITY
      ?auto_12861 - OBJ
      ?auto_12858 - TRUCK
      ?auto_12860 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12859 ?auto_12857 ) ( IN-CITY ?auto_12855 ?auto_12857 ) ( not ( = ?auto_12855 ?auto_12859 ) ) ( not ( = ?auto_12861 ?auto_12856 ) ) ( OBJ-AT ?auto_12856 ?auto_12859 ) ( TRUCK-AT ?auto_12858 ?auto_12860 ) ( IN-CITY ?auto_12860 ?auto_12857 ) ( not ( = ?auto_12855 ?auto_12860 ) ) ( not ( = ?auto_12859 ?auto_12860 ) ) ( OBJ-AT ?auto_12861 ?auto_12860 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12861 ?auto_12858 ?auto_12860 )
      ( DELIVER-2PKG ?auto_12861 ?auto_12856 ?auto_12855 )
      ( DELIVER-1PKG-VERIFY ?auto_12856 ?auto_12855 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12863 - OBJ
      ?auto_12864 - OBJ
      ?auto_12862 - LOCATION
    )
    :vars
    (
      ?auto_12867 - LOCATION
      ?auto_12865 - CITY
      ?auto_12866 - TRUCK
      ?auto_12868 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12867 ?auto_12865 ) ( IN-CITY ?auto_12862 ?auto_12865 ) ( not ( = ?auto_12862 ?auto_12867 ) ) ( not ( = ?auto_12863 ?auto_12864 ) ) ( OBJ-AT ?auto_12864 ?auto_12867 ) ( TRUCK-AT ?auto_12866 ?auto_12868 ) ( IN-CITY ?auto_12868 ?auto_12865 ) ( not ( = ?auto_12862 ?auto_12868 ) ) ( not ( = ?auto_12867 ?auto_12868 ) ) ( OBJ-AT ?auto_12863 ?auto_12868 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12864 ?auto_12862 )
      ( DELIVER-2PKG-VERIFY ?auto_12863 ?auto_12864 ?auto_12862 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12870 - OBJ
      ?auto_12871 - OBJ
      ?auto_12869 - LOCATION
    )
    :vars
    (
      ?auto_12872 - LOCATION
      ?auto_12873 - CITY
      ?auto_12874 - TRUCK
      ?auto_12875 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12872 ?auto_12873 ) ( IN-CITY ?auto_12869 ?auto_12873 ) ( not ( = ?auto_12869 ?auto_12872 ) ) ( not ( = ?auto_12871 ?auto_12870 ) ) ( OBJ-AT ?auto_12870 ?auto_12872 ) ( TRUCK-AT ?auto_12874 ?auto_12875 ) ( IN-CITY ?auto_12875 ?auto_12873 ) ( not ( = ?auto_12869 ?auto_12875 ) ) ( not ( = ?auto_12872 ?auto_12875 ) ) ( OBJ-AT ?auto_12871 ?auto_12875 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12871 ?auto_12870 ?auto_12869 )
      ( DELIVER-2PKG-VERIFY ?auto_12870 ?auto_12871 ?auto_12869 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13244 - OBJ
      ?auto_13245 - OBJ
      ?auto_13246 - OBJ
      ?auto_13243 - LOCATION
    )
    :vars
    (
      ?auto_13249 - TRUCK
      ?auto_13248 - LOCATION
      ?auto_13247 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13246 ?auto_13249 ) ( TRUCK-AT ?auto_13249 ?auto_13248 ) ( IN-CITY ?auto_13248 ?auto_13247 ) ( IN-CITY ?auto_13243 ?auto_13247 ) ( not ( = ?auto_13243 ?auto_13248 ) ) ( OBJ-AT ?auto_13244 ?auto_13243 ) ( not ( = ?auto_13244 ?auto_13246 ) ) ( OBJ-AT ?auto_13245 ?auto_13243 ) ( not ( = ?auto_13244 ?auto_13245 ) ) ( not ( = ?auto_13245 ?auto_13246 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13244 ?auto_13246 ?auto_13243 )
      ( DELIVER-3PKG-VERIFY ?auto_13244 ?auto_13245 ?auto_13246 ?auto_13243 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13255 - OBJ
      ?auto_13256 - OBJ
      ?auto_13257 - OBJ
      ?auto_13254 - LOCATION
    )
    :vars
    (
      ?auto_13260 - TRUCK
      ?auto_13259 - LOCATION
      ?auto_13258 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13256 ?auto_13260 ) ( TRUCK-AT ?auto_13260 ?auto_13259 ) ( IN-CITY ?auto_13259 ?auto_13258 ) ( IN-CITY ?auto_13254 ?auto_13258 ) ( not ( = ?auto_13254 ?auto_13259 ) ) ( OBJ-AT ?auto_13257 ?auto_13254 ) ( not ( = ?auto_13257 ?auto_13256 ) ) ( OBJ-AT ?auto_13255 ?auto_13254 ) ( not ( = ?auto_13255 ?auto_13256 ) ) ( not ( = ?auto_13255 ?auto_13257 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13257 ?auto_13256 ?auto_13254 )
      ( DELIVER-3PKG-VERIFY ?auto_13255 ?auto_13256 ?auto_13257 ?auto_13254 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13277 - OBJ
      ?auto_13278 - OBJ
      ?auto_13279 - OBJ
      ?auto_13276 - LOCATION
    )
    :vars
    (
      ?auto_13283 - TRUCK
      ?auto_13282 - LOCATION
      ?auto_13281 - CITY
      ?auto_13280 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13279 ?auto_13283 ) ( TRUCK-AT ?auto_13283 ?auto_13282 ) ( IN-CITY ?auto_13282 ?auto_13281 ) ( IN-CITY ?auto_13276 ?auto_13281 ) ( not ( = ?auto_13276 ?auto_13282 ) ) ( OBJ-AT ?auto_13280 ?auto_13276 ) ( not ( = ?auto_13280 ?auto_13279 ) ) ( OBJ-AT ?auto_13277 ?auto_13276 ) ( OBJ-AT ?auto_13278 ?auto_13276 ) ( not ( = ?auto_13277 ?auto_13278 ) ) ( not ( = ?auto_13277 ?auto_13279 ) ) ( not ( = ?auto_13277 ?auto_13280 ) ) ( not ( = ?auto_13278 ?auto_13279 ) ) ( not ( = ?auto_13278 ?auto_13280 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13280 ?auto_13279 ?auto_13276 )
      ( DELIVER-3PKG-VERIFY ?auto_13277 ?auto_13278 ?auto_13279 ?auto_13276 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13289 - OBJ
      ?auto_13290 - OBJ
      ?auto_13291 - OBJ
      ?auto_13288 - LOCATION
    )
    :vars
    (
      ?auto_13295 - TRUCK
      ?auto_13294 - LOCATION
      ?auto_13293 - CITY
      ?auto_13292 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13290 ?auto_13295 ) ( TRUCK-AT ?auto_13295 ?auto_13294 ) ( IN-CITY ?auto_13294 ?auto_13293 ) ( IN-CITY ?auto_13288 ?auto_13293 ) ( not ( = ?auto_13288 ?auto_13294 ) ) ( OBJ-AT ?auto_13292 ?auto_13288 ) ( not ( = ?auto_13292 ?auto_13290 ) ) ( OBJ-AT ?auto_13289 ?auto_13288 ) ( OBJ-AT ?auto_13291 ?auto_13288 ) ( not ( = ?auto_13289 ?auto_13290 ) ) ( not ( = ?auto_13289 ?auto_13291 ) ) ( not ( = ?auto_13289 ?auto_13292 ) ) ( not ( = ?auto_13290 ?auto_13291 ) ) ( not ( = ?auto_13291 ?auto_13292 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13292 ?auto_13290 ?auto_13288 )
      ( DELIVER-3PKG-VERIFY ?auto_13289 ?auto_13290 ?auto_13291 ?auto_13288 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13305 - OBJ
      ?auto_13306 - OBJ
      ?auto_13307 - OBJ
      ?auto_13304 - LOCATION
    )
    :vars
    (
      ?auto_13310 - TRUCK
      ?auto_13309 - LOCATION
      ?auto_13308 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13305 ?auto_13310 ) ( TRUCK-AT ?auto_13310 ?auto_13309 ) ( IN-CITY ?auto_13309 ?auto_13308 ) ( IN-CITY ?auto_13304 ?auto_13308 ) ( not ( = ?auto_13304 ?auto_13309 ) ) ( OBJ-AT ?auto_13306 ?auto_13304 ) ( not ( = ?auto_13306 ?auto_13305 ) ) ( OBJ-AT ?auto_13307 ?auto_13304 ) ( not ( = ?auto_13305 ?auto_13307 ) ) ( not ( = ?auto_13306 ?auto_13307 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13306 ?auto_13305 ?auto_13304 )
      ( DELIVER-3PKG-VERIFY ?auto_13305 ?auto_13306 ?auto_13307 ?auto_13304 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13327 - OBJ
      ?auto_13328 - OBJ
      ?auto_13329 - OBJ
      ?auto_13326 - LOCATION
    )
    :vars
    (
      ?auto_13333 - TRUCK
      ?auto_13332 - LOCATION
      ?auto_13331 - CITY
      ?auto_13330 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13327 ?auto_13333 ) ( TRUCK-AT ?auto_13333 ?auto_13332 ) ( IN-CITY ?auto_13332 ?auto_13331 ) ( IN-CITY ?auto_13326 ?auto_13331 ) ( not ( = ?auto_13326 ?auto_13332 ) ) ( OBJ-AT ?auto_13330 ?auto_13326 ) ( not ( = ?auto_13330 ?auto_13327 ) ) ( OBJ-AT ?auto_13328 ?auto_13326 ) ( OBJ-AT ?auto_13329 ?auto_13326 ) ( not ( = ?auto_13327 ?auto_13328 ) ) ( not ( = ?auto_13327 ?auto_13329 ) ) ( not ( = ?auto_13328 ?auto_13329 ) ) ( not ( = ?auto_13328 ?auto_13330 ) ) ( not ( = ?auto_13329 ?auto_13330 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13330 ?auto_13327 ?auto_13326 )
      ( DELIVER-3PKG-VERIFY ?auto_13327 ?auto_13328 ?auto_13329 ?auto_13326 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13397 - OBJ
      ?auto_13398 - OBJ
      ?auto_13399 - OBJ
      ?auto_13396 - LOCATION
    )
    :vars
    (
      ?auto_13401 - TRUCK
      ?auto_13400 - LOCATION
      ?auto_13402 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13401 ?auto_13400 ) ( IN-CITY ?auto_13400 ?auto_13402 ) ( IN-CITY ?auto_13396 ?auto_13402 ) ( not ( = ?auto_13396 ?auto_13400 ) ) ( OBJ-AT ?auto_13397 ?auto_13396 ) ( not ( = ?auto_13397 ?auto_13399 ) ) ( OBJ-AT ?auto_13399 ?auto_13400 ) ( OBJ-AT ?auto_13398 ?auto_13396 ) ( not ( = ?auto_13397 ?auto_13398 ) ) ( not ( = ?auto_13398 ?auto_13399 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13397 ?auto_13399 ?auto_13396 )
      ( DELIVER-3PKG-VERIFY ?auto_13397 ?auto_13398 ?auto_13399 ?auto_13396 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13430 - OBJ
      ?auto_13431 - OBJ
      ?auto_13432 - OBJ
      ?auto_13429 - LOCATION
    )
    :vars
    (
      ?auto_13434 - TRUCK
      ?auto_13433 - LOCATION
      ?auto_13435 - CITY
      ?auto_13436 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13434 ?auto_13433 ) ( IN-CITY ?auto_13433 ?auto_13435 ) ( IN-CITY ?auto_13429 ?auto_13435 ) ( not ( = ?auto_13429 ?auto_13433 ) ) ( OBJ-AT ?auto_13436 ?auto_13429 ) ( not ( = ?auto_13436 ?auto_13432 ) ) ( OBJ-AT ?auto_13432 ?auto_13433 ) ( OBJ-AT ?auto_13430 ?auto_13429 ) ( OBJ-AT ?auto_13431 ?auto_13429 ) ( not ( = ?auto_13430 ?auto_13431 ) ) ( not ( = ?auto_13430 ?auto_13432 ) ) ( not ( = ?auto_13430 ?auto_13436 ) ) ( not ( = ?auto_13431 ?auto_13432 ) ) ( not ( = ?auto_13431 ?auto_13436 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13436 ?auto_13432 ?auto_13429 )
      ( DELIVER-3PKG-VERIFY ?auto_13430 ?auto_13431 ?auto_13432 ?auto_13429 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13442 - OBJ
      ?auto_13443 - OBJ
      ?auto_13444 - OBJ
      ?auto_13441 - LOCATION
    )
    :vars
    (
      ?auto_13446 - TRUCK
      ?auto_13445 - LOCATION
      ?auto_13447 - CITY
      ?auto_13448 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13446 ?auto_13445 ) ( IN-CITY ?auto_13445 ?auto_13447 ) ( IN-CITY ?auto_13441 ?auto_13447 ) ( not ( = ?auto_13441 ?auto_13445 ) ) ( OBJ-AT ?auto_13448 ?auto_13441 ) ( not ( = ?auto_13448 ?auto_13443 ) ) ( OBJ-AT ?auto_13443 ?auto_13445 ) ( OBJ-AT ?auto_13442 ?auto_13441 ) ( OBJ-AT ?auto_13444 ?auto_13441 ) ( not ( = ?auto_13442 ?auto_13443 ) ) ( not ( = ?auto_13442 ?auto_13444 ) ) ( not ( = ?auto_13442 ?auto_13448 ) ) ( not ( = ?auto_13443 ?auto_13444 ) ) ( not ( = ?auto_13444 ?auto_13448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13448 ?auto_13443 ?auto_13441 )
      ( DELIVER-3PKG-VERIFY ?auto_13442 ?auto_13443 ?auto_13444 ?auto_13441 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13458 - OBJ
      ?auto_13459 - OBJ
      ?auto_13460 - OBJ
      ?auto_13457 - LOCATION
    )
    :vars
    (
      ?auto_13462 - TRUCK
      ?auto_13461 - LOCATION
      ?auto_13463 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13462 ?auto_13461 ) ( IN-CITY ?auto_13461 ?auto_13463 ) ( IN-CITY ?auto_13457 ?auto_13463 ) ( not ( = ?auto_13457 ?auto_13461 ) ) ( OBJ-AT ?auto_13459 ?auto_13457 ) ( not ( = ?auto_13459 ?auto_13458 ) ) ( OBJ-AT ?auto_13458 ?auto_13461 ) ( OBJ-AT ?auto_13460 ?auto_13457 ) ( not ( = ?auto_13458 ?auto_13460 ) ) ( not ( = ?auto_13459 ?auto_13460 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13459 ?auto_13458 ?auto_13457 )
      ( DELIVER-3PKG-VERIFY ?auto_13458 ?auto_13459 ?auto_13460 ?auto_13457 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13480 - OBJ
      ?auto_13481 - OBJ
      ?auto_13482 - OBJ
      ?auto_13479 - LOCATION
    )
    :vars
    (
      ?auto_13484 - TRUCK
      ?auto_13483 - LOCATION
      ?auto_13485 - CITY
      ?auto_13486 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13484 ?auto_13483 ) ( IN-CITY ?auto_13483 ?auto_13485 ) ( IN-CITY ?auto_13479 ?auto_13485 ) ( not ( = ?auto_13479 ?auto_13483 ) ) ( OBJ-AT ?auto_13486 ?auto_13479 ) ( not ( = ?auto_13486 ?auto_13480 ) ) ( OBJ-AT ?auto_13480 ?auto_13483 ) ( OBJ-AT ?auto_13481 ?auto_13479 ) ( OBJ-AT ?auto_13482 ?auto_13479 ) ( not ( = ?auto_13480 ?auto_13481 ) ) ( not ( = ?auto_13480 ?auto_13482 ) ) ( not ( = ?auto_13481 ?auto_13482 ) ) ( not ( = ?auto_13481 ?auto_13486 ) ) ( not ( = ?auto_13482 ?auto_13486 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13486 ?auto_13480 ?auto_13479 )
      ( DELIVER-3PKG-VERIFY ?auto_13480 ?auto_13481 ?auto_13482 ?auto_13479 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13550 - OBJ
      ?auto_13551 - OBJ
      ?auto_13552 - OBJ
      ?auto_13549 - LOCATION
    )
    :vars
    (
      ?auto_13553 - LOCATION
      ?auto_13554 - CITY
      ?auto_13555 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13553 ?auto_13554 ) ( IN-CITY ?auto_13549 ?auto_13554 ) ( not ( = ?auto_13549 ?auto_13553 ) ) ( OBJ-AT ?auto_13550 ?auto_13549 ) ( not ( = ?auto_13550 ?auto_13552 ) ) ( OBJ-AT ?auto_13552 ?auto_13553 ) ( TRUCK-AT ?auto_13555 ?auto_13549 ) ( OBJ-AT ?auto_13551 ?auto_13549 ) ( not ( = ?auto_13550 ?auto_13551 ) ) ( not ( = ?auto_13551 ?auto_13552 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13550 ?auto_13552 ?auto_13549 )
      ( DELIVER-3PKG-VERIFY ?auto_13550 ?auto_13551 ?auto_13552 ?auto_13549 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13583 - OBJ
      ?auto_13584 - OBJ
      ?auto_13585 - OBJ
      ?auto_13582 - LOCATION
    )
    :vars
    (
      ?auto_13586 - LOCATION
      ?auto_13587 - CITY
      ?auto_13589 - OBJ
      ?auto_13588 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13586 ?auto_13587 ) ( IN-CITY ?auto_13582 ?auto_13587 ) ( not ( = ?auto_13582 ?auto_13586 ) ) ( OBJ-AT ?auto_13589 ?auto_13582 ) ( not ( = ?auto_13589 ?auto_13585 ) ) ( OBJ-AT ?auto_13585 ?auto_13586 ) ( TRUCK-AT ?auto_13588 ?auto_13582 ) ( OBJ-AT ?auto_13583 ?auto_13582 ) ( OBJ-AT ?auto_13584 ?auto_13582 ) ( not ( = ?auto_13583 ?auto_13584 ) ) ( not ( = ?auto_13583 ?auto_13585 ) ) ( not ( = ?auto_13583 ?auto_13589 ) ) ( not ( = ?auto_13584 ?auto_13585 ) ) ( not ( = ?auto_13584 ?auto_13589 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13589 ?auto_13585 ?auto_13582 )
      ( DELIVER-3PKG-VERIFY ?auto_13583 ?auto_13584 ?auto_13585 ?auto_13582 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13595 - OBJ
      ?auto_13596 - OBJ
      ?auto_13597 - OBJ
      ?auto_13594 - LOCATION
    )
    :vars
    (
      ?auto_13598 - LOCATION
      ?auto_13599 - CITY
      ?auto_13601 - OBJ
      ?auto_13600 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13598 ?auto_13599 ) ( IN-CITY ?auto_13594 ?auto_13599 ) ( not ( = ?auto_13594 ?auto_13598 ) ) ( OBJ-AT ?auto_13601 ?auto_13594 ) ( not ( = ?auto_13601 ?auto_13596 ) ) ( OBJ-AT ?auto_13596 ?auto_13598 ) ( TRUCK-AT ?auto_13600 ?auto_13594 ) ( OBJ-AT ?auto_13595 ?auto_13594 ) ( OBJ-AT ?auto_13597 ?auto_13594 ) ( not ( = ?auto_13595 ?auto_13596 ) ) ( not ( = ?auto_13595 ?auto_13597 ) ) ( not ( = ?auto_13595 ?auto_13601 ) ) ( not ( = ?auto_13596 ?auto_13597 ) ) ( not ( = ?auto_13597 ?auto_13601 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13601 ?auto_13596 ?auto_13594 )
      ( DELIVER-3PKG-VERIFY ?auto_13595 ?auto_13596 ?auto_13597 ?auto_13594 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13611 - OBJ
      ?auto_13612 - OBJ
      ?auto_13613 - OBJ
      ?auto_13610 - LOCATION
    )
    :vars
    (
      ?auto_13614 - LOCATION
      ?auto_13615 - CITY
      ?auto_13616 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13614 ?auto_13615 ) ( IN-CITY ?auto_13610 ?auto_13615 ) ( not ( = ?auto_13610 ?auto_13614 ) ) ( OBJ-AT ?auto_13612 ?auto_13610 ) ( not ( = ?auto_13612 ?auto_13611 ) ) ( OBJ-AT ?auto_13611 ?auto_13614 ) ( TRUCK-AT ?auto_13616 ?auto_13610 ) ( OBJ-AT ?auto_13613 ?auto_13610 ) ( not ( = ?auto_13611 ?auto_13613 ) ) ( not ( = ?auto_13612 ?auto_13613 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13612 ?auto_13611 ?auto_13610 )
      ( DELIVER-3PKG-VERIFY ?auto_13611 ?auto_13612 ?auto_13613 ?auto_13610 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13633 - OBJ
      ?auto_13634 - OBJ
      ?auto_13635 - OBJ
      ?auto_13632 - LOCATION
    )
    :vars
    (
      ?auto_13636 - LOCATION
      ?auto_13637 - CITY
      ?auto_13639 - OBJ
      ?auto_13638 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13636 ?auto_13637 ) ( IN-CITY ?auto_13632 ?auto_13637 ) ( not ( = ?auto_13632 ?auto_13636 ) ) ( OBJ-AT ?auto_13639 ?auto_13632 ) ( not ( = ?auto_13639 ?auto_13633 ) ) ( OBJ-AT ?auto_13633 ?auto_13636 ) ( TRUCK-AT ?auto_13638 ?auto_13632 ) ( OBJ-AT ?auto_13634 ?auto_13632 ) ( OBJ-AT ?auto_13635 ?auto_13632 ) ( not ( = ?auto_13633 ?auto_13634 ) ) ( not ( = ?auto_13633 ?auto_13635 ) ) ( not ( = ?auto_13634 ?auto_13635 ) ) ( not ( = ?auto_13634 ?auto_13639 ) ) ( not ( = ?auto_13635 ?auto_13639 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13639 ?auto_13633 ?auto_13632 )
      ( DELIVER-3PKG-VERIFY ?auto_13633 ?auto_13634 ?auto_13635 ?auto_13632 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13715 - OBJ
      ?auto_13716 - OBJ
      ?auto_13717 - OBJ
      ?auto_13714 - LOCATION
    )
    :vars
    (
      ?auto_13719 - LOCATION
      ?auto_13720 - CITY
      ?auto_13718 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13719 ?auto_13720 ) ( IN-CITY ?auto_13714 ?auto_13720 ) ( not ( = ?auto_13714 ?auto_13719 ) ) ( OBJ-AT ?auto_13715 ?auto_13714 ) ( not ( = ?auto_13715 ?auto_13716 ) ) ( OBJ-AT ?auto_13716 ?auto_13719 ) ( TRUCK-AT ?auto_13718 ?auto_13714 ) ( OBJ-AT ?auto_13717 ?auto_13714 ) ( not ( = ?auto_13715 ?auto_13717 ) ) ( not ( = ?auto_13716 ?auto_13717 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13715 ?auto_13716 ?auto_13714 )
      ( DELIVER-3PKG-VERIFY ?auto_13715 ?auto_13716 ?auto_13717 ?auto_13714 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14053 - OBJ
      ?auto_14054 - OBJ
      ?auto_14055 - OBJ
      ?auto_14052 - LOCATION
    )
    :vars
    (
      ?auto_14056 - TRUCK
      ?auto_14058 - LOCATION
      ?auto_14057 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14056 ?auto_14058 ) ( IN-CITY ?auto_14058 ?auto_14057 ) ( IN-CITY ?auto_14052 ?auto_14057 ) ( not ( = ?auto_14052 ?auto_14058 ) ) ( OBJ-AT ?auto_14053 ?auto_14052 ) ( not ( = ?auto_14053 ?auto_14054 ) ) ( OBJ-AT ?auto_14054 ?auto_14058 ) ( OBJ-AT ?auto_14055 ?auto_14052 ) ( not ( = ?auto_14053 ?auto_14055 ) ) ( not ( = ?auto_14054 ?auto_14055 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14053 ?auto_14054 ?auto_14052 )
      ( DELIVER-3PKG-VERIFY ?auto_14053 ?auto_14054 ?auto_14055 ?auto_14052 ) )
  )

)

