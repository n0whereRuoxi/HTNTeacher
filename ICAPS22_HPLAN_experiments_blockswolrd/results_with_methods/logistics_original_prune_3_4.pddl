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
      ?auto_12290 - OBJ
      ?auto_12289 - LOCATION
    )
    :vars
    (
      ?auto_12291 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12291 ?auto_12289 ) ( IN-TRUCK ?auto_12290 ?auto_12291 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_12290 ?auto_12291 ?auto_12289 )
      ( DELIVER-1PKG-VERIFY ?auto_12290 ?auto_12289 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12302 - OBJ
      ?auto_12301 - LOCATION
    )
    :vars
    (
      ?auto_12303 - TRUCK
      ?auto_12304 - LOCATION
      ?auto_12305 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12302 ?auto_12303 ) ( TRUCK-AT ?auto_12303 ?auto_12304 ) ( IN-CITY ?auto_12304 ?auto_12305 ) ( IN-CITY ?auto_12301 ?auto_12305 ) ( not ( = ?auto_12301 ?auto_12304 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12303 ?auto_12304 ?auto_12301 ?auto_12305 )
      ( DELIVER-1PKG ?auto_12302 ?auto_12301 )
      ( DELIVER-1PKG-VERIFY ?auto_12302 ?auto_12301 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12320 - OBJ
      ?auto_12319 - LOCATION
    )
    :vars
    (
      ?auto_12321 - TRUCK
      ?auto_12323 - LOCATION
      ?auto_12322 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12321 ?auto_12323 ) ( IN-CITY ?auto_12323 ?auto_12322 ) ( IN-CITY ?auto_12319 ?auto_12322 ) ( not ( = ?auto_12319 ?auto_12323 ) ) ( OBJ-AT ?auto_12320 ?auto_12323 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12320 ?auto_12321 ?auto_12323 )
      ( DELIVER-1PKG ?auto_12320 ?auto_12319 )
      ( DELIVER-1PKG-VERIFY ?auto_12320 ?auto_12319 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12338 - OBJ
      ?auto_12337 - LOCATION
    )
    :vars
    (
      ?auto_12341 - LOCATION
      ?auto_12339 - CITY
      ?auto_12340 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12341 ?auto_12339 ) ( IN-CITY ?auto_12337 ?auto_12339 ) ( not ( = ?auto_12337 ?auto_12341 ) ) ( OBJ-AT ?auto_12338 ?auto_12341 ) ( TRUCK-AT ?auto_12340 ?auto_12337 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12340 ?auto_12337 ?auto_12341 ?auto_12339 )
      ( DELIVER-1PKG ?auto_12338 ?auto_12337 )
      ( DELIVER-1PKG-VERIFY ?auto_12338 ?auto_12337 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12398 - OBJ
      ?auto_12399 - OBJ
      ?auto_12397 - LOCATION
    )
    :vars
    (
      ?auto_12400 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12400 ?auto_12397 ) ( IN-TRUCK ?auto_12399 ?auto_12400 ) ( OBJ-AT ?auto_12398 ?auto_12397 ) ( not ( = ?auto_12398 ?auto_12399 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12399 ?auto_12397 )
      ( DELIVER-2PKG-VERIFY ?auto_12398 ?auto_12399 ?auto_12397 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12402 - OBJ
      ?auto_12403 - OBJ
      ?auto_12401 - LOCATION
    )
    :vars
    (
      ?auto_12404 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12404 ?auto_12401 ) ( IN-TRUCK ?auto_12402 ?auto_12404 ) ( OBJ-AT ?auto_12403 ?auto_12401 ) ( not ( = ?auto_12402 ?auto_12403 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12402 ?auto_12401 )
      ( DELIVER-2PKG-VERIFY ?auto_12402 ?auto_12403 ?auto_12401 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12410 - OBJ
      ?auto_12411 - OBJ
      ?auto_12412 - OBJ
      ?auto_12409 - LOCATION
    )
    :vars
    (
      ?auto_12413 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12413 ?auto_12409 ) ( IN-TRUCK ?auto_12412 ?auto_12413 ) ( OBJ-AT ?auto_12410 ?auto_12409 ) ( OBJ-AT ?auto_12411 ?auto_12409 ) ( not ( = ?auto_12410 ?auto_12411 ) ) ( not ( = ?auto_12410 ?auto_12412 ) ) ( not ( = ?auto_12411 ?auto_12412 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12412 ?auto_12409 )
      ( DELIVER-3PKG-VERIFY ?auto_12410 ?auto_12411 ?auto_12412 ?auto_12409 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12415 - OBJ
      ?auto_12416 - OBJ
      ?auto_12417 - OBJ
      ?auto_12414 - LOCATION
    )
    :vars
    (
      ?auto_12418 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12418 ?auto_12414 ) ( IN-TRUCK ?auto_12416 ?auto_12418 ) ( OBJ-AT ?auto_12415 ?auto_12414 ) ( OBJ-AT ?auto_12417 ?auto_12414 ) ( not ( = ?auto_12415 ?auto_12416 ) ) ( not ( = ?auto_12415 ?auto_12417 ) ) ( not ( = ?auto_12416 ?auto_12417 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12416 ?auto_12414 )
      ( DELIVER-3PKG-VERIFY ?auto_12415 ?auto_12416 ?auto_12417 ?auto_12414 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12425 - OBJ
      ?auto_12426 - OBJ
      ?auto_12427 - OBJ
      ?auto_12424 - LOCATION
    )
    :vars
    (
      ?auto_12428 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12428 ?auto_12424 ) ( IN-TRUCK ?auto_12425 ?auto_12428 ) ( OBJ-AT ?auto_12426 ?auto_12424 ) ( OBJ-AT ?auto_12427 ?auto_12424 ) ( not ( = ?auto_12425 ?auto_12426 ) ) ( not ( = ?auto_12425 ?auto_12427 ) ) ( not ( = ?auto_12426 ?auto_12427 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12425 ?auto_12424 )
      ( DELIVER-3PKG-VERIFY ?auto_12425 ?auto_12426 ?auto_12427 ?auto_12424 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12450 - OBJ
      ?auto_12451 - OBJ
      ?auto_12449 - LOCATION
    )
    :vars
    (
      ?auto_12452 - TRUCK
      ?auto_12454 - LOCATION
      ?auto_12453 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12451 ?auto_12452 ) ( TRUCK-AT ?auto_12452 ?auto_12454 ) ( IN-CITY ?auto_12454 ?auto_12453 ) ( IN-CITY ?auto_12449 ?auto_12453 ) ( not ( = ?auto_12449 ?auto_12454 ) ) ( OBJ-AT ?auto_12450 ?auto_12449 ) ( not ( = ?auto_12450 ?auto_12451 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12451 ?auto_12449 )
      ( DELIVER-2PKG-VERIFY ?auto_12450 ?auto_12451 ?auto_12449 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12456 - OBJ
      ?auto_12457 - OBJ
      ?auto_12455 - LOCATION
    )
    :vars
    (
      ?auto_12459 - TRUCK
      ?auto_12460 - LOCATION
      ?auto_12458 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12456 ?auto_12459 ) ( TRUCK-AT ?auto_12459 ?auto_12460 ) ( IN-CITY ?auto_12460 ?auto_12458 ) ( IN-CITY ?auto_12455 ?auto_12458 ) ( not ( = ?auto_12455 ?auto_12460 ) ) ( OBJ-AT ?auto_12457 ?auto_12455 ) ( not ( = ?auto_12457 ?auto_12456 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12457 ?auto_12456 ?auto_12455 )
      ( DELIVER-2PKG-VERIFY ?auto_12456 ?auto_12457 ?auto_12455 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12469 - OBJ
      ?auto_12470 - OBJ
      ?auto_12471 - OBJ
      ?auto_12468 - LOCATION
    )
    :vars
    (
      ?auto_12473 - TRUCK
      ?auto_12474 - LOCATION
      ?auto_12472 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12471 ?auto_12473 ) ( TRUCK-AT ?auto_12473 ?auto_12474 ) ( IN-CITY ?auto_12474 ?auto_12472 ) ( IN-CITY ?auto_12468 ?auto_12472 ) ( not ( = ?auto_12468 ?auto_12474 ) ) ( OBJ-AT ?auto_12469 ?auto_12468 ) ( not ( = ?auto_12469 ?auto_12471 ) ) ( OBJ-AT ?auto_12470 ?auto_12468 ) ( not ( = ?auto_12469 ?auto_12470 ) ) ( not ( = ?auto_12470 ?auto_12471 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12469 ?auto_12471 ?auto_12468 )
      ( DELIVER-3PKG-VERIFY ?auto_12469 ?auto_12470 ?auto_12471 ?auto_12468 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12476 - OBJ
      ?auto_12477 - OBJ
      ?auto_12478 - OBJ
      ?auto_12475 - LOCATION
    )
    :vars
    (
      ?auto_12480 - TRUCK
      ?auto_12481 - LOCATION
      ?auto_12479 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12477 ?auto_12480 ) ( TRUCK-AT ?auto_12480 ?auto_12481 ) ( IN-CITY ?auto_12481 ?auto_12479 ) ( IN-CITY ?auto_12475 ?auto_12479 ) ( not ( = ?auto_12475 ?auto_12481 ) ) ( OBJ-AT ?auto_12478 ?auto_12475 ) ( not ( = ?auto_12478 ?auto_12477 ) ) ( OBJ-AT ?auto_12476 ?auto_12475 ) ( not ( = ?auto_12476 ?auto_12477 ) ) ( not ( = ?auto_12476 ?auto_12478 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12478 ?auto_12477 ?auto_12475 )
      ( DELIVER-3PKG-VERIFY ?auto_12476 ?auto_12477 ?auto_12478 ?auto_12475 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12490 - OBJ
      ?auto_12491 - OBJ
      ?auto_12492 - OBJ
      ?auto_12489 - LOCATION
    )
    :vars
    (
      ?auto_12494 - TRUCK
      ?auto_12495 - LOCATION
      ?auto_12493 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12490 ?auto_12494 ) ( TRUCK-AT ?auto_12494 ?auto_12495 ) ( IN-CITY ?auto_12495 ?auto_12493 ) ( IN-CITY ?auto_12489 ?auto_12493 ) ( not ( = ?auto_12489 ?auto_12495 ) ) ( OBJ-AT ?auto_12491 ?auto_12489 ) ( not ( = ?auto_12491 ?auto_12490 ) ) ( OBJ-AT ?auto_12492 ?auto_12489 ) ( not ( = ?auto_12490 ?auto_12492 ) ) ( not ( = ?auto_12491 ?auto_12492 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12491 ?auto_12490 ?auto_12489 )
      ( DELIVER-3PKG-VERIFY ?auto_12490 ?auto_12491 ?auto_12492 ?auto_12489 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12519 - OBJ
      ?auto_12518 - LOCATION
    )
    :vars
    (
      ?auto_12522 - TRUCK
      ?auto_12523 - LOCATION
      ?auto_12520 - CITY
      ?auto_12521 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12522 ?auto_12523 ) ( IN-CITY ?auto_12523 ?auto_12520 ) ( IN-CITY ?auto_12518 ?auto_12520 ) ( not ( = ?auto_12518 ?auto_12523 ) ) ( OBJ-AT ?auto_12521 ?auto_12518 ) ( not ( = ?auto_12521 ?auto_12519 ) ) ( OBJ-AT ?auto_12519 ?auto_12523 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12519 ?auto_12522 ?auto_12523 )
      ( DELIVER-2PKG ?auto_12521 ?auto_12519 ?auto_12518 )
      ( DELIVER-1PKG-VERIFY ?auto_12519 ?auto_12518 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12525 - OBJ
      ?auto_12526 - OBJ
      ?auto_12524 - LOCATION
    )
    :vars
    (
      ?auto_12528 - TRUCK
      ?auto_12529 - LOCATION
      ?auto_12527 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12528 ?auto_12529 ) ( IN-CITY ?auto_12529 ?auto_12527 ) ( IN-CITY ?auto_12524 ?auto_12527 ) ( not ( = ?auto_12524 ?auto_12529 ) ) ( OBJ-AT ?auto_12525 ?auto_12524 ) ( not ( = ?auto_12525 ?auto_12526 ) ) ( OBJ-AT ?auto_12526 ?auto_12529 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12526 ?auto_12524 )
      ( DELIVER-2PKG-VERIFY ?auto_12525 ?auto_12526 ?auto_12524 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12531 - OBJ
      ?auto_12532 - OBJ
      ?auto_12530 - LOCATION
    )
    :vars
    (
      ?auto_12535 - TRUCK
      ?auto_12533 - LOCATION
      ?auto_12534 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12535 ?auto_12533 ) ( IN-CITY ?auto_12533 ?auto_12534 ) ( IN-CITY ?auto_12530 ?auto_12534 ) ( not ( = ?auto_12530 ?auto_12533 ) ) ( OBJ-AT ?auto_12532 ?auto_12530 ) ( not ( = ?auto_12532 ?auto_12531 ) ) ( OBJ-AT ?auto_12531 ?auto_12533 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12532 ?auto_12531 ?auto_12530 )
      ( DELIVER-2PKG-VERIFY ?auto_12531 ?auto_12532 ?auto_12530 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12544 - OBJ
      ?auto_12545 - OBJ
      ?auto_12546 - OBJ
      ?auto_12543 - LOCATION
    )
    :vars
    (
      ?auto_12549 - TRUCK
      ?auto_12547 - LOCATION
      ?auto_12548 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12549 ?auto_12547 ) ( IN-CITY ?auto_12547 ?auto_12548 ) ( IN-CITY ?auto_12543 ?auto_12548 ) ( not ( = ?auto_12543 ?auto_12547 ) ) ( OBJ-AT ?auto_12544 ?auto_12543 ) ( not ( = ?auto_12544 ?auto_12546 ) ) ( OBJ-AT ?auto_12546 ?auto_12547 ) ( OBJ-AT ?auto_12545 ?auto_12543 ) ( not ( = ?auto_12544 ?auto_12545 ) ) ( not ( = ?auto_12545 ?auto_12546 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12544 ?auto_12546 ?auto_12543 )
      ( DELIVER-3PKG-VERIFY ?auto_12544 ?auto_12545 ?auto_12546 ?auto_12543 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12551 - OBJ
      ?auto_12552 - OBJ
      ?auto_12553 - OBJ
      ?auto_12550 - LOCATION
    )
    :vars
    (
      ?auto_12556 - TRUCK
      ?auto_12554 - LOCATION
      ?auto_12555 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12556 ?auto_12554 ) ( IN-CITY ?auto_12554 ?auto_12555 ) ( IN-CITY ?auto_12550 ?auto_12555 ) ( not ( = ?auto_12550 ?auto_12554 ) ) ( OBJ-AT ?auto_12551 ?auto_12550 ) ( not ( = ?auto_12551 ?auto_12552 ) ) ( OBJ-AT ?auto_12552 ?auto_12554 ) ( OBJ-AT ?auto_12553 ?auto_12550 ) ( not ( = ?auto_12551 ?auto_12553 ) ) ( not ( = ?auto_12552 ?auto_12553 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12551 ?auto_12552 ?auto_12550 )
      ( DELIVER-3PKG-VERIFY ?auto_12551 ?auto_12552 ?auto_12553 ?auto_12550 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12565 - OBJ
      ?auto_12566 - OBJ
      ?auto_12567 - OBJ
      ?auto_12564 - LOCATION
    )
    :vars
    (
      ?auto_12570 - TRUCK
      ?auto_12568 - LOCATION
      ?auto_12569 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12570 ?auto_12568 ) ( IN-CITY ?auto_12568 ?auto_12569 ) ( IN-CITY ?auto_12564 ?auto_12569 ) ( not ( = ?auto_12564 ?auto_12568 ) ) ( OBJ-AT ?auto_12566 ?auto_12564 ) ( not ( = ?auto_12566 ?auto_12565 ) ) ( OBJ-AT ?auto_12565 ?auto_12568 ) ( OBJ-AT ?auto_12567 ?auto_12564 ) ( not ( = ?auto_12565 ?auto_12567 ) ) ( not ( = ?auto_12566 ?auto_12567 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12566 ?auto_12565 ?auto_12564 )
      ( DELIVER-3PKG-VERIFY ?auto_12565 ?auto_12566 ?auto_12567 ?auto_12564 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12594 - OBJ
      ?auto_12593 - LOCATION
    )
    :vars
    (
      ?auto_12595 - LOCATION
      ?auto_12596 - CITY
      ?auto_12598 - OBJ
      ?auto_12597 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12595 ?auto_12596 ) ( IN-CITY ?auto_12593 ?auto_12596 ) ( not ( = ?auto_12593 ?auto_12595 ) ) ( OBJ-AT ?auto_12598 ?auto_12593 ) ( not ( = ?auto_12598 ?auto_12594 ) ) ( OBJ-AT ?auto_12594 ?auto_12595 ) ( TRUCK-AT ?auto_12597 ?auto_12593 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12597 ?auto_12593 ?auto_12595 ?auto_12596 )
      ( DELIVER-2PKG ?auto_12598 ?auto_12594 ?auto_12593 )
      ( DELIVER-1PKG-VERIFY ?auto_12594 ?auto_12593 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12600 - OBJ
      ?auto_12601 - OBJ
      ?auto_12599 - LOCATION
    )
    :vars
    (
      ?auto_12602 - LOCATION
      ?auto_12604 - CITY
      ?auto_12603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12602 ?auto_12604 ) ( IN-CITY ?auto_12599 ?auto_12604 ) ( not ( = ?auto_12599 ?auto_12602 ) ) ( OBJ-AT ?auto_12600 ?auto_12599 ) ( not ( = ?auto_12600 ?auto_12601 ) ) ( OBJ-AT ?auto_12601 ?auto_12602 ) ( TRUCK-AT ?auto_12603 ?auto_12599 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12601 ?auto_12599 )
      ( DELIVER-2PKG-VERIFY ?auto_12600 ?auto_12601 ?auto_12599 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12606 - OBJ
      ?auto_12607 - OBJ
      ?auto_12605 - LOCATION
    )
    :vars
    (
      ?auto_12610 - LOCATION
      ?auto_12609 - CITY
      ?auto_12608 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12610 ?auto_12609 ) ( IN-CITY ?auto_12605 ?auto_12609 ) ( not ( = ?auto_12605 ?auto_12610 ) ) ( OBJ-AT ?auto_12607 ?auto_12605 ) ( not ( = ?auto_12607 ?auto_12606 ) ) ( OBJ-AT ?auto_12606 ?auto_12610 ) ( TRUCK-AT ?auto_12608 ?auto_12605 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12607 ?auto_12606 ?auto_12605 )
      ( DELIVER-2PKG-VERIFY ?auto_12606 ?auto_12607 ?auto_12605 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12619 - OBJ
      ?auto_12620 - OBJ
      ?auto_12621 - OBJ
      ?auto_12618 - LOCATION
    )
    :vars
    (
      ?auto_12624 - LOCATION
      ?auto_12623 - CITY
      ?auto_12622 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12624 ?auto_12623 ) ( IN-CITY ?auto_12618 ?auto_12623 ) ( not ( = ?auto_12618 ?auto_12624 ) ) ( OBJ-AT ?auto_12619 ?auto_12618 ) ( not ( = ?auto_12619 ?auto_12621 ) ) ( OBJ-AT ?auto_12621 ?auto_12624 ) ( TRUCK-AT ?auto_12622 ?auto_12618 ) ( OBJ-AT ?auto_12620 ?auto_12618 ) ( not ( = ?auto_12619 ?auto_12620 ) ) ( not ( = ?auto_12620 ?auto_12621 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12619 ?auto_12621 ?auto_12618 )
      ( DELIVER-3PKG-VERIFY ?auto_12619 ?auto_12620 ?auto_12621 ?auto_12618 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12626 - OBJ
      ?auto_12627 - OBJ
      ?auto_12628 - OBJ
      ?auto_12625 - LOCATION
    )
    :vars
    (
      ?auto_12631 - LOCATION
      ?auto_12630 - CITY
      ?auto_12629 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12631 ?auto_12630 ) ( IN-CITY ?auto_12625 ?auto_12630 ) ( not ( = ?auto_12625 ?auto_12631 ) ) ( OBJ-AT ?auto_12628 ?auto_12625 ) ( not ( = ?auto_12628 ?auto_12627 ) ) ( OBJ-AT ?auto_12627 ?auto_12631 ) ( TRUCK-AT ?auto_12629 ?auto_12625 ) ( OBJ-AT ?auto_12626 ?auto_12625 ) ( not ( = ?auto_12626 ?auto_12627 ) ) ( not ( = ?auto_12626 ?auto_12628 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12628 ?auto_12627 ?auto_12625 )
      ( DELIVER-3PKG-VERIFY ?auto_12626 ?auto_12627 ?auto_12628 ?auto_12625 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12640 - OBJ
      ?auto_12641 - OBJ
      ?auto_12642 - OBJ
      ?auto_12639 - LOCATION
    )
    :vars
    (
      ?auto_12645 - LOCATION
      ?auto_12644 - CITY
      ?auto_12643 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12645 ?auto_12644 ) ( IN-CITY ?auto_12639 ?auto_12644 ) ( not ( = ?auto_12639 ?auto_12645 ) ) ( OBJ-AT ?auto_12642 ?auto_12639 ) ( not ( = ?auto_12642 ?auto_12640 ) ) ( OBJ-AT ?auto_12640 ?auto_12645 ) ( TRUCK-AT ?auto_12643 ?auto_12639 ) ( OBJ-AT ?auto_12641 ?auto_12639 ) ( not ( = ?auto_12640 ?auto_12641 ) ) ( not ( = ?auto_12641 ?auto_12642 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12642 ?auto_12640 ?auto_12639 )
      ( DELIVER-3PKG-VERIFY ?auto_12640 ?auto_12641 ?auto_12642 ?auto_12639 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12669 - OBJ
      ?auto_12668 - LOCATION
    )
    :vars
    (
      ?auto_12673 - LOCATION
      ?auto_12671 - CITY
      ?auto_12672 - OBJ
      ?auto_12670 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12673 ?auto_12671 ) ( IN-CITY ?auto_12668 ?auto_12671 ) ( not ( = ?auto_12668 ?auto_12673 ) ) ( not ( = ?auto_12672 ?auto_12669 ) ) ( OBJ-AT ?auto_12669 ?auto_12673 ) ( TRUCK-AT ?auto_12670 ?auto_12668 ) ( IN-TRUCK ?auto_12672 ?auto_12670 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12672 ?auto_12668 )
      ( DELIVER-2PKG ?auto_12672 ?auto_12669 ?auto_12668 )
      ( DELIVER-1PKG-VERIFY ?auto_12669 ?auto_12668 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12675 - OBJ
      ?auto_12676 - OBJ
      ?auto_12674 - LOCATION
    )
    :vars
    (
      ?auto_12677 - LOCATION
      ?auto_12678 - CITY
      ?auto_12679 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12677 ?auto_12678 ) ( IN-CITY ?auto_12674 ?auto_12678 ) ( not ( = ?auto_12674 ?auto_12677 ) ) ( not ( = ?auto_12675 ?auto_12676 ) ) ( OBJ-AT ?auto_12676 ?auto_12677 ) ( TRUCK-AT ?auto_12679 ?auto_12674 ) ( IN-TRUCK ?auto_12675 ?auto_12679 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12676 ?auto_12674 )
      ( DELIVER-2PKG-VERIFY ?auto_12675 ?auto_12676 ?auto_12674 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12681 - OBJ
      ?auto_12682 - OBJ
      ?auto_12680 - LOCATION
    )
    :vars
    (
      ?auto_12685 - LOCATION
      ?auto_12683 - CITY
      ?auto_12684 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12685 ?auto_12683 ) ( IN-CITY ?auto_12680 ?auto_12683 ) ( not ( = ?auto_12680 ?auto_12685 ) ) ( not ( = ?auto_12682 ?auto_12681 ) ) ( OBJ-AT ?auto_12681 ?auto_12685 ) ( TRUCK-AT ?auto_12684 ?auto_12680 ) ( IN-TRUCK ?auto_12682 ?auto_12684 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12682 ?auto_12681 ?auto_12680 )
      ( DELIVER-2PKG-VERIFY ?auto_12681 ?auto_12682 ?auto_12680 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12744 - OBJ
      ?auto_12743 - LOCATION
    )
    :vars
    (
      ?auto_12747 - LOCATION
      ?auto_12745 - CITY
      ?auto_12748 - OBJ
      ?auto_12746 - TRUCK
      ?auto_12749 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12747 ?auto_12745 ) ( IN-CITY ?auto_12743 ?auto_12745 ) ( not ( = ?auto_12743 ?auto_12747 ) ) ( not ( = ?auto_12748 ?auto_12744 ) ) ( OBJ-AT ?auto_12744 ?auto_12747 ) ( IN-TRUCK ?auto_12748 ?auto_12746 ) ( TRUCK-AT ?auto_12746 ?auto_12749 ) ( IN-CITY ?auto_12749 ?auto_12745 ) ( not ( = ?auto_12743 ?auto_12749 ) ) ( not ( = ?auto_12747 ?auto_12749 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12746 ?auto_12749 ?auto_12743 ?auto_12745 )
      ( DELIVER-2PKG ?auto_12748 ?auto_12744 ?auto_12743 )
      ( DELIVER-1PKG-VERIFY ?auto_12744 ?auto_12743 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12751 - OBJ
      ?auto_12752 - OBJ
      ?auto_12750 - LOCATION
    )
    :vars
    (
      ?auto_12755 - LOCATION
      ?auto_12756 - CITY
      ?auto_12753 - TRUCK
      ?auto_12754 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12755 ?auto_12756 ) ( IN-CITY ?auto_12750 ?auto_12756 ) ( not ( = ?auto_12750 ?auto_12755 ) ) ( not ( = ?auto_12751 ?auto_12752 ) ) ( OBJ-AT ?auto_12752 ?auto_12755 ) ( IN-TRUCK ?auto_12751 ?auto_12753 ) ( TRUCK-AT ?auto_12753 ?auto_12754 ) ( IN-CITY ?auto_12754 ?auto_12756 ) ( not ( = ?auto_12750 ?auto_12754 ) ) ( not ( = ?auto_12755 ?auto_12754 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12752 ?auto_12750 )
      ( DELIVER-2PKG-VERIFY ?auto_12751 ?auto_12752 ?auto_12750 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12758 - OBJ
      ?auto_12759 - OBJ
      ?auto_12757 - LOCATION
    )
    :vars
    (
      ?auto_12761 - LOCATION
      ?auto_12762 - CITY
      ?auto_12763 - TRUCK
      ?auto_12760 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12761 ?auto_12762 ) ( IN-CITY ?auto_12757 ?auto_12762 ) ( not ( = ?auto_12757 ?auto_12761 ) ) ( not ( = ?auto_12759 ?auto_12758 ) ) ( OBJ-AT ?auto_12758 ?auto_12761 ) ( IN-TRUCK ?auto_12759 ?auto_12763 ) ( TRUCK-AT ?auto_12763 ?auto_12760 ) ( IN-CITY ?auto_12760 ?auto_12762 ) ( not ( = ?auto_12757 ?auto_12760 ) ) ( not ( = ?auto_12761 ?auto_12760 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12759 ?auto_12758 ?auto_12757 )
      ( DELIVER-2PKG-VERIFY ?auto_12758 ?auto_12759 ?auto_12757 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12830 - OBJ
      ?auto_12829 - LOCATION
    )
    :vars
    (
      ?auto_12832 - LOCATION
      ?auto_12834 - CITY
      ?auto_12833 - OBJ
      ?auto_12835 - TRUCK
      ?auto_12831 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12832 ?auto_12834 ) ( IN-CITY ?auto_12829 ?auto_12834 ) ( not ( = ?auto_12829 ?auto_12832 ) ) ( not ( = ?auto_12833 ?auto_12830 ) ) ( OBJ-AT ?auto_12830 ?auto_12832 ) ( TRUCK-AT ?auto_12835 ?auto_12831 ) ( IN-CITY ?auto_12831 ?auto_12834 ) ( not ( = ?auto_12829 ?auto_12831 ) ) ( not ( = ?auto_12832 ?auto_12831 ) ) ( OBJ-AT ?auto_12833 ?auto_12831 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12833 ?auto_12835 ?auto_12831 )
      ( DELIVER-2PKG ?auto_12833 ?auto_12830 ?auto_12829 )
      ( DELIVER-1PKG-VERIFY ?auto_12830 ?auto_12829 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12837 - OBJ
      ?auto_12838 - OBJ
      ?auto_12836 - LOCATION
    )
    :vars
    (
      ?auto_12842 - LOCATION
      ?auto_12841 - CITY
      ?auto_12839 - TRUCK
      ?auto_12840 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12842 ?auto_12841 ) ( IN-CITY ?auto_12836 ?auto_12841 ) ( not ( = ?auto_12836 ?auto_12842 ) ) ( not ( = ?auto_12837 ?auto_12838 ) ) ( OBJ-AT ?auto_12838 ?auto_12842 ) ( TRUCK-AT ?auto_12839 ?auto_12840 ) ( IN-CITY ?auto_12840 ?auto_12841 ) ( not ( = ?auto_12836 ?auto_12840 ) ) ( not ( = ?auto_12842 ?auto_12840 ) ) ( OBJ-AT ?auto_12837 ?auto_12840 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12838 ?auto_12836 )
      ( DELIVER-2PKG-VERIFY ?auto_12837 ?auto_12838 ?auto_12836 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12844 - OBJ
      ?auto_12845 - OBJ
      ?auto_12843 - LOCATION
    )
    :vars
    (
      ?auto_12849 - LOCATION
      ?auto_12847 - CITY
      ?auto_12846 - TRUCK
      ?auto_12848 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12849 ?auto_12847 ) ( IN-CITY ?auto_12843 ?auto_12847 ) ( not ( = ?auto_12843 ?auto_12849 ) ) ( not ( = ?auto_12845 ?auto_12844 ) ) ( OBJ-AT ?auto_12844 ?auto_12849 ) ( TRUCK-AT ?auto_12846 ?auto_12848 ) ( IN-CITY ?auto_12848 ?auto_12847 ) ( not ( = ?auto_12843 ?auto_12848 ) ) ( not ( = ?auto_12849 ?auto_12848 ) ) ( OBJ-AT ?auto_12845 ?auto_12848 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12845 ?auto_12844 ?auto_12843 )
      ( DELIVER-2PKG-VERIFY ?auto_12844 ?auto_12845 ?auto_12843 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13218 - OBJ
      ?auto_13219 - OBJ
      ?auto_13220 - OBJ
      ?auto_13217 - LOCATION
    )
    :vars
    (
      ?auto_13223 - TRUCK
      ?auto_13222 - LOCATION
      ?auto_13221 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13220 ?auto_13223 ) ( TRUCK-AT ?auto_13223 ?auto_13222 ) ( IN-CITY ?auto_13222 ?auto_13221 ) ( IN-CITY ?auto_13217 ?auto_13221 ) ( not ( = ?auto_13217 ?auto_13222 ) ) ( OBJ-AT ?auto_13219 ?auto_13217 ) ( not ( = ?auto_13219 ?auto_13220 ) ) ( OBJ-AT ?auto_13218 ?auto_13217 ) ( not ( = ?auto_13218 ?auto_13219 ) ) ( not ( = ?auto_13218 ?auto_13220 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13219 ?auto_13220 ?auto_13217 )
      ( DELIVER-3PKG-VERIFY ?auto_13218 ?auto_13219 ?auto_13220 ?auto_13217 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13251 - OBJ
      ?auto_13252 - OBJ
      ?auto_13253 - OBJ
      ?auto_13250 - LOCATION
    )
    :vars
    (
      ?auto_13257 - TRUCK
      ?auto_13256 - LOCATION
      ?auto_13255 - CITY
      ?auto_13254 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13253 ?auto_13257 ) ( TRUCK-AT ?auto_13257 ?auto_13256 ) ( IN-CITY ?auto_13256 ?auto_13255 ) ( IN-CITY ?auto_13250 ?auto_13255 ) ( not ( = ?auto_13250 ?auto_13256 ) ) ( OBJ-AT ?auto_13254 ?auto_13250 ) ( not ( = ?auto_13254 ?auto_13253 ) ) ( OBJ-AT ?auto_13251 ?auto_13250 ) ( OBJ-AT ?auto_13252 ?auto_13250 ) ( not ( = ?auto_13251 ?auto_13252 ) ) ( not ( = ?auto_13251 ?auto_13253 ) ) ( not ( = ?auto_13251 ?auto_13254 ) ) ( not ( = ?auto_13252 ?auto_13253 ) ) ( not ( = ?auto_13252 ?auto_13254 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13254 ?auto_13253 ?auto_13250 )
      ( DELIVER-3PKG-VERIFY ?auto_13251 ?auto_13252 ?auto_13253 ?auto_13250 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13263 - OBJ
      ?auto_13264 - OBJ
      ?auto_13265 - OBJ
      ?auto_13262 - LOCATION
    )
    :vars
    (
      ?auto_13269 - TRUCK
      ?auto_13268 - LOCATION
      ?auto_13267 - CITY
      ?auto_13266 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13264 ?auto_13269 ) ( TRUCK-AT ?auto_13269 ?auto_13268 ) ( IN-CITY ?auto_13268 ?auto_13267 ) ( IN-CITY ?auto_13262 ?auto_13267 ) ( not ( = ?auto_13262 ?auto_13268 ) ) ( OBJ-AT ?auto_13266 ?auto_13262 ) ( not ( = ?auto_13266 ?auto_13264 ) ) ( OBJ-AT ?auto_13263 ?auto_13262 ) ( OBJ-AT ?auto_13265 ?auto_13262 ) ( not ( = ?auto_13263 ?auto_13264 ) ) ( not ( = ?auto_13263 ?auto_13265 ) ) ( not ( = ?auto_13263 ?auto_13266 ) ) ( not ( = ?auto_13264 ?auto_13265 ) ) ( not ( = ?auto_13265 ?auto_13266 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13266 ?auto_13264 ?auto_13262 )
      ( DELIVER-3PKG-VERIFY ?auto_13263 ?auto_13264 ?auto_13265 ?auto_13262 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13301 - OBJ
      ?auto_13302 - OBJ
      ?auto_13303 - OBJ
      ?auto_13300 - LOCATION
    )
    :vars
    (
      ?auto_13307 - TRUCK
      ?auto_13306 - LOCATION
      ?auto_13305 - CITY
      ?auto_13304 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13301 ?auto_13307 ) ( TRUCK-AT ?auto_13307 ?auto_13306 ) ( IN-CITY ?auto_13306 ?auto_13305 ) ( IN-CITY ?auto_13300 ?auto_13305 ) ( not ( = ?auto_13300 ?auto_13306 ) ) ( OBJ-AT ?auto_13304 ?auto_13300 ) ( not ( = ?auto_13304 ?auto_13301 ) ) ( OBJ-AT ?auto_13302 ?auto_13300 ) ( OBJ-AT ?auto_13303 ?auto_13300 ) ( not ( = ?auto_13301 ?auto_13302 ) ) ( not ( = ?auto_13301 ?auto_13303 ) ) ( not ( = ?auto_13302 ?auto_13303 ) ) ( not ( = ?auto_13302 ?auto_13304 ) ) ( not ( = ?auto_13303 ?auto_13304 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13304 ?auto_13301 ?auto_13300 )
      ( DELIVER-3PKG-VERIFY ?auto_13301 ?auto_13302 ?auto_13303 ?auto_13300 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13404 - OBJ
      ?auto_13405 - OBJ
      ?auto_13406 - OBJ
      ?auto_13403 - LOCATION
    )
    :vars
    (
      ?auto_13409 - TRUCK
      ?auto_13407 - LOCATION
      ?auto_13408 - CITY
      ?auto_13410 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13409 ?auto_13407 ) ( IN-CITY ?auto_13407 ?auto_13408 ) ( IN-CITY ?auto_13403 ?auto_13408 ) ( not ( = ?auto_13403 ?auto_13407 ) ) ( OBJ-AT ?auto_13410 ?auto_13403 ) ( not ( = ?auto_13410 ?auto_13406 ) ) ( OBJ-AT ?auto_13406 ?auto_13407 ) ( OBJ-AT ?auto_13404 ?auto_13403 ) ( OBJ-AT ?auto_13405 ?auto_13403 ) ( not ( = ?auto_13404 ?auto_13405 ) ) ( not ( = ?auto_13404 ?auto_13406 ) ) ( not ( = ?auto_13404 ?auto_13410 ) ) ( not ( = ?auto_13405 ?auto_13406 ) ) ( not ( = ?auto_13405 ?auto_13410 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13410 ?auto_13406 ?auto_13403 )
      ( DELIVER-3PKG-VERIFY ?auto_13404 ?auto_13405 ?auto_13406 ?auto_13403 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13416 - OBJ
      ?auto_13417 - OBJ
      ?auto_13418 - OBJ
      ?auto_13415 - LOCATION
    )
    :vars
    (
      ?auto_13421 - TRUCK
      ?auto_13419 - LOCATION
      ?auto_13420 - CITY
      ?auto_13422 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13421 ?auto_13419 ) ( IN-CITY ?auto_13419 ?auto_13420 ) ( IN-CITY ?auto_13415 ?auto_13420 ) ( not ( = ?auto_13415 ?auto_13419 ) ) ( OBJ-AT ?auto_13422 ?auto_13415 ) ( not ( = ?auto_13422 ?auto_13417 ) ) ( OBJ-AT ?auto_13417 ?auto_13419 ) ( OBJ-AT ?auto_13416 ?auto_13415 ) ( OBJ-AT ?auto_13418 ?auto_13415 ) ( not ( = ?auto_13416 ?auto_13417 ) ) ( not ( = ?auto_13416 ?auto_13418 ) ) ( not ( = ?auto_13416 ?auto_13422 ) ) ( not ( = ?auto_13417 ?auto_13418 ) ) ( not ( = ?auto_13418 ?auto_13422 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13422 ?auto_13417 ?auto_13415 )
      ( DELIVER-3PKG-VERIFY ?auto_13416 ?auto_13417 ?auto_13418 ?auto_13415 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13454 - OBJ
      ?auto_13455 - OBJ
      ?auto_13456 - OBJ
      ?auto_13453 - LOCATION
    )
    :vars
    (
      ?auto_13459 - TRUCK
      ?auto_13457 - LOCATION
      ?auto_13458 - CITY
      ?auto_13460 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13459 ?auto_13457 ) ( IN-CITY ?auto_13457 ?auto_13458 ) ( IN-CITY ?auto_13453 ?auto_13458 ) ( not ( = ?auto_13453 ?auto_13457 ) ) ( OBJ-AT ?auto_13460 ?auto_13453 ) ( not ( = ?auto_13460 ?auto_13454 ) ) ( OBJ-AT ?auto_13454 ?auto_13457 ) ( OBJ-AT ?auto_13455 ?auto_13453 ) ( OBJ-AT ?auto_13456 ?auto_13453 ) ( not ( = ?auto_13454 ?auto_13455 ) ) ( not ( = ?auto_13454 ?auto_13456 ) ) ( not ( = ?auto_13455 ?auto_13456 ) ) ( not ( = ?auto_13455 ?auto_13460 ) ) ( not ( = ?auto_13456 ?auto_13460 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13460 ?auto_13454 ?auto_13453 )
      ( DELIVER-3PKG-VERIFY ?auto_13454 ?auto_13455 ?auto_13456 ?auto_13453 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13535 - OBJ
      ?auto_13536 - OBJ
      ?auto_13537 - OBJ
      ?auto_13534 - LOCATION
    )
    :vars
    (
      ?auto_13540 - LOCATION
      ?auto_13538 - CITY
      ?auto_13539 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13540 ?auto_13538 ) ( IN-CITY ?auto_13534 ?auto_13538 ) ( not ( = ?auto_13534 ?auto_13540 ) ) ( OBJ-AT ?auto_13535 ?auto_13534 ) ( not ( = ?auto_13535 ?auto_13536 ) ) ( OBJ-AT ?auto_13536 ?auto_13540 ) ( TRUCK-AT ?auto_13539 ?auto_13534 ) ( OBJ-AT ?auto_13537 ?auto_13534 ) ( not ( = ?auto_13535 ?auto_13537 ) ) ( not ( = ?auto_13536 ?auto_13537 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13535 ?auto_13536 ?auto_13534 )
      ( DELIVER-3PKG-VERIFY ?auto_13535 ?auto_13536 ?auto_13537 ?auto_13534 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13557 - OBJ
      ?auto_13558 - OBJ
      ?auto_13559 - OBJ
      ?auto_13556 - LOCATION
    )
    :vars
    (
      ?auto_13562 - LOCATION
      ?auto_13560 - CITY
      ?auto_13563 - OBJ
      ?auto_13561 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13562 ?auto_13560 ) ( IN-CITY ?auto_13556 ?auto_13560 ) ( not ( = ?auto_13556 ?auto_13562 ) ) ( OBJ-AT ?auto_13563 ?auto_13556 ) ( not ( = ?auto_13563 ?auto_13559 ) ) ( OBJ-AT ?auto_13559 ?auto_13562 ) ( TRUCK-AT ?auto_13561 ?auto_13556 ) ( OBJ-AT ?auto_13557 ?auto_13556 ) ( OBJ-AT ?auto_13558 ?auto_13556 ) ( not ( = ?auto_13557 ?auto_13558 ) ) ( not ( = ?auto_13557 ?auto_13559 ) ) ( not ( = ?auto_13557 ?auto_13563 ) ) ( not ( = ?auto_13558 ?auto_13559 ) ) ( not ( = ?auto_13558 ?auto_13563 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13563 ?auto_13559 ?auto_13556 )
      ( DELIVER-3PKG-VERIFY ?auto_13557 ?auto_13558 ?auto_13559 ?auto_13556 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13569 - OBJ
      ?auto_13570 - OBJ
      ?auto_13571 - OBJ
      ?auto_13568 - LOCATION
    )
    :vars
    (
      ?auto_13574 - LOCATION
      ?auto_13572 - CITY
      ?auto_13575 - OBJ
      ?auto_13573 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13574 ?auto_13572 ) ( IN-CITY ?auto_13568 ?auto_13572 ) ( not ( = ?auto_13568 ?auto_13574 ) ) ( OBJ-AT ?auto_13575 ?auto_13568 ) ( not ( = ?auto_13575 ?auto_13570 ) ) ( OBJ-AT ?auto_13570 ?auto_13574 ) ( TRUCK-AT ?auto_13573 ?auto_13568 ) ( OBJ-AT ?auto_13569 ?auto_13568 ) ( OBJ-AT ?auto_13571 ?auto_13568 ) ( not ( = ?auto_13569 ?auto_13570 ) ) ( not ( = ?auto_13569 ?auto_13571 ) ) ( not ( = ?auto_13569 ?auto_13575 ) ) ( not ( = ?auto_13570 ?auto_13571 ) ) ( not ( = ?auto_13571 ?auto_13575 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13575 ?auto_13570 ?auto_13568 )
      ( DELIVER-3PKG-VERIFY ?auto_13569 ?auto_13570 ?auto_13571 ?auto_13568 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13607 - OBJ
      ?auto_13608 - OBJ
      ?auto_13609 - OBJ
      ?auto_13606 - LOCATION
    )
    :vars
    (
      ?auto_13612 - LOCATION
      ?auto_13610 - CITY
      ?auto_13613 - OBJ
      ?auto_13611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13612 ?auto_13610 ) ( IN-CITY ?auto_13606 ?auto_13610 ) ( not ( = ?auto_13606 ?auto_13612 ) ) ( OBJ-AT ?auto_13613 ?auto_13606 ) ( not ( = ?auto_13613 ?auto_13607 ) ) ( OBJ-AT ?auto_13607 ?auto_13612 ) ( TRUCK-AT ?auto_13611 ?auto_13606 ) ( OBJ-AT ?auto_13608 ?auto_13606 ) ( OBJ-AT ?auto_13609 ?auto_13606 ) ( not ( = ?auto_13607 ?auto_13608 ) ) ( not ( = ?auto_13607 ?auto_13609 ) ) ( not ( = ?auto_13608 ?auto_13609 ) ) ( not ( = ?auto_13608 ?auto_13613 ) ) ( not ( = ?auto_13609 ?auto_13613 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13613 ?auto_13607 ?auto_13606 )
      ( DELIVER-3PKG-VERIFY ?auto_13607 ?auto_13608 ?auto_13609 ?auto_13606 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13748 - OBJ
      ?auto_13749 - OBJ
      ?auto_13750 - OBJ
      ?auto_13747 - LOCATION
    )
    :vars
    (
      ?auto_13753 - LOCATION
      ?auto_13752 - CITY
      ?auto_13751 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13753 ?auto_13752 ) ( IN-CITY ?auto_13747 ?auto_13752 ) ( not ( = ?auto_13747 ?auto_13753 ) ) ( OBJ-AT ?auto_13749 ?auto_13747 ) ( not ( = ?auto_13749 ?auto_13748 ) ) ( OBJ-AT ?auto_13748 ?auto_13753 ) ( TRUCK-AT ?auto_13751 ?auto_13747 ) ( OBJ-AT ?auto_13750 ?auto_13747 ) ( not ( = ?auto_13748 ?auto_13750 ) ) ( not ( = ?auto_13749 ?auto_13750 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13749 ?auto_13748 ?auto_13747 )
      ( DELIVER-3PKG-VERIFY ?auto_13748 ?auto_13749 ?auto_13750 ?auto_13747 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13815 - OBJ
      ?auto_13814 - LOCATION
    )
    :vars
    (
      ?auto_13819 - LOCATION
      ?auto_13817 - CITY
      ?auto_13818 - OBJ
      ?auto_13816 - TRUCK
      ?auto_13820 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13819 ?auto_13817 ) ( IN-CITY ?auto_13814 ?auto_13817 ) ( not ( = ?auto_13814 ?auto_13819 ) ) ( OBJ-AT ?auto_13818 ?auto_13814 ) ( not ( = ?auto_13818 ?auto_13815 ) ) ( OBJ-AT ?auto_13815 ?auto_13819 ) ( TRUCK-AT ?auto_13816 ?auto_13820 ) ( IN-CITY ?auto_13820 ?auto_13817 ) ( not ( = ?auto_13814 ?auto_13820 ) ) ( not ( = ?auto_13819 ?auto_13820 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13816 ?auto_13820 ?auto_13814 ?auto_13817 )
      ( DELIVER-2PKG ?auto_13818 ?auto_13815 ?auto_13814 )
      ( DELIVER-1PKG-VERIFY ?auto_13815 ?auto_13814 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13822 - OBJ
      ?auto_13823 - OBJ
      ?auto_13821 - LOCATION
    )
    :vars
    (
      ?auto_13824 - LOCATION
      ?auto_13826 - CITY
      ?auto_13825 - TRUCK
      ?auto_13827 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13824 ?auto_13826 ) ( IN-CITY ?auto_13821 ?auto_13826 ) ( not ( = ?auto_13821 ?auto_13824 ) ) ( OBJ-AT ?auto_13822 ?auto_13821 ) ( not ( = ?auto_13822 ?auto_13823 ) ) ( OBJ-AT ?auto_13823 ?auto_13824 ) ( TRUCK-AT ?auto_13825 ?auto_13827 ) ( IN-CITY ?auto_13827 ?auto_13826 ) ( not ( = ?auto_13821 ?auto_13827 ) ) ( not ( = ?auto_13824 ?auto_13827 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13823 ?auto_13821 )
      ( DELIVER-2PKG-VERIFY ?auto_13822 ?auto_13823 ?auto_13821 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13837 - OBJ
      ?auto_13838 - OBJ
      ?auto_13836 - LOCATION
    )
    :vars
    (
      ?auto_13839 - LOCATION
      ?auto_13841 - CITY
      ?auto_13842 - TRUCK
      ?auto_13840 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13839 ?auto_13841 ) ( IN-CITY ?auto_13836 ?auto_13841 ) ( not ( = ?auto_13836 ?auto_13839 ) ) ( OBJ-AT ?auto_13838 ?auto_13836 ) ( not ( = ?auto_13838 ?auto_13837 ) ) ( OBJ-AT ?auto_13837 ?auto_13839 ) ( TRUCK-AT ?auto_13842 ?auto_13840 ) ( IN-CITY ?auto_13840 ?auto_13841 ) ( not ( = ?auto_13836 ?auto_13840 ) ) ( not ( = ?auto_13839 ?auto_13840 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13838 ?auto_13837 ?auto_13836 )
      ( DELIVER-2PKG-VERIFY ?auto_13837 ?auto_13838 ?auto_13836 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13860 - OBJ
      ?auto_13861 - OBJ
      ?auto_13862 - OBJ
      ?auto_13859 - LOCATION
    )
    :vars
    (
      ?auto_13863 - LOCATION
      ?auto_13865 - CITY
      ?auto_13866 - TRUCK
      ?auto_13864 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13863 ?auto_13865 ) ( IN-CITY ?auto_13859 ?auto_13865 ) ( not ( = ?auto_13859 ?auto_13863 ) ) ( OBJ-AT ?auto_13861 ?auto_13859 ) ( not ( = ?auto_13861 ?auto_13862 ) ) ( OBJ-AT ?auto_13862 ?auto_13863 ) ( TRUCK-AT ?auto_13866 ?auto_13864 ) ( IN-CITY ?auto_13864 ?auto_13865 ) ( not ( = ?auto_13859 ?auto_13864 ) ) ( not ( = ?auto_13863 ?auto_13864 ) ) ( OBJ-AT ?auto_13860 ?auto_13859 ) ( not ( = ?auto_13860 ?auto_13861 ) ) ( not ( = ?auto_13860 ?auto_13862 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13861 ?auto_13862 ?auto_13859 )
      ( DELIVER-3PKG-VERIFY ?auto_13860 ?auto_13861 ?auto_13862 ?auto_13859 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13876 - OBJ
      ?auto_13877 - OBJ
      ?auto_13878 - OBJ
      ?auto_13875 - LOCATION
    )
    :vars
    (
      ?auto_13879 - LOCATION
      ?auto_13881 - CITY
      ?auto_13882 - TRUCK
      ?auto_13880 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13879 ?auto_13881 ) ( IN-CITY ?auto_13875 ?auto_13881 ) ( not ( = ?auto_13875 ?auto_13879 ) ) ( OBJ-AT ?auto_13878 ?auto_13875 ) ( not ( = ?auto_13878 ?auto_13877 ) ) ( OBJ-AT ?auto_13877 ?auto_13879 ) ( TRUCK-AT ?auto_13882 ?auto_13880 ) ( IN-CITY ?auto_13880 ?auto_13881 ) ( not ( = ?auto_13875 ?auto_13880 ) ) ( not ( = ?auto_13879 ?auto_13880 ) ) ( OBJ-AT ?auto_13876 ?auto_13875 ) ( not ( = ?auto_13876 ?auto_13877 ) ) ( not ( = ?auto_13876 ?auto_13878 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13878 ?auto_13877 ?auto_13875 )
      ( DELIVER-3PKG-VERIFY ?auto_13876 ?auto_13877 ?auto_13878 ?auto_13875 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13943 - OBJ
      ?auto_13944 - OBJ
      ?auto_13945 - OBJ
      ?auto_13942 - LOCATION
    )
    :vars
    (
      ?auto_13946 - LOCATION
      ?auto_13948 - CITY
      ?auto_13949 - TRUCK
      ?auto_13947 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13946 ?auto_13948 ) ( IN-CITY ?auto_13942 ?auto_13948 ) ( not ( = ?auto_13942 ?auto_13946 ) ) ( OBJ-AT ?auto_13945 ?auto_13942 ) ( not ( = ?auto_13945 ?auto_13943 ) ) ( OBJ-AT ?auto_13943 ?auto_13946 ) ( TRUCK-AT ?auto_13949 ?auto_13947 ) ( IN-CITY ?auto_13947 ?auto_13948 ) ( not ( = ?auto_13942 ?auto_13947 ) ) ( not ( = ?auto_13946 ?auto_13947 ) ) ( OBJ-AT ?auto_13944 ?auto_13942 ) ( not ( = ?auto_13943 ?auto_13944 ) ) ( not ( = ?auto_13944 ?auto_13945 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13945 ?auto_13943 ?auto_13942 )
      ( DELIVER-3PKG-VERIFY ?auto_13943 ?auto_13944 ?auto_13945 ?auto_13942 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14051 - OBJ
      ?auto_14052 - OBJ
      ?auto_14053 - OBJ
      ?auto_14050 - LOCATION
    )
    :vars
    (
      ?auto_14055 - LOCATION
      ?auto_14057 - CITY
      ?auto_14056 - TRUCK
      ?auto_14054 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14055 ?auto_14057 ) ( IN-CITY ?auto_14050 ?auto_14057 ) ( not ( = ?auto_14050 ?auto_14055 ) ) ( OBJ-AT ?auto_14051 ?auto_14050 ) ( not ( = ?auto_14051 ?auto_14053 ) ) ( OBJ-AT ?auto_14053 ?auto_14055 ) ( TRUCK-AT ?auto_14056 ?auto_14054 ) ( IN-CITY ?auto_14054 ?auto_14057 ) ( not ( = ?auto_14050 ?auto_14054 ) ) ( not ( = ?auto_14055 ?auto_14054 ) ) ( OBJ-AT ?auto_14052 ?auto_14050 ) ( not ( = ?auto_14051 ?auto_14052 ) ) ( not ( = ?auto_14052 ?auto_14053 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14051 ?auto_14053 ?auto_14050 )
      ( DELIVER-3PKG-VERIFY ?auto_14051 ?auto_14052 ?auto_14053 ?auto_14050 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14134 - OBJ
      ?auto_14135 - OBJ
      ?auto_14136 - OBJ
      ?auto_14133 - LOCATION
    )
    :vars
    (
      ?auto_14138 - LOCATION
      ?auto_14140 - CITY
      ?auto_14139 - TRUCK
      ?auto_14137 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14138 ?auto_14140 ) ( IN-CITY ?auto_14133 ?auto_14140 ) ( not ( = ?auto_14133 ?auto_14138 ) ) ( OBJ-AT ?auto_14135 ?auto_14133 ) ( not ( = ?auto_14135 ?auto_14134 ) ) ( OBJ-AT ?auto_14134 ?auto_14138 ) ( TRUCK-AT ?auto_14139 ?auto_14137 ) ( IN-CITY ?auto_14137 ?auto_14140 ) ( not ( = ?auto_14133 ?auto_14137 ) ) ( not ( = ?auto_14138 ?auto_14137 ) ) ( OBJ-AT ?auto_14136 ?auto_14133 ) ( not ( = ?auto_14134 ?auto_14136 ) ) ( not ( = ?auto_14135 ?auto_14136 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14135 ?auto_14134 ?auto_14133 )
      ( DELIVER-3PKG-VERIFY ?auto_14134 ?auto_14135 ?auto_14136 ?auto_14133 ) )
  )

)

