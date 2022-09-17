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
      ?auto_416 - OBJ
      ?auto_417 - LOCATION
    )
    :vars
    (
      ?auto_418 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_418 ?auto_417 ) ( IN-TRUCK ?auto_416 ?auto_418 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_416 ?auto_418 ?auto_417 )
      ( DELIVER-1PKG-VERIFY ?auto_416 ?auto_417 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_423 - OBJ
      ?auto_424 - LOCATION
    )
    :vars
    (
      ?auto_425 - TRUCK
      ?auto_429 - LOCATION
      ?auto_430 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_423 ?auto_425 ) ( TRUCK-AT ?auto_425 ?auto_429 ) ( IN-CITY ?auto_429 ?auto_430 ) ( IN-CITY ?auto_424 ?auto_430 ) ( not ( = ?auto_424 ?auto_429 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_425 ?auto_429 ?auto_424 ?auto_430 )
      ( DELIVER-1PKG ?auto_423 ?auto_424 )
      ( DELIVER-1PKG-VERIFY ?auto_423 ?auto_424 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_434 - OBJ
      ?auto_435 - LOCATION
    )
    :vars
    (
      ?auto_439 - TRUCK
      ?auto_440 - LOCATION
      ?auto_436 - CITY
      ?auto_442 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_439 ?auto_440 ) ( IN-CITY ?auto_440 ?auto_436 ) ( IN-CITY ?auto_435 ?auto_436 ) ( not ( = ?auto_435 ?auto_440 ) ) ( TRUCK-AT ?auto_439 ?auto_442 ) ( OBJ-AT ?auto_434 ?auto_442 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_434 ?auto_439 ?auto_442 )
      ( DELIVER-1PKG ?auto_434 ?auto_435 )
      ( DELIVER-1PKG-VERIFY ?auto_434 ?auto_435 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_446 - OBJ
      ?auto_447 - LOCATION
    )
    :vars
    (
      ?auto_451 - LOCATION
      ?auto_448 - CITY
      ?auto_450 - TRUCK
      ?auto_455 - LOCATION
      ?auto_456 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_451 ?auto_448 ) ( IN-CITY ?auto_447 ?auto_448 ) ( not ( = ?auto_447 ?auto_451 ) ) ( OBJ-AT ?auto_446 ?auto_451 ) ( TRUCK-AT ?auto_450 ?auto_455 ) ( IN-CITY ?auto_455 ?auto_456 ) ( IN-CITY ?auto_451 ?auto_456 ) ( not ( = ?auto_451 ?auto_455 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_450 ?auto_455 ?auto_451 ?auto_456 )
      ( DELIVER-1PKG ?auto_446 ?auto_447 )
      ( DELIVER-1PKG-VERIFY ?auto_446 ?auto_447 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_505 - OBJ
      ?auto_507 - OBJ
      ?auto_506 - LOCATION
    )
    :vars
    (
      ?auto_510 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_507 ?auto_505 ) ( TRUCK-AT ?auto_510 ?auto_506 ) ( IN-TRUCK ?auto_507 ?auto_510 ) ( OBJ-AT ?auto_505 ?auto_506 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_507 ?auto_506 )
      ( DELIVER-2PKG-VERIFY ?auto_505 ?auto_507 ?auto_506 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_514 - OBJ
      ?auto_516 - OBJ
      ?auto_515 - LOCATION
    )
    :vars
    (
      ?auto_519 - TRUCK
      ?auto_518 - LOCATION
      ?auto_521 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_516 ?auto_514 ) ( IN-TRUCK ?auto_516 ?auto_519 ) ( TRUCK-AT ?auto_519 ?auto_518 ) ( IN-CITY ?auto_518 ?auto_521 ) ( IN-CITY ?auto_515 ?auto_521 ) ( not ( = ?auto_515 ?auto_518 ) ) ( OBJ-AT ?auto_514 ?auto_515 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_516 ?auto_515 )
      ( DELIVER-2PKG-VERIFY ?auto_514 ?auto_516 ?auto_515 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_525 - OBJ
      ?auto_527 - OBJ
      ?auto_526 - LOCATION
    )
    :vars
    (
      ?auto_529 - TRUCK
      ?auto_533 - LOCATION
      ?auto_530 - CITY
      ?auto_531 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_527 ?auto_525 ) ( TRUCK-AT ?auto_529 ?auto_533 ) ( IN-CITY ?auto_533 ?auto_530 ) ( IN-CITY ?auto_526 ?auto_530 ) ( not ( = ?auto_526 ?auto_533 ) ) ( TRUCK-AT ?auto_529 ?auto_531 ) ( OBJ-AT ?auto_527 ?auto_531 ) ( OBJ-AT ?auto_525 ?auto_526 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_527 ?auto_526 )
      ( DELIVER-2PKG-VERIFY ?auto_525 ?auto_527 ?auto_526 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_537 - OBJ
      ?auto_539 - OBJ
      ?auto_538 - LOCATION
    )
    :vars
    (
      ?auto_543 - LOCATION
      ?auto_542 - CITY
      ?auto_545 - TRUCK
      ?auto_541 - LOCATION
      ?auto_546 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_539 ?auto_537 ) ( IN-CITY ?auto_543 ?auto_542 ) ( IN-CITY ?auto_538 ?auto_542 ) ( not ( = ?auto_538 ?auto_543 ) ) ( OBJ-AT ?auto_539 ?auto_543 ) ( TRUCK-AT ?auto_545 ?auto_541 ) ( IN-CITY ?auto_541 ?auto_546 ) ( IN-CITY ?auto_543 ?auto_546 ) ( not ( = ?auto_543 ?auto_541 ) ) ( OBJ-AT ?auto_537 ?auto_538 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_539 ?auto_538 )
      ( DELIVER-2PKG-VERIFY ?auto_537 ?auto_539 ?auto_538 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_558 - OBJ
      ?auto_552 - OBJ
      ?auto_551 - LOCATION
    )
    :vars
    (
      ?auto_560 - LOCATION
      ?auto_554 - CITY
      ?auto_556 - TRUCK
      ?auto_553 - LOCATION
      ?auto_559 - CITY
      ?auto_561 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_552 ?auto_558 ) ( IN-CITY ?auto_560 ?auto_554 ) ( IN-CITY ?auto_551 ?auto_554 ) ( not ( = ?auto_551 ?auto_560 ) ) ( OBJ-AT ?auto_552 ?auto_560 ) ( TRUCK-AT ?auto_556 ?auto_553 ) ( IN-CITY ?auto_553 ?auto_559 ) ( IN-CITY ?auto_560 ?auto_559 ) ( not ( = ?auto_560 ?auto_553 ) ) ( TRUCK-AT ?auto_561 ?auto_551 ) ( IN-TRUCK ?auto_558 ?auto_561 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_558 ?auto_551 )
      ( DELIVER-2PKG ?auto_558 ?auto_552 ?auto_551 )
      ( DELIVER-2PKG-VERIFY ?auto_558 ?auto_552 ?auto_551 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_567 - OBJ
      ?auto_569 - OBJ
      ?auto_568 - LOCATION
    )
    :vars
    (
      ?auto_571 - LOCATION
      ?auto_574 - CITY
      ?auto_575 - CITY
      ?auto_573 - TRUCK
      ?auto_580 - LOCATION
      ?auto_581 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_569 ?auto_567 ) ( IN-CITY ?auto_571 ?auto_574 ) ( IN-CITY ?auto_568 ?auto_574 ) ( not ( = ?auto_568 ?auto_571 ) ) ( OBJ-AT ?auto_569 ?auto_571 ) ( IN-CITY ?auto_568 ?auto_575 ) ( IN-CITY ?auto_571 ?auto_575 ) ( IN-TRUCK ?auto_567 ?auto_573 ) ( TRUCK-AT ?auto_573 ?auto_580 ) ( IN-CITY ?auto_580 ?auto_581 ) ( IN-CITY ?auto_568 ?auto_581 ) ( not ( = ?auto_568 ?auto_580 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_573 ?auto_580 ?auto_568 ?auto_581 )
      ( DELIVER-2PKG ?auto_567 ?auto_569 ?auto_568 )
      ( DELIVER-2PKG-VERIFY ?auto_567 ?auto_569 ?auto_568 ) )
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
      ?auto_593 - LOCATION
      ?auto_590 - CITY
      ?auto_594 - CITY
      ?auto_591 - TRUCK
      ?auto_596 - LOCATION
      ?auto_595 - CITY
      ?auto_599 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_588 ?auto_586 ) ( IN-CITY ?auto_593 ?auto_590 ) ( IN-CITY ?auto_587 ?auto_590 ) ( not ( = ?auto_587 ?auto_593 ) ) ( OBJ-AT ?auto_588 ?auto_593 ) ( IN-CITY ?auto_587 ?auto_594 ) ( IN-CITY ?auto_593 ?auto_594 ) ( TRUCK-AT ?auto_591 ?auto_596 ) ( IN-CITY ?auto_596 ?auto_595 ) ( IN-CITY ?auto_587 ?auto_595 ) ( not ( = ?auto_587 ?auto_596 ) ) ( TRUCK-AT ?auto_591 ?auto_599 ) ( OBJ-AT ?auto_586 ?auto_599 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_586 ?auto_591 ?auto_599 )
      ( DELIVER-2PKG ?auto_586 ?auto_588 ?auto_587 )
      ( DELIVER-2PKG-VERIFY ?auto_586 ?auto_588 ?auto_587 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_604 - OBJ
      ?auto_606 - OBJ
      ?auto_605 - LOCATION
    )
    :vars
    (
      ?auto_611 - LOCATION
      ?auto_609 - CITY
      ?auto_615 - CITY
      ?auto_616 - LOCATION
      ?auto_614 - CITY
      ?auto_607 - TRUCK
      ?auto_618 - LOCATION
      ?auto_619 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_606 ?auto_604 ) ( IN-CITY ?auto_611 ?auto_609 ) ( IN-CITY ?auto_605 ?auto_609 ) ( not ( = ?auto_605 ?auto_611 ) ) ( OBJ-AT ?auto_606 ?auto_611 ) ( IN-CITY ?auto_605 ?auto_615 ) ( IN-CITY ?auto_611 ?auto_615 ) ( IN-CITY ?auto_616 ?auto_614 ) ( IN-CITY ?auto_605 ?auto_614 ) ( not ( = ?auto_605 ?auto_616 ) ) ( OBJ-AT ?auto_604 ?auto_616 ) ( TRUCK-AT ?auto_607 ?auto_618 ) ( IN-CITY ?auto_618 ?auto_619 ) ( IN-CITY ?auto_616 ?auto_619 ) ( not ( = ?auto_616 ?auto_618 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_607 ?auto_618 ?auto_616 ?auto_619 )
      ( DELIVER-2PKG ?auto_604 ?auto_606 ?auto_605 )
      ( DELIVER-2PKG-VERIFY ?auto_604 ?auto_606 ?auto_605 ) )
  )

)

