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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_490 - OBJ
      ?auto_491 - LOCATION
    )
    :vars
    (
      ?auto_492 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_492 ?auto_491 ) ( IN-TRUCK ?auto_490 ?auto_492 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_490 ?auto_492 ?auto_491 )
      ( DELIVER-1PKG-VERIFY ?auto_490 ?auto_491 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_495 - OBJ
      ?auto_496 - LOCATION
    )
    :vars
    (
      ?auto_497 - TRUCK
      ?auto_498 - LOCATION
      ?auto_499 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_495 ?auto_497 ) ( TRUCK-AT ?auto_497 ?auto_498 ) ( IN-CITY ?auto_498 ?auto_499 ) ( IN-CITY ?auto_496 ?auto_499 ) ( not ( = ?auto_496 ?auto_498 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_497 ?auto_498 ?auto_496 ?auto_499 )
      ( DELIVER-1PKG ?auto_495 ?auto_496 )
      ( DELIVER-1PKG-VERIFY ?auto_495 ?auto_496 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_502 - OBJ
      ?auto_503 - LOCATION
    )
    :vars
    (
      ?auto_506 - TRUCK
      ?auto_504 - LOCATION
      ?auto_505 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_506 ?auto_504 ) ( IN-CITY ?auto_504 ?auto_505 ) ( IN-CITY ?auto_503 ?auto_505 ) ( not ( = ?auto_503 ?auto_504 ) ) ( OBJ-AT ?auto_502 ?auto_504 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_502 ?auto_506 ?auto_504 )
      ( DELIVER-1PKG ?auto_502 ?auto_503 )
      ( DELIVER-1PKG-VERIFY ?auto_502 ?auto_503 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_509 - OBJ
      ?auto_510 - LOCATION
    )
    :vars
    (
      ?auto_513 - LOCATION
      ?auto_512 - CITY
      ?auto_511 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_513 ?auto_512 ) ( IN-CITY ?auto_510 ?auto_512 ) ( not ( = ?auto_510 ?auto_513 ) ) ( OBJ-AT ?auto_509 ?auto_513 ) ( TRUCK-AT ?auto_511 ?auto_510 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_511 ?auto_510 ?auto_513 ?auto_512 )
      ( DELIVER-1PKG ?auto_509 ?auto_510 )
      ( DELIVER-1PKG-VERIFY ?auto_509 ?auto_510 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_516 - OBJ
      ?auto_517 - LOCATION
    )
    :vars
    (
      ?auto_518 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_518 ?auto_517 ) ( IN-TRUCK ?auto_516 ?auto_518 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_516 ?auto_518 ?auto_517 )
      ( DELIVER-1PKG-VERIFY ?auto_516 ?auto_517 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_521 - OBJ
      ?auto_522 - LOCATION
    )
    :vars
    (
      ?auto_523 - TRUCK
      ?auto_524 - LOCATION
      ?auto_525 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_521 ?auto_523 ) ( TRUCK-AT ?auto_523 ?auto_524 ) ( IN-CITY ?auto_524 ?auto_525 ) ( IN-CITY ?auto_522 ?auto_525 ) ( not ( = ?auto_522 ?auto_524 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_523 ?auto_524 ?auto_522 ?auto_525 )
      ( DELIVER-1PKG ?auto_521 ?auto_522 )
      ( DELIVER-1PKG-VERIFY ?auto_521 ?auto_522 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_528 - OBJ
      ?auto_529 - LOCATION
    )
    :vars
    (
      ?auto_530 - TRUCK
      ?auto_532 - LOCATION
      ?auto_531 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_530 ?auto_532 ) ( IN-CITY ?auto_532 ?auto_531 ) ( IN-CITY ?auto_529 ?auto_531 ) ( not ( = ?auto_529 ?auto_532 ) ) ( OBJ-AT ?auto_528 ?auto_532 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_528 ?auto_530 ?auto_532 )
      ( DELIVER-1PKG ?auto_528 ?auto_529 )
      ( DELIVER-1PKG-VERIFY ?auto_528 ?auto_529 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_535 - OBJ
      ?auto_536 - LOCATION
    )
    :vars
    (
      ?auto_539 - LOCATION
      ?auto_537 - CITY
      ?auto_538 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_539 ?auto_537 ) ( IN-CITY ?auto_536 ?auto_537 ) ( not ( = ?auto_536 ?auto_539 ) ) ( OBJ-AT ?auto_535 ?auto_539 ) ( TRUCK-AT ?auto_538 ?auto_536 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_538 ?auto_536 ?auto_539 ?auto_537 )
      ( DELIVER-1PKG ?auto_535 ?auto_536 )
      ( DELIVER-1PKG-VERIFY ?auto_535 ?auto_536 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_543 - OBJ
      ?auto_545 - OBJ
      ?auto_544 - LOCATION
    )
    :vars
    (
      ?auto_546 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_545 ?auto_543 ) ( TRUCK-AT ?auto_546 ?auto_544 ) ( IN-TRUCK ?auto_545 ?auto_546 ) ( OBJ-AT ?auto_543 ?auto_544 ) ( not ( = ?auto_543 ?auto_545 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_545 ?auto_544 )
      ( DELIVER-2PKG-VERIFY ?auto_543 ?auto_545 ?auto_544 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_550 - OBJ
      ?auto_552 - OBJ
      ?auto_551 - LOCATION
    )
    :vars
    (
      ?auto_553 - TRUCK
      ?auto_555 - LOCATION
      ?auto_554 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_552 ?auto_550 ) ( IN-TRUCK ?auto_552 ?auto_553 ) ( TRUCK-AT ?auto_553 ?auto_555 ) ( IN-CITY ?auto_555 ?auto_554 ) ( IN-CITY ?auto_551 ?auto_554 ) ( not ( = ?auto_551 ?auto_555 ) ) ( OBJ-AT ?auto_550 ?auto_551 ) ( not ( = ?auto_550 ?auto_552 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_552 ?auto_551 )
      ( DELIVER-2PKG-VERIFY ?auto_550 ?auto_552 ?auto_551 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_559 - OBJ
      ?auto_561 - OBJ
      ?auto_560 - LOCATION
    )
    :vars
    (
      ?auto_563 - TRUCK
      ?auto_564 - LOCATION
      ?auto_562 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_561 ?auto_559 ) ( TRUCK-AT ?auto_563 ?auto_564 ) ( IN-CITY ?auto_564 ?auto_562 ) ( IN-CITY ?auto_560 ?auto_562 ) ( not ( = ?auto_560 ?auto_564 ) ) ( OBJ-AT ?auto_561 ?auto_564 ) ( OBJ-AT ?auto_559 ?auto_560 ) ( not ( = ?auto_559 ?auto_561 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_561 ?auto_560 )
      ( DELIVER-2PKG-VERIFY ?auto_559 ?auto_561 ?auto_560 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_568 - OBJ
      ?auto_570 - OBJ
      ?auto_569 - LOCATION
    )
    :vars
    (
      ?auto_571 - LOCATION
      ?auto_573 - CITY
      ?auto_572 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_570 ?auto_568 ) ( IN-CITY ?auto_571 ?auto_573 ) ( IN-CITY ?auto_569 ?auto_573 ) ( not ( = ?auto_569 ?auto_571 ) ) ( OBJ-AT ?auto_570 ?auto_571 ) ( TRUCK-AT ?auto_572 ?auto_569 ) ( OBJ-AT ?auto_568 ?auto_569 ) ( not ( = ?auto_568 ?auto_570 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_570 ?auto_569 )
      ( DELIVER-2PKG-VERIFY ?auto_568 ?auto_570 ?auto_569 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_577 - OBJ
      ?auto_579 - OBJ
      ?auto_578 - LOCATION
    )
    :vars
    (
      ?auto_581 - LOCATION
      ?auto_580 - CITY
      ?auto_582 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_579 ?auto_577 ) ( IN-CITY ?auto_581 ?auto_580 ) ( IN-CITY ?auto_578 ?auto_580 ) ( not ( = ?auto_578 ?auto_581 ) ) ( OBJ-AT ?auto_579 ?auto_581 ) ( TRUCK-AT ?auto_582 ?auto_578 ) ( not ( = ?auto_577 ?auto_579 ) ) ( IN-TRUCK ?auto_577 ?auto_582 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_577 ?auto_578 )
      ( DELIVER-2PKG ?auto_577 ?auto_579 ?auto_578 )
      ( DELIVER-2PKG-VERIFY ?auto_577 ?auto_579 ?auto_578 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_586 - OBJ
      ?auto_588 - OBJ
      ?auto_587 - LOCATION
    )
    :vars
    (
      ?auto_591 - LOCATION
      ?auto_589 - CITY
      ?auto_590 - TRUCK
      ?auto_592 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_588 ?auto_586 ) ( IN-CITY ?auto_591 ?auto_589 ) ( IN-CITY ?auto_587 ?auto_589 ) ( not ( = ?auto_587 ?auto_591 ) ) ( OBJ-AT ?auto_588 ?auto_591 ) ( not ( = ?auto_586 ?auto_588 ) ) ( IN-TRUCK ?auto_586 ?auto_590 ) ( TRUCK-AT ?auto_590 ?auto_592 ) ( IN-CITY ?auto_592 ?auto_589 ) ( not ( = ?auto_587 ?auto_592 ) ) ( not ( = ?auto_591 ?auto_592 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_590 ?auto_592 ?auto_587 ?auto_589 )
      ( DELIVER-2PKG ?auto_586 ?auto_588 ?auto_587 )
      ( DELIVER-2PKG-VERIFY ?auto_586 ?auto_588 ?auto_587 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_596 - OBJ
      ?auto_598 - OBJ
      ?auto_597 - LOCATION
    )
    :vars
    (
      ?auto_602 - LOCATION
      ?auto_600 - CITY
      ?auto_599 - TRUCK
      ?auto_601 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_598 ?auto_596 ) ( IN-CITY ?auto_602 ?auto_600 ) ( IN-CITY ?auto_597 ?auto_600 ) ( not ( = ?auto_597 ?auto_602 ) ) ( OBJ-AT ?auto_598 ?auto_602 ) ( not ( = ?auto_596 ?auto_598 ) ) ( TRUCK-AT ?auto_599 ?auto_601 ) ( IN-CITY ?auto_601 ?auto_600 ) ( not ( = ?auto_597 ?auto_601 ) ) ( not ( = ?auto_602 ?auto_601 ) ) ( OBJ-AT ?auto_596 ?auto_601 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_596 ?auto_599 ?auto_601 )
      ( DELIVER-2PKG ?auto_596 ?auto_598 ?auto_597 )
      ( DELIVER-2PKG-VERIFY ?auto_596 ?auto_598 ?auto_597 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_606 - OBJ
      ?auto_608 - OBJ
      ?auto_607 - LOCATION
    )
    :vars
    (
      ?auto_609 - LOCATION
      ?auto_612 - CITY
      ?auto_611 - LOCATION
      ?auto_610 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_608 ?auto_606 ) ( IN-CITY ?auto_609 ?auto_612 ) ( IN-CITY ?auto_607 ?auto_612 ) ( not ( = ?auto_607 ?auto_609 ) ) ( OBJ-AT ?auto_608 ?auto_609 ) ( not ( = ?auto_606 ?auto_608 ) ) ( IN-CITY ?auto_611 ?auto_612 ) ( not ( = ?auto_607 ?auto_611 ) ) ( not ( = ?auto_609 ?auto_611 ) ) ( OBJ-AT ?auto_606 ?auto_611 ) ( TRUCK-AT ?auto_610 ?auto_607 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_610 ?auto_607 ?auto_611 ?auto_612 )
      ( DELIVER-2PKG ?auto_606 ?auto_608 ?auto_607 )
      ( DELIVER-2PKG-VERIFY ?auto_606 ?auto_608 ?auto_607 ) )
  )

)

